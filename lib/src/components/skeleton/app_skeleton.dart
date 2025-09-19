import 'package:flutter/material.dart';

import 'app_skeleton_config.dart';
import 'app_skeleton_a11y_helper.dart';

class DSSkeleton extends StatefulWidget {
  final DSSkeletonShape shape;
  final double? width;
  final double? height;
  final DSSkeletonConfig? config;
  final bool interactive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<DSSkeletonState>? onStateChanged;
  final Widget? child;
  final Duration? animationDuration;

  const DSSkeleton({
    super.key,
    this.shape = DSSkeletonShape.rectangle,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  });

  const DSSkeleton.rectangle({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.rectangle;

  const DSSkeleton.circle({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.circle;

  const DSSkeleton.avatar({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.avatar;

  const DSSkeleton.button({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.button;

  const DSSkeleton.card({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.card;

  const DSSkeleton.text({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.text;

  const DSSkeleton.line({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.line;

  const DSSkeleton.roundedRectangle({
    super.key,
    this.width,
    this.height,
    this.config,
    this.interactive = false,
    this.onTap,
    this.onLongPress,
    this.onStateChanged,
    this.child,
    this.animationDuration,
  }) : shape = DSSkeletonShape.roundedRectangle;

  @override
  State<DSSkeleton> createState() => _DSSkeletonState();
}

class _DSSkeletonState extends State<DSSkeleton>
    with TickerProviderStateMixin {
  late final DSSkeletonA11yHelper _a11yHelper;
  late DSSkeletonConfig _effectiveConfig;
  late AnimationController _shimmerController;
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late Animation<double> _shimmerAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  DSSkeletonState _currentState = DSSkeletonState.skeleton;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _a11yHelper = DSSkeletonA11yHelper();
    _initializeConfig();
    _initializeAnimations();
  }

  void _initializeConfig() {
    final baseConfig = DSSkeletonDefaults.configForShape(widget.shape);
    _effectiveConfig = baseConfig.copyWith(
      spacing: baseConfig.spacing?.copyWith(
        width: widget.width ?? baseConfig.spacing?.width,
        height: widget.height ?? baseConfig.spacing?.height,
      ),
    );

    if (widget.config != null) {
      _effectiveConfig = _effectiveConfig.copyWith(
        variant: widget.config!.variant,
        state: widget.config!.state,
        colors: widget.config!.colors ?? _effectiveConfig.colors,
        spacing: widget.config!.spacing ?? _effectiveConfig.spacing,
        typography: widget.config!.typography ?? _effectiveConfig.typography,
        animations: widget.config!.animations ?? _effectiveConfig.animations,
        accessibility:
            widget.config!.accessibility ?? _effectiveConfig.accessibility,
        behavior: widget.config!.behavior ?? _effectiveConfig.behavior,
      );
    }

    _effectiveConfig = _effectiveConfig.copyWith(
      colors: _effectiveConfig.colors ?? DSSkeletonDefaults.colors,
      spacing: _effectiveConfig.spacing ?? DSSkeletonDefaults.spacing,
      typography: _effectiveConfig.typography ?? DSSkeletonDefaults.typography,
      animations: _effectiveConfig.animations ?? DSSkeletonDefaults.animations,
      accessibility:
          _effectiveConfig.accessibility ?? DSSkeletonDefaults.accessibility,
      behavior: _effectiveConfig.behavior ?? DSSkeletonDefaults.behavior,
    );
  }

  void _initializeAnimations() {
    final animations = _effectiveConfig.animations!;

    _shimmerController = AnimationController(
      duration: animations.duration,
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: animations.fadeInDuration,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: animations.curve),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: animations.curve),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    if (animations.enabled) {
      if (animations.shimmerEnabled) {
        _shimmerController.repeat();
      }
      if (animations.pulseEnabled) {
        _pulseController.repeat(reverse: true);
      }
      if (_effectiveConfig.behavior?.animateOnLoad ?? true) {
        _fadeController.forward();
      }
    }
  }

  @override
  void didUpdateWidget(DSSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config != widget.config ||
        oldWidget.shape != widget.shape ||
        oldWidget.width != widget.width ||
        oldWidget.height != widget.height) {
      _initializeConfig();
    }
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _handleStateChange(DSSkeletonState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });
      widget.onStateChanged?.call(newState);
      _a11yHelper.announceStateChange(newState);
    }
  }

  void _handleTap() {
    if (!widget.interactive) return;

    _handleStateChange(DSSkeletonState.pressed);
    widget.onTap?.call();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _handleStateChange(
          _isHovered ? DSSkeletonState.hover : DSSkeletonState.defaultState,
        );
      }
    });
  }

  void _handleLongPress() {
    if (!widget.interactive) return;

    _handleStateChange(DSSkeletonState.pressed);
    widget.onLongPress?.call();
  }

  void _handleHoverEnter() {
    if (!widget.interactive) return;

    setState(() {
      _isHovered = true;
    });
    _handleStateChange(DSSkeletonState.hover);
  }

  void _handleHoverExit() {
    if (!widget.interactive) return;

    setState(() {
      _isHovered = false;
    });
    _handleStateChange(DSSkeletonState.defaultState);
  }

  void _handleFocusChange(bool hasFocus) {
    if (!widget.interactive) return;

    _handleStateChange(
      hasFocus ? DSSkeletonState.focus : DSSkeletonState.defaultState,
    );
  }

  Color _getBackgroundColor() {
    final colors = _effectiveConfig.colors!;
    final theme = Theme.of(context);

    Color baseColor =
        colors.backgroundColor ?? theme.colorScheme.surfaceContainerHighest;

    switch (_currentState) {
      case DSSkeletonState.hover:
        return Color.alphaBlend(
          theme.colorScheme.onSurface.withValues(alpha: 0.08),
          baseColor,
        );
      case DSSkeletonState.pressed:
        return Color.alphaBlend(
          theme.colorScheme.onSurface.withValues(alpha: 0.12),
          baseColor,
        );
      case DSSkeletonState.focus:
        return Color.alphaBlend(
          theme.colorScheme.primary.withValues(alpha: 0.08),
          baseColor,
        );
      case DSSkeletonState.selected:
        return Color.alphaBlend(
          theme.colorScheme.primary.withValues(alpha: 0.12),
          baseColor,
        );
      case DSSkeletonState.disabled:
        return baseColor.withValues(alpha: 0.38);
      default:
        return baseColor;
    }
  }

  double _getOpacity() {
    final colors = _effectiveConfig.colors!;

    switch (_currentState) {
      case DSSkeletonState.disabled:
        return 0.38;
      case DSSkeletonState.loading:
        return colors.opacity * 0.8;
      default:
        return colors.opacity;
    }
  }

  Widget _buildShimmerGradient(Widget child) {
    final colors = _effectiveConfig.colors!;
    final animations = _effectiveConfig.animations!;

    if (!animations.shimmerEnabled ||
        _currentState == DSSkeletonState.disabled) {
      return child;
    }

    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                colors.shimmerColor ??
                    Theme.of(context).colorScheme.onSurface.withValues(
                      alpha: colors.shimmerOpacity,
                    ),
                Colors.transparent,
              ],
              stops: [
                _shimmerAnimation.value - 0.3,
                _shimmerAnimation.value,
                _shimmerAnimation.value + 0.3,
              ].map((e) => e.clamp(0.0, 1.0)).toList(),
            ).createShader(rect);
          },
          child: child,
        );
      },
      child: child,
    );
  }

