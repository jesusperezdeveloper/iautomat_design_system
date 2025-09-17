import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/color_picker/app_color_picker.dart';
import 'package:iautomat_design_system/src/components/color_picker/color_picker_config.dart';

void main() {
  group('AppColorPicker Golden Tests', () {
    Widget buildTestWidget({
      required AppColorPickerVariant variant,
      AppColorValue? value,
      AppColorPickerState state = AppColorPickerState.defaultState,
      bool enabled = true,
      AppColorPickerConfig? config,
      String? labelText,
      String? hintText,
      String? errorText,
      String? helperText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      List<Color>? customPalette,
      String? paletteName,
      bool? showAlphaChannel,
      ThemeData? theme,
    }) {
      return MaterialApp(
        theme: theme ?? ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: AppColorPicker(
                variant: variant,
                value: value,
                state: state,
                enabled: enabled,
                config: config,
                labelText: labelText,
                hintText: hintText,
                errorText: errorText,
                helperText: helperText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                customPalette: customPalette,
                paletteName: paletteName,
                showAlphaChannel: showAlphaChannel,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );
    }

    group('Basic Variants', () {
      testWidgets('hsv picker default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            labelText: 'Select Color',
            hintText: 'Choose a color',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('hsv_picker_default.png'),
        );
      });

      testWidgets('palette picker default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.palette,
            labelText: 'Select Color',
            hintText: 'Choose from palette',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('palette_picker_default.png'),
        );
      });
    });

    group('With Values', () {
      testWidgets('hsv picker with selected color', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            value: AppColorValue.fromColor(Colors.red),
            labelText: 'Selected Color',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('hsv_picker_with_value.png'),
        );
      });

      testWidgets('palette picker with selected color', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.palette,
            value: AppColorValue.fromColor(Colors.blue),
            labelText: 'Selected Color',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('palette_picker_with_value.png'),
        );
      });

      testWidgets('color with alpha channel', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            value: AppColorValue(
              color: Colors.green,
              alpha: 0.7,
            ),
            labelText: 'Color with Alpha',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_with_alpha.png'),
        );
      });

      testWidgets('hex format display', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            value: AppColorValue.fromColor(Colors.purple, format: ColorFormat.hex),
            labelText: 'HEX Format',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_hex_format.png'),
        );
      });

      testWidgets('rgb format display', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            value: AppColorValue.fromColor(Colors.orange, format: ColorFormat.rgb),
            labelText: 'RGB Format',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_rgb_format.png'),
        );
      });
    });

    group('States', () {
      testWidgets('hover state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            state: AppColorPickerState.hover,
            labelText: 'Hover State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_hover.png'),
        );
      });

      testWidgets('focus state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            state: AppColorPickerState.focus,
            labelText: 'Focus State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_focus.png'),
        );
      });

      testWidgets('pressed state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            state: AppColorPickerState.pressed,
            labelText: 'Pressed State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_pressed.png'),
        );
      });

      testWidgets('selected state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            state: AppColorPickerState.selected,
            value: AppColorValue.fromColor(Colors.teal),
            labelText: 'Selected State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_selected.png'),
        );
      });

      testWidgets('disabled state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            enabled: false,
            labelText: 'Disabled State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_disabled.png'),
        );
      });

      testWidgets('loading state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            state: AppColorPickerState.loading,
            labelText: 'Loading State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_loading.png'),
        );
      });

      testWidgets('skeleton state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            state: AppColorPickerState.skeleton,
            labelText: 'Skeleton State',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_skeleton.png'),
        );
      });
    });

    group('Custom Icons', () {
      testWidgets('with prefix icon', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            prefixIcon: const Icon(Icons.brush),
            labelText: 'With Prefix Icon',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_prefix_icon.png'),
        );
      });

      testWidgets('with suffix icon', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            suffixIcon: const Icon(Icons.arrow_drop_down),
            labelText: 'With Suffix Icon',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_suffix_icon.png'),
        );
      });

      testWidgets('with both prefix and suffix icons', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            prefixIcon: const Icon(Icons.brush),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            labelText: 'Both Icons',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_both_icons.png'),
        );
      });
    });

    group('Validation States', () {
      testWidgets('with error text', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            errorText: 'Invalid color selected',
            labelText: 'Color with Error',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_error.png'),
        );
      });

      testWidgets('with helper text', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            helperText: 'Select a vibrant color',
            labelText: 'Color with Helper',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_helper.png'),
        );
      });

      testWidgets('with both error and helper text', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            errorText: 'Color has poor contrast',
            helperText: 'Choose a color with good contrast',
            labelText: 'Color with Both Texts',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_error_helper.png'),
        );
      });
    });

    group('Custom Configuration', () {
      testWidgets('custom border radius', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            config: const AppColorPickerConfig(borderRadius: 20.0),
            labelText: 'Custom Border Radius',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_custom_radius.png'),
        );
      });

      testWidgets('custom border width', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            config: const AppColorPickerConfig(borderWidth: 4.0),
            labelText: 'Custom Border Width',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_custom_border.png'),
        );
      });

      testWidgets('with shadow', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            config: const AppColorPickerConfig(
              enableShadow: true,
              shadowBlurRadius: 8.0,
              shadowOffset: Offset(0, 4),
            ),
            labelText: 'With Shadow',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_with_shadow.png'),
        );
      });

      testWidgets('custom minimum height', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            config: const AppColorPickerConfig(minHeight: 80.0),
            labelText: 'Custom Height',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_custom_height.png'),
        );
      });

      testWidgets('with color preview', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            value: AppColorValue.fromColor(Colors.cyan),
            config: const AppColorPickerConfig(
              showColorPreview: true,
              colorPreviewSize: 32.0,
            ),
            labelText: 'With Preview',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_with_preview.png'),
        );
      });
    });

    group('Custom Palettes', () {
      testWidgets('basic palette', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.palette,
            customPalette: AppColorPalettes.basic,
            paletteName: 'Basic',
            labelText: 'Basic Palette',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_basic_palette.png'),
        );
      });

      testWidgets('pastel palette', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.palette,
            customPalette: AppColorPalettes.pastel,
            paletteName: 'Pastel',
            labelText: 'Pastel Palette',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_pastel_palette.png'),
        );
      });

      testWidgets('vibrant palette', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.palette,
            customPalette: AppColorPalettes.vibrant,
            paletteName: 'Vibrant',
            labelText: 'Vibrant Palette',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_vibrant_palette.png'),
        );
      });

      testWidgets('custom palette with few colors', (tester) async {
        const customColors = [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
          Colors.purple,
          Colors.orange,
        ];

        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.palette,
            customPalette: customColors,
            paletteName: 'Custom',
            labelText: 'Custom Palette',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_custom_palette.png'),
        );
      });
    });

    group('Themes', () {
      testWidgets('dark theme', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            theme: ThemeData.dark(),
            labelText: 'Dark Theme',
            hintText: 'Select a color',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_dark_theme.png'),
        );
      });

      testWidgets('dark theme with value', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            value: AppColorValue.fromColor(Colors.amber),
            theme: ThemeData.dark(),
            labelText: 'Dark Theme with Value',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_dark_with_value.png'),
        );
      });

      testWidgets('dark theme disabled', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: AppColorPickerVariant.hsv,
            enabled: false,
            theme: ThemeData.dark(),
            labelText: 'Dark Theme Disabled',
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_dark_disabled.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('RTL layout', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: AppColorPicker(
                      variant: AppColorPickerVariant.hsv,
                      labelText: 'اللون',
                      hintText: 'اختر لونًا',
                      textDirection: TextDirection.rtl,
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_rtl.png'),
        );
      });

      testWidgets('RTL with value', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: AppColorPicker(
                      variant: AppColorPickerVariant.hsv,
                      value: AppColorValue.fromColor(Colors.indigo),
                      labelText: 'اللون المحدد',
                      textDirection: TextDirection.rtl,
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_rtl_with_value.png'),
        );
      });

      testWidgets('RTL with icons', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: AppColorPicker(
                      variant: AppColorPickerVariant.hsv,
                      prefixIcon: const Icon(Icons.brush),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      labelText: 'مع الرموز',
                      textDirection: TextDirection.rtl,
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_rtl_with_icons.png'),
        );
      });
    });

    group('Size Variations', () {
      testWidgets('compact size', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: AppColorPicker(
                    variant: AppColorPickerVariant.hsv,
                    config: const AppColorPickerConfig(
                      minHeight: 40.0,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    labelText: 'Compact',
                    onChanged: (_) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_compact.png'),
        );
      });

      testWidgets('large size', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  height: 120,
                  child: AppColorPicker(
                    variant: AppColorPickerVariant.hsv,
                    config: const AppColorPickerConfig(
                      minHeight: 80.0,
                      contentPadding: EdgeInsets.all(24),
                      iconSize: 24.0,
                    ),
                    labelText: 'Large Size',
                    hintText: 'This is a larger color picker',
                    onChanged: (_) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppColorPicker),
          matchesGoldenFile('color_picker_large.png'),
        );
      });
    });

    group('Both Variants Side by Side', () {
      testWidgets('variants comparison', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 350,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppColorPicker(
                        variant: AppColorPickerVariant.hsv,
                        value: AppColorValue.fromColor(Colors.red),
                        labelText: 'HSV Picker',
                        onChanged: (_) {},
                      ),
                      AppColorPicker(
                        variant: AppColorPickerVariant.palette,
                        value: AppColorValue.fromColor(Colors.blue),
                        labelText: 'Palette Picker',
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Column),
          matchesGoldenFile('color_picker_variants_comparison.png'),
        );
      });

      testWidgets('all states comparison', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 350,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppColorPicker(
                        variant: AppColorPickerVariant.hsv,
                        state: AppColorPickerState.defaultState,
                        labelText: 'Default',
                        onChanged: (_) {},
                      ),
                      AppColorPicker(
                        variant: AppColorPickerVariant.hsv,
                        state: AppColorPickerState.hover,
                        labelText: 'Hover',
                        onChanged: (_) {},
                      ),
                      AppColorPicker(
                        variant: AppColorPickerVariant.hsv,
                        state: AppColorPickerState.focus,
                        labelText: 'Focus',
                        onChanged: (_) {},
                      ),
                      AppColorPicker(
                        variant: AppColorPickerVariant.hsv,
                        state: AppColorPickerState.selected,
                        value: AppColorValue.fromColor(Colors.green),
                        labelText: 'Selected',
                        onChanged: (_) {},
                      ),
                      AppColorPicker(
                        variant: AppColorPickerVariant.hsv,
                        enabled: false,
                        labelText: 'Disabled',
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Column),
          matchesGoldenFile('color_picker_all_states.png'),
        );
      });
    });
  });
}