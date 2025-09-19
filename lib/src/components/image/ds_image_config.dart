import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_image_config.freezed.dart';

/// Configuración principal para el componente DSImage
///
/// Define todas las propiedades necesarias para personalizar
/// el comportamiento y apariencia del widget DSImage usando
/// solo design tokens del sistema.
@freezed
class DSImageConfig with _$DSImageConfig {
  const factory DSImageConfig({
    /// Variante del componente image
    @Default(DSImageVariant.responsive) DSImageVariant variant,

    /// Estado actual del componente
    @Default(DSImageState.defaultState) DSImageState state,

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
    DSImageColors? colors,

    /// Configuración de espaciado y dimensiones
    DSImageSpacing? spacing,

    /// Configuración de elevación y sombras
    DSImageElevation? elevation,

    /// Configuración de comportamiento
    DSImageBehavior? behavior,

    /// Configuración de animaciones
    DSImageAnimation? animation,

    /// Configuración de carga lazy
    DSImageLazyConfig? lazyConfig,

    /// Configuración de responsividad
    DSImageResponsiveConfig? responsiveConfig,

    /// Configuración de accesibilidad
    DSImageA11yConfig? a11yConfig,

    /// Callbacks de interacción
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    VoidCallback? onLoad,
    VoidCallback? onError,
  }) = _DSImageConfig;
}

/// Configuración de colores para el DSImage
@freezed
class DSImageColors with _$DSImageColors {
  const factory DSImageColors({
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
  }) = _DSImageColors;
}

/// Configuración de espaciado y dimensiones
@freezed
class DSImageSpacing with _$DSImageSpacing {
  const factory DSImageSpacing({
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
  }) = _DSImageSpacing;
}

/// Configuración de elevación y sombras
@freezed
class DSImageElevation with _$DSImageElevation {
  const factory DSImageElevation({
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
  }) = _DSImageElevation;
}

/// Configuración de comportamiento
@freezed
class DSImageBehavior with _$DSImageBehavior {
  const factory DSImageBehavior({
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
    @Default(DSImageClipBehavior.antiAlias) DSImageClipBehavior clipBehavior,

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
  }) = _DSImageBehavior;
}

/// Configuración de animaciones
@freezed
class DSImageAnimation with _$DSImageAnimation {
  const factory DSImageAnimation({
    /// Tipo de animación
    @Default(DSImageAnimationType.fade) DSImageAnimationType type,

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
  }) = _DSImageAnimation;
}

/// Configuración para carga lazy
@freezed
class DSImageLazyConfig with _$DSImageLazyConfig {
  const factory DSImageLazyConfig({
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
  }) = _DSImageLazyConfig;
}

/// Configuración de responsividad
@freezed
class DSImageResponsiveConfig with _$DSImageResponsiveConfig {
  const factory DSImageResponsiveConfig({
    /// Habilitar comportamiento responsivo
    @Default(true) bool enabled,

    /// Configuración para mobile
    DSImageBreakpointConfig? mobile,

    /// Configuración para tablet
    DSImageBreakpointConfig? tablet,

    /// Configuración para desktop
    DSImageBreakpointConfig? desktop,

    /// Usar diferentes resoluciones según dispositivo
    @Default(true) bool useAdaptiveResolution,

    /// Factor de escala para imágenes en diferentes densidades
    @Default(true) bool scaleByDevicePixelRatio,
  }) = _DSImageResponsiveConfig;
}

/// Configuración por breakpoint de responsividad
@freezed
class DSImageBreakpointConfig with _$DSImageBreakpointConfig {
  const factory DSImageBreakpointConfig({
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
  }) = _DSImageBreakpointConfig;
}

/// Configuración de accesibilidad
@freezed
class DSImageA11yConfig with _$DSImageA11yConfig {
  const factory DSImageA11yConfig({
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
  }) = _DSImageA11yConfig;
}

/// Variantes del componente DSImage
enum DSImageVariant {
  /// Imagen responsiva estándar
  responsive,

