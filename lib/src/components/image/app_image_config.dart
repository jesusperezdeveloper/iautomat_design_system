import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_image_config.freezed.dart';

/// Configuración principal para el componente AppImage
///
/// Define todas las propiedades necesarias para personalizar
/// el comportamiento y apariencia del widget AppImage usando
/// solo design tokens del sistema.
@freezed
class AppImageConfig with _$AppImageConfig {
  const factory AppImageConfig({
    /// Variante del componente image
    @Default(AppImageVariant.responsive) AppImageVariant variant,

    /// Estado actual del componente
    @Default(AppImageState.defaultState) AppImageState state,

    /// URL o path de la imagen
    required String src,

    /// Texto alternativo para accesibilidad
    @Default('') String alt,

    /// Cómo debe ajustarse la imagen al container
    @Default(BoxFit.cover) BoxFit fit,

    /// Ratio de aspecto de la imagen (ancho/alto)
    double? ratio,

    /// Widget placeholder mientras carga la imagen
    Widget? placeholder,

    /// Widget a mostrar en caso de error
    Widget? errorWidget,

    /// Configuración de colores
    AppImageColors? colors,

    /// Configuración de espaciado y dimensiones
    AppImageSpacing? spacing,

    /// Configuración de elevación y sombras
    AppImageElevation? elevation,

    /// Configuración de comportamiento
    AppImageBehavior? behavior,

    /// Configuración de animaciones
    AppImageAnimation? animation,

    /// Configuración de carga lazy
    AppImageLazyConfig? lazyConfig,

    /// Configuración de responsividad
    AppImageResponsiveConfig? responsiveConfig,

    /// Configuración de accesibilidad
    AppImageA11yConfig? a11yConfig,

    /// Callbacks de interacción
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    VoidCallback? onLoad,
    VoidCallback? onError,
  }) = _AppImageConfig;
}

/// Configuración de colores para el AppImage
@freezed
class AppImageColors with _$AppImageColors {
  const factory AppImageColors({
    /// Color de fondo del container
    Color? backgroundColor,

    /// Color del borde
    Color? borderColor,

    /// Color de la sombra
    Color? shadowColor,

    /// Color del overlay en hover
    Color? hoverOverlayColor,

    /// Color del overlay cuando está presionado
    Color? pressedOverlayColor,

    /// Color del overlay cuando está seleccionado
    Color? selectedOverlayColor,

    /// Color del overlay cuando está enfocado
    Color? focusOverlayColor,

    /// Color del placeholder
    Color? placeholderColor,

    /// Color del skeleton durante carga
    Color? skeletonColor,

    /// Color de fondo cuando está deshabilitado
    Color? disabledBackgroundColor,

    /// Color del filtro cuando está deshabilitado
    Color? disabledFilterColor,
  }) = _AppImageColors;
}

/// Configuración de espaciado y dimensiones
@freezed
class AppImageSpacing with _$AppImageSpacing {
  const factory AppImageSpacing({
    /// Ancho del componente
    double? width,

    /// Alto del componente
    double? height,

    /// Padding interno
    @Default(EdgeInsets.zero) EdgeInsets padding,

    /// Margin externo
    @Default(EdgeInsets.zero) EdgeInsets margin,

    /// Radio de borde
    @Default(8.0) double borderRadius,

    /// Ancho del borde
    @Default(0.0) double borderWidth,

    /// Ancho mínimo
    double? minWidth,

    /// Alto mínimo
    double? minHeight,

    /// Ancho máximo
    double? maxWidth,

    /// Alto máximo
    double? maxHeight,

    /// Si debe adaptarse al espacio disponible
    @Default(false) bool expand,
  }) = _AppImageSpacing;
}

/// Configuración de elevación y sombras
@freezed
class AppImageElevation with _$AppImageElevation {
  const factory AppImageElevation({
    /// Elevación por defecto
    @Default(0.0) double defaultElevation,

    /// Elevación en hover
    @Default(2.0) double hoveredElevation,

    /// Elevación cuando presionado
    @Default(1.0) double pressedElevation,

    /// Elevación cuando enfocado
    @Default(3.0) double focusedElevation,

    /// Elevación cuando seleccionado
    @Default(4.0) double selectedElevation,

    /// Elevación cuando deshabilitado
    @Default(0.0) double disabledElevation,

    /// Color de la sombra
    Color? shadowColor,

    /// Color de tinte de superficie
    Color? surfaceTintColor,
  }) = _AppImageElevation;
}

