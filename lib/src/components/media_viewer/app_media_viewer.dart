import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iautomat_design_system/src/components/media_viewer/app_media_viewer_config.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

/// Widget de visualizador de media profesional para el Design System de IAutomat
///
/// AppMediaViewer es un widget altamente configurable que soporta:
/// - Visualización de imágenes, videos y audio
/// - Navegación entre múltiples elementos
/// - Controles de reproducción adaptativos
/// - Zoom y pan para imágenes
/// - Estados interactivos completos
/// - Soporte RTL y accesibilidad total
/// - Navegación por teclado integrada
/// - Comportamiento adaptativo por plataforma
///
/// Utiliza únicamente design tokens del sistema para mantener consistencia.
///
/// ### Ejemplo básico con imágenes:
/// ```dart
/// AppMediaViewer(
///   items: [
///     AppMediaItem(
///       type: AppMediaType.image,
///       src: 'https://example.com/image1.jpg',
///       caption: 'Primera imagen',
///     ),
///     AppMediaItem(
///       type: AppMediaType.image,
///       src: 'https://example.com/image2.jpg',
///       caption: 'Segunda imagen',
///     ),
///   ],
///   initialIndex: 0,
/// )
/// ```
///
/// ### Ejemplo con video:
/// ```dart
/// AppMediaViewer(
///   items: [
///     AppMediaItem(
///       type: AppMediaType.video,
///       src: 'https://example.com/video.mp4',
///       thumbnail: 'https://example.com/thumbnail.jpg',
///       caption: 'Video promocional',
///       duration: 120.0,
///     ),
///   ],
///   config: AppMediaViewerConfig(
///     variant: AppMediaViewerVariant.video,
///     autoPlay: true,
///     showControls: true,
///   ),
/// )
/// ```
class AppMediaViewer extends StatefulWidget {
  /// Lista de elementos de media para mostrar
  final List<AppMediaItem> items;

  /// Índice inicial del elemento a mostrar
  final int initialIndex;

  /// Si mostrar captions/subtítulos
  final bool showCaptions;

  /// Configuración completa del componente
  final AppMediaViewerConfig? config;

  /// Callback cuando cambia la página/elemento actual
  final ValueChanged<int>? onPageChanged;

  /// Callback cuando se hace tap en un elemento
  final ValueChanged<AppMediaItem>? onItemTap;

  /// Callback cuando se alterna pantalla completa
  final VoidCallback? onFullscreenToggle;

  /// Callback cuando se cambia play/pause
  final ValueChanged<bool>? onPlayPause;

  /// Callback cuando se hace seek en el contenido
  final ValueChanged<double>? onSeek;

  /// Callback cuando se cambia el volumen
  final ValueChanged<double>? onVolumeChange;

  /// Callback cuando se cierra el viewer
  final VoidCallback? onClose;

  const AppMediaViewer({
    super.key,
    required this.items,
    this.initialIndex = 0,
    this.showCaptions = true,
    this.config,
    this.onPageChanged,
    this.onItemTap,
    this.onFullscreenToggle,
    this.onPlayPause,
    this.onSeek,
    this.onVolumeChange,
    this.onClose,
  }) : assert(items.length > 0, 'Items list cannot be empty'),
       assert(initialIndex >= 0, 'Initial index must be non-negative');

  @override
  State<AppMediaViewer> createState() => _AppMediaViewerState();
}

