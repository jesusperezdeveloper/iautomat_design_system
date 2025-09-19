import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/select/ds_select.dart';
import 'package:iautomat_design_system/src/components/select/select_config.dart';

void main() {
  group('DSSelect Golden Tests', () {
    final testItems = [
      DSSelectItem(value: 'item1', label: 'Item 1'),
      DSSelectItem(value: 'item2', label: 'Item 2'),
      DSSelectItem(value: 'item3', label: 'Item 3'),
    ];

    final itemsWithSubtitles = [
      DSSelectItem(
        value: 'es',
        label: 'España',
        subtitle: 'Europa',
        leading: Icon(Icons.flag, color: Colors.red),
      ),
      DSSelectItem(
        value: 'us',
        label: 'Estados Unidos',
        subtitle: 'América del Norte',
        leading: Icon(Icons.flag, color: Colors.blue),
      ),
    ];

    group('Single Select', () {
      testWidgets('renders single select default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Select an option',
                label: 'Default Single Select',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_single_default.png'),
        );
      });

      testWidgets('renders single select selected state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                value: 'item2',
                placeholder: 'Select an option',
                label: 'Single Select Selected',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_single_selected.png'),
        );
      });

      testWidgets('renders single select disabled state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Disabled select',
                label: 'Disabled Single Select',
                enabled: false,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_single_disabled.png'),
        );
      });

      testWidgets('renders single select error state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Error state',
                label: 'Error Single Select',
                errorText: 'This field is required',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_single_error.png'),
        );
      });

      testWidgets('renders single select with icons', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Select with icons',
                label: 'With Icons',
                helperText: 'Choose your preferred option',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.star),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_single_with_icons.png'),
        );
      });

      testWidgets('renders single select with complex items', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: itemsWithSubtitles,
                placeholder: 'Select country',
                label: 'Countries',
                helperText: 'Items with subtitles and leading icons',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_single_complex_items.png'),
        );
      });
    });

    group('Multi Select', () {
      testWidgets('renders multi select default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildMultiSelect(
                items: testItems,
                values: [],
                placeholder: 'Select multiple options',
                label: 'Default Multi Select',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_multi_default.png'),
        );
      });

      testWidgets('renders multi select with selected items', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildMultiSelect(
                items: testItems,
                values: ['item1', 'item3'],
                placeholder: 'Select multiple options',
                label: 'Multi Select Selected',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_multi_selected.png'),
        );
      });

      testWidgets('renders multi select disabled state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildMultiSelect(
                items: testItems,
                values: [],
                placeholder: 'Disabled multi select',
                label: 'Disabled Multi Select',
                enabled: false,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_multi_disabled.png'),
        );
      });
    });

    group('Searchable Select', () {
      testWidgets('renders searchable select default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSearchableSelect(
                items: testItems,
                placeholder: 'Search and select',
                label: 'Searchable Select',
                searchHint: 'Type to search...',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_searchable_default.png'),
        );
      });

      testWidgets('renders searchable select selected state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSearchableSelect(
                items: testItems,
                value: 'item2',
                placeholder: 'Search and select',
                label: 'Searchable Selected',
                searchHint: 'Type to search...',
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_searchable_selected.png'),
        );
      });
    });

    group('Special States', () {
      testWidgets('renders loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Loading...',
                label: 'Loading State',
                overrideState: DSSelectState.loading,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_loading.png'),
        );
      });

      testWidgets('renders skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Skeleton loading...',
                label: 'Skeleton State',
                overrideState: DSSelectState.skeleton,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_skeleton.png'),
        );
      });
    });

    group('Custom Configuration', () {
      testWidgets('renders with custom configuration', (tester) async {
        const customConfig = DSSelectConfig(
          borderRadius: 16,
          minimumHeight: 60,
          borderWidth: 3,
          contentPadding: EdgeInsets.all(20),
          enableFloatingLabel: false,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Custom config',
                label: 'Custom Configuration',
                config: customConfig,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_custom_config.png'),
        );
      });

      testWidgets('renders dense variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: testItems,
                placeholder: 'Dense select',
                label: 'Dense Mode',
                dense: true,
                width: 200,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_dense.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('renders correctly in RTL direction', (tester) async {
        final rtlItems = [
          DSSelectItem(value: 'ar', label: 'العربية'),
          DSSelectItem(value: 'he', label: 'עברית'),
          DSSelectItem(value: 'fa', label: 'فارسی'),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _buildSingleSelect(
                items: rtlItems,
                placeholder: 'اختر لغة',
                label: 'اللغة',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/app_select_rtl.png'),
        );
      });
    });
  });
}

Widget _buildSingleSelect({
  required List<DSSelectItem<String>> items,
  String? value,
  String? placeholder,
  String? label,
  String? helperText,
  String? errorText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool enabled = true,
  bool dense = false,
  double? width,
  DSSelectConfig? config,
  DSSelectState? overrideState,
  TextDirection? textDirection,
}) {
  return Container(
    width: 400,
    height: 200,
    padding: const EdgeInsets.all(24),
    child: Directionality(
      textDirection: textDirection ?? TextDirection.ltr,
      child: DSSelect<String>(
        items: items,
        value: value,
        onChanged: (value) {},
        placeholder: placeholder,
        label: label,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: enabled,
        dense: dense,
        width: width,
        config: config,
        overrideState: overrideState,
        variant: DSSelectVariant.single,
      ),
    ),
  );
}

Widget _buildMultiSelect({
  required List<DSSelectItem<String>> items,
  required List<String> values,
  String? placeholder,
  String? label,
  String? helperText,
  String? errorText,
  bool enabled = true,
  DSSelectConfig? config,
}) {
  return Container(
    width: 400,
    height: 200,
    padding: const EdgeInsets.all(24),
    child: DSSelect<String>(
      items: items,
      values: values,
      onMultiChanged: (values) {},
      placeholder: placeholder,
      label: label,
      helperText: helperText,
      errorText: errorText,
      enabled: enabled,
      config: config,
      variant: DSSelectVariant.multi,
    ),
  );
}

Widget _buildSearchableSelect({
  required List<DSSelectItem<String>> items,
  String? value,
  String? placeholder,
  String? label,
  String? searchHint,
  bool enabled = true,
}) {
  return Container(
    width: 400,
    height: 200,
    padding: const EdgeInsets.all(24),
    child: DSSelect<String>(
      items: items,
      value: value,
      onChanged: (value) {},
      placeholder: placeholder,
      label: label,
      searchHint: searchHint,
      enabled: enabled,
      variant: DSSelectVariant.searchable,
    ),
  );
}