  /// Imagen con carga lazy
  lazy,
}

/// Estados del componente DSImage
enum DSImageState {
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
enum DSImageClipBehavior {
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
enum DSImageAnimationType {
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

extension DSImageVariantExtension on DSImageVariant {
  String get displayName {
    switch (this) {
      case DSImageVariant.responsive:
        return 'Responsive';
      case DSImageVariant.lazy:
        return 'Lazy';
    }
  }

  String get description {
    switch (this) {
      case DSImageVariant.responsive:
        return 'Imagen que se adapta automáticamente a diferentes tamaños de pantalla';
      case DSImageVariant.lazy:
        return 'Imagen que se carga solo cuando está visible en el viewport';
    }
  }

  bool get isLazy {
    return this == DSImageVariant.lazy;
  }

  bool get isResponsive {
    return this == DSImageVariant.responsive;
  }
}

extension DSImageStateExtension on DSImageState {
  String get displayName {
    switch (this) {
      case DSImageState.defaultState:
        return 'Default';
      case DSImageState.hover:
        return 'Hover';
      case DSImageState.pressed:
        return 'Pressed';
      case DSImageState.focus:
        return 'Focus';
      case DSImageState.selected:
        return 'Selected';
      case DSImageState.disabled:
        return 'Disabled';
      case DSImageState.loading:
        return 'Loading';
      case DSImageState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSImageState.defaultState:
      case DSImageState.hover:
      case DSImageState.pressed:
      case DSImageState.focus:
      case DSImageState.selected:
        return true;
      case DSImageState.disabled:
      case DSImageState.loading:
      case DSImageState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSImageState.defaultState:
      case DSImageState.hover:
      case DSImageState.pressed:
      case DSImageState.focus:
      case DSImageState.selected:
        return 1.0;
      case DSImageState.disabled:
        return 0.6;
      case DSImageState.loading:
        return 0.8;
      case DSImageState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSImageState.loading;
  }

  bool get showsSkeleton {
    return this == DSImageState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case DSImageState.defaultState:
      case DSImageState.hover:
      case DSImageState.pressed:
      case DSImageState.focus:
      case DSImageState.selected:
        return true;
      case DSImageState.disabled:
      case DSImageState.loading:
      case DSImageState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case DSImageState.defaultState:
        return 1.0;
      case DSImageState.hover:
        return 1.5;
      case DSImageState.pressed:
        return 0.5;
      case DSImageState.focus:
        return 2.0;
      case DSImageState.selected:
        return 2.5;
      case DSImageState.disabled:
        return 0.0;
      case DSImageState.loading:
      case DSImageState.skeleton:
        return 1.0;
    }
  }
}

extension DSImageClipBehaviorExtension on DSImageClipBehavior {
  String get displayName {
    switch (this) {
      case DSImageClipBehavior.none:
        return 'None';
      case DSImageClipBehavior.antiAlias:
        return 'Anti Alias';
      case DSImageClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case DSImageClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case DSImageClipBehavior.none:
        return Clip.none;
      case DSImageClipBehavior.antiAlias:
        return Clip.antiAlias;
      case DSImageClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case DSImageClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension DSImageAnimationTypeExtension on DSImageAnimationType {
  String get displayName {
    switch (this) {
      case DSImageAnimationType.none:
        return 'None';
      case DSImageAnimationType.fade:
        return 'Fade';
      case DSImageAnimationType.scale:
        return 'Scale';
      case DSImageAnimationType.slide:
        return 'Slide';
      case DSImageAnimationType.blur:
        return 'Blur';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSImageAnimationType.none:
        return Curves.linear;
      case DSImageAnimationType.fade:
        return Curves.easeInOut;
      case DSImageAnimationType.scale:
        return Curves.elasticOut;
      case DSImageAnimationType.slide:
        return Curves.easeOutCubic;
      case DSImageAnimationType.blur:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != DSImageAnimationType.none;
  }
}