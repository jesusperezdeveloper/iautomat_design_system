import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:iautomat_design_system/src/components/map/app_map_config.dart';
import 'package:iautomat_design_system/src/components/map/app_map.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';


/// Adaptador que maneja las diferencias específicas de cada plataforma
/// para la visualización y interacción con mapas
///
/// Proporciona:
/// - Renderizado nativo para cada plataforma
/// - Manejo de gestos específicos por plataforma
/// - Optimizaciones de rendimiento
/// - Fallbacks para casos no soportados
class AppMapPlatformAdapter {
  /// Construye la vista del mapa apropiada para la plataforma actual
  Widget buildMapView({
    required BuildContext context,
    required AppMapConfig config,
    required AppLatLng center,
    required double zoom,
    required List<AppMapMarker> markers,
    required List<AppMapShape> shapes,
    required AppMapTheme theme,
    ValueChanged<AppLatLng>? onTap,
    ValueChanged<AppMapMarker>? onMarkerTap,
    ValueChanged<AppMapShape>? onShapeTap,
    ValueChanged<AppMapCameraPosition>? onCameraMove,
  }) {
    if (kIsWeb) {
      return _buildWebMapView(
        context: context,
        config: config,
        center: center,
        zoom: zoom,
        markers: markers,
        shapes: shapes,
        theme: theme,
        onTap: onTap,
        onMarkerTap: onMarkerTap,
        onShapeTap: onShapeTap,
        onCameraMove: onCameraMove,
      );
    } else if (Platform.isIOS) {
      return _buildIOSMapView(
        context: context,
        config: config,
        center: center,
        zoom: zoom,
        markers: markers,
        shapes: shapes,
        theme: theme,
        onTap: onTap,
        onMarkerTap: onMarkerTap,
        onShapeTap: onShapeTap,
        onCameraMove: onCameraMove,
      );
    } else {
      return _buildAndroidMapView(
        context: context,
        config: config,
        center: center,
        zoom: zoom,
        markers: markers,
        shapes: shapes,
        theme: theme,
        onTap: onTap,
        onMarkerTap: onMarkerTap,
        onShapeTap: onShapeTap,
        onCameraMove: onCameraMove,
      );
    }
  }

  /// Implementación para iOS usando MapKit
  Widget _buildIOSMapView({
    required BuildContext context,
    required AppMapConfig config,
    required AppLatLng center,
    required double zoom,
    required List<AppMapMarker> markers,
    required List<AppMapShape> shapes,
    required AppMapTheme theme,
    ValueChanged<AppLatLng>? onTap,
    ValueChanged<AppMapMarker>? onMarkerTap,
    ValueChanged<AppMapShape>? onShapeTap,
    ValueChanged<AppMapCameraPosition>? onCameraMove,
  }) {
    // En una implementación real, aquí usarías apple_maps o similar
    // Por ahora simulamos con un widget personalizado
    return _SimulatedMapView(
      platform: 'iOS',
      config: config,
      center: center,
      zoom: zoom,
      markers: markers,
      shapes: shapes,
      theme: theme,
      onTap: onTap,
      onMarkerTap: onMarkerTap,
      onShapeTap: onShapeTap,
      onCameraMove: onCameraMove,
      mapStyle: _getIOSMapStyle(theme),
    );
  }

  /// Implementación para Android usando Google Maps
  Widget _buildAndroidMapView({
    required BuildContext context,
    required AppMapConfig config,
    required AppLatLng center,
    required double zoom,
    required List<AppMapMarker> markers,
    required List<AppMapShape> shapes,
    required AppMapTheme theme,
    ValueChanged<AppLatLng>? onTap,
    ValueChanged<AppMapMarker>? onMarkerTap,
    ValueChanged<AppMapShape>? onShapeTap,
    ValueChanged<AppMapCameraPosition>? onCameraMove,
  }) {
    // En una implementación real, aquí usarías google_maps_flutter
    return _SimulatedMapView(
      platform: 'Android',
      config: config,
      center: center,
      zoom: zoom,
      markers: markers,
      shapes: shapes,
      theme: theme,
      onTap: onTap,
      onMarkerTap: onMarkerTap,
      onShapeTap: onShapeTap,
      onCameraMove: onCameraMove,
      mapStyle: _getAndroidMapStyle(theme),
    );
  }

