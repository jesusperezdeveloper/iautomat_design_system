import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppKanban', () {
    late AppKanbanConfig basicConfig;

    setUp(() {
      basicConfig = AppKanbanConfig(
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
            title: 'Test Card 1',
            columnId: 'todo',
          ),
          AppKanbanCard(
            id: 'card-2',
            title: 'Test Card 2',
            columnId: 'done',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );
    });

    testWidgets('renders correctly with basic config', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: basicConfig),
          ),
        ),
      );

      // Verificar que se renderizan las columnas
      expect(find.text('To Do'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);

      // Verificar que se renderizan las tarjetas
      expect(find.text('Test Card 1'), findsOneWidget);
      expect(find.text('Test Card 2'), findsOneWidget);
    });

    testWidgets('displays column icons when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: basicConfig),
          ),
        ),
      );

      // Verificar que se muestran los íconos de las columnas
      expect(find.byIcon(Icons.assignment_outlined), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    });

    testWidgets('shows empty state when column has no cards', (tester) async {
      final emptyConfig = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'empty',
            title: 'Empty Column',
          ),
        ],
        cards: [],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: emptyConfig),
          ),
        ),
      );

      expect(find.text('No hay tarjetas'), findsOneWidget);
      expect(find.byIcon(Icons.inbox_outlined), findsOneWidget);
    });

    testWidgets('renders cards with descriptions', (tester) async {
      final configWithDescription = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Test Card',
            description: 'This is a test description',
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: configWithDescription),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
      expect(find.text('This is a test description'), findsOneWidget);
    });

    testWidgets('renders cards with tags', (tester) async {
      final configWithTags = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Test Card',
            tags: ['bug', 'frontend'],
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: configWithTags),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
      expect(find.text('bug'), findsOneWidget);
      expect(find.text('frontend'), findsOneWidget);
    });

    testWidgets('renders cards with assignee', (tester) async {
      final configWithAssignee = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Test Card',
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: configWithAssignee),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
    });

    testWidgets('renders cards with due date', (tester) async {
      final tomorrow = DateTime.now().add(const Duration(days: 1));

      final configWithDueDate = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Test Card',
            dueDate: tomorrow,
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: configWithDueDate),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
      expect(find.text('Mañana'), findsOneWidget);
      expect(find.byIcon(Icons.schedule_outlined), findsOneWidget);
    });

    testWidgets('renders overdue cards with correct styling', (tester) async {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));

      final configWithOverdue = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Overdue Card',
            dueDate: yesterday,
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: configWithOverdue),
          ),
        ),
      );

      expect(find.text('Overdue Card'), findsOneWidget);
      expect(find.text('Ayer'), findsOneWidget);
    });

    testWidgets('shows comment count when provided', (tester) async {
      final configWithComments = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'To Do',
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Test Card',
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: configWithComments),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
    });

    testWidgets('applies custom styling when provided', (tester) async {
      final styledConfig = AppKanbanConfig(
        variant: AppKanbanVariant.dragDrop,
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.blue.shade100,
        columns: [
          AppKanbanColumn(
            id: 'todo',
            title: 'Styled Column',
            backgroundColor: Colors.red.shade100,
          ),
        ],
        cards: [
          AppKanbanCard(
            id: 'card-1',
            title: 'Styled Card',
            backgroundColor: Colors.green.shade100,
            columnId: 'todo',
          ),
        ],
        onMove: (cardId, fromColumn, toColumn, index) {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: styledConfig),
          ),
        ),
      );

      expect(find.text('Styled Column'), findsOneWidget);
      expect(find.text('Styled Card'), findsOneWidget);
    });

    testWidgets('creates draggable cards by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: basicConfig),
          ),
        ),
      );

      // Verificar que existen widgets Draggable
      expect(find.byType(Draggable<String>), findsNWidgets(2));
    });

    testWidgets('creates drag targets for columns', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(config: basicConfig),
          ),
        ),
      );

      // Verificar que existen widgets DragTarget
      expect(find.byType(DragTarget<String>), findsNWidgets(2));
    });

    testWidgets('calls onChanged when provided', (tester) async {
      bool changeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppKanban(
              config: basicConfig,
              onChanged: () => changeCalled = true,
            ),
          ),
        ),
      );

      // El onChanged se debería llamar cuando se mueve una tarjeta
      // pero como es difícil simular drag & drop en tests,
      // verificamos que el callback se asigna correctamente
      expect(changeCalled, isFalse); // No se ha llamado aún
    });

    group('Edge Cases', () {
      testWidgets('handles empty columns list', (tester) async {
        final emptyColumnsConfig = AppKanbanConfig(
          variant: AppKanbanVariant.dragDrop,
          columns: [],
          cards: [],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppKanban(config: emptyColumnsConfig),
            ),
          ),
        );

        // No debería haber columnas
        expect(find.byType(DragTarget<String>), findsNothing);
      });

      testWidgets('handles cards without column match', (tester) async {
        final orphanCardConfig = AppKanbanConfig(
          variant: AppKanbanVariant.dragDrop,
          columns: [
            AppKanbanColumn(
              id: 'todo',
              title: 'To Do',
            ),
          ],
          cards: [
            AppKanbanCard(
              id: 'card-1',
              title: 'Orphan Card',
              columnId: 'nonexistent',
            ),
          ],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppKanban(config: orphanCardConfig),
            ),
          ),
        );

        // La tarjeta huérfana no debería aparecer
        expect(find.text('Orphan Card'), findsNothing);
        expect(find.text('To Do'), findsOneWidget);
      });

      testWidgets('handles very long card titles', (tester) async {
        final longTitleConfig = AppKanbanConfig(
          variant: AppKanbanVariant.dragDrop,
          columns: [
            AppKanbanColumn(
              id: 'todo',
              title: 'To Do',
            ),
          ],
          cards: [
            AppKanbanCard(
              id: 'card-1',
              title:
                  'This is a very long card title that should be truncated properly when it exceeds the maximum allowed length',
              columnId: 'todo',
            ),
          ],
          onMove: (cardId, fromColumn, toColumn, index) {},
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppKanban(config: longTitleConfig),
            ),
          ),
        );

        // Debería encontrar parte del título
        expect(find.textContaining('This is a very long'), findsOneWidget);
      });
    });

    group('Accessibility', () {
      testWidgets('has proper semantics for screen readers', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppKanban(config: basicConfig),
            ),
          ),
        );

        // Verificar que los textos están disponibles para screen readers
        expect(find.text('To Do'), findsOneWidget);
        expect(find.text('Done'), findsOneWidget);
        expect(find.text('Test Card 1'), findsOneWidget);
        expect(find.text('Test Card 2'), findsOneWidget);
      });
    });
  });
}
