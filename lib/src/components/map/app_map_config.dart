import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_map_config.freezed.dart';
part 'app_map_config.g.dart';

/// Configuración completa para el componente AppMap
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento del mapa
@freezed
class AppMapConfig with _$AppMapConfig {
  const factory AppMapConfig({
    @Default(AppMapVariant.markers) AppMapVariant variant,
    @Default(AppMapState.defaultState) AppMapState state,
    @Default(AppMapTheme.light) AppMapTheme theme,
    AppMapColors? colors,
    AppMapSpacing? spacing,
    AppMapAnimation? animation,
    AppMapBehavior? behavior,
    AppMapA11yConfig? a11yConfig,
  }) = _AppMapConfig;

  factory AppMapConfig.fromJson(Map<String, dynamic> json) =>
      _$AppMapConfigFromJson(json);
}

/// Variantes del mapa
enum AppMapVariant {
  /// Marcadores individuales visibles
  markers,

  /// Agrupación automática de marcadores (clustering)
  clusters,
}

/// Estados interactivos del mapa
enum AppMapState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (web/desktop)
  hover,

  /// Estado presionado
  pressed,

  /// Estado enfocado (navegación por teclado)
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado de carga
  loading,

  /// Estado skeleton durante carga inicial
  skeleton,
}

/// Temas visuales del mapa
enum AppMapTheme {
  /// Tema claro
  light,

  /// Tema oscuro
  dark,

  /// Tema satelital
  satellite,

  /// Tema híbrido (satelital + etiquetas)
  hybrid,

  /// Tema terreno
  terrain,
}

/// Tipos de marcadores
enum AppMapMarkerType {
  /// Marcador estándar
  standard,

  /// Marcador personalizado
  custom,

  /// Marcador de cluster
  cluster,
}

/// Tipos de formas geométricas
enum AppMapShapeType {
  /// Línea/polilínea
  polyline,

  /// Polígono
  polygon,

  /// Círculo
  circle,

  /// Rectángulo
  rectangle,
}

/// Configuración de colores del mapa
@freezed
class AppMapColors with _$AppMapColors {
  const factory AppMapColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? markerColor,
    Color? markerSelectedColor,
    Color? clusterColor,
    Color? clusterTextColor,
    Color? shapeStrokeColor,
    Color? shapeFillColor,
    Color? loadingColor,
    Color? skeletonColor,
  }) = _AppMapColors;

  factory AppMapColors.fromJson(Map<String, dynamic> json) =>
      _$AppMapColorsFromJson(json);
}

/// Configuración de espaciado del mapa
@freezed
class AppMapSpacing with _$AppMapSpacing {
  const factory AppMapSpacing({
    @Default(EdgeInsets.zero) EdgeInsets padding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(8.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(4.0) double elevation,
    @Default(200.0) double minHeight,
    @Default(200.0) double minWidth,
    @Default(16.0) double markerSize,
    @Default(2.0) double strokeWidth,
  }) = _AppMapSpacing;

  factory AppMapSpacing.fromJson(Map<String, dynamic> json) =>
      _$AppMapSpacingFromJson(json);
}

/// Configuración de animaciones del mapa
@freezed
class AppMapAnimation with _$AppMapAnimation {
  const factory AppMapAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Duration(milliseconds: 300)) Duration movementDuration,
    @Default(Curves.easeOut) Curve movementCurve,
    @Default(true) bool enableMarkerAnimation,
    @Default(true) bool enableZoomAnimation,
  }) = _AppMapAnimation;

  factory AppMapAnimation.fromJson(Map<String, dynamic> json) =>
      _$AppMapAnimationFromJson(json);
}

/// Configuración de comportamiento del mapa
@freezed
class AppMapBehavior with _$AppMapBehavior {
  const factory AppMapBehavior({
    @Default(true) bool enableInteraction,
    @Default(true) bool enableZoom,
    @Default(true) bool enablePan,
    @Default(true) bool enableRotation,
    @Default(true) bool enableTilt,
    @Default(true) bool enableMarkerInteraction,
    @Default(false) bool enableClustering,
    @Default(100) int clusterMaxZoom,
    @Default(50) int clusterRadius,
    @Default(1.0) double minZoom,
    @Default(20.0) double maxZoom,
    @Default(Duration(milliseconds: 500)) Duration debounceTime,
  }) = _AppMapBehavior;

  factory AppMapBehavior.fromJson(Map<String, dynamic> json) =>
      _$AppMapBehaviorFromJson(json);
}

/// Configuración de accesibilidad
@freezed
class AppMapA11yConfig with _$AppMapA11yConfig {
  const factory AppMapA11yConfig({
    @Default(true) bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    @Default(true) bool announceStateChanges,
    @Default(true) bool enableKeyboardNavigation,
    @Default('Mapa interactivo') String mapLabel,
    @Default('Marcador en el mapa') String markerLabel,
    @Default('Grupo de marcadores') String clusterLabel,
    @Default('Forma en el mapa') String shapeLabel,
  }) = _AppMapA11yConfig;

