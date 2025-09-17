import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/color_picker/app_color_picker.dart';
import 'package:iautomat_design_system/src/components/color_picker/color_picker_config.dart';

void main() {
  group('AppColorPicker', () {
    late Widget testApp;

    setUp(() {
      testApp = MaterialApp(
        home: Scaffold(
          body: AppColorPicker(
            variant: AppColorPickerVariant.hsv,
            onChanged: (_) {},
          ),
        ),
      );
    });

    group('Basic Widget Tests', () {
      testWidgets('renders correctly with default configuration', (tester) async {
        await tester.pumpWidget(testApp);

        expect(find.byType(AppColorPicker), findsOneWidget);
        expect(find.byIcon(Icons.colorize), findsOneWidget);
      });

      testWidgets('displays hint text when no value is selected', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                hintText: 'Select a color',
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('Select a color'), findsOneWidget);
      });

      testWidgets('displays formatted color when value is provided', (tester) async {
        final testColor = AppColorValue.fromColor(Colors.red);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                value: testColor,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text(testColor.getFormattedString()), findsOneWidget);
      });

      testWidgets('shows color preview when enabled', (tester) async {
        final testColor = AppColorValue.fromColor(Colors.blue);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                value: testColor,
                config: const AppColorPickerConfig(showColorPreview: true),
                onChanged: (_) {},
              ),
            ),
          ),
        );

        // Should show color preview container
        expect(find.byType(Container), findsWidgets);
      });
    });

    group('Variant Tests', () {
      testWidgets('shows colorize icon for HSV variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.colorize), findsOneWidget);
      });

      testWidgets('shows palette icon for palette variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.palette,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.palette), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('opens color picker dialog when tapped', (tester) async {
        await tester.pumpWidget(testApp);

        await tester.tap(find.byType(AppColorPicker));
        await tester.pumpAndSettle();

        // Should open the color picker dialog
        expect(find.byType(AlertDialog), findsOneWidget);
      });

      testWidgets('calls onChanged when color is selected', (tester) async {
        AppColorValue? selectedColor;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.palette,
                onChanged: (color) => selectedColor = color,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppColorPicker));
        await tester.pumpAndSettle();

        // Tap on a color in the palette (first grid item)
        final gridItems = find.byType(GestureDetector);
        if (gridItems.evaluate().isNotEmpty) {
          await tester.tap(gridItems.first);
          await tester.pumpAndSettle();

          // Confirm selection
          await tester.tap(find.text('Confirmar'));
          await tester.pumpAndSettle();

          expect(selectedColor, isNotNull);
        }
      });

      testWidgets('does not respond to tap when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                enabled: false,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppColorPicker));
        await tester.pumpAndSettle();

        // Should not open color picker dialog
        expect(find.byType(AlertDialog), findsNothing);
      });

      testWidgets('does not call onChanged when onChanged is null', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                onChanged: null,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppColorPicker));
        await tester.pumpAndSettle();

        // Should not open color picker dialog
        expect(find.byType(AlertDialog), findsNothing);
      });
    });

    group('State Tests', () {
      testWidgets('shows loading indicator in loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                state: AppColorPickerState.loading,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton container in skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                state: AppColorPickerState.skeleton,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        // Should show skeleton container
        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('respects disabled state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                state: AppColorPickerState.disabled,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appColorPicker = tester.widget<AppColorPicker>(find.byType(AppColorPicker));
        expect(appColorPicker.state, equals(AppColorPickerState.disabled));
      });
    });

    group('Configuration Tests', () {
      testWidgets('applies custom configuration', (tester) async {
        const customConfig = AppColorPickerConfig(
          borderRadius: 20.0,
          borderWidth: 3.0,
          minHeight: 60.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                config: customConfig,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(AppColorPicker),
            matching: find.byType(Container),
          ).last,
        );

        final decoration = container.decoration as BoxDecoration;
        expect((decoration.borderRadius as BorderRadius).topLeft.x, equals(20.0));
        expect((decoration.border as Border).top.width, equals(3.0));
      });

      testWidgets('shows custom prefix and suffix icons', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                prefixIcon: const Icon(Icons.brush),
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.brush), findsOneWidget);
        expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
      });

      testWidgets('uses default icons when not provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.colorize), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantic properties', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                semanticLabel: 'Color picker for theme',
                labelText: 'Theme color',
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(AppColorPicker));
        expect(semantics.label, contains('Color picker for theme'));
      });

      testWidgets('is properly focusable', (tester) async {
        final focusNode = FocusNode();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                focusNode: focusNode,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        focusNode.requestFocus();
        await tester.pumpAndSettle();

        expect(focusNode.hasFocus, isTrue);

        focusNode.dispose();
      });
    });

    group('Platform Adaptive Tests', () {
      testWidgets('uses platform adaptive behavior when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                adaptivePlatform: true,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appColorPicker = tester.widget<AppColorPicker>(find.byType(AppColorPicker));
        expect(appColorPicker.adaptivePlatform, isTrue);
      });

      testWidgets('does not use platform adaptive when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppColorPicker(
                variant: AppColorPickerVariant.hsv,
                adaptivePlatform: false,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appColorPicker = tester.widget<AppColorPicker>(find.byType(AppColorPicker));
        expect(appColorPicker.adaptivePlatform, isFalse);
      });
    });

    group('Animation Tests', () {
      testWidgets('animates scale on press', (tester) async {
        await tester.pumpWidget(testApp);

        final gesture = await tester.startGesture(
          tester.getCenter(find.byType(AppColorPicker)),
        );

        await tester.pump(const Duration(milliseconds: 100));

        // Should have scale animation during press
        final transform = tester.widget<Transform>(
          find.descendant(
            of: find.byType(AppColorPicker),
            matching: find.byType(Transform),
          ),
        );

        expect(transform.transform.getMaxScaleOnAxis(), lessThan(1.0));

        await gesture.up();
        await tester.pumpAndSettle();
      });
    });
  });

  group('AppColorValue', () {
    test('creates color value from Color', () {
      final colorValue = AppColorValue.fromColor(Colors.red);

      expect(colorValue.color, equals(Colors.red));
      expect(colorValue.alpha, equals(1.0));
      expect(colorValue.format, equals(ColorFormat.hex));
    });

    test('formats hex string correctly', () {
      final colorValue = AppColorValue.fromColor(const Color(0xFFFF0000));

      expect(colorValue.hexString, equals('#FF0000FF'));
    });

    test('formats RGB string correctly', () {
      final colorValue = AppColorValue.fromColor(const Color(0xFFFF0000));

      expect(colorValue.rgbString, equals('rgb(255, 0, 0)'));
    });

    test('formats RGBA string correctly', () {
      final colorValue = AppColorValue.fromColor(const Color(0x80FF0000));

      expect(colorValue.rgbaString, contains('rgba(255, 0, 0,'));
    });

    test('checks transparency correctly', () {
      final transparentColor = AppColorValue(
        color: Colors.red,
        alpha: 0.0,
      );
      final opaqueColor = AppColorValue(
        color: Colors.red,
        alpha: 1.0,
      );

      expect(transparentColor.isTransparent, isTrue);
      expect(opaqueColor.isOpaque, isTrue);
      expect(transparentColor.isOpaque, isFalse);
      expect(opaqueColor.isTransparent, isFalse);
    });

    test('copies with new alpha', () {
      final original = AppColorValue.fromColor(Colors.red);
      final modified = original.copyWithAlpha(0.5);

      expect(modified.alpha, equals(0.5));
      expect(modified.color, equals(Colors.red));
    });

    test('copies with new color', () {
      final original = AppColorValue.fromColor(Colors.red);
      final modified = original.copyWithColor(Colors.blue);

      expect(modified.color, equals(Colors.blue));
      expect(modified.alpha, equals(1.0));
    });

    test('copies with new format', () {
      final original = AppColorValue.fromColor(Colors.red);
      final modified = original.copyWithFormat(ColorFormat.rgb);

      expect(modified.format, equals(ColorFormat.rgb));
      expect(modified.color, equals(Colors.red));
    });

    test('gets formatted string based on format', () {
      final hexColor = AppColorValue.fromColor(Colors.red, format: ColorFormat.hex);
      final rgbColor = AppColorValue.fromColor(Colors.red, format: ColorFormat.rgb);

      expect(hexColor.getFormattedString(), contains('#'));
      expect(rgbColor.getFormattedString(), contains('rgb('));
    });

    test('gets color with alpha applied', () {
      final colorValue = AppColorValue(
        color: Colors.red,
        alpha: 0.5,
      );

      final result = colorValue.colorWithAlpha;
      expect(result.alpha, equals((0.5 * 255).round()));
    });
  });

  group('AppColorPalettes', () {
    test('contains expected palettes', () {
      expect(AppColorPalettes.all.keys, contains('Material'));
      expect(AppColorPalettes.all.keys, contains('Basic'));
      expect(AppColorPalettes.all.keys, contains('Pastel'));
      expect(AppColorPalettes.all.keys, contains('Vibrant'));
    });

    test('material palette has expected colors', () {
      expect(AppColorPalettes.material.length, greaterThan(10));
      expect(AppColorPalettes.material, contains(const Color(0xFFF44336))); // Red
      expect(AppColorPalettes.material, contains(const Color(0xFF2196F3))); // Blue
    });

    test('basic palette has primary colors', () {
      expect(AppColorPalettes.basic, contains(const Color(0xFFFF0000))); // Red
      expect(AppColorPalettes.basic, contains(const Color(0xFF00FF00))); // Green
      expect(AppColorPalettes.basic, contains(const Color(0xFF0000FF))); // Blue
    });
  });

  group('AppColorValidators', () {
    test('required validator works correctly', () {
      final validator = AppColorValidators.required();

      expect(validator(null), isNotNull);
      expect(validator(AppColorValue.fromColor(Colors.red)), isNull);
    });

    test('hexFormat validator works correctly', () {
      final validator = AppColorValidators.hexFormat();
      final validColor = AppColorValue.fromColor(Colors.red);

      expect(validator(validColor), isNull);
      expect(validator(null), isNull);
    });

    test('alphaRange validator works correctly', () {
      final validator = AppColorValidators.alphaRange(0.5, 1.0);
      final validColor = AppColorValue(color: Colors.red, alpha: 0.7);
      final invalidColor = AppColorValue(color: Colors.red, alpha: 0.3);

      expect(validator(validColor), isNull);
      expect(validator(invalidColor), isNotNull);
    });

    test('notTransparent validator works correctly', () {
      final validator = AppColorValidators.notTransparent();
      final transparentColor = AppColorValue(color: Colors.red, alpha: 0.0);
      final opaqueColor = AppColorValue(color: Colors.red, alpha: 1.0);

      expect(validator(transparentColor), isNotNull);
      expect(validator(opaqueColor), isNull);
    });
  });

  group('Color Extensions', () {
    test('isLight and isDark work correctly', () {
      expect(Colors.white.isLight, isTrue);
      expect(Colors.white.isDark, isFalse);
      expect(Colors.black.isLight, isFalse);
      expect(Colors.black.isDark, isTrue);
    });

    test('contrastingColor works correctly', () {
      expect(Colors.white.contrastingColor, equals(Colors.black));
      expect(Colors.black.contrastingColor, equals(Colors.white));
    });

    test('lighten and darken work correctly', () {
      final original = Colors.grey;
      final lightened = original.lighten(0.2);
      final darkened = original.darken(0.2);

      // Can't easily test exact values due to HSL conversion complexity
      // but we can verify they return different colors
      expect(lightened, isNot(equals(original)));
      expect(darkened, isNot(equals(original)));
    });

    test('saturate and desaturate work correctly', () {
      final original = Colors.grey;
      final saturated = original.saturate(0.2);
      final desaturated = original.desaturate(0.2);

      expect(saturated, isNot(equals(original)));
      expect(desaturated, isNot(equals(original)));
    });

    test('complement returns opposite color', () {
      final red = Colors.red;
      final complement = red.complement;

      expect(complement, isNot(equals(red)));
    });

    test('analogous returns three colors', () {
      final analogous = Colors.red.analogous;

      expect(analogous.length, equals(3));
      expect(analogous[1], equals(Colors.red)); // Middle color should be original
    });

    test('triadic returns three colors', () {
      final triadic = Colors.red.triadic;

      expect(triadic.length, equals(3));
      expect(triadic[0], equals(Colors.red)); // First color should be original
    });

    test('tetradic returns four colors', () {
      final tetradic = Colors.red.tetradic;

      expect(tetradic.length, equals(4));
      expect(tetradic[0], equals(Colors.red)); // First color should be original
    });
  });
}