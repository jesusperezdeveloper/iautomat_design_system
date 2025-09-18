import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_camera_picker_config.freezed.dart';

/// Fuentes disponibles para seleccionar imágenes
enum AppCameraPickerSource {
  /// Solo cámara
  camera,
  /// Solo galería/archivos
  gallery,
  /// Tanto cámara como galería (mostrar opciones)
  both,
}

/// Variantes del picker adaptadas por plataforma
enum AppCameraPickerVariant {
  /// Adaptación automática según la plataforma
  platform,
  /// Estilo específico de iOS (action sheet)
  ios,
  /// Estilo específico de Android (bottom sheet)
  android,
  /// Estilo específico de Web (file dialog)
  web,
}

/// Estados del componente AppCameraPicker
enum AppCameraPickerState {
  /// Estado normal por defecto
  defaultState,
  /// Estado cuando el mouse está encima (hover)
  hover,
  /// Estado cuando está siendo presionado
  pressed,
  /// Estado cuando tiene el foco del teclado
  focus,
  /// Estado cuando está seleccionado
  selected,
  /// Estado deshabilitado
  disabled,
  /// Estado de carga
  loading,
  /// Estado skeleton (placeholder)
  skeleton,
}

/// Tipos de archivos permitidos
enum AppCameraPickerFileType {
  /// Solo imágenes
  image,
  /// Solo videos
  video,
  /// Imágenes y videos
  media,
  /// Cualquier archivo (solo web)
  any,
}

/// Calidad de imagen/video
enum AppCameraPickerQuality {
  /// Baja calidad (más rápido, menos espacio)
  low,
  /// Calidad media (balance)
  medium,
  /// Alta calidad (mejor resolución)
  high,
  /// Máxima calidad
  max,
}

/// Configuración de colores para AppCameraPicker
@freezed
class AppCameraPickerColors with _$AppCameraPickerColors {
  const factory AppCameraPickerColors({
    /// Color de fondo principal
    Color? backgroundColor,
    /// Color de fondo cuando está hover
    Color? backgroundHoverColor,
    /// Color de fondo cuando está presionado
    Color? backgroundPressedColor,
    /// Color de fondo cuando está deshabilitado
    Color? backgroundDisabledColor,
    /// Color del texto principal
    Color? textColor,
    /// Color del texto cuando está deshabilitado
    Color? textDisabledColor,
    /// Color del ícono
    Color? iconColor,
    /// Color del ícono cuando está deshabilitado
    Color? iconDisabledColor,
    /// Color del borde
    Color? borderColor,
    /// Color del borde cuando tiene foco
    Color? borderFocusColor,
    /// Color de la sombra
    Color? shadowColor,
    /// Color del overlay de carga
    Color? loadingOverlayColor,
    /// Color del skeleton
    Color? skeletonColor,
  }) = _AppCameraPickerColors;
}

/// Configuración de espaciado para AppCameraPicker
@freezed
class AppCameraPickerSpacing with _$AppCameraPickerSpacing {
  const factory AppCameraPickerSpacing({
    /// Padding interno
    @Default(EdgeInsets.all(16.0)) EdgeInsets padding,
    /// Margen externo
    @Default(EdgeInsets.zero) EdgeInsets margin,
    /// Radio de los bordes
    @Default(12.0) double borderRadius,
    /// Ancho del borde
    @Default(1.0) double borderWidth,
    /// Espacio entre ícono y texto
    @Default(8.0) double iconTextSpacing,
    /// Altura mínima del componente
    @Default(56.0) double minHeight,
    /// Ancho mínimo del componente
    @Default(200.0) double minWidth,
  }) = _AppCameraPickerSpacing;
}

/// Configuración de elevación para AppCameraPicker
@freezed
class AppCameraPickerElevation with _$AppCameraPickerElevation {
  const factory AppCameraPickerElevation({
    /// Elevación por defecto
    @Default(2.0) double defaultElevation,
    /// Elevación en hover
    @Default(4.0) double hoverElevation,
    /// Elevación cuando está presionado
    @Default(1.0) double pressedElevation,
    /// Elevación cuando está deshabilitado
    @Default(0.0) double disabledElevation,
  }) = _AppCameraPickerElevation;
}

/// Configuración de comportamiento para AppCameraPicker
@freezed
class AppCameraPickerBehavior with _$AppCameraPickerBehavior {
  const factory AppCameraPickerBehavior({
    /// Permitir selección múltiple
    @Default(false) bool allowMultiple,
    /// Máximo número de archivos seleccionables
    @Default(10) int maxFiles,
    /// Comprimir imágenes automáticamente
    @Default(true) bool compressImages,
    /// Rotar imágenes según EXIF
    @Default(true) bool autoRotate,
    /// Mostrar preview después de seleccionar
    @Default(true) bool showPreview,
    /// Permitir edición básica (crop, rotate)
    @Default(false) bool allowEditing,
    /// Haptic feedback en interacciones
    @Default(true) bool enableHapticFeedback,
    /// Mostrar progreso de carga
    @Default(true) bool showLoadingProgress,
    /// Timeout para operaciones en segundos
    @Default(30) int operationTimeout,
  }) = _AppCameraPickerBehavior;
}

