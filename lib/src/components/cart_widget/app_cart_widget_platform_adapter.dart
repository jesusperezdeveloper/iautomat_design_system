import 'dart:io' show Platform;
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget_config.dart';

/// Adaptador de plataforma para DSCartWidget
///
/// Maneja las diferencias de renderizado entre Android, iOS y Web
/// para proporcionar una experiencia nativa en cada plataforma
class DSCartWidgetPlatformAdapter {
  /// Construye el carrito según la plataforma
  Widget buildCart({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required DSCartVariant variant,
    required DSCartState state,
    required List<DSCartItem> items,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required ScrollController scrollController,
    Widget? headerWidget,
    Widget? footerWidget,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
    required VoidCallback onToggleExpand,
  }) {
    if (kIsWeb) {
      return _buildWebCart(
        context: context,
        config: config,
        variant: variant,
        state: state,
        items: items,
        summary: summary,
        colors: colors,
        spacing: spacing,
        isExpanded: isExpanded,
        scrollController: scrollController,
        headerWidget: headerWidget,
        footerWidget: footerWidget,
        maxVisibleItems: maxVisibleItems,
        onQuantityChange: onQuantityChange,
        onItemRemove: onItemRemove,
        onItemTap: onItemTap,
        onCheckout: onCheckout,
        onPromoCode: onPromoCode,
        onToggleExpand: onToggleExpand,
      );
    } else if (Platform.isIOS) {
      return _buildIOSCart(
        context: context,
        config: config,
        variant: variant,
        state: state,
        items: items,
        summary: summary,
        colors: colors,
        spacing: spacing,
        isExpanded: isExpanded,
        scrollController: scrollController,
        headerWidget: headerWidget,
        footerWidget: footerWidget,
        maxVisibleItems: maxVisibleItems,
        onQuantityChange: onQuantityChange,
        onItemRemove: onItemRemove,
        onItemTap: onItemTap,
        onCheckout: onCheckout,
        onPromoCode: onPromoCode,
        onToggleExpand: onToggleExpand,
      );
    } else {
      return _buildAndroidCart(
        context: context,
        config: config,
        variant: variant,
        state: state,
        items: items,
        summary: summary,
        colors: colors,
        spacing: spacing,
        isExpanded: isExpanded,
        scrollController: scrollController,
        headerWidget: headerWidget,
        footerWidget: footerWidget,
        maxVisibleItems: maxVisibleItems,
        onQuantityChange: onQuantityChange,
        onItemRemove: onItemRemove,
        onItemTap: onItemTap,
        onCheckout: onCheckout,
        onPromoCode: onPromoCode,
        onToggleExpand: onToggleExpand,
      );
    }
  }