  /// Implementación para Web usando JavaScript Maps API
  Widget _buildWebMapView({
    required BuildContext context,
    required AppMapConfig config,
    required AppLatLng center,
    required double zoom,
    required List<AppMapMarker> markers,
    required List<AppMapShape> shapes,
    required AppMapTheme theme,
    ValueChanged<AppLatLng>? onTap,
    ValueChanged<AppMapMarker>? onMarkerTap,
    ValueChanged<AppMapShape>? onShapeTap,
    ValueChanged<AppMapCameraPosition>? onCameraMove,
  }) {
    // En una implementación real, aquí usarías google_maps o mapbox_gl
    return _SimulatedMapView(
      platform: 'Web',
      config: config,
      center: center,
      zoom: zoom,
      markers: markers,
      shapes: shapes,
      theme: theme,
      onTap: onTap,
      onMarkerTap: onMarkerTap,
      onShapeTap: onShapeTap,
      onCameraMove: onCameraMove,
      mapStyle: _getWebMapStyle(theme),
    );
  }

  /// Obtiene el estilo de mapa para iOS
  Map<String, dynamic> _getIOSMapStyle(AppMapTheme theme) {
    switch (theme) {
      case AppMapTheme.light:
        return {'style': 'light', 'overlay': 'standard'};
      case AppMapTheme.dark:
        return {'style': 'dark', 'overlay': 'standard'};
      case AppMapTheme.satellite:
        return {'style': 'satellite', 'overlay': 'none'};
      case AppMapTheme.hybrid:
        return {'style': 'satellite', 'overlay': 'labels'};
      case AppMapTheme.terrain:
        return {'style': 'terrain', 'overlay': 'standard'};
    }
  }

  /// Obtiene el estilo de mapa para Android
  Map<String, dynamic> _getAndroidMapStyle(AppMapTheme theme) {
    switch (theme) {
      case AppMapTheme.light:
        return {'mapType': 'normal', 'darkMode': false};
      case AppMapTheme.dark:
        return {'mapType': 'normal', 'darkMode': true};
      case AppMapTheme.satellite:
        return {'mapType': 'satellite', 'darkMode': false};
      case AppMapTheme.hybrid:
        return {'mapType': 'hybrid', 'darkMode': false};
      case AppMapTheme.terrain:
        return {'mapType': 'terrain', 'darkMode': false};
    }
  }

  /// Obtiene el estilo de mapa para Web
  Map<String, dynamic> _getWebMapStyle(AppMapTheme theme) {
    switch (theme) {
      case AppMapTheme.light:
        return {'styles': [], 'mapTypeId': 'roadmap'};
      case AppMapTheme.dark:
        return {'styles': _getDarkModeStyles(), 'mapTypeId': 'roadmap'};
      case AppMapTheme.satellite:
        return {'styles': [], 'mapTypeId': 'satellite'};
      case AppMapTheme.hybrid:
        return {'styles': [], 'mapTypeId': 'hybrid'};
      case AppMapTheme.terrain:
        return {'styles': [], 'mapTypeId': 'terrain'};
    }
  }

  /// Estilos para modo oscuro en Web
  List<Map<String, dynamic>> _getDarkModeStyles() {
    return [
      {
        'elementType': 'geometry',
        'stylers': [
          {'color': '#242f3e'}
        ]
      },
      {
        'elementType': 'labels.text.stroke',
        'stylers': [
          {'color': '#242f3e'}
        ]
      },
      {
        'elementType': 'labels.text.fill',
        'stylers': [
          {'color': '#746855'}
        ]
      },
    ];
  }

  /// Verifica si una característica está soportada en la plataforma actual
  bool isFeatureSupported(String feature) {
    if (kIsWeb) {
      return _isWebFeatureSupported(feature);
    } else if (Platform.isIOS) {
      return _isIOSFeatureSupported(feature);
    } else {
      return _isAndroidFeatureSupported(feature);
    }
  }

