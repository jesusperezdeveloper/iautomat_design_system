import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_table_config.freezed.dart';

/// Data table variant types
enum DSDataTableVariant {
  /// Resizable columns table
  resizable,

  /// Pinned columns table
  pinned,

  /// Inline edit table
  inlineEdit,
}

/// Data table state types
enum DSDataTableState {
  /// Default state
  defaultState,

  /// Hover state
  hover,

  /// Pressed state
  pressed,

  /// Focus state
  focus,

  /// Selected state
  selected,

  /// Disabled state
  disabled,

  /// Loading state
  loading,

  /// Skeleton loading state
  skeleton,
}

/// Column alignment options
enum DSDataTableColumnAlignment {
  left,
  center,
  right,
}

/// Sort direction for columns
enum DSDataTableSortDirection {
  ascending,
  descending,
  none,
}

/// Selection mode for rows
enum DSDataTableSelectionMode {
  /// No selection allowed
  none,

  /// Single row selection
  single,

  /// Multiple row selection
  multiple,
}

/// Row state
enum DSDataTableRowState {
  normal,
  selected,
  hovered,
  pressed,
  disabled,
  editing,
}

/// Cell type for different data types
enum DSDataTableCellType {
  text,
  number,
  boolean,
  date,
  image,
  icon,
  action,
  custom,
}

/// Edit mode for inline editing
enum DSDataTableEditMode {
  none,
  cell,
  row,
}

/// Freeze configuration for pinned columns
@freezed
class DSDataTableFreezeConfig with _$DSDataTableFreezeConfig {
  const factory DSDataTableFreezeConfig({
    /// Number of columns to freeze from the left
    @Default(0) int leftColumns,

    /// Number of columns to freeze from the right
    @Default(0) int rightColumns,

    /// Whether to show freeze dividers
    @Default(true) bool showDividers,

    /// Freeze divider color
    Color? dividerColor,

    /// Freeze divider width
    @Default(2.0) double dividerWidth,
  }) = _DSDataTableFreezeConfig;
}

/// Resize configuration for resizable columns
@freezed
class DSDataTableResizeConfig with _$DSDataTableResizeConfig {
  const factory DSDataTableResizeConfig({
    /// Whether columns are resizable
    @Default(true) bool enabled,

    /// Minimum column width
    @Default(50.0) double minColumnWidth,

    /// Maximum column width
    @Default(500.0) double maxColumnWidth,

    /// Resize handle width
    @Default(8.0) double handleWidth,

    /// Resize handle color
    Color? handleColor,

    /// Whether to show resize handles on hover
    @Default(true) bool showOnHover,
  }) = _DSDataTableResizeConfig;
}

/// Column configuration
@freezed
class DSDataTableColumn with _$DSDataTableColumn {
  const DSDataTableColumn._();

  const factory DSDataTableColumn({
    /// Unique identifier for the column
    required String id,

    /// Display label for the column header
    required String label,

    /// Data field name for row data access
    required String field,

    /// Column width (null for auto-sizing)
    double? width,

    /// Minimum column width
    @Default(50.0) double minWidth,

    /// Maximum column width
    @Default(500.0) double maxWidth,

    /// Whether the column is sortable
    @Default(false) bool sortable,

    /// Whether the column is resizable
    @Default(true) bool resizable,

    /// Whether the column is visible
    @Default(true) bool visible,

    /// Whether the column is pinned (frozen)
    @Default(false) bool pinned,

    /// Column alignment
    @Default(DSDataTableColumnAlignment.left)
    DSDataTableColumnAlignment alignment,

    /// Cell type for this column
    @Default(DSDataTableCellType.text) DSDataTableCellType cellType,

    /// Whether cells in this column are editable
    @Default(false) bool editable,

    /// Custom cell builder
    DSDataTableCellBuilder? cellBuilder,

    /// Custom header builder
    DSDataTableHeaderBuilder? headerBuilder,

    /// Custom edit cell builder for inline editing
    DSDataTableEditCellBuilder? editCellBuilder,

    /// Validator for cell values during editing
    DSDataTableCellValidator? validator,

    /// Formatter for displaying cell values
    DSDataTableCellFormatter? formatter,

    /// Tooltip for the column header
    String? tooltip,

    /// Icon for the column header
    IconData? icon,

    /// Whether this column can be hidden
    @Default(true) bool hideable,

    /// Custom data for the column
    Map<String, dynamic>? customData,

    /// Accessibility label for the column
    String? semanticLabel,

    /// Sort direction for this column
    @Default(DSDataTableSortDirection.none)
    DSDataTableSortDirection sortDirection,

    /// Sort priority (for multi-column sorting)
    int? sortPriority,
  }) = _DSDataTableColumn;

