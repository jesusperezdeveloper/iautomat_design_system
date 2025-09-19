import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/menu/app_menu.dart';

void main() {
  group('DSMenu Golden Tests', () {
    final testItems = [
      const DSMenuItem(
        id: 'new',
        label: 'Nuevo',
        icon: Icons.add,
        shortcut: 'Ctrl+N',
      ),
      const DSMenuItem(
        id: 'open',
        label: 'Abrir',
        icon: Icons.folder_open,
        shortcut: 'Ctrl+O',
      ),
      const DSMenuItem(
        id: 'save',
        label: 'Guardar',
        icon: Icons.save,
        shortcut: 'Ctrl+S',
        selected: true,
      ),
      const DSMenuItem(
        id: 'divider',
        label: '',
        showDividerBefore: true,
      ),
      const DSMenuItem(
        id: 'disabled',
        label: 'Deshabilitado',
        icon: Icons.block,
        enabled: false,
      ),
      const DSMenuItem(
        id: 'delete',
        label: 'Eliminar',
        icon: Icons.delete,
        destructive: true,
      ),
    ];

    final submenuItems = [
      const DSMenuItem(
        id: 'cut',
        label: 'Cortar',
        icon: Icons.cut,
      ),
      const DSMenuItem(
        id: 'copy',
        label: 'Copiar',
        icon: Icons.copy,
      ),
      const DSMenuItem(
        id: 'paste',
        label: 'Pegar',
        icon: Icons.paste,
      ),
    ];

    final typeaheadItems = [
      const DSMenuItem(
        id: 'user1',
        label: 'Juan Pérez',
        icon: Icons.person,
      ),
      const DSMenuItem(
        id: 'user2',
        label: 'María García',
        icon: Icons.person,
      ),
      const DSMenuItem(
        id: 'team1',
        label: 'Equipo Frontend',
        icon: Icons.group,
      ),
    ];

    testWidgets('context menu golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: 250,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: DSMenu.context(
                  items: testItems,
                  onSelected: (item) {},
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_context.png'),
      );
    });

    testWidgets('submenu golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: DSMenu.submenu(
                  items: submenuItems,
                  onSelected: (item) {},
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_submenu.png'),
      );
    });

    testWidgets('typeahead menu golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: 280,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: DSMenu.typeahead(
                  items: typeaheadItems,
                  onSelected: (item) {},
                  searchPlaceholder: 'Buscar usuarios...',
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_typeahead.png'),
      );
    });

    testWidgets('menu states golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                // Default state
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Default')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 150,
                              child: DSMenu.context(
                                items: submenuItems,
                                onSelected: (item) {},
                                state: DSMenuState.defaultState,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Loading')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 150,
                              child: DSMenu.context(
                                items: submenuItems,
                                onSelected: (item) {},
                                state: DSMenuState.loading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Skeleton state
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Skeleton')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 150,
                              child: DSMenu.context(
                                items: submenuItems,
                                onSelected: (item) {},
                                state: DSMenuState.skeleton,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Disabled')),
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              height: 150,
                              child: DSMenu.context(
                                items: submenuItems,
                                onSelected: (item) {},
                                state: DSMenuState.disabled,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_states.png'),
      );
    });

    testWidgets('custom styling golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                // Custom colors
                Expanded(
                  child: Stack(
                    children: [
                      const Center(child: Text('Custom Colors')),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 8,
                        height: 200,
                        child: DSMenu.context(
                          items: submenuItems,
                          onSelected: (item) {},
                          backgroundColor: Colors.blue[50],
                          textColor: Colors.blue[800],
                          iconColor: Colors.blue[600],
                          hoverColor: Colors.blue[100],
                          selectedColor: Colors.blue[200],
                        ),
                      ),
                    ],
                  ),
                ),
                // Custom dimensions
                Expanded(
                  child: Stack(
                    children: [
                      const Center(child: Text('Custom Styling')),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 8,
                        height: 200,
                        child: DSMenu.context(
                          items: submenuItems,
                          onSelected: (item) {},
                          elevation: 16,
                          borderRadius: 16,
                          itemHeight: 56,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_custom_styling.png'),
      );
    });

    testWidgets('dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[600]!),
                ),
                child: DSMenu.context(
                  items: testItems.take(4).toList(),
                  onSelected: (item) {},
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_dark_theme.png'),
      );
    });

    testWidgets('rtl layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: DSMenu.context(
                    items: testItems.take(4).toList(),
                    onSelected: (item) {},
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_rtl.png'),
      );
    });

    testWidgets('empty state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: DSMenu.typeahead(
                  items: const [],
                  onSelected: (item) {},
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_empty.png'),
      );
    });

    testWidgets('alignment variants golden test', (tester) async {
      final simpleItems = [
        const DSMenuItem(id: '1', label: 'Opción 1'),
        const DSMenuItem(id: '2', label: 'Opción 2'),
        const DSMenuItem(id: '3', label: 'Opción 3'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                // Top alignments
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Top Left')),
                            Positioned(
                              left: 20,
                              top: 20,
                              width: 140,
                              height: 120,
                              child: DSMenu.context(
                                items: simpleItems,
                                onSelected: (item) {},
                                alignment: MenuAlignment.topLeft,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Top Right')),
                            Positioned(
                              right: 20,
                              top: 20,
                              width: 140,
                              height: 120,
                              child: DSMenu.context(
                                items: simpleItems,
                                onSelected: (item) {},
                                alignment: MenuAlignment.topRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom alignments
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Bottom Left')),
                            Positioned(
                              left: 20,
                              bottom: 20,
                              width: 140,
                              height: 120,
                              child: DSMenu.context(
                                items: simpleItems,
                                onSelected: (item) {},
                                alignment: MenuAlignment.bottomLeft,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            const Center(child: Text('Center')),
                            Positioned(
                              left: 55,
                              top: 40,
                              width: 140,
                              height: 120,
                              child: DSMenu.context(
                                items: simpleItems,
                                onSelected: (item) {},
                                alignment: MenuAlignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_menu_alignments.png'),
      );
    });
  });
}