  bool _isWebFeatureSupported(String feature) {
    final supportedFeatures = {
      'clustering',
      'polygons',
      'polylines',
      'circles',
      'custom_markers',
      'map_themes',
      'gesture_handling',
    };
    return supportedFeatures.contains(feature);
  }

  bool _isIOSFeatureSupported(String feature) {
    final supportedFeatures = {
      'clustering',
      'polygons',
      'polylines',
      'circles',
      'custom_markers',
      'map_themes',
      'gesture_handling',
      'metal_rendering',
    };
    return supportedFeatures.contains(feature);
  }

  bool _isAndroidFeatureSupported(String feature) {
    final supportedFeatures = {
      'clustering',
      'polygons',
      'polylines',
      'circles',
      'custom_markers',
      'map_themes',
      'gesture_handling',
      'vector_rendering',
    };
    return supportedFeatures.contains(feature);
  }
}

/// Widget que simula un mapa para propósitos de demostración
/// En una implementación real, esto sería reemplazado por los widgets
/// específicos de cada plataforma (GoogleMap, AppleMap, etc.)
class _SimulatedMapView extends StatefulWidget {
  final String platform;
  final AppMapConfig config;
  final AppLatLng center;
  final double zoom;
  final List<AppMapMarker> markers;
  final List<AppMapShape> shapes;
  final AppMapTheme theme;
  final ValueChanged<AppLatLng>? onTap;
  final ValueChanged<AppMapMarker>? onMarkerTap;
  final ValueChanged<AppMapShape>? onShapeTap;
  final ValueChanged<AppMapCameraPosition>? onCameraMove;
  final Map<String, dynamic> mapStyle;

  const _SimulatedMapView({
    required this.platform,
    required this.config,
    required this.center,
    required this.zoom,
    required this.markers,
    required this.shapes,
    required this.theme,
    this.onTap,
    this.onMarkerTap,
    this.onShapeTap,
    this.onCameraMove,
    required this.mapStyle,
  });

  @override
  State<_SimulatedMapView> createState() => _SimulatedMapViewState();
}

class _SimulatedMapViewState extends State<_SimulatedMapView> {
  late AppLatLng _currentCenter;
  late double _currentZoom;
  Offset? _lastPanPoint;

  @override
  void initState() {
    super.initState();
    _currentCenter = widget.center;
    _currentZoom = widget.zoom;
  }