  Widget _buildPulseAnimation(Widget child) {
    final animations = _effectiveConfig.animations!;

    if (!animations.pulseEnabled) {
      return child;
    }

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(scale: _pulseAnimation.value, child: child);
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = _effectiveConfig.spacing!;
    final behavior = _effectiveConfig.behavior!;
    final accessibility = _effectiveConfig.accessibility!;

    Widget skeletonWidget = Container(
      width: spacing.width,
      height: spacing.height,
      margin: spacing.margin,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        border: behavior.showBorder
            ? Border.all(
                color:
                    _effectiveConfig.colors?.borderColor ??
                    Theme.of(context).colorScheme.outline,
                width: 1,
              )
            : null,
        boxShadow: behavior.showShadow
            ? [
                BoxShadow(
                  color:
                      _effectiveConfig.colors?.shadowColor ??
                      Theme.of(context).shadowColor,
                  blurRadius: spacing.elevation,
                  offset: Offset(0, spacing.elevation / 2),
                ),
              ]
            : null,
      ),
      child: widget.child,
    );

    // Apply animations
    skeletonWidget = _buildShimmerGradient(skeletonWidget);
    skeletonWidget = _buildPulseAnimation(skeletonWidget);

    // Apply fade animation
    if (_effectiveConfig.animations?.enabled ?? false) {
      skeletonWidget = FadeTransition(
        opacity: _fadeAnimation,
        child: skeletonWidget,
      );
    }

