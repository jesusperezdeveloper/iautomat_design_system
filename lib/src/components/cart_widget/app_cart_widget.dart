import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget_config.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget_platform_adapter.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget_a11y_helper.dart';

/// Widget de carrito de compras del Design System
///
/// Un carrito versátil para mostrar items, cantidades y totales con soporte para
/// múltiples variantes y layouts adaptativos.
///
/// Features:
/// - Variantes: mini (resumen), full (lista completa)
/// - Estados: default, hover, pressed, focus, selected, disabled, loading, skeleton
/// - Soporte multiplataforma (Android, iOS, Web)
/// - RTL y accesibilidad completa
/// - Navegación por teclado
/// - Animaciones fluidas
/// - Cálculos automáticos de totales
///
/// Ejemplo:
/// ```dart
/// AppCartWidget(
///   items: [
///     AppCartItem(
///       id: '1',
///       name: 'iPhone 15 Pro',
///       price: 999.99,
///       quantity: 1,
///     ),
///   ],
///   variant: AppCartVariant.full,
///   onQtyChange: (itemId, newQty) => print('Item $itemId: $newQty'),
///   onCheckout: (summary) => print('Checkout: ${summary.total}'),
/// )
/// ```
class AppCartWidget extends StatefulWidget {
  /// Configuración completa del carrito
  final AppCartWidgetConfig? config;

  /// Lista de items en el carrito
  final List<AppCartItem> items;

  /// Variante del carrito
  final AppCartVariant? variant;

  /// Estado inicial del carrito
  final AppCartState? initialState;

  /// Callback cuando cambia la cantidad de un item
  final Function(String itemId, int newQuantity)? onQtyChange;

  /// Callback cuando se procede al checkout
  final Function(AppCartSummary summary)? onCheckout;

  /// Callback cuando se remueve un item
  final Function(String itemId)? onItemRemove;

  /// Callback cuando se toca un item
  final Function(AppCartItem item)? onItemTap;

  /// Callback cuando se aplica un código promocional
  final Function(String promoCode)? onPromoCodeApply;

  /// Si el carrito está habilitado
  final bool enabled;

  /// Tasa de impuestos (0.0 - 1.0)
  final double taxRate;

  /// Costo de envío
  final double shippingCost;

  /// Descuento aplicado
  final double discountAmount;

  /// Código promocional aplicado
  final String promoCode;

  /// Moneda a mostrar
  final String currency;

  /// Ancho del carrito (opcional)
  final double? width;

  /// Altura del carrito (opcional)
  final double? height;

  /// Si se muestra expandido inicialmente
  final bool initiallyExpanded;

  /// Máximo de items a mostrar (para variante mini)
  final int? maxVisibleItems;

  /// Widget personalizado para el estado vacío
  final Widget? emptyStateWidget;

  /// Widget personalizado para el header
  final Widget? headerWidget;

  /// Widget personalizado para el footer
  final Widget? footerWidget;

  const AppCartWidget({
    super.key,
    this.config,
    required this.items,
    this.variant,
    this.initialState,
    this.onQtyChange,
    this.onCheckout,
    this.onItemRemove,
    this.onItemTap,
    this.onPromoCodeApply,
    this.enabled = true,
    this.taxRate = 0.0,
    this.shippingCost = 0.0,
    this.discountAmount = 0.0,
    this.promoCode = '',
    this.currency = '\$',
    this.width,
    this.height,
    this.initiallyExpanded = true,
    this.maxVisibleItems,
    this.emptyStateWidget,
    this.headerWidget,
    this.footerWidget,
  });

  @override
  State<AppCartWidget> createState() => _AppCartWidgetState();
}

