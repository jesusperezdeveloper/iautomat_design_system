import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/menu/ds_menu.dart';

void main() {
  group('DSMenu', () {
    late List<DSMenuItem> testItems;

    setUp(() {
      testItems = [
        const DSMenuItem(
          id: 'item1',
          label: 'Item 1',
          icon: Icons.star,
        ),
        const DSMenuItem(
          id: 'item2',
          label: 'Item 2',
          icon: Icons.favorite,
          enabled: false,
        ),
        const DSMenuItem(
          id: 'item3',
          label: 'Item 3',
          icon: Icons.home,
          selected: true,
        ),
        const DSMenuItem(
          id: 'item4',
          label: 'Item 4',
          destructive: true,
        ),
        const DSMenuItem(
          id: 'submenu',
          label: 'Submenu',
          children: [
            DSMenuItem(id: 'sub1', label: 'Sub Item 1'),
            DSMenuItem(id: 'sub2', label: 'Sub Item 2'),
          ],
        ),
      ];
    });

    testWidgets('renders context menu correctly', (tester) async {
      bool itemSelected = false;
      DSMenuItem? selectedItem;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {
                itemSelected = true;
                selectedItem = item;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMenu), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);

      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();

      expect(itemSelected, isTrue);
      expect(selectedItem?.id, equals('item1'));
    });

    testWidgets('renders submenu menu correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.submenu(
              items: testItems,
              onSelected: (item) {},
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMenu), findsOneWidget);
      expect(find.text('Submenu'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('renders typeahead menu with search correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.typeahead(
              items: testItems,
              onSelected: (item) {},
              searchPlaceholder: 'Search items...',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMenu), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search items...'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('filters items based on search query', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.typeahead(
              items: testItems,
              onSelected: (item) {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Initially all items should be visible
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);

      // Enter search query
      await tester.enterText(find.byType(TextField), 'Item 1');
      await tester.pump();

      // Check that only matching items are in menu (excluding search field)
      final menuItems = find.descendant(
        of: find.byType(ListView),
        matching: find.textContaining('Item'),
      );
      expect(menuItems, findsOneWidget);

      // Verify the search filtered correctly by checking non-matching items are gone
      final item2InMenu = find.descendant(
        of: find.byType(ListView),
        matching: find.text('Item 2'),
      );
      expect(item2InMenu, findsNothing);
    });

    testWidgets('handles disabled items correctly', (tester) async {
      bool itemSelected = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {
                itemSelected = true;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      // Try to tap disabled item
      await tester.tap(find.text('Item 2'));
      await tester.pumpAndSettle();

      expect(itemSelected, isFalse);
    });

    testWidgets('handles destructive items with correct styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Find the destructive item
      final destructiveItemFinder = find.text('Item 4');
      expect(destructiveItemFinder, findsOneWidget);

      // Check if it has error color styling
      final textWidget = tester.widget<Text>(destructiveItemFinder);
      final colorScheme = Theme.of(tester.element(destructiveItemFinder)).colorScheme;
      expect(textWidget.style?.color, equals(colorScheme.error));
    });

    testWidgets('shows selected state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Find the selected item
      final selectedItemFinder = find.text('Item 3');
      expect(selectedItemFinder, findsOneWidget);

      // Check if it has selected styling (bold text)
      final textWidget = tester.widget<Text>(selectedItemFinder);
      expect(textWidget.style?.fontWeight, equals(FontWeight.w500));
    });

    testWidgets('handles keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              enableKeyboardNavigation: true,
            ),
          ),
        ),
      );

      await tester.pump();

      // Send arrow down key
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();

      // Send arrow up key
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      // Send escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();

      // No exceptions should be thrown
      expect(find.byType(DSMenu), findsOneWidget);
    });

    testWidgets('calls state change callback', (tester) async {
      DSMenuState? lastState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              onStateChanged: (state) {
                lastState = state;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      // Simulate hover by finding the InkWell and triggering onHover
      final inkWell = tester.widget<InkWell>(find.byType(InkWell).first);
      inkWell.onHover?.call(true);
      await tester.pump();

      expect(lastState, equals(DSMenuState.hover));
    });

    testWidgets('calls visibility change callback', (tester) async {
      bool? lastVisibility;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              onVisibilityChanged: (visible) {
                lastVisibility = visible;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(lastVisibility, isTrue);
    });

    testWidgets('supports custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              backgroundColor: Colors.red,
              textColor: Colors.blue,
              iconColor: Colors.green,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMenu), findsOneWidget);
    });

    testWidgets('supports custom dimensions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              minWidth: 100,
              maxWidth: 400,
              maxHeight: 500,
              itemHeight: 60,
              elevation: 12,
              borderRadius: 16,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMenu), findsOneWidget);
    });

    testWidgets('handles loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              state: DSMenuState.loading,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Item 1'), findsNothing);
    });

    testWidgets('handles skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.context(
              items: testItems,
              onSelected: (item) {},
              state: DSMenuState.skeleton,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Item 1'), findsNothing);
      // Skeleton containers should be present
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles empty items list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.typeahead(
              items: const [],
              onSelected: (item) {},
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('No se encontraron elementos'), findsOneWidget);
    });

    testWidgets('handles search change callback', (tester) async {
      String? lastQuery;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSMenu.typeahead(
              items: testItems,
              onSelected: (item) {},
              onSearchChanged: (query) {
                lastQuery = query;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      await tester.enterText(find.byType(TextField), 'test query');
      await tester.pump();

      expect(lastQuery, equals('test query'));
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSMenu.context(
                items: testItems,
                onSelected: (item) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSMenu), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
    });

    testWidgets('shows menu overlay correctly', (tester) async {
      bool itemSelected = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSMenu.showMenu(
                    context: context,
                    position: const Offset(100, 100),
                    menu: DSMenu.context(
                      items: testItems,
                      onSelected: (item) {
                        itemSelected = true;
                      },
                    ),
                  );
                },
                child: const Text('Show Menu'),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Tap to show menu
      await tester.tap(find.text('Show Menu'));
      await tester.pump();

      expect(find.text('Item 1'), findsOneWidget);

      // Tap on menu item
      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();

      expect(itemSelected, isTrue);
    });

    group('DSMenuItem', () {
      test('creates item with required properties', () {
        const item = DSMenuItem(
          id: 'test',
          label: 'Test Item',
        );

        expect(item.id, equals('test'));
        expect(item.label, equals('Test Item'));
        expect(item.enabled, isTrue);
        expect(item.selected, isFalse);
        expect(item.destructive, isFalse);
        expect(item.hasChildren, isFalse);
      });

      test('creates item with children', () {
        const item = DSMenuItem(
          id: 'parent',
          label: 'Parent Item',
          children: [
            DSMenuItem(id: 'child1', label: 'Child 1'),
            DSMenuItem(id: 'child2', label: 'Child 2'),
          ],
        );

        expect(item.hasChildren, isTrue);
        expect(item.children.length, equals(2));
        expect(item.children[0].label, equals('Child 1'));
      });

      test('creates item with all optional properties', () {
        const item = DSMenuItem(
          id: 'full',
          label: 'Full Item',
          icon: Icons.star,
          trailingIcon: Icons.arrow_forward,
          enabled: false,
          selected: true,
          showDividerBefore: true,
          tooltip: 'Test tooltip',
          shortcut: 'Ctrl+T',
          color: Colors.red,
          destructive: true,
        );

        expect(item.icon, equals(Icons.star));
        expect(item.trailingIcon, equals(Icons.arrow_forward));
        expect(item.enabled, isFalse);
        expect(item.selected, isTrue);
        expect(item.showDividerBefore, isTrue);
        expect(item.tooltip, equals('Test tooltip'));
        expect(item.shortcut, equals('Ctrl+T'));
        expect(item.color, equals(Colors.red));
        expect(item.destructive, isTrue);
      });
    });

    group('MenuAlignment', () {
      test('contains all expected values', () {
        const alignments = MenuAlignment.values;
        expect(alignments.length, equals(5));
        expect(alignments.contains(MenuAlignment.topLeft), isTrue);
        expect(alignments.contains(MenuAlignment.topRight), isTrue);
        expect(alignments.contains(MenuAlignment.bottomLeft), isTrue);
        expect(alignments.contains(MenuAlignment.bottomRight), isTrue);
        expect(alignments.contains(MenuAlignment.center), isTrue);
      });
    });

    group('DSMenuState', () {
      test('contains all expected values', () {
        const states = DSMenuState.values;
        expect(states.length, equals(8));
        expect(states.contains(DSMenuState.defaultState), isTrue);
        expect(states.contains(DSMenuState.hover), isTrue);
        expect(states.contains(DSMenuState.pressed), isTrue);
        expect(states.contains(DSMenuState.focus), isTrue);
        expect(states.contains(DSMenuState.selected), isTrue);
        expect(states.contains(DSMenuState.disabled), isTrue);
        expect(states.contains(DSMenuState.loading), isTrue);
        expect(states.contains(DSMenuState.skeleton), isTrue);
      });
    });

    group('MenuVariant', () {
      test('contains all expected values', () {
        const variants = MenuVariant.values;
        expect(variants.length, equals(3));
        expect(variants.contains(MenuVariant.context), isTrue);
        expect(variants.contains(MenuVariant.submenu), isTrue);
        expect(variants.contains(MenuVariant.typeahead), isTrue);
      });
    });
  });
}