import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppKanban Golden Tests', () {
    testWidgets('basic kanban layout', (tester) async {
      final config = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
            icon: Icons.assignment_outlined,
          ),
          AppKanbanColumn(
            id: 'inprogress',
            title: 'In Progress',
            icon: Icons.play_circle_outline,
          ),
          AppKanbanColumn(
            id: 'done',
            title: 'Done',
            icon: Icons.check_circle_outline,
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Design user interface',
            description: 'Create mockups and wireframes',
            columnId: 'todo',
          ),
          AppKanbanCard(
            id: 'card-2',
            title: 'Implement authentication',
            columnId: 'inprogress',
          ),
          AppKanbanCard(
            id: 'card-3',
            title: 'Setup database',
            columnId: 'done',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: AppKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppKanban),
        matchesGoldenFile('app_kanban_basic.png'),
      );
    });

    testWidgets('kanban with styled columns', (tester) async {
      final config = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        backgroundColor: Colors.grey.shade50,
        columns: [
          AppKanbanColumn(
            id: 'backlog',
            title: 'Backlog',
            icon: Icons.inventory_2_outlined,
            backgroundColor: Colors.blue.shade50,
          ),
          AppKanbanColumn(
            id: 'active',
            title: 'Active',
            icon: Icons.work_outline,
            backgroundColor: Colors.orange.shade50,
          ),
          AppKanbanColumn(
            id: 'complete',
            title: 'Complete',
            icon: Icons.check_circle_outline,
            backgroundColor: Colors.green.shade50,
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Epic: User Management System',
            description:
                'Comprehensive user management with roles and permissions',
            type: AppKanbanCardType.epic,
            priority: AppKanbanCardPriority.high,
            tags: ['epic', 'backend'],
            columnId: 'backlog',
          ),
          AppKanbanCard(
            id: 'card-2',
            title: 'Fix login bug',
            description:
                'Users cannot login with special characters in password',
            type: AppKanbanCardType.bug,
            priority: AppKanbanCardPriority.critical,
            tags: ['bug', 'auth'],
            columnId: 'active',
            backgroundColor: Colors.red.shade50,
          ),
          AppKanbanCard(
            id: 'card-3',
            title: 'Add user profile feature',
            type: AppKanbanCardType.feature,
            priority: AppKanbanCardPriority.medium,
            tags: ['feature', 'profile'],
            columnId: 'complete',
            backgroundColor: Colors.green.shade50,
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: AppKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppKanban),
        matchesGoldenFile('app_kanban_styled.png'),
      );
    });

    testWidgets('kanban with cards with due dates', (tester) async {
      final now =
          DateTime(2024, 1, 15); // Fixed date for consistent golden tests

      final config = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'urgent',
            title: 'Urgent',
            icon: Icons.warning_outlined,
          ),
          AppKanbanColumn(
            id: 'today',
            title: 'Today',
            icon: Icons.today_outlined,
          ),
          AppKanbanColumn(
            id: 'thisweek',
            title: 'This Week',
            icon: Icons.date_range_outlined,
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Critical bug fix',
            description: 'Production issue affecting all users',
            dueDate: now.subtract(const Duration(days: 1)), // Overdue
            columnId: 'urgent',
          ),
          AppKanbanCard(
            id: 'card-2',
            title: 'Deploy new features',
            description: 'Release version 2.0 to production',
            dueDate: now, // Today
            columnId: 'today',
          ),
          AppKanbanCard(
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
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: AppKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppKanban),
        matchesGoldenFile('app_kanban_due_dates.png'),
      );
    });

    testWidgets('empty kanban columns', (tester) async {
      final config = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'empty1',
            title: 'Empty Column 1',
            icon: Icons.inbox_outlined,
          ),
          AppKanbanColumn(
            id: 'empty2',
            title: 'Empty Column 2',
            icon: Icons.folder_outlined,
          ),
          AppKanbanColumn(
            id: 'withcard',
            title: 'With Card',
            icon: Icons.assignment_outlined,
          ),
        ],
        cards: [
          AppKanbanCard(
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
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: AppKanban(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppKanban),
        matchesGoldenFile('app_kanban_empty_columns.png'),
      );
    });

    testWidgets('kanban with many cards', (tester) async {
      final config = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'backlog',
            title: 'Backlog',
            icon: Icons.inventory_2_outlined,
          ),
        ],
        cards: List.generate(8, (index) {
          return AppKanbanCard(
            id: 'card-$index',
            title: 'Task ${index + 1}',
            description: 'Description for task ${index + 1}',
            type:
                index % 2 == 0 ? AppKanbanCardType.task : AppKanbanCardType.bug,
            priority: AppKanbanCardPriority.values[index % 4],
            columnId: 'backlog',
          );
        }),
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 600, // Fixed height to see scrolling
                child: AppKanban(config: config),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppKanban),
        matchesGoldenFile('app_kanban_many_cards.png'),
      );
    });

    group('Dark Theme', () {
      testWidgets('basic kanban in dark theme', (tester) async {
        final config = AppKanbanConfig(
          variant: AppKanbanVariant.dragDrop,
          columns: [
            AppKanbanColumn(
              id: 'todo',
              title: 'To Do',
              icon: Icons.assignment_outlined,
            ),
            AppKanbanColumn(
              id: 'done',
              title: 'Done',
              icon: Icons.check_circle_outline,
            ),
          ],
          cards: [
            AppKanbanCard(
              id: 'card-1',
              title: 'Design user interface',
              description: 'Create mockups and wireframes',
              columnId: 'todo',
            ),
            AppKanbanCard(
              id: 'card-2',
              title: 'Setup database',
              columnId: 'done',
            ),
          ],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.darkTheme,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: AppKanban(config: config),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppKanban),
          matchesGoldenFile('app_kanban_dark_theme.png'),
        );
      });
    });

    group('Responsive Layout', () {
      testWidgets('kanban on narrow screen', (tester) async {
        await tester.binding.setSurfaceSize(const Size(400, 600));

        final config = AppKanbanConfig(
          variant: AppKanbanVariant.dragDrop,
          columns: [
            AppKanbanColumn(
              id: 'todo',
              title: 'To Do',
              icon: Icons.assignment_outlined,
            ),
            AppKanbanColumn(
              id: 'inprogress',
              title: 'In Progress',
              icon: Icons.play_circle_outline,
            ),
            AppKanbanColumn(
              id: 'done',
              title: 'Done',
              icon: Icons.check_circle_outline,
            ),
          ],
          cards: [
            AppKanbanCard(
              id: 'card-1',
              title: 'Design user interface',
              columnId: 'todo',
            ),
            AppKanbanCard(
              id: 'card-2',
              title: 'Implement authentication',
              columnId: 'inprogress',
            ),
          ],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: AppKanban(config: config),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppKanban),
          matchesGoldenFile('app_kanban_narrow_screen.png'),
        );

        // Reset surface size
        await tester.binding.setSurfaceSize(null);
      });
    });
  });
}
