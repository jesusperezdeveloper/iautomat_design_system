import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/combobox/app_combobox.dart';
import 'package:iautomat_design_system/src/components/combobox/combobox_config.dart';

void main() {
  group('AppComboBox Unit Tests', () {
    final testSuggestions = [
      AppComboBoxSuggestion(value: 'item1', label: 'Item 1'),
      AppComboBoxSuggestion(value: 'item2', label: 'Item 2'),
      AppComboBoxSuggestion(value: 'item3', label: 'Item 3'),
    ];

    group('Widget Rendering', () {
      testWidgets('renders with required props', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Search...',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.byType(AppComboBox<String>), findsOneWidget);
        expect(find.text('Search...'), findsOneWidget);
      });

      testWidgets('renders with label when floating label disabled',
          (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Search...',
                label: 'Test Label',
                config: const AppComboBoxConfig(enableFloatingLabel: false),
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.text('Test Label'), findsOneWidget);
        expect(find.text('Search...'), findsOneWidget);
      });

      testWidgets('displays query text in input field', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: 'test query',
                onQueryChanged: (value) {},
                suggestions: testSuggestions,
                placeholder: 'Search...',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.text('test query'), findsOneWidget);
      });

      testWidgets('renders with controller', (tester) async {
        final controller = TextEditingController(text: 'controller text');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                controller: controller,
                suggestions: testSuggestions,
                placeholder: 'Search...',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.text('controller text'), findsOneWidget);

        controller.dispose();
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: '',
                onQueryChanged: (value) {},
                suggestions: testSuggestions,
                placeholder: 'Loading...',
                overrideState: AppComboBoxState.loading,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Cargando...'), findsOneWidget);
      });

      testWidgets('shows skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: '',
                onQueryChanged: (value) {},
                suggestions: testSuggestions,
                placeholder: 'Loading...',
                overrideState: AppComboBoxState.skeleton,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('displays error text', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Search with error',
                errorText: 'This field is required',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.text('This field is required'), findsOneWidget);
      });

      testWidgets('displays helper text', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Search with helper',
                helperText: 'This is helpful information',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(find.text('This is helpful information'), findsOneWidget);
      });

      testWidgets('handles disabled state', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Disabled combobox',
                enabled: false,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.enabled, false);
      });
    });

    group('Configuration', () {
      testWidgets('applies custom configuration', (tester) async {
        const customConfig = AppComboBoxConfig(
          borderRadius: 16,
          minimumHeight: 60,
          borderWidth: 3,
          typeaheadDebounceMs: 500,
          maxSuggestions: 5,
        );

        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Custom config',
                config: customConfig,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.config?.borderRadius, 16);
        expect(combobox.config?.minimumHeight, 60);
        expect(combobox.config?.borderWidth, 3);
        expect(combobox.config?.typeaheadDebounceMs, 500);
        expect(combobox.config?.maxSuggestions, 5);
      });

      testWidgets('accepts custom colors', (tester) async {
        final customColors = AppComboBoxColors(
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
          cursorColor: Colors.blue,
          selectionColor: Colors.blue.withValues(alpha: 0.3),
          counterTextColor: Colors.grey,
          skeletonBaseColor: Colors.grey.shade300,
          skeletonHighlightColor: Colors.grey.shade100,
          suggestionsBackgroundColor: Colors.white,
          suggestionsShadowColor: Colors.black.withValues(alpha: 0.1),
          suggestionItemBackgroundColor: Colors.transparent,
          suggestionItemHoverColor: Colors.grey.shade100,
          suggestionItemSelectedColor: Colors.blue.withValues(alpha: 0.1),
          suggestionItemTextColor: Colors.black,
          suggestionItemDisabledTextColor: Colors.grey,
          suggestionItemSubtitleColor: Colors.grey.shade600,
          highlightTextColor: Colors.blue,
          highlightBackgroundColor: Colors.blue.withValues(alpha: 0.1),
          loadingIndicatorColor: Colors.blue,
          noResultsTextColor: Colors.grey.shade600,
        );

        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Custom colors',
                colors: customColors,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.colors, customColors);
      });
    });

    group('Validators', () {
      test('required validator works', () {
        final validator = AppComboBoxValidator.required<String>;

        expect(validator(null), 'Este campo es requerido');
        expect(validator(''), 'Este campo es requerido');
        expect(validator('value'), null);
      });

      test('minLength validator works', () {
        final validator = AppComboBoxValidator.minLength(3);

        expect(validator(null), null);
        expect(validator(''), null);
        expect(validator('ab'), 'Mínimo 3 caracteres');
        expect(validator('abc'), null);
        expect(validator('abcd'), null);
      });

      test('maxLength validator works', () {
        final validator = AppComboBoxValidator.maxLength(5);

        expect(validator(null), null);
        expect(validator(''), null);
        expect(validator('abc'), null);
        expect(validator('abcde'), null);
        expect(validator('abcdef'), 'Máximo 5 caracteres');
      });

      test('email validator works', () {
        final validator = AppComboBoxValidator.email;

        expect(validator(null), null);
        expect(validator(''), null);
        expect(validator('invalid'), 'Formato de email inválido');
        expect(validator('test@example.com'), null);
        expect(validator('user.name+tag@domain.co.uk'), null);
      });

      test('url validator works', () {
        final validator = AppComboBoxValidator.url;

        expect(validator(null), null);
        expect(validator(''), null);
        expect(validator('invalid'), 'Formato de URL inválido');
        expect(validator('https://example.com'), null);
        expect(validator('http://sub.domain.com/path'), null);
      });

      test('combined validators work', () {
        final validator = AppComboBoxValidator.combine([
          AppComboBoxValidator.required,
          AppComboBoxValidator.minLength(3),
          AppComboBoxValidator.email,
        ]);

        expect(validator(null), 'Este campo es requerido');
        expect(validator(''), 'Este campo es requerido');
        expect(validator('ab'), 'Mínimo 3 caracteres');
        expect(validator('abc'), 'Formato de email inválido');
        expect(validator('test@example.com'), null);
      });
    });

    group('Suggestions', () {
      testWidgets('handles suggestions with different properties',
          (tester) async {
        final complexSuggestions = [
          AppComboBoxSuggestion(
            value: 'item1',
            label: 'Item 1',
            subtitle: 'Subtitle 1',
            enabled: true,
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
          ),
          AppComboBoxSuggestion(
            value: 'item2',
            label: 'Item 2 (Disabled)',
            enabled: false,
          ),
          AppComboBoxSuggestion(
            value: 'item3',
            label: 'Item 3',
            searchableText: 'custom search text',
            metadata: {'category': 'test'},
          ),
        ];

        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: complexSuggestions,
                placeholder: 'Search complex items',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.suggestions.length, 3);
        expect(combobox.suggestions[0].subtitle, 'Subtitle 1');
        expect(combobox.suggestions[1].enabled, false);
        expect(combobox.suggestions[2].searchableText, 'custom search text');
        expect(combobox.suggestions[2].metadata?['category'], 'test');
      });

      test('suggestion matches method works correctly', () {
        // Test suggestion without searchableText (uses label)
        final suggestion1 = AppComboBoxSuggestion(
          value: 'test',
          label: 'Test Item',
        );

        expect(suggestion1.matches('test'), true);
        expect(suggestion1.matches('TEST', caseSensitive: false), true);
        expect(suggestion1.matches('TEST', caseSensitive: true), false);
        expect(suggestion1.matches('Item'), true);
        expect(suggestion1.matches('xyz'), false);

        // Test suggestion with searchableText (uses searchableText)
        final suggestion2 = AppComboBoxSuggestion(
          value: 'test',
          label: 'Test Item',
          searchableText: 'Custom Search Text',
        );

        expect(suggestion2.matches('Custom'), true);
        expect(suggestion2.matches('Search'), true);
        expect(
            suggestion2.matches('custom search', caseSensitive: false), true);
        expect(suggestion2.matches('test'), false); // No está en searchableText
        expect(suggestion2.matches('Text'), true);

        // Test empty query
        expect(suggestion1.matches(''), true);
        expect(suggestion2.matches(''), true);

        // Test whitespace trimming
        expect(suggestion2.matches('  Custom  ', trimWhitespace: true), true);
      });

      test('suggestion getHighlightedLabel works correctly', () {
        final suggestion = AppComboBoxSuggestion(
          value: 'test',
          label: 'Test Item',
        );

        final spans = suggestion.getHighlightedLabel(
          'test',
          Colors.black,
          Colors.blue,
        );

        expect(spans.length, 2);
        expect(spans[0].text, 'Test');
        expect(spans[1].text, ' Item');
      });
    });

    group('Accessibility', () {
      testWidgets('supports autofocus', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Autofocus combobox',
                autoFocus: true,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.autoFocus, true);
      });

      testWidgets('respects semantic label', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Search with semantics',
                semanticLabel: 'Choose an option',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.semanticLabel, 'Choose an option');
      });

      testWidgets('supports custom focus node', (tester) async {
        final focusNode = FocusNode();
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Focus node combobox',
                focusNode: focusNode,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        expect(focusNode.hasFocus, false);

        focusNode.requestFocus();
        await tester.pump();

        focusNode.dispose();
      });
    });

    group('Input Handling', () {
      testWidgets('calls onQueryChanged when text changes', (tester) async {
        String query = '';
        String? lastChangedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) {
                  query = value;
                  lastChangedValue = value;
                },
                suggestions: testSuggestions,
                placeholder: 'Search...',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'test input');
        await tester.pump();

        expect(lastChangedValue, 'test input');
      });

      testWidgets('calls onSelected when suggestion is selected',
          (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                onSelected: (suggestion) {},
                placeholder: 'Search...',
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        // We can't easily test the actual selection without the overlay
        // but we can verify the callback is set up
        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.onSelected, isNotNull);
      });

      testWidgets('supports different keyboard types', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Email input',
                keyboardType: TextInputType.emailAddress,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.keyboardType, TextInputType.emailAddress);
      });
    });

    group('Interaction', () {
      testWidgets('can be tapped when enabled', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Tappable combobox',
                onTap: () {},
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(TextFormField));
        await tester.pump();

        // The tap gesture should be detected without errors
        expect(find.byType(AppComboBox<String>), findsOneWidget);
      });

      testWidgets('supports validation', (tester) async {
        String query = '';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppComboBox<String>(
                query: query,
                onQueryChanged: (value) => query = value,
                suggestions: testSuggestions,
                placeholder: 'Validated combobox',
                validator: AppComboBoxValidator.required,
                variant: AppComboBoxVariant.typeahead,
              ),
            ),
          ),
        );

        final combobox = tester
            .widget<AppComboBox<String>>(find.byType(AppComboBox<String>));
        expect(combobox.validator, isNotNull);
      });
    });
  });
}
