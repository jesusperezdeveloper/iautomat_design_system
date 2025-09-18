import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'in_page_search_config.dart';

/// Callback function type for search find operation
typedef OnInPageSearchFind = void Function(
    String query, List<AppSearchHighlight> highlights);

/// Callback function type for search controller actions
typedef OnInPageSearchAction = void Function(AppInPageSearchData data);

/// A comprehensive in-page search widget based on Material Design
///
/// The [AppInPageSearch] provides an inline search interface with:
/// - Real-time search with customizable highlighting
/// - Navigation between search results
/// - Platform-adaptive behavior
/// - Full accessibility support
/// - RTL text direction support
/// - Material 3 design integration
///
/// Example usage:
/// ```dart
/// AppInPageSearch.inline(
///   controller: searchController,
///   onFind: (query, highlights) => print('Found: $query'),
///   highlights: searchHighlights,
/// )
/// ```
class AppInPageSearch extends StatefulWidget {
  /// The variant of the in-page search
  final AppInPageSearchVariant variant;

  /// Controller for the search functionality
  final TextEditingController? controller;

  /// Callback when a search is performed
  final OnInPageSearchFind? onFind;

  /// Current search highlights
  final List<AppSearchHighlight> highlights;

  /// Current state of the search widget
  final AppInPageSearchState state;

  /// Whether the search widget is visible
  final bool isVisible;

  /// Configuration for the search widget
  final AppInPageSearchConfig? config;

  /// Search data model for complex configurations
  final AppInPageSearchData? data;

  /// Callback when the search should be closed
  final VoidCallback? onClose;

  /// Callback when navigating to next result
  final VoidCallback? onNext;

  /// Callback when navigating to previous result
  final VoidCallback? onPrevious;

  /// Callback when clearing the search
  final VoidCallback? onClear;

  /// Custom search controller
  final AppInPageSearchController? searchController;

  /// Whether to show the search bar expanded
  final bool isExpanded;

  /// Initial search query
  final String? initialQuery;

  /// Whether to auto-focus the search input
  final bool autoFocus;

  /// Custom focus node
  final FocusNode? focusNode;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable sound effects
  final bool enableSoundEffects;

  /// Custom result builder
  final Widget Function(BuildContext context, AppInPageSearchData data)?
      resultBuilder;

  /// Custom loading builder
  final Widget Function(BuildContext context)? loadingBuilder;

  /// Custom skeleton builder
  final Widget Function(BuildContext context)? skeletonBuilder;

  /// Create an inline in-page search widget
  const AppInPageSearch.inline({
    super.key,
    this.controller,
    this.onFind,
    this.highlights = const [],
    this.state = AppInPageSearchState.defaultState,
    this.isVisible = true,
    this.config,
    this.data,
    this.onClose,
    this.onNext,
    this.onPrevious,
    this.onClear,
    this.searchController,
    this.isExpanded = false,
    this.initialQuery,
    this.autoFocus = false,
    this.focusNode,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.resultBuilder,
    this.loadingBuilder,
    this.skeletonBuilder,
  }) : variant = AppInPageSearchVariant.inline;

  @override
  State<AppInPageSearch> createState() => _AppInPageSearchState();
}

/// Controller for AppInPageSearch
class AppInPageSearchController extends ChangeNotifier {
  AppInPageSearchData _data = const AppInPageSearchData();

  /// Current search data
  AppInPageSearchData get data => _data;

  /// Current search query
  String get query => _data.query;

  /// Current highlights
  List<AppSearchHighlight> get highlights => _data.highlights;

  /// Whether search is in progress
  bool get isSearching => _data.isSearching;

  /// Update search data
  void updateData(AppInPageSearchData newData) {
    _data = newData;
    notifyListeners();
  }

  /// Start a new search
  void search(String query) {
    _data = _data.copyWith(
      query: query,
      isSearching: true,
      lastSearchTime: DateTime.now(),
    );
    notifyListeners();
  }

  /// Update search results
  void updateResults(List<AppSearchHighlight> highlights) {
    _data = _data.copyWith(
      highlights: highlights,
      totalResults: highlights.length,
      currentResultIndex: highlights.isNotEmpty ? 1 : 0,
      isSearching: false,
      activeHighlightIndex: highlights.isNotEmpty ? 0 : -1,
    );
    notifyListeners();
  }

  /// Navigate to next result
  void nextResult() {
    if (_data.canNavigateNext) {
      final newIndex =
          (_data.activeHighlightIndex + 1) % _data.highlights.length;
      _data = _data.copyWith(
        activeHighlightIndex: newIndex,
        currentResultIndex: newIndex + 1,
      );
      notifyListeners();
    }
  }

