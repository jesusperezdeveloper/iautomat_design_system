import 'package:flutter/material.dart';
import 'ds_data_table.dart';
import 'data_table_config.dart';

/// Stories for DSDataTable component demonstrating different variants and configurations
class DataTableStories extends StatefulWidget {
  const DataTableStories({super.key});

  @override
  State<DataTableStories> createState() => _DataTableStoriesState();
}

class _DataTableStoriesState extends State<DataTableStories> {
  late List<DSDataTableColumn> columns;
  late List<DSDataTableRow> rows;
  late List<DSDataTableRow> employeeRows;
  late List<DSDataTableColumn> employeeColumns;

  DSDataTableSelection selection = const DSDataTableSelection(
    mode: DSDataTableSelectionMode.multiple,
    selectedRows: [],
  );

  DSDataTableSort sorting = const DSDataTableSort();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    // Basic table data
    columns = [
      const DSDataTableColumn(
        id: 'id',
        label: 'ID',
        field: 'id',
        width: 80,
        sortable: true,
        cellType: DSDataTableCellType.number,
        alignment: DSDataTableColumnAlignment.center,
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
        id: 'email',
        label: 'Email',
        field: 'email',
        width: 250,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'status',
        label: 'Status',
        field: 'status',
        width: 120,
        sortable: true,
        cellType: DSDataTableCellType.text,
        alignment: DSDataTableColumnAlignment.center,
      ),
      const DSDataTableColumn(
        id: 'active',
        label: 'Active',
        field: 'active',
        width: 100,
        sortable: true,
        cellType: DSDataTableCellType.boolean,
        alignment: DSDataTableColumnAlignment.center,
      ),
    ];

    rows = [
      const DSDataTableRow(
        id: '1',
        data: {
          'id': 1,
          'name': 'John Doe',
          'email': 'john.doe@example.com',
          'status': 'Active',
          'active': true,
        },
      ),
      const DSDataTableRow(
        id: '2',
        data: {
          'id': 2,
          'name': 'Jane Smith',
          'email': 'jane.smith@example.com',
          'status': 'Inactive',
          'active': false,
        },
      ),
      const DSDataTableRow(
        id: '3',
        data: {
          'id': 3,
          'name': 'Bob Johnson',
          'email': 'bob.johnson@example.com',
          'status': 'Pending',
          'active': true,
        },
      ),
      const DSDataTableRow(
        id: '4',
        data: {
          'id': 4,
          'name': 'Alice Williams',
          'email': 'alice.williams@example.com',
          'status': 'Active',
          'active': true,
        },
      ),
      const DSDataTableRow(
        id: '5',
        data: {
          'id': 5,
          'name': 'Charlie Brown',
          'email': 'charlie.brown@example.com',
          'status': 'Inactive',
          'active': false,
        },
      ),
    ];

    // Employee table data for more complex example
    employeeColumns = [
      const DSDataTableColumn(
        id: 'avatar',
        label: 'Avatar',
        field: 'avatar',
        width: 80,
        cellType: DSDataTableCellType.image,
        alignment: DSDataTableColumnAlignment.center,
      ),
      const DSDataTableColumn(
        id: 'employee_id',
        label: 'ID',
        field: 'employee_id',
        width: 80,
        sortable: true,
        cellType: DSDataTableCellType.text,
        alignment: DSDataTableColumnAlignment.center,
      ),
      const DSDataTableColumn(
        id: 'full_name',
        label: 'Full Name',
        field: 'full_name',
        width: 200,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'department',
        label: 'Department',
        field: 'department',
        width: 150,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'position',
        label: 'Position',
        field: 'position',
        width: 180,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'salary',
        label: 'Salary',
        field: 'salary',
        width: 120,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.number,
        alignment: DSDataTableColumnAlignment.right,
        formatter: null,
      ),
      const DSDataTableColumn(
        id: 'hire_date',
        label: 'Hire Date',
        field: 'hire_date',
        width: 120,
        sortable: true,
        cellType: DSDataTableCellType.date,
        alignment: DSDataTableColumnAlignment.center,
      ),
      const DSDataTableColumn(
        id: 'is_manager',
        label: 'Manager',
        field: 'is_manager',
        width: 100,
        sortable: true,
        cellType: DSDataTableCellType.boolean,
        alignment: DSDataTableColumnAlignment.center,
      ),
    ];

