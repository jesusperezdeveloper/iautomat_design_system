import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_clipboard_share_config.freezed.dart';

/// Configuración principal para AppClipboardShare
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// de compartir/clipboard, con soporte para share sheets nativos
/// y acciones de copiado al portapapeles.
@freezed
class AppClipboardShareConfig with _$AppClipboardShareConfig {
  const factory AppClipboardShareConfig({
    /// Variante del componente
    @Default(AppClipboardShareVariant.shareSheet)
    AppClipboardShareVariant variant,

    /// Estado actual del componente
    @Default(AppClipboardShareState.defaultState) AppClipboardShareState state,

    /// Configuración de colores (solo design tokens)
    AppClipboardShareColors? colors,

    /// Configuración de espaciado (solo design tokens)
    AppClipboardShareSpacing? spacing,

    /// Configuración de tipografía (solo design tokens)
    AppClipboardShareTypography? typography,

    /// Configuración de animaciones
    AppClipboardShareAnimations? animations,

    /// Configuración de comportamiento
    AppClipboardShareBehavior? behavior,

    /// Configuración de accesibilidad
    AppClipboardShareAccessibility? accessibility,

    /// Si muestra preview del contenido antes de compartir
    @Default(true) bool showPreview,

    /// Si permite editar el contenido antes de compartir
    @Default(false) bool allowEdit,

    /// Si muestra confirmación después de copiar/compartir
    @Default(true) bool showConfirmation,

    /// Si agrupa las opciones de compartir por tipo
    @Default(true) bool groupShareOptions,

    /// Si muestra apps recientes para compartir
    @Default(true) bool showRecentApps,

    /// Tamaño máximo de archivo en bytes (por defecto 25MB)
    @Default(26214400) int maxFileSize,

    /// Tipos de archivo permitidos
    @Default(['*/*']) List<String> allowedFileTypes,

    /// Si permite múltiples archivos
    @Default(true) bool allowMultipleFiles,

    /// Si comprime imágenes automáticamente
    @Default(true) bool compressImages,

    /// Calidad de compresión de imagen (0-100)
    @Default(85) int imageQuality,
  }) = _AppClipboardShareConfig;

  const AppClipboardShareConfig._();

  /// Validación de configuración
  bool get isValid {
    if (maxFileSize <= 0) return false;
    if (imageQuality < 0 || imageQuality > 100) return false;
    if (allowedFileTypes.isEmpty) return false;
    return true;
  }

  /// Si el componente está habilitado
  bool get isEnabled => state != AppClipboardShareState.disabled;

  /// Si el componente está en estado de carga
  bool get isLoading => state == AppClipboardShareState.loading;
}

/// Variantes del componente AppClipboardShare
enum AppClipboardShareVariant {
  /// Share sheet nativo del sistema
  shareSheet,

  /// Menú de opciones personalizado
  customMenu,

  /// Botón con acciones directas
  quickActions,

  /// Modal con preview
  modalPreview,
}

/// Estados del componente AppClipboardShare
enum AppClipboardShareState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

/// Extensión para obtener nombres para display
extension AppClipboardShareStateExtension on AppClipboardShareState {
  String get displayName {
    switch (this) {
      case AppClipboardShareState.defaultState:
        return 'Default';
      case AppClipboardShareState.hover:
        return 'Hover';
      case AppClipboardShareState.pressed:
        return 'Pressed';
      case AppClipboardShareState.focus:
        return 'Focus';
      case AppClipboardShareState.selected:
        return 'Selected';
      case AppClipboardShareState.disabled:
        return 'Disabled';
      case AppClipboardShareState.loading:
        return 'Loading';
      case AppClipboardShareState.skeleton:
        return 'Skeleton';
    }
  }
}

/// Datos para compartir
@freezed
class AppShareData with _$AppShareData {
  const factory AppShareData({
    /// Texto principal para compartir
    String? text,

    /// Asunto/título del contenido
    String? subject,

    /// Lista de archivos para compartir
    @Default([]) List<AppShareFile> files,

    /// URL para compartir
    String? url,

    /// Metadata adicional
    Map<String, dynamic>? metadata,

    /// Tipo MIME del contenido
    @Default('text/plain') String mimeType,

    /// Si el contenido es sensible
    @Default(false) bool isSensitive,
  }) = _AppShareData;