  /// Navigate to previous result
  void previousResult() {
    if (_data.canNavigatePrevious) {
      final newIndex = _data.activeHighlightIndex > 0
          ? _data.activeHighlightIndex - 1
          : _data.highlights.length - 1;
      _data = _data.copyWith(
        activeHighlightIndex: newIndex,
        currentResultIndex: newIndex + 1,
      );
      notifyListeners();
    }
  }

  /// Clear search
  void clear() {
    _data = _data.copyWith(
      query: '',
      highlights: [],
      totalResults: 0,
      currentResultIndex: 0,
      activeHighlightIndex: -1,
      isSearching: false,
    );
    notifyListeners();
  }

  /// Toggle case sensitivity
  void toggleCaseSensitive() {
    _data = _data.copyWith(caseSensitive: !_data.caseSensitive);
    notifyListeners();
  }

  /// Toggle whole words only
  void toggleWholeWordsOnly() {
    _data = _data.copyWith(wholeWordsOnly: !_data.wholeWordsOnly);
    notifyListeners();
  }

  /// Toggle regex mode
  void toggleRegex() {
    _data = _data.copyWith(useRegex: !_data.useRegex);
    notifyListeners();
  }
}

class _AppInPageSearchState extends State<AppInPageSearch>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _skeletonController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _skeletonAnimation;
  late TextEditingController _queryController;
  late AppInPageSearchController _searchController;
  late FocusNode _focusNode;
  Timer? _debounceTimer;

  AppInPageSearchConfig get _effectiveConfig {
    return widget.config ?? AppInPageSearchConfig.medium;
  }

  AppInPageSearchData get _effectiveData {
    return widget.searchController?.data ??
        widget.data ??
        const AppInPageSearchData();
  }

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAnimations();
    _setupKeyboardListeners();
  }

  void _initializeControllers() {
    _queryController = widget.controller ?? TextEditingController();
    _searchController = widget.searchController ?? AppInPageSearchController();
    _focusNode = widget.focusNode ?? FocusNode();

    if (widget.initialQuery != null) {
      _queryController.text = widget.initialQuery!;
    }

    _queryController.addListener(_onQueryChanged);
    _searchController.addListener(_onSearchDataChanged);
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
      begin: const Offset(0.0, -0.1),
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

  void _setupKeyboardListeners() {
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  void _updateState(AppInPageSearchState newState) {
    switch (newState) {
      case AppInPageSearchState.skeleton:
        _skeletonController.repeat();
        break;
      case AppInPageSearchState.loading:
        _animationController.forward();
        break;
      default:
        _skeletonController.stop();
        _animationController.forward();
        break;
    }
  }

  void _onQueryChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_effectiveConfig.debounceDelay, () {
      final query = _queryController.text;
      if (query.isNotEmpty) {
        _performSearch(query);
      } else {
        _searchController.clear();
      }
    });
  }

  void _onSearchDataChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _performSearch(String query) {
    if (!AppInPageSearchUtils.isValidQuery(query,
        useRegex: _effectiveData.useRegex)) {
      return;
    }

    _searchController.search(query);

    // Simulate search if no external highlights provided
    if (widget.highlights.isEmpty) {
      // In a real implementation, this would search through content
      final mockHighlights = <AppSearchHighlight>[
        AppSearchHighlight(
          start: 0,
          end: query.length,
          text: query,
        ),
      ];
      _searchController.updateResults(mockHighlights);
    } else {
      _searchController.updateResults(widget.highlights);
    }

    widget.onFind?.call(query, _searchController.highlights);

    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _onNext() {
    _searchController.nextResult();
    widget.onNext?.call();

    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }
  }

  void _onPrevious() {
    _searchController.previousResult();
    widget.onPrevious?.call();

    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }
  }

  void _onClear() {
    _queryController.clear();
    _searchController.clear();
    widget.onClear?.call();

    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _onClose() {
    _onClear();
    widget.onClose?.call();
  }

  @override
  void didUpdateWidget(AppInPageSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != oldWidget.state) {
      _updateState(widget.state);
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _animationController.dispose();
    _skeletonController.dispose();
    if (widget.controller == null) {
      _queryController.dispose();
    }
    if (widget.searchController == null) {
      _searchController.dispose();
    }
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
              child: _buildSearchWidget(context, theme, colorScheme, isRTL),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchWidget(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, bool isRTL) {
    if (widget.state == AppInPageSearchState.skeleton) {
      return _buildSkeletonWidget(context, theme);
    }

    return Container(
      constraints: _effectiveConfig.constraints,
      width: _effectiveConfig.width,
      height: _effectiveConfig.height,
      margin: _effectiveConfig.margin,
      decoration: BoxDecoration(
        color: _effectiveConfig.backgroundColor ?? colorScheme.surface,
        borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
        border: _effectiveConfig.showBorder
            ? Border.all(
                color: _focusNode.hasFocus
                    ? _effectiveConfig.focusBorderColor ?? colorScheme.primary
                    : _effectiveConfig.borderColor ?? colorScheme.outline,
                width: _effectiveConfig.borderWidth,
              )
            : null,
        boxShadow: _effectiveConfig.showShadow
            ? [
                BoxShadow(
                  color: _effectiveConfig.shadowColor ??
                      colorScheme.shadow.withValues(alpha: 0.1),
                  blurRadius: _effectiveConfig.elevation,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: _effectiveConfig.padding,
        child: Row(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          children: [
            _buildSearchIcon(colorScheme),
            SizedBox(width: _effectiveConfig.iconSpacing),
            Expanded(child: _buildTextField(context, theme, colorScheme)),
            if (_effectiveConfig.showResultCount && _effectiveData.hasResults)
              _buildResultCount(colorScheme),
            if (_effectiveConfig.showNavigationButtons &&
                _effectiveData.hasResults) ...[
              SizedBox(width: _effectiveConfig.buttonSpacing),
              _buildNavigationButtons(colorScheme),
            ],
            if (_effectiveConfig.showClearButton &&
                _queryController.text.isNotEmpty) ...[
              SizedBox(width: _effectiveConfig.buttonSpacing),
              _buildClearButton(colorScheme),
            ],
            if (_effectiveConfig.showCloseButton) ...[
              SizedBox(width: _effectiveConfig.buttonSpacing),
              _buildCloseButton(colorScheme),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSearchIcon(ColorScheme colorScheme) {
    return Icon(
      _effectiveConfig.searchIcon,
      size: _effectiveConfig.iconSize,
      color: _effectiveConfig.iconColor ?? colorScheme.onSurfaceVariant,
    );
  }

  Widget _buildTextField(
      BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return TextField(
      controller: _queryController,
      focusNode: _focusNode,
      style: TextStyle(
        fontSize: _effectiveConfig.fontSize,
        fontWeight: _effectiveConfig.fontWeight,
        color: _effectiveConfig.textColor ?? colorScheme.onSurface,
        height: _effectiveConfig.lineHeight,
        letterSpacing: _effectiveConfig.letterSpacing,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: _effectiveConfig.placeholder ?? 'Search...',
        hintStyle: TextStyle(
          color:
              _effectiveConfig.placeholderColor ?? colorScheme.onSurfaceVariant,
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      enabled: widget.state != AppInPageSearchState.disabled,
      onSubmitted: _performSearch,
    );
  }

  Widget _buildResultCount(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        _effectiveData.resultPositionText,
        style: TextStyle(
          fontSize: 12.0,
          color: colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(_effectiveConfig.previousIcon),
          iconSize: _effectiveConfig.iconSize * 0.8,
          color: _effectiveData.canNavigatePrevious
              ? _effectiveConfig.iconColor ?? colorScheme.onSurfaceVariant
              : colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
          onPressed: _effectiveData.canNavigatePrevious ? _onPrevious : null,
          tooltip: 'Previous result',
        ),
        IconButton(
          icon: Icon(_effectiveConfig.nextIcon),
          iconSize: _effectiveConfig.iconSize * 0.8,
          color: _effectiveData.canNavigateNext
              ? _effectiveConfig.iconColor ?? colorScheme.onSurfaceVariant
              : colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
          onPressed: _effectiveData.canNavigateNext ? _onNext : null,
          tooltip: 'Next result',
        ),
      ],
    );
  }

  Widget _buildClearButton(ColorScheme colorScheme) {
    return IconButton(
      icon: Icon(_effectiveConfig.clearIcon),
      iconSize: _effectiveConfig.iconSize * 0.8,
      color: _effectiveConfig.iconColor ?? colorScheme.onSurfaceVariant,
      onPressed: _onClear,
      tooltip: 'Clear search',
    );
  }

  Widget _buildCloseButton(ColorScheme colorScheme) {
    return IconButton(
      icon: Icon(_effectiveConfig.closeIcon),
      iconSize: _effectiveConfig.iconSize * 0.8,
      color: _effectiveConfig.iconColor ?? colorScheme.onSurfaceVariant,
      onPressed: _onClose,
      tooltip: 'Close search',
    );
  }

  Widget _buildSkeletonWidget(BuildContext context, ThemeData theme) {
    if (widget.skeletonBuilder != null) {
      return widget.skeletonBuilder!(context);
    }

    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Container(
          width: _effectiveConfig.width,
          height: _effectiveConfig.height,
          margin: _effectiveConfig.margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
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
        );
      },
    );
  }
}
