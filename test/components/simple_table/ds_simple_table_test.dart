import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/simple_table/ds_simple_table.dart';
import 'package:iautomat_design_system/src/components/simple_table/simple_table_config.dart';

void main() {
  group('DSSimpleTable', () {
    late List<DSSimpleTableColumn> testColumns;
    late List<DSSimpleTableRow> testRows;

    setUp(() {
      testColumns = [
        const DSSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 200,
        ),
        const DSSimpleTableColumn(
          id: 'email',
          label: 'Email',
          field: 'email',
          width: 250,
        ),
        const DSSimpleTableColumn(
          id: 'age',
          label: 'Age',
          field: 'age',
          width: 100,
          cellType: DSSimpleTableCellType.number,
        ),
      ];

      testRows = [
        DSSimpleTableRow(
          id: '1',
          data: {
            'name': 'John Doe',
            'email': 'john@example.com',
            'age': 30,
          },
        ),
        DSSimpleTableRow(
          id: '2',
          data: {
            'name': 'Jane Smith',
            'email': 'jane@example.com',
            'age': 25,
          },
        ),
        DSSimpleTableRow(
          id: '3',
          data: {
            'name': 'Bob Johnson',
            'email': 'bob@example.com',
            'age': 35,
          },
        ),
      ];
    });

    testWidgets('renders standard variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: testColumns,
              rows: testRows,
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Age'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('jane@example.com'), findsOneWidget);
    });

    testWidgets('renders compact variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.compact(
              columns: testColumns,
              rows: testRows,
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Age'), findsOneWidget);
    });

    testWidgets('displays empty state when no rows provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: testColumns,
              rows: const [],
              emptyState: const DSSimpleTableEmptyState(
                message: 'No data available',
                icon: Icons.inbox,
              ),
            ),
          ),
        ),
      );

      expect(find.text('No data available'), findsOneWidget);
      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });

    testWidgets('handles row selection', (tester) async {
      String? lastSelectedRowId;
      bool? lastSelectionState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: testColumns,
              rows: testRows,
              selection: const DSSimpleTableSelection(
                mode: DSSimpleTableSelectionMode.single,
              ),
              onRowSelect: (row, selected) {
                lastSelectedRowId = row.id;
                lastSelectionState = selected;
              },
            ),
          ),
        ),
      );

      // Find and tap the first row
      await tester.tap(find.text('John Doe'));
      await tester.pump();

      expect(lastSelectedRowId, equals('1'));
      expect(lastSelectionState, isTrue);
    });

    testWidgets('handles multiple row selection', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: testColumns,
              rows: testRows,
              selection: const DSSimpleTableSelection(
                mode: DSSimpleTableSelectionMode.multiple,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
    });

    testWidgets('handles sorting configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: [
                const DSSimpleTableColumn(
                  id: 'name',
                  label: 'Name',
                  field: 'name',
                  sortable: true,
                ),
              ],
              rows: testRows,
              sorting: const DSSimpleTableSort(
                columnId: 'name',
                direction: DSSimpleTableSortDirection.ascending,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
    });

    testWidgets('respects column visibility settings', (tester) async {
      final columnsWithHidden = [
        const DSSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          visible: true,
        ),
        const DSSimpleTableColumn(
          id: 'email',
          label: 'Email',
          field: 'email',
          visible: false,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: columnsWithHidden,
              rows: testRows,
            ),
          ),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsNothing);
    });

    testWidgets('handles custom cell builders', (tester) async {
      final customColumns = [
        DSSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          cellBuilder: (context, column, row, value) {
            return Text('Custom: $value');
          },
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: customColumns,
              rows: [testRows.first],
            ),
          ),
        ),
      );

      expect(find.text('Custom: John Doe'), findsOneWidget);
    });

    testWidgets('handles custom header builders', (tester) async {
      final customColumns = [
        DSSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          headerBuilder: (context, column) {
            return Text('Header: ${column.label}');
          },
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: customColumns,
              rows: testRows,
            ),
          ),
        ),
      );

      expect(find.text('Header: Name'), findsOneWidget);
    });

    testWidgets('respects RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
    });

    testWidgets('handles horizontal scrolling', (tester) async {
      final scrollController = ScrollController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: testColumns,
              rows: testRows,
              horizontalScrollController: scrollController,
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
      scrollController.dispose();
    });

    testWidgets('handles vertical scrolling', (tester) async {
      final scrollController = ScrollController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSimpleTable.standard(
              columns: testColumns,
              rows: testRows,
              verticalScrollController: scrollController,
            ),
          ),
        ),
      );

      expect(find.byType(DSSimpleTable), findsOneWidget);
      scrollController.dispose();
    });

    group('DSSimpleTableConfig', () {
      test('creates config with default values', () {
        const config = DSSimpleTableConfig();

        expect(config.variant, DSSimpleTableVariant.standard);
        expect(config.showHeaders, true);
        expect(config.showRowDividers, true);
        expect(config.showColumnDividers, false);
        expect(config.alternateRowColors, false);
        expect(config.showHoverEffects, true);
        expect(config.borderRadius, 8.0);
        expect(config.rowHeight, 48.0);
        expect(config.headerHeight, 56.0);
      });

      test('creates config with custom values', () {
        const config = DSSimpleTableConfig(
          variant: DSSimpleTableVariant.compact,
          showHeaders: false,
          showRowDividers: false,
          showColumnDividers: true,
          alternateRowColors: true,
          showHoverEffects: false,
          borderRadius: 12.0,
          rowHeight: 40.0,
          headerHeight: 48.0,
        );

        expect(config.variant, DSSimpleTableVariant.compact);
        expect(config.showHeaders, false);
        expect(config.showRowDividers, false);
        expect(config.showColumnDividers, true);
        expect(config.alternateRowColors, true);
        expect(config.showHoverEffects, false);
        expect(config.borderRadius, 12.0);
        expect(config.rowHeight, 40.0);
        expect(config.headerHeight, 48.0);
      });
    });

    group('DSSimpleTableColumn', () {
      test('creates column with required fields', () {
        const column = DSSimpleTableColumn(
          id: 'test',
          label: 'Test Column',
          field: 'test_field',
        );

        expect(column.id, 'test');
        expect(column.label, 'Test Column');
        expect(column.field, 'test_field');
        expect(column.flex, 1);
        expect(column.sortable, false);
        expect(column.visible, true);
        expect(column.alignment, DSSimpleTableColumnAlignment.left);
        expect(column.cellType, DSSimpleTableCellType.text);
      });

      test('has correct effective alignment for RTL', () {
        const column = DSSimpleTableColumn(
          id: 'test',
          label: 'Test',
          field: 'test',
          alignment: DSSimpleTableColumnAlignment.left,
        );

        expect(
          column.getEffectiveAlignment(TextDirection.ltr),
          DSSimpleTableColumnAlignment.left,
        );
        expect(
          column.getEffectiveAlignment(TextDirection.rtl),
          DSSimpleTableColumnAlignment.right,
        );
      });
    });

    group('DSSimpleTableRow', () {
      test('creates row with data', () {
        final row = DSSimpleTableRow(
          id: 'test',
          data: {'name': 'Test', 'value': 123},
        );

        expect(row.id, 'test');
        expect(row.data['name'], 'Test');
        expect(row.data['value'], 123);
        expect(row.selected, false);
        expect(row.disabled, false);
        expect(row.visible, true);
        expect(row.state, DSSimpleTableRowState.normal);
      });
    });

    group('DSSimpleTableSelection', () {
      test('creates selection config with defaults', () {
        const selection = DSSimpleTableSelection();

        expect(selection.mode, DSSimpleTableSelectionMode.none);
        expect(selection.selectedRows, isEmpty);
        expect(selection.showCheckboxes, true);
        expect(selection.allowSelectAll, true);
        expect(selection.maxSelections, isNull);
      });
    });

    group('DSSimpleTableSort', () {
      test('creates sort config with defaults', () {
        const sort = DSSimpleTableSort();

        expect(sort.columnId, isNull);
        expect(sort.direction, DSSimpleTableSortDirection.none);
      });
    });

    group('DSSimpleTableEmptyState', () {
      test('creates empty state with defaults', () {
        const emptyState = DSSimpleTableEmptyState();

        expect(emptyState.message, 'No data available');
        expect(emptyState.icon, isNull);
        expect(emptyState.illustration, isNull);
        expect(emptyState.action, isNull);
        expect(emptyState.show, true);
      });
    });
  });
}
