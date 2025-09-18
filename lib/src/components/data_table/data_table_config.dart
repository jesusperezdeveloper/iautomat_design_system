import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_table_config.freezed.dart';

/// Data table variant types
enum AppDataTableVariant {
  /// Resizable columns table
  resizable,

  /// Pinned columns table
  pinned,

  /// Inline edit table
  inlineEdit,
}

/// Data table state types
enum AppDataTableState {
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
enum AppDataTableColumnAlignment {
  left,
  center,
  right,
}

/// Sort direction for columns
enum AppDataTableSortDirection {
  ascending,
  descending,
  none,
}

/// Selection mode for rows
enum AppDataTableSelectionMode {
  /// No selection allowed
  none,

  /// Single row selection
  single,

  /// Multiple row selection
  multiple,
}

/// Row state
enum AppDataTableRowState {
  normal,
  selected,
  hovered,
  pressed,
  disabled,
  editing,
}

/// Cell type for different data types
enum AppDataTableCellType {
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
enum AppDataTableEditMode {
  none,
  cell,
  row,
}

/// Freeze configuration for pinned columns
@freezed
class AppDataTableFreezeConfig with _$AppDataTableFreezeConfig {
  const factory AppDataTableFreezeConfig({
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
  }) = _AppDataTableFreezeConfig;
}

/// Resize configuration for resizable columns
@freezed
class AppDataTableResizeConfig with _$AppDataTableResizeConfig {
  const factory AppDataTableResizeConfig({
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
  }) = _AppDataTableResizeConfig;
}

/// Column configuration
@freezed
class AppDataTableColumn with _$AppDataTableColumn {
  const AppDataTableColumn._();

  const factory AppDataTableColumn({
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
    @Default(AppDataTableColumnAlignment.left)
    AppDataTableColumnAlignment alignment,

    /// Cell type for this column
    @Default(AppDataTableCellType.text) AppDataTableCellType cellType,

    /// Whether cells in this column are editable
    @Default(false) bool editable,

    /// Custom cell builder
    AppDataTableCellBuilder? cellBuilder,

    /// Custom header builder
    AppDataTableHeaderBuilder? headerBuilder,

    /// Custom edit cell builder for inline editing
    AppDataTableEditCellBuilder? editCellBuilder,

    /// Validator for cell values during editing
    AppDataTableCellValidator? validator,

    /// Formatter for displaying cell values
    AppDataTableCellFormatter? formatter,

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
    @Default(AppDataTableSortDirection.none)
    AppDataTableSortDirection sortDirection,

    /// Sort priority (for multi-column sorting)
    int? sortPriority,
  }) = _AppDataTableColumn;

  /// Whether the column has a custom cell builder
  bool get hasCustomCellBuilder => cellBuilder != null;

  /// Whether the column has a custom header builder
  bool get hasCustomHeaderBuilder => headerBuilder != null;

  /// Whether the column supports editing
  bool get supportsEditing =>
      editable &&
      (cellType != AppDataTableCellType.custom || editCellBuilder != null);

  /// Get the effective alignment for RTL layouts
  AppDataTableColumnAlignment getEffectiveAlignment(
      TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      switch (alignment) {
        case AppDataTableColumnAlignment.left:
          return AppDataTableColumnAlignment.right;
        case AppDataTableColumnAlignment.right:
          return AppDataTableColumnAlignment.left;
        case AppDataTableColumnAlignment.center:
          return AppDataTableColumnAlignment.center;
      }
    }
    return alignment;
  }
}

/// Row data configuration
@freezed
class AppDataTableRow with _$AppDataTableRow {
  const AppDataTableRow._();

  const factory AppDataTableRow({
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
    @Default(AppDataTableRowState.normal) AppDataTableRowState state,

    /// Custom row builder
    AppDataTableRowBuilder? rowBuilder,

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
  }) = _AppDataTableRow;

  /// Get value for a specific column
  dynamic getValue(String columnId) => data[columnId];

  /// Check if the row has data for a column
  bool hasValue(String columnId) => data.containsKey(columnId);

  /// Check if a specific cell is being edited
  bool isCellEditing(String columnId) => editingCells.contains(columnId);

