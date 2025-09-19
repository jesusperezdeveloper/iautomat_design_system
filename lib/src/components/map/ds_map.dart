import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iautomat_design_system/src/components/map/ds_map_config.dart';
import 'package:iautomat_design_system/src/components/map/ds_map_platform_adapter.dart';
import 'package:iautomat_design_system/src/components/map/ds_map_a11y_helper.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';

/// Widget principal para mostrar mapas interactivos con marcadores y formas
///
/// Características:
/// - Adaptación automática por plataforma (iOS, Android, Web)
/// - Soporte para marcadores individuales y clustering
/// - Estados interactivos completos
/// - Accesibilidad y navegación por teclado integradas
/// - Soporte RTL y múltiples temas de mapa
/// - Configuración completa vía Freezed models
///
/// Ejemplo de uso:
/// ```dart
/// DSMap(
///   center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
///   zoom: 12.0,
///   markers: [
///     DSMapMarker(
///       id: 'marker1',
///       position: DSLatLng(latitude: 37.7749, longitude: -122.4194),
///       title: 'San Francisco',
///     ),
///   ],
///   onTap: (position) => print('Tapped at: $position'),
/// )
/// ```
class DSMap extends StatefulWidget {
  /// Configuración del mapa
  final DSMapConfig? config;

  /// Centro inicial del mapa
  final DSLatLng center;

  /// Nivel de zoom inicial
  final double zoom;

  /// Lista de marcadores a mostrar
  final List<DSMapMarker> markers;

  /// Lista de formas geométricas a mostrar
  final List<DSMapShape> shapes;

  /// Tema visual del mapa
  final DSMapTheme? theme;

  /// Callback cuando se toca el mapa
  final ValueChanged<DSLatLng>? onTap;

  /// Callback cuando se hace long press en el mapa
  final ValueChanged<DSLatLng>? onLongPress;

  /// Callback cuando cambia la cámara del mapa
  final ValueChanged<DSMapCameraPosition>? onCameraMove;

  /// Callback cuando se toca un marcador
  final ValueChanged<DSMapMarker>? onMarkerTap;

  /// Callback cuando se toca una forma
  final ValueChanged<DSMapShape>? onShapeTap;

  /// Callback cuando se arrastra un marcador
  final ValueChanged<DSMapMarker>? onMarkerDrag;

  /// Callback para errores
  final ValueChanged<String>? onError;

  /// Si el mapa está habilitado para interacción
  final bool enabled;

  const DSMap({
    super.key,
    this.config,
    required this.center,
    this.zoom = 10.0,
    this.markers = const [],
    this.shapes = const [],
    this.theme,
    this.onTap,
    this.onLongPress,
    this.onCameraMove,
    this.onMarkerTap,
    this.onShapeTap,
    this.onMarkerDrag,
    this.onError,
    this.enabled = true,
  });

  @override
  State<DSMap> createState() => _DSMapState();
}

/// Posición de la cámara del mapa
class DSMapCameraPosition {
  final DSLatLng center;
  final double zoom;
  final double bearing;
  final double tilt;

  const DSMapCameraPosition({
    required this.center,
    required this.zoom,
    this.bearing = 0.0,
    this.tilt = 0.0,
  });

  @override
  String toString() {
    return 'CameraPosition(center: $center, zoom: $zoom, bearing: $bearing, tilt: $tilt)';
  }
}

