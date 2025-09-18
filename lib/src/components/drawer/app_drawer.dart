import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

// Enums para las variantes y estados del drawer
enum DrawerVariant {
  modal,
  permanent,
}

enum AppDrawerState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DrawerSide {
  left,
  right,
}

/// Widget principal del drawer
class AppDrawer extends StatefulWidget {
  /// Constructor para variante modal
  const AppDrawer.modal({
    super.key,
    required this.content,
    this.side = DrawerSide.left,
    this.width = 280.0,
    this.state = AppDrawerState.defaultState,
    this.backgroundColor,
    this.surfaceColor,
    this.shadowColor,
    this.dividerColor,
    this.elevation = 16.0,
    this.borderRadius = 0.0,
    this.scrimOpacity = 0.5,
    this.animationDuration = const Duration(milliseconds: 250),
    this.onStateChanged,
    this.onVisibilityChanged,
    this.semanticsLabel,
    this.restorationId,
    this.enableDragGesture = true,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : variant = DrawerVariant.modal;

  /// Constructor para variante permanent
  const AppDrawer.permanent({
    super.key,
    required this.content,
    this.side = DrawerSide.left,
    this.width = 280.0,
    this.state = AppDrawerState.defaultState,
    this.backgroundColor,
    this.surfaceColor,
    this.shadowColor,
    this.dividerColor,
    this.elevation = 0.0,
    this.borderRadius = 0.0,
    this.scrimOpacity = 0.0,
    this.animationDuration = Duration.zero,
    this.onStateChanged,
    this.onVisibilityChanged,
    this.semanticsLabel,
    this.restorationId,
    this.enableDragGesture = false,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : variant = DrawerVariant.permanent;

  final DrawerVariant variant;
  final Widget content;
  final DrawerSide side;
  final double width;
  final AppDrawerState state;

  // Design tokens - Colors
  final Color? backgroundColor;
  final Color? surfaceColor;
  final Color? shadowColor;
  final Color? dividerColor;

  // Design tokens - Layout & Styling
  final double elevation;
  final double borderRadius;
  final double scrimOpacity;
  final Duration animationDuration;

  // Callbacks
  final void Function(AppDrawerState state)? onStateChanged;
  final void Function(bool visible)? onVisibilityChanged;

  // Comportamiento
  final bool enableDragGesture;
  final DragStartBehavior dragStartBehavior;

  // Accesibilidad
  final String? semanticsLabel;
  final String? restorationId;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  late RestorableBool _isOpen;
  bool _isOpenFallback = false;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    if (widget.restorationId != null) {
      registerForRestoration(_isOpen, 'is_open');
    }
  }

  bool get isOpen => widget.restorationId != null ? _isOpen.value : _isOpenFallback;

  void setOpen(bool value) {
    if (widget.restorationId != null) {
      _isOpen.value = value;
    } else {
      setState(() {
        _isOpenFallback = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // Inicializar RestorableBool solo si tenemos restorationId
    if (widget.restorationId != null) {
      _isOpen = RestorableBool(false);
    }

    _initializeAnimations();
    _focusNode.addListener(_onFocusChanged);

    if (widget.variant == DrawerVariant.permanent) {
      setOpen(true);
    }

    if (widget.onVisibilityChanged != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onVisibilityChanged!(isOpen);
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    if (widget.restorationId != null) {
      _isOpen.dispose();
    }
    super.dispose();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.variant == DrawerVariant.permanent) {
      _animationController.value = 1.0;
    }
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    if (_isFocused) {
      widget.onStateChanged?.call(AppDrawerState.focus);
    } else {
      widget.onStateChanged?.call(AppDrawerState.defaultState);
    }
  }

  void _handleHover(bool hovering) {
    if (widget.state == AppDrawerState.disabled) return;

    if (hovering) {
      widget.onStateChanged?.call(AppDrawerState.hover);
    } else if (!_isFocused) {
      widget.onStateChanged?.call(AppDrawerState.defaultState);
    }
  }

  void _handleTap() {
    if (widget.state == AppDrawerState.disabled) return;

    widget.onStateChanged?.call(AppDrawerState.pressed);

    // Reset to default state after a short delay
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        widget.onStateChanged?.call(AppDrawerState.defaultState);
      }
    });
  }

  void _handleKeyEvent(KeyEvent event) {
    if (widget.state == AppDrawerState.disabled) return;
    if (event is! KeyDownEvent) return;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.escape:
        if (widget.variant == DrawerVariant.modal && isOpen) {
          close();
        }
        break;
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        _handleTap();
        break;
    }
  }

  /// Abre el drawer
  void open() {
    if (widget.variant == DrawerVariant.permanent) return;

    setState(() {
      setOpen(true);
    });

    _animationController.forward();
    widget.onVisibilityChanged?.call(true);
  }

  /// Cierra el drawer
  void close() {
    if (widget.variant == DrawerVariant.permanent) return;

    setState(() {
      setOpen(false);
    });

    _animationController.reverse();
    widget.onVisibilityChanged?.call(false);
  }

  /// Alterna el estado del drawer
  void toggle() {
    if (isOpen) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.variant == DrawerVariant.permanent) {
      return _buildPermanentDrawer(context);
    } else {
      return _buildModalDrawer(context);
    }
  }

  Widget _buildPermanentDrawer(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel ?? 'Drawer de navegación',
      child: Container(
        width: widget.width,
        decoration: _getDrawerDecoration(context),
        child: _buildDrawerContent(context),
      ),
    );
  }

