import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iautomat_design_system/src/components/map/ds_map.dart';
import 'package:iautomat_design_system/src/components/map/ds_map_config.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('DSMap Widget Tests', () {
    const testCenter = DSLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders correctly with custom center and zoom', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              zoom: 15.0,
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders correctly with markers', (tester) async {
      const markers = [
        DSMapMarker(
          id: 'marker1',
          position: testCenter,
          title: 'Test Marker',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              markers: markers,
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders correctly with shapes', (tester) async {
      const shapes = [
        DSMapShape(
          id: 'shape1',
          type: DSMapShapeType.polyline,
          points: [
            DSLatLng(latitude: 37.7749, longitude: -122.4194),
            DSLatLng(latitude: 37.7849, longitude: -122.4094),
          ],
          title: 'Test Shape',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              shapes: shapes,
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              enabled: false,
            ),
          ),
        ),
      );

      final map = tester.widget<DSMap>(find.byType(DSMap));
      expect(map.enabled, isFalse);
      await tester.pumpAndSettle();
    });

    testWidgets('handles tap interactions', (tester) async {
      DSLatLng? tappedPosition;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              onTap: (position) {
                tappedPosition = position;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSMap));
      await tester.pumpAndSettle();

      expect(find.byType(DSMap), findsOneWidget);
      expect(tappedPosition, isNotNull);
    });

    testWidgets('handles keyboard interactions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
            ),
          ),
        ),
      );

      // Obtener el foco
      await tester.tap(find.byType(DSMap));
      await tester.pump();

      // Simular navegación por teclado
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.equal);
      await tester.pump();

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders with custom configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              config: DSMapConfig(
                variant: DSMapVariant.clusters,
                theme: DSMapTheme.dark,
                behavior: const DSMapBehavior(
                  enableClustering: true,
                  clusterRadius: 100,
                ),
                a11yConfig: const DSMapA11yConfig(
                  semanticsLabel: 'Custom map',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              config: const DSMapConfig(
                state: DSMapState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      expect(find.text('Cargando mapa...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('renders skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              config: const DSMapConfig(
                state: DSMapState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('supports different themes', (tester) async {
      for (final theme in DSMapTheme.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSMap(
                center: testCenter,
                theme: theme,
              ),
            ),
          ),
        );

        expect(find.byType(DSMap), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('calls callbacks correctly', (tester) async {

      const marker = DSMapMarker(
        id: 'marker1',
        position: testCenter,
        title: 'Test Marker',
      );

      const shape = DSMapShape(
        id: 'shape1',
        type: DSMapShapeType.circle,
        points: [testCenter],
        title: 'Test Shape',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
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

      final map = tester.widget<DSMap>(find.byType(DSMap));
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
                  child: DSMap(
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
      await tester.tap(find.byType(DSMap));
      await tester.pump();

      // Cambiar foco al TextField
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('supports different variants', (tester) async {
      for (final variant in DSMapVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSMap(
                center: testCenter,
                config: DSMapConfig(
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(DSMap), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('handles semantic properties correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              config: const DSMapConfig(
                a11yConfig: DSMapA11yConfig(
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
      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles clustering correctly', (tester) async {
      final markers = List.generate(10, (index) {
        return DSMapMarker(
          id: 'marker$index',
          position: DSLatLng(
            latitude: testCenter.latitude + (index * 0.001),
            longitude: testCenter.longitude + (index * 0.001),
          ),
          title: 'Marker $index',
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: testCenter,
              markers: markers,
              config: const DSMapConfig(
                variant: DSMapVariant.clusters,
                behavior: DSMapBehavior(
                  enableClustering: true,
                  clusterRadius: 50,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });

  group('DSMap Configuration Tests', () {
    testWidgets('updates when configuration changes', (tester) async {
      DSMapConfig config = const DSMapConfig(
        theme: DSMapTheme.light,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Column(
                  children: [
                    Expanded(
                      child: DSMap(
                        center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
                        config: config,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          config = const DSMapConfig(
                            theme: DSMapTheme.dark,
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

      expect(find.byType(DSMap), findsOneWidget);
    });

    testWidgets('respects spacing configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
              config: const DSMapConfig(
                spacing: DSMapSpacing(
                  padding: EdgeInsets.all(24.0),
                  borderRadius: 16.0,
                  minHeight: 300.0,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('respects animation configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: const DSLatLng(latitude: 37.7749, longitude: -122.4194),
              config: const DSMapConfig(
                animation: DSMapAnimation(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });

  group('DSMap Extension Tests', () {
    test('DSMapVariant extension works correctly', () {
      expect(DSMapVariant.markers.displayName, equals('Marcadores'));
      expect(DSMapVariant.clusters.displayName, equals('Clusters'));

      expect(DSMapVariant.markers.enablesClustering, isFalse);
      expect(DSMapVariant.clusters.enablesClustering, isTrue);
    });

    test('DSMapState extension works correctly', () {
      expect(DSMapState.defaultState.canInteract, isTrue);
      expect(DSMapState.hover.canInteract, isTrue);
      expect(DSMapState.pressed.canInteract, isTrue);
      expect(DSMapState.focus.canInteract, isTrue);
      expect(DSMapState.selected.canInteract, isTrue);
      expect(DSMapState.disabled.canInteract, isFalse);
      expect(DSMapState.loading.canInteract, isFalse);
      expect(DSMapState.skeleton.canInteract, isFalse);
    });

    test('DSMapTheme extension works correctly', () {
      expect(DSMapTheme.light.displayName, equals('Claro'));
      expect(DSMapTheme.dark.displayName, equals('Oscuro'));
      expect(DSMapTheme.satellite.displayName, equals('Satelital'));

      expect(DSMapTheme.light.isDark, isFalse);
      expect(DSMapTheme.dark.isDark, isTrue);
      expect(DSMapTheme.satellite.isDark, isTrue);
    });

    test('DSLatLng extension works correctly', () {
      const position1 = DSLatLng(latitude: 37.7749, longitude: -122.4194);
      const position2 = DSLatLng(latitude: 37.7849, longitude: -122.4094);

      expect(position1.isValid, isTrue);
      expect(position1.displayString, contains('37.774900'));
      expect(position1.displayString, contains('-122.419400'));

      final distance = position1.distanceTo(position2);
      expect(distance, greaterThan(0));
      expect(distance, lessThan(20)); // Should be less than 20km
    });

    test('DSMapMarkerType extension works correctly', () {
      expect(DSMapMarkerType.standard.displayName, equals('Estándar'));
      expect(DSMapMarkerType.custom.displayName, equals('Personalizado'));
      expect(DSMapMarkerType.cluster.displayName, equals('Cluster'));

      expect(DSMapMarkerType.standard.defaultIcon, isNotNull);
      expect(DSMapMarkerType.custom.defaultIcon, isNotNull);
      expect(DSMapMarkerType.cluster.defaultIcon, isNotNull);
    });

    test('DSMapShapeType extension works correctly', () {
      expect(DSMapShapeType.polyline.displayName, equals('Línea'));
      expect(DSMapShapeType.polygon.displayName, equals('Polígono'));
      expect(DSMapShapeType.circle.displayName, equals('Círculo'));
      expect(DSMapShapeType.rectangle.displayName, equals('Rectángulo'));

      expect(DSMapShapeType.polyline.requiresMultiplePoints, isTrue);
      expect(DSMapShapeType.polygon.requiresMultiplePoints, isTrue);
      expect(DSMapShapeType.circle.requiresMultiplePoints, isFalse);
      expect(DSMapShapeType.rectangle.requiresMultiplePoints, isFalse);

      expect(DSMapShapeType.polyline.minimumPoints, equals(2));
      expect(DSMapShapeType.polygon.minimumPoints, equals(3));
      expect(DSMapShapeType.circle.minimumPoints, equals(1));
      expect(DSMapShapeType.rectangle.minimumPoints, equals(2));
    });
  });

  group('DSMap Error Handling Tests', () {
    testWidgets('handles invalid coordinates gracefully', (tester) async {
      const invalidCenter = DSLatLng(latitude: 200, longitude: 300);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: invalidCenter,
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles empty markers list', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
              markers: [],
            ),
          ),
        ),
      );

      expect(find.byType(DSMap), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('handles null callbacks gracefully', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSMap(
              center: DSLatLng(latitude: 37.7749, longitude: -122.4194),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSMap));
      await tester.pumpAndSettle();

      expect(find.byType(DSMap), findsOneWidget);
    });
  });

  group('DSMapMarker and DSMapShape Tests', () {
    test('DSMapMarker copyWith works correctly', () {
      const originalMarker = DSMapMarker(
        id: 'test',
        position: DSLatLng(latitude: 0, longitude: 0),
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

    test('DSMapShape isValid works correctly', () {
      const validPolyline = DSMapShape(
        id: 'test',
        type: DSMapShapeType.polyline,
        points: [
          DSLatLng(latitude: 0, longitude: 0),
          DSLatLng(latitude: 1, longitude: 1),
        ],
      );

      const invalidPolyline = DSMapShape(
        id: 'test',
        type: DSMapShapeType.polyline,
        points: [
          DSLatLng(latitude: 0, longitude: 0),
        ],
      );

      expect(validPolyline.isValid, isTrue);
      expect(invalidPolyline.isValid, isFalse);
    });

    test('DSMapShape center calculation works correctly', () {
      const shape = DSMapShape(
        id: 'test',
        type: DSMapShapeType.polygon,
        points: [
          DSLatLng(latitude: 0, longitude: 0),
          DSLatLng(latitude: 1, longitude: 0),
          DSLatLng(latitude: 0.5, longitude: 1),
        ],
      );

      final center = shape.center;
      expect(center.latitude, closeTo(0.5, 0.1));
      expect(center.longitude, closeTo(0.33, 0.1));
    });
  });
}