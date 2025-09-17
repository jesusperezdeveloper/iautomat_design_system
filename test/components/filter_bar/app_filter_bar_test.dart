import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/filter_bar/app_filter_bar.dart';
import 'package:iautomat_design_system/src/components/filter_bar/filter_bar_config.dart';

void main() {
  group('AppFilterBar', () {
    late List<AppFilter> testFilters;

    setUp(() {
      testFilters = [
        AppFilter(
          id: 'status',
          label: 'Status',
          type: FilterType.single,
          options: const [
            AppFilterOption(value: 'active', label: 'Active'),
            AppFilterOption(value: 'inactive', label: 'Inactive'),
          ],
        ),
        AppFilter(
          id: 'category',
          label: 'Category',
          type: FilterType.multiple,
          options: const [
            AppFilterOption(value: 'a', label: 'Category A'),
            AppFilterOption(value: 'b', label: 'Category B'),
            AppFilterOption(value: 'c', label: 'Category C'),
          ],
        ),
        const AppFilter(
          id: 'search',
          label: 'Search',
          type: FilterType.text,
        ),
      ];
    });

    testWidgets('chips variant creates widget with correct filters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: testFilters,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppFilterBar), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
      expect(find.text('Category'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('popovers variant creates widget with correct filters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.popovers(
              filters: testFilters,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppFilterBar), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
      expect(find.text('Category'), findsOneWidget);
    });

    testWidgets('filter chip shows active state when has value', (tester) async {
      final filtersWithValue = [
        testFilters[0].copyWith(value: 'active', isActive: true),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: filtersWithValue,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      // Should show badge with count
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('onChanged callback is triggered', (tester) async {
      List<AppFilter>? changedFilters;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: testFilters,
              onChanged: (filters) => changedFilters = filters,
            ),
          ),
        ),
      );

      // Tap on boolean filter should trigger change immediately
      final booleanFilter = const AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.boolean,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: [booleanFilter],
              onChanged: (filters) => changedFilters = filters,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      expect(changedFilters, isNotNull);
    });

    testWidgets('clear all button appears when filters are active', (tester) async {
      final activeFilters = [
        testFilters[0].copyWith(value: 'active', isActive: true),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: activeFilters,
              config: const AppFilterBarConfig(
                enableClearAll: true,
              ),
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.text('Clear all'), findsOneWidget);
    });

    testWidgets('loading state shows loading indicator', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: const [],
              state: AppFilterBarState.loading,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading filters...'), findsOneWidget);
    });

    testWidgets('skeleton state shows skeleton animation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: const [],
              state: AppFilterBarState.skeleton,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBuilder), findsWidgets);
    });

    testWidgets('disabled state prevents interaction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: testFilters,
              state: AppFilterBarState.disabled,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      // Try to tap a filter
      await tester.tap(find.text('Status'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Nothing should happen (no popover should appear)
      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('custom config is applied correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: testFilters,
              config: const AppFilterBarConfig(
                chipHeight: 40.0,
                fontSize: 18.0,
                showFilterIcon: false,
                showDropdownIcon: false,
              ),
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppFilterBar), findsOneWidget);
    });

    testWidgets('max visible chips works correctly', (tester) async {
      final manyFilters = List.generate(
        10,
        (i) => AppFilter(id: 'filter$i', label: 'Filter $i'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: manyFilters,
              config: const AppFilterBarConfig(
                maxVisibleChips: 3,
              ),
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      // Should show 3 filters plus a "more" chip
      expect(find.text('Filter 0'), findsOneWidget);
      expect(find.text('Filter 1'), findsOneWidget);
      expect(find.text('Filter 2'), findsOneWidget);
      expect(find.textContaining('more'), findsOneWidget);
    });

    testWidgets('summary builder works correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: [
                testFilters[0].copyWith(value: 'active', isActive: true),
              ],
              summaryBuilder: (context, activeFilters, total) {
                return Text('Custom Summary: ${activeFilters.length}');
              },
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.text('Custom Summary: 1'), findsOneWidget);
    });

    testWidgets('keyboard navigation works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: testFilters,
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      // Focus the filter bar
      await tester.tap(find.byType(AppFilterBar));
      await tester.pumpAndSettle();

      // Test Tab navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      // Test Escape to clear all
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
    });

    testWidgets('RTL support works correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppFilterBar.chips(
                filters: testFilters,
                config: const AppFilterBarConfig(
                  enableRTL: true,
                  textDirection: TextDirection.rtl,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppFilterBar), findsOneWidget);
    });

    testWidgets('filter groups work correctly', (tester) async {
      final groupedFilters = [
        AppFilter(
          id: 'filter1',
          label: 'Filter 1',
          group: 'group1',
        ),
        AppFilter(
          id: 'filter2',
          label: 'Filter 2',
          group: 'group1',
        ),
        AppFilter(
          id: 'filter3',
          label: 'Filter 3',
          group: 'group2',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFilterBar.chips(
              filters: groupedFilters,
              groups: const [
                AppFilterGroup(id: 'group1', label: 'Group 1'),
                AppFilterGroup(id: 'group2', label: 'Group 2'),
              ],
              onChanged: (filters) {},
            ),
          ),
        ),
      );

      expect(find.text('Filter 1'), findsOneWidget);
      expect(find.text('Filter 2'), findsOneWidget);
      expect(find.text('Filter 3'), findsOneWidget);
    });
  });

  group('AppFilter', () {
    test('hasValue returns correct value', () {
      var filter = const AppFilter(id: 'test', label: 'Test');
      expect(filter.hasValue, false);

      filter = filter.copyWith(value: 'test');
      expect(filter.hasValue, true);

      filter = filter.copyWith(value: []);
      expect(filter.hasValue, false);

      filter = filter.copyWith(value: ['item']);
      expect(filter.hasValue, true);
    });

    test('displayValue formats correctly for different types', () {
      // Single selection
      var filter = AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.single,
        value: const AppFilterOption(value: 'val', label: 'Value'),
      );
      expect(filter.displayValue, 'Value');

      // Multiple selection
      filter = AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.multiple,
        value: const [
          AppFilterOption(value: 'a', label: 'A'),
          AppFilterOption(value: 'b', label: 'B'),
        ],
      );
      expect(filter.displayValue, 'A, B');

      // Range
      filter = const AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.range,
        value: [10, 20],
      );
      expect(filter.displayValue, '10 - 20');

      // Boolean
      filter = const AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.boolean,
        value: true,
      );
      expect(filter.displayValue, 'Yes');
    });

    test('selectedCount returns correct count', () {
      var filter = const AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.single,
        value: 'value',
      );
      expect(filter.selectedCount, 1);

      filter = const AppFilter(
        id: 'test',
        label: 'Test',
        type: FilterType.multiple,
        value: ['a', 'b', 'c'],
      );
      expect(filter.selectedCount, 3);
    });

    test('clear removes value', () {
      var filter = const AppFilter(
        id: 'test',
        label: 'Test',
        value: 'value',
        isActive: true,
      );

      filter = filter.clear();
      expect(filter.value, null);
      expect(filter.isActive, false);
    });

    test('apply sets value', () {
      var filter = const AppFilter(
        id: 'test',
        label: 'Test',
      );

      filter = filter.apply('new value');
      expect(filter.value, 'new value');
      expect(filter.isActive, true);
    });
  });

  group('AppFilterBarUtils', () {
    test('getActiveFilters returns only active filters', () {
      final filters = [
        const AppFilter(id: '1', label: 'F1', value: 'val', isActive: true),
        const AppFilter(id: '2', label: 'F2'),
        const AppFilter(id: '3', label: 'F3', value: 'val', isActive: true),
      ];

      final active = AppFilterBarUtils.getActiveFilters(filters);
      expect(active.length, 2);
      expect(active[0].id, '1');
      expect(active[1].id, '3');
    });

    test('getFilterSummary returns correct summary', () {
      final filters = [
        const AppFilter(id: '1', label: 'F1', value: 'val', isActive: true),
        const AppFilter(id: '2', label: 'F2'),
      ];

      var summary = AppFilterBarUtils.getFilterSummary(filters);
      expect(summary, '1 filter');

      filters.add(const AppFilter(id: '3', label: 'F3', value: 'val', isActive: true));
      summary = AppFilterBarUtils.getFilterSummary(filters);
      expect(summary, '2 filters');
    });

    test('clearAllFilters clears all filter values', () {
      final filters = [
        const AppFilter(id: '1', label: 'F1', value: 'val', isActive: true),
        const AppFilter(id: '2', label: 'F2', value: 'val', isActive: true),
      ];

      final cleared = AppFilterBarUtils.clearAllFilters(filters);
      expect(cleared.every((f) => !f.hasValue), true);
      expect(cleared.every((f) => !f.isActive), true);
    });

    test('applyFilter updates specific filter', () {
      final filters = [
        const AppFilter(id: '1', label: 'F1'),
        const AppFilter(id: '2', label: 'F2'),
      ];

      final updated = AppFilterBarUtils.applyFilter(filters, '1', 'new value');
      expect(updated[0].value, 'new value');
      expect(updated[0].isActive, true);
      expect(updated[1].value, null);
    });

    test('groupFilters groups by group ID', () {
      final filters = [
        const AppFilter(id: '1', label: 'F1', group: 'A'),
        const AppFilter(id: '2', label: 'F2', group: 'A'),
        const AppFilter(id: '3', label: 'F3', group: 'B'),
        const AppFilter(id: '4', label: 'F4'),
      ];

      final grouped = AppFilterBarUtils.groupFilters(filters);
      expect(grouped.length, 3);
      expect(grouped['A']!.length, 2);
      expect(grouped['B']!.length, 1);
      expect(grouped[null]!.length, 1);
    });

    test('validateFilters returns validation errors', () {
      final filters = [
        const AppFilter(
          id: '1',
          label: 'Required Filter',
          isRequired: true,
        ),
        AppFilter(
          id: '2',
          label: 'Validated Filter',
          value: 'test',
          validator: (value) => value == 'test' ? 'Invalid' : null,
        ),
      ];

      final errors = AppFilterBarUtils.validateFilters(filters);
      expect(errors.length, 2);
      expect(errors['1'], 'Required Filter is required');
      expect(errors['2'], 'Invalid');
    });

    test('generateSummaryText creates summary string', () {
      final filters = [
        const AppFilter(id: '1', label: 'Status', value: 'Active', isActive: true),
        const AppFilter(id: '2', label: 'Category', value: 'Electronics', isActive: true),
      ];

      final summary = AppFilterBarUtils.generateSummaryText(filters);
      expect(summary, 'Status: Active • Category: Electronics');

      // Test truncation
      final longSummary = AppFilterBarUtils.generateSummaryText(
        filters,
        maxLength: 20,
      );
      expect(longSummary.endsWith('...'), true);
      expect(longSummary.length, 20);
    });
  });
}