import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_product_card_config.freezed.dart';

/// Configuración completa para el componente DSProductCard
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento de la tarjeta de producto
@freezed
class DSProductCardConfig with _$DSProductCardConfig {
  const factory DSProductCardConfig({
    @Default(DSProductCardVariant.price) DSProductCardVariant variant,
    @Default(DSProductCardState.defaultState) DSProductCardState state,
    DSProductCardColors? colors,
    DSProductCardSpacing? spacing,
    DSProductCardAnimation? animation,
    DSProductCardBehavior? behavior,
    DSProductCardA11yConfig? a11yConfig,
  }) = _DSProductCardConfig;

}

/// Variantes de la tarjeta de producto
enum DSProductCardVariant {
  /// Solo muestra el precio sin descuento
  price,

  /// Muestra el precio con descuento
  discount,
}

/// Estados interactivos de la tarjeta
enum DSProductCardState {
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
class DSDiscountChip with _$DSDiscountChip {
  const factory DSDiscountChip({
    required String text,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    @Default(true) bool visible,
    @Default(DSDiscountChipPosition.topRight) DSDiscountChipPosition position,
  }) = _DSDiscountChip;

}

/// Posición del chip de descuento
enum DSDiscountChipPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

/// Configuración de imagen del producto
@freezed
class DSProductImage with _$DSProductImage {
  const factory DSProductImage({
    required String url,
    String? placeholder,
    @Default(BoxFit.cover) BoxFit fit,
    @Default(1.0) double aspectRatio,
    Widget? errorWidget,
  }) = _DSProductImage;

}

/// Configuración de precio
@freezed
class DSProductPrice with _$DSProductPrice {
  const factory DSProductPrice({
    required double amount,
    String? currency,
    @Default(DSPriceFormat.standard) DSPriceFormat format,
    double? originalPrice,
    @Default(true) bool showCurrency,
    @Default(2) int decimalPlaces,
  }) = _DSProductPrice;

}

/// Formato de precio
enum DSPriceFormat {
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
class DSProductCardColors with _$DSProductCardColors {
  const factory DSProductCardColors({
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
  }) = _DSProductCardColors;

}

/// Configuración de espaciado
@freezed
class DSProductCardSpacing with _$DSProductCardSpacing {
  const factory DSProductCardSpacing({
    @Default(EdgeInsets.all(12)) EdgeInsets padding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(4.0) double elevation,
    @Default(8.0) double contentGap,
    @Default(150.0) double minWidth,
    @Default(200.0) double minHeight,
    @Default(1.5) double imageAspectRatio,
  }) = _DSProductCardSpacing;

}

/// Configuración de animaciones
@freezed
class DSProductCardAnimation with _$DSProductCardAnimation {
  const factory DSProductCardAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Duration(milliseconds: 150)) Duration hoverDuration,
    @Default(Curves.easeOut) Curve hoverCurve,
    @Default(true) bool enableScaleAnimation,
    @Default(1.02) double hoverScale,
    @Default(0.98) double pressScale,
  }) = _DSProductCardAnimation;

}

/// Configuración de comportamiento
@freezed
class DSProductCardBehavior with _$DSProductCardBehavior {
  const factory DSProductCardBehavior({
    @Default(true) bool clickable,
    @Default(true) bool selectable,
    @Default(false) bool multiSelect,
    @Default(true) bool showTooltip,
    @Default(true) bool lazyLoadImage,
    @Default(true) bool cacheImage,
    @Default(DSProductCardLayout.vertical) DSProductCardLayout layout,
  }) = _DSProductCardBehavior;

}

/// Layout de la tarjeta
enum DSProductCardLayout {
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
class DSProductCardA11yConfig with _$DSProductCardA11yConfig {
  const factory DSProductCardA11yConfig({
    String? productLabel,
    String? priceLabel,
    String? discountLabel,
    String? imageDescription,
    @Default(true) bool announceSelection,
    @Default(true) bool announcePrice,
    @Default(true) bool announceDiscount,
    @Default(true) bool enableKeyboardNavigation,
  }) = _DSProductCardA11yConfig;

}

/// Extensiones para DSProductCardVariant
extension DSProductCardVariantExtensions on DSProductCardVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSProductCardVariant.price:
        return 'Precio';
      case DSProductCardVariant.discount:
        return 'Descuento';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case DSProductCardVariant.price:
        return Icons.attach_money;
      case DSProductCardVariant.discount:
        return Icons.local_offer;
    }
  }

  /// Si muestra el precio original tachado
  bool get showOriginalPrice {
    return this == DSProductCardVariant.discount;
  }

  /// Si muestra chip de descuento
  bool get showDiscountChip {
    return this == DSProductCardVariant.discount;
  }
}

