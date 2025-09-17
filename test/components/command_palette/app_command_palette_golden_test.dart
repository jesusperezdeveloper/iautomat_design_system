import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppCommandPalette Golden Tests', () {
    final mockResults = [
      const AppCommandResult(
        id: 'result-1',
        title: 'Search Files',
        description: 'Find files in your project',
        icon: Icons.search,
        type: AppCommandResultType.command,
      ),
      const AppCommandResult(
        id: 'result-2',
        title: 'Open Settings',
        description: 'Configure application preferences',
        icon: Icons.settings,
        type: AppCommandResultType.setting,
      ),
      const AppCommandResult(
        id: 'result-3',
        title: 'Create New File',
        description: 'Add a new file to your project',
        icon: Icons.add,
        type: AppCommandResultType.command,
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
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/global_search_default.png'),
        );
      });

      testWidgets('actions variant default state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.actions(
              results: mockResults,
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/actions_default.png'),
        );
      });
    });

    group('States', () {
      testWidgets('loading state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              state: AppCommandPaletteState.loading,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/loading_state.png'),
        );
      });

      testWidgets('skeleton state', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: [],
              onInvoke: (result) {},
              state: AppCommandPaletteState.skeleton,
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/skeleton_state.png'),
        );
      });

      testWidgets('empty results', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: [],
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/empty_results.png'),
        );
      });
    });

    group('Sizes', () {
      testWidgets('small size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              config: const AppCommandPaletteConfig(
                size: AppCommandPaletteSize.small,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/small_size.png'),
        );
      });

      testWidgets('medium size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              config: const AppCommandPaletteConfig(
                size: AppCommandPaletteSize.medium,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/medium_size.png'),
        );
      });

      testWidgets('large size', (tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mockResults,
              onInvoke: (result) {},
              config: const AppCommandPaletteConfig(
                size: AppCommandPaletteSize.large,
              ),
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
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
                  child: AppCommandPalette.globalSearch(
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
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/dark_theme.png'),
        );
      });
    });

    group('Different Result Types', () {
      testWidgets('mixed result types', (tester) async {
        final mixedResults = [
          const AppCommandResult(
            id: 'search-1',
            title: 'main.dart',
            description: '/lib/main.dart',
            icon: Icons.code,
            type: AppCommandResultType.file,
          ),
          const AppCommandResult(
            id: 'command-1',
            title: 'Open Terminal',
            description: 'Launch integrated terminal',
            icon: Icons.terminal,
            type: AppCommandResultType.command,
          ),
          const AppCommandResult(
            id: 'navigation-1',
            title: 'Go to Line',
            description: 'Jump to specific line number',
            icon: Icons.my_location,
            type: AppCommandResultType.navigation,
          ),
          const AppCommandResult(
            id: 'setting-1',
            title: 'Recent Files',
            description: 'widget_test.dart',
            icon: Icons.history,
            type: AppCommandResultType.setting,
          ),
        ];

        await tester.pumpWidget(
          buildTestWidget(
            AppCommandPalette.globalSearch(
              onQuery: (query) {},
              results: mixedResults,
              onInvoke: (result) {},
            ),
          ),
        );
        await tester.pump();
        await expectLater(
          find.byType(AppCommandPalette),
          matchesGoldenFile('golden/app_command_palette/mixed_result_types.png'),
        );
      });
    });
  });
}