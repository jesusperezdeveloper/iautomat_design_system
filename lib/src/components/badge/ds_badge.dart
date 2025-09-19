import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'badge_config.dart';

class DSBadge extends StatefulWidget {
  final DSBadgeVariant variant;
  final DSBadgeState state;
  final DSBadgeSize size;
  final DSBadgePosition position;
  final DSBadgeShape shape;
  final String? label;
  final int? value;
  final DSBadgeStatus? status;
  final Color? color;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? child;
  final IconData? icon;
  final DSBadgeStyle? style;
  final DSBadgeInteraction? interaction;
  final DSBadgeAccessibility? accessibility;
  final DSBadgeAnimation? animation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onHover;
  final String? semanticLabel;
  final String? tooltip;
  final bool enabled;
  final bool loading;
  final bool skeleton;
  final bool visible;
  final bool showZero;
  final int maxValue;

  const DSBadge({
    super.key,
    this.variant = DSBadgeVariant.dot,
    this.state = DSBadgeState.defaultState,
    this.size = DSBadgeSize.medium,
    this.position = DSBadgePosition.topRight,
    this.shape = DSBadgeShape.circle,
    this.label,
    this.value,
    this.status,
    this.color,
    this.backgroundColor,
    this.textColor,
    this.child,
    this.icon,
    this.style,
    this.interaction,
    this.accessibility,
    this.animation,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.loading = false,
    this.skeleton = false,
    this.visible = true,
    this.showZero = false,
    this.maxValue = 99,
  });

  const DSBadge.dot({
    super.key,
    this.state = DSBadgeState.defaultState,
    this.size = DSBadgeSize.medium,
    this.position = DSBadgePosition.topRight,
    this.shape = DSBadgeShape.circle,
    this.color,
    this.backgroundColor,
    this.child,
    this.style,
    this.interaction,
    this.accessibility,
    this.animation,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.loading = false,
    this.skeleton = false,
    this.visible = true,
  })  : variant = DSBadgeVariant.dot,
        label = null,
        value = null,
        status = null,
        textColor = null,
        icon = null,
        showZero = false,
        maxValue = 99;

  const DSBadge.counter({
    super.key,
    this.state = DSBadgeState.defaultState,
    this.size = DSBadgeSize.medium,
    this.position = DSBadgePosition.topRight,
    this.shape = DSBadgeShape.circle,
    this.value,
    this.color,
    this.backgroundColor,
    this.textColor,
    this.child,
    this.style,
    this.interaction,
    this.accessibility,
    this.animation,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.loading = false,
    this.skeleton = false,
    this.visible = true,
    this.showZero = false,
    this.maxValue = 99,
  })  : variant = DSBadgeVariant.counter,
        label = null,
        status = null,
        icon = null;

  const DSBadge.status({
    super.key,
    this.state = DSBadgeState.defaultState,
    this.size = DSBadgeSize.medium,
    this.position = DSBadgePosition.topRight,
    this.shape = DSBadgeShape.circle,
    this.label,
    this.status,
    this.color,
    this.backgroundColor,
    this.textColor,
    this.child,
    this.icon,
    this.style,
    this.interaction,
    this.accessibility,
    this.animation,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.loading = false,
    this.skeleton = false,
    this.visible = true,
  })  : variant = DSBadgeVariant.status,
        value = null,
        showZero = false,
        maxValue = 99;

  @override
  State<DSBadge> createState() => _DSBadgeState();
}

