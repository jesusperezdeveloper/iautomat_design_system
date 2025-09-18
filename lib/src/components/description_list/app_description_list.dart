import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'description_list_config.dart';

class AppDescriptionList extends StatefulWidget {
  final List<AppDescriptionListItem> items;
  final AppDescriptionListVariant variant;
  final AppDescriptionListState state;
  final AppDescriptionListLayout? layout;
  final AppDescriptionListDensity? density;
  final AppDescriptionListSpacing? spacing;
  final AppDescriptionListAlignment? alignment;
  final AppDescriptionListStyle? style;
  final AppDescriptionListInteraction? interaction;
  final AppDescriptionListAccessibility? accessibility;
  final AppDescriptionListAnimation? animation;
  final AppDescriptionListResponsive? responsive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onHover;
  final ValueChanged<bool>? onFocusChange;
  final String? semanticLabel;
  final String? tooltip;
  final bool enabled;
  final bool loading;
  final bool skeleton;
  final bool visible;

  const AppDescriptionList({
    super.key,
    required this.items,
    this.variant = AppDescriptionListVariant.responsive,
    this.state = AppDescriptionListState.defaultState,
    this.layout,
    this.density,
    this.spacing,
    this.alignment,
    this.style,
    this.interaction,
    this.accessibility,
    this.animation,
    this.responsive,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.loading = false,
    this.skeleton = false,
    this.visible = true,
  });

  const AppDescriptionList.responsive({
    super.key,
    required this.items,
    this.state = AppDescriptionListState.defaultState,
    this.layout,
    this.density,
    this.spacing,
    this.alignment,
    this.style,
    this.interaction,
    this.accessibility,
    this.animation,
    this.responsive,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.loading = false,
    this.skeleton = false,
    this.visible = true,
  }) : variant = AppDescriptionListVariant.responsive;

  @override
  State<AppDescriptionList> createState() => _AppDescriptionListState();
}

