import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/combobox/app_combobox.dart';
import 'package:iautomat_design_system/src/components/combobox/combobox_config.dart';

void main() {
  group('AppComboBox Golden Tests', () {
    final testSuggestions = [
      const AppComboBoxSuggestion<String>(
        value: 'option1',
        label: 'Option 1',
      ),
      const AppComboBoxSuggestion<String>(
        value: 'option2',
        label: 'Option 2',
        subtitle: 'With subtitle',
      ),
      const AppComboBoxSuggestion<String>(
        value: 'option3',
        label: 'Option 3',
        leading: Icon(Icons.star),
      ),
    ];

    Widget buildComboBox({
      AppComboBoxState? overrideState,
      String? query,
      bool enabled = true,
      String? errorText,
      AppComboBoxConfig? config,
      Widget? loadingWidget,
    }) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              child: AppComboBox<String>(
                query: query ?? '',
                onQueryChanged: (_) {},
                suggestions: testSuggestions,
                onSelected: enabled ? (_) {} : null,
                placeholder: 'Select an option',
                label: 'Test ComboBox',
                helperText: 'Choose from available options',
                errorText: errorText,
                enabled: enabled,
                variant: AppComboBoxVariant.typeahead,
                config: config,
                overrideState: overrideState,
                loadingWidget: loadingWidget,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('default state', (tester) async {
      await tester.pumpWidget(buildComboBox());
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_default.png'),
      );
    });

    testWidgets('with query text', (tester) async {
      await tester.pumpWidget(buildComboBox(query: 'Option'));
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_with_query.png'),
      );
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWidget(buildComboBox(enabled: false));
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_disabled.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(buildComboBox(
        overrideState: AppComboBoxState.skeleton,
      ));
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_skeleton.png'),
      );
    });

    testWidgets('error state', (tester) async {
      await tester.pumpWidget(buildComboBox(
        errorText: 'This field is required',
      ));
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_error.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(buildComboBox(
        overrideState: AppComboBoxState.loading,
      ));
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_loading.png'),
      );
    });

    testWidgets('focused state', (tester) async {
      await tester.pumpWidget(buildComboBox());

      // Focus the input field
      await tester.tap(find.byType(TextField));
      await tester.pump();

      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_focused.png'),
      );
    });

    testWidgets('with suggestions overlay', (tester) async {
      await tester.pumpWidget(buildComboBox(query: 'Opt'));

      // Focus and trigger suggestions
      await tester.tap(find.byType(TextField));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300)); // Wait for debounce

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('combobox_with_suggestions.png'),
      );
    });

    testWidgets('custom configuration', (tester) async {
      const customConfig = AppComboBoxConfig(
        borderRadius: 16.0,
        borderWidth: 3.0,
        contentPadding: EdgeInsets.all(20.0),
        minimumHeight: 60.0,
      );

      await tester.pumpWidget(buildComboBox(config: customConfig));
      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_custom_config.png'),
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
                child: AppComboBox<String>(
                  query: '',
                  onQueryChanged: (_) {},
                  suggestions: testSuggestions,
                  onSelected: (_) {},
                  placeholder: 'Select an option',
                  label: 'Test ComboBox',
                  helperText: 'Choose from available options',
                  variant: AppComboBoxVariant.typeahead,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_dark_theme.png'),
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
                  child: AppComboBox<String>(
                    query: 'اختيار',
                    onQueryChanged: (_) {},
                    suggestions: const [
                      AppComboBoxSuggestion<String>(
                        value: 'option1',
                        label: 'الخيار الأول',
                      ),
                      AppComboBoxSuggestion<String>(
                        value: 'option2',
                        label: 'الخيار الثاني',
                      ),
                    ],
                    onSelected: (_) {},
                    placeholder: 'اختر خيارًا',
                    label: 'صندوق الاختيار',
                    helperText: 'اختر من الخيارات المتاحة',
                    variant: AppComboBoxVariant.typeahead,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppComboBox<String>),
        matchesGoldenFile('combobox_rtl.png'),
      );
    });
  });
}