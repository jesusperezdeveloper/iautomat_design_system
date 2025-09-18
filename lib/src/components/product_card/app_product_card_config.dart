import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_product_card_config.freezed.dart';
part 'app_product_card_config.g.dart';

/// Configuración completa para el componente AppProductCard
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento de la tarjeta de producto
@freezed
class AppProductCardConfig with _$AppProductCardConfig {
  const factory AppProductCardConfig({
    @Default(AppProductCardVariant.price) AppProductCardVariant variant,
    @Default(AppProductCardState.defaultState) AppProductCardState state,
    AppProductCardColors? colors,
    AppProductCardSpacing? spacing,
    AppProductCardAnimation? animation,
    AppProductCardBehavior? behavior,
    AppProductCardA11yConfig? a11yConfig,
  }) = _AppProductCardConfig;

  factory AppProductCardConfig.fromJson(Map<String, dynamic> json) =>
      _$AppProductCardConfigFromJson(json);
}

/// Variantes de la tarjeta de producto
enum AppProductCardVariant {
  /// Solo muestra el precio sin descuento
  price,

  /// Muestra el precio con descuento
  discount,
}

/// Estados interactivos de la tarjeta
enum AppProductCardState {
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

/// Configuración de chip de descuento
@freezed
class AppDiscountChip with _$AppDiscountChip {
  const factory AppDiscountChip({
    required String text,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    @Default(true) bool visible,
    @Default(AppDiscountChipPosition.topRight) AppDiscountChipPosition position,
  }) = _AppDiscountChip;

  factory AppDiscountChip.fromJson(Map<String, dynamic> json) =>
      _$AppDiscountChipFromJson(json);
}

/// Posición del chip de descuento
enum AppDiscountChipPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

/// Configuración de imagen del producto
@freezed
class AppProductImage with _$AppProductImage {
  const factory AppProductImage({
    required String url,
    String? placeholder,
    @Default(BoxFit.cover) BoxFit fit,
    @Default(1.0) double aspectRatio,
    Widget? errorWidget,
  }) = _AppProductImage;

  factory AppProductImage.fromJson(Map<String, dynamic> json) =>
      _$AppProductImageFromJson(json);
}

/// Configuración de precio
@freezed
class AppProductPrice with _$AppProductPrice {
  const factory AppProductPrice({
    required double amount,
    String? currency,
    @Default(AppPriceFormat.standard) AppPriceFormat format,
    double? originalPrice,
    @Default(true) bool showCurrency,
    @Default(2) int decimalPlaces,
  }) = _AppProductPrice;

  factory AppProductPrice.fromJson(Map<String, dynamic> json) =>
      _$AppProductPriceFromJson(json);
}

/// Formato de precio
enum AppPriceFormat {
  /// Formato estándar (ej: $99.99)
  standard,

  /// Formato compacto (ej: $99)
  compact,

  /// Formato con separador de miles (ej: $1,999.99)
  withThousands,

  /// Formato localizado según región
  localized,
}

/// Configuración de colores
@freezed
class AppProductCardColors with _$AppProductCardColors {
  const factory AppProductCardColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? titleColor,
    Color? priceColor,
    Color? originalPriceColor,
    Color? discountBackgroundColor,
    Color? discountTextColor,
    Color? overlayColor,
    Color? focusColor,
    Color? selectedColor,
    Color? skeletonColor,
  }) = _AppProductCardColors;

  factory AppProductCardColors.fromJson(Map<String, dynamic> json) =>
      _$AppProductCardColorsFromJson(json);
}

/// Configuración de espaciado
@freezed
class AppProductCardSpacing with _$AppProductCardSpacing {
  const factory AppProductCardSpacing({
    @Default(EdgeInsets.all(12)) EdgeInsets padding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(4.0) double elevation,
    @Default(8.0) double contentGap,
    @Default(150.0) double minWidth,
    @Default(200.0) double minHeight,
    @Default(1.5) double imageAspectRatio,
  }) = _AppProductCardSpacing;

  factory AppProductCardSpacing.fromJson(Map<String, dynamic> json) =>
      _$AppProductCardSpacingFromJson(json);
}

