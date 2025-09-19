import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/src/components/image/ds_image.dart';
import 'package:iautomat_design_system/src/components/image/ds_image_config.dart';

void main() {
  group('DSImage Widget Tests', () {
    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Test image',
              width: 200,
              height: 150,
            ),
          ),
        ),
      );

      expect(find.byType(DSImage), findsOneWidget);
    });

    testWidgets('displays loading state initially', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSImage(
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
            body: DSImage(
              src: 'https://example.com/image.jpg',
              alt: 'Lazy image',
              config: const DSImageConfig(
                src: 'https://example.com/image.jpg',
                variant: DSImageVariant.lazy,
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
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Tappable image',
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza y es interactivo
      expect(find.byType(DSImage), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('creates interactive widget with long press callback', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Long pressable image',
              onLongPress: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza y es interactivo
      expect(find.byType(DSImage), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('has hover callback configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Hoverable image',
              onHover: (hovering) {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza con el callback
      expect(find.byType(DSImage), findsOneWidget);
    });

    testWidgets('has focus callback configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSImage(
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
      expect(find.byType(DSImage), findsOneWidget);
    });

    testWidgets('supports keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Keyboard navigable image',
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Verificar que el widget se renderiza con soporte de teclado
      expect(find.byType(DSImage), findsOneWidget);
      expect(find.byType(Focus), findsWidgets);
    });

    testWidgets('applies custom colors from config', (tester) async {
      const customBackgroundColor = Colors.red;
      const customBorderColor = Colors.blue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Custom colored image',
              config: const DSImageConfig(
                src: 'assets/test_image.jpg',
                colors: DSImageColors(
                  backgroundColor: customBackgroundColor,
                  borderColor: customBorderColor,
                ),
                spacing: DSImageSpacing(
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
      for (final state in DSImageState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'State test image',
                config: DSImageConfig(
                  src: 'assets/test_image.jpg',
                  state: state,
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        // Verificar que el widget se renderiza para cada estado
        expect(find.byType(DSImage), findsOneWidget);
      }
    });

    testWidgets('applies correct BoxFit', (tester) async {
      for (final fit in BoxFit.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSImage(
                src: 'assets/test_image.jpg',
                alt: 'BoxFit test image',
                fit: fit,
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(DSImage), findsOneWidget);
      }
    });

    testWidgets('handles error state gracefully', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSImage(
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
            body: DSImage(
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
            body: DSImage(
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
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Disabled image',
              config: DSImageConfig(
                src: 'assets/test_image.jpg',
                state: DSImageState.disabled,
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
            body: DSImage(
              src: 'assets/test_image.jpg',
              alt: 'Decorative image',
              config: DSImageConfig(
                src: 'assets/test_image.jpg',
                a11yConfig: DSImageA11yConfig(
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

  group('DSImageConfig Tests', () {
    test('creates with default values', () {
      const config = DSImageConfig(src: 'test.jpg');

      expect(config.variant, equals(DSImageVariant.responsive));
      expect(config.state, equals(DSImageState.defaultState));
      expect(config.alt, equals(''));
      expect(config.fit, equals(BoxFit.cover));
    });

    test('creates with custom values', () {
      const config = DSImageConfig(
        src: 'test.jpg',
        variant: DSImageVariant.lazy,
        state: DSImageState.loading,
        alt: 'Custom alt text',
        fit: BoxFit.contain,
        ratio: 1.5,
      );

      expect(config.variant, equals(DSImageVariant.lazy));
      expect(config.state, equals(DSImageState.loading));
      expect(config.alt, equals('Custom alt text'));
      expect(config.fit, equals(BoxFit.contain));
      expect(config.ratio, equals(1.5));
    });
  });

  group('DSImageState Extension Tests', () {
    test('correctly identifies interactive states', () {
      expect(DSImageState.defaultState.isInteractive, isTrue);
      expect(DSImageState.hover.isInteractive, isTrue);
      expect(DSImageState.pressed.isInteractive, isTrue);
      expect(DSImageState.focus.isInteractive, isTrue);
      expect(DSImageState.selected.isInteractive, isTrue);

      expect(DSImageState.disabled.isInteractive, isFalse);
      expect(DSImageState.loading.isInteractive, isFalse);
      expect(DSImageState.skeleton.isInteractive, isFalse);
    });

    test('returns correct opacity values', () {
      expect(DSImageState.defaultState.opacity, equals(1.0));
      expect(DSImageState.disabled.opacity, equals(0.6));
      expect(DSImageState.loading.opacity, equals(0.8));
      expect(DSImageState.skeleton.opacity, equals(0.3));
    });

    test('correctly identifies loader states', () {
      expect(DSImageState.loading.showsLoader, isTrue);
      expect(DSImageState.skeleton.showsSkeleton, isTrue);

      expect(DSImageState.defaultState.showsLoader, isFalse);
      expect(DSImageState.defaultState.showsSkeleton, isFalse);
    });

    test('correctly identifies interactive capability', () {
      expect(DSImageState.defaultState.canInteract, isTrue);
      expect(DSImageState.disabled.canInteract, isFalse);
      expect(DSImageState.loading.canInteract, isFalse);
    });

    test('returns correct elevation multipliers', () {
      expect(DSImageState.defaultState.elevationMultiplier, equals(1.0));
      expect(DSImageState.hover.elevationMultiplier, equals(1.5));
      expect(DSImageState.pressed.elevationMultiplier, equals(0.5));
      expect(DSImageState.disabled.elevationMultiplier, equals(0.0));
    });
  });

  group('DSImageVariant Extension Tests', () {
    test('correctly identifies lazy variant', () {
      expect(DSImageVariant.lazy.isLazy, isTrue);
      expect(DSImageVariant.responsive.isLazy, isFalse);
    });

    test('correctly identifies responsive variant', () {
      expect(DSImageVariant.responsive.isResponsive, isTrue);
      expect(DSImageVariant.lazy.isResponsive, isFalse);
    });

    test('returns correct display names', () {
      expect(DSImageVariant.responsive.displayName, equals('Responsive'));
      expect(DSImageVariant.lazy.displayName, equals('Lazy'));
    });

    test('returns descriptive text', () {
      expect(DSImageVariant.responsive.description, contains('adapta'));
      expect(DSImageVariant.lazy.description, contains('visible'));
    });
  });

  group('Animation Type Extension Tests', () {
    test('correctly identifies animation capability', () {
      expect(DSImageAnimationType.none.hasAnimation, isFalse);
      expect(DSImageAnimationType.fade.hasAnimation, isTrue);
      expect(DSImageAnimationType.scale.hasAnimation, isTrue);
    });

    test('returns appropriate default curves', () {
      expect(DSImageAnimationType.none.defaultCurve, equals(Curves.linear));
      expect(DSImageAnimationType.fade.defaultCurve, equals(Curves.easeInOut));
      expect(DSImageAnimationType.scale.defaultCurve, equals(Curves.elasticOut));
    });
  });

  group('Clip Behavior Extension Tests', () {
    test('maps to correct Flutter clip values', () {
      expect(DSImageClipBehavior.none.flutterClip, equals(Clip.none));
      expect(DSImageClipBehavior.antiAlias.flutterClip, equals(Clip.antiAlias));
      expect(DSImageClipBehavior.hardEdge.flutterClip, equals(Clip.hardEdge));
    });

    test('returns correct display names', () {
      expect(DSImageClipBehavior.none.displayName, equals('None'));
      expect(DSImageClipBehavior.antiAlias.displayName, equals('Anti Alias'));
    });
  });
}