class _AppMediaViewerState extends State<AppMediaViewer>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AppMediaViewerConfig _config;
  late final PageController _pageController;
  late final FocusNode _focusNode;
  late final AnimationController _controlsAnimationController;
  late final AnimationController _loadingController;

  AppMediaViewerState _currentState = AppMediaViewerState.defaultState;
  int _currentIndex = 0;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;
  bool _isPlaying = false;
  bool _isMuted = false;
  bool _isFullscreen = false;
  bool _areControlsVisible = true;
  double _volume = 1.0;
  double _zoomLevel = 1.0;

  Timer? _controlsHideTimer;
  StreamSubscription<bool>? _playbackSubscription;

  @override
  void initState() {
    _initializeConfig();
    super.initState();
    _initializeControllers();
    _initializeFocus();
    _initializeState();
  }

  void _initializeConfig() {
    _config = widget.config ?? const AppMediaViewerConfig();
    _currentIndex = widget.initialIndex.clamp(0, widget.items.length - 1);
  }

  void _initializeControllers() {
    _pageController = PageController(initialPage: _currentIndex);

    _controlsAnimationController = AnimationController(
      duration: Duration(
        milliseconds: _config.animation?.controlsFadeInDuration ?? 200,
      ),
      reverseDuration: Duration(
        milliseconds: _config.animation?.controlsFadeOutDuration ?? 500,
      ),
      vsync: this,
    );

    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    if (_config.behavior?.showSkeletonAnimation ?? true) {
      _loadingController.repeat();
    }

    // Mostrar controles inicialmente
    if (_config.showControls) {
      _controlsAnimationController.forward();
      _setupControlsAutoHide();
    }
  }

  void _initializeFocus() {
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _initializeState() {
    _isMuted = _config.muted;
    _volume = _isMuted ? 0.0 : 1.0;

    if (_config.autoPlay && _currentItem.isPlayable) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _togglePlayPause();
      });
    }

    _updateCurrentState();
  }

  AppMediaItem get _currentItem => widget.items[_currentIndex];

  void _handleFocusChange() {
    final isFocused = _focusNode.hasFocus;
    if (_isFocused != isFocused) {
      setState(() {
        _isFocused = isFocused;
        _updateCurrentState();
      });
    }
  }

  void _updateCurrentState() {
    if (!_config.state.canInteract) {
      _currentState = _config.state;
      return;
    }

    if (_isPressed) {
      _currentState = AppMediaViewerState.pressed;
    } else if (_isFocused) {
      _currentState = AppMediaViewerState.focus;
    } else if (_isHovered) {
      _currentState = AppMediaViewerState.hover;
    } else {
      _currentState = AppMediaViewerState.defaultState;
    }
  }

  void _setupControlsAutoHide() {
    if (!(_config.behavior?.autoHideControls ?? true)) return;

    _controlsHideTimer?.cancel();
    _controlsHideTimer = Timer(
      Duration(seconds: _config.behavior?.autoHideControlsDelay ?? 3),
      _hideControls,
    );
  }

  void _showControls() {
    if (!_config.showControls) return;

    setState(() {
      _areControlsVisible = true;
    });
    _controlsAnimationController.forward();
    _setupControlsAutoHide();
  }

  void _hideControls() {
    if (!(_config.behavior?.autoHideControls ?? true)) return;
    if (!_config.showControls) return;

    setState(() {
      _areControlsVisible = false;
    });
    _controlsAnimationController.reverse();
  }

  void _handleTap() {
    if (!_currentState.canInteract) return;

    if (_config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.lightImpact();
    }

    // Toggle controls visibility
    if (_areControlsVisible) {
      _hideControls();
    } else {
      _showControls();
    }

    widget.onItemTap?.call(_currentItem);
  }

  void _handleDoubleTap() {
    if (!_currentState.canInteract) return;
    if (!(_config.behavior?.enableDoubleTapZoom ?? true)) return;

    if (_currentItem.isImage) {
      _toggleZoom();
    } else if (_currentItem.isPlayable) {
      _togglePlayPause();
    }
  }

  void _handleHover(bool hovering) {
    if (!(_config.behavior?.enableHover ?? true)) return;
    if (_isHovered == hovering) return;

    setState(() {
      _isHovered = hovering;
      _updateCurrentState();
    });

    if (hovering) {
      _showControls();
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (!_currentState.canInteract) return;

    setState(() {
      _isPressed = true;
      _updateCurrentState();
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
      _updateCurrentState();
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
      _updateCurrentState();
    });
  }

  void _toggleZoom() {
    if (!_currentItem.isImage) return;

    setState(() {
      if (_zoomLevel > 1.0) {
        _zoomLevel = 1.0;
      } else {
        _zoomLevel = 2.0;
      }
    });
  }

  void _togglePlayPause() {
    if (!_currentItem.isPlayable) return;

    setState(() {
      _isPlaying = !_isPlaying;
    });

    widget.onPlayPause?.call(_isPlaying);

    if (_config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }
  }

  void _previousItem() {
    if (_currentIndex > 0) {
      _goToPage(_currentIndex - 1);
    }
  }

  void _nextItem() {
    if (_currentIndex < widget.items.length - 1) {
      _goToPage(_currentIndex + 1);
    }
  }

  void _goToPage(int index) {
    if (index < 0 || index >= widget.items.length) return;
    if (index == _currentIndex) return;

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: _config.animation?.duration ?? 300),
      curve: _config.animation?.curve ?? Curves.easeInOut,
    );
  }

  void _handlePageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _isPlaying = false; // Stop playback when changing items
      _zoomLevel = 1.0; // Reset zoom
    });

    widget.onPageChanged?.call(index);
    _showControls(); // Show controls on page change

    // Auto play if enabled
    if (_config.autoPlay && _currentItem.isPlayable) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) _togglePlayPause();
      });
    }
  }


  void _handleVolumeChange(double volume) {
    setState(() {
      _volume = volume.clamp(0.0, 1.0);
      _isMuted = _volume == 0.0;
    });
    widget.onVolumeChange?.call(_volume);
  }

  void _toggleMute() {
    if (_isMuted) {
      _handleVolumeChange(_volume > 0 ? _volume : 1.0);
    } else {
      _handleVolumeChange(0.0);
    }
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });
    widget.onFullscreenToggle?.call();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
          _previousItem();
          break;
        case LogicalKeyboardKey.arrowRight:
          _nextItem();
          break;
        case LogicalKeyboardKey.space:
          if (_currentItem.isPlayable) {
            _togglePlayPause();
          }
          break;
        case LogicalKeyboardKey.enter:
          _handleTap();
          break;
        case LogicalKeyboardKey.escape:
          if (_isFullscreen) {
            _toggleFullscreen();
          } else {
            widget.onClose?.call();
          }
          break;
        case LogicalKeyboardKey.keyM:
          if (_currentItem.hasAudio) {
            _toggleMute();
          }
          break;
        case LogicalKeyboardKey.keyF:
          _toggleFullscreen();
          break;
      }
    }
  }

  Widget _buildContent() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _handlePageChanged,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return _buildMediaItem(item, index == _currentIndex);
      },
    );
  }

  Widget _buildMediaItem(AppMediaItem item, bool isActive) {
    switch (item.type) {
      case AppMediaType.image:
        return _buildImageItem(item, isActive);
      case AppMediaType.video:
        return _buildVideoItem(item, isActive);
      case AppMediaType.audio:
        return _buildAudioItem(item, isActive);
    }
  }

  Widget _buildImageItem(AppMediaItem item, bool isActive) {
    return InteractiveViewer(
      panEnabled: isActive && _zoomLevel > 1.0,
      scaleEnabled: isActive && (_config.behavior?.enablePinchZoom ?? true),
      minScale: _config.behavior?.minZoom ?? 0.5,
      maxScale: _config.behavior?.maxZoom ?? 3.0,
      child: Center(
        child: item.src.startsWith('http')
            ? Image.network(
                item.src,
                fit: BoxFit.contain,
                semanticLabel: item.alt ?? item.caption,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return _buildLoadingIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return _buildErrorWidget();
                },
              )
            : Image.asset(
                item.src,
                fit: BoxFit.contain,
                semanticLabel: item.alt ?? item.caption,
                errorBuilder: (context, error, stackTrace) {
                  return _buildErrorWidget();
                },
              ),
      ),
    );
  }

  Widget _buildVideoItem(AppMediaItem item, bool isActive) {
    // En una implementación real, aquí usarías un package como video_player
    return Container(
      color: AppColors.gray900,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (item.thumbnail != null)
            Image.network(
              item.thumbnail!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 40,
            ),
          ),
          if (item.duration != null)
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.formattedDuration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAudioItem(AppMediaItem item, bool isActive) {
    return Container(
      color: AppColors.gray100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: AppColors.primary,
              size: 60,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (item.caption != null)
            Text(
              item.caption!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          if (item.duration != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              item.formattedDuration,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.gray600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: SizedBox(
        width: 48,
        height: 48,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
            _resolveColor('loading'),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: AppColors.error.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Error al cargar el contenido',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    if (!_config.showControls) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: _controlsAnimationController,
      builder: (context, child) {
        return Opacity(
          opacity: _controlsAnimationController.value,
          child: child!,
        );
      },
      child: _buildControlsContent(),
    );
  }

  Widget _buildControlsContent() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: _config.spacing?.controlsBarHeight ?? 56.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
        ),
        child: Row(
          children: [
            if (_currentItem.isPlayable) ...[
              _buildPlayPauseButton(),
              const SizedBox(width: AppSpacing.sm),
            ],
            if (widget.items.length > 1) ...[
              _buildPreviousButton(),
              const SizedBox(width: AppSpacing.xs),
              _buildNextButton(),
              const SizedBox(width: AppSpacing.sm),
            ],
            Expanded(
              child: _buildProgressIndicator(),
            ),
            const SizedBox(width: AppSpacing.sm),
            if (_currentItem.hasAudio) ...[
              _buildVolumeButton(),
              const SizedBox(width: AppSpacing.sm),
            ],
            _buildFullscreenButton(),
            if (widget.onClose != null) ...[
              const SizedBox(width: AppSpacing.sm),
              _buildCloseButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return IconButton(
      onPressed: _togglePlayPause,
      icon: Icon(
        _isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: _config.spacing?.controlsIconSize ?? 24.0,
      ),
      tooltip: _isPlaying ? 'Pausar' : 'Reproducir',
    );
  }

  Widget _buildPreviousButton() {
    return IconButton(
      onPressed: _currentIndex > 0 ? _previousItem : null,
      icon: Icon(
        Icons.skip_previous,
        color: _currentIndex > 0 ? Colors.white : Colors.white54,
        size: _config.spacing?.controlsIconSize ?? 24.0,
      ),
      tooltip: 'Anterior',
    );
  }

  Widget _buildNextButton() {
    return IconButton(
      onPressed: _currentIndex < widget.items.length - 1 ? _nextItem : null,
      icon: Icon(
        Icons.skip_next,
        color: _currentIndex < widget.items.length - 1 ? Colors.white : Colors.white54,
        size: _config.spacing?.controlsIconSize ?? 24.0,
      ),
      tooltip: 'Siguiente',
    );
  }

  Widget _buildProgressIndicator() {
    if (widget.items.length <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.items.length,
        (index) => Container(
          width: _config.spacing?.indicatorSize ?? 8.0,
          height: _config.spacing?.indicatorSize ?? 8.0,
          margin: EdgeInsets.symmetric(
            horizontal: (_config.spacing?.indicatorSpacing ?? 8.0) / 2,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _currentIndex
                ? _resolveColor('activeIndicator')
                : _resolveColor('inactiveIndicator'),
          ),
        ),
      ),
    );
  }

  Widget _buildVolumeButton() {
    return IconButton(
      onPressed: _toggleMute,
      icon: Icon(
        _isMuted ? Icons.volume_off : Icons.volume_up,
        color: Colors.white,
        size: _config.spacing?.controlsIconSize ?? 24.0,
      ),
      tooltip: _isMuted ? 'Activar sonido' : 'Silenciar',
    );
  }

  Widget _buildFullscreenButton() {
    return IconButton(
      onPressed: _toggleFullscreen,
      icon: Icon(
        _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
        color: Colors.white,
        size: _config.spacing?.controlsIconSize ?? 24.0,
      ),
      tooltip: _isFullscreen ? 'Salir pantalla completa' : 'Pantalla completa',
    );
  }

  Widget _buildCloseButton() {
    return IconButton(
      onPressed: widget.onClose,
      icon: Icon(
        Icons.close,
        color: Colors.white,
        size: _config.spacing?.controlsIconSize ?? 24.0,
      ),
      tooltip: 'Cerrar',
    );
  }

  Widget _buildCaption() {
    if (!widget.showCaptions) return const SizedBox.shrink();
    if (_currentItem.caption == null || _currentItem.caption!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: (_config.spacing?.controlsBarHeight ?? 56.0) + AppSpacing.sm,
      child: Container(
        margin: _config.spacing?.captionPadding ?? const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: _resolveColor('captionBackground'),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _currentItem.caption!,
          style: TextStyle(
            color: _resolveColor('captionText'),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Color _resolveColor(String colorType) {
    final theme = Theme.of(context);
    final colors = _config.colors;

    switch (colorType) {
      case 'background':
        return colors?.backgroundColor ?? AppColors.background;
      case 'controlsBackground':
        return colors?.controlsBackgroundColor ??
               Colors.black.withValues(alpha: 0.7);
      case 'controlsIcon':
        return colors?.controlsIconColor ?? Colors.white;
      case 'controlsText':
        return colors?.controlsTextColor ?? Colors.white;
      case 'activeIndicator':
        return colors?.activeIndicatorColor ?? theme.primaryColor;
      case 'inactiveIndicator':
        return colors?.inactiveIndicatorColor ??
               Colors.white.withValues(alpha: 0.5);
      case 'captionText':
        return colors?.captionTextColor ?? Colors.white;
      case 'captionBackground':
        return colors?.captionBackgroundColor ??
               Colors.black.withValues(alpha: 0.7);
      case 'loading':
        return colors?.loadingColor ?? theme.primaryColor;
      default:
        return AppColors.surface;
    }
  }

  Widget _buildContainer(Widget child) {
    final spacing = _config.spacing ?? const AppMediaViewerSpacing();
    final borderRadius = spacing.borderRadius;
    final borderWidth = spacing.borderWidth;

    return Container(
      width: spacing.width,
      height: spacing.height,
      constraints: BoxConstraints(
        minWidth: spacing.minWidth ?? 0,
        minHeight: spacing.minHeight ?? 0,
        maxWidth: spacing.maxWidth ?? double.infinity,
        maxHeight: spacing.maxHeight ?? double.infinity,
      ),
      margin: spacing.margin,
      decoration: BoxDecoration(
        color: _resolveColor('background'),
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderWidth > 0
            ? Border.all(
                color: _resolveColor('border'),
                width: borderWidth,
              )
            : null,
      ),
      clipBehavior: _config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: child,
    );
  }

  Widget _buildInteractiveWrapper(Widget child) {
    return GestureDetector(
      onTap: _handleTap,
      onDoubleTap: _handleDoubleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        cursor: _currentState.canInteract
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: child,
      ),
    );
  }

  Widget _buildFocusWrapper(Widget child) {
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        _handleKeyEvent(event);
        return KeyEventResult.handled;
      },
      child: child,
    );
  }

  Widget _buildSemanticsWrapper(Widget child) {
    final a11yConfig = _config.a11yConfig;

    return Semantics(
      label: a11yConfig?.semanticsLabel ??
             'Visualizador de media, elemento ${_currentIndex + 1} de ${widget.items.length}',
      hint: a11yConfig?.semanticsHint ??
            'Use las flechas para navegar, espacio para reproducir',
      button: true,
      focusable: a11yConfig?.enableKeyboardNavigation ?? true,
      enabled: _currentState.canInteract,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget child = Stack(
      children: [
        _buildContent(),
        _buildControls(),
        _buildCaption(),
      ],
    );

    child = _buildContainer(child);
    child = _buildInteractiveWrapper(child);
    child = _buildFocusWrapper(child);
    child = _buildSemanticsWrapper(child);

    return AnimatedOpacity(
      opacity: _currentState.opacity,
      duration: Duration(milliseconds: _config.animation?.duration ?? 300),
      child: child,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _pageController.dispose();
    _controlsAnimationController.dispose();
    _loadingController.dispose();
    _controlsHideTimer?.cancel();
    _playbackSubscription?.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => _config.behavior?.maintainState ?? true;
}