  factory AppMapA11yConfig.fromJson(Map<String, dynamic> json) =>
      _$AppMapA11yConfigFromJson(json);
}

/// Coordenadas geográficas
@freezed
class AppLatLng with _$AppLatLng {
  const factory AppLatLng({
    required double latitude,
    required double longitude,
  }) = _AppLatLng;

  factory AppLatLng.fromJson(Map<String, dynamic> json) =>
      _$AppLatLngFromJson(json);
}

/// Marcador en el mapa
@freezed
class AppMapMarker with _$AppMapMarker {
  const factory AppMapMarker({
    required String id,
    required AppLatLng position,
    String? title,
    String? description,
    Widget? icon,
    IconData? iconData,
    Color? color,
    @Default(AppMapMarkerType.standard) AppMapMarkerType type,
    @Default(true) bool draggable,
    @Default(true) bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) = _AppMapMarker;

  factory AppMapMarker.fromJson(Map<String, dynamic> json) =>
      _$AppMapMarkerFromJson(json);
}

/// Forma geométrica en el mapa
@freezed
class AppMapShape with _$AppMapShape {
  const factory AppMapShape({
    required String id,
    required AppMapShapeType type,
    required List<AppLatLng> points,
    String? title,
    String? description,
    Color? strokeColor,
    Color? fillColor,
    @Default(2.0) double strokeWidth,
    @Default(true) bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) = _AppMapShape;

  factory AppMapShape.fromJson(Map<String, dynamic> json) =>
      _$AppMapShapeFromJson(json);
}

/// Extensiones para AppMapVariant
extension AppMapVariantExtensions on AppMapVariant {
  /// Nombre legible de la variante
  String get displayName {
    switch (this) {
      case AppMapVariant.markers:
        return 'Marcadores';
      case AppMapVariant.clusters:
        return 'Clusters';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case AppMapVariant.markers:
        return 'Muestra marcadores individuales en el mapa';
      case AppMapVariant.clusters:
        return 'Agrupa marcadores cercanos en clusters';
    }
  }

  /// Indica si debe habilitar clustering
  bool get enablesClustering {
    switch (this) {
      case AppMapVariant.markers:
        return false;
      case AppMapVariant.clusters:
        return true;
    }
  }
}

/// Extensiones para AppMapState
extension AppMapStateExtensions on AppMapState {
  /// Indica si el estado permite interacción
  bool get canInteract {
    switch (this) {
      case AppMapState.defaultState:
      case AppMapState.hover:
      case AppMapState.pressed:
      case AppMapState.focus:
      case AppMapState.selected:
        return true;
      case AppMapState.disabled:
      case AppMapState.loading:
      case AppMapState.skeleton:
        return false;
    }
  }

  /// Indica si el estado está activo/interactivo
  bool get isInteractive {
    switch (this) {
      case AppMapState.hover:
      case AppMapState.pressed:
      case AppMapState.focus:
      case AppMapState.selected:
        return true;
      case AppMapState.defaultState:
      case AppMapState.disabled:
      case AppMapState.loading:
      case AppMapState.skeleton:
        return false;
    }
  }

  /// Opacidad sugerida para el estado
  double get opacity {
    switch (this) {
      case AppMapState.defaultState:
      case AppMapState.hover:
      case AppMapState.pressed:
      case AppMapState.focus:
      case AppMapState.selected:
        return 1.0;
      case AppMapState.disabled:
        return 0.38;
      case AppMapState.loading:
        return 0.7;
      case AppMapState.skeleton:
        return 0.5;
    }
  }
}

/// Extensiones para AppMapTheme
extension AppMapThemeExtensions on AppMapTheme {
  /// Nombre legible del tema
  String get displayName {
    switch (this) {
      case AppMapTheme.light:
        return 'Claro';
      case AppMapTheme.dark:
        return 'Oscuro';
      case AppMapTheme.satellite:
        return 'Satelital';
      case AppMapTheme.hybrid:
        return 'Híbrido';
      case AppMapTheme.terrain:
        return 'Terreno';
    }
  }

  /// Descripción del tema
  String get description {
    switch (this) {
      case AppMapTheme.light:
        return 'Tema claro estándar para uso general';
      case AppMapTheme.dark:
        return 'Tema oscuro para ambientes con poca luz';
      case AppMapTheme.satellite:
        return 'Vista satelital de alta resolución';
      case AppMapTheme.hybrid:
        return 'Combina vista satelital con etiquetas';
      case AppMapTheme.terrain:
        return 'Muestra características topográficas';
    }
  }

  /// Indica si el tema es oscuro
  bool get isDark {
    switch (this) {
      case AppMapTheme.dark:
      case AppMapTheme.satellite:
        return true;
      case AppMapTheme.light:
      case AppMapTheme.hybrid:
      case AppMapTheme.terrain:
        return false;
    }
  }
}

/// Extensiones para AppMapMarkerType
extension AppMapMarkerTypeExtensions on AppMapMarkerType {
  /// Icono por defecto para el tipo de marcador
  IconData get defaultIcon {
    switch (this) {
      case AppMapMarkerType.standard:
        return Icons.location_on;
      case AppMapMarkerType.custom:
        return Icons.place;
      case AppMapMarkerType.cluster:
        return Icons.group_work;
    }
  }

