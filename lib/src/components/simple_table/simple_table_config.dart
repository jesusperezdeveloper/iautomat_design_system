import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_table_config.freezed.dart';

/// Simple table variant types
enum DSSimpleTableVariant {
  /// Standard table layout
  standard,

  /// Compact table with reduced spacing
  compact,
}

/// Simple table state types
enum DSSimpleTableState {
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
enum DSSimpleTableColumnAlignment {
  left,
  center,
  right,
}

/// Cell type for different data types
enum DSSimpleTableCellType {
  text,
  number,
  boolean,
  date,
  icon,
  custom,
}

/// Row state
enum DSSimpleTableRowState {
  normal,
  selected,
  hovered,
  pressed,
  disabled,
}

/// Selection mode for rows
enum DSSimpleTableSelectionMode {
  /// No selection allowed
  none,

  /// Single row selection
  single,

  /// Multiple row selection
  multiple,
}

/// Sort direction for columns
enum DSSimpleTableSortDirection {
  ascending,
  descending,
  none,
}

/// Density options for the table
enum DSSimpleTableDensity {
  compact,
  standard,
  comfortable,
}

/// Column configuration for simple table
@freezed
class DSSimpleTableColumn with _$DSSimpleTableColumn {
  const DSSimpleTableColumn._();

  const factory DSSimpleTableColumn({
    /// Unique identifier for the column
    required String id,

    /// Display label for the column header
    required String label,

    /// Data field name for row data access
    required String field,

    /// Column width (null for flex sizing)
    double? width,

    /// Flex value for column width distribution
    @Default(1) int flex,

    /// Whether the column is sortable
    @Default(false) bool sortable,

    /// Whether the column is visible
    @Default(true) bool visible,

    /// Column alignment
    @Default(DSSimpleTableColumnAlignment.left)
    DSSimpleTableColumnAlignment alignment,

    /// Cell type for this column
    @Default(DSSimpleTableCellType.text) DSSimpleTableCellType cellType,

    /// Custom cell builder
    DSSimpleTableCellBuilder? cellBuilder,

    /// Custom header builder
    DSSimpleTableHeaderBuilder? headerBuilder,

    /// Formatter for displaying cell values
    DSSimpleTableCellFormatter? formatter,

    /// Tooltip for the column header
    String? tooltip,

    /// Icon for the column header
    IconData? icon,

    /// Custom data for the column
    Map<String, dynamic>? customData,

    /// Accessibility label for the column
    String? semanticLabel,

    /// Sort direction for this column
    @Default(DSSimpleTableSortDirection.none)
    DSSimpleTableSortDirection sortDirection,
  }) = _DSSimpleTableColumn;

  /// Whether the column has a custom cell builder
  bool get hasCustomCellBuilder => cellBuilder != null;

  /// Whether the column has a custom header builder
  bool get hasCustomHeaderBuilder => headerBuilder != null;

  /// Get the effective alignment for RTL layouts
  DSSimpleTableColumnAlignment getEffectiveAlignment(
      TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      switch (alignment) {
        case DSSimpleTableColumnAlignment.left:
          return DSSimpleTableColumnAlignment.right;
        case DSSimpleTableColumnAlignment.right:
          return DSSimpleTableColumnAlignment.left;
        case DSSimpleTableColumnAlignment.center:
          return DSSimpleTableColumnAlignment.center;
      }
    }
    return alignment;
  }
}

/// Row data configuration
@freezed
class DSSimpleTableRow with _$DSSimpleTableRow {
  const DSSimpleTableRow._();

  const factory DSSimpleTableRow({
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
    @Default(DSSimpleTableRowState.normal) DSSimpleTableRowState state,

    /// Custom row builder
    DSSimpleTableRowBuilder? rowBuilder,

    /// Row height override
    double? height,

    /// Row color override
    Color? color,

    /// Custom data for the row
    Map<String, dynamic>? customData,

    /// Accessibility label for the row
    String? semanticLabel,
  }) = _DSSimpleTableRow;

  /// Get value for a specific column
  dynamic getValue(String columnId) => data[columnId];

  /// Check if the row has data for a column
  bool hasValue(String columnId) => data.containsKey(columnId);

