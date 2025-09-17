import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppOutlineTree Golden Tests', () {
    late List<AppTreeNode> basicNodes;
    late List<AppTreeNode> complexNodes;

    setUp(() {
      basicNodes = [
        const AppTreeNode(
          id: '1',
          label: 'Root 1',
          children: [
            AppTreeNode(
              id: '1-1',
              label: 'Child 1-1',
            ),
            AppTreeNode(
              id: '1-2',
              label: 'Child 1-2',
              children: [
                AppTreeNode(
                  id: '1-2-1',
                  label: 'Grandchild 1-2-1',
                ),
              ],
            ),
          ],
        ),
        const AppTreeNode(
          id: '2',
          label: 'Root 2',
          children: [
            AppTreeNode(
              id: '2-1',
              label: 'Child 2-1',
            ),
          ],
        ),
      ];

      complexNodes = [
        const AppTreeNode(
          id: 'folder1',
          label: 'Documents',
          icon: Icons.folder,
          children: [
            AppTreeNode(
              id: 'file1',
              label: 'document.pdf',
              icon: Icons.picture_as_pdf,
            ),
            AppTreeNode(
              id: 'file2',
              label: 'presentation.pptx',
              icon: Icons.slideshow,
            ),
          ],
        ),
        const AppTreeNode(
          id: 'folder2',
          label: 'Images',
          icon: Icons.folder,
          children: [
            AppTreeNode(
              id: 'img1',
              label: 'photo1.jpg',
              icon: Icons.image,
            ),
            AppTreeNode(
              id: 'img2',
              label: 'photo2.png',
              icon: Icons.image,
            ),
          ],
        ),
      ];
    });

    testWidgets('default tree appearance', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes,
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_default.png'),
      );
    });

    testWidgets('expanded tree with selected nodes', (tester) async {
      final expandedNodes = basicNodes.map((node) => node.copyWith(
        isExpanded: true,
        children: node.children.map((child) => child.copyWith(
          isExpanded: true,
          isSelected: child.id == '1-1',
        )).toList(),
      )).toList();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: expandedNodes,
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_expanded_selected.png'),
      );
    });

    testWidgets('multi-select variant with multiple selections', (tester) async {
      final multiSelectNodes = basicNodes.map((node) => node.copyWith(
        isExpanded: true,
        isSelected: node.id == '1',
        children: node.children.map((child) => child.copyWith(
          isSelected: child.id == '1-1' || child.id == '1-2',
        )).toList(),
      )).toList();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree.multiSelect(
                nodes: multiSelectNodes,
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_multi_select.png'),
      );
    });

    testWidgets('async variant with loading states', (tester) async {
      final asyncNodes = [
        const AppTreeNode(
          id: '1',
          label: 'Root with Children',
          isExpanded: true,
          children: [
            AppTreeNode(
              id: '1-1',
              label: 'Regular Child',
            ),
          ],
        ),
        const AppTreeNode(
          id: '2',
          label: 'Loading Node',
          isLoading: true,
        ),
        const AppTreeNode(
          id: '3',
          label: 'Async Parent',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree.async(
                nodes: asyncNodes,
                onToggle: (_) {},
                onSelect: (_, __) {},
                onAsyncLoad: (_) async => [],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_async_loading.png'),
      );
    });

    testWidgets('disabled nodes', (tester) async {
      final disabledNodes = basicNodes.map((node) => node.copyWith(
        isDisabled: node.id == '1',
        children: node.children.map((child) => child.copyWith(
          isDisabled: child.id == '1-1',
        )).toList(),
      )).toList();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: disabledNodes,
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_disabled.png'),
      );
    });

    testWidgets('complex tree with icons', (tester) async {
      final expandedComplexNodes = complexNodes.map((node) => node.copyWith(
        isExpanded: true,
      )).toList();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 350,
              height: 400,
              child: AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: expandedComplexNodes,
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_complex.png'),
      );
    });

    testWidgets('dark theme appearance', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes.map((node) => node.copyWith(
                  isExpanded: true,
                )).toList(),
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_dark_theme.png'),
      );
    });

    testWidgets('empty state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 400,
              child: AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: const [],
                onToggle: (_) {},
                onSelect: (_, __) {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_empty.png'),
      );
    });

    testWidgets('RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SizedBox(
                width: 300,
                height: 400,
                child: AppOutlineTree(
                  variant: AppOutlineTreeVariant.async,
                  nodes: basicNodes.map((node) => node.copyWith(
                    isExpanded: true,
                  )).toList(),
                  onToggle: (_) {},
                  onSelect: (_, __) {},
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppOutlineTree),
        matchesGoldenFile('golden/app_outline_tree_rtl.png'),
      );
    });
  });
}