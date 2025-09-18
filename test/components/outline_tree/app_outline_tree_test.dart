import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/outline_tree/app_outline_tree.dart';
import 'package:iautomat_design_system/src/components/outline_tree/outline_tree_config.dart';

void main() {
  group('AppOutlineTree', () {
    late List<AppTreeNode> testNodes;

    setUp(() {
      testNodes = [
        AppTreeNode(
          id: '1',
          label: 'Root Node',
          isExpanded: true,
          children: [
            const AppTreeNode(
              id: '1.1',
              label: 'Child 1',
              depth: 1,
            ),
            AppTreeNode(
              id: '1.2',
              label: 'Child 2',
              depth: 1,
              children: const [
                AppTreeNode(
                  id: '1.2.1',
                  label: 'Grandchild 1',
                  depth: 2,
                ),
              ],
            ),
          ],
        ),
        const AppTreeNode(
          id: '2',
          label: 'Second Root',
          hasChildren: true,
        ),
      ];
    });

    testWidgets('async variant creates widget with correct nodes',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: testNodes,
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.byType(AppOutlineTree), findsOneWidget);
      expect(find.text('Root Node'), findsOneWidget);
      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Second Root'), findsOneWidget);
    });

    testWidgets('multiSelect variant creates widget with checkboxes',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.multiSelect(
              nodes: testNodes,
              config: const AppOutlineTreeConfig(
                selectionMode: AppTreeSelectionMode.multiple,
                showSelectionCheckboxes: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppOutlineTree), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsWidgets);
    });

    testWidgets('node toggle works correctly', (tester) async {
      bool toggleCalled = false;
      AppTreeNode? toggledNode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: [
                AppTreeNode(
                  id: 'expandable',
                  label: 'Expandable Node',
                  children: const [
                    AppTreeNode(id: 'child', label: 'Child Node'),
                  ],
                ),
              ],
              onToggle: (node) {
                toggleCalled = true;
                toggledNode = node;
              },
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      // Find and tap the expander icon
      await tester.tap(find.byIcon(Icons.keyboard_arrow_right));
      await tester.pumpAndSettle();

      expect(toggleCalled, true);
      expect(toggledNode?.id, 'expandable');
    });

    testWidgets('node selection works correctly', (tester) async {
      bool selectCalled = false;
      AppTreeNode? selectedNode;
      bool selectionState = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.multiSelect(
              nodes: testNodes,
              onSelect: (node, selected) {
                selectCalled = true;
                selectedNode = node;
                selectionState = selected;
              },
            ),
          ),
        ),
      );

      // Tap on a node to select it
      await tester.tap(find.text('Root Node'));
      await tester.pumpAndSettle();

      expect(selectCalled, true);
      expect(selectedNode?.id, '1');
      expect(selectionState, true);
    });

    testWidgets('async loading works correctly', (tester) async {
      List<AppTreeNode> loadedChildren = [];
      AppTreeNode? loadedForNode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: [
                const AppTreeNode(
                  id: 'async',
                  label: 'Async Node',
                  hasChildren: true,
                ),
              ],
              onAsyncLoad: (node) async {
                loadedForNode = node;
                await Future.delayed(const Duration(milliseconds: 100));
                loadedChildren = [
                  const AppTreeNode(
                    id: 'loaded1',
                    label: 'Loaded Child 1',
                  ),
                  const AppTreeNode(
                    id: 'loaded2',
                    label: 'Loaded Child 2',
                  ),
                ];
                return loadedChildren;
              },
            ),
          ),
        ),
      );

      // Tap the expander to trigger async load
      await tester.tap(find.byIcon(Icons.keyboard_arrow_right));
      await tester.pump();

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(loadedForNode?.id, 'async');

      // Wait for async operation to complete
      await tester.pumpAndSettle();

      // Should show loaded children
      expect(find.text('Loaded Child 1'), findsOneWidget);
      expect(find.text('Loaded Child 2'), findsOneWidget);
    });

    testWidgets('keyboard navigation works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: testNodes,
              config: const AppOutlineTreeConfig(
                enableKeyboardNavigation: true,
              ),
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      // Focus the tree
      await tester.tap(find.byType(AppOutlineTree));
      await tester.pumpAndSettle();

      // Test arrow key navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();

      // Test expand/collapse with arrow keys
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
    });

    testWidgets('loading state shows loading indicator', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: const [],
              state: AppOutlineTreeState.loading,
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('skeleton state shows skeleton animation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: const [],
              state: AppOutlineTreeState.skeleton,
              config: const AppOutlineTreeConfig(
                skeletonNodeCount: 3,
              ),
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBuilder), findsWidgets);
    });

    testWidgets('disabled state prevents interaction', (tester) async {
      bool toggleCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: testNodes,
              state: AppOutlineTreeState.disabled,
              onToggle: (node) => toggleCalled = true,
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      // Try to interact with disabled tree
      await tester.tap(find.text('Root Node'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(toggleCalled, false);
    });

    testWidgets('custom config is applied correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: testNodes,
              config: const AppOutlineTreeConfig(
                itemHeight: 50.0,
                fontSize: 18.0,
                showIcons: false,
                showSelectionCheckboxes: false,
              ),
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.byType(AppOutlineTree), findsOneWidget);
    });

    testWidgets('empty state shows empty message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: const [],
              config: const AppOutlineTreeConfig(
                emptyLabel: 'No data available',
              ),
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.text('No data available'), findsOneWidget);
      expect(find.byIcon(Icons.folder_open), findsOneWidget);
    });

    testWidgets('RTL support works correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppOutlineTree.async(
                nodes: testNodes,
                config: const AppOutlineTreeConfig(
                  enableRTL: true,
                  textDirection: TextDirection.rtl,
                ),
                onAsyncLoad: (node) async => [],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppOutlineTree), findsOneWidget);
    });

    testWidgets('custom node builder works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: testNodes,
              nodeBuilder: (context, node, depth) {
                return Container(
                  key: ValueKey('custom_${node.id}'),
                  child: Text('Custom: ${node.label}'),
                );
              },
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.text('Custom: Root Node'), findsOneWidget);
      expect(find.byKey(const ValueKey('custom_1')), findsOneWidget);
    });

    testWidgets('custom icon builder works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: testNodes,
              iconBuilder: (context, node) {
                return Icon(
                  Icons.star,
                  key: ValueKey('icon_${node.id}'),
                );
              },
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('icon_1')), findsOneWidget);
      expect(find.byIcon(Icons.star), findsWidgets);
    });

    testWidgets('node with badge displays correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: [
                const AppTreeNode(
                  id: 'badged',
                  label: 'Node with Badge',
                  badge: '99+',
                ),
              ],
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.text('Node with Badge'), findsOneWidget);
      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('node with tooltip shows tooltip', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.async(
              nodes: [
                const AppTreeNode(
                  id: 'tooltip',
                  label: 'Node with Tooltip',
                  tooltip: 'This is a helpful tooltip',
                ),
              ],
              onAsyncLoad: (node) async => [],
            ),
          ),
        ),
      );

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('hierarchical selection works correctly', (tester) async {
      final nodes = [
        AppTreeNode(
          id: 'parent',
          label: 'Parent',
          isExpanded: true,
          children: const [
            AppTreeNode(
              id: 'child1',
              label: 'Child 1',
              depth: 1,
            ),
            AppTreeNode(
              id: 'child2',
              label: 'Child 2',
              depth: 1,
            ),
          ],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppOutlineTree.multiSelect(
              nodes: nodes,
              config: const AppOutlineTreeConfig(
                selectionMode: AppTreeSelectionMode.hierarchical,
                showSelectionCheckboxes: true,
              ),
            ),
          ),
        ),
      );

      // Select parent should select all children
      final checkboxes = find.byIcon(Icons.circle_outlined);
      expect(checkboxes, findsWidgets);

      await tester.tap(checkboxes.first);
      await tester.pumpAndSettle();

      // Should show selected checkboxes
      expect(find.byIcon(Icons.check_circle), findsWidgets);
    });
  });

  group('AppTreeNode', () {
    test('canExpand returns correct value', () {
      var node = const AppTreeNode(id: '1', label: 'Test', isLeaf: true);
      expect(node.canExpand, false);

      node = AppTreeNode(
        id: '2',
        label: 'Test',
        children: [const AppTreeNode(id: '2.1', label: 'Child')],
      );
      expect(node.canExpand, true);

      node = const AppTreeNode(id: '3', label: 'Test', hasChildren: true);
      expect(node.canExpand, true);
    });

    test('isCollapsed returns correct value', () {
      var node = AppTreeNode(
        id: '1',
        label: 'Test',
        isExpanded: false,
        children: [const AppTreeNode(id: '1.1', label: 'Child')],
      );
      expect(node.isCollapsed, true);

      node = node.copyWith(isExpanded: true);
      expect(node.isCollapsed, false);
    });

    test('hasVisibleChildren returns correct value', () {
      var node = AppTreeNode(
        id: '1',
        label: 'Test',
        children: [
          const AppTreeNode(id: '1.1', label: 'Visible', isVisible: true),
          const AppTreeNode(id: '1.2', label: 'Hidden', isVisible: false),
        ],
      );
      expect(node.hasVisibleChildren, true);

      node = AppTreeNode(
        id: '2',
        label: 'Test',
        children: [
          const AppTreeNode(id: '2.1', label: 'Hidden 1', isVisible: false),
          const AppTreeNode(id: '2.2', label: 'Hidden 2', isVisible: false),
        ],
      );
      expect(node.hasVisibleChildren, false);
    });

    test('allDescendants returns all descendants', () {
      final node = AppTreeNode(
        id: '1',
        label: 'Root',
        children: [
          AppTreeNode(
            id: '1.1',
            label: 'Child 1',
            children: [
              const AppTreeNode(id: '1.1.1', label: 'Grandchild 1'),
            ],
          ),
          const AppTreeNode(id: '1.2', label: 'Child 2'),
        ],
      );

      final descendants = node.allDescendants;
      expect(descendants.length, 3);
      expect(descendants.map((n) => n.id), contains('1.1'));
      expect(descendants.map((n) => n.id), contains('1.2'));
      expect(descendants.map((n) => n.id), contains('1.1.1'));
    });

    test('withSelection updates selection state', () {
      var node = const AppTreeNode(id: '1', label: 'Test', isSelected: false);
      node = node.withSelection(true);
      expect(node.isSelected, true);

      node = node.withSelection(false);
      expect(node.isSelected, false);
    });

    test('withExpansion updates expansion state', () {
      var node = const AppTreeNode(id: '1', label: 'Test', isExpanded: false);
      node = node.withExpansion(true);
      expect(node.isExpanded, true);
      expect(node.state, AppTreeNodeState.expanded);

      node = node.withExpansion(false);
      expect(node.isExpanded, false);
      expect(node.state, AppTreeNodeState.collapsed);
    });

    test('withLoading updates loading state', () {
      var node = const AppTreeNode(id: '1', label: 'Test', isLoading: false);
      node = node.withLoading(true);
      expect(node.isLoading, true);
      expect(node.state, AppTreeNodeState.loading);

      node = node.withLoading(false);
      expect(node.isLoading, false);
      expect(node.state, AppTreeNodeState.collapsed);
    });

    test('withError updates error state', () {
      var node = const AppTreeNode(id: '1', label: 'Test');
      node = node.withError('Network error');
      expect(node.errorMessage, 'Network error');
      expect(node.state, AppTreeNodeState.error);
      expect(node.isLoading, false);

      node = node.withError(null);
      expect(node.errorMessage, null);
      expect(node.state, AppTreeNodeState.collapsed);
    });

    test('findNode finds correct node', () {
      final node = AppTreeNode(
        id: '1',
        label: 'Root',
        children: [
          AppTreeNode(
            id: '1.1',
            label: 'Child',
            children: [
              const AppTreeNode(id: '1.1.1', label: 'Grandchild'),
            ],
          ),
        ],
      );

      expect(node.findNode('1')?.label, 'Root');
      expect(node.findNode('1.1')?.label, 'Child');
      expect(node.findNode('1.1.1')?.label, 'Grandchild');
      expect(node.findNode('nonexistent'), null);
    });

    test('updateNode updates correct node', () {
      var node = AppTreeNode(
        id: '1',
        label: 'Root',
        children: [
          const AppTreeNode(id: '1.1', label: 'Child'),
        ],
      );

      node = node.updateNode('1.1', (n) => n.copyWith(label: 'Updated Child'));
      final updatedChild = node.findNode('1.1');
      expect(updatedChild?.label, 'Updated Child');
    });

    test('selectionState returns correct state', () {
      var node = const AppTreeNode(id: '1', label: 'Test', isSelected: true);
      expect(node.selectionState, TreeSelectionState.selected);

      node =
          const AppTreeNode(id: '2', label: 'Test', isPartiallySelected: true);
      expect(node.selectionState, TreeSelectionState.partial);

      node = const AppTreeNode(id: '3', label: 'Test');
      expect(node.selectionState, TreeSelectionState.unselected);
    });
  });

  group('AppOutlineTreeUtils', () {
    late List<AppTreeNode> testNodes;

    setUp(() {
      testNodes = [
        AppTreeNode(
          id: '1',
          label: 'Root 1',
          isExpanded: true,
          children: [
            const AppTreeNode(id: '1.1', label: 'Child 1.1', depth: 1),
            AppTreeNode(
              id: '1.2',
              label: 'Child 1.2',
              depth: 1,
              isExpanded: true,
              children: [
                const AppTreeNode(
                    id: '1.2.1', label: 'Grandchild 1.2.1', depth: 2),
              ],
            ),
          ],
        ),
        const AppTreeNode(id: '2', label: 'Root 2'),
      ];
    });

    test('flattenTree returns flattened list', () {
      final flattened = AppOutlineTreeUtils.flattenTree(testNodes);

      expect(flattened.length, 5);
      expect(flattened[0].id, '1');
      expect(flattened[1].id, '1.1');
      expect(flattened[2].id, '1.2');
      expect(flattened[3].id, '1.2.1');
      expect(flattened[4].id, '2');
    });

    test('flattenTree respects maxDepth', () {
      final flattened = AppOutlineTreeUtils.flattenTree(testNodes, maxDepth: 1);

      expect(flattened.length, 4);
      expect(flattened.map((n) => n.id), isNot(contains('1.2.1')));
    });

    test('getSelectedNodes returns only selected nodes', () {
      final nodes = [
        const AppTreeNode(id: '1', label: 'Node 1', isSelected: true),
        const AppTreeNode(id: '2', label: 'Node 2', isSelected: false),
        AppTreeNode(
          id: '3',
          label: 'Node 3',
          children: [
            const AppTreeNode(id: '3.1', label: 'Child 3.1', isSelected: true),
          ],
        ),
      ];

      final selected = AppOutlineTreeUtils.getSelectedNodes(nodes);
      expect(selected.length, 2);
      expect(selected.map((n) => n.id), contains('1'));
      expect(selected.map((n) => n.id), contains('3.1'));
    });

    test('updateSelection works for single mode', () {
      final updated = AppOutlineTreeUtils.updateSelection(
        testNodes,
        '1.1',
        true,
        AppTreeSelectionMode.single,
      );

      final targetNode = updated[0].findNode('1.1');
      expect(targetNode?.isSelected, true);
    });

    test('updateSelection works for hierarchical mode', () {
      final updated = AppOutlineTreeUtils.updateSelection(
        testNodes,
        '1',
        true,
        AppTreeSelectionMode.hierarchical,
      );

      final rootNode = updated[0];
      expect(rootNode.isSelected, true);

      final childNode = rootNode.findNode('1.1');
      expect(childNode?.isSelected, true);
    });

    test('expandPath expands nodes in path', () {
      final path = ['1', '1.2', '1.2.1'];
      final expanded = AppOutlineTreeUtils.expandPath(testNodes, path);

      final rootNode = expanded[0];
      expect(rootNode.isExpanded, true);

      final childNode = rootNode.findNode('1.2');
      expect(childNode?.isExpanded, true);
    });

    test('getExpandedNodeIds returns expanded nodes', () {
      final expandedIds = AppOutlineTreeUtils.getExpandedNodeIds(testNodes);
      expect(expandedIds, contains('1'));
      expect(expandedIds, contains('1.2'));
      expect(expandedIds, isNot(contains('2')));
    });

    test('searchNodes finds matching nodes', () {
      final results = AppOutlineTreeUtils.searchNodes(testNodes, 'Child');
      expect(results.length, 2);
      expect(results.map((n) => n.id), contains('1.1'));
      expect(results.map((n) => n.id), contains('1.2'));
    });

    test('searchNodes is case sensitive when specified', () {
      final results = AppOutlineTreeUtils.searchNodes(
        testNodes,
        'child',
        caseSensitive: true,
      );
      expect(results.length, 0);

      final resultsInsensitive = AppOutlineTreeUtils.searchNodes(
        testNodes,
        'child',
        caseSensitive: false,
      );
      expect(resultsInsensitive.length, 2);
    });

    test('calculateStatistics returns correct stats', () {
      final nodes = [
        AppTreeNode(
          id: '1',
          label: 'Root',
          isExpanded: true,
          isSelected: true,
          children: [
            const AppTreeNode(id: '1.1', label: 'Child', isLeaf: true),
            const AppTreeNode(id: '1.2', label: 'Child 2', isSelected: true),
          ],
        ),
      ];

      final stats = AppOutlineTreeUtils.calculateStatistics(nodes);
      expect(stats.totalNodes, 3);
      expect(stats.selectedNodes, 2);
      expect(stats.expandedNodes, 1);
      expect(stats.leafNodes, 1);
      expect(stats.maxDepth, 1);
    });

    test('getNodeSemanticLabel generates correct label', () {
      const config = AppOutlineTreeConfig(
        selectionMode: AppTreeSelectionMode.multiple,
      );

      const node = AppTreeNode(
        id: '1',
        label: 'Test Node',
        isSelected: true,
        isExpanded: true,
        depth: 2,
        children: [
          AppTreeNode(id: '1.1', label: 'Child'),
        ],
      );

      final label = AppOutlineTreeUtils.getNodeSemanticLabel(node, config);
      expect(label, contains('Test Node'));
      expect(label, contains('selected'));
      expect(label, contains('expanded'));
      expect(label, contains('level 3'));
      expect(label, contains('1 children'));
    });
  });
}
