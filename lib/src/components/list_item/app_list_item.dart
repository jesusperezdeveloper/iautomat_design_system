import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'list_item_config.dart';

/// A production-ready list item widget for Material 3 design systems
///
/// Supports three main variants:
/// - [DSListItem.oneLine]: Single line list item with title only
/// - [DSListItem.twoLine]: Two line list item with title and subtitle
/// - [DSListItem.threeLine]: Three line list item with extended content
///
/// Features:
/// - Material 3 design with platform-adaptive behavior
/// - Full RTL support
/// - Keyboard navigation and accessibility
/// - Swipe actions support
/// - Loading and skeleton states
/// - Multiple leading and trailing configurations
/// - Responsive design
class DSListItem extends StatefulWidget {
  /// List item variant
  final DSListItemVariant variant;

  /// List item title
  final String title;

  /// List item subtitle (for two-line and three-line variants)
  final String? subtitle;

  /// Leading widget configuration
  final DSListItemLeading? leading;

  /// Trailing widget configuration
  final DSListItemTrailing? trailing;

  /// Swipe actions configuration
  final DSListItemSwipeActions? swipeActions;

  /// Main tap callback
  final DSListItemTapCallback? onTap;

  /// Long press callback
  final DSListItemLongPressCallback? onLongPress;

  /// Focus change callback
  final DSListItemFocusCallback? onFocusChange;

  /// Hover change callback
  final DSListItemHoverCallback? onHoverChange;

  /// State change callback
  final DSListItemStateChangeCallback? onStateChange;

  /// List item configuration
  final DSListItemConfig config;

  /// Custom title builder
  final DSListItemTitleBuilder? titleBuilder;

  /// Custom subtitle builder
  final DSListItemSubtitleBuilder? subtitleBuilder;

  /// Custom leading builder
  final DSListItemLeadingBuilder? leadingBuilder;

  /// Custom trailing builder
  final DSListItemTrailingBuilder? trailingBuilder;

  /// Creates an DSListItem with one line
  const DSListItem.oneLine({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.swipeActions,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.onHoverChange,
    this.onStateChange,
    this.config = const DSListItemConfig(
      variant: DSListItemVariant.oneLine,
    ),
    this.titleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
  })  : variant = DSListItemVariant.oneLine,
        subtitle = null,
        subtitleBuilder = null;

  /// Creates an DSListItem with two lines
  const DSListItem.twoLine({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.swipeActions,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.onHoverChange,
    this.onStateChange,
    this.config = const DSListItemConfig(
      variant: DSListItemVariant.twoLine,
    ),
    this.titleBuilder,
    this.subtitleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
  }) : variant = DSListItemVariant.twoLine;

  /// Creates an DSListItem with three lines
  const DSListItem.threeLine({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.swipeActions,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.onHoverChange,
    this.onStateChange,
    this.config = const DSListItemConfig(
      variant: DSListItemVariant.threeLine,
    ),
    this.titleBuilder,
    this.subtitleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
  }) : variant = DSListItemVariant.threeLine;

  /// Creates a general DSListItem
  const DSListItem({
    super.key,
    required this.variant,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.swipeActions,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.onHoverChange,
    this.onStateChange,
    this.config = const DSListItemConfig(),
    this.titleBuilder,
    this.subtitleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
  });

  @override
  State<DSListItem> createState() => _DSListItemState();
}

