import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/simple_table/app_simple_table.dart';
import 'package:iautomat_design_system/src/components/simple_table/simple_table_config.dart';

void main() {
  group('AppSimpleTable Golden Tests', () {
    late List<AppSimpleTableColumn> testColumns;
    late List<AppSimpleTableRow> testRows;

    setUp(() {
      testColumns = [
        const AppSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 150,
        ),
        const AppSimpleTableColumn(
          id: 'email',
          label: 'Email',
          field: 'email',
          width: 200,
        ),
        const AppSimpleTableColumn(
          id: 'role',
          label: 'Role',
          field: 'role',
          width: 120,
        ),
        const AppSimpleTableColumn(
          id: 'status',
          label: 'Status',
          field: 'status',
          width: 100,
        ),
      ];

      testRows = [
        AppSimpleTableRow(
          id: '1',
          data: {
            'name': 'John Doe',
            'email': 'john@example.com',
            'role': 'Admin',
            'status': 'Active',
          },
        ),
        AppSimpleTableRow(
          id: '2',
          data: {
            'name': 'Jane Smith',
            'email': 'jane@example.com',
            'role': 'User',
            'status': 'Pending',
          },
        ),
        AppSimpleTableRow(
          id: '3',
          data: {
            'name': 'Bob Johnson',
            'email': 'bob@example.com',
            'role': 'Moderator',
            'status': 'Inactive',
          },
        ),
      ];
    });

    testWidgets('Standard variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_standard.png'),
      );
    });

    testWidgets('Compact variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 250,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.compact(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_compact.png'),
      );
    });

    testWidgets('Table with selection golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 650,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
                selection: const AppSimpleTableSelection(
                  mode: AppSimpleTableSelectionMode.multiple,
                  selectedRows: ['1', '3'],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_with_selection.png'),
      );
    });

    testWidgets('Table with sorting golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: [
                  const AppSimpleTableColumn(
                    id: 'name',
                    label: 'Name',
                    field: 'name',
                    width: 150,
                    sortable: true,
                  ),
                  const AppSimpleTableColumn(
                    id: 'email',
                    label: 'Email',
                    field: 'email',
                    width: 200,
                    sortable: true,
                  ),
                  const AppSimpleTableColumn(
                    id: 'role',
                    label: 'Role',
                    field: 'role',
                    width: 120,
                  ),
                ],
                rows: testRows,
                sorting: const AppSimpleTableSort(
                  columnId: 'name',
                  direction: AppSimpleTableSortDirection.ascending,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_with_sorting.png'),
      );
    });

    testWidgets('Empty state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: const [],
                emptyState: const AppSimpleTableEmptyState(
                  message: 'No data available',
                  icon: Icons.table_chart_outlined,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_empty_state.png'),
      );
    });

    testWidgets('Table without headers golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 250,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
                config: const AppSimpleTableConfig(
                  showHeaders: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_no_headers.png'),
      );
    });

    testWidgets('Table with alternating row colors golden test',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
                config: const AppSimpleTableConfig(
                  alternateRowColors: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_alternate_colors.png'),
      );
    });

    testWidgets('Table without row dividers golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
                config: const AppSimpleTableConfig(
                  showRowDividers: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_no_dividers.png'),
      );
    });

    testWidgets('Table with column dividers golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
                config: const AppSimpleTableConfig(
                  showColumnDividers: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_column_dividers.png'),
      );
    });

    testWidgets('Table with custom row height golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 350,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
                config: const AppSimpleTableConfig(
                  rowHeight: 60.0,
                  headerHeight: 70.0,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_custom_height.png'),
      );
    });

    testWidgets('Table with hidden columns golden test', (tester) async {
      final customColumns = [
        const AppSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 150,
          visible: true,
        ),
        const AppSimpleTableColumn(
          id: 'email',
          label: 'Email',
          field: 'email',
          width: 200,
          visible: false,
        ),
        const AppSimpleTableColumn(
          id: 'role',
          label: 'Role',
          field: 'role',
          width: 120,
          visible: true,
        ),
        const AppSimpleTableColumn(
          id: 'status',
          label: 'Status',
          field: 'status',
          width: 100,
          visible: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 500,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: customColumns,
                rows: testRows,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_hidden_columns.png'),
      );
    });

    testWidgets('Table with different column alignments golden test',
        (tester) async {
      final alignmentColumns = [
        const AppSimpleTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 150,
          alignment: AppSimpleTableColumnAlignment.left,
        ),
        const AppSimpleTableColumn(
          id: 'email',
          label: 'Email',
          field: 'email',
          width: 200,
          alignment: AppSimpleTableColumnAlignment.center,
        ),
        const AppSimpleTableColumn(
          id: 'role',
          label: 'Role',
          field: 'role',
          width: 120,
          alignment: AppSimpleTableColumnAlignment.right,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 500,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: alignmentColumns,
                rows: testRows,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_column_alignments.png'),
      );
    });

    testWidgets('Table in RTL layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Container(
                width: 600,
                height: 300,
                padding: const EdgeInsets.all(16),
                child: AppSimpleTable.standard(
                  columns: testColumns,
                  rows: testRows,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_rtl.png'),
      );
    });

    testWidgets('Dark theme table golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_dark_theme.png'),
      );
    });

    testWidgets('Table with disabled row golden test', (tester) async {
      final disabledRows = [
        AppSimpleTableRow(
          id: '1',
          data: {
            'name': 'John Doe',
            'email': 'john@example.com',
            'role': 'Admin',
            'status': 'Active',
          },
        ),
        AppSimpleTableRow(
          id: '2',
          data: {
            'name': 'Jane Smith',
            'email': 'jane@example.com',
            'role': 'User',
            'status': 'Pending',
          },
          disabled: true,
        ),
        AppSimpleTableRow(
          id: '3',
          data: {
            'name': 'Bob Johnson',
            'email': 'bob@example.com',
            'role': 'Moderator',
            'status': 'Inactive',
          },
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(16),
              child: AppSimpleTable.standard(
                columns: testColumns,
                rows: disabledRows,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppSimpleTable),
        matchesGoldenFile('goldens/simple_table_disabled_row.png'),
      );
    });
  });
}
