import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_fab_config.dart';

class AppFab extends StatefulWidget {
  final AppFabConfig config;
  final Widget? icon;
  final String? label;
  final AppFabLocation? location;
  final String? heroTag;
  final String? tooltip;

  const AppFab({
    super.key,
    this.config = const AppFabConfig(),
    this.icon,
    this.label,
    this.location,
    this.heroTag,
    this.tooltip,
  });

  @override
  State<AppFab> createState() => _AppFabState();
}

class _AppFabState extends State<AppFab>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late AnimationController _hoverAnimationController;
  late AnimationController _pressAnimationController;
  late AnimationController _rotationController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _rotationAnimation;

  bool _isHovering = false;
  bool _isFocused = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupFocus();

    if (widget.config.animation?.enableEntryAnimation == true) {
      _animateEntry();
    }
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
      vsync: this,
    );

    _hoverAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _pressAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverAnimationController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));
  }

  void _setupFocus() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
      widget.config.onFocusChange?.call(_focusNode.hasFocus);
    });
  }

  void _animateEntry() {
    _stateAnimationController.forward();
  }

  @override
  void didUpdateWidget(AppFab oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case AppFabState.loading:
        _rotationController.repeat();
        break;
      case AppFabState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case AppFabState.disabled:
        _stateAnimationController.animateTo(0.6);
        break;
      default:
        if (!_stateAnimationController.isCompleted) {
          _stateAnimationController.forward();
        }
        break;
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _hoverAnimationController.dispose();
    _pressAnimationController.dispose();
    _rotationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl = widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: widget.config.enableA11y ? (widget.label ?? 'Floating Action Button') : null,
        button: widget.config.enableA11y,
        enabled: widget.config.state.canInteract,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _stateAnimationController,
            _hoverAnimationController,
            _pressAnimationController,
            _rotationController,
          ]),
          builder: (context, child) {
            return ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedOpacity(
                opacity: widget.config.state.opacity,
                duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
                child: _buildFabVariant(theme, isRtl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    final size = widget.config.variant.getSize(widget.config.spacing ?? const AppFabSpacing());
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        shape: widget.config.variant.isExtended ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: widget.config.variant.isExtended
          ? BorderRadius.circular(widget.config.spacing?.borderRadius ?? 16.0)
          : null,
        boxShadow: [
          BoxShadow(
            color: _getShadowColor(theme),
            blurRadius: _getElevation() * 2,
            spreadRadius: _getElevation() * 0.5,
            offset: Offset(0, _getElevation()),
          ),
        ],
      ),
      child: Center(
        child: Transform.rotate(
          angle: _rotationAnimation.value * 2 * 3.14159,
          child: SizedBox(
            width: widget.config.variant.iconSize,
            height: widget.config.variant.iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.config.colors?.loadingColor ?? theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    final size = widget.config.variant.getSize(widget.config.spacing ?? const AppFabSpacing());
    return AnimatedBuilder(
      animation: _stateAnimationController,
      builder: (context, child) {
        return Container(
          width: widget.config.variant.isExtended ? size * 2 : size,
          height: size,
          decoration: BoxDecoration(
            color: widget.config.colors?.skeletonColor ?? Colors.grey[300],
            shape: widget.config.variant.isExtended ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: widget.config.variant.isExtended
              ? BorderRadius.circular(widget.config.spacing?.borderRadius ?? 16.0)
              : null,
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withValues(alpha: 0.3),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1.0 + (_stateAnimationController.value * 2), 0.0),
              end: Alignment(1.0 + (_stateAnimationController.value * 2), 0.0),
            ),
          ),
        );
      },
    );
  }

  double _getElevation() {
    final baseElevation = widget.config.elevation?.defaultElevation ?? 6.0;

    if (!widget.config.state.canInteract) {
      return widget.config.elevation?.disabledElevation ?? 0.0;
    }

    final stateMultiplier = widget.config.state.elevationMultiplier;
    final animationMultiplier = _elevationAnimation.value;

    return baseElevation * stateMultiplier * (1.0 + animationMultiplier);
  }

  Widget _buildFabVariant(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    Widget fab = _buildInteractiveFab(theme, isRtl);

    if (widget.config.enableKeyboardSupport) {
      fab = Focus(
          onKeyEvent: _handleKeyEvent,
        child: fab,
      );
    }

    if (widget.tooltip != null) {
      fab = Tooltip(
        message: widget.tooltip!,
        child: fab,
      );
    }

    return fab;
  }

  Widget _buildInteractiveFab(ThemeData theme, bool isRtl) {
    Widget content = _buildFabContent(theme, isRtl);

    switch (widget.config.variant) {
      case AppFabVariant.regular:
        return _buildRegularFab(content, theme);
      case AppFabVariant.small:
        return _buildSmallFab(content, theme);
      case AppFabVariant.large:
        return _buildLargeFab(content, theme);
      case AppFabVariant.extended:
        return _buildExtendedFab(content, theme, isRtl);
    }
  }

  Widget _buildRegularFab(Widget content, ThemeData theme) {
    Widget fab = FloatingActionButton(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      elevation: _getElevation(),
      hoverElevation: widget.config.elevation?.hoveredElevation,
      focusElevation: widget.config.elevation?.focusedElevation,
      highlightElevation: widget.config.elevation?.pressedElevation,
      disabledElevation: widget.config.elevation?.disabledElevation,
      heroTag: widget.heroTag,
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );

    if (widget.config.behavior?.enableHover == true) {
      fab = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        child: fab,
      );
    }

    return fab;
  }

  Widget _buildSmallFab(Widget content, ThemeData theme) {
    Widget fab = FloatingActionButton.small(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      elevation: _getElevation(),
      hoverElevation: widget.config.elevation?.hoveredElevation,
      focusElevation: widget.config.elevation?.focusedElevation,
      highlightElevation: widget.config.elevation?.pressedElevation,
      disabledElevation: widget.config.elevation?.disabledElevation,
      heroTag: widget.heroTag,
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );

    if (widget.config.behavior?.enableHover == true) {
      fab = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        child: fab,
      );
    }

    return fab;
  }

  Widget _buildLargeFab(Widget content, ThemeData theme) {
    Widget fab = FloatingActionButton.large(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      elevation: _getElevation(),
      hoverElevation: widget.config.elevation?.hoveredElevation,
      focusElevation: widget.config.elevation?.focusedElevation,
      highlightElevation: widget.config.elevation?.pressedElevation,
      disabledElevation: widget.config.elevation?.disabledElevation,
      heroTag: widget.heroTag,
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );

    if (widget.config.behavior?.enableHover == true) {
      fab = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        child: fab,
      );
    }

    return fab;
  }

  Widget _buildExtendedFab(Widget content, ThemeData theme, bool isRtl) {
    Widget fab = FloatingActionButton.extended(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      elevation: _getElevation(),
      hoverElevation: widget.config.elevation?.hoveredElevation,
      focusElevation: widget.config.elevation?.focusedElevation,
      highlightElevation: widget.config.elevation?.pressedElevation,
      disabledElevation: widget.config.elevation?.disabledElevation,
      heroTag: widget.heroTag,
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      icon: widget.icon,
      label: Text(widget.label ?? 'Action'),
    );

    if (widget.config.behavior?.enableHover == true) {
      fab = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        child: fab,
      );
    }

    return fab;
  }

  Widget _buildFabContent(ThemeData theme, bool isRtl) {
    if (widget.config.variant.isExtended) {
      // Extended FAB content is handled by FloatingActionButton.extended
      return const SizedBox.shrink();
    }

    // Regular, Small, and Large FABs
    Widget iconWidget = widget.icon ?? Icon(
      Icons.add,
      size: widget.config.variant.iconSize,
    );

    if (widget.config.state == AppFabState.loading) {
      return SizedBox(
        width: widget.config.variant.iconSize,
        height: widget.config.variant.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getForegroundColor(theme),
          ),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
      child: iconWidget,
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (widget.config.state == AppFabState.disabled) {
      return widget.config.colors?.disabledColor ??
             theme.colorScheme.onSurface.withValues(alpha: 0.12);
    }


    if (_isHovering && widget.config.state.canInteract) {
      return widget.config.colors?.hoverColor ??
             theme.colorScheme.primaryContainer;
    }

    if (_isFocused && widget.config.state.canInteract) {
      return widget.config.colors?.focusColor ??
             theme.colorScheme.primaryContainer;
    }

    if (widget.config.state == AppFabState.selected) {
      return widget.config.colors?.selectedColor ??
             theme.colorScheme.secondaryContainer;
    }

    return widget.config.colors?.backgroundColor ??
           theme.colorScheme.primaryContainer;
  }

  Color _getForegroundColor(ThemeData theme) {
    if (widget.config.state == AppFabState.disabled) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.38);
    }

    return widget.config.colors?.foregroundColor ??
           theme.colorScheme.onPrimaryContainer;
  }

  Color _getShadowColor(ThemeData theme) {
    return widget.config.elevation?.shadowColor ??
           widget.config.colors?.shadowColor ??
           theme.colorScheme.shadow;
  }

  void _handleTap() {
    if (widget.config.behavior?.enableHapticFeedback == true) {
      HapticFeedback.lightImpact();
    }

    if (widget.config.animation?.type == AppFabAnimationType.rotation) {
      _rotationController.forward(from: 0.0);
    } else if (widget.config.animation?.type == AppFabAnimationType.scale) {
      _pressAnimationController.forward().then((_) {
        _pressAnimationController.reverse();
      });
    }

    widget.config.onPressed?.call();
  }

  void _handleHoverStart() {
    setState(() {
      _isHovering = true;
    });
    widget.config.onHover?.call(true);
    _hoverAnimationController.forward();
  }

  void _handleHoverEnd() {
    setState(() {
      _isHovering = false;
    });
    widget.config.onHover?.call(false);
    _hoverAnimationController.reverse();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!widget.config.state.canInteract) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.space) {
        _handleTap();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }
}

// Widget de conveniencia para usar AppFab en un Scaffold
class AppFabScaffold extends StatelessWidget {
  final AppFab fab;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;

  const AppFabScaffold({
    super.key,
    required this.fab,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: (fab.location ?? fab.config.location).flutterLocation,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      endDrawer: endDrawer,
      backgroundColor: backgroundColor,
    );
  }
}