  /// Whether the column has a custom cell builder
  bool get hasCustomCellBuilder => cellBuilder != null;

  /// Whether the column has a custom header builder
  bool get hasCustomHeaderBuilder => headerBuilder != null;

  /// Whether the column supports editing
  bool get supportsEditing =>
      editable &&
      (cellType != DSDataTableCellType.custom || editCellBuilder != null);

  /// Get the effective alignment for RTL layouts
  DSDataTableColumnAlignment getEffectiveAlignment(
      TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      switch (alignment) {
        case DSDataTableColumnAlignment.left:
          return DSDataTableColumnAlignment.right;
        case DSDataTableColumnAlignment.right:
          return DSDataTableColumnAlignment.left;
        case DSDataTableColumnAlignment.center:
          return DSDataTableColumnAlignment.center;
      }
    }
    return alignment;
  }
}

/// Row data configuration
@freezed
class DSDataTableRow with _$DSDataTableRow {
  const DSDataTableRow._();

  const factory DSDataTableRow({
    /// Unique identifier for the row
    required String id,

    /// Row data (field -> value mapping)
    required Map<String, dynamic> data,

    /// Whether the row is selected
    @Default(false) bool selected,

    /// Whether the row is disabled
    @Default(false) bool disabled,

    /// Whether the row is visible
    @Default(true) bool visible,

    /// Row state
    @Default(DSDataTableRowState.normal) DSDataTableRowState state,

    /// Custom row builder
    DSDataTableRowBuilder? rowBuilder,

    /// Row height override
    double? height,

    /// Row color override
    Color? color,

    /// Whether the row is expanded (for expandable rows)
    @Default(false) bool expanded,

    /// Expanded content widget
    Widget? expandedContent,

    /// Custom data for the row
    Map<String, dynamic>? customData,

    /// Accessibility label for the row
    String? semanticLabel,

    /// Whether the row is currently being edited
    @Default(false) bool isEditing,

    /// Which cells are currently being edited (column IDs)
    @Default([]) List<String> editingCells,
  }) = _DSDataTableRow;

  /// Get value for a specific column
  dynamic getValue(String columnId) => data[columnId];

  /// Check if the row has data for a column
  bool hasValue(String columnId) => data.containsKey(columnId);

  /// Check if a specific cell is being edited
  bool isCellEditing(String columnId) => editingCells.contains(columnId);

  /// Get display value for a column with optional formatting
  String getDisplayValue(
      String columnId, DSDataTableCellFormatter? formatter) {
    final value = getValue(columnId);
    if (formatter != null) {
      return formatter(value);
    }
    return value?.toString() ?? '';
  }
}

/// Selection configuration
@freezed
class DSDataTableSelection with _$DSDataTableSelection {
  const factory DSDataTableSelection({
    /// Selection mode
    @Default(DSDataTableSelectionMode.none) DSDataTableSelectionMode mode,

    /// Selected row IDs
    @Default([]) List<String> selectedRows,

    /// Whether to show selection checkboxes
    @Default(true) bool showCheckboxes,

    /// Whether to allow select all
    @Default(true) bool allowSelectAll,

    /// Maximum number of selections (null for unlimited)
    int? maxSelections,

    /// Callback when selection changes
    DSDataTableSelectionCallback? onSelectionChanged,
  }) = _DSDataTableSelection;
}

