import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Enumeración que define las variantes del bottom sheet
enum BottomSheetVariant {
  /// Bottom sheet modal que cubre la pantalla completa
  modal,

  /// Bottom sheet que ocupa la mitad de la pantalla
  half,

  /// Bottom sheet que ocupa toda la pantalla disponible
  full,
}

/// Enumeración que define los estados posibles del bottom sheet
enum AppBottomSheetState {
  /// Estado por defecto
  defaultState,

  /// Estado cuando el cursor está sobre el componente
  hover,

  /// Estado cuando el componente está siendo presionado
  pressed,

  /// Estado cuando el componente tiene foco
  focus,

  /// Estado cuando el componente está seleccionado
  selected,

  /// Estado cuando el componente está deshabilitado
  disabled,

  /// Estado de carga
  loading,

  /// Estado esqueleto para loading placeholders
  skeleton,
}

/// Extension para verificar si un estado puede interactuar
extension AppBottomSheetStateExtension on AppBottomSheetState {
  /// Verifica si el estado permite interacciones
  bool get canInteract => !{
        AppBottomSheetState.disabled,
        AppBottomSheetState.loading,
        AppBottomSheetState.skeleton,
      }.contains(this);
}

/// Enumeración para los puntos de anclaje del bottom sheet
enum BottomSheetSnap {
  /// Mínimo (collapsed)
  min,

  /// Medio
  half,

  /// Máximo (expanded)
  max,
}

/// Widget de bottom sheet altamente configurable y accesible
///
/// Proporciona diferentes variantes (modal, half, full) con soporte
/// completo para plataformas, RTL, accesibilidad y Material 3.
class AppBottomSheet extends StatefulWidget {
  /// Constructor principal del bottom sheet
  const AppBottomSheet({
    super.key,
    required this.variant,
    required this.content,
    this.initialSnap = BottomSheetSnap.half,
    this.draggable = true,
    this.state = AppBottomSheetState.defaultState,
    this.backgroundColor,
    this.handleColor,
    this.elevation,
    this.shape,
    this.padding,
    this.minHeight = 100,
    this.maxHeight,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.accessibilityHint,
    this.onStateChange,
    this.onSnapChange,
    this.onDragStart,
    this.onDragEnd,
  });

  /// Factory constructor para crear un bottom sheet modal
  factory AppBottomSheet.modal({
    Key? key,
    required Widget content,
    BottomSheetSnap initialSnap = BottomSheetSnap.half,
    bool draggable = true,
    AppBottomSheetState state = AppBottomSheetState.defaultState,
    Color? backgroundColor,
    Color? handleColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    double minHeight = 100,
    double? maxHeight,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<AppBottomSheetState>? onStateChange,
    ValueChanged<BottomSheetSnap>? onSnapChange,
    VoidCallback? onDragStart,
    VoidCallback? onDragEnd,
  }) {
    return AppBottomSheet(
      key: key,
      variant: BottomSheetVariant.modal,
      content: content,
      initialSnap: initialSnap,
      draggable: draggable,
      state: state,
      backgroundColor: backgroundColor,
      handleColor: handleColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      minHeight: minHeight,
      maxHeight: maxHeight,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
      onSnapChange: onSnapChange,
      onDragStart: onDragStart,
      onDragEnd: onDragEnd,
    );
  }

  /// Factory constructor para crear un bottom sheet de media altura
  factory AppBottomSheet.half({
    Key? key,
    required Widget content,
    BottomSheetSnap initialSnap = BottomSheetSnap.half,
    bool draggable = true,
    AppBottomSheetState state = AppBottomSheetState.defaultState,
    Color? backgroundColor,
    Color? handleColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    double minHeight = 100,
    double? maxHeight,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<AppBottomSheetState>? onStateChange,
    ValueChanged<BottomSheetSnap>? onSnapChange,
    VoidCallback? onDragStart,
    VoidCallback? onDragEnd,
  }) {
    return AppBottomSheet(
      key: key,
      variant: BottomSheetVariant.half,
      content: content,
      initialSnap: initialSnap,
      draggable: draggable,
      state: state,
      backgroundColor: backgroundColor,
      handleColor: handleColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      minHeight: minHeight,
      maxHeight: maxHeight,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
      onSnapChange: onSnapChange,
      onDragStart: onDragStart,
      onDragEnd: onDragEnd,
    );
  }

