import 'package:flutter/material.dart';

import 'package:iautomat_design_system/src/components/media_viewer/ds_media_viewer_config.dart';
import 'package:iautomat_design_system/src/components/media_viewer/ds_media_viewer_a11y_helper.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

/// Widget de controles avanzados para el DSMediaViewer
///
/// Proporciona una interfaz completa de controles para:
/// - Reproducción y pausa
/// - Navegación entre elementos
/// - Control de volumen
/// - Seek/scrubbing
/// - Pantalla completa
/// - Información del archivo
/// - Navegación por teclado completa
class DSMediaViewerControlsWidget extends StatefulWidget {
  /// Elementos de media
  final List<DSMediaItem> items;

  /// Índice actual
  final int currentIndex;

  /// Si está reproduciéndose
  final bool isPlaying;

  /// Si está silenciado
  final bool isMuted;

  /// Si está en pantalla completa
  final bool isFullscreen;

  /// Posición actual de reproducción
  final double currentPosition;

  /// Duración total
  final double duration;

  /// Nivel de volumen (0.0 - 1.0)
  final double volume;

  /// Configuración de controles
  final DSMediaViewerControls? config;

  /// Configuración de accesibilidad
  final DSMediaViewerA11yConfig? a11yConfig;

  /// Si los controles están visibles
  final bool isVisible;

  /// Callbacks
  final VoidCallback? onPlayPause;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final ValueChanged<double>? onSeek;
  final ValueChanged<double>? onVolumeChange;
  final VoidCallback? onMuteToggle;
  final VoidCallback? onFullscreenToggle;
  final VoidCallback? onClose;
  final VoidCallback? onInfo;

  const DSMediaViewerControlsWidget({
    super.key,
    required this.items,
    required this.currentIndex,
    this.isPlaying = false,
    this.isMuted = false,
    this.isFullscreen = false,
    this.currentPosition = 0.0,
    this.duration = 0.0,
    this.volume = 1.0,
    this.config,
    this.a11yConfig,
    this.isVisible = true,
    this.onPlayPause,
    this.onPrevious,
    this.onNext,
    this.onSeek,
    this.onVolumeChange,
    this.onMuteToggle,
    this.onFullscreenToggle,
    this.onClose,
    this.onInfo,
  });

  @override
  State<DSMediaViewerControlsWidget> createState() => _DSMediaViewerControlsState();
}

