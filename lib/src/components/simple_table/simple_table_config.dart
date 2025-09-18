import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_table_config.freezed.dart';

/// Simple table variant types
enum AppSimpleTableVariant {
  /// Standard table layout
  standard,

  /// Compact table with reduced spacing
  compact,
}

/// Simple table state types
enum AppSimpleTableState {
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
enum AppSimpleTableColumnAlignment {
  left,
  center,
  right,
}

/// Cell type for different data types
enum AppSimpleTableCellType {
  text,
  number,
  boolean,
  date,
  icon,
  custom,
}

/// Row state
enum AppSimpleTableRowState {
  normal,
  selected,
  hovered,
  pressed,
  disabled,
}

/// Selection mode for rows
enum AppSimpleTableSelectionMode {
  /// No selection allowed
  none,

  /// Single row selection
  single,

  /// Multiple row selection
  multiple,
}

/// Sort direction for columns
enum AppSimpleTableSortDirection {
  ascending,
  descending,
  none,
}

/// Density options for the table
enum AppSimpleTableDensity {
  compact,
  standard,
  comfortable,
}

/// Column configuration for simple table
@freezed
class AppSimpleTableColumn with _$AppSimpleTableColumn {
  const AppSimpleTableColumn._();

  const factory AppSimpleTableColumn({
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
    @Default(AppSimpleTableColumnAlignment.left)
    AppSimpleTableColumnAlignment alignment,

    /// Cell type for this column
    @Default(AppSimpleTableCellType.text) AppSimpleTableCellType cellType,

    /// Custom cell builder
    AppSimpleTableCellBuilder? cellBuilder,

    /// Custom header builder
    AppSimpleTableHeaderBuilder? headerBuilder,

    /// Formatter for displaying cell values
    AppSimpleTableCellFormatter? formatter,

    /// Tooltip for the column header
    String? tooltip,

    /// Icon for the column header
    IconData? icon,

    /// Custom data for the column
    Map<String, dynamic>? customData,

    /// Accessibility label for the column
    String? semanticLabel,

    /// Sort direction for this column
    @Default(AppSimpleTableSortDirection.none)
    AppSimpleTableSortDirection sortDirection,
  }) = _AppSimpleTableColumn;

  /// Whether the column has a custom cell builder
  bool get hasCustomCellBuilder => cellBuilder != null;

  /// Whether the column has a custom header builder
  bool get hasCustomHeaderBuilder => headerBuilder != null;

  /// Get the effective alignment for RTL layouts
  AppSimpleTableColumnAlignment getEffectiveAlignment(
      TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      switch (alignment) {
        case AppSimpleTableColumnAlignment.left:
          return AppSimpleTableColumnAlignment.right;
        case AppSimpleTableColumnAlignment.right:
          return AppSimpleTableColumnAlignment.left;
        case AppSimpleTableColumnAlignment.center:
          return AppSimpleTableColumnAlignment.center;
      }
    }
    return alignment;
  }
}

/// Row data configuration
@freezed
class AppSimpleTableRow with _$AppSimpleTableRow {
  const AppSimpleTableRow._();

  const factory AppSimpleTableRow({
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
    @Default(AppSimpleTableRowState.normal) AppSimpleTableRowState state,

    /// Custom row builder
    AppSimpleTableRowBuilder? rowBuilder,

    /// Row height override
    double? height,

    /// Row color override
    Color? color,

    /// Custom data for the row
    Map<String, dynamic>? customData,

    /// Accessibility label for the row
    String? semanticLabel,
  }) = _AppSimpleTableRow;

  /// Get value for a specific column
  dynamic getValue(String columnId) => data[columnId];

  /// Check if the row has data for a column
  bool hasValue(String columnId) => data.containsKey(columnId);

  /// Get display value for a column with optional formatting
  String getDisplayValue(
      String columnId, AppSimpleTableCellFormatter? formatter) {
    final value = getValue(columnId);
    if (formatter != null) {
      return formatter(value);
    }
    return value?.toString() ?? '';
  }
}

/// Selection configuration
@freezed
class AppSimpleTableSelection with _$AppSimpleTableSelection {
  const factory AppSimpleTableSelection({
    /// Selection mode
    @Default(AppSimpleTableSelectionMode.none) AppSimpleTableSelectionMode mode,

    /// Selected row IDs
    @Default([]) List<String> selectedRows,

    /// Whether to show selection checkboxes
    @Default(true) bool showCheckboxes,

    /// Whether to allow select all
    @Default(true) bool allowSelectAll,

    /// Maximum number of selections (null for unlimited)
    int? maxSelections,

    /// Callback when selection changes
    AppSimpleTableSelectionCallback? onSelectionChanged,
  }) = _AppSimpleTableSelection;
}

