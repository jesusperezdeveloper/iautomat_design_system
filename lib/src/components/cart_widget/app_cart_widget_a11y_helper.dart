import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget_config.dart';

/// Helper de accesibilidad para AppCartWidget
///
/// Maneja todos los aspectos de accesibilidad incluyendo:
/// - Etiquetas semánticas para lectores de pantalla
/// - Navegación por teclado
/// - Soporte RTL
/// - Anuncios de cambios de estado y cantidades
class AppCartWidgetA11yHelper {
  final AppCartA11yConfig config;

  AppCartWidgetA11yHelper({
    required this.config,
  });

  /// Construye el wrapper semántico para el carrito
  Widget buildSemanticWrapper({
    required BuildContext context,
    required AppCartSummary summary,
    required AppCartState state,
    required bool isRtl,
    required Widget child,
  }) {
    final semanticLabel = _buildSemanticLabel(
      summary: summary,
      state: state,
      isRtl: isRtl,
    );

    final semanticHint = _buildSemanticHint(state, isRtl);

    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      container: true,
      enabled: state != AppCartState.disabled,
      focusable: state.isInteractive,
      focused: state == AppCartState.focus,
      child: ExcludeSemantics(
        excluding: state == AppCartState.skeleton,
        child: child,
      ),
    );
  }

  /// Construye la etiqueta semántica
  String _buildSemanticLabel({
    required AppCartSummary summary,
    required AppCartState state,
    required bool isRtl,
  }) {
    final buffer = StringBuffer();

    // Carrito
    buffer.write(config.cartLabel ?? 'Carrito de compras');

    if (summary.isEmpty) {
      buffer.write(': ');
      buffer.write(config.emptyLabel ?? 'vacío');
    } else {
      buffer.write(': ');
      buffer.write('${summary.itemCount} productos, ');
      buffer.write('${summary.totalQuantity} artículos, ');
      buffer.write('total ${summary.formatTotal()}');
    }

    // Estado
    if (state != AppCartState.defaultState) {
      buffer.write('. ');
      buffer.write(_getStateDescription(state, isRtl));
    }

    return buffer.toString();
  }

  /// Construye el hint semántico
  String _buildSemanticHint(AppCartState state, bool isRtl) {
    if (!state.isInteractive) {
      return isRtl ? 'غير متاح' : 'Not available';
    }

    return isRtl
        ? 'استخدم المفاتيح للتنقل وتعديل الكميات'
        : 'Use keyboard to navigate and modify quantities';
  }

  /// Obtiene la descripción del estado para accesibilidad
  String _getStateDescription(AppCartState state, bool isRtl) {
    if (isRtl) {
      switch (state) {
        case AppCartState.hover:
          return 'مؤشر فوق السلة';
        case AppCartState.pressed:
          return 'مضغوط';
        case AppCartState.focus:
          return 'مركز عليه';
        case AppCartState.selected:
          return 'محدد';
        case AppCartState.disabled:
          return 'معطل';
        case AppCartState.loading:
          return 'جاري التحميل';
        case AppCartState.skeleton:
          return 'محتوى غير محمل';
        case AppCartState.defaultState:
          return '';
      }
    } else {
      switch (state) {
        case AppCartState.hover:
          return 'Hovered';
        case AppCartState.pressed:
          return 'Pressed';
        case AppCartState.focus:
          return 'Focused';
        case AppCartState.selected:
          return 'Selected';
        case AppCartState.disabled:
          return 'Disabled';
        case AppCartState.loading:
          return 'Loading';
        case AppCartState.skeleton:
          return 'Content not loaded';
        case AppCartState.defaultState:
          return '';
      }
    }
  }

  /// Maneja eventos de teclado
  KeyEventResult handleKeyEvent(
    KeyEvent event, {
    VoidCallback? onToggleExpand,
    VoidCallback? onCheckout,
    VoidCallback? onScrollUp,
    VoidCallback? onScrollDown,
  }) {
    if (!config.enableKeyboardNavigation) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.numpadEnter:
          onCheckout?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.space:
          onToggleExpand?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowUp:
          onScrollUp?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowDown:
          onScrollDown?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.escape:
          // Cerrar/colapsar carrito
          onToggleExpand?.call();
          return KeyEventResult.handled;

        default:
          return KeyEventResult.ignored;
      }
    }

    return KeyEventResult.ignored;
  }

  /// Anuncia cambios de estado
  void announceStateChange(AppCartState state) {
    final message = _getStateAnnouncementMessage(state);
    if (message.isNotEmpty) {
      SemanticsService.announce(
        message,
        TextDirection.ltr,
      );
    }
  }

  /// Obtiene el mensaje de anuncio para un estado
  String _getStateAnnouncementMessage(AppCartState state) {
    switch (state) {
      case AppCartState.focus:
        return 'Carrito enfocado. Use teclas para navegar';
      case AppCartState.disabled:
        return 'Carrito no disponible';
      case AppCartState.loading:
        return 'Procesando carrito';
      default:
        return '';
    }
  }

  /// Anuncia cambios de cantidad
  void announceQuantityChange(String itemId, int newQuantity) {
    if (!config.announceQuantityChanges) return;

    final message = newQuantity > 0
        ? 'Cantidad actualizada a $newQuantity'
        : 'Producto eliminado del carrito';

    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  /// Anuncia cambios de items
  void announceItemChange(AppCartItem item, bool added) {
    if (!config.announceItemChanges) return;

    final message = added
        ? '${item.name} agregado al carrito'
        : '${item.name} actualizado en el carrito';

    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  /// Anuncia eliminación de items
  void announceItemRemoval(String itemId) {
    if (!config.announceItemChanges) return;

    SemanticsService.announce(
      'Producto eliminado del carrito',
      TextDirection.ltr,
    );
  }

  /// Anuncia cambios de total
  void announceTotalChange(AppCartSummary summary) {
    if (!config.announceTotalChanges) return;

    final message = summary.isEmpty
        ? 'Carrito vacío'
        : 'Total actualizado: ${summary.formatTotal()}';

    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  /// Anuncia checkout
  void announceCheckout(AppCartSummary summary) {
    if (!config.announceCheckout) return;

    final message = 'Procediendo al pago. Total: ${summary.formatTotal()}';

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

  /// Construye etiquetas semánticas para items del carrito
  Widget buildItemSemanticWrapper({
    required BuildContext context,
    required AppCartItem item,
    required bool isRtl,
    required Widget child,
  }) {
    return Semantics(
      label: _buildItemSemanticLabel(item, isRtl),
      hint: isRtl
          ? 'اضغط مرتين لعرض التفاصيل'
          : 'Double tap for details',
      button: true,
      child: child,
    );
  }

  /// Construye etiqueta semántica para un item
  String _buildItemSemanticLabel(AppCartItem item, bool isRtl) {
    final buffer = StringBuffer();

    if (isRtl) {
      buffer.write('المنتج: ${item.name}');
      if (item.description != null && item.description!.isNotEmpty) {
        buffer.write('، ${item.description}');
      }
      buffer.write('، الكمية: ${item.quantity}');
      buffer.write('، السعر: ${item.formatPrice()}');
      if (item.hasDiscount) {
        buffer.write('، السعر الأصلي: ${item.formatOriginalPrice()}');
        buffer.write('، خصم ${item.discountPercentage.toStringAsFixed(0)}٪');
      }
      buffer.write('، المجموع: ${item.formatTotalPrice()}');
    } else {
      buffer.write(config.itemLabel ?? 'Item');
      buffer.write(': ${item.name}');
      if (item.description != null && item.description!.isNotEmpty) {
        buffer.write(', ${item.description}');
      }
      buffer.write(', ${config.quantityLabel ?? 'Quantity'}: ${item.quantity}');
      buffer.write(', ${config.priceLabel ?? 'Price'}: ${item.formatPrice()}');
      if (item.hasDiscount) {
        buffer.write(', Original price: ${item.formatOriginalPrice()}');
        buffer.write(', ${item.discountPercentage.toStringAsFixed(0)}% off');
      }
      buffer.write(', Total: ${item.formatTotalPrice()}');
    }

    return buffer.toString();
  }

  /// Construye etiquetas para controles de cantidad
  Widget buildQuantityControlSemantics({
    required BuildContext context,
    required AppCartItem item,
    required Widget decreaseButton,
    required Widget increaseButton,
    required Widget quantityDisplay,
    required bool isRtl,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label: isRtl
              ? 'تقليل الكمية'
              : config.decreaseLabel ?? 'Decrease quantity',
          hint: isRtl
              ? 'اضغط مرتين لتقليل الكمية'
              : 'Double tap to decrease quantity',
          button: true,
          enabled: item.canDecreaseQuantity,
          child: decreaseButton,
        ),
        Semantics(
          label: isRtl
              ? 'الكمية الحالية: ${item.quantity}'
              : 'Current quantity: ${item.quantity}',
          readOnly: true,
          child: quantityDisplay,
        ),
        Semantics(
          label: isRtl
              ? 'زيادة الكمية'
              : config.increaseLabel ?? 'Increase quantity',
          hint: isRtl
              ? 'اضغط مرتين لزيادة الكمية'
              : 'Double tap to increase quantity',
          button: true,
          enabled: item.canIncreaseQuantity,
          child: increaseButton,
        ),
      ],
    );
  }

  /// Construye etiquetas para botón de checkout
  Widget buildCheckoutButtonSemantics({
    required BuildContext context,
    required AppCartSummary summary,
    required Widget button,
    required bool isRtl,
  }) {
    return Semantics(
      label: isRtl
          ? 'متابعة الدفع'
          : config.checkoutLabel ?? 'Proceed to checkout',
      hint: isRtl
          ? 'اضغط مرتين للمتابعة إلى الدفع. المجموع: ${summary.formatTotal()}'
          : 'Double tap to proceed to checkout. Total: ${summary.formatTotal()}',
      button: true,
      enabled: summary.hasItems,
      child: button,
    );
  }

  /// Construye instrucciones de navegación por teclado
  Widget buildKeyboardInstructions(BuildContext context, {bool isRtl = false}) {
    if (!config.enableKeyboardNavigation) {
      return const SizedBox.shrink();
    }

    return Semantics(
      label: isRtl ? 'تعليمات التنقل' : 'Navigation instructions',
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
              isRtl ? 'التنقل بالكيبورد:' : 'Keyboard navigation:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            if (isRtl) ...[
              const Text('• Tab: التنقل بين العناصر'),
              const Text('• Enter: المتابعة للدفع'),
              const Text('• مسطرة المسافة: توسيع/طي السلة'),
              const Text('• الأسهم: التمرير في القائمة'),
              const Text('• Esc: إغلاق السلة'),
            ] else ...[
              const Text('• Tab: Navigate between elements'),
              const Text('• Enter: Proceed to checkout'),
              const Text('• Space: Expand/collapse cart'),
              const Text('• Arrow keys: Scroll through list'),
              const Text('• Esc: Close cart'),
            ],
          ],
        ),
      ),
    );
  }

  /// Genera descripción completa del carrito para accesibilidad
  String generateFullCartDescription({
    required AppCartSummary summary,
    required List<AppCartItem> items,
    required AppCartState state,
    bool isRtl = false,
  }) {
    final buffer = StringBuffer();

    if (isRtl) {
      if (summary.isEmpty) {
        buffer.write('سلة التسوق فارغة');
      } else {
        buffer.write('سلة التسوق تحتوي على ${summary.itemCount} منتجات، ');
        buffer.write('${summary.totalQuantity} قطعة إجمالي. ');
        buffer.write('المجموع الفرعي: ${summary.formatSubtotal()}. ');
        if (summary.hasTaxes) {
          buffer.write('الضرائب: ${summary.formatTaxes()}. ');
        }
        if (summary.hasShipping) {
          buffer.write('الشحن: ${summary.formatShipping()}. ');
        }
        if (summary.hasDiscount) {
          buffer.write('الخصم: ${summary.formatDiscount()}. ');
        }
        buffer.write('المجموع الكلي: ${summary.formatTotal()}');
      }
    } else {
      if (summary.isEmpty) {
        buffer.write('Shopping cart is empty');
      } else {
        buffer.write('Shopping cart contains ${summary.itemCount} products, ');
        buffer.write('${summary.totalQuantity} items total. ');
        buffer.write('Subtotal: ${summary.formatSubtotal()}. ');
        if (summary.hasTaxes) {
          buffer.write('Taxes: ${summary.formatTaxes()}. ');
        }
        if (summary.hasShipping) {
          buffer.write('Shipping: ${summary.formatShipping()}. ');
        }
        if (summary.hasDiscount) {
          buffer.write('Discount: ${summary.formatDiscount()}. ');
        }
        buffer.write('Total: ${summary.formatTotal()}');
      }
    }

    // Estado
    final stateDesc = _getStateDescription(state, isRtl);
    if (stateDesc.isNotEmpty) {
      buffer.write('. ');
      buffer.write(stateDesc);
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

  /// Construye etiquetas para swipe actions
  Widget buildSwipeActionSemantics({
    required BuildContext context,
    required AppCartItem item,
    required Widget swipeWidget,
    required bool isRtl,
  }) {
    if (!config.enableSwipeActions) return swipeWidget;

    return Semantics(
      customSemanticsActions: {
        CustomSemanticsAction(
          label: isRtl
              ? 'حذف من السلة'
              : config.removeLabel ?? 'Remove from cart',
        ): () {
          // La acción se maneja en el widget padre
        },
      },
      child: swipeWidget,
    );
  }

  /// Construye etiquetas para estado vacío
  Widget buildEmptyStateSemantics({
    required BuildContext context,
    required Widget emptyWidget,
    required bool isRtl,
  }) {
    return Semantics(
      label: isRtl
          ? 'سلة التسوق فارغة'
          : config.emptyLabel ?? 'Cart is empty',
      hint: isRtl
          ? 'أضف منتجات لبدء التسوق'
          : 'Add products to start shopping',
      child: emptyWidget,
    );
  }

  /// Construye etiquetas para totales y resumen
  Widget buildSummarySemantics({
    required BuildContext context,
    required AppCartSummary summary,
    required Widget summaryWidget,
    required bool isRtl,
  }) {
    return Semantics(
      label: isRtl
          ? 'ملخص الطلب'
          : 'Order summary',
      hint: generateFullCartDescription(
        summary: summary,
        items: [],
        state: AppCartState.defaultState,
        isRtl: isRtl,
      ),
      child: summaryWidget,
    );
  }
}