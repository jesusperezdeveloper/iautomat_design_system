import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/slider/app_slider.dart';
import 'package:iautomat_design_system/src/components/slider/slider_config.dart';

void main() {
  group('DSSlider Unit Tests', () {
    group('Widget Rendering', () {
      testWidgets('renders with required props for continuous variant',
          (tester) async {
        double value = 50.0;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: value,
                min: 0.0,
                max: 100.0,
                onChanged: (newValue) => value = newValue,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
        expect(find.byType(Slider), findsOneWidget);
      });

      testWidgets('renders with required props for discrete variant',
          (tester) async {
        double value = 3.0;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: value,
                min: 1.0,
                max: 5.0,
                step: 1.0,
                onChanged: (newValue) => value = newValue,
                variant: DSSliderVariant.discrete,
              ),
            ),
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
        expect(find.byType(Slider), findsOneWidget);
      });

      testWidgets('renders with required props for range variant',
          (tester) async {
        DSSliderRangeValue value =
            const DSSliderRangeValue(start: 20.0, end: 80.0);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                rangeValue: value,
                min: 0.0,
                max: 100.0,
                onRangeChanged: (newValue) => value = newValue,
                variant: DSSliderVariant.range,
              ),
            ),
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
        expect(find.byType(RangeSlider), findsOneWidget);
      });

      testWidgets('renders with label and helper text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                label: 'Test Slider',
                helperText: 'This is a helper text',
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.text('Test Slider'), findsOneWidget);
        expect(find.text('This is a helper text'), findsOneWidget);
      });

      testWidgets('displays error text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                label: 'Test Slider',
                errorText: 'This is an error',
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.text('This is an error'), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                overrideState: DSSliderState.loading,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                overrideState: DSSliderState.skeleton,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        // Skeleton should show a shimmer container instead of slider
        expect(find.byType(Slider), findsNothing);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        bool changed = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) => changed = true,
                enabled: false,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        // Try to interact with the slider
        await tester.tap(find.byType(Slider));
        await tester.pump();

        expect(changed, false);
      });
    });

    group('Configuration', () {
      testWidgets('applies custom configuration', (tester) async {
        const customConfig = DSSliderConfig(
          thumbRadius: 25.0,
          trackHeight: 8.0,
          minimumHeight: 60.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                config: customConfig,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
      });

      testWidgets('supports custom colors', (tester) async {
        final customColors = DSSliderColors.fromTheme(ThemeData.dark());

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                colors: customColors,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
      });
    });

    group('Marks', () {
      testWidgets('displays marks when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                marks: const [
                  DSSliderMark(value: 0, label: 'Min'),
                  DSSliderMark(value: 50, label: 'Mid'),
                  DSSliderMark(value: 100, label: 'Max'),
                ],
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.text('Min'), findsOneWidget);
        expect(find.text('Mid'), findsOneWidget);
        expect(find.text('Max'), findsOneWidget);
      });

      testWidgets('hides marks when showTicks is false', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                marks: const [
                  DSSliderMark(value: 0, label: 'Min'),
                  DSSliderMark(value: 100, label: 'Max'),
                ],
                showTicks: false,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        // Marks should not be visible when showTicks is false
        expect(find.text('Min'), findsNothing);
        expect(find.text('Max'), findsNothing);
      });
    });

    group('Accessibility', () {
      testWidgets('supports semantic label', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                semanticLabel: 'Volume Control',
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(Semantics).first);
        expect(semantics.label, contains('Volume Control'));
      });

      testWidgets('supports autofocus', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                autoFocus: true,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(DSSlider), findsOneWidget);
      });
    });

    group('Input Handling', () {
      testWidgets('calls onChanged when value changes for continuous',
          (tester) async {
        double? changedValue;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (value) => changedValue = value,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        // Simulate slider interaction
        final gesture = await tester.startGesture(
          tester.getCenter(find.byType(Slider)),
        );
        await gesture.moveBy(const Offset(50, 0));
        await gesture.up();
        await tester.pump();

        expect(changedValue, isNotNull);
        expect(changedValue! > 50.0, true);
      });

      testWidgets('calls onRangeChanged when range changes', (tester) async {
        DSSliderRangeValue? changedValue;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                rangeValue: const DSSliderRangeValue(start: 20.0, end: 80.0),
                min: 0.0,
                max: 100.0,
                onRangeChanged: (value) => changedValue = value,
                variant: DSSliderVariant.range,
              ),
            ),
          ),
        );

        // Simulate range slider interaction
        final gesture = await tester.startGesture(
          tester.getCenter(find.byType(RangeSlider)),
        );
        await gesture.moveBy(const Offset(20, 0));
        await gesture.up();
        await tester.pump();

        expect(changedValue, isNotNull);
      });
    });

    group('Interaction', () {
      testWidgets('can be tapped when enabled', (tester) async {
        bool tapped = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) => tapped = true,
                enabled: true,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(Slider));
        await tester.pump();

        expect(tapped, true);
      });

      testWidgets('supports validation', (tester) async {
        await tester.pumpWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialApp(
                home: Scaffold(
                  body: DSSlider(
                    value: 50.0,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (_) {},
                    validator: (value) {
                      if (value != null && value > 75) {
                        return 'Value too high';
                      }
                      return null;
                    },
                    variant: DSSliderVariant.continuous,
                  ),
                ),
              );
            },
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
      });
    });

    group('Label Formatting', () {
      testWidgets('uses custom label formatter', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                labelFormatter: (value) => '${value.toInt()}%',
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        expect(find.byType(DSSlider), findsOneWidget);
      });
    });

    group('Platform Adaptation', () {
      testWidgets('shows platform-appropriate loading indicator',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSlider(
                value: 50.0,
                min: 0.0,
                max: 100.0,
                onChanged: (_) {},
                overrideState: DSSliderState.loading,
                variant: DSSliderVariant.continuous,
              ),
            ),
          ),
        );

        // Should show CircularProgressIndicator on non-iOS platforms
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });
  });

  group('DSSliderRangeValue', () {
    test('validates correctly', () {
      const validRange = DSSliderRangeValue(start: 10, end: 20);
      const invalidRange = DSSliderRangeValue(start: 20, end: 10);

      expect(validRange.isValid, true);
      expect(invalidRange.isValid, false);
    });

    test('calculates range correctly', () {
      const range = DSSliderRangeValue(start: 10, end: 30);

      expect(range.range, 20);
      expect(range.center, 20);
    });

    test('contains method works correctly', () {
      const range = DSSliderRangeValue(start: 10, end: 30);

      expect(range.contains(15), true);
      expect(range.contains(5), false);
      expect(range.contains(35), false);
      expect(range.contains(10), true);
      expect(range.contains(30), true);
    });

    test('copy methods work correctly', () {
      const original = DSSliderRangeValue(start: 10, end: 30);
      final withNewStart = original.copyWithStart(5);
      final withNewEnd = original.copyWithEnd(35);

      expect(withNewStart.start, 5);
      expect(withNewStart.end, 30);
      expect(withNewEnd.start, 10);
      expect(withNewEnd.end, 35);
    });
  });

  group('DSSliderMark', () {
    test('isActive method works correctly for continuous/discrete', () {
      const mark = DSSliderMark(value: 50, label: 'Middle');

      expect(mark.isActive(60, DSSliderVariant.continuous), true);
      expect(mark.isActive(40, DSSliderVariant.continuous), false);
      expect(mark.isActive(50, DSSliderVariant.continuous), true);

      expect(mark.isActive(60, DSSliderVariant.discrete), true);
      expect(mark.isActive(40, DSSliderVariant.discrete), false);
      expect(mark.isActive(50, DSSliderVariant.discrete), true);
    });

    test('isActive method returns false for range variant', () {
      const mark = DSSliderMark(value: 50, label: 'Middle');

      expect(mark.isActive(60, DSSliderVariant.range), false);
    });
  });

  group('DSSliderValidator', () {
    test('minimum validator works correctly', () {
      final validator = DSSliderValidator.minimum(10);

      expect(validator(15), null);
      expect(validator(5), isNotNull);
      expect(validator(10), null);
      expect(validator(null), null);
    });

    test('maximum validator works correctly', () {
      final validator = DSSliderValidator.maximum(100);

      expect(validator(50), null);
      expect(validator(105), isNotNull);
      expect(validator(100), null);
      expect(validator(null), null);
    });

    test('step validator works correctly', () {
      final validator = DSSliderValidator.step(5);

      expect(validator(10), null);
      expect(validator(7), isNotNull);
      expect(validator(0), null);
      expect(validator(null), null);
    });
  });
}