/// Sort configuration
@freezed
class AppSimpleTableSort with _$AppSimpleTableSort {
  const factory AppSimpleTableSort({
    /// Column ID being sorted
    String? columnId,

    /// Sort direction
    @Default(AppSimpleTableSortDirection.none)
    AppSimpleTableSortDirection direction,

    /// Callback when sort changes
    AppSimpleTableSortCallback? onSortChanged,
  }) = _AppSimpleTableSort;
}

/// Empty state configuration
@freezed
class AppSimpleTableEmptyState with _$AppSimpleTableEmptyState {
  const factory AppSimpleTableEmptyState({
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
    AppSimpleTableEmptyStateBuilder? builder,
  }) = _AppSimpleTableEmptyState;
}

/// Theme configuration for the simple table
@freezed
class AppSimpleTableTheme with _$AppSimpleTableTheme {
  const factory AppSimpleTableTheme({
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
    Map<AppSimpleTableCellType, TextStyle>? cellStyles,

    /// Custom header style
    TextStyle? headerStyle,
  }) = _AppSimpleTableTheme;
}

/// Platform-specific configuration
@freezed
class AppSimpleTablePlatformConfig with _$AppSimpleTablePlatformConfig {
  const factory AppSimpleTablePlatformConfig({
    /// iOS-specific configurations
    AppSimpleTableIOSConfig? ios,

    /// Android-specific configurations
    AppSimpleTableAndroidConfig? android,

    /// Web-specific configurations
    AppSimpleTableWebConfig? web,
  }) = _AppSimpleTablePlatformConfig;
}

/// iOS-specific configuration
@freezed
class AppSimpleTableIOSConfig with _$AppSimpleTableIOSConfig {
  const factory AppSimpleTableIOSConfig({
    /// Whether to use iOS-style scrollbars
    @Default(true) bool useIOSScrollbars,

    /// Whether to enable haptic feedback
    @Default(true) bool enableHapticFeedback,

    /// iOS-specific row height
    double? rowHeight,
  }) = _AppSimpleTableIOSConfig;
}

/// Android-specific configuration
@freezed
class AppSimpleTableAndroidConfig with _$AppSimpleTableAndroidConfig {
  const factory AppSimpleTableAndroidConfig({
    /// Whether to use Material ripple effects
    @Default(true) bool useMaterialRipple,

    /// Android-specific row height
    double? rowHeight,
  }) = _AppSimpleTableAndroidConfig;
}

/// Web-specific configuration
@freezed
class AppSimpleTableWebConfig with _$AppSimpleTableWebConfig {
  const factory AppSimpleTableWebConfig({
    /// Whether to show horizontal scrollbar
    @Default(true) bool showHorizontalScrollbar,

    /// Whether to show vertical scrollbar
    @Default(true) bool showVerticalScrollbar,

    /// Whether to enable right-click context menu
    @Default(true) bool enableContextMenu,

    /// Web-specific row height
    double? rowHeight,
  }) = _AppSimpleTableWebConfig;
}

/// Accessibility configuration
@freezed
class AppSimpleTableAccessibilityConfig
    with _$AppSimpleTableAccessibilityConfig {
  const factory AppSimpleTableAccessibilityConfig({
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
  }) = _AppSimpleTableAccessibilityConfig;
}

/// Main configuration for AppSimpleTable
@freezed
class AppSimpleTableConfig with _$AppSimpleTableConfig {
  const factory AppSimpleTableConfig({
    /// Table variant
    @Default(AppSimpleTableVariant.standard) AppSimpleTableVariant variant,

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
    AppSimpleTableSkeletonBuilder? skeletonBuilder,

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
    @Default(AppSimpleTableDensity.standard) AppSimpleTableDensity density,

    /// Custom theme overrides
    AppSimpleTableTheme? theme,

    /// Platform-specific configurations
    AppSimpleTablePlatformConfig? platformConfig,

    /// RTL support configuration
    @Default(true) bool supportRTL,

    /// Accessibility configuration
    AppSimpleTableAccessibilityConfig? accessibilityConfig,
  }) = _AppSimpleTableConfig;
}

/// Callback function types
typedef AppSimpleTableCellBuilder = Widget Function(
  BuildContext context,
  AppSimpleTableRow row,
  AppSimpleTableColumn column,
  dynamic value,
);

typedef AppSimpleTableHeaderBuilder = Widget Function(
  BuildContext context,
  AppSimpleTableColumn column,
);

typedef AppSimpleTableCellFormatter = String Function(dynamic value);

typedef AppSimpleTableRowBuilder = Widget Function(
  BuildContext context,
  AppSimpleTableRow row,
  List<Widget> cells,
);

typedef AppSimpleTableEmptyStateBuilder = Widget Function(
  BuildContext context,
);

typedef AppSimpleTableSkeletonBuilder = Widget Function(
  BuildContext context,
  int rowIndex,
);

