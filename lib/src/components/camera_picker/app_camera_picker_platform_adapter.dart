import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_config.dart';
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
class AppCameraPickerPlatformAdapter {
  /// Selecciona archivos usando el método apropiado para la plataforma
  Future<List<AppCameraPickerFile>> pickFiles(
    AppCameraPickerConfig config,
  ) async {
    final variant = _resolveVariant(config.variant);

    switch (variant) {
      case AppCameraPickerVariant.ios:
        return _pickFilesIOS(config);
      case AppCameraPickerVariant.android:
        return _pickFilesAndroid(config);
      case AppCameraPickerVariant.web:
        return _pickFilesWeb(config);
      case AppCameraPickerVariant.platform:
        // Este caso ya se resuelve en _resolveVariant
        return _pickFilesIOS(config);
    }
  }

  /// Resuelve la variante según la plataforma actual
  AppCameraPickerVariant _resolveVariant(AppCameraPickerVariant variant) {
    if (variant != AppCameraPickerVariant.platform) {
      return variant;
    }

    if (kIsWeb) {
      return AppCameraPickerVariant.web;
    } else if (Platform.isIOS) {
      return AppCameraPickerVariant.ios;
    } else {
      return AppCameraPickerVariant.android;
    }
  }

  /// Implementación para iOS usando Action Sheet nativo
  Future<List<AppCameraPickerFile>> _pickFilesIOS(
    AppCameraPickerConfig config,
  ) async {
    // En una implementación real, aquí usarías image_picker o similar
    // Por ahora simulamos la funcionalidad

    if (config.source == AppCameraPickerSource.both) {
      // Mostrar action sheet con opciones
      final source = await _showIOSActionSheet(config);
      if (source == null) return [];

      return _simulateFilePicking(config, source);
    } else {
      return _simulateFilePicking(config, config.source);
    }
  }

  /// Implementación para Android usando Bottom Sheet
  Future<List<AppCameraPickerFile>> _pickFilesAndroid(
    AppCameraPickerConfig config,
  ) async {
    if (config.source == AppCameraPickerSource.both) {
      // Mostrar bottom sheet con opciones
      final source = await _showAndroidBottomSheet(config);
      if (source == null) return [];

      return _simulateFilePicking(config, source);
    } else {
      return _simulateFilePicking(config, config.source);
    }
  }

  /// Implementación para Web usando file picker nativo
  Future<List<AppCameraPickerFile>> _pickFilesWeb(
    AppCameraPickerConfig config,
  ) async {
    // En Web solo podemos acceder a archivos, no a cámara directamente
    if (config.source == AppCameraPickerSource.camera) {
      throw Exception('La cámara no está disponible en la plataforma web');
    }

    return _simulateFilePicking(config, AppCameraPickerSource.gallery);
  }

  /// Muestra Action Sheet de iOS
  Future<AppCameraPickerSource?> _showIOSActionSheet(
    AppCameraPickerConfig config,
  ) async {
    // Esta sería la implementación real con CupertinoActionSheet
    // Por ahora simulamos la selección
    await Future.delayed(const Duration(milliseconds: 300));

    // Simular selección de cámara
    return AppCameraPickerSource.camera;
  }

  /// Muestra Bottom Sheet de Android
  Future<AppCameraPickerSource?> _showAndroidBottomSheet(
    AppCameraPickerConfig config,
  ) async {
    // Esta sería la implementación real con showModalBottomSheet
    // Por ahora simulamos la selección
    await Future.delayed(const Duration(milliseconds: 300));

    // Simular selección de galería
    return AppCameraPickerSource.gallery;
  }

