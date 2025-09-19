import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'package:iautomat_design_system/src/components/product_card/ds_product_card_config.dart';

/// Helper de accesibilidad para DSProductCard
///
/// Maneja todos los aspectos de accesibilidad incluyendo:
/// - Etiquetas semánticas para lectores de pantalla
/// - Navegación por teclado
/// - Soporte RTL
/// - Anuncios de cambios de estado
class DSProductCardA11yHelper {
  final DSProductCardA11yConfig config;

  DSProductCardA11yHelper({
    required this.config,
  });

  /// Construye el wrapper semántico para la tarjeta
  Widget buildSemanticWrapper({
    required BuildContext context,
    required String title,
    required DSProductPrice price,
    DSDiscountChip? discountChip,
    required DSProductCardState state,
    required bool isRtl,
    required Widget child,
  }) {
    final semanticLabel = _buildSemanticLabel(
      title: title,
      price: price,
      discountChip: discountChip,
      state: state,
      isRtl: isRtl,
    );

    final semanticHint = _buildSemanticHint(state, isRtl);

    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      button: state.isInteractive,
      selected: state == DSProductCardState.selected,
      enabled: state != DSProductCardState.disabled,
      focusable: state.isInteractive,
      focused: state == DSProductCardState.focus,
      child: ExcludeSemantics(
        excluding: state == DSProductCardState.skeleton,
        child: child,
      ),
    );
  }

  /// Construye la etiqueta semántica
  String _buildSemanticLabel({
    required String title,
    required DSProductPrice price,
    DSDiscountChip? discountChip,
    required DSProductCardState state,
    required bool isRtl,
  }) {
    final buffer = StringBuffer();

    // Producto
    buffer.write(config.productLabel ?? 'Producto');
    buffer.write(': ');
    buffer.write(title);

    // Precio
    if (config.announcePrice) {
      buffer.write('. ');
      buffer.write(config.priceLabel ?? 'Precio');
      buffer.write(': ');
      buffer.write(price.formatPrice());

      // Precio original si hay descuento
      if (price.originalPrice != null) {
        buffer.write('. ');
        buffer.write('Precio original: ');
        buffer.write(price.formatOriginalPrice());
      }
    }

    // Descuento
    if (config.announceDiscount && discountChip != null && discountChip.visible) {
      buffer.write('. ');
      buffer.write(config.discountLabel ?? 'Descuento');
      buffer.write(': ');
      buffer.write(discountChip.text);
    }

    // Estado
    if (state != DSProductCardState.defaultState) {
      buffer.write('. ');
      buffer.write(_getStateDescription(state, isRtl));
    }

    return buffer.toString();
  }

  /// Construye el hint semántico
  String _buildSemanticHint(DSProductCardState state, bool isRtl) {
    if (!state.isInteractive) {
      return isRtl ? 'غير متاح' : 'Not available';
    }

    if (state == DSProductCardState.selected) {
      return isRtl
          ? 'اضغط مرتين لإلغاء التحديد'
          : 'Double tap to deselect';
    }

    return isRtl
        ? 'اضغط مرتين للتحديد أو عرض التفاصيل'
        : 'Double tap to select or view details';
  }

  /// Obtiene la descripción del estado para accesibilidad
  String _getStateDescription(DSProductCardState state, bool isRtl) {
    if (isRtl) {
      switch (state) {
        case DSProductCardState.hover:
          return 'مؤشر فوق البطاقة';
        case DSProductCardState.pressed:
          return 'مضغوط';
        case DSProductCardState.focus:
          return 'مركز عليه';
        case DSProductCardState.selected:
          return 'محدد';
        case DSProductCardState.disabled:
          return 'معطل';
        case DSProductCardState.loading:
          return 'جاري التحميل';
        case DSProductCardState.skeleton:
          return 'محتوى غير محمل';
        case DSProductCardState.defaultState:
          return '';
      }
    } else {
      switch (state) {
        case DSProductCardState.hover:
          return 'Hovered';
        case DSProductCardState.pressed:
          return 'Pressed';
        case DSProductCardState.focus:
          return 'Focused';
        case DSProductCardState.selected:
          return 'Selected';
        case DSProductCardState.disabled:
          return 'Disabled';
        case DSProductCardState.loading:
          return 'Loading';
        case DSProductCardState.skeleton:
          return 'Content not loaded';
        case DSProductCardState.defaultState:
          return '';
      }
    }
  }

  /// Maneja eventos de teclado
  KeyEventResult handleKeyEvent(
    KeyEvent event, {
    VoidCallback? onActivate,
    VoidCallback? onSelect,
  }) {
    if (!config.enableKeyboardNavigation) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.numpadEnter:
          onActivate?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.space:
          onSelect?.call();
          return KeyEventResult.handled;

        default:
          return KeyEventResult.ignored;
      }
    }

    return KeyEventResult.ignored;
  }

  /// Anuncia cambios de estado
  void announceStateChange(DSProductCardState state) {
    if (!config.announceSelection && state == DSProductCardState.selected) {
      return;
    }

    final message = _getStateAnnouncementMessage(state);
    if (message.isNotEmpty) {
      SemanticsService.announce(
        message,
        TextDirection.ltr,
      );
    }
  }

  /// Obtiene el mensaje de anuncio para un estado
  String _getStateAnnouncementMessage(DSProductCardState state) {
    switch (state) {
      case DSProductCardState.selected:
        return 'Producto seleccionado';
      case DSProductCardState.focus:
        return 'Producto enfocado. Presione Enter para seleccionar';
      case DSProductCardState.disabled:
        return 'Producto no disponible';
      case DSProductCardState.loading:
        return 'Cargando información del producto';
      default:
        return '';
    }
  }

  /// Anuncia cambios de precio
  void announcePriceChange(DSProductPrice newPrice) {
    if (!config.announcePrice) return;

    final message = 'Precio actualizado: ${newPrice.formatPrice()}';

    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  /// Anuncia cambios de descuento
  void announceDiscountChange(DSDiscountChip? discountChip) {
    if (!config.announceDiscount || discountChip == null) return;

    final message = 'Descuento aplicado: ${discountChip.text}';

    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  /// Resuelve la dirección del texto según RTL
  TextDirection resolveTextDirection(BuildContext context, bool isRtl) {
    return isRtl ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Resuelve la alineación según RTL
  Alignment resolveAlignment(Alignment alignment, bool isRtl) {
    if (!isRtl) return alignment;

    if (alignment == Alignment.topLeft) return Alignment.topRight;
    if (alignment == Alignment.topRight) return Alignment.topLeft;
    if (alignment == Alignment.bottomLeft) return Alignment.bottomRight;
    if (alignment == Alignment.bottomRight) return Alignment.bottomLeft;
    if (alignment == Alignment.centerLeft) return Alignment.centerRight;
    if (alignment == Alignment.centerRight) return Alignment.centerLeft;

    return alignment;
  }

  /// Resuelve el padding según RTL
  EdgeInsetsGeometry resolvePadding(EdgeInsets padding, bool isRtl) {
    if (!isRtl) return padding;

    return EdgeInsetsDirectional.fromSTEB(
      padding.right,
      padding.top,
      padding.left,
      padding.bottom,
    );
  }

  /// Construye instrucciones de navegación por teclado
  Widget buildKeyboardInstructions(BuildContext context) {
    if (!config.enableKeyboardNavigation) {
      return const SizedBox.shrink();
    }

    return Semantics(
      label: 'Instrucciones de navegación',
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Navegación por teclado:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            const Text('• Tab: Navegar entre productos'),
            const Text('• Enter: Activar/Ver detalles'),
            const Text('• Espacio: Seleccionar/Deseleccionar'),
            const Text('• Esc: Cancelar selección'),
          ],
        ),
      ),
    );
  }

  /// Genera descripción de precio para lectores de pantalla
  String generatePriceDescription(
    DSProductPrice price, {
    required bool includeDiscount,
    bool isRtl = false,
  }) {
    final buffer = StringBuffer();

    if (isRtl) {
      buffer.write('السعر: ');
      buffer.write(price.formatPrice());

      if (includeDiscount && price.originalPrice != null) {
        buffer.write('، السعر الأصلي: ');
        buffer.write(price.formatOriginalPrice());

        if (price.discountPercentage != null) {
          buffer.write('، خصم ');
          buffer.write(price.discountPercentage!.toStringAsFixed(0));
          buffer.write('٪');
        }
      }
    } else {
      buffer.write('Price: ');
      buffer.write(price.formatPrice());

      if (includeDiscount && price.originalPrice != null) {
        buffer.write(', original price: ');
        buffer.write(price.formatOriginalPrice());

        if (price.discountPercentage != null) {
          buffer.write(', ');
          buffer.write(price.discountPercentage!.toStringAsFixed(0));
          buffer.write('% off');
        }
      }
    }

    return buffer.toString();
  }

  /// Verifica si el modo de alto contraste está habilitado
  bool isHighContrastMode(BuildContext context) {
    return MediaQuery.of(context).highContrast;
  }

  /// Ajusta colores para alto contraste si es necesario
  Color adjustColorForHighContrast(
    Color color,
    BuildContext context, {
    bool isBackground = false,
  }) {
    if (!isHighContrastMode(context)) return color;

    // En modo de alto contraste, aumentar el contraste de los colores
    final brightness = Theme.of(context).brightness;

    if (isBackground) {
      return brightness == Brightness.light
          ? Colors.white
          : Colors.black;
    } else {
      return brightness == Brightness.light
          ? Colors.black
          : Colors.white;
    }
  }

  /// Genera descripción completa del producto para accesibilidad
  String generateFullProductDescription({
    required String title,
    required DSProductPrice price,
    DSDiscountChip? discountChip,
    String? additionalInfo,
    required DSProductCardState state,
    bool isRtl = false,
  }) {
    final buffer = StringBuffer();

    // Título
    buffer.write(title);

    // Precio
    buffer.write('. ');
    buffer.write(generatePriceDescription(
      price,
      includeDiscount: discountChip != null,
      isRtl: isRtl,
    ));

    // Información adicional
    if (additionalInfo != null && additionalInfo.isNotEmpty) {
      buffer.write('. ');
      buffer.write(additionalInfo);
    }

    // Estado
    final stateDesc = _getStateDescription(state, isRtl);
    if (stateDesc.isNotEmpty) {
      buffer.write('. ');
      buffer.write(stateDesc);
    }

    return buffer.toString();
  }
}