  /// Nombre legible del tipo
  String get displayName {
    switch (this) {
      case AppMapMarkerType.standard:
        return 'Estándar';
      case AppMapMarkerType.custom:
        return 'Personalizado';
      case AppMapMarkerType.cluster:
        return 'Cluster';
    }
  }
}

/// Extensiones para AppMapShapeType
extension AppMapShapeTypeExtensions on AppMapShapeType {
  /// Nombre legible del tipo de forma
  String get displayName {
    switch (this) {
      case AppMapShapeType.polyline:
        return 'Línea';
      case AppMapShapeType.polygon:
        return 'Polígono';
      case AppMapShapeType.circle:
        return 'Círculo';
      case AppMapShapeType.rectangle:
        return 'Rectángulo';
    }
  }

  /// Indica si la forma requiere múltiples puntos
  bool get requiresMultiplePoints {
    switch (this) {
      case AppMapShapeType.polyline:
      case AppMapShapeType.polygon:
        return true;
      case AppMapShapeType.circle:
      case AppMapShapeType.rectangle:
        return false;
    }
  }

  /// Número mínimo de puntos requeridos
  int get minimumPoints {
    switch (this) {
      case AppMapShapeType.polyline:
        return 2;
      case AppMapShapeType.polygon:
        return 3;
      case AppMapShapeType.circle:
        return 1;
      case AppMapShapeType.rectangle:
        return 2;
    }
  }
}

/// Extensiones para AppLatLng
extension AppLatLngExtensions on AppLatLng {
  /// Convierte a string legible
  String get displayString {
    return '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';
  }

  /// Calcula distancia a otra coordenada (en kilómetros)
  double distanceTo(AppLatLng other) {
    const double earthRadius = 6371.0; // Radio de la Tierra en km

    final double dLat = _toRadians(other.latitude - latitude);
    final double dLng = _toRadians(other.longitude - longitude);

    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(latitude)) *
        math.cos(_toRadians(other.latitude)) *
        math.sin(dLng / 2) * math.sin(dLng / 2);

    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }

  /// Verifica si las coordenadas son válidas
  bool get isValid {
    return latitude >= -90 &&
           latitude <= 90 &&
           longitude >= -180 &&
           longitude <= 180;
  }
}


/// Extensiones para AppMapMarker
extension AppMapMarkerExtensions on AppMapMarker {
  /// Crea una copia del marcador con nuevas propiedades
  AppMapMarker copyWith({
    String? id,
    AppLatLng? position,
    String? title,
    String? description,
    Widget? icon,
    IconData? iconData,
    Color? color,
    AppMapMarkerType? type,
    bool? draggable,
    bool? visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) {
    return AppMapMarker(
      id: id ?? this.id,
      position: position ?? this.position,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      iconData: iconData ?? this.iconData,
      color: color ?? this.color,
      type: type ?? this.type,
      draggable: draggable ?? this.draggable,
      visible: visible ?? this.visible,
      metadata: metadata ?? this.metadata,
      onTap: onTap ?? this.onTap,
    );
  }

  /// Convierte a string para depuración
  String get debugString {
    return 'Marker($id): ${position.displayString}';
  }
}

/// Extensiones para AppMapShape
extension AppMapShapeExtensions on AppMapShape {
  /// Crea una copia de la forma con nuevas propiedades
  AppMapShape copyWith({
    String? id,
    AppMapShapeType? type,
    List<AppLatLng>? points,
    String? title,
    String? description,
    Color? strokeColor,
    Color? fillColor,
    double? strokeWidth,
    bool? visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) {
    return AppMapShape(
      id: id ?? this.id,
      type: type ?? this.type,
      points: points ?? this.points,
      title: title ?? this.title,
      description: description ?? this.description,
      strokeColor: strokeColor ?? this.strokeColor,
      fillColor: fillColor ?? this.fillColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      visible: visible ?? this.visible,
      metadata: metadata ?? this.metadata,
      onTap: onTap ?? this.onTap,
    );
  }

  /// Verifica si la forma es válida
  bool get isValid {
    if (points.isEmpty) return false;
    if (points.length < type.minimumPoints) return false;
    return points.every((point) => point.isValid);
  }

  /// Calcula el centro de la forma
  AppLatLng get center {
    if (points.isEmpty) return const AppLatLng(latitude: 0, longitude: 0);

    double totalLat = 0;
    double totalLng = 0;

    for (final point in points) {
      totalLat += point.latitude;
      totalLng += point.longitude;
    }

    return AppLatLng(
      latitude: totalLat / points.length,
      longitude: totalLng / points.length,
    );
  }

  /// Convierte a string para depuración
  String get debugString {
    return 'Shape($id, ${type.displayName}): ${points.length} puntos';
  }
}