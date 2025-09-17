import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'stepper_config.dart';

class AppStepper extends StatefulWidget {
  final int currentStep;
  final List<AppStep> steps;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final ValueChanged<int>? onStepTapped;
  final AppStepperVariant variant;
  final AppStepperConfig? config;
  final AppStepperColors? colors;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final AppStepperState? overrideState;
  final TextDirection? textDirection;
  final bool dense;
  final double? width;
  final double? height;
  final Widget? loadingWidget;
  final ScrollController? scrollController;
  final AppStepperControlsBuilder? controlsBuilder;
  final EdgeInsets? margin;
  final String? Function(int, List<AppStep>)? validator;
  final bool showControls;
  final bool expandActiveStep;

  const AppStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    this.onStepContinue,
    this.onStepCancel,
    this.onStepTapped,
    this.variant = AppStepperVariant.vertical,
    this.config,
    this.colors,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.semanticLabel,
    this.overrideState,
    this.textDirection,
    this.dense = false,
    this.width,
    this.height,
    this.loadingWidget,
    this.scrollController,
    this.controlsBuilder,
    this.margin,
    this.validator,
    this.showControls = true,
    this.expandActiveStep = true,
  });

  @override
  State<AppStepper> createState() => _AppStepperState();
}

class _AppStepperState extends State<AppStepper> with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;
  late ScrollController _scrollController;

  AppStepperConfig? _config;
  AppStepperColors? _colors;
  AppStepperState _currentState = AppStepperState.defaultState;
  final bool _isPressed = false;
  final bool _isHovered = false;
  Map<int, GlobalKey> _stepKeys = <int, GlobalKey>{};

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _scrollController = widget.scrollController ?? ScrollController();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOutSine,
    ));

    _initializeStepKeys();
    _focusNode.addListener(_handleFocusChange);

    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateColors();
    _updateState();
  }

  @override
  void didUpdateWidget(AppStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_handleFocusChange);
    }

    if (widget.steps.length != oldWidget.steps.length) {
      _initializeStepKeys();
    }

    if (widget.currentStep != oldWidget.currentStep && _config?.autoScrollToActiveStep == true) {
      _scrollToStep(widget.currentStep);
    }

    _updateColors();
    _updateState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    _animationController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  void _initializeStepKeys() {
    _stepKeys = {};
    for (int i = 0; i < widget.steps.length; i++) {
      _stepKeys[i] = GlobalKey();
    }
  }

  void _updateColors() {
    final theme = Theme.of(context);
    _colors = widget.colors ?? AppStepperColors.fromTheme(theme);
    _config = widget.config ?? const AppStepperConfig();
  }

  void _updateState() {
    if (widget.overrideState != null) {
      _currentState = widget.overrideState!;
    } else if (!widget.enabled) {
      _currentState = AppStepperState.disabled;
    } else if (_isPressed) {
      _currentState = AppStepperState.pressed;
    } else if (_isHovered) {
      _currentState = AppStepperState.hover;
    } else if (_focusNode.hasFocus) {
      _currentState = AppStepperState.focus;
    } else {
      _currentState = AppStepperState.defaultState;
    }

    if (_currentState == AppStepperState.skeleton) {
      _shimmerController.repeat();
    } else {
      _shimmerController.stop();
    }
  }

  void _handleFocusChange() {
    setState(() {
      _updateState();
    });
  }

  void _handleStepTapped(int stepIndex) {
    if (!widget.enabled || !widget.steps[stepIndex].canInteract) return;

    if (widget.config?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    // Validate before changing step
    if (widget.validator != null) {
      final error = widget.validator!(stepIndex, widget.steps);
      if (error != null) return;
    }

    widget.onStepTapped?.call(stepIndex);
  }

  void _handleContinue() {
    if (!widget.enabled) return;

    if (widget.config?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    widget.onStepContinue?.call();
  }

  void _handleCancel() {
    if (!widget.enabled) return;

    if (widget.config?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    widget.onStepCancel?.call();
  }

  void _scrollToStep(int stepIndex) {
    if (!_stepKeys.containsKey(stepIndex)) return;

    final stepKey = _stepKeys[stepIndex]!;
    final context = stepKey.currentContext;
    if (context == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        context,
        duration: _config?.scrollAnimationDuration ?? const Duration(milliseconds: 300),
        curve: _config?.scrollAnimationCurve ?? Curves.easeOutCubic,
      );
    });
  }

  Widget _buildLoadingIndicator() {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: _colors!.loadingIndicatorColor,
      );
    } else {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_colors!.loadingIndicatorColor),
        ),
      );
    }
  }

  Widget _buildSkeleton() {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return Container(
          height: widget.variant == AppStepperVariant.vertical ? 200 : 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_config!.stepRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                _colors!.skeletonBaseColor,
                _colors!.skeletonHighlightColor,
                _colors!.skeletonBaseColor,
              ],
              stops: [
                (_shimmerAnimation.value - 1).clamp(0.0, 1.0),
                _shimmerAnimation.value.clamp(0.0, 1.0),
                (_shimmerAnimation.value + 1).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator() {
    if (!(_config?.showProgressIndicator ?? true)) {
      return const SizedBox.shrink();
    }

    final progress = widget.steps.progress;
    return Container(
      height: _config!.progressIndicatorHeight,
      margin: EdgeInsets.symmetric(vertical: _config!.verticalSpacing / 2),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: _colors!.inactiveConnectorColor,
        valueColor: AlwaysStoppedAnimation<Color>(_colors!.progressIndicatorColor),
      ),
    );
  }

  Widget _buildStepIcon(AppStep step, int index) {
    final isActive = index == widget.currentStep;
    final isCompleted = step.isCompleted;
    final hasError = step.hasError;
    final isDisabled = step.isDisabled;

    Color backgroundColor;
    Color borderColor;
    Color iconColor;
    Widget? iconWidget;

    if (hasError) {
      backgroundColor = _colors!.errorStepColor;
      borderColor = _colors!.errorStepBorderColor;
      iconColor = _colors!.errorStepTextColor;
      iconWidget = Icon(Icons.error, size: _config!.iconSize, color: iconColor);
    } else if (isCompleted) {
      backgroundColor = _colors!.completedStepColor;
      borderColor = _colors!.completedStepBorderColor;
      iconColor = _colors!.completedStepTextColor;
      iconWidget = Icon(Icons.check, size: _config!.iconSize, color: iconColor);
    } else if (isActive) {
      backgroundColor = _colors!.activeStepColor;
      borderColor = _colors!.activeStepBorderColor;
      iconColor = _colors!.activeStepTextColor;
    } else if (isDisabled) {
      backgroundColor = _colors!.disabledStepColor;
      borderColor = _colors!.disabledStepBorderColor;
      iconColor = _colors!.disabledStepTextColor;
    } else {
      backgroundColor = _colors!.inactiveStepColor;
      borderColor = _colors!.inactiveStepBorderColor;
      iconColor = _colors!.inactiveStepTextColor;
    }

    // Use custom icon if provided
    if (step.icon != null && !isCompleted && !hasError) {
      iconWidget = step.icon;
    } else if (iconWidget == null && (_config?.showStepNumbers ?? true)) {
      iconWidget = Text(
        '${index + 1}',
        style: TextStyle(
          color: iconColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      );
    }

    return Container(
      width: _config!.stepRadius * 2,
      height: _config!.stepRadius * 2,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: _config!.stepBorderWidth,
        ),
      ),
      child: iconWidget != null ? Center(child: iconWidget) : null,
    );
  }

  Widget _buildStepTitle(AppStep step, int index) {
    final isActive = index == widget.currentStep;
    final isCompleted = step.isCompleted;
    final hasError = step.hasError;
    final isDisabled = step.isDisabled;

    Color titleColor;
    Color? subtitleColor;

    if (hasError) {
      titleColor = _colors!.errorTitleColor;
      subtitleColor = _colors!.errorSubtitleColor;
    } else if (isActive) {
      titleColor = _colors!.activeTitleColor;
      subtitleColor = _colors!.activeSubtitleColor;
    } else if (isCompleted) {
      titleColor = _colors!.completedTitleColor;
      subtitleColor = _colors!.completedSubtitleColor;
    } else if (isDisabled) {
      titleColor = _colors!.disabledTitleColor;
      subtitleColor = _colors!.disabledSubtitleColor;
    } else {
      titleColor = _colors!.titleColor;
      subtitleColor = _colors!.subtitleColor;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                step.title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            if (step.isOptional && (_config?.showOptionalBadge ?? false)) ...[
              SizedBox(width: _config!.badgeSpacing),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: _colors!.optionalBadgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Opcional',
                  style: TextStyle(
                    color: _colors!.optionalBadgeTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
        if (step.subtitle != null) ...[
          SizedBox(height: _config!.subtitleSpacing),
          Text(
            step.subtitle!,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        if (step.hasError && step.errorText != null) ...[
          SizedBox(height: _config!.subtitleSpacing),
          Text(
            step.errorText!,
            style: TextStyle(
              color: _colors!.errorSubtitleColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStepConnector(int index) {
    if (!(_config?.showConnectors ?? true) || index >= widget.steps.length - 1) {
      return const SizedBox.shrink();
    }

    final isCompleted = widget.steps[index].isCompleted;
    final isDisabled = widget.steps[index].isDisabled;

    Color connectorColor;
    if (isCompleted) {
      connectorColor = _colors!.completedConnectorColor;
    } else if (isDisabled) {
      connectorColor = _colors!.disabledConnectorColor;
    } else {
      connectorColor = _colors!.connectorColor;
    }

    if (widget.variant == AppStepperVariant.horizontal) {
      return Container(
        width: _config!.horizontalSpacing,
        height: _config!.connectorThickness,
        color: connectorColor,
      );
    } else {
      return Container(
        width: _config!.connectorThickness,
        height: _config!.verticalSpacing,
        color: connectorColor,
        margin: EdgeInsets.symmetric(horizontal: _config!.stepRadius - _config!.connectorThickness / 2),
      );
    }
  }

  Widget _buildStepContent(AppStep step, int index) {
    final isActive = index == widget.currentStep;
    final shouldExpand = widget.expandActiveStep && isActive;

    if (!shouldExpand || step.content == null) {
      return const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: _config!.animationDuration,
      curve: _config!.animationCurve,
      constraints: BoxConstraints(
        maxHeight: shouldExpand ? _config!.expandedStepHeight : 0,
      ),
      padding: _config!.stepPadding,
      margin: EdgeInsets.only(top: _config!.titleSpacing),
      decoration: BoxDecoration(
        color: _colors!.activeContentBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: step.content!,
      ),
    );
  }

  Widget _buildControls() {
    if (!widget.showControls) return const SizedBox.shrink();

    final currentStep = widget.steps[widget.currentStep];
    final isFirstStep = widget.currentStep == 0;
    final isLastStep = widget.currentStep == widget.steps.length - 1;

    final continueEnabled = widget.enabled && !currentStep.hasError;
    final cancelEnabled = widget.enabled && !isFirstStep;

    String continueLabel = 'Continuar';
    String cancelLabel = 'Anterior';

    if (isLastStep) {
      continueLabel = 'Finalizar';
    }

    // Use custom control builder if provided
    if (widget.controlsBuilder != null) {
      final builder = widget.controlsBuilder!;

      final continueButton = builder.continueButton ??
        ElevatedButton(
          onPressed: (builder.enableContinue ?? continueEnabled) ? _handleContinue : null,
          child: Text(builder.continueLabel ?? continueLabel),
        );

      final cancelButton = builder.cancelButton ??
        TextButton(
          onPressed: (builder.enableCancel ?? cancelEnabled) ? _handleCancel : null,
          child: Text(builder.cancelLabel ?? cancelLabel),
        );

      return Padding(
        padding: EdgeInsets.only(top: _config!.verticalSpacing),
        child: Row(
          children: [
            if (builder.showCancel ?? !isFirstStep) ...[
              cancelButton,
              SizedBox(width: _config!.horizontalSpacing),
            ],
            if (builder.showContinue ?? true)
              continueButton,
          ],
        ),
      );
    }

    // Default controls
    return Padding(
      padding: EdgeInsets.only(top: _config!.verticalSpacing),
      child: Row(
        children: [
          if (!isFirstStep) ...[
            TextButton(
              onPressed: cancelEnabled ? _handleCancel : null,
              style: TextButton.styleFrom(
                foregroundColor: cancelEnabled
                  ? _colors!.controlButtonColor
                  : _colors!.controlButtonDisabledColor,
              ),
              child: Text(cancelLabel),
            ),
            SizedBox(width: _config!.horizontalSpacing),
          ],
          ElevatedButton(
            onPressed: continueEnabled ? _handleContinue : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: continueEnabled
                ? _colors!.controlButtonColor
                : _colors!.controlButtonDisabledColor,
              foregroundColor: continueEnabled
                ? _colors!.controlButtonTextColor
                : _colors!.controlButtonDisabledTextColor,
            ),
            child: Text(continueLabel),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalStepper() {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < widget.steps.length; i++) ...[
            InkWell(
              key: _stepKeys[i],
              onTap: widget.steps[i].canInteract && (_config?.allowStepTapping ?? true)
                ? () => _handleStepTapped(i)
                : null,
              borderRadius: BorderRadius.circular(_config!.stepRadius),
              child: Container(
                padding: _config!.stepPadding,
                constraints: BoxConstraints(
                  maxWidth: _config!.maxStepWidth,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildStepIcon(widget.steps[i], i),
                    if (_config?.showStepHeaders ?? true) ...[
                      SizedBox(height: _config!.titleSpacing),
                      _buildStepTitle(widget.steps[i], i),
                    ],
                    _buildStepContent(widget.steps[i], i),
                  ],
                ),
              ),
            ),
            _buildStepConnector(i),
          ],
        ],
      ),
    );
  }

  Widget _buildVerticalStepper() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          for (int i = 0; i < widget.steps.length; i++) ...[
            InkWell(
              key: _stepKeys[i],
              onTap: widget.steps[i].canInteract && (_config?.allowStepTapping ?? true)
                ? () => _handleStepTapped(i)
                : null,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: _config!.stepPadding,
                constraints: BoxConstraints(
                  minHeight: _config!.minimumStepHeight,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        _buildStepIcon(widget.steps[i], i),
                        _buildStepConnector(i),
                      ],
                    ),
                    SizedBox(width: _config!.horizontalSpacing),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_config?.showStepHeaders ?? true)
                            _buildStepTitle(widget.steps[i], i),
                          _buildStepContent(widget.steps[i], i),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final directionality = widget.textDirection ?? Directionality.of(context);

    return Directionality(
      textDirection: directionality,
      child: Semantics(
        label: widget.semanticLabel ?? 'Stepper with ${widget.steps.length} steps',
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          padding: _config!.contentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressIndicator(),
              Expanded(
                child: _currentState == AppStepperState.loading
                    ? Center(
                        child: widget.loadingWidget ?? _buildLoadingIndicator(),
                      )
                    : _currentState == AppStepperState.skeleton
                        ? _buildSkeleton()
                        : widget.variant == AppStepperVariant.horizontal
                            ? _buildHorizontalStepper()
                            : _buildVerticalStepper(),
              ),
              if (widget.variant == AppStepperVariant.vertical)
                _buildControls(),
            ],
          ),
        ),
      ),
    );
  }
}