import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'simple_table_config.dart';

/// A simple, lightweight data table widget for basic tabular data display
///
/// Supports two main variants:
/// - [DSSimpleTable.standard]: Standard table layout with normal spacing
/// - [DSSimpleTable.compact]: Compact table with reduced spacing for dense layouts
///
/// Features:
/// - Material 3 design with platform-adaptive behavior
/// - Full RTL support
/// - Keyboard navigation and accessibility
/// - Sorting and selection
/// - Loading and skeleton states
/// - Empty state handling
/// - Responsive design
class DSSimpleTable extends StatefulWidget {
  /// Table variant
  final DSSimpleTableVariant variant;

  /// Table columns configuration
  final List<DSSimpleTableColumn> columns;

  /// Table rows data
  final List<DSSimpleTableRow> rows;

  /// Selection configuration
  final DSSimpleTableSelection? selection;

  /// Sort configuration
  final DSSimpleTableSort? sorting;

  /// Empty state configuration
  final DSSimpleTableEmptyState? emptyState;

  /// Table configuration
  final DSSimpleTableConfig config;

  /// Row selection callback
  final DSSimpleTableRowSelectCallback? onRowSelect;

  /// Scroll controller for horizontal scrolling
  final ScrollController? horizontalScrollController;

  /// Scroll controller for vertical scrolling
  final ScrollController? verticalScrollController;

  /// Creates an DSSimpleTable with standard layout
  const DSSimpleTable.standard({
    super.key,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    this.emptyState,
    this.config = const DSSimpleTableConfig(
      variant: DSSimpleTableVariant.standard,
    ),
    this.onRowSelect,
    this.horizontalScrollController,
    this.verticalScrollController,
  }) : variant = DSSimpleTableVariant.standard;

  /// Creates an DSSimpleTable with compact layout
  const DSSimpleTable.compact({
    super.key,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    this.emptyState,
    this.config = const DSSimpleTableConfig(
      variant: DSSimpleTableVariant.compact,
      density: DSSimpleTableDensity.compact,
    ),
    this.onRowSelect,
    this.horizontalScrollController,
    this.verticalScrollController,
  }) : variant = DSSimpleTableVariant.compact;

  /// Creates a general DSSimpleTable
  const DSSimpleTable({
    super.key,
    required this.variant,
    required this.columns,
    required this.rows,
    this.selection,
    this.sorting,
    this.emptyState,
    this.config = const DSSimpleTableConfig(),
    this.onRowSelect,
    this.horizontalScrollController,
    this.verticalScrollController,
  });

  @override
  State<DSSimpleTable> createState() => _DSSimpleTableState();
}