/// Sort configuration
@freezed
class DSDataTableSort with _$DSDataTableSort {
  const factory DSDataTableSort({
    /// Column ID being sorted
    String? columnId,

    /// Sort direction
    @Default(DSDataTableSortDirection.none)
    DSDataTableSortDirection direction,

    /// Whether multi-column sorting is enabled
    @Default(false) bool multiColumn,

    /// Sort configurations for multi-column sorting
    @Default([]) List<DSDataTableSortItem> sortItems,

    /// Callback when sort changes
    DSDataTableSortCallback? onSortChanged,
  }) = _DSDataTableSort;
}

/// Individual sort item for multi-column sorting
@freezed
class DSDataTableSortItem with _$DSDataTableSortItem {
  const factory DSDataTableSortItem({
    required String columnId,
    required DSDataTableSortDirection direction,
    required int priority,
  }) = _DSDataTableSortItem;
}

/// Empty state configuration
@freezed
class DSDataTableEmptyState with _$DSDataTableEmptyState {
  const factory DSDataTableEmptyState({
    /// Empty state message
    @Default('No data available') String message,

    /// Empty state icon
    IconData? icon,

    /// Empty state illustration widget
    Widget? illustration,

    /// Action button for empty state
    Widget? action,

    /// Whether to show empty state
    @Default(true) bool show,

    /// Custom empty state builder
    DSDataTableEmptyStateBuilder? builder,
  }) = _DSDataTableEmptyState;
}

/// Main configuration for DSDataTable
@freezed
class DSDataTableConfig with _$DSDataTableConfig {
  const factory DSDataTableConfig({
    /// Table variant
    @Default(DSDataTableVariant.resizable) DSDataTableVariant variant,

    /// Whether to show column headers
    @Default(true) bool showHeaders,

    /// Whether to show row dividers
    @Default(true) bool showRowDividers,

    /// Whether to show column dividers
    @Default(false) bool showColumnDividers,

    /// Whether to alternate row colors
    @Default(false) bool alternateRowColors,

    /// Whether to show hover effects
    @Default(true) bool showHoverEffects,

    /// Table border radius
    @Default(8.0) double borderRadius,

    /// Row height
    @Default(48.0) double rowHeight,

    /// Header height
    @Default(56.0) double headerHeight,

    /// Cell padding
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 8))
    EdgeInsets cellPadding,

    /// Header padding
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 12))
    EdgeInsets headerPadding,

    /// Table elevation
    @Default(2.0) double elevation,

    /// Maximum table height (null for unlimited)
    double? maxHeight,

    /// Minimum table height
    @Default(200.0) double minHeight,

    /// Whether the table is scrollable horizontally
    @Default(true) bool horizontalScrollable,

    /// Whether the table is scrollable vertically
    @Default(true) bool verticalScrollable,

    /// Resize configuration
    DSDataTableResizeConfig? resizeConfig,

    /// Freeze configuration for pinned columns
    DSDataTableFreezeConfig? freezeConfig,

    /// Edit mode configuration
    @Default(DSDataTableEditMode.none) DSDataTableEditMode editMode,

    /// Whether to show loading state
    @Default(false) bool showLoading,

    /// Whether to show skeleton state
    @Default(false) bool showSkeleton,

    /// Number of skeleton rows to show
    @Default(5) int skeletonRowCount,

    /// Loading indicator widget
    Widget? loadingIndicator,

    /// Skeleton row builder
    DSDataTableSkeletonBuilder? skeletonBuilder,

    /// Animation duration for state changes
    @Default(Duration(milliseconds: 200)) Duration animationDuration,

    /// Animation curve for state changes
    @Default(Curves.easeInOut) Curve animationCurve,

    /// Whether to enable keyboard navigation
    @Default(true) bool enableKeyboardNavigation,

    /// Whether to enable accessibility features
    @Default(true) bool enableAccessibility,

    /// Custom row actions
    List<DSDataTableRowAction>? rowActions,

    /// Bulk actions for selected rows
    List<DSDataTableBulkAction>? bulkActions,

    /// Context menu items
    List<DSDataTableContextMenuItem>? contextMenuItems,

    /// Custom header actions
    List<Widget>? headerActions,

    /// Footer widget
    Widget? footer,

    /// Whether to show row numbers
    @Default(false) bool showRowNumbers,

    /// Row number column width
    @Default(60.0) double rowNumberWidth,

    /// Whether to enable drag and drop for rows
    @Default(false) bool enableDragAndDrop,

    /// Drag and drop callback
    DSDataTableDragDropCallback? onDragDrop,

    /// Whether to enable column reordering
    @Default(false) bool enableColumnReordering,

    /// Column reorder callback
    DSDataTableColumnReorderCallback? onColumnReorder,

    /// Whether to enable column hiding
    @Default(false) bool enableColumnHiding,

    /// Column visibility callback
    DSDataTableColumnVisibilityCallback? onColumnVisibilityChanged,

    /// Density for the table (compact, standard, comfortable)
    @Default(DSDataTableDensity.standard) DSDataTableDensity density,

    /// Custom theme overrides
    DSDataTableTheme? theme,

    /// Platform-specific configurations
    DSDataTablePlatformConfig? platformConfig,

    /// RTL support configuration
    @Default(true) bool supportRTL,

    /// Accessibility configuration
    DSDataTableAccessibilityConfig? accessibilityConfig,
  }) = _DSDataTableConfig;
}

