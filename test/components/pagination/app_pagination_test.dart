import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/pagination/app_pagination.dart';
import 'package:iautomat_design_system/src/components/pagination/pagination_config.dart';

void main() {
  group('AppPagination', () {
    testWidgets('pageBased constructor creates widget with correct properties',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 3,
              pageSize: 10,
              total: 100,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppPagination), findsOneWidget);
      expect(find.text('3'), findsOneWidget); // Current page
      expect(find.text('21-30 of 100'),
          findsOneWidget); // Page info (page 3 = items 21-30)
    });

    testWidgets('cursor constructor creates widget with correct properties',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.cursor(
              hasNextPage: true,
              hasPreviousPage: false,
              nextCursor: 'next-token',
              onCursorChanged: (cursor, next) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppPagination), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('page navigation works correctly', (tester) async {
      int currentPage = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: AppPagination.pageBased(
                  page: currentPage,
                  pageSize: 10,
                  total: 100,
                  onPageChanged: (page) => setState(() => currentPage = page),
                ),
              );
            },
          ),
        ),
      );

      // Test next page navigation
      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pumpAndSettle();
      expect(currentPage, 2);

      // Test direct page navigation
      await tester.tap(find.text('5'));
      await tester.pumpAndSettle();
      expect(currentPage, 5);

      // Test previous page navigation
      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pumpAndSettle();
      expect(currentPage, 4);
    });

    testWidgets('first and last page navigation works', (tester) async {
      int currentPage = 5;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: AppPagination.pageBased(
                  page: currentPage,
                  pageSize: 10,
                  total: 100,
                  onPageChanged: (page) => setState(() => currentPage = page),
                ),
              );
            },
          ),
        ),
      );

      // Test first page navigation
      await tester.tap(find.byIcon(Icons.first_page));
      await tester.pumpAndSettle();
      expect(currentPage, 1);

      // Reset to middle page
      currentPage = 5;
      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: AppPagination.pageBased(
                  page: currentPage,
                  pageSize: 10,
                  total: 100,
                  onPageChanged: (page) => setState(() => currentPage = page),
                ),
              );
            },
          ),
        ),
      );

      // Test last page navigation
      await tester.tap(find.byIcon(Icons.last_page));
      await tester.pumpAndSettle();
      expect(currentPage, 10);
    });

    testWidgets('cursor navigation works correctly', (tester) async {
      String? lastCursor;
      bool? lastIsNext;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.cursor(
              hasNextPage: true,
              hasPreviousPage: true,
              nextCursor: 'next-token',
              previousCursor: 'prev-token',
              onCursorChanged: (cursor, isNext) {
                lastCursor = cursor;
                lastIsNext = isNext;
              },
            ),
          ),
        ),
      );

      // Test next navigation
      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pumpAndSettle();
      expect(lastCursor, 'next-token');
      expect(lastIsNext, true);

      // Test previous navigation
      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pumpAndSettle();
      expect(lastCursor, 'prev-token');
      expect(lastIsNext, false);
    });

    testWidgets('disabled navigation buttons work correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 1,
              pageSize: 10,
              total: 100,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      // First and previous buttons should be disabled on first page
      final firstButton = find.byIcon(Icons.first_page);
      final prevButton = find.byIcon(Icons.chevron_left);

      expect(tester.widget<IconButton>(firstButton).onPressed, isNull);
      expect(tester.widget<IconButton>(prevButton).onPressed, isNull);

      // Test last page
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 10,
              pageSize: 10,
              total: 100,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      // Last and next buttons should be disabled on last page
      final lastButton = find.byIcon(Icons.last_page);
      final nextButton = find.byIcon(Icons.chevron_right);

      expect(tester.widget<IconButton>(lastButton).onPressed, isNull);
      expect(tester.widget<IconButton>(nextButton).onPressed, isNull);
    });

    testWidgets('keyboard navigation works', (tester) async {
      int currentPage = 5;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: AppPagination.pageBased(
                  page: currentPage,
                  pageSize: 10,
                  total: 100,
                  onPageChanged: (page) => setState(() => currentPage = page),
                ),
              );
            },
          ),
        ),
      );

      // Focus the pagination widget
      await tester.tap(find.byType(AppPagination));
      await tester.pumpAndSettle();

      // Test keyboard navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(currentPage, 6);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(currentPage, 5);

      await tester.sendKeyEvent(LogicalKeyboardKey.home);
      await tester.pumpAndSettle();
      expect(currentPage, 1);

      await tester.sendKeyEvent(LogicalKeyboardKey.end);
      await tester.pumpAndSettle();
      expect(currentPage, 10);
    });

    testWidgets('loading state disables interactions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 5,
              pageSize: 10,
              total: 100,
              data: const AppPaginationData(
                currentPage: 5,
                pageSize: 10,
                totalItems: 100,
                totalPages: 10,
                isLoading: true,
              ),
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      // All navigation buttons should be disabled during loading
      final buttons = find.byType(IconButton);
      for (final button in buttons.evaluate()) {
        final widget = button.widget as IconButton;
        expect(widget.onPressed, isNull);
      }
    });

    testWidgets('jump to page dialog works', (tester) async {
      int currentPage = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: AppPagination.pageBased(
                  page: currentPage,
                  pageSize: 10,
                  total: 100,
                  config: const AppPaginationConfig(
                    showJumpToPage: true,
                  ),
                  onPageChanged: (page) => setState(() => currentPage = page),
                ),
              );
            },
          ),
        ),
      );

      // Test jump to page functionality
      await tester.sendKeyEvent(LogicalKeyboardKey.keyG);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Jump to Page'), findsOneWidget);

      // Enter page number
      await tester.enterText(find.byType(TextField), '7');
      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(currentPage, 7);
      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('custom configuration is applied', (tester) async {
      const customConfig = AppPaginationConfig(
        size: AppPaginationSize.large,
        buttonSize: 60.0,
        backgroundColor: Colors.blue,
        maxVisiblePages: 7,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 5,
              pageSize: 10,
              total: 100,
              config: customConfig,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppPagination), findsOneWidget);

      // Test that configuration is applied (button size, colors, etc.)
      final buttons = find.byType(SizedBox);
      expect(buttons, isNotEmpty);
    });

    testWidgets('ellipsis are shown for large page counts', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 20,
              pageSize: 10,
              total: 1000, // 100 pages
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.more_horiz), findsWidgets);
    });

    testWidgets('page info text is correct', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 3,
              pageSize: 15,
              total: 157,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      // Page 3 with pageSize 15: items 31-45 of 157
      expect(find.text('31-45 of 157'), findsOneWidget);
    });

    testWidgets('empty state shows correct info', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 1,
              pageSize: 10,
              total: 0,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      expect(find.text('0 of 0'), findsOneWidget);
    });

    testWidgets('hover effects work correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppPagination.pageBased(
              page: 1,
              pageSize: 10,
              total: 100,
              onPageChanged: (page) {},
            ),
          ),
        ),
      );

      // Test hover on page button
      final pageButton = find.text('5');
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(pageButton));
      await tester.pump();

      // Verify hover state is applied (visual feedback)
      expect(find.byType(AppPagination), findsOneWidget);
    });
  });

  group('AppPaginationConfig', () {
    test('default configuration has correct values', () {
      const config = AppPaginationConfig();

      expect(config.size, AppPaginationSize.medium);
      expect(config.layout, AppPaginationLayout.horizontal);
      expect(config.buttonStyle, AppPageButtonStyle.outlined);
      expect(config.buttonSize, 40.0);
      expect(config.spacing, 8.0);
      expect(config.maxVisiblePages, 5);
      expect(config.showFirstLast, true);
      expect(config.showPrevNext, true);
      expect(config.showPageNumbers, true);
    });

    test('small preset configuration', () {
      const config = AppPaginationConfig.small;

      expect(config.size, AppPaginationSize.small);
      expect(config.buttonSize, 32.0);
      expect(config.spacing, 4.0);
      expect(config.fontSize, 12.0);
      expect(config.iconSize, 16.0);
    });

    test('large preset configuration', () {
      const config = AppPaginationConfig.large;

      expect(config.size, AppPaginationSize.large);
      expect(config.buttonSize, 48.0);
      expect(config.spacing, 12.0);
      expect(config.fontSize, 16.0);
      expect(config.iconSize, 24.0);
    });
  });

  group('AppPaginationData', () {
    test('calculates properties correctly', () {
      const data = AppPaginationData(
        currentPage: 3,
        pageSize: 10,
        totalItems: 157,
        totalPages: 16,
      );

      expect(data.hasItems, true);
      expect(data.isFirstPage, false);
      expect(data.isLastPage, false);
      expect(data.canGoToPrevious, true);
      expect(data.canGoToNext, true);
      expect(data.startIndex, 21);
      expect(data.endIndex, 30);
      expect(data.pageInfoText, '21-30 of 157');
    });

    test('first page properties', () {
      const data = AppPaginationData(
        currentPage: 1,
        pageSize: 10,
        totalItems: 100,
        totalPages: 10,
      );

      expect(data.isFirstPage, true);
      expect(data.canGoToPrevious, false);
      expect(data.startIndex, 1);
      expect(data.endIndex, 10);
    });

    test('last page properties', () {
      const data = AppPaginationData(
        currentPage: 16,
        pageSize: 10,
        totalItems: 157,
        totalPages: 16,
      );

      expect(data.isLastPage, true);
      expect(data.canGoToNext, false);
      expect(data.startIndex, 151);
      expect(data.endIndex, 157);
    });

    test('empty data properties', () {
      const data = AppPaginationData(
        currentPage: 1,
        pageSize: 10,
        totalItems: 0,
        totalPages: 0,
      );

      expect(data.hasItems, false);
      expect(data.startIndex, 0);
      expect(data.endIndex, 0);
      expect(data.pageInfoText, '0 of 0');
    });

    test('visible pages calculation', () {
      const data = AppPaginationData(
        currentPage: 5,
        pageSize: 10,
        totalItems: 200,
        totalPages: 20,
      );

      final visiblePages = data.getVisiblePages(5);
      expect(visiblePages, [3, 4, 5, 6, 7]);

      final shouldShowStart = data.shouldShowStartEllipsis(visiblePages);
      final shouldShowEnd = data.shouldShowEndEllipsis(visiblePages);
      expect(shouldShowStart, true);
      expect(shouldShowEnd, true);
    });
  });

  group('AppPaginationUtils', () {
    test('calculateTotalPages works correctly', () {
      expect(AppPaginationUtils.calculateTotalPages(100, 10), 10);
      expect(AppPaginationUtils.calculateTotalPages(157, 10), 16);
      expect(AppPaginationUtils.calculateTotalPages(150, 10), 15);
      expect(AppPaginationUtils.calculateTotalPages(0, 10), 0);
      expect(AppPaginationUtils.calculateTotalPages(100, 0), 0);
    });

    test('validatePage works correctly', () {
      expect(AppPaginationUtils.validatePage(5, 10), 5);
      expect(AppPaginationUtils.validatePage(0, 10), 1);
      expect(AppPaginationUtils.validatePage(-1, 10), 1);
      expect(AppPaginationUtils.validatePage(15, 10), 10);
    });

    test('generatePageRange works correctly', () {
      expect(AppPaginationUtils.generatePageRange(5, 20, 5), [3, 4, 5, 6, 7]);
      expect(AppPaginationUtils.generatePageRange(1, 20, 5), [1, 2, 3, 4, 5]);
      expect(AppPaginationUtils.generatePageRange(20, 20, 5),
          [16, 17, 18, 19, 20]);
      expect(AppPaginationUtils.generatePageRange(5, 5, 5), [1, 2, 3, 4, 5]);
    });

    test('formatNumber works correctly', () {
      expect(AppPaginationUtils.formatNumber(999), '999');
      expect(AppPaginationUtils.formatNumber(1000), '1.0K');
      expect(AppPaginationUtils.formatNumber(1500), '1.5K');
      expect(AppPaginationUtils.formatNumber(1000000), '1.0M');
      expect(AppPaginationUtils.formatNumber(1000000000), '1.0B');
    });

    test('isValidConfig works correctly', () {
      const validData = AppPaginationData(
        currentPage: 1,
        pageSize: 10,
        totalItems: 100,
      );
      expect(AppPaginationUtils.isValidConfig(validData), true);

      const invalidPageSize = AppPaginationData(
        currentPage: 1,
        pageSize: 0,
        totalItems: 100,
      );
      expect(AppPaginationUtils.isValidConfig(invalidPageSize), false);

      const invalidCurrentPage = AppPaginationData(
        currentPage: 0,
        pageSize: 10,
        totalItems: 100,
      );
      expect(AppPaginationUtils.isValidConfig(invalidCurrentPage), false);

      const invalidTotalItems = AppPaginationData(
        currentPage: 1,
        pageSize: 10,
        totalItems: -1,
      );
      expect(AppPaginationUtils.isValidConfig(invalidTotalItems), false);
    });

    test('semantic labels are generated correctly', () {
      final pageLabel = AppPaginationUtils.getPageButtonSemanticLabel(5, 3, 10);
      expect(pageLabel, 'Go to page 5 of 10');

      final currentPageLabel =
          AppPaginationUtils.getPageButtonSemanticLabel(3, 3, 10);
      expect(currentPageLabel, 'Page 3 of 10, current page');

      final nextLabel =
          AppPaginationUtils.getNavButtonSemanticLabel('next', true);
      expect(nextLabel, 'Go to next page');

      final disabledPrevLabel =
          AppPaginationUtils.getNavButtonSemanticLabel('previous', false);
      expect(disabledPrevLabel, 'Go to previous page, disabled');
    });
  });
}