  /// Construye el carrito para Android (Material Design)
  Widget _buildAndroidCart({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required DSCartVariant variant,
    required DSCartState state,
    required List<DSCartItem> items,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required ScrollController scrollController,
    Widget? headerWidget,
    Widget? footerWidget,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
    required VoidCallback onToggleExpand,
  }) {
    return Card(
      elevation: state.elevation,
      color: colors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        side: BorderSide(
          color: state == DSCartState.focus
              ? colors.focusColor ?? Theme.of(context).colorScheme.primary
              : colors.borderColor ?? Colors.transparent,
          width: state == DSCartState.focus ? 2.0 : spacing.borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildCartContent(
        context: context,
        config: config,
        variant: variant,
        state: state,
        items: items,
        summary: summary,
        colors: colors,
        spacing: spacing,
        isExpanded: isExpanded,
        scrollController: scrollController,
        headerWidget: headerWidget,
        footerWidget: footerWidget,
        maxVisibleItems: maxVisibleItems,
        onQuantityChange: onQuantityChange,
        onItemRemove: onItemRemove,
        onItemTap: onItemTap,
        onCheckout: onCheckout,
        onPromoCode: onPromoCode,
        onToggleExpand: onToggleExpand,
      ),
    );
  }

  /// Construye el carrito para iOS (Cupertino)
  Widget _buildIOSCart({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required DSCartVariant variant,
    required DSCartState state,
    required List<DSCartItem> items,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required ScrollController scrollController,
    Widget? headerWidget,
    Widget? footerWidget,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
    required VoidCallback onToggleExpand,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        border: Border.all(
          color: state == DSCartState.focus
              ? colors.focusColor ?? CupertinoColors.activeBlue
              : colors.borderColor ?? CupertinoColors.systemGrey5,
          width: state == DSCartState.focus ? 2.0 : spacing.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.shadowColor?.withValues(alpha: 0.1) ??
                   CupertinoColors.black.withValues(alpha: 0.1),
            blurRadius: state.elevation,
            offset: Offset(0, state.elevation / 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildCartContent(
        context: context,
        config: config,
        variant: variant,
        state: state,
        items: items,
        summary: summary,
        colors: colors,
        spacing: spacing,
        isExpanded: isExpanded,
        scrollController: scrollController,
        headerWidget: headerWidget,
        footerWidget: footerWidget,
        maxVisibleItems: maxVisibleItems,
        onQuantityChange: onQuantityChange,
        onItemRemove: onItemRemove,
        onItemTap: onItemTap,
        onCheckout: onCheckout,
        onPromoCode: onPromoCode,
        onToggleExpand: onToggleExpand,
      ),
    );
  }

  /// Construye el carrito para Web
  Widget _buildWebCart({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required DSCartVariant variant,
    required DSCartState state,
    required List<DSCartItem> items,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required ScrollController scrollController,
    Widget? headerWidget,
    Widget? footerWidget,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
    required VoidCallback onToggleExpand,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        border: Border.all(
          color: state == DSCartState.focus
              ? colors.focusColor ?? Theme.of(context).colorScheme.primary
              : state == DSCartState.hover
                  ? colors.borderColor?.withValues(alpha: 0.5) ?? Theme.of(context).colorScheme.outline
                  : colors.borderColor ?? Colors.transparent,
          width: state == DSCartState.focus ? 2.0 : spacing.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.shadowColor?.withValues(alpha: 0.15) ??
                   Colors.black.withValues(alpha: 0.15),
            blurRadius: state == DSCartState.hover ? state.elevation * 1.5 : state.elevation,
            offset: Offset(0, state == DSCartState.hover ? state.elevation : state.elevation / 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildCartContent(
        context: context,
        config: config,
        variant: variant,
        state: state,
        items: items,
        summary: summary,
        colors: colors,
        spacing: spacing,
        isExpanded: isExpanded,
        scrollController: scrollController,
        headerWidget: headerWidget,
        footerWidget: footerWidget,
        maxVisibleItems: maxVisibleItems,
        onQuantityChange: onQuantityChange,
        onItemRemove: onItemRemove,
        onItemTap: onItemTap,
        onCheckout: onCheckout,
        onPromoCode: onPromoCode,
        onToggleExpand: onToggleExpand,
      ),
    );
  }

  /// Construye el contenido del carrito según la variante
  Widget _buildCartContent({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required DSCartVariant variant,
    required DSCartState state,
    required List<DSCartItem> items,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required ScrollController scrollController,
    Widget? headerWidget,
    Widget? footerWidget,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
    required VoidCallback onToggleExpand,
  }) {
    switch (variant) {
      case DSCartVariant.mini:
        return _buildMiniCart(
          context: context,
          summary: summary,
          colors: colors,
          spacing: spacing,
          onCheckout: onCheckout,
          onToggleExpand: onToggleExpand,
        );
      case DSCartVariant.full:
        return _buildFullCart(
          context: context,
          config: config,
          state: state,
          items: items,
          summary: summary,
          colors: colors,
          spacing: spacing,
          isExpanded: isExpanded,
          scrollController: scrollController,
          headerWidget: headerWidget,
          footerWidget: footerWidget,
          maxVisibleItems: maxVisibleItems,
          onQuantityChange: onQuantityChange,
          onItemRemove: onItemRemove,
          onItemTap: onItemTap,
          onCheckout: onCheckout,
          onPromoCode: onPromoCode,
          onToggleExpand: onToggleExpand,
        );
    }
  }

  /// Construye la variante mini del carrito
  Widget _buildMiniCart({
    required BuildContext context,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required VoidCallback onCheckout,
    required VoidCallback onToggleExpand,
  }) {
    return Padding(
      padding: spacing.padding,
      child: Row(
        children: [
          // Icono del carrito con badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.shopping_cart,
                color: colors.headerColor,
                size: 24,
              ),
              if (summary.hasItems)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: colors.badgeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${summary.totalQuantity}',
                      style: TextStyle(
                        color: colors.badgeTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: spacing.contentGap),
          // Información del carrito
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${summary.itemCount} productos',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.titleColor,
                  ),
                ),
                Text(
                  summary.formatTotal(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.totalColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Botón de checkout
          ElevatedButton(
            onPressed: summary.hasItems ? onCheckout : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.buttonPrimaryColor,
              foregroundColor: colors.buttonTextColor,
              padding: EdgeInsets.symmetric(
                horizontal: spacing.contentGap,
                vertical: spacing.contentGap / 2,
              ),
            ),
            child: const Text('Comprar'),
          ),
        ],
      ),
    );
  }

  /// Construye la variante completa del carrito
  Widget _buildFullCart({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required DSCartState state,
    required List<DSCartItem> items,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required ScrollController scrollController,
    Widget? headerWidget,
    Widget? footerWidget,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
    required VoidCallback onToggleExpand,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header personalizado o por defecto
        headerWidget ?? _buildDefaultHeader(
          context: context,
          summary: summary,
          colors: colors,
          spacing: spacing,
          isExpanded: isExpanded,
          onToggleExpand: onToggleExpand,
        ),
        // Lista de items (expandible)
        if (isExpanded) ...[
          Divider(color: colors.dividerColor, height: 1),
          _buildItemsList(
            context: context,
            config: config,
            items: items,
            colors: colors,
            spacing: spacing,
            scrollController: scrollController,
            maxVisibleItems: maxVisibleItems,
            onQuantityChange: onQuantityChange,
            onItemRemove: onItemRemove,
            onItemTap: onItemTap,
          ),
          Divider(color: colors.dividerColor, height: 1),
          // Resumen y checkout
          _buildCartSummary(
            context: context,
            summary: summary,
            colors: colors,
            spacing: spacing,
            onCheckout: onCheckout,
            onPromoCode: onPromoCode,
          ),
        ],
        // Footer personalizado
        if (footerWidget != null) footerWidget,
      ],
    );
  }

  /// Construye el header por defecto
  Widget _buildDefaultHeader({
    required BuildContext context,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required bool isExpanded,
    required VoidCallback onToggleExpand,
  }) {
    return Container(
      padding: spacing.padding,
      decoration: BoxDecoration(
        color: colors.headerColor,
      ),
      child: Row(
        children: [
          Icon(
            Icons.shopping_cart,
            color: colors.headerTextColor,
            size: 20,
          ),
          SizedBox(width: spacing.contentGap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Carrito de compras',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.headerTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (summary.hasItems)
                  Text(
                    '${summary.itemCount} productos • ${summary.formatTotal()}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.headerTextColor?.withValues(alpha: 0.8),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: onToggleExpand,
            icon: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: colors.headerTextColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Construye la lista de items
  Widget _buildItemsList({
    required BuildContext context,
    required DSCartWidgetConfig config,
    required List<DSCartItem> items,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required ScrollController scrollController,
    int? maxVisibleItems,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
  }) {
    final visibleItems = maxVisibleItems != null
        ? items.take(maxVisibleItems).toList()
        : items;

    final layout = config.behavior?.layout ?? DSCartLayout.list;

    Widget itemsWidget;

    switch (layout) {
      case DSCartLayout.list:
        itemsWidget = ListView.separated(
          controller: scrollController,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: visibleItems.length,
          separatorBuilder: (_, __) => Divider(
            color: colors.dividerColor,
            height: 1,
            indent: spacing.padding.left,
            endIndent: spacing.padding.right,
          ),
          itemBuilder: (context, index) {
            return _buildCartItemTile(
              context: context,
              item: visibleItems[index],
              colors: colors,
              spacing: spacing,
              onQuantityChange: onQuantityChange,
              onItemRemove: onItemRemove,
              onItemTap: onItemTap,
            );
          },
        );
        break;

      case DSCartLayout.grid:
        itemsWidget = GridView.builder(
          controller: scrollController,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: layout.gridColumns,
            childAspectRatio: layout.recommendedItemRatio,
            crossAxisSpacing: spacing.itemSpacing,
            mainAxisSpacing: spacing.itemSpacing,
          ),
          itemCount: visibleItems.length,
          itemBuilder: (context, index) {
            return _buildCartItemCard(
              context: context,
              item: visibleItems[index],
              colors: colors,
              spacing: spacing,
              onQuantityChange: onQuantityChange,
              onItemRemove: onItemRemove,
              onItemTap: onItemTap,
            );
          },
        );
        break;

      case DSCartLayout.carousel:
        itemsWidget = SizedBox(
          height: spacing.itemHeight + 20,
          child: ListView.separated(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: visibleItems.length,
            separatorBuilder: (_, __) => SizedBox(width: spacing.contentGap),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200,
                child: _buildCartItemCard(
                  context: context,
                  item: visibleItems[index],
                  colors: colors,
                  spacing: spacing,
                  onQuantityChange: onQuantityChange,
                  onItemRemove: onItemRemove,
                  onItemTap: onItemTap,
                ),
              );
            },
          ),
        );
        break;

      case DSCartLayout.accordion:
        itemsWidget = ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          children: visibleItems.asMap().entries.map((entry) {
            final item = entry.value;
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.formatTotalPrice()),
                );
              },
              body: _buildCartItemTile(
                context: context,
                item: item,
                colors: colors,
                spacing: spacing,
                onQuantityChange: onQuantityChange,
                onItemRemove: onItemRemove,
                onItemTap: onItemTap,
              ),
              isExpanded: true, // Por simplicidad, todos expandidos
            );
          }).toList(),
        );
        break;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: layout == DSCartLayout.carousel
            ? spacing.itemHeight + 20
            : math.min(400, visibleItems.length * spacing.itemHeight),
      ),
      child: itemsWidget,
    );
  }

  /// Construye un item del carrito como tile (para lista)
  Widget _buildCartItemTile({
    required BuildContext context,
    required DSCartItem item,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
  }) {
    return Container(
      padding: spacing.padding,
      child: Row(
        children: [
          // Imagen del producto
          if (item.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(spacing.borderRadius / 2),
              child: Container(
                width: spacing.imageSize,
                height: spacing.imageSize,
                color: colors.itemBackgroundColor,
                child: item.imageWidget ??
                       Image.network(
                         item.imageUrl!,
                         fit: BoxFit.cover,
                         errorBuilder: (context, error, stackTrace) {
                           return Icon(
                             Icons.image_not_supported,
                             color: colors.descriptionColor,
                           );
                         },
                       ),
              ),
            ),
          if (item.imageUrl != null) SizedBox(width: spacing.contentGap),
          // Información del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.description != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    item.description!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.descriptionColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      item.formatPrice(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.priceColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (item.hasDiscount) ...[
                      const SizedBox(width: 8),
                      Text(
                        item.formatOriginalPrice() ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.originalPriceColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          // Controles de cantidad
          _buildQuantityControls(
            context: context,
            item: item,
            colors: colors,
            spacing: spacing,
            onQuantityChange: onQuantityChange,
            onItemRemove: onItemRemove,
          ),
        ],
      ),
    );
  }

  /// Construye un item del carrito como card (para grid/carousel)
  Widget _buildCartItemCard({
    required BuildContext context,
    required DSCartItem item,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
    required Function(DSCartItem item) onItemTap,
  }) {
    return Card(
      color: colors.itemBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        side: BorderSide(
          color: colors.itemBorderColor ?? Colors.transparent,
          width: spacing.borderWidth,
        ),
      ),
      child: Padding(
        padding: spacing.padding / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            if (item.imageUrl != null)
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(spacing.borderRadius / 2),
                  child: Container(
                    width: double.infinity,
                    color: colors.itemBackgroundColor,
                    child: item.imageWidget ??
                           Image.network(
                             item.imageUrl!,
                             fit: BoxFit.cover,
                             errorBuilder: (context, error, stackTrace) {
                               return Icon(
                                 Icons.image_not_supported,
                                 color: colors.descriptionColor,
                               );
                             },
                           ),
                  ),
                ),
              ),
            // Información del producto
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.titleColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.formatPrice(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.priceColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // Controles de cantidad compactos
                  _buildCompactQuantityControls(
                    context: context,
                    item: item,
                    colors: colors,
                    spacing: spacing,
                    onQuantityChange: onQuantityChange,
                    onItemRemove: onItemRemove,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye los controles de cantidad
  Widget _buildQuantityControls({
    required BuildContext context,
    required DSCartItem item,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Botón decrementar
        SizedBox(
          width: spacing.quantityButtonSize,
          height: spacing.quantityButtonSize,
          child: IconButton(
            onPressed: item.canDecreaseQuantity
                ? () => onQuantityChange(item.id, item.quantity - 1)
                : null,
            icon: Icon(
              item.quantity <= item.minQuantity ? Icons.delete : Icons.remove,
              size: 16,
            ),
            style: IconButton.styleFrom(
              backgroundColor: colors.itemBackgroundColor,
              foregroundColor: colors.quantityColor,
              side: BorderSide(color: colors.itemBorderColor ?? Colors.grey),
            ),
          ),
        ),
        // Cantidad
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Text(
            '${item.quantity}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colors.quantityColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // Botón incrementar
        SizedBox(
          width: spacing.quantityButtonSize,
          height: spacing.quantityButtonSize,
          child: IconButton(
            onPressed: item.canIncreaseQuantity
                ? () => onQuantityChange(item.id, item.quantity + 1)
                : null,
            icon: const Icon(Icons.add, size: 16),
            style: IconButton.styleFrom(
              backgroundColor: colors.itemBackgroundColor,
              foregroundColor: colors.quantityColor,
              side: BorderSide(color: colors.itemBorderColor ?? Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  /// Construye controles de cantidad compactos
  Widget _buildCompactQuantityControls({
    required BuildContext context,
    required DSCartItem item,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required Function(String itemId, int newQuantity) onQuantityChange,
    required Function(String itemId) onItemRemove,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: IconButton(
            onPressed: () => onQuantityChange(item.id, item.quantity - 1),
            icon: const Icon(Icons.remove, size: 12),
            padding: EdgeInsets.zero,
          ),
        ),
        Text('${item.quantity}', style: Theme.of(context).textTheme.bodySmall),
        SizedBox(
          width: 24,
          height: 24,
          child: IconButton(
            onPressed: item.canIncreaseQuantity
                ? () => onQuantityChange(item.id, item.quantity + 1)
                : null,
            icon: const Icon(Icons.add, size: 12),
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  /// Construye el resumen del carrito
  Widget _buildCartSummary({
    required BuildContext context,
    required DSCartSummary summary,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    required VoidCallback onCheckout,
    required Function(String promoCode) onPromoCode,
  }) {
    return Container(
      padding: spacing.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Líneas del resumen
          _buildSummaryLine(
            context: context,
            label: 'Subtotal',
            value: summary.formatSubtotal(),
            colors: colors,
          ),
          if (summary.hasTaxes)
            _buildSummaryLine(
              context: context,
              label: 'Impuestos',
              value: summary.formatTaxes(),
              colors: colors,
            ),
          if (summary.hasShipping)
            _buildSummaryLine(
              context: context,
              label: 'Envío',
              value: summary.formatShipping(),
              colors: colors,
            ),
          if (summary.hasDiscount)
            _buildSummaryLine(
              context: context,
              label: 'Descuento',
              value: summary.formatDiscount(),
              colors: colors,
              isDiscount: true,
            ),
          Divider(color: colors.dividerColor),
          _buildSummaryLine(
            context: context,
            label: 'Total',
            value: summary.formatTotal(),
            colors: colors,
            isTotal: true,
          ),
          SizedBox(height: spacing.contentGap),
          // Botón de checkout
          SizedBox(
            height: spacing.checkoutButtonHeight,
            child: ElevatedButton(
              onPressed: summary.hasItems ? onCheckout : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.buttonPrimaryColor,
                foregroundColor: colors.buttonTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(spacing.borderRadius),
                ),
              ),
              child: Text(
                'Proceder al pago',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colors.buttonTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye una línea del resumen
  Widget _buildSummaryLine({
    required BuildContext context,
    required String label,
    required String value,
    required DSCartColors colors,
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isTotal ? colors.totalColor : colors.subtotalColor,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDiscount
                  ? colors.buttonPrimaryColor
                  : isTotal
                      ? colors.totalColor
                      : colors.subtotalColor,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el carrito vacío
  Widget buildEmptyCart({
    required BuildContext context,
    required DSCartVariant variant,
    required DSCartColors colors,
    required DSCartSpacing spacing,
    Widget? emptyWidget,
  }) {
    return Container(
      padding: spacing.padding,
      constraints: BoxConstraints(
        minHeight: variant == DSCartVariant.mini ? 80 : 200,
      ),
      child: emptyWidget ??
             Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.shopping_cart_outlined,
                     size: variant == DSCartVariant.mini ? 32 : 64,
                     color: colors.emptyStateColor,
                   ),
                   SizedBox(height: spacing.contentGap),
                   Text(
                     'Tu carrito está vacío',
                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
                       color: colors.emptyStateColor,
                     ),
                     textAlign: TextAlign.center,
                   ),
                   if (variant == DSCartVariant.full) ...[
                     SizedBox(height: spacing.contentGap / 2),
                     Text(
                       'Agrega productos para comenzar',
                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                         color: colors.emptyStateColor?.withValues(alpha: 0.7),
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ],
                 ],
               ),
             ),
    );
  }

  /// Construye el carrito skeleton
  Widget buildSkeletonCart({
    required BuildContext context,
    required DSCartVariant variant,
    required DSCartColors colors,
    required DSCartSpacing spacing,
  }) {
    return Container(
      padding: spacing.padding,
      child: variant == DSCartVariant.mini
          ? _buildMiniSkeleton(colors, spacing)
          : _buildFullSkeleton(colors, spacing),
    );
  }

  Widget _buildMiniSkeleton(DSCartColors colors, DSCartSpacing spacing) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                   Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: spacing.contentGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 14,
                width: 80,
                decoration: BoxDecoration(
                  color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                         Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 18,
                width: 60,
                decoration: BoxDecoration(
                  color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                         Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 80,
          height: 32,
          decoration: BoxDecoration(
            color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                   Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildFullSkeleton(DSCartColors colors, DSCartSpacing spacing) {
    return Column(
      children: [
        // Header skeleton
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                   Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(height: spacing.itemSpacing),
        // Items skeleton
        ...List.generate(3, (index) => Padding(
          padding: EdgeInsets.only(bottom: spacing.itemSpacing),
          child: Row(
            children: [
              Container(
                width: spacing.imageSize,
                height: spacing.imageSize,
                decoration: BoxDecoration(
                  color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                         Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: spacing.contentGap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                               Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                               Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 32,
                decoration: BoxDecoration(
                  color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                         Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        )),
        SizedBox(height: spacing.itemSpacing),
        // Summary skeleton
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                   Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}