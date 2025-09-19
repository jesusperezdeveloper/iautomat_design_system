import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cart_widget_config.freezed.dart';

/// Configuración completa para el componente DSCartWidget
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento del carrito
@freezed
class DSCartWidgetConfig with _$DSCartWidgetConfig {
  const factory DSCartWidgetConfig({
    @Default(DSCartVariant.full) DSCartVariant variant,
    @Default(DSCartState.defaultState) DSCartState state,
    DSCartColors? colors,
    DSCartSpacing? spacing,
    DSCartAnimation? animation,
    DSCartBehavior? behavior,
    DSCartA11yConfig? a11yConfig,
  }) = _DSCartWidgetConfig;
}

/// Variantes del carrito
enum DSCartVariant {
  /// Versión mini/compacta (contador + total)
  mini,

  /// Versión completa (lista de items + acciones)
  full,
}

/// Estados interactivos del carrito
enum DSCartState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (web/desktop)
  hover,

  /// Estado presionado
  pressed,

  /// Estado enfocado (navegación por teclado)
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado cargando
  loading,

  /// Estado skeleton (placeholder)
  skeleton,
}

/// Item del carrito
@freezed
class DSCartItem with _$DSCartItem {
  const factory DSCartItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    String? description,
    String? imageUrl,
    Widget? imageWidget,
    double? originalPrice,
    @Default('') String category,
    @Default(true) bool available,
    @Default(1) int maxQuantity,
    @Default(1) int minQuantity,
    Map<String, dynamic>? metadata,
  }) = _AppCartItem;
}

/// Configuración de colores del carrito
@freezed
class DSCartColors with _$DSCartColors {
  const factory DSCartColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? headerColor,
    Color? headerTextColor,
    Color? itemBackgroundColor,
    Color? itemBorderColor,
    Color? titleColor,
    Color? descriptionColor,
    Color? priceColor,
    Color? originalPriceColor,
    Color? quantityColor,
    Color? totalColor,
    Color? subtotalColor,
    Color? buttonPrimaryColor,
    Color? buttonSecondaryColor,
    Color? buttonTextColor,
    Color? dividerColor,
    Color? emptyStateColor,
    Color? badgeColor,
    Color? badgeTextColor,
    Color? focusColor,
    Color? skeletonColor,
  }) = _AppCartColors;
}

/// Configuración de espaciado del carrito
@freezed
class DSCartSpacing with _$DSCartSpacing {
  const factory DSCartSpacing({
    @Default(EdgeInsets.all(16)) EdgeInsets padding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(4.0) double elevation,
    @Default(16.0) double itemSpacing,
    @Default(8.0) double contentGap,
    @Default(200.0) double minWidth,
    @Default(300.0) double minHeight,
    @Default(60.0) double itemHeight,
    @Default(48.0) double imageSize,
    @Default(32.0) double quantityButtonSize,
    @Default(48.0) double checkoutButtonHeight,
  }) = _AppCartSpacing;
}

/// Configuración de animaciones del carrito
@freezed
class DSCartAnimation with _$DSCartAnimation {
  const factory DSCartAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Duration(milliseconds: 150)) Duration hoverDuration,
    @Default(Curves.easeOut) Curve hoverCurve,
    @Default(Duration(milliseconds: 300)) Duration addRemoveDuration,
    @Default(true) bool enableScaleAnimation,
    @Default(true) bool enableSlideAnimation,
    @Default(true) bool enableFadeAnimation,
    @Default(1.02) double hoverScale,
    @Default(0.98) double pressScale,
  }) = _AppCartAnimation;
}