  /// Factory constructor para crear un bottom sheet de altura completa
  factory AppBottomSheet.full({
    Key? key,
    required Widget content,
    BottomSheetSnap initialSnap = BottomSheetSnap.max,
    bool draggable = true,
    AppBottomSheetState state = AppBottomSheetState.defaultState,
    Color? backgroundColor,
    Color? handleColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    double minHeight = 100,
    double? maxHeight,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<AppBottomSheetState>? onStateChange,
    ValueChanged<BottomSheetSnap>? onSnapChange,
    VoidCallback? onDragStart,
    VoidCallback? onDragEnd,
  }) {
    return AppBottomSheet(
      key: key,
      variant: BottomSheetVariant.full,
      content: content,
      initialSnap: initialSnap,
      draggable: draggable,
      state: state,
      backgroundColor: backgroundColor,
      handleColor: handleColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      minHeight: minHeight,
      maxHeight: maxHeight,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
      onSnapChange: onSnapChange,
      onDragStart: onDragStart,
      onDragEnd: onDragEnd,
    );
  }

  /// Variante del bottom sheet
  final BottomSheetVariant variant;

  /// Contenido del bottom sheet
  final Widget content;

  /// Punto de anclaje inicial
  final BottomSheetSnap initialSnap;

  /// Si el bottom sheet puede ser arrastrado
  final bool draggable;

  /// Estado actual del bottom sheet
  final AppBottomSheetState state;

  /// Color de fondo del bottom sheet
  final Color? backgroundColor;

  /// Color del handle de arrastre
  final Color? handleColor;

  /// Elevación del bottom sheet
  final double? elevation;

  /// Forma del bottom sheet
  final ShapeBorder? shape;

  /// Padding interno del bottom sheet
  final EdgeInsetsGeometry? padding;

  /// Altura mínima del bottom sheet
  final double minHeight;

  /// Altura máxima del bottom sheet
  final double? maxHeight;

  /// Soporte para RTL
  final bool rtlSupport;

  /// Soporte para accesibilidad
  final bool accessibilitySupport;

  /// Etiqueta de accesibilidad
  final String? accessibilityLabel;

  /// Pista de accesibilidad
  final String? accessibilityHint;

  /// Callback cuando cambia el estado
  final ValueChanged<AppBottomSheetState>? onStateChange;

  /// Callback cuando cambia el punto de anclaje
  final ValueChanged<BottomSheetSnap>? onSnapChange;

  /// Callback cuando comienza el arrastre
  final VoidCallback? onDragStart;

  /// Callback cuando termina el arrastre
  final VoidCallback? onDragEnd;

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();

  /// Método estático para mostrar el bottom sheet como modal
  static Future<T?> showModal<T>({
    required BuildContext context,
    required AppBottomSheet bottomSheet,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      shape: shape,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      isScrollControlled: true,
      builder: (context) => bottomSheet,
    );
  }
}