    employeeRows = [
      const DSDataTableRow(
        id: 'emp_1',
        data: {
          'avatar':
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
          'employee_id': 'EMP001',
          'full_name': 'John Anderson',
          'department': 'Engineering',
          'position': 'Senior Developer',
          'salary': 95000,
          'hire_date': '2020-03-15',
          'is_manager': false,
        },
      ),
      const DSDataTableRow(
        id: 'emp_2',
        data: {
          'avatar':
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
          'employee_id': 'EMP002',
          'full_name': 'Sarah Johnson',
          'department': 'Engineering',
          'position': 'Engineering Manager',
          'salary': 120000,
          'hire_date': '2019-01-20',
          'is_manager': true,
        },
      ),
      const DSDataTableRow(
        id: 'emp_3',
        data: {
          'avatar':
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
          'employee_id': 'EMP003',
          'full_name': 'Michael Chen',
          'department': 'Design',
          'position': 'UX Designer',
          'salary': 75000,
          'hire_date': '2021-06-10',
          'is_manager': false,
        },
      ),
      const DSDataTableRow(
        id: 'emp_4',
        data: {
          'avatar':
              'https://images.unsplash.com/photo-1494790108755-2616b9d6c0d0?w=150',
          'employee_id': 'EMP004',
          'full_name': 'Emily Rodriguez',
          'department': 'Marketing',
          'position': 'Marketing Specialist',
          'salary': 65000,
          'hire_date': '2022-02-28',
          'is_manager': false,
        },
      ),
      const DSDataTableRow(
        id: 'emp_5',
        data: {
          'avatar':
              'https://images.unsplash.com/photo-1566492031773-4f4e44671d66?w=150',
          'employee_id': 'EMP005',
          'full_name': 'David Wilson',
          'department': 'Sales',
          'position': 'Sales Manager',
          'salary': 85000,
          'hire_date': '2018-11-05',
          'is_manager': true,
        },
      ),
      const DSDataTableRow(
        id: 'emp_6',
        data: {
          'avatar':
              'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=150',
          'employee_id': 'EMP006',
          'full_name': 'Lisa Thompson',
          'department': 'HR',
          'position': 'HR Coordinator',
          'salary': 55000,
          'hire_date': '2023-04-12',
          'is_manager': false,
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Basic Data Table',
              'Simple table with basic columns and rows',
              _buildBasicTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Resizable Columns',
              'Table with resizable columns - drag column borders to resize',
              _buildResizableTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Pinned Columns',
              'Table with pinned (frozen) columns for horizontal scrolling',
              _buildPinnedTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Inline Editing',
              'Table with inline cell editing - double-click cells to edit',
              _buildInlineEditTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Complex Employee Table',
              'Advanced table with images, formatting, and selection',
              _buildEmployeeTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Loading State',
              'Table showing loading indicator',
              _buildLoadingTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Skeleton State',
              'Table showing skeleton loading animation',
              _buildSkeletonTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Empty State',
              'Table with no data showing empty state',
              _buildEmptyTable(),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Dense Table',
              'Compact table with reduced row height',
              _buildDenseTable(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(String title, String description, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.7),
              ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: child,
          ),
        ),
      ],
    );
  }

  Widget _buildBasicTable() {
    return DSDataTable(
      variant: DSDataTableVariant.resizable,
      columns: columns,
      rows: rows,
      config: const DSDataTableConfig(
        showHeaders: true,
        showRowDividers: true,
        alternateRowColors: true,
        maxHeight: 400,
      ),
    );
  }

  Widget _buildResizableTable() {
    return DSDataTable.resizable(
      columns: columns,
      rows: rows,
      config: const DSDataTableConfig(
        showHeaders: true,
        showRowDividers: true,
        maxHeight: 400,
        resizeConfig: DSDataTableResizeConfig(
          enabled: true,
          minColumnWidth: 80,
          maxColumnWidth: 400,
          showOnHover: true,
        ),
      ),
      onColumnResize: (columnId, newWidth) {
        debugPrint('Column $columnId resized to $newWidth');
      },
    );
  }

  Widget _buildPinnedTable() {
    return DSDataTable.pinned(
      columns: columns,
      rows: rows,
      config: const DSDataTableConfig(
        showHeaders: true,
        showRowDividers: true,
        maxHeight: 400,
        freezeConfig: DSDataTableFreezeConfig(
          leftColumns: 2, // Pin ID and Name columns
          rightColumns: 1, // Pin Active column
          showDividers: true,
        ),
      ),
    );
  }

  Widget _buildInlineEditTable() {
    return DSDataTable.inlineEdit(
      columns: columns,
      rows: rows,
      config: const DSDataTableConfig(
        showHeaders: true,
        showRowDividers: true,
        maxHeight: 400,
        editMode: DSDataTableEditMode.cell,
      ),
      onEdit: (row, columnId, newValue) {
        debugPrint(
            'Edited row ${row.id}, column $columnId, new value: $newValue');
        // Handle edit here - update your data source
      },
    );
  }

  Widget _buildEmployeeTable() {
    return DSDataTable(
      variant: DSDataTableVariant.resizable,
      columns: employeeColumns,
      rows: employeeRows,
      selection: selection,
      sorting: sorting,
      config: const DSDataTableConfig(
        showHeaders: true,
        showRowDividers: true,
        showColumnDividers: true,
        alternateRowColors: true,
        showHoverEffects: true,
        maxHeight: 500,
        density: DSDataTableDensity.comfortable,
      ),
      onRowSelect: (row, selected) {
        debugPrint('Row ${row.id} ${selected ? 'selected' : 'deselected'}');
      },
    );
  }

  Widget _buildLoadingTable() {
    return DSDataTable(
      variant: DSDataTableVariant.resizable,
      columns: columns,
      rows: const [],
      config: const DSDataTableConfig(
        showLoading: true,
        maxHeight: 300,
      ),
    );
  }

  Widget _buildSkeletonTable() {
    return DSDataTable(
      variant: DSDataTableVariant.resizable,
      columns: columns,
      rows: const [],
      config: const DSDataTableConfig(
        showSkeleton: true,
        skeletonRowCount: 8,
        maxHeight: 400,
      ),
    );
  }

  Widget _buildEmptyTable() {
    return DSDataTable(
      variant: DSDataTableVariant.resizable,
      columns: columns,
      rows: const [],
      emptyState: const DSDataTableEmptyState(
        message: 'No data available',
        icon: Icons.table_chart_outlined,
        show: true,
      ),
      config: const DSDataTableConfig(
        maxHeight: 300,
      ),
    );
  }

  Widget _buildDenseTable() {
    return DSDataTable(
      variant: DSDataTableVariant.resizable,
      columns: columns,
      rows: rows,
      config: const DSDataTableConfig(
        showHeaders: true,
        showRowDividers: true,
        alternateRowColors: true,
        density: DSDataTableDensity.compact,
        maxHeight: 300,
      ),
    );
  }
}

