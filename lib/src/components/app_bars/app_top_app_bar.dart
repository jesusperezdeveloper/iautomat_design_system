import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/responsive.dart';
import 'app_top_app_bar_config.dart';

class AppTopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final AppTopAppBarConfig config;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;

  const AppTopAppBar({
    super.key,
    this.config = const AppTopAppBarConfig(),
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
  });

  @override
  Size get preferredSize {
    final height = toolbarHeight ??
        config.spacing?.minHeight ??
        config.variant.preferredHeight;
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(height + bottomHeight);
  }

  @override
  State<AppTopAppBar> createState() => _AppTopAppBarState();
}

class _AppTopAppBarState extends State<AppTopAppBar>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _handleInitialState();
  }

  @override
  void didUpdateWidget(AppTopAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.state != widget.config.state) {
      _handleStateChange();
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    _stateAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
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
  }

  void _handleInitialState() {
    switch (widget.config.state) {
      case AppTopAppBarState.loading:
        _setLoadingState();
        break;
      case AppTopAppBarState.skeleton:
        _stateAnimationController.forward();
        break;
      default:
        _stateAnimationController.forward();
    }
  }

  void _handleStateChange() {
    switch (widget.config.state) {
      case AppTopAppBarState.loading:
        _setLoadingState();
        break;
      case AppTopAppBarState.skeleton:
        setState(() {
          _isLoading = false;
        });
        _stateAnimationController.forward();
        break;
      case AppTopAppBarState.disabled:
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
    }
  }

  void _setLoadingState() {
    setState(() {
      _isLoading = true;
    });
    _stateAnimationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl =
        widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: 'Top App Bar',
        enabled: widget.config.enableA11y,
        header: true,
        child: AnimatedBuilder(
          animation: _stateAnimationController,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value * widget.config.state.opacity,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: _buildAppBarVariant(context, theme, isRtl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBarVariant(
      BuildContext context, ThemeData theme, bool isRtl) {
    switch (widget.config.variant) {
      case AppTopAppBarVariant.primary:
        return _buildPrimaryAppBar(context, theme, isRtl);
      case AppTopAppBarVariant.center:
        return _buildCenterAppBar(context, theme, isRtl);
      case AppTopAppBarVariant.large:
        return _buildLargeAppBar(context, theme, isRtl);
      case AppTopAppBarVariant.collapsed:
        return _buildCollapsedAppBar(context, theme, isRtl);
    }
  }

  Widget _buildPrimaryAppBar(
      BuildContext context, ThemeData theme, bool isRtl) {
    return AppBar(
      title: _buildTitle(context, theme),
      actions: _buildActions(context, theme),
      leading: _buildLeading(context, theme),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      bottom: widget.bottom,
      elevation: _getElevation(theme),
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      iconTheme: _getIconTheme(theme),
      actionsIconTheme: _getActionsIconTheme(theme),
      primary: widget.primary,
      centerTitle: widget.centerTitle ?? widget.config.variant.centerTitle,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: _getTitleSpacing(),
      toolbarHeight: _getToolbarHeight() ?? kToolbarHeight,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: _getToolbarTextStyle(theme),
      titleTextStyle: _getTitleTextStyle(theme),
      systemOverlayStyle: widget.systemOverlayStyle,
      forceMaterialTransparency: widget.forceMaterialTransparency,
      clipBehavior: widget.clipBehavior,
    );
  }

  Widget _buildCenterAppBar(BuildContext context, ThemeData theme, bool isRtl) {
    return AppBar(
      title: _buildTitle(context, theme),
      actions: _buildActions(context, theme),
      leading: _buildLeading(context, theme),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      bottom: widget.bottom,
      elevation: _getElevation(theme),
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      iconTheme: _getIconTheme(theme),
      actionsIconTheme: _getActionsIconTheme(theme),
      primary: widget.primary,
      centerTitle: true,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: _getTitleSpacing(),
      toolbarHeight: _getToolbarHeight() ?? kToolbarHeight,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: _getToolbarTextStyle(theme),
      titleTextStyle: _getTitleTextStyle(theme),
      systemOverlayStyle: widget.systemOverlayStyle,
      forceMaterialTransparency: widget.forceMaterialTransparency,
      clipBehavior: widget.clipBehavior,
    );
  }

  Widget _buildLargeAppBar(BuildContext context, ThemeData theme, bool isRtl) {
    return SliverAppBar.large(
      title: _buildTitle(context, theme),
      actions: _buildActions(context, theme),
      leading: _buildLeading(context, theme),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      iconTheme: _getIconTheme(theme),
      actionsIconTheme: _getActionsIconTheme(theme),
      primary: widget.primary,
      centerTitle: widget.centerTitle ?? widget.config.variant.centerTitle,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: _getTitleSpacing(),
      toolbarHeight: _getToolbarHeight() ?? kToolbarHeight,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: _getToolbarTextStyle(theme),
      titleTextStyle: _getTitleTextStyle(theme),
      systemOverlayStyle: widget.systemOverlayStyle,
      forceMaterialTransparency: widget.forceMaterialTransparency,
      clipBehavior: widget.clipBehavior,
    ) as PreferredSizeWidget;
  }

  Widget _buildCollapsedAppBar(
      BuildContext context, ThemeData theme, bool isRtl) {
    return AppBar(
      title: _buildTitle(context, theme),
      actions: _buildActions(context, theme, maxActions: 2),
      leading: _buildLeading(context, theme),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      bottom: widget.bottom,
      elevation: _getElevation(theme),
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      iconTheme: _getIconTheme(theme),
      actionsIconTheme: _getActionsIconTheme(theme),
      primary: widget.primary,
      centerTitle: widget.centerTitle ?? widget.config.variant.centerTitle,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: _getTitleSpacing(),
      toolbarHeight: 48.0, // Altura fija para collapsed
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: _getToolbarTextStyle(theme),
      titleTextStyle: _getTitleTextStyle(theme)?.copyWith(fontSize: 16),
      systemOverlayStyle: widget.systemOverlayStyle,
      forceMaterialTransparency: widget.forceMaterialTransparency,
      clipBehavior: widget.clipBehavior,
    );
  }

  Widget? _buildTitle(BuildContext context, ThemeData theme) {
    if (_isLoading) {
      return _buildLoadingTitle(context, theme);
    }

    if (widget.config.state == AppTopAppBarState.skeleton) {
      return _buildSkeletonTitle(context, theme);
    }

    // Usar título del config si está disponible
    if (widget.config.title != null) {
      return _buildConfigTitle(context, theme, widget.config.title!);
    }

    // Usar título del widget si está disponible
    return widget.title;
  }

  Widget _buildConfigTitle(
      BuildContext context, ThemeData theme, AppTopAppBarTitle titleConfig) {
    if (titleConfig.customWidget != null) {
      return titleConfig.customWidget!;
    }

    if (titleConfig.text != null) {
      final responsive = Responsive.isMobile(context);
      final titleStyle = _getTitleTextStyle(theme);

      return Text(
        titleConfig.text!,
        style: titleStyle,
        textAlign: titleConfig.alignment,
        maxLines: titleConfig.maxLines ?? (responsive ? 1 : 2),
        overflow: titleConfig.overflow ?? TextOverflow.ellipsis,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildLoadingTitle(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              _getForegroundColor(theme) ?? theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Cargando...',
          style: _getTitleTextStyle(theme),
        ),
      ],
    );
  }

  Widget _buildSkeletonTitle(BuildContext context, ThemeData theme) {
    return Container(
      width: 120,
      height: 20,
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  List<Widget>? _buildActions(BuildContext context, ThemeData theme,
      {int? maxActions}) {
    if (_isLoading) {
      return _buildLoadingActions(context, theme);
    }

    if (widget.config.state == AppTopAppBarState.skeleton) {
      return _buildSkeletonActions(context, theme);
    }

    // Usar acciones del config si están disponibles
    if (widget.config.actions != null) {
      return _buildConfigActions(
          context, theme, widget.config.actions!, maxActions);
    }

    // Usar acciones del widget si están disponibles
    if (widget.actions != null) {
      final actions = widget.actions!;
      final limit = maxActions ?? actions.length;

      if (actions.length <= limit) {
        return actions;
      }

      // Si hay más acciones que el límite, mostrar overflow
      final visibleActions = actions.take(limit - 1).toList();
      visibleActions.add(
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert),
          tooltip: 'Más opciones',
          itemBuilder: (context) {
            return actions
                .skip(limit - 1)
                .toList()
                .asMap()
                .entries
                .map((entry) {
              return PopupMenuItem<int>(
                value: entry.key,
                child: entry.value,
              );
            }).toList();
          },
        ),
      );

      return visibleActions;
    }

    return null;
  }

  List<Widget> _buildConfigActions(
    BuildContext context,
    ThemeData theme,
    AppTopAppBarActions actionsConfig,
    int? maxActions,
  ) {
    final allActions = [
      ...actionsConfig.primary,
      ...actionsConfig.secondary,
    ];

    if (allActions.isEmpty) return [];

    final limit = maxActions ?? actionsConfig.maxPrimary;
    final isInteractive = widget.config.state.isInteractive;

    if (allActions.length <= limit) {
      return allActions
          .map((action) => _buildAction(context, theme, action, isInteractive))
          .toList();
    }

    // Mostrar acciones primarias y overflow
    final visibleActions = allActions.take(limit - 1).toList();
    final overflowActions = allActions.skip(limit - 1).toList();

    final widgets = visibleActions
        .map((action) => _buildAction(context, theme, action, isInteractive))
        .toList();

    if (actionsConfig.showOverflow && overflowActions.isNotEmpty) {
      widgets.add(
        PopupMenuButton<String>(
          icon: actionsConfig.overflowIcon ?? const Icon(Icons.more_vert),
          tooltip: actionsConfig.overflowTooltip ?? 'Más opciones',
          enabled: isInteractive,
          itemBuilder: (context) {
            return overflowActions.map((action) {
              return PopupMenuItem<String>(
                value: action.id,
                enabled: !action.disabled && isInteractive,
                child: ListTile(
                  leading: action.icon,
                  title: Text(action.text ?? action.tooltip ?? action.id),
                  dense: true,
                ),
              );
            }).toList();
          },
          onSelected: (actionId) {
            final action = overflowActions.firstWhere(
              (a) => a.id == actionId,
            );
            if (!action.disabled && isInteractive) {
              action.onPressed?.call();
            }
          },
        ),
      );
    }

    return widgets;
  }

  Widget _buildAction(
    BuildContext context,
    ThemeData theme,
    AppTopAppBarAction action,
    bool isInteractive,
  ) {
    final isEnabled = !action.disabled && isInteractive;

    switch (action.type) {
      case AppTopAppBarActionType.icon:
        return IconButton(
          icon: action.icon ?? const Icon(Icons.help_outline),
          tooltip: action.tooltip,
          onPressed: isEnabled ? action.onPressed : null,
        );
      case AppTopAppBarActionType.text:
        return TextButton(
          onPressed: isEnabled ? action.onPressed : null,
          child: Text(
            action.text ?? action.tooltip ?? action.id,
            style: theme.textTheme.labelLarge?.copyWith(
              color: _getForegroundColor(theme),
            ),
          ),
        );
      case AppTopAppBarActionType.iconText:
        return TextButton.icon(
          icon: action.icon ?? const Icon(Icons.help_outline),
          label: Text(action.text ?? action.tooltip ?? action.id),
          onPressed: isEnabled ? action.onPressed : null,
          style: TextButton.styleFrom(
            foregroundColor: _getForegroundColor(theme),
          ),
        );
    }
  }

  List<Widget> _buildLoadingActions(BuildContext context, ThemeData theme) {
    return [
      SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getForegroundColor(theme) ?? theme.colorScheme.onSurface,
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildSkeletonActions(BuildContext context, ThemeData theme) {
    return List.generate(2, (index) {
      return Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    });
  }

  Widget? _buildLeading(BuildContext context, ThemeData theme) {
    if (widget.leading != null) {
      return widget.leading;
    }

    final navigationIcon = widget.config.navigationIcon;
    if (navigationIcon != null) {
      return _buildNavigationIcon(context, theme, navigationIcon);
    }

    return null;
  }

  Widget _buildNavigationIcon(
    BuildContext context,
    ThemeData theme,
    AppTopAppBarNavigationIcon navigationIcon,
  ) {
    final isEnabled =
        !navigationIcon.disabled && widget.config.state.isInteractive;

    Widget icon;
    switch (navigationIcon.type) {
      case AppTopAppBarNavigationType.auto:
        icon = _getAutoNavigationIcon(context);
        break;
      case AppTopAppBarNavigationType.back:
        icon = const Icon(Icons.arrow_back);
        break;
      case AppTopAppBarNavigationType.close:
        icon = const Icon(Icons.close);
        break;
      case AppTopAppBarNavigationType.menu:
        icon = const Icon(Icons.menu);
        break;
      case AppTopAppBarNavigationType.drawer:
        icon = const Icon(Icons.menu);
        break;
      case AppTopAppBarNavigationType.custom:
        icon = navigationIcon.icon ?? const Icon(Icons.arrow_back);
        break;
    }

    if (navigationIcon.icon != null) {
      icon = navigationIcon.icon!;
    }

    return IconButton(
      icon: icon,
      tooltip: navigationIcon.tooltip,
      onPressed: isEnabled ? navigationIcon.onPressed : null,
    );
  }

  Widget _getAutoNavigationIcon(BuildContext context) {
    final parentRoute = ModalRoute.of(context);
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    if (useCloseButton) {
      return const Icon(Icons.close);
    }

    if (Navigator.canPop(context)) {
      return const Icon(Icons.arrow_back);
    }

    if (Scaffold.hasDrawer(context)) {
      return const Icon(Icons.menu);
    }

    return const SizedBox.shrink();
  }

  double? _getElevation(ThemeData theme) {
    if (widget.elevation != null) return widget.elevation;

    final elevationConfig = widget.config.elevation;
    if (elevationConfig != null) {
      return elevationConfig.defaultElevation;
    }

    return theme.appBarTheme.elevation;
  }

  Color? _getBackgroundColor(ThemeData theme) {
    if (widget.backgroundColor != null) return widget.backgroundColor;

    final colorsConfig = widget.config.colors;
    if (colorsConfig?.backgroundColor != null) {
      return colorsConfig!.backgroundColor;
    }

    return theme.appBarTheme.backgroundColor;
  }

  Color? _getForegroundColor(ThemeData theme) {
    if (widget.foregroundColor != null) return widget.foregroundColor;

    final colorsConfig = widget.config.colors;
    if (colorsConfig?.foregroundColor != null) {
      return colorsConfig!.foregroundColor;
    }

    return theme.appBarTheme.foregroundColor;
  }

  IconThemeData? _getIconTheme(ThemeData theme) {
    if (widget.iconTheme != null) return widget.iconTheme;

    final colorsConfig = widget.config.colors;
    if (colorsConfig?.iconColor != null) {
      return IconThemeData(color: colorsConfig!.iconColor);
    }

    return theme.appBarTheme.iconTheme;
  }

  IconThemeData? _getActionsIconTheme(ThemeData theme) {
    if (widget.actionsIconTheme != null) return widget.actionsIconTheme;

    final colorsConfig = widget.config.colors;
    if (colorsConfig?.iconColor != null) {
      return IconThemeData(color: colorsConfig!.iconColor);
    }

    return theme.appBarTheme.actionsIconTheme;
  }

  double? _getTitleSpacing() {
    if (widget.titleSpacing != null) return widget.titleSpacing;

    final spacingConfig = widget.config.spacing;
    if (spacingConfig != null) {
      return spacingConfig.titlePadding;
    }

    return null;
  }

  double? _getToolbarHeight() {
    if (widget.toolbarHeight != null) return widget.toolbarHeight;

    final spacingConfig = widget.config.spacing;
    if (spacingConfig != null) {
      return spacingConfig.minHeight;
    }

    return widget.config.variant.preferredHeight;
  }

  TextStyle? _getToolbarTextStyle(ThemeData theme) {
    if (widget.toolbarTextStyle != null) return widget.toolbarTextStyle;

    final typographyConfig = widget.config.typography;
    if (typographyConfig?.actionStyle != null) {
      return typographyConfig!.actionStyle;
    }

    return theme.appBarTheme.toolbarTextStyle;
  }

  TextStyle? _getTitleTextStyle(ThemeData theme) {
    if (widget.titleTextStyle != null) return widget.titleTextStyle;

    final typographyConfig = widget.config.typography;
    if (typographyConfig?.titleStyle != null) {
      return typographyConfig!.titleStyle;
    }

    return theme.appBarTheme.titleTextStyle;
  }
}