  /// Get display value for a column with optional formatting
  String getDisplayValue(
      String columnId, AppDataTableCellFormatter? formatter) {
    final value = getValue(columnId);
    if (formatter != null) {
      return formatter(value);
    }
    return value?.toString() ?? '';
  }
}

/// Selection configuration
@freezed
class AppDataTableSelection with _$AppDataTableSelection {
  const factory AppDataTableSelection({
    /// Selection mode
    @Default(AppDataTableSelectionMode.none) AppDataTableSelectionMode mode,

    /// Selected row IDs
    @Default([]) List<String> selectedRows,

    /// Whether to show selection checkboxes
    @Default(true) bool showCheckboxes,

    /// Whether to allow select all
    @Default(true) bool allowSelectAll,

    /// Maximum number of selections (null for unlimited)
    int? maxSelections,

    /// Callback when selection changes
    AppDataTableSelectionCallback? onSelectionChanged,
  }) = _AppDataTableSelection;
}

/// Sort configuration
@freezed
class AppDataTableSort with _$AppDataTableSort {
  const factory AppDataTableSort({
    /// Column ID being sorted
    String? columnId,

    /// Sort direction
    @Default(AppDataTableSortDirection.none)
    AppDataTableSortDirection direction,

    /// Whether multi-column sorting is enabled
    @Default(false) bool multiColumn,

    /// Sort configurations for multi-column sorting
    @Default([]) List<AppDataTableSortItem> sortItems,

    /// Callback when sort changes
    AppDataTableSortCallback? onSortChanged,
  }) = _AppDataTableSort;
}

/// Individual sort item for multi-column sorting
@freezed
class AppDataTableSortItem with _$AppDataTableSortItem {
  const factory AppDataTableSortItem({
    required String columnId,
    required AppDataTableSortDirection direction,
    required int priority,
  }) = _AppDataTableSortItem;
}

/// Empty state configuration
@freezed
class AppDataTableEmptyState with _$AppDataTableEmptyState {
  const factory AppDataTableEmptyState({
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
    AppDataTableEmptyStateBuilder? builder,
  }) = _AppDataTableEmptyState;
}

/// Main configuration for AppDataTable
@freezed
class AppDataTableConfig with _$AppDataTableConfig {
  const factory AppDataTableConfig({
    /// Table variant
    @Default(AppDataTableVariant.resizable) AppDataTableVariant variant,

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
    AppDataTableResizeConfig? resizeConfig,

    /// Freeze configuration for pinned columns
    AppDataTableFreezeConfig? freezeConfig,

    /// Edit mode configuration
    @Default(AppDataTableEditMode.none) AppDataTableEditMode editMode,

    /// Whether to show loading state
    @Default(false) bool showLoading,

    /// Whether to show skeleton state
    @Default(false) bool showSkeleton,

    /// Number of skeleton rows to show
    @Default(5) int skeletonRowCount,

    /// Loading indicator widget
    Widget? loadingIndicator,

    /// Skeleton row builder
    AppDataTableSkeletonBuilder? skeletonBuilder,

    /// Animation duration for state changes
    @Default(Duration(milliseconds: 200)) Duration animationDuration,

    /// Animation curve for state changes
    @Default(Curves.easeInOut) Curve animationCurve,

    /// Whether to enable keyboard navigation
    @Default(true) bool enableKeyboardNavigation,

    /// Whether to enable accessibility features
    @Default(true) bool enableAccessibility,

    /// Custom row actions
    List<AppDataTableRowAction>? rowActions,

    /// Bulk actions for selected rows
    List<AppDataTableBulkAction>? bulkActions,

    /// Context menu items
    List<AppDataTableContextMenuItem>? contextMenuItems,

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
    AppDataTableDragDropCallback? onDragDrop,

    /// Whether to enable column reordering
    @Default(false) bool enableColumnReordering,

    /// Column reorder callback
    AppDataTableColumnReorderCallback? onColumnReorder,

    /// Whether to enable column hiding
    @Default(false) bool enableColumnHiding,

    /// Column visibility callback
    AppDataTableColumnVisibilityCallback? onColumnVisibilityChanged,

    /// Density for the table (compact, standard, comfortable)
    @Default(AppDataTableDensity.standard) AppDataTableDensity density,

    /// Custom theme overrides
    AppDataTableTheme? theme,

    /// Platform-specific configurations
    AppDataTablePlatformConfig? platformConfig,

    /// RTL support configuration
    @Default(true) bool supportRTL,

    /// Accessibility configuration
    AppDataTableAccessibilityConfig? accessibilityConfig,
  }) = _AppDataTableConfig;
}

/// Table density options
enum AppDataTableDensity {
  compact,
  standard,
  comfortable,
}

/// Row action configuration
@freezed
class AppDataTableRowAction with _$AppDataTableRowAction {
  const factory AppDataTableRowAction({
    required String id,
    required String label,
    required IconData icon,
    required AppDataTableRowActionCallback callback,
    String? tooltip,
    @Default(true) bool visible,
    @Default(true) bool enabled,
    Color? color,
  }) = _AppDataTableRowAction;
}

/// Bulk action configuration
@freezed
class AppDataTableBulkAction with _$AppDataTableBulkAction {
  const factory AppDataTableBulkAction({
    required String id,
    required String label,
    required IconData icon,
    required AppDataTableBulkActionCallback callback,
    String? tooltip,
    @Default(true) bool visible,
    @Default(true) bool enabled,
    Color? color,
  }) = _AppDataTableBulkAction;
}

/// Context menu item configuration
@freezed
class AppDataTableContextMenuItem with _$AppDataTableContextMenuItem {
  const factory AppDataTableContextMenuItem({
    required String id,
    required String label,
    IconData? icon,
    required AppDataTableContextMenuCallback callback,
    @Default(true) bool enabled,
    @Default(false) bool isDivider,
  }) = _AppDataTableContextMenuItem;
}

/// Theme configuration for the table
@freezed
class AppDataTableTheme with _$AppDataTableTheme {
  const factory AppDataTableTheme({
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
    Map<AppDataTableCellType, TextStyle>? cellStyles,

    /// Custom header style
    TextStyle? headerStyle,
  }) = _AppDataTableTheme;
}

/// Platform-specific configuration
@freezed
class AppDataTablePlatformConfig with _$AppDataTablePlatformConfig {
  const factory AppDataTablePlatformConfig({
    /// iOS-specific configurations
    AppDataTableIOSConfig? ios,

    /// Android-specific configurations
    AppDataTableAndroidConfig? android,

    /// Web-specific configurations
    AppDataTableWebConfig? web,
  }) = _AppDataTablePlatformConfig;
}

/// iOS-specific configuration
@freezed
class AppDataTableIOSConfig with _$AppDataTableIOSConfig {
  const factory AppDataTableIOSConfig({
    /// Whether to use iOS-style scrollbars
    @Default(true) bool useIOSScrollbars,

    /// Whether to enable haptic feedback
    @Default(true) bool enableHapticFeedback,

    /// iOS-specific row height
    double? rowHeight,
  }) = _AppDataTableIOSConfig;
}

/// Android-specific configuration
@freezed
class AppDataTableAndroidConfig with _$AppDataTableAndroidConfig {
  const factory AppDataTableAndroidConfig({
    /// Whether to use Material ripple effects
    @Default(true) bool useMaterialRipple,

    /// Android-specific row height
    double? rowHeight,
  }) = _AppDataTableAndroidConfig;
}

/// Web-specific configuration
@freezed
class AppDataTableWebConfig with _$AppDataTableWebConfig {
  const factory AppDataTableWebConfig({
    /// Whether to show horizontal scrollbar
    @Default(true) bool showHorizontalScrollbar,

    /// Whether to show vertical scrollbar
    @Default(true) bool showVerticalScrollbar,

    /// Whether to enable right-click context menu
    @Default(true) bool enableContextMenu,

    /// Web-specific row height
    double? rowHeight,
  }) = _AppDataTableWebConfig;
}

/// Accessibility configuration
@freezed
class AppDataTableAccessibilityConfig with _$AppDataTableAccessibilityConfig {
  const factory AppDataTableAccessibilityConfig({
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
  }) = _AppDataTableAccessibilityConfig;
}

/// Callback function types
typedef AppDataTableCellBuilder = Widget Function(
  BuildContext context,
  AppDataTableRow row,
  AppDataTableColumn column,
  dynamic value,
);

typedef AppDataTableHeaderBuilder = Widget Function(
  BuildContext context,
  AppDataTableColumn column,
);

typedef AppDataTableEditCellBuilder = Widget Function(
  BuildContext context,
  AppDataTableRow row,
  AppDataTableColumn column,
  dynamic value,
  ValueChanged<dynamic> onChanged,
);

typedef AppDataTableCellValidator = String? Function(dynamic value);

typedef AppDataTableCellFormatter = String Function(dynamic value);

typedef AppDataTableRowBuilder = Widget Function(
  BuildContext context,
  AppDataTableRow row,
  List<Widget> cells,
);

typedef AppDataTableEmptyStateBuilder = Widget Function(
  BuildContext context,
);

typedef AppDataTableSkeletonBuilder = Widget Function(
  BuildContext context,
  int rowIndex,
);

typedef AppDataTableSelectionCallback = void Function(
  List<String> selectedRowIds,
);

typedef AppDataTableSortCallback = void Function(
  String columnId,
  AppDataTableSortDirection direction,
);

typedef AppDataTableRowActionCallback = void Function(
  AppDataTableRow row,
);

typedef AppDataTableBulkActionCallback = void Function(
  List<AppDataTableRow> rows,
);

typedef AppDataTableContextMenuCallback = void Function(
  AppDataTableRow? row,
  AppDataTableColumn? column,
);

typedef AppDataTableDragDropCallback = void Function(
  AppDataTableRow draggedRow,
  int newIndex,
);

typedef AppDataTableColumnReorderCallback = void Function(
  List<AppDataTableColumn> reorderedColumns,
);

typedef AppDataTableColumnVisibilityCallback = void Function(
  AppDataTableColumn column,
  bool visible,
);

typedef AppDataTableEditCallback = void Function(
  AppDataTableRow row,
  String columnId,
  dynamic newValue,
);

typedef AppDataTableRowSelectCallback = void Function(
  AppDataTableRow row,
  bool selected,
);

/// Data table event types
@freezed
class AppDataTableEvent with _$AppDataTableEvent {
  const factory AppDataTableEvent.sort({
    required String columnId,
    required AppDataTableSortDirection direction,
  }) = AppDataTableSortEvent;

