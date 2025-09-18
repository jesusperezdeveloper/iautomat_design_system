import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_picker_config.freezed.dart';

/// Enums and types for AppFilePicker

/// File picker variants
enum AppFilePickerVariant {
  /// Drag and drop file picker
  dragAndDrop,

  /// Multi file selector
  multi,
}

/// File picker states
enum AppFilePickerState {
  /// Default state
  defaultState,

  /// Hover state (Web/Desktop)
  hover,

  /// Pressed state
  pressed,

  /// Focus state
  focus,

  /// Selected state (when files are selected)
  selected,

  /// Disabled state
  disabled,

  /// Loading state (during upload/processing)
  loading,

  /// Skeleton loading state
  skeleton,
}

/// File preview mode
enum AppFilePreviewMode {
  /// No preview
  none,

  /// Show thumbnails
  thumbnail,

  /// Show file list
  list,

  /// Show both thumbnails and list
  both,
}

/// File size unit
enum AppFileSizeUnit {
  /// Bytes
  bytes,

  /// Kilobytes
  kb,

  /// Megabytes
  mb,

  /// Gigabytes
  gb,
}

/// Configuration model for AppFilePicker
@freezed
class AppFilePickerConfig with _$AppFilePickerConfig {
  const factory AppFilePickerConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,

    // Layout configuration
    @Default(EdgeInsets.all(16.0)) EdgeInsets contentPadding,
    @Default(EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0))
    EdgeInsets buttonPadding,
    @Default(Size(200, 120)) Size minSize,
    @Default(Size(double.infinity, 200)) Size maxSize,
    @Default(BorderRadius.all(Radius.circular(8.0))) BorderRadius borderRadius,
    @Default(2.0) double borderWidth,
    @Default(4.0) double focusBorderWidth,

    // Color configuration
    AppFilePickerColors? colors,

    // Typography configuration
    AppFilePickerTypography? typography,

    // Icons configuration
    AppFilePickerIcons? icons,

    // Preview configuration
    @Default(AppFilePreviewMode.thumbnail) AppFilePreviewMode previewMode,
    @Default(Size(80, 80)) Size thumbnailSize,
    @Default(3) int maxPreviewItems,
    @Default(true) bool showFileSize,
    @Default(true) bool showFileName,
    @Default(true) bool showFileType,

    // Drag and drop configuration
    @Default(true) bool enableDragAndDrop,
    @Default(2.0) double dragBorderWidth,
    @Default(BorderRadius.all(Radius.circular(12.0)))
    BorderRadius dragBorderRadius,

    // Multi-selection configuration
    @Default(true) bool allowMultiple,
    @Default(10) int maxFiles,

    // File validation configuration
    @Default(AppFileSize(10, AppFileSizeUnit.mb)) AppFileSize maxFileSize,
    @Default([]) List<String> acceptedExtensions,
    @Default([]) List<String> acceptedMimeTypes,

    // Accessibility configuration
    @Default('Select files') String accessibilityLabel,
    @Default('Drag and drop files here') String dragAccessibilityLabel,
    @Default('File picker button') String buttonAccessibilityLabel,

    // Platform-specific configuration
    @Default(true) bool adaptToPlatform,
    @Default(true) bool useNativeFilePicker,

    // Interaction configuration
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,

    // Error handling
    @Default(true) bool showErrorMessages,
    @Default(Duration(seconds: 5)) Duration errorDisplayDuration,

    // Loading configuration
    @Default(true) bool showLoadingIndicator,
    @Default('Processing files...') String loadingText,

    // RTL configuration
    @Default(true) bool supportRTL,
  }) = _AppFilePickerConfig;

  const AppFilePickerConfig._();

  /// Create configuration from theme
  factory AppFilePickerConfig.fromTheme(ThemeData theme) {
    return AppFilePickerConfig(
      colors: AppFilePickerColors.fromTheme(theme),
      typography: AppFilePickerTypography.fromTheme(theme),
      icons: const AppFilePickerIcons(),
    );
  }
}