/// Configuración de animaciones
@freezed
class AppProductCardAnimation with _$AppProductCardAnimation {
  const factory AppProductCardAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Duration(milliseconds: 150)) Duration hoverDuration,
    @Default(Curves.easeOut) Curve hoverCurve,
    @Default(true) bool enableScaleAnimation,
    @Default(1.02) double hoverScale,
    @Default(0.98) double pressScale,
  }) = _AppProductCardAnimation;

  factory AppProductCardAnimation.fromJson(Map<String, dynamic> json) =>
      _$AppProductCardAnimationFromJson(json);
}

/// Configuración de comportamiento
@freezed
class AppProductCardBehavior with _$AppProductCardBehavior {
  const factory AppProductCardBehavior({
    @Default(true) bool clickable,
    @Default(true) bool selectable,
    @Default(false) bool multiSelect,
    @Default(true) bool showTooltip,
    @Default(true) bool lazyLoadImage,
    @Default(true) bool cacheImage,
    @Default(AppProductCardLayout.vertical) AppProductCardLayout layout,
  }) = _AppProductCardBehavior;

  factory AppProductCardBehavior.fromJson(Map<String, dynamic> json) =>
      _$AppProductCardBehaviorFromJson(json);
}

/// Layout de la tarjeta
enum AppProductCardLayout {
  /// Imagen arriba, contenido abajo
  vertical,

  /// Imagen a la izquierda, contenido a la derecha
  horizontal,

  /// Imagen de fondo con overlay
  overlay,

  /// Layout compacto
  compact,
}

/// Configuración de accesibilidad
@freezed
class AppProductCardA11yConfig with _$AppProductCardA11yConfig {
  const factory AppProductCardA11yConfig({
    String? productLabel,
    String? priceLabel,
    String? discountLabel,
    String? imageDescription,
    @Default(true) bool announceSelection,
    @Default(true) bool announcePrice,
    @Default(true) bool announceDiscount,
    @Default(true) bool enableKeyboardNavigation,
  }) = _AppProductCardA11yConfig;

  factory AppProductCardA11yConfig.fromJson(Map<String, dynamic> json) =>
      _$AppProductCardA11yConfigFromJson(json);
}

/// Extensiones para AppProductCardVariant
extension AppProductCardVariantExtensions on AppProductCardVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppProductCardVariant.price:
        return 'Precio';
      case AppProductCardVariant.discount:
        return 'Descuento';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case AppProductCardVariant.price:
        return Icons.attach_money;
      case AppProductCardVariant.discount:
        return Icons.local_offer;
    }
  }

  /// Si muestra el precio original tachado
  bool get showOriginalPrice {
    return this == AppProductCardVariant.discount;
  }

  /// Si muestra chip de descuento
  bool get showDiscountChip {
    return this == AppProductCardVariant.discount;
  }
}

/// Extensiones para AppProductCardState
extension AppProductCardStateExtensions on AppProductCardState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppProductCardState.defaultState:
        return 'Normal';
      case AppProductCardState.hover:
        return 'Hover';
      case AppProductCardState.pressed:
        return 'Presionado';
      case AppProductCardState.focus:
        return 'Enfocado';
      case AppProductCardState.selected:
        return 'Seleccionado';
      case AppProductCardState.disabled:
        return 'Deshabilitado';
      case AppProductCardState.loading:
        return 'Cargando';
      case AppProductCardState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado es interactivo
  bool get isInteractive {
    return this != AppProductCardState.disabled &&
           this != AppProductCardState.loading &&
           this != AppProductCardState.skeleton;
  }

  /// Opacidad del estado
  double get opacity {
    switch (this) {
      case AppProductCardState.disabled:
        return 0.5;
      case AppProductCardState.loading:
        return 0.7;
      default:
        return 1.0;
    }
  }

  /// Elevación del estado
  double get elevation {
    switch (this) {
      case AppProductCardState.hover:
        return 8.0;
      case AppProductCardState.pressed:
        return 2.0;
      case AppProductCardState.selected:
        return 6.0;
      default:
        return 4.0;
    }
  }
}

