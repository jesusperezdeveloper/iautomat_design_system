import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pagination_config.dart';

/// A comprehensive pagination widget based on Material Design
///
/// The [DSPagination] provides flexible pagination interfaces with:
/// - Page-based pagination with numbered pages
/// - Cursor-based pagination for continuous scrolling
/// - Platform-adaptive behavior
/// - Full accessibility support
/// - RTL text direction support
/// - Material 3 design integration
///
/// Example usage:
/// ```dart
/// DSPagination.pageBased(
///   page: currentPage,
///   pageSize: 20,
///   total: totalItems,
///   onPageChanged: (page) => setState(() => currentPage = page),
/// )
/// ```
class DSPagination extends StatefulWidget {
  /// The variant of the pagination
  final DSPaginationVariant variant;

  /// Current page number (1-based)
  final int page;

  /// Number of items per page
  final int pageSize;

  /// Total number of items
  final int total;

  /// Callback when page changes
  final OnPageChanged? onPageChanged;

  /// Callback when cursor changes (for cursor-based pagination)
  final OnCursorChanged? onCursorChanged;

  /// Callback when page size changes
  final OnPageSizeChanged? onPageSizeChanged;

  /// Current state of the pagination widget
  final DSPaginationState state;

  /// Whether the pagination widget is visible
  final bool isVisible;

  /// Configuration for the pagination widget
  final DSPaginationConfig? config;

  /// Pagination data model for complex configurations
  final DSPaginationData? data;

  /// Next cursor for cursor-based pagination
  final String? nextCursor;

  /// Previous cursor for cursor-based pagination
  final String? previousCursor;

  /// Whether there's a next page (cursor-based)
  final bool hasNextPage;

  /// Whether there's a previous page (cursor-based)
  final bool hasPreviousPage;

  /// Custom page builder for advanced customization
  final Widget Function(BuildContext context, int page, bool isSelected)?
      pageBuilder;

  /// Custom navigation button builder
  final Widget Function(BuildContext context, String action, bool enabled)?
      navButtonBuilder;

  /// Custom loading builder
  final Widget Function(BuildContext context)? loadingBuilder;

  /// Custom skeleton builder
  final Widget Function(BuildContext context)? skeletonBuilder;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable sound effects
  final bool enableSoundEffects;

  /// Custom focus node
  final FocusNode? focusNode;

  /// Create a page-based pagination widget
  const DSPagination.pageBased({
    super.key,
    required this.page,
    required this.pageSize,
    required this.total,
    required this.onPageChanged,
    this.onPageSizeChanged,
    this.state = DSPaginationState.defaultState,
    this.isVisible = true,
    this.config,
    this.data,
    this.pageBuilder,
    this.navButtonBuilder,
    this.loadingBuilder,
    this.skeletonBuilder,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.focusNode,
  })  : variant = DSPaginationVariant.pageBased,
        onCursorChanged = null,
        nextCursor = null,
        previousCursor = null,
        hasNextPage = false,
        hasPreviousPage = false;

  /// Create a cursor-based pagination widget
  const DSPagination.cursor({
    super.key,
    required this.onCursorChanged,
    this.nextCursor,
    this.previousCursor,
    this.hasNextPage = false,
    this.hasPreviousPage = false,
    this.state = DSPaginationState.defaultState,
    this.isVisible = true,
    this.config,
    this.data,
    this.navButtonBuilder,
    this.loadingBuilder,
    this.skeletonBuilder,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.focusNode,
  })  : variant = DSPaginationVariant.cursor,
        page = 1,
        pageSize = 0,
        total = 0,
        onPageChanged = null,
        onPageSizeChanged = null,
        pageBuilder = null;

  @override
  State<DSPagination> createState() => _DSPaginationState();
}