/// Configuración de comportamiento
@freezed
class AppImageBehavior with _$AppImageBehavior {
  const factory AppImageBehavior({
    /// Habilitar feedback háptico
    @Default(true) bool enableHapticFeedback,

    /// Habilitar efecto ripple
    @Default(true) bool enableRipple,

    /// Habilitar efectos de hover
    @Default(true) bool enableHover,

    /// Habilitar efectos de focus
    @Default(true) bool enableFocus,

    /// Mantener estado entre rebuilds
    @Default(true) bool maintainState,

    /// Comportamiento de recorte
    @Default(AppImageClipBehavior.antiAlias) AppImageClipBehavior clipBehavior,

    /// Duración de animaciones en milisegundos
    @Default(300) int animationDuration,

    /// Mostrar indicador de carga
    @Default(true) bool showLoadingIndicator,

    /// Mostrar animación skeleton
    @Default(true) bool showSkeletonAnimation,

    /// Caché de imágenes
    @Default(true) bool enableCache,

    /// Tamaño de caché en MB
    @Default(100) int cacheSize,

    /// Tiempo de vida del caché en horas
    @Default(24) int cacheLifetime,

    /// Habilitar precarga de imágenes
    @Default(false) bool enablePrecaching,

    /// Habilitar compresión automática
    @Default(true) bool enableCompression,

    /// Calidad de compresión (0-100)
    @Default(85) int compressionQuality,
  }) = _AppImageBehavior;
}

/// Configuración de animaciones
@freezed
class AppImageAnimation with _$AppImageAnimation {
  const factory AppImageAnimation({
    /// Tipo de animación
    @Default(AppImageAnimationType.fade) AppImageAnimationType type,

    /// Duración de la animación en milisegundos
    @Default(300) int duration,

    /// Curva de animación
    @Default(Curves.easeInOut) Curve curve,

    /// Habilitar transiciones de estado
    @Default(true) bool enableStateTransitions,

    /// Habilitar animación de hover
    @Default(true) bool enableHoverAnimation,

    /// Habilitar animación de press
    @Default(true) bool enablePressAnimation,

    /// Habilitar animación de carga
    @Default(true) bool enableLoadingAnimation,

    /// Habilitar animación de aparición
    @Default(true) bool enableFadeIn,

    /// Duración del fade in en milisegundos
    @Default(500) int fadeInDuration,
  }) = _AppImageAnimation;
}

/// Configuración para carga lazy
@freezed
class AppImageLazyConfig with _$AppImageLazyConfig {
  const factory AppImageLazyConfig({
    /// Habilitar carga lazy
    @Default(true) bool enabled,

    /// Distancia en píxeles para empezar a cargar
    @Default(200.0) double threshold,

    /// Mostrar placeholder hasta que esté en viewport
    @Default(true) bool showPlaceholder,

    /// Tamaño del placeholder por defecto
    @Default(Size(200, 200)) Size placeholderSize,

    /// Color del placeholder por defecto
    Color? placeholderColor,

    /// Usar skeleton durante carga lazy
    @Default(true) bool useSkeleton,
  }) = _AppImageLazyConfig;
}

/// Configuración de responsividad
@freezed
class AppImageResponsiveConfig with _$AppImageResponsiveConfig {
  const factory AppImageResponsiveConfig({
    /// Habilitar comportamiento responsivo
    @Default(true) bool enabled,

    /// Configuración para mobile
    AppImageBreakpointConfig? mobile,

    /// Configuración para tablet
    AppImageBreakpointConfig? tablet,

    /// Configuración para desktop
    AppImageBreakpointConfig? desktop,

    /// Usar diferentes resoluciones según dispositivo
    @Default(true) bool useAdaptiveResolution,

    /// Factor de escala para imágenes en diferentes densidades
    @Default(true) bool scaleByDevicePixelRatio,
  }) = _AppImageResponsiveConfig;
}

/// Configuración por breakpoint de responsividad
@freezed
class AppImageBreakpointConfig with _$AppImageBreakpointConfig {
  const factory AppImageBreakpointConfig({
    /// Ancho para este breakpoint
    double? width,

    /// Alto para este breakpoint
    double? height,

    /// Fit para este breakpoint
    BoxFit? fit,

    /// Ratio para este breakpoint
    double? ratio,

    /// Calidad de imagen para este breakpoint
    int? quality,
  }) = _AppImageBreakpointConfig;
}

/// Configuración de accesibilidad
@freezed
class AppImageA11yConfig with _$AppImageA11yConfig {
  const factory AppImageA11yConfig({
    /// Habilitar funciones de accesibilidad
    @Default(true) bool enabled,

    /// Texto de semántica personalizado
    String? semanticsLabel,

    /// Descripción detallada para lectores de pantalla
    String? semanticsDescription,

    /// Hints para interacción
    String? semanticsHint,

    /// Si la imagen es decorativa (sin semántica)
    @Default(false) bool isDecorative,

    /// Habilitar navegación por teclado
    @Default(true) bool enableKeyboardNavigation,

    /// Texto alternativo expandido
    String? expandedAltText,

    /// Rol semántico personalizado
    String? semanticsRole,
  }) = _AppImageA11yConfig;
}