  const AppShareData._();

  /// Si tiene contenido para compartir
  bool get hasContent =>
      (text != null && text!.isNotEmpty) ||
      (url != null && url!.isNotEmpty) ||
      files.isNotEmpty;

  /// Tamaño total de los archivos
  int get totalFileSize => files.fold(0, (sum, file) => sum + (file.size ?? 0));
}

/// Archivo para compartir
@freezed
class AppShareFile with _$AppShareFile {
  const factory AppShareFile({
    /// Nombre del archivo
    required String name,

    /// Ruta del archivo (local o URL)
    String? path,

    /// Bytes del archivo (si está en memoria)
    Uint8List? bytes,

    /// Tipo MIME del archivo
    @Default('application/octet-stream') String mimeType,

    /// Tamaño del archivo en bytes
    int? size,

    /// Thumbnail del archivo (para imágenes/videos)
    Uint8List? thumbnail,
  }) = _AppShareFile;

  const AppShareFile._();

  /// Si el archivo es una imagen
  bool get isImage => mimeType.startsWith('image/');

  /// Si el archivo es un video
  bool get isVideo => mimeType.startsWith('video/');

  /// Si el archivo es un documento
  bool get isDocument =>
      mimeType.contains('pdf') ||
      mimeType.contains('document') ||
      mimeType.contains('text');
}

/// Configuración de colores
@freezed
class AppClipboardShareColors with _$AppClipboardShareColors {
  const factory AppClipboardShareColors({
    /// Color de fondo
    Color? backgroundColor,

    /// Color del botón principal
    Color? primaryButtonColor,

    /// Color del botón secundario
    Color? secondaryButtonColor,

    /// Color del texto principal
    Color? primaryTextColor,

    /// Color del texto secundario
    Color? secondaryTextColor,

    /// Color del icono
    Color? iconColor,

    /// Color del borde
    Color? borderColor,

    /// Color de overlay
    Color? overlayColor,

    /// Color de éxito
    Color? successColor,

    /// Color de error
    Color? errorColor,

    /// Color en estado hover
    Color? hoverColor,

    /// Color en estado pressed
    Color? pressedColor,

    /// Color en estado focus
    Color? focusColor,

    /// Color en estado selected
    Color? selectedColor,

    /// Color en estado disabled
    Color? disabledColor,

    /// Color en estado loading
    Color? loadingColor,

    /// Color base del skeleton
    Color? skeletonBaseColor,

    /// Color highlight del skeleton
    Color? skeletonHighlightColor,
  }) = _AppClipboardShareColors;
}

/// Configuración de espaciado
@freezed
class AppClipboardShareSpacing with _$AppClipboardShareSpacing {
  const factory AppClipboardShareSpacing({
    /// Padding del contenedor principal
    @Default(EdgeInsets.all(16.0)) EdgeInsets containerPadding,

    /// Padding del botón
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0))
    EdgeInsets buttonPadding,

    /// Padding del modal
    @Default(EdgeInsets.all(24.0)) EdgeInsets modalPadding,

    /// Padding del preview
    @Default(EdgeInsets.all(12.0)) EdgeInsets previewPadding,

    /// Espaciado entre elementos
    @Default(16.0) double itemSpacing,

    /// Espaciado entre iconos
    @Default(8.0) double iconSpacing,

    /// Radio del borde
    @Default(12.0) double borderRadius,

    /// Radio del borde del botón
    @Default(8.0) double buttonBorderRadius,

    /// Altura del modal
    double? modalHeight,

    /// Ancho máximo del modal
    @Default(400.0) double modalMaxWidth,

    /// Tamaño del icono
    @Default(24.0) double iconSize,

    /// Tamaño del icono grande
    @Default(48.0) double largeIconSize,
  }) = _AppClipboardShareSpacing;
}