  const factory AppDataTableEvent.select({
    required String rowId,
    required bool selected,
  }) = AppDataTableSelectEvent;

  const factory AppDataTableEvent.edit({
    required String rowId,
    required String columnId,
    required dynamic oldValue,
    required dynamic newValue,
  }) = AppDataTableEditEvent;

  const factory AppDataTableEvent.resize({
    required String columnId,
    required double newWidth,
  }) = AppDataTableResizeEvent;

  const factory AppDataTableEvent.reorder({
    required List<String> newColumnOrder,
  }) = AppDataTableReorderEvent;

  const factory AppDataTableEvent.expand({
    required String rowId,
    required bool expanded,
  }) = AppDataTableExpandEvent;
}

/// Utility functions for AppDataTable
class AppDataTableUtils {
  /// Calculate total width of visible columns
  static double calculateTotalWidth(List<AppDataTableColumn> columns) {
    return columns
        .where((col) => col.visible)
        .fold(0.0, (sum, col) => sum + (col.width ?? 150.0));
  }

  /// Filter rows based on search criteria
  static List<AppDataTableRow> filterRows(
    List<AppDataTableRow> rows,
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
  static List<AppDataTableRow> sortRows(
    List<AppDataTableRow> rows,
    String columnId,
    AppDataTableSortDirection direction,
  ) {
    if (direction == AppDataTableSortDirection.none) return rows;

    final sortedRows = List<AppDataTableRow>.from(rows);

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

      return direction == AppDataTableSortDirection.ascending
          ? comparison
          : -comparison;
    });

