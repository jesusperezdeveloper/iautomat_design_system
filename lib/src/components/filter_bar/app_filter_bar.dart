/// AppFilterBar widget for filtering data with chips and popovers
///
/// A comprehensive filter bar component that supports:
/// - Chip-based and popover-based filter variants
/// - Multiple filter types (single, multiple, range, text, date, etc.)
/// - Platform-adaptive behavior for iOS, Android, and Web
/// - Full keyboard navigation and accessibility
/// - RTL support
/// - Loading and skeleton states
///
/// Example usage:
/// ```dart
/// AppFilterBar.chips(
///   filters: [
///     AppFilter(id: 'status', label: 'Status', options: [...]),
///     AppFilter(id: 'category', label: 'Category', type: FilterType.multiple),
///   ],
///   onChanged: (filters) => print('Active filters: $filters'),
/// )
/// ```
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'filter_bar_config.dart';

/// Main AppFilterBar widget
class AppFilterBar extends StatefulWidget {
  /// The variant of the filter bar
  final AppFilterBarVariant variant;

  /// List of filters to display
  final List<AppFilter> filters;

  /// Callback when filters change
  final OnFiltersChanged? onChanged;

  /// Callback when a filter is applied
  final OnFilterApplied? onApplied;

  /// Callback when a filter is cleared
  final OnFilterCleared? onCleared;

  /// Custom summary builder
  final SummaryBuilder? summaryBuilder;

  /// Current state of the filter bar
  final AppFilterBarState state;

  /// Whether the filter bar is visible
  final bool isVisible;

  /// Configuration for the filter bar
  final AppFilterBarConfig? config;

  /// Filter groups for organizing filters
  final List<AppFilterGroup>? groups;

  /// Constructor with all parameters
  const AppFilterBar({
    super.key,
    required this.variant,
    required this.filters,
    this.onChanged,
    this.onApplied,
    this.onCleared,
    this.summaryBuilder,
    this.state = AppFilterBarState.defaultState,
    this.isVisible = true,
    this.config,
    this.groups,
  });

  /// Factory constructor for chips variant
  factory AppFilterBar.chips({
    Key? key,
    required List<AppFilter> filters,
    OnFiltersChanged? onChanged,
    OnFilterApplied? onApplied,
    OnFilterCleared? onCleared,
    SummaryBuilder? summaryBuilder,
    AppFilterBarState state = AppFilterBarState.defaultState,
    bool isVisible = true,
    AppFilterBarConfig? config,
    List<AppFilterGroup>? groups,
  }) {
    return AppFilterBar(
      key: key,
      variant: AppFilterBarVariant.chips,
      filters: filters,
      onChanged: onChanged,
      onApplied: onApplied,
      onCleared: onCleared,
      summaryBuilder: summaryBuilder,
      state: state,
      isVisible: isVisible,
      config: config,
      groups: groups,
    );
  }

  /// Factory constructor for popovers variant
  factory AppFilterBar.popovers({
    Key? key,
    required List<AppFilter> filters,
    OnFiltersChanged? onChanged,
    OnFilterApplied? onApplied,
    OnFilterCleared? onCleared,
    SummaryBuilder? summaryBuilder,
    AppFilterBarState state = AppFilterBarState.defaultState,
    bool isVisible = true,
    AppFilterBarConfig? config,
    List<AppFilterGroup>? groups,
  }) {
    return AppFilterBar(
      key: key,
      variant: AppFilterBarVariant.popovers,
      filters: filters,
      onChanged: onChanged,
      onApplied: onApplied,
      onCleared: onCleared,
      summaryBuilder: summaryBuilder,
      state: state,
      isVisible: isVisible,
      config: config,
      groups: groups,
    );
  }

  @override
  State<AppFilterBar> createState() => _AppFilterBarState();
}

