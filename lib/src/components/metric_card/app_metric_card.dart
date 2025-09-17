import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import 'metric_card_config.dart';

class AppMetricCard extends StatefulWidget {
  final AppMetricCardVariant variant;
  final AppMetricCardState state;
  final AppMetricCardSize size;
  final AppMetricCardLayout layout;
  final AppMetricCardAlignment alignment;
  final AppMetricCardSpacing spacing;
  final String title;
  final String value;
  final String? subtitle;
  final String? unit;
  final AppMetricCardDelta? delta;
  final List<AppMetricCardDataPoint>? trend;
  final IconData? icon;
  final Color? iconColor;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? customValueWidget;
  final Widget? customDeltaWidget;
  final Widget? customSparklineWidget;
  final AppMetricCardStyle? style;
  final AppMetricCardInteraction? interaction;
  final AppMetricCardAccessibility? accessibility;
  final AppMetricCardAnimation? animation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onHover;
  final String? semanticLabel;
  final String? tooltip;
  final bool enabled;
  final bool loading;
  final bool skeleton;
  final bool visible;

  const AppMetricCard({
    super.key,
    this.variant = AppMetricCardVariant.delta,
    this.state = AppMetricCardState.defaultState,
    this.size = AppMetricCardSize.medium,
    this.layout = AppMetricCardLayout.vertical,
    this.alignment = AppMetricCardAlignment.start,
    this.spacing = AppMetricCardSpacing.normal,
    required this.title,
    required this.value,
    this.subtitle,
    this.unit,
    this.delta,
    this.trend,
    this.icon,
    this.iconColor,
    this.prefix,
    this.suffix,
    this.customValueWidget,
    this.customDeltaWidget,
    this.customSparklineWidget,
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
  });

  const AppMetricCard.delta({
    super.key,
    this.state = AppMetricCardState.defaultState,
    this.size = AppMetricCardSize.medium,
    this.layout = AppMetricCardLayout.vertical,
    this.alignment = AppMetricCardAlignment.start,
    this.spacing = AppMetricCardSpacing.normal,
    required this.title,
    required this.value,
    this.subtitle,
    this.unit,
    required this.delta,
    this.icon,
    this.iconColor,
    this.prefix,
    this.suffix,
    this.customValueWidget,
    this.customDeltaWidget,
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
  }) : variant = AppMetricCardVariant.delta,
       trend = null,
       customSparklineWidget = null;

  const AppMetricCard.sparkline({
    super.key,
    this.state = AppMetricCardState.defaultState,
    this.size = AppMetricCardSize.medium,
    this.layout = AppMetricCardLayout.vertical,
    this.alignment = AppMetricCardAlignment.start,
    this.spacing = AppMetricCardSpacing.normal,
    required this.title,
    required this.value,
    this.subtitle,
    this.unit,
    required this.trend,
    this.icon,
    this.iconColor,
    this.prefix,
    this.suffix,
    this.customValueWidget,
    this.customSparklineWidget,
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
  }) : variant = AppMetricCardVariant.sparkline,
       delta = null,
       customDeltaWidget = null;

  @override
  State<AppMetricCard> createState() => _AppMetricCardState();
}