  @override
  void didUpdateWidget(_SimulatedMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.center != oldWidget.center) {
      _currentCenter = widget.center;
    }
    if (widget.zoom != oldWidget.zoom) {
      _currentZoom = widget.zoom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _handleTap,
      onPanStart: _handlePanStart,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: _getMapGradient(),
        ),
        child: Stack(
          children: [
            // Fondo del mapa
            _buildMapBackground(),

            // Formas geométricas
            ...widget.shapes.map(_buildShape),

            // Marcadores
            ...widget.markers.map(_buildMarker),

            // Controles del mapa
            _buildMapControls(),

            // Información de plataforma
            _buildPlatformInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildMapBackground() {
    return CustomPaint(
      painter: _MapBackgroundPainter(
        theme: widget.theme,
        center: _currentCenter,
        zoom: _currentZoom,
      ),
      size: Size.infinite,
    );
  }

  Widget _buildMarker(AppMapMarker marker) {
    final position = _latLngToScreenPosition(marker.position);

    return Positioned(
      left: position.dx - 12,
      top: position.dy - 24,
      child: GestureDetector(
        onTap: () => widget.onMarkerTap?.call(marker),
        child: _MarkerWidget(
          marker: marker,
          config: widget.config,
        ),
      ),
    );
  }

  Widget _buildShape(AppMapShape shape) {
    return CustomPaint(
      painter: _ShapePainter(
        shape: shape,
        center: _currentCenter,
        zoom: _currentZoom,
        onTap: () => widget.onShapeTap?.call(shape),
      ),
      size: Size.infinite,
    );
  }

  Widget _buildMapControls() {
    final behavior = widget.config.behavior ?? const AppMapBehavior();

    return Positioned(
      top: 10,
      right: 10,
      child: Column(
        children: [
          if (behavior.enableZoom) ...[
            _buildZoomButton(Icons.add, () => _handleZoom(true)),
            const SizedBox(height: 4),
            _buildZoomButton(Icons.remove, () => _handleZoom(false)),
          ],
        ],
      ),
    );
  }

  Widget _buildZoomButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 20),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildPlatformInfo() {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '${widget.platform} • ${widget.theme.displayName} • Z${_currentZoom.toStringAsFixed(1)}',
          style: AppTypography.caption.copyWith(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  LinearGradient _getMapGradient() {
    switch (widget.theme) {
      case AppMapTheme.light:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F4FD),
            Color(0xFFF0F9FF),
          ],
        );
      case AppMapTheme.dark:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1F2937),
            Color(0xFF111827),
          ],
        );
      case AppMapTheme.satellite:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2D5016),
            Color(0xFF1A3D0A),
          ],
        );
      case AppMapTheme.hybrid:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2D5016),
            Color(0xFFE8F4FD),
          ],
        );
      case AppMapTheme.terrain:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF3E8FF),
            Color(0xFFEDE9FE),
          ],
        );
    }
  }

  Offset _latLngToScreenPosition(AppLatLng latLng) {
    // Proyección Mercator simplificada para simulación
    final size = MediaQuery.of(context).size;

    final scale = math.pow(2, _currentZoom);

    // Convertir lat/lng a coordenadas de mundo
    final worldX = (latLng.longitude + 180) / 360;
    final worldY = (1 - math.log(math.tan(latLng.latitude * math.pi / 180) +
                     1 / math.cos(latLng.latitude * math.pi / 180)) / math.pi) / 2;

    // Convertir coordenadas del centro a mundo
    final centerWorldX = (_currentCenter.longitude + 180) / 360;
    final centerWorldY = (1 - math.log(math.tan(_currentCenter.latitude * math.pi / 180) +
                          1 / math.cos(_currentCenter.latitude * math.pi / 180)) / math.pi) / 2;

    // Calcular offset desde el centro
    final offsetX = (worldX - centerWorldX) * scale * 256;
    final offsetY = (worldY - centerWorldY) * scale * 256;

    // Convertir a coordenadas de pantalla
    final screenX = size.width / 2 + offsetX;
    final screenY = size.height / 2 + offsetY;

    return Offset(screenX, screenY);
  }

  void _handleTap(TapUpDetails details) {
    final position = _screenPositionToLatLng(details.localPosition);
    widget.onTap?.call(position);
  }

  AppLatLng _screenPositionToLatLng(Offset screenPosition) {
    // Conversión inversa de coordenadas de pantalla a lat/lng
    final size = MediaQuery.of(context).size;

    final scale = math.pow(2, _currentZoom);

    // Convertir coordenadas del centro a mundo
    final centerWorldX = (_currentCenter.longitude + 180) / 360;
    final centerWorldY = (1 - math.log(math.tan(_currentCenter.latitude * math.pi / 180) +
                          1 / math.cos(_currentCenter.latitude * math.pi / 180)) / math.pi) / 2;

    // Calcular offset desde el centro de la pantalla
    final offsetX = (screenPosition.dx - size.width / 2) / (scale * 256);
    final offsetY = (screenPosition.dy - size.height / 2) / (scale * 256);

    // Convertir a coordenadas de mundo
    final worldX = centerWorldX + offsetX;
    final worldY = centerWorldY + offsetY;

    // Convertir a lat/lng
    final longitude = worldX * 360 - 180;
    final sinhValue = (math.exp(math.pi * (1 - 2 * worldY)) - math.exp(-math.pi * (1 - 2 * worldY))) / 2;
    final latitude = math.atan(sinhValue) * 180 / math.pi;

    return AppLatLng(latitude: latitude, longitude: longitude);
  }

  void _handlePanStart(DragStartDetails details) {
    _lastPanPoint = details.localPosition;
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (_lastPanPoint == null) return;

    final behavior = widget.config.behavior ?? const AppMapBehavior();
    if (!behavior.enablePan) return;

    final delta = details.localPosition - _lastPanPoint!;
    _lastPanPoint = details.localPosition;

    // Convertir delta de píxeles a cambio de lat/lng
    final scale = math.pow(2, _currentZoom);
    final deltaLng = -delta.dx / (scale * 256) * 360;
    final deltaLat = delta.dy / (scale * 256) * 360;

    setState(() {
      _currentCenter = AppLatLng(
        latitude: (_currentCenter.latitude + deltaLat).clamp(-85.0, 85.0),
        longitude: (_currentCenter.longitude + deltaLng).clamp(-180.0, 180.0),
      );
    });

    widget.onCameraMove?.call(AppMapCameraPosition(
      center: _currentCenter,
      zoom: _currentZoom,
      bearing: 0.0,
      tilt: 0.0,
    ));
  }

  void _handlePanEnd(DragEndDetails details) {
    _lastPanPoint = null;
  }

  void _handleZoom(bool zoomIn) {
    final behavior = widget.config.behavior ?? const AppMapBehavior();

    setState(() {
      _currentZoom = (zoomIn ? _currentZoom + 1 : _currentZoom - 1)
          .clamp(behavior.minZoom, behavior.maxZoom);
    });

    widget.onCameraMove?.call(AppMapCameraPosition(
      center: _currentCenter,
      zoom: _currentZoom,
      bearing: 0.0,
      tilt: 0.0,
    ));
  }
}