/// Configuración de tipografía
@freezed
class AppClipboardShareTypography with _$AppClipboardShareTypography {
  const factory AppClipboardShareTypography({
    /// Estilo del título
    TextStyle? titleStyle,

    /// Estilo del subtítulo
    TextStyle? subtitleStyle,

    /// Estilo del cuerpo
    TextStyle? bodyStyle,

    /// Estilo del botón
    TextStyle? buttonStyle,

    /// Estilo del label
    TextStyle? labelStyle,

    /// Estilo del caption
    TextStyle? captionStyle,

    /// Estilo del error
    TextStyle? errorStyle,

    /// Estilo del preview
    TextStyle? previewStyle,
  }) = _AppClipboardShareTypography;
}

/// Configuración de animaciones
@freezed
class AppClipboardShareAnimations with _$AppClipboardShareAnimations {
  const factory AppClipboardShareAnimations({
    /// Duración de la animación de estado
    @Default(Duration(milliseconds: 200)) Duration stateDuration,

    /// Duración de la animación del modal
    @Default(Duration(milliseconds: 300)) Duration modalDuration,

    /// Duración de la animación de confirmación
    @Default(Duration(milliseconds: 2000)) Duration confirmationDuration,

    /// Duración del skeleton
    @Default(Duration(milliseconds: 1200)) Duration skeletonDuration,

    /// Curva de animación de estado
    @Default(Curves.easeInOut) Curve stateCurve,

    /// Curva de animación del modal
    @Default(Curves.easeOutCubic) Curve modalCurve,

    /// Curva del skeleton
    @Default(Curves.easeInOut) Curve skeletonCurve,

    /// Si las animaciones están habilitadas
    @Default(true) bool enabled,

    /// Si respeta reduced motion
    @Default(true) bool respectReducedMotion,
  }) = _AppClipboardShareAnimations;
}

/// Configuración de comportamiento
@freezed
class AppClipboardShareBehavior with _$AppClipboardShareBehavior {
  const factory AppClipboardShareBehavior({
    /// Si muestra información de debug
    @Default(false) bool showDebugInfo,

    /// Si habilita efectos hover
    @Default(true) bool enableHoverEffects,

    /// Si muestra indicador de focus
    @Default(true) bool showFocusIndicator,

    /// Si habilita haptic feedback
    @Default(true) bool enableHapticFeedback,

    /// Si cachea los estilos
    @Default(true) bool cacheStyles,

    /// Si es adaptativo a la plataforma
    @Default(true) bool platformAdaptive,

    /// Si auto-cierra el modal después de compartir
    @Default(true) bool autoCloseAfterShare,

    /// Si muestra historial de compartidos
    @Default(false) bool showShareHistory,

    /// Si permite arrastrar y soltar archivos
    @Default(true) bool enableDragAndDrop,

    /// Si valida URLs automáticamente
    @Default(true) bool validateUrls,

    /// Si sanitiza el contenido HTML
    @Default(true) bool sanitizeHtml,
  }) = _AppClipboardShareBehavior;
}

/// Configuración de accesibilidad
@freezed
class AppClipboardShareAccessibility with _$AppClipboardShareAccessibility {
  const factory AppClipboardShareAccessibility({
    /// Si la accesibilidad está habilitada
    @Default(true) bool enabled,

    /// Rol semántico del componente
    @Default('button') String semanticRole,

    /// Si es focusable
    @Default(true) bool focusable,

    /// Si excluye de la semántica
    @Default(false) bool excludeSemantics,

    /// Label para compartir
    @Default('Compartir contenido') String shareLabel,

    /// Label para copiar
    @Default('Copiar al portapapeles') String copyLabel,

    /// Label para estado loading
    @Default('Procesando') String loadingLabel,

    /// Label para estado disabled
    @Default('No disponible') String disabledLabel,

    /// Label para éxito
    @Default('Compartido exitosamente') String successLabel,

    /// Label para error
    @Default('Error al compartir') String errorLabel,

    /// Hint para compartir
    @Default('Presiona para compartir') String shareHint,

    /// Hint para copiar
    @Default('Presiona para copiar') String copyHint,
  }) = _AppClipboardShareAccessibility;
}
