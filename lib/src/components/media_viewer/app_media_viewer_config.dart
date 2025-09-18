import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_media_viewer_config.freezed.dart';

/// Configuración principal para el componente AppMediaViewer
///
/// Define todas las propiedades necesarias para personalizar
/// el comportamiento y apariencia del widget AppMediaViewer usando
/// solo design tokens del sistema.
@freezed
class AppMediaViewerConfig with _$AppMediaViewerConfig {
  const factory AppMediaViewerConfig({
    /// Variante del componente media viewer
    @Default(AppMediaViewerVariant.image) AppMediaViewerVariant variant,

    /// Estado actual del componente
    @Default(AppMediaViewerState.defaultState) AppMediaViewerState state,

    /// Lista de elementos de media para mostrar
    @Default([]) List<AppMediaItem> items,

    /// Índice inicial del elemento a mostrar
    @Default(0) int initialIndex,

    /// Si mostrar captions/subtítulos
    @Default(true) bool showCaptions,

    /// Si mostrar controles de navegación
    @Default(true) bool showControls,

    /// Si mostrar indicadores de página/posición
    @Default(true) bool showIndicators,

    /// Si permitir zoom en imágenes
    @Default(true) bool allowZoom,

    /// Si permitir pantalla completa
    @Default(true) bool allowFullscreen,

    /// Si reproducir automáticamente videos/audio
    @Default(false) bool autoPlay,

    /// Si hacer loop en videos/audio
    @Default(false) bool loop,

    /// Si silenciar por defecto
    @Default(false) bool muted,

    /// Configuración de colores
    AppMediaViewerColors? colors,

    /// Configuración de espaciado y dimensiones
    AppMediaViewerSpacing? spacing,

    /// Configuración de elevación y sombras
    AppMediaViewerElevation? elevation,

    /// Configuración de comportamiento
    AppMediaViewerBehavior? behavior,

    /// Configuración de animaciones
    AppMediaViewerAnimation? animation,

    /// Configuración de controles
    AppMediaViewerControls? controls,

    /// Configuración de accesibilidad
    AppMediaViewerA11yConfig? a11yConfig,

    /// Callbacks de interacción
    ValueChanged<int>? onPageChanged,
    ValueChanged<AppMediaItem>? onItemTap,
    VoidCallback? onFullscreenToggle,
    ValueChanged<bool>? onPlayPause,
    ValueChanged<double>? onSeek,
    ValueChanged<double>? onVolumeChange,
    VoidCallback? onClose,
  }) = _AppMediaViewerConfig;
}

/// Modelo para un elemento de media
@freezed
class AppMediaItem with _$AppMediaItem {
  const factory AppMediaItem({
    /// Tipo de media
    required AppMediaType type,

    /// URL o path del archivo
    required String src,

    /// URL de thumbnail/preview
    String? thumbnail,

    /// Caption/subtítulo
    String? caption,

    /// Texto alternativo para accesibilidad
    String? alt,

    /// Duración en segundos (para video/audio)
    double? duration,

    /// Dimensiones originales
    Size? dimensions,

    /// Metadatos adicionales
    Map<String, dynamic>? metadata,
  }) = _AppMediaItem;
}

/// Configuración de colores para el AppMediaViewer
@freezed
class AppMediaViewerColors with _$AppMediaViewerColors {
  const factory AppMediaViewerColors({
    /// Color de fondo del viewer
    Color? backgroundColor,

    /// Color de fondo de los controles
    Color? controlsBackgroundColor,

    /// Color de los iconos de control
    Color? controlsIconColor,

    /// Color del texto de los controles
    Color? controlsTextColor,

    /// Color de fondo del overlay
    Color? overlayBackgroundColor,

    /// Color de los indicadores activos
    Color? activeIndicatorColor,

    /// Color de los indicadores inactivos
    Color? inactiveIndicatorColor,

    /// Color del borde
    Color? borderColor,

    /// Color de la sombra
    Color? shadowColor,

    /// Color en hover
    Color? hoverColor,

    /// Color cuando presionado
    Color? pressedColor,

    /// Color cuando enfocado
    Color? focusColor,

    /// Color cuando seleccionado
    Color? selectedColor,

    /// Color cuando deshabilitado
    Color? disabledColor,

    /// Color de loading
    Color? loadingColor,

    /// Color del skeleton
    Color? skeletonColor,

    /// Color del caption/subtítulo
    Color? captionTextColor,

    /// Color de fondo del caption
    Color? captionBackgroundColor,
  }) = _AppMediaViewerColors;
}