  Widget _buildModalDrawer(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            // Scrim (fondo semi-transparente)
            if (_animation.value > 0)
              GestureDetector(
                onTap: close,
                child: Container(
                  color: Colors.black.withValues(
                    alpha: widget.scrimOpacity * _animation.value,
                  ),
                ),
              ),

            // Drawer deslizante
            Positioned(
              left: widget.side == DrawerSide.left
                ? (_animation.value - 1) * widget.width
                : null,
              right: widget.side == DrawerSide.right
                ? (_animation.value - 1) * widget.width
                : null,
              top: 0,
              bottom: 0,
              width: widget.width,
              child: GestureDetector(
                onTap: _handleTap,
                onPanUpdate: widget.enableDragGesture ? _handlePanUpdate : null,
                onPanEnd: widget.enableDragGesture ? _handlePanEnd : null,
                child: MouseRegion(
                  onEnter: (_) => _handleHover(true),
                  onExit: (_) => _handleHover(false),
                  child: Focus(
                    focusNode: _focusNode,
                    onKeyEvent: (node, event) {
                      _handleKeyEvent(event);
                      return KeyEventResult.handled;
                    },
                    child: Semantics(
                      label: widget.semanticsLabel ?? 'Drawer de navegación modal',
                      child: Container(
                        decoration: _getDrawerDecoration(context),
                        child: _buildDrawerContent(context),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    if (widget.state == AppDrawerState.loading) {
      return _buildLoadingState(context);
    }

    if (widget.state == AppDrawerState.skeleton) {
      return _buildSkeletonState(context);
    }

    return Material(
      color: Colors.transparent,
      child: widget.content,
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: _getProgressIndicatorColor(context),
          ),
          const SizedBox(height: 16),
          Text(
            'Cargando...',
            style: TextStyle(
              color: _getTextColor(context),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header skeleton
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),

          // Menu items skeleton
          ...List.generate(6, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (widget.state == AppDrawerState.disabled) return;

    final delta = details.primaryDelta ?? 0;
    final screenWidth = MediaQuery.of(context).size.width;

    double progress = _animationController.value;

    if (widget.side == DrawerSide.left) {
      progress += delta / screenWidth;
    } else {
      progress -= delta / screenWidth;
    }

    _animationController.value = progress.clamp(0.0, 1.0);
  }

  void _handlePanEnd(DragEndDetails details) {
    if (widget.state == AppDrawerState.disabled) return;

    final velocity = details.velocity.pixelsPerSecond.dx;

    bool shouldOpen = false;

    if (widget.side == DrawerSide.left) {
      shouldOpen = velocity > 0 || _animationController.value > 0.5;
    } else {
      shouldOpen = velocity < 0 || _animationController.value > 0.5;
    }

    if (shouldOpen) {
      open();
    } else {
      close();
    }
  }

  BoxDecoration _getDrawerDecoration(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BoxDecoration(
      color: _getBackgroundColor(colorScheme),
      borderRadius: widget.side == DrawerSide.left
        ? BorderRadius.only(
            topRight: Radius.circular(widget.borderRadius),
            bottomRight: Radius.circular(widget.borderRadius),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(widget.borderRadius),
            bottomLeft: Radius.circular(widget.borderRadius),
          ),
      boxShadow: widget.elevation > 0 ? [
        BoxShadow(
          color: _getShadowColor(colorScheme),
          blurRadius: widget.elevation,
          offset: Offset(
            widget.side == DrawerSide.left ? widget.elevation / 2 : -widget.elevation / 2,
            0,
          ),
        ),
      ] : null,
      border: widget.dividerColor != null ? Border(
        right: widget.side == DrawerSide.left
          ? BorderSide(color: widget.dividerColor!)
          : BorderSide.none,
        left: widget.side == DrawerSide.right
          ? BorderSide(color: widget.dividerColor!)
          : BorderSide.none,
      ) : null,
    );
  }

  // Theme helpers
  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.state) {
      case AppDrawerState.hover:
        return colorScheme.surface;
      case AppDrawerState.pressed:
        return colorScheme.surfaceContainerHighest;
      case AppDrawerState.focus:
        return colorScheme.surface;
      case AppDrawerState.selected:
        return colorScheme.surfaceContainerHigh;
      case AppDrawerState.disabled:
        return colorScheme.surface.withValues(alpha: 0.6);
      default:
        return widget.surfaceColor ?? colorScheme.surface;
    }
  }

  Color _getShadowColor(ColorScheme colorScheme) {
    return widget.shadowColor ?? colorScheme.shadow.withValues(alpha: 0.15);
  }

  Color _getTextColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (widget.state == AppDrawerState.disabled) {
      return colorScheme.onSurface.withValues(alpha: 0.38);
    }

    return colorScheme.onSurface;
  }

  Color _getProgressIndicatorColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  /// Verifica si el drawer está cerrado
  bool get isClosed => !isOpen;
}

/// Controller para manejar el drawer desde el exterior
class AppDrawerController extends ChangeNotifier {
  final GlobalKey<_AppDrawerState> _key = GlobalKey<_AppDrawerState>();

  GlobalKey get key => _key;

  /// Abre el drawer
  void open() {
    _key.currentState?.open();
    notifyListeners();
  }

  /// Cierra el drawer
  void close() {
    _key.currentState?.close();
    notifyListeners();
  }

  /// Alterna el estado del drawer
  void toggle() {
    _key.currentState?.toggle();
    notifyListeners();
  }

  /// Verifica si el drawer está abierto
  bool get isOpen => _key.currentState?.isOpen ?? false;

  /// Verifica si el drawer está cerrado
  bool get isClosed => _key.currentState?.isClosed ?? true;
}

/// Widget helper para usar el drawer en un Scaffold
class AppDrawerHelper {
  /// Crea un drawer modal para usar en Scaffold
  static Widget createModalDrawer({
    required Widget content,
    DrawerSide side = DrawerSide.left,
    double width = 280.0,
    AppDrawerState state = AppDrawerState.defaultState,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? dividerColor,
    double elevation = 16.0,
    double borderRadius = 0.0,
    double scrimOpacity = 0.5,
    Duration animationDuration = const Duration(milliseconds: 250),
    void Function(AppDrawerState state)? onStateChanged,
    void Function(bool visible)? onVisibilityChanged,
    String? semanticsLabel,
    String? restorationId,
    bool enableDragGesture = true,
  }) {
    return AppDrawer.modal(
      content: content,
      side: side,
      width: width,
      state: state,
      backgroundColor: backgroundColor,
      surfaceColor: surfaceColor,
      shadowColor: shadowColor,
      dividerColor: dividerColor,
      elevation: elevation,
      borderRadius: borderRadius,
      scrimOpacity: scrimOpacity,
      animationDuration: animationDuration,
      onStateChanged: onStateChanged,
      onVisibilityChanged: onVisibilityChanged,
      semanticsLabel: semanticsLabel,
      restorationId: restorationId,
      enableDragGesture: enableDragGesture,
    );
  }

  /// Crea un drawer permanente para layouts de escritorio
  static Widget createPermanentDrawer({
    required Widget content,
    DrawerSide side = DrawerSide.left,
    double width = 280.0,
    AppDrawerState state = AppDrawerState.defaultState,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? dividerColor,
    double elevation = 0.0,
    double borderRadius = 0.0,
    void Function(AppDrawerState state)? onStateChanged,
    void Function(bool visible)? onVisibilityChanged,
    String? semanticsLabel,
    String? restorationId,
  }) {
    return AppDrawer.permanent(
      content: content,
      side: side,
      width: width,
      state: state,
      backgroundColor: backgroundColor,
      surfaceColor: surfaceColor,
      shadowColor: shadowColor,
      dividerColor: dividerColor,
      elevation: elevation,
      borderRadius: borderRadius,
      onStateChanged: onStateChanged,
      onVisibilityChanged: onVisibilityChanged,
      semanticsLabel: semanticsLabel,
      restorationId: restorationId,
    );
  }
}