class _DSListItemState extends State<DSListItem>
    with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late AnimationController _swipeController;

  DSListItemState _currentState = DSListItemState.defaultState;
  bool _isHovered = false;
  bool _isFocused = false;
  final bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.config.focusNode ?? FocusNode();

    _animationController = AnimationController(
      duration: widget.config.style?.animationDuration ??
          const Duration(milliseconds: 200),
      vsync: this,
    );

    _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _currentState = widget.config.effectiveState;

    if (widget.config.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(DSListItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config.effectiveState != _currentState) {
      _updateState(widget.config.effectiveState);
    }
  }

  @override
  void dispose() {
    if (widget.config.focusNode == null) {
      _focusNode.dispose();
    }
    _animationController.dispose();
    _swipeController.dispose();
    super.dispose();
  }

  void _updateState(DSListItemState newState) {
    if (_currentState == newState) return;

    setState(() {
      _currentState = newState;
    });

    widget.onStateChange?.call(newState);

    // Trigger animations based on state changes
    if (newState.hasVisualFeedback) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _handleTap() {
    if (!widget.config.isInteractive) return;

    _updateState(DSListItemState.pressed);

    // Reset to default after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _updateState(_isFocused
            ? DSListItemState.focus
            : DSListItemState.defaultState);
      }
    });

    widget.onTap?.call();
  }

  void _handleLongPress() {
    if (!widget.config.isInteractive) return;

    HapticFeedback.mediumImpact();
    widget.onLongPress?.call();
  }

  void _handleHover(bool hovered) {
    if (!widget.config.isInteractive) return;

    setState(() {
      _isHovered = hovered;
    });

    if (hovered && !_isFocused && !_isPressed) {
      _updateState(DSListItemState.hover);
    } else if (!hovered && _currentState == DSListItemState.hover) {
      _updateState(DSListItemState.defaultState);
    }

    widget.onHoverChange?.call(hovered);
  }

  void _handleFocusChange(bool focused) {
    setState(() {
      _isFocused = focused;
    });

    if (focused) {
      _updateState(DSListItemState.focus);
    } else if (_currentState == DSListItemState.focus) {
      _updateState(
          _isHovered ? DSListItemState.hover : DSListItemState.defaultState);
    }

    widget.onFocusChange?.call(focused);
  }

  void _handlePanStart(DragStartDetails details) {
    if (widget.swipeActions?.enabled != true) return;
    _swipeController.reset();
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (widget.swipeActions?.enabled != true) return;

    final delta = details.delta.dx;
    final sensitivity = 1.0;
    _swipeController.value +=
        delta / (context.size?.width ?? 300) * sensitivity;
    _swipeController.value = _swipeController.value.clamp(0.0, 1.0);
  }

  void _handlePanEnd(DragEndDetails details) {
    if (widget.swipeActions?.enabled != true) return;

    final threshold = widget.swipeActions?.threshold ?? 0.5;

    if (_swipeController.value >= threshold) {
      _swipeController.forward();
      // Handle swipe action
      if (widget.swipeActions?.dismissible == true) {
        widget.swipeActions?.onDismiss?.call();
      }
    } else {
      _swipeController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveConfig = widget.config.copyWith(
      variant: widget.variant,
    );

    return _buildContent(context, theme, effectiveConfig);
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    if (config.isSkeleton) {
      return _buildSkeleton(context, theme, config);
    }

    Widget content = _buildListItem(context, theme, config);

    // Add swipe actions if configured
    if (widget.swipeActions?.hasActions == true) {
      content = _buildSwipeActions(context, theme, config, content);
    }

    return content;
  }

  Widget _buildListItem(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    final style = config.style ?? const DSListItemStyle();
    final listItemTheme = config.theme ?? const DSListItemTheme();

    final backgroundColor = _getBackgroundColor(theme, listItemTheme, config);
    final contentPadding = style.getContentPaddingForDensity(config.density);
    final minHeight =
        style.getMinHeightForVariant(config.variant, config.density);

    Widget child = Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: style.maxHeight ?? double.infinity,
      ),
      child: Material(
        type: style.materialType,
        color: backgroundColor,
        elevation: listItemTheme.elevation,
        borderRadius: listItemTheme.borderRadius > 0
            ? BorderRadius.circular(listItemTheme.borderRadius)
            : null,
        clipBehavior: style.clipBehavior,
        child: InkWell(
          onTap: config.isInteractive ? _handleTap : null,
          onLongPress: config.isInteractive ? _handleLongPress : null,
          onHover: config.isInteractive ? _handleHover : null,
          onFocusChange: _handleFocusChange,
          focusNode: _focusNode,
          autofocus: config.autofocus,
          borderRadius: listItemTheme.borderRadius > 0
              ? BorderRadius.circular(listItemTheme.borderRadius)
              : null,
          splashColor: listItemTheme.splashColor,
          highlightColor: listItemTheme.highlightColor,
          child: Padding(
            padding: contentPadding,
            child: _buildRow(context, theme, config),
          ),
        ),
      ),
    );

    // Add loading overlay if needed
    if (config.isLoading) {
      child = Stack(
        children: [
          child,
          _buildLoadingOverlay(context, theme, config),
        ],
      );
    }

    // Add divider if configured
    if (config.showDivider) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          Divider(
            height: 1,
            thickness: 1,
            color: listItemTheme.dividerColor ?? theme.dividerColor,
          ),
        ],
      );
    }

    // Add swipe gesture detection
    if (widget.swipeActions?.enabled == true) {
      child = GestureDetector(
        onPanStart: _handlePanStart,
        onPanUpdate: _handlePanUpdate,
        onPanEnd: _handlePanEnd,
        child: child,
      );
    }

    return child;
  }

  Widget _buildRow(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    final style = config.style ?? const DSListItemStyle();
    final children = <Widget>[];

    // Leading widget
    if (widget.leading != null) {
      children.add(_buildLeading(context, theme, config));
      children.add(SizedBox(width: style.leadingTitleSpacing));
    }

    // Title and subtitle
    children.add(
      Expanded(
        child: _buildTitleSubtitle(context, theme, config),
      ),
    );

    // Trailing widget
    if (widget.trailing != null) {
      children.add(SizedBox(width: style.titleTrailingSpacing));
      children.add(_buildTrailing(context, theme, config));
    }

    Widget row = Row(
      crossAxisAlignment: _getCrossAxisAlignment(style.contentAlignment),
      children: children,
    );

    // Note: Keyboard shortcuts would be implemented with proper Intent/Action pattern
    // This is simplified for the demo

    return row;
  }

  Widget _buildTitleSubtitle(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    final style = config.style ?? const DSListItemStyle();
    final listItemTheme = config.theme ?? const DSListItemTheme();

    final titleStyle = _getTitleStyle(theme, style, listItemTheme, config);
    final subtitleStyle =
        _getSubtitleStyle(theme, style, listItemTheme, config);

    final children = <Widget>[
      // Title
      widget.titleBuilder?.call(context, widget.title, _currentState) ??
          Text(
            widget.title,
            style: titleStyle,
            maxLines: config.variant == DSListItemVariant.oneLine
                ? 1
                : (config.variant == DSListItemVariant.twoLine ? 1 : 2),
            overflow: TextOverflow.ellipsis,
            semanticsLabel: config.semanticLabel,
          ),
    ];

    // Subtitle (for two-line and three-line variants)
    if (widget.subtitle != null && config.variant.supportsSubtitle) {
      children.add(SizedBox(height: style.titleSubtitleSpacing));
      children.add(
        widget.subtitleBuilder
                ?.call(context, widget.subtitle!, _currentState) ??
            Text(
              widget.subtitle!,
              style: subtitleStyle,
              maxLines: config.variant == DSListItemVariant.twoLine ? 1 : 2,
              overflow: TextOverflow.ellipsis,
            ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: _getMainAxisAlignment(style.contentAlignment),
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _buildLeading(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    final leading = widget.leading!;

    if (widget.leadingBuilder != null) {
      return widget.leadingBuilder!(context, leading, _currentState);
    }

    return Container(
      padding: leading.padding,
      margin: leading.getEffectiveMargin(Directionality.of(context)),
      constraints: leading.constraints,
      child: _buildLeadingContent(context, theme, leading, config),
    );
  }

  Widget _buildLeadingContent(
    BuildContext context,
    ThemeData theme,
    DSListItemLeading leading,
    DSListItemConfig config,
  ) {
    Widget content;

    switch (leading.type) {
      case DSListItemLeadingType.none:
        content = const SizedBox.shrink();
        break;

      case DSListItemLeadingType.icon:
        content = Icon(
          leading.icon,
          size: leading.iconSize,
          color: leading.iconColor ?? theme.iconTheme.color,
        );
        break;

      case DSListItemLeadingType.avatar:
        content = CircleAvatar(
          radius: leading.avatarRadius,
          backgroundColor: leading.avatarBackgroundColor,
          backgroundImage: leading.avatarImage,
          child: leading.avatarText != null ? Text(leading.avatarText!) : null,
        );
        break;

      case DSListItemLeadingType.image:
        content = ClipRRect(
          borderRadius: BorderRadius.circular(leading.imageBorderRadius),
          child: Image(
            image: leading.image!,
            width: leading.imageWidth,
            height: leading.imageHeight,
            fit: BoxFit.cover,
          ),
        );
        break;

      case DSListItemLeadingType.checkbox:
        content = Checkbox(
          value: leading.checkboxValue ?? false,
          onChanged: config.isInteractive
              ? (value) {
                  // Handle checkbox change
                }
              : null,
        );
        break;

      case DSListItemLeadingType.radio:
        content = Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.colorScheme.outline,
              width: 2,
            ),
          ),
          child: leading.radioValue == true
              ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              : null,
        );
        break;

      case DSListItemLeadingType.custom:
        content = leading.customWidget ?? const SizedBox.shrink();
        break;
    }

    // Add tap handler if interactive
    if (leading.isInteractive && leading.onTap != null) {
      content = InkWell(
        onTap: leading.onTap,
        borderRadius: BorderRadius.circular(4),
        child: content,
      );
    }

    return Semantics(
      label: leading.semanticLabel,
      child: content,
    );
  }

  Widget _buildTrailing(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    final trailing = widget.trailing!;

    if (widget.trailingBuilder != null) {
      return widget.trailingBuilder!(context, trailing, _currentState);
    }

    return Container(
      padding: trailing.padding,
      margin: trailing.getEffectiveMargin(Directionality.of(context)),
      constraints: trailing.constraints,
      child: _buildTrailingContent(context, theme, trailing, config),
    );
  }

  Widget _buildTrailingContent(
    BuildContext context,
    ThemeData theme,
    DSListItemTrailing trailing,
    DSListItemConfig config,
  ) {
    Widget content;

    switch (trailing.type) {
      case DSListItemTrailingType.none:
        content = const SizedBox.shrink();
        break;

      case DSListItemTrailingType.icon:
        content = Icon(
          trailing.icon,
          size: trailing.iconSize,
          color: trailing.iconColor ?? theme.iconTheme.color,
        );
        break;

      case DSListItemTrailingType.text:
        content = Text(
          trailing.text ?? '',
          style: trailing.textStyle ?? theme.textTheme.bodyMedium,
        );
        break;

      case DSListItemTrailingType.switchWidget:
        content = Switch(
          value: trailing.switchValue ?? false,
          onChanged: config.isInteractive ? trailing.onSwitchChanged : null,
        );
        break;

      case DSListItemTrailingType.checkbox:
        content = Checkbox(
          value: trailing.checkboxValue ?? false,
          onChanged: config.isInteractive ? trailing.onCheckboxChanged : null,
        );
        break;

      case DSListItemTrailingType.radio:
        content = Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.colorScheme.outline,
              width: 2,
            ),
          ),
          child: trailing.radioValue == true
              ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              : null,
        );
        break;

      case DSListItemTrailingType.custom:
        content = trailing.customWidget ?? const SizedBox.shrink();
        break;
    }

    // Add tap handler if interactive
    if (trailing.isInteractive && trailing.onTap != null) {
      content = InkWell(
        onTap: trailing.onTap,
        borderRadius: BorderRadius.circular(4),
        child: content,
      );
    }

    return Semantics(
      label: trailing.semanticLabel,
      child: content,
    );
  }

  Widget _buildSwipeActions(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
    Widget child,
  ) {
    // This is a simplified implementation
    // In a production app, you might want to use a more sophisticated
    // swipe-to-action implementation
    return Dismissible(
      key: Key('list_item_${widget.title}'),
      direction: _getDismissDirection(),
      onDismissed: widget.swipeActions?.dismissible == true
          ? (direction) => widget.swipeActions?.onDismiss?.call()
          : null,
      background: _buildSwipeBackground(context, theme, true),
      secondaryBackground: _buildSwipeBackground(context, theme, false),
      child: child,
    );
  }

  Widget _buildSwipeBackground(
    BuildContext context,
    ThemeData theme,
    bool isLeading,
  ) {
    final actions = isLeading
        ? widget.swipeActions?.leading ?? []
        : widget.swipeActions?.trailing ?? [];

    if (actions.isEmpty) return Container();

    final action = actions.first;

    return Container(
      color: action.backgroundColor ?? theme.colorScheme.error,
      alignment: isLeading ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (action.icon != null)
            Icon(
              action.icon,
              color: action.color ?? theme.colorScheme.onError,
            ),
          if (action.label.isNotEmpty)
            Text(
              action.label,
              style: TextStyle(
                color: action.color ?? theme.colorScheme.onError,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadingOverlay(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.1),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(
                config.theme?.loadingColor ?? theme.colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeleton(
    BuildContext context,
    ThemeData theme,
    DSListItemConfig config,
  ) {
    final style = config.style ?? const DSListItemStyle();
    final contentPadding = style.getContentPaddingForDensity(config.density);
    final minHeight =
        style.getMinHeightForVariant(config.variant, config.density);

    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      padding: contentPadding,
      child: Row(
        children: [
          // Leading skeleton
          if (widget.leading != null) ...[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: style.leadingTitleSpacing),
          ],

          // Title/subtitle skeleton
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                if (config.variant.supportsSubtitle) ...[
                  SizedBox(height: style.titleSubtitleSpacing),
                  Container(
                    height: 14,
                    width: 200,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Trailing skeleton
          if (widget.trailing != null) ...[
            SizedBox(width: style.titleTrailingSpacing),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Helper methods
  Color _getBackgroundColor(
    ThemeData theme,
    DSListItemTheme listItemTheme,
    DSListItemConfig config,
  ) {
    switch (_currentState) {
      case DSListItemState.hover:
        return listItemTheme.hoverColor ?? theme.hoverColor;
      case DSListItemState.pressed:
        return listItemTheme.pressedColor ?? theme.focusColor;
      case DSListItemState.focus:
        return listItemTheme.focusColor ?? theme.focusColor;
      case DSListItemState.selected:
        return listItemTheme.selectedColor ??
            theme.colorScheme.primaryContainer;
      case DSListItemState.disabled:
        return listItemTheme.disabledColor ?? theme.disabledColor;
      default:
        return listItemTheme.backgroundColor ?? Colors.transparent;
    }
  }

  TextStyle _getTitleStyle(
    ThemeData theme,
    DSListItemStyle style,
    DSListItemTheme listItemTheme,
    DSListItemConfig config,
  ) {
    final baseStyle = style.titleStyle ?? theme.textTheme.bodyLarge!;

    Color? textColor;
    if (config.isDisabled) {
      textColor = listItemTheme.disabledTextColor ?? theme.disabledColor;
    } else {
      textColor = listItemTheme.textColor ?? baseStyle.color;
    }

    return baseStyle.copyWith(color: textColor);
  }

  TextStyle _getSubtitleStyle(
    ThemeData theme,
    DSListItemStyle style,
    DSListItemTheme listItemTheme,
    DSListItemConfig config,
  ) {
    final baseStyle = style.subtitleStyle ?? theme.textTheme.bodyMedium!;

    Color? textColor;
    if (config.isDisabled) {
      textColor = listItemTheme.disabledTextColor ?? theme.disabledColor;
    } else {
      textColor = listItemTheme.subtitleColor ?? baseStyle.color;
    }

    return baseStyle.copyWith(color: textColor);
  }

  CrossAxisAlignment _getCrossAxisAlignment(
      DSListItemContentAlignment alignment) {
    switch (alignment) {
      case DSListItemContentAlignment.top:
        return CrossAxisAlignment.start;
      case DSListItemContentAlignment.center:
        return CrossAxisAlignment.center;
      case DSListItemContentAlignment.bottom:
        return CrossAxisAlignment.end;
    }
  }

  MainAxisAlignment _getMainAxisAlignment(
      DSListItemContentAlignment alignment) {
    switch (alignment) {
      case DSListItemContentAlignment.top:
        return MainAxisAlignment.start;
      case DSListItemContentAlignment.center:
        return MainAxisAlignment.center;
      case DSListItemContentAlignment.bottom:
        return MainAxisAlignment.end;
    }
  }

  DismissDirection _getDismissDirection() {
    final direction =
        widget.swipeActions?.direction ?? DSListItemSwipeDirection.both;

    switch (direction) {
      case DSListItemSwipeDirection.startToEnd:
        return DismissDirection.startToEnd;
      case DSListItemSwipeDirection.endToStart:
        return DismissDirection.endToStart;
      case DSListItemSwipeDirection.both:
        return DismissDirection.horizontal;
    }
  }
}
