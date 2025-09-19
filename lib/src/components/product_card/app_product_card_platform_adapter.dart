import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_config.dart';

/// Adaptador de plataforma para DSProductCard
///
/// Maneja las diferencias de renderizado entre Android, iOS y Web
/// para proporcionar una experiencia nativa en cada plataforma
class DSProductCardPlatformAdapter {
  /// Construye la tarjeta según la plataforma
  Widget buildCard({
    required BuildContext context,
    required DSProductCardConfig config,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    required DSProductCardLayout layout,
    required bool selected,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
    required double elevation,
  }) {
    if (state == DSProductCardState.skeleton) {
      return _buildSkeletonCard(
        context: context,
        layout: layout,
        colors: colors,
        spacing: spacing,
      );
    }

    if (state == DSProductCardState.loading) {
      return _buildLoadingCard(
        context: context,
        layout: layout,
        colors: colors,
        spacing: spacing,
      );
    }

    if (kIsWeb) {
      return _buildWebCard(
        context: context,
        config: config,
        title: title,
        price: price,
        image: image,
        discountChip: discountChip,
        variant: variant,
        state: state,
        layout: layout,
        selected: selected,
        additionalInfo: additionalInfo,
        badge: badge,
        colors: colors,
        spacing: spacing,
        elevation: elevation,
      );
    } else if (Platform.isIOS) {
      return _buildIOSCard(
        context: context,
        config: config,
        title: title,
        price: price,
        image: image,
        discountChip: discountChip,
        variant: variant,
        state: state,
        layout: layout,
        selected: selected,
        additionalInfo: additionalInfo,
        badge: badge,
        colors: colors,
        spacing: spacing,
        elevation: elevation,
      );
    } else {
      return _buildAndroidCard(
        context: context,
        config: config,
        title: title,
        price: price,
        image: image,
        discountChip: discountChip,
        variant: variant,
        state: state,
        layout: layout,
        selected: selected,
        additionalInfo: additionalInfo,
        badge: badge,
        colors: colors,
        spacing: spacing,
        elevation: elevation,
      );
    }
  }

