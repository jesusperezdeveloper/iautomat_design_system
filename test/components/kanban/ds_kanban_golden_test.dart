import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSKanban Golden Tests', () {
    testWidgets('basic kanban layout', (tester) async {
      final config = DSKanbanConfig(
        variant: DSKanbanVariant.dragDrop,
        columns: [
          DSKanbanColumn(
            id: 'todo',
            title: 'To Do',
            icon: Icons.assignment_outlined,
          ),
          DSKanbanColumn(
            id: 'inprogress',
            title: 'In Progress',
            icon: Icons.play_circle_outline,
          ),
          DSKanbanColumn(
            id: 'done',
            title: 'Done',
            icon: Icons.check_circle_outline,
          ),
        ],
        cards: [
          DSKanbanCard(
            id: 'card-1',
            title: 'Design user interface',
            description: 'Create mockups and wireframes',
            columnId: 'todo',
          ),
          DSKanbanCard(
            id: 'card-2',
            title: 'Implement authentication',
            columnId: 'inprogress',
          ),
          DSKanbanCard(
            id: 'card-3',
            title: 'Setup database',
            columnId: 'done',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSKanban),
        matchesGoldenFile('app_kanban_basic.png'),
      );
    });

    testWidgets('kanban with styled columns', (tester) async {
      final config = DSKanbanConfig(
        variant: DSKanbanVariant.dragDrop,
        backgroundColor: Colors.grey.shade50,
        columns: [
          DSKanbanColumn(
            id: 'backlog',
            title: 'Backlog',
            icon: Icons.inventory_2_outlined,
            backgroundColor: Colors.blue.shade50,
          ),
          DSKanbanColumn(
            id: 'active',
            title: 'Active',
            icon: Icons.work_outline,
            backgroundColor: Colors.orange.shade50,
          ),
          DSKanbanColumn(
            id: 'complete',
            title: 'Complete',
            icon: Icons.check_circle_outline,
            backgroundColor: Colors.green.shade50,
          ),
        ],
        cards: [
          DSKanbanCard(
            id: 'card-1',
            title: 'Epic: User Management System',
            description:
                'Comprehensive user management with roles and permissions',
            type: DSKanbanCardType.epic,
            priority: DSKanbanCardPriority.high,
            tags: ['epic', 'backend'],
            columnId: 'backlog',
          ),
          DSKanbanCard(
            id: 'card-2',
            title: 'Fix login bug',
            description:
                'Users cannot login with special characters in password',
            type: DSKanbanCardType.bug,
            priority: DSKanbanCardPriority.critical,
            tags: ['bug', 'auth'],
            columnId: 'active',
            backgroundColor: Colors.red.shade50,
          ),
          DSKanbanCard(
            id: 'card-3',
            title: 'Add user profile feature',
            type: DSKanbanCardType.feature,
            priority: DSKanbanCardPriority.medium,
            tags: ['feature', 'profile'],
            columnId: 'complete',
            backgroundColor: Colors.green.shade50,
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSKanban),
        matchesGoldenFile('app_kanban_styled.png'),
      );
    });

    testWidgets('kanban with cards with due dates', (tester) async {
      final now =
          DateTime(2024, 1, 15); // Fixed date for consistent golden tests

      final config = DSKanbanConfig(
        variant: DSKanbanVariant.dragDrop,
        columns: [
          DSKanbanColumn(
            id: 'urgent',
            title: 'Urgent',
            icon: Icons.warning_outlined,
          ),
          DSKanbanColumn(
            id: 'today',
            title: 'Today',
            icon: Icons.today_outlined,
          ),
          DSKanbanColumn(
            id: 'thisweek',
            title: 'This Week',
            icon: Icons.date_range_outlined,
          ),
        ],
        cards: [
          DSKanbanCard(
            id: 'card-1',
            title: 'Critical bug fix',
            description: 'Production issue affecting all users',
            dueDate: now.subtract(const Duration(days: 1)), // Overdue
            columnId: 'urgent',
          ),
          DSKanbanCard(
            id: 'card-2',
            title: 'Deploy new features',
            description: 'Release version 2.0 to production',
            dueDate: now, // Today
            columnId: 'today',
          ),
          DSKanbanCard(
            id: 'card-3',
            title: 'Update documentation',
            description: 'Refresh API docs and user guides',
            dueDate: now.add(const Duration(days: 3)), // Future
            columnId: 'thisweek',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSKanban),
        matchesGoldenFile('app_kanban_due_dates.png'),
      );
    });

    testWidgets('empty kanban columns', (tester) async {
      final config = DSKanbanConfig(
        variant: DSKanbanVariant.dragDrop,
        columns: [
          DSKanbanColumn(
            id: 'empty1',
            title: 'Empty Column 1',
            icon: Icons.inbox_outlined,
          ),
          DSKanbanColumn(
            id: 'empty2',
            title: 'Empty Column 2',
            icon: Icons.folder_outlined,
          ),
          DSKanbanColumn(
            id: 'withcard',
            title: 'With Card',
            icon: Icons.assignment_outlined,
          ),
        ],
        cards: [
          DSKanbanCard(
            id: 'card-1',
            title: 'Lonely card',
            description: 'The only card in its column',
            columnId: 'withcard',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSKanban),
        matchesGoldenFile('app_kanban_empty_columns.png'),
      );
    });

    testWidgets('kanban with many cards', (tester) async {
      final config = DSKanbanConfig(
        variant: DSKanbanVariant.dragDrop,
        columns: [
          DSKanbanColumn(
            id: 'backlog',
            title: 'Backlog',
            icon: Icons.inventory_2_outlined,
          ),
        ],
        cards: List.generate(8, (index) {
          return DSKanbanCard(
            id: 'card-$index',
            title: 'Task ${index + 1}',
            description: 'Description for task ${index + 1}',
            type:
                index % 2 == 0 ? DSKanbanCardType.task : DSKanbanCardType.bug,
            priority: DSKanbanCardPriority.values[index % 4],
            columnId: 'backlog',
          );
        }),
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 600, // Fixed height to see scrolling
                child: DSKanban(config: config),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSKanban),
        matchesGoldenFile('app_kanban_many_cards.png'),
      );
    });

    group('Dark Theme', () {
      testWidgets('basic kanban in dark theme', (tester) async {
        final config = DSKanbanConfig(
          variant: DSKanbanVariant.dragDrop,
          columns: [
            DSKanbanColumn(
              id: 'todo',
              title: 'To Do',
              icon: Icons.assignment_outlined,
            ),
            DSKanbanColumn(
              id: 'done',
              title: 'Done',
              icon: Icons.check_circle_outline,
            ),
          ],
          cards: [
            DSKanbanCard(
              id: 'card-1',
              title: 'Design user interface',
              description: 'Create mockups and wireframes',
              columnId: 'todo',
            ),
            DSKanbanCard(
              id: 'card-2',
              title: 'Setup database',
              columnId: 'done',
            ),
          ],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: DSTheme.darkTheme,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: DSKanban(config: config),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(DSKanban),
          matchesGoldenFile('app_kanban_dark_theme.png'),
        );
      });
    });

    group('Responsive Layout', () {
      testWidgets('kanban on narrow screen', (tester) async {
        await tester.binding.setSurfaceSize(const Size(400, 600));

        final config = DSKanbanConfig(
          variant: DSKanbanVariant.dragDrop,
          columns: [
            DSKanbanColumn(
              id: 'todo',
              title: 'To Do',
              icon: Icons.assignment_outlined,
            ),
            DSKanbanColumn(
              id: 'inprogress',
              title: 'In Progress',
              icon: Icons.play_circle_outline,
            ),
            DSKanbanColumn(
              id: 'done',
              title: 'Done',
              icon: Icons.check_circle_outline,
            ),
          ],
          cards: [
            DSKanbanCard(
              id: 'card-1',
              title: 'Design user interface',
              columnId: 'todo',
            ),
            DSKanbanCard(
              id: 'card-2',
              title: 'Implement authentication',
              columnId: 'inprogress',
            ),
          ],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: DSTheme.lightTheme,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: DSKanban(config: config),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(DSKanban),
          matchesGoldenFile('app_kanban_narrow_screen.png'),
        );

        // Reset surface size
        await tester.binding.setSurfaceSize(null);
      });
    });
  });
}