/// Color configuration for AppFilePicker
@freezed
class AppFilePickerColors with _$AppFilePickerColors {
  const factory AppFilePickerColors({
    // Background colors
    @Default(Colors.transparent) Color backgroundColor,
    @Default(Color(0xFFF5F5F5)) Color hoverBackgroundColor,
    @Default(Color(0xFFE3F2FD)) Color focusBackgroundColor,
    @Default(Color(0xFFE8F5E8)) Color selectedBackgroundColor,
    @Default(Color(0xFFF5F5F5)) Color disabledBackgroundColor,
    @Default(Color(0xFFFFF3E0)) Color loadingBackgroundColor,

    // Border colors
    @Default(Color(0xFFE0E0E0)) Color borderColor,
    @Default(Color(0xFF1976D2)) Color hoverBorderColor,
    @Default(Color(0xFF1976D2)) Color focusBorderColor,
    @Default(Color(0xFF4CAF50)) Color selectedBorderColor,
    @Default(Color(0xFFBDBDBD)) Color disabledBorderColor,
    @Default(Color(0xFFFF9800)) Color loadingBorderColor,
    @Default(Color(0xFFF44336)) Color errorBorderColor,

    // Drag and drop colors
    @Default(Color(0xFFE3F2FD)) Color dragActiveBackgroundColor,
    @Default(Color(0xFF1976D2)) Color dragActiveBorderColor,
    @Default(Color(0xFFFFEBEE)) Color dragRejectBackgroundColor,
    @Default(Color(0xFFF44336)) Color dragRejectBorderColor,

    // Text colors
    @Default(Color(0xFF212121)) Color textColor,
    @Default(Color(0xFF757575)) Color hintTextColor,
    @Default(Color(0xFF9E9E9E)) Color disabledTextColor,
    @Default(Color(0xFFF44336)) Color errorTextColor,
    @Default(Color(0xFF4CAF50)) Color successTextColor,

    // Icon colors
    @Default(Color(0xFF757575)) Color iconColor,
    @Default(Color(0xFF1976D2)) Color activeIconColor,
    @Default(Color(0xFFBDBDBD)) Color disabledIconColor,
    @Default(Color(0xFFF44336)) Color errorIconColor,

    // Preview colors
    @Default(Color(0xFFFAFAFA)) Color previewBackgroundColor,
    @Default(Color(0xFFE0E0E0)) Color previewBorderColor,
    @Default(Color(0xFF212121)) Color previewTextColor,

    // Button colors
    @Default(Color(0xFF1976D2)) Color buttonBackgroundColor,
    @Default(Color(0xFFFFFFFF)) Color buttonTextColor,
    @Default(Color(0xFF1565C0)) Color buttonHoverBackgroundColor,
    @Default(Color(0xFFBDBDBD)) Color buttonDisabledBackgroundColor,
    @Default(Color(0xFFFFFFFF)) Color buttonDisabledTextColor,

    // Progress colors
    @Default(Color(0xFF1976D2)) Color progressColor,
    @Default(Color(0xFFE0E0E0)) Color progressBackgroundColor,

    // Skeleton colors
    @Default(Color(0xFFE0E0E0)) Color skeletonBaseColor,
    @Default(Color(0xFFF5F5F5)) Color skeletonHighlightColor,
  }) = _AppFilePickerColors;

  const AppFilePickerColors._();

  factory AppFilePickerColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return AppFilePickerColors(
      backgroundColor: colorScheme.surface,
      hoverBackgroundColor: colorScheme.surface,
      focusBackgroundColor: colorScheme.primaryContainer,
      selectedBackgroundColor: colorScheme.secondaryContainer,
      disabledBackgroundColor: colorScheme.surfaceContainerHighest,
      loadingBackgroundColor: colorScheme.surface,
      borderColor: colorScheme.outline,
      hoverBorderColor: colorScheme.primary,
      focusBorderColor: colorScheme.primary,
      selectedBorderColor: colorScheme.secondary,
      disabledBorderColor: colorScheme.outlineVariant,
      loadingBorderColor: colorScheme.primary,
      errorBorderColor: colorScheme.error,
      dragActiveBackgroundColor: colorScheme.primaryContainer,
      dragActiveBorderColor: colorScheme.primary,
      dragRejectBackgroundColor: colorScheme.errorContainer,
      dragRejectBorderColor: colorScheme.error,
      textColor: colorScheme.onSurface,
      hintTextColor: colorScheme.onSurfaceVariant,
      disabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      errorTextColor: colorScheme.error,
      successTextColor: colorScheme.primary,
      iconColor: colorScheme.onSurfaceVariant,
      activeIconColor: colorScheme.primary,
      disabledIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      errorIconColor: colorScheme.error,
      previewBackgroundColor: colorScheme.surfaceContainerHigh,
      previewBorderColor: colorScheme.outline,
      previewTextColor: colorScheme.onSurface,
      buttonBackgroundColor: colorScheme.primary,
      buttonTextColor: colorScheme.onPrimary,
      buttonHoverBackgroundColor: colorScheme.primaryContainer,
      buttonDisabledBackgroundColor:
          colorScheme.onSurface.withValues(alpha: 0.12),
      buttonDisabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      progressColor: colorScheme.primary,
      progressBackgroundColor: colorScheme.surfaceContainerHighest,
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surface,
    );
  }
}