class _DSSimpleTableState extends State<DSSimpleTable>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  late ScrollController _horizontalController;
  late ScrollController _verticalController;

  final Map<String, FocusNode> _cellFocusNodes = {};

  DSSimpleTableSort? _currentSort;
  DSSimpleTableSelection? _currentSelection;
  List<DSSimpleTableRow> _displayRows = [];

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
  void didUpdateWidget(DSSimpleTable oldWidget) {
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

    // Apply sorting if specified
    if (_currentSort?.columnId != null &&
        _currentSort!.direction != DSSimpleTableSortDirection.none) {
      _applySorting(_currentSort!.columnId!, _currentSort!.direction);
    }

    // Initialize focus nodes for cells
    _initializeFocusNodes();
  }

  void _initializeFocusNodes() {
    _cellFocusNodes.clear();

    for (final row in _displayRows) {
      for (final column in widget.columns) {
        final key = '${row.id}_${column.id}';
        _cellFocusNodes[key] = FocusNode();
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
    final headerHeight =
        DSSimpleTableUtils.getHeaderHeight(widget.config, theme.platform);
    final headerPadding = DSSimpleTableUtils.getHeaderPadding(widget.config);

    return Container(
      height: headerHeight,
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
            _buildRowNumberHeader(context, theme, headerPadding),
          if (_hasSelectionColumn())
            _buildSelectionHeader(context, theme, headerPadding),
          Expanded(
            child: _buildColumnsHeader(
                context, theme, textDirection, headerPadding),
          ),
        ],
      ),
    );
  }

  Widget _buildRowNumberHeader(
      BuildContext context, ThemeData theme, EdgeInsets padding) {
    return Container(
      width: widget.config.rowNumberWidth,
      alignment: Alignment.center,
      padding: padding,
      child: Text(
        '#',
        style: widget.config.theme?.headerStyle ?? theme.textTheme.titleSmall,
      ),
    );
  }

  Widget _buildSelectionHeader(
      BuildContext context, ThemeData theme, EdgeInsets padding) {
    final hasSelectAll = _currentSelection?.allowSelectAll == true;
    final allSelected =
        _displayRows.isNotEmpty && _displayRows.every((row) => row.selected);

    return Container(
      width: 48,
      alignment: Alignment.center,
      padding: padding,
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
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    EdgeInsets padding,
  ) {
    final visibleColumns =
        widget.columns.where((column) => column.visible).toList();

    return SingleChildScrollView(
      controller: _horizontalController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: visibleColumns
            .map((column) => _buildColumnHeader(
                context, theme, textDirection, column, padding))
            .toList(),
      ),
    );
  }

  Widget _buildColumnHeader(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    DSSimpleTableColumn column,
    EdgeInsets padding,
  ) {
    if (column.headerBuilder != null) {
      return Expanded(
        flex: column.flex,
        child: column.headerBuilder!(context, column),
      );
    }

    final alignment = column.getEffectiveAlignment(textDirection);
    final sortDirection = _currentSort?.columnId == column.id
        ? _currentSort!.direction
        : DSSimpleTableSortDirection.none;

    return Expanded(
      flex: column.flex,
      child: InkWell(
        onTap: column.sortable ? () => _onSortColumn(column.id) : null,
        child: Container(
          padding: padding,
          alignment: _getAlignmentFromColumnAlignment(alignment),
          decoration: BoxDecoration(
            border: Border(
              right: widget.config.showColumnDividers
                  ? BorderSide(
                      color: widget.config.theme?.dividerColor ??
                          theme.dividerColor,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
          ),
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
      ),
    );
  }

  Widget _buildSortIcon(
      ThemeData theme, DSSimpleTableSortDirection direction) {
    IconData iconData;
    switch (direction) {
      case DSSimpleTableSortDirection.ascending:
        iconData = Icons.arrow_upward;
        break;
      case DSSimpleTableSortDirection.descending:
        iconData = Icons.arrow_downward;
        break;
      case DSSimpleTableSortDirection.none:
        iconData = Icons.unfold_more;
        break;
    }

    return Icon(
      iconData,
      size: 16,
      color: direction != DSSimpleTableSortDirection.none
          ? widget.config.theme?.sortIconColor ?? theme.colorScheme.primary
          : widget.config.theme?.sortIconColor?.withValues(alpha: 0.5) ??
              theme.colorScheme.onSurface.withValues(alpha: 0.5),
    );
  }

  Widget _buildTableBody(
      BuildContext context, ThemeData theme, TextDirection textDirection) {
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

  Widget _buildTableRow(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    DSSimpleTableRow row,
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

    final rowHeight =
        DSSimpleTableUtils.getRowHeight(widget.config, theme.platform);
    final isSelected = row.selected;
    final isHovered = row.state == DSSimpleTableRowState.hovered;
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
      height: row.height ?? rowHeight,
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
            Expanded(
              child: _buildRowCells(context, theme, textDirection, row, index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowNumberCell(BuildContext context, ThemeData theme, int index) {
    final cellPadding = DSSimpleTableUtils.getCellPadding(widget.config);

    return Container(
      width: widget.config.rowNumberWidth,
      alignment: Alignment.center,
      padding: cellPadding,
      child: Text(
        '${index + 1}',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Widget _buildSelectionCell(
      BuildContext context, ThemeData theme, DSSimpleTableRow row) {
    final cellPadding = DSSimpleTableUtils.getCellPadding(widget.config);

    return Container(
      width: 48,
      alignment: Alignment.center,
      padding: cellPadding,
      child: Checkbox(
        value: row.selected,
        onChanged: row.disabled
            ? null
            : (selected) => _onRowSelect(row, selected ?? false),
        semanticLabel: 'Select row ${row.id}',
      ),
    );
  }

  Widget _buildRowCells(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    DSSimpleTableRow row,
    int index,
  ) {
    final visibleColumns =
        widget.columns.where((column) => column.visible).toList();

    return Row(
      children: visibleColumns
          .map((column) => _buildTableCell(
              context, theme, textDirection, row, column, index))
          .toList(),
    );
  }

  Widget _buildTableCell(
    BuildContext context,
    ThemeData theme,
    TextDirection textDirection,
    DSSimpleTableRow row,
    DSSimpleTableColumn column,
    int rowIndex,
  ) {
    final value = row.getValue(column.field);
    final cellKey = '${row.id}_${column.id}';
    final cellPadding = DSSimpleTableUtils.getCellPadding(widget.config);

    if (column.cellBuilder != null) {
      return Expanded(
        flex: column.flex,
        child: column.cellBuilder!(context, row, column, value),
      );
    }

    final alignment = column.getEffectiveAlignment(textDirection);
    final displayValue = row.getDisplayValue(column.field, column.formatter);

    return Expanded(
      flex: column.flex,
      child: Focus(
        focusNode: _cellFocusNodes[cellKey],
        onKeyEvent: (node, event) => _handleCellKeyEvent(event, row, column),
        child: InkWell(
          onTap: () => _onCellTap(row, column),
          child: Container(
            alignment: _getAlignmentFromColumnAlignment(alignment),
            padding: cellPadding,
            decoration: BoxDecoration(
              border: Border(
                right: widget.config.showColumnDividers
                    ? BorderSide(
                        color: widget.config.theme?.dividerColor ??
                            theme.dividerColor,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
            ),
            child:
                _buildCellContent(context, theme, column, displayValue, value),
          ),
        ),
      ),
    );
  }

  Widget _buildCellContent(
    BuildContext context,
    ThemeData theme,
    DSSimpleTableColumn column,
    String displayValue,
    dynamic value,
  ) {
    final cellStyle = widget.config.theme?.cellStyles?[column.cellType] ??
        theme.textTheme.bodyMedium;

    switch (column.cellType) {
      case DSSimpleTableCellType.boolean:
        return Icon(
          value == true ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16,
          color: value == true
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurface.withValues(alpha: 0.5),
        );

      case DSSimpleTableCellType.icon:
        if (value is IconData) {
          return Icon(value, size: 16);
        }
        break;

      case DSSimpleTableCellType.number:
        return Text(
          displayValue,
          style: cellStyle
              ?.copyWith(fontFeatures: [const FontFeature.tabularFigures()]),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );

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
    final headerHeight =
        DSSimpleTableUtils.getHeaderHeight(widget.config, theme.platform);
    final headerPadding = DSSimpleTableUtils.getHeaderPadding(widget.config);

    return Container(
      height: headerHeight,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: Border(
          bottom: BorderSide(color: theme.dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: widget.columns
            .where((column) => column.visible)
            .map((column) =>
                _buildSkeletonHeaderCell(context, theme, column, headerPadding))
            .toList(),
      ),
    );
  }

  Widget _buildSkeletonHeaderCell(BuildContext context, ThemeData theme,
      DSSimpleTableColumn column, EdgeInsets padding) {
    return Expanded(
      flex: column.flex,
      child: Container(
        padding: padding,
        child: Container(
          height: 16,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonRow(BuildContext context, ThemeData theme, int index) {
    final rowHeight =
        DSSimpleTableUtils.getRowHeight(widget.config, theme.platform);
    final cellPadding = DSSimpleTableUtils.getCellPadding(widget.config);

    return Container(
      height: rowHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: widget.columns
            .where((column) => column.visible)
            .map((column) =>
                _buildSkeletonCell(context, theme, column, cellPadding))
            .toList(),
      ),
    );
  }

  Widget _buildSkeletonCell(BuildContext context, ThemeData theme,
      DSSimpleTableColumn column, EdgeInsets padding) {
    return Expanded(
      flex: column.flex,
      child: Container(
        padding: padding,
        child: Container(
          height: 12,
          width: math.Random().nextDouble() * 120 + 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  // Helper methods
  bool _hasSelectionColumn() {
    return _currentSelection?.mode != DSSimpleTableSelectionMode.none &&
        _currentSelection?.showCheckboxes == true;
  }

  Alignment _getAlignmentFromColumnAlignment(
      DSSimpleTableColumnAlignment alignment) {
    switch (alignment) {
      case DSSimpleTableColumnAlignment.left:
        return Alignment.centerLeft;
      case DSSimpleTableColumnAlignment.center:
        return Alignment.center;
      case DSSimpleTableColumnAlignment.right:
        return Alignment.centerRight;
    }
  }

  // Event handlers
  void _onSortColumn(String columnId) {
    final currentDirection = _currentSort?.columnId == columnId
        ? _currentSort!.direction
        : DSSimpleTableSortDirection.none;

    DSSimpleTableSortDirection newDirection;
    switch (currentDirection) {
      case DSSimpleTableSortDirection.none:
        newDirection = DSSimpleTableSortDirection.ascending;
        break;
      case DSSimpleTableSortDirection.ascending:
        newDirection = DSSimpleTableSortDirection.descending;
        break;
      case DSSimpleTableSortDirection.descending:
        newDirection = DSSimpleTableSortDirection.none;
        break;
    }

    _applySorting(columnId, newDirection);

    if (widget.sorting?.onSortChanged != null) {
      widget.sorting!.onSortChanged!(columnId, newDirection);
    }
  }

  void _applySorting(String columnId, DSSimpleTableSortDirection direction) {
    setState(() {
      _currentSort = widget.sorting?.copyWith(
            columnId:
                direction != DSSimpleTableSortDirection.none ? columnId : null,
            direction: direction,
          ) ??
          DSSimpleTableSort(columnId: columnId, direction: direction);

      _displayRows =
          DSSimpleTableUtils.sortRows(_displayRows, columnId, direction);
    });
  }

  void _onRowSelect(DSSimpleTableRow row, bool selected) {
    if (_currentSelection?.mode == DSSimpleTableSelectionMode.none) return;

    setState(() {
      _displayRows = DSSimpleTableUtils.updateRowSelection(
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
      final selectedRowIds = DSSimpleTableUtils.getSelectedRows(_displayRows)
          .map((row) => row.id)
          .toList();
      _currentSelection!.onSelectionChanged!(selectedRowIds);
    }
  }

  void _onSelectAll(bool? selectAll) {
    if (_currentSelection?.mode == DSSimpleTableSelectionMode.none) return;

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

  void _onRowTap(DSSimpleTableRow row) {
    if (_currentSelection?.mode == DSSimpleTableSelectionMode.single) {
      _onRowSelect(row, !row.selected);
    }
  }

  void _onCellTap(DSSimpleTableRow row, DSSimpleTableColumn column) {
    final cellKey = '${row.id}_${column.id}';
    _cellFocusNodes[cellKey]?.requestFocus();

    setState(() {
      _focusedRowIndex = _displayRows.indexOf(row);
      _focusedColumnIndex = widget.columns.indexOf(column);
    });
  }

  // Keyboard event handler
  KeyEventResult _handleCellKeyEvent(
      KeyEvent event, DSSimpleTableRow row, DSSimpleTableColumn column) {
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
        case LogicalKeyboardKey.space:
          if (_currentSelection?.mode != DSSimpleTableSelectionMode.none) {
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