  /// Simula la selección de archivos (en implementación real usaría plugins)
  Future<List<AppCameraPickerFile>> _simulateFilePicking(
    AppCameraPickerConfig config,
    AppCameraPickerSource source,
  ) async {
    // Simular tiempo de selección
    await Future.delayed(const Duration(seconds: 1));

    final behavior = config.behavior ?? const AppCameraPickerBehavior();
    final maxFiles = behavior.allowMultiple ? behavior.maxFiles : 1;

    // Simular archivos seleccionados
    final files = <AppCameraPickerFile>[];

    for (int i = 0; i < (behavior.allowMultiple ? 2 : 1) && i < maxFiles; i++) {
      files.add(AppCameraPickerFile(
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
  Future<bool> checkPermissions(AppCameraPickerSource source) async {
    // En implementación real verificaría permisos usando permission_handler
    // Por ahora simulamos que siempre hay permisos
    await Future.delayed(const Duration(milliseconds: 100));
    return true;
  }

  /// Solicita permisos específicos de la plataforma
  Future<bool> requestPermissions(AppCameraPickerSource source) async {
    // En implementación real solicitaría permisos
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  /// Construye selector específico de iOS
  Widget buildIOSSelector({
    required BuildContext context,
    required AppCameraPickerConfig config,
    required VoidCallback onCamera,
    required VoidCallback onGallery,
    VoidCallback? onCancel,
  }) {
    final a11yConfig = config.a11yConfig ?? const AppCameraPickerA11yConfig();

    return CupertinoActionSheet(
      title: Text(
        'Seleccionar Imagen',
        style: AppTypography.h6,
      ),
      message: Text(
        'Elige una opción para agregar una imagen',
        style: AppTypography.bodyMedium,
      ),
      actions: [
        if (config.source == AppCameraPickerSource.both ||
            config.source == AppCameraPickerSource.camera)
          CupertinoActionSheetAction(
            onPressed: onCamera,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt),
                const SizedBox(width: AppSpacing.sm),
                Text(a11yConfig.cameraButtonLabel),
              ],
            ),
          ),
        if (config.source == AppCameraPickerSource.both ||
            config.source == AppCameraPickerSource.gallery)
          CupertinoActionSheetAction(
            onPressed: onGallery,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.photo_library),
                const SizedBox(width: AppSpacing.sm),
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
    required AppCameraPickerConfig config,
    required VoidCallback onCamera,
    required VoidCallback onGallery,
    VoidCallback? onCancel,
  }) {
    final a11yConfig = config.a11yConfig ?? const AppCameraPickerA11yConfig();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.md),
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
              color: AppColors.gray400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Título
          Text(
            'Seleccionar Imagen',
            style: AppTypography.h6,
          ),
          const SizedBox(height: AppSpacing.sm),

          Text(
            'Elige una opción para agregar una imagen',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.gray600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Opciones
          if (config.source == AppCameraPickerSource.both ||
              config.source == AppCameraPickerSource.camera)
            _buildAndroidOption(
              context: context,
              icon: Icons.camera_alt,
              label: a11yConfig.cameraButtonLabel,
              onTap: onCamera,
            ),

          if (config.source == AppCameraPickerSource.both ||
              config.source == AppCameraPickerSource.gallery)
            _buildAndroidOption(
              context: context,
              icon: Icons.photo_library,
              label: a11yConfig.galleryButtonLabel,
              onTap: onGallery,
            ),

          const SizedBox(height: AppSpacing.md),

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
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.sm),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    label,
                    style: AppTypography.bodyLarge,
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
    required AppCameraPickerConfig config,
    required VoidCallback onPickFiles,
  }) {
    final a11yConfig = config.a11yConfig ?? const AppCameraPickerA11yConfig();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_upload,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: AppSpacing.md),

            Text(
              'Seleccionar Archivos',
              style: AppTypography.h5,
            ),
            const SizedBox(height: AppSpacing.sm),

            Text(
              'Selecciona archivos desde tu dispositivo',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.gray600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onPickFiles,
                icon: const Icon(Icons.folder_open),
                label: Text(a11yConfig.filesButtonLabel),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

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
      padding: const EdgeInsets.all(AppSpacing.md),
      margin: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        border: Border.all(color: AppColors.error),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                color: AppColors.error,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Error',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          Text(
            error,
            style: AppTypography.bodyMedium,
          ),

          if (onRetry != null) ...[
            const SizedBox(height: AppSpacing.sm),
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
  Future<AppCameraPickerFile> getFileInfo(String path) async {
    // En implementación real obtendría info real del archivo
    await Future.delayed(const Duration(milliseconds: 100));

    return AppCameraPickerFile(
      name: path.split('/').last,
      path: path,
      size: 1024 * 1024, // 1MB simulado
      mimeType: 'image/jpeg',
      width: 1920,
      height: 1080,
    );
  }

  /// Comprime imagen según configuración de plataforma
  Future<AppCameraPickerFile> compressImage(
    AppCameraPickerFile file,
    AppCameraPickerQuality quality,
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