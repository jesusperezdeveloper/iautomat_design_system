import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iautomat_design_system/src/components/image/app_image_config.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

/// Widget de imagen profesional para el Design System de IAutomat
///
/// AppImage es un widget de imagen altamente configurable que soporta:
/// - Carga lazy y responsiva
/// - Estados interactivos (hover, pressed, focus, disabled, loading, skeleton)
/// - Soporte completo para RTL y accesibilidad
/// - Comportamiento adaptativo por plataforma
/// - Navegación por teclado integrada
/// - Animaciones y transiciones suaves
/// - Caché inteligente de imágenes
/// - Compresión automática
///
/// Utiliza únicamente design tokens del sistema para mantener consistencia.
///
/// ### Ejemplo básico:
/// ```dart
/// AppImage(
///   src: 'https://example.com/image.jpg',
///   alt: 'Descripción de la imagen',
///   width: 200,
///   height: 150,
/// )
/// ```
///
/// ### Ejemplo con configuración avanzada:
/// ```dart
/// AppImage(
///   src: 'assets/images/hero.jpg',
///   alt: 'Imagen hero de la aplicación',
///   variant: AppImageVariant.lazy,
///   fit: BoxFit.cover,
///   ratio: 16/9,
///   config: AppImageConfig(
///     behavior: AppImageBehavior(
///       enableCache: true,
///       enableCompression: true,
///     ),
///     responsiveConfig: AppImageResponsiveConfig(
///       mobile: AppImageBreakpointConfig(width: 300),
///       desktop: AppImageBreakpointConfig(width: 600),
///     ),
///   ),
///   onTap: () => print('Imagen tapped'),
/// )
/// ```
class AppImage extends StatefulWidget {
  /// URL o path de la imagen (requerido)
  final String src;

  /// Texto alternativo para accesibilidad
  final String alt;

  /// Cómo debe ajustarse la imagen al container
  final BoxFit fit;

  /// Ratio de aspecto (ancho/alto)
  final double? ratio;

  /// Widget placeholder mientras carga
  final Widget? placeholder;

  /// Ancho del componente
  final double? width;

  /// Alto del componente
  final double? height;

  /// Configuración completa del componente
  final AppImageConfig? config;

  /// Callback al hacer tap
  final VoidCallback? onTap;

  /// Callback al hacer long press
  final VoidCallback? onLongPress;

  /// Callback cuando cambia hover state
  final ValueChanged<bool>? onHover;

  /// Callback cuando cambia focus state
  final ValueChanged<bool>? onFocusChange;

  /// Callback cuando la imagen termina de cargar
  final VoidCallback? onLoad;

  /// Callback cuando ocurre un error
  final VoidCallback? onError;

  const AppImage({
    super.key,
    required this.src,
    this.alt = '',
    this.fit = BoxFit.cover,
    this.ratio,
    this.placeholder,
    this.width,
    this.height,
    this.config,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.onLoad,
    this.onError,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AppImageConfig _config;
  late final FocusNode _focusNode;
  late final AnimationController _animationController;
  late final AnimationController _loadingController;

  AppImageState _currentState = AppImageState.skeleton;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;
  bool _isLoaded = false;
  bool _hasError = false;
  bool _isInViewport = false;

  StreamSubscription<bool>? _visibilitySubscription;

  @override
  void initState() {
    _initializeConfig();
    super.initState();
    _initializeFocus();
    _initializeAnimations();
    _initializeImage();
  }

  void _initializeConfig() {
    _config = widget.config ?? const AppImageConfig(src: '');
  }

  void _initializeFocus() {
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: _config.animation?.duration ?? 300),
      vsync: this,
    );

    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    if (_config.behavior?.showSkeletonAnimation ?? true) {
      _loadingController.repeat();
    }
  }

  void _initializeImage() {
    if (_config.variant.isLazy) {
      _setupLazyLoading();
    } else {
      _startImageLoad();
    }
  }

  void _setupLazyLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;
      final viewport = MediaQuery.of(context).size;
      final threshold = _config.lazyConfig?.threshold ?? 200.0;

      final isVisible = position.dy < viewport.height + threshold &&
          position.dy + size.height > -threshold;