class _AppDescriptionListState extends State<AppDescriptionList>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  AppDescriptionListState _currentState = AppDescriptionListState.defaultState;
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
    final animation = widget.animation ?? const AppDescriptionListAnimation();

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
        widget.onFocusChange?.call(_focusNode.hasFocus);
        if (widget.interaction?.onFocusChange != null) {
          widget.interaction!.onFocusChange!(_focusNode.hasFocus);
        }
      }
    });
  }

  void _updateState() {
    AppDescriptionListState newState = widget.state;

    if (!widget.enabled || widget.state == AppDescriptionListState.disabled) {
      newState = AppDescriptionListState.disabled;
    } else if (widget.loading ||
        widget.state == AppDescriptionListState.loading) {
      newState = AppDescriptionListState.loading;
    } else if (widget.skeleton ||
        widget.state == AppDescriptionListState.skeleton) {
      newState = AppDescriptionListState.skeleton;
    } else if (_isPressed) {
      newState = AppDescriptionListState.pressed;
    } else if (_isFocused) {
      newState = AppDescriptionListState.focus;
    } else if (_isHovered) {
      newState = AppDescriptionListState.hover;
    } else if (widget.state == AppDescriptionListState.selected) {
      newState = AppDescriptionListState.selected;
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
      if (widget.interaction?.onHover != null) {
        widget.interaction!.onHover!(true);
      }
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
  void didUpdateWidget(covariant AppDescriptionList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state ||
        oldWidget.enabled != widget.enabled ||
        oldWidget.loading != widget.loading ||
        oldWidget.skeleton != widget.skeleton) {
      _updateState();
    }

    final newAnimation =
        widget.animation ?? const AppDescriptionListAnimation();
    final oldAnimation =
        oldWidget.animation ?? const AppDescriptionListAnimation();

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

    final config = AppDescriptionListConfig(
      variant: widget.variant,
      state: _currentState,
      layout: widget.layout ?? AppDescriptionListLayout.adaptive,
      density: widget.density ?? AppDescriptionListDensity.normal,
      spacing: widget.spacing ?? AppDescriptionListSpacing.normal,
      alignment: widget.alignment ?? AppDescriptionListAlignment.start,
      items: widget.items,
      style: widget.style,
      interaction: widget.interaction,
      accessibility: widget.accessibility,
      animation: widget.animation,
      responsive: widget.responsive,
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

    Widget listWidget = _buildDescriptionList(context, config);

    if (widget.animation?.enabled == true) {
      final animationType =
          widget.animation?.type ?? AppDescriptionListAnimationType.fade;

      switch (animationType) {
        case AppDescriptionListAnimationType.fade:
          listWidget = FadeTransition(
            opacity: _fadeAnimation,
            child: listWidget,
          );
          break;
        case AppDescriptionListAnimationType.slide:
          listWidget = SlideTransition(
            position: _slideAnimation,
            child: listWidget,
          );
          break;
        case AppDescriptionListAnimationType.scale:
          listWidget = ScaleTransition(
            scale: _scaleAnimation,
            child: listWidget,
          );
          break;
        case AppDescriptionListAnimationType.rotation:
          listWidget = RotationTransition(
            turns: _fadeAnimation,
            child: listWidget,
          );
          break;
        case AppDescriptionListAnimationType.none:
          break;
      }
    }

    if (widget.tooltip != null) {
      listWidget = Tooltip(
        message: widget.tooltip!,
        child: listWidget,
      );
    }

    if (widget.accessibility?.excludeSemantics != true) {
      listWidget = Semantics(
        label: widget.semanticLabel ?? widget.accessibility?.semanticLabel,
        button: _isInteractive,
        focusable: widget.interaction?.focusable ?? true,
        enabled: widget.enabled,
        onTap: _isInteractive ? _handleTap : null,
        onLongPress: widget.onLongPress != null ||
                widget.interaction?.onLongPress != null
            ? _handleLongPress
            : null,
        child: listWidget,
      );
    }

    return listWidget;
  }

  Widget _buildDescriptionList(
      BuildContext context, AppDescriptionListConfig config) {
    final theme = Theme.of(context);
    final responsive =
        config.responsive ?? const AppDescriptionListResponsive();

    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = _getEffectiveLayout(
            constraints.maxWidth, responsive, config.layout);
        final density = _getEffectiveDensity(
            constraints.maxWidth, responsive, config.density);
        final spacing = _getEffectiveSpacing(
            constraints.maxWidth, responsive, config.spacing);

        final effectiveStyle = _getEffectiveStyle(theme, config, _currentState);

        Widget content;

        switch (layout) {
          case AppDescriptionListLayout.vertical:
            content = _buildVerticalList(
                context, config, effectiveStyle, density, spacing);
            break;
          case AppDescriptionListLayout.horizontal:
            content = _buildHorizontalList(
                context, config, effectiveStyle, density, spacing);
            break;
          case AppDescriptionListLayout.grid:
            content = _buildGridList(context, config, effectiveStyle, density,
                spacing, constraints.maxWidth, responsive);
            break;
          case AppDescriptionListLayout.adaptive:
            content = _buildAdaptiveList(context, config, effectiveStyle,
                density, spacing, constraints.maxWidth, responsive);
            break;
        }

        return _wrapWithInteraction(content, config, effectiveStyle);
      },
    );
  }

  AppDescriptionListLayout _getEffectiveLayout(
      double width,
      AppDescriptionListResponsive responsive,
      AppDescriptionListLayout? defaultLayout) {
    final layout = defaultLayout ?? AppDescriptionListLayout.adaptive;
    if (layout == AppDescriptionListLayout.adaptive) {
      return responsive.getLayoutForWidth(width);
    }
    return layout;
  }

  AppDescriptionListDensity _getEffectiveDensity(
      double width,
      AppDescriptionListResponsive responsive,
      AppDescriptionListDensity? defaultDensity) {
    return responsive.getDensityForWidth(width);
  }

  AppDescriptionListSpacing _getEffectiveSpacing(
      double width,
      AppDescriptionListResponsive responsive,
      AppDescriptionListSpacing? defaultSpacing) {
    return responsive.getSpacingForWidth(width);
  }

  AppDescriptionListStyle _getEffectiveStyle(ThemeData theme,
      AppDescriptionListConfig config, AppDescriptionListState state) {
    final baseStyle = AppDescriptionListStyle(
      backgroundColor: theme.colorScheme.surface,
      foregroundColor: theme.colorScheme.onSurface,
      borderColor: theme.colorScheme.outline,
      shadowColor: theme.colorScheme.shadow,
      overlayColor: theme.colorScheme.onSurface,
      borderWidth: AppDescriptionListConstants.defaultBorderWidth,
      borderRadius: AppDescriptionListConstants.defaultBorderRadius,
      elevation: AppDescriptionListConstants.defaultElevation,
      padding: AppDescriptionListConstants.defaultPadding,
      margin: AppDescriptionListConstants.defaultMargin,
      constraints: AppDescriptionListConstants.defaultConstraints,
      termTextStyle: theme.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurface,
      ),
      descriptionTextStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
      secondaryDescriptionTextStyle: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      itemStyle: AppDescriptionListItemStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSurface,
        borderColor: theme.colorScheme.outline,
        overlayColor: theme.colorScheme.onSurface,
        highlightColor: theme.colorScheme.primary,
        borderRadius: 8.0,
        padding: AppDescriptionListConstants.defaultItemPadding,
        iconSize: AppDescriptionListConstants.defaultIconSize,
        iconColor: theme.colorScheme.onSurfaceVariant,
        spacing: 12.0,
        termWidth: AppDescriptionListConstants.defaultTermWidth,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      dividerStyle: AppDescriptionListDividerStyle(
        color: theme.colorScheme.outline,
        thickness: AppDescriptionListConstants.defaultDividerThickness,
        height: 1.0,
        indent: 0.0,
        endIndent: 0.0,
      ),
    );

    final customStyle = config.style ?? const AppDescriptionListStyle();
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
      termTextStyle: customStyle.termTextStyle,
      descriptionTextStyle: customStyle.descriptionTextStyle,
      secondaryDescriptionTextStyle: customStyle.secondaryDescriptionTextStyle,
      itemStyle: customStyle.itemStyle,
      dividerStyle: customStyle.dividerStyle,
    );

    return mergedStyle.copyWithState(state);
  }

  Widget _buildVerticalList(
      BuildContext context,
      AppDescriptionListConfig config,
      AppDescriptionListStyle style,
      AppDescriptionListDensity density,
      AppDescriptionListSpacing spacing) {
    return Column(
      crossAxisAlignment: _getCrossAxisAlignment(config.alignment),
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < config.items.length; i++) ...[
          _buildDescriptionListItem(
            context,
            config.items[i],
            style.itemStyle!,
            density,
            spacing,
            AppDescriptionListLayout.vertical,
          ),
          if (i < config.items.length - 1 && config.items[i].divider)
            _buildDivider(style.dividerStyle!, spacing),
        ],
      ],
    );
  }

  Widget _buildHorizontalList(
      BuildContext context,
      AppDescriptionListConfig config,
      AppDescriptionListStyle style,
      AppDescriptionListDensity density,
      AppDescriptionListSpacing spacing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < config.items.length; i++) ...[
          _buildDescriptionListItem(
            context,
            config.items[i],
            style.itemStyle!,
            density,
            spacing,
            AppDescriptionListLayout.horizontal,
          ),
          if (i < config.items.length - 1 && config.items[i].divider)
            _buildDivider(style.dividerStyle!, spacing),
        ],
      ],
    );
  }

  Widget _buildGridList(
      BuildContext context,
      AppDescriptionListConfig config,
      AppDescriptionListStyle style,
      AppDescriptionListDensity density,
      AppDescriptionListSpacing spacing,
      double width,
      AppDescriptionListResponsive responsive) {
    final columns = responsive.getColumnsForWidth(width);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing.value,
        mainAxisSpacing: spacing.value,
        childAspectRatio: 3.0,
      ),
      itemCount: config.items.length,
      itemBuilder: (context, index) {
        return _buildDescriptionListItem(
          context,
          config.items[index],
          style.itemStyle!,
          density,
          spacing,
          AppDescriptionListLayout.grid,
        );
      },
    );
  }

  Widget _buildAdaptiveList(
      BuildContext context,
      AppDescriptionListConfig config,
      AppDescriptionListStyle style,
      AppDescriptionListDensity density,
      AppDescriptionListSpacing spacing,
      double width,
      AppDescriptionListResponsive responsive) {
    final layout = responsive.getLayoutForWidth(width);

    switch (layout) {
      case AppDescriptionListLayout.vertical:
        return _buildVerticalList(context, config, style, density, spacing);
      case AppDescriptionListLayout.horizontal:
        return _buildHorizontalList(context, config, style, density, spacing);
      case AppDescriptionListLayout.grid:
        return _buildGridList(
            context, config, style, density, spacing, width, responsive);
      case AppDescriptionListLayout.adaptive:
        return _buildHorizontalList(context, config, style, density, spacing);
    }
  }

  Widget _buildDescriptionListItem(
    BuildContext context,
    AppDescriptionListItem item,
    AppDescriptionListItemStyle style,
    AppDescriptionListDensity density,
    AppDescriptionListSpacing spacing,
    AppDescriptionListLayout layout,
  ) {
    if (config.shouldShowSkeleton) {
      return _buildSkeletonItem(style, density, layout);
    }

    final effectiveStyle = style.copyWithState(
      item.state ?? AppDescriptionListItemState.defaultState,
      highlighted: item.highlighted,
    );

    Widget content;

    switch (layout) {
      case AppDescriptionListLayout.vertical:
        content = _buildVerticalItem(context, item, effectiveStyle, density);
        break;
      case AppDescriptionListLayout.horizontal:
        content = _buildHorizontalItem(context, item, effectiveStyle, density);
        break;
      case AppDescriptionListLayout.grid:
        content = _buildGridItem(context, item, effectiveStyle, density);
        break;
      case AppDescriptionListLayout.adaptive:
        content = _buildHorizontalItem(context, item, effectiveStyle, density);
        break;
    }

    if (item.isInteractive) {
      content = _wrapItemWithInteraction(content, item, effectiveStyle);
    }

    return Container(
      padding: effectiveStyle.padding,
      margin: effectiveStyle.margin,
      constraints: effectiveStyle.constraints,
      decoration: effectiveStyle.decoration ??
          BoxDecoration(
            color: effectiveStyle.backgroundColor,
            borderRadius:
                BorderRadius.circular(effectiveStyle.borderRadius ?? 0),
            border: effectiveStyle.borderWidth != null &&
                    effectiveStyle.borderColor != null
                ? Border.all(
                    color: effectiveStyle.borderColor!,
                    width: effectiveStyle.borderWidth!,
                  )
                : null,
          ),
      child: content,
    );
  }

  Widget _buildVerticalItem(BuildContext context, AppDescriptionListItem item,
      AppDescriptionListItemStyle style, AppDescriptionListDensity density) {
    return Column(
      crossAxisAlignment: style.crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItemContent(context, item, style, density, true),
      ],
    );
  }

  Widget _buildHorizontalItem(BuildContext context, AppDescriptionListItem item,
      AppDescriptionListItemStyle style, AppDescriptionListDensity density) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            style.crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          if (item.hasLeading) ...[
            item.leading!,
            SizedBox(width: style.spacing ?? 12.0),
          ],
          if (item.hasIcon) ...[
            Icon(
              item.icon,
              size: style.iconSize ?? 24.0,
              color: item.iconColor ?? style.iconColor,
            ),
            SizedBox(width: style.spacing ?? 12.0),
          ],
          SizedBox(
            width:
                style.termWidth ?? AppDescriptionListConstants.defaultTermWidth,
            child: _buildTermWidget(context, item, style),
          ),
          SizedBox(width: style.spacing ?? 12.0),
          Expanded(
            child: _buildDescriptionWidget(context, item, style),
          ),
          if (item.hasTrailing) ...[
            SizedBox(width: style.spacing ?? 12.0),
            item.trailing!,
          ],
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, AppDescriptionListItem item,
      AppDescriptionListItemStyle style, AppDescriptionListDensity density) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItemContent(context, item, style, density, false),
      ],
    );
  }

  Widget _buildItemContent(
      BuildContext context,
      AppDescriptionListItem item,
      AppDescriptionListItemStyle style,
      AppDescriptionListDensity density,
      bool vertical) {
    if (vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (item.hasLeading) ...[
                item.leading!,
                SizedBox(width: style.spacing ?? 12.0),
              ],
              if (item.hasIcon) ...[
                Icon(
                  item.icon,
                  size: style.iconSize ?? 24.0,
                  color: item.iconColor ?? style.iconColor,
                ),
                SizedBox(width: style.spacing ?? 12.0),
              ],
              Expanded(child: _buildTermWidget(context, item, style)),
              if (item.hasTrailing) ...[
                SizedBox(width: style.spacing ?? 12.0),
                item.trailing!,
              ],
            ],
          ),
          SizedBox(height: density.verticalSpacing / 2),
          Padding(
            padding: EdgeInsets.only(
              left: (item.hasLeading ? 36.0 : 0) + (item.hasIcon ? 36.0 : 0),
            ),
            child: _buildDescriptionWidget(context, item, style),
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.hasLeading) ...[
            item.leading!,
            SizedBox(width: style.spacing ?? 12.0),
          ],
          if (item.hasIcon) ...[
            Icon(
              item.icon,
              size: style.iconSize ?? 24.0,
              color: item.iconColor ?? style.iconColor,
            ),
            SizedBox(width: style.spacing ?? 12.0),
          ],
          Expanded(
            flex: 1,
            child: _buildTermWidget(context, item, style),
          ),
          SizedBox(width: style.spacing ?? 12.0),
          Expanded(
            flex: 2,
            child: _buildDescriptionWidget(context, item, style),
          ),
          if (item.hasTrailing) ...[
            SizedBox(width: style.spacing ?? 12.0),
            item.trailing!,
          ],
        ],
      );
    }
  }

  Widget _buildTermWidget(BuildContext context, AppDescriptionListItem item,
      AppDescriptionListItemStyle style) {
    if (item.hasCustomTermWidget) {
      return item.termWidget!;
    }

    return Text(
      item.term,
      style: style.termTextStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _buildDescriptionWidget(BuildContext context,
      AppDescriptionListItem item, AppDescriptionListItemStyle style) {
    if (item.hasCustomDescriptionWidget) {
      return item.descriptionWidget!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.description,
          style: style.descriptionTextStyle,
        ),
        if (item.hasSecondaryDescription) ...[
          const SizedBox(height: 4.0),
          Text(
            item.secondaryDescription!,
            style: style.secondaryDescriptionTextStyle,
          ),
        ],
      ],
    );
  }

  Widget _buildSkeletonItem(AppDescriptionListItemStyle style,
      AppDescriptionListDensity density, AppDescriptionListLayout layout) {
    final theme = Theme.of(context);
    final shimmerColor = theme.colorScheme.surfaceContainerHighest;

    return Container(
      padding: style.padding,
      margin: style.margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 16,
            decoration: BoxDecoration(
              color: shimmerColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: style.spacing ?? 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16,
                  decoration: BoxDecoration(
                    color: shimmerColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 200,
                  height: 14,
                  decoration: BoxDecoration(
                    color: shimmerColor.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(
      AppDescriptionListDividerStyle style, AppDescriptionListSpacing spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing.value / 2),
      child: Divider(
        color: style.color,
        thickness: style.thickness,
        height: style.height,
        indent: style.indent,
        endIndent: style.endIndent,
      ),
    );
  }

  Widget _wrapWithInteraction(Widget child, AppDescriptionListConfig config,
      AppDescriptionListStyle style) {
    if (!_isInteractive) {
      return Container(
        padding: style.padding,
        margin: style.margin,
        constraints: style.constraints,
        decoration: style.decoration ??
            BoxDecoration(
              color: style.backgroundColor,
              borderRadius: BorderRadius.circular(style.borderRadius ?? 0),
              border: style.borderWidth != null && style.borderColor != null
                  ? Border.all(
                      color: style.borderColor!,
                      width: style.borderWidth!,
                    )
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
          child: Container(
            padding: style.padding,
            margin: style.margin,
            constraints: style.constraints,
            decoration: style.decoration ??
                BoxDecoration(
                  color: style.backgroundColor,
                  borderRadius: BorderRadius.circular(style.borderRadius ?? 0),
                  border: style.borderWidth != null && style.borderColor != null
                      ? Border.all(
                          color: style.borderColor!,
                          width: style.borderWidth!,
                        )
                      : null,
                ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _wrapItemWithInteraction(Widget child, AppDescriptionListItem item,
      AppDescriptionListItemStyle style) {
    return MouseRegion(
      onEnter: (_) {
        // Handle item hover if needed
      },
      onExit: (_) {
        // Handle item hover exit if needed
      },
      child: GestureDetector(
        onTap: item.onTap,
        onLongPress: item.onLongPress,
        child: child,
      ),
    );
  }

  CrossAxisAlignment _getCrossAxisAlignment(
      AppDescriptionListAlignment? alignment) {
    switch (alignment ?? AppDescriptionListAlignment.start) {
      case AppDescriptionListAlignment.start:
        return CrossAxisAlignment.start;
      case AppDescriptionListAlignment.center:
        return CrossAxisAlignment.center;
      case AppDescriptionListAlignment.end:
        return CrossAxisAlignment.end;
      case AppDescriptionListAlignment.justify:
        return CrossAxisAlignment.stretch;
    }
  }

  AppDescriptionListConfig get config => AppDescriptionListConfig(
        variant: widget.variant,
        state: _currentState,
        layout: widget.layout ?? AppDescriptionListLayout.adaptive,
        density: widget.density ?? AppDescriptionListDensity.normal,
        spacing: widget.spacing ?? AppDescriptionListSpacing.normal,
        alignment: widget.alignment ?? AppDescriptionListAlignment.start,
        items: widget.items,
        style: widget.style,
        interaction: widget.interaction,
        accessibility: widget.accessibility,
        animation: widget.animation,
        responsive: widget.responsive,
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
}