  /// Get display value for a column with optional formatting
  String getDisplayValue(
      String columnId, DSSimpleTableCellFormatter? formatter) {
    final value = getValue(columnId);
    if (formatter != null) {
      return formatter(value);
    }
    return value?.toString() ?? '';
  }
}

/// Selection configuration
@freezed
class DSSimpleTableSelection with _$DSSimpleTableSelection {
  const factory DSSimpleTableSelection({
    /// Selection mode
    @Default(DSSimpleTableSelectionMode.none) DSSimpleTableSelectionMode mode,

    /// Selected row IDs
    @Default([]) List<String> selectedRows,

    /// Whether to show selection checkboxes
    @Default(true) bool showCheckboxes,

    /// Whether to allow select all
    @Default(true) bool allowSelectAll,

    /// Maximum number of selections (null for unlimited)
    int? maxSelections,

    /// Callback when selection changes
    DSSimpleTableSelectionCallback? onSelectionChanged,
  }) = _DSSimpleTableSelection;
}

/// Sort configuration
@freezed
class DSSimpleTableSort with _$DSSimpleTableSort {
  const factory DSSimpleTableSort({
    /// Column ID being sorted
    String? columnId,

    /// Sort direction
    @Default(DSSimpleTableSortDirection.none)
    DSSimpleTableSortDirection direction,

    /// Callback when sort changes
    DSSimpleTableSortCallback? onSortChanged,
  }) = _DSSimpleTableSort;
}

/// Empty state configuration
@freezed
class DSSimpleTableEmptyState with _$DSSimpleTableEmptyState {
  const factory DSSimpleTableEmptyState({
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
    DSSimpleTableEmptyStateBuilder? builder,
  }) = _DSSimpleTableEmptyState;
}

/// Theme configuration for the simple table
@freezed
class DSSimpleTableTheme with _$DSSimpleTableTheme {
  const factory DSSimpleTableTheme({
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

    /// Loading indicator color
    Color? loadingIndicatorColor,

    /// Custom cell styles
    Map<DSSimpleTableCellType, TextStyle>? cellStyles,

    /// Custom header style
    TextStyle? headerStyle,
  }) = _DSSimpleTableTheme;
}

/// Platform-specific configuration
@freezed
class DSSimpleTablePlatformConfig with _$DSSimpleTablePlatformConfig {
  const factory DSSimpleTablePlatformConfig({
    /// iOS-specific configurations
    DSSimpleTableIOSConfig? ios,

    /// Android-specific configurations
    DSSimpleTableAndroidConfig? android,

    /// Web-specific configurations
    DSSimpleTableWebConfig? web,
  }) = _DSSimpleTablePlatformConfig;
}

/// iOS-specific configuration
@freezed
class DSSimpleTableIOSConfig with _$DSSimpleTableIOSConfig {
  const factory DSSimpleTableIOSConfig({
    /// Whether to use iOS-style scrollbars
    @Default(true) bool useIOSScrollbars,

    /// Whether to enable haptic feedback
    @Default(true) bool enableHapticFeedback,

    /// iOS-specific row height
    double? rowHeight,
  }) = _DSSimpleTableIOSConfig;
}

/// Android-specific configuration
@freezed
class DSSimpleTableAndroidConfig with _$DSSimpleTableAndroidConfig {
  const factory DSSimpleTableAndroidConfig({
    /// Whether to use Material ripple effects
    @Default(true) bool useMaterialRipple,

    /// Android-specific row height
    double? rowHeight,
  }) = _DSSimpleTableAndroidConfig;
}

/// Web-specific configuration
@freezed
class DSSimpleTableWebConfig with _$DSSimpleTableWebConfig {
  const factory DSSimpleTableWebConfig({
    /// Whether to show horizontal scrollbar
    @Default(true) bool showHorizontalScrollbar,

    /// Whether to show vertical scrollbar
    @Default(true) bool showVerticalScrollbar,

    /// Whether to enable right-click context menu
    @Default(true) bool enableContextMenu,

    /// Web-specific row height
    double? rowHeight,
  }) = _DSSimpleTableWebConfig;
}

/// Accessibility configuration
@freezed
class DSSimpleTableAccessibilityConfig
    with _$DSSimpleTableAccessibilityConfig {
  const factory DSSimpleTableAccessibilityConfig({
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
  }) = _DSSimpleTableAccessibilityConfig;
}

