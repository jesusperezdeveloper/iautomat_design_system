import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_config.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_platform_adapter.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_a11y_helper.dart';

/// Widget de tarjeta de producto del Design System
///
/// Una tarjeta versátil para mostrar productos con soporte para
/// imágenes, precios, descuentos y múltiples layouts.
///
/// Features:
/// - Variantes: price (solo precio), discount (con descuento)
/// - Estados: default, hover, pressed, focus, selected, disabled, loading, skeleton
/// - Soporte multiplataforma (Android, iOS, Web)
/// - RTL y accesibilidad completa
/// - Navegación por teclado
/// - Animaciones fluidas
///
/// Ejemplo:
/// ```dart
/// DSProductCard(
///   title: 'iPhone 15 Pro',
///   price: DSProductPrice(amount: 999.99, currency: '\$'),
///   image: DSProductImage(url: 'https://...'),
///   variant: DSProductCardVariant.discount,
///   discountChip: DSDiscountChip(text: '-20%'),
///   onTap: () => print('Producto seleccionado'),
/// )
/// ```
class DSProductCard extends StatefulWidget {
  /// Configuración completa de la tarjeta
  final DSProductCardConfig? config;

  /// Título del producto
  final String title;

  /// Configuración del precio
  final DSProductPrice price;

  /// Configuración de la imagen
  final DSProductImage? image;

  /// Chip de descuento (solo para variante discount)
  final DSDiscountChip? discountChip;

  /// Variante de la tarjeta
  final DSProductCardVariant? variant;

  /// Estado inicial de la tarjeta
  final DSProductCardState? initialState;

  /// Callback cuando se toca la tarjeta
  final VoidCallback? onTap;

  /// Callback cuando se presiona largo
  final VoidCallback? onLongPress;

  /// Callback cuando cambia la selección
  final ValueChanged<bool>? onSelectionChanged;

  /// Si la tarjeta está seleccionada
  final bool selected;

  /// Si la tarjeta está habilitada
  final bool enabled;

  /// Widget adicional para mostrar debajo del precio
  final Widget? additionalInfo;

  /// Badge para mostrar sobre la imagen
  final Widget? badge;

  /// Layout de la tarjeta
  final DSProductCardLayout? layout;

  /// Ancho de la tarjeta (opcional)
  final double? width;

  /// Altura de la tarjeta (opcional)
  final double? height;

  const DSProductCard({
    super.key,
    this.config,
    required this.title,
    required this.price,
    this.image,
    this.discountChip,
    this.variant,
    this.initialState,
    this.onTap,
    this.onLongPress,
    this.onSelectionChanged,
    this.selected = false,
    this.enabled = true,
    this.additionalInfo,
    this.badge,
    this.layout,
    this.width,
    this.height,
  });

  @override
  State<DSProductCard> createState() => _DSProductCardState();
}

