import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/select/ds_select.dart';
import 'package:iautomat_design_system/src/components/select/select_config.dart';

void main() {
  group('DSSelect Simple Tests', () {
    final testItems = [
      DSSelectItem(value: 'item1', label: 'Item 1'),
      DSSelectItem(value: 'item2', label: 'Item 2'),
      DSSelectItem(value: 'item3', label: 'Item 3'),
    ];

    testWidgets('renders basic DSSelect widget', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Select an item',
              variant: DSSelectVariant.single,
            ),
          ),
        ),
      );

      expect(find.byType(DSSelect<String>), findsOneWidget);
      expect(find.text('Select an item'), findsOneWidget);
    });

    testWidgets('renders label with floating disabled', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Select an item',
              label: 'Test Label',
              config: const DSSelectConfig(enableFloatingLabel: false),
              variant: DSSelectVariant.single,
            ),
          ),
        ),
      );

      expect(find.byType(DSSelect<String>), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Select an item'), findsOneWidget);
    });

    testWidgets('can tap to interact', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Select an item',
              variant: DSSelectVariant.single,
            ),
          ),
        ),
      );

      // Try to tap the select widget
      await tester.tap(find.byType(DSSelect<String>));
      await tester.pumpAndSettle();

      // The dropdown overlay might not be found in basic tests
      // This test just verifies the tap doesn't crash
      expect(find.byType(DSSelect<String>), findsOneWidget);
    });

    testWidgets('displays selected value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSelect<String>(
              items: testItems,
              value: 'item2',
              onChanged: (value) {},
              placeholder: 'Select an item',
              variant: DSSelectVariant.single,
            ),
          ),
        ),
      );

      expect(find.byType(DSSelect<String>), findsOneWidget);
      // Check if the selected value is displayed somewhere
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('multi select renders correctly', (tester) async {
      List<String> selectedValues = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSelect<String>(
              items: testItems,
              values: selectedValues,
              onMultiChanged: (values) => selectedValues = values,
              placeholder: 'Select items',
              variant: DSSelectVariant.multi,
            ),
          ),
        ),
      );

      expect(find.byType(DSSelect<String>), findsOneWidget);
      expect(find.text('Select items'), findsOneWidget);
    });

    testWidgets('searchable select renders correctly', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSelect<String>(
              items: testItems,
              value: selectedValue,
              onChanged: (value) => selectedValue = value,
              placeholder: 'Search and select',
              variant: DSSelectVariant.searchable,
            ),
          ),
        ),
      );

      expect(find.byType(DSSelect<String>), findsOneWidget);
      expect(find.text('Search and select'), findsOneWidget);
    });
  });
}
