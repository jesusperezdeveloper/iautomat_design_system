import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/pagination/app_pagination.dart';
import 'package:iautomat_design_system/src/components/pagination/pagination_config.dart';

void main() {
  group('AppPagination Golden Tests', () {
    testWidgets('page-based pagination default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 5,
                pageSize: 10,
                total: 100,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_page_based_default.png'),
      );
    });

    testWidgets('page-based pagination small size', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 3,
                pageSize: 10,
                total: 80,
                config: AppPaginationConfig.small,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_page_based_small.png'),
      );
    });

    testWidgets('page-based pagination large size', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 7,
                pageSize: 10,
                total: 200,
                config: AppPaginationConfig.large,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_page_based_large.png'),
      );
    });

    testWidgets('cursor-based pagination', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.cursor(
                hasNextPage: true,
                hasPreviousPage: true,
                nextCursor: 'next-token',
                previousCursor: 'prev-token',
                onCursorChanged: (cursor, isNext) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_cursor_based.png'),
      );
    });

    testWidgets('pagination with filled button style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 4,
                pageSize: 10,
                total: 120,
                config: const AppPaginationConfig(
                  buttonStyle: AppPageButtonStyle.filled,
                ),
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_filled_style.png'),
      );
    });

    testWidgets('pagination with text button style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 2,
                pageSize: 10,
                total: 50,
                config: const AppPaginationConfig(
                  buttonStyle: AppPageButtonStyle.text,
                ),
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_text_style.png'),
      );
    });

    testWidgets('pagination loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 3,
                pageSize: 10,
                total: 100,
                data: const AppPaginationData(
                  currentPage: 3,
                  pageSize: 10,
                  totalItems: 100,
                  totalPages: 10,
                  isLoading: true,
                ),
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_loading_state.png'),
      );
    });

    testWidgets('pagination first page state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 1,
                pageSize: 10,
                total: 100,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_first_page.png'),
      );
    });

    testWidgets('pagination last page state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 10,
                pageSize: 10,
                total: 100,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_last_page.png'),
      );
    });

    testWidgets('pagination with many pages and ellipsis', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 25,
                pageSize: 10,
                total: 1000, // 100 pages
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_many_pages.png'),
      );
    });

    testWidgets('pagination compact layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 3,
                pageSize: 10,
                total: 60,
                config: const AppPaginationConfig(
                  layout: AppPaginationLayout.compact,
                ),
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_compact_layout.png'),
      );
    });

    testWidgets('pagination with custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 4,
                pageSize: 10,
                total: 80,
                config: const AppPaginationConfig(
                  backgroundColor: Colors.blue,
                  selectedBackgroundColor: Colors.orange,
                  borderColor: Colors.purple,
                  textColor: Colors.white,
                  selectedTextColor: Colors.black,
                ),
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_custom_colors.png'),
      );
    });

    testWidgets('pagination minimal configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 2,
                pageSize: 10,
                total: 40,
                config: const AppPaginationConfig(
                  showFirstLast: false,
                  showPageInfo: false,
                  maxVisiblePages: 3,
                ),
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_minimal.png'),
      );
    });

    testWidgets('pagination empty state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 1,
                pageSize: 10,
                total: 0,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_empty_state.png'),
      );
    });

    testWidgets('pagination dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: AppPagination.pageBased(
                page: 5,
                pageSize: 10,
                total: 100,
                onPageChanged: (page) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppPagination),
        matchesGoldenFile('pagination_dark_theme.png'),
      );
    });
  });
}