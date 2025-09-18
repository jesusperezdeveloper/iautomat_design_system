import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppInPageSearch Golden Tests', () {
    Widget buildTestWidget(Widget child) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: Container(
            width: 800,
            height: 600,
            color: Colors.grey[100],
            child: Center(child: child),
          ),
        ),
      );
    }

    group('Basic Variants', () {
      testWidgets('inline variant default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/inline_default.png'),
        );
      });

      testWidgets('inline variant with query', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              initialQuery: 'search term',
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/inline_with_query.png'),
        );
      });
    });

    group('States', () {
      testWidgets('disabled state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              state: AppInPageSearchState.disabled,
              initialQuery: 'disabled',
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/disabled_state.png'),
        );
      });

      testWidgets('loading state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              state: AppInPageSearchState.loading,
              initialQuery: 'loading...',
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/loading_state.png'),
        );
      });

      testWidgets('skeleton state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              state: AppInPageSearchState.skeleton,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/skeleton_state.png'),
        );
      });
    });

    group('Sizes', () {
      testWidgets('small size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              config: AppInPageSearchConfig.small,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/small_size.png'),
        );
      });

      testWidgets('medium size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              config: AppInPageSearchConfig.medium,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/medium_size.png'),
        );
      });

      testWidgets('large size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              config: AppInPageSearchConfig.large,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/large_size.png'),
        );
      });
    });

    group('Custom Styling', () {
      testWidgets('dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Container(
                width: 800,
                height: 600,
                color: Colors.grey[900],
                child: Center(
                  child: AppInPageSearch.inline(),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/dark_theme.png'),
        );
      });

      testWidgets('custom colors', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              config: const AppInPageSearchConfig(
                backgroundColor: Color(0xFFF3E5F5),
                borderColor: Color(0xFF9C27B0),
                borderRadius: 25.0,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/custom_colors.png'),
        );
      });
    });

    group('With Search Results', () {
      testWidgets('search with results', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppInPageSearch.inline(
              data: const AppInPageSearchData(
                query: 'search',
                totalResults: 5,
                currentResultIndex: 2,
              ),
              config: const AppInPageSearchConfig(
                showResultCount: true,
                showNavigationButtons: true,
                showClearButton: true,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/with_results.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('RTL layout', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Container(
                  width: 800,
                  height: 600,
                  color: Colors.grey[100],
                  child: Center(
                    child: AppInPageSearch.inline(
                      config: const AppInPageSearchConfig(
                        placeholder: 'بحث في المحتوى...',
                        textDirection: TextDirection.rtl,
                      ),
                      initialQuery: 'نص تجريبي',
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppInPageSearch),
          matchesGoldenFile('golden/app_in_page_search/rtl_layout.png'),
        );
      });
    });
  });
}