class _DSMediaViewerControlsState extends State<DSMediaViewerControlsWidget>
    with TickerProviderStateMixin {
  late final AnimationController _visibilityController;
  late final Animation<double> _visibilityAnimation;

  bool _isDragging = false;
  double _dragValue = 0.0;
  bool _showVolumeSlider = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _visibilityController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _visibilityAnimation = CurvedAnimation(
      parent: _visibilityController,
      curve: Curves.easeInOut,
    );

    if (widget.isVisible) {
      _visibilityController.forward();
    }
  }

  @override
  void didUpdateWidget(DSMediaViewerControlsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _visibilityController.forward();
      } else {
        _visibilityController.reverse();
      }
    }
  }

  DSMediaItem get _currentItem => widget.items[widget.currentIndex];

  void _handleSeekStart(double value) {
    setState(() {
      _isDragging = true;
      _dragValue = value;
    });
  }

  void _handleSeekUpdate(double value) {
    setState(() {
      _dragValue = value;
    });
  }

  void _handleSeekEnd(double value) {
    setState(() {
      _isDragging = false;
    });
    widget.onSeek?.call(value);
  }

  void _handleVolumeChange(double value) {
    widget.onVolumeChange?.call(value);
  }

  void _toggleVolumeSlider() {
    setState(() {
      _showVolumeSlider = !_showVolumeSlider;
    });
  }

  Widget _buildMainControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous button
        if (widget.items.length > 1) ...[
          _buildIconButton(
            icon: DSMediaViewerA11yHelper.buildRTLAwareIcon(
              Icons.skip_previous,
              Directionality.of(context),
              size: 32,
            ),
            onPressed: widget.currentIndex > 0 ? widget.onPrevious : null,
            tooltip: widget.a11yConfig?.previousButtonLabel ?? 'Anterior',
          ),
          const SizedBox(width: DSSpacing.lg),
        ],

        // Play/Pause button
        if (_currentItem.isPlayable) ...[
          _buildPlayPauseButton(),
          const SizedBox(width: DSSpacing.lg),
        ],

        // Next button
        if (widget.items.length > 1) ...[
          _buildIconButton(
            icon: DSMediaViewerA11yHelper.buildRTLAwareIcon(
              Icons.skip_next,
              Directionality.of(context),
              size: 32,
            ),
            onPressed: widget.currentIndex < widget.items.length - 1
                ? widget.onNext
                : null,
            tooltip: widget.a11yConfig?.nextButtonLabel ?? 'Siguiente',
          ),
        ],
      ],
    );
  }

  Widget _buildPlayPauseButton() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: DSColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: DSColors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: widget.onPlayPause,
        icon: Icon(
          widget.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: 32,
        ),
        tooltip: widget.isPlaying
            ? (widget.a11yConfig?.pauseButtonLabel ?? 'Pausar')
            : (widget.a11yConfig?.playButtonLabel ?? 'Reproducir'),
      ),
    );
  }

  Widget _buildSeekBar() {
    if (!_currentItem.isPlayable || widget.duration <= 0) {
      return const SizedBox.shrink();
    }

    final currentValue = _isDragging ? _dragValue : widget.currentPosition;
    final progress = (currentValue / widget.duration).clamp(0.0, 1.0);

    return Column(
      children: [
        // Time display
        if (widget.config?.showTimeDisplay ?? true)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatTime(currentValue),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                _formatTime(widget.duration),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),

        const SizedBox(height: DSSpacing.xs),

        // Seek slider
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            activeTrackColor: DSColors.primary,
            inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
            thumbColor: DSColors.primary,
            overlayColor: DSColors.primary.withValues(alpha: 0.2),
          ),
          child: Slider(
            value: progress,
            onChangeStart: (value) => _handleSeekStart(value * widget.duration),
            onChanged: (value) => _handleSeekUpdate(value * widget.duration),
            onChangeEnd: (value) => _handleSeekEnd(value * widget.duration),
            semanticFormatterCallback: (value) {
              final time = value * widget.duration;
              return _formatTimeForSemantics(time);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryControls() {
    return Row(
      children: [
        // Volume controls
        if (_currentItem.hasAudio) ...[
          _buildVolumeControls(),
          const SizedBox(width: DSSpacing.md),
        ],

        const Spacer(),

        // Page indicators
        if (widget.items.length > 1) ...[
          _buildPageIndicators(),
          const SizedBox(width: DSSpacing.md),
        ],

        // Info button
        if (widget.config?.showFileInfo ?? false) ...[
          _buildIconButton(
            icon: const Icon(Icons.info_outline, size: 24),
            onPressed: widget.onInfo,
            tooltip: 'Información del archivo',
          ),
          const SizedBox(width: DSSpacing.sm),
        ],

        // Fullscreen button
        if (widget.config?.showFullscreenButton ?? true) ...[
          _buildIconButton(
            icon: Icon(
              widget.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
              size: 24,
            ),
            onPressed: widget.onFullscreenToggle,
            tooltip: widget.isFullscreen
                ? 'Salir de pantalla completa'
                : (widget.a11yConfig?.fullscreenButtonLabel ?? 'Pantalla completa'),
          ),
          const SizedBox(width: DSSpacing.sm),
        ],

        // Close button
        if (widget.config?.showCloseButton ?? true) ...[
          _buildIconButton(
            icon: const Icon(Icons.close, size: 24),
            onPressed: widget.onClose,
            tooltip: widget.a11yConfig?.closeButtonLabel ?? 'Cerrar',
          ),
        ],
      ],
    );
  }

  Widget _buildVolumeControls() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconButton(
          icon: Icon(
            widget.isMuted || widget.volume == 0
                ? Icons.volume_off
                : widget.volume < 0.5
                    ? Icons.volume_down
                    : Icons.volume_up,
            size: 24,
          ),
          onPressed: () {
            _toggleVolumeSlider();
            widget.onMuteToggle?.call();
          },
          tooltip: widget.isMuted ? 'Activar sonido' : 'Silenciar',
        ),

        if (_showVolumeSlider) ...[
          const SizedBox(width: DSSpacing.sm),
          SizedBox(
            width: 80,
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                thumbColor: Colors.white,
                overlayColor: Colors.white.withValues(alpha: 0.2),
              ),
              child: Slider(
                value: widget.volume,
                onChanged: _handleVolumeChange,
                semanticFormatterCallback: (value) {
                  return '${(value * 100).round()}% de volumen';
                },
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${widget.currentIndex + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          ' / ${widget.items.length}',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required Widget icon,
    required VoidCallback? onPressed,
    required String tooltip,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: tooltip,
      color: Colors.white,
      iconSize: 24,
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 48,
      ),
    );
  }

  String _formatTime(double seconds) {
    final duration = Duration(seconds: seconds.round());
    final minutes = duration.inMinutes;
    final remainingSeconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String _formatTimeForSemantics(double seconds) {
    final duration = Duration(seconds: seconds.round());
    final minutes = duration.inMinutes;
    final remainingSeconds = duration.inSeconds % 60;

    if (minutes > 0) {
      return '$minutes minutos y $remainingSeconds segundos';
    } else {
      return '$remainingSeconds segundos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _visibilityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _visibilityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, (1 - _visibilityAnimation.value) * 20),
            child: child!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(DSSpacing.md),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Seek bar
              if ((widget.config?.showSeekBar ?? true) && _currentItem.isPlayable) ...[
                _buildSeekBar(),
                const SizedBox(height: DSSpacing.md),
              ],

              // Main controls
              _buildMainControls(),

              const SizedBox(height: DSSpacing.md),

              // Secondary controls
              _buildSecondaryControls(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _visibilityController.dispose();
    super.dispose();
  }
}

/// Widget para mostrar información detallada del archivo
class DSMediaViewerFileInfo extends StatelessWidget {
  final DSMediaItem item;
  final int index;
  final int total;
  final VoidCallback? onClose;

  const DSMediaViewerFileInfo({
    super.key,
    required this.item,
    required this.index,
    required this.total,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(DSSpacing.md),
      padding: const EdgeInsets.all(DSSpacing.md),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                item.type.isImage
                    ? Icons.image
                    : item.type.isVideo
                        ? Icons.videocam
                        : Icons.audiotrack,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: DSSpacing.sm),
              Expanded(
                child: Text(
                  '${item.type.displayName} ${index + 1} de $total',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: DSSpacing.md),

          // File info
          _buildInfoRow('Archivo', _getFileName()),
          if (item.fileExtension.isNotEmpty)
            _buildInfoRow('Formato', item.fileExtension.toUpperCase()),
          if (item.duration != null)
            _buildInfoRow('Duración', item.formattedDuration),
          if (item.dimensions != null)
            _buildInfoRow(
              'Dimensiones',
              '${item.dimensions!.width.round()} × ${item.dimensions!.height.round()}',
            ),
          if (item.aspectRatio != null)
            _buildInfoRow(
              'Ratio',
              '${item.aspectRatio!.toStringAsFixed(2)}:1',
            ),

          // Caption if available
          if (item.caption != null && item.caption!.isNotEmpty) ...[
            const SizedBox(height: DSSpacing.md),
            const Text(
              'Descripción:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: DSSpacing.xs),
            Text(
              item.caption!,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DSSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getFileName() {
    final uri = Uri.tryParse(item.src);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.last;
    }
    return item.src.split('/').last;
  }
}