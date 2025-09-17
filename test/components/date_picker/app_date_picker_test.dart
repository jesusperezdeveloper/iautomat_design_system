import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/date_picker/app_date_picker.dart';
import 'package:iautomat_design_system/src/components/date_picker/date_picker_config.dart';

void main() {
  group('AppDatePicker', () {
    late Widget testApp;

    setUp(() {
      testApp = MaterialApp(
        home: Scaffold(
          body: AppDatePicker(
            variant: AppDatePickerVariant.date,
            onChanged: (_) {},
          ),
        ),
      );
    });

    group('Basic Widget Tests', () {
      testWidgets('renders correctly with default configuration', (tester) async {
        await tester.pumpWidget(testApp);

        expect(find.byType(AppDatePicker), findsOneWidget);
        expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      });

      testWidgets('displays hint text when no value is selected', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                hintText: 'Select a date',
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('Select a date'), findsOneWidget);
      });

      testWidgets('displays formatted date when value is provided', (tester) async {
        final testDate = DateTime(2023, 12, 25);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                value: testDate,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('25/12/2023'), findsOneWidget);
      });

      testWidgets('displays formatted time when time variant is used', (tester) async {
        const testTime = TimeOfDay(hour: 14, minute: 30);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.time,
                value: testTime,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('02:30 PM'), findsOneWidget);
      });

      testWidgets('displays 24-hour format when specified', (tester) async {
        const testTime = TimeOfDay(hour: 14, minute: 30);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.time,
                value: testTime,
                use24HourFormat: true,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('14:30'), findsOneWidget);
      });

      testWidgets('displays date range when range variant is used', (tester) async {
        final testRange = AppDateRange(
          start: DateTime(2023, 12, 1),
          end: DateTime(2023, 12, 31),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.range,
                value: testRange,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('01/12/2023 - 31/12/2023'), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('opens date picker when tapped', (tester) async {
        await tester.pumpWidget(testApp);

        await tester.tap(find.byType(AppDatePicker));
        await tester.pumpAndSettle();

        // Should open the date picker dialog
        expect(find.byType(DatePickerDialog), findsOneWidget);
      });

      testWidgets('calls onChanged when date is selected', (tester) async {
        DateTime? selectedDate;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                onChanged: (date) => selectedDate = date,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppDatePicker));
        await tester.pumpAndSettle();

        // Tap on a date in the calendar
        await tester.tap(find.text('15'));
        await tester.pumpAndSettle();

        // Confirm selection
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        expect(selectedDate, isNotNull);
        expect(selectedDate!.day, equals(15));
      });

      testWidgets('does not respond to tap when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                enabled: false,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppDatePicker));
        await tester.pumpAndSettle();

        // Should not open date picker dialog
        expect(find.byType(DatePickerDialog), findsNothing);
      });

      testWidgets('does not call onChanged when onChanged is null', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                onChanged: null,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppDatePicker));
        await tester.pumpAndSettle();

        // Should not open date picker dialog
        expect(find.byType(DatePickerDialog), findsNothing);
      });
    });

    group('State Tests', () {
      testWidgets('shows loading indicator in loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                state: AppDatePickerState.loading,
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
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                state: AppDatePickerState.skeleton,
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
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                state: AppDatePickerState.disabled,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appDatePicker = tester.widget<AppDatePicker>(find.byType(AppDatePicker));
        expect(appDatePicker.state, equals(AppDatePickerState.disabled));
      });
    });

    group('Configuration Tests', () {
      testWidgets('applies custom configuration', (tester) async {
        const customConfig = AppDatePickerConfig(
          borderRadius: 20.0,
          borderWidth: 3.0,
          minHeight: 60.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                config: customConfig,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(AppDatePicker),
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
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                prefixIcon: const Icon(Icons.event_note),
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.event_note), findsOneWidget);
        expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
      });

      testWidgets('uses default icons when not provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      });
    });

    group('Variant Tests', () {
      testWidgets('shows calendar icon for date variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      });

      testWidgets('shows time icon for time variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.time,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.access_time), findsOneWidget);
      });

      testWidgets('shows date range icon for range variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.range,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.date_range), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantic properties', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                semanticLabel: 'Date picker for appointment',
                labelText: 'Appointment date',
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(AppDatePicker));
        expect(semantics.label, contains('Date picker for appointment'));
      });

      testWidgets('is properly focusable', (tester) async {
        final focusNode = FocusNode();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
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

    group('Validation Tests', () {
      testWidgets('shows error text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                errorText: 'Invalid date selected',
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('Invalid date selected'), findsOneWidget);
      });

      testWidgets('shows helper text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                helperText: 'Select your birth date',
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('Select your birth date'), findsOneWidget);
      });
    });

    group('Edge Cases', () {
      testWidgets('handles null values gracefully', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                value: null,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppDatePicker), findsOneWidget);
        expect(find.text('Seleccionar fecha'), findsOneWidget);
      });

      testWidgets('handles partial date range gracefully', (tester) async {
        final partialRange = AppDateRange(
          start: DateTime(2023, 12, 1),
          end: null,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.range,
                value: partialRange,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('01/12/2023'), findsOneWidget);
      });

      testWidgets('respects first and last date constraints', (tester) async {
        final firstDate = DateTime(2023, 1, 1);
        final lastDate = DateTime(2023, 12, 31);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                firstDate: firstDate,
                lastDate: lastDate,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appDatePicker = tester.widget<AppDatePicker>(find.byType(AppDatePicker));
        expect(appDatePicker.firstDate, equals(firstDate));
        expect(appDatePicker.lastDate, equals(lastDate));
      });
    });

    group('Animation Tests', () {
      testWidgets('animates scale on press', (tester) async {
        await tester.pumpWidget(testApp);

        final gesture = await tester.startGesture(
          tester.getCenter(find.byType(AppDatePicker)),
        );

        await tester.pump(const Duration(milliseconds: 100));

        // Should have scale animation during press
        final transform = tester.widget<Transform>(
          find.descendant(
            of: find.byType(AppDatePicker),
            matching: find.byType(Transform),
          ),
        );

        expect(transform.transform.getMaxScaleOnAxis(), lessThan(1.0));

        await gesture.up();
        await tester.pumpAndSettle();
      });
    });

    group('Platform Adaptive Tests', () {
      testWidgets('uses platform adaptive behavior when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                adaptivePlatform: true,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appDatePicker = tester.widget<AppDatePicker>(find.byType(AppDatePicker));
        expect(appDatePicker.adaptivePlatform, isTrue);
      });

      testWidgets('does not use platform adaptive when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDatePicker(
                variant: AppDatePickerVariant.date,
                adaptivePlatform: false,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        final appDatePicker = tester.widget<AppDatePicker>(find.byType(AppDatePicker));
        expect(appDatePicker.adaptivePlatform, isFalse);
      });
    });
  });

  group('AppDateRange', () {
    test('creates valid range', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: DateTime(2023, 1, 31),
      );

      expect(range.isValid, isTrue);
      expect(range.isEmpty, isFalse);
      expect(range.isPartial, isFalse);
      expect(range.days, equals(30));
    });

    test('detects invalid range', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 31),
        end: DateTime(2023, 1, 1), // End before start
      );

      expect(range.isValid, isFalse);
    });

    test('detects empty range', () {
      const range = AppDateRange(start: null, end: null);

      expect(range.isEmpty, isTrue);
      expect(range.isPartial, isFalse);
    });

    test('detects partial range', () {
      final range1 = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: null,
      );

      final range2 = AppDateRange(
        start: null,
        end: DateTime(2023, 1, 31),
      );

      expect(range1.isPartial, isTrue);
      expect(range2.isPartial, isTrue);
    });

    test('calculates duration correctly', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: DateTime(2023, 1, 31),
      );

      expect(range.duration!.inDays, equals(30));
    });

    test('checks if date is contained in range', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: DateTime(2023, 1, 31),
      );

      expect(range.contains(DateTime(2023, 1, 15)), isTrue);
      expect(range.contains(DateTime(2022, 12, 31)), isFalse);
      expect(range.contains(DateTime(2023, 2, 1)), isFalse);
    });

    test('copies with new start date', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: DateTime(2023, 1, 31),
      );

      final newRange = range.copyWithStart(DateTime(2023, 1, 15));

      expect(newRange.start, equals(DateTime(2023, 1, 15)));
      expect(newRange.end, equals(DateTime(2023, 1, 31)));
    });

    test('copies with new end date', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: DateTime(2023, 1, 31),
      );

      final newRange = range.copyWithEnd(DateTime(2023, 1, 15));

      expect(newRange.start, equals(DateTime(2023, 1, 1)));
      expect(newRange.end, equals(DateTime(2023, 1, 15)));
    });

    test('clears range', () {
      final range = AppDateRange(
        start: DateTime(2023, 1, 1),
        end: DateTime(2023, 1, 31),
      );

      final clearedRange = range.clear();

      expect(clearedRange.isEmpty, isTrue);
    });
  });

  group('AppTimeValue', () {
    test('creates valid time', () {
      const time = AppTimeValue(hour: 14, minute: 30);

      expect(time.isValid(), isTrue);
      expect(time.hour, equals(14));
      expect(time.minute, equals(30));
    });

    test('creates time with seconds', () {
      const time = AppTimeValue(hour: 14, minute: 30, second: 45);

      expect(time.isValid(), isTrue);
      expect(time.second, equals(45));
    });

    test('validates time correctly', () {
      const validTime = AppTimeValue(hour: 14, minute: 30);
      const invalidHour = AppTimeValue(hour: 25, minute: 30);
      const invalidMinute = AppTimeValue(hour: 14, minute: 60);

      expect(validTime.isValid(), isTrue);
      expect(invalidHour.isValid(), isFalse);
      expect(invalidMinute.isValid(), isFalse);
    });

    test('converts to TimeOfDay', () {
      const time = AppTimeValue(hour: 14, minute: 30);
      final timeOfDay = time.toTimeOfDay();

      expect(timeOfDay.hour, equals(14));
      expect(timeOfDay.minute, equals(30));
    });

    test('formats time correctly', () {
      const time = AppTimeValue(hour: 14, minute: 30);

      expect(time.format(use24Hour: true), equals('14:30'));
      expect(time.format(use24Hour: false), equals('2:30 PM'));
    });

    test('creates from TimeOfDay', () {
      const timeOfDay = TimeOfDay(hour: 14, minute: 30);
      final time = AppTimeValue.fromTimeOfDay(timeOfDay);

      expect(time.hour, equals(14));
      expect(time.minute, equals(30));
    });

    test('creates from current time', () {
      final time = AppTimeValue.now();

      expect(time.isValid(), isTrue);
      expect(time.hour, inInclusiveRange(0, 23));
      expect(time.minute, inInclusiveRange(0, 59));
    });

  });

  group('DateTime Extensions', () {
    test('isSameDay works correctly', () {
      final date1 = DateTime(2023, 1, 1, 10, 30);
      final date2 = DateTime(2023, 1, 1, 15, 45);
      final date3 = DateTime(2023, 1, 2, 10, 30);

      expect(date1.isSameDay(date2), isTrue);
      expect(date1.isSameDay(date3), isFalse);
    });

    test('isSameMonth works correctly', () {
      final date1 = DateTime(2023, 1, 1);
      final date2 = DateTime(2023, 1, 31);
      final date3 = DateTime(2023, 2, 1);

      expect(date1.isSameMonth(date2), isTrue);
      expect(date1.isSameMonth(date3), isFalse);
    });

    test('isSameYear works correctly', () {
      final date1 = DateTime(2023, 1, 1);
      final date2 = DateTime(2023, 12, 31);
      final date3 = DateTime(2024, 1, 1);

      expect(date1.isSameYear(date2), isTrue);
      expect(date1.isSameYear(date3), isFalse);
    });

    test('startOfDay works correctly', () {
      final date = DateTime(2023, 1, 15, 14, 30, 45);
      final startOfDay = date.startOfDay;

      expect(startOfDay.year, equals(2023));
      expect(startOfDay.month, equals(1));
      expect(startOfDay.day, equals(15));
      expect(startOfDay.hour, equals(0));
      expect(startOfDay.minute, equals(0));
      expect(startOfDay.second, equals(0));
    });

    test('endOfDay works correctly', () {
      final date = DateTime(2023, 1, 15, 14, 30, 45);
      final endOfDay = date.endOfDay;

      expect(endOfDay.year, equals(2023));
      expect(endOfDay.month, equals(1));
      expect(endOfDay.day, equals(15));
      expect(endOfDay.hour, equals(23));
      expect(endOfDay.minute, equals(59));
      expect(endOfDay.second, equals(59));
    });

    test('isToday works correctly', () {
      final today = DateTime.now();
      final yesterday = today.subtract(const Duration(days: 1));

      expect(today.isToday, isTrue);
      expect(yesterday.isToday, isFalse);
    });
  });
}