    // Apply opacity
    skeletonWidget = Opacity(opacity: _getOpacity(), child: skeletonWidget);

    // Apply padding
    if (spacing.padding != EdgeInsets.zero) {
      skeletonWidget = Padding(padding: spacing.padding, child: skeletonWidget);
    }

    // Make interactive if needed
    if (widget.interactive) {
      skeletonWidget = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          onLongPress: _handleLongPress,
          onHover: (hovered) {
            if (hovered) {
              _handleHoverEnter();
            } else {
              _handleHoverExit();
            }
          },
          onFocusChange: _handleFocusChange,
          borderRadius: BorderRadius.circular(spacing.borderRadius),
          child: skeletonWidget,
        ),
      );
    }

    // Apply accessibility
    if (accessibility.enabled) {
      skeletonWidget = _a11yHelper.wrapWithSemantics(
        skeletonWidget,
        _effectiveConfig,
        widget.shape,
        _handleTap,
        _handleLongPress,
      );
    }

    return skeletonWidget;
  }
}

class DSSkeletonGroup extends StatelessWidget {
  final List<DSSkeleton> children;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;

  const DSSkeletonGroup({
    super.key,
    required this.children,
    this.direction = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final spacingWidget = direction == Axis.vertical
        ? SizedBox(height: spacing)
        : SizedBox(width: spacing);

    final widgets = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      widgets.add(children[i]);
      if (i < children.length - 1) {
        widgets.add(spacingWidget);
      }
    }

    return direction == Axis.vertical
        ? Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: widgets,
          )
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: widgets,
          );
  }
}

class DSSkeletonText extends StatelessWidget {
  final int lines;
  final double? lastLineWidthFactor;
  final double lineHeight;
  final double spacing;
  final DSSkeletonConfig? config;

  const DSSkeletonText({
    super.key,
    this.lines = 3,
    this.lastLineWidthFactor,
    this.lineHeight = 16,
    this.spacing = 8,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    return DSSkeletonGroup(
      spacing: spacing,
      children: List.generate(lines, (index) {
        final isLast = index == lines - 1;
        final widthFactor = isLast && lastLineWidthFactor != null
            ? lastLineWidthFactor!
            : 1.0;

        return DSSkeleton.text(
          height: lineHeight,
          width: widthFactor < 1.0 ? null : double.infinity,
          config: config?.copyWith(
            spacing: config?.spacing?.copyWith(
              width: widthFactor < 1.0 ? 200 * widthFactor : double.infinity,
            ),
          ),
        );
      }),
    );
  }
}

class DSSkeletonList extends StatelessWidget {
  final int itemCount;
  final double itemHeight;
  final double spacing;
  final DSSkeletonConfig? config;

  const DSSkeletonList({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 60,
    this.spacing = 8,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    return DSSkeletonGroup(
      spacing: spacing,
      children: List.generate(itemCount, (index) {
        return DSSkeleton.card(
          height: itemHeight,
          width: double.infinity,
          config: config,
        );
      }),
    );
  }
}