class _DSPaginationState extends State<DSPagination>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _skeletonController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _skeletonAnimation;
  late FocusNode _focusNode;

  int _hoveredPage = -1;
  final int _focusedPage = -1;
  bool _showJumpDialog = false;

  DSPaginationConfig get _effectiveConfig {
    return widget.config ?? DSPaginationConfig.medium;
  }

  DSPaginationData get _effectiveData {
    if (widget.data != null) return widget.data!;

    final totalPages = DSPaginationUtils.calculateTotalPages(
      widget.total,
      widget.pageSize,
    );

    return DSPaginationData(
      currentPage: widget.page,
      pageSize: widget.pageSize,
      totalItems: widget.total,
      totalPages: totalPages,
      nextCursor: widget.nextCursor,
      previousCursor: widget.previousCursor,
      hasNextPage: widget.hasNextPage,
      hasPreviousPage: widget.hasPreviousPage,
      hoveredPage: _hoveredPage,
      focusedPage: _focusedPage,
      showJumpDialog: _showJumpDialog,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeFocus();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: _effectiveConfig.animationDuration,
      vsync: this,
    );

    _skeletonController = AnimationController(
      duration: _effectiveConfig.skeletonAnimationDuration,
      vsync: this,
    );

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

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _skeletonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _skeletonController,
      curve: Curves.easeInOut,
    ));

    _updateState(widget.state);
  }

  void _initializeFocus() {
    _focusNode = widget.focusNode ?? FocusNode();
  }

  void _updateState(DSPaginationState newState) {
    switch (newState) {
      case DSPaginationState.skeleton:
        _skeletonController.repeat();
        break;
      case DSPaginationState.loading:
        _animationController.forward();
        break;
      default:
        _skeletonController.stop();
        _animationController.forward();
        break;
    }
  }

  void _handlePageChanged(int page) {
    if (widget.onPageChanged != null) {
      widget.onPageChanged!(page);

      if (_effectiveConfig.enableHapticFeedback) {
        HapticFeedback.selectionClick();
      }
    }
  }

  void _handleCursorChanged(String? cursor, bool isNext) {
    if (widget.onCursorChanged != null) {
      widget.onCursorChanged!(cursor, isNext);

      if (_effectiveConfig.enableHapticFeedback) {
        HapticFeedback.selectionClick();
      }
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (!_effectiveConfig.enableKeyboardNavigation) return;
    if (event is! KeyDownEvent) return;

    final data = _effectiveData;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        if (data.canGoToPrevious) {
          _handlePageChanged(data.currentPage - 1);
        }
        break;
      case LogicalKeyboardKey.arrowRight:
        if (data.canGoToNext) {
          _handlePageChanged(data.currentPage + 1);
        }
        break;
      case LogicalKeyboardKey.home:
        if (data.currentPage > 1) {
          _handlePageChanged(1);
        }
        break;
      case LogicalKeyboardKey.end:
        if (data.currentPage < data.totalPages) {
          _handlePageChanged(data.totalPages);
        }
        break;
      case LogicalKeyboardKey.keyG:
        if (_effectiveConfig.showJumpToPage) {
          _showJumpToPageDialog();
        }
        break;
    }
  }

  void _showJumpToPageDialog() {
    setState(() {
      _showJumpDialog = true;
    });

    showDialog<int>(
      context: context,
      builder: (context) => _JumpToPageDialog(
        currentPage: _effectiveData.currentPage,
        totalPages: _effectiveData.totalPages,
      ),
    ).then((page) {
      setState(() {
        _showJumpDialog = false;
      });

      if (page != null && page != _effectiveData.currentPage) {
        _handlePageChanged(page);
      }
    });
  }

  @override
  void didUpdateWidget(DSPagination oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != oldWidget.state) {
      _updateState(widget.state);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _skeletonController.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: _buildPaginationWidget(context, theme, colorScheme, isRTL),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaginationWidget(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, bool isRTL) {
    if (widget.state == DSPaginationState.skeleton) {
      return _buildSkeletonWidget(context, theme);
    }

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        _handleKeyEvent(event);
        return KeyEventResult.handled;
      },
      child: Container(
        constraints: _effectiveConfig.constraints,
        padding: _effectiveConfig.padding,
        margin: _effectiveConfig.margin,
        child: _buildContent(context, colorScheme, isRTL),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, ColorScheme colorScheme, bool isRTL) {
    switch (widget.variant) {
      case DSPaginationVariant.pageBased:
        return _buildPageBasedPagination(context, colorScheme, isRTL);
      case DSPaginationVariant.cursor:
        return _buildCursorPagination(context, colorScheme, isRTL);
    }
  }

  Widget _buildPageBasedPagination(
      BuildContext context, ColorScheme colorScheme, bool isRTL) {
    final data = _effectiveData;

    if (data.totalPages <= 1 && !_effectiveConfig.showPageInfo) {
      return const SizedBox.shrink();
    }

    final children = <Widget>[];

    // Page info
    if (_effectiveConfig.showPageInfo) {
      children.add(_buildPageInfo(context, colorScheme));
      children.add(SizedBox(width: _effectiveConfig.spacing * 2));
    }

    // Navigation buttons and pages
    final navChildren = <Widget>[];

    // First page button
    if (_effectiveConfig.showFirstLast &&
        data.totalPages > _effectiveConfig.maxVisiblePages) {
      navChildren.add(
          _buildNavButton(context, colorScheme, 'first', data.currentPage > 1));
      navChildren.add(SizedBox(width: _effectiveConfig.spacing));
    }

    // Previous button
    if (_effectiveConfig.showPrevNext) {
      navChildren.add(_buildNavButton(
          context, colorScheme, 'previous', data.canGoToPrevious));
      navChildren.add(SizedBox(width: _effectiveConfig.spacing));
    }

    // Page numbers
    if (_effectiveConfig.showPageNumbers && data.totalPages > 0) {
      navChildren.addAll(_buildPageNumbers(context, colorScheme));
    }

    // Next button
    if (_effectiveConfig.showPrevNext) {
      navChildren.add(SizedBox(width: _effectiveConfig.spacing));
      navChildren
          .add(_buildNavButton(context, colorScheme, 'next', data.canGoToNext));
    }

    // Last page button
    if (_effectiveConfig.showFirstLast &&
        data.totalPages > _effectiveConfig.maxVisiblePages) {
      navChildren.add(SizedBox(width: _effectiveConfig.spacing));
      navChildren.add(_buildNavButton(
          context, colorScheme, 'last', data.currentPage < data.totalPages));
    }

    children.add(
      Directionality(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: navChildren,
        ),
      ),
    );

    return _wrapWithLayout(children);
  }

  Widget _buildCursorPagination(
      BuildContext context, ColorScheme colorScheme, bool isRTL) {
    final data = _effectiveData;
    final children = <Widget>[];

    // Previous button
    children.add(_buildNavButton(
        context, colorScheme, 'previous', data.hasPreviousPage));
    children.add(SizedBox(width: _effectiveConfig.spacing));

    // Load more button (if enabled)
    if (_effectiveConfig.showLoadMore) {
      children.add(_buildLoadMoreButton(context, colorScheme));
      children.add(SizedBox(width: _effectiveConfig.spacing));
    }

    // Next button
    children
        .add(_buildNavButton(context, colorScheme, 'next', data.hasNextPage));

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: _wrapWithLayout(children),
    );
  }

  Widget _wrapWithLayout(List<Widget> children) {
    switch (_effectiveConfig.layout) {
      case DSPaginationLayout.horizontal:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        );
      case DSPaginationLayout.vertical:
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        );
      case DSPaginationLayout.compact:
        return Wrap(
          spacing: _effectiveConfig.spacing,
          runSpacing: _effectiveConfig.spacing,
          alignment: WrapAlignment.center,
          children: children,
        );
    }
  }

  Widget _buildPageInfo(BuildContext context, ColorScheme colorScheme) {
    final data = _effectiveData;

    return Text(
      data.pageInfoText,
      style: TextStyle(
        fontSize: _effectiveConfig.fontSize,
        fontWeight: _effectiveConfig.fontWeight,
        color: _effectiveConfig.textColor ?? colorScheme.onSurface,
      ),
    );
  }

  List<Widget> _buildPageNumbers(
      BuildContext context, ColorScheme colorScheme) {
    final data = _effectiveData;
    final visiblePages = data.getVisiblePages(_effectiveConfig.maxVisiblePages);
    final children = <Widget>[];

    // Start ellipsis
    if (_effectiveConfig.showEllipsis &&
        data.shouldShowStartEllipsis(visiblePages)) {
      children.add(_buildPageButton(context, colorScheme, 1, false));
      children.add(SizedBox(width: _effectiveConfig.spacing));
      children.add(_buildEllipsis(context, colorScheme));
      children.add(SizedBox(width: _effectiveConfig.spacing));
    }

    // Visible page numbers
    for (int i = 0; i < visiblePages.length; i++) {
      final page = visiblePages[i];
      final isSelected = page == data.currentPage;

      if (i > 0) {
        children.add(SizedBox(width: _effectiveConfig.spacing));
      }

      children.add(_buildPageButton(context, colorScheme, page, isSelected));
    }

    // End ellipsis
    if (_effectiveConfig.showEllipsis &&
        data.shouldShowEndEllipsis(visiblePages)) {
      children.add(SizedBox(width: _effectiveConfig.spacing));
      children.add(_buildEllipsis(context, colorScheme));
      children.add(SizedBox(width: _effectiveConfig.spacing));
      children
          .add(_buildPageButton(context, colorScheme, data.totalPages, false));
    }

    return children;
  }

  Widget _buildPageButton(BuildContext context, ColorScheme colorScheme,
      int page, bool isSelected) {
    if (widget.pageBuilder != null) {
      return widget.pageBuilder!(context, page, isSelected);
    }

    final isHovered = _hoveredPage == page;
    final isDisabled = widget.state == DSPaginationState.disabled;

    Color? backgroundColor;
    Color? borderColor;
    Color? textColor;

    if (isDisabled) {
      backgroundColor = _effectiveConfig.disabledBackgroundColor;
      borderColor = _effectiveConfig.disabledBorderColor;
      textColor = _effectiveConfig.disabledTextColor ??
          colorScheme.onSurface.withValues(alpha: 0.38);
    } else if (isSelected) {
      backgroundColor =
          _effectiveConfig.selectedBackgroundColor ?? colorScheme.primary;
      borderColor = _effectiveConfig.selectedBorderColor ?? colorScheme.primary;
      textColor = _effectiveConfig.selectedTextColor ?? colorScheme.onPrimary;
    } else if (isHovered) {
      backgroundColor =
          _effectiveConfig.hoverBackgroundColor ?? colorScheme.primaryContainer;
      borderColor = _effectiveConfig.hoverBorderColor ?? colorScheme.outline;
      textColor =
          _effectiveConfig.hoverTextColor ?? colorScheme.onPrimaryContainer;
    } else {
      backgroundColor = _effectiveConfig.backgroundColor ?? Colors.transparent;
      borderColor = _effectiveConfig.borderColor ?? colorScheme.outline;
      textColor = _effectiveConfig.textColor ?? colorScheme.onSurface;
    }

    return SizedBox(
      width: _effectiveConfig.buttonSize,
      height: _effectiveConfig.buttonSize,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _hoveredPage = page;
          });
        },
        onExit: (_) {
          setState(() {
            _hoveredPage = -1;
          });
        },
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
          child: InkWell(
            onTap: isDisabled ? null : () => _handlePageChanged(page),
            borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(_effectiveConfig.borderRadius),
                border: Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: _effectiveConfig.borderWidth,
                ),
              ),
              child: Center(
                child: Text(
                  page.toString(),
                  style: TextStyle(
                    fontSize: _effectiveConfig.fontSize,
                    fontWeight: _effectiveConfig.fontWeight,
                    color: textColor,
                    height: _effectiveConfig.lineHeight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, ColorScheme colorScheme,
      String action, bool enabled) {
    if (widget.navButtonBuilder != null) {
      return widget.navButtonBuilder!(context, action, enabled);
    }

    IconData icon;
    String label;
    VoidCallback? onPressed;

    switch (action) {
      case 'first':
        icon = _effectiveConfig.firstIcon;
        label = _effectiveConfig.firstLabel ?? 'First';
        onPressed = enabled ? () => _handlePageChanged(1) : null;
        break;
      case 'previous':
        icon = _effectiveConfig.previousIcon;
        label = _effectiveConfig.previousLabel ?? 'Previous';
        if (widget.variant == DSPaginationVariant.pageBased) {
          onPressed = enabled
              ? () => _handlePageChanged(_effectiveData.currentPage - 1)
              : null;
        } else {
          onPressed = enabled
              ? () => _handleCursorChanged(_effectiveData.previousCursor, false)
              : null;
        }
        break;
      case 'next':
        icon = _effectiveConfig.nextIcon;
        label = _effectiveConfig.nextLabel ?? 'Next';
        if (widget.variant == DSPaginationVariant.pageBased) {
          onPressed = enabled
              ? () => _handlePageChanged(_effectiveData.currentPage + 1)
              : null;
        } else {
          onPressed = enabled
              ? () => _handleCursorChanged(_effectiveData.nextCursor, true)
              : null;
        }
        break;
      case 'last':
        icon = _effectiveConfig.lastIcon;
        label = _effectiveConfig.lastLabel ?? 'Last';
        onPressed = enabled
            ? () => _handlePageChanged(_effectiveData.totalPages)
            : null;
        break;
      default:
        icon = Icons.help;
        label = action;
        onPressed = null;
    }

    return Semantics(
      label: DSPaginationUtils.getNavButtonSemanticLabel(action, enabled),
      child: SizedBox(
        width: _effectiveConfig.buttonSize,
        height: _effectiveConfig.buttonSize,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: _effectiveConfig.iconSize,
          color: enabled
              ? _effectiveConfig.iconColor ?? colorScheme.onSurface
              : _effectiveConfig.disabledIconColor ??
                  colorScheme.onSurface.withValues(alpha: 0.38),
          tooltip: label,
          style: IconButton.styleFrom(
            backgroundColor: _effectiveConfig.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(_effectiveConfig.borderRadius),
              side: BorderSide(
                color: _effectiveConfig.borderColor ?? colorScheme.outline,
                width: _effectiveConfig.borderWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis(BuildContext context, ColorScheme colorScheme) {
    return SizedBox(
      width: _effectiveConfig.buttonSize,
      height: _effectiveConfig.buttonSize,
      child: Center(
        child: Icon(
          _effectiveConfig.ellipsisIcon,
          size: _effectiveConfig.iconSize,
          color: _effectiveConfig.iconColor ?? colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildLoadMoreButton(BuildContext context, ColorScheme colorScheme) {
    final isLoading = _effectiveData.isLoadingMore;

    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () => _handleCursorChanged(_effectiveData.nextCursor, true),
      child: isLoading
          ? SizedBox(
              width: _effectiveConfig.iconSize,
              height: _effectiveConfig.iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: colorScheme.onPrimary,
              ),
            )
          : Text(_effectiveConfig.loadMoreLabel ?? 'Load More'),
    );
  }

  Widget _buildSkeletonWidget(BuildContext context, ThemeData theme) {
    if (widget.skeletonBuilder != null) {
      return widget.skeletonBuilder!(context);
    }

    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            _effectiveConfig.skeletonButtonCount,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < _effectiveConfig.skeletonButtonCount - 1
                    ? _effectiveConfig.spacing
                    : 0,
              ),
              child: Container(
                width: _effectiveConfig.buttonSize,
                height: _effectiveConfig.buttonSize,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(_effectiveConfig.borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      _effectiveConfig.skeletonBaseColor,
                      _effectiveConfig.skeletonHighlightColor,
                      _effectiveConfig.skeletonBaseColor,
                    ],
                    stops: [
                      0.0,
                      _skeletonAnimation.value,
                      1.0,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Dialog for jumping to a specific page
class _JumpToPageDialog extends StatefulWidget {
  final int currentPage;
  final int totalPages;

  const _JumpToPageDialog({
    required this.currentPage,
    required this.totalPages,
  });

  @override
  State<_JumpToPageDialog> createState() => _JumpToPageDialogState();
}

class _JumpToPageDialogState extends State<_JumpToPageDialog> {
  late TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentPage.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final text = _controller.text.trim();
    final page = int.tryParse(text);

    if (page == null) {
      setState(() {
        _errorText = 'Please enter a valid number';
      });
      return;
    }

    if (page < 1 || page > widget.totalPages) {
      setState(() {
        _errorText = 'Page must be between 1 and ${widget.totalPages}';
      });
      return;
    }

    Navigator.of(context).pop(page);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Jump to Page'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Page number',
              hintText: '1 - ${widget.totalPages}',
              errorText: _errorText,
            ),
            onSubmitted: (_) => _handleSubmit(),
            autofocus: true,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _handleSubmit,
          child: const Text('Go'),
        ),
      ],
    );
  }
}