/// Widget para renderizar un marcador individual
class _MarkerWidget extends StatelessWidget {
  final AppMapMarker marker;
  final AppMapConfig config;

  const _MarkerWidget({
    required this.marker,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    if (marker.icon != null) {
      return marker.icon!;
    }

    final colors = config.colors ?? const AppMapColors();
    final spacing = config.spacing ?? const AppMapSpacing();

    if (marker.type == AppMapMarkerType.cluster) {
      return _buildClusterMarker(colors, spacing);
    }

    return _buildStandardMarker(colors, spacing);
  }

  Widget _buildStandardMarker(AppMapColors colors, AppMapSpacing spacing) {
    final theme = colors.markerColor ?? AppColors.primary;

    return SizedBox(
      width: spacing.markerSize,
      height: spacing.markerSize * 1.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Icon(
            marker.iconData ?? marker.type.defaultIcon,
            color: marker.color ?? theme,
            size: spacing.markerSize,
          ),
          if (marker.title?.isNotEmpty == true)
            Positioned(
              bottom: -20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  marker.title!,
                  style: AppTypography.caption.copyWith(fontSize: 8),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildClusterMarker(AppMapColors colors, AppMapSpacing spacing) {
    final count = marker.metadata?['count'] as int? ?? 0;
    final clusterColor = colors.clusterColor ?? AppColors.secondary;
    final textColor = colors.clusterTextColor ?? AppColors.textOnColor;

    return Container(
      width: spacing.markerSize * 1.5,
      height: spacing.markerSize * 1.5,
      decoration: BoxDecoration(
        color: clusterColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: AppTypography.labelSmall.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// Painter para renderizar formas geométricas
class _ShapePainter extends CustomPainter {
  final AppMapShape shape;
  final AppLatLng center;
  final double zoom;
  final VoidCallback? onTap;

  _ShapePainter({
    required this.shape,
    required this.center,
    required this.zoom,
    this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!shape.visible || shape.points.isEmpty) return;

    final paint = Paint()
      ..color = shape.strokeColor ?? AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = shape.strokeWidth;

    final fillPaint = Paint()
      ..color = (shape.fillColor ?? AppColors.primary).withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    switch (shape.type) {
      case AppMapShapeType.polyline:
        _drawPolyline(canvas, size, paint);
        break;
      case AppMapShapeType.polygon:
        _drawPolygon(canvas, size, paint, fillPaint);
        break;
      case AppMapShapeType.circle:
        _drawCircle(canvas, size, paint, fillPaint);
        break;
      case AppMapShapeType.rectangle:
        _drawRectangle(canvas, size, paint, fillPaint);
        break;
    }
  }

  void _drawPolyline(Canvas canvas, Size size, Paint paint) {
    if (shape.points.length < 2) return;

    final path = Path();
    for (int i = 0; i < shape.points.length; i++) {
      final point = _latLngToScreenPosition(shape.points[i], size);
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    canvas.drawPath(path, paint);
  }

  void _drawPolygon(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    if (shape.points.length < 3) return;

    final path = Path();
    for (int i = 0; i < shape.points.length; i++) {
      final point = _latLngToScreenPosition(shape.points[i], size);
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);
  }

  void _drawCircle(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    if (shape.points.isEmpty) return;

    final centerPoint = _latLngToScreenPosition(shape.points[0], size);
    const radius = 50.0; // Radio fijo para simulación

    canvas.drawCircle(centerPoint, radius, fillPaint);
    canvas.drawCircle(centerPoint, radius, paint);
  }

  void _drawRectangle(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    if (shape.points.length < 2) return;

    final point1 = _latLngToScreenPosition(shape.points[0], size);
    final point2 = _latLngToScreenPosition(shape.points[1], size);

    final rect = Rect.fromPoints(point1, point2);

    canvas.drawRect(rect, fillPaint);
    canvas.drawRect(rect, paint);
  }

  Offset _latLngToScreenPosition(AppLatLng latLng, Size size) {
    // Proyección simplificada (igual que en _SimulatedMapView)
    final scale = math.pow(2, zoom);

    final worldX = (latLng.longitude + 180) / 360;
    final worldY = (1 - math.log(math.tan(latLng.latitude * math.pi / 180) +
                     1 / math.cos(latLng.latitude * math.pi / 180)) / math.pi) / 2;

    final centerWorldX = (center.longitude + 180) / 360;
    final centerWorldY = (1 - math.log(math.tan(center.latitude * math.pi / 180) +
                          1 / math.cos(center.latitude * math.pi / 180)) / math.pi) / 2;

    final offsetX = (worldX - centerWorldX) * scale * 256;
    final offsetY = (worldY - centerWorldY) * scale * 256;

    final screenX = size.width / 2 + offsetX;
    final screenY = size.height / 2 + offsetY;

    return Offset(screenX, screenY);
  }

  @override
  bool shouldRepaint(covariant _ShapePainter oldDelegate) {
    return shape != oldDelegate.shape ||
           center != oldDelegate.center ||
           zoom != oldDelegate.zoom;
  }
}

/// Painter para el fondo del mapa
class _MapBackgroundPainter extends CustomPainter {
  final AppMapTheme theme;
  final AppLatLng center;
  final double zoom;

  _MapBackgroundPainter({
    required this.theme,
    required this.center,
    required this.zoom,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Dibujar una grilla simple para simular el mapa
    final paint = Paint()
      ..color = _getGridColor()
      ..strokeWidth = 0.5;

    final gridSize = 50.0 * math.pow(2, zoom - 10);

    // Líneas verticales
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Líneas horizontales
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  Color _getGridColor() {
    switch (theme) {
      case AppMapTheme.light:
        return Colors.grey.withValues(alpha: 0.3);
      case AppMapTheme.dark:
        return Colors.white.withValues(alpha: 0.2);
      case AppMapTheme.satellite:
        return Colors.green.withValues(alpha: 0.2);
      case AppMapTheme.hybrid:
        return Colors.yellow.withValues(alpha: 0.2);
      case AppMapTheme.terrain:
        return Colors.brown.withValues(alpha: 0.2);
    }
  }

  @override
  bool shouldRepaint(covariant _MapBackgroundPainter oldDelegate) {
    return theme != oldDelegate.theme ||
           center != oldDelegate.center ||
           zoom != oldDelegate.zoom;
  }
}