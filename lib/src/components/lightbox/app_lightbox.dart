import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'app_lightbox_config.dart';

class DSLightbox extends StatefulWidget {
  final DSLightboxConfig config;
  final List<DSLightboxImage> images;
  final VoidCallback? onClose;
  final ValueChanged<int>? onIndexChanged;
  final ValueChanged<DSLightboxState>? onStateChanged;

  const DSLightbox({
    super.key,
    required this.images,
    this.config = const DSLightboxConfig(),
    this.onClose,
    this.onIndexChanged,
    this.onStateChanged,
  });

  @override
  State<DSLightbox> createState() => _DSLightboxState();
}

class _DSLightboxState extends State<DSLightbox>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _controlsController;
  late TransformationController _transformationController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _controlsAnimation;

  int _currentIndex = 0;
  double _currentScale = 1.0;
  bool _areControlsVisible = true;
  final Set<String> _hoveredControls = {};
  final Set<String> _focusedControls = {};
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.config.initialIndex.clamp(0, widget.images.length - 1);
    _pageController = PageController(initialPage: _currentIndex);
    _transformationController = TransformationController();

    _initializeAnimations();
    _setupControllers();
    _setupKeyboardSupport();
    _startAutoHideTimer();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: widget.config.animation?.fadeInDuration ??
                 widget.config.animationDuration,
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: widget.config.animation?.zoomTransitionDuration ??
                Duration(milliseconds: 150),
      vsync: this,
    );

    _controlsController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: widget.config.animation?.fadeInCurve ?? Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: widget.config.animation?.zoomTransitionCurve ?? Curves.easeInOut,
      ),
    );

    _controlsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controlsController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeController.forward();
    _scaleController.forward();
    _controlsController.forward();
  }

  void _setupControllers() {
    _transformationController.addListener(() {
      final scale = _transformationController.value.getMaxScaleOnAxis();
      if (scale != _currentScale) {
        setState(() {
          _currentScale = scale;
        });
      }
    });
  }

  void _setupKeyboardSupport() {
    if (widget.config.enableKeyboardSupport) {
      _focusNode = widget.config.accessibility?.focusNode ?? FocusNode();
    }
  }

  void _startAutoHideTimer() {
    if (widget.config.controls?.autoHideControls ?? true) {
      Future.delayed(
        widget.config.controls?.autoHideDelay ?? Duration(seconds: 3),
        () {
          if (mounted && _areControlsVisible) {
            _hideControls();
          }
        },
      );
    }
  }

  void _showControls() {
    if (!_areControlsVisible) {
      setState(() {
        _areControlsVisible = true;
      });
      _controlsController.forward();
    }
  }

  void _hideControls() {
    if (_areControlsVisible) {
      setState(() {
        _areControlsVisible = false;
      });
      _controlsController.reverse();
    }
  }

  void _toggleControls() {
    if (_areControlsVisible) {
      _hideControls();
    } else {
      _showControls();
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _controlsController.dispose();
    _transformationController.dispose();
    _pageController.dispose();
    if (widget.config.accessibility?.focusNode == null) {
      _focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.config.state == DSLightboxState.loading) {
      return _buildLoadingState(context, theme);
    }

    if (widget.config.state == DSLightboxState.skeleton) {
      return _buildSkeletonState(context, theme);
    }

    Widget lightbox = _buildLightbox(context, theme);

    if (widget.config.enableKeyboardSupport && _focusNode != null) {
      lightbox = Focus(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: _handleKeyEvent,
        child: lightbox,
      );
    }

    if (widget.config.enableA11y) {
      lightbox = Semantics(
        label: widget.config.accessibility?.semanticLabel ?? 'Lightbox',
        explicitChildNodes: true,
        child: lightbox,
      );
    }

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: lightbox,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLightbox(BuildContext context, ThemeData theme) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: _getBackgroundColor(theme),
        child: Stack(
          children: [
            _buildImageContainer(context, theme),
            if (widget.config.controls?.showCloseButton ?? true)
              _buildCloseButton(context, theme),
            if (widget.config.controls?.showCounter ?? true)
              _buildCounter(context, theme),
            if (widget.config.variant == DSLightboxVariant.gallery)
              ..._buildGalleryControls(context, theme),
            if (widget.config.enableThumbnails &&
                widget.config.variant == DSLightboxVariant.gallery)
              _buildThumbnails(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, ThemeData theme) {
    return GestureDetector(
      onTap: widget.config.enabledGestures.contains(DSLightboxGesture.tap)
        ? _toggleControls
        : null,
      onDoubleTap: widget.config.enabledGestures.contains(DSLightboxGesture.doubleTap)
        ? _handleDoubleTap
        : null,
      child: Center(
        child: widget.config.variant == DSLightboxVariant.zoom
          ? _buildZoomableImage(context, theme)
          : _buildGalleryView(context, theme),
      ),
    );
  }

  Widget _buildZoomableImage(BuildContext context, ThemeData theme) {
    final currentImage = widget.images[_currentIndex];

    return InteractiveViewer(
      transformationController: _transformationController,
      minScale: widget.config.minZoom,
      maxScale: widget.config.maxZoom,
      // enablePanAlways: widget.config.enabledGestures.contains(DSLightboxGesture.pan), // Deprecated parameter
      onInteractionUpdate: (details) {
        _showControls();
        _startAutoHideTimer();
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: _buildImageWidget(currentImage, theme),
      ),
    );
  }

  Widget _buildGalleryView(BuildContext context, ThemeData theme) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _handlePageChanged,
        physics: widget.config.enabledGestures.contains(DSLightboxGesture.swipe)
          ? const PageScrollPhysics()
          : const NeverScrollableScrollPhysics(),
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          final image = widget.images[index];
          return Container(
            padding: widget.config.spacing?.padding ?? EdgeInsets.all(16.0),
            child: Center(
              child: _buildImageWidget(image, theme),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageWidget(DSLightboxImage imageConfig, ThemeData theme) {
    if (imageConfig.isLoading) {
      return _buildImagePlaceholder(theme);
    }

    if (imageConfig.hasError) {
      return imageConfig.errorWidget ?? _buildImageError(theme);
    }

    Widget image = Image(
      image: imageConfig.imageProvider,
      fit: imageConfig.fit,
      semanticLabel: imageConfig.alt,
      errorBuilder: (context, error, stackTrace) {
        return imageConfig.errorWidget ?? _buildImageError(theme);
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return imageConfig.placeholder ?? _buildImagePlaceholder(theme);
      },
    );

    if (imageConfig.title != null || imageConfig.description != null) {
      image = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: image),
          if (imageConfig.title != null || imageConfig.description != null)
            _buildImageInfo(imageConfig, theme),
        ],
      );
    }

    return image;
  }

  Widget _buildImageInfo(DSLightboxImage imageConfig, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _getOverlayColor(theme).withValues(alpha:0.8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageConfig.title != null)
            Text(
              imageConfig.title!,
              style: theme.textTheme.titleMedium?.copyWith(
                color: _getTextColor(theme),
                fontWeight: FontWeight.w600,
              ),
            ),
          if (imageConfig.description != null) ...[
            if (imageConfig.title != null) SizedBox(height: 4),
            Text(
              imageConfig.description!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _getTextColor(theme).withValues(alpha:0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(ThemeData theme) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        minHeight: 200,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: _getLoadingColor(theme),
        ),
      ),
    );
  }

  Widget _buildImageError(ThemeData theme) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        minHeight: 200,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: _getErrorColor(theme),
            ),
            SizedBox(height: 8),
            Text(
              'Error al cargar imagen',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _getErrorColor(theme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context, ThemeData theme) {
    return AnimatedBuilder(
      animation: _controlsAnimation,
      builder: (context, child) {
        return Positioned(
          top: 16 + MediaQuery.of(context).padding.top,
          right: 16,
          child: Opacity(
            opacity: _controlsAnimation.value,
            child: Material(
              color: Colors.transparent,
              child: _buildControlButton(
                'close',
                widget.config.controls?.customCloseButton ??
                Icon(Icons.close, color: _getIconColor(theme)),
                widget.config.accessibility?.closeButtonLabel ?? 'Close lightbox',
                _handleClose,
                theme,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCounter(BuildContext context, ThemeData theme) {
    if (widget.images.length <= 1) return SizedBox.shrink();

    return AnimatedBuilder(
      animation: _controlsAnimation,
      builder: (context, child) {
        return Positioned(
          bottom: 16,
          left: 16,
          child: Opacity(
            opacity: _controlsAnimation.value,
            child: Container(
              padding: widget.config.spacing?.counterPadding ??
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: _getControlsColor(theme),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                '${_currentIndex + 1} / ${widget.images.length}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _getCounterColor(theme),
                  fontWeight: FontWeight.w500,
                ),
                semanticsLabel: (widget.config.accessibility?.counterLabel)
                    ?.replaceFirst('{}', '${_currentIndex + 1}')
                    .replaceFirst('{}', '${widget.images.length}'),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildGalleryControls(BuildContext context, ThemeData theme) {
    if (widget.images.length <= 1) return [];

    return [
      // Previous button
      AnimatedBuilder(
        animation: _controlsAnimation,
        builder: (context, child) {
          return Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: _controlsAnimation.value,
              child: Center(
                child: _buildControlButton(
                  'previous',
                  widget.config.controls?.customPreviousButton ??
                  Icon(Icons.chevron_left, size: 32, color: _getIconColor(theme)),
                  widget.config.accessibility?.previousButtonLabel ?? 'Previous image',
                  _handlePrevious,
                  theme,
                ),
              ),
            ),
          );
        },
      ),
      // Next button
      AnimatedBuilder(
        animation: _controlsAnimation,
        builder: (context, child) {
          return Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: _controlsAnimation.value,
              child: Center(
                child: _buildControlButton(
                  'next',
                  widget.config.controls?.customNextButton ??
                  Icon(Icons.chevron_right, size: 32, color: _getIconColor(theme)),
                  widget.config.accessibility?.nextButtonLabel ?? 'Next image',
                  _handleNext,
                  theme,
                ),
              ),
            ),
          );
        },
      ),
    ];
  }

  Widget _buildThumbnails(BuildContext context, ThemeData theme) {
    return AnimatedBuilder(
      animation: _controlsAnimation,
      builder: (context, child) {
        return Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: _controlsAnimation.value,
            child: SizedBox(
              height: widget.config.spacing?.thumbnailHeight ?? 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: widget.images.length,
                separatorBuilder: (context, index) => SizedBox(
                  width: widget.config.spacing?.thumbnailSpacing ?? 8.0,
                ),
                itemBuilder: (context, index) {
                  return _buildThumbnail(index, theme);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildThumbnail(int index, ThemeData theme) {
    final isSelected = index == _currentIndex;
    final image = widget.images[index];

    return GestureDetector(
      onTap: () => _handleThumbnailTap(index),
      child: Container(
        width: widget.config.spacing?.thumbnailSize ?? 60.0,
        height: widget.config.spacing?.thumbnailHeight ?? 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
              ? _getSelectedThumbnailBorderColor(theme)
              : _getThumbnailBorderColor(theme),
            width: isSelected ? 3.0 : 1.0,
          ),
          borderRadius: widget.config.spacing?.thumbnailBorderRadius ??
                         BorderRadius.all(Radius.circular(8.0)),
        ),
        child: ClipRRect(
          borderRadius: widget.config.spacing?.thumbnailBorderRadius ??
                         BorderRadius.all(Radius.circular(8.0)),
          child: Image(
            image: image.imageProvider,
            fit: BoxFit.cover,
            semanticLabel: (widget.config.accessibility?.thumbnailLabel)
                ?.replaceFirst('{}', '${index + 1}'),
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton(
    String id,
    Widget icon,
    String semanticLabel,
    VoidCallback onPressed,
    ThemeData theme,
  ) {
    final isHovered = _hoveredControls.contains(id);
    final isFocused = _focusedControls.contains(id);

    return MouseRegion(
      onEnter: (_) => _handleControlHover(id, true),
      onExit: (_) => _handleControlHover(id, false),
      child: Focus(
        onFocusChange: (focused) => _handleControlFocus(id, focused),
        child: Material(
          color: Colors.transparent,
          shape: CircleBorder(),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: onPressed,
            child: Container(
              width: widget.config.spacing?.closeButtonSize ?? 48.0,
              height: widget.config.spacing?.closeButtonSize ?? 48.0,
              decoration: BoxDecoration(
                color: _getControlsColor(theme).withValues(alpha:
                  isHovered ? 0.9 : (isFocused ? 0.8 : 0.7),
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _getShadowColor(theme),
                    blurRadius: 8.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(child: icon),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context, ThemeData theme) {
    return Container(
      color: _getBackgroundColor(theme),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: _getLoadingColor(theme),
            ),
            SizedBox(height: 16),
            Text(
              'Cargando imágenes...',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: _getTextColor(theme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context, ThemeData theme) {
    return Container(
      color: _getBackgroundColor(theme),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha:0.3),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  // Event Handlers
  void _handleClose() {
    _fadeController.reverse().then((_) {
      widget.onClose?.call();
    });
  }

  void _handleDoubleTap() {
    if (widget.config.variant == DSLightboxVariant.zoom) {
      final currentScale = _transformationController.value.getMaxScaleOnAxis();
      final targetScale = currentScale > 1.1 ? 1.0 : 2.0;

      _transformationController.value = Matrix4.identity() * Matrix4.diagonal3Values(targetScale, targetScale, 1.0);
    }
  }

  void _handlePageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onIndexChanged?.call(index);

    if (widget.config.accessibility?.announceImageChanges ?? true) {
      // Announce image change for screen readers
      SemanticsService.announce(
        'Imagen ${index + 1} de ${widget.images.length}',
        TextDirection.ltr,
      );
    }
  }

  void _handlePrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: widget.config.animationDuration,
        curve: widget.config.animationCurve,
      );
    }
  }

  void _handleNext() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: widget.config.animationDuration,
        curve: widget.config.animationCurve,
      );
    }
  }

  void _handleThumbnailTap(int index) {
    if (index != _currentIndex) {
      _pageController.animateToPage(
        index,
        duration: widget.config.animationDuration,
        curve: widget.config.animationCurve,
      );
    }
  }

  void _handleControlHover(String id, bool isHovering) {
    setState(() {
      if (isHovering) {
        _hoveredControls.add(id);
      } else {
        _hoveredControls.remove(id);
      }
    });

    if (isHovering) {
      _showControls();
    }
  }

  void _handleControlFocus(String id, bool isFocused) {
    setState(() {
      if (isFocused) {
        _focusedControls.add(id);
      } else {
        _focusedControls.remove(id);
      }
    });
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (widget.config.state == DSLightboxState.disabled) {
      return KeyEventResult.ignored;
    }

    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }

    switch (event.logicalKey) {
      case LogicalKeyboardKey.escape:
        _handleClose();
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowLeft:
        if (widget.config.variant == DSLightboxVariant.gallery) {
          _handlePrevious();
          return KeyEventResult.handled;
        }
        break;

      case LogicalKeyboardKey.arrowRight:
        if (widget.config.variant == DSLightboxVariant.gallery) {
          _handleNext();
          return KeyEventResult.handled;
        }
        break;

      case LogicalKeyboardKey.space:
        _toggleControls();
        return KeyEventResult.handled;

      case LogicalKeyboardKey.enter:
        _toggleControls();
        return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  // Theme helpers
  Color _getBackgroundColor(ThemeData theme) {
    return widget.config.colors?.backgroundColor ??
           Colors.black.withValues(alpha:0.9);
  }

  Color _getOverlayColor(ThemeData theme) {
    return widget.config.colors?.overlayColor ??
           Colors.black.withValues(alpha:0.7);
  }

  Color _getControlsColor(ThemeData theme) {
    return widget.config.colors?.controlsColor ??
           theme.colorScheme.surface;
  }

  Color _getIconColor(ThemeData theme) {
    return widget.config.colors?.iconColor ??
           theme.colorScheme.onSurface;
  }

  Color _getTextColor(ThemeData theme) {
    return widget.config.colors?.textColor ??
           Colors.white;
  }

  Color _getThumbnailBorderColor(ThemeData theme) {
    return widget.config.colors?.thumbnailBorderColor ??
           Colors.white.withValues(alpha:0.3);
  }

  Color _getSelectedThumbnailBorderColor(ThemeData theme) {
    return widget.config.colors?.selectedThumbnailBorderColor ??
           theme.colorScheme.primary;
  }

  Color _getLoadingColor(ThemeData theme) {
    return widget.config.colors?.loadingColor ??
           theme.colorScheme.primary;
  }

  Color _getErrorColor(ThemeData theme) {
    return widget.config.colors?.errorColor ??
           theme.colorScheme.error;
  }

  Color _getShadowColor(ThemeData theme) {
    return widget.config.colors?.shadowColor ??
           Colors.black.withValues(alpha:0.2);
  }


  Color _getCounterColor(ThemeData theme) {
    return widget.config.colors?.counterColor ??
           Colors.white;
  }
}