/// Table density options
enum DSDataTableDensity {
  compact,
  standard,
  comfortable,
}

/// Row action configuration
@freezed
class DSDataTableRowAction with _$DSDataTableRowAction {
  const factory DSDataTableRowAction({
    required String id,
    required String label,
    required IconData icon,
    required DSDataTableRowActionCallback callback,
    String? tooltip,
    @Default(true) bool visible,
    @Default(true) bool enabled,
    Color? color,
  }) = _DSDataTableRowAction;
}

/// Bulk action configuration
@freezed
class DSDataTableBulkAction with _$DSDataTableBulkAction {
  const factory DSDataTableBulkAction({
    required String id,
    required String label,
    required IconData icon,
    required DSDataTableBulkActionCallback callback,
    String? tooltip,
    @Default(true) bool visible,
    @Default(true) bool enabled,
    Color? color,
  }) = _DSDataTableBulkAction;
}

/// Context menu item configuration
@freezed
class DSDataTableContextMenuItem with _$DSDataTableContextMenuItem {
  const factory DSDataTableContextMenuItem({
    required String id,
    required String label,
    IconData? icon,
    required DSDataTableContextMenuCallback callback,
    @Default(true) bool enabled,
    @Default(false) bool isDivider,
  }) = _DSDataTableContextMenuItem;
}

/// Theme configuration for the table
@freezed
class DSDataTableTheme with _$DSDataTableTheme {
  const factory DSDataTableTheme({
    /// Header background color
    Color? headerBackgroundColor,

    /// Header text color
    Color? headerTextColor,

    /// Row background color
    Color? rowBackgroundColor,

    /// Alternate row background color
    Color? alternateRowBackgroundColor,

    /// Selected row background color
    Color? selectedRowBackgroundColor,

    /// Hovered row background color
    Color? hoveredRowBackgroundColor,

    /// Row text color
    Color? rowTextColor,

    /// Selected row text color
    Color? selectedRowTextColor,

    /// Border color
    Color? borderColor,

    /// Divider color
    Color? dividerColor,

    /// Sort icon color
    Color? sortIconColor,

    /// Resize handle color
    Color? resizeHandleColor,

    /// Loading indicator color
    Color? loadingIndicatorColor,

    /// Custom cell styles
    Map<DSDataTableCellType, TextStyle>? cellStyles,

    /// Custom header style
    TextStyle? headerStyle,
  }) = _DSDataTableTheme;
}

/// Platform-specific configuration
@freezed
class DSDataTablePlatformConfig with _$DSDataTablePlatformConfig {
  const factory DSDataTablePlatformConfig({
    /// iOS-specific configurations
    DSDataTableIOSConfig? ios,

    /// Android-specific configurations
    DSDataTableAndroidConfig? android,

    /// Web-specific configurations
    DSDataTableWebConfig? web,
  }) = _DSDataTablePlatformConfig;
}

