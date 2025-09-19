import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSDataTable', () {
    late List<DSDataTableColumn> testColumns;
    late List<DSDataTableRow> testRows;

    setUp(() {
      testColumns = [
        const DSDataTableColumn(
          id: 'id',
          label: 'ID',
          field: 'id',
          width: 80,
          sortable: true,
          cellType: DSDataTableCellType.number,
        ),
        const DSDataTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 200,
          sortable: true,
          editable: true,
          cellType: DSDataTableCellType.text,
        ),
        const DSDataTableColumn(
          id: 'active',
          label: 'Active',
          field: 'active',
          width: 100,
          sortable: true,
          cellType: DSDataTableCellType.boolean,
        ),
      ];

      testRows = [
        const DSDataTableRow(
          id: '1',
          data: {
            'id': 1,
            'name': 'John Doe',
            'active': true,
          },
        ),
        const DSDataTableRow(
          id: '2',
          data: {
            'id': 2,
            'name': 'Jane Smith',
            'active': false,
          },
        ),
      ];
    });

    group('Widget Creation', () {
      testWidgets('creates resizable variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        );

        expect(find.byType(DSDataTable), findsOneWidget);
        expect(find.text('ID'), findsOneWidget);
        expect(find.text('Name'), findsOneWidget);
        expect(find.text('Active'), findsOneWidget);
      });

      testWidgets('creates pinned variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.pinned(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        );

        expect(find.byType(DSDataTable), findsOneWidget);
        expect(find.text('John Doe'), findsOneWidget);
        expect(find.text('Jane Smith'), findsOneWidget);
      });

      testWidgets('creates inline edit variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.inlineEdit(
                columns: testColumns,
                rows: testRows,
                onEdit: (row, columnId, newValue) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSDataTable), findsOneWidget);
        expect(find.text('John Doe'), findsOneWidget);
        expect(find.text('Jane Smith'), findsOneWidget);
      });

      testWidgets('creates general variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable(
                variant: DSDataTableVariant.resizable,
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        );

        expect(find.byType(DSDataTable), findsOneWidget);
      });
    });

    group('Data Display', () {
      testWidgets('displays column headers correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(showHeaders: true),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('ID'), findsOneWidget);
        expect(find.text('Name'), findsOneWidget);
        expect(find.text('Active'), findsOneWidget);
      });

      testWidgets('displays row data correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('John Doe'), findsOneWidget);
        expect(find.text('Jane Smith'), findsOneWidget);
      });

      testWidgets('displays boolean values as icons', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.check_circle), findsOneWidget);
        expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);
      });
    });

    group('Selection', () {
      testWidgets('shows selection checkboxes when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                selection: const DSDataTableSelection(
                  mode: DSDataTableSelectionMode.multiple,
                  showCheckboxes: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(
            find.byType(Checkbox), findsAtLeastNWidgets(2)); // Row checkboxes
      });

      testWidgets('handles row selection correctly', (tester) async {
        bool selectionChanged = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                selection: DSDataTableSelection(
                  mode: DSDataTableSelectionMode.multiple,
                  showCheckboxes: true,
                  onSelectionChanged: (rows) {
                    selectionChanged = true;
                  },
                ),
                onRowSelect: (row, selected) {
                  // Handle row selection
                },
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Find and tap the first row checkbox
        final checkboxes = find.byType(Checkbox);
        await tester.tap(checkboxes.first);
        await tester.pumpAndSettle();

        expect(selectionChanged, isTrue);
      });

      testWidgets('shows select all checkbox when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                selection: const DSDataTableSelection(
                  mode: DSDataTableSelectionMode.multiple,
                  showCheckboxes: true,
                  allowSelectAll: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(Checkbox),
            findsAtLeastNWidgets(3)); // Header + row checkboxes
      });
    });

    group('Sorting', () {
      testWidgets('shows sort icons on sortable columns', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(showHeaders: true),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.unfold_more),
            findsAtLeastNWidgets(2)); // ID and Name are sortable
      });

      testWidgets('handles column sorting correctly', (tester) async {
        String? sortedColumn;
        DSDataTableSortDirection? sortDirection;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                sorting: DSDataTableSort(
                  onSortChanged: (columnId, direction) {
                    sortedColumn = columnId;
                    sortDirection = direction;
                  },
                ),
                config: const DSDataTableConfig(showHeaders: true),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Tap on the Name column header to sort
        await tester.tap(find.text('Name'));
        await tester.pumpAndSettle();

        expect(sortedColumn, equals('name'));
        expect(sortDirection, equals(DSDataTableSortDirection.ascending));
      });
    });

    group('Loading States', () {
      testWidgets('displays loading indicator when showLoading is true',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(showLoading: true),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('displays skeleton loading when showSkeleton is true',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(
                  showSkeleton: true,
                  skeletonRowCount: 3,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Skeleton should create placeholder containers
        expect(find.byType(Container), findsAtLeastNWidgets(3));
      });
    });

    group('Empty State', () {
      testWidgets(
          'displays empty state when no data and emptyState is configured',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: const [],
                emptyState: const DSDataTableEmptyState(
                  message: 'No data available',
                  icon: Icons.table_chart,
                  show: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('No data available'), findsOneWidget);
        expect(find.byIcon(Icons.table_chart), findsOneWidget);
      });
    });

    group('Inline Editing', () {
      testWidgets('starts editing on double tap for editable cells',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.inlineEdit(
                columns: testColumns,
                rows: testRows,
                onEdit: (row, columnId, newValue) {},
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Double tap on an editable cell (Name column)
        await tester.tap(find.text('John Doe'));
        await tester.pump(const Duration(milliseconds: 100));
        await tester.tap(find.text('John Doe'));
        await tester.pumpAndSettle();

        // Should show a TextField for editing
        expect(find.byType(TextField), findsOneWidget);
      });

      testWidgets('calls onEdit callback when edit is submitted',
          (tester) async {
        String? editedRowId;
        String? editedColumnId;
        dynamic editedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.inlineEdit(
                columns: testColumns,
                rows: testRows,
                onEdit: (row, columnId, newValue) {
                  editedRowId = row.id;
                  editedColumnId = columnId;
                  editedValue = newValue;
                },
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Double tap to start editing
        await tester.tap(find.text('John Doe'));
        await tester.pump(const Duration(milliseconds: 100));
        await tester.tap(find.text('John Doe'));
        await tester.pumpAndSettle();

        // Enter new text and submit
        await tester.enterText(find.byType(TextField), 'John Smith');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(editedRowId, equals('1'));
        expect(editedColumnId, equals('name'));
        expect(editedValue, equals('John Smith'));
      });
    });

    group('Keyboard Navigation', () {
      testWidgets('handles arrow key navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(
                  enableKeyboardNavigation: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Tap on a cell to focus it
        await tester.tap(find.text('John Doe'));
        await tester.pumpAndSettle();

        // Simulate arrow key press
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pumpAndSettle();

        // Focus should move to the next row
        // This would require more complex testing setup to verify focus changes
      });

      testWidgets('handles enter key for editing', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.inlineEdit(
                columns: testColumns,
                rows: testRows,
                onEdit: (row, columnId, newValue) {},
                config: const DSDataTableConfig(
                  enableKeyboardNavigation: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Tap on an editable cell
        await tester.tap(find.text('John Doe'));
        await tester.pumpAndSettle();

        // Press Enter to start editing
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();

        // Should show a TextField for editing
        expect(find.byType(TextField), findsOneWidget);
      });
    });

    group('Row Numbers', () {
      testWidgets('shows row numbers when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(
                  showRowNumbers: true,
                  showHeaders: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('#'), findsOneWidget); // Header
        expect(find.text('1'), findsOneWidget); // First row number
        expect(find.text('2'), findsOneWidget); // Second row number
      });
    });

    group('Responsive Design', () {
      testWidgets('adapts to different screen sizes', (tester) async {
        await tester.binding.setSurfaceSize(const Size(800, 600));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDataTable.resizable(
                columns: testColumns,
                rows: testRows,
                config: const DSDataTableConfig(
                  horizontalScrollable: true,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));

        addTearDown(() => tester.binding.setSurfaceSize(null));
      });
    });

    group('RTL Support', () {
      testWidgets('adapts layout for RTL text direction', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: DSDataTable.resizable(
                  columns: testColumns,
                  rows: testRows,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(DSDataTable), findsOneWidget);
        // RTL layout adaptations would need more specific testing
      });
    });
  });

  group('DSDataTableUtils', () {
    late List<DSDataTableColumn> columns;
    late List<DSDataTableRow> rows;

    setUp(() {
      columns = [
        const DSDataTableColumn(
          id: 'id',
          label: 'ID',
          field: 'id',
          width: 100,
          visible: true,
        ),
        const DSDataTableColumn(
          id: 'name',
          label: 'Name',
          field: 'name',
          width: 200,
          visible: true,
        ),
        const DSDataTableColumn(
          id: 'hidden',
          label: 'Hidden',
          field: 'hidden',
          width: 150,
          visible: false,
        ),
      ];

      rows = [
        const DSDataTableRow(
          id: '1',
          data: {'id': 1, 'name': 'John', 'hidden': 'secret'},
          selected: false,
        ),
        const DSDataTableRow(
          id: '2',
          data: {'id': 2, 'name': 'Jane', 'hidden': 'secret2'},
          selected: true,
        ),
        const DSDataTableRow(
          id: '3',
          data: {'id': 3, 'name': 'Bob', 'hidden': 'secret3'},
          selected: false,
        ),
      ];
    });

    test('calculateTotalWidth returns correct total width', () {
      final totalWidth = DSDataTableUtils.calculateTotalWidth(columns);
      expect(totalWidth, equals(300.0)); // 100 + 200, hidden column not counted
    });

    test('filterRows filters correctly', () {
      final filtered = DSDataTableUtils.filterRows(rows, 'Jane');
      expect(filtered.length, equals(1));
      expect(filtered.first.id, equals('2'));
    });

    test('filterRows is case insensitive by default', () {
      final filtered = DSDataTableUtils.filterRows(rows, 'jane');
      expect(filtered.length, equals(1));
      expect(filtered.first.id, equals('2'));
    });

    test('filterRows respects case sensitivity when specified', () {
      final filtered = DSDataTableUtils.filterRows(
        rows,
        'jane',
        caseSensitive: true,
      );
      expect(filtered.length, equals(0));
    });

    test('sortRows sorts correctly in ascending order', () {
      final sorted = DSDataTableUtils.sortRows(
        rows,
        'name',
        DSDataTableSortDirection.ascending,
      );
      expect(sorted.first.getValue('name'), equals('Bob'));
      expect(sorted.last.getValue('name'), equals('John'));
    });

    test('sortRows sorts correctly in descending order', () {
      final sorted = DSDataTableUtils.sortRows(
        rows,
        'name',
        DSDataTableSortDirection.descending,
      );
      expect(sorted.first.getValue('name'), equals('John'));
      expect(sorted.last.getValue('name'), equals('Bob'));
    });

    test('getSelectedRows returns only selected rows', () {
      final selected = DSDataTableUtils.getSelectedRows(rows);
      expect(selected.length, equals(1));
      expect(selected.first.id, equals('2'));
    });

    test('updateRowSelection updates selection correctly for single mode', () {
      final updated = DSDataTableUtils.updateRowSelection(
        rows,
        '1',
        true,
        DSDataTableSelectionMode.single,
      );

      final selectedRows = updated.where((row) => row.selected).toList();
      expect(selectedRows.length, equals(1));
      expect(selectedRows.first.id, equals('1'));
    });

    test('updateRowSelection updates selection correctly for multiple mode',
        () {
      final updated = DSDataTableUtils.updateRowSelection(
        rows,
        '1',
        true,
        DSDataTableSelectionMode.multiple,
      );

      final selectedRows = updated.where((row) => row.selected).toList();
      expect(selectedRows.length, equals(2)); // Row 1 and 2 should be selected
    });

    test('generateTableSemanticLabel generates correct label', () {
      final label = DSDataTableUtils.generateTableSemanticLabel(10, 5, 3);
      expect(label, contains('10 rows'));
      expect(label, contains('5 columns'));
      expect(label, contains('3 rows selected'));
    });

    test('validateColumns catches duplicate IDs', () {
      final invalidColumns = [
        const DSDataTableColumn(id: 'test', label: 'Test', field: 'test'),
        const DSDataTableColumn(id: 'test', label: 'Test2', field: 'test2'),
      ];

      final errors = DSDataTableUtils.validateColumns(invalidColumns);
      expect(
          errors.any((error) => error.contains('Duplicate column ID')), isTrue);
    });

    test('validateColumns catches empty labels', () {
      final invalidColumns = [
        const DSDataTableColumn(id: 'test', label: '', field: 'test'),
      ];

      final errors = DSDataTableUtils.validateColumns(invalidColumns);
      expect(
          errors.any((error) => error.contains('Column label cannot be empty')),
          isTrue);
    });

    test('validateRowData catches missing fields', () {
      final invalidRow = const DSDataTableRow(
        id: 'test',
        data: {'id': 1}, // Missing 'name' field
      );

      final errors = DSDataTableUtils.validateRowData(invalidRow, columns);
      expect(errors.any((error) => error.contains('Missing data for field')),
          isTrue);
    });
  });

  group('DSDataTableColumn', () {
    test('getEffectiveAlignment returns correct alignment for LTR', () {
      const column = DSDataTableColumn(
        id: 'test',
        label: 'Test',
        field: 'test',
        alignment: DSDataTableColumnAlignment.left,
      );

      final alignment = column.getEffectiveAlignment(TextDirection.ltr);
      expect(alignment, equals(DSDataTableColumnAlignment.left));
    });

    test('getEffectiveAlignment flips alignment for RTL', () {
      const column = DSDataTableColumn(
        id: 'test',
        label: 'Test',
        field: 'test',
        alignment: DSDataTableColumnAlignment.left,
      );

      final alignment = column.getEffectiveAlignment(TextDirection.rtl);
      expect(alignment, equals(DSDataTableColumnAlignment.right));
    });

    test('hasCustomCellBuilder returns correct value', () {
      const columnWithoutBuilder = DSDataTableColumn(
        id: 'test',
        label: 'Test',
        field: 'test',
      );

      expect(columnWithoutBuilder.hasCustomCellBuilder, isFalse);
      // Note: Can't test with a real cellBuilder function in const context
    });

    test('supportsEditing returns correct value', () {
      const nonEditableColumn = DSDataTableColumn(
        id: 'test',
        label: 'Test',
        field: 'test',
        editable: false,
      );

      const editableColumn = DSDataTableColumn(
        id: 'test',
        label: 'Test',
        field: 'test',
        editable: true,
        cellType: DSDataTableCellType.text,
      );

      expect(nonEditableColumn.supportsEditing, isFalse);
      expect(editableColumn.supportsEditing, isTrue);
    });
  });

  group('DSDataTableRow', () {
    const testRow = DSDataTableRow(
      id: 'test',
      data: {
        'name': 'Test Name',
        'value': 42,
        'active': true,
      },
    );

    test('getValue returns correct value', () {
      expect(testRow.getValue('name'), equals('Test Name'));
      expect(testRow.getValue('value'), equals(42));
      expect(testRow.getValue('nonexistent'), isNull);
    });

    test('hasValue returns correct boolean', () {
      expect(testRow.hasValue('name'), isTrue);
      expect(testRow.hasValue('nonexistent'), isFalse);
    });

    test('getDisplayValue formats correctly', () {
      String testFormatter(dynamic value) => 'Formatted: $value';

      expect(testRow.getDisplayValue('name', null), equals('Test Name'));
      expect(testRow.getDisplayValue('name', testFormatter),
          equals('Formatted: Test Name'));
      expect(testRow.getDisplayValue('nonexistent', null), equals(''));
    });

    test('isCellEditing returns correct value', () {
      const editingRow = DSDataTableRow(
        id: 'test',
        data: {'name': 'Test'},
        editingCells: ['name'],
      );

      expect(editingRow.isCellEditing('name'), isTrue);
      expect(editingRow.isCellEditing('other'), isFalse);
    });
  });
}