class _AppMetricCardState extends State<AppMetricCard>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _bounceAnimation;

  AppMetricCardState _currentState = AppMetricCardState.defaultState;
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
    final animation = widget.animation ?? const AppMetricCardAnimation();

    _animationController = AnimationController(
      duration: animation.duration,
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
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
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

    if (animation.enabled && widget.visible) {
      _animationController.forward();
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
    AppMetricCardState newState = widget.state;

    if (!widget.enabled || widget.state == AppMetricCardState.disabled) {
      newState = AppMetricCardState.disabled;
    } else if (widget.loading || widget.state == AppMetricCardState.loading) {
      newState = AppMetricCardState.loading;
    } else if (widget.skeleton || widget.state == AppMetricCardState.skeleton) {
      newState = AppMetricCardState.skeleton;
    } else if (_isPressed) {
      newState = AppMetricCardState.pressed;
    } else if (_isFocused) {
      newState = AppMetricCardState.focus;
    } else if (_isHovered) {
      newState = AppMetricCardState.hover;
    } else if (widget.state == AppMetricCardState.selected) {
      newState = AppMetricCardState.selected;
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

  bool get _canInteract => widget.enabled &&
                          !widget.loading &&
                          !widget.skeleton &&
                          (widget.onTap != null || widget.onLongPress != null ||
                           widget.interaction?.onTap != null || widget.interaction?.onLongPress != null);

  bool get _isInteractive => _canInteract;

  @override
  void didUpdateWidget(covariant AppMetricCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state ||
        oldWidget.enabled != widget.enabled ||
        oldWidget.loading != widget.loading ||
        oldWidget.skeleton != widget.skeleton) {
      _updateState();
    }

    final newAnimation = widget.animation ?? const AppMetricCardAnimation();
    final oldAnimation = oldWidget.animation ?? const AppMetricCardAnimation();

    if (newAnimation.duration != oldAnimation.duration) {
      _animationController.duration = newAnimation.duration;
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) {
      return const SizedBox.shrink();
    }

    final config = AppMetricCardConfig(
      variant: widget.variant,
      state: _currentState,
      size: widget.size,
      layout: widget.layout,
      alignment: widget.alignment,
      spacing: widget.spacing,
      title: widget.title,
      value: widget.value,
      subtitle: widget.subtitle,
      unit: widget.unit,
      delta: widget.delta,
      trend: widget.trend,
      icon: widget.icon,
      iconColor: widget.iconColor,
      prefix: widget.prefix,
      suffix: widget.suffix,
      customValueWidget: widget.customValueWidget,
      customDeltaWidget: widget.customDeltaWidget,
      customSparklineWidget: widget.customSparklineWidget,
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
    );

    Widget cardWidget = _buildMetricCard(context, config);

    if (widget.animation?.enabled == true) {
      final animationType = widget.animation?.type ?? AppMetricCardAnimationType.fade;

      switch (animationType) {
        case AppMetricCardAnimationType.fade:
          cardWidget = FadeTransition(
            opacity: _fadeAnimation,
            child: cardWidget,
          );
          break;
        case AppMetricCardAnimationType.slide:
          cardWidget = SlideTransition(
            position: _slideAnimation,
            child: cardWidget,
          );
          break;
        case AppMetricCardAnimationType.scale:
          cardWidget = ScaleTransition(
            scale: _scaleAnimation,
            child: cardWidget,
          );
          break;
        case AppMetricCardAnimationType.bounce:
          cardWidget = ScaleTransition(
            scale: _bounceAnimation,
            child: cardWidget,
          );
          break;
        case AppMetricCardAnimationType.none:
          break;
      }
    }

    if (widget.tooltip != null) {
      cardWidget = Tooltip(
        message: widget.tooltip!,
        child: cardWidget,
      );
    }

    if (widget.accessibility?.excludeSemantics != true) {
      cardWidget = Semantics(
        label: widget.semanticLabel ?? widget.accessibility?.semanticLabel,
        button: _isInteractive,
        focusable: widget.interaction?.focusable ?? true,
        enabled: widget.enabled,
        onTap: _isInteractive ? _handleTap : null,
        onLongPress: widget.onLongPress != null || widget.interaction?.onLongPress != null ? _handleLongPress : null,
        child: cardWidget,
      );
    }

    return cardWidget;
  }

  Widget _buildMetricCard(BuildContext context, AppMetricCardConfig config) {
    final theme = Theme.of(context);
    final effectiveStyle = _getEffectiveStyle(theme, config, _currentState);

    if (config.shouldShowSkeleton) {
      return _buildSkeletonCard(context, effectiveStyle, config);
    }

    Widget content;

    switch (config.layout) {
      case AppMetricCardLayout.vertical:
        content = _buildVerticalLayout(context, config, effectiveStyle);
        break;
      case AppMetricCardLayout.horizontal:
        content = _buildHorizontalLayout(context, config, effectiveStyle);
        break;
      case AppMetricCardLayout.compact:
        content = _buildCompactLayout(context, config, effectiveStyle);
        break;
    }

    return _wrapWithInteraction(content, config, effectiveStyle);
  }

  AppMetricCardStyle _getEffectiveStyle(ThemeData theme, AppMetricCardConfig config, AppMetricCardState state) {
    final baseStyle = AppMetricCardStyle(
      backgroundColor: theme.colorScheme.surface,
      foregroundColor: theme.colorScheme.onSurface,
      borderColor: theme.colorScheme.outline,
      shadowColor: theme.colorScheme.shadow,
      overlayColor: theme.colorScheme.onSurface,
      borderWidth: AppMetricCardConstants.defaultBorderWidth,
      borderRadius: AppMetricCardConstants.defaultBorderRadius,
      elevation: AppMetricCardConstants.defaultElevation,
      padding: config.size.padding,
      margin: AppMetricCardConstants.defaultMargin,
      constraints: _getConstraintsForSize(config.size),
      titleTextStyle: theme.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      valueTextStyle: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
      subtitleTextStyle: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      unitTextStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w500,
      ),
      iconSize: config.size.iconSize,
      iconColor: theme.colorScheme.primary,
      spacing: config.spacing.value,
      crossAxisAlignment: _getCrossAxisAlignment(config.alignment),
      mainAxisAlignment: MainAxisAlignment.start,
      deltaStyle: AppMetricCardDeltaStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSurface,
        positiveColor: Colors.green,
        negativeColor: Colors.red,
        neutralColor: theme.colorScheme.onSurfaceVariant,
        borderRadius: 8.0,
        padding: AppMetricCardConstants.defaultDeltaPadding,
        textStyle: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        iconSize: AppMetricCardConstants.defaultDeltaIconSize,
        spacing: 4.0,
      ),
      sparklineStyle: AppMetricCardSparklineStyle(
        lineColor: theme.colorScheme.primary,
        fillColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        gridColor: theme.colorScheme.outline.withValues(alpha: 0.2),
        lineWidth: AppMetricCardConstants.defaultSparklineLineWidth,
        height: AppMetricCardConstants.defaultSparklineHeight,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        showGrid: false,
        showFill: true,
        showLine: true,
        showPoints: false,
        pointRadius: 3.0,
        pointColor: theme.colorScheme.primary,
      ),
    );

    final customStyle = config.style ?? const AppMetricCardStyle();
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
      titleTextStyle: customStyle.titleTextStyle,
      valueTextStyle: customStyle.valueTextStyle,
      subtitleTextStyle: customStyle.subtitleTextStyle,
      unitTextStyle: customStyle.unitTextStyle,
      deltaStyle: customStyle.deltaStyle,
      sparklineStyle: customStyle.sparklineStyle,
      iconSize: customStyle.iconSize,
      iconColor: customStyle.iconColor,
      spacing: customStyle.spacing,
      crossAxisAlignment: customStyle.crossAxisAlignment,
      mainAxisAlignment: customStyle.mainAxisAlignment,
    );

    return mergedStyle.copyWithState(state);
  }

  BoxConstraints _getConstraintsForSize(AppMetricCardSize size) {
    switch (size) {
      case AppMetricCardSize.small:
        return AppMetricCardConstants.smallConstraints;
      case AppMetricCardSize.medium:
        return AppMetricCardConstants.mediumConstraints;
      case AppMetricCardSize.large:
        return AppMetricCardConstants.largeConstraints;
    }
  }

  CrossAxisAlignment _getCrossAxisAlignment(AppMetricCardAlignment alignment) {
    switch (alignment) {
      case AppMetricCardAlignment.start:
        return CrossAxisAlignment.start;
      case AppMetricCardAlignment.center:
        return CrossAxisAlignment.center;
      case AppMetricCardAlignment.end:
        return CrossAxisAlignment.end;
    }
  }

  Widget _buildVerticalLayout(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Column(
      crossAxisAlignment: style.crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: style.mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(context, config, style),
        SizedBox(height: style.spacing ?? 8.0),
        _buildMainContent(context, config, style),
        if (config.variant == AppMetricCardVariant.delta && config.hasDelta) ...[
          SizedBox(height: style.spacing ?? 8.0),
          _buildDeltaSection(context, config, style),
        ],
        if (config.variant == AppMetricCardVariant.sparkline && config.hasTrend) ...[
          SizedBox(height: style.spacing ?? 8.0),
          _buildSparklineSection(context, config, style),
        ],
      ],
    );
  }

  Widget _buildHorizontalLayout(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context, config, style),
              SizedBox(height: style.spacing ?? 4.0),
              _buildMainContent(context, config, style),
              if (config.variant == AppMetricCardVariant.delta && config.hasDelta) ...[
                SizedBox(height: style.spacing ?? 4.0),
                _buildDeltaSection(context, config, style),
              ],
            ],
          ),
        ),
        if (config.variant == AppMetricCardVariant.sparkline && config.hasTrend) ...[
          SizedBox(width: style.spacing ?? 16.0),
          Expanded(
            flex: 1,
            child: _buildSparklineSection(context, config, style),
          ),
        ],
      ],
    );
  }

  Widget _buildCompactLayout(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (config.hasIcon) ...[
          _buildIcon(context, config, style),
          SizedBox(width: style.spacing ?? 8.0),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context, config, style),
              _buildValue(context, config, style),
            ],
          ),
        ),
        if (config.variant == AppMetricCardVariant.delta && config.hasDelta)
          _buildDeltaSection(context, config, style),
        if (config.variant == AppMetricCardVariant.sparkline && config.hasTrend)
          SizedBox(
            width: 60,
            height: 30,
            child: _buildSparklineSection(context, config, style),
          ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Row(
      children: [
        if (config.hasPrefix) ...[
          config.prefix!,
          SizedBox(width: style.spacing ?? 8.0),
        ],
        if (config.hasIcon) ...[
          _buildIcon(context, config, style),
          SizedBox(width: style.spacing ?? 8.0),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context, config, style),
              if (config.hasSubtitle) ...[
                const SizedBox(height: 2.0),
                _buildSubtitle(context, config, style),
              ],
            ],
          ),
        ),
        if (config.hasSuffix) ...[
          SizedBox(width: style.spacing ?? 8.0),
          config.suffix!,
        ],
      ],
    );
  }

  Widget _buildMainContent(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        _buildValue(context, config, style),
        if (config.hasUnit) ...[
          const SizedBox(width: 4.0),
          _buildUnit(context, config, style),
        ],
      ],
    );
  }

  Widget _buildTitle(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Text(
      config.title,
      style: style.titleTextStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Text(
      config.subtitle!,
      style: style.subtitleTextStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildValue(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    if (config.hasCustomValueWidget) {
      return config.customValueWidget!;
    }

    return Text(
      config.value,
      style: style.valueTextStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildUnit(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Text(
      config.unit!,
      style: style.unitTextStyle,
    );
  }

  Widget _buildIcon(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    return Icon(
      config.icon,
      size: style.iconSize,
      color: config.iconColor ?? style.iconColor,
    );
  }

  Widget _buildDeltaSection(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    if (config.hasCustomDeltaWidget) {
      return config.customDeltaWidget!;
    }

    final delta = config.delta!;
    final deltaStyle = style.deltaStyle!;

    Color deltaColor;
    switch (delta.type) {
      case AppMetricCardDeltaType.increase:
        deltaColor = delta.color ?? deltaStyle.positiveColor ?? Colors.green;
        break;
      case AppMetricCardDeltaType.decrease:
        deltaColor = delta.color ?? deltaStyle.negativeColor ?? Colors.red;
        break;
      case AppMetricCardDeltaType.neutral:
        deltaColor = delta.color ?? deltaStyle.neutralColor ?? Theme.of(context).colorScheme.onSurfaceVariant;
        break;
    }

    return Container(
      padding: deltaStyle.padding,
      decoration: BoxDecoration(
        color: deltaStyle.backgroundColor,
        borderRadius: BorderRadius.circular(deltaStyle.borderRadius ?? 8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (delta.showIcon) ...[
            Icon(
              delta.defaultIcon,
              size: deltaStyle.iconSize,
              color: deltaColor,
            ),
            SizedBox(width: deltaStyle.spacing ?? 4.0),
          ],
          Text(
            delta.formattedValue,
            style: deltaStyle.textStyle?.copyWith(color: deltaColor),
          ),
          if (delta.hasLabel) ...[
            SizedBox(width: deltaStyle.spacing ?? 4.0),
            Text(
              delta.label!,
              style: deltaStyle.textStyle?.copyWith(
                color: deltaColor.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSparklineSection(BuildContext context, AppMetricCardConfig config, AppMetricCardStyle style) {
    if (config.hasCustomSparklineWidget) {
      return config.customSparklineWidget!;
    }

    final trend = config.trend!;
    final sparklineStyle = style.sparklineStyle!;

    return Container(
      height: sparklineStyle.height,
      width: sparklineStyle.width,
      padding: sparklineStyle.padding,
      child: CustomPaint(
        painter: _SparklinePainter(
          dataPoints: trend,
          style: sparklineStyle,
        ),
      ),
    );
  }

  Widget _buildSkeletonCard(BuildContext context, AppMetricCardStyle style, AppMetricCardConfig config) {
    final theme = Theme.of(context);
    final shimmerColor = theme.colorScheme.surfaceContainerHighest;

    return Container(
      padding: style.padding,
      margin: style.margin,
      constraints: style.constraints,
      decoration: style.decoration ?? BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(style.borderRadius ?? 0),
        border: style.borderWidth != null && style.borderColor != null
            ? Border.all(
                color: style.borderColor!,
                width: style.borderWidth!,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: shimmerColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 80,
                height: 14,
                decoration: BoxDecoration(
                  color: shimmerColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: 120,
            height: 24,
            decoration: BoxDecoration(
              color: shimmerColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 16,
            decoration: BoxDecoration(
              color: shimmerColor.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _wrapWithInteraction(Widget child, AppMetricCardConfig config, AppMetricCardStyle style) {
    if (!_isInteractive) {
      return Container(
        padding: style.padding,
        margin: style.margin,
        constraints: style.constraints,
        decoration: style.decoration ?? BoxDecoration(
          color: style.backgroundColor,
          borderRadius: BorderRadius.circular(style.borderRadius ?? 0),
          border: style.borderWidth != null && style.borderColor != null
              ? Border.all(
                  color: style.borderColor!,
                  width: style.borderWidth!,
                )
              : null,
          boxShadow: style.elevation != null && style.elevation! > 0
              ? [
                  BoxShadow(
                    color: style.shadowColor ?? Colors.black.withValues(alpha: 0.1),
                    blurRadius: style.elevation! * 2,
                    offset: Offset(0, style.elevation!),
                  ),
                ]
              : null,
        ),
        child: child,
      );
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
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: style.padding,
              margin: style.margin,
              constraints: style.constraints,
              decoration: style.decoration ?? BoxDecoration(
                color: style.backgroundColor,
                borderRadius: BorderRadius.circular(style.borderRadius ?? 0),
                border: style.borderWidth != null && style.borderColor != null
                    ? Border.all(
                        color: style.borderColor!,
                        width: style.borderWidth!,
                      )
                    : null,
                boxShadow: style.elevation != null && style.elevation! > 0
                    ? [
                        BoxShadow(
                          color: style.shadowColor ?? Colors.black.withValues(alpha: 0.1),
                          blurRadius: style.elevation! * 2,
                          offset: Offset(0, style.elevation!),
                        ),
                      ]
                    : null,
              ),
              child: Stack(
                children: [
                  child,
                  if (style.overlayColor != null)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: style.overlayColor,
                          borderRadius: BorderRadius.circular(style.borderRadius ?? 0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<AppMetricCardDataPoint> dataPoints;
  final AppMetricCardSparklineStyle style;

  _SparklinePainter({
    required this.dataPoints,
    required this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) return;

    final paint = Paint()
      ..color = style.lineColor ?? Colors.blue
      ..strokeWidth = style.lineWidth ?? 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = style.fillColor ?? Colors.blue.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    final gridPaint = Paint()
      ..color = style.gridColor ?? Colors.grey.withValues(alpha: 0.3)
      ..strokeWidth = 1.0;

    final pointPaint = Paint()
      ..color = style.pointColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    // Find min and max values
    final values = dataPoints.map((point) => point.value).toList();
    final minValue = values.reduce(math.min);
    final maxValue = values.reduce(math.max);
    final valueRange = maxValue - minValue;

    if (valueRange == 0) return;

    // Create path for line
    final path = Path();
    final fillPath = Path();
    final points = <Offset>[];

    for (int i = 0; i < dataPoints.length; i++) {
      final x = (i / (dataPoints.length - 1)) * size.width;
      final normalizedValue = (dataPoints[i].value - minValue) / valueRange;
      final y = size.height - (normalizedValue * size.height);

      final point = Offset(x, y);
      points.add(point);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    // Complete fill path
    if (style.showFill == true) {
      fillPath.lineTo(size.width, size.height);
      fillPath.close();
      canvas.drawPath(fillPath, fillPaint);
    }

    // Draw grid
    if (style.showGrid == true) {
      // Horizontal grid lines
      for (int i = 0; i <= 4; i++) {
        final y = (i / 4) * size.height;
        canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
      }

      // Vertical grid lines
      for (int i = 0; i <= 4; i++) {
        final x = (i / 4) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
      }
    }

    // Draw line
    if (style.showLine == true) {
      canvas.drawPath(path, paint);
    }

    // Draw points
    if (style.showPoints == true) {
      for (final point in points) {
        canvas.drawCircle(point, style.pointRadius ?? 3.0, pointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}