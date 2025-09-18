import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker.dart';
import 'package:iautomat_design_system/src/components/camera_picker/app_camera_picker_config.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });
  group('AppCameraPicker Golden Tests', () {
    testWidgets('default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_default.png'),
      );
    });

    testWidgets('camera source golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(
                  source: AppCameraPickerSource.camera,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_camera.png'),
      );
    });

    testWidgets('gallery source golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(
                  source: AppCameraPickerSource.gallery,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_gallery.png'),
      );
    });

    testWidgets('disabled state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_disabled.png'),
      );
    });

    testWidgets('loading state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    state: AppCameraPickerState.loading,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_loading.png'),
      );
    });

    testWidgets('skeleton state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    state: AppCameraPickerState.skeleton,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_skeleton.png'),
      );
    });

    testWidgets('custom styling golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: AppCameraPickerConfig(
                    colors: const AppCameraPickerColors(
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                    spacing: const AppCameraPickerSpacing(
                      borderRadius: 20.0,
                      padding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_custom.png'),
      );
    });

    testWidgets('custom text and icon golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(
                  buttonText: 'Upload File',
                  buttonIcon: Icons.cloud_upload,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_custom_text.png'),
      );
    });

    testWidgets('small size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 200,
                height: 60,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    spacing: AppCameraPickerSpacing(
                      minHeight: 40,
                      minWidth: 150,
                      padding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_small.png'),
      );
    });

    testWidgets('large size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 120,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    spacing: AppCameraPickerSpacing(
                      minHeight: 80,
                      minWidth: 300,
                      padding: EdgeInsets.all(24.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_large.png'),
      );
    });
  });

  group('AppCameraPicker Dark Mode Golden Tests', () {
    testWidgets('dark mode default golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_dark_default.png'),
      );
    });

    testWidgets('dark mode disabled golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: const AppCameraPicker(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_dark_disabled.png'),
      );
    });

    testWidgets('dark mode loading golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    state: AppCameraPickerState.loading,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_dark_loading.png'),
      );
    });
  });

  group('AppCameraPicker Platform Variant Golden Tests', () {
    testWidgets('iOS variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    variant: AppCameraPickerVariant.ios,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_ios.png'),
      );
    });

    testWidgets('Android variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    variant: AppCameraPickerVariant.android,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_android.png'),
      );
    });

    testWidgets('Web variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    variant: AppCameraPickerVariant.web,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_web.png'),
      );
    });
  });

  group('AppCameraPicker RTL Golden Tests', () {
    testWidgets('RTL layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: const AppCameraPicker(),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_rtl.png'),
      );
    });

    testWidgets('RTL with custom text golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: const AppCameraPicker(
                    buttonText: 'اختيار صورة',
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_rtl_arabic.png'),
      );
    });
  });

  group('AppCameraPicker Focus State Golden Tests', () {
    testWidgets('focus state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    state: AppCameraPickerState.focus,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_focus.png'),
      );
    });

    testWidgets('hover state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    state: AppCameraPickerState.hover,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_hover.png'),
      );
    });

    testWidgets('pressed state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: AppCameraPicker(
                  config: const AppCameraPickerConfig(
                    state: AppCameraPickerState.pressed,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCameraPicker),
        matchesGoldenFile('goldens/app_camera_picker_pressed.png'),
      );
    });
  });
}