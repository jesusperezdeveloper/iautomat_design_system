import 'package:flutter/material.dart';

import 'package:iautomat_design_system/src/components/media_viewer/app_media_viewer_config.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';

/// Helper para gestionar diferentes tipos de media en el DSMediaViewer
///
/// Proporciona utilidades específicas para cada tipo de contenido:
/// - Validación y parsing de URLs
/// - Determinación automática de tipos de media
/// - Helpers de rendering específicos por tipo
/// - Optimizaciones por plataforma
/// - Gestión de metadata
class DSMediaViewerHelpers {
  /// Determina automáticamente el tipo de media basado en la URL
  static DSMediaType determineMediaType(String src) {
    final extension = _getFileExtension(src).toLowerCase();

    if (_imageExtensions.contains(extension)) {
      return DSMediaType.image;
    } else if (_videoExtensions.contains(extension)) {
      return DSMediaType.video;
    } else if (_audioExtensions.contains(extension)) {
      return DSMediaType.audio;
    }

    // Fallback: intentar determinar por URL patterns
    if (src.contains('youtube.com') || src.contains('youtu.be') ||
        src.contains('vimeo.com') || src.contains('dailymotion.com')) {
      return DSMediaType.video;
    }

    if (src.contains('soundcloud.com') || src.contains('spotify.com')) {
      return DSMediaType.audio;
    }

    // Default to image if uncertain
    return DSMediaType.image;
  }