/// iOS-specific configuration
@freezed
class DSDataTableIOSConfig with _$DSDataTableIOSConfig {
  const factory DSDataTableIOSConfig({
    /// Whether to use iOS-style scrollbars
    @Default(true) bool useIOSScrollbars,

    /// Whether to enable haptic feedback
    @Default(true) bool enableHapticFeedback,

    /// iOS-specific row height
    double? rowHeight,
  }) = _DSDataTableIOSConfig;
}

/// Android-specific configuration
@freezed
class DSDataTableAndroidConfig with _$DSDataTableAndroidConfig {
  const factory DSDataTableAndroidConfig({
    /// Whether to use Material ripple effects
    @Default(true) bool useMaterialRipple,

    /// Android-specific row height
    double? rowHeight,
  }) = _DSDataTableAndroidConfig;
}

/// Web-specific configuration
@freezed
class DSDataTableWebConfig with _$DSDataTableWebConfig {
  const factory DSDataTableWebConfig({
    /// Whether to show horizontal scrollbar
    @Default(true) bool showHorizontalScrollbar,

    /// Whether to show vertical scrollbar
    @Default(true) bool showVerticalScrollbar,

    /// Whether to enable right-click context menu
    @Default(true) bool enableContextMenu,

    /// Web-specific row height
    double? rowHeight,
  }) = _DSDataTableWebConfig;
}

/// Accessibility configuration
@freezed
class DSDataTableAccessibilityConfig with _$DSDataTableAccessibilityConfig {
  const factory DSDataTableAccessibilityConfig({
    /// Whether to announce sort changes
    @Default(true) bool announceSortChanges,

    /// Whether to announce selection changes
    @Default(true) bool announceSelectionChanges,

    /// Whether to provide row and column navigation hints
    @Default(true) bool provideNavigationHints,

    /// Custom semantics for the table
    String? tableSemantics,

    /// Custom semantics for headers
    Map<String, String>? headerSemantics,

    /// Custom semantics for cells
    Map<String, String>? cellSemantics,
  }) = _DSDataTableAccessibilityConfig;
}

/// Callback function types
typedef DSDataTableCellBuilder = Widget Function(
  BuildContext context,
  DSDataTableRow row,
  DSDataTableColumn column,
  dynamic value,
);

typedef DSDataTableHeaderBuilder = Widget Function(
  BuildContext context,
  DSDataTableColumn column,
);

typedef DSDataTableEditCellBuilder = Widget Function(
  BuildContext context,
  DSDataTableRow row,
  DSDataTableColumn column,
  dynamic value,
  ValueChanged<dynamic> onChanged,
);

typedef DSDataTableCellValidator = String? Function(dynamic value);

typedef DSDataTableCellFormatter = String Function(dynamic value);

typedef DSDataTableRowBuilder = Widget Function(
  BuildContext context,
  DSDataTableRow row,
  List<Widget> cells,
);

typedef DSDataTableEmptyStateBuilder = Widget Function(
  BuildContext context,
);

typedef DSDataTableSkeletonBuilder = Widget Function(
  BuildContext context,
  int rowIndex,
);

typedef DSDataTableSelectionCallback = void Function(
  List<String> selectedRowIds,
);

typedef DSDataTableSortCallback = void Function(
  String columnId,
  DSDataTableSortDirection direction,
);

typedef DSDataTableRowActionCallback = void Function(
  DSDataTableRow row,
);

typedef DSDataTableBulkActionCallback = void Function(
  List<DSDataTableRow> rows,
);

typedef DSDataTableContextMenuCallback = void Function(
  DSDataTableRow? row,
  DSDataTableColumn? column,
);

typedef DSDataTableDragDropCallback = void Function(
  DSDataTableRow draggedRow,
  int newIndex,
);

typedef DSDataTableColumnReorderCallback = void Function(
  List<DSDataTableColumn> reorderedColumns,
);

typedef DSDataTableColumnVisibilityCallback = void Function(
  DSDataTableColumn column,
  bool visible,
);

typedef DSDataTableEditCallback = void Function(
  DSDataTableRow row,
  String columnId,
  dynamic newValue,
);

