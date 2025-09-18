import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iautomat_design_system/src/components/map/app_map.dart';
import 'package:iautomat_design_system/src/components/map/app_map_config.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('AppMap Widget Tests', () {
    const testCenter = AppLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders correctly with custom center and zoom', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              zoom: 15.0,
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders correctly with markers', (tester) async {
      const markers = [
        AppMapMarker(
          id: 'marker1',
          position: testCenter,
          title: 'Test Marker',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              markers: markers,
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders correctly with shapes', (tester) async {
      const shapes = [
        AppMapShape(
          id: 'shape1',
          type: AppMapShapeType.polyline,
          points: [
            AppLatLng(latitude: 37.7749, longitude: -122.4194),
            AppLatLng(latitude: 37.7849, longitude: -122.4094),
          ],
          title: 'Test Shape',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              shapes: shapes,
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              enabled: false,
            ),
          ),
        ),
      );

      final map = tester.widget<AppMap>(find.byType(AppMap));
      expect(map.enabled, isFalse);
      await tester.pumpAndSettle();
    });

    testWidgets('handles tap interactions', (tester) async {
      AppLatLng? tappedPosition;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              onTap: (position) {
                tappedPosition = position;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppMap));
      await tester.pumpAndSettle();

      expect(find.byType(AppMap), findsOneWidget);
      expect(tappedPosition, isNotNull);
    });

    testWidgets('handles keyboard interactions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
            ),
          ),
        ),
      );

      // Obtener el foco
      await tester.tap(find.byType(AppMap));
      await tester.pump();

      // Simular navegación por teclado
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.equal);
      await tester.pump();

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders with custom configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              config: AppMapConfig(
                variant: AppMapVariant.clusters,
                theme: AppMapTheme.dark,
                behavior: const AppMapBehavior(
                  enableClustering: true,
                  clusterRadius: 100,
                ),
                a11yConfig: const AppMapA11yConfig(
                  semanticsLabel: 'Custom map',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              config: const AppMapConfig(
                state: AppMapState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      expect(find.text('Cargando mapa...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              config: const AppMapConfig(
                state: AppMapState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('supports different themes', (tester) async {
      for (final theme in AppMapTheme.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppMap(
                center: testCenter,
                theme: theme,
              ),
            ),
          ),
        );

        expect(find.byType(AppMap), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('calls callbacks correctly', (tester) async {

      const marker = AppMapMarker(
        id: 'marker1',
        position: testCenter,
        title: 'Test Marker',
      );

      const shape = AppMapShape(
        id: 'shape1',
        type: AppMapShapeType.circle,
        points: [testCenter],
        title: 'Test Shape',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              markers: const [marker],
              shapes: const [shape],
              onTap: (position) => {},
              onMarkerTap: (m) => {},
              onShapeTap: (s) => {},
            ),
          ),
        ),
      );

      final map = tester.widget<AppMap>(find.byType(AppMap));
      expect(map.onTap, isNotNull);
      expect(map.onMarkerTap, isNotNull);
      expect(map.onShapeTap, isNotNull);

      await tester.pumpAndSettle();
    });

    testWidgets('handles focus changes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: AppMap(
                    center: testCenter,
                  ),
                ),
                TextField(),
              ],
            ),
          ),
        ),
      );

      // Cambiar foco al mapa
      await tester.tap(find.byType(AppMap));
      await tester.pump();

      // Cambiar foco al TextField
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('supports different variants', (tester) async {
      for (final variant in AppMapVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppMap(
                center: testCenter,
                config: AppMapConfig(
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppMap), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('handles semantic properties correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              config: const AppMapConfig(
                a11yConfig: AppMapA11yConfig(
                  semanticsLabel: 'Test map',
                  semanticsDescription: 'Interactive map for testing',
                  semanticsHint: 'Tap to interact',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsWidgets);
      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles clustering correctly', (tester) async {
      final markers = List.generate(10, (index) {
        return AppMapMarker(
          id: 'marker$index',
          position: AppLatLng(
            latitude: testCenter.latitude + (index * 0.001),
            longitude: testCenter.longitude + (index * 0.001),
          ),
          title: 'Marker $index',
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: testCenter,
              markers: markers,
              config: const AppMapConfig(
                variant: AppMapVariant.clusters,
                behavior: AppMapBehavior(
                  enableClustering: true,
                  clusterRadius: 50,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });

  group('AppMap Configuration Tests', () {
    testWidgets('updates when configuration changes', (tester) async {
      AppMapConfig config = const AppMapConfig(
        theme: AppMapTheme.light,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Column(
                  children: [
                    Expanded(
                      child: AppMap(
                        center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
                        config: config,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          config = const AppMapConfig(
                            theme: AppMapTheme.dark,
                          );
                        });
                      },
                      child: const Text('Change Theme'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

      // Cambiar configuración
      await tester.tap(find.text('Change Theme'));
      await tester.pumpAndSettle();

      expect(find.byType(AppMap), findsOneWidget);
    });

    testWidgets('respects spacing configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
              config: const AppMapConfig(
                spacing: AppMapSpacing(
                  padding: EdgeInsets.all(24.0),
                  borderRadius: 16.0,
                  minHeight: 300.0,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('respects animation configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: const AppLatLng(latitude: 37.7749, longitude: -122.4194),
              config: const AppMapConfig(
                animation: AppMapAnimation(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });

  group('AppMap Extension Tests', () {
    test('AppMapVariant extension works correctly', () {
      expect(AppMapVariant.markers.displayName, equals('Marcadores'));
      expect(AppMapVariant.clusters.displayName, equals('Clusters'));

      expect(AppMapVariant.markers.enablesClustering, isFalse);
      expect(AppMapVariant.clusters.enablesClustering, isTrue);
    });

    test('AppMapState extension works correctly', () {
      expect(AppMapState.defaultState.canInteract, isTrue);
      expect(AppMapState.hover.canInteract, isTrue);
      expect(AppMapState.pressed.canInteract, isTrue);
      expect(AppMapState.focus.canInteract, isTrue);
      expect(AppMapState.selected.canInteract, isTrue);
      expect(AppMapState.disabled.canInteract, isFalse);
      expect(AppMapState.loading.canInteract, isFalse);
      expect(AppMapState.skeleton.canInteract, isFalse);
    });

    test('AppMapTheme extension works correctly', () {
      expect(AppMapTheme.light.displayName, equals('Claro'));
      expect(AppMapTheme.dark.displayName, equals('Oscuro'));
      expect(AppMapTheme.satellite.displayName, equals('Satelital'));

      expect(AppMapTheme.light.isDark, isFalse);
      expect(AppMapTheme.dark.isDark, isTrue);
      expect(AppMapTheme.satellite.isDark, isTrue);
    });

    test('AppLatLng extension works correctly', () {
      const position1 = AppLatLng(latitude: 37.7749, longitude: -122.4194);
      const position2 = AppLatLng(latitude: 37.7849, longitude: -122.4094);

      expect(position1.isValid, isTrue);
      expect(position1.displayString, contains('37.774900'));
      expect(position1.displayString, contains('-122.419400'));

      final distance = position1.distanceTo(position2);
      expect(distance, greaterThan(0));
      expect(distance, lessThan(20)); // Should be less than 20km
    });

    test('AppMapMarkerType extension works correctly', () {
      expect(AppMapMarkerType.standard.displayName, equals('Estándar'));
      expect(AppMapMarkerType.custom.displayName, equals('Personalizado'));
      expect(AppMapMarkerType.cluster.displayName, equals('Cluster'));

      expect(AppMapMarkerType.standard.defaultIcon, isNotNull);
      expect(AppMapMarkerType.custom.defaultIcon, isNotNull);
      expect(AppMapMarkerType.cluster.defaultIcon, isNotNull);
    });

    test('AppMapShapeType extension works correctly', () {
      expect(AppMapShapeType.polyline.displayName, equals('Línea'));
      expect(AppMapShapeType.polygon.displayName, equals('Polígono'));
      expect(AppMapShapeType.circle.displayName, equals('Círculo'));
      expect(AppMapShapeType.rectangle.displayName, equals('Rectángulo'));

      expect(AppMapShapeType.polyline.requiresMultiplePoints, isTrue);
      expect(AppMapShapeType.polygon.requiresMultiplePoints, isTrue);
      expect(AppMapShapeType.circle.requiresMultiplePoints, isFalse);
      expect(AppMapShapeType.rectangle.requiresMultiplePoints, isFalse);

      expect(AppMapShapeType.polyline.minimumPoints, equals(2));
      expect(AppMapShapeType.polygon.minimumPoints, equals(3));
      expect(AppMapShapeType.circle.minimumPoints, equals(1));
      expect(AppMapShapeType.rectangle.minimumPoints, equals(2));
    });
  });

  group('AppMap Error Handling Tests', () {
    testWidgets('handles invalid coordinates gracefully', (tester) async {
      const invalidCenter = AppLatLng(latitude: 200, longitude: 300);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: invalidCenter,
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles empty markers list', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
              markers: [],
            ),
          ),
        ),
      );

      expect(find.byType(AppMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles null callbacks gracefully', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMap(
              center: AppLatLng(latitude: 37.7749, longitude: -122.4194),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppMap));
      await tester.pumpAndSettle();

      expect(find.byType(AppMap), findsOneWidget);
    });
  });

  group('AppMapMarker and AppMapShape Tests', () {
    test('AppMapMarker copyWith works correctly', () {
      const originalMarker = AppMapMarker(
        id: 'test',
        position: AppLatLng(latitude: 0, longitude: 0),
        title: 'Original',
      );

      final updatedMarker = originalMarker.copyWith(
        title: 'Updated',
        description: 'New description',
      );

      expect(updatedMarker.id, equals('test'));
      expect(updatedMarker.title, equals('Updated'));
      expect(updatedMarker.description, equals('New description'));
      expect(updatedMarker.position, equals(originalMarker.position));
    });

    test('AppMapShape isValid works correctly', () {
      const validPolyline = AppMapShape(
        id: 'test',
        type: AppMapShapeType.polyline,
        points: [
          AppLatLng(latitude: 0, longitude: 0),
          AppLatLng(latitude: 1, longitude: 1),
        ],
      );

      const invalidPolyline = AppMapShape(
        id: 'test',
        type: AppMapShapeType.polyline,
        points: [
          AppLatLng(latitude: 0, longitude: 0),
        ],
      );

      expect(validPolyline.isValid, isTrue);
      expect(invalidPolyline.isValid, isFalse);
    });

    test('AppMapShape center calculation works correctly', () {
      const shape = AppMapShape(
        id: 'test',
        type: AppMapShapeType.polygon,
        points: [
          AppLatLng(latitude: 0, longitude: 0),
          AppLatLng(latitude: 1, longitude: 0),
          AppLatLng(latitude: 0.5, longitude: 1),
        ],
      );

      final center = shape.center;
      expect(center.latitude, closeTo(0.5, 0.1));
      expect(center.longitude, closeTo(0.33, 0.1));
    });
  });
}