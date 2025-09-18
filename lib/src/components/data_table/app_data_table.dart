import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data_table_config.dart';

/// A production-ready data table widget with advanced features
///
/// Supports three main variants:
/// - [AppDataTable.resizable]: Columns can be resized by dragging handles
/// - [AppDataTable.pinned]: Columns can be pinned (frozen) for horizontal scrolling
/// - [AppDataTable.inlineEdit]: Cells can be edited inline with validation
///
/// Features:
/// - Material 3 design with platform-adaptive behavior
/// - Full RTL support
/// - Keyboard navigation and accessibility
/// - Sorting, filtering, and selection
/// - Loading and skeleton states
/// - Empty state handling
/// - Responsive design
class AppDataTable extends StatefulWidget {
  /// Table variant
  final AppDataTableVariant variant;

  /// Table columns configuration
  final List<AppDataTableColumn> columns;

  /// Table rows data
  final List<AppDataTableRow> rows;

  /// Selection configuration
  final AppDataTableSelection? selection;

  /// Sort configuration
  final AppDataTableSort? sorting;

  /// Edit callback for inline editing
  final AppDataTableEditCallback? onEdit;

  /// Empty state configuration
  final AppDataTableEmptyState? emptyState;

  /// Table configuration
  final AppDataTableConfig config;

  /// Row selection callback
  final AppDataTableRowSelectCallback? onRowSelect;

  /// Column resize callback
  final Function(String columnId, double newWidth)? onColumnResize;

  /// Column reorder callback
  final AppDataTableColumnReorderCallback? onColumnReorder;

  /// Scroll controller for horizontal scrolling
  final ScrollController? horizontalScrollController;

  /// Scroll controller for vertical scrolling
  final ScrollController? verticalScrollController;

  /// Creates an AppDataTable with resizable columns
  const AppDataTable.resizable({
    super.key,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    this.onEdit,
    this.emptyState,
    this.config = const AppDataTableConfig(
      variant: AppDataTableVariant.resizable,
      resizeConfig: AppDataTableResizeConfig(),
    ),
    this.onRowSelect,
    this.onColumnResize,
    this.onColumnReorder,
    this.horizontalScrollController,
    this.verticalScrollController,
  }) : variant = AppDataTableVariant.resizable;

  /// Creates an AppDataTable with pinned columns
  const AppDataTable.pinned({
    super.key,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    this.onEdit,
    this.emptyState,
    this.config = const AppDataTableConfig(
      variant: AppDataTableVariant.pinned,
      freezeConfig: AppDataTableFreezeConfig(),
    ),
    this.onRowSelect,
    this.onColumnResize,
    this.onColumnReorder,
    this.horizontalScrollController,
    this.verticalScrollController,
  }) : variant = AppDataTableVariant.pinned;

  /// Creates an AppDataTable with inline editing
  const AppDataTable.inlineEdit({
    super.key,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    required this.onEdit,
    this.emptyState,
    this.config = const AppDataTableConfig(
      variant: AppDataTableVariant.inlineEdit,
      editMode: AppDataTableEditMode.cell,
    ),
    this.onRowSelect,
    this.onColumnResize,
    this.onColumnReorder,
    this.horizontalScrollController,
    this.verticalScrollController,
  }) : variant = AppDataTableVariant.inlineEdit;

  /// Creates a general AppDataTable
  const AppDataTable({
    super.key,
    required this.variant,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    this.onEdit,
    this.emptyState,
    this.config = const AppDataTableConfig(),
    this.onRowSelect,
    this.onColumnResize,
    this.onColumnReorder,
    this.horizontalScrollController,
    this.verticalScrollController,
  });

  @override
  State<AppDataTable> createState() => _AppDataTableState();
}