typedef DSDataTableRowSelectCallback = void Function(
  DSDataTableRow row,
  bool selected,
);

/// Data table event types
@freezed
class DSDataTableEvent with _$DSDataTableEvent {
  const factory DSDataTableEvent.sort({
    required String columnId,
    required DSDataTableSortDirection direction,
  }) = DSDataTableSortEvent;

  const factory DSDataTableEvent.select({
    required String rowId,
    required bool selected,
  }) = DSDataTableSelectEvent;

  const factory DSDataTableEvent.edit({
    required String rowId,
    required String columnId,
    required dynamic oldValue,
    required dynamic newValue,
  }) = DSDataTableEditEvent;

  const factory DSDataTableEvent.resize({
    required String columnId,
    required double newWidth,
  }) = DSDataTableResizeEvent;

  const factory DSDataTableEvent.reorder({
    required List<String> newColumnOrder,
  }) = DSDataTableReorderEvent;

  const factory DSDataTableEvent.expand({
    required String rowId,
    required bool expanded,
  }) = DSDataTableExpandEvent;
}

/// Utility functions for DSDataTable
class DSDataTableUtils {
  /// Calculate total width of visible columns
  static double calculateTotalWidth(List<DSDataTableColumn> columns) {
    return columns
        .where((col) => col.visible)
        .fold(0.0, (sum, col) => sum + (col.width ?? 150.0));
  }

  /// Filter rows based on search criteria
  static List<DSDataTableRow> filterRows(
    List<DSDataTableRow> rows,
    String searchQuery, {
    List<String>? searchColumns,
    bool caseSensitive = false,
  }) {
    if (searchQuery.isEmpty) return rows;

    final query = caseSensitive ? searchQuery : searchQuery.toLowerCase();

    return rows.where((row) {
      final columnsToSearch = searchColumns ?? row.data.keys.toList();

      return columnsToSearch.any((columnId) {
        final value = row.getValue(columnId)?.toString() ?? '';
        final searchValue = caseSensitive ? value : value.toLowerCase();
        return searchValue.contains(query);
      });
    }).toList();
  }

  /// Sort rows by column
  static List<DSDataTableRow> sortRows(
    List<DSDataTableRow> rows,
    String columnId,
    DSDataTableSortDirection direction,
  ) {
    if (direction == DSDataTableSortDirection.none) return rows;

    final sortedRows = List<DSDataTableRow>.from(rows);

    sortedRows.sort((a, b) {
      final aValue = a.getValue(columnId);
      final bValue = b.getValue(columnId);

      int comparison = 0;

      if (aValue == null && bValue == null) {
        comparison = 0;
      } else if (aValue == null) {
        comparison = -1;
      } else if (bValue == null) {
        comparison = 1;
      } else if (aValue is Comparable && bValue is Comparable) {
        comparison = aValue.compareTo(bValue);
      } else {
        comparison = aValue.toString().compareTo(bValue.toString());
      }

      return direction == DSDataTableSortDirection.ascending
          ? comparison
          : -comparison;
    });

    return sortedRows;
  }

  /// Get selected rows from a list
  static List<DSDataTableRow> getSelectedRows(List<DSDataTableRow> rows) {
    return rows.where((row) => row.selected).toList();
  }

  /// Update row selection
  static List<DSDataTableRow> updateRowSelection(
    List<DSDataTableRow> rows,
    String rowId,
    bool selected,
    DSDataTableSelectionMode mode,
  ) {
    return rows.map((row) {
      if (row.id == rowId) {
        return row.copyWith(selected: selected);
      } else if (mode == DSDataTableSelectionMode.single && selected) {
        // Deselect other rows for single selection
        return row.copyWith(selected: false);
      }
      return row;
    }).toList();
  }

  /// Calculate row index considering sorting and filtering
  static int getActualRowIndex(
    List<DSDataTableRow> originalRows,
    DSDataTableRow targetRow,
  ) {
    return originalRows.indexWhere((row) => row.id == targetRow.id);
  }

