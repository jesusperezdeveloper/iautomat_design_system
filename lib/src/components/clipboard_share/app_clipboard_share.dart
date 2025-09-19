import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'app_clipboard_share_config.dart';
import 'app_clipboard_share_platform_adapter.dart';
import 'app_clipboard_share_a11y_helper.dart';

class DSClipboardShare extends StatefulWidget {
  final DSShareData data;
  final String? subject;
  final List<DSShareFile> files;
  final DSClipboardShareConfig? config;
  final VoidCallback? onSharePressed;
  final VoidCallback? onCopyPressed;
  final ValueChanged<DSClipboardShareState>? onStateChanged;
  final Function(String)? onShareCompleted;
  final Function(String)? onShareError;
  final Function(String)? onCopyCompleted;
  final bool interactive;

  const DSClipboardShare({
    super.key,
    required this.data,
    this.subject,
    this.files = const [],
    this.config,
    this.onSharePressed,
    this.onCopyPressed,
    this.onStateChanged,
    this.onShareCompleted,
    this.onShareError,
    this.onCopyCompleted,
    this.interactive = true,
  });

  @override
  State<DSClipboardShare> createState() => _DSClipboardShareState();
}

class _DSClipboardShareState extends State<DSClipboardShare>
    with SingleTickerProviderStateMixin {
  DSClipboardShareConfig? _effectiveConfig;
  late DSClipboardSharePlatformAdapter _platformAdapter;
  late DSClipboardShareA11yHelper _a11yHelper;
  DSClipboardShareState _currentState = DSClipboardShareState.defaultState;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isProcessing = false;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _platformAdapter = DSClipboardSharePlatformAdapter();
    _a11yHelper = DSClipboardShareA11yHelper();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeConfig();
  }

  @override
  void didUpdateWidget(DSClipboardShare oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config) {
      _initializeConfig();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeConfig() {
    _effectiveConfig = _platformAdapter.adaptConfigForPlatform(
      widget.config ?? const DSClipboardShareConfig(),
      context,
    );
  }

  void _handleStateChange(DSClipboardShareState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });
      widget.onStateChanged?.call(newState);

      if (newState == DSClipboardShareState.pressed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  Future<void> _handleShare() async {
    if (!widget.interactive || _isProcessing) return;

    setState(() {
      _isProcessing = true;
      _lastError = null;
    });
    _handleStateChange(DSClipboardShareState.loading);

    try {
      await _platformAdapter.triggerHapticFeedback();

      if (_effectiveConfig!.variant == DSClipboardShareVariant.shareSheet) {
        await _showNativeShareSheet();
      } else {
        await _showCustomShareDialog();
      }

      widget.onShareCompleted?.call('Compartido exitosamente');
      _a11yHelper.announceShareSuccess();

      if (_effectiveConfig!.showConfirmation) {
        _showConfirmationToast('Contenido compartido');
      }
    } catch (e) {
      _lastError = e.toString();
      widget.onShareError?.call(_lastError!);
      _a11yHelper.announceShareError(_lastError!);

      if (_effectiveConfig!.showConfirmation) {
        _showErrorToast('Error al compartir: $_lastError');
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
      _handleStateChange(DSClipboardShareState.defaultState);
    }
  }

  Future<void> _showNativeShareSheet() async {
    final box = context.findRenderObject() as RenderBox?;

    if (widget.files.isNotEmpty) {
      final xFiles = await _prepareFiles();
      await Share.shareXFiles(
        xFiles,
        text: widget.data.text,
        subject: widget.subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    } else if (widget.data.url != null) {
      await Share.shareUri(
        Uri.parse(widget.data.url!),
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : null,
      );
    } else {
      await Share.share(
        widget.data.text ?? '',
        subject: widget.subject,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : null,
      );
    }
  }

  Future<List<XFile>> _prepareFiles() async {
    final xFiles = <XFile>[];

    for (final file in widget.files) {
      if (file.path != null) {
        xFiles.add(XFile(file.path!, name: file.name, mimeType: file.mimeType));
      } else if (file.bytes != null) {
        xFiles.add(
          XFile.fromData(file.bytes!, name: file.name, mimeType: file.mimeType),
        );
      }
    }

    return xFiles;
  }

  Future<void> _showCustomShareDialog() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildCustomShareSheet(),
    );
  }

  Future<void> _handleCopy() async {
    if (!widget.interactive || _isProcessing) return;

    setState(() {
      _isProcessing = true;
      _lastError = null;
    });
    _handleStateChange(DSClipboardShareState.loading);

    try {
      await _platformAdapter.triggerHapticFeedback();

      final text = widget.data.text ?? '';
      await Clipboard.setData(ClipboardData(text: text));

      widget.onCopyCompleted?.call('Copiado al portapapeles');
      _a11yHelper.announceCopySuccess();

      if (_effectiveConfig!.showConfirmation) {
        _showConfirmationToast('Copiado al portapapeles');
      }
    } catch (e) {
      _lastError = e.toString();
      widget.onShareError?.call(_lastError!);
      _a11yHelper.announceCopyError(_lastError!);

      if (_effectiveConfig!.showConfirmation) {
        _showErrorToast('Error al copiar: $_lastError');
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
      _handleStateChange(DSClipboardShareState.defaultState);
    }
  }

  void _showConfirmationToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _effectiveConfig!.colors?.successColor,
        duration:
            _effectiveConfig!.animations?.confirmationDuration ??
            const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _effectiveConfig!.colors?.errorColor,
        duration:
            _effectiveConfig!.animations?.confirmationDuration ??
            const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_effectiveConfig == null) {
      return const SizedBox.shrink();
    }

    if (_currentState == DSClipboardShareState.skeleton) {
      return _buildSkeletonLoader();
    }

    if (_currentState == DSClipboardShareState.loading) {
      return _buildLoadingState();
    }

    return _buildShareButton();
  }

  Widget _buildShareButton() {
    final config = _effectiveConfig!;
    final colors = config.colors!;
    final spacing = config.spacing!;
    final typography = config.typography!;

    return Semantics(
      label: _a11yHelper.getShareButtonLabel(config),
      hint: _a11yHelper.getShareButtonHint(config),
      button: true,
      enabled: widget.interactive && !_isProcessing,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 - (_animation.value * 0.05),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.interactive && !_isProcessing
                    ? () {
                        widget.onSharePressed?.call();
                        _handleShare();
                      }
                    : null,
                onLongPress: widget.interactive && !_isProcessing
                    ? () {
                        widget.onCopyPressed?.call();
                        _handleCopy();
                      }
                    : null,
                onHover: config.behavior?.enableHoverEffects ?? true
                    ? (hovering) {
                        _handleStateChange(
                          hovering
                              ? DSClipboardShareState.hover
                              : DSClipboardShareState.defaultState,
                        );
                      }
                    : null,
                onTapDown: (_) =>
                    _handleStateChange(DSClipboardShareState.pressed),
                onTapUp: (_) =>
                    _handleStateChange(DSClipboardShareState.defaultState),
                onTapCancel: () =>
                    _handleStateChange(DSClipboardShareState.defaultState),
                borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
                child: Container(
                  padding: spacing.buttonPadding,
                  decoration: BoxDecoration(
                    color: _getButtonColor(colors),
                    borderRadius: BorderRadius.circular(
                      spacing.buttonBorderRadius,
                    ),
                    border: Border.all(
                      color: colors.borderColor ?? Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _platformAdapter.getShareIcon(),
                        size: spacing.iconSize,
                        color: _getIconColor(colors),
                      ),
                      if (config.variant !=
                          DSClipboardShareVariant.quickActions) ...[
                        SizedBox(width: spacing.iconSpacing),
                        Text(
                          _platformAdapter.getShareLabel(),
                          style:
                              typography.buttonStyle?.copyWith(
                                color: _getTextColor(colors),
                              ) ??
                              Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCustomShareSheet() {
    final config = _effectiveConfig!;
    final colors = config.colors!;
    final spacing = config.spacing!;

    return Container(
      constraints: BoxConstraints(
        maxHeight:
            spacing.modalHeight ?? MediaQuery.of(context).size.height * 0.75,
        maxWidth: spacing.modalMaxWidth,
      ),
      decoration: BoxDecoration(
        color: colors.backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(spacing.borderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSheetHandle(),
          _buildSheetHeader(),
          if (config.showPreview) _buildContentPreview(),
          Expanded(child: _buildShareOptions()),
        ],
      ),
    );
  }

  Widget _buildSheetHandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildSheetHeader() {
    final typography = _effectiveConfig!.typography!;
    final spacing = _effectiveConfig!.spacing!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.modalPadding.left,
        vertical: 16,
      ),
      child: Row(
        children: [
          Text(
            'Compartir',
            style:
                typography.titleStyle ?? Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildContentPreview() {
    final config = _effectiveConfig!;
    final colors = config.colors!;
    final spacing = config.spacing!;
    final typography = config.typography!;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: spacing.modalPadding.left,
        vertical: 8,
      ),
      padding: spacing.previewPadding,
      decoration: BoxDecoration(
        color: colors.backgroundColor?.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.borderColor ?? Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.subject != null)
            Text(
              widget.subject!,
              style:
                  typography.subtitleStyle ??
                  Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (widget.data.text != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.data.text!,
              style:
                  typography.previewStyle ??
                  Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (widget.files.isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildFilePreview(),
          ],
        ],
      ),
    );
  }

  Widget _buildFilePreview() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.files.take(3).map((file) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getFileIcon(file), size: 16),
              const SizedBox(width: 4),
              Text(
                file.name,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildShareOptions() {
    final spacing = _effectiveConfig!.spacing!;

    return ListView(
      padding: EdgeInsets.all(spacing.modalPadding.left),
      children: [
        _buildShareOption(
          icon: Icons.copy,
          label: 'Copiar al portapapeles',
          onTap: () {
            Navigator.of(context).pop();
            _handleCopy();
          },
        ),
        _buildShareOption(
          icon: Icons.share,
          label: 'Compartir con apps',
          onTap: () {
            Navigator.of(context).pop();
            _showNativeShareSheet();
          },
        ),
        if (_platformAdapter.supportsEmail())
          _buildShareOption(
            icon: Icons.email,
            label: 'Enviar por email',
            onTap: () {
              Navigator.of(context).pop();
              _platformAdapter.shareViaEmail(widget.data, widget.subject);
            },
          ),
        if (_platformAdapter.supportsWhatsApp())
          _buildShareOption(
            icon: Icons.message,
            label: 'Compartir en WhatsApp',
            onTap: () {
              Navigator.of(context).pop();
              _platformAdapter.shareViaWhatsApp(widget.data);
            },
          ),
      ],
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final colors = _effectiveConfig!.colors!;
    final spacing = _effectiveConfig!.spacing!;

    return ListTile(
      leading: Icon(icon, color: colors.iconColor),
      title: Text(label),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.itemSpacing,
        vertical: spacing.itemSpacing / 2,
      ),
    );
  }

  Widget _buildLoadingState() {
    final colors = _effectiveConfig!.colors!;
    final spacing = _effectiveConfig!.spacing!;

    return Container(
      padding: spacing.buttonPadding,
      child: SizedBox(
        width: spacing.iconSize,
        height: spacing.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            colors.loadingColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    final colors = _effectiveConfig!.colors!;
    final spacing = _effectiveConfig!.spacing!;

    return Container(
      padding: spacing.buttonPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
        color: colors.skeletonBaseColor ?? Colors.grey.shade300,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: spacing.iconSize,
            height: spacing.iconSize,
            decoration: BoxDecoration(
              color: colors.skeletonHighlightColor ?? Colors.grey.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 80,
            height: 16,
            decoration: BoxDecoration(
              color: colors.skeletonHighlightColor ?? Colors.grey.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Color? _getButtonColor(DSClipboardShareColors colors) {
    switch (_currentState) {
      case DSClipboardShareState.hover:
        return colors.hoverColor;
      case DSClipboardShareState.pressed:
        return colors.pressedColor;
      case DSClipboardShareState.focus:
        return colors.focusColor;
      case DSClipboardShareState.selected:
        return colors.selectedColor;
      case DSClipboardShareState.disabled:
        return colors.disabledColor?.withValues(alpha: 0.5);
      default:
        return colors.primaryButtonColor;
    }
  }

  Color? _getIconColor(DSClipboardShareColors colors) {
    if (_currentState == DSClipboardShareState.disabled) {
      return colors.disabledColor;
    }
    return colors.iconColor;
  }

  Color? _getTextColor(DSClipboardShareColors colors) {
    if (_currentState == DSClipboardShareState.disabled) {
      return colors.disabledColor;
    }
    return colors.primaryTextColor;
  }

  IconData _getFileIcon(DSShareFile file) {
    if (file.isImage) return Icons.image;
    if (file.isVideo) return Icons.video_file;
    if (file.isDocument) return Icons.description;
    return Icons.insert_drive_file;
  }
}
