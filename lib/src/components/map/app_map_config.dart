import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_map_config.freezed.dart';

/// Configuración completa para el componente DSMap
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento del mapa
@freezed
class DSMapConfig with _$DSMapConfig {
  const factory DSMapConfig({
    @Default(DSMapVariant.markers) DSMapVariant variant,
    @Default(DSMapState.defaultState) DSMapState state,
    @Default(DSMapTheme.light) DSMapTheme theme,
    DSMapColors? colors,
    DSMapSpacing? spacing,
    DSMapAnimation? animation,
    DSMapBehavior? behavior,
    DSMapA11yConfig? a11yConfig,
  }) = _DSMapConfig;

}

/// Variantes del mapa
enum DSMapVariant {
  /// Marcadores individuales visibles
  markers,

  /// Agrupación automática de marcadores (clustering)
  clusters,
}

/// Estados interactivos del mapa
enum DSMapState {
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
enum DSMapTheme {
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
enum DSMapMarkerType {
  /// Marcador estándar
  standard,

  /// Marcador personalizado
  custom,

  /// Marcador de cluster
  cluster,
}

/// Tipos de formas geométricas
enum DSMapShapeType {
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
class DSMapColors with _$DSMapColors {
  const factory DSMapColors({
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

}

/// Configuración de espaciado del mapa
@freezed
class DSMapSpacing with _$DSMapSpacing {
  const factory DSMapSpacing({
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

}

/// Configuración de animaciones del mapa
@freezed
class DSMapAnimation with _$DSMapAnimation {
  const factory DSMapAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Duration(milliseconds: 300)) Duration movementDuration,
    @Default(Curves.easeOut) Curve movementCurve,
    @Default(true) bool enableMarkerAnimation,
    @Default(true) bool enableZoomAnimation,
  }) = _AppMapAnimation;

}

/// Configuración de comportamiento del mapa
@freezed
class DSMapBehavior with _$DSMapBehavior {
  const factory DSMapBehavior({
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

}

/// Configuración de accesibilidad
@freezed
class DSMapA11yConfig with _$DSMapA11yConfig {
  const factory DSMapA11yConfig({
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
  }) = _DSMapA11yConfig;

}

/// Coordenadas geográficas
@freezed
class DSLatLng with _$DSLatLng {
  const factory DSLatLng({
    required double latitude,
    required double longitude,
  }) = _AppLatLng;

}

/// Marcador en el mapa
@freezed
class DSMapMarker with _$DSMapMarker {
  const factory DSMapMarker({
    required String id,
    required DSLatLng position,
    String? title,
    String? description,
    Widget? icon,
    IconData? iconData,
    Color? color,
    @Default(DSMapMarkerType.standard) DSMapMarkerType type,
    @Default(true) bool draggable,
    @Default(true) bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) = _AppMapMarker;

}

/// Forma geométrica en el mapa
@freezed
class DSMapShape with _$DSMapShape {
  const factory DSMapShape({
    required String id,
    required DSMapShapeType type,
    required List<DSLatLng> points,
    String? title,
    String? description,
    Color? strokeColor,
    Color? fillColor,
    @Default(2.0) double strokeWidth,
    @Default(true) bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) = _AppMapShape;

}

/// Extensiones para DSMapVariant
extension DSMapVariantExtensions on DSMapVariant {
  /// Nombre legible de la variante
  String get displayName {
    switch (this) {
      case DSMapVariant.markers:
        return 'Marcadores';
      case DSMapVariant.clusters:
        return 'Clusters';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case DSMapVariant.markers:
        return 'Muestra marcadores individuales en el mapa';
      case DSMapVariant.clusters:
        return 'Agrupa marcadores cercanos en clusters';
    }
  }

  /// Indica si debe habilitar clustering
  bool get enablesClustering {
    switch (this) {
      case DSMapVariant.markers:
        return false;
      case DSMapVariant.clusters:
        return true;
    }
  }
}

/// Extensiones para DSMapState
extension DSMapStateExtensions on DSMapState {
  /// Indica si el estado permite interacción
  bool get canInteract {
    switch (this) {
      case DSMapState.defaultState:
      case DSMapState.hover:
      case DSMapState.pressed:
      case DSMapState.focus:
      case DSMapState.selected:
        return true;
      case DSMapState.disabled:
      case DSMapState.loading:
      case DSMapState.skeleton:
        return false;
    }
  }

  /// Indica si el estado está activo/interactivo
  bool get isInteractive {
    switch (this) {
      case DSMapState.hover:
      case DSMapState.pressed:
      case DSMapState.focus:
      case DSMapState.selected:
        return true;
      case DSMapState.defaultState:
      case DSMapState.disabled:
      case DSMapState.loading:
      case DSMapState.skeleton:
        return false;
    }
  }

  /// Opacidad sugerida para el estado
  double get opacity {
    switch (this) {
      case DSMapState.defaultState:
      case DSMapState.hover:
      case DSMapState.pressed:
      case DSMapState.focus:
      case DSMapState.selected:
        return 1.0;
      case DSMapState.disabled:
        return 0.38;
      case DSMapState.loading:
        return 0.7;
      case DSMapState.skeleton:
        return 0.5;
    }
  }
}

/// Extensiones para DSMapTheme
extension DSMapThemeExtensions on DSMapTheme {
  /// Nombre legible del tema
  String get displayName {
    switch (this) {
      case DSMapTheme.light:
        return 'Claro';
      case DSMapTheme.dark:
        return 'Oscuro';
      case DSMapTheme.satellite:
        return 'Satelital';
      case DSMapTheme.hybrid:
        return 'Híbrido';
      case DSMapTheme.terrain:
        return 'Terreno';
    }
  }

  /// Descripción del tema
  String get description {
    switch (this) {
      case DSMapTheme.light:
        return 'Tema claro estándar para uso general';
      case DSMapTheme.dark:
        return 'Tema oscuro para ambientes con poca luz';
      case DSMapTheme.satellite:
        return 'Vista satelital de alta resolución';
      case DSMapTheme.hybrid:
        return 'Combina vista satelital con etiquetas';
      case DSMapTheme.terrain:
        return 'Muestra características topográficas';
    }
  }

  /// Indica si el tema es oscuro
  bool get isDark {
    switch (this) {
      case DSMapTheme.dark:
      case DSMapTheme.satellite:
        return true;
      case DSMapTheme.light:
      case DSMapTheme.hybrid:
      case DSMapTheme.terrain:
        return false;
    }
  }
}

/// Extensiones para DSMapMarkerType
extension DSMapMarkerTypeExtensions on DSMapMarkerType {
  /// Icono por defecto para el tipo de marcador
  IconData get defaultIcon {
    switch (this) {
      case DSMapMarkerType.standard:
        return Icons.location_on;
      case DSMapMarkerType.custom:
        return Icons.place;
      case DSMapMarkerType.cluster:
        return Icons.group_work;
    }
  }

  /// Nombre legible del tipo
  String get displayName {
    switch (this) {
      case DSMapMarkerType.standard:
        return 'Estándar';
      case DSMapMarkerType.custom:
        return 'Personalizado';
      case DSMapMarkerType.cluster:
        return 'Cluster';
    }
  }
}

/// Extensiones para DSMapShapeType
extension DSMapShapeTypeExtensions on DSMapShapeType {
  /// Nombre legible del tipo de forma
  String get displayName {
    switch (this) {
      case DSMapShapeType.polyline:
        return 'Línea';
      case DSMapShapeType.polygon:
        return 'Polígono';
      case DSMapShapeType.circle:
        return 'Círculo';
      case DSMapShapeType.rectangle:
        return 'Rectángulo';
    }
  }

  /// Indica si la forma requiere múltiples puntos
  bool get requiresMultiplePoints {
    switch (this) {
      case DSMapShapeType.polyline:
      case DSMapShapeType.polygon:
        return true;
      case DSMapShapeType.circle:
      case DSMapShapeType.rectangle:
        return false;
    }
  }

  /// Número mínimo de puntos requeridos
  int get minimumPoints {
    switch (this) {
      case DSMapShapeType.polyline:
        return 2;
      case DSMapShapeType.polygon:
        return 3;
      case DSMapShapeType.circle:
        return 1;
      case DSMapShapeType.rectangle:
        return 2;
    }
  }
}

/// Extensiones para DSLatLng
extension DSLatLngExtensions on DSLatLng {
  /// Convierte a string legible
  String get displayString {
    return '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';
  }

  /// Calcula distancia a otra coordenada (en kilómetros)
  double distanceTo(DSLatLng other) {
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


/// Extensiones para DSMapMarker
extension DSMapMarkerExtensions on DSMapMarker {
  /// Crea una copia del marcador con nuevas propiedades
  DSMapMarker copyWith({
    String? id,
    DSLatLng? position,
    String? title,
    String? description,
    Widget? icon,
    IconData? iconData,
    Color? color,
    DSMapMarkerType? type,
    bool? draggable,
    bool? visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) {
    return DSMapMarker(
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

/// Extensiones para DSMapShape
extension DSMapShapeExtensions on DSMapShape {
  /// Crea una copia de la forma con nuevas propiedades
  DSMapShape copyWith({
    String? id,
    DSMapShapeType? type,
    List<DSLatLng>? points,
    String? title,
    String? description,
    Color? strokeColor,
    Color? fillColor,
    double? strokeWidth,
    bool? visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  }) {
    return DSMapShape(
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
  DSLatLng get center {
    if (points.isEmpty) return const DSLatLng(latitude: 0, longitude: 0);

    double totalLat = 0;
    double totalLng = 0;

    for (final point in points) {
      totalLat += point.latitude;
      totalLng += point.longitude;
    }

    return DSLatLng(
      latitude: totalLat / points.length,
      longitude: totalLng / points.length,
    );
  }

  /// Convierte a string para depuración
  String get debugString {
    return 'Shape($id, ${type.displayName}): ${points.length} puntos';
  }
}