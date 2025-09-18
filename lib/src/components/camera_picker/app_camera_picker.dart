import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_config.dart';
import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_platform_adapter.dart';
import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_a11y_helper.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';

/// Widget principal para selección de imágenes/videos desde cámara o galería
///
/// Características:
/// - Adaptación automática por plataforma (iOS, Android, Web)
/// - Soporte para múltiples fuentes (cámara, galería, archivos)
/// - Estados interactivos completos
/// - Accesibilidad y navegación por teclado integradas
/// - Soporte RTL
/// - Configuración granular con Freezed
///
/// ### Ejemplo básico:
/// ```dart
/// AppCameraPicker(
///   onPicked: (files) {
///     print('Archivos seleccionados: ${files.length}');
///   },
///   config: AppCameraPickerConfig(
///     source: AppCameraPickerSource.both,
///     behavior: AppCameraPickerBehavior(
///       allowMultiple: true,
///       maxFiles: 5,
///     ),
///   ),
/// )
/// ```
///
/// ### Ejemplo con configuración avanzada:
/// ```dart
/// AppCameraPicker(
///   onPicked: (files) => _handleFiles(files),
///   onError: (error) => _showError(error),
///   config: AppCameraPickerConfig(
///     variant: AppCameraPickerVariant.platform,
///     source: AppCameraPickerSource.camera,
///     fileType: AppCameraPickerFileType.image,
///     quality: AppCameraPickerQuality.high,
///     behavior: AppCameraPickerBehavior(
///       allowMultiple: false,
///       compressImages: true,
///       showPreview: true,
///     ),
///     a11yConfig: AppCameraPickerA11yConfig(
///       semanticsLabel: 'Selector de foto de perfil',
///       cameraButtonLabel: 'Tomar nueva foto',
///     ),
///   ),
/// )
/// ```
class AppCameraPicker extends StatefulWidget {
  /// Configuración completa del componente
  final AppCameraPickerConfig? config;

  /// Callback cuando se seleccionan archivos
  final ValueChanged<List<AppCameraPickerFile>>? onPicked;

  /// Callback cuando ocurre un error
  final ValueChanged<String>? onError;

  /// Callback cuando se deniegan permisos
  final VoidCallback? onPermissionDenied;

  /// Callback cuando se cancela la operación
  final VoidCallback? onCancelled;

  /// Texto personalizado para el botón
  final String? buttonText;

  /// Ícono personalizado para el botón
  final IconData? buttonIcon;

  /// Si el componente está habilitado
  final bool enabled;

  /// Fuente de selección
  final AppCameraPickerSource source;

  /// Permitir selección múltiple
  final bool allowMultiple;

  const AppCameraPicker({
    super.key,
    this.config,
    this.onPicked,
    this.onError,
    this.onPermissionDenied,
    this.onCancelled,
    this.buttonText,
    this.buttonIcon,
    this.enabled = true,
    this.source = AppCameraPickerSource.both,
    this.allowMultiple = false,
  });

  @override
  State<AppCameraPicker> createState() => _AppCameraPickerState();
}

