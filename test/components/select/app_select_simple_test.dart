import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/select/app_select.dart';
import 'package:iautomat_design_system/src/components/select/select_config.dart';

void main() {
  group('AppSelect Simple Tests', () {
    final testItems = [
      AppSelectItem(value: 'item1', label: 'Item 1'),
      AppSelectItem(value: 'item2', label: 'Item 2'),
      AppSelectItem(value: 'item3', label: 'Item 3'),
    ];

    testWidgets('renders basic AppSelect widget', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Select an item',
              variant: AppSelectVariant.single,
            ),
          ),
        ),
      );

      expect(find.byType(AppSelect<String>), findsOneWidget);
      expect(find.text('Select an item'), findsOneWidget);
    });

    testWidgets('renders label with floating disabled', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Select an item',
              label: 'Test Label',
              config: const AppSelectConfig(enableFloatingLabel: false),
              variant: AppSelectVariant.single,
            ),
          ),
        ),
      );

      expect(find.byType(AppSelect<String>), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Select an item'), findsOneWidget);
    });

    testWidgets('can tap to interact', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Select an item',
              variant: AppSelectVariant.single,
            ),
          ),
        ),
      );

      // Try to tap the select widget
      await tester.tap(find.byType(AppSelect<String>));
      await tester.pumpAndSettle();

      // The dropdown overlay might not be found in basic tests
      // This test just verifies the tap doesn't crash
      expect(find.byType(AppSelect<String>), findsOneWidget);
    });

    testWidgets('displays selected value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSelect<String>(
              items: testItems,
              value: 'item2',
              onChanged: (value) {},
              placeholder: 'Select an item',
              variant: AppSelectVariant.single,
            ),
          ),
        ),
      );

      expect(find.byType(AppSelect<String>), findsOneWidget);
      // Check if the selected value is displayed somewhere
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('multi select renders correctly', (tester) async {
      List<String> selectedValues = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSelect<String>(
              items: testItems,
              values: selectedValues,
              onMultiChanged: (values) => selectedValues = values,
              placeholder: 'Select items',
              variant: AppSelectVariant.multi,
            ),
          ),
        ),
      );

      expect(find.byType(AppSelect<String>), findsOneWidget);
      expect(find.text('Select items'), findsOneWidget);
    });

    testWidgets('searchable select renders correctly', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Search and select',
              variant: AppSelectVariant.searchable,
            ),
          ),
        ),
      );

      expect(find.byType(AppSelect<String>), findsOneWidget);
      expect(find.text('Search and select'), findsOneWidget);
    });
  });
}