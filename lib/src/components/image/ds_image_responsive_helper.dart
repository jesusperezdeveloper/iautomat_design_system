import 'package:flutter/material.dart';

import 'package:iautomat_design_system/src/components/image/ds_image_config.dart';
import 'package:iautomat_design_system/src/utils/responsive.dart';

/// Helper para manejar la responsividad y lazy loading del DSImage
///
/// Proporciona utilidades para:
/// - Determinar la configuración apropiada según el breakpoint actual
/// - Gestionar la carga lazy con intersection observer
/// - Optimizar el tamaño de imagen según el dispositivo
/// - Manejar diferentes resoluciones por densidad de píxeles
class DSImageResponsiveHelper {
  /// Resuelve la configuración de imagen apropiada para el contexto actual
  static DSImageBreakpointConfig resolveBreakpointConfig(
    BuildContext context,
    DSImageResponsiveConfig? responsiveConfig,
  ) {
    if (responsiveConfig?.enabled != true) {
      return const DSImageBreakpointConfig();
    }

    if (Responsive.isMobile(context)) {
      return responsiveConfig?.mobile ?? const DSImageBreakpointConfig();
    } else if (Responsive.isTablet(context)) {
      return responsiveConfig?.tablet ??
             responsiveConfig?.mobile ??
             const DSImageBreakpointConfig();
    } else {
      return responsiveConfig?.desktop ??
             responsiveConfig?.tablet ??
             responsiveConfig?.mobile ??
             const DSImageBreakpointConfig();
    }
  }

  /// Calcula las dimensiones apropiadas para la imagen según el breakpoint
  static Size calculateImageSize(
    BuildContext context,
    double? baseWidth,
    double? baseHeight,
    DSImageResponsiveConfig? responsiveConfig,
  ) {
    final config = resolveBreakpointConfig(context, responsiveConfig);
    final mediaQuery = MediaQuery.of(context);

    double? finalWidth = config.width ?? baseWidth;
    double? finalHeight = config.height ?? baseHeight;

    // Aplicar factor de escala por densidad de píxeles si está habilitado
    if (responsiveConfig?.scaleByDevicePixelRatio == true) {
      final pixelRatio = mediaQuery.devicePixelRatio;
      if (finalWidth != null) finalWidth *= pixelRatio;
      if (finalHeight != null) finalHeight *= pixelRatio;
    }

    // Limitar por el ancho de la pantalla si es necesario
    final screenWidth = mediaQuery.size.width;
    if (finalWidth != null && finalWidth > screenWidth) {
      final ratio = finalHeight != null ? finalHeight / finalWidth : 1.0;
      finalWidth = screenWidth;
      finalHeight = screenWidth * ratio;
    }

    return Size(
      finalWidth ?? 200.0,
      finalHeight ?? 200.0,
    );
  }

  /// Determina el BoxFit apropiado según la configuración responsiva
  static BoxFit resolveBoxFit(
    BuildContext context,
    BoxFit defaultFit,
    DSImageResponsiveConfig? responsiveConfig,
  ) {
    final config = resolveBreakpointConfig(context, responsiveConfig);
    return config.fit ?? defaultFit;
  }

  /// Determina el ratio de aspecto apropiado según la configuración responsiva
  static double? resolveAspectRatio(
    BuildContext context,
    double? defaultRatio,
    DSImageResponsiveConfig? responsiveConfig,
  ) {
    final config = resolveBreakpointConfig(context, responsiveConfig);
    return config.ratio ?? defaultRatio;
  }

  /// Determina la calidad de imagen apropiada según el breakpoint
  static int resolveImageQuality(
    BuildContext context,
    int defaultQuality,
    DSImageResponsiveConfig? responsiveConfig,
  ) {
    final config = resolveBreakpointConfig(context, responsiveConfig);
    return config.quality ?? defaultQuality;
  }

