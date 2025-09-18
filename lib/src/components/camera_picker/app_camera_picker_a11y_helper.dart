import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'package:vector_math/vector_math_64.dart';

import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_config.dart';

/// Helper para gestionar accesibilidad, RTL y navegación por teclado
/// en el AppCameraPicker
///
/// Proporciona:
/// - Soporte completo para lectores de pantalla
/// - Navegación por teclado intuitiva
/// - Soporte RTL automático
/// - Anuncios de estado para accesibilidad
/// - Semántica contextual
class AppCameraPickerA11yHelper {
  /// Configuración de accesibilidad
  final AppCameraPickerA11yConfig? config;

  const AppCameraPickerA11yHelper(this.config);

  /// Construye wrapper de semántica para el picker
  Widget buildSemanticsWrapper({
    required BuildContext context,
    required AppCameraPickerState state,
    required Widget child,
  }) {
    if (!(config?.enabled ?? true)) {
      return child;
    }

    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final effectiveConfig = config ?? const AppCameraPickerA11yConfig();

    return Semantics(
      label: effectiveConfig.semanticsLabel ?? _getDefaultLabel(state),
      hint: effectiveConfig.semanticsHint ?? _getDefaultHint(state),
      value: effectiveConfig.semanticsDescription ?? _getDefaultDescription(state),
      enabled: state.canInteract,
      focusable: state.canInteract,
      button: true,
      onTap: state.canInteract ? () {} : null,
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: ExcludeSemantics(
        excluding: false,
        child: child,
      ),
    );
  }