class _AppCameraPickerState extends State<AppCameraPicker>
    with TickerProviderStateMixin {

  // Configuración efectiva
  late AppCameraPickerConfig _config;

  // Controladores de animación
  late AnimationController _stateAnimationController;
  late AnimationController _loadingAnimationController;

  // Animaciones
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // Estado actual
  AppCameraPickerState _currentState = AppCameraPickerState.defaultState;
  bool _isHovered = false;
  bool _isFocused = false;
  bool _isPressed = false;
  bool _isLoading = false;

  // Adaptador de plataforma
  late AppCameraPickerPlatformAdapter _platformAdapter;

  // Helper de accesibilidad
  late AppCameraPickerA11yHelper _a11yHelper;

  // Nodo de foco
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeConfig();
    _initializeControllers();
    _initializeAnimations();
    _initializePlatformAdapter();
    _initializeA11yHelper();
    _initializeFocus();
  }

  @override
  void didUpdateWidget(AppCameraPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config ||
        widget.enabled != oldWidget.enabled ||
        widget.source != oldWidget.source ||
        widget.allowMultiple != oldWidget.allowMultiple) {
      _initializeConfig();
      _updateCurrentState();
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _loadingAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _initializeConfig() {
    _config = widget.config ?? const AppCameraPickerConfig();
    _config = _config.copyWith(
      source: widget.source,
      behavior: _config.behavior?.copyWith(
        allowMultiple: widget.allowMultiple,
      ) ?? AppCameraPickerBehavior(
        allowMultiple: widget.allowMultiple,
      ),
      enabled: widget.enabled,
      onPicked: widget.onPicked,
      onError: widget.onError,
      onPermissionDenied: widget.onPermissionDenied,
      onCancelled: widget.onCancelled,
      buttonText: widget.buttonText,
      buttonIcon: widget.buttonIcon,
    );

    _currentState = _config.state;
  }

  void _initializeControllers() {
    final animConfig = _config.animation ?? const AppCameraPickerAnimation();

    _stateAnimationController = AnimationController(
      duration: animConfig.stateDuration,
      vsync: this,
    );

    _loadingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  void _initializeAnimations() {
    final animConfig = _config.animation ?? const AppCameraPickerAnimation();

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: animConfig.stateCurve,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: animConfig.stateCurve,
    ));

  }

  void _initializePlatformAdapter() {
    _platformAdapter = AppCameraPickerPlatformAdapter();
  }

  void _initializeA11yHelper() {
    _a11yHelper = AppCameraPickerA11yHelper(_config.a11yConfig);
  }

  void _initializeFocus() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
      _updateCurrentState();
    });
  }

  void _updateCurrentState() {
    AppCameraPickerState newState;

    if (!_config.enabled) {
      newState = AppCameraPickerState.disabled;
    } else if (_isLoading) {
      newState = AppCameraPickerState.loading;
    } else if (_config.state == AppCameraPickerState.skeleton) {
      newState = AppCameraPickerState.skeleton;
    } else if (_isPressed) {
      newState = AppCameraPickerState.pressed;
    } else if (_isFocused) {
      newState = AppCameraPickerState.focus;
    } else if (_isHovered) {
      newState = AppCameraPickerState.hover;
    } else {
      newState = AppCameraPickerState.defaultState;
    }

    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });

      // Animar cambio de estado
      if (_config.animation?.enabled ?? true) {
        if (_isPressed) {
          _stateAnimationController.forward();
        } else {
          _stateAnimationController.reverse();
        }
      }

      // Anunciar cambio para accesibilidad
      _a11yHelper.announceStateChange(_currentState);
    }
  }

  Future<void> _handleTap() async {
    if (!_currentState.canInteract) return;

    // Haptic feedback
    if (_config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.lightImpact();
    }

    setState(() {
      _isLoading = true;
    });
    _updateCurrentState();

    if (_config.animation?.enabled ?? true) {
      _loadingAnimationController.repeat();
    }

    try {
      final files = await _platformAdapter.pickFiles(_config);

      if (files.isNotEmpty) {
        _config.onPicked?.call(files);
      } else {
        _config.onCancelled?.call();
      }
    } catch (e) {
      _config.onError?.call(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        _updateCurrentState();
        _loadingAnimationController.stop();
        _loadingAnimationController.reset();
      }
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (!_currentState.canInteract) return;
    setState(() {
      _isPressed = true;
    });
    _updateCurrentState();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    _updateCurrentState();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _updateCurrentState();
  }

  void _handleHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
    _updateCurrentState();
  }

  void _handleFocusChange(bool focused) {
    // El cambio de foco se maneja en el listener del FocusNode
  }

  KeyEventResult _handleKeyEvent(KeyEvent event) {
    return _a11yHelper.handleKeyEvent(
      event,
      onActivate: _handleTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentState == AppCameraPickerState.skeleton) {
      return _buildSkeleton();
    }

    return _a11yHelper.buildSemanticsWrapper(
      context: context,
      state: _currentState,
      child: Focus(
        focusNode: _focusNode,
        onFocusChange: _handleFocusChange,
        onKeyEvent: (node, event) => _handleKeyEvent(event),
        child: MouseRegion(
          onEnter: (_) => _handleHover(true),
          onExit: (_) => _handleHover(false),
          child: GestureDetector(
            onTap: _handleTap,
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _stateAnimationController,
                _loadingAnimationController,
              ]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _config.animation?.enabled ?? true
                      ? _scaleAnimation.value
                      : 1.0,
                  child: Opacity(
                    opacity: _config.animation?.enabled ?? true
                        ? _opacityAnimation.value
                        : 1.0,
                    child: _buildButton(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    final colors = _resolveColors();
    final spacing = _config.spacing ?? const AppCameraPickerSpacing();
    final elevation = _resolveElevation();

    return Container(
      constraints: BoxConstraints(
        minHeight: spacing.minHeight,
        minWidth: spacing.minWidth,
      ),
      margin: spacing.margin,
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        border: Border.all(
          color: _isFocused
              ? (colors.borderFocusColor ?? AppColors.primary)
              : (colors.borderColor ?? AppColors.outline),
          width: spacing.borderWidth,
        ),
        boxShadow: elevation > 0 ? [
          BoxShadow(
            color: colors.shadowColor ?? AppColors.shadow,
            blurRadius: elevation * 2,
            offset: Offset(0, elevation / 2),
          ),
        ] : null,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(spacing.borderRadius),
          onTap: _currentState.canInteract ? _handleTap : null,
          child: Padding(
            padding: spacing.padding,
            child: _buildButtonContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    final colors = _resolveColors();
    final spacing = _config.spacing ?? const AppCameraPickerSpacing();

    if (_isLoading) {
      return _buildLoadingContent();
    }

    final icon = widget.buttonIcon ??
                 _config.buttonIcon ??
                 _config.source.icon;

    final text = widget.buttonText ??
                 _config.buttonText ??
                 _getDefaultButtonText();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colors.iconColor,
          size: 24,
        ),
        if (text.isNotEmpty) ...[
          SizedBox(width: spacing.iconTextSpacing),
          Flexible(
            child: Text(
              text,
              style: AppTypography.button.copyWith(
                color: colors.textColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLoadingContent() {
    final colors = _resolveColors();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(
              colors.iconColor ?? AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Cargando...',
          style: AppTypography.button.copyWith(
            color: colors.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildSkeleton() {
    final spacing = _config.spacing ?? const AppCameraPickerSpacing();
    final colors = _config.colors ?? const AppCameraPickerColors();

    return Container(
      constraints: BoxConstraints(
        minHeight: spacing.minHeight,
        minWidth: spacing.minWidth,
      ),
      margin: spacing.margin,
      decoration: BoxDecoration(
        color: colors.skeletonColor ?? AppColors.gray200,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
      ),
      child: Padding(
        padding: spacing.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.gray300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(width: spacing.iconTextSpacing),
            Container(
              width: 80,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.gray300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppCameraPickerColors _resolveColors() {
    final baseColors = _config.colors ?? const AppCameraPickerColors();
    final theme = Theme.of(context);

    return AppCameraPickerColors(
      backgroundColor: _getStateColor(
        baseColors.backgroundColor ?? theme.colorScheme.surface,
        baseColors.backgroundHoverColor ?? theme.colorScheme.surfaceContainerHighest,
        baseColors.backgroundPressedColor ?? theme.colorScheme.surfaceContainerHighest,
        baseColors.backgroundDisabledColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.12),
      ),
      textColor: _getStateColor(
        baseColors.textColor ?? theme.colorScheme.onSurface,
        baseColors.textColor ?? theme.colorScheme.onSurface,
        baseColors.textColor ?? theme.colorScheme.onSurface,
        baseColors.textDisabledColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.38),
      ),
      iconColor: _getStateColor(
        baseColors.iconColor ?? theme.colorScheme.onSurface,
        baseColors.iconColor ?? theme.colorScheme.onSurface,
        baseColors.iconColor ?? theme.colorScheme.onSurface,
        baseColors.iconDisabledColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.38),
      ),
      borderColor: baseColors.borderColor ?? theme.colorScheme.outline,
      borderFocusColor: baseColors.borderFocusColor ?? theme.colorScheme.primary,
      shadowColor: baseColors.shadowColor ?? theme.colorScheme.shadow,
    );
  }

  Color _getStateColor(Color normal, Color hover, Color pressed, Color disabled) {
    switch (_currentState) {
      case AppCameraPickerState.disabled:
      case AppCameraPickerState.skeleton:
        return disabled;
      case AppCameraPickerState.pressed:
        return pressed;
      case AppCameraPickerState.hover:
        return hover;
      default:
        return normal;
    }
  }

  double _resolveElevation() {
    final elevation = _config.elevation ?? const AppCameraPickerElevation();

    switch (_currentState) {
      case AppCameraPickerState.disabled:
        return elevation.disabledElevation;
      case AppCameraPickerState.pressed:
        return elevation.pressedElevation;
      case AppCameraPickerState.hover:
        return elevation.hoverElevation;
      default:
        return elevation.defaultElevation;
    }
  }

  String _getDefaultButtonText() {
    switch (_config.source) {
      case AppCameraPickerSource.camera:
        return 'Tomar Foto';
      case AppCameraPickerSource.gallery:
        return 'Seleccionar';
      case AppCameraPickerSource.both:
        return 'Agregar Imagen';
    }
  }
}