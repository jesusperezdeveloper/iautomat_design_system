import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story de AppMap con ejemplos y casos de uso
class MapStory extends StatefulWidget {
  const MapStory({super.key});

  @override
  State<MapStory> createState() => _MapStoryState();
}

class _MapStoryState extends State<MapStory> {
  AppLatLng _currentCenter = const AppLatLng(latitude: 37.7749, longitude: -122.4194);
  double _currentZoom = 12.0;
  AppMapTheme _selectedTheme = AppMapTheme.light;
  AppMapVariant _selectedVariant = AppMapVariant.markers;
  List<AppMapMarker> _markers = [];
  List<AppMapShape> _shapes = [];
  String? _lastTapInfo;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _initializeDefaultData();
  }

  void _initializeDefaultData() {
    _markers = [
      const AppMapMarker(
        id: 'sf_center',
        position: AppLatLng(latitude: 37.7749, longitude: -122.4194),
        title: 'San Francisco',
        description: 'Centro de la ciudad',
        iconData: Icons.location_city,
        color: Colors.blue,
      ),
      const AppMapMarker(
        id: 'golden_gate',
        position: AppLatLng(latitude: 37.8199, longitude: -122.4786),
        title: 'Golden Gate Bridge',
        description: 'Puente icónico',
        iconData: Icons.place,
        color: Colors.orange,
      ),
      const AppMapMarker(
        id: 'alcatraz',
        position: AppLatLng(latitude: 37.8267, longitude: -122.4233),
        title: 'Alcatraz Island',
        description: 'Isla histórica',
        iconData: Icons.museum,
        color: Colors.red,
      ),
      const AppMapMarker(
        id: 'pier39',
        position: AppLatLng(latitude: 37.8087, longitude: -122.4098),
        title: 'Pier 39',
        description: 'Muelle turístico',
        iconData: Icons.directions_boat,
        color: Colors.green,
      ),
    ];

    _shapes = [
      const AppMapShape(
        id: 'route_downtown',
        type: AppMapShapeType.polyline,
        points: [
          AppLatLng(latitude: 37.7749, longitude: -122.4194),
          AppLatLng(latitude: 37.7949, longitude: -122.4094),
          AppLatLng(latitude: 37.8049, longitude: -122.4194),
        ],
        title: 'Ruta Downtown',
        strokeColor: Colors.blue,
      ),
      const AppMapShape(
        id: 'mission_area',
        type: AppMapShapeType.polygon,
        points: [
          AppLatLng(latitude: 37.7549, longitude: -122.4294),
          AppLatLng(latitude: 37.7649, longitude: -122.4094),
          AppLatLng(latitude: 37.7449, longitude: -122.4094),
          AppLatLng(latitude: 37.7449, longitude: -122.4294),
        ],
        title: 'Distrito Mission',
        strokeColor: Colors.green,
        fillColor: Colors.green,
      ),
      const AppMapShape(
        id: 'coverage_area',
        type: AppMapShapeType.circle,
        points: [
          AppLatLng(latitude: 37.7749, longitude: -122.4194),
        ],
        title: 'Área de Cobertura',
        strokeColor: Colors.purple,
        fillColor: Colors.purple,
      ),
    ];
  }

  void _onMapTap(AppLatLng position) {
    setState(() {
      _lastTapInfo = 'Tocaste en: ${position.displayString}';
      _lastError = null;
    });
  }

  void _onMarkerTap(AppMapMarker marker) {
    setState(() {
      _lastTapInfo = 'Marcador: ${marker.title} - ${marker.description}';
      _lastError = null;
    });
  }


  void _onCameraMove(AppMapCameraPosition position) {
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
        title: const Text('AppMap Story'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de estado
            _buildStatusCard(),
            const SizedBox(height: AppSpacing.lg),

            // Controles
            _buildControlsCard(),
            const SizedBox(height: AppSpacing.lg),

            // Casos de uso básicos
            _buildSection(
              title: 'Casos de Uso Básicos',
              children: [
                _buildExample(
                  title: 'Mapa Básico',
                  description: 'Mapa simple con marcadores',
                  height: 250,
                  widget: AppMap(
                    center: _currentCenter,
                    zoom: _currentZoom,
                    theme: _selectedTheme,
                    markers: _selectedVariant == AppMapVariant.markers
                        ? _markers.take(2).toList()
                        : _markers,
                    onTap: _onMapTap,
                    onMarkerTap: _onMarkerTap,
                    onCameraMove: _onCameraMove,
                    onError: _onError,
                    config: AppMapConfig(
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
                  widget: const AppMap(
                    center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    enabled: false,
                  ),
                ),
                _buildExample(
                  title: 'Estado de Carga',
                  description: 'Muestra indicador de progreso',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      state: AppMapState.loading,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Skeleton',
                  description: 'Placeholder durante carga inicial',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      state: AppMapState.skeleton,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Focus',
                  description: 'Resaltado para navegación por teclado',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      state: AppMapState.focus,
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
                  widget: const AppMap(
                    center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: AppMapTheme.light,
                  ),
                ),
                _buildExample(
                  title: 'Tema Oscuro',
                  description: 'Tema para ambientes con poca luz',
                  height: 200,
                  widget: const AppMap(
                    center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: AppMapTheme.dark,
                  ),
                ),
                _buildExample(
                  title: 'Tema Satelital',
                  description: 'Vista satelital de alta resolución',
                  height: 200,
                  widget: const AppMap(
                    center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: AppMapTheme.satellite,
                  ),
                ),
                _buildExample(
                  title: 'Tema Híbrido',
                  description: 'Combina vista satelital con etiquetas',
                  height: 200,
                  widget: const AppMap(
                    center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: AppMapTheme.hybrid,
                  ),
                ),
                _buildExample(
                  title: 'Tema Terreno',
                  description: 'Muestra características topográficas',
                  height: 200,
                  widget: const AppMap(
                    center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    theme: AppMapTheme.terrain,
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    markers: _markers,
                    config: const AppMapConfig(
                      variant: AppMapVariant.markers,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Marcadores Agrupados (Clusters)',
                  description: 'Marcadores cercanos se agrupan automáticamente',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    markers: _generateClusterMarkers(),
                    config: const AppMapConfig(
                      variant: AppMapVariant.clusters,
                      behavior: AppMapBehavior(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    shapes: _shapes.where((s) => s.type == AppMapShapeType.polyline).toList(),
                  ),
                ),
                _buildExample(
                  title: 'Polígonos',
                  description: 'Áreas y regiones',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7549, longitude: -122.4194),
                    shapes: _shapes.where((s) => s.type == AppMapShapeType.polygon).toList(),
                  ),
                ),
                _buildExample(
                  title: 'Círculos',
                  description: 'Áreas de cobertura',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    shapes: _shapes.where((s) => s.type == AppMapShapeType.circle).toList(),
                  ),
                ),
                _buildExample(
                  title: 'Formas Combinadas',
                  description: 'Múltiples tipos de formas',
                  height: 200,
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    markers: [_markers.first],
                    config: AppMapConfig(
                      colors: const AppMapColors(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      spacing: AppMapSpacing(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      animation: AppMapAnimation(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      behavior: AppMapBehavior(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      behavior: AppMapBehavior(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      behavior: AppMapBehavior(
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
                  widget: AppMap(
                    center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                    config: const AppMapConfig(
                      a11yConfig: AppMapA11yConfig(
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
                    child: AppMap(
                      center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                      markers: const [
                        AppMapMarker(
                          id: 'rtl_marker',
                          position: AppLatLng(latitude: 37.7749, longitude: -122.4194),
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
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estado Actual del Mapa',
              style: AppTypography.h6,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Centro: ${_currentCenter.displayString}',
              style: AppTypography.bodyMedium,
            ),
            Text(
              'Zoom: ${_currentZoom.toStringAsFixed(1)}',
              style: AppTypography.bodyMedium,
            ),
            Text(
              'Tema: ${_selectedTheme.displayName}',
              style: AppTypography.bodyMedium,
            ),
            Text(
              'Variante: ${_selectedVariant.displayName}',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_lastTapInfo != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _lastTapInfo!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            if (_lastError != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _lastError!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
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
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Controles',
              style: AppTypography.h6,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tema:', style: AppTypography.labelMedium),
                      DropdownButton<AppMapTheme>(
                        value: _selectedTheme,
                        isExpanded: true,
                        onChanged: (theme) {
                          if (theme != null) {
                            setState(() {
                              _selectedTheme = theme;
                            });
                          }
                        },
                        items: AppMapTheme.values.map((theme) {
                          return DropdownMenuItem(
                            value: theme,
                            child: Text(theme.displayName),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Variante:', style: AppTypography.labelMedium),
                      DropdownButton<AppMapVariant>(
                        value: _selectedVariant,
                        isExpanded: true,
                        onChanged: (variant) {
                          if (variant != null) {
                            setState(() {
                              _selectedVariant = variant;
                            });
                          }
                        },
                        items: AppMapVariant.values.map((variant) {
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
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentCenter = const AppLatLng(latitude: 37.7749, longitude: -122.4194);
                      _currentZoom = 12.0;
                    });
                  },
                  child: const Text('Centrar SF'),
                ),
                const SizedBox(width: AppSpacing.sm),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentCenter = const AppLatLng(latitude: 40.7128, longitude: -74.0060);
                      _currentZoom = 11.0;
                    });
                  },
                  child: const Text('Centrar NY'),
                ),
                const SizedBox(width: AppSpacing.sm),
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
          style: AppTypography.h5,
        ),
        const SizedBox(height: AppSpacing.md),
        ...children,
        const SizedBox(height: AppSpacing.lg),
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
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.gray600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
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
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App de Delivery',
              style: AppTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Ejemplo de uso en una aplicación de delivery',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.gray600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Simulación de interfaz de delivery
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Header de la app
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.delivery_dining, color: Colors.white),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'QuickFood Delivery',
                          style: AppTypography.labelLarge.copyWith(
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
                    child: AppMap(
                      center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                      zoom: 14.0,
                      markers: [
                        const AppMapMarker(
                          id: 'user',
                          position: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                          title: 'Tu ubicación',
                          iconData: Icons.person_pin,
                          color: Colors.blue,
                        ),
                        const AppMapMarker(
                          id: 'restaurant',
                          position: AppLatLng(latitude: 37.7849, longitude: -122.4094),
                          title: 'Restaurante',
                          iconData: Icons.restaurant,
                          color: Colors.orange,
                        ),
                        const AppMapMarker(
                          id: 'delivery1',
                          position: AppLatLng(latitude: 37.7649, longitude: -122.4294),
                          title: 'Repartidor #1',
                          iconData: Icons.motorcycle,
                          color: Colors.green,
                        ),
                        const AppMapMarker(
                          id: 'delivery2',
                          position: AppLatLng(latitude: 37.7549, longitude: -122.4394),
                          title: 'Repartidor #2',
                          iconData: Icons.motorcycle,
                          color: Colors.green,
                        ),
                      ],
                      shapes: const [
                        AppMapShape(
                          id: 'delivery_route',
                          type: AppMapShapeType.polyline,
                          points: [
                            AppLatLng(latitude: 37.7849, longitude: -122.4094),
                            AppLatLng(latitude: 37.7799, longitude: -122.4144),
                            AppLatLng(latitude: 37.7749, longitude: -122.4194),
                          ],
                          title: 'Ruta de entrega',
                          strokeColor: Colors.green,
                        ),
                        AppMapShape(
                          id: 'coverage_area',
                          type: AppMapShapeType.circle,
                          points: [
                            AppLatLng(latitude: 37.7749, longitude: -122.4194),
                          ],
                          title: 'Área de entrega',
                          strokeColor: Colors.blue,
                          fillColor: Colors.blue,
                        ),
                      ],
                      config: const AppMapConfig(
                        variant: AppMapVariant.markers,
                        behavior: AppMapBehavior(
                          enableZoom: true,
                          enablePan: true,
                        ),
                      ),
                    ),
                  ),

                  // Footer con información
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.gray100,
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
                          style: AppTypography.bodySmall,
                        ),
                        const Spacer(),
                        Text(
                          '2 repartidores cerca',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.success,
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

  List<AppMapMarker> _generateClusterMarkers() {
    return List.generate(15, (index) {
      return AppMapMarker(
        id: 'cluster_marker_$index',
        position: AppLatLng(
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