/// Configuración de animaciones para AppCameraPicker
@freezed
class AppCameraPickerAnimation with _$AppCameraPickerAnimation {
  const factory AppCameraPickerAnimation({
    /// Duración de animaciones de estado
    @Default(Duration(milliseconds: 200)) Duration stateDuration,
    /// Duración de animación de aparición
    @Default(Duration(milliseconds: 300)) Duration appearDuration,
    /// Duración de animación de desaparición
    @Default(Duration(milliseconds: 250)) Duration disappearDuration,
    /// Curva de animación para estados
    @Default(Curves.easeInOut) Curve stateCurve,
    /// Curva de animación para aparición
    @Default(Curves.easeOut) Curve appearCurve,
    /// Curva de animación para desaparición
    @Default(Curves.easeIn) Curve disappearCurve,
    /// Permitir animaciones (puede ser deshabilitado para accesibilidad)
    @Default(true) bool enabled,
  }) = _AppCameraPickerAnimation;
}

/// Configuración de accesibilidad para AppCameraPicker
@freezed
class AppCameraPickerA11yConfig with _$AppCameraPickerA11yConfig {
  const factory AppCameraPickerA11yConfig({
    /// Habilitar funciones de accesibilidad
    @Default(true) bool enabled,
    /// Texto de semántica principal
    String? semanticsLabel,
    /// Descripción detallada para lectores de pantalla
    String? semanticsDescription,
    /// Hint para la interacción
    String? semanticsHint,
    /// Texto para el botón de cámara
    @Default('Tomar foto con cámara') String cameraButtonLabel,
    /// Texto para el botón de galería
    @Default('Seleccionar desde galería') String galleryButtonLabel,
    /// Texto para el botón de archivos
    @Default('Seleccionar archivos') String filesButtonLabel,
    /// Habilitar navegación por teclado
    @Default(true) bool enableKeyboardNavigation,
    /// Anunciar cambios de estado
    @Default(true) bool announceStateChanges,
    /// Soporte para lectores de pantalla
    @Default(true) bool screenReaderSupport,
  }) = _AppCameraPickerA11yConfig;
}

/// Configuración específica de plataforma
@freezed
class AppCameraPickerPlatformConfig with _$AppCameraPickerPlatformConfig {
  const factory AppCameraPickerPlatformConfig({
    /// Mostrar opciones como action sheet en iOS
    @Default(true) bool iosUseActionSheet,
    /// Mostrar opciones como bottom sheet en Android
    @Default(true) bool androidUseBottomSheet,
    /// Usar dialog nativo del navegador en Web
    @Default(true) bool webUseNativeDialog,
    /// Solicitar permisos automáticamente
    @Default(true) bool requestPermissionsAutomatically,
    /// Mostrar explicación de permisos
    @Default(true) bool showPermissionRationale,
    /// Extensiones de archivo permitidas (web)
    @Default(['jpg', 'jpeg', 'png', 'gif', 'mp4', 'mov']) List<String> allowedExtensions,
  }) = _AppCameraPickerPlatformConfig;
}

/// Datos de un archivo seleccionado
@freezed
class AppCameraPickerFile with _$AppCameraPickerFile {
  const factory AppCameraPickerFile({
    /// Nombre del archivo
    required String name,
    /// Ruta o URI del archivo
    required String path,
    /// Tamaño en bytes
    required int size,
    /// Tipo MIME
    required String mimeType,
    /// Datos del archivo en bytes (para web principalmente)
    List<int>? bytes,
    /// Ancho de imagen/video (si aplica)
    int? width,
    /// Alto de imagen/video (si aplica)
    int? height,
    /// Duración de video (si aplica)
    Duration? duration,
    /// Thumbnail/preview (si aplica)
    String? thumbnail,
    /// Metadata adicional
    Map<String, dynamic>? metadata,
  }) = _AppCameraPickerFile;

  const AppCameraPickerFile._();

  /// Si es una imagen
  bool get isImage => mimeType.startsWith('image/');

  /// Si es un video
  bool get isVideo => mimeType.startsWith('video/');

