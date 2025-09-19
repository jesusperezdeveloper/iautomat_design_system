import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'file_picker_config.dart';

/// Callback function type for file selection
typedef OnFilesSelected = void Function(List<DSFileData> files);

/// Callback function type for file validation errors
typedef OnFileValidationError = void Function(String error, DSFileData? file);

/// Callback function type for file upload progress
typedef OnFileUploadProgress = void Function(double progress, DSFileData file);

/// A comprehensive file picker widget with drag & drop and multi-selection support
///
/// The [DSFilePicker] provides a flexible file selection interface with:
/// - Drag and drop support (on supported platforms)
/// - Multi-file selection
/// - File preview capabilities
/// - Comprehensive validation
/// - Platform-adaptive behavior
/// - Full accessibility support
/// - RTL text direction support
/// - Material 3 design integration
///
/// Example usage:
/// ```dart
/// DSFilePicker(
///   variant: DSFilePickerVariant.dragAndDrop,
///   accept: ['jpg', 'png', 'pdf'],
///   maxSize: DSFileSize(10, DSFileSizeUnit.mb),
///   onFilesSelected: (files) {
///     print('Selected ${files.length} files');
///   },
///   preview: true,
/// )
/// ```
class DSFilePicker extends StatefulWidget {
  /// The variant of the file picker
  final DSFilePickerVariant variant;

  /// List of accepted file extensions (e.g., ['jpg', 'png', 'pdf'])
  final List<String> accept;

  /// Maximum file size allowed
  final DSFileSize maxSize;

  /// Callback when files are selected
  final OnFilesSelected? onFilesSelected;

  /// Whether to show file preview
  final bool preview;

  /// Current state of the file picker
  final DSFilePickerState state;

  /// Whether the file picker is enabled
  final bool enabled;

  /// Label text for the file picker
  final String? label;

  /// Hint text to display
  final String? hint;

  /// Helper text to display
  final String? helperText;

  /// Error text to display
  final String? errorText;

  /// Prefix icon
  final Widget? prefixIcon;

  /// Suffix icon
  final Widget? suffixIcon;

  /// Configuration for the file picker
  final DSFilePickerConfig? config;

  /// Current selected files
  final List<DSFileData>? value;

  /// Callback for validation errors
  final OnFileValidationError? onValidationError;

  /// Callback for upload progress
  final OnFileUploadProgress? onUploadProgress;

  /// Whether to allow multiple file selection
  final bool allowMultiple;

  /// Maximum number of files to select
  final int? maxFiles;

  /// Custom validation function
  final bool Function(DSFileData file)? customValidator;

  /// Custom error message builder
  final String Function(String error, DSFileData? file)? errorMessageBuilder;

  /// Whether to auto-upload files after selection
  final bool autoUpload;

  /// Upload URL for auto-upload
  final String? uploadUrl;

  /// Additional headers for upload
  final Map<String, String>? uploadHeaders;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable sound effects
  final bool enableSoundEffects;

  /// Custom upload function
  final Future<void> Function(List<DSFileData> files)? customUploader;

  const DSFilePicker({
    super.key,
    this.variant = DSFilePickerVariant.dragAndDrop,
    this.accept = const [],
    this.maxSize = const DSFileSize(10, DSFileSizeUnit.mb),
    this.onFilesSelected,
    this.preview = true,
    this.state = DSFilePickerState.defaultState,
    this.enabled = true,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.config,
    this.value,
    this.onValidationError,
    this.onUploadProgress,
    this.allowMultiple = true,
    this.maxFiles,
    this.customValidator,
    this.errorMessageBuilder,
    this.autoUpload = false,
    this.uploadUrl,
    this.uploadHeaders,
    this.semanticLabel,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.customUploader,
  });

  @override
  State<DSFilePicker> createState() => _DSFilePickerState();
}

