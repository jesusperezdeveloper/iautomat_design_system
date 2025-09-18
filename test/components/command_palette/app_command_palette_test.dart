import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/command_palette/app_command_palette.dart';
import 'package:iautomat_design_system/src/components/command_palette/command_palette_config.dart';

void main() {
  group('AppCommandPalette', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: 'test1', title: 'Test Command 1'),
                  AppCommandResult(id: 'test2', title: 'Test Command 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppCommandPalette), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
        expect(find.text('Test Command 1'), findsOneWidget);
        expect(find.text('Test Command 2'), findsOneWidget);
      });

      testWidgets('renders with global search variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette.globalSearch(
                results: [
                  AppCommandResult(id: 'search1', title: 'Search Result 1'),
                  AppCommandResult(id: 'search2', title: 'Search Result 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppCommandPalette), findsOneWidget);
        expect(find.text('Search Result 1'), findsOneWidget);
        expect(find.text('Search Result 2'), findsOneWidget);
      });

      testWidgets('renders with actions variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette.actions(
                results: [
                  AppCommandResult(id: 'action1', title: 'Action 1'),
                  AppCommandResult(id: 'action2', title: 'Action 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppCommandPalette), findsOneWidget);
        expect(find.text('Action 1'), findsOneWidget);
        expect(find.text('Action 2'), findsOneWidget);
      });

      testWidgets('displays icons when provided', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(
                    id: 'icon1',
                    title: 'With Icon',
                    icon: Icons.star,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.text('With Icon'), findsOneWidget);
      });

      testWidgets('shows search input with placeholder', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                config: AppCommandPaletteConfig(
                  placeholder: 'Custom placeholder',
                ),
              ),
            ),
          ),
        );

        expect(find.byType(TextField), findsOneWidget);
        final textField = tester.widget<TextField>(find.byType(TextField));
        expect(textField.decoration?.hintText, equals('Custom placeholder'));
      });

      testWidgets('shows recent commands when query is empty', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                showRecent: true,
                recentCommands: [
                  AppCommandResult(id: 'recent1', title: 'Recent Command'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Recent Command'), findsOneWidget);
      });
    });

    group('State Tests', () {
      testWidgets('renders loading state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                state: AppCommandPaletteState.loading,
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                state: AppCommandPaletteState.skeleton,
                config: AppCommandPaletteConfig(
                  skeletonItemCount: 3,
                ),
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(AppCommandPalette), findsOneWidget);
      });

      testWidgets('shows empty state when no results', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                showRecent: false,
              ),
            ),
          ),
        );

        expect(find.text('Start typing to search...'), findsOneWidget);
      });

      testWidgets('hides when isVisible is false', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: 'test', title: 'Test'),
                ],
                isVisible: false,
              ),
            ),
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.text('Test'), findsNothing);
      });
    });

    group('Interaction Tests', () {
      testWidgets('calls onQuery when text changes', (tester) async {
        String? queriedText;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: const [],
                onQuery: (query) {
                  queriedText = query;
                },
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextField), 'test query');
        await tester
            .pump(const Duration(milliseconds: 300)); // Wait for debounce

        expect(queriedText, equals('test query'));
      });

      testWidgets('calls onInvoke when result is tapped', (tester) async {
        AppCommandResult? invokedResult;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: const [
                  AppCommandResult(id: 'test', title: 'Test Command'),
                ],
                onInvoke: (result) {
                  invokedResult = result;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Test Command'), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(invokedResult?.id, equals('test'));
        expect(invokedResult?.title, equals('Test Command'));
      });

      testWidgets('handles keyboard navigation', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: 'test1', title: 'Test 1'),
                  AppCommandResult(id: 'test2', title: 'Test 2'),
                ],
              ),
            ),
          ),
        );

        // Focus the command palette
        await tester.tap(find.byType(TextField));
        await tester.pumpAndSettle();

        // Navigate with arrow keys
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pumpAndSettle();

        // The first item should be selected by default
        expect(find.byType(AppCommandPalette), findsOneWidget);
      });

      testWidgets('handles escape key to close', (tester) async {
        bool closeCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: const [],
                onClose: () {
                  closeCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(TextField));
        await tester.pumpAndSettle();

        await tester.sendKeyEvent(LogicalKeyboardKey.escape);
        await tester.pumpAndSettle();

        expect(closeCalled, isTrue);
      });

      testWidgets('clears query when clear button is tapped', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                initialQuery: 'test query',
              ),
            ),
          ),
        );

        // Verify initial query
        expect(find.text('test query'), findsOneWidget);

        // Tap clear button
        await tester.tap(find.byIcon(Icons.clear));
        await tester.pumpAndSettle();

        // Verify query is cleared
        final textField = tester.widget<TextField>(find.byType(TextField));
        expect(textField.controller?.text, isEmpty);
      });
    });

    group('Configuration Tests', () {
      testWidgets('applies custom configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                config: AppCommandPaletteConfig(
                  maxWidth: 800,
                  maxHeight: 600,
                  backgroundColor: Colors.red,
                  borderRadius: 20,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppCommandPalette), findsOneWidget);
      });

      testWidgets('uses size-specific configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [],
                config: AppCommandPaletteConfig.large,
              ),
            ),
          ),
        );

        expect(find.byType(AppCommandPalette), findsOneWidget);
      });

      testWidgets('shows shortcuts when enabled', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(
                    id: 'shortcut',
                    title: 'With Shortcut',
                    shortcut: [
                      LogicalKeyboardKey.meta,
                      LogicalKeyboardKey.keyN
                    ],
                  ),
                ],
                config: AppCommandPaletteConfig(
                  showResultShortcuts: true,
                ),
              ),
            ),
          ),
        );

        expect(find.text('With Shortcut'), findsOneWidget);
      });
    });

    group('Search and Filtering Tests', () {
      testWidgets('filters results based on query', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: '1', title: 'Create File'),
                  AppCommandResult(id: '2', title: 'Open File'),
                  AppCommandResult(id: '3', title: 'Save Document'),
                ],
              ),
            ),
          ),
        );

        // Enter search query
        await tester.enterText(find.byType(TextField), 'file');
        await tester
            .pump(const Duration(milliseconds: 300)); // Wait for debounce

        // Should show filtered results
        expect(find.text('Create File'), findsOneWidget);
        expect(find.text('Open File'), findsOneWidget);
        expect(find.text('Save Document'), findsNothing);
      });

      testWidgets('shows all results when query is empty', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: '1', title: 'Command 1'),
                  AppCommandResult(id: '2', title: 'Command 2'),
                ],
                showRecent: false,
              ),
            ),
          ),
        );

        expect(find.text('Command 1'), findsOneWidget);
        expect(find.text('Command 2'), findsOneWidget);
      });
    });

    group('RTL and Accessibility Tests', () {
      testWidgets('supports RTL text direction', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: 'rtl', title: 'RTL Command'),
                ],
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        );

        expect(find.text('RTL Command'), findsOneWidget);
      });

      testWidgets('has proper focus management', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCommandPalette(
                results: [
                  AppCommandResult(id: 'focus', title: 'Focus Test'),
                ],
              ),
            ),
          ),
        );

        // Tap to focus
        await tester.tap(find.byType(TextField));
        await tester.pumpAndSettle();

        // Verify focus
        final textField = tester.widget<TextField>(find.byType(TextField));
        expect(textField.focusNode?.hasFocus, isTrue);
      });
    });

    group('Overlay Tests', () {
      testWidgets('shows overlay correctly', (tester) async {
        final palette = AppCommandPalette(
          results: const [
            AppCommandResult(id: 'overlay', title: 'Overlay Test'),
          ],
          onClose: () {},
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      AppCommandPalette.showOverlay(
                        context: context,
                        palette: palette,
                      );
                    },
                    child: const Text('Show Overlay'),
                  ),
                );
              },
            ),
          ),
        );

        // Tap button to show overlay
        await tester.tap(find.text('Show Overlay'));
        await tester.pumpAndSettle();

        // Verify overlay is shown
        expect(find.text('Overlay Test'), findsOneWidget);
      });
    });
  });

  group('AppCommandResult', () {
    test('creates result correctly', () {
      const result = AppCommandResult(
        id: 'test',
        title: 'Test Command',
        description: 'Test description',
        icon: Icons.star,
        type: AppCommandResultType.command,
      );

      expect(result.id, equals('test'));
      expect(result.title, equals('Test Command'));
      expect(result.description, equals('Test description'));
      expect(result.icon, equals(Icons.star));
      expect(result.type, equals(AppCommandResultType.command));
    });

    test('matches query correctly', () {
      const result = AppCommandResult(
        id: 'test',
        title: 'Create New File',
        description: 'Creates a new document',
        tags: ['file', 'document'],
      );

      expect(result.matches('create'), isTrue);
      expect(result.matches('new'), isTrue);
      expect(result.matches('document'), isTrue);
      expect(result.matches('file'), isTrue);
      expect(result.matches('nonexistent'), isFalse);
      expect(result.matches(''), isTrue);
    });

    test('calculates fuzzy score correctly', () {
      const result = AppCommandResult(
        id: 'test',
        title: 'Create New File',
        description: 'Creates a new document',
        tags: ['file'],
      );

      // Exact match should have highest score
      expect(result.fuzzyScore('create new file'), equals(100.0));

      // Starts with should have high score
      expect(result.fuzzyScore('create'), equals(80.0));

      // Contains should have medium score
      expect(result.fuzzyScore('new'), equals(60.0));

      // No match should have zero score
      expect(result.fuzzyScore('nonexistent'), equals(0.0));
    });

    test('creates navigation result with factory', () {
      final result = AppCommandResult.navigation(
        id: 'nav',
        title: 'Navigate',
        description: 'Go somewhere',
      );

      expect(result.type, equals(AppCommandResultType.navigation));
      expect(result.icon, equals(Icons.navigation));
    });

    test('creates action result with factory', () {
      final result = AppCommandResult.action(
        id: 'action',
        title: 'Do Something',
        description: 'Perform action',
      );

      expect(result.type, equals(AppCommandResultType.command));
      expect(result.icon, equals(Icons.flash_on));
    });

    test('creates search result with factory', () {
      final result = AppCommandResult.search(
        id: 'search',
        title: 'Search Result',
        score: 0.8,
      );

      expect(result.type, equals(AppCommandResultType.search));
      expect(result.icon, equals(Icons.search));
      expect(result.score, equals(0.8));
    });

    test('gets default icon for result type', () {
      const commandResult = AppCommandResult(
        id: 'cmd',
        title: 'Command',
        type: AppCommandResultType.command,
      );
      expect(commandResult.defaultIcon, equals(Icons.flash_on));

      const navResult = AppCommandResult(
        id: 'nav',
        title: 'Navigation',
        type: AppCommandResultType.navigation,
      );
      expect(navResult.defaultIcon, equals(Icons.navigation));
    });
  });

  group('AppCommandPaletteData', () {
    test('identifies selected result correctly', () {
      const data = AppCommandPaletteData(
        filteredResults: [
          AppCommandResult(id: 'result1', title: 'Result 1'),
          AppCommandResult(id: 'result2', title: 'Result 2'),
        ],
        selectedIndex: 1,
      );

      expect(data.selectedResult?.id, equals('result2'));
    });

    test('returns null when no result selected', () {
      const data = AppCommandPaletteData(
        filteredResults: [
          AppCommandResult(id: 'result1', title: 'Result 1'),
        ],
        selectedIndex: -1,
      );

      expect(data.selectedResult, isNull);
    });

    test('identifies if has results', () {
      const dataWithResults = AppCommandPaletteData(
        filteredResults: [
          AppCommandResult(id: 'result1', title: 'Result 1'),
        ],
      );
      expect(dataWithResults.hasResults, isTrue);

      const dataWithoutResults = AppCommandPaletteData(
        filteredResults: [],
      );
      expect(dataWithoutResults.hasResults, isFalse);
    });

    test('gets display results correctly', () {
      const dataWithQuery = AppCommandPaletteData(
        query: 'test',
        filteredResults: [
          AppCommandResult(id: 'filtered', title: 'Filtered'),
        ],
        recentCommands: [
          AppCommandResult(id: 'recent', title: 'Recent'),
        ],
      );
      expect(dataWithQuery.displayResults.first.id, equals('filtered'));

      const dataWithoutQuery = AppCommandPaletteData(
        query: '',
        filteredResults: [
          AppCommandResult(id: 'filtered', title: 'Filtered'),
        ],
        recentCommands: [
          AppCommandResult(id: 'recent', title: 'Recent'),
        ],
      );
      expect(dataWithoutQuery.displayResults.first.id, equals('recent'));
    });
  });

  group('AppCommandPaletteUtils', () {
    test('filters results correctly', () {
      const results = [
        AppCommandResult(id: '1', title: 'Create File'),
        AppCommandResult(id: '2', title: 'Open File'),
        AppCommandResult(id: '3', title: 'Save Document'),
      ];

      final filtered = AppCommandPaletteUtils.filterResults(
        results,
        'file',
        maxResults: 10,
      );

      expect(filtered.length, equals(2));
      expect(filtered.any((r) => r.title.contains('File')), isTrue);
    });

    test('adds command to recent history', () {
      const recentCommands = [
        AppCommandResult(id: 'old', title: 'Old Command'),
      ];

      const newCommand = AppCommandResult(id: 'new', title: 'New Command');

      final updated = AppCommandPaletteUtils.addToRecent(
        recentCommands,
        newCommand,
        5,
      );

      expect(updated.first.id, equals('new'));
      expect(updated.length, equals(2));
    });

    test('formats keyboard shortcuts correctly', () {
      final shortcut = [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyN];
      final formatted = AppCommandPaletteUtils.formatShortcut(shortcut);

      expect(formatted, contains('⌘'));
      expect(formatted, contains('N'));
    });

    test('creates data from command list', () {
      final commands = ['Command 1', 'Command 2'];
      final data = AppCommandPaletteUtils.fromCommandList(commands);

      expect(data.results.length, equals(2));
      expect(data.results.first.title, equals('Command 1'));
    });

    test('validates data correctly', () {
      const validData = AppCommandPaletteData(
        filteredResults: [
          AppCommandResult(id: 'valid', title: 'Valid'),
        ],
        selectedIndex: 0,
      );
      expect(AppCommandPaletteUtils.validateData(validData), isTrue);

      const invalidData = AppCommandPaletteData(
        filteredResults: [],
        selectedIndex: 5, // Out of bounds
      );
      expect(AppCommandPaletteUtils.validateData(invalidData), isFalse);
    });

    test('highlights matches correctly', () {
      final spans = AppCommandPaletteUtils.highlightMatches(
        'Create New File',
        'new',
        const TextStyle(),
        Colors.yellow,
      );

      expect(spans.length, greaterThan(1));
      expect(
          spans.any((span) => span.text?.toLowerCase().contains('new') == true),
          isTrue);
    });
  });
}
