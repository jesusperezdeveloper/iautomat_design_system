import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppInPageSearch Widget Tests', () {
    testWidgets('renders inline search correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(),
          ),
        ),
      );

      expect(find.byType(AppInPageSearch), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('accepts custom controller', (tester) async {
      final controller = TextEditingController(text: 'test query');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              controller: controller,
            ),
          ),
        ),
      );

      expect(find.text('test query'), findsOneWidget);
    });

    testWidgets('calls onFind when search is performed', (tester) async {
      String? capturedQuery;
      List<AppSearchHighlight>? capturedHighlights;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              onFind: (query, highlights) {
                capturedQuery = query;
                capturedHighlights = highlights;
              },
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.enterText(textField, 'search term');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(capturedQuery, equals('search term'));
      expect(capturedHighlights, isNotNull);
    });

    testWidgets('shows search results count', (tester) async {
      const searchData = AppInPageSearchData(
        totalResults: 5,
        currentResultIndex: 2,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              data: searchData,
              config: const AppInPageSearchConfig(
                showResultCount: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('2 / 5'), findsOneWidget);
    });

    testWidgets('shows navigation buttons when enabled', (tester) async {
      const searchData = AppInPageSearchData(
        totalResults: 3,
        currentResultIndex: 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              data: searchData,
              config: const AppInPageSearchConfig(
                showNavigationButtons: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_up), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('hides widget when isVisible is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              isVisible: false,
            ),
          ),
        ),
      );

      expect(find.byType(AppInPageSearch), findsOneWidget);
      expect(find.byType(TextField), findsNothing);
    });

    testWidgets('applies custom configuration', (tester) async {
      const config = AppInPageSearchConfig(
        placeholder: 'Custom placeholder',
        width: 400.0,
        height: 50.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              config: config,
            ),
          ),
        ),
      );

      expect(find.text('Custom placeholder'), findsOneWidget);

      // Verify container exists with custom configuration
      final containerFinder = find.ancestor(
        of: find.byType(TextField),
        matching: find.byType(Container),
      );
      expect(containerFinder, findsWidgets);
    });
  });

  group('AppInPageSearch State Tests', () {
    testWidgets('disabled state prevents interaction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              state: AppInPageSearchState.disabled,
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      final textFieldWidget = tester.widget<TextField>(textField);
      expect(textFieldWidget.enabled, isFalse);
    });

    testWidgets('skeleton state shows loading animation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              state: AppInPageSearchState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsNothing);
      expect(find.byType(AnimatedBuilder), findsWidgets);
    });

    testWidgets('loading state is handled correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              state: AppInPageSearchState.loading,
            ),
          ),
        ),
      );

      expect(find.byType(AppInPageSearch), findsOneWidget);
    });
  });

  group('AppInPageSearchController Tests', () {
    late AppInPageSearchController controller;

    setUp(() {
      controller = AppInPageSearchController();
    });

    tearDown(() {
      controller.dispose();
    });

    test('initializes with empty data', () {
      expect(controller.query, isEmpty);
      expect(controller.highlights, isEmpty);
      expect(controller.isSearching, isFalse);
    });

    test('updates search data correctly', () {
      const newData = AppInPageSearchData(
        query: 'test',
        totalResults: 5,
      );

      controller.updateData(newData);

      expect(controller.data, equals(newData));
    });

    test('performs search and updates state', () {
      controller.search('test query');

      expect(controller.query, equals('test query'));
      expect(controller.isSearching, isTrue);
    });

    test('updates results correctly', () {
      const highlights = [
        AppSearchHighlight(start: 0, end: 4, text: 'test'),
        AppSearchHighlight(start: 10, end: 14, text: 'test'),
      ];

      controller.updateResults(highlights);

      expect(controller.highlights, equals(highlights));
      expect(controller.data.totalResults, equals(2));
      expect(controller.data.currentResultIndex, equals(1));
      expect(controller.isSearching, isFalse);
    });

    test('navigates to next result', () {
      const highlights = [
        AppSearchHighlight(start: 0, end: 4, text: 'test'),
        AppSearchHighlight(start: 10, end: 14, text: 'test'),
        AppSearchHighlight(start: 20, end: 24, text: 'test'),
      ];

      controller.updateResults(highlights);
      controller.nextResult();

      expect(controller.data.activeHighlightIndex, equals(1));
      expect(controller.data.currentResultIndex, equals(2));
    });

    test('navigates to previous result', () {
      const highlights = [
        AppSearchHighlight(start: 0, end: 4, text: 'test'),
        AppSearchHighlight(start: 10, end: 14, text: 'test'),
        AppSearchHighlight(start: 20, end: 24, text: 'test'),
      ];

      controller.updateResults(highlights);
      controller.nextResult(); // Move to second
      controller.previousResult(); // Move back to first

      expect(controller.data.activeHighlightIndex, equals(0));
      expect(controller.data.currentResultIndex, equals(1));
    });

    test('clears search correctly', () {
      controller.search('test');
      controller.updateResults([
        const AppSearchHighlight(start: 0, end: 4, text: 'test'),
      ]);

      controller.clear();

      expect(controller.query, isEmpty);
      expect(controller.highlights, isEmpty);
      expect(controller.data.totalResults, equals(0));
      expect(controller.isSearching, isFalse);
    });

    test('toggles search options', () {
      expect(controller.data.caseSensitive, isFalse);
      controller.toggleCaseSensitive();
      expect(controller.data.caseSensitive, isTrue);

      expect(controller.data.wholeWordsOnly, isFalse);
      controller.toggleWholeWordsOnly();
      expect(controller.data.wholeWordsOnly, isTrue);

      expect(controller.data.useRegex, isFalse);
      controller.toggleRegex();
      expect(controller.data.useRegex, isTrue);
    });
  });

  group('AppInPageSearchConfig Tests', () {
    test('has correct default values', () {
      const config = AppInPageSearchConfig();

      expect(config.size, equals(AppInPageSearchSize.medium));
      expect(config.position, equals(AppInPageSearchPosition.top));
      expect(config.width, equals(320.0));
      expect(config.height, equals(40.0));
      expect(config.showBorder, isTrue);
      expect(config.showShadow, isTrue);
      expect(config.placeholder, isNull);
    });

    test('small config has correct dimensions', () {
      const config = AppInPageSearchConfig.small;

      expect(config.size, equals(AppInPageSearchSize.small));
      expect(config.width, equals(280.0));
      expect(config.height, equals(32.0));
      expect(config.fontSize, equals(12.0));
      expect(config.iconSize, equals(16.0));
    });

    test('medium config has correct dimensions', () {
      const config = AppInPageSearchConfig.medium;

      expect(config.size, equals(AppInPageSearchSize.medium));
      expect(config.width, equals(320.0));
      expect(config.height, equals(40.0));
      expect(config.fontSize, equals(14.0));
      expect(config.iconSize, equals(20.0));
    });

    test('large config has correct dimensions', () {
      const config = AppInPageSearchConfig.large;

      expect(config.size, equals(AppInPageSearchSize.large));
      expect(config.width, equals(400.0));
      expect(config.height, equals(48.0));
      expect(config.fontSize, equals(16.0));
      expect(config.iconSize, equals(24.0));
    });
  });

  group('AppInPageSearchData Tests', () {
    test('initializes with correct defaults', () {
      const data = AppInPageSearchData();

      expect(data.query, isEmpty);
      expect(data.highlights, isEmpty);
      expect(data.activeHighlightIndex, equals(-1));
      expect(data.isSearching, isFalse);
      expect(data.totalResults, equals(0));
      expect(data.currentResultIndex, equals(0));
    });

    test('hasResults returns correct value', () {
      const emptyData = AppInPageSearchData();
      expect(emptyData.hasResults, isFalse);

      const dataWithResults = AppInPageSearchData(totalResults: 5);
      expect(dataWithResults.hasResults, isTrue);
    });

    test('hasActiveHighlight returns correct value', () {
      const noHighlight = AppInPageSearchData();
      expect(noHighlight.hasActiveHighlight, isFalse);

      const withHighlight = AppInPageSearchData(
        highlights: [
          AppSearchHighlight(start: 0, end: 4, text: 'test'),
        ],
        activeHighlightIndex: 0,
      );
      expect(withHighlight.hasActiveHighlight, isTrue);
    });

    test('activeHighlight returns correct highlight', () {
      const highlights = [
        AppSearchHighlight(start: 0, end: 4, text: 'test1'),
        AppSearchHighlight(start: 10, end: 15, text: 'test2'),
      ];

      const data = AppInPageSearchData(
        highlights: highlights,
        activeHighlightIndex: 1,
      );

      expect(data.activeHighlight, equals(highlights[1]));
    });

    test('canNavigateNext returns correct value', () {
      const data = AppInPageSearchData(
        totalResults: 5,
        currentResultIndex: 3,
      );

      expect(data.canNavigateNext, isTrue);

      const lastResult = AppInPageSearchData(
        totalResults: 5,
        currentResultIndex: 5,
      );

      expect(lastResult.canNavigateNext, isFalse);
    });

    test('canNavigatePrevious returns correct value', () {
      const data = AppInPageSearchData(
        totalResults: 5,
        currentResultIndex: 3,
      );

      expect(data.canNavigatePrevious, isTrue);

      const firstResult = AppInPageSearchData(
        totalResults: 5,
        currentResultIndex: 1,
      );

      expect(firstResult.canNavigatePrevious, isFalse);
    });

    test('resultPositionText returns correct format', () {
      const emptyData = AppInPageSearchData();
      expect(emptyData.resultPositionText, equals('0 / 0'));

      const dataWithResults = AppInPageSearchData(
        totalResults: 10,
        currentResultIndex: 5,
      );
      expect(dataWithResults.resultPositionText, equals('5 / 10'));
    });
  });

  group('AppInPageSearchUtils Tests', () {
    test('filterHighlights finds simple matches', () {
      const text = 'This is a test document with test content.';
      const query = 'test';

      final highlights = AppInPageSearchUtils.filterHighlights(text, query);

      expect(highlights.length, equals(2));
      expect(highlights[0].text, equals('test'));
      expect(highlights[0].start, equals(10));
      expect(highlights[0].end, equals(14));
      expect(highlights[1].start, equals(29));
      expect(highlights[1].end, equals(33));
    });

    test('filterHighlights respects case sensitivity', () {
      const text = 'This is a Test document with test content.';
      const query = 'test';

      final caseSensitive = AppInPageSearchUtils.filterHighlights(
        text,
        query,
        caseSensitive: true,
      );
      expect(caseSensitive.length, equals(1));

      final caseInsensitive = AppInPageSearchUtils.filterHighlights(
        text,
        query,
        caseSensitive: false,
      );
      expect(caseInsensitive.length, equals(2));
    });

    test('filterHighlights handles whole words only', () {
      const text = 'testing test tested';
      const query = 'test';

      final wholeWords = AppInPageSearchUtils.filterHighlights(
        text,
        query,
        wholeWordsOnly: true,
      );
      expect(wholeWords.length, equals(1));
      expect(wholeWords[0].start, equals(8));

      final partialWords = AppInPageSearchUtils.filterHighlights(
        text,
        query,
        wholeWordsOnly: false,
      );
      expect(partialWords.length, equals(3));
    });

    test('filterHighlights handles regex patterns', () {
      const text = 'test123 test456 testing';
      const query = r'test\d+';

      final highlights = AppInPageSearchUtils.filterHighlights(
        text,
        query,
        useRegex: true,
      );

      expect(highlights.length, equals(2));
      expect(highlights[0].text, equals('test123'));
      expect(highlights[1].text, equals('test456'));
    });

    test('filterHighlights handles invalid regex gracefully', () {
      const text = 'test document';
      const query = '[invalid regex';

      final highlights = AppInPageSearchUtils.filterHighlights(
        text,
        query,
        useRegex: true,
      );

      expect(highlights, isEmpty);
    });

    test('isValidQuery validates queries correctly', () {
      expect(AppInPageSearchUtils.isValidQuery(''), isFalse);
      expect(AppInPageSearchUtils.isValidQuery('   '), isFalse);
      expect(AppInPageSearchUtils.isValidQuery('valid query'), isTrue);
      expect(AppInPageSearchUtils.isValidQuery('[invalid', useRegex: true),
          isFalse);
      expect(AppInPageSearchUtils.isValidQuery(r'\d+', useRegex: true), isTrue);
    });

    test('getPlatformShortcuts returns expected shortcuts', () {
      final shortcuts = AppInPageSearchUtils.getPlatformShortcuts();

      expect(shortcuts, containsPair('close', [LogicalKeyboardKey.escape]));
      expect(shortcuts, containsPair('search', [LogicalKeyboardKey.enter]));
      expect(shortcuts, containsPair('next', [LogicalKeyboardKey.f3]));
      expect(shortcuts['find'], contains(LogicalKeyboardKey.control));
      expect(shortcuts['find'], contains(LogicalKeyboardKey.keyF));
    });

    test('createHighlightedTextSpans creates correct spans', () {
      const text = 'This is a test document';
      const highlights = [
        AppSearchHighlight(start: 10, end: 14, text: 'test'),
      ];

      final spans = AppInPageSearchUtils.createHighlightedTextSpans(
        text,
        highlights,
        defaultStyle: const TextStyle(color: Colors.black),
        highlightStyle: const TextStyle(color: Colors.yellow),
      );

      expect(spans.length, equals(3));
      expect(spans[0].text, equals('This is a '));
      expect(spans[1].text, equals('test'));
      expect(spans[2].text, equals(' document'));
    });

    test('calculateSearchScore computes relevance score', () {
      const highlight = AppSearchHighlight(start: 0, end: 4, text: 'test');
      const text = 'test document with more content';

      final score = AppInPageSearchUtils.calculateSearchScore(highlight, text);

      expect(score, isA<double>());
      expect(score, greaterThan(0.0));
      expect(score, lessThanOrEqualTo(1.0));
    });
  });

  group('RTL and Accessibility Tests', () {
    testWidgets('supports RTL text direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppInPageSearch.inline(
                config: const AppInPageSearchConfig(
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppInPageSearch), findsOneWidget);
    });

    testWidgets('provides accessibility semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              config: const AppInPageSearchConfig(
                semanticLabel: 'Search input',
                semanticHint: 'Enter search terms',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppInPageSearch), findsOneWidget);
    });
  });

  group('Integration Tests', () {
    testWidgets('complete search workflow', (tester) async {
      final controller = AppInPageSearchController();
      String? lastQuery;
      List<AppSearchHighlight>? lastHighlights;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInPageSearch.inline(
              searchController: controller,
              onFind: (query, highlights) {
                lastQuery = query;
                lastHighlights = highlights;
              },
              config: const AppInPageSearchConfig(
                showResultCount: true,
                showNavigationButtons: true,
                showClearButton: true,
              ),
            ),
          ),
        ),
      );

      // Enter search query
      await tester.enterText(find.byType(TextField), 'search');
      await tester.pump(const Duration(milliseconds: 500)); // Wait for debounce

      expect(lastQuery, equals('search'));
      expect(lastHighlights, isNotNull);

      // Clear search
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      expect(controller.query, isEmpty);
    });
  });
}
