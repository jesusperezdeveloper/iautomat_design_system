import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'app_tour_config.dart';

class DSTour extends StatefulWidget {
  final DSTourConfig config;
  final List<DSTourStep> steps;
  final VoidCallback? onFinish;
  final VoidCallback? onSkip;
  final ValueChanged<int>? onStepChanged;

  const DSTour({
    super.key,
    required this.config,
    required this.steps,
    this.onFinish,
    this.onSkip,
    this.onStepChanged,
  });

  @override
  State<DSTour> createState() => _DSTourState();
}

class _DSTourState extends State<DSTour>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _highlightController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _highlightAnimation;

  int _currentStepIndex = 0;
  bool _isVisible = false;
  bool _isAnimating = false;
  Offset? _targetPosition;
  Size? _targetSize;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTour();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _highlightController.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: widget.config.animation?.fadeInDuration ??
          const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: widget.config.animation?.scaleTransitionDuration ??
          const Duration(milliseconds: 250),
      vsync: this,
    );

    _highlightController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: widget.config.animation?.fadeInCurve ?? Curves.easeInOut,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: widget.config.animation?.scaleTransitionCurve ?? Curves.easeInOut,
    );

    _highlightAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _highlightController,
      curve: Curves.easeInOut,
    ));

    if (widget.config.animation?.enableHighlightAnimation ?? true) {
      _highlightController.repeat(reverse: true);
    }
  }

  void _setupFocus() {
    if (widget.config.enableKeyboardNavigation) {
      _focusNode = widget.config.accessibility?.focusNode ?? FocusNode();
    }
  }

  void _startTour() {
    if (widget.steps.isEmpty) return;

    setState(() {
      _isVisible = true;
      _currentStepIndex = 0;
    });

    _showCurrentStep();
  }

  void _showCurrentStep() {
    if (_currentStepIndex >= widget.steps.length) {
      _finishTour();
      return;
    }

    final currentStep = widget.steps[_currentStepIndex];
    _calculateTargetPosition(currentStep);

    _fadeController.forward();
    _scaleController.forward();

    currentStep.onShow?.call();
    widget.onStepChanged?.call(_currentStepIndex);

    if (widget.config.accessibility?.announceStepChanges ?? true) {
      SemanticsService.announce(
        '${widget.config.accessibility?.stepLabel ?? 'Tour step'} ${_currentStepIndex + 1} ${(widget.config.accessibility?.progressLabel)?.replaceFirst('{}', '${_currentStepIndex + 1}').replaceFirst('{}', '${widget.steps.length}') ?? 'of ${widget.steps.length}'}',
        Directionality.of(context),
      );
    }
  }

  void _calculateTargetPosition(DSTourStep step) {
    final RenderBox? renderBox = step.targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;

      setState(() {
        _targetPosition = position;
        _targetSize = size;
      });
    }
  }

  void _nextStep() {
    if (_isAnimating) return;

    final currentStep = widget.steps[_currentStepIndex];
    currentStep.onHide?.call();

    if (_currentStepIndex < widget.steps.length - 1) {
      setState(() {
        _isAnimating = true;
        _currentStepIndex++;
      });

      _fadeController.reverse().then((_) {
        _scaleController.reverse().then((_) {
          _showCurrentStep();
          setState(() {
            _isAnimating = false;
          });
        });
      });
    } else {
      _finishTour();
    }
  }

  void _previousStep() {
    if (_isAnimating || _currentStepIndex <= 0) return;

    final currentStep = widget.steps[_currentStepIndex];
    currentStep.onHide?.call();

    setState(() {
      _isAnimating = true;
      _currentStepIndex--;
    });

    _fadeController.reverse().then((_) {
      _scaleController.reverse().then((_) {
        _showCurrentStep();
        setState(() {
          _isAnimating = false;
        });
      });
    });
  }

  void _skipTour() {
    widget.onSkip?.call();
    _hideTour();
  }

  void _finishTour() {
    widget.onFinish?.call();
    _hideTour();
  }

  void _hideTour() {
    _fadeController.reverse();
    _scaleController.reverse();
    _highlightController.stop();

    Future.delayed(widget.config.animationDuration, () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowRight:
        case LogicalKeyboardKey.space:
        case LogicalKeyboardKey.enter:
          _nextStep();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowLeft:
          _previousStep();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.escape:
          _skipTour();
          return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible || widget.steps.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final currentStep = widget.steps[_currentStepIndex];

    Widget tour = _buildTourOverlay(context, theme, currentStep);

    if (widget.config.enableKeyboardNavigation && _focusNode != null) {
      tour = Focus(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: _handleKeyEvent,
        child: tour,
      );
    }

    if (widget.config.enableA11y) {
      tour = Semantics(
        label: widget.config.accessibility?.semanticLabel ?? 'Tour',
        explicitChildNodes: true,
        child: tour,
      );
    }

    return tour;
  }

  Widget _buildTourOverlay(BuildContext context, ThemeData theme, DSTourStep currentStep) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                // Overlay background
                _buildOverlayBackground(theme),

                // Target highlight
                if (currentStep.showHighlight && _targetPosition != null && _targetSize != null)
                  _buildTargetHighlight(theme, currentStep),

                // Tour content
                _buildTourContent(context, theme, currentStep),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOverlayBackground(ThemeData theme) {
    return GestureDetector(
      onTap: widget.config.enableDismissOnTap ? _skipTour : null,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: _getOverlayColor(theme),
      ),
    );
  }

  Widget _buildTargetHighlight(ThemeData theme, DSTourStep currentStep) {
    final targetRect = Rect.fromLTWH(
      _targetPosition!.dx - (currentStep.targetPadding?.left ?? widget.config.spacing?.targetPadding ?? 8.0),
      _targetPosition!.dy - (currentStep.targetPadding?.top ?? widget.config.spacing?.targetPadding ?? 8.0),
      _targetSize!.width + (currentStep.targetPadding?.horizontal ?? (widget.config.spacing?.targetPadding ?? 8.0) * 2),
      _targetSize!.height + (currentStep.targetPadding?.vertical ?? (widget.config.spacing?.targetPadding ?? 8.0) * 2),
    );

    return AnimatedBuilder(
      animation: _highlightAnimation,
      builder: (context, child) {
        return Positioned.fromRect(
          rect: targetRect,
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: _getTargetHighlightColor(theme).withValues(
                      alpha: 0.1 + (_highlightAnimation.value * 0.1)
                    ),
                    border: Border.all(
                      color: _getTargetBorderColor(theme).withValues(
                        alpha: 0.5 + (_highlightAnimation.value * 0.5)
                      ),
                      width: widget.config.spacing?.borderWidth ?? 2.0,
                    ),
                    borderRadius: BorderRadius.circular(currentStep.targetRadius),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTourContent(BuildContext context, ThemeData theme, DSTourStep currentStep) {
    final contentPosition = _calculateContentPosition(currentStep);

    return Positioned(
      left: contentPosition.dx,
      top: contentPosition.dy,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            alignment: _getContentAlignment(currentStep),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: widget.config.spacing?.minWidth ?? 120.0,
                maxWidth: widget.config.spacing?.maxWidth ?? 300.0,
              ),
              child: Material(
                color: _getBackgroundColor(theme),
                elevation: widget.config.spacing?.elevation ?? 8.0,
                shadowColor: _getShadowColor(theme),
                borderRadius: BorderRadius.circular(
                  widget.config.spacing?.borderRadius ?? 8.0,
                ),
                child: Padding(
                  padding: widget.config.spacing?.contentPadding ??
                      const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress indicator
                      if (widget.config.showProgress)
                        _buildProgressIndicator(theme),

                      // Content
                      if (currentStep.customContent != null)
                        currentStep.customContent!
                      else
                        _buildDefaultContent(theme, currentStep),

                      // Controls
                      _buildControls(theme),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator(ThemeData theme) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: (_currentStepIndex + 1) / widget.steps.length,
                backgroundColor: _getProgressBackgroundColor(theme),
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(theme),
                ),
                borderRadius: BorderRadius.circular(
                  (widget.config.spacing?.progressHeight ?? 4.0) / 2,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${_currentStepIndex + 1}/${widget.steps.length}',
              style: _getProgressTextStyle(theme),
            ),
          ],
        ),
        SizedBox(height: widget.config.spacing?.spacing ?? 16.0),
      ],
    );
  }

  Widget _buildDefaultContent(ThemeData theme, DSTourStep currentStep) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          currentStep.title,
          style: _getTitleStyle(theme),
        ),

        // Description
        if (currentStep.description != null) ...[
          SizedBox(height: widget.config.spacing?.spacing ?? 16.0),
          Text(
            currentStep.description!,
            style: _getDescriptionStyle(theme),
          ),
        ],
      ],
    );
  }

  Widget _buildControls(ThemeData theme) {
    return Column(
      children: [
        SizedBox(height: widget.config.spacing?.spacing ?? 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip/Previous buttons
            _buildLeftControls(theme),

            // Next/Finish button
            _buildRightControls(theme),
          ],
        ),
      ],
    );
  }

  Widget _buildLeftControls(ThemeData theme) {
    return Row(
      children: [
        // Skip button
        if (widget.config.enableSkip && (widget.config.controls?.showSkipButton ?? true))
          _buildSkipButton(theme),

        // Previous button
        if (_currentStepIndex > 0 && widget.config.enablePrevious && (widget.config.controls?.showPreviousButton ?? true)) ...[
          SizedBox(width: widget.config.spacing?.buttonSpacing ?? 8.0),
          _buildPreviousButton(theme),
        ],
      ],
    );
  }

  Widget _buildRightControls(ThemeData theme) {
    final isLastStep = _currentStepIndex == widget.steps.length - 1;

    if (isLastStep) {
      return _buildFinishButton(theme);
    } else {
      return _buildNextButton(theme);
    }
  }

  Widget _buildSkipButton(ThemeData theme) {
    if (widget.config.controls?.customSkipButton != null) {
      return GestureDetector(
        onTap: _skipTour,
        child: widget.config.controls!.customSkipButton!,
      );
    }

    return TextButton(
      onPressed: _skipTour,
      style: TextButton.styleFrom(
        padding: widget.config.spacing?.buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.config.spacing?.borderRadius ?? 8.0,
          ),
        ),
      ),
      child: Text(
        widget.config.controls?.skipButtonText ?? 'Saltar',
        style: _getSkipButtonStyle(theme),
      ),
    );
  }

  Widget _buildPreviousButton(ThemeData theme) {
    if (widget.config.controls?.customPreviousButton != null) {
      return GestureDetector(
        onTap: _previousStep,
        child: widget.config.controls!.customPreviousButton!,
      );
    }

    return TextButton(
      onPressed: _previousStep,
      style: TextButton.styleFrom(
        padding: widget.config.spacing?.buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.config.spacing?.borderRadius ?? 8.0,
          ),
        ),
      ),
      child: Text(
        widget.config.controls?.previousButtonText ?? 'Anterior',
        style: _getButtonStyle(theme),
      ),
    );
  }

  Widget _buildNextButton(ThemeData theme) {
    if (widget.config.controls?.customNextButton != null) {
      return GestureDetector(
        onTap: _nextStep,
        child: widget.config.controls!.customNextButton!,
      );
    }

    return ElevatedButton(
      onPressed: _nextStep,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(theme),
        foregroundColor: _getButtonTextColor(theme),
        padding: widget.config.spacing?.buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.config.spacing?.borderRadius ?? 8.0,
          ),
        ),
      ),
      child: Text(
        widget.config.controls?.nextButtonText ?? 'Siguiente',
        style: _getButtonStyle(theme),
      ),
    );
  }

  Widget _buildFinishButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: _finishTour,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(theme),
        foregroundColor: _getButtonTextColor(theme),
        padding: widget.config.spacing?.buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.config.spacing?.borderRadius ?? 8.0,
          ),
        ),
      ),
      child: Text(
        widget.config.controls?.finishButtonText ?? 'Finalizar',
        style: _getButtonStyle(theme),
      ),
    );
  }

  Offset _calculateContentPosition(DSTourStep currentStep) {
    if (_targetPosition == null || _targetSize == null) {
      return const Offset(50, 100);
    }

    final screenSize = MediaQuery.of(context).size;
    final contentWidth = widget.config.spacing?.maxWidth ?? 300.0;
    final contentHeight = 150.0; // Estimated height

    double x, y;

    switch (currentStep.position) {
      case DSTourPosition.top:
        x = _targetPosition!.dx + (_targetSize!.width / 2) - (contentWidth / 2);
        y = _targetPosition!.dy - contentHeight - 16.0;
        break;
      case DSTourPosition.bottom:
        x = _targetPosition!.dx + (_targetSize!.width / 2) - (contentWidth / 2);
        y = _targetPosition!.dy + _targetSize!.height + 16.0;
        break;
      case DSTourPosition.left:
        x = _targetPosition!.dx - contentWidth - 16.0;
        y = _targetPosition!.dy + (_targetSize!.height / 2) - (contentHeight / 2);
        break;
      case DSTourPosition.right:
        x = _targetPosition!.dx + _targetSize!.width + 16.0;
        y = _targetPosition!.dy + (_targetSize!.height / 2) - (contentHeight / 2);
        break;
      case DSTourPosition.center:
        x = (screenSize.width / 2) - (contentWidth / 2);
        y = (screenSize.height / 2) - (contentHeight / 2);
        break;
      case DSTourPosition.auto:
        // Auto positioning logic
        final targetCenterX = _targetPosition!.dx + (_targetSize!.width / 2);
        final targetCenterY = _targetPosition!.dy + (_targetSize!.height / 2);

        if (targetCenterY < screenSize.height / 2) {
          // Place below
          x = targetCenterX - (contentWidth / 2);
          y = _targetPosition!.dy + _targetSize!.height + 16.0;
        } else {
          // Place above
          x = targetCenterX - (contentWidth / 2);
          y = _targetPosition!.dy - contentHeight - 16.0;
        }
        break;
    }

    // Ensure content stays within screen bounds
    x = x.clamp(16.0, screenSize.width - contentWidth - 16.0);
    y = y.clamp(16.0, screenSize.height - contentHeight - 16.0);

    return Offset(x, y);
  }

  Alignment _getContentAlignment(DSTourStep currentStep) {
    switch (currentStep.position) {
      case DSTourPosition.top:
        return Alignment.bottomCenter;
      case DSTourPosition.bottom:
        return Alignment.topCenter;
      case DSTourPosition.left:
        return Alignment.centerRight;
      case DSTourPosition.right:
        return Alignment.centerLeft;
      case DSTourPosition.center:
      case DSTourPosition.auto:
        return Alignment.center;
    }
  }

  // Color and style getters
  Color _getOverlayColor(ThemeData theme) {
    return widget.config.colors?.overlayColor ??
           Colors.black.withValues(alpha: 0.7);
  }

  Color _getBackgroundColor(ThemeData theme) {
    return widget.config.colors?.backgroundColor ??
           theme.colorScheme.surface;
  }

  Color _getTargetHighlightColor(ThemeData theme) {
    return widget.config.colors?.targetHighlightColor ??
           theme.colorScheme.primary;
  }

  Color _getTargetBorderColor(ThemeData theme) {
    return widget.config.colors?.targetBorderColor ??
           theme.colorScheme.primary;
  }

  Color _getButtonColor(ThemeData theme) {
    return widget.config.colors?.buttonColor ??
           theme.colorScheme.primary;
  }

  Color _getButtonTextColor(ThemeData theme) {
    return widget.config.colors?.buttonTextColor ??
           theme.colorScheme.onPrimary;
  }

  Color _getProgressColor(ThemeData theme) {
    return widget.config.colors?.progressColor ??
           theme.colorScheme.primary;
  }

  Color _getProgressBackgroundColor(ThemeData theme) {
    return widget.config.colors?.progressBackgroundColor ??
           theme.colorScheme.surfaceContainerHighest;
  }

  Color _getShadowColor(ThemeData theme) {
    return widget.config.colors?.shadowColor ??
           Colors.black.withValues(alpha: 0.2);
  }

  TextStyle _getTitleStyle(ThemeData theme) {
    return widget.config.typography?.titleStyle ??
           theme.textTheme.titleMedium?.copyWith(
             fontWeight: FontWeight.w600,
             color: widget.config.colors?.titleColor ?? theme.colorScheme.onSurface,
           ) ??
           const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  }

  TextStyle _getDescriptionStyle(ThemeData theme) {
    return widget.config.typography?.descriptionStyle ??
           theme.textTheme.bodyMedium?.copyWith(
             color: widget.config.colors?.textColor ?? theme.colorScheme.onSurfaceVariant,
           ) ??
           const TextStyle(fontSize: 14);
  }

  TextStyle _getButtonStyle(ThemeData theme) {
    return widget.config.typography?.buttonStyle ??
           theme.textTheme.labelMedium?.copyWith(
             fontWeight: FontWeight.w500,
           ) ??
           const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }

  TextStyle _getSkipButtonStyle(ThemeData theme) {
    return widget.config.typography?.skipButtonStyle ??
           theme.textTheme.labelMedium?.copyWith(
             color: widget.config.colors?.skipButtonColor ?? theme.colorScheme.onSurfaceVariant,
           ) ??
           const TextStyle(fontSize: 14);
  }

  TextStyle _getProgressTextStyle(ThemeData theme) {
    return widget.config.typography?.progressStyle ??
           theme.textTheme.labelSmall?.copyWith(
             color: theme.colorScheme.onSurfaceVariant,
           ) ??
           const TextStyle(fontSize: 12);
  }
}