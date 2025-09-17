import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'timeline_config.dart';

class AppTimeline extends StatefulWidget {
  final AppTimelineConfig config;

  const AppTimeline._({
    super.key,
    required this.config,
  });

  factory AppTimeline.activity({
    Key? key,
    required List<AppTimelineEvent> events,
    AppTimelineOrientation orientation = AppTimelineOrientation.vertical,
    AppTimelineConnectorStyle connectorStyle = AppTimelineConnectorStyle.solid,
    AppTimelineIndicatorStyle indicatorStyle = AppTimelineIndicatorStyle.dot,
    AppTimelineAlignment alignment = AppTimelineAlignment.start,
    AppTimelineSpacing spacing = AppTimelineSpacing.medium,
    Color? connectorColor,
    Color? indicatorColor,
    Color? backgroundColor,
    Color? foregroundColor,
    double? connectorWidth,
    double? indicatorSize,
    double? itemSpacing,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AppTimelineStyle? style,
    AppTimelineInteraction? interaction,
    AppTimelineAccessibility? accessibility,
    AppTimelineAnimation? animation,
    ValueChanged<int>? onEventTap,
    ValueChanged<int>? onEventLongPress,
    ValueChanged<int>? onEventHover,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    bool enabled = true,
    bool loading = false,
    bool skeleton = false,
    bool visible = true,
    bool interactive = false,
    bool scrollable = false,
    bool reversed = false,
    bool shrinkWrap = false,
    int? selectedIndex,
    ScrollController? scrollController,
  }) {
    return AppTimeline._(
      key: key,
      config: AppTimelineConfig(
        variant: AppTimelineVariant.activity,
        events: events,
        orientation: orientation,
        connectorStyle: connectorStyle,
        indicatorStyle: indicatorStyle,
        alignment: alignment,
        spacing: spacing,
        connectorColor: connectorColor,
        indicatorColor: indicatorColor,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        connectorWidth: connectorWidth,
        indicatorSize: indicatorSize,
        itemSpacing: itemSpacing,
        padding: padding,
        margin: margin,
        style: style,
        interaction: interaction,
        accessibility: accessibility,
        animation: animation,
        onEventTap: onEventTap,
        onEventLongPress: onEventLongPress,
        onEventHover: onEventHover,
        onTap: onTap,
        onLongPress: onLongPress,
        onHover: onHover,
        semanticLabel: semanticLabel,
        tooltip: tooltip,
        enabled: enabled,
        loading: loading,
        skeleton: skeleton,
        visible: visible,
        interactive: interactive,
        scrollable: scrollable,
        reversed: reversed,
        shrinkWrap: shrinkWrap,
        selectedIndex: selectedIndex,
        scrollController: scrollController,
      ),
    );
  }

  @override
  State<AppTimeline> createState() => _AppTimelineState();
}