class _AppCartWidgetState extends State<AppCartWidget>
    with TickerProviderStateMixin {
  late AppCartWidgetConfig _config;
  late AppCartState _currentState;
  late AppCartWidgetPlatformAdapter _platformAdapter;
  late AppCartWidgetA11yHelper _a11yHelper;
  late AppCartSummary _summary;

  // Controladores de animación
  late AnimationController _stateAnimationController;
  late AnimationController _itemAnimationController;
  late AnimationController _summaryAnimationController;

  // Animaciones
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // Estado interactivo
  bool _isFocused = false;
  bool _isExpanded = true;

  // Lista interna de items para animaciones
  List<AppCartItem> _animatedItems = [];

  // Focus node para navegación por teclado
  final FocusNode _focusNode = FocusNode();

  // Controlador de scroll
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeConfig();
    _initializeAnimations();
    _initializeHelpers();
    _initializeData();
    _setupFocusListener();
  }

  void _initializeConfig() {
    _config = widget.config ??
        AppCartWidgetConfig(
          variant: widget.variant ?? AppCartVariant.full,
          state: widget.initialState ??
                 (widget.enabled ? AppCartState.defaultState : AppCartState.disabled),
        );

    _currentState = _config.state;
  }

  void _initializeAnimations() {
    // Controlador principal de estado
    _stateAnimationController = AnimationController(
      duration: _config.animation?.duration ?? const Duration(milliseconds: 200),
      vsync: this,
    );

    // Controlador de items
    _itemAnimationController = AnimationController(
      duration: _config.animation?.addRemoveDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );

    // Controlador de resumen
    _summaryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
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

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: _currentState.opacity,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: curve,
    ));


    // Iniciar animaciones
    _itemAnimationController.forward();
    _summaryAnimationController.forward();
  }

  void _initializeHelpers() {
    _platformAdapter = AppCartWidgetPlatformAdapter();
    _a11yHelper = AppCartWidgetA11yHelper(
      config: _config.a11yConfig ?? const AppCartA11yConfig(),
    );
  }

  void _initializeData() {
    _animatedItems = List.from(widget.items);
    _isExpanded = widget.initiallyExpanded;
    _calculateSummary();
  }

  void _setupFocusListener() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (_isFocused) {
          _updateState(AppCartState.focus);
        } else if (_currentState == AppCartState.focus) {
          _updateState(AppCartState.defaultState);
        }
      });
    });
  }

  double _getTargetScale() {
    if (!widget.enabled) return 1.0;
    if (_config.animation?.enableScaleAnimation != true) return 1.0;

    switch (_currentState) {
      case AppCartState.hover:
        return _config.animation?.hoverScale ?? 1.02;
      case AppCartState.pressed:
        return _config.animation?.pressScale ?? 0.98;
      default:
        return 1.0;
    }
  }

  void _updateState(AppCartState newState) {
    if (_currentState == newState || !widget.enabled) return;

    setState(() {
      _currentState = newState;
    });

    _stateAnimationController.forward(from: 0);

    // Anunciar cambio de estado para accesibilidad
    _a11yHelper.announceStateChange(_currentState);
  }

  void _calculateSummary() {
    _summary = AppCartUtils.calculateSummary(
      _animatedItems,
      taxRate: widget.taxRate,
      shippingCost: widget.shippingCost,
      discountAmount: widget.discountAmount,
      currency: widget.currency,
      promoCode: widget.promoCode,
    );

    // Animar cambio de resumen
    _summaryAnimationController.reset();
    _summaryAnimationController.forward();

    // Anunciar cambio de total para accesibilidad
    _a11yHelper.announceTotalChange(_summary);
  }

  void _handleQuantityChange(String itemId, int newQuantity) {
    if (!widget.enabled) return;

    final itemIndex = _animatedItems.indexWhere((item) => item.id == itemId);
    if (itemIndex == -1) return;

    final item = _animatedItems[itemIndex];
    if (!AppCartUtils.isValidQuantity(item, newQuantity)) return;

    setState(() {
      if (newQuantity <= 0) {
        _animatedItems.removeAt(itemIndex);
      } else {
        _animatedItems[itemIndex] = item.copyWithQuantity(newQuantity);
      }
    });

    _calculateSummary();

    // Notificar callback
    widget.onQtyChange?.call(itemId, newQuantity);

    // Anunciar cambio para accesibilidad
    _a11yHelper.announceQuantityChange(itemId, newQuantity);
  }

  void _handleItemRemove(String itemId) {
    if (!widget.enabled) return;

    final itemIndex = _animatedItems.indexWhere((item) => item.id == itemId);
    if (itemIndex == -1) return;

    setState(() {
      _animatedItems.removeAt(itemIndex);
    });

    _calculateSummary();

    // Notificar callback
    widget.onItemRemove?.call(itemId);

    // Anunciar cambio para accesibilidad
    _a11yHelper.announceItemRemoval(itemId);
  }

  void _handleCheckout() {
    if (!widget.enabled || _summary.isEmpty) return;

    _updateState(AppCartState.loading);

    // Simular delay de checkout
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _updateState(AppCartState.defaultState);
        widget.onCheckout?.call(_summary);
        _a11yHelper.announceCheckout(_summary);
      }
    });
  }

  void _handleItemTap(AppCartItem item) {
    if (!widget.enabled) return;
    widget.onItemTap?.call(item);
  }

  void _handlePromoCode(String promoCode) {
    if (!widget.enabled) return;
    widget.onPromoCodeApply?.call(promoCode);
  }

  void _handleHover(bool isHovered) {
    if (!widget.enabled) return;

    setState(() {
      // Estado hover manejado por _currentState
    });

    if (isHovered) {
      _updateState(AppCartState.hover);
    } else {
      _updateState(AppCartState.defaultState);
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (!widget.enabled) return;

    _a11yHelper.handleKeyEvent(
      event,
      onToggleExpand: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      onCheckout: _handleCheckout,
      onScrollUp: () {
        _scrollController.animateTo(
          math.max(0, _scrollController.offset - 100),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      },
      onScrollDown: () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            math.min(
              _scrollController.position.maxScrollExtent,
              _scrollController.offset + 100,
            ),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  void didUpdateWidget(AppCartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Actualizar items si cambiaron
    if (widget.items != oldWidget.items) {
      setState(() {
        _animatedItems = List.from(widget.items);
      });
      _calculateSummary();
    }

    // Actualizar estado enabled
    if (widget.enabled != oldWidget.enabled) {
      _updateState(widget.enabled
          ? AppCartState.defaultState
          : AppCartState.disabled);
    }

    // Recalcular si cambiaron parámetros de cálculo
    if (widget.taxRate != oldWidget.taxRate ||
        widget.shippingCost != oldWidget.shippingCost ||
        widget.discountAmount != oldWidget.discountAmount ||
        widget.promoCode != oldWidget.promoCode) {
      _calculateSummary();
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _itemAnimationController.dispose();
    _summaryAnimationController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return _a11yHelper.buildSemanticWrapper(
      context: context,
      summary: _summary,
      state: _currentState,
      isRtl: isRtl,
      child: _buildCart(context),
    );
  }

  Widget _buildCart(BuildContext context) {
    final spacing = _resolveSpacing();
    final colors = _resolveColors(context);
    final variant = widget.variant ?? _config.variant;

    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: GestureDetector(
          onTap: () => _focusNode.requestFocus(),
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _stateAnimationController,
              _itemAnimationController,
              _summaryAnimationController,
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
                      minHeight: variant == AppCartVariant.mini ? 80 : spacing.minHeight,
                    ),
                    child: _buildCartContent(
                      context: context,
                      variant: variant,
                      colors: colors,
                      spacing: spacing,
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

  Widget _buildCartContent({
    required BuildContext context,
    required AppCartVariant variant,
    required AppCartColors colors,
    required AppCartSpacing spacing,
  }) {
    if (_currentState == AppCartState.skeleton) {
      return _platformAdapter.buildSkeletonCart(
        context: context,
        variant: variant,
        colors: colors,
        spacing: spacing,
      );
    }

    if (_summary.isEmpty && _config.behavior?.showEmptyState == true) {
      return _platformAdapter.buildEmptyCart(
        context: context,
        variant: variant,
        colors: colors,
        spacing: spacing,
        emptyWidget: widget.emptyStateWidget,
      );
    }

    return _platformAdapter.buildCart(
      context: context,
      config: _config,
      variant: variant,
      state: _currentState,
      items: _animatedItems,
      summary: _summary,
      colors: colors,
      spacing: spacing,
      isExpanded: _isExpanded,
      scrollController: _scrollController,
      headerWidget: widget.headerWidget,
      footerWidget: widget.footerWidget,
      maxVisibleItems: widget.maxVisibleItems,
      onQuantityChange: _handleQuantityChange,
      onItemRemove: _handleItemRemove,
      onItemTap: _handleItemTap,
      onCheckout: _handleCheckout,
      onPromoCode: _handlePromoCode,
      onToggleExpand: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
    );
  }

  AppCartSpacing _resolveSpacing() {
    return _config.spacing ?? const AppCartSpacing();
  }

  AppCartColors _resolveColors(BuildContext context) {
    final theme = Theme.of(context);
    final baseColors = _config.colors ?? const AppCartColors();

    return AppCartColors(
      backgroundColor: baseColors.backgroundColor ?? theme.colorScheme.surface,
      borderColor: baseColors.borderColor ?? theme.colorScheme.outline.withValues(alpha: 0.2),
      shadowColor: baseColors.shadowColor ?? theme.colorScheme.shadow,
      headerColor: baseColors.headerColor ?? theme.colorScheme.primary,
      headerTextColor: baseColors.headerTextColor ?? theme.colorScheme.onPrimary,
      itemBackgroundColor: baseColors.itemBackgroundColor ?? theme.colorScheme.surface,
      itemBorderColor: baseColors.itemBorderColor ?? theme.colorScheme.outline.withValues(alpha: 0.1),
      titleColor: baseColors.titleColor ?? theme.colorScheme.onSurface,
      descriptionColor: baseColors.descriptionColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.7),
      priceColor: baseColors.priceColor ?? theme.colorScheme.primary,
      originalPriceColor: baseColors.originalPriceColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.5),
      quantityColor: baseColors.quantityColor ?? theme.colorScheme.onSurface,
      totalColor: baseColors.totalColor ?? theme.colorScheme.primary,
      subtotalColor: baseColors.subtotalColor ?? theme.colorScheme.onSurface,
      buttonPrimaryColor: baseColors.buttonPrimaryColor ?? theme.colorScheme.primary,
      buttonSecondaryColor: baseColors.buttonSecondaryColor ?? theme.colorScheme.secondary,
      buttonTextColor: baseColors.buttonTextColor ?? theme.colorScheme.onPrimary,
      dividerColor: baseColors.dividerColor ?? theme.colorScheme.outline.withValues(alpha: 0.2),
      emptyStateColor: baseColors.emptyStateColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.5),
      badgeColor: baseColors.badgeColor ?? theme.colorScheme.error,
      badgeTextColor: baseColors.badgeTextColor ?? theme.colorScheme.onError,
      focusColor: baseColors.focusColor ?? theme.colorScheme.primary,
      skeletonColor: baseColors.skeletonColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.1),
    );
  }
}