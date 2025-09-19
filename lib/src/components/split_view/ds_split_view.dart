import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ds_split_view_config.dart';

class DSSplitView extends StatefulWidget {
  final DSSplitViewConfig config;
  final Widget start;
  final Widget end;
  final DSSplitViewMinSizes? minSizes;
  final double? initialRatio;
  final ValueChanged<double>? onRatioChanged;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const DSSplitView({
    super.key,
    this.config = const DSSplitViewConfig(),
    required this.start,
    required this.end,
    this.minSizes,
    this.initialRatio,
    this.onRatioChanged,
    this.width,
    this.height,
    this.padding,
  });

  @override
  State<DSSplitView> createState() => _DSSplitViewState();
}

class _DSSplitViewState extends State<DSSplitView>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late Animation<double> _scaleAnimation;

  double _currentRatio = 0.5;
  bool _isDragging = false;
  bool _isHovering = false;
  bool _isFocused = false;
  double _dragStartRatio = 0.5;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentRatio = widget.initialRatio ?? widget.config.initialRatio;
    _setupAnimations();
    _setupFocus();
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration:
          Duration(milliseconds: widget.config.animation?.duration ?? 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));

    _stateAnimationController.forward();
  }

  void _setupFocus() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void didUpdateWidget(DSSplitView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }

    if (widget.initialRatio != oldWidget.initialRatio ||
        widget.config.initialRatio != oldWidget.config.initialRatio) {
      final newRatio = widget.initialRatio ?? widget.config.initialRatio;
      if (newRatio != _currentRatio) {
        _animateToRatio(newRatio);
      }
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case DSSplitViewState.loading:
      case DSSplitViewState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case DSSplitViewState.disabled:
        _stateAnimationController.animateTo(0.6);
        break;
      default:
        _stateAnimationController.forward();
        break;
    }
  }

  void _animateToRatio(double newRatio) {
    setState(() {
      _currentRatio = newRatio;
    });
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl =
        widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Focus(
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        child: Semantics(
          label: widget.config.enableA11y ? 'Split view panel' : null,
          container: widget.config.enableA11y,
          explicitChildNodes: widget.config.enableA11y,
          child: AnimatedBuilder(
            animation: _stateAnimationController,
            builder: (context, child) {
              return AnimatedOpacity(
                opacity: widget.config.state.opacity,
                duration: Duration(
                    milliseconds: widget.config.animation?.duration ?? 300),
                child: AnimatedScale(
                  scale: _scaleAnimation.value,
                  duration: Duration(
                      milliseconds: widget.config.animation?.duration ?? 300),
                  child: _buildSplitViewContent(theme, isRtl),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSplitViewContent(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    return _buildSplitViewVariant(theme, isRtl);
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Container(
      width: widget.width,
      height: widget.height ?? widget.config.spacing?.minHeight ?? 200.0,
      padding: widget.padding ??
          EdgeInsets.all(widget.config.spacing?.padding ?? 4.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        borderRadius:
            BorderRadius.circular(widget.config.spacing?.borderRadius ?? 2.0),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(height: 8),
            Text('Cargando vista dividida...'),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    final isHorizontal = widget.config.direction.isHorizontal;

    return Container(
      width: widget.width,
      height: widget.height ?? widget.config.spacing?.minHeight ?? 200.0,
      padding: widget.padding ??
          EdgeInsets.all(widget.config.spacing?.padding ?? 4.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        borderRadius:
            BorderRadius.circular(widget.config.spacing?.borderRadius ?? 2.0),
      ),
      child: isHorizontal
          ? Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Container(
                  width: widget.config.spacing?.dividerWidth ?? 1.0,
                  color: Colors.grey[400],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Container(
                  height: widget.config.spacing?.dividerWidth ?? 1.0,
                  color: Colors.grey[400],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSplitViewVariant(ThemeData theme, bool isRtl) {
    switch (widget.config.variant) {
      case DSSplitViewVariant.resizable:
        return _buildResizableSplitView(theme, isRtl);
      case DSSplitViewVariant.twoPane:
        return _buildTwoPaneSplitView(theme, isRtl);
    }
  }

  Widget _buildResizableSplitView(ThemeData theme, bool isRtl) {
    final isHorizontal = widget.config.direction.isHorizontal;
    final canResize = widget.config.state.canResize &&
        (widget.config.behavior?.enableResize ?? true);

    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ??
          EdgeInsets.all(widget.config.spacing?.padding ?? 4.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: widget.config.colors?.borderColor != null
            ? Border.all(color: widget.config.colors!.borderColor!)
            : null,
        borderRadius:
            BorderRadius.circular(widget.config.spacing?.borderRadius ?? 2.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableSize =
              isHorizontal ? constraints.maxWidth : constraints.maxHeight;

          if (isHorizontal) {
            return Row(
              children: [
                Expanded(
                  flex: (_currentRatio * 100).round(),
                  child: _buildPane(
                    widget.start,
                    null,
                    theme,
                    true,
                  ),
                ),
                _buildDivider(theme, canResize, availableSize, isHorizontal),
                Expanded(
                  flex: ((1.0 - _currentRatio) * 100).round(),
                  child: _buildPane(
                    widget.end,
                    null,
                    theme,
                    false,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Expanded(
                  flex: (_currentRatio * 100).round(),
                  child: _buildPane(
                    widget.start,
                    null,
                    theme,
                    true,
                  ),
                ),
                _buildDivider(theme, canResize, availableSize, isHorizontal),
                Expanded(
                  flex: ((1.0 - _currentRatio) * 100).round(),
                  child: _buildPane(
                    widget.end,
                    null,
                    theme,
                    false,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTwoPaneSplitView(ThemeData theme, bool isRtl) {
    final isHorizontal = widget.config.direction.isHorizontal;

    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ??
          EdgeInsets.all(widget.config.spacing?.padding ?? 4.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: widget.config.colors?.borderColor != null
            ? Border.all(color: widget.config.colors!.borderColor!)
            : null,
        borderRadius:
            BorderRadius.circular(widget.config.spacing?.borderRadius ?? 2.0),
      ),
      child: isHorizontal
          ? Row(
              children: [
                Expanded(
                  flex: (_currentRatio * 100).round(),
                  child: _buildPane(widget.start, null, theme, true),
                ),
                Container(
                  width: widget.config.spacing?.dividerWidth ?? 1.0,
                  color: _getDividerColor(theme),
                ),
                Expanded(
                  flex: ((1.0 - _currentRatio) * 100).round(),
                  child: _buildPane(widget.end, null, theme, false),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: (_currentRatio * 100).round(),
                  child: _buildPane(widget.start, null, theme, true),
                ),
                Container(
                  height: widget.config.spacing?.dividerWidth ?? 1.0,
                  color: _getDividerColor(theme),
                ),
                Expanded(
                  flex: ((1.0 - _currentRatio) * 100).round(),
                  child: _buildPane(widget.end, null, theme, false),
                ),
              ],
            ),
    );
  }

  Widget _buildPane(Widget child, double? size, ThemeData theme, bool isStart) {
    final paneColor = isStart
        ? widget.config.colors?.startPaneColor
        : widget.config.colors?.endPaneColor;

    Widget pane = Container(
      decoration: BoxDecoration(
        color: paneColor,
        borderRadius:
            BorderRadius.circular(widget.config.spacing?.borderRadius ?? 2.0),
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(widget.config.spacing?.borderRadius ?? 2.0),
        child: child,
      ),
    );

    if (size != null) {
      if (widget.config.direction.isHorizontal) {
        pane = SizedBox(width: size, child: pane);
      } else {
        pane = SizedBox(height: size, child: pane);
      }
    }

    return pane;
  }

  Widget _buildDivider(ThemeData theme, bool canResize, double availableSize,
      bool isHorizontal) {
    if (!canResize) {
      return Container(
        width: isHorizontal ? widget.config.spacing?.dividerWidth ?? 1.0 : null,
        height:
            isHorizontal ? null : widget.config.spacing?.dividerWidth ?? 1.0,
        color: _getDividerColor(theme),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: isHorizontal
          ? SystemMouseCursors.resizeColumn
          : SystemMouseCursors.resizeRow,
      child: GestureDetector(
        onPanStart: _handlePanStart,
        onPanUpdate: (details) =>
            _handlePanUpdate(details, availableSize, isHorizontal),
        onPanEnd: _handlePanEnd,
        onTap: () => _handleDividerTap(theme),
        child: Container(
          width:
              isHorizontal ? widget.config.spacing?.handleWidth ?? 8.0 : null,
          height:
              isHorizontal ? null : widget.config.spacing?.handleHeight ?? 24.0,
          decoration: BoxDecoration(
            color: _getDividerStateColor(theme),
            borderRadius: BorderRadius.circular(
                widget.config.spacing?.borderRadius ?? 2.0),
          ),
          child: _buildDividerHandle(theme, isHorizontal),
        ),
      ),
    );
  }

  Widget _buildDividerHandle(ThemeData theme, bool isHorizontal) {
    return Center(
      child: Container(
        width: isHorizontal ? 2 : 16,
        height: isHorizontal ? 16 : 2,
        decoration: BoxDecoration(
          color: _getHandleColor(theme),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }

  void _handlePanStart(DragStartDetails details) {
    if (!widget.config.state.canResize) return;

    setState(() {
      _isDragging = true;
      _dragStartRatio = _currentRatio;
    });

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }
  }

  void _handlePanUpdate(
      DragUpdateDetails details, double availableSize, bool isHorizontal) {
    if (!widget.config.state.canResize || !_isDragging) return;

    final delta = isHorizontal ? details.delta.dx : details.delta.dy;
    final ratio = delta / availableSize;

    final newRatio = (_dragStartRatio + ratio).clamp(0.1, 0.9);

    // Verificar límites mínimos
    final minSizes = widget.minSizes ?? widget.config.minSizes;
    if (minSizes != null) {
      final startSize = availableSize * newRatio;
      final endSize = availableSize * (1.0 - newRatio);

      if (startSize < minSizes.startMin || endSize < minSizes.endMin) {
        return;
      }
    }

    setState(() {
      _currentRatio = newRatio;
    });

    widget.onRatioChanged?.call(_currentRatio);
    widget.config.onRatioUpdated?.call(_currentRatio);
  }

  void _handlePanEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });

    // Snap to edges if enabled
    if (widget.config.behavior?.snapToEdges ?? true) {
      final snapThreshold = widget.config.behavior?.snapThreshold ?? 0.1;

      double targetRatio = _currentRatio;

      if (_currentRatio < snapThreshold) {
        targetRatio = 0.0;
      } else if (_currentRatio > 1.0 - snapThreshold) {
        targetRatio = 1.0;
      }

      if (targetRatio != _currentRatio) {
        _animateToRatio(targetRatio);
      }
    }

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }
  }

  void _handleDividerTap(ThemeData theme) {
    if (!widget.config.state.canResize) return;

    // Toggle between common ratios
    double newRatio;
    if (_currentRatio < 0.4) {
      newRatio = 0.5;
    } else if (_currentRatio > 0.6) {
      newRatio = 0.5;
    } else {
      newRatio = 0.3;
    }

    _animateToRatio(newRatio);

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.lightImpact();
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!widget.config.enableKeyboardSupport ||
        !widget.config.state.canResize) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      const step = 0.05;
      double newRatio = _currentRatio;

      if (widget.config.direction.isHorizontal) {
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          newRatio = (_currentRatio - step).clamp(0.1, 0.9);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          newRatio = (_currentRatio + step).clamp(0.1, 0.9);
        }
      } else {
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          newRatio = (_currentRatio - step).clamp(0.1, 0.9);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          newRatio = (_currentRatio + step).clamp(0.1, 0.9);
        }
      }

      if (newRatio != _currentRatio) {
        _animateToRatio(newRatio);
        widget.onRatioChanged?.call(newRatio);
        widget.config.onRatioUpdated?.call(newRatio);
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  // Color getters
  Color? _getBackgroundColor(ThemeData theme) {
    return widget.config.colors?.backgroundColor ?? theme.colorScheme.surface;
  }

  Color? _getDividerColor(ThemeData theme) {
    return widget.config.colors?.dividerColor ?? theme.colorScheme.outline;
  }

  Color? _getDividerStateColor(ThemeData theme) {
    if (!widget.config.state.isInteractive) {
      return widget.config.colors?.dividerDisabledColor ??
          theme.colorScheme.outline.withValues(alpha: 0.5);
    }

    if (_isDragging) {
      return widget.config.colors?.dividerPressedColor ??
          theme.colorScheme.primary;
    }

    if (_isHovering) {
      return widget.config.colors?.dividerHoverColor ??
          theme.colorScheme.primary.withValues(alpha: 0.8);
    }

    if (_isFocused) {
      return widget.config.colors?.dividerFocusColor ??
          theme.colorScheme.primary.withValues(alpha: 0.6);
    }

    return _getDividerColor(theme);
  }

  Color? _getHandleColor(ThemeData theme) {
    if (!widget.config.state.isInteractive) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.3);
    }

    if (_isDragging) {
      return widget.config.colors?.handlePressedColor ??
          theme.colorScheme.onPrimary;
    }

    if (_isHovering) {
      return widget.config.colors?.handleHoverColor ??
          theme.colorScheme.onPrimary.withValues(alpha: 0.8);
    }

    return widget.config.colors?.handleColor ??
        theme.colorScheme.onSurface.withValues(alpha: 0.6);
  }
}
