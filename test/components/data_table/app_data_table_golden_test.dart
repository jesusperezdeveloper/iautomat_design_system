import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppDataTable Golden Tests', () {
    late List<AppDataTableColumn> basicColumns;
    late List<AppDataTableRow> basicRows;
    late List<AppDataTableColumn> complexColumns;
    late List<AppDataTableRow> complexRows;

    setUp(() {
      basicColumns = [
        const AppDataTableColumn(
          id: 'id',
          label: 'ID',
          field: 'id',
          width: 80,
          sortable: true,
          cellType: AppDataTableCellType.number,
          alignment: AppDataTableColumnAlignment.center,
        ),
        const AppDataTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 200,
          sortable: true,
          editable: true,
          cellType: AppDataTableCellType.text,
        ),
        const AppDataTableColumn(
          id: 'email',
          label: 'Email',
          field: 'email',
          width: 250,
          sortable: true,
          cellType: AppDataTableCellType.text,
        ),
        const AppDataTableColumn(
          id: 'active',
          label: 'Active',
          field: 'active',
          width: 100,
          sortable: true,
          cellType: AppDataTableCellType.boolean,
          alignment: AppDataTableColumnAlignment.center,
        ),
      ];

      basicRows = [
        const AppDataTableRow(
          id: '1',
          data: {
            'id': 1,
            'name': 'John Doe',
            'email': 'john.doe@example.com',
            'active': true,
          },
        ),
        const AppDataTableRow(
          id: '2',
          data: {
            'id': 2,
            'name': 'Jane Smith',
            'email': 'jane.smith@example.com',
            'active': false,
          },
        ),
        const AppDataTableRow(
          id: '3',
          data: {
            'id': 3,
            'name': 'Bob Johnson',
            'email': 'bob.johnson@example.com',
            'active': true,
          },
        ),
      ];

      complexColumns = [
        const AppDataTableColumn(
          id: 'employee_id',
          label: 'ID',
          field: 'employee_id',
          width: 100,
          sortable: true,
          cellType: AppDataTableCellType.text,
        ),
        const AppDataTableColumn(
          id: 'name',
          label: 'Full Name',
          field: 'name',
          width: 200,
          sortable: true,
          editable: true,
          cellType: AppDataTableCellType.text,
        ),
        const AppDataTableColumn(
          id: 'department',
          label: 'Department',
          field: 'department',
          width: 150,
          sortable: true,
          cellType: AppDataTableCellType.text,
        ),
        const AppDataTableColumn(
          id: 'salary',
          label: 'Salary',
          field: 'salary',
          width: 120,
          sortable: true,
          cellType: AppDataTableCellType.number,
          alignment: AppDataTableColumnAlignment.right,
        ),
        const AppDataTableColumn(
          id: 'manager',
          label: 'Manager',
          field: 'manager',
          width: 100,
          sortable: true,
          cellType: AppDataTableCellType.boolean,
          alignment: AppDataTableColumnAlignment.center,
        ),
      ];

      complexRows = [
        const AppDataTableRow(
          id: 'emp1',
          data: {
            'employee_id': 'EMP001',
            'name': 'Alice Johnson',
            'department': 'Engineering',
            'salary': 95000,
            'manager': false,
          },
        ),
        const AppDataTableRow(
          id: 'emp2',
          data: {
            'employee_id': 'EMP002',
            'name': 'Bob Smith',
            'department': 'Marketing',
            'salary': 75000,
            'manager': true,
          },
          selected: true,
        ),
        const AppDataTableRow(
          id: 'emp3',
          data: {
            'employee_id': 'EMP003',
            'name': 'Carol Williams',
            'department': 'Sales',
            'salary': 85000,
            'manager': false,
          },
        ),
        const AppDataTableRow(
          id: 'emp4',
          data: {
            'employee_id': 'EMP004',
            'name': 'David Brown',
            'department': 'HR',
            'salary': 65000,
            'manager': false,
          },
          disabled: true,
        ),
      ];
    });

    testWidgets('default data table appearance', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_default.png'),
      );
    });

    testWidgets('resizable columns variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable.resizable(
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  resizeConfig: AppDataTableResizeConfig(
                    enabled: true,
                    showOnHover: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_resizable.png'),
      );
    });

    testWidgets('pinned columns variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable.pinned(
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  freezeConfig: AppDataTableFreezeConfig(
                    leftColumns: 1,
                    rightColumns: 1,
                    showDividers: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_pinned.png'),
      );
    });

    testWidgets('inline edit variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable.inlineEdit(
                columns: basicColumns,
                rows: basicRows,
                onEdit: (row, columnId, newValue) {},
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  editMode: AppDataTableEditMode.cell,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_inline_edit.png'),
      );
    });

    testWidgets('table with selection enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: complexColumns,
                rows: complexRows,
                selection: const AppDataTableSelection(
                  mode: AppDataTableSelectionMode.multiple,
                  showCheckboxes: true,
                  allowSelectAll: true,
                ),
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  alternateRowColors: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_with_selection.png'),
      );
    });

    testWidgets('table with sorting indicators', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                sorting: const AppDataTableSort(
                  columnId: 'name',
                  direction: AppDataTableSortDirection.ascending,
                ),
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_sorted.png'),
      );
    });

    testWidgets('table with row numbers', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  showRowNumbers: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_with_row_numbers.png'),
      );
    });

    testWidgets('dense table layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: complexColumns,
                rows: complexRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  density: AppDataTableDensity.compact,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_dense.png'),
      );
    });

    testWidgets('comfortable table layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  density: AppDataTableDensity.comfortable,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_comfortable.png'),
      );
    });

    testWidgets('table with column dividers', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  showColumnDividers: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_with_column_dividers.png'),
      );
    });

    testWidgets('dark theme appearance', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  alternateRowColors: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_dark_theme.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showLoading: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_loading.png'),
      );
    });

    testWidgets('skeleton loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: const [],
                config: const AppDataTableConfig(
                  showSkeleton: true,
                  skeletonRowCount: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_skeleton.png'),
      );
    });

    testWidgets('empty state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: const [],
                emptyState: const AppDataTableEmptyState(
                  message: 'No data available',
                  icon: Icons.table_chart_outlined,
                  show: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_empty.png'),
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
                width: 800,
                height: 400,
                child: AppDataTable(
                  variant: AppDataTableVariant.resizable,
                  columns: basicColumns,
                  rows: basicRows,
                  config: const AppDataTableConfig(
                    showHeaders: true,
                    showRowDividers: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_rtl.png'),
      );
    });

    testWidgets('custom theme colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: basicColumns,
                rows: basicRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                  alternateRowColors: true,
                  theme: AppDataTableTheme(
                    headerBackgroundColor: Color(0xFF2196F3),
                    headerTextColor: Colors.white,
                    selectedRowBackgroundColor: Color(0xFFE3F2FD),
                    alternateRowBackgroundColor: Color(0xFFF5F5F5),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_custom_theme.png'),
      );
    });

    testWidgets('table with different cell types', (tester) async {
      final mixedColumns = [
        const AppDataTableColumn(
          id: 'text',
          label: 'Text',
          field: 'text',
          width: 150,
          cellType: AppDataTableCellType.text,
        ),
        const AppDataTableColumn(
          id: 'number',
          label: 'Number',
          field: 'number',
          width: 100,
          cellType: AppDataTableCellType.number,
          alignment: AppDataTableColumnAlignment.right,
        ),
        const AppDataTableColumn(
          id: 'boolean',
          label: 'Boolean',
          field: 'boolean',
          width: 100,
          cellType: AppDataTableCellType.boolean,
          alignment: AppDataTableColumnAlignment.center,
        ),
        const AppDataTableColumn(
          id: 'icon',
          label: 'Icon',
          field: 'icon',
          width: 80,
          cellType: AppDataTableCellType.icon,
          alignment: AppDataTableColumnAlignment.center,
        ),
      ];

      final mixedRows = [
        const AppDataTableRow(
          id: '1',
          data: {
            'text': 'Sample Text',
            'number': 42.5,
            'boolean': true,
            'icon': Icons.star,
          },
        ),
        const AppDataTableRow(
          id: '2',
          data: {
            'text': 'Another Text',
            'number': 100,
            'boolean': false,
            'icon': Icons.favorite,
          },
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 400,
              child: AppDataTable(
                variant: AppDataTableVariant.resizable,
                columns: mixedColumns,
                rows: mixedRows,
                config: const AppDataTableConfig(
                  showHeaders: true,
                  showRowDividers: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppDataTable),
        matchesGoldenFile('golden/app_data_table_mixed_cell_types.png'),
      );
    });
  });
}