class _DSBadgeState extends State<DSBadge> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _pulseController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _bounceAnimation;
  late final Animation<double> _pulseAnimation;

  DSBadgeState _currentState = DSBadgeState.defaultState;
  final FocusNode _focusNode = FocusNode();
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _currentState = widget.state;
    _setupAnimations();
    _setupFocus();
  }

  void _setupAnimations() {
    final animation = widget.animation ?? const DSBadgeAnimation();

    _animationController = AnimationController(
      duration: animation.duration,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: animation.pulseDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    if (animation.enabled && widget.visible) {
      _animationController.forward();
    }

    if (animation.pulse) {
      _pulseController.repeat(reverse: true);
    }
  }

  void _setupFocus() {
    _focusNode.addListener(() {
      if (mounted) {
        setState(() {
          _isFocused = _focusNode.hasFocus;
          _updateState();
        });
        widget.interaction?.onFocusChange?.call(_focusNode.hasFocus);
      }
    });
  }

  void _updateState() {
    DSBadgeState newState = widget.state;

    if (!widget.enabled || widget.state == DSBadgeState.disabled) {
      newState = DSBadgeState.disabled;
    } else if (widget.loading || widget.state == DSBadgeState.loading) {
      newState = DSBadgeState.loading;
    } else if (widget.skeleton || widget.state == DSBadgeState.skeleton) {
      newState = DSBadgeState.skeleton;
    } else if (_isPressed) {
      newState = DSBadgeState.pressed;
    } else if (_isFocused) {
      newState = DSBadgeState.focus;
    } else if (_isHovered) {
      newState = DSBadgeState.hover;
    } else if (widget.state == DSBadgeState.selected) {
      newState = DSBadgeState.selected;
    }

    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });
    }
  }

  void _handleTap() {
    if (!_canInteract) return;

    widget.onTap?.call();
    widget.interaction?.onTap?.call();

    HapticFeedback.lightImpact();
  }

  void _handleLongPress() {
    if (!_canInteract) return;

    widget.onLongPress?.call();
    widget.interaction?.onLongPress?.call();

    HapticFeedback.mediumImpact();
  }

  void _handleHover(bool hovering) {
    if (!widget.enabled) return;

    setState(() {
      _isHovered = hovering;
      _updateState();
    });

    if (hovering) {
      widget.onHover?.call();
      widget.interaction?.onHover?.call(true);
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (!_canInteract) return;

    setState(() {
      _isPressed = true;
      _updateState();
    });
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.enabled) return;

    setState(() {
      _isPressed = false;
      _updateState();
    });
  }

  void _handleTapCancel() {
    if (!widget.enabled) return;

    setState(() {
      _isPressed = false;
      _updateState();
    });
  }

  bool get _canInteract =>
      widget.enabled &&
      !widget.loading &&
      !widget.skeleton &&
      (widget.onTap != null ||
          widget.onLongPress != null ||
          widget.interaction?.onTap != null ||
          widget.interaction?.onLongPress != null);

  bool get _isInteractive => _canInteract;

  @override
  void didUpdateWidget(covariant DSBadge oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state ||
        oldWidget.enabled != widget.enabled ||
        oldWidget.loading != widget.loading ||
        oldWidget.skeleton != widget.skeleton) {
      _updateState();
    }

    final newAnimation = widget.animation ?? const DSBadgeAnimation();
    final oldAnimation = oldWidget.animation ?? const DSBadgeAnimation();

    if (newAnimation.duration != oldAnimation.duration) {
      _animationController.duration = newAnimation.duration;
    }

    if (newAnimation.pulseDuration != oldAnimation.pulseDuration) {
      _pulseController.duration = newAnimation.pulseDuration;
    }

    if (newAnimation.pulse != oldAnimation.pulse) {
      if (newAnimation.pulse) {
        _pulseController.repeat(reverse: true);
      } else {
        _pulseController.stop();
        _pulseController.reset();
      }
    }

    if (widget.visible && !oldWidget.visible && newAnimation.enabled) {
      _animationController.forward();
    } else if (!widget.visible && oldWidget.visible && newAnimation.enabled) {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) {
      return widget.child ?? const SizedBox.shrink();
    }

    final config = DSBadgeConfig(
      variant: widget.variant,
      state: _currentState,
      size: widget.size,
      position: widget.position,
      shape: widget.shape,
      label: widget.label,
      value: widget.value,
      status: widget.status,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      textColor: widget.textColor,
      child: widget.child,
      icon: widget.icon,
      style: widget.style,
      interaction: widget.interaction,
      accessibility: widget.accessibility,
      animation: widget.animation,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      semanticLabel: widget.semanticLabel,
      tooltip: widget.tooltip,
      enabled: widget.enabled,
      loading: widget.loading,
      skeleton: widget.skeleton,
      visible: widget.visible,
      showZero: widget.showZero,
      maxValue: widget.maxValue,
    );

    if (widget.child == null) {
      return _buildStandaloneBadge(context, config);
    }

    return _buildBadgeWithChild(context, config);
  }

  Widget _buildStandaloneBadge(BuildContext context, DSBadgeConfig config) {
    Widget badgeWidget = _buildBadgeContent(context, config);

    if (widget.animation?.enabled == true) {
      badgeWidget = _wrapWithAnimation(badgeWidget);
    }

    if (widget.tooltip != null) {
      badgeWidget = Tooltip(
        message: widget.tooltip!,
        child: badgeWidget,
      );
    }

    if (widget.accessibility?.excludeSemantics != true) {
      badgeWidget = Semantics(
        label: widget.semanticLabel ??
            widget.accessibility?.semanticLabel ??
            _getSemanticLabel(config),
        button: _isInteractive,
        focusable: widget.interaction?.focusable ?? true,
        enabled: widget.enabled,
        onTap: _isInteractive ? _handleTap : null,
        onLongPress: widget.onLongPress != null ||
                widget.interaction?.onLongPress != null
            ? _handleLongPress
            : null,
        child: badgeWidget,
      );
    }

    return badgeWidget;
  }

  Widget _buildBadgeWithChild(BuildContext context, DSBadgeConfig config) {
    Widget badgeWidget = _buildBadgeContent(context, config);

    if (widget.animation?.enabled == true) {
      badgeWidget = _wrapWithAnimation(badgeWidget);
    }

    Widget result = Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child!,
        Positioned(
          top: config.position == DSBadgePosition.topLeft ||
                  config.position == DSBadgePosition.topRight
              ? 0
              : null,
          bottom: config.position == DSBadgePosition.bottomLeft ||
                  config.position == DSBadgePosition.bottomRight
              ? 0
              : null,
          left: config.position == DSBadgePosition.topLeft ||
                  config.position == DSBadgePosition.bottomLeft
              ? 0
              : null,
          right: config.position == DSBadgePosition.topRight ||
                  config.position == DSBadgePosition.bottomRight
              ? 0
              : null,
          child: Transform.translate(
            offset: config.position.getOffset(config.size),
            child: badgeWidget,
          ),
        ),
      ],
    );

    if (widget.tooltip != null) {
      result = Tooltip(
        message: widget.tooltip!,
        child: result,
      );
    }

    if (widget.accessibility?.excludeSemantics != true) {
      result = Semantics(
        label: widget.semanticLabel ??
            widget.accessibility?.semanticLabel ??
            _getSemanticLabel(config),
        button: _isInteractive,
        focusable: widget.interaction?.focusable ?? true,
        enabled: widget.enabled,
        onTap: _isInteractive ? _handleTap : null,
        onLongPress: widget.onLongPress != null ||
                widget.interaction?.onLongPress != null
            ? _handleLongPress
            : null,
        child: result,
      );
    }

    return result;
  }

  Widget _buildBadgeContent(BuildContext context, DSBadgeConfig config) {
    final theme = Theme.of(context);
    final effectiveStyle = _getEffectiveStyle(theme, config, _currentState);

    if (config.shouldShowSkeleton) {
      return _buildSkeletonBadge(context, effectiveStyle, config);
    }

    Widget content;

    switch (config.variant) {
      case DSBadgeVariant.dot:
        content = _buildDotBadge(context, config, effectiveStyle);
        break;
      case DSBadgeVariant.counter:
        content = _buildCounterBadge(context, config, effectiveStyle);
        break;
      case DSBadgeVariant.status:
        content = _buildStatusBadge(context, config, effectiveStyle);
        break;
    }

    return _wrapWithInteraction(content, config, effectiveStyle);
  }

  Widget _buildDotBadge(
      BuildContext context, DSBadgeConfig config, DSBadgeStyle style) {
    final size = config.size.dotSize;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: config.shape.getBorderRadius(size),
        border: style.borderWidth != null && style.borderColor != null
            ? Border.all(
                color: style.borderColor!,
                width: style.borderWidth!,
              )
            : null,
        boxShadow: style.elevation != null && style.elevation! > 0
            ? [
                BoxShadow(
                  color:
                      style.shadowColor ?? Colors.black.withValues(alpha: 0.2),
                  blurRadius: style.elevation! * 2,
                  offset: Offset(0, style.elevation!),
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildCounterBadge(
      BuildContext context, DSBadgeConfig config, DSBadgeStyle style) {
    if (!config.shouldShowValue) {
      return const SizedBox.shrink();
    }

    final minSize = config.size.counterSize;

    return Container(
      constraints: BoxConstraints(
        minWidth: minSize,
        minHeight: minSize,
      ),
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: config.shape.getBorderRadius(minSize),
        border: style.borderWidth != null && style.borderColor != null
            ? Border.all(
                color: style.borderColor!,
                width: style.borderWidth!,
              )
            : null,
        boxShadow: style.elevation != null && style.elevation! > 0
            ? [
                BoxShadow(
                  color:
                      style.shadowColor ?? Colors.black.withValues(alpha: 0.2),
                  blurRadius: style.elevation! * 2,
                  offset: Offset(0, style.elevation!),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          config.displayValue,
          style: style.textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(
      BuildContext context, DSBadgeConfig config, DSBadgeStyle style) {
    final minSize = config.size.statusSize;
    final hasLabel = config.hasLabel;
    final hasStatus = config.hasStatus;
    final hasIcon = config.hasIcon;

    Widget content;

    if (hasLabel) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasStatus && !hasIcon) ...[
            Icon(
              config.status!.icon,
              size: style.iconSize,
              color: style.foregroundColor,
            ),
            const SizedBox(width: 4),
          ],
          if (hasIcon) ...[
            Icon(
              config.icon!,
              size: style.iconSize,
              color: style.foregroundColor,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            config.label!,
            style: style.textStyle,
          ),
        ],
      );
    } else if (hasStatus && !hasIcon) {
      content = Icon(
        config.status!.icon,
        size: style.iconSize,
        color: style.foregroundColor,
      );
    } else if (hasIcon) {
      content = Icon(
        config.icon!,
        size: style.iconSize,
        color: style.foregroundColor,
      );
    } else {
      content = SizedBox(
        width: minSize,
        height: minSize,
      );
    }

    return Container(
      constraints: BoxConstraints(
        minWidth: hasLabel ? 0 : minSize,
        minHeight: minSize,
      ),
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: config.shape.getBorderRadius(minSize),
        border: style.borderWidth != null && style.borderColor != null
            ? Border.all(
                color: style.borderColor!,
                width: style.borderWidth!,
              )
            : null,
        boxShadow: style.elevation != null && style.elevation! > 0
            ? [
                BoxShadow(
                  color:
                      style.shadowColor ?? Colors.black.withValues(alpha: 0.2),
                  blurRadius: style.elevation! * 2,
                  offset: Offset(0, style.elevation!),
                ),
              ]
            : null,
      ),
      child: Center(child: content),
    );
  }

  Widget _buildSkeletonBadge(
      BuildContext context, DSBadgeStyle style, DSBadgeConfig config) {
    final theme = Theme.of(context);
    final shimmerColor = theme.colorScheme.surfaceContainerHighest;
    final size = config.variant.isDot
        ? config.size.dotSize
        : config.variant.isCounter
            ? config.size.counterSize
            : config.size.statusSize;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: shimmerColor,
        borderRadius: config.shape.getBorderRadius(size),
      ),
    );
  }

  DSBadgeStyle _getEffectiveStyle(
      ThemeData theme, DSBadgeConfig config, DSBadgeState state) {
    final colorScheme = theme.colorScheme;
    final effectiveBackgroundColor =
        config.getEffectiveBackgroundColor(colorScheme);
    final effectiveTextColor = config.getEffectiveTextColor(colorScheme);

    final baseStyle = DSBadgeStyle(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveTextColor,
      borderColor: colorScheme.outline,
      shadowColor: colorScheme.shadow,
      overlayColor: colorScheme.onSurface,
      borderWidth: DSBadgeConstants.defaultBorderWidth,
      elevation: DSBadgeConstants.defaultElevation,
      padding: config.size.padding,
      margin: DSBadgeConstants.defaultMargin,
      constraints: _getConstraintsForVariant(config.variant),
      textStyle: theme.textTheme.labelSmall?.copyWith(
        fontSize: config.size.fontSize,
        fontWeight: FontWeight.w600,
        color: effectiveTextColor,
      ),
      iconSize: config.size.iconSize,
      dotSize: config.size.dotSize,
      minWidth: config.variant.isDot
          ? config.size.dotSize
          : config.variant.isCounter
              ? config.size.counterSize
              : config.size.statusSize,
      minHeight: config.variant.isDot
          ? config.size.dotSize
          : config.variant.isCounter
              ? config.size.counterSize
              : config.size.statusSize,
    );

    final customStyle = config.style ?? const DSBadgeStyle();
    final mergedStyle = baseStyle.copyWith(
      backgroundColor: customStyle.backgroundColor,
      foregroundColor: customStyle.foregroundColor,
      borderColor: customStyle.borderColor,
      shadowColor: customStyle.shadowColor,
      overlayColor: customStyle.overlayColor,
      borderWidth: customStyle.borderWidth,
      borderRadius: customStyle.borderRadius,
      elevation: customStyle.elevation,
      padding: customStyle.padding,
      margin: customStyle.margin,
      constraints: customStyle.constraints,
      decoration: customStyle.decoration,
      textStyle: customStyle.textStyle,
      iconSize: customStyle.iconSize,
      dotSize: customStyle.dotSize,
      minWidth: customStyle.minWidth,
      minHeight: customStyle.minHeight,
      offset: customStyle.offset,
    );

    return mergedStyle.copyWithState(state);
  }

  BoxConstraints _getConstraintsForVariant(DSBadgeVariant variant) {
    switch (variant) {
      case DSBadgeVariant.dot:
        return DSBadgeConstants.dotConstraints;
      case DSBadgeVariant.counter:
        return DSBadgeConstants.counterConstraints;
      case DSBadgeVariant.status:
        return DSBadgeConstants.statusConstraints;
    }
  }

  Widget _wrapWithAnimation(Widget child) {
    final animationType = widget.animation?.type ?? DSBadgeAnimationType.fade;
    final isPulse = widget.animation?.pulse ?? false;

    Widget animatedChild = child;

    if (isPulse) {
      animatedChild = ScaleTransition(
        scale: _pulseAnimation,
        child: animatedChild,
      );
    }

    switch (animationType) {
      case DSBadgeAnimationType.fade:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: animatedChild,
        );
      case DSBadgeAnimationType.slide:
        return SlideTransition(
          position: _slideAnimation,
          child: animatedChild,
        );
      case DSBadgeAnimationType.scale:
        return ScaleTransition(
          scale: _scaleAnimation,
          child: animatedChild,
        );
      case DSBadgeAnimationType.bounce:
        return ScaleTransition(
          scale: _bounceAnimation,
          child: animatedChild,
        );
      case DSBadgeAnimationType.pulse:
        return ScaleTransition(
          scale: _pulseAnimation,
          child: child,
        );
      case DSBadgeAnimationType.none:
        return animatedChild;
    }
  }

  Widget _wrapWithInteraction(
      Widget child, DSBadgeConfig config, DSBadgeStyle style) {
    if (!_isInteractive) {
      return child;
    }

    return Focus(
      focusNode: _focusNode,
      autofocus: widget.interaction?.autofocus ?? false,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: GestureDetector(
          onTap: _handleTap,
          onLongPress: _handleLongPress,
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: Stack(
            children: [
              child,
              if (style.overlayColor != null)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: style.overlayColor,
                      borderRadius: config.shape.getBorderRadius(
                        config.variant.isDot
                            ? config.size.dotSize
                            : config.variant.isCounter
                                ? config.size.counterSize
                                : config.size.statusSize,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getSemanticLabel(DSBadgeConfig config) {
    switch (config.variant) {
      case DSBadgeVariant.dot:
        return 'Indicador';
      case DSBadgeVariant.counter:
        if (config.hasValue && config.shouldShowValue) {
          return 'Contador: ${config.displayValue}';
        }
        return 'Contador';
      case DSBadgeVariant.status:
        if (config.hasLabel) {
          return config.label!;
        }
        if (config.hasStatus) {
          return 'Estado: ${config.status!.label}';
        }
        return 'Estado';
    }
  }
}
