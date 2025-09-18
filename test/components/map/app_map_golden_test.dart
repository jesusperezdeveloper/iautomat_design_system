import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iautomat_design_system/src/components/map/app_map.dart';
import 'package:iautomat_design_system/src/components/map/app_map_config.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('AppMap Golden Tests', () {
    const testCenter = AppLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_default.png'),
      );
    });

    testWidgets('with markers golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  markers: [
                    AppMapMarker(
                      id: 'marker1',
                      position: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                      title: 'San Francisco',
                    ),
                    AppMapMarker(
                      id: 'marker2',
                      position: AppLatLng(latitude: 37.7849, longitude: -122.4094),
                      title: 'North Beach',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_with_markers.png'),
      );
    });

    testWidgets('with shapes golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  shapes: [
                    AppMapShape(
                      id: 'polyline1',
                      type: AppMapShapeType.polyline,
                      points: [
                        AppLatLng(latitude: 37.7749, longitude: -122.4194),
                        AppLatLng(latitude: 37.7849, longitude: -122.4094),
                      ],
                      title: 'Route',
                    ),
                    AppMapShape(
                      id: 'circle1',
                      type: AppMapShapeType.circle,
                      points: [
                        AppLatLng(latitude: 37.7649, longitude: -122.4294),
                      ],
                      title: 'Area',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_with_shapes.png'),
      );
    });

    testWidgets('disabled state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_disabled.png'),
      );
    });

    testWidgets('loading state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppMap(
                  center: testCenter,
                  config: const AppMapConfig(
                    state: AppMapState.loading,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_loading.png'),
      );
    });

    testWidgets('skeleton state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppMap(
                  center: testCenter,
                  config: const AppMapConfig(
                    state: AppMapState.skeleton,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_skeleton.png'),
      );
    });

    testWidgets('custom styling golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppMap(
                  center: testCenter,
                  config: AppMapConfig(
                    colors: const AppMapColors(
                      backgroundColor: Colors.blue,
                      borderColor: Colors.red,
                      markerColor: Colors.green,
                    ),
                    spacing: const AppMapSpacing(
                      borderRadius: 20.0,
                      borderWidth: 3.0,
                      elevation: 8.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_custom.png'),
      );
    });

    testWidgets('cluster variant golden test', (tester) async {
      final markers = List.generate(8, (index) {
        return AppMapMarker(
          id: 'marker$index',
          position: AppLatLng(
            latitude: testCenter.latitude + (index * 0.002),
            longitude: testCenter.longitude + (index * 0.002),
          ),
          title: 'Marker $index',
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppMap(
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
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_clusters.png'),
      );
    });

    testWidgets('focus state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppMap(
                  center: testCenter,
                  config: const AppMapConfig(
                    state: AppMapState.focus,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_focus.png'),
      );
    });
  });

  group('AppMap Theme Golden Tests', () {
    const testCenter = AppLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('light theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  theme: AppMapTheme.light,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_theme_light.png'),
      );
    });

    testWidgets('dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  theme: AppMapTheme.dark,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_theme_dark.png'),
      );
    });

    testWidgets('satellite theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  theme: AppMapTheme.satellite,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_theme_satellite.png'),
      );
    });

    testWidgets('hybrid theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  theme: AppMapTheme.hybrid,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_theme_hybrid.png'),
      );
    });

    testWidgets('terrain theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  theme: AppMapTheme.terrain,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_theme_terrain.png'),
      );
    });
  });

  group('AppMap RTL Golden Tests', () {
    const testCenter = AppLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('RTL layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 400,
                  height: 300,
                  child: const AppMap(
                    center: testCenter,
                    markers: [
                      AppMapMarker(
                        id: 'marker1',
                        position: testCenter,
                        title: 'نقطة على الخريطة',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_rtl.png'),
      );
    });
  });

  group('AppMap Size Variants Golden Tests', () {
    const testCenter = AppLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('small size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: AppMap(
                  center: testCenter,
                  config: const AppMapConfig(
                    spacing: AppMapSpacing(
                      minHeight: 100,
                      minWidth: 150,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_small.png'),
      );
    });

    testWidgets('large size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 600,
                height: 400,
                child: AppMap(
                  center: testCenter,
                  config: const AppMapConfig(
                    spacing: AppMapSpacing(
                      minHeight: 350,
                      minWidth: 500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_large.png'),
      );
    });
  });

  group('AppMap Complex Scenarios Golden Tests', () {
    const testCenter = AppLatLng(latitude: 37.7749, longitude: -122.4194);

    testWidgets('complex map with all elements golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 500,
                height: 400,
                child: const AppMap(
                  center: testCenter,
                  zoom: 13.0,
                  markers: [
                    AppMapMarker(
                      id: 'marker1',
                      position: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                      title: 'Centro',
                      type: AppMapMarkerType.standard,
                    ),
                    AppMapMarker(
                      id: 'marker2',
                      position: AppLatLng(latitude: 37.7849, longitude: -122.4094),
                      title: 'Norte',
                      type: AppMapMarkerType.custom,
                    ),
                  ],
                  shapes: [
                    AppMapShape(
                      id: 'route',
                      type: AppMapShapeType.polyline,
                      points: [
                        AppLatLng(latitude: 37.7749, longitude: -122.4194),
                        AppLatLng(latitude: 37.7849, longitude: -122.4094),
                      ],
                      title: 'Ruta',
                    ),
                    AppMapShape(
                      id: 'area',
                      type: AppMapShapeType.polygon,
                      points: [
                        AppLatLng(latitude: 37.7649, longitude: -122.4294),
                        AppLatLng(latitude: 37.7749, longitude: -122.4294),
                        AppLatLng(latitude: 37.7699, longitude: -122.4194),
                      ],
                      title: 'Área',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_complex.png'),
      );
    });

    testWidgets('map with custom markers golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: const AppMap(
                  center: testCenter,
                  markers: [
                    AppMapMarker(
                      id: 'custom1',
                      position: AppLatLng(latitude: 37.7749, longitude: -122.4194),
                      title: 'Restaurante',
                      iconData: Icons.restaurant,
                      color: Colors.orange,
                    ),
                    AppMapMarker(
                      id: 'custom2',
                      position: AppLatLng(latitude: 37.7849, longitude: -122.4094),
                      title: 'Hotel',
                      iconData: Icons.hotel,
                      color: Colors.blue,
                    ),
                    AppMapMarker(
                      id: 'custom3',
                      position: AppLatLng(latitude: 37.7649, longitude: -122.4294),
                      title: 'Tienda',
                      iconData: Icons.shopping_cart,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppMap),
        matchesGoldenFile('goldens/app_map_custom_markers.png'),
      );
    });
  });
}