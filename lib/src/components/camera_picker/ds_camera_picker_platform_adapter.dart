import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:iautomat_design_system/src/components/camera_picker/ds_camera_picker_config.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';

/// Adaptador que maneja las diferencias específicas de cada plataforma
/// para la selección de imágenes y videos
///
/// Proporciona:
/// - Interfaces nativas para cada plataforma
/// - Manejo de permisos específicos
/// - Optimizaciones por plataforma
/// - Fallbacks para casos no soportados
class DSCameraPickerPlatformAdapter {
  /// Selecciona archivos usando el método apropiado para la plataforma
  Future<List<DSCameraPickerFile>> pickFiles(
    DSCameraPickerConfig config,
  ) async {
    final variant = _resolveVariant(config.variant);

    switch (variant) {
      case DSCameraPickerVariant.ios:
        return _pickFilesIOS(config);
      case DSCameraPickerVariant.android:
        return _pickFilesAndroid(config);
      case DSCameraPickerVariant.web:
        return _pickFilesWeb(config);
      case DSCameraPickerVariant.platform:
        // Este caso ya se resuelve en _resolveVariant
        return _pickFilesIOS(config);
    }
  }

  /// Resuelve la variante según la plataforma actual
  DSCameraPickerVariant _resolveVariant(DSCameraPickerVariant variant) {
    if (variant != DSCameraPickerVariant.platform) {
      return variant;
    }

    if (kIsWeb) {
      return DSCameraPickerVariant.web;
    } else if (Platform.isIOS) {
      return DSCameraPickerVariant.ios;
    } else {
      return DSCameraPickerVariant.android;
    }
  }

  /// Implementación para iOS usando Action Sheet nativo
  Future<List<DSCameraPickerFile>> _pickFilesIOS(
    DSCameraPickerConfig config,
  ) async {
    // En una implementación real, aquí usarías image_picker o similar
    // Por ahora simulamos la funcionalidad

    if (config.source == DSCameraPickerSource.both) {
      // Mostrar action sheet con opciones
      final source = await _showIOSActionSheet(config);
      if (source == null) return [];

      return _simulateFilePicking(config, source);
    } else {
      return _simulateFilePicking(config, config.source);
    }
  }

  /// Implementación para Android usando Bottom Sheet
  Future<List<DSCameraPickerFile>> _pickFilesAndroid(
    DSCameraPickerConfig config,
  ) async {
    if (config.source == DSCameraPickerSource.both) {
      // Mostrar bottom sheet con opciones
      final source = await _showAndroidBottomSheet(config);
      if (source == null) return [];

      return _simulateFilePicking(config, source);
    } else {
      return _simulateFilePicking(config, config.source);
    }
  }

  /// Implementación para Web usando file picker nativo
  Future<List<DSCameraPickerFile>> _pickFilesWeb(
    DSCameraPickerConfig config,
  ) async {
    // En Web solo podemos acceder a archivos, no a cámara directamente
    if (config.source == DSCameraPickerSource.camera) {
      throw Exception('La cámara no está disponible en la plataforma web');
    }

    return _simulateFilePicking(config, DSCameraPickerSource.gallery);
  }

  /// Muestra Action Sheet de iOS
  Future<DSCameraPickerSource?> _showIOSActionSheet(
    DSCameraPickerConfig config,
  ) async {
    // Esta sería la implementación real con CupertinoActionSheet
    // Por ahora simulamos la selección
    await Future.delayed(const Duration(milliseconds: 300));

    // Simular selección de cámara
    return DSCameraPickerSource.camera;
  }

  /// Muestra Bottom Sheet de Android
  Future<DSCameraPickerSource?> _showAndroidBottomSheet(
    DSCameraPickerConfig config,
  ) async {
    // Esta sería la implementación real con showModalBottomSheet
    // Por ahora simulamos la selección
    await Future.delayed(const Duration(milliseconds: 300));

    // Simular selección de galería
    return DSCameraPickerSource.gallery;
  }