    return sortedRows;
  }

  /// Get selected rows from a list
  static List<AppDataTableRow> getSelectedRows(List<AppDataTableRow> rows) {
    return rows.where((row) => row.selected).toList();
  }

  /// Update row selection
  static List<AppDataTableRow> updateRowSelection(
    List<AppDataTableRow> rows,
    String rowId,
    bool selected,
    AppDataTableSelectionMode mode,
  ) {
    return rows.map((row) {
      if (row.id == rowId) {
        return row.copyWith(selected: selected);
      } else if (mode == AppDataTableSelectionMode.single && selected) {
        // Deselect other rows for single selection
        return row.copyWith(selected: false);
      }
      return row;
    }).toList();
  }

  /// Calculate row index considering sorting and filtering
  static int getActualRowIndex(
    List<AppDataTableRow> originalRows,
    AppDataTableRow targetRow,
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
    AppDataTableRow row,
    AppDataTableColumn column,
    dynamic value,
    int rowIndex,
    int columnIndex,
  ) {
    final displayValue = value?.toString() ?? 'empty';
    return '${column.label}: $displayValue, row ${rowIndex + 1}, column ${columnIndex + 1}';
  }

  /// Validate column configuration
  static List<String> validateColumns(List<AppDataTableColumn> columns) {
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
    AppDataTableRow row,
    List<AppDataTableColumn> columns,
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
    AppDataTableColumn column,
    List<AppDataTableRow> rows,
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
      AppDataTableDensity density, TargetPlatform platform) {
    switch (density) {
      case AppDataTableDensity.compact:
        return platform == TargetPlatform.iOS ? 36.0 : 32.0;
      case AppDataTableDensity.standard:
        return platform == TargetPlatform.iOS ? 48.0 : 48.0;
      case AppDataTableDensity.comfortable:
        return platform == TargetPlatform.iOS ? 60.0 : 56.0;
    }
  }
}