class _AppTimelineState extends State<AppTimeline>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimationController> _itemAnimationControllers;
  late List<Animation<double>> _itemAnimations;
  late FocusNode _focusNode;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeFocus();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: widget.config.animation?.duration ??
               AppTimelineConstants.defaultAnimationDuration,
      vsync: this,
    );

    _itemAnimationControllers = List.generate(
      widget.config.events.length,
      (index) => AnimationController(
        duration: widget.config.animation?.duration ??
                 AppTimelineConstants.defaultAnimationDuration,
        vsync: this,
      ),
    );

    _itemAnimations = _itemAnimationControllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: widget.config.animation?.curve ??
                AppTimelineConstants.defaultAnimationCurve,
        ),
      );
    }).toList();

    if (widget.config.animation?.enabled == true) {
      _startAnimations();
    }
  }

  void _initializeFocus() {
    _focusNode = widget.config.interaction?.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _startAnimations() {
    if (widget.config.animation?.staggered == true) {
      _startStaggeredAnimations();
    } else {
      _animationController.forward();
      for (var controller in _itemAnimationControllers) {
        controller.forward();
      }
    }
  }

  void _startStaggeredAnimations() {
    for (int i = 0; i < _itemAnimationControllers.length; i++) {
      Future.delayed(
        Duration(
          milliseconds: i *
            (widget.config.animation?.staggerDelay.inMilliseconds ?? 100),
        ),
        () {
          if (mounted) {
            _itemAnimationControllers[i].forward();
          }
        },
      );
    }
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
      widget.config.interaction?.onFocusChange?.call(_focusNode.hasFocus);
    }
  }

  void _handleTap() {
    if (!widget.config.canInteract) return;

    HapticFeedback.lightImpact();
    widget.config.onTap?.call();
  }

  void _handleLongPress() {
    if (!widget.config.canInteract) return;

    HapticFeedback.mediumImpact();
    widget.config.onLongPress?.call();
  }

  void _handleEventTap(int index) {
    if (!widget.config.canInteract) return;
    if (index >= widget.config.events.length) return;

    final event = widget.config.events[index];
    if (!event.enabled) return;

    HapticFeedback.lightImpact();
    widget.config.onEventTap?.call(index);
    event.onTap?.call();
  }

  void _handleEventLongPress(int index) {
    if (!widget.config.canInteract) return;
    if (index >= widget.config.events.length) return;

    final event = widget.config.events[index];
    if (!event.enabled) return;

    HapticFeedback.mediumImpact();
    widget.config.onEventLongPress?.call(index);
    event.onLongPress?.call();
  }

  void _handleHover(bool isHovered) {
    if (mounted) {
      setState(() {
        _isHovered = isHovered;
      });
      if (isHovered) {
        widget.config.onHover?.call();
      }
      widget.config.interaction?.onHover?.call(isHovered);
    }
  }

  void _handleEventHover(int index, bool isHovered) {
    if (mounted) {
      setState(() {
        _hoveredIndex = isHovered ? index : null;
      });
      if (isHovered && index < widget.config.events.length) {
        final event = widget.config.events[index];
        widget.config.onEventHover?.call(index);
        event.onHover?.call();
      }
    }
  }

  AppTimelineState get _currentState {
    if (widget.config.isDisabled) return AppTimelineState.disabled;
    if (widget.config.isLoading) return AppTimelineState.loading;
    if (widget.config.isSkeleton) return AppTimelineState.skeleton;
    if (_isPressed) return AppTimelineState.pressed;
    if (_isHovered) return AppTimelineState.hover;
    if (_isFocused) return AppTimelineState.focus;
    if (widget.config.hasSelection) return AppTimelineState.selected;
    return AppTimelineState.defaultState;
  }

  @override
  void didUpdateWidget(AppTimeline oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config.events.length != widget.config.events.length) {
      _disposeItemAnimations();
      _initializeAnimations();
    }

    if (oldWidget.config.animation?.enabled != widget.config.animation?.enabled) {
      if (widget.config.animation?.enabled == true) {
        _startAnimations();
      }
    }
  }

  void _disposeItemAnimations() {
    for (var controller in _itemAnimationControllers) {
      controller.dispose();
    }
    _itemAnimationControllers.clear();
    _itemAnimations.clear();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _disposeItemAnimations();
    if (widget.config.interaction?.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.config.visible) {
      return const SizedBox.shrink();
    }

    if (widget.config.shouldShowSkeleton) {
      return _buildSkeleton(context);
    }

    return _buildTimeline(context);
  }

  Widget _buildTimeline(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final effectiveStyle = widget.config.style?.copyWithState(_currentState) ??
                          AppTimelineStyle().copyWithState(_currentState);

    Widget timeline = Container(
      padding: widget.config.getEffectivePadding(),
      margin: widget.config.getEffectiveMargin(),
      decoration: effectiveStyle.decoration,
      child: widget.config.isHorizontal
        ? _buildHorizontalTimeline(context, colorScheme)
        : _buildVerticalTimeline(context, colorScheme),
    );

    if (widget.config.scrollable) {
      timeline = SingleChildScrollView(
        controller: widget.config.scrollController,
        scrollDirection: widget.config.isHorizontal
          ? Axis.horizontal
          : Axis.vertical,
        reverse: widget.config.reversed,
        child: timeline,
      );
    }

    if (widget.config.isInteractive) {
      timeline = _wrapWithGestures(timeline);
    }

    return _wrapWithSemantics(timeline);
  }

  Widget _buildVerticalTimeline(BuildContext context, ColorScheme colorScheme) {
    final events = widget.config.reversed
      ? widget.config.events.reversed.toList()
      : widget.config.events;

    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: widget.config.shrinkWrap
          ? MainAxisSize.min
          : MainAxisSize.max,
        children: [
          for (int i = 0; i < events.length; i++)
            _buildTimelineItem(
              context,
              colorScheme,
              events[i],
              widget.config.reversed
                ? events.length - 1 - i
                : i,
              isFirst: i == 0,
              isLast: i == events.length - 1,
            ),
        ],
      ),
    );
  }

  Widget _buildHorizontalTimeline(BuildContext context, ColorScheme colorScheme) {
    final events = widget.config.reversed
      ? widget.config.events.reversed.toList()
      : widget.config.events;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: widget.config.shrinkWrap
          ? MainAxisSize.min
          : MainAxisSize.max,
        children: [
          for (int i = 0; i < events.length; i++)
            _buildTimelineItem(
              context,
              colorScheme,
              events[i],
              widget.config.reversed
                ? events.length - 1 - i
                : i,
              isFirst: i == 0,
              isLast: i == events.length - 1,
            ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    ColorScheme colorScheme,
    AppTimelineEvent event,
    int originalIndex,
    {
    required bool isFirst,
    required bool isLast,
  }) {
    if (!event.isVisible) {
      return const SizedBox.shrink();
    }

    final isSelected = widget.config.selectedIndex == originalIndex;
    final isHovered = _hoveredIndex == originalIndex;
    final animation = originalIndex < _itemAnimations.length
      ? _itemAnimations[originalIndex]
      : null;

    Widget item = widget.config.isHorizontal
      ? _buildHorizontalItem(
          context,
          colorScheme,
          event,
          originalIndex,
          isFirst: isFirst,
          isLast: isLast,
          isSelected: isSelected,
          isHovered: isHovered,
        )
      : _buildVerticalItem(
          context,
          colorScheme,
          event,
          originalIndex,
          isFirst: isFirst,
          isLast: isLast,
          isSelected: isSelected,
          isHovered: isHovered,
        );

    if (animation != null && widget.config.animation?.enabled == true) {
      item = _wrapWithAnimation(item, animation);
    }

    return item;
  }

  Widget _buildVerticalItem(
    BuildContext context,
    ColorScheme colorScheme,
    AppTimelineEvent event,
    int index,
    {
    required bool isFirst,
    required bool isLast,
    required bool isSelected,
    required bool isHovered,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Indicator and connector column
          SizedBox(
            width: widget.config.spacing.connectorIndent,
            child: Column(
              children: [
                // Top connector
                if (!isFirst)
                  _buildConnector(
                    colorScheme,
                    isVertical: true,
                    length: widget.config.getEffectiveItemSpacing() / 2,
                  ),

                // Indicator
                _buildIndicator(
                  context,
                  colorScheme,
                  event,
                  index,
                  isSelected: isSelected,
                  isHovered: isHovered,
                ),

                // Bottom connector
                if (!isLast)
                  Expanded(
                    child: _buildConnector(
                      colorScheme,
                      isVertical: true,
                    ),
                  ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: widget.config.spacing.itemSpacing,
                bottom: isLast ? 0 : widget.config.getEffectiveItemSpacing(),
              ),
              child: _buildEventContent(
                context,
                colorScheme,
                event,
                index,
                isSelected: isSelected,
                isHovered: isHovered,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalItem(
    BuildContext context,
    ColorScheme colorScheme,
    AppTimelineEvent event,
    int index,
    {
    required bool isFirst,
    required bool isLast,
    required bool isSelected,
    required bool isHovered,
  }) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content
          _buildEventContent(
            context,
            colorScheme,
            event,
            index,
            isSelected: isSelected,
            isHovered: isHovered,
          ),

          SizedBox(height: widget.config.spacing.itemSpacing),

          // Indicator and connector row
          SizedBox(
            height: widget.config.getEffectiveIndicatorSize() + 4,
            child: Row(
              children: [
                // Left connector
                if (!isFirst)
                  _buildConnector(
                    colorScheme,
                    isVertical: false,
                    length: widget.config.getEffectiveItemSpacing() / 2,
                  ),

                // Indicator
                _buildIndicator(
                  context,
                  colorScheme,
                  event,
                  index,
                  isSelected: isSelected,
                  isHovered: isHovered,
                ),

                // Right connector
                if (!isLast)
                  Expanded(
                    child: _buildConnector(
                      colorScheme,
                      isVertical: false,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(
    BuildContext context,
    ColorScheme colorScheme,
    AppTimelineEvent event,
    int index,
    {
    required bool isSelected,
    required bool isHovered,
  }) {
    final size = widget.config.getEffectiveIndicatorSize();
    final color = event.getEffectiveIconColor(colorScheme);
    final isInteractive = event.isInteractive;

    Widget indicator;

    switch (widget.config.indicatorStyle) {
      case AppTimelineIndicatorStyle.dot:
        indicator = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.surface,
              width: 2,
            ),
          ),
        );
        break;

      case AppTimelineIndicatorStyle.circle:
        indicator = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
        );
        break;

      case AppTimelineIndicatorStyle.square:
        indicator = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: colorScheme.surface,
              width: 1,
            ),
          ),
        );
        break;

      case AppTimelineIndicatorStyle.diamond:
        indicator = Transform.rotate(
          angle: 0.785398, // 45 degrees in radians
          child: Container(
            width: size * 0.8,
            height: size * 0.8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: colorScheme.surface,
                width: 1,
              ),
            ),
          ),
        );
        break;

      case AppTimelineIndicatorStyle.icon:
        indicator = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            event.icon ??
            event.type?.defaultIcon ??
            event.status?.icon ??
            Icons.circle,
            size: size * 0.6,
            color: color,
          ),
        );
        break;

      case AppTimelineIndicatorStyle.custom:
        indicator = event.leading ??
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          );
        break;
    }

    if (isSelected || isHovered) {
      indicator = AnimatedScale(
        scale: isSelected ? 1.2 : (isHovered ? 1.1 : 1.0),
        duration: const Duration(milliseconds: 150),
        child: indicator,
      );
    }

    if (isInteractive) {
      indicator = MouseRegion(
        onEnter: (_) => _handleEventHover(index, true),
        onExit: (_) => _handleEventHover(index, false),
        child: GestureDetector(
          onTap: () => _handleEventTap(index),
          onLongPress: () => _handleEventLongPress(index),
          child: indicator,
        ),
      );
    }

    return indicator;
  }

  Widget _buildConnector(
    ColorScheme colorScheme,
    {
    required bool isVertical,
    double? length,
  }) {
    final color = widget.config.getEffectiveConnectorColor(colorScheme);
    final width = widget.config.getEffectiveConnectorWidth();

    Widget connector;

    switch (widget.config.connectorStyle) {
      case AppTimelineConnectorStyle.solid:
        connector = Container(
          width: isVertical ? width : length,
          height: isVertical ? length : width,
          color: color,
        );
        break;

      case AppTimelineConnectorStyle.dashed:
        connector = _buildDashedConnector(
          color,
          isVertical: isVertical,
          length: length,
          width: width,
        );
        break;

      case AppTimelineConnectorStyle.dotted:
        connector = _buildDottedConnector(
          color,
          isVertical: isVertical,
          length: length,
          width: width,
        );
        break;

      case AppTimelineConnectorStyle.none:
        connector = SizedBox(
          width: isVertical ? width : length,
          height: isVertical ? length : width,
        );
        break;
    }

    return connector;
  }

  Widget _buildDashedConnector(
    Color color,
    {
    required bool isVertical,
    double? length,
    required double width,
  }) {
    return CustomPaint(
      size: Size(
        isVertical ? width : length ?? 50,
        isVertical ? length ?? 50 : width,
      ),
      painter: _DashedLinePainter(
        color: color,
        strokeWidth: width,
        isVertical: isVertical,
      ),
    );
  }

  Widget _buildDottedConnector(
    Color color,
    {
    required bool isVertical,
    double? length,
    required double width,
  }) {
    return CustomPaint(
      size: Size(
        isVertical ? width : length ?? 50,
        isVertical ? length ?? 50 : width,
      ),
      painter: _DottedLinePainter(
        color: color,
        strokeWidth: width,
        isVertical: isVertical,
      ),
    );
  }

  Widget _buildEventContent(
    BuildContext context,
    ColorScheme colorScheme,
    AppTimelineEvent event,
    int index,
    {
    required bool isSelected,
    required bool isHovered,
  }) {
    final theme = Theme.of(context);
    final isInteractive = event.isInteractive;

    Widget content = Card(
      elevation: isSelected ? 4 : (isHovered ? 2 : 1),
      color: event.getEffectiveBackgroundColor(colorScheme),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: event.getEffectiveBorderColor(colorScheme),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: widget.config.spacing.itemPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.hasTimestamp)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  _formatTimestamp(event.timestamp!),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),

            if (event.hasTitle)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  event.displayTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            if (event.hasSubtitle)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  event.displaySubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),
              ),

            if (event.hasDescription)
              Text(
                event.displayDescription,
                style: theme.textTheme.bodySmall,
              ),

            if (event.hasContent)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: event.content!,
              ),

            if (event.hasTrailing)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: event.trailing!,
              ),
          ],
        ),
      ),
    );

    if (isInteractive) {
      content = MouseRegion(
        onEnter: (_) => _handleEventHover(index, true),
        onExit: (_) => _handleEventHover(index, false),
        child: GestureDetector(
          onTap: () => _handleEventTap(index),
          onLongPress: () => _handleEventLongPress(index),
          child: content,
        ),
      );
    }

    return content;
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    } else if (difference.inDays > 0) {
      return 'hace ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return 'hace ${difference.inHours} hora${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inMinutes > 0) {
      return 'hace ${difference.inMinutes} minuto${difference.inMinutes > 1 ? 's' : ''}';
    } else {
      return 'ahora';
    }
  }

  Widget _buildSkeleton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final shimmerColor = colorScheme.onSurface.withValues(alpha: 0.1);

    return Container(
      padding: widget.config.getEffectivePadding(),
      margin: widget.config.getEffectiveMargin(),
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < 2 ? widget.config.getEffectiveItemSpacing() : 0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Indicator skeleton
                Container(
                  width: widget.config.getEffectiveIndicatorSize(),
                  height: widget.config.getEffectiveIndicatorSize(),
                  decoration: BoxDecoration(
                    color: shimmerColor,
                    shape: BoxShape.circle,
                  ),
                ),

                SizedBox(width: widget.config.spacing.itemSpacing),

                // Content skeleton
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: shimmerColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 12,
                        width: 120,
                        decoration: BoxDecoration(
                          color: shimmerColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _wrapWithAnimation(Widget child, Animation<double> animation) {
    switch (widget.config.animation?.type ?? AppTimelineAnimationType.fade) {
      case AppTimelineAnimationType.fade:
        return FadeTransition(opacity: animation, child: child);
      case AppTimelineAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case AppTimelineAnimationType.scale:
        return ScaleTransition(scale: animation, child: child);
      case AppTimelineAnimationType.slideUp:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case AppTimelineAnimationType.slideDown:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case AppTimelineAnimationType.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case AppTimelineAnimationType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case AppTimelineAnimationType.stagger:
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      case AppTimelineAnimationType.none:
        return child;
    }
  }

  Widget _wrapWithGestures(Widget child) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: _handleTap,
        onLongPress: _handleLongPress,
        onTapDown: (_) {
          if (mounted) {
            setState(() {
              _isPressed = true;
            });
          }
        },
        onTapUp: (_) {
          if (mounted) {
            setState(() {
              _isPressed = false;
            });
          }
        },
        onTapCancel: () {
          if (mounted) {
            setState(() {
              _isPressed = false;
            });
          }
        },
        child: child,
      ),
    );
  }

  Widget _wrapWithSemantics(Widget child) {
    return Semantics(
      label: widget.config.semanticLabel ??
             widget.config.accessibility?.semanticLabel ??
             'Timeline con ${widget.config.events.length} eventos',
      hint: widget.config.accessibility?.onTapHint,
      button: widget.config.isInteractive,
      focusable: widget.config.interaction?.focusable ?? true,
      focused: _isFocused,
      enabled: widget.config.enabled,
      excludeSemantics: widget.config.accessibility?.excludeSemantics ?? false,
      child: Focus(
        focusNode: _focusNode,
        child: child,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final bool isVertical;

  _DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.isVertical,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const dashLength = 5.0;
    const dashSpace = 3.0;

    if (isVertical) {
      double currentY = 0;
      while (currentY < size.height) {
        canvas.drawLine(
          Offset(size.width / 2, currentY),
          Offset(size.width / 2, currentY + dashLength),
          paint,
        );
        currentY += dashLength + dashSpace;
      }
    } else {
      double currentX = 0;
      while (currentX < size.width) {
        canvas.drawLine(
          Offset(currentX, size.height / 2),
          Offset(currentX + dashLength, size.height / 2),
          paint,
        );
        currentX += dashLength + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final bool isVertical;

  _DottedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.isVertical,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const dotSize = 2.0;
    const dotSpace = 4.0;

    if (isVertical) {
      double currentY = 0;
      while (currentY < size.height) {
        canvas.drawCircle(
          Offset(size.width / 2, currentY),
          dotSize,
          paint,
        );
        currentY += dotSpace;
      }
    } else {
      double currentX = 0;
      while (currentX < size.width) {
        canvas.drawCircle(
          Offset(currentX, size.height / 2),
          dotSize,
          paint,
        );
        currentX += dotSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}