class _AppBottomSheetState extends State<AppBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleController;
  late Animation<double> _heightAnimation;
  late Animation<double> _scaleAnimation;
  late DraggableScrollableController _scrollController;

  AppBottomSheetState _currentState = AppBottomSheetState.defaultState;
  BottomSheetSnap _currentSnap = BottomSheetSnap.half;

  @override
  void initState() {
    super.initState();
    _currentState = widget.state;
    _currentSnap = widget.initialSnap;
    _setupAnimations();
    _setupScrollController();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _heightAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  void _setupScrollController() {
    _scrollController = DraggableScrollableController();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _updateState(AppBottomSheetState newState) {
    if (_currentState != newState && mounted) {
      setState(() {
        _currentState = newState;
      });
      widget.onStateChange?.call(newState);
    }
  }

  void _updateSnap(BottomSheetSnap newSnap) {
    if (_currentSnap != newSnap && mounted) {
      setState(() {
        _currentSnap = newSnap;
      });
      widget.onSnapChange?.call(newSnap);
    }
  }

  double _getInitialSize() {
    switch (widget.variant) {
      case BottomSheetVariant.modal:
        switch (_currentSnap) {
          case BottomSheetSnap.min:
            return 0.2;
          case BottomSheetSnap.half:
            return 0.5;
          case BottomSheetSnap.max:
            return 0.9;
        }
      case BottomSheetVariant.half:
        switch (_currentSnap) {
          case BottomSheetSnap.min:
            return 0.15;
          case BottomSheetSnap.half:
            return 0.5;
          case BottomSheetSnap.max:
            return 0.7;
        }
      case BottomSheetVariant.full:
        switch (_currentSnap) {
          case BottomSheetSnap.min:
            return 0.3;
          case BottomSheetSnap.half:
            return 0.6;
          case BottomSheetSnap.max:
            return 0.95;
        }
    }
  }

  double _getMinSize() {
    switch (widget.variant) {
      case BottomSheetVariant.modal:
        return 0.1;
      case BottomSheetVariant.half:
        return 0.1;
      case BottomSheetVariant.full:
        return 0.2;
    }
  }

  double _getMaxSize() {
    switch (widget.variant) {
      case BottomSheetVariant.modal:
        return 0.9;
      case BottomSheetVariant.half:
        return 0.7;
      case BottomSheetVariant.full:
        return 0.95;
    }
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    return colorScheme.surface;
  }

  Color _getHandleColor(ColorScheme colorScheme) {
    if (widget.handleColor != null) return widget.handleColor!;
    return colorScheme.onSurface.withValues(alpha: 0.4);
  }

  double _getElevation() {
    if (widget.elevation != null) return widget.elevation!;
    return 16.0;
  }

  ShapeBorder _getShape() {
    if (widget.shape != null) return widget.shape!;
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    if (widget.padding != null) return widget.padding!;
    return const EdgeInsets.all(16);
  }

  String _getAccessibilityLabel() {
    if (widget.accessibilityLabel != null) return widget.accessibilityLabel!;

    switch (widget.variant) {
      case BottomSheetVariant.modal:
        return 'Bottom sheet modal';
      case BottomSheetVariant.half:
        return 'Bottom sheet de media altura';
      case BottomSheetVariant.full:
        return 'Bottom sheet de altura completa';
    }
  }


  void _onScrollNotification(DraggableScrollableNotification notification) {
    final size = notification.extent;

    if (size <= 0.25) {
      _updateSnap(BottomSheetSnap.min);
    } else if (size <= 0.6) {
      _updateSnap(BottomSheetSnap.half);
    } else {
      _updateSnap(BottomSheetSnap.max);
    }
  }

  Widget _buildHandle(ThemeData theme) {
    if (!widget.draggable) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: _getHandleColor(theme.colorScheme),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    Widget content = widget.content;

    if (widget.padding != null) {
      content = Padding(
        padding: _getPadding(),
        child: content,
      );
    }

    return content;
  }

  Widget _buildStateWrapper(Widget child) {
    switch (_currentState) {
      case AppBottomSheetState.disabled:
        return Opacity(
          opacity: 0.5,
          child: AbsorbPointer(child: child),
        );
      case AppBottomSheetState.loading:
        return _buildLoadingChild(child);
      case AppBottomSheetState.skeleton:
        return _buildSkeletonChild(child);
      case AppBottomSheetState.focus:
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: child,
        );
      case AppBottomSheetState.pressed:
        return AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: child,
        );
      case AppBottomSheetState.defaultState:
      case AppBottomSheetState.hover:
      case AppBottomSheetState.selected:
        return child;
    }
  }

  Widget _buildLoadingChild(Widget child) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: child,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget _buildSkeletonChild(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Opacity(
        opacity: 0.3,
        child: child,
      ),
    );
  }

  Widget _wrapWithInteractivity(Widget child) {
    final isDesktop = kIsWeb ||
        (!kIsWeb &&
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux));

    if (isDesktop) {
      return MouseRegion(
        onEnter: (_) => _updateState(AppBottomSheetState.hover),
        onExit: (_) => _updateState(AppBottomSheetState.defaultState),
        child: child,
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget bottomSheetContent = NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        _onScrollNotification(notification);
        return true;
      },
      child: DraggableScrollableSheet(
        controller: _scrollController,
        initialChildSize: _getInitialSize(),
        minChildSize: _getMinSize(),
        maxChildSize: _getMaxSize(),
        expand: false,
        snap: true,
        snapSizes: [_getMinSize(), 0.5, _getMaxSize()],
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  color: _getBackgroundColor(theme.colorScheme),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: _getElevation(),
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Material(
                  type: MaterialType.card,
                  color: _getBackgroundColor(theme.colorScheme),
                  elevation: _getElevation(),
                  shape: _getShape(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHandle(theme),
                      Flexible(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: _buildContent(theme),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );

    if (widget.accessibilitySupport) {
      bottomSheetContent = Semantics(
        label: _getAccessibilityLabel(),
        hint: widget.accessibilityHint,
        child: bottomSheetContent,
      );
    }

    bottomSheetContent = _buildStateWrapper(bottomSheetContent);

    if (_currentState.canInteract) {
      bottomSheetContent = _wrapWithInteractivity(bottomSheetContent);
    }

    return bottomSheetContent;
  }
}