  /// Simula la selección de archivos (en implementación real usaría plugins)
  Future<List<DSCameraPickerFile>> _simulateFilePicking(
    DSCameraPickerConfig config,
    DSCameraPickerSource source,
  ) async {
    // Simular tiempo de selección
    await Future.delayed(const Duration(seconds: 1));

    final behavior = config.behavior ?? const DSCameraPickerBehavior();
    final maxFiles = behavior.allowMultiple ? behavior.maxFiles : 1;

    // Simular archivos seleccionados
    final files = <DSCameraPickerFile>[];

    for (int i = 0; i < (behavior.allowMultiple ? 2 : 1) && i < maxFiles; i++) {
      files.add(DSCameraPickerFile(
        name: 'imagen_${i + 1}.jpg',
        path: '/path/to/imagen_${i + 1}.jpg',
        size: 1024 * 1024, // 1MB
        mimeType: 'image/jpeg',
        width: 1920,
        height: 1080,
        metadata: {
          'source': source.name,
          'timestamp': DateTime.now().toIso8601String(),
        },
      ));
    }

    return files;
  }

  /// Verifica permisos específicos de la plataforma
  Future<bool> checkPermissions(DSCameraPickerSource source) async {
    // En implementación real verificaría permisos usando permission_handler
    // Por ahora simulamos que siempre hay permisos
    await Future.delayed(const Duration(milliseconds: 100));
    return true;
  }