/// Extensiones para AppProductPrice
extension AppProductPriceExtensions on AppProductPrice {
  /// Calcula el porcentaje de descuento
  double? get discountPercentage {
    if (originalPrice == null || originalPrice! <= 0) return null;
    if (amount >= originalPrice!) return null;
    return ((originalPrice! - amount) / originalPrice! * 100);
  }

  /// Formatea el precio según la configuración
  String formatPrice() {
    final currencySymbol = currency ?? '\$';
    String formattedAmount;

    switch (format) {
      case AppPriceFormat.compact:
        formattedAmount = amount.toStringAsFixed(0);
        break;
      case AppPriceFormat.withThousands:
        formattedAmount = _formatWithThousands(amount, decimalPlaces);
        break;
      case AppPriceFormat.localized:
        // Aquí iría la lógica de localización real
        formattedAmount = _formatWithThousands(amount, decimalPlaces);
        break;
      case AppPriceFormat.standard:
        formattedAmount = amount.toStringAsFixed(decimalPlaces);
    }

    return showCurrency ? '$currencySymbol$formattedAmount' : formattedAmount;
  }

  /// Formatea el precio original
  String? formatOriginalPrice() {
    if (originalPrice == null) return null;
    final currencySymbol = currency ?? '\$';
    final formattedAmount = _formatWithThousands(originalPrice!, decimalPlaces);
    return showCurrency ? '$currencySymbol$formattedAmount' : formattedAmount;
  }

  /// Formatea el descuento como texto
  String formatDiscount() {
    final percentage = discountPercentage;
    if (percentage == null) return '';
    return '-${percentage.toStringAsFixed(0)}%';
  }

  /// Helper para formatear con separador de miles
  String _formatWithThousands(double value, int decimalPlaces) {
    final parts = value.toStringAsFixed(decimalPlaces).split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final formattedInteger = integerPart.replaceAllMapped(
      regex,
      (Match m) => '${m[1]},',
    );

    return decimalPart.isNotEmpty ? '$formattedInteger.$decimalPart' : formattedInteger;
  }
}

/// Extensiones para AppDiscountChipPosition
extension AppDiscountChipPositionExtensions on AppDiscountChipPosition {
  /// Alineación en el Stack
  Alignment get alignment {
    switch (this) {
      case AppDiscountChipPosition.topLeft:
        return Alignment.topLeft;
      case AppDiscountChipPosition.topRight:
        return Alignment.topRight;
      case AppDiscountChipPosition.bottomLeft:
        return Alignment.bottomLeft;
      case AppDiscountChipPosition.bottomRight:
        return Alignment.bottomRight;
    }
  }

  /// Margen del chip
  EdgeInsets get margin {
    const spacing = 8.0;
    switch (this) {
      case AppDiscountChipPosition.topLeft:
        return const EdgeInsets.only(top: spacing, left: spacing);
      case AppDiscountChipPosition.topRight:
        return const EdgeInsets.only(top: spacing, right: spacing);
      case AppDiscountChipPosition.bottomLeft:
        return const EdgeInsets.only(bottom: spacing, left: spacing);
      case AppDiscountChipPosition.bottomRight:
        return const EdgeInsets.only(bottom: spacing, right: spacing);
    }
  }
}

/// Extensiones para AppProductCardLayout
extension AppProductCardLayoutExtensions on AppProductCardLayout {
  /// Si el layout es vertical
  bool get isVertical => this == AppProductCardLayout.vertical;

  /// Si el layout es horizontal
  bool get isHorizontal => this == AppProductCardLayout.horizontal;

  /// Si el layout tiene overlay
  bool get hasOverlay => this == AppProductCardLayout.overlay;

  /// Si el layout es compacto
  bool get isCompact => this == AppProductCardLayout.compact;

  /// Aspect ratio recomendado de la imagen
  double get recommendedImageRatio {
    switch (this) {
      case AppProductCardLayout.vertical:
        return 1.0;
      case AppProductCardLayout.horizontal:
        return 0.75;
      case AppProductCardLayout.overlay:
        return 1.5;
      case AppProductCardLayout.compact:
        return 0.5;
    }
  }
}