      if (isVisible && !_isInViewport) {
        _isInViewport = true;
        _startImageLoad();
      }
    }
  }

  void _startImageLoad() {
    if (_isLoaded || _hasError) return;

    setState(() {
      _currentState = AppImageState.loading;
    });

    _loadingController.forward();
  }

  void _handleFocusChange() {
    final isFocused = _focusNode.hasFocus;
    if (_isFocused != isFocused) {
      setState(() {
        _isFocused = isFocused;
        _updateCurrentState();
      });
      widget.onFocusChange?.call(isFocused);
    }
  }

  void _updateCurrentState() {
    if (!_config.state.canInteract) {
      _currentState = _config.state;
      return;
    }

    if (_hasError) {
      _currentState = AppImageState.defaultState;
    } else if (!_isLoaded && _config.variant.isLazy && !_isInViewport) {
      _currentState = AppImageState.skeleton;
    } else if (!_isLoaded) {
      _currentState = AppImageState.loading;
    } else if (_isPressed) {
      _currentState = AppImageState.pressed;
    } else if (_isFocused) {
      _currentState = AppImageState.focus;
    } else if (_isHovered) {
      _currentState = AppImageState.hover;
    } else {
      _currentState = AppImageState.defaultState;
    }
  }

  void _handleTap() {
    if (!_currentState.canInteract) return;

    if (_config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.lightImpact();
    }

    widget.onTap?.call();
  }

  void _handleLongPress() {
    if (!_currentState.canInteract) return;

    if (_config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.mediumImpact();
    }

    widget.onLongPress?.call();
  }

  void _handleHover(bool hovering) {
    if (!(_config.behavior?.enableHover ?? true)) return;
    if (_isHovered == hovering) return;

    setState(() {
      _isHovered = hovering;
      _updateCurrentState();
    });

    widget.onHover?.call(hovering);
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

  void _handleImageLoad() {
    if (!mounted) return;

    setState(() {
      _isLoaded = true;
      _hasError = false;
      _updateCurrentState();
    });

    _loadingController.stop();
    _animationController.forward();
    widget.onLoad?.call();
  }

  void _handleImageError() {
    if (!mounted) return;

    setState(() {
      _hasError = true;
      _isLoaded = false;
      _updateCurrentState();
    });

    _loadingController.stop();
    widget.onError?.call();
  }

  Widget _buildImage() {
    if (_hasError) {
      return _buildErrorWidget();
    }

    if (!_isLoaded && _config.variant.isLazy && !_isInViewport) {
      return _buildSkeletonWidget();
    }

    if (!_isLoaded) {
      return _buildLoadingWidget();
    }

    return _buildActualImage();
  }

  Widget _buildActualImage() {
    Widget image;

    if (widget.src.startsWith('http') || widget.src.startsWith('https')) {
      image = Image.network(
        widget.src,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        semanticLabel: widget.alt,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            _handleImageLoad();
            return child;
          }
          return _buildLoadingWidget();
        },
        errorBuilder: (context, error, stackTrace) {
          _handleImageError();
          return _buildErrorWidget();
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;

          return AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Opacity(
                opacity: _animationController.value,
                child: child,
              );
            },
          );
        },
      );
    } else if (widget.src.startsWith('assets/')) {
      image = Image.asset(
        widget.src,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        semanticLabel: widget.alt,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            _handleImageLoad();
            return child;
          }

          return AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Opacity(
                opacity: _animationController.value,
                child: child,
              );
            },
          );
        },
        errorBuilder: (context, error, stackTrace) {
          _handleImageError();
          return _buildErrorWidget();
        },
      );
    } else {
      image = Image.file(
        File(widget.src),
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        semanticLabel: widget.alt,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            _handleImageLoad();
            return child;
          }

          return AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Opacity(
                opacity: _animationController.value,
                child: child,
              );
            },
          );
        },
        errorBuilder: (context, error, stackTrace) {
          _handleImageError();
          return _buildErrorWidget();
        },
      );
    }

    return image;
  }

  Widget _buildLoadingWidget() {
    if (widget.placeholder != null) {
      return widget.placeholder!;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _resolveColor('placeholder'),
        borderRadius: BorderRadius.circular(_config.spacing?.borderRadius ?? 8.0),
      ),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              _resolveColor('loading'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonWidget() {
    return AnimatedBuilder(
      animation: _loadingController,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_config.spacing?.borderRadius ?? 8.0),
            gradient: LinearGradient(
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
              colors: [
                _resolveColor('skeleton'),
                _resolveColor('skeleton').withValues(alpha: 0.5),
                _resolveColor('skeleton'),
              ],
              stops: [
                _loadingController.value - 0.3,
                _loadingController.value,
                _loadingController.value + 0.3,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(_config.spacing?.borderRadius ?? 8.0),
        border: Border.all(
          color: AppColors.error.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            size: 32,
            color: AppColors.error.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Error al cargar imagen',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _resolveColor(String colorType) {
    final theme = Theme.of(context);
    final colors = _config.colors;

    switch (colorType) {
      case 'background':
        return colors?.backgroundColor ?? AppColors.surface;
      case 'border':
        return colors?.borderColor ?? AppColors.divider;
      case 'placeholder':
        return colors?.placeholderColor ?? AppColors.gray100;
      case 'skeleton':
        return colors?.skeletonColor ?? AppColors.gray200;
      case 'loading':
        return theme.primaryColor;
      case 'shadow':
        return colors?.shadowColor ?? AppColors.shadow;
      case 'hover':
        return colors?.hoverOverlayColor ??
               theme.primaryColor.withValues(alpha: 0.1);
      case 'pressed':
        return colors?.pressedOverlayColor ??
               theme.primaryColor.withValues(alpha: 0.2);
      case 'focus':
        return colors?.focusOverlayColor ??
               theme.primaryColor.withValues(alpha: 0.15);
      default:
        return AppColors.surface;
    }
  }

  double _resolveElevation() {
    final elevation = _config.elevation;
    final multiplier = _currentState.elevationMultiplier;

    switch (_currentState) {
      case AppImageState.defaultState:
        return (elevation?.defaultElevation ?? 0.0) * multiplier;
      case AppImageState.hover:
        return (elevation?.hoveredElevation ?? 2.0) * multiplier;
      case AppImageState.pressed:
        return (elevation?.pressedElevation ?? 1.0) * multiplier;
      case AppImageState.focus:
        return (elevation?.focusedElevation ?? 3.0) * multiplier;
      case AppImageState.selected:
        return (elevation?.selectedElevation ?? 4.0) * multiplier;
      case AppImageState.disabled:
        return (elevation?.disabledElevation ?? 0.0) * multiplier;
      case AppImageState.loading:
      case AppImageState.skeleton:
        return (elevation?.defaultElevation ?? 0.0) * multiplier;
    }
  }

  Widget _buildContainer(Widget child) {
    final spacing = _config.spacing ?? const AppImageSpacing();
    final borderRadius = spacing.borderRadius;
    final borderWidth = spacing.borderWidth;

    Widget container = Container(
      width: spacing.width ?? widget.width,
      height: spacing.height ?? widget.height,
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

    if (widget.ratio != null) {
      container = AspectRatio(
        aspectRatio: widget.ratio!,
        child: container,
      );
    }

    return container;
  }

  Widget _buildInteractiveWrapper(Widget child) {
    if (widget.onTap == null && widget.onLongPress == null) {
      return child;
    }

    return GestureDetector(
      onTap: _handleTap,
      onLongPress: _handleLongPress,
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
    if (!(_config.a11yConfig?.enableKeyboardNavigation ?? true)) {
      return child;
    }

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.space) {
            _handleTap();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: child,
    );
  }

  Widget _buildSemanticsWrapper(Widget child) {
    final a11yConfig = _config.a11yConfig;

    if (a11yConfig?.isDecorative ?? false) {
      return ExcludeSemantics(child: child);
    }

    return Semantics(
      label: a11yConfig?.semanticsLabel ?? widget.alt,
      hint: a11yConfig?.semanticsHint,
      image: true,
      button: widget.onTap != null,
      focusable: _config.a11yConfig?.enableKeyboardNavigation ?? true,
      child: child,
    );
  }

  Widget _buildElevationWrapper(Widget child) {
    final elevation = _resolveElevation();

    if (elevation <= 0) return child;

    return Material(
      elevation: elevation,
      shadowColor: _resolveColor('shadow'),
      surfaceTintColor: _config.elevation?.surfaceTintColor,
      borderRadius: BorderRadius.circular(_config.spacing?.borderRadius ?? 8.0),
      child: child,
    );
  }

  Widget _buildOverlayWrapper(Widget child) {
    Color? overlayColor;

    switch (_currentState) {
      case AppImageState.hover:
        overlayColor = _resolveColor('hover');
        break;
      case AppImageState.pressed:
        overlayColor = _resolveColor('pressed');
        break;
      case AppImageState.focus:
        overlayColor = _resolveColor('focus');
        break;
      default:
        overlayColor = null;
    }

    if (overlayColor == null) return child;

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: overlayColor,
              borderRadius: BorderRadius.circular(_config.spacing?.borderRadius ?? 8.0),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget child = _buildImage();
    child = _buildContainer(child);
    child = _buildOverlayWrapper(child);
    child = _buildElevationWrapper(child);
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
    _animationController.dispose();
    _loadingController.dispose();
    _visibilitySubscription?.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => _config.behavior?.maintainState ?? true;
}