  /// Solicita permisos específicos de la plataforma
  Future<bool> requestPermissions(DSCameraPickerSource source) async {
    // En implementación real solicitaría permisos
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  /// Construye selector específico de iOS
  Widget buildIOSSelector({
    required BuildContext context,
    required DSCameraPickerConfig config,
    required VoidCallback onCamera,
    required VoidCallback onGallery,
    VoidCallback? onCancel,
  }) {
    final a11yConfig = config.a11yConfig ?? const DSCameraPickerA11yConfig();

    return CupertinoActionSheet(
      title: Text(
        'Seleccionar Imagen',
        style: DSTypography.h6,
      ),
      message: Text(
        'Elige una opción para agregar una imagen',
        style: DSTypography.bodyMedium,
      ),
      actions: [
        if (config.source == DSCameraPickerSource.both ||
            config.source == DSCameraPickerSource.camera)
          CupertinoActionSheetAction(
            onPressed: onCamera,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt),
                const SizedBox(width: DSSpacing.sm),
                Text(a11yConfig.cameraButtonLabel),
              ],
            ),
          ),
        if (config.source == DSCameraPickerSource.both ||
            config.source == DSCameraPickerSource.gallery)
          CupertinoActionSheetAction(
            onPressed: onGallery,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.photo_library),
                const SizedBox(width: DSSpacing.sm),
                Text(a11yConfig.galleryButtonLabel),
              ],
            ),
          ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: onCancel ?? () => Navigator.of(context).pop(),
        child: const Text('Cancelar'),
      ),
    );
  }

  /// Construye selector específico de Android
  Widget buildAndroidSelector({
    required BuildContext context,
    required DSCameraPickerConfig config,
    required VoidCallback onCamera,
    required VoidCallback onGallery,
    VoidCallback? onCancel,
  }) {
    final a11yConfig = config.a11yConfig ?? const DSCameraPickerA11yConfig();

    return Container(
      padding: const EdgeInsets.all(DSSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(DSSpacing.md),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: DSColors.gray400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: DSSpacing.md),

          // Título
          Text(
            'Seleccionar Imagen',
            style: DSTypography.h6,
          ),
          const SizedBox(height: DSSpacing.sm),

          Text(
            'Elige una opción para agregar una imagen',
            style: DSTypography.bodyMedium.copyWith(
              color: DSColors.gray600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: DSSpacing.lg),

          // Opciones
          if (config.source == DSCameraPickerSource.both ||
              config.source == DSCameraPickerSource.camera)
            _buildAndroidOption(
              context: context,
              icon: Icons.camera_alt,
              label: a11yConfig.cameraButtonLabel,
              onTap: onCamera,
            ),

          if (config.source == DSCameraPickerSource.both ||
              config.source == DSCameraPickerSource.gallery)
            _buildAndroidOption(
              context: context,
              icon: Icons.photo_library,
              label: a11yConfig.galleryButtonLabel,
              onTap: onGallery,
            ),

          const SizedBox(height: DSSpacing.md),

          // Botón cancelar
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onCancel ?? () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
          ),

          // Safe area bottom
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildAndroidOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: DSSpacing.sm),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DSSpacing.sm),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DSSpacing.md,
              vertical: DSSpacing.sm,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: DSSpacing.md),
                Expanded(
                  child: Text(
                    label,
                    style: DSTypography.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Construye picker específico de Web
  Widget buildWebPicker({
    required BuildContext context,
    required DSCameraPickerConfig config,
    required VoidCallback onPickFiles,
  }) {
    final a11yConfig = config.a11yConfig ?? const DSCameraPickerA11yConfig();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(DSSpacing.lg),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_upload,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: DSSpacing.md),

            Text(
              'Seleccionar Archivos',
              style: DSTypography.h5,
            ),
            const SizedBox(height: DSSpacing.sm),

            Text(
              'Selecciona archivos desde tu dispositivo',
              style: DSTypography.bodyMedium.copyWith(
                color: DSColors.gray600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DSSpacing.lg),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onPickFiles,
                icon: const Icon(Icons.folder_open),
                label: Text(a11yConfig.filesButtonLabel),
              ),
            ),
            const SizedBox(height: DSSpacing.sm),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Muestra mensaje de error específico de plataforma
  Widget buildErrorMessage({
    required BuildContext context,
    required String error,
    VoidCallback? onRetry,
  }) {
    return Container(
      padding: const EdgeInsets.all(DSSpacing.md),
      margin: const EdgeInsets.all(DSSpacing.md),
      decoration: BoxDecoration(
        color: DSColors.error.withValues(alpha: 0.1),
        border: Border.all(color: DSColors.error),
        borderRadius: BorderRadius.circular(DSSpacing.sm),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                color: DSColors.error,
              ),
              const SizedBox(width: DSSpacing.sm),
              Expanded(
                child: Text(
                  'Error',
                  style: DSTypography.labelLarge.copyWith(
                    color: DSColors.error,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DSSpacing.sm),

          Text(
            error,
            style: DSTypography.bodyMedium,
          ),

          if (onRetry != null) ...[
            const SizedBox(height: DSSpacing.sm),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onRetry,
                child: const Text('Reintentar'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Obtiene información del archivo específica de plataforma
  Future<DSCameraPickerFile> getFileInfo(String path) async {
    // En implementación real obtendría info real del archivo
    await Future.delayed(const Duration(milliseconds: 100));

    return DSCameraPickerFile(
      name: path.split('/').last,
      path: path,
      size: 1024 * 1024, // 1MB simulado
      mimeType: 'image/jpeg',
      width: 1920,
      height: 1080,
    );
  }

  /// Comprime imagen según configuración de plataforma
  Future<DSCameraPickerFile> compressImage(
    DSCameraPickerFile file,
    DSCameraPickerQuality quality,
  ) async {
    // En implementación real comprimiría la imagen
    await Future.delayed(const Duration(milliseconds: 500));

    final compressionRatio = quality.compressionQuality / 100.0;
    final newSize = (file.size * compressionRatio).round();

    return file.copyWith(
      size: newSize,
      metadata: {
        ...?file.metadata,
        'compressed': true,
        'quality': quality.name,
        'original_size': file.size,
      },
    );
  }
}