  /// Obtiene la extensión del archivo de una URL
  static String _getFileExtension(String src) {
    final uri = Uri.tryParse(src);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      final filename = uri.pathSegments.last;
      final lastDot = filename.lastIndexOf('.');
      if (lastDot != -1 && lastDot < filename.length - 1) {
        return filename.substring(lastDot + 1);
      }
    }
    return '';
  }

  /// Extensiones de imagen soportadas
  static const Set<String> _imageExtensions = {
    'jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'svg', 'ico', 'tiff', 'tif'
  };

  /// Extensiones de video soportadas
  static const Set<String> _videoExtensions = {
    'mp4', 'mov', 'avi', 'mkv', 'webm', 'flv', 'wmv', 'm4v', '3gp', 'ogv'
  };

  /// Extensiones de audio soportadas
  static const Set<String> _audioExtensions = {
    'mp3', 'wav', 'ogg', 'aac', 'flac', 'm4a', 'wma', 'opus', 'oga'
  };

  /// Valida si una URL es accesible y válida
  static bool isValidMediaUrl(String src) {
    if (src.isEmpty) return false;

    // Validar URLs remotas
    if (src.startsWith('http://') || src.startsWith('https://')) {
      try {
        final uri = Uri.parse(src);
        return uri.hasAbsolutePath;
      } catch (e) {
        return false;
      }
    }

    // Validar assets locales
    if (src.startsWith('assets/')) {
      return src.length > 7; // Más que solo "assets/"
    }

    // Validar archivos locales
    return src.isNotEmpty;
  }

  /// Genera un thumbnail URL para videos de YouTube
  static String? getYouTubeThumbnail(String videoUrl) {
    final regex = RegExp(
      r'(?:youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/embed\/)([^&\n?#]+)'
    );
    final match = regex.firstMatch(videoUrl);

    if (match != null && match.group(1) != null) {
      final videoId = match.group(1)!;
      return 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';
    }

    return null;
  }

  /// Genera un thumbnail URL para videos de Vimeo
  static String? getVimeoThumbnail(String videoUrl) {
    final regex = RegExp(r'vimeo\.com\/(\d+)');
    final match = regex.firstMatch(videoUrl);

    if (match != null && match.group(1) != null) {
      final videoId = match.group(1)!;
      // En una implementación real, harías una llamada a la API de Vimeo
      return 'https://vumbnail.com/$videoId.jpg';
    }

    return null;
  }

  /// Optimiza la configuración del viewer según el tipo de media
  static DSMediaViewerConfig optimizeConfigForMediaType(
    DSMediaViewerConfig config,
    DSMediaType primaryType,
  ) {
    switch (primaryType) {
      case DSMediaType.image:
        return config.copyWith(
          variant: DSMediaViewerVariant.image,
          behavior: config.behavior?.copyWith(
            enableDoubleTapZoom: true,
            enablePinchZoom: true,
            autoHideControls: true,
            autoHideControlsDelay: 2,
          ),
          controls: config.controls?.copyWith(
            showPlayPause: false,
            showVolumeControls: false,
            showSeekBar: false,
            showTimeDisplay: false,
          ),
        );

      case DSMediaType.video:
        return config.copyWith(
          variant: DSMediaViewerVariant.video,
          behavior: config.behavior?.copyWith(
            enableDoubleTapZoom: false,
            enablePinchZoom: false,
            autoHideControls: true,
            autoHideControlsDelay: 3,
          ),
          controls: config.controls?.copyWith(
            showPlayPause: true,
            showVolumeControls: true,
            showSeekBar: true,
            showTimeDisplay: true,
          ),
        );

      case DSMediaType.audio:
        return config.copyWith(
          variant: DSMediaViewerVariant.audio,
          behavior: config.behavior?.copyWith(
            enableDoubleTapZoom: false,
            enablePinchZoom: false,
            autoHideControls: false,
          ),
          controls: config.controls?.copyWith(
            showPlayPause: true,
            showVolumeControls: true,
            showSeekBar: true,
            showTimeDisplay: true,
            showFullscreenButton: false,
          ),
        );
    }
  }

  /// Crea elementos de media automáticamente desde URLs
  static List<DSMediaItem> createItemsFromUrls(
    List<String> urls, {
    List<String>? captions,
    List<String>? thumbnails,
  }) {
    return urls.asMap().entries.map((entry) {
      final index = entry.key;
      final url = entry.value;

      return DSMediaItem(
        type: determineMediaType(url),
        src: url,
        caption: captions != null && index < captions.length
            ? captions[index]
            : null,
        thumbnail: thumbnails != null && index < thumbnails.length
            ? thumbnails[index]
            : _generateThumbnail(url),
        alt: 'Media item ${index + 1}',
      );
    }).toList();
  }

  /// Genera automáticamente un thumbnail si es posible
  static String? _generateThumbnail(String url) {
    if (url.contains('youtube.com') || url.contains('youtu.be')) {
      return getYouTubeThumbnail(url);
    }

    if (url.contains('vimeo.com')) {
      return getVimeoThumbnail(url);
    }

    return null;
  }

  /// Calcula el aspecto ratio óptimo para diferentes tipos de media
  static double getOptimalAspectRatio(DSMediaType type) {
    switch (type) {
      case DSMediaType.image:
        return 4 / 3; // Ratio estándar para fotos
      case DSMediaType.video:
        return 16 / 9; // Ratio estándar para video
      case DSMediaType.audio:
        return 1; // Cuadrado para reproductores de audio
    }
  }

  /// Obtiene el ícono apropiado para cada tipo de media
  static IconData getMediaTypeIcon(DSMediaType type) {
    switch (type) {
      case DSMediaType.image:
        return Icons.image;
      case DSMediaType.video:
        return Icons.play_circle_filled;
      case DSMediaType.audio:
        return Icons.audiotrack;
    }
  }

  /// Obtiene el color apropiado para cada tipo de media
  static Color getMediaTypeColor(DSMediaType type) {
    switch (type) {
      case DSMediaType.image:
        return DSColors.info;
      case DSMediaType.video:
        return DSColors.primary;
      case DSMediaType.audio:
        return DSColors.secondary;
    }
  }

  /// Formatea el tamaño de archivo legible
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Formatea la duración en formato legible
  static String formatDuration(double seconds) {
    if (seconds < 60) {
      return '${seconds.toInt()}s';
    } else if (seconds < 3600) {
      final minutes = (seconds / 60).floor();
      final remainingSeconds = (seconds % 60).floor();
      return '${minutes}m ${remainingSeconds}s';
    } else {
      final hours = (seconds / 3600).floor();
      final minutes = ((seconds % 3600) / 60).floor();
      return '${hours}h ${minutes}m';
    }
  }

  /// Valida que una lista de elementos sea coherente
  static bool validateMediaItems(List<DSMediaItem> items) {
    if (items.isEmpty) return false;

    return items.every((item) =>
      item.isValid && isValidMediaUrl(item.src)
    );
  }

  /// Agrupa elementos por tipo de media
  static Map<DSMediaType, List<DSMediaItem>> groupItemsByType(
    List<DSMediaItem> items,
  ) {
    final groups = <DSMediaType, List<DSMediaItem>>{};

    for (final item in items) {
      groups.putIfAbsent(item.type, () => []).add(item);
    }

    return groups;
  }

  /// Calcula estadísticas de una colección de media
  static DSMediaCollectionStats calculateStats(List<DSMediaItem> items) {
    var totalDuration = 0.0;
    var imageCount = 0;
    var videoCount = 0;
    var audioCount = 0;

    for (final item in items) {
      if (item.duration != null) {
        totalDuration += item.duration!;
      }

      switch (item.type) {
        case DSMediaType.image:
          imageCount++;
          break;
        case DSMediaType.video:
          videoCount++;
          break;
        case DSMediaType.audio:
          audioCount++;
          break;
      }
    }

    return DSMediaCollectionStats(
      totalItems: items.length,
      imageCount: imageCount,
      videoCount: videoCount,
      audioCount: audioCount,
      totalDuration: totalDuration,
    );
  }
}

