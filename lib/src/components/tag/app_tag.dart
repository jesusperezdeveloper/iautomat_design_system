import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tag_config.dart';

class AppTag extends StatefulWidget {
  final AppTagConfig config;

  const AppTag({
    super.key,
    required this.config,
  });

  AppTag.semantic({
    super.key,
    required String label,
    AppTagSemanticColor semanticColor = AppTagSemanticColor.primary,
    AppTagSize size = AppTagSize.medium,
    AppTagShape shape = AppTagShape.rounded,
    Color? color,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    IconData? leadingIcon,
    IconData? trailingIcon,
    Widget? leadingWidget,
    Widget? trailingWidget,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    VoidCallback? onRemove,
    String? semanticLabel,
    String? tooltip,
    bool enabled = true,
    bool loading = false,
    bool skeleton = false,
    bool visible = true,
    bool selected = false,
    bool removable = false,
    bool outlined = false,
    double? borderWidth,
    double? elevation,
    AppTagStyle? style,
    AppTagInteraction? interaction,
    AppTagAccessibility? accessibility,
    AppTagAnimation? animation,
  }) : config = AppTagConfig(
          variant: AppTagVariant.semantic,
          label: label,
          semanticColor: semanticColor,
          size: size,
          shape: shape,
          color: color,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          borderColor: borderColor,
          leadingIcon: leadingIcon,
          trailingIcon: trailingIcon,
          leadingWidget: leadingWidget,
          trailingWidget: trailingWidget,
          onTap: onTap,
          onLongPress: onLongPress,
          onHover: onHover,
          onRemove: onRemove,
          semanticLabel: semanticLabel,
          tooltip: tooltip,
          enabled: enabled,
          loading: loading,
          skeleton: skeleton,
          visible: visible,
          selected: selected,
          removable: removable,
          outlined: outlined,
          borderWidth: borderWidth,
          elevation: elevation,
          style: style,
          interaction: interaction,
          accessibility: accessibility,
          animation: animation,
        );

  @override
  State<AppTag> createState() => _AppTagState();
}

class _AppTagState extends State<AppTag>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  AppTagState _currentState = AppTagState.defaultState;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _initializeAnimations() {
    final animation = widget.config.animation ?? const AppTagAnimation();

    _animationController = AnimationController(
      duration: animation.duration,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: animation.pulseDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    if (animation.pulse && animation.enabled) {
      _pulseController.repeat(reverse: true);
    }
  }

