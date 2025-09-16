import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../../utils/responsive.dart';
import 'app_scaffold_config.dart';

class AppScaffold extends StatefulWidget {
  final AppScaffoldConfig config;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? persistentFooterButtons;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  const AppScaffold({
    super.key,
    this.config = const AppScaffoldConfig(),
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.config.state != AppScaffoldState.loading) {
      _animationController.forward();
    } else {
      _setLoadingState();
    }
  }

  @override
  void didUpdateWidget(AppScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.state != widget.config.state) {
      _handleStateChange();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setLoadingState() {
    setState(() {
      _isLoading = true;
    });
  }

  void _handleStateChange() {
    switch (widget.config.state) {
      case AppScaffoldState.loading:
        _setLoadingState();
        _animationController.reset();
        break;
      case AppScaffoldState.skeleton:
        setState(() {
          _isLoading = false;
        });
        _animationController.forward();
        break;
      default:
        setState(() {
          _isLoading = false;
        });
        _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl = widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;
    final responsive = context;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: 'App Scaffold',
        enabled: widget.config.enableA11y,
        child: _buildScaffoldVariant(context, theme, responsive, isRtl),
      ),
    );
  }

  Widget _buildScaffoldVariant(
    BuildContext context,
    ThemeData theme,
    BuildContext responsive,
    bool isRtl,
  ) {
    switch (widget.config.variant) {
      case AppScaffoldVariant.appShell:
        return _buildAppShell(context, theme, responsive, isRtl);
      case AppScaffoldVariant.gutters:
        return _buildGuttersLayout(context, theme, responsive, isRtl);
      case AppScaffoldVariant.responsive:
        return _buildResponsiveLayout(context, theme, responsive, isRtl);
    }
  }

  Widget _buildAppShell(
    BuildContext context,
    ThemeData theme,
    BuildContext responsive,
    bool isRtl,
  ) {
    final body = _buildBody(context, theme);
    final hasNavigation = widget.config.navigation != null;
    final hasSidePanel = widget.config.sidePanel != null;

    if (Responsive.isDesktop(responsive) && (hasNavigation || hasSidePanel)) {
      return _buildDesktopShell(context, theme, responsive, isRtl, body);
    }

    return _buildMobileShell(context, theme, body);
  }

  Widget _buildDesktopShell(
    BuildContext context,
    ThemeData theme,
    BuildContext responsive,
    bool isRtl,
    Widget body,
  ) {
    final navigation = widget.config.navigation;
    final sidePanel = widget.config.sidePanel;

    return Scaffold(
      key: widget.key,
      backgroundColor: widget.backgroundColor ?? theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, theme),
      body: Row(
        children: [
          if (navigation != null && !isRtl) _buildNavigationRail(navigation, theme),
          if (sidePanel != null && !isRtl) _buildSidePanel(sidePanel, theme),
          Expanded(child: body),
          if (sidePanel != null && isRtl) _buildSidePanel(sidePanel, theme),
          if (navigation != null && isRtl) _buildNavigationRail(navigation, theme),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context, theme),
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          widget.config.floatingAction?.location,
      bottomNavigationBar: _buildBottomBar(context, theme),
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      restorationId: widget.restorationId,
    );
  }