  /// Genera la URL apropiada para imágenes responsivas con parámetros de tamaño
  static String buildResponsiveImageUrl(
    String baseUrl,
    BuildContext context,
    DSImageResponsiveConfig? responsiveConfig,
    int defaultQuality,
  ) {
    if (!baseUrl.startsWith('http')) {
      return baseUrl; // No aplicar transformaciones a assets locales
    }

    final size = calculateImageSize(context, null, null, responsiveConfig);
    final quality = resolveImageQuality(context, defaultQuality, responsiveConfig);

    // Agregar parámetros de optimización si la URL lo soporta
    // Esto es un ejemplo genérico, en la práctica deberías adaptarlo
    // a tu CDN específico (Cloudinary, Imagekit, etc.)
    final uri = Uri.parse(baseUrl);
    final queryParams = Map<String, String>.from(uri.queryParameters);

    queryParams['w'] = size.width.round().toString();
    queryParams['h'] = size.height.round().toString();
    queryParams['q'] = quality.toString();
    queryParams['f'] = 'auto'; // Formato automático

    return uri.replace(queryParameters: queryParams).toString();
  }

  /// Determina si una imagen debe usar carga lazy basado en su posición
  static bool shouldUseLazyLoading(
    BuildContext context,
    DSImageLazyConfig? lazyConfig,
  ) {
    if (lazyConfig?.enabled != true) return false;

    // En scroll views, siempre usar lazy loading
    final ancestorScrollable = Scrollable.maybeOf(context);
    if (ancestorScrollable != null) return true;

    // Para imágenes fuera del viewport inicial, usar lazy loading
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final mediaQuery = MediaQuery.of(context);

      // Si está fuera de la vista inicial, usar lazy loading
      return position.dy > mediaQuery.size.height;
    }

    return false;
  }
}

/// Widget para manejar la visibilidad y carga lazy de imágenes
class DSImageVisibilityDetector extends StatefulWidget {
  final Widget child;
  final double threshold;
  final VoidCallback? onVisible;
  final VoidCallback? onHidden;

  const DSImageVisibilityDetector({
    super.key,
    required this.child,
    this.threshold = 200.0,
    this.onVisible,
    this.onHidden,
  });

  @override
  State<DSImageVisibilityDetector> createState() => _DSImageVisibilityDetectorState();
}

class _DSImageVisibilityDetectorState extends State<DSImageVisibilityDetector> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    if (!mounted) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final mediaQuery = MediaQuery.of(context);

    final viewportHeight = mediaQuery.size.height;
    final threshold = widget.threshold;

    final isNowVisible = position.dy < viewportHeight + threshold &&
        position.dy + size.height > -threshold;

    if (isNowVisible != _isVisible) {
      setState(() {
        _isVisible = isNowVisible;
      });

      if (isNowVisible) {
        widget.onVisible?.call();
      } else {
        widget.onHidden?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _checkVisibility();
        return false;
      },
      child: widget.child,
    );
  }
}

/// Extension para facilitar el uso de breakpoints responsivos
extension DSImageBreakpointConfigExtension on DSImageBreakpointConfig {
  /// Combina esta configuración con otra, dando prioridad a los valores no nulos
  DSImageBreakpointConfig mergeWith(DSImageBreakpointConfig other) {
    return DSImageBreakpointConfig(
      width: width ?? other.width,
      height: height ?? other.height,
      fit: fit ?? other.fit,
      ratio: ratio ?? other.ratio,
      quality: quality ?? other.quality,
    );
  }

  /// Verifica si esta configuración tiene valores definidos
  bool get hasValues {
    return width != null ||
           height != null ||
           fit != null ||
           ratio != null ||
           quality != null;
  }
}

/// Extension para facilitar el uso de configuración responsiva
extension DSImageResponsiveConfigExtension on DSImageResponsiveConfig {
  /// Obtiene la configuración más específica disponible para un contexto
  DSImageBreakpointConfig getConfigForContext(BuildContext context) {
    return DSImageResponsiveHelper.resolveBreakpointConfig(context, this);
  }

  /// Verifica si la configuración responsiva está habilitada y configurada
  bool get isConfigured {
    return enabled &&
           (mobile?.hasValues == true ||
            tablet?.hasValues == true ||
            desktop?.hasValues == true);
  }
}