  /// Generate semantic label for table
  static String generateTableSemanticLabel(
    int totalRows,
    int totalColumns,
    int selectedRows,
  ) {
    return 'Data table with $totalRows rows and $totalColumns columns. $selectedRows rows selected.';
  }

  /// Generate semantic label for cell
  static String generateCellSemanticLabel(
    DSDataTableRow row,
    DSDataTableColumn column,
    dynamic value,
    int rowIndex,
    int columnIndex,
  ) {
    final displayValue = value?.toString() ?? 'empty';
    return '${column.label}: $displayValue, row ${rowIndex + 1}, column ${columnIndex + 1}';
  }

  /// Validate column configuration
  static List<String> validateColumns(List<DSDataTableColumn> columns) {
    final errors = <String>[];
    final ids = <String>{};

    for (final column in columns) {
      if (column.id.isEmpty) {
        errors.add('Column ID cannot be empty');
      }

      if (ids.contains(column.id)) {
        errors.add('Duplicate column ID: ${column.id}');
      }
      ids.add(column.id);

      if (column.label.isEmpty) {
        errors.add('Column label cannot be empty for column: ${column.id}');
      }

      if (column.minWidth < 0) {
        errors.add('Minimum width cannot be negative for column: ${column.id}');
      }

      if (column.maxWidth < column.minWidth) {
        errors.add(
            'Maximum width cannot be less than minimum width for column: ${column.id}');
      }

      if (column.width != null &&
          (column.width! < column.minWidth ||
              column.width! > column.maxWidth)) {
        errors.add(
            'Width must be between min and max width for column: ${column.id}');
      }
    }

    return errors;
  }

  /// Validate row data against columns
  static List<String> validateRowData(
    DSDataTableRow row,
    List<DSDataTableColumn> columns,
  ) {
    final errors = <String>[];
    final requiredFields =
        columns.where((col) => col.visible).map((col) => col.field).toSet();

    for (final field in requiredFields) {
      if (!row.hasValue(field)) {
        errors.add('Missing data for field: $field in row: ${row.id}');
      }
    }

    return errors;
  }

  /// Calculate column width based on content
  static double calculateColumnWidth(
    DSDataTableColumn column,
    List<DSDataTableRow> rows,
    TextStyle textStyle,
  ) {
    double maxWidth = column.minWidth;

    // Calculate header width
    final headerWidth =
        _calculateTextWidth(column.label, textStyle) + 32; // padding
    maxWidth = math.max(maxWidth, headerWidth);

    // Calculate content width for first 100 rows (performance optimization)
    final sampleRows = rows.take(100);
    for (final row in sampleRows) {
      final value = row.getDisplayValue(column.field, column.formatter);
      final contentWidth =
          _calculateTextWidth(value, textStyle) + 32; // padding
      maxWidth = math.max(maxWidth, contentWidth);
    }

    return math.min(maxWidth, column.maxWidth);
  }

  /// Calculate text width helper
  static double _calculateTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }

  /// Get keyboard shortcuts for table navigation
  static Map<LogicalKeySet, VoidCallback> getKeyboardShortcuts({
    VoidCallback? onSelectAll,
    VoidCallback? onCopy,
    VoidCallback? onDelete,
    VoidCallback? onEdit,
    VoidCallback? onEscape,
  }) {
    return {
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
          onSelectAll ?? () {},
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
          onCopy ?? () {},
      LogicalKeySet(LogicalKeyboardKey.delete): onDelete ?? () {},
      LogicalKeySet(LogicalKeyboardKey.f2): onEdit ?? () {},
      LogicalKeySet(LogicalKeyboardKey.escape): onEscape ?? () {},
    };
  }

  /// Platform-specific row height calculation
  static double getPlatformRowHeight(
      DSDataTableDensity density, TargetPlatform platform) {
    switch (density) {
      case DSDataTableDensity.compact:
        return platform == TargetPlatform.iOS ? 36.0 : 32.0;
      case DSDataTableDensity.standard:
        return platform == TargetPlatform.iOS ? 48.0 : 48.0;
      case DSDataTableDensity.comfortable:
        return platform == TargetPlatform.iOS ? 60.0 : 56.0;
    }
  }
}