/// Configuración de espaciado y dimensiones
@freezed
class AppMediaViewerSpacing with _$AppMediaViewerSpacing {
  const factory AppMediaViewerSpacing({
    /// Ancho del componente
    double? width,

    /// Alto del componente
    double? height,

    /// Padding interno
    @Default(EdgeInsets.zero) EdgeInsets padding,

    /// Margin externo
    @Default(EdgeInsets.zero) EdgeInsets margin,

    /// Radio de borde
    @Default(12.0) double borderRadius,

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

    /// Espaciado entre controles
    @Default(16.0) double controlsSpacing,

    /// Tamaño de los iconos de control
    @Default(24.0) double controlsIconSize,

    /// Altura de la barra de controles
    @Default(56.0) double controlsBarHeight,

    /// Tamaño de los indicadores
    @Default(8.0) double indicatorSize,

    /// Espaciado entre indicadores
    @Default(8.0) double indicatorSpacing,

    /// Padding del caption
    @Default(EdgeInsets.all(16.0)) EdgeInsets captionPadding,
  }) = _AppMediaViewerSpacing;
}

/// Configuración de elevación y sombras
@freezed
class AppMediaViewerElevation with _$AppMediaViewerElevation {
  const factory AppMediaViewerElevation({
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

    /// Elevación de los controles
    @Default(8.0) double controlsElevation,

    /// Color de la sombra
    Color? shadowColor,

    /// Color de tinte de superficie
    Color? surfaceTintColor,
  }) = _AppMediaViewerElevation;
}

/// Configuración de comportamiento
@freezed
class AppMediaViewerBehavior with _$AppMediaViewerBehavior {
  const factory AppMediaViewerBehavior({
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
    @Default(AppMediaViewerClipBehavior.antiAlias) AppMediaViewerClipBehavior clipBehavior,

    /// Duración de animaciones en milisegundos
    @Default(300) int animationDuration,

    /// Mostrar indicador de carga
    @Default(true) bool showLoadingIndicator,

    /// Mostrar animación skeleton
    @Default(true) bool showSkeletonAnimation,

    /// Ocultar controles automáticamente
    @Default(true) bool autoHideControls,

    /// Tiempo para ocultar controles (segundos)
    @Default(3) int autoHideControlsDelay,

    /// Permitir gestos de swipe
    @Default(true) bool enableSwipeGestures,

    /// Permitir doble tap para zoom
    @Default(true) bool enableDoubleTapZoom,

    /// Permitir pinch to zoom
    @Default(true) bool enablePinchZoom,

    /// Zoom mínimo
    @Default(0.5) double minZoom,

    /// Zoom máximo
    @Default(3.0) double maxZoom,

    /// Velocidad de scroll para cambiar página
    @Default(0.8) double pageChangeThreshold,
  }) = _AppMediaViewerBehavior;
}

/// Configuración de animaciones
@freezed
class AppMediaViewerAnimation with _$AppMediaViewerAnimation {
  const factory AppMediaViewerAnimation({
    /// Tipo de animación para transiciones
    @Default(AppMediaViewerAnimationType.slide) AppMediaViewerAnimationType type,

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

    /// Habilitar animación de controles
    @Default(true) bool enableControlsAnimation,

    /// Duración del fade in de controles
    @Default(200) int controlsFadeInDuration,

    /// Duración del fade out de controles
    @Default(500) int controlsFadeOutDuration,
  }) = _AppMediaViewerAnimation;
}

/// Configuración de controles
@freezed
class AppMediaViewerControls with _$AppMediaViewerControls {
  const factory AppMediaViewerControls({
    /// Mostrar botón de play/pause
    @Default(true) bool showPlayPause,

    /// Mostrar controles de volumen
    @Default(true) bool showVolumeControls,

    /// Mostrar seek bar
    @Default(true) bool showSeekBar,

    /// Mostrar tiempo actual/total
    @Default(true) bool showTimeDisplay,

    /// Mostrar botón de pantalla completa
    @Default(true) bool showFullscreenButton,

    /// Mostrar botones de navegación
    @Default(true) bool showNavigationButtons,

    /// Mostrar botón de cerrar
    @Default(true) bool showCloseButton,

    /// Mostrar botón de compartir
    @Default(false) bool showShareButton,

    /// Mostrar botón de descarga
    @Default(false) bool showDownloadButton,

    /// Mostrar información del archivo
    @Default(false) bool showFileInfo,

    /// Posición de los controles
    @Default(AppMediaViewerControlsPosition.bottom) AppMediaViewerControlsPosition position,

    /// Comportamiento de overlay
    @Default(AppMediaViewerOverlayBehavior.auto) AppMediaViewerOverlayBehavior overlayBehavior,
  }) = _AppMediaViewerControls;
}