  void _updateState(AppTagState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });

      final animation = widget.config.animation;
      if (animation?.enabled == true) {
        switch (animation!.type) {
          case AppTagAnimationType.scale:
            if (newState.isInteractiveState) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            break;
          case AppTagAnimationType.fade:
            if (newState.isInteractiveState) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            break;
          default:
            break;
        }
      }
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.config.canInteract) {
      _updateState(AppTagState.pressed);
      setState(() => _isPressed = true);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.config.canInteract) {
      _updateState(_isFocused ? AppTagState.focus : AppTagState.defaultState);
      setState(() => _isPressed = false);
    }
  }

  void _handleTapCancel() {
    if (widget.config.canInteract) {
      _updateState(_isFocused ? AppTagState.focus : AppTagState.defaultState);
      setState(() => _isPressed = false);
    }
  }

  void _handleTap() {
    if (widget.config.canInteract) {
      HapticFeedback.lightImpact();
      widget.config.onTap?.call();
    }
  }

  void _handleLongPress() {
    if (widget.config.canInteract) {
      HapticFeedback.mediumImpact();
      widget.config.onLongPress?.call();
    }
  }

  void _handleHover(bool hovering) {
    if (widget.config.canInteract) {
      setState(() => _isHovered = hovering);
      if (hovering) {
        _updateState(AppTagState.hover);
        widget.config.onHover?.call();
      } else if (!_isPressed && !_isFocused) {
        _updateState(AppTagState.defaultState);
      }
    }
  }

  void _handleFocusChange(bool focused) {
    if (widget.config.canInteract) {
      setState(() => _isFocused = focused);
      if (focused) {
        _updateState(AppTagState.focus);
      } else if (!_isHovered && !_isPressed) {
        _updateState(AppTagState.defaultState);
      }
    }
  }

  void _handleRemove() {
    if (widget.config.removable && widget.config.canInteract) {
      HapticFeedback.lightImpact();
      widget.config.onRemove?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.config.visible) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final effectiveState = widget.config.isDisabled
        ? AppTagState.disabled
        : widget.config.isLoading
            ? AppTagState.loading
            : widget.config.isSkeleton
                ? AppTagState.skeleton
                : widget.config.isSelected
                    ? AppTagState.selected
                    : _currentState;

    final style = _getEffectiveStyle(theme, widget.config, effectiveState);

    Widget tag = _buildTagContent(theme, widget.config, style);

    if (widget.config.shouldShowSkeleton) {
      tag = _buildSkeletonContent(theme, widget.config);
    }

    if (widget.config.tooltip != null) {
      tag = Tooltip(
        message: widget.config.tooltip!,
        child: tag,
      );
    }

    Widget result = tag;

    final animation = widget.config.animation;
    if (animation?.enabled == true) {
      switch (animation!.type) {
        case AppTagAnimationType.scale:
          result = AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              );
            },
            child: result,
          );
          break;
        case AppTagAnimationType.fade:
          result = AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: child,
              );
            },
            child: result,
          );
          break;
        case AppTagAnimationType.pulse:
          result = AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: child,
              );
            },
            child: result,
          );
          break;
        default:
          break;
      }
    }

    if (widget.config.isInteractive) {
      result = _buildInteractiveWrapper(result);
    }

    final semanticLabel =
        widget.config.semanticLabel ?? _generateSemanticLabel();
    if (semanticLabel.isNotEmpty) {
      result = Semantics(
        label: semanticLabel,
        button: widget.config.isInteractive,
        selected: widget.config.isSelected,
        child: result,
      );
    }

    return result;
  }

  Widget _buildInteractiveWrapper(Widget child) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      onLongPress: _handleLongPress,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        cursor: widget.config.canInteract
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Focus(
          onFocusChange: _handleFocusChange,
          child: child,
        ),
      ),
    );
  }

  Widget _buildTagContent(
      ThemeData theme, AppTagConfig config, AppTagStyle style) {
    final children = <Widget>[];

    // Leading widget or icon
    if (config.hasLeadingWidget) {
      children.add(config.leadingWidget!);
      children.add(SizedBox(width: style.spacing ?? config.size.spacing));
    } else if (config.hasLeadingIcon) {
      children.add(
        Icon(
          config.leadingIcon!,
          size: style.iconSize ?? config.size.iconSize,
          color: style.foregroundColor,
        ),
      );
      children.add(SizedBox(width: style.spacing ?? config.size.spacing));
    }

    // Loading indicator
    if (config.isLoading) {
      children.add(
        SizedBox(
          width: config.size.iconSize,
          height: config.size.iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              style.foregroundColor ?? theme.colorScheme.primary,
            ),
          ),
        ),
      );
      children.add(SizedBox(width: style.spacing ?? config.size.spacing));
    }

    // Label text
    if (config.hasLabel) {
      children.add(
        Flexible(
          child: Text(
            config.label,
            style: style.textStyle?.copyWith(
                  fontSize: config.size.fontSize,
                  color: style.foregroundColor,
                  fontWeight: FontWeight.w500,
                ) ??
                TextStyle(
                  fontSize: config.size.fontSize,
                  color: style.foregroundColor,
                  fontWeight: FontWeight.w500,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
    }

    // Trailing widget or icon
    if (config.hasTrailingWidget) {
      children.add(SizedBox(width: style.spacing ?? config.size.spacing));
      children.add(config.trailingWidget!);
    } else if (config.hasTrailingIcon) {
      children.add(SizedBox(width: style.spacing ?? config.size.spacing));
      children.add(
        Icon(
          config.trailingIcon!,
          size: style.iconSize ?? config.size.iconSize,
          color: style.foregroundColor,
        ),
      );
    }

    // Remove button
    if (config.removable) {
      children.add(SizedBox(width: style.spacing ?? config.size.spacing));
      children.add(
        GestureDetector(
          onTap: _handleRemove,
          child: Icon(
            Icons.close,
            size: style.iconSize ?? config.size.iconSize,
            color: style.foregroundColor?.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    return Container(
      height: config.size.height,
      constraints: style.constraints ?? AppTagConstants.defaultConstraints,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: config.shape.getBorderRadius(config.size),
        border: config.hasBorder
            ? Border.all(
                color: style.borderColor!,
                width: config.getEffectiveBorderWidth(),
              )
            : null,
        boxShadow: style.elevation != null && style.elevation! > 0
            ? [
                BoxShadow(
                  color: style.shadowColor?.withValues(alpha: 0.2) ??
                      Colors.black.withValues(alpha: 0.1),
                  blurRadius: style.elevation!,
                  offset: Offset(0, style.elevation! / 2),
                ),
              ]
            : null,
      ),
      padding: style.padding ?? config.size.padding,
      margin: style.margin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildSkeletonContent(ThemeData theme, AppTagConfig config) {
    return Container(
      height: config.size.height,
      width: _calculateSkeletonWidth(config),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: config.shape.getBorderRadius(config.size),
      ),
      child: _SkeletonShimmer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: config.shape.getBorderRadius(config.size),
          ),
        ),
      ),
    );
  }

  double _calculateSkeletonWidth(AppTagConfig config) {
    double width = config.size.padding.horizontal;

    // Estimate label width based on text length
    if (config.hasLabel) {
      width += config.label.length * (config.size.fontSize * 0.6);
    }

    // Add space for icons
    if (config.hasLeading) {
      width += config.size.iconSize + config.size.spacing;
    }

    if (config.hasTrailing || config.removable) {
      width += config.size.iconSize + config.size.spacing;
    }

    return math.max(width, 80.0); // Minimum width
  }

  AppTagStyle _getEffectiveStyle(
      ThemeData theme, AppTagConfig config, AppTagState state) {
    final colorScheme = theme.colorScheme;
    final effectiveBackgroundColor =
        config.getEffectiveBackgroundColor(colorScheme);
    final effectiveForegroundColor =
        config.getEffectiveForegroundColor(colorScheme);
    final effectiveBorderColor = config.getEffectiveBorderColor(colorScheme);

    final baseStyle = AppTagStyle(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      borderColor: effectiveBorderColor,
      shadowColor: colorScheme.shadow,
      overlayColor: colorScheme.onSurface,
      borderWidth: config.getEffectiveBorderWidth(),
      elevation: config.getEffectiveElevation(),
      padding: config.size.padding,
      textStyle: theme.textTheme.labelMedium,
      iconSize: config.size.iconSize,
      spacing: config.size.spacing,
    );

    final customStyle = config.style ?? const AppTagStyle();
    final mergedStyle = baseStyle.copyWith(
      backgroundColor: customStyle.backgroundColor ?? baseStyle.backgroundColor,
      foregroundColor: customStyle.foregroundColor ?? baseStyle.foregroundColor,
      borderColor: customStyle.borderColor ?? baseStyle.borderColor,
      shadowColor: customStyle.shadowColor ?? baseStyle.shadowColor,
      overlayColor: customStyle.overlayColor ?? baseStyle.overlayColor,
      borderWidth: customStyle.borderWidth ?? baseStyle.borderWidth,
      borderRadius: customStyle.borderRadius ?? baseStyle.borderRadius,
      elevation: customStyle.elevation ?? baseStyle.elevation,
      padding: customStyle.padding ?? baseStyle.padding,
      margin: customStyle.margin ?? baseStyle.margin,
      constraints: customStyle.constraints ?? baseStyle.constraints,
      decoration: customStyle.decoration ?? baseStyle.decoration,
      textStyle: customStyle.textStyle ?? baseStyle.textStyle,
      iconSize: customStyle.iconSize ?? baseStyle.iconSize,
      spacing: customStyle.spacing ?? baseStyle.spacing,
      offset: customStyle.offset ?? baseStyle.offset,
    );

    return mergedStyle.copyWithState(state);
  }

  String _generateSemanticLabel() {
    final config = widget.config;
    final buffer = StringBuffer();

    buffer.write('Tag');

    if (config.hasLabel) {
      buffer.write(': ${config.label}');
    }

    if (config.isSelected) {
      buffer.write(', seleccionado');
    }

    if (config.removable) {
      buffer.write(', removible');
    }

    return buffer.toString();
  }
}

class _SkeletonShimmer extends StatefulWidget {
  final Widget child;

  const _SkeletonShimmer({required this.child});

  @override
  State<_SkeletonShimmer> createState() => __SkeletonShimmerState();
}

class __SkeletonShimmerState extends State<_SkeletonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                math.max(0.0, _animation.value - 0.3),
                _animation.value,
                math.min(1.0, _animation.value + 0.3),
              ],
              colors: const [
                Colors.transparent,
                Colors.white54,
                Colors.transparent,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}
