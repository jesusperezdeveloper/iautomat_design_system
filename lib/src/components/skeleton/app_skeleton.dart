import 'package:flutter/material.dart';

import 'app_skeleton_config.dart';
import 'app_skeleton_a11y_helper.dart';

class AppSkeleton extends StatefulWidget {
  final AppSkeletonShape shape;
  final double? width;
  final double? height;
  final AppSkeletonConfig? config;
  final bool interactive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<AppSkeletonState>? onStateChanged;
  final Widget? child;
  final Duration? animationDuration;

  const AppSkeleton({
    super.key,
    this.shape = AppSkeletonShape.rectangle,
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

  const AppSkeleton.rectangle({
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
  }) : shape = AppSkeletonShape.rectangle;

  const AppSkeleton.circle({
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
  }) : shape = AppSkeletonShape.circle;

  const AppSkeleton.avatar({
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
  }) : shape = AppSkeletonShape.avatar;

  const AppSkeleton.button({
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
  }) : shape = AppSkeletonShape.button;

  const AppSkeleton.card({
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
  }) : shape = AppSkeletonShape.card;

  const AppSkeleton.text({
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
  }) : shape = AppSkeletonShape.text;

  const AppSkeleton.line({
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
  }) : shape = AppSkeletonShape.line;

  const AppSkeleton.roundedRectangle({
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
  }) : shape = AppSkeletonShape.roundedRectangle;

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton>
    with TickerProviderStateMixin {
  late final AppSkeletonA11yHelper _a11yHelper;
  late AppSkeletonConfig _effectiveConfig;
  late AnimationController _shimmerController;
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late Animation<double> _shimmerAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  AppSkeletonState _currentState = AppSkeletonState.skeleton;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _a11yHelper = AppSkeletonA11yHelper();
    _initializeConfig();
    _initializeAnimations();
  }

  void _initializeConfig() {
    final baseConfig = AppSkeletonDefaults.configForShape(widget.shape);
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
      colors: _effectiveConfig.colors ?? AppSkeletonDefaults.colors,
      spacing: _effectiveConfig.spacing ?? AppSkeletonDefaults.spacing,
      typography: _effectiveConfig.typography ?? AppSkeletonDefaults.typography,
      animations: _effectiveConfig.animations ?? AppSkeletonDefaults.animations,
      accessibility:
          _effectiveConfig.accessibility ?? AppSkeletonDefaults.accessibility,
      behavior: _effectiveConfig.behavior ?? AppSkeletonDefaults.behavior,
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
  void didUpdateWidget(AppSkeleton oldWidget) {
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

  void _handleStateChange(AppSkeletonState newState) {
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

    _handleStateChange(AppSkeletonState.pressed);
    widget.onTap?.call();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _handleStateChange(
          _isHovered ? AppSkeletonState.hover : AppSkeletonState.defaultState,
        );
      }
    });
  }

  void _handleLongPress() {
    if (!widget.interactive) return;

    _handleStateChange(AppSkeletonState.pressed);
    widget.onLongPress?.call();
  }

  void _handleHoverEnter() {
    if (!widget.interactive) return;

    setState(() {
      _isHovered = true;
    });
    _handleStateChange(AppSkeletonState.hover);
  }

  void _handleHoverExit() {
    if (!widget.interactive) return;

    setState(() {
      _isHovered = false;
    });
    _handleStateChange(AppSkeletonState.defaultState);
  }

  void _handleFocusChange(bool hasFocus) {
    if (!widget.interactive) return;

    _handleStateChange(
      hasFocus ? AppSkeletonState.focus : AppSkeletonState.defaultState,
    );
  }

  Color _getBackgroundColor() {
    final colors = _effectiveConfig.colors!;
    final theme = Theme.of(context);

    Color baseColor =
        colors.backgroundColor ?? theme.colorScheme.surfaceContainerHighest;

    switch (_currentState) {
      case AppSkeletonState.hover:
        return Color.alphaBlend(
          theme.colorScheme.onSurface.withValues(alpha: 0.08),
          baseColor,
        );
      case AppSkeletonState.pressed:
        return Color.alphaBlend(
          theme.colorScheme.onSurface.withValues(alpha: 0.12),
          baseColor,
        );
      case AppSkeletonState.focus:
        return Color.alphaBlend(
          theme.colorScheme.primary.withValues(alpha: 0.08),
          baseColor,
        );
      case AppSkeletonState.selected:
        return Color.alphaBlend(
          theme.colorScheme.primary.withValues(alpha: 0.12),
          baseColor,
        );
      case AppSkeletonState.disabled:
        return baseColor.withValues(alpha: 0.38);
      default:
        return baseColor;
    }
  }

  double _getOpacity() {
    final colors = _effectiveConfig.colors!;

    switch (_currentState) {
      case AppSkeletonState.disabled:
        return 0.38;
      case AppSkeletonState.loading:
        return colors.opacity * 0.8;
      default:
        return colors.opacity;
    }
  }

  Widget _buildShimmerGradient(Widget child) {
    final colors = _effectiveConfig.colors!;
    final animations = _effectiveConfig.animations!;

    if (!animations.shimmerEnabled ||
        _currentState == AppSkeletonState.disabled) {
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

class AppSkeletonGroup extends StatelessWidget {
  final List<AppSkeleton> children;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;

  const AppSkeletonGroup({
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

class AppSkeletonText extends StatelessWidget {
  final int lines;
  final double? lastLineWidthFactor;
  final double lineHeight;
  final double spacing;
  final AppSkeletonConfig? config;

  const AppSkeletonText({
    super.key,
    this.lines = 3,
    this.lastLineWidthFactor,
    this.lineHeight = 16,
    this.spacing = 8,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    return AppSkeletonGroup(
      spacing: spacing,
      children: List.generate(lines, (index) {
        final isLast = index == lines - 1;
        final widthFactor = isLast && lastLineWidthFactor != null
            ? lastLineWidthFactor!
            : 1.0;

        return AppSkeleton.text(
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

class AppSkeletonList extends StatelessWidget {
  final int itemCount;
  final double itemHeight;
  final double spacing;
  final AppSkeletonConfig? config;

  const AppSkeletonList({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 60,
    this.spacing = 8,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    return AppSkeletonGroup(
      spacing: spacing,
      children: List.generate(itemCount, (index) {
        return AppSkeleton.card(
          height: itemHeight,
          width: double.infinity,
          config: config,
        );
      }),
    );
  }
}