/// Configuración de comportamiento del carrito
@freezed
class DSCartBehavior with _$DSCartBehavior {
  const factory DSCartBehavior({
    @Default(true) bool allowQuantityChange,
    @Default(true) bool allowItemRemoval,
    @Default(true) bool showImages,
    @Default(true) bool showDescriptions,
    @Default(true) bool showOriginalPrices,
    @Default(true) bool showSubtotal,
    @Default(true) bool showTaxes,
    @Default(true) bool showShipping,
    @Default(true) bool showEmptyState,
    @Default(true) bool enableSwipeToDelete,
    @Default(true) bool enableQuantityValidation,
    @Default(false) bool autoCollapseOnEmpty,
    @Default(DSCartLayout.list) DSCartLayout layout,
    @Default(5) int maxVisibleItems,
  }) = _AppCartBehavior;
}

/// Layout del carrito
enum DSCartLayout {
  /// Lista vertical
  list,

  /// Grid compacto
  grid,

  /// Carrusel horizontal
  carousel,

  /// Acordeón expandible
  accordion,
}

/// Configuración de accesibilidad del carrito
@freezed
class DSCartA11yConfig with _$DSCartA11yConfig {
  const factory DSCartA11yConfig({
    String? cartLabel,
    String? itemLabel,
    String? quantityLabel,
    String? priceLabel,
    String? totalLabel,
    String? checkoutLabel,
    String? emptyLabel,
    String? removeLabel,
    String? increaseLabel,
    String? decreaseLabel,
    @Default(true) bool announceItemChanges,
    @Default(true) bool announceQuantityChanges,
    @Default(true) bool announceTotalChanges,
    @Default(true) bool announceCheckout,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool enableSwipeActions,
  }) = _DSCartA11yConfig;
}

/// Resumen del carrito
@freezed
class DSCartSummary with _$DSCartSummary {
  const factory DSCartSummary({
    required double subtotal,
    @Default(0.0) double taxes,
    @Default(0.0) double shipping,
    @Default(0.0) double discount,
    required double total,
    required int itemCount,
    required int totalQuantity,
    String? currency,
    @Default('') String promoCode,
  }) = _AppCartSummary;
}

/// Extensiones para DSCartVariant
extension DSCartVariantExtensions on DSCartVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSCartVariant.mini:
        return 'Mini';
      case DSCartVariant.full:
        return 'Completo';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case DSCartVariant.mini:
        return Icons.shopping_cart_outlined;
      case DSCartVariant.full:
        return Icons.shopping_cart;
    }
  }

  /// Si muestra la lista completa de items
  bool get showItemList {
    return this == DSCartVariant.full;
  }

  /// Si muestra solo el resumen
  bool get showSummaryOnly {
    return this == DSCartVariant.mini;
  }

  /// Layout recomendado
  DSCartLayout get recommendedLayout {
    switch (this) {
      case DSCartVariant.mini:
        return DSCartLayout.carousel;
      case DSCartVariant.full:
        return DSCartLayout.list;
    }
  }
}

/// Extensiones para DSCartState
extension DSCartStateExtensions on DSCartState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSCartState.defaultState:
        return 'Normal';
      case DSCartState.hover:
        return 'Hover';
      case DSCartState.pressed:
        return 'Presionado';
      case DSCartState.focus:
        return 'Enfocado';
      case DSCartState.selected:
        return 'Seleccionado';
      case DSCartState.disabled:
        return 'Deshabilitado';
      case DSCartState.loading:
        return 'Cargando';
      case DSCartState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado es interactivo
  bool get isInteractive {
    return this != DSCartState.disabled &&
           this != DSCartState.loading &&
           this != DSCartState.skeleton;
  }

  /// Opacidad del estado
  double get opacity {
    switch (this) {
      case DSCartState.disabled:
        return 0.5;
      case DSCartState.loading:
        return 0.7;
      default:
        return 1.0;
    }
  }

  /// Elevación del estado
  double get elevation {
    switch (this) {
      case DSCartState.hover:
        return 8.0;
      case DSCartState.pressed:
        return 2.0;
      case DSCartState.selected:
        return 6.0;
      default:
        return 4.0;
    }
  }
}

/// Extensiones para DSCartItem
extension DSCartItemExtensions on DSCartItem {
  /// Precio total del item (precio × cantidad)
  double get totalPrice => price * quantity;