class _AppDataTableState extends State<AppDataTable>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  late ScrollController _horizontalController;
  late ScrollController _verticalController;

  final Map<String, double> _columnWidths = {};
  final Map<String, FocusNode> _cellFocusNodes = {};
  final Map<String, TextEditingController> _editControllers = {};

  AppDataTableSort? _currentSort;
  AppDataTableSelection? _currentSelection;
  List<AppDataTableRow> _displayRows = [];

  // Resize state
  String? _resizingColumnId;
  double? _resizeStartX;
  double? _resizeStartWidth;

  // Edit state
  String? _editingRowId;
  String? _editingColumnId;

  // Focus management
  int _focusedRowIndex = -1;
  int _focusedColumnIndex = -1;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.config.animationCurve,
    ));

    _horizontalController =
        widget.horizontalScrollController ?? ScrollController();
    _verticalController = widget.verticalScrollController ?? ScrollController();

    _initializeState();
    _animationController.forward();
  }

  @override
  void didUpdateWidget(AppDataTable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.rows != widget.rows ||
        oldWidget.columns != widget.columns ||
        oldWidget.sorting != widget.sorting ||
        oldWidget.selection != widget.selection) {
      _initializeState();
    }
  }

  void _initializeState() {
    _currentSort = widget.sorting;
    _currentSelection = widget.selection;
    _displayRows = List.from(widget.rows);

    // Initialize column widths
    for (final column in widget.columns) {
      if (column.width != null) {
        _columnWidths[column.id] = column.width!;
      }
    }

    // Apply sorting if specified
    if (_currentSort?.columnId != null &&
        _currentSort!.direction != AppDataTableSortDirection.none) {
      _applySorting(_currentSort!.columnId!, _currentSort!.direction);
    }

    // Initialize focus nodes for cells
    _initializeFocusNodes();
  }

  void _initializeFocusNodes() {
    _cellFocusNodes.clear();
    _editControllers.clear();

    for (final row in _displayRows) {
      for (final column in widget.columns) {
        final key = '${row.id}_${column.id}';
        _cellFocusNodes[key] = FocusNode();

        if (column.editable) {
          _editControllers[key] = TextEditingController();
        }
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();

    if (widget.horizontalScrollController == null) {
      _horizontalController.dispose();
    }
    if (widget.verticalScrollController == null) {
      _verticalController.dispose();
    }

    for (final focusNode in _cellFocusNodes.values) {
      focusNode.dispose();
    }

    for (final controller in _editControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textDirection = Directionality.of(context);

    if (widget.config.showSkeleton) {
      return _buildSkeletonTable(context);
    }

    if (widget.config.showLoading) {
      return _buildLoadingTable(context);
    }

    if (_displayRows.isEmpty && widget.emptyState?.show == true) {
      return _buildEmptyState(context);
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: _buildTable(context, theme, textDirection),
    );
  }

  Widget _buildTable(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.config.minHeight,
        maxHeight: widget.config.maxHeight ?? double.infinity,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        color: widget.config.theme?.rowBackgroundColor ??
            theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: widget.config.elevation,
            offset: Offset(0, widget.config.elevation / 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.config.showHeaders)
              _buildHeader(context, theme, textDirection),
            Flexible(
              child: _buildTableBody(context, theme, textDirection),
            ),
            if (widget.config.footer != null) widget.config.footer!,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
    return Container(
      height: widget.config.headerHeight,
      decoration: BoxDecoration(
        color: widget.config.theme?.headerBackgroundColor ??
            theme.colorScheme.surfaceContainerHighest,
        border: Border(
          bottom: BorderSide(
            color: widget.config.theme?.borderColor ?? theme.dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (widget.config.showRowNumbers)
            _buildRowNumberHeader(context, theme),
          if (_hasSelectionColumn()) _buildSelectionHeader(context, theme),
          Expanded(
            child: _buildColumnsHeader(context, theme, textDirection),
          ),
        ],
      ),
    );
  }

  Widget _buildRowNumberHeader(BuildContext context, ThemeData theme) {
    return Container(
      width: widget.config.rowNumberWidth,
      alignment: Alignment.center,
      padding: widget.config.headerPadding,
      child: Text(
        '#',
        style: widget.config.theme?.headerStyle ?? theme.textTheme.titleSmall,
      ),
    );
  }

  Widget _buildSelectionHeader(BuildContext context, ThemeData theme) {
    final hasSelectAll = _currentSelection?.allowSelectAll == true;
    final allSelected =
        _displayRows.isNotEmpty && _displayRows.every((row) => row.selected);

    return Container(
      width: 48,
      alignment: Alignment.center,
      padding: widget.config.headerPadding,
      child: hasSelectAll
          ? Checkbox(
              value: allSelected,
              onChanged: _onSelectAll,
              semanticLabel: 'Select all rows',
            )
          : null,
    );
  }

  Widget _buildColumnsHeader(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
    if (widget.variant == AppDataTableVariant.pinned &&
        widget.config.freezeConfig != null) {
      return _buildPinnedColumnsHeader(context, theme, textDirection);
    }

    return SingleChildScrollView(
      controller: _horizontalController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.columns
            .where((column) => column.visible)
            .map((column) =>
                _buildColumnHeader(context, theme, textDirection, column))
            .toList(),
      ),
    );
  }

  Widget _buildPinnedColumnsHeader(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
    final freezeConfig = widget.config.freezeConfig!;
    final visibleColumns =
        widget.columns.where((column) => column.visible).toList();

    final leftColumns = visibleColumns.take(freezeConfig.leftColumns).toList();
    final centerColumns = visibleColumns
        .skip(freezeConfig.leftColumns)
        .take(visibleColumns.length -
            freezeConfig.leftColumns -
            freezeConfig.rightColumns)
        .toList();
    final rightColumns = visibleColumns
        .skip(visibleColumns.length - freezeConfig.rightColumns)
        .toList();

    return Row(
      children: [
        // Left pinned columns
        ...leftColumns.map((column) =>
            _buildColumnHeader(context, theme, textDirection, column)),

        // Scrollable center columns
        if (centerColumns.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: centerColumns
                    .map((column) => _buildColumnHeader(
                        context, theme, textDirection, column))
                    .toList(),
              ),
            ),
          ),

        // Right pinned columns
        ...rightColumns.map((column) =>
            _buildColumnHeader(context, theme, textDirection, column)),
      ],
    );
  }

  Widget _buildColumnHeader(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    AppDataTableColumn column,
  ) {
    final width = _columnWidths[column.id] ?? column.width ?? 150.0;
    final isResizable = widget.variant == AppDataTableVariant.resizable &&
        column.resizable &&
        widget.config.resizeConfig?.enabled == true;

    return Container(
      width: width,
      height: widget.config.headerHeight,
      decoration: BoxDecoration(
        border: Border(
          right: widget.config.showColumnDividers
              ? BorderSide(
                  color:
                      widget.config.theme?.dividerColor ?? theme.dividerColor,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Stack(
        children: [
          // Header content
          _buildHeaderContent(context, theme, textDirection, column),

          // Resize handle
          if (isResizable)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: _buildResizeHandle(context, theme, column),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderContent(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    AppDataTableColumn column,
  ) {
    if (column.headerBuilder != null) {
      return column.headerBuilder!(context, column);
    }

    final alignment = column.getEffectiveAlignment(textDirection);
    final sortDirection = _currentSort?.columnId == column.id
        ? _currentSort!.direction
        : AppDataTableSortDirection.none;

    return InkWell(
      onTap: column.sortable ? () => _onSortColumn(column.id) : null,
      child: Container(
        padding: widget.config.headerPadding,
        alignment: _getAlignmentFromColumnAlignment(alignment),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (column.icon != null) ...[
              Icon(
                column.icon,
                size: 16,
                color: widget.config.theme?.headerTextColor ??
                    theme.colorScheme.onSurface,
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                column.label,
                style: widget.config.theme?.headerStyle ??
                    theme.textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
                semanticsLabel: column.semanticLabel ?? column.label,
              ),
            ),
            if (column.sortable) ...[
              const SizedBox(width: 4),
              _buildSortIcon(theme, sortDirection),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSortIcon(ThemeData theme, AppDataTableSortDirection direction) {
    IconData iconData;
    switch (direction) {
      case AppDataTableSortDirection.ascending:
        iconData = Icons.arrow_upward;
        break;
      case AppDataTableSortDirection.descending:
        iconData = Icons.arrow_downward;
        break;
      case AppDataTableSortDirection.none:
        iconData = Icons.unfold_more;
        break;
    }

    return Icon(
      iconData,
      size: 16,
      color: direction != AppDataTableSortDirection.none
          ? widget.config.theme?.sortIconColor ?? theme.colorScheme.primary
          : widget.config.theme?.sortIconColor?.withValues(alpha: 0.5) ??
              theme.colorScheme.onSurface.withValues(alpha: 0.5),
    );
  }

  Widget _buildResizeHandle(
      BuildContext context, ThemeData theme, AppDataTableColumn column) {
    final resizeConfig = widget.config.resizeConfig!;

    return MouseRegion(
      cursor: SystemMouseCursors.resizeColumn,
      child: GestureDetector(
        onPanStart: (details) =>
            _startColumnResize(column.id, details.globalPosition.dx),
        onPanUpdate: (details) =>
            _updateColumnResize(details.globalPosition.dx),
        onPanEnd: (details) => _endColumnResize(),
        child: Container(
          width: resizeConfig.handleWidth,
          color: _resizingColumnId == column.id
              ? resizeConfig.handleColor ?? theme.colorScheme.primary
              : Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildTableBody(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
    if (widget.variant == AppDataTableVariant.pinned &&
        widget.config.freezeConfig != null) {
      return _buildPinnedTableBody(context, theme, textDirection);
    }

    return SingleChildScrollView(
      controller: _verticalController,
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        child: Column(
          children: _displayRows.asMap().entries.map((entry) {
            final index = entry.key;
            final row = entry.value;
            return _buildTableRow(context, theme, textDirection, row, index);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPinnedTableBody(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
    final freezeConfig = widget.config.freezeConfig!;
    final visibleColumns =
        widget.columns.where((column) => column.visible).toList();

    return SingleChildScrollView(
      controller: _verticalController,
      child: Column(
        children: _displayRows.asMap().entries.map((entry) {
          final index = entry.key;
          final row = entry.value;
          return _buildPinnedTableRow(context, theme, textDirection, row, index,
              visibleColumns, freezeConfig);
        }).toList(),
      ),
    );
  }

  Widget _buildTableRow(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    AppDataTableRow row,
    int index,
  ) {
    if (row.rowBuilder != null) {
      final cells = widget.columns
          .where((column) => column.visible)
          .map((column) => _buildTableCell(
              context, theme, textDirection, row, column, index))
          .toList();
      return row.rowBuilder!(context, row, cells);
    }

    final isSelected = row.selected;
    final isHovered = row.state == AppDataTableRowState.hovered;
    final isEven = index.isEven;

    Color? backgroundColor;
    if (isSelected) {
      backgroundColor = widget.config.theme?.selectedRowBackgroundColor ??
          theme.colorScheme.primaryContainer;
    } else if (isHovered && widget.config.showHoverEffects) {
      backgroundColor = widget.config.theme?.hoveredRowBackgroundColor ??
          theme.colorScheme.surfaceContainerHighest;
    } else if (widget.config.alternateRowColors && isEven) {
      backgroundColor = widget.config.theme?.alternateRowBackgroundColor ??
          theme.colorScheme.surface.withValues(alpha: 0.5);
    }

    return Container(
      height: row.height ?? widget.config.rowHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: widget.config.showRowDividers
              ? BorderSide(
                  color:
                      widget.config.theme?.dividerColor ?? theme.dividerColor,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: InkWell(
        onTap: () => _onRowTap(row),
        child: Row(
          children: [
            if (widget.config.showRowNumbers)
              _buildRowNumberCell(context, theme, index),
            if (_hasSelectionColumn()) _buildSelectionCell(context, theme, row),
            ...widget.columns.where((column) => column.visible).map((column) =>
                _buildTableCell(
                    context, theme, textDirection, row, column, index)),
          ],
        ),
      ),
    );
  }

  Widget _buildPinnedTableRow(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    AppDataTableRow row,
    int index,
    List<AppDataTableColumn> visibleColumns,
    AppDataTableFreezeConfig freezeConfig,
  ) {
    final leftColumns = visibleColumns.take(freezeConfig.leftColumns).toList();
    final centerColumns = visibleColumns
        .skip(freezeConfig.leftColumns)
        .take(visibleColumns.length -
            freezeConfig.leftColumns -
            freezeConfig.rightColumns)
        .toList();
    final rightColumns = visibleColumns
        .skip(visibleColumns.length - freezeConfig.rightColumns)
        .toList();

    final isSelected = row.selected;
    final isHovered = row.state == AppDataTableRowState.hovered;
    final isEven = index.isEven;

    Color? backgroundColor;
    if (isSelected) {
      backgroundColor = widget.config.theme?.selectedRowBackgroundColor ??
          theme.colorScheme.primaryContainer;
    } else if (isHovered && widget.config.showHoverEffects) {
      backgroundColor = widget.config.theme?.hoveredRowBackgroundColor ??
          theme.colorScheme.surfaceContainerHighest;
    } else if (widget.config.alternateRowColors && isEven) {
      backgroundColor = widget.config.theme?.alternateRowBackgroundColor ??
          theme.colorScheme.surface.withValues(alpha: 0.5);
    }

    return Container(
      height: row.height ?? widget.config.rowHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: widget.config.showRowDividers
              ? BorderSide(
                  color:
                      widget.config.theme?.dividerColor ?? theme.dividerColor,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          if (widget.config.showRowNumbers)
            _buildRowNumberCell(context, theme, index),
          if (_hasSelectionColumn()) _buildSelectionCell(context, theme, row),

          // Left pinned columns
          ...leftColumns.map((column) => _buildTableCell(
              context, theme, textDirection, row, column, index)),

          // Scrollable center columns
          if (centerColumns.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                controller: _horizontalController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: centerColumns
                      .map((column) => _buildTableCell(
                          context, theme, textDirection, row, column, index))
                      .toList(),
                ),
              ),
            ),

          // Right pinned columns
          ...rightColumns.map((column) => _buildTableCell(
              context, theme, textDirection, row, column, index)),
        ],
      ),
    );
  }

  Widget _buildRowNumberCell(BuildContext context, ThemeData theme, int index) {
    return Container(
      width: widget.config.rowNumberWidth,
      alignment: Alignment.center,
      padding: widget.config.cellPadding,
      child: Text(
        '${index + 1}',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Widget _buildSelectionCell(
      BuildContext context, ThemeData theme, AppDataTableRow row) {
    return Container(
      width: 48,
      alignment: Alignment.center,
      padding: widget.config.cellPadding,
      child: Checkbox(
        value: row.selected,
        onChanged: row.disabled
            ? null
            : (selected) => _onRowSelect(row, selected ?? false),
        semanticLabel: 'Select row ${row.id}',
      ),
    );
  }

  Widget _buildTableCell(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    AppDataTableRow row,
    AppDataTableColumn column,
    int rowIndex,
  ) {
    final width = _columnWidths[column.id] ?? column.width ?? 150.0;
    final value = row.getValue(column.field);
    final isEditing = _editingRowId == row.id && _editingColumnId == column.id;
    final cellKey = '${row.id}_${column.id}';

    if (column.cellBuilder != null) {
      return SizedBox(
        width: width,
        child: column.cellBuilder!(context, row, column, value),
      );
    }

    if (isEditing && column.editable) {
      return _buildEditCell(
          context, theme, textDirection, row, column, value, width);
    }

    final alignment = column.getEffectiveAlignment(textDirection);
    final displayValue = row.getDisplayValue(column.field, column.formatter);

    return Container(
      width: width,
      alignment: _getAlignmentFromColumnAlignment(alignment),
      padding: widget.config.cellPadding,
      decoration: BoxDecoration(
        border: Border(
          right: widget.config.showColumnDividers
              ? BorderSide(
                  color:
                      widget.config.theme?.dividerColor ?? theme.dividerColor,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Focus(
        focusNode: _cellFocusNodes[cellKey],
        onKeyEvent: (node, event) => _handleCellKeyEvent(event, row, column),
        child: InkWell(
          onTap: () => _onCellTap(row, column),
          onDoubleTap:
              column.editable ? () => _startEditing(row, column) : null,
          child: _buildCellContent(context, theme, column, displayValue, value),
        ),
      ),
    );
  }

  Widget _buildCellContent(
    BuildContext context,
    ThemeData theme,
    AppDataTableColumn column,
    String displayValue,
    dynamic value,
  ) {
    final cellStyle = widget.config.theme?.cellStyles?[column.cellType] ??
        theme.textTheme.bodyMedium;

    switch (column.cellType) {
      case AppDataTableCellType.boolean:
        return Icon(
          value == true ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16,
          color: value == true
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurface.withValues(alpha: 0.5),
        );

      case AppDataTableCellType.icon:
        if (value is IconData) {
          return Icon(value, size: 16);
        }
        break;

      case AppDataTableCellType.image:
        if (value is String && value.isNotEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              value,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 16),
            ),
          );
        }
        break;

      default:
        break;
    }

    return Text(
      displayValue,
      style: cellStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildEditCell(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    AppDataTableRow row,
    AppDataTableColumn column,
    dynamic value,
    double width,
  ) {
    if (column.editCellBuilder != null) {
      return SizedBox(
        width: width,
        child: column.editCellBuilder!(
          context,
          row,
          column,
          value,
          (newValue) => _onCellValueChanged(row, column, newValue),
        ),
      );
    }

    final cellKey = '${row.id}_${column.id}';
    final controller = _editControllers[cellKey]!;

    if (controller.text != (value?.toString() ?? '')) {
      controller.text = value?.toString() ?? '';
    }

    return Container(
      width: width,
      padding: widget.config.cellPadding,
      child: TextField(
        controller: controller,
        autofocus: true,
        style: theme.textTheme.bodyMedium,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: (newValue) => _submitEdit(row, column, newValue),
        onTapOutside: (event) => _cancelEdit(),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final emptyState = widget.emptyState!;

    if (emptyState.builder != null) {
      return emptyState.builder!(context);
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (emptyState.illustration != null)
              emptyState.illustration!
            else if (emptyState.icon != null)
              Icon(
                emptyState.icon,
                size: 64,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.5),
              ),
            const SizedBox(height: 16),
            Text(
              emptyState.message,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            if (emptyState.action != null) ...[
              const SizedBox(height: 24),
              emptyState.action!,
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingTable(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: widget.config.minHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        color: theme.colorScheme.surface,
      ),
      child: Center(
        child: widget.config.loadingIndicator ??
            CircularProgressIndicator(
              color: widget.config.theme?.loadingIndicatorColor ??
                  theme.colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildSkeletonTable(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        color: theme.colorScheme.surface,
      ),
      child: Column(
        children: [
          if (widget.config.showHeaders) _buildSkeletonHeader(context, theme),
          Expanded(
            child: ListView.builder(
              itemCount: widget.config.skeletonRowCount,
              itemBuilder: (context, index) {
                if (widget.config.skeletonBuilder != null) {
                  return widget.config.skeletonBuilder!(context, index);
                }
                return _buildSkeletonRow(context, theme, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonHeader(BuildContext context, ThemeData theme) {
    return Container(
      height: widget.config.headerHeight,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: Border(
          bottom: BorderSide(color: theme.dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: widget.columns
            .where((column) => column.visible)
            .map((column) => _buildSkeletonHeaderCell(context, theme, column))
            .toList(),
      ),
    );
  }

  Widget _buildSkeletonHeaderCell(
      BuildContext context, ThemeData theme, AppDataTableColumn column) {
    final width = _columnWidths[column.id] ?? column.width ?? 150.0;

    return Container(
      width: width,
      padding: widget.config.headerPadding,
      child: Container(
        height: 16,
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildSkeletonRow(BuildContext context, ThemeData theme, int index) {
    return Container(
      height: widget.config.rowHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: widget.columns
            .where((column) => column.visible)
            .map((column) => _buildSkeletonCell(context, theme, column))
            .toList(),
      ),
    );
  }

  Widget _buildSkeletonCell(
      BuildContext context, ThemeData theme, AppDataTableColumn column) {
    final width = _columnWidths[column.id] ?? column.width ?? 150.0;

    return Container(
      width: width,
      padding: widget.config.cellPadding,
      child: Container(
        height: 12,
        width: math.Random().nextDouble() * (width - 32) + 32,
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  // Helper methods
  bool _hasSelectionColumn() {
    return _currentSelection?.mode != AppDataTableSelectionMode.none &&
        _currentSelection?.showCheckboxes == true;
  }

  Alignment _getAlignmentFromColumnAlignment(
      AppDataTableColumnAlignment alignment) {
    switch (alignment) {
      case AppDataTableColumnAlignment.left:
        return Alignment.centerLeft;
      case AppDataTableColumnAlignment.center:
        return Alignment.center;
      case AppDataTableColumnAlignment.right:
        return Alignment.centerRight;
    }
  }

  // Event handlers
  void _onSortColumn(String columnId) {
    final currentDirection = _currentSort?.columnId == columnId
        ? _currentSort!.direction
        : AppDataTableSortDirection.none;

    AppDataTableSortDirection newDirection;
    switch (currentDirection) {
      case AppDataTableSortDirection.none:
        newDirection = AppDataTableSortDirection.ascending;
        break;
      case AppDataTableSortDirection.ascending:
        newDirection = AppDataTableSortDirection.descending;
        break;
      case AppDataTableSortDirection.descending:
        newDirection = AppDataTableSortDirection.none;
        break;
    }

    _applySorting(columnId, newDirection);

    if (widget.sorting?.onSortChanged != null) {
      widget.sorting!.onSortChanged!(columnId, newDirection);
    }
  }

  void _applySorting(String columnId, AppDataTableSortDirection direction) {
    setState(() {
      _currentSort = widget.sorting?.copyWith(
            columnId:
                direction != AppDataTableSortDirection.none ? columnId : null,
            direction: direction,
          ) ??
          AppDataTableSort(columnId: columnId, direction: direction);

      _displayRows =
          AppDataTableUtils.sortRows(_displayRows, columnId, direction);
    });
  }

  void _onRowSelect(AppDataTableRow row, bool selected) {
    if (_currentSelection?.mode == AppDataTableSelectionMode.none) return;

    setState(() {
      _displayRows = AppDataTableUtils.updateRowSelection(
        _displayRows,
        row.id,
        selected,
        _currentSelection!.mode,
      );
    });

    if (widget.onRowSelect != null) {
      widget.onRowSelect!(row.copyWith(selected: selected), selected);
    }

    if (_currentSelection?.onSelectionChanged != null) {
      final selectedRowIds = AppDataTableUtils.getSelectedRows(_displayRows)
          .map((row) => row.id)
          .toList();
      _currentSelection!.onSelectionChanged!(selectedRowIds);
    }
  }

  void _onSelectAll(bool? selectAll) {
    if (_currentSelection?.mode == AppDataTableSelectionMode.none) return;

    setState(() {
      _displayRows = _displayRows
          .map((row) => row.copyWith(selected: selectAll ?? false))
          .toList();
    });

    if (_currentSelection?.onSelectionChanged != null) {
      final selectedRowIds = selectAll == true
          ? _displayRows.map((row) => row.id).toList()
          : <String>[];
      _currentSelection!.onSelectionChanged!(selectedRowIds);
    }
  }

  void _onRowTap(AppDataTableRow row) {
    if (_currentSelection?.mode == AppDataTableSelectionMode.single) {
      _onRowSelect(row, !row.selected);
    }
  }

  void _onCellTap(AppDataTableRow row, AppDataTableColumn column) {
    final cellKey = '${row.id}_${column.id}';
    _cellFocusNodes[cellKey]?.requestFocus();

    setState(() {
      _focusedRowIndex = _displayRows.indexOf(row);
      _focusedColumnIndex = widget.columns.indexOf(column);
    });
  }

  void _startEditing(AppDataTableRow row, AppDataTableColumn column) {
    if (!column.editable || widget.variant != AppDataTableVariant.inlineEdit) {
      return;
    }

    setState(() {
      _editingRowId = row.id;
      _editingColumnId = column.id;
    });

    final cellKey = '${row.id}_${column.id}';
    final controller = _editControllers[cellKey];
    if (controller != null) {
      controller.text = row.getValue(column.field)?.toString() ?? '';
    }
  }

  void _submitEdit(
      AppDataTableRow row, AppDataTableColumn column, String newValue) {
    dynamic parsedValue = newValue;

    // Parse value based on cell type
    switch (column.cellType) {
      case AppDataTableCellType.number:
        parsedValue = double.tryParse(newValue) ?? newValue;
        break;
      case AppDataTableCellType.boolean:
        parsedValue = newValue.toLowerCase() == 'true' || newValue == '1';
        break;
      default:
        break;
    }

    // Validate if validator is provided
    if (column.validator != null) {
      final error = column.validator!(parsedValue);
      if (error != null) {
        // Show error (could be implemented with snackbar or dialog)
        return;
      }
    }

    _onCellValueChanged(row, column, parsedValue);
    _cancelEdit();
  }

  void _onCellValueChanged(
      AppDataTableRow row, AppDataTableColumn column, dynamic newValue) {
    if (widget.onEdit != null) {
      widget.onEdit!(row, column.field, newValue);
    }

    // Update local state
    setState(() {
      final rowIndex = _displayRows.indexWhere((r) => r.id == row.id);
      if (rowIndex != -1) {
        final updatedData =
            Map<String, dynamic>.from(_displayRows[rowIndex].data);
        updatedData[column.field] = newValue;
        _displayRows[rowIndex] =
            _displayRows[rowIndex].copyWith(data: updatedData);
      }
    });
  }

  void _cancelEdit() {
    setState(() {
      _editingRowId = null;
      _editingColumnId = null;
    });
  }

  // Column resize handlers
  void _startColumnResize(String columnId, double startX) {
    final currentWidth = _columnWidths[columnId] ??
        widget.columns.firstWhere((col) => col.id == columnId).width ??
        150.0;

    setState(() {
      _resizingColumnId = columnId;
      _resizeStartX = startX;
      _resizeStartWidth = currentWidth;
    });
  }

  void _updateColumnResize(double currentX) {
    if (_resizingColumnId == null ||
        _resizeStartX == null ||
        _resizeStartWidth == null) {
      return;
    }

    final delta = currentX - _resizeStartX!;
    final newWidth = _resizeStartWidth! + delta;

    final column =
        widget.columns.firstWhere((col) => col.id == _resizingColumnId);
    final clampedWidth = newWidth.clamp(column.minWidth, column.maxWidth);

    setState(() {
      _columnWidths[_resizingColumnId!] = clampedWidth;
    });
  }

  void _endColumnResize() {
    if (_resizingColumnId != null && widget.onColumnResize != null) {
      final newWidth = _columnWidths[_resizingColumnId!]!;
      widget.onColumnResize!(_resizingColumnId!, newWidth);
    }

    setState(() {
      _resizingColumnId = null;
      _resizeStartX = null;
      _resizeStartWidth = null;
    });
  }

  // Keyboard event handler
  KeyEventResult _handleCellKeyEvent(
      KeyEvent event, AppDataTableRow row, AppDataTableColumn column) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          _moveFocus(-1, 0);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowDown:
          _moveFocus(1, 0);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowLeft:
          _moveFocus(0, -1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowRight:
          _moveFocus(0, 1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.f2:
          if (column.editable) {
            _startEditing(row, column);
            return KeyEventResult.handled;
          }
          break;
        case LogicalKeyboardKey.escape:
          _cancelEdit();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.space:
          if (_currentSelection?.mode != AppDataTableSelectionMode.none) {
            _onRowSelect(row, !row.selected);
            return KeyEventResult.handled;
          }
          break;
      }
    }

    return KeyEventResult.ignored;
  }

  void _moveFocus(int rowDelta, int columnDelta) {
    final newRowIndex =
        (_focusedRowIndex + rowDelta).clamp(0, _displayRows.length - 1);
    final visibleColumns = widget.columns.where((col) => col.visible).toList();
    final newColumnIndex =
        (_focusedColumnIndex + columnDelta).clamp(0, visibleColumns.length - 1);

    if (newRowIndex != _focusedRowIndex ||
        newColumnIndex != _focusedColumnIndex) {
      final newRow = _displayRows[newRowIndex];
      final newColumn = visibleColumns[newColumnIndex];
      final cellKey = '${newRow.id}_${newColumn.id}';

      _cellFocusNodes[cellKey]?.requestFocus();

      setState(() {
        _focusedRowIndex = newRowIndex;
        _focusedColumnIndex = newColumnIndex;
      });
    }
  }
}
