import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_clipboard_share_config.freezed.dart';

/// Configuración principal para DSClipboardShare
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// de compartir/clipboard, con soporte para share sheets nativos
/// y acciones de copiado al portapapeles.
@freezed
class DSClipboardShareConfig with _$DSClipboardShareConfig {
  const factory DSClipboardShareConfig({
    /// Variante del componente
    @Default(DSClipboardShareVariant.shareSheet)
    DSClipboardShareVariant variant,

    /// Estado actual del componente
    @Default(DSClipboardShareState.defaultState) DSClipboardShareState state,

    /// Configuración de colores (solo design tokens)
    DSClipboardShareColors? colors,

    /// Configuración de espaciado (solo design tokens)
    DSClipboardShareSpacing? spacing,

    /// Configuración de tipografía (solo design tokens)
    DSClipboardShareTypography? typography,

    /// Configuración de animaciones
    DSClipboardShareAnimations? animations,

    /// Configuración de comportamiento
    DSClipboardShareBehavior? behavior,

    /// Configuración de accesibilidad
    DSClipboardShareAccessibility? accessibility,

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
  }) = _DSClipboardShareConfig;

  const DSClipboardShareConfig._();

  /// Validación de configuración
  bool get isValid {
    if (maxFileSize <= 0) return false;
    if (imageQuality < 0 || imageQuality > 100) return false;
    if (allowedFileTypes.isEmpty) return false;
    return true;
  }

  /// Si el componente está habilitado
  bool get isEnabled => state != DSClipboardShareState.disabled;

  /// Si el componente está en estado de carga
  bool get isLoading => state == DSClipboardShareState.loading;
}

/// Variantes del componente DSClipboardShare
enum DSClipboardShareVariant {
  /// Share sheet nativo del sistema
  shareSheet,

  /// Menú de opciones personalizado
  customMenu,

  /// Botón con acciones directas
  quickActions,

  /// Modal con preview
  modalPreview,
}

/// Estados del componente DSClipboardShare
enum DSClipboardShareState {
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
extension DSClipboardShareStateExtension on DSClipboardShareState {
  String get displayName {
    switch (this) {
      case DSClipboardShareState.defaultState:
        return 'Default';
      case DSClipboardShareState.hover:
        return 'Hover';
      case DSClipboardShareState.pressed:
        return 'Pressed';
      case DSClipboardShareState.focus:
        return 'Focus';
      case DSClipboardShareState.selected:
        return 'Selected';
      case DSClipboardShareState.disabled:
        return 'Disabled';
      case DSClipboardShareState.loading:
        return 'Loading';
      case DSClipboardShareState.skeleton:
        return 'Skeleton';
    }
  }
}

/// Datos para compartir
@freezed
class DSShareData with _$DSShareData {
  const factory DSShareData({
    /// Texto principal para compartir
    String? text,

    /// Asunto/título del contenido
    String? subject,

    /// Lista de archivos para compartir
    @Default([]) List<DSShareFile> files,

    /// URL para compartir
    String? url,

    /// Metadata adicional
    Map<String, dynamic>? metadata,

    /// Tipo MIME del contenido
    @Default('text/plain') String mimeType,

    /// Si el contenido es sensible
    @Default(false) bool isSensitive,
  }) = _AppShareData;

  const DSShareData._();

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
class DSShareFile with _$DSShareFile {
  const factory DSShareFile({
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

  const DSShareFile._();

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
class DSClipboardShareColors with _$DSClipboardShareColors {
  const factory DSClipboardShareColors({
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
class DSClipboardShareSpacing with _$DSClipboardShareSpacing {
  const factory DSClipboardShareSpacing({
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
class DSClipboardShareTypography with _$DSClipboardShareTypography {
  const factory DSClipboardShareTypography({
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
class DSClipboardShareAnimations with _$DSClipboardShareAnimations {
  const factory DSClipboardShareAnimations({
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
class DSClipboardShareBehavior with _$DSClipboardShareBehavior {
  const factory DSClipboardShareBehavior({
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
class DSClipboardShareAccessibility with _$DSClipboardShareAccessibility {
  const factory DSClipboardShareAccessibility({
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