  /// Si el item tiene descuento
  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  /// Porcentaje de descuento
  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((originalPrice! - price) / originalPrice!) * 100;
  }

  /// Ahorro total por el descuento
  double get totalSavings {
    if (!hasDiscount) return 0.0;
    return (originalPrice! - price) * quantity;
  }

  /// Si se puede incrementar la cantidad
  bool get canIncreaseQuantity => quantity < maxQuantity;

  /// Si se puede decrementar la cantidad
  bool get canDecreaseQuantity => quantity > minQuantity;

  /// Crea una copia con nueva cantidad
  DSCartItem copyWithQuantity(int newQuantity) {
    return copyWith(
      quantity: math.max(minQuantity, math.min(maxQuantity, newQuantity)),
    );
  }

  /// Formatea el precio como string
  String formatPrice([String currency = '\$']) {
    return '$currency${price.toStringAsFixed(2)}';
  }

  /// Formatea el precio original como string
  String? formatOriginalPrice([String currency = '\$']) {
    if (originalPrice == null) return null;
    return '$currency${originalPrice!.toStringAsFixed(2)}';
  }

  /// Formatea el precio total como string
  String formatTotalPrice([String currency = '\$']) {
    return '$currency${totalPrice.toStringAsFixed(2)}';
  }

  /// Descripción para accesibilidad
  String get accessibilityDescription {
    final buffer = StringBuffer();
    buffer.write(name);
    if (description != null && description!.isNotEmpty) {
      buffer.write(', $description');
    }
    buffer.write(', Cantidad: $quantity');
    buffer.write(', Precio: ${formatPrice()}');
    if (hasDiscount) {
      buffer.write(', Precio original: ${formatOriginalPrice()}');
      buffer.write(', Ahorro: ${discountPercentage.toStringAsFixed(0)}%');
    }
    buffer.write(', Total: ${formatTotalPrice()}');
    return buffer.toString();
  }
}

/// Extensiones para DSCartSummary
extension DSCartSummaryExtensions on DSCartSummary {
  /// Si el carrito está vacío
  bool get isEmpty => itemCount == 0;

  /// Si tiene items
  bool get hasItems => itemCount > 0;

  /// Si tiene impuestos
  bool get hasTaxes => taxes > 0;

  /// Si tiene envío
  bool get hasShipping => shipping > 0;

  /// Si tiene descuento
  bool get hasDiscount => discount > 0;

  /// Si tiene código promocional
  bool get hasPromoCode => promoCode.isNotEmpty;

  /// Formatea el subtotal
  String formatSubtotal([String currency = '\$']) {
    return '$currency${subtotal.toStringAsFixed(2)}';
  }

  /// Formatea los impuestos
  String formatTaxes([String currency = '\$']) {
    return '$currency${taxes.toStringAsFixed(2)}';
  }

  /// Formatea el envío
  String formatShipping([String currency = '\$']) {
    if (shipping == 0) return 'Gratis';
    return '$currency${shipping.toStringAsFixed(2)}';
  }

  /// Formatea el descuento
  String formatDiscount([String currency = '\$']) {
    return '-$currency${discount.toStringAsFixed(2)}';
  }

  /// Formatea el total
  String formatTotal([String currency = '\$']) {
    return '$currency${total.toStringAsFixed(2)}';
  }

  /// Descripción completa para accesibilidad
  String get accessibilityDescription {
    final buffer = StringBuffer();
    buffer.write('Carrito con $itemCount productos, $totalQuantity artículos');
    buffer.write(', Subtotal: ${formatSubtotal()}');
    if (hasTaxes) buffer.write(', Impuestos: ${formatTaxes()}');
    if (hasShipping) buffer.write(', Envío: ${formatShipping()}');
    if (hasDiscount) buffer.write(', Descuento: ${formatDiscount()}');
    buffer.write(', Total: ${formatTotal()}');
    return buffer.toString();
  }

