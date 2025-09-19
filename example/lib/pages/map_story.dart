import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story de DSMap con ejemplos y casos de uso
class MapStory extends StatefulWidget {
  const MapStory({super.key});

  @override
  State<MapStory> createState() => _MapStoryState();
}

class _MapStoryState extends State<MapStory> {
  DSLatLng _currentCenter = const DSLatLng(latitude: 37.7749, longitude: -122.4194);
  double _currentZoom = 12.0;
  DSMapTheme _selectedTheme = DSMapTheme.light;
  DSMapVariant _selectedVariant = DSMapVariant.markers;
  List<DSMapMarker> _markers = [];
  List<DSMapShape> _shapes = [];
  String? _lastTapInfo;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _initializeDefaultData();
  }

  void _initializeDefaultData() {
    _markers = [
      const DSMapMarker(
        id: 'sf_center',
        position: DSLatLng(latitude: 37.7749, longitude: -122.4194),
        title: 'San Francisco',
        description: 'Centro de la ciudad',
        iconData: Icons.location_city,
        color: Colors.blue,
      ),
      const DSMapMarker(
        id: 'golden_gate',
        position: DSLatLng(latitude: 37.8199, longitude: -122.4786),
        title: 'Golden Gate Bridge',
        description: 'Puente icónico',
        iconData: Icons.place,
        color: Colors.orange,
      ),
      const DSMapMarker(
        id: 'alcatraz',
        position: DSLatLng(latitude: 37.8267, longitude: -122.4233),
        title: 'Alcatraz Island',
        description: 'Isla histórica',
        iconData: Icons.museum,
        color: Colors.red,
      ),
      const DSMapMarker(
        id: 'pier39',
        position: DSLatLng(latitude: 37.8087, longitude: -122.4098),
        title: 'Pier 39',
        description: 'Muelle turístico',
        iconData: Icons.directions_boat,
        color: Colors.green,
      ),
    ];

    _shapes = [
      const DSMapShape(
        id: 'route_downtown',
        type: DSMapShapeType.polyline,
        points: [
          DSLatLng(latitude: 37.7749, longitude: -122.4194),
          DSLatLng(latitude: 37.7949, longitude: -122.4094),
          DSLatLng(latitude: 37.8049, longitude: -122.4194),
        ],
        title: 'Ruta Downtown',
        strokeColor: Colors.blue,
      ),
      const DSMapShape(
        id: 'mission_area',
        type: DSMapShapeType.polygon,
        points: [
          DSLatLng(latitude: 37.7549, longitude: -122.4294),
          DSLatLng(latitude: 37.7649, longitude: -122.4094),
          DSLatLng(latitude: 37.7449, longitude: -122.4094),
          DSLatLng(latitude: 37.7449, longitude: -122.4294),
        ],
        title: 'Distrito Mission',
        strokeColor: Colors.green,
        fillColor: Colors.green,
      ),
      const DSMapShape(
        id: 'coverage_area',
        type: DSMapShapeType.circle,
        points: [
          DSLatLng(latitude: 37.7749, longitude: -122.4194),
        ],
        title: 'Área de Cobertura',
        strokeColor: Colors.purple,
        fillColor: Colors.purple,
      ),
    ];
  }

  void _onMapTap(DSLatLng position) {
    setState(() {
      _lastTapInfo = 'Tocaste en: ${position.displayString}';
      _lastError = null;
    });
  }

  void _onMarkerTap(DSMapMarker marker) {
    setState(() {
      _lastTapInfo = 'Marcador: ${marker.title} - ${marker.description}';
      _lastError = null;
    });
  }


  void _onCameraMove(DSMapCameraPosition position) {
    setState(() {
      _currentCenter = position.center;
      _currentZoom = position.zoom;
    });
  }

  void _onError(String error) {
    setState(() {
      _lastError = error;
      _lastTapInfo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSMap Story'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de estado
            _buildStatusCard(),
            const SizedBox(height: DSSpacing.lg),

            // Controles
            _buildControlsCard(),
            const SizedBox(height: DSSpacing.lg),

            // Casos de uso básicos
            _buildSection(
              title: 'Casos de Uso Básicos',
              children: [
                _buildExample(
                  title: 'Mapa Básico',
                  description: 'Mapa simple con marcadores',
                  height: 250,
                  widget: DSMap(
                    center: _currentCenter,
                    zoom: _currentZoom,
                    theme: _selectedTheme,
                    markers: _selectedVariant == DSMapVariant.markers
                        ? _markers.take(2).toList()
                        : _markers,
                    onTap: _onMapTap,
                    onMarkerTap: _onMarkerTap,
                    onCameraMove: _onCameraMove,
                    onError: _onError,
                    config: DSMapConfig(
                      variant: _selectedVariant,
                    ),
                  ),
                ),
              ],
            ),

            // Estados del componente
            _buildSection(
              title: 'Estados del Componente',
              children: [
                _buildExample(
                  title: 'Estado Deshabilitado',
                  description: 'Mapa no interactivo',
                  height: 200,
                  widget: const DSMap(
                    center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    enabled: false,
                  ),
                ),
                _buildExample(
                  title: 'Estado de Carga',
                  description: 'Muestra indicador de progreso',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      state: DSMapState.loading,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Skeleton',
                  description: 'Placeholder durante carga inicial',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      state: DSMapState.skeleton,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Focus',
                  description: 'Resaltado para navegación por teclado',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      state: DSMapState.focus,
                    ),
                  ),
                ),
              ],
            ),

            // Temas del mapa
            _buildSection(
              title: 'Temas del Mapa',
              children: [
                _buildExample(
                  title: 'Tema Claro',
                  description: 'Tema estándar para uso general',
                  height: 200,
                  widget: const DSMap(
                    center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: DSMapTheme.light,
                  ),
                ),
                _buildExample(
                  title: 'Tema Oscuro',
                  description: 'Tema para ambientes con poca luz',
                  height: 200,
                  widget: const DSMap(
                    center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: DSMapTheme.dark,
                  ),
                ),
                _buildExample(
                  title: 'Tema Satelital',
                  description: 'Vista satelital de alta resolución',
                  height: 200,
                  widget: const DSMap(
                    center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: DSMapTheme.satellite,
                  ),
                ),
                _buildExample(
                  title: 'Tema Híbrido',
                  description: 'Combina vista satelital con etiquetas',
                  height: 200,
                  widget: const DSMap(
                    center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: DSMapTheme.hybrid,
                  ),
                ),
                _buildExample(
                  title: 'Tema Terreno',
                  description: 'Muestra características topográficas',
                  height: 200,
                  widget: const DSMap(
                    center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: DSMapTheme.terrain,
                  ),
                ),
              ],
            ),

            // Variantes de marcadores
            _buildSection(
              title: 'Variantes de Marcadores',
              children: [
                _buildExample(
                  title: 'Marcadores Individuales',
                  description: 'Cada marcador se muestra por separado',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    markers: _markers,
                    config: const DSMapConfig(
                      variant: DSMapVariant.markers,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Marcadores Agrupados (Clusters)',
                  description: 'Marcadores cercanos se agrupan automáticamente',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    markers: _generateClusterMarkers(),
                    config: const DSMapConfig(
                      variant: DSMapVariant.clusters,
                      behavior: DSMapBehavior(
                        enableClustering: true,
                        clusterRadius: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Formas geométricas
            _buildSection(
              title: 'Formas Geométricas',
              children: [
                _buildExample(
                  title: 'Líneas (Polylines)',
                  description: 'Rutas y caminos',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    shapes: _shapes.where((s) => s.type == DSMapShapeType.polyline).toList(),
                  ),
                ),
                _buildExample(
                  title: 'Polígonos',
                  description: 'Áreas y regiones',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7549, longitude: -122.4194),
                    shapes: _shapes.where((s) => s.type == DSMapShapeType.polygon).toList(),
                  ),
                ),
                _buildExample(
                  title: 'Círculos',
                  description: 'Áreas de cobertura',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    shapes: _shapes.where((s) => s.type == DSMapShapeType.circle).toList(),
                  ),
                ),
                _buildExample(
                  title: 'Formas Combinadas',
                  description: 'Múltiples tipos de formas',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    shapes: _shapes,
                  ),
                ),
              ],
            ),

            // Personalización avanzada
            _buildSection(
              title: 'Personalización Avanzada',
              children: [
                _buildExample(
                  title: 'Colores Personalizados',
                  description: 'Paleta de colores customizada',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    markers: [_markers.first],
                    config: DSMapConfig(
                      colors: const DSMapColors(
                        backgroundColor: Colors.lightBlue,
                        borderColor: Colors.indigo,
                        markerColor: Colors.deepOrange,
                        shadowColor: Colors.black,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Espaciado Personalizado',
                  description: 'Bordes y elevación ajustados',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      spacing: DSMapSpacing(
                        borderRadius: 20.0,
                        borderWidth: 3.0,
                        elevation: 8.0,
                        padding: EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Sin Animaciones',
                  description: 'Comportamiento estático',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      animation: DSMapAnimation(
                        enabled: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Configuración de comportamiento
            _buildSection(
              title: 'Configuración de Comportamiento',
              children: [
                _buildExample(
                  title: 'Zoom Limitado',
                  description: 'Restricciones de zoom',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      behavior: DSMapBehavior(
                        minZoom: 10.0,
                        maxZoom: 15.0,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Solo Zoom',
                  description: 'Navegación deshabilitada, solo zoom',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      behavior: DSMapBehavior(
                        enablePan: false,
                        enableZoom: true,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Interacción Deshabilitada',
                  description: 'Mapa de solo lectura',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      behavior: DSMapBehavior(
                        enableInteraction: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Accesibilidad y RTL
            _buildSection(
              title: 'Accesibilidad y RTL',
              children: [
                _buildExample(
                  title: 'Configuración A11y Completa',
                  description: 'Optimizado para lectores de pantalla',
                  height: 200,
                  widget: DSMap(
                    center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const DSMapConfig(
                      a11yConfig: DSMapA11yConfig(
                        semanticsLabel: 'Mapa de San Francisco',
                        semanticsDescription: 'Mapa interactivo de la ciudad',
                        semanticsHint: 'Usa flechas para navegar, + y - para zoom',
                        announceStateChanges: true,
                        enableKeyboardNavigation: true,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Layout RTL',
                  description: 'Soporte para idiomas de derecha a izquierda',
                  height: 200,
                  widget: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DSMap(
                      center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                      markers: const [
                        DSMapMarker(
                          id: 'rtl_marker',
                          position: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                          title: 'نقطة على الخريطة',
                          description: 'وصف المكان',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Casos de uso en aplicaciones
            _buildSection(
              title: 'Casos de Uso en Aplicaciones',
              children: [
                _buildAppExample(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estado Actual del Mapa',
              style: DSTypography.h6,
            ),
            const SizedBox(height: DSSpacing.sm),
            Text(
              'Centro: ${_currentCenter.displayString}',
              style: DSTypography.bodyMedium,
            ),
            Text(
              'Zoom: ${_currentZoom.toStringAsFixed(1)}',
              style: DSTypography.bodyMedium,
            ),
            Text(
              'Tema: ${_selectedTheme.displayName}',
              style: DSTypography.bodyMedium,
            ),
            Text(
              'Variante: ${_selectedVariant.displayName}',
              style: DSTypography.bodyMedium,
            ),
            const SizedBox(height: DSSpacing.sm),
            if (_lastTapInfo != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DSColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _lastTapInfo!,
                  style: DSTypography.bodySmall.copyWith(
                    color: DSColors.success,
                  ),
                ),
              ),
            if (_lastError != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DSColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _lastError!,
                  style: DSTypography.bodySmall.copyWith(
                    color: DSColors.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Controles',
              style: DSTypography.h6,
            ),
            const SizedBox(height: DSSpacing.md),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tema:', style: DSTypography.labelMedium),
                      DropdownButton<DSMapTheme>(
                        value: _selectedTheme,
                        isExpanded: true,
                        onChanged: (theme) {
                          if (theme != null) {
                            setState(() {
                              _selectedTheme = theme;
                            });
                          }
                        },
                        items: DSMapTheme.values.map((theme) {
                          return DropdownMenuItem(
                            value: theme,
                            child: Text(theme.displayName),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: DSSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Variante:', style: DSTypography.labelMedium),
                      DropdownButton<DSMapVariant>(
                        value: _selectedVariant,
                        isExpanded: true,
                        onChanged: (variant) {
                          if (variant != null) {
                            setState(() {
                              _selectedVariant = variant;
                            });
                          }
                        },
                        items: DSMapVariant.values.map((variant) {
                          return DropdownMenuItem(
                            value: variant,
                            child: Text(variant.displayName),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.md),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentCenter = const DSLatLng(latitude: 37.7749, longitude: -122.4194);
                      _currentZoom = 12.0;
                    });
                  },
                  child: const Text('Centrar SF'),
                ),
                const SizedBox(width: DSSpacing.sm),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentCenter = const DSLatLng(latitude: 40.7128, longitude: -74.0060);
                      _currentZoom = 11.0;
                    });
                  },
                  child: const Text('Centrar NY'),
                ),
                const SizedBox(width: DSSpacing.sm),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _lastTapInfo = null;
                      _lastError = null;
                    });
                  },
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: DSTypography.h5,
        ),
        const SizedBox(height: DSSpacing.md),
        ...children,
        const SizedBox(height: DSSpacing.lg),
      ],
    );
  }

  Widget _buildExample({
    required String title,
    required String description,
    required Widget widget,
    double height = 200,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: DSSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: DSTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: DSTypography.bodySmall.copyWith(
                color: DSColors.gray600,
              ),
            ),
            const SizedBox(height: DSSpacing.md),
            SizedBox(
              width: double.infinity,
              height: height,
              child: widget,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppExample() {
    return Card(
      margin: const EdgeInsets.only(bottom: DSSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App de Delivery',
              style: DSTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Ejemplo de uso en una aplicación de delivery',
              style: DSTypography.bodySmall.copyWith(
                color: DSColors.gray600,
              ),
            ),
            const SizedBox(height: DSSpacing.md),

            // Simulación de interfaz de delivery
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: DSColors.gray300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Header de la app
                  Container(
                    padding: const EdgeInsets.all(DSSpacing.sm),
                    decoration: BoxDecoration(
                      color: DSColors.primary,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.delivery_dining, color: Colors.white),
                        const SizedBox(width: DSSpacing.sm),
                        Text(
                          'QuickFood Delivery',
                          style: DSTypography.labelLarge.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.account_circle, color: Colors.white),
                      ],
                    ),
                  ),

                  // Mapa con repartidores
                  Expanded(
                    child: DSMap(
                      center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                      zoom: 14.0,
                      markers: [
                        const DSMapMarker(
                          id: 'user',
                          position: DSLatLng(latitude: 37.7749, longitude: -122.4194),
                          title: 'Tu ubicación',
                          iconData: Icons.person_pin,
                          color: Colors.blue,
                        ),
                        const DSMapMarker(
                          id: 'restaurant',
                          position: DSLatLng(latitude: 37.7849, longitude: -122.4094),
                          title: 'Restaurante',
                          iconData: Icons.restaurant,
                          color: Colors.orange,
                        ),
                        const DSMapMarker(
                          id: 'delivery1',
                          position: DSLatLng(latitude: 37.7649, longitude: -122.4294),
                          title: 'Repartidor #1',
                          iconData: Icons.motorcycle,
                          color: Colors.green,
                        ),
                        const DSMapMarker(
                          id: 'delivery2',
                          position: DSLatLng(latitude: 37.7549, longitude: -122.4394),
                          title: 'Repartidor #2',
                          iconData: Icons.motorcycle,
                          color: Colors.green,
                        ),
                      ],
                      shapes: const [
                        DSMapShape(
                          id: 'delivery_route',
                          type: DSMapShapeType.polyline,
                          points: [
                            DSLatLng(latitude: 37.7849, longitude: -122.4094),
                            DSLatLng(latitude: 37.7799, longitude: -122.4144),
                            DSLatLng(latitude: 37.7749, longitude: -122.4194),
                          ],
                          title: 'Ruta de entrega',
                          strokeColor: Colors.green,
                        ),
                        DSMapShape(
                          id: 'coverage_area',
                          type: DSMapShapeType.circle,
                          points: [
                            DSLatLng(latitude: 37.7749, longitude: -122.4194),
                          ],
                          title: 'Área de entrega',
                          strokeColor: Colors.blue,
                          fillColor: Colors.blue,
                        ),
                      ],
                      config: const DSMapConfig(
                        variant: DSMapVariant.markers,
                        behavior: DSMapBehavior(
                          enableZoom: true,
                          enablePan: true,
                        ),
                      ),
                    ),
                  ),

                  // Footer con información
                  Container(
                    padding: const EdgeInsets.all(DSSpacing.sm),
                    decoration: BoxDecoration(
                      color: DSColors.gray100,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.schedule, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Tiempo estimado: 25 min',
                          style: DSTypography.bodySmall,
                        ),
                        const Spacer(),
                        Text(
                          '2 repartidores cerca',
                          style: DSTypography.bodySmall.copyWith(
                            color: DSColors.success,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DSMapMarker> _generateClusterMarkers() {
    return List.generate(15, (index) {
      return DSMapMarker(
        id: 'cluster_marker_$index',
        position: DSLatLng(
          latitude: 37.7749 + (index * 0.003) - 0.02,
          longitude: -122.4194 + (index * 0.003) - 0.02,
        ),
        title: 'Punto $index',
        description: 'Descripción del punto $index',
        iconData: Icons.place,
        color: Colors.red,
      );
    });
  }
}