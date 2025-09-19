import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/responsive.dart';
import 'app_navigation_config.dart';

class DSNavigation extends StatefulWidget {
  final DSNavigationComponentConfig config;
  final List<DSNavigationDestination>? destinations;
  final int? currentIndex;
  final ValueChanged<int>? onDestinationSelected;
  final List<DSNavigationBadge>? badges;
  final Widget? header;
  final Widget? footer;
  final EdgeInsetsGeometry? contentPadding;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final double? elevation;

  const DSNavigation({
    super.key,
    this.config = const DSNavigationComponentConfig(),
    this.destinations,
    this.currentIndex,
    this.onDestinationSelected,
    this.badges,
    this.header,
    this.footer,
    this.contentPadding,
    this.width,
    this.height,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.elevation,
  });

  @override
  State<DSNavigation> createState() => _DSNavigationState();
}

class _DSNavigationState extends State<DSNavigation>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late AnimationController _selectionAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _selectionAnimation;

  bool _isLoading = false;
  int _currentIndex = 0;
  final Map<String, bool> _hoveredItems = {};

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _currentIndex = widget.currentIndex ?? widget.config.currentIndex;
    _handleInitialState();
  }

  @override
  void didUpdateWidget(DSNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config.state != widget.config.state) {
      _handleStateChange();
    }

    if (oldWidget.currentIndex != widget.currentIndex ||
        oldWidget.config.currentIndex != widget.config.currentIndex) {
      final newIndex = widget.currentIndex ?? widget.config.currentIndex;
      if (newIndex != _currentIndex) {
        _animateSelection(newIndex);
      }
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _selectionAnimationController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    _stateAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _selectionAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: Curves.easeOutBack,
    ));

    _selectionAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _selectionAnimationController,
      curve: Curves.elasticOut,
    ));
  }

  void _handleInitialState() {
    switch (widget.config.state) {
      case DSNavigationState.loading:
        _setLoadingState();
        break;
      case DSNavigationState.skeleton:
        _stateAnimationController.forward();
        break;
      default:
        _stateAnimationController.forward();
        _selectionAnimationController.forward();
    }
  }

  void _handleStateChange() {
    switch (widget.config.state) {
      case DSNavigationState.loading:
        _setLoadingState();
        break;
      case DSNavigationState.skeleton:
        setState(() {
          _isLoading = false;
        });
        _stateAnimationController.forward();
        break;
      case DSNavigationState.disabled:
        setState(() {
          _isLoading = false;
        });
        _stateAnimationController.forward();
        break;
      default:
        setState(() {
          _isLoading = false;
        });
        _stateAnimationController.forward();
        _selectionAnimationController.forward();
    }
  }

  void _setLoadingState() {
    setState(() {
      _isLoading = true;
    });
    _stateAnimationController.reset();
    _selectionAnimationController.reset();
  }

  void _animateSelection(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
    _selectionAnimationController.reset();
    _selectionAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl =
        widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: 'Navigation',
        enabled: widget.config.enableA11y,
        child: AnimatedBuilder(
          animation: _stateAnimationController,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value * widget.config.state.opacity,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: _buildNavigationVariant(context, theme, isRtl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavigationVariant(
      BuildContext context, ThemeData theme, bool isRtl) {
    if (_isLoading) {
      return _buildLoadingNavigation(context, theme);
    }

    if (widget.config.state == DSNavigationState.skeleton) {
      return _buildSkeletonNavigation(context, theme);
    }

    switch (widget.config.variant) {
      case DSNavigationVariant.bottomBar:
        return _buildBottomNavigation(context, theme, isRtl);
      case DSNavigationVariant.rail:
        return _buildNavigationRail(context, theme, isRtl);
      case DSNavigationVariant.drawer:
        return _buildNavigationDrawer(context, theme, isRtl);
      case DSNavigationVariant.permanentDrawer:
        return _buildPermanentDrawer(context, theme, isRtl);
    }
  }

  Widget _buildBottomNavigation(
      BuildContext context, ThemeData theme, bool isRtl) {
    final destinations = _getDestinations();
    if (destinations.isEmpty) return const SizedBox.shrink();

    // NavigationBar requires at least 2 destinations
    if (destinations.length < 2) {
      return SizedBox(
        height: widget.height ?? widget.config.spacing?.bottomBarHeight ?? 80.0,
        child: Container(
          color: _getBackgroundColor(theme),
          child: Center(
            child: destinations.isEmpty
                ? const Text('No destinations provided')
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      destinations.first.icon,
                      const SizedBox(width: 8),
                      Text(destinations.first.label),
                    ],
                  ),
          ),
        ),
      );
    }

    final items = destinations.asMap().entries.map((entry) {
      final index = entry.key;
      final destination = entry.value;

      return NavigationDestination(
        icon: _buildIconWithBadge(destination, index, false),
        selectedIcon: _buildIconWithBadge(destination, index, true),
        label: destination.label,
        tooltip: destination.tooltip,
        enabled: !destination.disabled,
      );
    }).toList();

    return SizedBox(
      height: widget.height ?? widget.config.spacing?.bottomBarHeight ?? 80.0,
      child: NavigationBar(
        destinations: items,
        selectedIndex: _currentIndex.clamp(0, destinations.length - 1),
        onDestinationSelected: _handleDestinationTap,
        backgroundColor: _getBackgroundColor(theme),
        indicatorColor: _getIndicatorColor(theme),
        surfaceTintColor: _getSurfaceTintColor(theme),
        shadowColor: _getShadowColor(theme),
        elevation: _getElevation(),
        labelBehavior: _getLabelBehavior(),
      ),
    );
  }

  Widget _buildNavigationRail(
      BuildContext context, ThemeData theme, bool isRtl) {
    final destinations = _getDestinations();
    if (destinations.isEmpty) return const SizedBox.shrink();

    final railDestinations = destinations.asMap().entries.map((entry) {
      final index = entry.key;
      final destination = entry.value;

      return NavigationRailDestination(
        icon: _buildIconWithBadge(destination, index, false),
        selectedIcon: _buildIconWithBadge(destination, index, true),
        label: Text(destination.label),
        disabled: destination.disabled || !widget.config.state.isInteractive,
      );
    }).toList();

    return SizedBox(
      width: widget.width ?? widget.config.spacing?.railWidth ?? 72.0,
      child: NavigationRail(
        destinations: railDestinations,
        selectedIndex: _currentIndex.clamp(0, destinations.length - 1),
        onDestinationSelected: _handleDestinationTap,
        backgroundColor: _getBackgroundColor(theme),
        elevation: widget.config.elevation?.railElevation == 0.0
            ? null
            : widget.config.elevation?.railElevation,
        labelType: _getRailLabelType(),
        groupAlignment: 0.0,
        leading: widget.header,
        trailing: widget.footer,
        minWidth: widget.config.spacing?.railWidth ?? 72.0,
        minExtendedWidth: 200.0,
        useIndicator: true,
        indicatorColor: _getIndicatorColor(theme),
      ),
    );
  }

  Widget _buildNavigationDrawer(
      BuildContext context, ThemeData theme, bool isRtl) {
    return _buildDrawerContent(context, theme, isRtl);
  }

  Widget _buildPermanentDrawer(
      BuildContext context, ThemeData theme, bool isRtl) {
    return SizedBox(
      width: widget.width ?? widget.config.spacing?.drawerWidth ?? 256.0,
      child: _buildDrawerContent(context, theme, isRtl),
    );
  }

  Widget _buildDrawerContent(
      BuildContext context, ThemeData theme, bool isRtl) {
    final destinations = _getDestinations();

    return Drawer(
      backgroundColor: _getBackgroundColor(theme),
      elevation: _getDrawerElevation(),
      surfaceTintColor: _getSurfaceTintColor(theme),
      shadowColor: _getShadowColor(theme),
      width: widget.width ?? widget.config.spacing?.drawerWidth ?? 256.0,
      child: Column(
        children: [
          if (widget.header != null) widget.header!,
          Expanded(
            child: ListView.builder(
              padding: widget.contentPadding ?? EdgeInsets.all(8.0),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final destination = destinations[index];
                return _buildDrawerItem(context, theme, destination, index);
              },
            ),
          ),
          if (widget.footer != null) widget.footer!,
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    ThemeData theme,
    DSNavigationDestination destination,
    int index,
  ) {
    final isSelected = index == _currentIndex;
    final isInteractive =
        !destination.disabled && widget.config.state.isInteractive;

    return AnimatedBuilder(
      animation: _selectionAnimation,
      builder: (context, child) {
        return MouseRegion(
          onEnter: (_) => _setHovered(destination.id, true),
          onExit: (_) => _setHovered(destination.id, false),
          child: ListTile(
            leading: destination.leading ??
                _buildIconWithBadge(destination, index, isSelected),
            title: Text(destination.label),
            trailing: destination.trailing,
            selected: isSelected,
            enabled: isInteractive,
            onTap: isInteractive ? () => _handleDestinationTap(index) : null,
            hoverColor: theme.colorScheme.onSurface.withValues(alpha: 0.08),
            selectedColor: _getSelectedItemColor(theme),
            iconColor: isSelected
                ? _getSelectedIconColor(theme)
                : _getUnselectedIconColor(theme),
            textColor: isSelected
                ? _getSelectedLabelColor(theme)
                : _getUnselectedLabelColor(theme),
            style: ListTileStyle.drawer,
            visualDensity: VisualDensity.standard,
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.config.spacing?.itemPadding ?? 16.0,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingNavigation(BuildContext context, ThemeData theme) {
    switch (widget.config.variant) {
      case DSNavigationVariant.bottomBar:
        return Container(
          height:
              widget.height ?? widget.config.spacing?.bottomBarHeight ?? 80.0,
          color: _getBackgroundColor(theme),
          child: Center(
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          ),
        );
      case DSNavigationVariant.rail:
        return Container(
          width: widget.width ?? widget.config.spacing?.railWidth ?? 72.0,
          color: _getBackgroundColor(theme),
          child: Center(
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          ),
        );
      case DSNavigationVariant.drawer:
      case DSNavigationVariant.permanentDrawer:
        return Container(
          width: widget.width ?? widget.config.spacing?.drawerWidth ?? 256.0,
          color: _getBackgroundColor(theme),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Cargando navegación...',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _buildSkeletonNavigation(BuildContext context, ThemeData theme) {
    final itemCount = widget.config.destinations.isNotEmpty
        ? widget.config.destinations.length
        : 4;

    switch (widget.config.variant) {
      case DSNavigationVariant.bottomBar:
        return Container(
          height:
              widget.height ?? widget.config.spacing?.bottomBarHeight ?? 80.0,
          color: _getBackgroundColor(theme),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(itemCount, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 12,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      case DSNavigationVariant.rail:
        return Container(
          width: widget.width ?? widget.config.spacing?.railWidth ?? 72.0,
          color: _getBackgroundColor(theme),
          child: Column(
            children: List.generate(itemCount, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }),
          ),
        );
      case DSNavigationVariant.drawer:
      case DSNavigationVariant.permanentDrawer:
        return Container(
          width: widget.width ?? widget.config.spacing?.drawerWidth ?? 256.0,
          color: _getBackgroundColor(theme),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 80,
                      height: 16,
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
    }
  }

  Widget _buildIconWithBadge(
    DSNavigationDestination destination,
    int index,
    bool isSelected,
  ) {
    final icon = isSelected
        ? (destination.selectedIcon ?? destination.icon)
        : destination.icon;

    final badge = _getBadgeForDestination(destination.id);
    if (badge == null || !badge.isVisible) {
      return icon;
    }

    return Badge(
      label: _buildBadgeContent(badge),
      backgroundColor: badge.backgroundColor,
      textColor: badge.textColor,
      isLabelVisible: badge.isVisible,
      child: icon,
    );
  }

  Widget? _buildBadgeContent(DSNavigationBadge badge) {
    switch (badge.type) {
      case DSNavigationBadgeType.dot:
        return null; // Badge sin contenido muestra un punto
      case DSNavigationBadgeType.count:
        final count = badge.count;
        final maxCount = badge.maxCount;
        final displayText = count > maxCount ? '$maxCount+' : count.toString();
        return Text(displayText);
      case DSNavigationBadgeType.text:
        return Text(badge.text ?? '');
    }
  }

  void _handleDestinationTap(int index) {
    if (index < 0 || index >= _getDestinations().length) return;

    final destination = _getDestinations()[index];
    if (destination.disabled || !widget.config.state.isInteractive) return;

    // Haptic feedback
    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    // Ejecutar callback del destino si existe
    destination.onTap?.call();

    // Notificar cambio de selección
    final callback = widget.onDestinationSelected ?? widget.config.onTap;
    callback?.call(index);

    // Animar selección si es diferente
    if (index != _currentIndex) {
      _animateSelection(index);
    }
  }

  void _setHovered(String destinationId, bool isHovered) {
    if (widget.config.state.isInteractive) {
      setState(() {
        _hoveredItems[destinationId] = isHovered;
      });
    }
  }

  List<DSNavigationDestination> _getDestinations() {
    return widget.destinations ?? widget.config.destinations;
  }

  DSNavigationBadge? _getBadgeForDestination(String destinationId) {
    final badges = widget.badges ?? widget.config.badges;
    return badges.cast<DSNavigationBadge?>().firstWhere(
          (badge) => badge?.destinationId == destinationId,
          orElse: () => null,
        );
  }

  NavigationRailLabelType _getRailLabelType() {
    final behavior = widget.config.behavior?.labelBehavior ??
        DSNavigationLabelBehavior.alwaysShow;

    switch (behavior) {
      case DSNavigationLabelBehavior.alwaysShow:
        return NavigationRailLabelType.all;
      case DSNavigationLabelBehavior.alwaysHide:
        return NavigationRailLabelType.none;
      case DSNavigationLabelBehavior.showSelected:
        return NavigationRailLabelType.selected;
      case DSNavigationLabelBehavior.auto:
        return Responsive.isDesktop(context)
            ? NavigationRailLabelType.all
            : NavigationRailLabelType.selected;
    }
  }

  // Color getters
  Color? _getBackgroundColor(ThemeData theme) {
    return widget.backgroundColor ??
        widget.config.colors?.backgroundColor ??
        theme.navigationBarTheme.backgroundColor;
  }

  Color? _getSelectedItemColor(ThemeData theme) {
    return widget.config.colors?.selectedItemColor ??
        theme.navigationBarTheme.indicatorColor;
  }

  Color? _getSelectedIconColor(ThemeData theme) {
    return widget.config.colors?.selectedIconColor ??
        theme.colorScheme.onSurface;
  }

  Color? _getUnselectedIconColor(ThemeData theme) {
    return widget.config.colors?.unselectedIconColor ??
        theme.colorScheme.onSurface;
  }

  Color? _getSelectedLabelColor(ThemeData theme) {
    return widget.config.colors?.selectedLabelColor ??
        theme.colorScheme.onSurface;
  }

  Color? _getUnselectedLabelColor(ThemeData theme) {
    return widget.config.colors?.unselectedLabelColor ??
        theme.colorScheme.onSurface;
  }

  Color? _getIndicatorColor(ThemeData theme) {
    return widget.config.colors?.indicatorColor ??
        theme.navigationRailTheme.indicatorColor;
  }

  Color? _getSurfaceTintColor(ThemeData theme) {
    return widget.surfaceTintColor ?? widget.config.colors?.surfaceTintColor;
  }

  Color? _getShadowColor(ThemeData theme) {
    return widget.shadowColor ?? widget.config.colors?.shadowColor;
  }

  // Other getters
  double _getElevation() {
    return widget.elevation ?? widget.config.elevation?.defaultElevation ?? 8.0;
  }

  double _getDrawerElevation() {
    return widget.config.elevation?.drawerElevation ?? 16.0;
  }

  NavigationDestinationLabelBehavior _getLabelBehavior() {
    final behavior = widget.config.behavior?.labelBehavior;
    switch (behavior) {
      case DSNavigationLabelBehavior.alwaysShow:
        return NavigationDestinationLabelBehavior.alwaysShow;
      case DSNavigationLabelBehavior.alwaysHide:
        return NavigationDestinationLabelBehavior.alwaysHide;
      case DSNavigationLabelBehavior.showSelected:
        return NavigationDestinationLabelBehavior.onlyShowSelected;
      case DSNavigationLabelBehavior.auto:
      case null:
        return NavigationDestinationLabelBehavior.alwaysShow;
    }
  }
}