  /// Calcula el total desde los componentes
  double get calculatedTotal {
    return subtotal + taxes + shipping - discount;
  }

  /// Valida que el total sea consistente
  bool get isValid {
    return (calculatedTotal - total).abs() < 0.01; // Tolerancia de centavos
  }
}

/// Extensiones para DSCartLayout
extension DSCartLayoutExtensions on DSCartLayout {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSCartLayout.list:
        return 'Lista';
      case DSCartLayout.grid:
        return 'Grid';
      case DSCartLayout.carousel:
        return 'Carrusel';
      case DSCartLayout.accordion:
        return 'Acordeón';
    }
  }

  /// Si el layout es vertical
  bool get isVertical {
    return this == DSCartLayout.list || this == DSCartLayout.accordion;
  }

  /// Si el layout es horizontal
  bool get isHorizontal {
    return this == DSCartLayout.carousel;
  }

  /// Si soporta scroll
  bool get isScrollable {
    return this != DSCartLayout.accordion;
  }

  /// Si permite colapsar
  bool get isCollapsible {
    return this == DSCartLayout.accordion;
  }

  /// Aspect ratio recomendado para items
  double get recommendedItemRatio {
    switch (this) {
      case DSCartLayout.list:
        return 4.0; // Ancho / alto
      case DSCartLayout.grid:
        return 1.2;
      case DSCartLayout.carousel:
        return 2.0;
      case DSCartLayout.accordion:
        return 3.0;
    }
  }

  /// Número de columnas para grid
  int get gridColumns {
    switch (this) {
      case DSCartLayout.grid:
        return 2;
      default:
        return 1;
    }
  }
}

/// Utilidades para cálculos de carrito
class DSCartUtils {
  /// Calcula el resumen del carrito desde una lista de items
  static DSCartSummary calculateSummary(
    List<DSCartItem> items, {
    double taxRate = 0.0,
    double shippingCost = 0.0,
    double discountAmount = 0.0,
    String currency = '\$',
    String promoCode = '',
  }) {
    final subtotal = items.fold<double>(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );

    final taxes = subtotal * taxRate;
    final total = subtotal + taxes + shippingCost - discountAmount;

    final itemCount = items.length;
    final totalQuantity = items.fold<int>(
      0,
      (sum, item) => sum + item.quantity,
    );

    return DSCartSummary(
      subtotal: subtotal,
      taxes: taxes,
      shipping: shippingCost,
      discount: discountAmount,
      total: math.max(0, total), // No permitir totales negativos
      itemCount: itemCount,
      totalQuantity: totalQuantity,
      currency: currency,
      promoCode: promoCode,
    );
  }

  /// Aplica un código promocional
  static double applyPromoCode(
    String promoCode,
    double subtotal, {
    Map<String, double>? promoCodes,
  }) {
    final codes = promoCodes ?? _defaultPromoCodes;
    final discountRate = codes[promoCode.toUpperCase()] ?? 0.0;
    return subtotal * discountRate;
  }

  /// Códigos promocionales por defecto
  static const Map<String, double> _defaultPromoCodes = {
    'SAVE10': 0.10,
    'SAVE20': 0.20,
    'FIRSTBUY': 0.15,
    'WELCOME': 0.05,
  };

  /// Valida la cantidad de un item
  static bool isValidQuantity(DSCartItem item, int quantity) {
    return quantity >= item.minQuantity &&
           quantity <= item.maxQuantity &&
           quantity > 0;
  }

  /// Calcula el envío basado en el total
  static double calculateShipping(
    double subtotal, {
    double freeShippingThreshold = 50.0,
    double standardShipping = 5.99,
  }) {
    return subtotal >= freeShippingThreshold ? 0.0 : standardShipping;
  }

  /// Formatea un valor monetario
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '$symbol${amount.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}';
  }

  /// Filtra items disponibles
  static List<DSCartItem> getAvailableItems(List<DSCartItem> items) {
    return items.where((item) => item.available).toList();
  }
}