typedef AppSimpleTableSelectionCallback = void Function(
  List<String> selectedRowIds,
);

typedef AppSimpleTableSortCallback = void Function(
  String columnId,
  AppSimpleTableSortDirection direction,
);

typedef AppSimpleTableRowSelectCallback = void Function(
  AppSimpleTableRow row,
  bool selected,
);

/// Simple table event types
@freezed
class AppSimpleTableEvent with _$AppSimpleTableEvent {
  const factory AppSimpleTableEvent.sort({
    required String columnId,
    required AppSimpleTableSortDirection direction,
  }) = AppSimpleTableSortEvent;

  const factory AppSimpleTableEvent.select({
    required String rowId,
    required bool selected,
  }) = AppSimpleTableSelectEvent;

  const factory AppSimpleTableEvent.hover({
    required String rowId,
    required bool hovered,
  }) = AppSimpleTableHoverEvent;
}

/// Utility functions for AppSimpleTable
class AppSimpleTableUtils {
  /// Calculate total flex for visible columns
  static int calculateTotalFlex(List<AppSimpleTableColumn> columns) {
    return columns
        .where((col) => col.visible)
        .fold(0, (sum, col) => sum + col.flex);
  }

  /// Filter rows based on search criteria
  static List<AppSimpleTableRow> filterRows(
    List<AppSimpleTableRow> rows,
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
  static List<AppSimpleTableRow> sortRows(
    List<AppSimpleTableRow> rows,
    String columnId,
    AppSimpleTableSortDirection direction,
  ) {
    if (direction == AppSimpleTableSortDirection.none) return rows;

    final sortedRows = List<AppSimpleTableRow>.from(rows);

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

      return direction == AppSimpleTableSortDirection.ascending
          ? comparison
          : -comparison;
    });

    return sortedRows;
  }

  /// Get selected rows from a list
  static List<AppSimpleTableRow> getSelectedRows(List<AppSimpleTableRow> rows) {
    return rows.where((row) => row.selected).toList();
  }

  /// Update row selection
  static List<AppSimpleTableRow> updateRowSelection(
    List<AppSimpleTableRow> rows,
    String rowId,
    bool selected,
    AppSimpleTableSelectionMode mode,
  ) {
    return rows.map((row) {
      if (row.id == rowId) {
        return row.copyWith(selected: selected);
      } else if (mode == AppSimpleTableSelectionMode.single && selected) {
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
    AppSimpleTableRow row,
    AppSimpleTableColumn column,
    dynamic value,
    int rowIndex,
    int columnIndex,
  ) {
    final displayValue = value?.toString() ?? 'empty';
    return '${column.label}: $displayValue, row ${rowIndex + 1}, column ${columnIndex + 1}';
  }

  /// Validate column configuration
  static List<String> validateColumns(List<AppSimpleTableColumn> columns) {
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
    AppSimpleTableRow row,
    List<AppSimpleTableColumn> columns,
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
      AppSimpleTableDensity density, TargetPlatform platform) {
    switch (density) {
      case AppSimpleTableDensity.compact:
        return platform == TargetPlatform.iOS ? 36.0 : 32.0;
      case AppSimpleTableDensity.standard:
        return platform == TargetPlatform.iOS ? 48.0 : 48.0;
      case AppSimpleTableDensity.comfortable:
        return platform == TargetPlatform.iOS ? 60.0 : 56.0;
    }
  }

  /// Calculate row height based on density and config
  static double getRowHeight(
      AppSimpleTableConfig config, TargetPlatform platform) {
    if (config.variant == AppSimpleTableVariant.compact) {
      return getPlatformRowHeight(AppSimpleTableDensity.compact, platform);
    }
    return config.rowHeight;
  }

  /// Calculate header height based on density and config
  static double getHeaderHeight(
      AppSimpleTableConfig config, TargetPlatform platform) {
    if (config.variant == AppSimpleTableVariant.compact) {
      return config.headerHeight * 0.8; // 20% smaller for compact
    }
    return config.headerHeight;
  }

  /// Calculate padding based on density and config
  static EdgeInsets getCellPadding(AppSimpleTableConfig config) {
    if (config.variant == AppSimpleTableVariant.compact) {
      return EdgeInsets.symmetric(
        horizontal: config.cellPadding.horizontal * 0.75,
        vertical: config.cellPadding.vertical * 0.5,
      );
    }
    return config.cellPadding;
  }

  /// Calculate header padding based on density and config
  static EdgeInsets getHeaderPadding(AppSimpleTableConfig config) {
    if (config.variant == AppSimpleTableVariant.compact) {
      return EdgeInsets.symmetric(
        horizontal: config.headerPadding.horizontal * 0.75,
        vertical: config.headerPadding.vertical * 0.5,
      );
    }
    return config.headerPadding;
  }
}