/// Variantes del componente AppImage
enum AppImageVariant {
  /// Imagen responsiva estándar
  responsive,

  /// Imagen con carga lazy
  lazy,
}

/// Estados del componente AppImage
enum AppImageState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (mouse encima)
  hover,

  /// Estado presionado
  pressed,

  /// Estado enfocado
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado cargando
  loading,

  /// Estado skeleton (carga initial)
  skeleton,
}

/// Tipos de comportamiento de recorte
enum AppImageClipBehavior {
  /// Sin recorte
  none,

  /// Recorte con anti-aliasing
  antiAlias,

  /// Recorte con anti-aliasing y save layer
  antiAliasWithSaveLayer,

  /// Recorte con borde duro
  hardEdge,
}

/// Tipos de animación
enum AppImageAnimationType {
  /// Sin animación
  none,

  /// Animación de fade in/out
  fade,

  /// Animación de escala
  scale,

  /// Animación de deslizamiento
  slide,

  /// Animación de blur
  blur,
}

// Extensions para facilitar el uso de los enums

extension AppImageVariantExtension on AppImageVariant {
  String get displayName {
    switch (this) {
      case AppImageVariant.responsive:
        return 'Responsive';
      case AppImageVariant.lazy:
        return 'Lazy';
    }
  }

  String get description {
    switch (this) {
      case AppImageVariant.responsive:
        return 'Imagen que se adapta automáticamente a diferentes tamaños de pantalla';
      case AppImageVariant.lazy:
        return 'Imagen que se carga solo cuando está visible en el viewport';
    }
  }

  bool get isLazy {
    return this == AppImageVariant.lazy;
  }

  bool get isResponsive {
    return this == AppImageVariant.responsive;
  }
}

extension AppImageStateExtension on AppImageState {
  String get displayName {
    switch (this) {
      case AppImageState.defaultState:
        return 'Default';
      case AppImageState.hover:
        return 'Hover';
      case AppImageState.pressed:
        return 'Pressed';
      case AppImageState.focus:
        return 'Focus';
      case AppImageState.selected:
        return 'Selected';
      case AppImageState.disabled:
        return 'Disabled';
      case AppImageState.loading:
        return 'Loading';
      case AppImageState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppImageState.defaultState:
      case AppImageState.hover:
      case AppImageState.pressed:
      case AppImageState.focus:
      case AppImageState.selected:
        return true;
      case AppImageState.disabled:
      case AppImageState.loading:
      case AppImageState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppImageState.defaultState:
      case AppImageState.hover:
      case AppImageState.pressed:
      case AppImageState.focus:
      case AppImageState.selected:
        return 1.0;
      case AppImageState.disabled:
        return 0.6;
      case AppImageState.loading:
        return 0.8;
      case AppImageState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppImageState.loading;
  }

  bool get showsSkeleton {
    return this == AppImageState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case AppImageState.defaultState:
      case AppImageState.hover:
      case AppImageState.pressed:
      case AppImageState.focus:
      case AppImageState.selected:
        return true;
      case AppImageState.disabled:
      case AppImageState.loading:
      case AppImageState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case AppImageState.defaultState:
        return 1.0;
      case AppImageState.hover:
        return 1.5;
      case AppImageState.pressed:
        return 0.5;
      case AppImageState.focus:
        return 2.0;
      case AppImageState.selected:
        return 2.5;
      case AppImageState.disabled:
        return 0.0;
      case AppImageState.loading:
      case AppImageState.skeleton:
        return 1.0;
    }
  }
}

extension AppImageClipBehaviorExtension on AppImageClipBehavior {
  String get displayName {
    switch (this) {
      case AppImageClipBehavior.none:
        return 'None';
      case AppImageClipBehavior.antiAlias:
        return 'Anti Alias';
      case AppImageClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case AppImageClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case AppImageClipBehavior.none:
        return Clip.none;
      case AppImageClipBehavior.antiAlias:
        return Clip.antiAlias;
      case AppImageClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case AppImageClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension AppImageAnimationTypeExtension on AppImageAnimationType {
  String get displayName {
    switch (this) {
      case AppImageAnimationType.none:
        return 'None';
      case AppImageAnimationType.fade:
        return 'Fade';
      case AppImageAnimationType.scale:
        return 'Scale';
      case AppImageAnimationType.slide:
        return 'Slide';
      case AppImageAnimationType.blur:
        return 'Blur';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppImageAnimationType.none:
        return Curves.linear;
      case AppImageAnimationType.fade:
        return Curves.easeInOut;
      case AppImageAnimationType.scale:
        return Curves.elasticOut;
      case AppImageAnimationType.slide:
        return Curves.easeOutCubic;
      case AppImageAnimationType.blur:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != AppImageAnimationType.none;
  }
}