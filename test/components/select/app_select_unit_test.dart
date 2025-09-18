import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/select/app_select.dart';
import 'package:iautomat_design_system/src/components/select/select_config.dart';

void main() {
  group('AppSelect Unit Tests', () {
    final testItems = [
      AppSelectItem(value: 'item1', label: 'Item 1'),
      AppSelectItem(value: 'item2', label: 'Item 2'),
      AppSelectItem(value: 'item3', label: 'Item 3'),
    ];

    group('Widget Rendering', () {
      testWidgets('renders with required props for single select',
          (tester) async {
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

      testWidgets('renders with label when floating label disabled',
          (tester) async {
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

        expect(find.text('Test Label'), findsOneWidget);
        expect(find.text('Select an item'), findsOneWidget);
      });

      testWidgets('displays selected value text', (tester) async {
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

      testWidgets('renders multi select correctly', (tester) async {
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

      testWidgets('renders searchable select correctly', (tester) async {
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

    group('States', () {
      testWidgets('shows loading state', (tester) async {
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

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton state', (tester) async {
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

        final select =
            tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.config?.borderRadius, 16);
        expect(select.config?.minimumHeight, 60);
        expect(select.config?.borderWidth, 3);
      });

      testWidgets('accepts custom colors', (tester) async {
        final customColors = AppSelectColors(
          borderColor: Colors.red,
          focusedBorderColor: Colors.blue,
          errorBorderColor: Colors.orange,
          disabledBorderColor: Colors.grey,
          fillColor: Colors.yellow.shade100,
          disabledFillColor: Colors.grey.shade100,
          textColor: Colors.black,
          disabledTextColor: Colors.grey,
          hintColor: Colors.grey.shade600,
          disabledHintColor: Colors.grey.shade400,
          labelColor: Colors.blue.shade800,
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
          skeletonBaseColor: Colors.grey.shade300,
          skeletonHighlightColor: Colors.grey.shade100,
          dropdownBackgroundColor: Colors.white,
          dropdownShadowColor: Colors.black.withValues(alpha: 0.1),
          itemBackgroundColor: Colors.transparent,
          itemHoverColor: Colors.grey.shade100,
          itemSelectedColor: Colors.blue.withValues(alpha: 0.1),
          itemTextColor: Colors.black,
          itemDisabledTextColor: Colors.grey,
          searchFieldBackgroundColor: Colors.grey.shade50,
          searchFieldBorderColor: Colors.grey.shade300,
          chipBackgroundColor: Colors.blue.shade100,
          chipTextColor: Colors.blue.shade800,
          chipBorderColor: Colors.blue.shade200,
          chipDeleteIconColor: Colors.blue.shade600,
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

        final select =
            tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.colors, customColors);
      });
    });

    group('Validators', () {
      test('required validator works for single select', () {
        final validator = AppSelectValidator.required<String>;

        expect(validator(null), 'Este campo es requerido');
        expect(validator('value'), null);
      });

      test('required validator works for multi select', () {
        final validator = AppSelectValidator.required<List<String>>;

        expect(validator([]), 'Selecciona al menos una opción');
        expect(validator(['value']), null);
      });

      test('minSelection validator works', () {
        final validator = AppSelectValidator.minSelection<List<String>>(2);

        expect(validator(['item1']), 'Selecciona al menos 2 opciones');
        expect(validator(['item1', 'item2']), null);
        expect(validator(['item1', 'item2', 'item3']), null);
      });

      test('maxSelection validator works', () {
        final validator = AppSelectValidator.maxSelection<List<String>>(2);

        expect(validator(['item1']), null);
        expect(validator(['item1', 'item2']), null);
        expect(validator(['item1', 'item2', 'item3']),
            'Selecciona máximo 2 opciones');
      });

      test('combined validators work', () {
        final validator = AppSelectValidator.combine<List<String>>([
          AppSelectValidator.required,
          AppSelectValidator.minSelection(1),
          AppSelectValidator.maxSelection(3),
        ]);

        expect(validator([]), 'Selecciona al menos una opción');
        expect(validator(['item1']), null);
        expect(validator(['item1', 'item2']), null);
        expect(validator(['item1', 'item2', 'item3']), null);
        expect(validator(['item1', 'item2', 'item3', 'item4']),
            'Selecciona máximo 3 opciones');
      });
    });

    group('Items', () {
      testWidgets('handles items with different properties', (tester) async {
        final complexItems = [
          AppSelectItem(
            value: 'item1',
            label: 'Item 1',
            subtitle: 'Subtitle 1',
            enabled: true,
          ),
          AppSelectItem(
            value: 'item2',
            label: 'Item 2 (Disabled)',
            enabled: false,
          ),
          AppSelectItem(
            value: 'item3',
            label: 'Item 3',
            searchableText: 'custom search text',
          ),
        ];

        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: complexItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select complex item',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        final select =
            tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.items.length, 3);
        expect(select.items[0].subtitle, 'Subtitle 1');
        expect(select.items[1].enabled, false);
        expect(select.items[2].searchableText, 'custom search text');
      });
    });

    group('Accessibility', () {
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

        final select =
            tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.autoFocus, true);
      });

      testWidgets('respects semantic label', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Select with semantics',
                semanticLabel: 'Choose an option',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        final select =
            tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.semanticLabel, 'Choose an option');
      });

      testWidgets('handles disabled state', (tester) async {
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

        final select =
            tester.widget<AppSelect<String>>(find.byType(AppSelect<String>));
        expect(select.enabled, false);
      });
    });

    group('Multi Select Specific', () {
      testWidgets('displays chips for selected items', (tester) async {
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

        expect(find.byType(Chip), findsNWidgets(2));
        expect(find.text('Item 1'), findsOneWidget);
        expect(find.text('Item 2'), findsOneWidget);
      });

      testWidgets('handles empty multi selection', (tester) async {
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

        expect(find.text('Select items'), findsOneWidget);
      });
    });

    group('Interaction', () {
      testWidgets('can be tapped when enabled', (tester) async {
        String? selectedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSelect<String>(
                items: testItems,
                value: selectedValue,
                onChanged: (value) => selectedValue = value,
                placeholder: 'Tappable select',
                variant: AppSelectVariant.single,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppSelect<String>));
        await tester.pumpAndSettle();

        // The tap gesture should be detected without errors
        expect(find.byType(AppSelect<String>), findsOneWidget);
      });
    });
  });
}