/// Configuración de accesibilidad
@freezed
class AppMediaViewerA11yConfig with _$AppMediaViewerA11yConfig {
  const factory AppMediaViewerA11yConfig({
    /// Habilitar funciones de accesibilidad
    @Default(true) bool enabled,

    /// Texto de semántica personalizado
    String? semanticsLabel,

    /// Descripción detallada para lectores de pantalla
    String? semanticsDescription,

    /// Hints para interacción
    String? semanticsHint,

    /// Habilitar navegación por teclado
    @Default(true) bool enableKeyboardNavigation,

    /// Habilitar anuncios de estado
    @Default(true) bool enableStateAnnouncements,

    /// Texto para el botón de play
    @Default('Reproducir') String playButtonLabel,

    /// Texto para el botón de pause
    @Default('Pausar') String pauseButtonLabel,

    /// Texto para el botón anterior
    @Default('Anterior') String previousButtonLabel,

    /// Texto para el botón siguiente
    @Default('Siguiente') String nextButtonLabel,

    /// Texto para el botón de pantalla completa
    @Default('Pantalla completa') String fullscreenButtonLabel,

    /// Texto para el botón de cerrar
    @Default('Cerrar') String closeButtonLabel,

    /// Rol semántico personalizado
    String? semanticsRole,
  }) = _AppMediaViewerA11yConfig;
}

/// Tipos de media soportados
enum AppMediaType {
  /// Imagen estática
  image,

  /// Video
  video,

  /// Audio
  audio,
}

/// Variantes del componente AppMediaViewer
enum AppMediaViewerVariant {
  /// Variante para imágenes
  image,

  /// Variante para videos
  video,

  /// Variante para audio
  audio,
}

/// Estados del componente AppMediaViewer
enum AppMediaViewerState {
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
enum AppMediaViewerClipBehavior {
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
enum AppMediaViewerAnimationType {
  /// Sin animación
  none,

  /// Animación de deslizamiento
  slide,

  /// Animación de fade
  fade,

  /// Animación de escala
  scale,

  /// Animación de rotación
  rotation,
}

/// Posición de los controles
enum AppMediaViewerControlsPosition {
  /// Controles en la parte superior
  top,

  /// Controles en la parte inferior
  bottom,

  /// Controles overlay sobre el contenido
  overlay,

  /// Controles en los lados
  sides,
}

/// Comportamiento del overlay
enum AppMediaViewerOverlayBehavior {
  /// Mostrar siempre
  always,

  /// Ocultar automáticamente
  auto,

  /// Mostrar solo al hacer hover/tap
  onDemand,

  /// Nunca mostrar
  never,
}

// Extensions para facilitar el uso de los enums

extension AppMediaTypeExtension on AppMediaType {
  String get displayName {
    switch (this) {
      case AppMediaType.image:
        return 'Imagen';
      case AppMediaType.video:
        return 'Video';
      case AppMediaType.audio:
        return 'Audio';
    }
  }

  String get description {
    switch (this) {
      case AppMediaType.image:
        return 'Archivo de imagen estática';
      case AppMediaType.video:
        return 'Archivo de video con audio';
      case AppMediaType.audio:
        return 'Archivo de audio';
    }
  }

  bool get isImage => this == AppMediaType.image;
  bool get isVideo => this == AppMediaType.video;
  bool get isAudio => this == AppMediaType.audio;
  bool get hasAudio => this == AppMediaType.video || this == AppMediaType.audio;
  bool get isPlayable => this == AppMediaType.video || this == AppMediaType.audio;
}

extension AppMediaViewerVariantExtension on AppMediaViewerVariant {
  String get displayName {
    switch (this) {
      case AppMediaViewerVariant.image:
        return 'Image Viewer';
      case AppMediaViewerVariant.video:
        return 'Video Player';
      case AppMediaViewerVariant.audio:
        return 'Audio Player';
    }
  }

  String get description {
    switch (this) {
      case AppMediaViewerVariant.image:
        return 'Visualizador optimizado para imágenes con zoom y navegación';
      case AppMediaViewerVariant.video:
        return 'Reproductor de video con controles completos';
      case AppMediaViewerVariant.audio:
        return 'Reproductor de audio con visualización de waveform';
    }
  }

  AppMediaType get primaryMediaType {
    switch (this) {
      case AppMediaViewerVariant.image:
        return AppMediaType.image;
      case AppMediaViewerVariant.video:
        return AppMediaType.video;
      case AppMediaViewerVariant.audio:
        return AppMediaType.audio;
    }
  }

  bool get supportsPlayback {
    return this == AppMediaViewerVariant.video || this == AppMediaViewerVariant.audio;
  }