  Widget _buildMobileShell(
    BuildContext context,
    ThemeData theme,
    Widget body,
  ) {
    return Scaffold(
      key: widget.key,
      backgroundColor: widget.backgroundColor ?? theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, theme),
      body: body,
      drawer: _buildDrawer(context, theme),
      endDrawer: widget.endDrawer,
      floatingActionButton: _buildFloatingActionButton(context, theme),
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          widget.config.floatingAction?.location,
      bottomNavigationBar: _buildBottomBar(context, theme),
      persistentFooterButtons: widget.persistentFooterButtons,
      bottomSheet: widget.bottomSheet,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      restorationId: widget.restorationId,
    );
  }

  Widget _buildGuttersLayout(
    BuildContext context,
    ThemeData theme,
    BuildContext responsive,
    bool isRtl,
  ) {
    final body = _buildBody(context, theme);
    final gutterWidth = Responsive.isMobile(responsive) ? AppSpacing.md : AppSpacing.xl;

    return Scaffold(
      key: widget.key,
      backgroundColor: widget.backgroundColor ?? theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, theme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gutterWidth),
        child: body,
      ),
      floatingActionButton: _buildFloatingActionButton(context, theme),
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          widget.config.floatingAction?.location,
      bottomNavigationBar: _buildBottomBar(context, theme),
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      restorationId: widget.restorationId,
    );
  }

  Widget _buildResponsiveLayout(
    BuildContext context,
    ThemeData theme,
    BuildContext responsive,
    bool isRtl,
  ) {
    if (Responsive.isMobile(responsive)) {
      return _buildMobileShell(context, theme, _buildBody(context, theme));
    } else if (Responsive.isTablet(responsive)) {
      return _buildGuttersLayout(context, theme, responsive, isRtl);
    } else {
      return _buildDesktopShell(
        context,
        theme,
        responsive,
        isRtl,
        _buildBody(context, theme),
      );
    }
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context, ThemeData theme) {
    if (widget.appBar != null) return widget.appBar;

    final appBarConfig = widget.config.appBar;
    if (appBarConfig == null) return null;

    return AppBar(
      title: appBarConfig.title,
      actions: appBarConfig.actions,
      leading: appBarConfig.leading,
      bottom: appBarConfig.bottom,
      toolbarHeight: appBarConfig.height,
      backgroundColor: theme.appBarTheme.backgroundColor,
      foregroundColor: theme.appBarTheme.foregroundColor,
      elevation: theme.appBarTheme.elevation,
      shadowColor: theme.appBarTheme.shadowColor,
      surfaceTintColor: theme.appBarTheme.surfaceTintColor,
    );
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {
    Widget? body = widget.body ?? widget.config.body?.child;

    if (body == null) {
      return const SizedBox.shrink();
    }

    if (widget.config.state == AppScaffoldState.skeleton) {
      body = _buildSkeletonBody(context, theme);
    }

    if (_isLoading) {
      body = _buildLoadingBody(context, theme);
    }

    if (widget.config.enableKeyboardPadding) {
      body = SafeArea(
        child: body,
      );
    }

    final bodyConfig = widget.config.body;
    if (bodyConfig?.padding != null) {
      body = Padding(
        padding: bodyConfig!.padding!,
        child: body,
      );
    }

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: body,
        );
      },
    );
  }

  Widget _buildLoadingBody(BuildContext context, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: theme.colorScheme.primary,
          ),
          AppSpacing.verticalMd,
          Text(
            'Cargando...',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonBody(BuildContext context, ThemeData theme) {
    return ListView.builder(
      padding: AppSpacing.pagePadding,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.md),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  Widget? _buildDrawer(BuildContext context, ThemeData theme) {
    if (widget.drawer != null) return widget.drawer;

    final navigation = widget.config.navigation;
    if (navigation == null) return null;

    return Drawer(
      width: navigation.width,
      child: Column(
        children: [
          if (navigation.header != null) navigation.header!,
          Expanded(
            child: ListView.builder(
              itemCount: navigation.items.length,
              itemBuilder: (context, index) {
                final item = navigation.items[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.label),
                  selected: item.isSelected,
                  enabled: !item.disabled,
                  onTap: item.disabled ? null : item.onTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRail(
    AppNavigationConfig navigation,
    ThemeData theme,
  ) {
    final items = navigation.items.map((item) {
      return NavigationRailDestination(
        icon: Icon(item.icon),
        selectedIcon: Icon(item.selectedIcon ?? item.icon),
        label: Text(item.label),
      );
    }).toList();

    final selectedIndex = navigation.items.indexWhere((item) => item.isSelected);

    return NavigationRail(
      destinations: items,
      selectedIndex: selectedIndex >= 0 ? selectedIndex : null,
      onDestinationSelected: (index) {
        final item = navigation.items[index];
        if (!item.disabled) {
          item.onTap?.call();
        }
      },
      backgroundColor: theme.navigationRailTheme.backgroundColor,
      elevation: theme.navigationRailTheme.elevation,
      groupAlignment: 0.0,
      labelType: NavigationRailLabelType.all,
      leading: navigation.header,
    );
  }

  Widget _buildSidePanel(
    SidePanelConfig sidePanel,
    ThemeData theme,
  ) {
    return NavigationRail(
      destinations: sidePanel.destinations,
      selectedIndex: sidePanel.selectedIndex,
      onDestinationSelected: sidePanel.onDestinationSelected,
      labelType: sidePanel.labelType,
      extended: sidePanel.extended,
      backgroundColor: theme.navigationRailTheme.backgroundColor,
      elevation: theme.navigationRailTheme.elevation,
      groupAlignment: 0.0,
    );
  }

  Widget? _buildBottomBar(BuildContext context, ThemeData theme) {
    if (widget.bottomNavigationBar != null) return widget.bottomNavigationBar;

    final bottomBar = widget.config.bottomBar;
    if (bottomBar == null) return null;

    final items = bottomBar.items.map((item) {
      return BottomNavigationBarItem(
        icon: Icon(item.icon),
        activeIcon: Icon(item.activeIcon ?? item.icon),
        label: item.label,
        tooltip: item.tooltip,
      );
    }).toList();

    return BottomNavigationBar(
      items: items,
      currentIndex: bottomBar.selectedIndex ?? 0,
      onTap: bottomBar.onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
      selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
      elevation: theme.bottomNavigationBarTheme.elevation,
    );
  }

  Widget? _buildFloatingActionButton(BuildContext context, ThemeData theme) {
    if (widget.floatingActionButton != null) return widget.floatingActionButton;

    final fab = widget.config.floatingAction;
    if (fab == null) return null;

    return FloatingActionButton(
      onPressed: fab.onPressed,
      mini: fab.mini,
      tooltip: fab.tooltip,
      heroTag: fab.heroTag,
      backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
      foregroundColor: theme.floatingActionButtonTheme.foregroundColor,
      elevation: theme.floatingActionButtonTheme.elevation,
      child: fab.child,
    );
  }
}