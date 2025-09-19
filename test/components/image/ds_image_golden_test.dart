import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/src/components/image/ds_image.dart';
import 'package:iautomat_design_system/src/components/image/ds_image_config.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';

void main() {
  group('DSImage Golden Tests', () {
    testWidgets('default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Test image',
                width: 200,
                height: 150,
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_default.png'),
      );
    });

    testWidgets('loading state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'https://example.com/loading-image.jpg',
                alt: 'Loading image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'https://example.com/loading-image.jpg',
                  state: DSImageState.loading,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_loading.png'),
      );
    });

    testWidgets('skeleton state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Skeleton image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: DSImageState.skeleton,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_skeleton.png'),
      );
    });

    testWidgets('error state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: DSColors.gray100,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: DSColors.error.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image_outlined,
                        size: 32,
                        color: DSColors.error.withValues(alpha: 0.7),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Error al cargar imagen',
                        style: TextStyle(
                          fontSize: 12,
                          color: DSColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(Container),
        matchesGoldenFile('goldens/app_image_error.png'),
      );
    });

    testWidgets('disabled state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Disabled image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: DSImageState.disabled,
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_disabled.png'),
      );
    });

    testWidgets('hover state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Hover image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: DSImageState.hover,
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_hover.png'),
      );
    });

    testWidgets('pressed state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Pressed image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: DSImageState.pressed,
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_pressed.png'),
      );
    });

    testWidgets('focus state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Focus image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: DSImageState.focus,
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_focus.png'),
      );
    });

    testWidgets('selected state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Selected image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: DSImageState.selected,
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_selected.png'),
      );
    });

    testWidgets('custom colors golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Custom colors image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  colors: DSImageColors(
                    backgroundColor: Colors.red,
                    borderColor: Colors.blue,
                  ),
                  spacing: DSImageSpacing(
                    borderWidth: 3.0,
                    borderRadius: 16.0,
                  ),
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: Colors.red,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_custom_colors.png'),
      );
    });

    testWidgets('rounded corners golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Rounded image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  spacing: DSImageSpacing(
                    borderRadius: 24.0,
                  ),
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: DSColors.gray100,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_rounded.png'),
      );
    });

    testWidgets('aspect ratio golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSImage(
                  src: 'assets/test_image.jpg',
                  alt: 'Aspect ratio image',
                  ratio: 16 / 9,
                  placeholder: Container(
                    color: DSColors.gray100,
                    child: const Center(
                      child: Icon(Icons.image, size: 48, color: DSColors.gray400),
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
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_aspect_ratio.png'),
      );
    });

    testWidgets('elevation golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Elevated image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'assets/test_image.jpg',
                  elevation: DSImageElevation(
                    defaultElevation: 8.0,
                  ),
                ),
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_elevation.png'),
      );
    });

    testWidgets('small size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Small image',
                width: 64,
                height: 64,
                placeholder: Container(
                  width: 64,
                  height: 64,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 24, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_small.png'),
      );
    });

    testWidgets('large size golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Large image',
                width: 400,
                height: 300,
                placeholder: Container(
                  width: 400,
                  height: 300,
                  color: DSColors.gray100,
                  child: const Center(
                    child: Icon(Icons.image, size: 96, color: DSColors.gray400),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_large.png'),
      );
    });

    testWidgets('different fit modes golden test', (tester) async {
      for (final fit in [BoxFit.cover, BoxFit.contain, BoxFit.fill, BoxFit.fitWidth]) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: DSImage(
                  src: 'assets/test_image.jpg',
                  alt: 'Fit test image',
                  width: 200,
                  height: 150,
                  fit: fit,
                  placeholder: Container(
                    width: 200,
                    height: 150,
                    color: DSColors.gray100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 32, color: DSColors.gray400),
                          const SizedBox(height: 4),
                          Text(
                            fit.toString().split('.').last,
                            style: const TextStyle(
                              fontSize: 10,
                              color: DSColors.gray600,
                            ),
                          ),
                        ],
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
          find.byType(DSImage),
          matchesGoldenFile('goldens/app_image_fit_${fit.toString().split('.').last}.png'),
        );
      }
    });
  });

  group('DSImage Dark Mode Golden Tests', () {
    testWidgets('default state dark mode golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'Dark mode image',
                width: 200,
                height: 150,
                placeholder: Container(
                  width: 200,
                  height: 150,
                  color: DSColors.gray800,
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: DSColors.gray300),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_dark_mode.png'),
      );
    });

    testWidgets('loading state dark mode golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: DSImage(
                src: 'https://example.com/loading-image.jpg',
                alt: 'Dark mode loading image',
                width: 200,
                height: 150,
                config: const DSImageConfig(
                  src: 'https://example.com/loading-image.jpg',
                  state: DSImageState.loading,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(DSImage),
        matchesGoldenFile('goldens/app_image_dark_loading.png'),
      );
    });
  });
}