/// Main configuration for DSSimpleTable
@freezed
class DSSimpleTableConfig with _$DSSimpleTableConfig {
  const factory DSSimpleTableConfig({
    /// Table variant
    @Default(DSSimpleTableVariant.standard) DSSimpleTableVariant variant,

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

    /// Whether to show loading state
    @Default(false) bool showLoading,

    /// Whether to show skeleton state
    @Default(false) bool showSkeleton,

    /// Number of skeleton rows to show
    @Default(5) int skeletonRowCount,

    /// Loading indicator widget
    Widget? loadingIndicator,

    /// Skeleton row builder
    DSSimpleTableSkeletonBuilder? skeletonBuilder,

    /// Animation duration for state changes
    @Default(Duration(milliseconds: 200)) Duration animationDuration,

    /// Animation curve for state changes
    @Default(Curves.easeInOut) Curve animationCurve,

    /// Whether to enable keyboard navigation
    @Default(true) bool enableKeyboardNavigation,

    /// Whether to enable accessibility features
    @Default(true) bool enableAccessibility,

    /// Footer widget
    Widget? footer,

    /// Whether to show row numbers
    @Default(false) bool showRowNumbers,

    /// Row number column width
    @Default(60.0) double rowNumberWidth,

    /// Density for the table
    @Default(DSSimpleTableDensity.standard) DSSimpleTableDensity density,

    /// Custom theme overrides
    DSSimpleTableTheme? theme,

    /// Platform-specific configurations
    DSSimpleTablePlatformConfig? platformConfig,

    /// RTL support configuration
    @Default(true) bool supportRTL,

    /// Accessibility configuration
    DSSimpleTableAccessibilityConfig? accessibilityConfig,
  }) = _DSSimpleTableConfig;
}

/// Callback function types
typedef DSSimpleTableCellBuilder = Widget Function(
  BuildContext context,
  DSSimpleTableRow row,
  DSSimpleTableColumn column,
  dynamic value,
);

typedef DSSimpleTableHeaderBuilder = Widget Function(
  BuildContext context,
  DSSimpleTableColumn column,
);

typedef DSSimpleTableCellFormatter = String Function(dynamic value);

typedef DSSimpleTableRowBuilder = Widget Function(
  BuildContext context,
  DSSimpleTableRow row,
  List<Widget> cells,
);

typedef DSSimpleTableEmptyStateBuilder = Widget Function(
  BuildContext context,
);

typedef DSSimpleTableSkeletonBuilder = Widget Function(
  BuildContext context,
  int rowIndex,
);

typedef DSSimpleTableSelectionCallback = void Function(
  List<String> selectedRowIds,
);

typedef DSSimpleTableSortCallback = void Function(
  String columnId,
  DSSimpleTableSortDirection direction,
);

typedef DSSimpleTableRowSelectCallback = void Function(
  DSSimpleTableRow row,
  bool selected,
);

/// Simple table event types
@freezed
class DSSimpleTableEvent with _$DSSimpleTableEvent {
  const factory DSSimpleTableEvent.sort({
    required String columnId,
    required DSSimpleTableSortDirection direction,
  }) = DSSimpleTableSortEvent;

  const factory DSSimpleTableEvent.select({
    required String rowId,
    required bool selected,
  }) = DSSimpleTableSelectEvent;

  const factory DSSimpleTableEvent.hover({
    required String rowId,
    required bool hovered,
  }) = DSSimpleTableHoverEvent;
}

/// Utility functions for DSSimpleTable
class DSSimpleTableUtils {
  /// Calculate total flex for visible columns
  static int calculateTotalFlex(List<DSSimpleTableColumn> columns) {
    return columns
        .where((col) => col.visible)
        .fold(0, (sum, col) => sum + col.flex);
  }

  /// Filter rows based on search criteria
  static List<DSSimpleTableRow> filterRows(
    List<DSSimpleTableRow> rows,
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
  static List<DSSimpleTableRow> sortRows(
    List<DSSimpleTableRow> rows,
    String columnId,
    DSSimpleTableSortDirection direction,
  ) {
    if (direction == DSSimpleTableSortDirection.none) return rows;

    final sortedRows = List<DSSimpleTableRow>.from(rows);

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

      return direction == DSSimpleTableSortDirection.ascending
          ? comparison
          : -comparison;
    });