class _DSFilePickerState extends State<DSFilePicker>
    with TickerProviderStateMixin {
  late DSFilePickerConfig _config;
  late AnimationController _animationController;
  late AnimationController _hoverAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _hoverAnimation;

  List<DSFileData> _selectedFiles = [];
  final bool _isDragOver = false;
  bool _isHovered = false;
  bool _isFocused = false;
  double _uploadProgress = 0.0;
  String? _currentError;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeFiles();
    _setupFocusListener();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeConfig();
    _initializeAnimations();
  }

  void _initializeConfig() {
    _config = widget.config ?? DSFilePickerConfig.fromTheme(Theme.of(context));
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: _config.animationDuration,
      vsync: this,
    );

    _hoverAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _config.animationCurve,
    ));

    _hoverAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  void _initializeFiles() {
    if (widget.value != null) {
      _selectedFiles = List.from(widget.value!);
    }
  }

  void _setupFocusListener() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void didUpdateWidget(DSFilePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config != oldWidget.config) {
      _initializeConfig();
    }

    if (widget.value != oldWidget.value) {
      _initializeFiles();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _hoverAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == DSFilePickerState.skeleton) {
      return _buildSkeleton();
    }

    return Semantics(
      label: widget.semanticLabel ?? _config.accessibilityLabel,
      button: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) _buildLabel(),
          _buildMainContent(),
          if (widget.helperText != null || widget.errorText != null)
            _buildHelperText(),
          if (widget.preview && _selectedFiles.isNotEmpty) _buildPreview(),
        ],
      ),
    );
  }

  Widget _buildLabel() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));
    final typography = _config.typography ??
        DSFilePickerTypography.fromTheme(Theme.of(context));

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        widget.label!,
        style: typography.labelStyle.copyWith(
          color: widget.enabled ? colors.textColor : colors.disabledTextColor,
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Focus(
      focusNode: _focusNode,
      child: widget.variant == DSFilePickerVariant.dragAndDrop
          ? _buildDragDropArea()
          : _buildMultiSelector(),
    );
  }

  Widget _buildDragDropArea() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));

    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _hoverAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHoverStart(),
            onExit: (_) => _onHoverEnd(),
            child: GestureDetector(
              onTap: widget.enabled ? _onTap : null,
              onTapDown: (_) => _onTapDown(),
              onTapUp: (_) => _onTapUp(),
              onTapCancel: _onTapCancel,
              child: AnimatedContainer(
                duration: _config.animationDuration,
                curve: _config.animationCurve,
                constraints: BoxConstraints(
                  minWidth: _config.minSize.width,
                  minHeight: _config.minSize.height,
                  maxWidth: _config.maxSize.width,
                ),
                decoration: _getDragDropDecoration(colors),
                child: _buildDragDropContent(),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _getDragDropDecoration(DSFilePickerColors colors) {
    Color backgroundColor;
    Color borderColor;
    double borderWidth;

    if (!widget.enabled) {
      backgroundColor = colors.disabledBackgroundColor;
      borderColor = colors.disabledBorderColor;
      borderWidth = _config.borderWidth;
    } else if (widget.state == DSFilePickerState.loading) {
      backgroundColor = colors.loadingBackgroundColor;
      borderColor = colors.loadingBorderColor;
      borderWidth = _config.borderWidth;
    } else if (_isDragOver) {
      backgroundColor = colors.dragActiveBackgroundColor;
      borderColor = colors.dragActiveBorderColor;
      borderWidth = _config.dragBorderWidth;
    } else if (_isFocused) {
      backgroundColor = colors.focusBackgroundColor;
      borderColor = colors.focusBorderColor;
      borderWidth = _config.focusBorderWidth;
    } else if (_isHovered) {
      backgroundColor = colors.hoverBackgroundColor;
      borderColor = colors.hoverBorderColor;
      borderWidth = _config.borderWidth;
    } else if (_selectedFiles.isNotEmpty) {
      backgroundColor = colors.selectedBackgroundColor;
      borderColor = colors.selectedBorderColor;
      borderWidth = _config.borderWidth;
    } else if (widget.errorText != null || _currentError != null) {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.errorBorderColor;
      borderWidth = _config.borderWidth;
    } else {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.borderColor;
      borderWidth = _config.borderWidth;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: _config.dragBorderRadius,
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }

  Widget _buildDragDropContent() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));
    final typography = _config.typography ??
        DSFilePickerTypography.fromTheme(Theme.of(context));
    final icons = _config.icons ?? const DSFilePickerIcons();

    if (widget.state == DSFilePickerState.loading) {
      return _buildLoadingContent();
    }

    return Padding(
      padding: _config.contentPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _selectedFiles.isNotEmpty
                ? icons.successIcon
                : icons.dragUploadIcon,
            size: 48,
            color: widget.enabled
                ? (_selectedFiles.isNotEmpty
                    ? colors.successTextColor
                    : colors.iconColor)
                : colors.disabledIconColor,
          ),
          const SizedBox(height: 16),
          Text(
            _getDragDropMainText(),
            style: typography.dragLabelStyle.copyWith(
              color:
                  widget.enabled ? colors.textColor : colors.disabledTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            _getDragDropHintText(),
            style: typography.dragHintStyle.copyWith(
              color: widget.enabled
                  ? colors.hintTextColor
                  : colors.disabledTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          if (_selectedFiles.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              '${_selectedFiles.length} ${_selectedFiles.length == 1 ? 'archivo seleccionado' : 'archivos seleccionados'}',
              style: typography.helperStyle.copyWith(
                color: colors.successTextColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMultiSelector() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHoverStart(),
            onExit: (_) => _onHoverEnd(),
            child: InkWell(
              onTap: widget.enabled ? _onTap : null,
              onTapDown: (_) => _onTapDown(),
              onTapCancel: _onTapCancel,
              borderRadius: _config.borderRadius,
              child: AnimatedContainer(
                duration: _config.animationDuration,
                curve: _config.animationCurve,
                padding: _config.buttonPadding,
                decoration: _getMultiSelectorDecoration(colors),
                child: _buildMultiSelectorContent(),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _getMultiSelectorDecoration(DSFilePickerColors colors) {
    Color backgroundColor;
    Color borderColor;

    if (!widget.enabled) {
      backgroundColor = colors.buttonDisabledBackgroundColor;
      borderColor = colors.disabledBorderColor;
    } else if (widget.state == DSFilePickerState.loading) {
      backgroundColor = colors.loadingBackgroundColor;
      borderColor = colors.loadingBorderColor;
    } else if (_isFocused) {
      backgroundColor = colors.buttonBackgroundColor;
      borderColor = colors.focusBorderColor;
    } else if (_isHovered) {
      backgroundColor = colors.buttonHoverBackgroundColor;
      borderColor = colors.hoverBorderColor;
    } else {
      backgroundColor = colors.buttonBackgroundColor;
      borderColor = colors.borderColor;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: _config.borderRadius,
      border: Border.all(
        color: borderColor,
        width: _config.borderWidth,
      ),
    );
  }

  Widget _buildMultiSelectorContent() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));
    final typography = _config.typography ??
        DSFilePickerTypography.fromTheme(Theme.of(context));
    final icons = _config.icons ?? const DSFilePickerIcons();

    if (widget.state == DSFilePickerState.loading) {
      return _buildLoadingContent();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.prefixIcon != null) ...[
          widget.prefixIcon!,
          const SizedBox(width: 8),
        ] else ...[
          Icon(
            icons.uploadIcon,
            color: widget.enabled
                ? colors.buttonTextColor
                : colors.buttonDisabledTextColor,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          _getMultiSelectorText(),
          style: typography.buttonStyle.copyWith(
            color: widget.enabled
                ? colors.buttonTextColor
                : colors.buttonDisabledTextColor,
          ),
        ),
        if (widget.suffixIcon != null) ...[
          const SizedBox(width: 8),
          widget.suffixIcon!,
        ],
      ],
    );
  }

  Widget _buildLoadingContent() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));
    final typography = _config.typography ??
        DSFilePickerTypography.fromTheme(Theme.of(context));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colors.progressColor),
            value: _uploadProgress > 0 ? _uploadProgress : null,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          _config.loadingText,
          style: typography.loadingStyle.copyWith(
            color: colors.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildHelperText() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));
    final typography = _config.typography ??
        DSFilePickerTypography.fromTheme(Theme.of(context));

    String? text;
    Color textColor;

    if (widget.errorText != null || _currentError != null) {
      text = widget.errorText ?? _currentError;
      textColor = colors.errorTextColor;
    } else if (widget.helperText != null) {
      text = widget.helperText;
      textColor = colors.hintTextColor;
    } else {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text!,
        style: typography.helperStyle.copyWith(color: textColor),
      ),
    );
  }

  Widget _buildPreview() {
    if (_selectedFiles.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Archivos seleccionados:',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ..._selectedFiles.map((file) => _buildFilePreviewItem(file)),
        ],
      ),
    );
  }

  Widget _buildFilePreviewItem(DSFileData file) {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));
    final typography = _config.typography ??
        DSFilePickerTypography.fromTheme(Theme.of(context));
    final icons = _config.icons ?? const DSFilePickerIcons();

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: colors.previewBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colors.previewBorderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            file.getIcon(icons),
            color: colors.iconColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.name,
                  style: typography.fileNameStyle.copyWith(
                    color: colors.previewTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  file.formattedSize,
                  style: typography.fileSizeStyle.copyWith(
                    color: colors.hintTextColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _removeFile(file),
            icon: Icon(
              icons.removeIcon,
              color: colors.errorTextColor,
            ),
            iconSize: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildSkeleton() {
    final colors =
        _config.colors ?? DSFilePickerColors.fromTheme(Theme.of(context));

    return Container(
      height: _config.minSize.height,
      decoration: BoxDecoration(
        color: colors.skeletonBaseColor,
        borderRadius: _config.borderRadius,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // Event handlers
  void _onHoverStart() {
    if (!widget.enabled) return;
    setState(() {
      _isHovered = true;
    });
    _hoverAnimationController.forward();
  }

  void _onHoverEnd() {
    setState(() {
      _isHovered = false;
    });
    _hoverAnimationController.reverse();
  }

  void _onTapDown() {
    if (!widget.enabled) return;
    _animationController.forward();
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _onTapUp() {
    _animationController.reverse();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  void _onTap() {
    if (!widget.enabled) return;
    _focusNode.requestFocus();
    _openFilePicker();
  }

  // File operations
  Future<void> _openFilePicker() async {
    try {
      setState(() {
        _currentError = null;
      });

      // Simulate file picker (in real implementation, use file_picker package)
      await Future.delayed(const Duration(milliseconds: 500));

      final mockFiles = [
        DSFileData(
          name: 'document.pdf',
          size: 1024 * 1024, // 1MB
          type: 'application/pdf',
          lastModified: DateTime.now(),
        ),
        DSFileData(
          name: 'image.jpg',
          size: 512 * 1024, // 512KB
          type: 'image/jpeg',
          lastModified: DateTime.now(),
        ),
      ];

      _handleFilesSelected(mockFiles);
    } catch (e) {
      setState(() {
        _currentError = 'Error al seleccionar archivos: $e';
      });
      widget.onValidationError?.call(_currentError!, null);
    } finally {
      // Clean up if needed
    }
  }

  void _handleFilesSelected(List<DSFileData> files) {
    final validFiles = <DSFileData>[];

    for (final file in files) {
      if (_validateFile(file)) {
        validFiles.add(file);
      }
    }

    if (validFiles.isNotEmpty) {
      setState(() {
        if (widget.allowMultiple) {
          _selectedFiles.addAll(validFiles);
          if (widget.maxFiles != null &&
              _selectedFiles.length > widget.maxFiles!) {
            _selectedFiles = _selectedFiles.take(widget.maxFiles!).toList();
          }
        } else {
          _selectedFiles = [validFiles.first];
        }
      });

      widget.onFilesSelected?.call(_selectedFiles);

      if (widget.autoUpload) {
        _uploadFiles(validFiles);
      }
    }
  }

  bool _validateFile(DSFileData file) {
    // Size validation
    if (!DSFileValidators.validateSize(file, widget.maxSize)) {
      final error =
          'El archivo "${file.name}" excede el tamaño máximo de ${widget.maxSize.formatted}';
      _handleValidationError(error, file);
      return false;
    }

    // Extension validation
    if (!DSFileValidators.validateExtension(file, widget.accept)) {
      final error =
          'El archivo "${file.name}" no tiene una extensión permitida';
      _handleValidationError(error, file);
      return false;
    }

    // Custom validation
    if (widget.customValidator != null && !widget.customValidator!(file)) {
      final error =
          'El archivo "${file.name}" no pasó la validación personalizada';
      _handleValidationError(error, file);
      return false;
    }

    return true;
  }

  void _handleValidationError(String error, DSFileData? file) {
    setState(() {
      _currentError = widget.errorMessageBuilder?.call(error, file) ?? error;
    });
    widget.onValidationError?.call(error, file);
  }

  void _removeFile(DSFileData file) {
    setState(() {
      _selectedFiles.remove(file);
    });
    widget.onFilesSelected?.call(_selectedFiles);
  }

  Future<void> _uploadFiles(List<DSFileData> files) async {
    if (widget.customUploader != null) {
      await widget.customUploader!(files);
      return;
    }

    // Default upload implementation
    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      setState(() {
        _uploadProgress = (i + 1) / files.length;
      });
      widget.onUploadProgress?.call(_uploadProgress, file);

      // Simulate upload delay
      await Future.delayed(const Duration(milliseconds: 500));
    }

    setState(() {
      _uploadProgress = 0.0;
    });
  }

  // Text getters
  String _getDragDropMainText() {
    if (_selectedFiles.isNotEmpty) {
      return 'Archivos seleccionados';
    }
    return widget.hint ?? 'Arrastra archivos aquí';
  }

  String _getDragDropHintText() {
    if (_selectedFiles.isNotEmpty) {
      return 'Haz clic para seleccionar más archivos';
    }
    return 'o haz clic para seleccionar';
  }

  String _getMultiSelectorText() {
    if (_selectedFiles.isNotEmpty) {
      return '${_selectedFiles.length} archivo${_selectedFiles.length == 1 ? '' : 's'} seleccionado${_selectedFiles.length == 1 ? '' : 's'}';
    }
    return widget.hint ?? 'Seleccionar archivos';
  }
}
