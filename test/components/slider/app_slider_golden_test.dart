import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/slider/app_slider.dart';
import 'package:iautomat_design_system/src/components/slider/slider_config.dart';

void main() {
  group('DSSlider Golden Tests', () {
    final testMarks = [
      const DSSliderMark(value: 0, label: 'Min'),
      const DSSliderMark(value: 25, label: 'Low'),
      const DSSliderMark(value: 50, label: 'Mid'),
      const DSSliderMark(value: 75, label: 'High'),
      const DSSliderMark(value: 100, label: 'Max'),
    ];

    Widget buildSlider({
      DSSliderVariant variant = DSSliderVariant.continuous,
      double? value,
      DSSliderRangeValue? rangeValue,
      DSSliderState? overrideState,
      bool enabled = true,
      String? errorText,
      DSSliderConfig? config,
      List<DSSliderMark> marks = const [],
      bool showLabels = true,
      bool showTicks = true,
    }) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              child: variant == DSSliderVariant.range
                  ? DSSlider(
                      rangeValue: rangeValue ??
                          const DSSliderRangeValue(start: 20.0, end: 80.0),
                      min: 0.0,
                      max: 100.0,
                      onRangeChanged: (_) {},
                      variant: variant,
                      label: 'Test Slider',
                      helperText: 'Choose a range of values',
                      errorText: errorText,
                      enabled: enabled,
                      config: config,
                      overrideState: overrideState,
                      marks: marks,
                      showLabels: showLabels,
                      showTicks: showTicks,
                    )
                  : DSSlider(
                      value: value ?? 50.0,
                      min: 0.0,
                      max: 100.0,
                      step: variant == DSSliderVariant.discrete ? 10.0 : null,
                      onChanged: (_) {},
                      variant: variant,
                      label: 'Test Slider',
                      helperText: 'Choose a value',
                      errorText: errorText,
                      enabled: enabled,
                      config: config,
                      overrideState: overrideState,
                      marks: marks,
                      showLabels: showLabels,
                      showTicks: showTicks,
                    ),
            ),
          ),
        ),
      );
    }

    testWidgets('continuous default state', (tester) async {
      await tester.pumpWidget(buildSlider());
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_continuous_default.png'),
      );
    });

    testWidgets('continuous with value', (tester) async {
      await tester.pumpWidget(buildSlider(value: 75.0));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_continuous_with_value.png'),
      );
    });

    testWidgets('discrete default state', (tester) async {
      await tester.pumpWidget(buildSlider(
        variant: DSSliderVariant.discrete,
        value: 50.0,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_discrete_default.png'),
      );
    });

    testWidgets('range default state', (tester) async {
      await tester.pumpWidget(buildSlider(
        variant: DSSliderVariant.range,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_range_default.png'),
      );
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWidget(buildSlider(enabled: false));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_disabled.png'),
      );
    });

    testWidgets('error state', (tester) async {
      await tester.pumpWidget(buildSlider(
        errorText: 'Value is required',
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_error.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(buildSlider(
        overrideState: DSSliderState.loading,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_loading.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(buildSlider(
        overrideState: DSSliderState.skeleton,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_skeleton.png'),
      );
    });

    testWidgets('with marks', (tester) async {
      await tester.pumpWidget(buildSlider(
        marks: testMarks,
        value: 50.0,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_with_marks.png'),
      );
    });

    testWidgets('without ticks', (tester) async {
      await tester.pumpWidget(buildSlider(
        marks: testMarks,
        showTicks: false,
        value: 50.0,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_without_ticks.png'),
      );
    });

    testWidgets('without labels', (tester) async {
      await tester.pumpWidget(buildSlider(
        marks: testMarks,
        showLabels: false,
        value: 50.0,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_without_labels.png'),
      );
    });

    testWidgets('custom configuration', (tester) async {
      const customConfig = DSSliderConfig(
        thumbRadius: 16.0,
        trackHeight: 6.0,
        activeTrackHeight: 8.0,
        contentPadding: EdgeInsets.all(20.0),
        minimumHeight: 60.0,
      );

      await tester.pumpWidget(buildSlider(
        config: customConfig,
        value: 75.0,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_custom_config.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSSlider(
                  value: 50.0,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (_) {},
                  variant: DSSliderVariant.continuous,
                  label: 'Test Slider',
                  helperText: 'Choose a value',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_dark_theme.png'),
      );
    });

    testWidgets('RTL support', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 300,
                  child: DSSlider(
                    value: 50.0,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (_) {},
                    variant: DSSliderVariant.continuous,
                    label: 'شريط التمرير',
                    helperText: 'اختر قيمة',
                    marks: const [
                      DSSliderMark(value: 0, label: 'أدنى'),
                      DSSliderMark(value: 50, label: 'متوسط'),
                      DSSliderMark(value: 100, label: 'أعلى'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_rtl.png'),
      );
    });

    testWidgets('range slider with custom range', (tester) async {
      await tester.pumpWidget(buildSlider(
        variant: DSSliderVariant.range,
        rangeValue: const DSSliderRangeValue(start: 10.0, end: 90.0),
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_range_custom.png'),
      );
    });

    testWidgets('discrete with marks', (tester) async {
      await tester.pumpWidget(buildSlider(
        variant: DSSliderVariant.discrete,
        value: 60.0,
        marks: testMarks,
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_discrete_with_marks.png'),
      );
    });

    testWidgets('edge case - minimum value', (tester) async {
      await tester.pumpWidget(buildSlider(value: 0.0));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_minimum_value.png'),
      );
    });

    testWidgets('edge case - maximum value', (tester) async {
      await tester.pumpWidget(buildSlider(value: 100.0));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_maximum_value.png'),
      );
    });

    testWidgets('range edge case - full range', (tester) async {
      await tester.pumpWidget(buildSlider(
        variant: DSSliderVariant.range,
        rangeValue: const DSSliderRangeValue(start: 0.0, end: 100.0),
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_range_full.png'),
      );
    });

    testWidgets('range edge case - narrow range', (tester) async {
      await tester.pumpWidget(buildSlider(
        variant: DSSliderVariant.range,
        rangeValue: const DSSliderRangeValue(start: 45.0, end: 55.0),
      ));
      await expectLater(
        find.byType(DSSlider),
        matchesGoldenFile('slider_range_narrow.png'),
      );
    });
  });
}