class _DSProductCardState extends State<DSProductCard>
    with TickerProviderStateMixin {
  late DSProductCardConfig _config;
  late DSProductCardState _currentState;
  late DSProductCardPlatformAdapter _platformAdapter;
  late DSProductCardA11yHelper _a11yHelper;

  // Controladores de animación
  late AnimationController _stateAnimationController;
  late AnimationController _hoverAnimationController;
  late AnimationController _selectionAnimationController;

  // Animaciones
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _opacityAnimation;

  // Estado interactivo
  bool _isFocused = false;

  // Focus node para navegación por teclado
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeConfig();
    _initializeAnimations();
    _initializeHelpers();
    _setupFocusListener();
  }

  void _initializeConfig() {
    _config = widget.config ??
        DSProductCardConfig(
          variant: widget.variant ?? DSProductCardVariant.price,
          state: widget.initialState ??
                 (widget.enabled ? DSProductCardState.defaultState : DSProductCardState.disabled),
        );

    _currentState = _config.state;
  }

  void _initializeAnimations() {
    // Controlador principal de estado
    _stateAnimationController = AnimationController(
      duration: _config.animation?.duration ?? const Duration(milliseconds: 200),
      vsync: this,
    );

    // Controlador de hover
    _hoverAnimationController = AnimationController(
      duration: _config.animation?.hoverDuration ?? const Duration(milliseconds: 150),
      vsync: this,
    );

    // Controlador de selección
    _selectionAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Configurar animaciones
    final curve = _config.animation?.curve ?? Curves.easeInOut;

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: _getTargetScale(),
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: curve,
    ));

    _elevationAnimation = Tween<double>(
      begin: 4.0,
      end: _currentState.elevation,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: curve,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: _currentState.opacity,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: curve,
    ));

    // Iniciar animación si está seleccionado
    if (widget.selected) {
      _selectionAnimationController.forward();
    }
  }

  void _initializeHelpers() {
    _platformAdapter = DSProductCardPlatformAdapter();
    _a11yHelper = DSProductCardA11yHelper(
      config: _config.a11yConfig ?? const DSProductCardA11yConfig(),
    );
  }

  void _setupFocusListener() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (_isFocused) {
          _updateState(DSProductCardState.focus);
        } else if (_currentState == DSProductCardState.focus) {
          _updateState(DSProductCardState.defaultState);
        }
      });
    });
  }

  double _getTargetScale() {
    if (!widget.enabled) return 1.0;
    if (_config.animation?.enableScaleAnimation != true) return 1.0;

    switch (_currentState) {
      case DSProductCardState.hover:
        return _config.animation?.hoverScale ?? 1.02;
      case DSProductCardState.pressed:
        return _config.animation?.pressScale ?? 0.98;
      case DSProductCardState.selected:
        return 1.0;
      default:
        return 1.0;
    }
  }

  void _updateState(DSProductCardState newState) {
    if (_currentState == newState || !widget.enabled) return;

    setState(() {
      _currentState = newState;
    });

    _stateAnimationController.forward(from: 0);

    // Anunciar cambio de estado para accesibilidad
    _a11yHelper.announceStateChange(_currentState);
  }

  void _handleTap() {
    if (!widget.enabled) return;

    _updateState(DSProductCardState.pressed);

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _updateState(widget.selected
            ? DSProductCardState.selected
            : DSProductCardState.defaultState);
      }
    });

    widget.onTap?.call();

    if (widget.onSelectionChanged != null) {
      widget.onSelectionChanged!(!widget.selected);
    }
  }

  void _handleLongPress() {
    if (!widget.enabled) return;
    widget.onLongPress?.call();
  }

  void _handleHover(bool isHovered) {
    if (!widget.enabled) return;

    setState(() {
      // Estado hover manejado por _currentState
    });

    if (isHovered) {
      _updateState(DSProductCardState.hover);
      _hoverAnimationController.forward();
    } else {
      _updateState(widget.selected
          ? DSProductCardState.selected
          : DSProductCardState.defaultState);
      _hoverAnimationController.reverse();
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (!widget.enabled) return;

    _a11yHelper.handleKeyEvent(
      event,
      onActivate: _handleTap,
      onSelect: () {
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(!widget.selected);
        }
      },
    );
  }

  @override
  void didUpdateWidget(DSProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selected != oldWidget.selected) {
      if (widget.selected) {
        _selectionAnimationController.forward();
        _updateState(DSProductCardState.selected);
      } else {
        _selectionAnimationController.reverse();
        _updateState(DSProductCardState.defaultState);
      }
    }

    if (widget.enabled != oldWidget.enabled) {
      _updateState(widget.enabled
          ? DSProductCardState.defaultState
          : DSProductCardState.disabled);
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _hoverAnimationController.dispose();
    _selectionAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return _a11yHelper.buildSemanticWrapper(
      context: context,
      title: widget.title,
      price: widget.price,
      discountChip: widget.discountChip,
      state: _currentState,
      isRtl: isRtl,
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    final spacing = _resolveSpacing();
    final colors = _resolveColors(context);
    final layout = widget.layout ?? _config.behavior?.layout ?? DSProductCardLayout.vertical;

    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        cursor: widget.enabled && widget.onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: widget.onTap != null ? _handleTap : null,
          onLongPress: widget.onLongPress != null ? _handleLongPress : null,
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _stateAnimationController,
              _hoverAnimationController,
              _selectionAnimationController,
            ]),
            builder: (context, child) {
              return Transform.scale(
                scale: _config.animation?.enabled == true
                    ? _scaleAnimation.value
                    : 1.0,
                child: AnimatedOpacity(
                  opacity: _opacityAnimation.value,
                  duration: _config.animation?.duration ??
                            const Duration(milliseconds: 200),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    constraints: BoxConstraints(
                      minWidth: spacing.minWidth,
                      minHeight: spacing.minHeight,
                    ),
                    margin: spacing.margin,
                    child: _platformAdapter.buildCard(
                      context: context,
                      config: _config,
                      title: widget.title,
                      price: widget.price,
                      image: widget.image,
                      discountChip: widget.discountChip,
                      variant: widget.variant ?? _config.variant,
                      state: _currentState,
                      layout: layout,
                      selected: widget.selected,
                      additionalInfo: widget.additionalInfo,
                      badge: widget.badge,
                      colors: colors,
                      spacing: spacing,
                      elevation: _elevationAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  DSProductCardSpacing _resolveSpacing() {
    return _config.spacing ?? const DSProductCardSpacing();
  }

  DSProductCardColors _resolveColors(BuildContext context) {
    final theme = Theme.of(context);
    final baseColors = _config.colors ?? const DSProductCardColors();

    return DSProductCardColors(
      backgroundColor: baseColors.backgroundColor ?? theme.colorScheme.surface,
      borderColor: baseColors.borderColor ?? theme.colorScheme.outline.withValues(alpha: 0.2),
      shadowColor: baseColors.shadowColor ?? theme.colorScheme.shadow,
      titleColor: baseColors.titleColor ?? theme.colorScheme.onSurface,
      priceColor: baseColors.priceColor ?? theme.colorScheme.primary,
      originalPriceColor: baseColors.originalPriceColor ??
                         theme.colorScheme.onSurface.withValues(alpha: 0.5),
      discountBackgroundColor: baseColors.discountBackgroundColor ??
                              theme.colorScheme.error,
      discountTextColor: baseColors.discountTextColor ??
                        theme.colorScheme.onError,
      overlayColor: baseColors.overlayColor ??
                    theme.colorScheme.surface.withValues(alpha: 0.9),
      focusColor: baseColors.focusColor ?? theme.colorScheme.primary,
      selectedColor: baseColors.selectedColor ?? theme.colorScheme.primaryContainer,
      skeletonColor: baseColors.skeletonColor ??
                     theme.colorScheme.onSurface.withValues(alpha: 0.1),
    );
  }
}