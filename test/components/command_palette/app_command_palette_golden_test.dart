import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSCommandPalette Golden Tests', () {
    final mockResults = [
      const DSCommandResult(
        id: 'result-1',
        title: 'Search Files',
        description: 'Find files in your project',
        icon: Icons.search,
        type: DSCommandResultType.command,
      ),
      const DSCommandResult(
        id: 'result-2',
        title: 'Open Settings',
        description: 'Configure application preferences',
        icon: Icons.settings,
        type: DSCommandResultType.setting,
      ),
      const DSCommandResult(
        id: 'result-3',
        title: 'Create New File',
        description: 'Add a new file to your project',
        icon: Icons.add,
        type: DSCommandResultType.command,
        enabled: false,
      ),
    ];

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
      testWidgets('global search variant default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile(
              'golden/app_command_palette/global_search_default.png'),
        );
      });

      testWidgets('actions variant default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.actions(
              results: mockResults,
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/actions_default.png'),
        );
      });
    });

    group('States', () {
      testWidgets('loading state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              state: DSCommandPaletteState.loading,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/loading_state.png'),
        );
      });

      testWidgets('skeleton state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: [],
              onInvoke: (result) {},
              state: DSCommandPaletteState.skeleton,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/skeleton_state.png'),
        );
      });

      testWidgets('empty results', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: [],
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/empty_results.png'),
        );
      });
    });

    group('Sizes', () {
      testWidgets('small size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              config: const DSCommandPaletteConfig(
                size: DSCommandPaletteSize.small,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/small_size.png'),
        );
      });

      testWidgets('medium size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              config: const DSCommandPaletteConfig(
                size: DSCommandPaletteSize.medium,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/medium_size.png'),
        );
      });

      testWidgets('large size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              config: const DSCommandPaletteConfig(
                size: DSCommandPaletteSize.large,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/large_size.png'),
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
                  child: DSCommandPalette.globalSearch(
                    onQuery: (query) {},
                    results: mockResults,
                    onInvoke: (result) {},
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile('golden/app_command_palette/dark_theme.png'),
        );
      });
    });

    group('Different Result Types', () {
      testWidgets('mixed result types', (tester) async {
        final mixedResults = [
          const DSCommandResult(
            id: 'search-1',
            title: 'main.dart',
            description: '/lib/main.dart',
            icon: Icons.code,
            type: DSCommandResultType.file,
          ),
          const DSCommandResult(
            id: 'command-1',
            title: 'Open Terminal',
            description: 'Launch integrated terminal',
            icon: Icons.terminal,
            type: DSCommandResultType.command,
          ),
          const DSCommandResult(
            id: 'navigation-1',
            title: 'Go to Line',
            description: 'Jump to specific line number',
            icon: Icons.my_location,
            type: DSCommandResultType.navigation,
          ),
          const DSCommandResult(
            id: 'setting-1',
            title: 'Recent Files',
            description: 'widget_test.dart',
            icon: Icons.history,
            type: DSCommandResultType.setting,
          ),
        ];

        await tester.pumpWidget(
          buildTestWidget(
            DSCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mixedResults,
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(DSCommandPalette),
          matchesGoldenFile(
              'golden/app_command_palette/mixed_result_types.png'),
        );
      });
    });
  });
}