    return sortedRows;
  }

  /// Get selected rows from a list
  static List<DSSimpleTableRow> getSelectedRows(List<DSSimpleTableRow> rows) {
    return rows.where((row) => row.selected).toList();
  }

  /// Update row selection
  static List<DSSimpleTableRow> updateRowSelection(
    List<DSSimpleTableRow> rows,
    String rowId,
    bool selected,
    DSSimpleTableSelectionMode mode,
  ) {
    return rows.map((row) {
      if (row.id == rowId) {
        return row.copyWith(selected: selected);
      } else if (mode == DSSimpleTableSelectionMode.single && selected) {
        // Deselect other rows for single selection
        return row.copyWith(selected: false);
      }
      return row;
    }).toList();
  }

  /// Generate semantic label for table
  static String generateTableSemanticLabel(
    int totalRows,
    int totalColumns,
    int selectedRows,
  ) {
    return 'Simple table with $totalRows rows and $totalColumns columns. $selectedRows rows selected.';
  }

  /// Generate semantic label for cell
  static String generateCellSemanticLabel(
    DSSimpleTableRow row,
    DSSimpleTableColumn column,
    dynamic value,
    int rowIndex,
    int columnIndex,
  ) {
    final displayValue = value?.toString() ?? 'empty';
    return '${column.label}: $displayValue, row ${rowIndex + 1}, column ${columnIndex + 1}';
  }

  /// Validate column configuration
  static List<String> validateColumns(List<DSSimpleTableColumn> columns) {
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

      if (column.flex < 1) {
        errors.add('Column flex must be at least 1 for column: ${column.id}');
      }
    }

    return errors;
  }

  /// Validate row data against columns
  static List<String> validateRowData(
    DSSimpleTableRow row,
    List<DSSimpleTableColumn> columns,
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

  /// Get keyboard shortcuts for table navigation
  static Map<LogicalKeySet, VoidCallback> getKeyboardShortcuts({
    VoidCallback? onSelectAll,
    VoidCallback? onCopy,
    VoidCallback? onDelete,
    VoidCallback? onEscape,
  }) {
    return {
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
          onSelectAll ?? () {},
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
          onCopy ?? () {},
      LogicalKeySet(LogicalKeyboardKey.delete): onDelete ?? () {},
      LogicalKeySet(LogicalKeyboardKey.escape): onEscape ?? () {},
    };
  }

  /// Platform-specific row height calculation
  static double getPlatformRowHeight(
      DSSimpleTableDensity density, TargetPlatform platform) {
    switch (density) {
      case DSSimpleTableDensity.compact:
        return platform == TargetPlatform.iOS ? 36.0 : 32.0;
      case DSSimpleTableDensity.standard:
        return platform == TargetPlatform.iOS ? 48.0 : 48.0;
      case DSSimpleTableDensity.comfortable:
        return platform == TargetPlatform.iOS ? 60.0 : 56.0;
    }
  }

  /// Calculate row height based on density and config
  static double getRowHeight(
      DSSimpleTableConfig config, TargetPlatform platform) {
    if (config.variant == DSSimpleTableVariant.compact) {
      return getPlatformRowHeight(DSSimpleTableDensity.compact, platform);
    }
    return config.rowHeight;
  }

  /// Calculate header height based on density and config
  static double getHeaderHeight(
      DSSimpleTableConfig config, TargetPlatform platform) {
    if (config.variant == DSSimpleTableVariant.compact) {
      return config.headerHeight * 0.8; // 20% smaller for compact
    }
    return config.headerHeight;
  }

  /// Calculate padding based on density and config
  static EdgeInsets getCellPadding(DSSimpleTableConfig config) {
    if (config.variant == DSSimpleTableVariant.compact) {
      return EdgeInsets.symmetric(
        horizontal: config.cellPadding.horizontal * 0.75,
        vertical: config.cellPadding.vertical * 0.5,
      );
    }
    return config.cellPadding;
  }

  /// Calculate header padding based on density and config
  static EdgeInsets getHeaderPadding(DSSimpleTableConfig config) {
    if (config.variant == DSSimpleTableVariant.compact) {
      return EdgeInsets.symmetric(
        horizontal: config.headerPadding.horizontal * 0.75,
        vertical: config.headerPadding.vertical * 0.5,
      );
    }
    return config.headerPadding;
  }
}
