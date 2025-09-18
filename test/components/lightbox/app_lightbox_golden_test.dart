import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/lightbox/app_lightbox.dart';
import 'package:iautomat_design_system/src/components/lightbox/app_lightbox_config.dart';

void main() {
  group('AppLightbox Golden Tests', () {
    testWidgets('zoom lightbox default state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.zoom,
                enableCloseButton: true,
                enableA11y: false, // Disable for golden test consistency
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image',
                  imageProvider: AssetImage('assets/test/test_image.png'),
                  title: 'Test Image',
                  description: 'This is a test image for golden tests',
                  alt: 'Test image for lightbox',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/zoom_lightbox_default.png'),
      );
    });

    testWidgets('gallery lightbox default state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.gallery,
                enableCloseButton: true,
                enableCounter: true,
                enableThumbnails: true,
                enableA11y: false, // Disable for golden test consistency
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image_1',
                  imageProvider: AssetImage('assets/test/test_image_1.png'),
                  title: 'Test Image 1',
                  description: 'First test image',
                  alt: 'First test image for lightbox',
                ),
                AppLightboxImage(
                  id: 'test_image_2',
                  imageProvider: AssetImage('assets/test/test_image_2.png'),
                  title: 'Test Image 2',
                  description: 'Second test image',
                  alt: 'Second test image for lightbox',
                ),
                AppLightboxImage(
                  id: 'test_image_3',
                  imageProvider: AssetImage('assets/test/test_image_3.png'),
                  title: 'Test Image 3',
                  description: 'Third test image',
                  alt: 'Third test image for lightbox',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/gallery_lightbox_default.png'),
      );
    });

    testWidgets('lightbox without close button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.zoom,
                enableCloseButton: false,
                enableA11y: false,
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image',
                  imageProvider: AssetImage('assets/test/test_image.png'),
                  title: 'Test Image',
                  alt: 'Test image without close button',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/lightbox_no_close_button.png'),
      );
    });

    testWidgets('gallery lightbox without counter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.gallery,
                enableCloseButton: true,
                enableCounter: false,
                enableThumbnails: true,
                enableA11y: false,
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image_1',
                  imageProvider: AssetImage('assets/test/test_image_1.png'),
                  title: 'Test Image 1',
                ),
                AppLightboxImage(
                  id: 'test_image_2',
                  imageProvider: AssetImage('assets/test/test_image_2.png'),
                  title: 'Test Image 2',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/gallery_lightbox_no_counter.png'),
      );
    });

    testWidgets('gallery lightbox without thumbnails', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.gallery,
                enableCloseButton: true,
                enableCounter: true,
                enableThumbnails: false,
                enableA11y: false,
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image_1',
                  imageProvider: AssetImage('assets/test/test_image_1.png'),
                  title: 'Test Image 1',
                ),
                AppLightboxImage(
                  id: 'test_image_2',
                  imageProvider: AssetImage('assets/test/test_image_2.png'),
                  title: 'Test Image 2',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/gallery_lightbox_no_thumbnails.png'),
      );
    });

    testWidgets('lightbox loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.zoom,
                state: AppLightboxState.loading,
                enableA11y: false,
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image',
                  imageProvider: AssetImage('assets/test/test_image.png'),
                  title: 'Loading Image',
                  isLoading: true,
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/lightbox_loading_state.png'),
      );
    });

    testWidgets('lightbox with custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.zoom,
                enableCloseButton: true,
                enableA11y: false,
                colors: AppLightboxColors(
                  backgroundColor: Color(0xFF1A1A1A),
                  overlayColor: Color(0x99000000),
                  controlsColor: Color(0xFFFFFFFF),
                  iconColor: Color(0xFFFFFFFF),
                  closeButtonColor: Color(0xFFFF5722),
                ),
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image',
                  imageProvider: AssetImage('assets/test/test_image.png'),
                  title: 'Custom Colors Image',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/lightbox_custom_colors.png'),
      );
    });

    testWidgets('lightbox dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.gallery,
                enableCloseButton: true,
                enableCounter: true,
                enableThumbnails: true,
                enableA11y: false,
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image_1',
                  imageProvider: AssetImage('assets/test/test_image_1.png'),
                  title: 'Dark Theme Image 1',
                ),
                AppLightboxImage(
                  id: 'test_image_2',
                  imageProvider: AssetImage('assets/test/test_image_2.png'),
                  title: 'Dark Theme Image 2',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/lightbox_dark_theme.png'),
      );
    });

    testWidgets('lightbox RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppLightbox(
                config: const AppLightboxConfig(
                  variant: AppLightboxVariant.gallery,
                  enableCloseButton: true,
                  enableCounter: true,
                  enableThumbnails: true,
                  enableA11y: false,
                ),
                images: const [
                  AppLightboxImage(
                    id: 'test_image_1',
                    imageProvider: AssetImage('assets/test/test_image_1.png'),
                    title: 'صورة اختبار ١',
                    description: 'هذه صورة اختبار للنص العربي',
                  ),
                  AppLightboxImage(
                    id: 'test_image_2',
                    imageProvider: AssetImage('assets/test/test_image_2.png'),
                    title: 'صورة اختبار ٢',
                    description: 'هذه صورة اختبار أخرى للنص العربي',
                  ),
                ],
                onClose: () {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/lightbox_rtl_layout.png'),
      );
    });

    testWidgets('lightbox minimal configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: AppLightbox(
              config: const AppLightboxConfig(
                variant: AppLightboxVariant.zoom,
                enableCloseButton: false,
                enableCounter: false,
                enableThumbnails: false,
                enableA11y: false,
              ),
              images: const [
                AppLightboxImage(
                  id: 'test_image',
                  imageProvider: AssetImage('assets/test/test_image.png'),
                  title: 'Minimal Image',
                ),
              ],
              onClose: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/lightbox_minimal.png'),
      );
    });
  });
}