class _DSMapState extends State<DSMap>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  // Configuración efectiva
  late DSMapConfig _config;

  // Controladores de animación
  late AnimationController _stateAnimationController;
  late AnimationController _loadingAnimationController;

  // Animaciones
  late Animation<double> _scaleAnimation;

  // Estado actual
  DSMapState _currentState = DSMapState.defaultState;
  bool _isFocused = false;

  // Adaptador de plataforma
  late DSMapPlatformAdapter _platformAdapter;

  // Helper de accesibilidad
  late DSMapA11yHelper _a11yHelper;

  // Nodo de foco
  late FocusNode _focusNode;

  // Posición actual de la cámara
  late DSMapCameraPosition _currentCameraPosition;

  // Marcadores procesados (con clustering si está habilitado)
  late List<DSMapMarker> _processedMarkers;

  @override
  void initState() {
    super.initState();
    _initializeConfig();
    _initializeAnimations();
    _initializePlatformAdapter();
    _initializeA11yHelper();
    _initializeFocus();
    _initializeCameraPosition();
    _processMarkers();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didUpdateWidget(DSMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config != oldWidget.config) {
      _initializeConfig();
    }

    if (widget.center != oldWidget.center ||
        widget.zoom != oldWidget.zoom) {
      _updateCameraPosition();
    }

    if (widget.markers != oldWidget.markers) {
      _processMarkers();
    }

    if (!widget.enabled && oldWidget.enabled) {
      _updateState(DSMapState.disabled);
    } else if (widget.enabled && !oldWidget.enabled) {
      _updateState(DSMapState.defaultState);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stateAnimationController.dispose();
    _loadingAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _initializeConfig() {
    _config = widget.config ?? const DSMapConfig();
  }

  void _initializeAnimations() {
    final animConfig = _config.animation ?? const DSMapAnimation();

    _stateAnimationController = AnimationController(
      duration: animConfig.duration,
      vsync: this,
    );

    _loadingAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: animConfig.curve,
    ));


    if (animConfig.enabled) {
      _stateAnimationController.addListener(() {
        setState(() {});
      });
    }
  }

  void _initializePlatformAdapter() {
    _platformAdapter = DSMapPlatformAdapter();
  }

  void _initializeA11yHelper() {
    _a11yHelper = DSMapA11yHelper(_config.a11yConfig);
  }

  void _initializeFocus() {
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _initializeCameraPosition() {
    _currentCameraPosition = DSMapCameraPosition(
      center: widget.center,
      zoom: widget.zoom,
    );
  }

  void _processMarkers() {
    final behavior = _config.behavior ?? const DSMapBehavior();

    if (_config.variant.enablesClustering && behavior.enableClustering) {
      _processedMarkers = _clusterMarkers(widget.markers);
    } else {
      _processedMarkers = widget.markers;
    }
  }

  List<DSMapMarker> _clusterMarkers(List<DSMapMarker> markers) {
    // Implementación básica de clustering
    // En una implementación real, usarías algoritmos más sofisticados
    final clusters = <DSMapMarker>[];
    final processed = <bool>[];

    for (int i = 0; i < markers.length; i++) {
      processed.add(false);
    }

    for (int i = 0; i < markers.length; i++) {
      if (processed[i]) continue;

      final marker = markers[i];
      final nearbyMarkers = <DSMapMarker>[marker];
      processed[i] = true;

      // Buscar marcadores cercanos
      for (int j = i + 1; j < markers.length; j++) {
        if (processed[j]) continue;

        final distance = marker.position.distanceTo(markers[j].position);
        final behavior = _config.behavior ?? const DSMapBehavior();

        if (distance * 1000 < behavior.clusterRadius) {
          nearbyMarkers.add(markers[j]);
          processed[j] = true;
        }
      }

      if (nearbyMarkers.length > 1) {
        // Crear cluster
        final center = _calculateClusterCenter(nearbyMarkers);
        clusters.add(DSMapMarker(
          id: 'cluster_${clusters.length}',
          position: center,
          title: '${nearbyMarkers.length} marcadores',
          type: DSMapMarkerType.cluster,
          metadata: {
            'markers': nearbyMarkers,
            'count': nearbyMarkers.length,
          },
        ));
      } else {
        clusters.add(marker);
      }
    }

    return clusters;
  }

  DSLatLng _calculateClusterCenter(List<DSMapMarker> markers) {
    double totalLat = 0;
    double totalLng = 0;

    for (final marker in markers) {
      totalLat += marker.position.latitude;
      totalLng += marker.position.longitude;
    }

    return DSLatLng(
      latitude: totalLat / markers.length,
      longitude: totalLng / markers.length,
    );
  }

  void _updateCameraPosition() {
    setState(() {
      _currentCameraPosition = DSMapCameraPosition(
        center: widget.center,
        zoom: widget.zoom,
      );
    });
  }

  void _updateState(DSMapState newState) {
    if (_currentState == newState) return;

    setState(() {
      _currentState = newState;
    });

    _a11yHelper.announceStateChange(newState);

    final animConfig = _config.animation ?? const DSMapAnimation();
    if (animConfig.enabled) {
      if (newState.isInteractive) {
        _stateAnimationController.forward();
      } else {
        _stateAnimationController.reverse();
      }
    }
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    if (_isFocused) {
      _updateState(DSMapState.focus);
    } else if (_currentState == DSMapState.focus) {
      _updateState(DSMapState.defaultState);
    }
  }

  void _handleTap(DSLatLng position) {
    if (!_currentState.canInteract) return;

    _updateState(DSMapState.pressed);

    // Resetear estado después de un delay
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        _updateState(_isFocused ? DSMapState.focus : DSMapState.defaultState);
      }
    });

    widget.onTap?.call(position);
  }

  void _handleMarkerTap(DSMapMarker marker) {
    if (!_currentState.canInteract) return;

    _a11yHelper.announceMarkerTap(marker);
    widget.onMarkerTap?.call(marker);
    marker.onTap?.call();
  }

  void _handleShapeTap(DSMapShape shape) {
    if (!_currentState.canInteract) return;

    _a11yHelper.announceShapeTap(shape);
    widget.onShapeTap?.call(shape);
    shape.onTap?.call();
  }

  void _handleKeyEvent(KeyEvent event) {
    final result = _a11yHelper.handleKeyEvent(
      event,
      onActivate: () => _handleTap(_currentCameraPosition.center),
      onZoomIn: () => _handleZoom(true),
      onZoomOut: () => _handleZoom(false),
      onMove: (direction) => _handleKeyboardMove(direction),
    );

    if (result == KeyEventResult.handled) {
      HapticFeedback.lightImpact();
    }
  }

  void _handleZoom(bool zoomIn) {
    final behavior = _config.behavior ?? const DSMapBehavior();
    if (!behavior.enableZoom) return;

    final currentZoom = _currentCameraPosition.zoom;
    final newZoom = zoomIn
        ? (currentZoom + 1).clamp(behavior.minZoom, behavior.maxZoom)
        : (currentZoom - 1).clamp(behavior.minZoom, behavior.maxZoom);

    _updateCameraPosition();
    widget.onCameraMove?.call(DSMapCameraPosition(
      center: _currentCameraPosition.center,
      zoom: newZoom,
    ));
  }

  void _handleKeyboardMove(String direction) {
    final behavior = _config.behavior ?? const DSMapBehavior();
    if (!behavior.enablePan) return;

    const moveDistance = 0.001; // Aproximadamente 100 metros
    final currentCenter = _currentCameraPosition.center;

    DSLatLng newCenter;
    switch (direction) {
      case 'up':
        newCenter = DSLatLng(
          latitude: currentCenter.latitude + moveDistance,
          longitude: currentCenter.longitude,
        );
        break;
      case 'down':
        newCenter = DSLatLng(
          latitude: currentCenter.latitude - moveDistance,
          longitude: currentCenter.longitude,
        );
        break;
      case 'left':
        newCenter = DSLatLng(
          latitude: currentCenter.latitude,
          longitude: currentCenter.longitude - moveDistance,
        );
        break;
      case 'right':
        newCenter = DSLatLng(
          latitude: currentCenter.latitude,
          longitude: currentCenter.longitude + moveDistance,
        );
        break;
      default:
        return;
    }

    widget.onCameraMove?.call(DSMapCameraPosition(
      center: newCenter,
      zoom: _currentCameraPosition.zoom,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _a11yHelper.buildSemanticsWrapper(
      context: context,
      state: _currentState,
      child: _buildMapContainer(context),
    );
  }

  Widget _buildMapContainer(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = _resolveSpacing();
    final colors = _resolveColors(context);

    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: GestureDetector(
          onTap: () => _focusNode.requestFocus(),
          child: AnimatedBuilder(
            animation: _stateAnimationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _config.animation?.enabled == true ? _scaleAnimation.value : 1.0,
                child: AnimatedOpacity(
                  opacity: _currentState.opacity,
                  duration: _config.animation?.duration ?? const Duration(milliseconds: 200),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: spacing.minHeight,
                      minWidth: spacing.minWidth,
                    ),
                    margin: spacing.margin,
                    decoration: BoxDecoration(
                      color: colors.backgroundColor,
                      borderRadius: BorderRadius.circular(spacing.borderRadius),
                      border: Border.all(
                        color: colors.borderColor ?? theme.colorScheme.outline,
                        width: spacing.borderWidth,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colors.shadowColor ?? theme.colorScheme.shadow,
                          blurRadius: spacing.elevation,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(spacing.borderRadius),
                      child: _buildMapContent(context),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMapContent(BuildContext context) {
    switch (_currentState) {
      case DSMapState.loading:
        return _buildLoadingState(context);
      case DSMapState.skeleton:
        return _buildSkeletonState(context);
      default:
        return _buildMapView(context);
    }
  }

  Widget _buildMapView(BuildContext context) {
    return _platformAdapter.buildMapView(
      context: context,
      config: _config,
      center: _currentCameraPosition.center,
      zoom: _currentCameraPosition.zoom,
      markers: _processedMarkers,
      shapes: widget.shapes,
      theme: widget.theme ?? _config.theme,
      onTap: _handleTap,
      onMarkerTap: _handleMarkerTap,
      onShapeTap: _handleShapeTap,
      onCameraMove: (position) {
        _currentCameraPosition = position;
        widget.onCameraMove?.call(position);
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final colors = _resolveColors(context);

    return Container(
      color: colors.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _loadingAnimationController,
              builder: (context, child) {
                return CircularProgressIndicator(
                  value: _loadingAnimationController.value,
                  valueColor: AlwaysStoppedAnimation<Color>(colors.loadingColor ?? Colors.blue),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Cargando mapa...',
              style: DSTypography.bodyMedium.copyWith(
                color: colors.loadingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context) {
    final colors = _resolveColors(context);

    return Container(
      color: colors.backgroundColor,
      child: Stack(
        children: [
          // Fondo skeleton
          Container(
            color: colors.skeletonColor,
          ),
          // Elementos skeleton simulados
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.skeletonColor?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                color: colors.skeletonColor?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleHover(bool isHovering) {
    if (!widget.enabled) return;

    setState(() {
      // Estado hover manejado por _currentState
    });

    if (isHovering && _currentState == DSMapState.defaultState) {
      _updateState(DSMapState.hover);
    } else if (!isHovering && _currentState == DSMapState.hover) {
      _updateState(DSMapState.defaultState);
    }
  }

  DSMapSpacing _resolveSpacing() {
    final baseSpacing = _config.spacing ?? const DSMapSpacing();
    return baseSpacing;
  }

  DSMapColors _resolveColors(BuildContext context) {
    final baseColors = _config.colors ?? const DSMapColors();
    final theme = Theme.of(context);

    return DSMapColors(
      backgroundColor: baseColors.backgroundColor ?? theme.colorScheme.surface,
      borderColor: _getStateBorderColor(baseColors, theme),
      shadowColor: baseColors.shadowColor ?? theme.colorScheme.shadow,
      overlayColor: baseColors.overlayColor ?? theme.colorScheme.surfaceContainerHighest,
      markerColor: baseColors.markerColor ?? theme.colorScheme.primary,
      markerSelectedColor: baseColors.markerSelectedColor ?? theme.colorScheme.primaryContainer,
      clusterColor: baseColors.clusterColor ?? theme.colorScheme.secondary,
      clusterTextColor: baseColors.clusterTextColor ?? theme.colorScheme.onSecondary,
      shapeStrokeColor: baseColors.shapeStrokeColor ?? theme.colorScheme.outline,
      shapeFillColor: baseColors.shapeFillColor ?? theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
      loadingColor: baseColors.loadingColor ?? theme.colorScheme.primary,
      skeletonColor: baseColors.skeletonColor ?? DSColors.gray300,
    );
  }

  Color _getStateBorderColor(DSMapColors baseColors, ThemeData theme) {
    if (baseColors.borderColor != null) return baseColors.borderColor!;

    switch (_currentState) {
      case DSMapState.focus:
        return theme.colorScheme.primary;
      case DSMapState.hover:
        return theme.colorScheme.outline;
      case DSMapState.pressed:
        return theme.colorScheme.primary;
      case DSMapState.selected:
        return theme.colorScheme.primary;
      case DSMapState.disabled:
        return theme.colorScheme.outline.withValues(alpha: 0.38);
      default:
        return theme.colorScheme.outline;
    }
  }
}