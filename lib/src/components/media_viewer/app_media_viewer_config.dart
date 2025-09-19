import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_media_viewer_config.freezed.dart';

/// Configuración principal para el componente DSMediaViewer
///
/// Define todas las propiedades necesarias para personalizar
/// el comportamiento y apariencia del widget DSMediaViewer usando
/// solo design tokens del sistema.
@freezed
class DSMediaViewerConfig with _$DSMediaViewerConfig {
  const factory DSMediaViewerConfig({
    /// Variante del componente media viewer
    @Default(DSMediaViewerVariant.image) DSMediaViewerVariant variant,

    /// Estado actual del componente
    @Default(DSMediaViewerState.defaultState) DSMediaViewerState state,

    /// Lista de elementos de media para mostrar
    @Default([]) List<DSMediaItem> items,

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
    DSMediaViewerColors? colors,

    /// Configuración de espaciado y dimensiones
    DSMediaViewerSpacing? spacing,

    /// Configuración de elevación y sombras
    DSMediaViewerElevation? elevation,

    /// Configuración de comportamiento
    DSMediaViewerBehavior? behavior,

    /// Configuración de animaciones
    DSMediaViewerAnimation? animation,

    /// Configuración de controles
    DSMediaViewerControls? controls,

    /// Configuración de accesibilidad
    DSMediaViewerA11yConfig? a11yConfig,

    /// Callbacks de interacción
    ValueChanged<int>? onPageChanged,
    ValueChanged<DSMediaItem>? onItemTap,
    VoidCallback? onFullscreenToggle,
    ValueChanged<bool>? onPlayPause,
    ValueChanged<double>? onSeek,
    ValueChanged<double>? onVolumeChange,
    VoidCallback? onClose,
  }) = _DSMediaViewerConfig;
}