  /// Construye la tarjeta para Android (Material Design)
  Widget _buildAndroidCard({
    required BuildContext context,
    required DSProductCardConfig config,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    required DSProductCardLayout layout,
    required bool selected,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
    required double elevation,
  }) {
    return Card(
      elevation: elevation,
      color: selected ? colors.selectedColor : colors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        side: BorderSide(
          color: state == DSProductCardState.focus
              ? colors.focusColor ?? Theme.of(context).colorScheme.primary
              : selected
                  ? colors.selectedColor ?? Theme.of(context).colorScheme.primaryContainer
                  : colors.borderColor ?? Colors.transparent,
          width: state == DSProductCardState.focus || selected ? 2.0 : spacing.borderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildCardContent(
        context: context,
        title: title,
        price: price,
        image: image,
        discountChip: discountChip,
        variant: variant,
        state: state,
        layout: layout,
        additionalInfo: additionalInfo,
        badge: badge,
        colors: colors,
        spacing: spacing,
      ),
    );
  }

  /// Construye la tarjeta para iOS (Cupertino)
  Widget _buildIOSCard({
    required BuildContext context,
    required DSProductCardConfig config,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    required DSProductCardLayout layout,
    required bool selected,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
    required double elevation,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? colors.selectedColor : colors.backgroundColor,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        border: Border.all(
          color: state == DSProductCardState.focus
              ? colors.focusColor ?? CupertinoColors.activeBlue
              : selected
                  ? colors.selectedColor ?? CupertinoColors.systemBlue.withValues(alpha: 0.3)
                  : colors.borderColor ?? CupertinoColors.systemGrey5,
          width: state == DSProductCardState.focus || selected ? 2.0 : spacing.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.shadowColor?.withValues(alpha: 0.1) ??
                   CupertinoColors.black.withValues(alpha: 0.1),
            blurRadius: elevation,
            offset: Offset(0, elevation / 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildCardContent(
        context: context,
        title: title,
        price: price,
        image: image,
        discountChip: discountChip,
        variant: variant,
        state: state,
        layout: layout,
        additionalInfo: additionalInfo,
        badge: badge,
        colors: colors,
        spacing: spacing,
      ),
    );
  }

  /// Construye la tarjeta para Web
  Widget _buildWebCard({
    required BuildContext context,
    required DSProductCardConfig config,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    required DSProductCardLayout layout,
    required bool selected,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
    required double elevation,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? colors.selectedColor : colors.backgroundColor,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        border: Border.all(
          color: state == DSProductCardState.focus
              ? colors.focusColor ?? Theme.of(context).colorScheme.primary
              : state == DSProductCardState.hover
                  ? colors.borderColor?.withValues(alpha: 0.5) ?? Theme.of(context).colorScheme.outline
                  : selected
                      ? colors.selectedColor ?? Theme.of(context).colorScheme.primaryContainer
                      : colors.borderColor ?? Colors.transparent,
          width: state == DSProductCardState.focus || selected ? 2.0 : spacing.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.shadowColor?.withValues(alpha: 0.15) ??
                   Colors.black.withValues(alpha: 0.15),
            blurRadius: state == DSProductCardState.hover ? elevation * 1.5 : elevation,
            offset: Offset(0, state == DSProductCardState.hover ? elevation : elevation / 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildCardContent(
        context: context,
        title: title,
        price: price,
        image: image,
        discountChip: discountChip,
        variant: variant,
        state: state,
        layout: layout,
        additionalInfo: additionalInfo,
        badge: badge,
        colors: colors,
        spacing: spacing,
      ),
    );
  }

  /// Construye el contenido de la tarjeta según el layout
  Widget _buildCardContent({
    required BuildContext context,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    required DSProductCardLayout layout,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    switch (layout) {
      case DSProductCardLayout.vertical:
        return _buildVerticalLayout(
          context: context,
          title: title,
          price: price,
          image: image,
          discountChip: discountChip,
          variant: variant,
          state: state,
          additionalInfo: additionalInfo,
          badge: badge,
          colors: colors,
          spacing: spacing,
        );
      case DSProductCardLayout.horizontal:
        return _buildHorizontalLayout(
          context: context,
          title: title,
          price: price,
          image: image,
          discountChip: discountChip,
          variant: variant,
          state: state,
          additionalInfo: additionalInfo,
          badge: badge,
          colors: colors,
          spacing: spacing,
        );
      case DSProductCardLayout.overlay:
        return _buildOverlayLayout(
          context: context,
          title: title,
          price: price,
          image: image,
          discountChip: discountChip,
          variant: variant,
          state: state,
          additionalInfo: additionalInfo,
          badge: badge,
          colors: colors,
          spacing: spacing,
        );
      case DSProductCardLayout.compact:
        return _buildCompactLayout(
          context: context,
          title: title,
          price: price,
          image: image,
          discountChip: discountChip,
          variant: variant,
          state: state,
          additionalInfo: additionalInfo,
          badge: badge,
          colors: colors,
          spacing: spacing,
        );
    }
  }

  /// Layout vertical (imagen arriba, contenido abajo)
  Widget _buildVerticalLayout({
    required BuildContext context,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Imagen con badges
        if (image != null)
          AspectRatio(
            aspectRatio: image.aspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildImage(image, colors),
                if (badge != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: badge,
                  ),
                if (discountChip != null && variant == DSProductCardVariant.discount)
                  Positioned(
                    top: discountChip.position.margin.top,
                    right: discountChip.position.margin.right,
                    bottom: discountChip.position.margin.bottom,
                    left: discountChip.position.margin.left,
                    child: _buildDiscountChip(discountChip, colors),
                  ),
              ],
            ),
          ),
        // Contenido
        Expanded(
          child: Padding(
            padding: spacing.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.titleColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: spacing.contentGap),
                // Precios
                _buildPriceSection(
                  context: context,
                  price: price,
                  variant: variant,
                  colors: colors,
                ),
                if (additionalInfo != null) ...[
                  SizedBox(height: spacing.contentGap),
                  additionalInfo,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Layout horizontal (imagen a la izquierda, contenido a la derecha)
  Widget _buildHorizontalLayout({
    required BuildContext context,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    return Row(
      children: [
        // Imagen con badges
        if (image != null)
          AspectRatio(
            aspectRatio: 0.75,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildImage(image, colors),
                if (badge != null)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: badge,
                  ),
                if (discountChip != null && variant == DSProductCardVariant.discount)
                  Positioned(
                    top: discountChip.position.margin.top,
                    right: discountChip.position.margin.right,
                    bottom: discountChip.position.margin.bottom,
                    left: discountChip.position.margin.left,
                    child: _buildDiscountChip(discountChip, colors),
                  ),
              ],
            ),
          ),
        // Contenido
        Expanded(
          child: Padding(
            padding: spacing.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.titleColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: spacing.contentGap),
                // Precios
                _buildPriceSection(
                  context: context,
                  price: price,
                  variant: variant,
                  colors: colors,
                ),
                if (additionalInfo != null) ...[
                  SizedBox(height: spacing.contentGap),
                  additionalInfo,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Layout overlay (imagen de fondo con contenido superpuesto)
  Widget _buildOverlayLayout({
    required BuildContext context,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Imagen de fondo
        if (image != null) _buildImage(image, colors),
        // Overlay gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  colors.overlayColor ?? Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
        ),
        // Contenido
        Positioned(
          left: spacing.padding.left,
          right: spacing.padding.right,
          bottom: spacing.padding.bottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Título
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: spacing.contentGap),
              // Precios
              _buildPriceSection(
                context: context,
                price: price,
                variant: variant,
                colors: DSProductCardColors(
                  priceColor: Colors.white,
                  originalPriceColor: Colors.white70,
                ),
              ),
              if (additionalInfo != null) ...[
                SizedBox(height: spacing.contentGap),
                additionalInfo,
              ],
            ],
          ),
        ),
        // Badges
        if (badge != null)
          Positioned(
            top: 8,
            left: 8,
            child: badge,
          ),
        if (discountChip != null && variant == DSProductCardVariant.discount)
          Positioned(
            top: discountChip.position.margin.top,
            right: discountChip.position.margin.right,
            bottom: discountChip.position.margin.bottom,
            left: discountChip.position.margin.left,
            child: _buildDiscountChip(discountChip, colors),
          ),
      ],
    );
  }

  /// Layout compacto
  Widget _buildCompactLayout({
    required BuildContext context,
    required String title,
    required DSProductPrice price,
    DSProductImage? image,
    DSDiscountChip? discountChip,
    required DSProductCardVariant variant,
    required DSProductCardState state,
    Widget? additionalInfo,
    Widget? badge,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    return Padding(
      padding: spacing.padding,
      child: Row(
        children: [
          // Imagen pequeña
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(spacing.borderRadius / 2),
              child: SizedBox(
                width: 60,
                height: 60,
                child: _buildImage(image, colors),
              ),
            ),
          if (image != null) SizedBox(width: spacing.contentGap),
          // Contenido
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.titleColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Precio
                _buildCompactPrice(
                  context: context,
                  price: price,
                  variant: variant,
                  colors: colors,
                ),
              ],
            ),
          ),
          // Chip de descuento al final
          if (discountChip != null && variant == DSProductCardVariant.discount)
            _buildDiscountChip(discountChip, colors),
        ],
      ),
    );
  }

  /// Construye la sección de precio
  Widget _buildPriceSection({
    required BuildContext context,
    required DSProductPrice price,
    required DSProductCardVariant variant,
    required DSProductCardColors colors,
  }) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // Precio actual
        Text(
          price.formatPrice(),
          style: theme.textTheme.titleLarge?.copyWith(
            color: colors.priceColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Precio original (tachado) si hay descuento
        if (variant == DSProductCardVariant.discount && price.originalPrice != null) ...[
          const SizedBox(width: 8),
          Text(
            price.formatOriginalPrice() ?? '',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.originalPriceColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }

  /// Construye el precio compacto
  Widget _buildCompactPrice({
    required BuildContext context,
    required DSProductPrice price,
    required DSProductCardVariant variant,
    required DSProductCardColors colors,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Precio actual
        Text(
          price.formatPrice(),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colors.priceColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Porcentaje de descuento
        if (variant == DSProductCardVariant.discount && price.discountPercentage != null) ...[
          const SizedBox(width: 4),
          Text(
            price.formatDiscount(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.discountBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }

  /// Construye la imagen del producto
  Widget _buildImage(DSProductImage image, DSProductCardColors colors) {
    return Container(
      color: colors.backgroundColor?.withValues(alpha: 0.5) ?? Colors.grey[100],
      child: image.url.startsWith('http')
          ? Image.network(
              image.url,
              fit: image.fit,
              errorBuilder: (context, error, stackTrace) {
                return image.errorWidget ??
                       Center(
                         child: Icon(
                           Icons.image_not_supported,
                           color: colors.titleColor?.withValues(alpha: 0.3),
                           size: 48,
                         ),
                       );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            )
          : Image.asset(
              image.url,
              fit: image.fit,
              errorBuilder: (context, error, stackTrace) {
                return image.errorWidget ??
                       Center(
                         child: Icon(
                           Icons.image_not_supported,
                           color: colors.titleColor?.withValues(alpha: 0.3),
                           size: 48,
                         ),
                       );
              },
            ),
    );
  }

  /// Construye el chip de descuento
  Widget _buildDiscountChip(DSDiscountChip chip, DSProductCardColors colors) {
    if (!chip.visible) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chip.backgroundColor ?? colors.discountBackgroundColor ?? Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (chip.icon != null) ...[
            Icon(
              chip.icon,
              size: 14,
              color: chip.textColor ?? colors.discountTextColor ?? Colors.white,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            chip.text,
            style: TextStyle(
              color: chip.textColor ?? colors.discountTextColor ?? Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Construye la tarjeta skeleton
  Widget _buildSkeletonCard({
    required BuildContext context,
    required DSProductCardLayout layout,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    return Card(
      child: Padding(
        padding: spacing.padding,
        child: layout == DSProductCardLayout.vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skeleton de imagen
                  AspectRatio(
                    aspectRatio: spacing.imageAspectRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                               Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(spacing.borderRadius / 2),
                      ),
                    ),
                  ),
                  SizedBox(height: spacing.contentGap),
                  // Skeleton de título
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                             Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: spacing.contentGap),
                  // Skeleton de precio
                  Container(
                    height: 24,
                    width: 80,
                    decoration: BoxDecoration(
                      color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                             Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  // Skeleton de imagen
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                             Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(spacing.borderRadius / 2),
                    ),
                  ),
                  SizedBox(width: spacing.contentGap),
                  // Skeleton de contenido
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                                   Colors.grey.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: spacing.contentGap),
                        Container(
                          height: 24,
                          width: 80,
                          decoration: BoxDecoration(
                            color: colors.skeletonColor?.withValues(alpha: 0.3) ??
                                   Colors.grey.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  /// Construye la tarjeta de carga
  Widget _buildLoadingCard({
    required BuildContext context,
    required DSProductCardLayout layout,
    required DSProductCardColors colors,
    required DSProductCardSpacing spacing,
  }) {
    return Card(
      child: Center(
        child: Padding(
          padding: spacing.padding,
          child: CircularProgressIndicator(
            color: colors.priceColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}