class _AppFilterBarState extends State<AppFilterBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _skeletonController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _skeletonAnimation;
  late FocusNode _focusNode;
  late List<AppFilter> _currentFilters;
  final Map<String, GlobalKey> _filterKeys = {};
  final Map<String, OverlayEntry?> _overlayEntries = {};
  String? _hoveredFilterId;
  String? _focusedFilterId;
  String? _pressedFilterId;

  AppFilterBarConfig get _effectiveConfig {
    return widget.config ?? AppFilterBarConfig.medium;
  }

  @override
  void initState() {
    super.initState();
    _currentFilters = List.from(widget.filters);
    _initializeAnimations();
    _focusNode = FocusNode();

    // Generate keys for each filter
    for (final filter in widget.filters) {
      _filterKeys[filter.id] = GlobalKey();
    }
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: _effectiveConfig.animationDuration,
      vsync: this,
    );

    _skeletonController = AnimationController(
      duration: _effectiveConfig.skeletonAnimationDuration,
      vsync: this,
    )..repeat();

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _skeletonAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _skeletonController,
      curve: Curves.linear,
    ));

    if (widget.isVisible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(AppFilterBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.filters != widget.filters) {
      setState(() {
        _currentFilters = List.from(widget.filters);
      });
    }

    if (oldWidget.isVisible != widget.isVisible) {
      if (widget.isVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _skeletonController.dispose();
    _focusNode.dispose();
    // Dispose all overlay entries
    for (final entry in _overlayEntries.values) {
      entry?.remove();
    }
    super.dispose();
  }

  void _handleFilterChanged(AppFilter filter, dynamic value) {
    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    setState(() {
      _currentFilters = AppFilterBarUtils.applyFilter(
        _currentFilters,
        filter.id,
        value,
      );
    });

    widget.onApplied?.call(filter, value);
    widget.onChanged?.call(_currentFilters);
  }


  void _handleClearAll() {
    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.mediumImpact();
    }

    setState(() {
      _currentFilters = AppFilterBarUtils.clearAllFilters(_currentFilters);
    });

    widget.onChanged?.call(_currentFilters);
  }

  void _showFilterPopover(AppFilter filter) {
    final key = _filterKeys[filter.id];
    if (key == null) return;

    // Remove existing overlay if any
    _overlayEntries[filter.id]?.remove();

    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntries[filter.id] = OverlayEntry(
      builder: (context) => _FilterPopover(
        filter: filter,
        position: position,
        anchorSize: size,
        config: _effectiveConfig,
        onApply: (value) {
          _handleFilterChanged(filter, value);
          _overlayEntries[filter.id]?.remove();
          _overlayEntries[filter.id] = null;
        },
        onClose: () {
          _overlayEntries[filter.id]?.remove();
          _overlayEntries[filter.id] = null;
        },
      ),
    );

    Overlay.of(context).insert(_overlayEntries[filter.id]!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRTL = Directionality.of(context) == TextDirection.rtl ||
        (_effectiveConfig.enableRTL && _effectiveConfig.textDirection == TextDirection.rtl);

    if (!widget.isVisible) {
      return const SizedBox.shrink();
    }

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Focus(
                focusNode: _focusNode,
                onKeyEvent: _effectiveConfig.enableKeyboardNavigation
                    ? (node, event) => _handleKeyEvent(event)
                    : null,
                child: Semantics(
                  label: _effectiveConfig.semanticLabel ?? 'Filter bar',
                  hint: _effectiveConfig.semanticHint ?? 'Use arrow keys to navigate filters',
                  enabled: widget.state != AppFilterBarState.disabled,
                  child: Container(
                    constraints: _effectiveConfig.constraints,
                    margin: _effectiveConfig.margin,
                    child: _buildContent(context, colorScheme),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ColorScheme colorScheme) {
    switch (widget.state) {
      case AppFilterBarState.skeleton:
        return _buildSkeletonState(context, colorScheme);
      case AppFilterBarState.loading:
        return _buildLoadingState(context, colorScheme);
      default:
        return _buildNormalState(context, colorScheme);
    }
  }

  Widget _buildNormalState(BuildContext context, ColorScheme colorScheme) {
    final activeFilters = AppFilterBarUtils.getActiveFilters(_currentFilters);
    final showSummary = _effectiveConfig.showSummary && activeFilters.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFilterBar(context, colorScheme),
        if (showSummary) ...[
          SizedBox(height: _effectiveConfig.spacing),
          _buildSummary(context, colorScheme, activeFilters),
        ],
      ],
    );
  }

  Widget _buildFilterBar(BuildContext context, ColorScheme colorScheme) {
    switch (widget.variant) {
      case AppFilterBarVariant.chips:
        return _buildChipsVariant(context, colorScheme);
      case AppFilterBarVariant.popovers:
        return _buildPopoversVariant(context, colorScheme);
    }
  }

  Widget _buildChipsVariant(BuildContext context, ColorScheme colorScheme) {
    final visibleFilters = _currentFilters.where((f) => f.isVisible).toList();
    final showMore = visibleFilters.length > _effectiveConfig.maxVisibleChips;
    final displayFilters = showMore
        ? visibleFilters.take(_effectiveConfig.maxVisibleChips).toList()
        : visibleFilters;

    return Wrap(
      spacing: _effectiveConfig.spacing,
      runSpacing: _effectiveConfig.runSpacing,
      children: [
        ...displayFilters.map((filter) => _buildFilterChip(context, colorScheme, filter)),
        if (showMore) _buildMoreChip(context, colorScheme, visibleFilters.length - _effectiveConfig.maxVisibleChips),
        if (_effectiveConfig.enableClearAll && AppFilterBarUtils.getActiveFilters(_currentFilters).isNotEmpty)
          _buildClearAllChip(context, colorScheme),
      ],
    );
  }

  Widget _buildPopoversVariant(BuildContext context, ColorScheme colorScheme) {
    final visibleFilters = _currentFilters.where((f) => f.isVisible).toList();

    return Wrap(
      spacing: _effectiveConfig.spacing,
      runSpacing: _effectiveConfig.runSpacing,
      children: [
        ...visibleFilters.map((filter) => _buildFilterPopoverButton(context, colorScheme, filter)),
        if (_effectiveConfig.enableClearAll && AppFilterBarUtils.getActiveFilters(_currentFilters).isNotEmpty)
          _buildClearAllChip(context, colorScheme),
      ],
    );
  }

  Widget _buildFilterChip(BuildContext context, ColorScheme colorScheme, AppFilter filter) {
    final isHovered = _hoveredFilterId == filter.id;
    final isFocused = _focusedFilterId == filter.id;
    final isPressed = _pressedFilterId == filter.id;
    final isDisabled = filter.isDisabled || widget.state == AppFilterBarState.disabled;
    final isActive = filter.isActive;

    Color? backgroundColor;
    Color? borderColor;
    Color? textColor;

    if (isDisabled) {
      backgroundColor = _effectiveConfig.disabledBackgroundColor ?? colorScheme.surfaceContainerHighest.withValues(alpha: 0.12);
      borderColor = _effectiveConfig.disabledBorderColor ?? colorScheme.outline.withValues(alpha: 0.12);
      textColor = _effectiveConfig.disabledTextColor ?? colorScheme.onSurface.withValues(alpha: 0.38);
    } else if (isActive) {
      backgroundColor = _effectiveConfig.selectedBackgroundColor ?? colorScheme.primaryContainer;
      borderColor = _effectiveConfig.selectedBorderColor ?? colorScheme.primary;
      textColor = _effectiveConfig.selectedTextColor ?? colorScheme.onPrimaryContainer;
    } else if (isPressed) {
      backgroundColor = _effectiveConfig.selectedBackgroundColor ?? colorScheme.primaryContainer.withValues(alpha: 0.8);
      borderColor = _effectiveConfig.selectedBorderColor ?? colorScheme.primary.withValues(alpha: 0.8);
      textColor = _effectiveConfig.selectedTextColor ?? colorScheme.onPrimaryContainer;
    } else if (isHovered) {
      backgroundColor = _effectiveConfig.hoverBackgroundColor ?? colorScheme.surfaceContainerHighest.withValues(alpha: 0.08);
      borderColor = _effectiveConfig.hoverBorderColor ?? colorScheme.primary.withValues(alpha: 0.5);
      textColor = _effectiveConfig.hoverTextColor ?? colorScheme.onSurface;
    } else if (isFocused) {
      backgroundColor = _effectiveConfig.backgroundColor ?? Colors.transparent;
      borderColor = colorScheme.primary;
      textColor = _effectiveConfig.textColor ?? colorScheme.onSurface;
    } else {
      backgroundColor = _effectiveConfig.backgroundColor ?? Colors.transparent;
      borderColor = _effectiveConfig.borderColor ?? colorScheme.outline;
      textColor = _effectiveConfig.textColor ?? colorScheme.onSurface;
    }

    return MouseRegion(
      key: _filterKeys[filter.id],
      cursor: isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      onEnter: isDisabled ? null : (_) => setState(() => _hoveredFilterId = filter.id),
      onExit: isDisabled ? null : (_) => setState(() => _hoveredFilterId = null),
      child: GestureDetector(
        onTapDown: isDisabled ? null : (_) => setState(() => _pressedFilterId = filter.id),
        onTapUp: isDisabled ? null : (_) => setState(() => _pressedFilterId = null),
        onTapCancel: isDisabled ? null : () => setState(() => _pressedFilterId = null),
        onTap: isDisabled ? null : () {
          if (filter.type == FilterType.boolean) {
            _handleFilterChanged(filter, !filter.value);
          } else {
            _showFilterPopover(filter);
          }
        },
        child: AnimatedContainer(
          duration: _effectiveConfig.animationDuration,
          curve: _effectiveConfig.animationCurve,
          height: _effectiveConfig.chipHeight,
          padding: EdgeInsets.symmetric(horizontal: _effectiveConfig.padding),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
            border: Border.all(
              color: borderColor,
              width: _effectiveConfig.borderWidth,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (filter.icon != null) ...[
                Icon(
                  filter.icon,
                  size: _effectiveConfig.iconSize,
                  color: textColor,
                ),
                SizedBox(width: _effectiveConfig.iconSpacing),
              ],
              Text(
                filter.label,
                style: TextStyle(
                  fontSize: _effectiveConfig.fontSize,
                  fontWeight: _effectiveConfig.fontWeight,
                  color: textColor,
                ),
              ),
              if (filter.hasValue) ...[
                SizedBox(width: _effectiveConfig.iconSpacing),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _effectiveConfig.badgeBackgroundColor ?? colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    filter.selectedCount.toString(),
                    style: TextStyle(
                      fontSize: _effectiveConfig.fontSize - 2,
                      color: _effectiveConfig.badgeTextColor ?? colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              if (_effectiveConfig.showDropdownIcon && filter.type != FilterType.boolean) ...[
                SizedBox(width: _effectiveConfig.iconSpacing),
                Icon(
                  _effectiveConfig.dropdownIcon,
                  size: _effectiveConfig.iconSize - 2,
                  color: textColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterPopoverButton(BuildContext context, ColorScheme colorScheme, AppFilter filter) {
    return _buildFilterChip(context, colorScheme, filter);
  }

  Widget _buildMoreChip(BuildContext context, ColorScheme colorScheme, int count) {
    return Container(
      height: _effectiveConfig.chipHeight,
      padding: EdgeInsets.symmetric(horizontal: _effectiveConfig.padding),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
          width: _effectiveConfig.borderWidth,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '+$count ${_effectiveConfig.moreLabel ?? 'more'}',
            style: TextStyle(
              fontSize: _effectiveConfig.fontSize,
              fontWeight: _effectiveConfig.fontWeight,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClearAllChip(BuildContext context, ColorScheme colorScheme) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleClearAll,
        child: Container(
          height: _effectiveConfig.chipHeight,
          padding: EdgeInsets.symmetric(horizontal: _effectiveConfig.padding),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
            border: Border.all(
              color: colorScheme.error.withValues(alpha: 0.5),
              width: _effectiveConfig.borderWidth,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _effectiveConfig.clearIcon,
                size: _effectiveConfig.iconSize,
                color: colorScheme.error,
              ),
              SizedBox(width: _effectiveConfig.iconSpacing),
              Text(
                _effectiveConfig.clearAllLabel ?? 'Clear all',
                style: TextStyle(
                  fontSize: _effectiveConfig.fontSize,
                  fontWeight: _effectiveConfig.fontWeight,
                  color: colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(BuildContext context, ColorScheme colorScheme, List<AppFilter> activeFilters) {
    if (widget.summaryBuilder != null) {
      return widget.summaryBuilder!(context, activeFilters, _currentFilters.length);
    }

    final summaryText = AppFilterBarUtils.generateSummaryText(
      activeFilters,
      separator: _effectiveConfig.summarySeparator ?? ' • ',
      maxLength: _effectiveConfig.maxSummaryLength,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _effectiveConfig.padding,
        vertical: _effectiveConfig.padding / 2,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
      ),
      child: Row(
        children: [
          Icon(
            _effectiveConfig.filterIcon,
            size: _effectiveConfig.iconSize,
            color: colorScheme.primary,
          ),
          SizedBox(width: _effectiveConfig.iconSpacing),
          Expanded(
            child: Text(
              '${_effectiveConfig.summaryPrefix ?? 'Active:'} $summaryText',
              style: TextStyle(
                fontSize: _effectiveConfig.fontSize - 1,
                color: colorScheme.onSurface.withValues(alpha: 0.8),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(_effectiveConfig.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _effectiveConfig.iconSize,
              height: _effectiveConfig.iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
            SizedBox(width: _effectiveConfig.spacing),
            Text(
              _effectiveConfig.loadingLabel ?? 'Loading filters...',
              style: TextStyle(
                fontSize: _effectiveConfig.fontSize,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context, ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Wrap(
          spacing: _effectiveConfig.spacing,
          runSpacing: _effectiveConfig.runSpacing,
          children: List.generate(
            _effectiveConfig.skeletonFilterCount,
            (index) => Container(
              width: 100.0 + (index * 20.0 % 60),
              height: _effectiveConfig.chipHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
                gradient: LinearGradient(
                  begin: Alignment(-1 + _skeletonAnimation.value, 0),
                  end: Alignment(1 + _skeletonAnimation.value, 0),
                  colors: [
                    _effectiveConfig.skeletonBaseColor,
                    _effectiveConfig.skeletonHighlightColor,
                    _effectiveConfig.skeletonBaseColor,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  KeyEventResult _handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    if (event.logicalKey == LogicalKeyboardKey.escape) {
      _handleClearAll();
      return KeyEventResult.handled;
    }

    if (event.logicalKey == LogicalKeyboardKey.tab) {
      // Navigate through filters
      final visibleFilters = _currentFilters.where((f) => f.isVisible).toList();
      if (visibleFilters.isEmpty) return KeyEventResult.ignored;

      final currentIndex = visibleFilters.indexWhere((f) => f.id == _focusedFilterId);
      final nextIndex = HardwareKeyboard.instance.isShiftPressed
          ? (currentIndex - 1 + visibleFilters.length) % visibleFilters.length
          : (currentIndex + 1) % visibleFilters.length;

      setState(() {
        _focusedFilterId = visibleFilters[nextIndex].id;
      });
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}

/// Filter popover widget
class _FilterPopover extends StatefulWidget {
  final AppFilter filter;
  final Offset position;
  final Size anchorSize;
  final AppFilterBarConfig config;
  final Function(dynamic) onApply;
  final VoidCallback onClose;

  const _FilterPopover({
    required this.filter,
    required this.position,
    required this.anchorSize,
    required this.config,
    required this.onApply,
    required this.onClose,
  });

  @override
  State<_FilterPopover> createState() => _FilterPopoverState();
}

class _FilterPopoverState extends State<_FilterPopover> {
  late dynamic _currentValue;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _currentValue = widget.filter.value;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenSize = MediaQuery.of(context).size;

    // Calculate popover position
    double left = widget.position.dx;
    double top = widget.position.dy + widget.anchorSize.height + 4;

    // Adjust if popover goes off screen
    if (left + widget.config.popoverWidth > screenSize.width - 16) {
      left = screenSize.width - widget.config.popoverWidth - 16;
    }
    if (top + widget.config.popoverMaxHeight > screenSize.height - 16) {
      top = widget.position.dy - widget.config.popoverMaxHeight - 4;
    }

    return Stack(
      children: [
        // Backdrop to capture taps outside
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onClose,
            child: Container(color: Colors.transparent),
          ),
        ),
        // Popover
        Positioned(
          left: left,
          top: top,
          child: Material(
            elevation: widget.config.popoverElevation,
            borderRadius: BorderRadius.circular(widget.config.borderRadius * 2),
            child: Container(
              width: widget.config.popoverWidth,
              constraints: BoxConstraints(maxHeight: widget.config.popoverMaxHeight),
              padding: widget.config.popoverPadding,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(widget.config.borderRadius * 2),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildPopoverHeader(colorScheme),
                  if (widget.config.enableSearch && widget.filter.options.length > 5) ...[
                    const SizedBox(height: 8),
                    _buildSearchField(colorScheme),
                  ],
                  const SizedBox(height: 8),
                  Flexible(
                    child: _buildPopoverContent(colorScheme),
                  ),
                  const SizedBox(height: 8),
                  _buildPopoverActions(colorScheme),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopoverHeader(ColorScheme colorScheme) {
    return Row(
      children: [
        if (widget.filter.icon != null) ...[
          Icon(
            widget.filter.icon,
            size: widget.config.iconSize,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            widget.filter.label,
            style: TextStyle(
              fontSize: widget.config.fontSize + 2,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, size: widget.config.iconSize),
          onPressed: widget.onClose,
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }

  Widget _buildSearchField(ColorScheme colorScheme) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: widget.config.searchPlaceholder ?? 'Search...',
        prefixIcon: Icon(Icons.search, size: widget.config.iconSize),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _searchQuery = value.toLowerCase();
        });
      },
    );
  }

  Widget _buildPopoverContent(ColorScheme colorScheme) {
    switch (widget.filter.type) {
      case FilterType.single:
      case FilterType.multiple:
        return _buildOptionsList(colorScheme);
      case FilterType.text:
        return _buildTextInput(colorScheme);
      case FilterType.range:
        return _buildRangeInput(colorScheme);
      case FilterType.date:
        return _buildDatePicker(colorScheme);
      case FilterType.dateRange:
        return _buildDateRangePicker(colorScheme);
      case FilterType.color:
        return _buildColorPicker(colorScheme);
      case FilterType.boolean:
        return _buildBooleanToggle(colorScheme);
    }
  }

  Widget _buildOptionsList(ColorScheme colorScheme) {
    final filteredOptions = widget.filter.options.where((option) {
      if (_searchQuery.isEmpty) return true;
      return option.label.toLowerCase().contains(_searchQuery);
    }).toList();

    if (filteredOptions.isEmpty) {
      return Center(
        child: Text(
          widget.config.noResultsLabel ?? 'No results found',
          style: TextStyle(
            fontSize: widget.config.fontSize,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredOptions.length,
      itemBuilder: (context, index) {
        final option = filteredOptions[index];
        final isSelected = widget.filter.type == FilterType.multiple
            ? (_currentValue as List?)?.contains(option.value) ?? false
            : _currentValue == option.value;

        return ListTile(
          dense: true,
          leading: option.icon != null
              ? Icon(option.icon, size: widget.config.iconSize, color: option.color)
              : null,
          title: Text(
            option.label,
            style: TextStyle(fontSize: widget.config.fontSize),
          ),
          trailing: isSelected
              ? Icon(
                  widget.config.selectedIcon,
                  size: widget.config.iconSize,
                  color: colorScheme.primary,
                )
              : null,
          selected: isSelected,
          onTap: option.isDisabled
              ? null
              : () {
                  setState(() {
                    if (widget.filter.type == FilterType.multiple) {
                      final currentList = List.from(_currentValue ?? []);
                      if (isSelected) {
                        currentList.remove(option.value);
                      } else {
                        currentList.add(option.value);
                      }
                      _currentValue = currentList;
                    } else {
                      _currentValue = option.value;
                      if (widget.config.closeOnSelect) {
                        widget.onApply(_currentValue);
                        widget.onClose();
                      }
                    }
                  });
                },
        );
      },
    );
  }

  Widget _buildTextInput(ColorScheme colorScheme) {
    final controller = TextEditingController(text: _currentValue?.toString() ?? '');
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: widget.filter.placeholder ?? 'Enter text...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
        ),
      ),
      onChanged: (value) {
        _currentValue = value;
      },
    );
  }

  Widget _buildRangeInput(ColorScheme colorScheme) {
    final min = widget.filter.minValue ?? 0;
    final max = widget.filter.maxValue ?? 100;
    final values = _currentValue ?? [min, max];

    return Column(
      children: [
        RangeSlider(
          values: RangeValues(values[0].toDouble(), values[1].toDouble()),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: ((max - min) / (widget.filter.stepValue ?? 1)).round(),
          labels: RangeLabels(values[0].toString(), values[1].toString()),
          onChanged: (RangeValues newValues) {
            setState(() {
              _currentValue = [newValues.start, newValues.end];
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${values[0]}', style: TextStyle(fontSize: widget.config.fontSize)),
            Text('${values[1]}', style: TextStyle(fontSize: widget.config.fontSize)),
          ],
        ),
      ],
    );
  }

  Widget _buildDatePicker(ColorScheme colorScheme) {
    return TextButton.icon(
      icon: const Icon(Icons.calendar_today),
      label: Text(_currentValue != null
          ? '${(_currentValue as DateTime).year}-${(_currentValue as DateTime).month.toString().padLeft(2, '0')}-${(_currentValue as DateTime).day.toString().padLeft(2, '0')}'
          : 'Select date'),
      onPressed: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: _currentValue ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (date != null) {
          setState(() {
            _currentValue = date;
          });
        }
      },
    );
  }

  Widget _buildDateRangePicker(ColorScheme colorScheme) {
    return TextButton.icon(
      icon: const Icon(Icons.date_range),
      label: Text(_currentValue != null && (_currentValue as List).length == 2
          ? '${_formatDate((_currentValue as List)[0])} - ${_formatDate((_currentValue as List)[1])}'
          : 'Select date range'),
      onPressed: () async {
        final range = await showDateRangePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (range != null) {
          setState(() {
            _currentValue = [range.start, range.end];
          });
        }
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Widget _buildColorPicker(ColorScheme colorScheme) {
    final colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colors.map((color) {
        final colorValue = color;
        final isSelected = _currentValue == colorValue;
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentValue = colorValue;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(widget.config.borderRadius),
              border: Border.all(
                color: isSelected ? colorScheme.primary : Colors.transparent,
                width: 3,
              ),
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: widget.config.iconSize,
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBooleanToggle(ColorScheme colorScheme) {
    return SwitchListTile(
      title: Text(
        widget.filter.label,
        style: TextStyle(fontSize: widget.config.fontSize),
      ),
      value: _currentValue ?? false,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
        });
      },
    );
  }

  Widget _buildPopoverActions(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: widget.onClose,
          child: Text('Cancel'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            widget.onApply(_currentValue);
            widget.onClose();
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}