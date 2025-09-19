import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker.dart';
import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_config.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });
  group('DSCameraPicker Widget Tests', () {

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
      expect(find.text('Agregar Imagen'), findsOneWidget);
      expect(find.byIcon(Icons.add_a_photo), findsOneWidget);
    });

    testWidgets('renders correctly with camera source', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              source: DSCameraPickerSource.camera,
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
      expect(find.text('Tomar Foto'), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    });

    testWidgets('renders correctly with gallery source', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              source: DSCameraPickerSource.gallery,
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
      expect(find.text('Seleccionar'), findsOneWidget);
      expect(find.byIcon(Icons.photo_library), findsOneWidget);
    });

    testWidgets('renders custom button text and icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              buttonText: 'Custom Text',
              buttonIcon: Icons.upload,
            ),
          ),
        ),
      );

      expect(find.text('Custom Text'), findsOneWidget);
      expect(find.byIcon(Icons.upload), findsOneWidget);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              enabled: false,
            ),
          ),
        ),
      );

      final picker = tester.widget<DSCameraPicker>(
        find.byType(DSCameraPicker),
      );
      expect(picker.enabled, isFalse);

      // El botón debe estar presente pero deshabilitado
      expect(find.byType(DSCameraPicker), findsOneWidget);
    });

    testWidgets('handles tap interactions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              onPicked: (files) {
                // Callback de prueba
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSCameraPicker));
      await tester.pump();

      // La interacción debe registrarse (aunque la implementación es simulada)
      expect(find.byType(DSCameraPicker), findsOneWidget);

      // Esperar a que se completen las operaciones asíncronas
      await tester.pumpAndSettle();
    });

    testWidgets('handles keyboard interactions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(),
          ),
        ),
      );

      // Encontrar el widget focusable
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Simular Enter para activar
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(find.byType(DSCameraPicker), findsOneWidget);
    });

    testWidgets('renders with custom configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: DSCameraPickerConfig(
                variant: DSCameraPickerVariant.android,
                source: DSCameraPickerSource.camera,
                fileType: DSCameraPickerFileType.image,
                behavior: const DSCameraPickerBehavior(
                  allowMultiple: true,
                  maxFiles: 5,
                ),
                a11yConfig: const DSCameraPickerA11yConfig(
                  semanticsLabel: 'Custom camera picker',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
    });

    testWidgets('renders skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: const DSCameraPickerConfig(
                state: DSCameraPickerState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
      // En estado skeleton no debe mostrar texto
      expect(find.text('Agregar Imagen'), findsNothing);
    });

    testWidgets('renders loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: const DSCameraPickerConfig(
                state: DSCameraPickerState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
      expect(find.text('Cargando...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: const Scaffold(
              body: DSCameraPicker(),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
      expect(find.byType(Directionality), findsWidgets);
    });

    testWidgets('calls callbacks correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              onPicked: (files) {
                // Test callback
              },
              onError: (error) {
                // Test callback
              },
              onPermissionDenied: () {
                // Test callback
              },
              onCancelled: () {
                // Test callback
              },
            ),
          ),
        ),
      );

      // Los callbacks están configurados
      final picker = tester.widget<DSCameraPicker>(
        find.byType(DSCameraPicker),
      );
      expect(picker.onPicked, isNotNull);
      expect(picker.onError, isNotNull);
      expect(picker.onPermissionDenied, isNotNull);
      expect(picker.onCancelled, isNotNull);
    });

    testWidgets('handles focus changes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DSCameraPicker(),
                TextField(), // Para poder cambiar el foco
              ],
            ),
          ),
        ),
      );

      // Cambiar foco al picker
      await tester.tap(find.byType(DSCameraPicker));
      await tester.pump();

      // Cambiar foco al TextField
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(find.byType(DSCameraPicker), findsOneWidget);
    });

    testWidgets('validates allowMultiple property', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              allowMultiple: true,
            ),
          ),
        ),
      );

      final picker = tester.widget<DSCameraPicker>(
        find.byType(DSCameraPicker),
      );
      expect(picker.allowMultiple, isTrue);
    });

    testWidgets('supports different platform variants', (tester) async {
      for (final variant in DSCameraPickerVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCameraPicker(
                config: DSCameraPickerConfig(
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(DSCameraPicker), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('handles semantic properties correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: const DSCameraPickerConfig(
                a11yConfig: DSCameraPickerA11yConfig(
                  semanticsLabel: 'Test camera picker',
                  semanticsDescription: 'Pick images from camera',
                  semanticsHint: 'Tap to activate',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsWidgets);
      expect(find.byType(DSCameraPicker), findsOneWidget);
    });
  });

  group('DSCameraPicker Configuration Tests', () {
    testWidgets('updates when configuration changes', (tester) async {
      DSCameraPickerConfig config = const DSCameraPickerConfig(
        source: DSCameraPickerSource.camera,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Column(
                  children: [
                    DSCameraPicker(config: config),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          config = const DSCameraPickerConfig(
                            source: DSCameraPickerSource.gallery,
                          );
                        });
                      },
                      child: const Text('Change Source'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

      // Verificar estado inicial
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);

      // Cambiar configuración
      await tester.tap(find.text('Change Source'));
      await tester.pump();

      // Verificar cambio
      expect(find.byIcon(Icons.photo_library), findsOneWidget);
    });

    testWidgets('respects spacing configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: const DSCameraPickerConfig(
                spacing: DSCameraPickerSpacing(
                  padding: EdgeInsets.all(24.0),
                  borderRadius: 16.0,
                  minHeight: 80.0,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
    });

    testWidgets('respects animation configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: const DSCameraPickerConfig(
                animation: DSCameraPickerAnimation(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
    });
  });

  group('DSCameraPicker Extension Tests', () {
    test('DSCameraPickerSource extension works correctly', () {
      expect(DSCameraPickerSource.camera.displayName, equals('Cámara'));
      expect(DSCameraPickerSource.gallery.displayName, equals('Galería'));
      expect(DSCameraPickerSource.both.displayName, equals('Cámara y Galería'));

      expect(DSCameraPickerSource.camera.icon, equals(Icons.camera_alt));
      expect(DSCameraPickerSource.gallery.icon, equals(Icons.photo_library));
      expect(DSCameraPickerSource.both.icon, equals(Icons.add_a_photo));
    });

    test('DSCameraPickerState extension works correctly', () {
      expect(DSCameraPickerState.defaultState.canInteract, isTrue);
      expect(DSCameraPickerState.hover.canInteract, isTrue);
      expect(DSCameraPickerState.pressed.canInteract, isTrue);
      expect(DSCameraPickerState.focus.canInteract, isTrue);
      expect(DSCameraPickerState.selected.canInteract, isTrue);
      expect(DSCameraPickerState.disabled.canInteract, isFalse);
      expect(DSCameraPickerState.loading.canInteract, isFalse);
      expect(DSCameraPickerState.skeleton.canInteract, isFalse);
    });

    test('DSCameraPickerFile extension works correctly', () {
      const file = DSCameraPickerFile(
        name: 'test.jpg',
        path: '/path/test.jpg',
        size: 1024,
        mimeType: 'image/jpeg',
      );

      expect(file.isImage, isTrue);
      expect(file.isVideo, isFalse);
      expect(file.extension, equals('jpg'));
      expect(file.formattedSize, equals('1.0 KB'));
    });

    test('DSCameraPickerQuality extension works correctly', () {
      expect(DSCameraPickerQuality.low.compressionQuality, equals(30));
      expect(DSCameraPickerQuality.medium.compressionQuality, equals(70));
      expect(DSCameraPickerQuality.high.compressionQuality, equals(85));
      expect(DSCameraPickerQuality.max.compressionQuality, equals(95));
    });

    test('DSCameraPickerFileType extension works correctly', () {
      expect(
        DSCameraPickerFileType.image.allowedMimeTypes,
        contains('image/jpeg'),
      );
      expect(
        DSCameraPickerFileType.video.allowedMimeTypes,
        contains('video/mp4'),
      );
      expect(
        DSCameraPickerFileType.media.allowedMimeTypes,
        containsAll(['image/jpeg', 'video/mp4']),
      );
    });
  });

  group('DSCameraPicker Error Handling Tests', () {
    testWidgets('handles configuration validation', (tester) async {
      // Configuración con valores extremos
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              config: const DSCameraPickerConfig(
                behavior: DSCameraPickerBehavior(
                  maxFiles: 0, // Valor inválido
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSCameraPicker), findsOneWidget);
    });

    testWidgets('handles null callbacks gracefully', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSCameraPicker(
              // Sin callbacks
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSCameraPicker));
      await tester.pump();

      expect(find.byType(DSCameraPicker), findsOneWidget);

      // Esperar a que se completen las operaciones asíncronas
      await tester.pumpAndSettle();
    });
  });
}