  /// Maneja eventos de teclado para navegación
  KeyEventResult handleKeyEvent(
    KeyEvent event, {
    VoidCallback? onActivate,
  }) {
    if (!_isKeyboardNavigationEnabled()) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.space:
          onActivate?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.escape:
          // Cancelar operación si es posible
          return KeyEventResult.handled;

        default:
          return KeyEventResult.ignored;
      }
    }

    return KeyEventResult.ignored;
  }

  /// Anuncia cambios de estado para accesibilidad
  void announceStateChange(AppCameraPickerState state) {
    if (!_shouldAnnounceStateChanges()) return;

    final announcement = _getStateAnnouncement(state);
    if (announcement.isNotEmpty) {
      SemanticsService.announce(
        announcement,
        TextDirection.ltr,
      );
    }
  }

  /// Anuncia inicio de operación
  void announceOperationStart(AppCameraPickerSource source) {
    if (!_shouldAnnounceStateChanges()) return;

    final announcement = _getOperationStartAnnouncement(source);
    SemanticsService.announce(
      announcement,
      TextDirection.ltr,
    );
  }

  /// Anuncia resultado de operación
  void announceOperationResult({
    required bool success,
    int? fileCount,
    String? error,
  }) {
    if (!_shouldAnnounceStateChanges()) return;

    final announcement = _getOperationResultAnnouncement(
      success: success,
      fileCount: fileCount,
      error: error,
    );

    SemanticsService.announce(
      announcement,
      TextDirection.ltr,
    );
  }

  /// Anuncia error de permisos
  void announcePermissionError() {
    if (!_shouldAnnounceStateChanges()) return;

    SemanticsService.announce(
      'Permisos requeridos para acceder a la cámara o galería',
      TextDirection.ltr,
    );
  }

  /// Construye widget con soporte RTL
  Widget buildRtlAware({
    required BuildContext context,
    required Widget child,
  }) {
    return Directionality.of(context) == TextDirection.rtl
        ? _buildRtlLayout(child)
        : child;
  }

  /// Construye layout específico para RTL
  Widget _buildRtlLayout(Widget child) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scaleByVector3(Vector3(-1.0, 1.0, 1.0)),
      child: child,
    );
  }

  /// Obtiene label por defecto según el estado
  String _getDefaultLabel(AppCameraPickerState state) {
    switch (state) {
      case AppCameraPickerState.defaultState:
        return 'Seleccionar imagen';
      case AppCameraPickerState.hover:
        return 'Seleccionar imagen, resaltado';
      case AppCameraPickerState.pressed:
        return 'Seleccionar imagen, presionado';
      case AppCameraPickerState.focus:
        return 'Seleccionar imagen, enfocado';
      case AppCameraPickerState.selected:
        return 'Seleccionar imagen, seleccionado';
      case AppCameraPickerState.disabled:
        return 'Seleccionar imagen, deshabilitado';
      case AppCameraPickerState.loading:
        return 'Seleccionando imagen, cargando';
      case AppCameraPickerState.skeleton:
        return 'Cargando selector de imagen';
    }
  }

  /// Obtiene hint por defecto según el estado
  String _getDefaultHint(AppCameraPickerState state) {
    switch (state) {
      case AppCameraPickerState.defaultState:
      case AppCameraPickerState.hover:
      case AppCameraPickerState.focus:
        return 'Toca para abrir opciones de selección';
      case AppCameraPickerState.pressed:
        return 'Abriendo opciones';
      case AppCameraPickerState.selected:
        return 'Opción seleccionada';
      case AppCameraPickerState.disabled:
        return 'No disponible';
      case AppCameraPickerState.loading:
        return 'Procesando selección';
      case AppCameraPickerState.skeleton:
        return 'Preparando selector';
    }
  }

  /// Obtiene descripción por defecto según el estado
  String _getDefaultDescription(AppCameraPickerState state) {
    switch (state) {
      case AppCameraPickerState.defaultState:
        return 'Botón para seleccionar imágenes desde cámara o galería';
      case AppCameraPickerState.hover:
        return 'Botón resaltado para seleccionar imágenes';
      case AppCameraPickerState.pressed:
        return 'Botón presionado, abriendo opciones';
      case AppCameraPickerState.focus:
        return 'Botón enfocado para seleccionar imágenes';
      case AppCameraPickerState.selected:
        return 'Opción seleccionada para imágenes';
      case AppCameraPickerState.disabled:
        return 'Selector de imágenes no disponible';
      case AppCameraPickerState.loading:
        return 'Procesando selección de imágenes';
      case AppCameraPickerState.skeleton:
        return 'Cargando interfaz del selector';
    }
  }

  /// Obtiene anuncio de cambio de estado
  String _getStateAnnouncement(AppCameraPickerState state) {
    switch (state) {
      case AppCameraPickerState.loading:
        return 'Procesando selección';
      case AppCameraPickerState.disabled:
        return 'Selector deshabilitado';
      case AppCameraPickerState.focus:
        return 'Selector enfocado';
      default:
        return '';
    }
  }

  /// Obtiene anuncio de inicio de operación
  String _getOperationStartAnnouncement(AppCameraPickerSource source) {
    switch (source) {
      case AppCameraPickerSource.camera:
        return 'Abriendo cámara';
      case AppCameraPickerSource.gallery:
        return 'Abriendo galería';
      case AppCameraPickerSource.both:
        return 'Abriendo opciones de selección';
    }
  }

  /// Obtiene anuncio de resultado de operación
  String _getOperationResultAnnouncement({
    required bool success,
    int? fileCount,
    String? error,
  }) {
    if (!success) {
      return error ?? 'Error al seleccionar archivos';
    }

    if (fileCount == null || fileCount == 0) {
      return 'Selección cancelada';
    }

    if (fileCount == 1) {
      return 'Un archivo seleccionado';
    }

    return '$fileCount archivos seleccionados';
  }

  /// Verifica si la navegación por teclado está habilitada
  bool _isKeyboardNavigationEnabled() {
    return config?.enableKeyboardNavigation ?? true;
  }

  /// Verifica si se deben anunciar cambios de estado
  bool _shouldAnnounceStateChanges() {
    return config?.announceStateChanges ?? true;
  }

  /// Construye indicador de estado para lectores de pantalla
  Widget buildStateIndicator(AppCameraPickerState state) {
    if (!_shouldAnnounceStateChanges()) {
      return const SizedBox.shrink();
    }

    String stateText;
    switch (state) {
      case AppCameraPickerState.loading:
        stateText = 'Cargando';
        break;
      case AppCameraPickerState.disabled:
        stateText = 'Deshabilitado';
        break;
      case AppCameraPickerState.focus:
        stateText = 'Enfocado';
        break;
      default:
        return const SizedBox.shrink();
    }

    return Semantics(
      liveRegion: true,
      child: Text(
        stateText,
        style: const TextStyle(fontSize: 0),
      ),
    );
  }

  /// Construye instrucciones de teclado para accesibilidad
  Widget buildKeyboardInstructions() {
    if (!_isKeyboardNavigationEnabled()) {
      return const SizedBox.shrink();
    }

    return Semantics(
      hint: 'Presiona Enter o Espacio para activar',
      child: const SizedBox.shrink(),
    );
  }

  /// Construye descripción de archivos seleccionados
  Widget buildFileDescription(List<AppCameraPickerFile> files) {
    if (files.isEmpty) {
      return const SizedBox.shrink();
    }

    final description = _buildFileListDescription(files);

    return Semantics(
      label: description,
      readOnly: true,
      child: const SizedBox.shrink(),
    );
  }

  /// Construye descripción textual de lista de archivos
  String _buildFileListDescription(List<AppCameraPickerFile> files) {
    if (files.isEmpty) {
      return 'Ningún archivo seleccionado';
    }

    if (files.length == 1) {
      final file = files.first;
      return 'Archivo seleccionado: ${file.name}, ${file.formattedSize}';
    }

    final totalSize = files.fold<int>(0, (sum, file) => sum + file.size);
    final formattedTotalSize = _formatBytes(totalSize);

    return '${files.length} archivos seleccionados, tamaño total: $formattedTotalSize';
  }

  /// Formatea bytes a string legible
  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Construye ayuda contextual para el usuario
  Widget buildContextualHelp({
    required AppCameraPickerSource source,
    required AppCameraPickerFileType fileType,
    required bool allowMultiple,
  }) {
    final helpText = _buildHelpText(
      source: source,
      fileType: fileType,
      allowMultiple: allowMultiple,
    );

    return Semantics(
      hint: helpText,
      child: const SizedBox.shrink(),
    );
  }

  /// Construye texto de ayuda contextual
  String _buildHelpText({
    required AppCameraPickerSource source,
    required AppCameraPickerFileType fileType,
    required bool allowMultiple,
  }) {
    final parts = <String>[];

    // Fuente
    switch (source) {
      case AppCameraPickerSource.camera:
        parts.add('Solo cámara disponible');
        break;
      case AppCameraPickerSource.gallery:
        parts.add('Solo galería disponible');
        break;
      case AppCameraPickerSource.both:
        parts.add('Cámara y galería disponibles');
        break;
    }

    // Tipo de archivo
    parts.add('Acepta ${fileType.displayName.toLowerCase()}');

    // Múltiple
    if (allowMultiple) {
      parts.add('selección múltiple permitida');
    } else {
      parts.add('solo un archivo');
    }

    return parts.join(', ');
  }

  /// Maneja focus automático para accesibilidad
  void requestFocus(FocusNode focusNode) {
    if (_isKeyboardNavigationEnabled()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (focusNode.canRequestFocus) {
          focusNode.requestFocus();
        }
      });
    }
  }

  /// Construye indicador de progreso accesible
  Widget buildAccessibleProgressIndicator({
    double? progress,
    String? description,
  }) {
    return Semantics(
      label: description ?? 'Procesando',
      value: progress != null
          ? '${(progress * 100).round()}% completado'
          : 'En progreso',
      liveRegion: true,
      child: const SizedBox.shrink(),
    );
  }
}