/// Modelo para un elemento de media
@freezed
class DSMediaItem with _$DSMediaItem {
  const factory DSMediaItem({
    /// Tipo de media
    required DSMediaType type,

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

/// Configuración de colores para el DSMediaViewer
@freezed
class DSMediaViewerColors with _$DSMediaViewerColors {
  const factory DSMediaViewerColors({
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
class DSMediaViewerSpacing with _$DSMediaViewerSpacing {
  const factory DSMediaViewerSpacing({
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
class DSMediaViewerElevation with _$DSMediaViewerElevation {
  const factory DSMediaViewerElevation({
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
class DSMediaViewerBehavior with _$DSMediaViewerBehavior {
  const factory DSMediaViewerBehavior({
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
    @Default(DSMediaViewerClipBehavior.antiAlias) DSMediaViewerClipBehavior clipBehavior,

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
class DSMediaViewerAnimation with _$DSMediaViewerAnimation {
  const factory DSMediaViewerAnimation({
    /// Tipo de animación para transiciones
    @Default(DSMediaViewerAnimationType.slide) DSMediaViewerAnimationType type,

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
class DSMediaViewerControls with _$DSMediaViewerControls {
  const factory DSMediaViewerControls({
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
    @Default(DSMediaViewerControlsPosition.bottom) DSMediaViewerControlsPosition position,

    /// Comportamiento de overlay
    @Default(DSMediaViewerOverlayBehavior.auto) DSMediaViewerOverlayBehavior overlayBehavior,
  }) = _AppMediaViewerControls;
}

/// Configuración de accesibilidad
@freezed
class DSMediaViewerA11yConfig with _$DSMediaViewerA11yConfig {
  const factory DSMediaViewerA11yConfig({
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
  }) = _DSMediaViewerA11yConfig;
}

/// Tipos de media soportados
enum DSMediaType {
  /// Imagen estática
  image,

  /// Video
  video,

  /// Audio
  audio,
}

/// Variantes del componente DSMediaViewer
enum DSMediaViewerVariant {
  /// Variante para imágenes
  image,

  /// Variante para videos
  video,

  /// Variante para audio
  audio,
}

/// Estados del componente DSMediaViewer
enum DSMediaViewerState {
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
enum DSMediaViewerClipBehavior {
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
enum DSMediaViewerAnimationType {
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
enum DSMediaViewerControlsPosition {
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
enum DSMediaViewerOverlayBehavior {
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

extension DSMediaTypeExtension on DSMediaType {
  String get displayName {
    switch (this) {
      case DSMediaType.image:
        return 'Imagen';
      case DSMediaType.video:
        return 'Video';
      case DSMediaType.audio:
        return 'Audio';
    }
  }

  String get description {
    switch (this) {
      case DSMediaType.image:
        return 'Archivo de imagen estática';
      case DSMediaType.video:
        return 'Archivo de video con audio';
      case DSMediaType.audio:
        return 'Archivo de audio';
    }
  }

  bool get isImage => this == DSMediaType.image;
  bool get isVideo => this == DSMediaType.video;
  bool get isAudio => this == DSMediaType.audio;
  bool get hasAudio => this == DSMediaType.video || this == DSMediaType.audio;
  bool get isPlayable => this == DSMediaType.video || this == DSMediaType.audio;
}

extension DSMediaViewerVariantExtension on DSMediaViewerVariant {
  String get displayName {
    switch (this) {
      case DSMediaViewerVariant.image:
        return 'Image Viewer';
      case DSMediaViewerVariant.video:
        return 'Video Player';
      case DSMediaViewerVariant.audio:
        return 'Audio Player';
    }
  }

  String get description {
    switch (this) {
      case DSMediaViewerVariant.image:
        return 'Visualizador optimizado para imágenes con zoom y navegación';
      case DSMediaViewerVariant.video:
        return 'Reproductor de video con controles completos';
      case DSMediaViewerVariant.audio:
        return 'Reproductor de audio con visualización de waveform';
    }
  }

  DSMediaType get primaryMediaType {
    switch (this) {
      case DSMediaViewerVariant.image:
        return DSMediaType.image;
      case DSMediaViewerVariant.video:
        return DSMediaType.video;
      case DSMediaViewerVariant.audio:
        return DSMediaType.audio;
    }
  }

  bool get supportsPlayback {
    return this == DSMediaViewerVariant.video || this == DSMediaViewerVariant.audio;
  }

  bool get supportsZoom {
    return this == DSMediaViewerVariant.image;
  }
}

extension DSMediaViewerStateExtension on DSMediaViewerState {
  String get displayName {
    switch (this) {
      case DSMediaViewerState.defaultState:
        return 'Default';
      case DSMediaViewerState.hover:
        return 'Hover';
      case DSMediaViewerState.pressed:
        return 'Pressed';
      case DSMediaViewerState.focus:
        return 'Focus';
      case DSMediaViewerState.selected:
        return 'Selected';
      case DSMediaViewerState.disabled:
        return 'Disabled';
      case DSMediaViewerState.loading:
        return 'Loading';
      case DSMediaViewerState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSMediaViewerState.defaultState:
      case DSMediaViewerState.hover:
      case DSMediaViewerState.pressed:
      case DSMediaViewerState.focus:
      case DSMediaViewerState.selected:
        return true;
      case DSMediaViewerState.disabled:
      case DSMediaViewerState.loading:
      case DSMediaViewerState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSMediaViewerState.defaultState:
      case DSMediaViewerState.hover:
      case DSMediaViewerState.pressed:
      case DSMediaViewerState.focus:
      case DSMediaViewerState.selected:
        return 1.0;
      case DSMediaViewerState.disabled:
        return 0.6;
      case DSMediaViewerState.loading:
        return 0.8;
      case DSMediaViewerState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSMediaViewerState.loading;
  }

  bool get showsSkeleton {
    return this == DSMediaViewerState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case DSMediaViewerState.defaultState:
      case DSMediaViewerState.hover:
      case DSMediaViewerState.pressed:
      case DSMediaViewerState.focus:
      case DSMediaViewerState.selected:
        return true;
      case DSMediaViewerState.disabled:
      case DSMediaViewerState.loading:
      case DSMediaViewerState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case DSMediaViewerState.defaultState:
        return 1.0;
      case DSMediaViewerState.hover:
        return 1.5;
      case DSMediaViewerState.pressed:
        return 0.5;
      case DSMediaViewerState.focus:
        return 2.0;
      case DSMediaViewerState.selected:
        return 2.5;
      case DSMediaViewerState.disabled:
        return 0.0;
      case DSMediaViewerState.loading:
      case DSMediaViewerState.skeleton:
        return 1.0;
    }
  }
}

extension DSMediaViewerClipBehaviorExtension on DSMediaViewerClipBehavior {
  String get displayName {
    switch (this) {
      case DSMediaViewerClipBehavior.none:
        return 'None';
      case DSMediaViewerClipBehavior.antiAlias:
        return 'Anti Alias';
      case DSMediaViewerClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case DSMediaViewerClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case DSMediaViewerClipBehavior.none:
        return Clip.none;
      case DSMediaViewerClipBehavior.antiAlias:
        return Clip.antiAlias;
      case DSMediaViewerClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case DSMediaViewerClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension DSMediaViewerAnimationTypeExtension on DSMediaViewerAnimationType {
  String get displayName {
    switch (this) {
      case DSMediaViewerAnimationType.none:
        return 'None';
      case DSMediaViewerAnimationType.slide:
        return 'Slide';
      case DSMediaViewerAnimationType.fade:
        return 'Fade';
      case DSMediaViewerAnimationType.scale:
        return 'Scale';
      case DSMediaViewerAnimationType.rotation:
        return 'Rotation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSMediaViewerAnimationType.none:
        return Curves.linear;
      case DSMediaViewerAnimationType.slide:
        return Curves.easeOutCubic;
      case DSMediaViewerAnimationType.fade:
        return Curves.easeInOut;
      case DSMediaViewerAnimationType.scale:
        return Curves.elasticOut;
      case DSMediaViewerAnimationType.rotation:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != DSMediaViewerAnimationType.none;
  }
}

extension DSMediaItemExtension on DSMediaItem {
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