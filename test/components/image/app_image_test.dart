import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/src/components/image/app_image.dart';
import 'package:iautomat_design_system/src/components/image/app_image_config.dart';

void main() {
  group('AppImage Widget Tests', () {
    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Test image',
              width: 200,
              height: 150,
            ),
          ),
        ),
      );

      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('displays loading state initially', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'https://example.com/image.jpg',
              alt: 'Network image',
            ),
          ),
        ),
      );

      // Buscar indicador de carga
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows skeleton when using lazy variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'https://example.com/image.jpg',
              alt: 'Lazy image',
              config: const AppImageConfig(
                src: 'https://example.com/image.jpg',
                variant: AppImageVariant.lazy,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Buscar container con skeleton
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('creates interactive widget with tap callback', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Tappable image',
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza y es interactivo
      expect(find.byType(AppImage), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('creates interactive widget with long press callback', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Long pressable image',
              onLongPress: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza y es interactivo
      expect(find.byType(AppImage), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('has hover callback configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Hoverable image',
              onHover: (hovering) {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza con el callback
      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('has focus callback configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Focusable image',
              onFocusChange: (focused) {},
              onTap: () {}, // Hacer la imagen interactive
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza con el callback
      expect(find.byType(AppImage), findsOneWidget);
    });

    testWidgets('supports keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Keyboard navigable image',
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza con soporte de teclado
      expect(find.byType(AppImage), findsOneWidget);
      expect(find.byType(Focus), findsWidgets);
    });

    testWidgets('applies custom colors from config', (tester) async {
      const customBackgroundColor = Colors.red;
      const customBorderColor = Colors.blue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Custom colored image',
              config: const AppImageConfig(
                src: 'assets/test_image.jpg',
                colors: AppImageColors(
                  backgroundColor: customBackgroundColor,
                  borderColor: customBorderColor,
                ),
                spacing: AppImageSpacing(
                  borderWidth: 2.0,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );

      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, equals(customBackgroundColor));
      expect(decoration?.border?.top.color, equals(customBorderColor));
    });

    testWidgets('handles different states correctly', (tester) async {
      for (final state in AppImageState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                src: 'assets/test_image.jpg',
                alt: 'State test image',
                config: AppImageConfig(
                  src: 'assets/test_image.jpg',
                  state: state,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        // Verificar que el widget se renderiza para cada estado
        expect(find.byType(AppImage), findsOneWidget);
      }
    });

    testWidgets('applies correct BoxFit', (tester) async {
      for (final fit in BoxFit.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppImage(
                src: 'assets/test_image.jpg',
                alt: 'BoxFit test image',
                fit: fit,
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(AppImage), findsOneWidget);
      }
    });

    testWidgets('handles error state gracefully', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'invalid_image_path.jpg',
              alt: 'Error image',
              onError: () {},
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Verificar que se maneja el error
      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
      expect(find.text('Error al cargar imagen'), findsOneWidget);
    });

    testWidgets('shows placeholder widget when provided', (tester) async {
      const placeholderText = 'Custom placeholder';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'https://example.com/image.jpg',
              alt: 'Image with placeholder',
              placeholder: Text(placeholderText),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text(placeholderText), findsOneWidget);
    });

    testWidgets('applies aspect ratio correctly', (tester) async {
      const aspectRatio = 16.0 / 9.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Aspect ratio image',
              ratio: aspectRatio,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(AspectRatio), findsOneWidget);
      final aspectRatioWidget = tester.widget<AspectRatio>(
        find.byType(AspectRatio),
      );
      expect(aspectRatioWidget.aspectRatio, equals(aspectRatio));
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Disabled image',
              config: AppImageConfig(
                src: 'assets/test_image.jpg',
                state: AppImageState.disabled,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      final opacityWidget = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(opacityWidget.opacity, equals(0.6));
    });

    testWidgets('excludes semantics when decorative', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppImage(
              src: 'assets/test_image.jpg',
              alt: 'Decorative image',
              config: AppImageConfig(
                src: 'assets/test_image.jpg',
                a11yConfig: AppImageA11yConfig(
                  isDecorative: true,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ExcludeSemantics), findsOneWidget);
    });
  });

  group('AppImageConfig Tests', () {
    test('creates with default values', () {
      const config = AppImageConfig(src: 'test.jpg');

      expect(config.variant, equals(AppImageVariant.responsive));
      expect(config.state, equals(AppImageState.defaultState));
      expect(config.alt, equals(''));
      expect(config.fit, equals(BoxFit.cover));
    });

    test('creates with custom values', () {
      const config = AppImageConfig(
        src: 'test.jpg',
        variant: AppImageVariant.lazy,
        state: AppImageState.loading,
        alt: 'Custom alt text',
        fit: BoxFit.contain,
        ratio: 1.5,
      );

      expect(config.variant, equals(AppImageVariant.lazy));
      expect(config.state, equals(AppImageState.loading));
      expect(config.alt, equals('Custom alt text'));
      expect(config.fit, equals(BoxFit.contain));
      expect(config.ratio, equals(1.5));
    });
  });

  group('AppImageState Extension Tests', () {
    test('correctly identifies interactive states', () {
      expect(AppImageState.defaultState.isInteractive, isTrue);
      expect(AppImageState.hover.isInteractive, isTrue);
      expect(AppImageState.pressed.isInteractive, isTrue);
      expect(AppImageState.focus.isInteractive, isTrue);
      expect(AppImageState.selected.isInteractive, isTrue);

      expect(AppImageState.disabled.isInteractive, isFalse);
      expect(AppImageState.loading.isInteractive, isFalse);
      expect(AppImageState.skeleton.isInteractive, isFalse);
    });

    test('returns correct opacity values', () {
      expect(AppImageState.defaultState.opacity, equals(1.0));
      expect(AppImageState.disabled.opacity, equals(0.6));
      expect(AppImageState.loading.opacity, equals(0.8));
      expect(AppImageState.skeleton.opacity, equals(0.3));
    });

    test('correctly identifies loader states', () {
      expect(AppImageState.loading.showsLoader, isTrue);
      expect(AppImageState.skeleton.showsSkeleton, isTrue);

      expect(AppImageState.defaultState.showsLoader, isFalse);
      expect(AppImageState.defaultState.showsSkeleton, isFalse);
    });

    test('correctly identifies interactive capability', () {
      expect(AppImageState.defaultState.canInteract, isTrue);
      expect(AppImageState.disabled.canInteract, isFalse);
      expect(AppImageState.loading.canInteract, isFalse);
    });

    test('returns correct elevation multipliers', () {
      expect(AppImageState.defaultState.elevationMultiplier, equals(1.0));
      expect(AppImageState.hover.elevationMultiplier, equals(1.5));
      expect(AppImageState.pressed.elevationMultiplier, equals(0.5));
      expect(AppImageState.disabled.elevationMultiplier, equals(0.0));
    });
  });

  group('AppImageVariant Extension Tests', () {
    test('correctly identifies lazy variant', () {
      expect(AppImageVariant.lazy.isLazy, isTrue);
      expect(AppImageVariant.responsive.isLazy, isFalse);
    });

    test('correctly identifies responsive variant', () {
      expect(AppImageVariant.responsive.isResponsive, isTrue);
      expect(AppImageVariant.lazy.isResponsive, isFalse);
    });

    test('returns correct display names', () {
      expect(AppImageVariant.responsive.displayName, equals('Responsive'));
      expect(AppImageVariant.lazy.displayName, equals('Lazy'));
    });

    test('returns descriptive text', () {
      expect(AppImageVariant.responsive.description, contains('adapta'));
      expect(AppImageVariant.lazy.description, contains('visible'));
    });
  });

  group('Animation Type Extension Tests', () {
    test('correctly identifies animation capability', () {
      expect(AppImageAnimationType.none.hasAnimation, isFalse);
      expect(AppImageAnimationType.fade.hasAnimation, isTrue);
      expect(AppImageAnimationType.scale.hasAnimation, isTrue);
    });

    test('returns appropriate default curves', () {
      expect(AppImageAnimationType.none.defaultCurve, equals(Curves.linear));
      expect(AppImageAnimationType.fade.defaultCurve, equals(Curves.easeInOut));
      expect(AppImageAnimationType.scale.defaultCurve, equals(Curves.elasticOut));
    });
  });

  group('Clip Behavior Extension Tests', () {
    test('maps to correct Flutter clip values', () {
      expect(AppImageClipBehavior.none.flutterClip, equals(Clip.none));
      expect(AppImageClipBehavior.antiAlias.flutterClip, equals(Clip.antiAlias));
      expect(AppImageClipBehavior.hardEdge.flutterClip, equals(Clip.hardEdge));
    });

    test('returns correct display names', () {
      expect(AppImageClipBehavior.none.displayName, equals('None'));
      expect(AppImageClipBehavior.antiAlias.displayName, equals('Anti Alias'));
    });
  });
}