  bool get supportsZoom {
    return this == AppMediaViewerVariant.image;
  }
}

extension AppMediaViewerStateExtension on AppMediaViewerState {
  String get displayName {
    switch (this) {
      case AppMediaViewerState.defaultState:
        return 'Default';
      case AppMediaViewerState.hover:
        return 'Hover';
      case AppMediaViewerState.pressed:
        return 'Pressed';
      case AppMediaViewerState.focus:
        return 'Focus';
      case AppMediaViewerState.selected:
        return 'Selected';
      case AppMediaViewerState.disabled:
        return 'Disabled';
      case AppMediaViewerState.loading:
        return 'Loading';
      case AppMediaViewerState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppMediaViewerState.defaultState:
      case AppMediaViewerState.hover:
      case AppMediaViewerState.pressed:
      case AppMediaViewerState.focus:
      case AppMediaViewerState.selected:
        return true;
      case AppMediaViewerState.disabled:
      case AppMediaViewerState.loading:
      case AppMediaViewerState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppMediaViewerState.defaultState:
      case AppMediaViewerState.hover:
      case AppMediaViewerState.pressed:
      case AppMediaViewerState.focus:
      case AppMediaViewerState.selected:
        return 1.0;
      case AppMediaViewerState.disabled:
        return 0.6;
      case AppMediaViewerState.loading:
        return 0.8;
      case AppMediaViewerState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppMediaViewerState.loading;
  }

  bool get showsSkeleton {
    return this == AppMediaViewerState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case AppMediaViewerState.defaultState:
      case AppMediaViewerState.hover:
      case AppMediaViewerState.pressed:
      case AppMediaViewerState.focus:
      case AppMediaViewerState.selected:
        return true;
      case AppMediaViewerState.disabled:
      case AppMediaViewerState.loading:
      case AppMediaViewerState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case AppMediaViewerState.defaultState:
        return 1.0;
      case AppMediaViewerState.hover:
        return 1.5;
      case AppMediaViewerState.pressed:
        return 0.5;
      case AppMediaViewerState.focus:
        return 2.0;
      case AppMediaViewerState.selected:
        return 2.5;
      case AppMediaViewerState.disabled:
        return 0.0;
      case AppMediaViewerState.loading:
      case AppMediaViewerState.skeleton:
        return 1.0;
    }
  }
}

extension AppMediaViewerClipBehaviorExtension on AppMediaViewerClipBehavior {
  String get displayName {
    switch (this) {
      case AppMediaViewerClipBehavior.none:
        return 'None';
      case AppMediaViewerClipBehavior.antiAlias:
        return 'Anti Alias';
      case AppMediaViewerClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case AppMediaViewerClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case AppMediaViewerClipBehavior.none:
        return Clip.none;
      case AppMediaViewerClipBehavior.antiAlias:
        return Clip.antiAlias;
      case AppMediaViewerClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case AppMediaViewerClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension AppMediaViewerAnimationTypeExtension on AppMediaViewerAnimationType {
  String get displayName {
    switch (this) {
      case AppMediaViewerAnimationType.none:
        return 'None';
      case AppMediaViewerAnimationType.slide:
        return 'Slide';
      case AppMediaViewerAnimationType.fade:
        return 'Fade';
      case AppMediaViewerAnimationType.scale:
        return 'Scale';
      case AppMediaViewerAnimationType.rotation:
        return 'Rotation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppMediaViewerAnimationType.none:
        return Curves.linear;
      case AppMediaViewerAnimationType.slide:
        return Curves.easeOutCubic;
      case AppMediaViewerAnimationType.fade:
        return Curves.easeInOut;
      case AppMediaViewerAnimationType.scale:
        return Curves.elasticOut;
      case AppMediaViewerAnimationType.rotation:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != AppMediaViewerAnimationType.none;
  }
}

extension AppMediaItemExtension on AppMediaItem {
  /// Determina si es un elemento de imagen
  bool get isImage => type.isImage;

  /// Determina si es un elemento de video
  bool get isVideo => type.isVideo;

  /// Determina si es un elemento de audio
  bool get isAudio => type.isAudio;

  /// Determina si el elemento es reproducible
  bool get isPlayable => type.isPlayable;

  /// Determina si tiene audio
  bool get hasAudio => type.hasAudio;

  /// Obtiene el aspect ratio si las dimensiones están disponibles
  double? get aspectRatio {
    if (dimensions != null) {
      return dimensions!.width / dimensions!.height;
    }
    return null;
  }

  /// Formatea la duración en formato mm:ss
  String get formattedDuration {
    if (duration == null) return '';

    final minutes = (duration! / 60).floor();
    final seconds = (duration! % 60).floor();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Determina la extensión del archivo basada en la URL
  String get fileExtension {
    final uri = Uri.tryParse(src);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      final filename = uri.pathSegments.last;
      final lastDot = filename.lastIndexOf('.');
      if (lastDot != -1 && lastDot < filename.length - 1) {
        return filename.substring(lastDot + 1).toLowerCase();
      }
    }
    return '';
  }

  /// Valida que el elemento tiene la información mínima requerida
  bool get isValid {
    return src.isNotEmpty;
  }
}