import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/filter_bar/app_filter_bar.dart';
import 'package:iautomat_design_system/src/components/filter_bar/filter_bar_config.dart';

void main() {
  group('AppFilterBar Golden Tests', () {
    late List<AppFilter> basicFilters;
    late List<AppFilter> activeFilters;

    setUp(() {
      basicFilters = [
        AppFilter(
          id: 'status',
          label: 'Status',
          type: FilterType.single,
          icon: Icons.info,
          options: const [
            AppFilterOption(value: 'active', label: 'Active'),
            AppFilterOption(value: 'inactive', label: 'Inactive'),
          ],
        ),
        AppFilter(
          id: 'category',
          label: 'Category',
          type: FilterType.multiple,
          icon: Icons.category,
          options: const [
            AppFilterOption(value: 'electronics', label: 'Electronics'),
            AppFilterOption(value: 'clothing', label: 'Clothing'),
          ],
        ),
        const AppFilter(
          id: 'featured',
          label: 'Featured',
          type: FilterType.boolean,
          icon: Icons.star,
        ),
      ];

      activeFilters = [
        AppFilter(
          id: 'status',
          label: 'Status',
          type: FilterType.single,
          icon: Icons.info,
          value: 'active',
          isActive: true,
          options: const [
            AppFilterOption(value: 'active', label: 'Active'),
            AppFilterOption(value: 'inactive', label: 'Inactive'),
          ],
        ),
        AppFilter(
          id: 'category',
          label: 'Category',
          type: FilterType.multiple,
          icon: Icons.category,
          value: const ['electronics', 'clothing'],
          isActive: true,
          options: const [
            AppFilterOption(value: 'electronics', label: 'Electronics'),
            AppFilterOption(value: 'clothing', label: 'Clothing'),
          ],
        ),
      ];
    });

    testWidgets('chips variant default state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: basicFilters,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_chips_default.png'),
      );
    });

    testWidgets('popovers variant default state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.popovers(
                filters: basicFilters,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_popovers_default.png'),
      );
    });

    testWidgets('chips with active filters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_chips_active.png'),
      );
    });

    testWidgets('small size configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: basicFilters,
                config: AppFilterBarConfig.small,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_small_size.png'),
      );
    });

    testWidgets('large size configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: basicFilters,
                config: AppFilterBarConfig.large,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_large_size.png'),
      );
    });

    testWidgets('filled chip style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                config: const AppFilterBarConfig(
                  chipStyle: AppFilterChipStyle.filled,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_filled_style.png'),
      );
    });

    testWidgets('elevated chip style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                config: const AppFilterBarConfig(
                  chipStyle: AppFilterChipStyle.elevated,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_elevated_style.png'),
      );
    });

    testWidgets('custom colors configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                config: const AppFilterBarConfig(
                  backgroundColor: Colors.blue,
                  selectedBackgroundColor: Colors.orange,
                  borderColor: Colors.purple,
                  selectedBorderColor: Colors.red,
                  textColor: Colors.white,
                  selectedTextColor: Colors.black,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_custom_colors.png'),
      );
    });

    testWidgets('with clear all button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                config: const AppFilterBarConfig(
                  enableClearAll: true,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_with_clear_all.png'),
      );
    });

    testWidgets('with summary', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                config: const AppFilterBarConfig(
                  showSummary: true,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_with_summary.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: const [],
                state: AppFilterBarState.loading,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_loading_state.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: const [],
                state: AppFilterBarState.skeleton,
                config: const AppFilterBarConfig(
                  skeletonFilterCount: 4,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_skeleton_state.png'),
      );
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: basicFilters.map((f) => f.copyWith(isDisabled: true)).toList(),
                state: AppFilterBarState.disabled,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_disabled_state.png'),
      );
    });

    testWidgets('max visible chips with more button', (tester) async {
      final manyFilters = List.generate(
        8,
        (i) => AppFilter(id: 'filter$i', label: 'Filter $i'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: manyFilters,
                config: const AppFilterBarConfig(
                  maxVisibleChips: 3,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_max_visible_chips.png'),
      );
    });

    testWidgets('vertical layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: basicFilters,
                config: const AppFilterBarConfig(
                  layout: AppFilterBarLayout.vertical,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_vertical_layout.png'),
      );
    });

    testWidgets('wrap layout', (tester) async {
      final manyFilters = List.generate(
        10,
        (i) => AppFilter(id: 'filter$i', label: 'Filter $i'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: AppFilterBar.chips(
                filters: manyFilters,
                config: const AppFilterBarConfig(
                  layout: AppFilterBarLayout.wrap,
                ),
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_wrap_layout.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_dark_theme.png'),
      );
    });

    testWidgets('RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Center(
                child: AppFilterBar.chips(
                  filters: activeFilters,
                  config: const AppFilterBarConfig(
                    enableRTL: true,
                    textDirection: TextDirection.rtl,
                  ),
                  onChanged: (filters) {},
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_rtl_layout.png'),
      );
    });

    testWidgets('custom summary builder', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppFilterBar.chips(
                filters: activeFilters,
                summaryBuilder: (context, activeFilters, total) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Custom: ${activeFilters.length}/$total active',
                      style: TextStyle(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                onChanged: (filters) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppFilterBar),
        matchesGoldenFile('filter_bar_custom_summary.png'),
      );
    });
  });
}