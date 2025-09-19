import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_tabs_config.dart';

class DSTabs extends StatefulWidget {
  final DSTabsConfig config;
  final List<DSTabItem>? tabs;
  final TabController? controller;
  final ValueChanged<int>? onChanged;
  final List<DSTabBadge>? badges;
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  const DSTabs({
    super.key,
    this.config = const DSTabsConfig(),
    this.tabs,
    this.controller,
    this.onChanged,
    this.badges,
    this.children,
    this.padding,
    this.height,
    this.backgroundColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
  });

  @override
  State<DSTabs> createState() => _DSTabsState();
}

class _DSTabsState extends State<DSTabs> with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late AnimationController _selectionAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _selectionAnimation;
  TabController? _internalController;

  TabController get _controller => widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupController();
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration:
          Duration(milliseconds: widget.config.animation?.duration ?? 300),
      vsync: this,
    );

    _selectionAnimationController = AnimationController(
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

    _selectionAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _selectionAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));

    _stateAnimationController.forward();
  }

  void _setupController() {
    if (widget.controller == null) {
      final tabs = _getTabs();
      if (tabs.isNotEmpty) {
        _internalController = TabController(
          length: tabs.length,
          initialIndex: widget.config.initialIndex.clamp(0, tabs.length - 1),
          vsync: this,
        );
      } else {
        _internalController = TabController(
          length: 1,
          initialIndex: 0,
          vsync: this,
        );
      }
    }

    _controller.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_controller.indexIsChanging) {
      _selectionAnimationController.forward();

      if (widget.config.behavior?.enableHapticFeedback ?? true) {
        HapticFeedback.selectionClick();
      }

      widget.onChanged?.call(_controller.index);
      widget.config.onChanged?.call(_controller.index);
    }
  }

  @override
  void didUpdateWidget(DSTabs oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      _controller.removeListener(_handleTabChange);
      _setupController();
    }

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case DSTabsState.loading:
      case DSTabsState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case DSTabsState.disabled:
        _stateAnimationController.animateTo(0.6);
        break;
      default:
        _stateAnimationController.forward();
        break;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTabChange);
    _stateAnimationController.dispose();
    _selectionAnimationController.dispose();
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl =
        widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: widget.config.enableA11y ? 'Tab navigation' : null,
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
                child: _buildTabsContent(theme, isRtl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabsContent(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    return _buildTabsVariant(theme, isRtl);
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Container(
      height: widget.height ?? widget.config.spacing?.minTabHeight ?? 48.0,
      padding: widget.padding ??
          EdgeInsets.all(widget.config.spacing?.tabPadding ?? 12.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: Border(
          bottom: BorderSide(
            color: _getDividerColor(theme) ?? theme.dividerColor,
            width: 1.0,
          ),
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    return Container(
      height: widget.height ?? widget.config.spacing?.minTabHeight ?? 48.0,
      padding: widget.padding ??
          EdgeInsets.all(widget.config.spacing?.tabPadding ?? 12.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: Border(
          bottom: BorderSide(
            color: _getDividerColor(theme) ?? theme.dividerColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: List.generate(
            3,
            (index) => Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: widget.config.spacing?.tabSpacing ?? 4.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 80,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }

  Widget _buildTabsVariant(ThemeData theme, bool isRtl) {
    final tabs = _getTabs();
    if (tabs.isEmpty) return const SizedBox.shrink();

    switch (widget.config.variant) {
      case DSTabsVariant.fixed:
        return _buildFixedTabs(tabs, theme, isRtl);
      case DSTabsVariant.scrollable:
        return _buildScrollableTabs(tabs, theme, isRtl);
      case DSTabsVariant.withBadges:
        return _buildTabsWithBadges(tabs, theme, isRtl);
    }
  }

  Widget _buildFixedTabs(List<DSTabItem> tabs, ThemeData theme, bool isRtl) {
    return Column(
      children: [
        Container(
          height: widget.height ?? widget.config.spacing?.minTabHeight ?? 48.0,
          decoration: BoxDecoration(
            color: _getBackgroundColor(theme),
            border: Border(
              bottom: BorderSide(
                color: _getDividerColor(theme) ?? theme.dividerColor,
                width: 1.0,
              ),
            ),
          ),
          child: TabBar(
            controller: _controller,
            tabs: tabs.map((tab) => _buildTab(tab, theme)).toList(),
            isScrollable: false,
            tabAlignment: TabAlignment.fill,
            indicatorColor: _getIndicatorColor(theme),
            indicatorWeight: widget.config.spacing?.indicatorWeight ?? 4.0,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: widget.config.spacing?.indicatorPadding ?? 8.0,
            ),
            labelColor: _getLabelColor(theme),
            unselectedLabelColor: _getUnselectedLabelColor(theme),
            labelStyle: _getLabelStyle(theme),
            unselectedLabelStyle: _getUnselectedLabelStyle(theme),
            overlayColor: WidgetStateProperty.all(_getOverlayColor(theme)),
            splashFactory: InkRipple.splashFactory,
            enableFeedback:
                widget.config.behavior?.enableHapticFeedback ?? true,
            onTap: _handleTabTap,
          ),
        ),
        if (widget.children != null)
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: widget.children!,
            ),
          ),
      ],
    );
  }

  Widget _buildScrollableTabs(
      List<DSTabItem> tabs, ThemeData theme, bool isRtl) {
    return Column(
      children: [
        Container(
          height: widget.height ?? widget.config.spacing?.minTabHeight ?? 48.0,
          decoration: BoxDecoration(
            color: _getBackgroundColor(theme),
            border: Border(
              bottom: BorderSide(
                color: _getDividerColor(theme) ?? theme.dividerColor,
                width: 1.0,
              ),
            ),
          ),
          child: TabBar(
            controller: _controller,
            tabs: tabs.map((tab) => _buildTab(tab, theme)).toList(),
            isScrollable: true,
            tabAlignment:
                widget.config.behavior?.tabAlignment ?? TabAlignment.start,
            indicatorColor: _getIndicatorColor(theme),
            indicatorWeight: widget.config.spacing?.indicatorWeight ?? 4.0,
            indicatorSize: (widget.config.behavior?.indicatorSize ==
                    DSTabsIndicatorSize.tab)
                ? TabBarIndicatorSize.tab
                : TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: widget.config.spacing?.indicatorPadding ?? 8.0,
            ),
            labelColor: _getLabelColor(theme),
            unselectedLabelColor: _getUnselectedLabelColor(theme),
            labelStyle: _getLabelStyle(theme),
            unselectedLabelStyle: _getUnselectedLabelStyle(theme),
            overlayColor: WidgetStateProperty.all(_getOverlayColor(theme)),
            splashFactory: InkRipple.splashFactory,
            enableFeedback:
                widget.config.behavior?.enableHapticFeedback ?? true,
            onTap: _handleTabTap,
            padding: EdgeInsets.symmetric(
              horizontal: widget.config.spacing?.tabPadding ?? 12.0,
            ),
          ),
        ),
        if (widget.children != null)
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: widget.children!,
            ),
          ),
      ],
    );
  }

  Widget _buildTabsWithBadges(
      List<DSTabItem> tabs, ThemeData theme, bool isRtl) {
    return Column(
      children: [
        Container(
          height: widget.height ?? widget.config.spacing?.minTabHeight ?? 48.0,
          decoration: BoxDecoration(
            color: _getBackgroundColor(theme),
            border: Border(
              bottom: BorderSide(
                color: _getDividerColor(theme) ?? theme.dividerColor,
                width: 1.0,
              ),
            ),
          ),
          child: TabBar(
            controller: _controller,
            tabs: tabs.map((tab) => _buildTabWithBadge(tab, theme)).toList(),
            isScrollable: true,
            tabAlignment:
                widget.config.behavior?.tabAlignment ?? TabAlignment.start,
            indicatorColor: _getIndicatorColor(theme),
            indicatorWeight: widget.config.spacing?.indicatorWeight ?? 4.0,
            indicatorSize: (widget.config.behavior?.indicatorSize ==
                    DSTabsIndicatorSize.tab)
                ? TabBarIndicatorSize.tab
                : TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: widget.config.spacing?.indicatorPadding ?? 8.0,
            ),
            labelColor: _getLabelColor(theme),
            unselectedLabelColor: _getUnselectedLabelColor(theme),
            labelStyle: _getLabelStyle(theme),
            unselectedLabelStyle: _getUnselectedLabelStyle(theme),
            overlayColor: WidgetStateProperty.all(_getOverlayColor(theme)),
            splashFactory: InkRipple.splashFactory,
            enableFeedback:
                widget.config.behavior?.enableHapticFeedback ?? true,
            onTap: _handleTabTap,
            padding: EdgeInsets.symmetric(
              horizontal: widget.config.spacing?.tabPadding ?? 12.0,
            ),
          ),
        ),
        if (widget.children != null)
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: widget.children!,
            ),
          ),
      ],
    );
  }

  Widget _buildTab(DSTabItem tab, ThemeData theme) {
    Widget content;

    switch (tab.type) {
      case DSTabType.text:
        content = Text(
          tab.text,
          style: _getLabelStyle(theme),
          textAlign: widget.config.typography?.textAlign ?? TextAlign.center,
        );
        break;
      case DSTabType.icon:
        content = tab.icon ?? const Icon(Icons.tab);
        break;
      case DSTabType.textWithIcon:
        content = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tab.icon != null) ...[
              tab.icon!,
              SizedBox(width: widget.config.spacing?.labelPadding ?? 8.0),
            ],
            Text(
              tab.text,
              style: _getLabelStyle(theme),
              textAlign:
                  widget.config.typography?.textAlign ?? TextAlign.center,
            ),
          ],
        );
        break;
      case DSTabType.custom:
        content = tab.child ?? Text(tab.text);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: widget.config.spacing?.labelPadding ?? 8.0,
        horizontal: widget.config.spacing?.tabPadding ?? 12.0,
      ),
      child: AnimatedBuilder(
        animation: _selectionAnimation,
        builder: (context, child) {
          return Semantics(
            label:
                widget.config.enableA11y ? tab.semanticLabel ?? tab.text : null,
            button: widget.config.enableA11y,
            selected: widget.config.enableA11y &&
                _controller.index == _getTabs().indexOf(tab),
            child: Tooltip(
              message: (widget.config.behavior?.showTooltips ?? true)
                  ? tab.tooltip ?? tab.text
                  : '',
              child: content,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabWithBadge(DSTabItem tab, ThemeData theme) {
    final badge = _getBadgeForTab(tab.id);
    final tabWidget = _buildTab(tab, theme);

    if (badge == null || !badge.isVisible) {
      return tabWidget;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        tabWidget,
        Positioned.fill(
          child: Align(
            alignment: badge.position.alignment,
            child: Transform.translate(
              offset: _getBadgeOffset(badge.position),
              child: _buildBadge(badge, theme),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(DSTabBadge badge, ThemeData theme) {
    switch (badge.type) {
      case DSTabBadgeType.dot:
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: badge.backgroundColor ?? theme.colorScheme.error,
            shape: BoxShape.circle,
          ),
        );
      case DSTabBadgeType.count:
        final countText = badge.count > badge.maxCount
            ? '${badge.maxCount}+'
            : badge.count.toString();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: badge.backgroundColor ?? theme.colorScheme.error,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            countText,
            style: TextStyle(
              color: badge.textColor ?? theme.colorScheme.onError,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case DSTabBadgeType.text:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: badge.backgroundColor ?? theme.colorScheme.error,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            badge.text ?? '',
            style: TextStyle(
              color: badge.textColor ?? theme.colorScheme.onError,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    }
  }

  Offset _getBadgeOffset(DSTabBadgePosition position) {
    switch (position) {
      case DSTabBadgePosition.topRight:
        return const Offset(8, -8);
      case DSTabBadgePosition.topLeft:
        return const Offset(-8, -8);
      case DSTabBadgePosition.bottomRight:
        return const Offset(8, 8);
      case DSTabBadgePosition.bottomLeft:
        return const Offset(-8, 8);
    }
  }

  void _handleTabTap(int index) {
    if (!widget.config.state.isInteractive) return;

    final tabs = _getTabs();
    if (index >= 0 && index < tabs.length && !tabs[index].disabled) {
      tabs[index].onTap?.call();
    }
  }

  List<DSTabItem> _getTabs() {
    return widget.tabs ?? widget.config.tabs;
  }

  List<DSTabBadge> _getBadges() {
    return widget.badges ?? widget.config.badges;
  }

  DSTabBadge? _getBadgeForTab(String tabId) {
    final badges = _getBadges();
    try {
      return badges.firstWhere((badge) => badge.tabId == tabId);
    } catch (e) {
      return null;
    }
  }

  // Color getters
  Color? _getBackgroundColor(ThemeData theme) {
    return widget.backgroundColor ??
        widget.config.colors?.backgroundColor ??
        theme.colorScheme.surface;
  }

  Color? _getIndicatorColor(ThemeData theme) {
    return widget.indicatorColor ??
        widget.config.colors?.indicatorColor ??
        theme.tabBarTheme.indicatorColor ??
        theme.colorScheme.primary;
  }

  Color? _getLabelColor(ThemeData theme) {
    return widget.labelColor ??
        widget.config.colors?.selectedLabelColor ??
        theme.tabBarTheme.labelColor ??
        theme.colorScheme.primary;
  }

  Color? _getUnselectedLabelColor(ThemeData theme) {
    return widget.unselectedLabelColor ??
        widget.config.colors?.unselectedLabelColor ??
        theme.tabBarTheme.unselectedLabelColor ??
        theme.colorScheme.onSurfaceVariant;
  }

  Color? _getDividerColor(ThemeData theme) {
    return widget.config.colors?.dividerColor ??
        theme.tabBarTheme.dividerColor ??
        theme.dividerColor;
  }

  Color? _getOverlayColor(ThemeData theme) {
    return widget.config.colors?.overlayColor ??
        theme.colorScheme.primary.withValues(alpha: 0.12);
  }

  // Typography getters
  TextStyle? _getLabelStyle(ThemeData theme) {
    return widget.config.typography?.selectedLabelStyle ??
        theme.tabBarTheme.labelStyle ??
        theme.textTheme.labelLarge;
  }

  TextStyle? _getUnselectedLabelStyle(ThemeData theme) {
    return widget.config.typography?.unselectedLabelStyle ??
        theme.tabBarTheme.unselectedLabelStyle ??
        theme.textTheme.labelLarge?.copyWith(
          color: _getUnselectedLabelColor(theme),
        );
  }
}
