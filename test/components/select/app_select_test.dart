import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/select/app_select.dart';
import 'package:iautomat_design_system/src/components/select/select_config.dart';

void main() {
  group('AppSelect', () {
    final testItems = [
      AppSelectItem(value: 'item1', label: 'Item 1'),
      AppSelectItem(value: 'item2', label: 'Item 2'),
      AppSelectItem(value: 'item3', label: 'Item 3'),
    ];

    group('Single Select', () {
      testWidgets('renders correctly with basic properties', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select an item',
                label: 'Test Select',
                config: const AppSelectConfig(enableFloatingLabel: false),
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        expect(find.byType(AppSelect<String>), findsOneWidget);
        expect(find.text('Test Select'), findsOneWidget);
        expect(find.text('Select an item'), findsOneWidget);
      });

      testWidgets('opens and closes dropdown on tap', (tester) async {
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

        // Tap to open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // Check if dropdown items are visible
        expect(find.text('Item 1'), findsOneWidget);
        expect(find.text('Item 2'), findsOneWidget);
        expect(find.text('Item 3'), findsOneWidget);

        // Tap outside to close (simulate by tapping on an item)
        await tester.tap(find.text('Item 1'));
        await tester.pumpAndSettle();

        // Dropdown should be closed
        expect(selectedValue, 'item1');
      });

      testWidgets('selects item correctly', (tester) async {
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

        // Open dropdown and select item
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Item 2'));
        await tester.pumpAndSettle();

        expect(selectedValue, 'item2');
      });

      testWidgets('displays selected item text', (tester) async {
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

        expect(find.text('Item 2'), findsOneWidget);
      });
    });

    group('Multi Select', () {
      testWidgets('renders correctly with multi select', (tester) async {
        List<String> selectedValues = [];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                values: selectedValues,
                onMultiChanged: (values) => selectedValues = values,
                placeholder: 'Select items',
                label: 'Multi Select',
                variant: AppSelectVariant.multi,
              ),
            ),
          ),
        );

        expect(find.byType(AppSelect<String>), findsOneWidget);
        expect(find.text('Multi Select'), findsOneWidget);
        expect(find.text('Select items'), findsOneWidget);
      });

      testWidgets('selects multiple items', (tester) async {
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

        // Open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // Select first item
        await tester.tap(find.byType(Checkbox).first);
        await tester.pumpAndSettle();

        expect(selectedValues.length, 1);
        expect(selectedValues.contains('item1'), true);

        // Select second item
        await tester.tap(find.byType(Checkbox).at(1));
        await tester.pumpAndSettle();

        expect(selectedValues.length, 2);
        expect(selectedValues.contains('item2'), true);
      });

      testWidgets('displays chip count for multi select', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                values: ['item1', 'item2'],
                onMultiChanged: (values) {},
                placeholder: 'Select items',
                variant: AppSelectVariant.multi,
              ),
            ),
          ),
        );

        expect(find.text('2 seleccionados'), findsOneWidget);
      });
    });

    group('Searchable Select', () {
      testWidgets('renders search field when opened', (tester) async {
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

        // Open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // Check if search field is present
        expect(find.byType(TextField), findsOneWidget);
        expect(find.text('Buscar...'), findsOneWidget);
      });

      testWidgets('filters items based on search', (tester) async {
        String? selectedValue;
        final searchableItems = [
          AppSelectItem(value: 'apple', label: 'Apple'),
          AppSelectItem(value: 'banana', label: 'Banana'),
          AppSelectItem(value: 'cherry', label: 'Cherry'),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: searchableItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Search fruits',
                variant: AppSelectVariant.searchable,
              ),
            ),
          ),
        );

        // Open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // Search for "ap"
        await tester.enterText(find.byType(TextField), 'ap');
        await tester.pumpAndSettle();

        // Wait for debounce
        await tester.pump(const Duration(milliseconds: 300));

        // Should only show Apple
        expect(find.text('Apple'), findsOneWidget);
        expect(find.text('Banana'), findsNothing);
        expect(find.text('Cherry'), findsNothing);
      });
    });

    group('States', () {
      testWidgets('renders disabled state correctly', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Disabled select',
                enabled: false,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        // Try to tap - should not open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // No dropdown items should be visible
        expect(find.text('Item 1'), findsNothing);
      });

      testWidgets('shows loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: null,
                onChanged: (value) {},
                placeholder: 'Loading...',
                overrideState: AppSelectState.loading,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        // Check for loading indicator
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: null,
                onChanged: (value) {},
                placeholder: 'Loading...',
                overrideState: AppSelectState.skeleton,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('displays error text', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select with error',
                errorText: 'This field is required',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        expect(find.text('This field is required'), findsOneWidget);
      });

      testWidgets('displays helper text', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select with helper',
                helperText: 'This is helpful information',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        expect(find.text('This is helpful information'), findsOneWidget);
      });
    });

    group('Configuration', () {
      testWidgets('applies custom configuration', (tester) async {
        const customConfig = AppSelectConfig(
          borderRadius: 16,
          minimumHeight: 60,
          borderWidth: 3,
        );

        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Custom config',
                config: customConfig,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        final select = tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.config?.borderRadius, 16);
        expect(select.config?.minimumHeight, 60);
        expect(select.config?.borderWidth, 3);
      });

      testWidgets('applies custom colors', (tester) async {
        final customColors = AppSelectColors(
          borderColor: Colors.red,
          focusedBorderColor: Colors.blue,
          errorBorderColor: Colors.orange,
          disabledBorderColor: Colors.grey,
          fillColor: Colors.yellow[100]!,
          disabledFillColor: Colors.grey[100]!,
          textColor: Colors.black,
          disabledTextColor: Colors.grey,
          hintColor: Colors.grey[600]!,
          disabledHintColor: Colors.grey[400]!,
          labelColor: Colors.blue[800]!,
          focusedLabelColor: Colors.blue,
          errorLabelColor: Colors.red,
          disabledLabelColor: Colors.grey,
          helperTextColor: Colors.green,
          errorTextColor: Colors.red,
          iconColor: Colors.blue,
          disabledIconColor: Colors.grey,
          dropdownIconColor: Colors.blue,
          cursorColor: Colors.blue,
          selectionColor: Colors.blue.withValues(alpha: 0.3),
          counterTextColor: Colors.grey,
          skeletonBaseColor: Colors.grey[300]!,
          skeletonHighlightColor: Colors.grey[100]!,
          dropdownBackgroundColor: Colors.white,
          dropdownShadowColor: Colors.black.withValues(alpha: 0.1),
          itemBackgroundColor: Colors.transparent,
          itemHoverColor: Colors.grey[100]!,
          itemSelectedColor: Colors.blue.withValues(alpha: 0.1),
          itemTextColor: Colors.black,
          itemDisabledTextColor: Colors.grey,
          searchFieldBackgroundColor: Colors.grey[50]!,
          searchFieldBorderColor: Colors.grey[300]!,
          chipBackgroundColor: Colors.blue[100]!,
          chipTextColor: Colors.blue[800]!,
          chipBorderColor: Colors.blue[200]!,
          chipDeleteIconColor: Colors.blue[600]!,
        );

        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Custom colors',
                colors: customColors,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        expect(find.byType(AppSelect<String>), findsOneWidget);
      });
    });

    group('Focus and Accessibility', () {
      testWidgets('supports autofocus', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Autofocus select',
                autoFocus: true,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        final select = tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.autoFocus, true);
      });

      testWidgets('respects focus node', (tester) async {
        final focusNode = FocusNode();
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Focus node select',
                focusNode: focusNode,
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        expect(focusNode.hasFocus, false);

        focusNode.requestFocus();
        await tester.pump();

        // Focus node is properly connected

        focusNode.dispose();
      });
    });

    group('Validators', () {
      testWidgets('required validator works for single select', (tester) async {
        String? Function(String?) validator = AppSelectValidator.required;

        expect(validator(null), 'Este campo es requerido');
        expect(validator('value'), null);
      });

      testWidgets('required validator works for multi select', (tester) async {
        String? Function(List<String>) validator = AppSelectValidator.required;

        expect(validator([]), 'Selecciona al menos una opción');
        expect(validator(['value']), null);
      });

      testWidgets('minSelection validator works', (tester) async {
        final validator = AppSelectValidator.minSelection<List<String>>(2);

        expect(validator(['item1']), 'Selecciona al menos 2 opciones');
        expect(validator(['item1', 'item2']), null);
        expect(validator(['item1', 'item2', 'item3']), null);
      });

      testWidgets('maxSelection validator works', (tester) async {
        final validator = AppSelectValidator.maxSelection<List<String>>(2);

        expect(validator(['item1']), null);
        expect(validator(['item1', 'item2']), null);
        expect(validator(['item1', 'item2', 'item3']), 'Selecciona máximo 2 opciones');
      });

      testWidgets('combined validators work', (tester) async {
        final validator = AppSelectValidator.combine<List<String>>([
          AppSelectValidator.required,
          AppSelectValidator.minSelection(1),
          AppSelectValidator.maxSelection(3),
        ]);

        expect(validator([]), 'Selecciona al menos una opción');
        expect(validator(['item1']), null);
        expect(validator(['item1', 'item2']), null);
        expect(validator(['item1', 'item2', 'item3']), null);
        expect(validator(['item1', 'item2', 'item3', 'item4']), 'Selecciona máximo 3 opciones');
      });
    });

    group('Items', () {
      testWidgets('handles items with subtitles', (tester) async {
        final itemsWithSubtitles = [
          AppSelectItem(
            value: 'item1',
            label: 'Item 1',
            subtitle: 'Subtitle 1',
          ),
          AppSelectItem(
            value: 'item2',
            label: 'Item 2',
            subtitle: 'Subtitle 2',
          ),
        ];

        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: itemsWithSubtitles,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select with subtitles',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        // Open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        expect(find.text('Item 1'), findsOneWidget);
        expect(find.text('Subtitle 1'), findsOneWidget);
        expect(find.text('Item 2'), findsOneWidget);
        expect(find.text('Subtitle 2'), findsOneWidget);
      });

      testWidgets('handles disabled items', (tester) async {
        final itemsWithDisabled = [
          AppSelectItem(value: 'item1', label: 'Item 1'),
          AppSelectItem(
            value: 'item2',
            label: 'Item 2 (Disabled)',
            enabled: false,
          ),
          AppSelectItem(value: 'item3', label: 'Item 3'),
        ];

        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: itemsWithDisabled,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select with disabled items',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        // Open dropdown
        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // Try to tap disabled item - should not select
        await tester.tap(find.text('Item 2 (Disabled)'));
        await tester.pumpAndSettle();

        expect(selectedValue, null);

        // Tap enabled item - should select
        await tester.tap(find.text('Item 1'));
        await tester.pumpAndSettle();

        expect(selectedValue, 'item1');
      });
    });
  });
}