/// Widget helper para renderizar previews de diferentes tipos de media
class DSMediaPreview extends StatelessWidget {
  final DSMediaItem item;
  final double size;
  final VoidCallback? onTap;

  const DSMediaPreview({
    super.key,
    required this.item,
    this.size = 60,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: DSColors.divider,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: _buildPreviewContent(),
        ),
      ),
    );
  }

  Widget _buildPreviewContent() {
    switch (item.type) {
      case DSMediaType.image:
        return _buildImagePreview();
      case DSMediaType.video:
        return _buildVideoPreview();
      case DSMediaType.audio:
        return _buildAudioPreview();
    }
  }

  Widget _buildImagePreview() {
    if (item.src.startsWith('http')) {
      return Image.network(
        item.src,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildErrorPreview(),
      );
    } else {
      return Image.asset(
        item.src,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildErrorPreview(),
      );
    }
  }

  Widget _buildVideoPreview() {
    return Stack(
      children: [
        if (item.thumbnail != null)
          Image.network(
            item.thumbnail!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) => _buildErrorPreview(),
          )
        else
          _buildIconPreview(Icons.videocam, DSColors.primary),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: size * 0.2,
            ),
          ),
        ),
        if (item.duration != null)
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                item.formattedDuration,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.15,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAudioPreview() {
    return _buildIconPreview(Icons.music_note, DSColors.secondary);
  }

  Widget _buildIconPreview(IconData icon, Color color) {
    return Container(
      color: color.withValues(alpha: 0.1),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: size * 0.5,
        ),
      ),
    );
  }

  Widget _buildErrorPreview() {
    return Container(
      color: DSColors.gray100,
      child: Center(
        child: Icon(
          Icons.broken_image,
          color: DSColors.gray400,
          size: size * 0.5,
        ),
      ),
    );
  }
}

/// Estadísticas de una colección de media
class DSMediaCollectionStats {
  final int totalItems;
  final int imageCount;
  final int videoCount;
  final int audioCount;
  final double totalDuration;

  const DSMediaCollectionStats({
    required this.totalItems,
    required this.imageCount,
    required this.videoCount,
    required this.audioCount,
    required this.totalDuration,
  });

  /// Tipo predominante en la colección
  DSMediaType get predominantType {
    if (imageCount >= videoCount && imageCount >= audioCount) {
      return DSMediaType.image;
    } else if (videoCount >= audioCount) {
      return DSMediaType.video;
    } else {
      return DSMediaType.audio;
    }
  }

  /// Si la colección es homogénea (un solo tipo)
  bool get isHomogeneous {
    final nonZeroTypes = [
      if (imageCount > 0) 1,
      if (videoCount > 0) 1,
      if (audioCount > 0) 1,
    ].length;
    return nonZeroTypes <= 1;
  }

  /// Duración total formateada
  String get formattedTotalDuration {
    return DSMediaViewerHelpers.formatDuration(totalDuration);
  }

  /// Descripción de la colección
  String get description {
    final parts = <String>[];

    if (imageCount > 0) {
      parts.add('$imageCount imagen${imageCount != 1 ? 'es' : ''}');
    }
    if (videoCount > 0) {
      parts.add('$videoCount video${videoCount != 1 ? 's' : ''}');
    }
    if (audioCount > 0) {
      parts.add('$audioCount audio${audioCount != 1 ? 's' : ''}');
    }

    if (parts.isEmpty) return 'Sin elementos';
    if (parts.length == 1) return parts.first;
    if (parts.length == 2) return '${parts[0]} y ${parts[1]}';

    return '${parts.sublist(0, parts.length - 1).join(', ')} y ${parts.last}';
  }
}