import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cart_widget_config.freezed.dart';
part 'app_cart_widget_config.g.dart';

/// Configuración completa para el componente AppCartWidget
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento del carrito
@freezed
class AppCartWidgetConfig with _$AppCartWidgetConfig {
  const factory AppCartWidgetConfig({
    @Default(AppCartVariant.full) AppCartVariant variant,
    @Default(AppCartState.defaultState) AppCartState state,
    AppCartColors? colors,
    AppCartSpacing? spacing,
    AppCartAnimation? animation,
    AppCartBehavior? behavior,
    AppCartA11yConfig? a11yConfig,
  }) = _AppCartWidgetConfig;

  factory AppCartWidgetConfig.fromJson(Map<String, dynamic> json) =>
      _$AppCartWidgetConfigFromJson(json);
}

/// Variantes del carrito
enum AppCartVariant {
  /// Versión mini/compacta (contador + total)
  mini,

  /// Versión completa (lista de items + acciones)
  full,
}

/// Estados interactivos del carrito
enum AppCartState {
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
class AppCartItem with _$AppCartItem {
  const factory AppCartItem({
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

  factory AppCartItem.fromJson(Map<String, dynamic> json) =>
      _$AppCartItemFromJson(json);
}

/// Configuración de colores del carrito
@freezed
class AppCartColors with _$AppCartColors {
  const factory AppCartColors({
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

  factory AppCartColors.fromJson(Map<String, dynamic> json) =>
      _$AppCartColorsFromJson(json);
}

/// Configuración de espaciado del carrito
@freezed
class AppCartSpacing with _$AppCartSpacing {
  const factory AppCartSpacing({
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

  factory AppCartSpacing.fromJson(Map<String, dynamic> json) =>
      _$AppCartSpacingFromJson(json);
}

/// Configuración de animaciones del carrito
@freezed
class AppCartAnimation with _$AppCartAnimation {
  const factory AppCartAnimation({
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

  factory AppCartAnimation.fromJson(Map<String, dynamic> json) =>
      _$AppCartAnimationFromJson(json);
}

/// Configuración de comportamiento del carrito
@freezed
class AppCartBehavior with _$AppCartBehavior {
  const factory AppCartBehavior({
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
    @Default(AppCartLayout.list) AppCartLayout layout,
    @Default(5) int maxVisibleItems,
  }) = _AppCartBehavior;

  factory AppCartBehavior.fromJson(Map<String, dynamic> json) =>
      _$AppCartBehaviorFromJson(json);
}

/// Layout del carrito
enum AppCartLayout {
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
class AppCartA11yConfig with _$AppCartA11yConfig {
  const factory AppCartA11yConfig({
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
  }) = _AppCartA11yConfig;

  factory AppCartA11yConfig.fromJson(Map<String, dynamic> json) =>
      _$AppCartA11yConfigFromJson(json);
}

/// Resumen del carrito
@freezed
class AppCartSummary with _$AppCartSummary {
  const factory AppCartSummary({
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

  factory AppCartSummary.fromJson(Map<String, dynamic> json) =>
      _$AppCartSummaryFromJson(json);
}

/// Extensiones para AppCartVariant
extension AppCartVariantExtensions on AppCartVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCartVariant.mini:
        return 'Mini';
      case AppCartVariant.full:
        return 'Completo';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case AppCartVariant.mini:
        return Icons.shopping_cart_outlined;
      case AppCartVariant.full:
        return Icons.shopping_cart;
    }
  }

  /// Si muestra la lista completa de items
  bool get showItemList {
    return this == AppCartVariant.full;
  }

  /// Si muestra solo el resumen
  bool get showSummaryOnly {
    return this == AppCartVariant.mini;
  }

  /// Layout recomendado
  AppCartLayout get recommendedLayout {
    switch (this) {
      case AppCartVariant.mini:
        return AppCartLayout.carousel;
      case AppCartVariant.full:
        return AppCartLayout.list;
    }
  }
}

/// Extensiones para AppCartState
extension AppCartStateExtensions on AppCartState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCartState.defaultState:
        return 'Normal';
      case AppCartState.hover:
        return 'Hover';
      case AppCartState.pressed:
        return 'Presionado';
      case AppCartState.focus:
        return 'Enfocado';
      case AppCartState.selected:
        return 'Seleccionado';
      case AppCartState.disabled:
        return 'Deshabilitado';
      case AppCartState.loading:
        return 'Cargando';
      case AppCartState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado es interactivo
  bool get isInteractive {
    return this != AppCartState.disabled &&
           this != AppCartState.loading &&
           this != AppCartState.skeleton;
  }

  /// Opacidad del estado
  double get opacity {
    switch (this) {
      case AppCartState.disabled:
        return 0.5;
      case AppCartState.loading:
        return 0.7;
      default:
        return 1.0;
    }
  }

  /// Elevación del estado
  double get elevation {
    switch (this) {
      case AppCartState.hover:
        return 8.0;
      case AppCartState.pressed:
        return 2.0;
      case AppCartState.selected:
        return 6.0;
      default:
        return 4.0;
    }
  }
}

/// Extensiones para AppCartItem
extension AppCartItemExtensions on AppCartItem {
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
  AppCartItem copyWithQuantity(int newQuantity) {
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

/// Extensiones para AppCartSummary
extension AppCartSummaryExtensions on AppCartSummary {
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

/// Extensiones para AppCartLayout
extension AppCartLayoutExtensions on AppCartLayout {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCartLayout.list:
        return 'Lista';
      case AppCartLayout.grid:
        return 'Grid';
      case AppCartLayout.carousel:
        return 'Carrusel';
      case AppCartLayout.accordion:
        return 'Acordeón';
    }
  }

  /// Si el layout es vertical
  bool get isVertical {
    return this == AppCartLayout.list || this == AppCartLayout.accordion;
  }

  /// Si el layout es horizontal
  bool get isHorizontal {
    return this == AppCartLayout.carousel;
  }

  /// Si soporta scroll
  bool get isScrollable {
    return this != AppCartLayout.accordion;
  }

  /// Si permite colapsar
  bool get isCollapsible {
    return this == AppCartLayout.accordion;
  }

  /// Aspect ratio recomendado para items
  double get recommendedItemRatio {
    switch (this) {
      case AppCartLayout.list:
        return 4.0; // Ancho / alto
      case AppCartLayout.grid:
        return 1.2;
      case AppCartLayout.carousel:
        return 2.0;
      case AppCartLayout.accordion:
        return 3.0;
    }
  }

  /// Número de columnas para grid
  int get gridColumns {
    switch (this) {
      case AppCartLayout.grid:
        return 2;
      default:
        return 1;
    }
  }
}

/// Utilidades para cálculos de carrito
class AppCartUtils {
  /// Calcula el resumen del carrito desde una lista de items
  static AppCartSummary calculateSummary(
    List<AppCartItem> items, {
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

    return AppCartSummary(
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
  static bool isValidQuantity(AppCartItem item, int quantity) {
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
  static List<AppCartItem> getAvailableItems(List<AppCartItem> items) {
    return items.where((item) => item.available).toList();
  }
}