  /// Extensión del archivo
  String get extension {
    final parts = name.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  /// Tamaño formateado legible
  String get formattedSize {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}

/// Configuración principal del AppCameraPicker
@freezed
class AppCameraPickerConfig with _$AppCameraPickerConfig {
  const factory AppCameraPickerConfig({
    /// Variante del picker
    @Default(AppCameraPickerVariant.platform) AppCameraPickerVariant variant,
    /// Estado actual del componente
    @Default(AppCameraPickerState.defaultState) AppCameraPickerState state,
    /// Fuente de selección
    @Default(AppCameraPickerSource.both) AppCameraPickerSource source,
    /// Tipo de archivos permitidos
    @Default(AppCameraPickerFileType.image) AppCameraPickerFileType fileType,
    /// Calidad de captura/selección
    @Default(AppCameraPickerQuality.medium) AppCameraPickerQuality quality,
    /// Configuración de colores
    AppCameraPickerColors? colors,
    /// Configuración de espaciado
    AppCameraPickerSpacing? spacing,
    /// Configuración de elevación
    AppCameraPickerElevation? elevation,
    /// Configuración de comportamiento
    AppCameraPickerBehavior? behavior,
    /// Configuración de animaciones
    AppCameraPickerAnimation? animation,
    /// Configuración de accesibilidad
    AppCameraPickerA11yConfig? a11yConfig,
    /// Configuración específica de plataforma
    AppCameraPickerPlatformConfig? platformConfig,
    /// Texto del botón principal
    String? buttonText,
    /// Ícono del botón principal
    IconData? buttonIcon,
    /// Si está habilitado
    @Default(true) bool enabled,
    /// Callbacks
    ValueChanged<List<AppCameraPickerFile>>? onPicked,
    ValueChanged<String>? onError,
    VoidCallback? onPermissionDenied,
    VoidCallback? onCancelled,
  }) = _AppCameraPickerConfig;
}

/// Extensiones para los enums
extension AppCameraPickerSourceExtension on AppCameraPickerSource {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCameraPickerSource.camera:
        return 'Cámara';
      case AppCameraPickerSource.gallery:
        return 'Galería';
      case AppCameraPickerSource.both:
        return 'Cámara y Galería';
    }
  }

  /// Ícono asociado
  IconData get icon {
    switch (this) {
      case AppCameraPickerSource.camera:
        return Icons.camera_alt;
      case AppCameraPickerSource.gallery:
        return Icons.photo_library;
      case AppCameraPickerSource.both:
        return Icons.add_a_photo;
    }
  }
}

extension AppCameraPickerVariantExtension on AppCameraPickerVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCameraPickerVariant.platform:
        return 'Plataforma';
      case AppCameraPickerVariant.ios:
        return 'iOS';
      case AppCameraPickerVariant.android:
        return 'Android';
      case AppCameraPickerVariant.web:
        return 'Web';
    }
  }
}

extension AppCameraPickerStateExtension on AppCameraPickerState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCameraPickerState.defaultState:
        return 'Normal';
      case AppCameraPickerState.hover:
        return 'Hover';
      case AppCameraPickerState.pressed:
        return 'Presionado';
      case AppCameraPickerState.focus:
        return 'Enfocado';
      case AppCameraPickerState.selected:
        return 'Seleccionado';
      case AppCameraPickerState.disabled:
        return 'Deshabilitado';
      case AppCameraPickerState.loading:
        return 'Cargando';
      case AppCameraPickerState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si puede interactuar
  bool get canInteract {
    switch (this) {
      case AppCameraPickerState.disabled:
      case AppCameraPickerState.loading:
      case AppCameraPickerState.skeleton:
        return false;
      default:
        return true;
    }
  }
}

extension AppCameraPickerFileTypeExtension on AppCameraPickerFileType {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCameraPickerFileType.image:
        return 'Imágenes';
      case AppCameraPickerFileType.video:
        return 'Videos';
      case AppCameraPickerFileType.media:
        return 'Multimedia';
      case AppCameraPickerFileType.any:
        return 'Archivos';
    }
  }

  /// Extensiones MIME permitidas
  List<String> get allowedMimeTypes {
    switch (this) {
      case AppCameraPickerFileType.image:
        return ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
      case AppCameraPickerFileType.video:
        return ['video/mp4', 'video/mov', 'video/avi', 'video/mkv'];
      case AppCameraPickerFileType.media:
        return [
          'image/jpeg', 'image/png', 'image/gif', 'image/webp',
          'video/mp4', 'video/mov', 'video/avi', 'video/mkv'
        ];
      case AppCameraPickerFileType.any:
        return ['*/*'];
    }
  }
}

extension AppCameraPickerQualityExtension on AppCameraPickerQuality {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCameraPickerQuality.low:
        return 'Baja';
      case AppCameraPickerQuality.medium:
        return 'Media';
      case AppCameraPickerQuality.high:
        return 'Alta';
      case AppCameraPickerQuality.max:
        return 'Máxima';
    }
  }

  /// Porcentaje de compresión (0-100)
  int get compressionQuality {
    switch (this) {
      case AppCameraPickerQuality.low:
        return 30;
      case AppCameraPickerQuality.medium:
        return 70;
      case AppCameraPickerQuality.high:
        return 85;
      case AppCameraPickerQuality.max:
        return 95;
    }
  }
}