/// Example usage in a real application
class ProductTableExample extends StatefulWidget {
  const ProductTableExample({super.key});

  @override
  State<ProductTableExample> createState() => _ProductTableExampleState();
}

class _ProductTableExampleState extends State<ProductTableExample> {
  late List<DSDataTableColumn> columns;
  late List<DSDataTableRow> rows;

  @override
  void initState() {
    super.initState();
    _initializeProductData();
  }

  void _initializeProductData() {
    columns = [
      const DSDataTableColumn(
        id: 'sku',
        label: 'SKU',
        field: 'sku',
        width: 120,
        sortable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'name',
        label: 'Product Name',
        field: 'name',
        width: 250,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'category',
        label: 'Category',
        field: 'category',
        width: 150,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.text,
      ),
      const DSDataTableColumn(
        id: 'price',
        label: 'Price',
        field: 'price',
        width: 100,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.number,
        alignment: DSDataTableColumnAlignment.right,
        formatter: null,
      ),
      const DSDataTableColumn(
        id: 'stock',
        label: 'Stock',
        field: 'stock',
        width: 80,
        sortable: true,
        editable: true,
        cellType: DSDataTableCellType.number,
        alignment: DSDataTableColumnAlignment.center,
      ),
      const DSDataTableColumn(
        id: 'available',
        label: 'Available',
        field: 'available',
        width: 100,
        sortable: true,
        cellType: DSDataTableCellType.boolean,
        alignment: DSDataTableColumnAlignment.center,
      ),
    ];

    rows = [
      const DSDataTableRow(
        id: '1',
        data: {
          'sku': 'LAPTOP001',
          'name': 'MacBook Pro 14"',
          'category': 'Laptops',
          'price': 1999.99,
          'stock': 15,
          'available': true,
        },
      ),
      const DSDataTableRow(
        id: '2',
        data: {
          'sku': 'PHONE001',
          'name': 'iPhone 15 Pro',
          'category': 'Phones',
          'price': 999.99,
          'stock': 25,
          'available': true,
        },
      ),
      const DSDataTableRow(
        id: '3',
        data: {
          'sku': 'TABLET001',
          'name': 'iPad Air',
          'category': 'Tablets',
          'price': 599.99,
          'stock': 0,
          'available': false,
        },
      ),
      const DSDataTableRow(
        id: '4',
        data: {
          'sku': 'WATCH001',
          'name': 'Apple Watch Series 9',
          'category': 'Wearables',
          'price': 399.99,
          'stock': 8,
          'available': true,
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add new product
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Refresh data
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DSDataTable.inlineEdit(
          columns: columns,
          rows: rows,
          selection: const DSDataTableSelection(
            mode: DSDataTableSelectionMode.multiple,
            showCheckboxes: true,
            allowSelectAll: true,
          ),
          config: const DSDataTableConfig(
            showHeaders: true,
            showRowDividers: true,
            showColumnDividers: true,
            alternateRowColors: true,
            showHoverEffects: true,
            editMode: DSDataTableEditMode.cell,
            enableKeyboardNavigation: true,
            enableAccessibility: true,
          ),
          onEdit: (row, columnId, newValue) {
            // Update product data
            debugPrint('Updated product ${row.id}: $columnId = $newValue');
          },
          onRowSelect: (row, selected) {
            debugPrint(
                'Product ${row.id} ${selected ? 'selected' : 'deselected'}');
          },
        ),
      ),
    );
  }
}
