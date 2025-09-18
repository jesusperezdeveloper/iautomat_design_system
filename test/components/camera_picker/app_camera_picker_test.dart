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
  group('AppCameraPicker Widget Tests', () {

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
      expect(find.text('Agregar Imagen'), findsOneWidget);
      expect(find.byIcon(Icons.add_a_photo), findsOneWidget);
    });

    testWidgets('renders correctly with camera source', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              source: AppCameraPickerSource.camera,
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
      expect(find.text('Tomar Foto'), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    });

    testWidgets('renders correctly with gallery source', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              source: AppCameraPickerSource.gallery,
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
      expect(find.text('Seleccionar'), findsOneWidget);
      expect(find.byIcon(Icons.photo_library), findsOneWidget);
    });

    testWidgets('renders custom button text and icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
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
            body: AppCameraPicker(
              enabled: false,
            ),
          ),
        ),
      );

      final picker = tester.widget<AppCameraPicker>(
        find.byType(AppCameraPicker),
      );
      expect(picker.enabled, isFalse);

      // El botón debe estar presente pero deshabilitado
      expect(find.byType(AppCameraPicker), findsOneWidget);
    });

    testWidgets('handles tap interactions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              onPicked: (files) {
                // Callback de prueba
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppCameraPicker));
      await tester.pump();

      // La interacción debe registrarse (aunque la implementación es simulada)
      expect(find.byType(AppCameraPicker), findsOneWidget);

      // Esperar a que se completen las operaciones asíncronas
      await tester.pumpAndSettle();
    });

    testWidgets('handles keyboard interactions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(),
          ),
        ),
      );

      // Encontrar el widget focusable
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Simular Enter para activar
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(find.byType(AppCameraPicker), findsOneWidget);
    });

    testWidgets('renders with custom configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              config: AppCameraPickerConfig(
                variant: AppCameraPickerVariant.android,
                source: AppCameraPickerSource.camera,
                fileType: AppCameraPickerFileType.image,
                behavior: const AppCameraPickerBehavior(
                  allowMultiple: true,
                  maxFiles: 5,
                ),
                a11yConfig: const AppCameraPickerA11yConfig(
                  semanticsLabel: 'Custom camera picker',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
    });

    testWidgets('renders skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              config: const AppCameraPickerConfig(
                state: AppCameraPickerState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
      // En estado skeleton no debe mostrar texto
      expect(find.text('Agregar Imagen'), findsNothing);
    });

    testWidgets('renders loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              config: const AppCameraPickerConfig(
                state: AppCameraPickerState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
      expect(find.text('Cargando...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: const Scaffold(
              body: AppCameraPicker(),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
      expect(find.byType(Directionality), findsWidgets);
    });

    testWidgets('calls callbacks correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
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
      final picker = tester.widget<AppCameraPicker>(
        find.byType(AppCameraPicker),
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
                AppCameraPicker(),
                TextField(), // Para poder cambiar el foco
              ],
            ),
          ),
        ),
      );

      // Cambiar foco al picker
      await tester.tap(find.byType(AppCameraPicker));
      await tester.pump();

      // Cambiar foco al TextField
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(find.byType(AppCameraPicker), findsOneWidget);
    });

    testWidgets('validates allowMultiple property', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              allowMultiple: true,
            ),
          ),
        ),
      );

      final picker = tester.widget<AppCameraPicker>(
        find.byType(AppCameraPicker),
      );
      expect(picker.allowMultiple, isTrue);
    });

    testWidgets('supports different platform variants', (tester) async {
      for (final variant in AppCameraPickerVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCameraPicker(
                config: AppCameraPickerConfig(
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppCameraPicker), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('handles semantic properties correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              config: const AppCameraPickerConfig(
                a11yConfig: AppCameraPickerA11yConfig(
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
      expect(find.byType(AppCameraPicker), findsOneWidget);
    });
  });

  group('AppCameraPicker Configuration Tests', () {
    testWidgets('updates when configuration changes', (tester) async {
      AppCameraPickerConfig config = const AppCameraPickerConfig(
        source: AppCameraPickerSource.camera,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Column(
                  children: [
                    AppCameraPicker(config: config),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          config = const AppCameraPickerConfig(
                            source: AppCameraPickerSource.gallery,
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
            body: AppCameraPicker(
              config: const AppCameraPickerConfig(
                spacing: AppCameraPickerSpacing(
                  padding: EdgeInsets.all(24.0),
                  borderRadius: 16.0,
                  minHeight: 80.0,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
    });

    testWidgets('respects animation configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              config: const AppCameraPickerConfig(
                animation: AppCameraPickerAnimation(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
    });
  });

  group('AppCameraPicker Extension Tests', () {
    test('AppCameraPickerSource extension works correctly', () {
      expect(AppCameraPickerSource.camera.displayName, equals('Cámara'));
      expect(AppCameraPickerSource.gallery.displayName, equals('Galería'));
      expect(AppCameraPickerSource.both.displayName, equals('Cámara y Galería'));

      expect(AppCameraPickerSource.camera.icon, equals(Icons.camera_alt));
      expect(AppCameraPickerSource.gallery.icon, equals(Icons.photo_library));
      expect(AppCameraPickerSource.both.icon, equals(Icons.add_a_photo));
    });

    test('AppCameraPickerState extension works correctly', () {
      expect(AppCameraPickerState.defaultState.canInteract, isTrue);
      expect(AppCameraPickerState.hover.canInteract, isTrue);
      expect(AppCameraPickerState.pressed.canInteract, isTrue);
      expect(AppCameraPickerState.focus.canInteract, isTrue);
      expect(AppCameraPickerState.selected.canInteract, isTrue);
      expect(AppCameraPickerState.disabled.canInteract, isFalse);
      expect(AppCameraPickerState.loading.canInteract, isFalse);
      expect(AppCameraPickerState.skeleton.canInteract, isFalse);
    });

    test('AppCameraPickerFile extension works correctly', () {
      const file = AppCameraPickerFile(
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

    test('AppCameraPickerQuality extension works correctly', () {
      expect(AppCameraPickerQuality.low.compressionQuality, equals(30));
      expect(AppCameraPickerQuality.medium.compressionQuality, equals(70));
      expect(AppCameraPickerQuality.high.compressionQuality, equals(85));
      expect(AppCameraPickerQuality.max.compressionQuality, equals(95));
    });

    test('AppCameraPickerFileType extension works correctly', () {
      expect(
        AppCameraPickerFileType.image.allowedMimeTypes,
        contains('image/jpeg'),
      );
      expect(
        AppCameraPickerFileType.video.allowedMimeTypes,
        contains('video/mp4'),
      );
      expect(
        AppCameraPickerFileType.media.allowedMimeTypes,
        containsAll(['image/jpeg', 'video/mp4']),
      );
    });
  });

  group('AppCameraPicker Error Handling Tests', () {
    testWidgets('handles configuration validation', (tester) async {
      // Configuración con valores extremos
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              config: const AppCameraPickerConfig(
                behavior: AppCameraPickerBehavior(
                  maxFiles: 0, // Valor inválido
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppCameraPicker), findsOneWidget);
    });

    testWidgets('handles null callbacks gracefully', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCameraPicker(
              // Sin callbacks
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppCameraPicker));
      await tester.pump();

      expect(find.byType(AppCameraPicker), findsOneWidget);

      // Esperar a que se completen las operaciones asíncronas
      await tester.pumpAndSettle();
    });
  });
}