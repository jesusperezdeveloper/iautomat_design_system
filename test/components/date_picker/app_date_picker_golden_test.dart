import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/date_picker/app_date_picker.dart';
import 'package:iautomat_design_system/src/components/date_picker/date_picker_config.dart';

void main() {
  group('DSDatePicker Golden Tests', () {
    Widget buildTestWidget({
      required DSDatePickerVariant variant,
      dynamic value,
      DSDatePickerState state = DSDatePickerState.defaultState,
      bool enabled = true,
      DSDatePickerConfig? config,
      String? labelText,
      String? hintText,
      String? errorText,
      String? helperText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      bool use24HourFormat = false,
      ThemeData? theme,
    }) {
      return MaterialApp(
        theme: theme ?? ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: DSDatePicker(
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
                use24HourFormat: use24HourFormat,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );
    }

    group('Basic Variants', () {
      testWidgets('date picker default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            labelText: 'Select Date',
            hintText: 'Choose a date',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_default.png'),
        );
      });

      testWidgets('time picker default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.time,
            labelText: 'Select Time',
            hintText: 'Choose a time',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('time_picker_default.png'),
        );
      });

      testWidgets('date range picker default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.range,
            labelText: 'Select Range',
            hintText: 'Choose date range',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_range_picker_default.png'),
        );
      });
    });

    group('With Values', () {
      testWidgets('date picker with selected date', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            value: DateTime(2023, 12, 25),
            labelText: 'Selected Date',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_with_value.png'),
        );
      });

      testWidgets('time picker with selected time', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.time,
            value: const TimeOfDay(hour: 14, minute: 30),
            labelText: 'Selected Time',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('time_picker_with_value.png'),
        );
      });

      testWidgets('time picker 24-hour format', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.time,
            value: const TimeOfDay(hour: 14, minute: 30),
            use24HourFormat: true,
            labelText: '24-Hour Format',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('time_picker_24hour.png'),
        );
      });

      testWidgets('date range with complete range', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.range,
            value: DSDateRange(
              start: DateTime(2023, 12, 1),
              end: DateTime(2023, 12, 31),
            ),
            labelText: 'Complete Range',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_range_complete.png'),
        );
      });

      testWidgets('date range with partial range', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.range,
            value: DSDateRange(
              start: DateTime(2023, 12, 1),
              end: null,
            ),
            labelText: 'Partial Range',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_range_partial.png'),
        );
      });
    });

    group('States', () {
      testWidgets('hover state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            state: DSDatePickerState.hover,
            labelText: 'Hover State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_hover.png'),
        );
      });

      testWidgets('focus state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            state: DSDatePickerState.focus,
            labelText: 'Focus State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_focus.png'),
        );
      });

      testWidgets('pressed state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            state: DSDatePickerState.pressed,
            labelText: 'Pressed State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_pressed.png'),
        );
      });

      testWidgets('selected state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            state: DSDatePickerState.selected,
            value: DateTime(2023, 12, 25),
            labelText: 'Selected State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_selected.png'),
        );
      });

      testWidgets('disabled state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            enabled: false,
            labelText: 'Disabled State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_disabled.png'),
        );
      });

      testWidgets('loading state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            state: DSDatePickerState.loading,
            labelText: 'Loading State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_loading.png'),
        );
      });

      testWidgets('skeleton state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            state: DSDatePickerState.skeleton,
            labelText: 'Skeleton State',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_skeleton.png'),
        );
      });
    });

    group('Custom Icons', () {
      testWidgets('with prefix icon', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            prefixIcon: const Icon(Icons.event_note),
            labelText: 'With Prefix Icon',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_prefix_icon.png'),
        );
      });

      testWidgets('with suffix icon', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            suffixIcon: const Icon(Icons.arrow_drop_down),
            labelText: 'With Suffix Icon',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_suffix_icon.png'),
        );
      });

      testWidgets('with both prefix and suffix icons', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            prefixIcon: const Icon(Icons.event_note),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            labelText: 'Both Icons',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_both_icons.png'),
        );
      });
    });

    group('Validation States', () {
      testWidgets('with error text', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            errorText: 'Invalid date selected',
            labelText: 'Date with Error',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_error.png'),
        );
      });

      testWidgets('with helper text', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            helperText: 'Select your birth date',
            labelText: 'Date with Helper',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_helper.png'),
        );
      });

      testWidgets('with both error and helper text', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            errorText: 'Date cannot be in the future',
            helperText: 'Please select a valid date',
            labelText: 'Date with Both Texts',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_error_helper.png'),
        );
      });
    });

    group('Custom Configuration', () {
      testWidgets('custom border radius', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            config: const DSDatePickerConfig(borderRadius: 20.0),
            labelText: 'Custom Border Radius',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_custom_radius.png'),
        );
      });

      testWidgets('custom border width', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            config: const DSDatePickerConfig(borderWidth: 4.0),
            labelText: 'Custom Border Width',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_custom_border.png'),
        );
      });

      testWidgets('with shadow', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            config: const DSDatePickerConfig(
              enableShadow: true,
              shadowBlurRadius: 8.0,
              shadowOffset: Offset(0, 4),
            ),
            labelText: 'With Shadow',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_with_shadow.png'),
        );
      });

      testWidgets('custom minimum height', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            config: const DSDatePickerConfig(minHeight: 80.0),
            labelText: 'Custom Height',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_custom_height.png'),
        );
      });
    });

    group('Themes', () {
      testWidgets('dark theme', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            theme: ThemeData.dark(),
            labelText: 'Dark Theme',
            hintText: 'Select a date',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_dark_theme.png'),
        );
      });

      testWidgets('dark theme with value', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            value: DateTime(2023, 12, 25),
            theme: ThemeData.dark(),
            labelText: 'Dark Theme with Value',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_dark_with_value.png'),
        );
      });

      testWidgets('dark theme disabled', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            variant: DSDatePickerVariant.date,
            enabled: false,
            theme: ThemeData.dark(),
            labelText: 'Dark Theme Disabled',
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_dark_disabled.png'),
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
                    child: DSDatePicker(
                      variant: DSDatePickerVariant.date,
                      labelText: 'التاريخ',
                      hintText: 'اختر التاريخ',
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
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_rtl.png'),
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
                    child: DSDatePicker(
                      variant: DSDatePickerVariant.date,
                      value: DateTime(2023, 12, 25),
                      labelText: 'التاريخ المحدد',
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
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_rtl_with_value.png'),
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
                    child: DSDatePicker(
                      variant: DSDatePickerVariant.date,
                      prefixIcon: const Icon(Icons.event_note),
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
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_rtl_with_icons.png'),
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
                  child: DSDatePicker(
                    variant: DSDatePickerVariant.date,
                    config: const DSDatePickerConfig(
                      minHeight: 40.0,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_compact.png'),
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
                  child: DSDatePicker(
                    variant: DSDatePickerVariant.date,
                    config: const DSDatePickerConfig(
                      minHeight: 80.0,
                      contentPadding: EdgeInsets.all(24),
                      iconSize: 24.0,
                    ),
                    labelText: 'Large Size',
                    hintText: 'This is a larger date picker',
                    onChanged: (_) {},
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(DSDatePicker),
          matchesGoldenFile('date_picker_large.png'),
        );
      });
    });

    group('All Variants Side by Side', () {
      testWidgets('all variants comparison', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 350,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DSDatePicker(
                        variant: DSDatePickerVariant.date,
                        value: DateTime(2023, 12, 25),
                        labelText: 'Date Picker',
                        onChanged: (_) {},
                      ),
                      DSDatePicker(
                        variant: DSDatePickerVariant.time,
                        value: const TimeOfDay(hour: 14, minute: 30),
                        labelText: 'Time Picker',
                        onChanged: (_) {},
                      ),
                      DSDatePicker(
                        variant: DSDatePickerVariant.range,
                        value: DSDateRange(
                          start: DateTime(2023, 12, 1),
                          end: DateTime(2023, 12, 31),
                        ),
                        labelText: 'Range Picker',
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
          matchesGoldenFile('all_variants_comparison.png'),
        );
      });
    });
  });
}
