import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/simple_table/app_simple_table.dart';
import 'package:iautomat_design_system/src/components/simple_table/simple_table_config.dart';

/// Simple Table Stories and Examples
///
/// This file provides comprehensive examples and stories for the DSSimpleTable
/// component, showcasing different configurations, variants, and use cases.

class SimpleTableStoryExample extends StatefulWidget {
  const SimpleTableStoryExample({super.key});

  @override
  State<SimpleTableStoryExample> createState() =>
      _SimpleTableStoryExampleState();
}

class _SimpleTableStoryExampleState extends State<SimpleTableStoryExample> {
  // Sample data
  final List<DSSimpleTableColumn> sampleColumns = [
    const DSSimpleTableColumn(
      id: 'name',
      label: 'Nombre',
      field: 'name',
      width: 200,
      sortable: true,
    ),
    const DSSimpleTableColumn(
      id: 'email',
      label: 'Email',
      field: 'email',
      width: 250,
      sortable: true,
    ),
    const DSSimpleTableColumn(
      id: 'role',
      label: 'Rol',
      field: 'role',
      width: 150,
      sortable: true,
    ),
    const DSSimpleTableColumn(
      id: 'status',
      label: 'Estado',
      field: 'status',
      width: 120,
      sortable: false,
    ),
  ];

  final List<DSSimpleTableRow> sampleRows = [
    DSSimpleTableRow(
      id: '1',
      data: {
        'name': 'Juan Pérez',
        'email': 'juan@example.com',
        'role': 'Admin',
        'status': 'Activo',
      },
    ),
    DSSimpleTableRow(
      id: '2',
      data: {
        'name': 'María García',
        'email': 'maria@example.com',
        'role': 'Usuario',
        'status': 'Pendiente',
      },
    ),
    DSSimpleTableRow(
      id: '3',
      data: {
        'name': 'Carlos López',
        'email': 'carlos@example.com',
        'role': 'Moderador',
        'status': 'Inactivo',
      },
    ),
  ];

  List<String> selectedRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Table Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStandardVariantSection(),
            const SizedBox(height: 32),
            _buildCompactVariantSection(),
            const SizedBox(height: 32),
            _buildEmptyStateSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStandardVariantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Standard Variant',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DSSimpleTable.standard(
            columns: sampleColumns,
            rows: sampleRows,
            selection: DSSimpleTableSelection(
              mode: DSSimpleTableSelectionMode.single,
              selectedRows: selectedRows,
            ),
            onRowSelect: (row, selected) {
              setState(() {
                if (selected) {
                  selectedRows = [row.id];
                } else {
                  selectedRows.remove(row.id);
                }
              });
            },
          ),
        ),
        if (selectedRows.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            'Filas seleccionadas: ${selectedRows.length}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    );
  }

  Widget _buildCompactVariantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Compact Variant',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DSSimpleTable.compact(
            columns: sampleColumns,
            rows: sampleRows,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyStateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Empty State',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DSSimpleTable.standard(
            columns: sampleColumns,
            rows: const [],
            emptyState: const DSSimpleTableEmptyState(
              message: 'No hay datos disponibles',
              icon: Icons.table_chart_outlined,
            ),
          ),
        ),
      ],
    );
  }
}

/// Usage Examples for Documentation
class SimpleTableUsageExamples {
  /// Basic usage example
  static Widget basicExample() {
    final columns = [
      const DSSimpleTableColumn(
        id: 'name',
        label: 'Nombre',
        field: 'name',
        width: 200,
      ),
      const DSSimpleTableColumn(
        id: 'email',
        label: 'Email',
        field: 'email',
        width: 250,
      ),
    ];

    final rows = [
      DSSimpleTableRow(
        id: '1',
        data: {
          'name': 'Juan Pérez',
          'email': 'juan@example.com',
        },
      ),
    ];

    return DSSimpleTable.standard(
      columns: columns,
      rows: rows,
    );
  }

  /// Compact variant example
  static Widget compactExample() {
    final columns = [
      const DSSimpleTableColumn(
        id: 'name',
        label: 'Nombre',
        field: 'name',
        width: 200,
      ),
      const DSSimpleTableColumn(
        id: 'status',
        label: 'Estado',
        field: 'status',
        width: 120,
      ),
    ];

    final rows = [
      DSSimpleTableRow(
        id: '1',
        data: {
          'name': 'Elemento 1',
          'status': 'Activo',
        },
      ),
    ];

    return DSSimpleTable.compact(
      columns: columns,
      rows: rows,
    );
  }

  /// With selection example
  static Widget selectionExample() {
    final columns = [
      const DSSimpleTableColumn(
        id: 'name',
        label: 'Nombre',
        field: 'name',
        width: 200,
      ),
    ];

    final rows = [
      DSSimpleTableRow(
        id: '1',
        data: {
          'name': 'Elemento seleccionable',
        },
      ),
    ];

    return DSSimpleTable.standard(
      columns: columns,
      rows: rows,
      selection: const DSSimpleTableSelection(
        mode: DSSimpleTableSelectionMode.multiple,
      ),
    );
  }

  /// With sorting example
  static Widget sortingExample() {
    final columns = [
      const DSSimpleTableColumn(
        id: 'name',
        label: 'Nombre',
        field: 'name',
        width: 200,
        sortable: true,
      ),
      const DSSimpleTableColumn(
        id: 'date',
        label: 'Fecha',
        field: 'date',
        width: 150,
        sortable: true,
      ),
    ];

    final rows = [
      DSSimpleTableRow(
        id: '1',
        data: {
          'name': 'Elemento A',
          'date': '2023-01-01',
        },
      ),
    ];

    return DSSimpleTable.standard(
      columns: columns,
      rows: rows,
      sorting: const DSSimpleTableSort(
        columnId: 'name',
        direction: DSSimpleTableSortDirection.ascending,
      ),
    );
  }

  /// Empty state example
  static Widget emptyStateExample() {
    final columns = [
      const DSSimpleTableColumn(
        id: 'name',
        label: 'Nombre',
        field: 'name',
        width: 200,
      ),
    ];

    return DSSimpleTable.standard(
      columns: columns,
      rows: const [],
      emptyState: const DSSimpleTableEmptyState(
        message: 'No hay elementos',
        icon: Icons.inbox,
      ),
    );
  }
}