/// Typography configuration for AppFilePicker
@freezed
class AppFilePickerTypography with _$AppFilePickerTypography {
  const factory AppFilePickerTypography({
    // Text styles
    @Default(TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
    TextStyle labelStyle,
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
    TextStyle hintStyle,
    @Default(TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
    TextStyle helperStyle,
    @Default(TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
    TextStyle errorStyle,
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
    TextStyle buttonStyle,

    // Preview text styles
    @Default(TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
    TextStyle fileNameStyle,
    @Default(TextStyle(fontSize: 11, fontWeight: FontWeight.w300))
    TextStyle fileSizeStyle,
    @Default(TextStyle(fontSize: 11, fontWeight: FontWeight.w300))
    TextStyle fileTypeStyle,

    // Drag and drop text styles
    @Default(TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
    TextStyle dragLabelStyle,
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
    TextStyle dragHintStyle,

    // Loading text styles
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
    TextStyle loadingStyle,
  }) = _AppFilePickerTypography;

  const AppFilePickerTypography._();

  factory AppFilePickerTypography.fromTheme(ThemeData theme) {
    final textTheme = theme.textTheme;

    return AppFilePickerTypography(
      labelStyle: textTheme.bodyLarge ?? const TextStyle(),
      hintStyle: textTheme.bodyMedium ?? const TextStyle(),
      helperStyle: textTheme.bodySmall ?? const TextStyle(),
      errorStyle: textTheme.bodySmall ?? const TextStyle(),
      buttonStyle: textTheme.labelLarge ?? const TextStyle(),
      fileNameStyle: textTheme.bodySmall ?? const TextStyle(),
      fileSizeStyle: textTheme.labelSmall ?? const TextStyle(),
      fileTypeStyle: textTheme.labelSmall ?? const TextStyle(),
      dragLabelStyle: textTheme.bodyLarge ?? const TextStyle(),
      dragHintStyle: textTheme.bodyMedium ?? const TextStyle(),
      loadingStyle: textTheme.bodyMedium ?? const TextStyle(),
    );
  }
}

/// Icon configuration for AppFilePicker
@freezed
class AppFilePickerIcons with _$AppFilePickerIcons {
  const factory AppFilePickerIcons({
    // Main icons
    @Default(Icons.upload_file) IconData uploadIcon,
    @Default(Icons.folder_open) IconData folderIcon,
    @Default(Icons.attach_file) IconData attachIcon,
    @Default(Icons.cloud_upload) IconData cloudUploadIcon,

    // File type icons
    @Default(Icons.description) IconData documentIcon,
    @Default(Icons.image) IconData imageIcon,
    @Default(Icons.video_file) IconData videoIcon,
    @Default(Icons.audio_file) IconData audioIcon,
    @Default(Icons.archive) IconData archiveIcon,
    @Default(Icons.insert_drive_file) IconData defaultFileIcon,

    // Action icons
    @Default(Icons.add) IconData addIcon,
    @Default(Icons.remove) IconData removeIcon,
    @Default(Icons.clear) IconData clearIcon,
    @Default(Icons.refresh) IconData refreshIcon,
    @Default(Icons.download) IconData downloadIcon,

    // State icons
    @Default(Icons.check_circle) IconData successIcon,
    @Default(Icons.error) IconData errorIcon,
    @Default(Icons.warning) IconData warningIcon,
    @Default(Icons.info) IconData infoIcon,

    // Loading icons
    @Default(Icons.hourglass_empty) IconData loadingIcon,
    @Default(Icons.upload) IconData uploadingIcon,

    // Drag and drop icons
    @Default(Icons.file_upload) IconData dragUploadIcon,
    @Default(Icons.drag_indicator) IconData dragIndicatorIcon,
  }) = _AppFilePickerIcons;
}

/// File size model
@freezed
class AppFileSize with _$AppFileSize {
  const factory AppFileSize(
    double value,
    AppFileSizeUnit unit,
  ) = _AppFileSize;

  const AppFileSize._();

  /// Convert to bytes
  int get bytes {
    switch (unit) {
      case AppFileSizeUnit.bytes:
        return value.round();
      case AppFileSizeUnit.kb:
        return (value * 1024).round();
      case AppFileSizeUnit.mb:
        return (value * 1024 * 1024).round();
      case AppFileSizeUnit.gb:
        return (value * 1024 * 1024 * 1024).round();
    }
  }

  /// Format size for display
  String get formatted {
    switch (unit) {
      case AppFileSizeUnit.bytes:
        return '${value.round()} B';
      case AppFileSizeUnit.kb:
        return '${value.toStringAsFixed(1)} KB';
      case AppFileSizeUnit.mb:
        return '${value.toStringAsFixed(1)} MB';
      case AppFileSizeUnit.gb:
        return '${value.toStringAsFixed(2)} GB';
    }
  }
}

/// File data model
@freezed
class AppFileData with _$AppFileData {
  const factory AppFileData({
    required String name,
    required int size,
    required String type,
    String? path,
    Uint8List? bytes,
    String? url,
    DateTime? lastModified,
    Map<String, dynamic>? metadata,
  }) = _AppFileData;

  const AppFileData._();

  /// Get file extension
  String get extension {
    final parts = name.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  /// Get formatted file size
  String get formattedSize {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// Check if file is an image
  bool get isImage {
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
    return imageExtensions.contains(extension);
  }

  /// Check if file is a video
  bool get isVideo {
    const videoExtensions = ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm', 'mkv'];
    return videoExtensions.contains(extension);
  }

  /// Check if file is an audio
  bool get isAudio {
    const audioExtensions = ['mp3', 'wav', 'aac', 'ogg', 'wma', 'flac'];
    return audioExtensions.contains(extension);
  }

  /// Check if file is a document
  bool get isDocument {
    const documentExtensions = [
      'pdf',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'ppt',
      'pptx',
      'txt',
      'rtf'
    ];
    return documentExtensions.contains(extension);
  }

  /// Check if file is an archive
  bool get isArchive {
    const archiveExtensions = ['zip', 'rar', '7z', 'tar', 'gz', 'bz2'];
    return archiveExtensions.contains(extension);
  }

  /// Get appropriate icon for file type
  IconData getIcon(AppFilePickerIcons icons) {
    if (isImage) return icons.imageIcon;
    if (isVideo) return icons.videoIcon;
    if (isAudio) return icons.audioIcon;
    if (isDocument) return icons.documentIcon;
    if (isArchive) return icons.archiveIcon;
    return icons.defaultFileIcon;
  }
}

/// File validation utilities
class AppFileValidators {
  /// Validate file size
  static bool validateSize(AppFileData file, AppFileSize maxSize) {
    return file.size <= maxSize.bytes;
  }

  /// Validate file extension
  static bool validateExtension(
      AppFileData file, List<String> allowedExtensions) {
    if (allowedExtensions.isEmpty) return true;
    return allowedExtensions.contains(file.extension);
  }

  /// Validate file MIME type
  static bool validateMimeType(
      AppFileData file, List<String> allowedMimeTypes) {
    if (allowedMimeTypes.isEmpty) return true;
    return allowedMimeTypes.contains(file.type);
  }

  /// Validate file name
  static bool validateFileName(String fileName) {
    if (fileName.isEmpty) return false;
    // Check for invalid characters
    const invalidChars = ['/', '\\', ':', '*', '?', '"', '<', '>', '|'];
    return !invalidChars.any((char) => fileName.contains(char));
  }

  /// Get file size from bytes
  static AppFileSize getFileSize(int bytes) {
    if (bytes < 1024) {
      return AppFileSize(bytes.toDouble(), AppFileSizeUnit.bytes);
    }
    if (bytes < 1024 * 1024) {
      return AppFileSize(bytes / 1024, AppFileSizeUnit.kb);
    }
    if (bytes < 1024 * 1024 * 1024) {
      return AppFileSize(bytes / (1024 * 1024), AppFileSizeUnit.mb);
    }
    return AppFileSize(bytes / (1024 * 1024 * 1024), AppFileSizeUnit.gb);
  }
}

/// File picker utilities
class AppFilePickerUtils {
  /// Get MIME type from extension
  static String getMimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      // Images
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'webp':
        return 'image/webp';
      case 'svg':
        return 'image/svg+xml';

      // Videos
      case 'mp4':
        return 'video/mp4';
      case 'avi':
        return 'video/x-msvideo';
      case 'mov':
        return 'video/quicktime';
      case 'wmv':
        return 'video/x-ms-wmv';
      case 'flv':
        return 'video/x-flv';
      case 'webm':
        return 'video/webm';

      // Audio
      case 'mp3':
        return 'audio/mpeg';
      case 'wav':
        return 'audio/wav';
      case 'aac':
        return 'audio/aac';
      case 'ogg':
        return 'audio/ogg';

      // Documents
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'ppt':
        return 'application/vnd.ms-powerpoint';
      case 'pptx':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      case 'txt':
        return 'text/plain';

      // Archives
      case 'zip':
        return 'application/zip';
      case 'rar':
        return 'application/x-rar-compressed';
      case '7z':
        return 'application/x-7z-compressed';

      default:
        return 'application/octet-stream';
    }
  }

  /// Format file size for display
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// Check if platform supports drag and drop
  static bool get supportsDragAndDrop {
    return kIsWeb ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux;
  }

  /// Check if platform supports native file picker
  static bool get supportsNativeFilePicker {
    return !kIsWeb;
  }
}