/// Extensiones para DSProductCardState
extension DSProductCardStateExtensions on DSProductCardState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSProductCardState.defaultState:
        return 'Normal';
      case DSProductCardState.hover:
        return 'Hover';
      case DSProductCardState.pressed:
        return 'Presionado';
      case DSProductCardState.focus:
        return 'Enfocado';
      case DSProductCardState.selected:
        return 'Seleccionado';
      case DSProductCardState.disabled:
        return 'Deshabilitado';
      case DSProductCardState.loading:
        return 'Cargando';
      case DSProductCardState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado es interactivo
  bool get isInteractive {
    return this != DSProductCardState.disabled &&
           this != DSProductCardState.loading &&
           this != DSProductCardState.skeleton;
  }

  /// Opacidad del estado
  double get opacity {
    switch (this) {
      case DSProductCardState.disabled:
        return 0.5;
      case DSProductCardState.loading:
        return 0.7;
      default:
        return 1.0;
    }
  }

  /// Elevación del estado
  double get elevation {
    switch (this) {
      case DSProductCardState.hover:
        return 8.0;
      case DSProductCardState.pressed:
        return 2.0;
      case DSProductCardState.selected:
        return 6.0;
      default:
        return 4.0;
    }
  }
}

/// Extensiones para DSProductPrice
extension DSProductPriceExtensions on DSProductPrice {
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
      case DSPriceFormat.compact:
        formattedAmount = amount.toStringAsFixed(0);
        break;
      case DSPriceFormat.withThousands:
        formattedAmount = _formatWithThousands(amount, decimalPlaces);
        break;
      case DSPriceFormat.localized:
        // Aquí iría la lógica de localización real
        formattedAmount = _formatWithThousands(amount, decimalPlaces);
        break;
      case DSPriceFormat.standard:
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

/// Extensiones para DSDiscountChipPosition
extension DSDiscountChipPositionExtensions on DSDiscountChipPosition {
  /// Alineación en el Stack
  Alignment get alignment {
    switch (this) {
      case DSDiscountChipPosition.topLeft:
        return Alignment.topLeft;
      case DSDiscountChipPosition.topRight:
        return Alignment.topRight;
      case DSDiscountChipPosition.bottomLeft:
        return Alignment.bottomLeft;
      case DSDiscountChipPosition.bottomRight:
        return Alignment.bottomRight;
    }
  }

  /// Margen del chip
  EdgeInsets get margin {
    const spacing = 8.0;
    switch (this) {
      case DSDiscountChipPosition.topLeft:
        return const EdgeInsets.only(top: spacing, left: spacing);
      case DSDiscountChipPosition.topRight:
        return const EdgeInsets.only(top: spacing, right: spacing);
      case DSDiscountChipPosition.bottomLeft:
        return const EdgeInsets.only(bottom: spacing, left: spacing);
      case DSDiscountChipPosition.bottomRight:
        return const EdgeInsets.only(bottom: spacing, right: spacing);
    }
  }
}

/// Extensiones para DSProductCardLayout
extension DSProductCardLayoutExtensions on DSProductCardLayout {
  /// Si el layout es vertical
  bool get isVertical => this == DSProductCardLayout.vertical;

  /// Si el layout es horizontal
  bool get isHorizontal => this == DSProductCardLayout.horizontal;

  /// Si el layout tiene overlay
  bool get hasOverlay => this == DSProductCardLayout.overlay;

  /// Si el layout es compacto
  bool get isCompact => this == DSProductCardLayout.compact;

  /// Aspect ratio recomendado de la imagen
  double get recommendedImageRatio {
    switch (this) {
      case DSProductCardLayout.vertical:
        return 1.0;
      case DSProductCardLayout.horizontal:
        return 0.75;
      case DSProductCardLayout.overlay:
        return 1.5;
      case DSProductCardLayout.compact:
        return 0.5;
    }
  }
}