import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'command_palette_config.dart';

/// Callback function type for command palette query changes
typedef OnCommandQuery = void Function(String query);

/// Callback function type for command invocation
typedef OnCommandInvoke = void Function(AppCommandResult result);

/// Callback function type for shortcut activation
typedef OnShortcutActivate = void Function(List<LogicalKeyboardKey> shortcut);

/// A comprehensive command palette widget based on Material Design
///
/// The [AppCommandPalette] provides a powerful command interface with:
/// - Multiple variants: global search, actions
/// - Real-time search with fuzzy matching
/// - Keyboard navigation and shortcuts
/// - Recent commands history
/// - Platform-adaptive behavior
/// - Full accessibility support
/// - RTL text direction support
/// - Material 3 design integration
///
/// Example usage:
/// ```dart
/// AppCommandPalette(
///   variant: AppCommandPaletteVariant.globalSearch,
///   results: [
///     AppCommandResult(id: '1', title: 'Open File'),
///     AppCommandResult(id: '2', title: 'Save As'),
///   ],
///   onQuery: (query) => print('Searching: $query'),
///   onInvoke: (result) => print('Invoked: ${result.title}'),
/// )
/// ```
class AppCommandPalette extends StatefulWidget {
  /// The variant of the command palette
  final AppCommandPaletteVariant variant;

  /// Callback when query changes
  final OnCommandQuery? onQuery;

  /// Available results
  final List<AppCommandResult> results;

  /// Callback when a command is invoked
  final OnCommandInvoke? onInvoke;

  /// Available keyboard shortcuts
  final Map<List<LogicalKeyboardKey>, AppCommandResult>? shortcuts;

  /// Current state of the command palette
  final AppCommandPaletteState state;

  /// Whether the command palette is visible
  final bool isVisible;

  /// Configuration for the command palette
  final AppCommandPaletteConfig? config;

  /// Command palette data model for complex configurations
  final AppCommandPaletteData? data;

  /// Callback when the palette should be closed
  final VoidCallback? onClose;

  /// Custom overlay entry for advanced usage
  final OverlayEntry? overlayEntry;

  /// Initial query text
  final String? initialQuery;

  /// Whether to show recent commands when query is empty
  final bool showRecent;

  /// Recent commands list
  final List<AppCommandResult> recentCommands;

  /// Custom loading builder
  final Widget Function(BuildContext context)? loadingBuilder;

  /// Custom skeleton builder
  final Widget Function(BuildContext context)? skeletonBuilder;

  /// Custom empty state builder
  final Widget Function(BuildContext context, String query)? emptyBuilder;

  /// Custom result builder
  final Widget Function(BuildContext context, AppCommandResult result, bool isSelected)? resultBuilder;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable sound effects
  final bool enableSoundEffects;

  /// Custom text direction
  final TextDirection? textDirection;

  /// Custom focus node
  final FocusNode? focusNode;

  /// Custom scroll controller
  final ScrollController? scrollController;

  const AppCommandPalette({
    super.key,
    this.variant = AppCommandPaletteVariant.globalSearch,
    this.onQuery,
    this.results = const [],
    this.onInvoke,
    this.shortcuts,
    this.state = AppCommandPaletteState.defaultState,
    this.isVisible = true,
    this.config,
    this.data,
    this.onClose,
    this.overlayEntry,
    this.initialQuery,
    this.showRecent = true,
    this.recentCommands = const [],
    this.loadingBuilder,
    this.skeletonBuilder,
    this.emptyBuilder,
    this.resultBuilder,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.textDirection,
    this.focusNode,
    this.scrollController,
  });

  /// Create a global search command palette
  const AppCommandPalette.globalSearch({
    super.key,
    this.onQuery,
    this.results = const [],
    this.onInvoke,
    this.shortcuts,
    this.state = AppCommandPaletteState.defaultState,
    this.isVisible = true,
    this.config,
    this.data,
    this.onClose,
    this.overlayEntry,
    this.initialQuery,
    this.showRecent = true,
    this.recentCommands = const [],
    this.loadingBuilder,
    this.skeletonBuilder,
    this.emptyBuilder,
    this.resultBuilder,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.textDirection,
    this.focusNode,
    this.scrollController,
  }) : variant = AppCommandPaletteVariant.globalSearch;

  /// Create an actions command palette
  const AppCommandPalette.actions({
    super.key,
    this.onQuery,
    this.results = const [],
    this.onInvoke,
    this.shortcuts,
    this.state = AppCommandPaletteState.defaultState,
    this.isVisible = true,
    this.config,
    this.data,
    this.onClose,
    this.overlayEntry,
    this.initialQuery,
    this.showRecent = true,
    this.recentCommands = const [],
    this.loadingBuilder,
    this.skeletonBuilder,
    this.emptyBuilder,
    this.resultBuilder,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.textDirection,
    this.focusNode,
    this.scrollController,
  }) : variant = AppCommandPaletteVariant.actions;

  @override
  State<AppCommandPalette> createState() => _AppCommandPaletteState();

  /// Show command palette as overlay
  static OverlayEntry showOverlay({
    required BuildContext context,
    required AppCommandPalette palette,
    VoidCallback? onClose,
  }) {
    final overlay = OverlayEntry(
      builder: (context) => _OverlayWrapper(
        palette: palette,
        onClose: onClose,
      ),
    );

    Overlay.of(context).insert(overlay);
    return overlay;
  }
}

class _AppCommandPaletteState extends State<AppCommandPalette>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _skeletonController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _skeletonAnimation;

  late TextEditingController _queryController;
  late FocusNode _focusNode;
  late ScrollController _scrollController;

  Timer? _debounceTimer;
  List<AppCommandResult> _filteredResults = [];
  int _selectedIndex = -1;
  AppCommandPaletteConfig _effectiveConfig = const AppCommandPaletteConfig();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAnimations();
    _updateConfiguration();
    _initializeQuery();
    _filterResults();
  }

  void _initializeControllers() {
    _queryController = TextEditingController(text: widget.initialQuery);
    _focusNode = widget.focusNode ?? FocusNode();
    _scrollController = widget.scrollController ?? ScrollController();

    _animationController = AnimationController(
      duration: _effectiveConfig.animationDuration,
      vsync: this,
    );

    _skeletonController = AnimationController(
      duration: _effectiveConfig.skeletonAnimationDuration,
      vsync: this,
    );

    if (widget.state == AppCommandPaletteState.skeleton) {
      _skeletonController.repeat();
    }

    _queryController.addListener(_onQueryChanged);
  }

  void _initializeAnimations() {
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
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

    if (widget.isVisible) {
      _animationController.forward();
    }
  }

  void _updateConfiguration() {
    _effectiveConfig = widget.config ?? _getDefaultConfig();
  }

  AppCommandPaletteConfig _getDefaultConfig() {
    switch (_effectiveConfig.size) {
      case AppCommandPaletteSize.small:
        return AppCommandPaletteConfig.small;
      case AppCommandPaletteSize.medium:
        return AppCommandPaletteConfig.medium;
      case AppCommandPaletteSize.large:
        return AppCommandPaletteConfig.large;
    }
  }

  void _initializeQuery() {
    if (widget.initialQuery?.isNotEmpty == true) {
      _queryController.text = widget.initialQuery!;
    }
  }

  @override
  void didUpdateWidget(AppCommandPalette oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isVisible != widget.isVisible) {
      if (widget.isVisible) {
        _animationController.forward();
        _focusSearchInput();
      } else {
        _animationController.reverse();
      }
    }

    if (oldWidget.results != widget.results) {
      _filterResults();
    }

    if (oldWidget.state != widget.state) {
      _updateState(widget.state);
    }
  }

  void _updateState(AppCommandPaletteState newState) {
    switch (newState) {
      case AppCommandPaletteState.skeleton:
        _skeletonController.repeat();
        break;
      case AppCommandPaletteState.loading:
        _animationController.forward();
        break;
      default:
        _skeletonController.stop();
        _animationController.forward();
        break;
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _animationController.dispose();
    _skeletonController.dispose();
    _queryController.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) {
      return const SizedBox.shrink();
    }

    return _buildCommandPalette(context);
  }

  Widget _buildCommandPalette(BuildContext context) {
    final theme = Theme.of(context);
    final textDirection = widget.textDirection ??
        Directionality.maybeOf(context) ??
        TextDirection.ltr;

    return Directionality(
      textDirection: textDirection,
      child: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: _buildPaletteContent(context, theme),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaletteContent(BuildContext context, ThemeData theme) {
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: _effectiveConfig.maxWidth,
          maxHeight: _effectiveConfig.maxHeight,
          minWidth: _effectiveConfig.minWidth ?? 0,
          minHeight: _effectiveConfig.minHeight ?? 0,
        ),
        margin: _effectiveConfig.margin,
        decoration: BoxDecoration(
          color: _getBackgroundColor(theme),
          borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
          boxShadow: _effectiveConfig.showShadow
              ? [
                  BoxShadow(
                    color: _getShadowColor(theme),
                    blurRadius: _effectiveConfig.elevation,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchInput(context, theme),
            _buildResultsList(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchInput(BuildContext context, ThemeData theme) {
    return Container(
      padding: _effectiveConfig.inputPadding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _getInputBorderColor(theme),
            width: _effectiveConfig.inputBorderWidth,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _effectiveConfig.searchIcon,
            size: _effectiveConfig.iconSize,
            color: _getIconColor(theme),
          ),
          SizedBox(width: _effectiveConfig.iconSpacing),
          Expanded(
            child: TextField(
              controller: _queryController,
              focusNode: _focusNode,
              style: _getInputTextStyle(theme),
              keyboardType: _effectiveConfig.keyboardType,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: _getPlaceholder(),
                hintStyle: _getPlaceholderStyle(theme),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: _onSubmitted,
            ),
          ),
          if (_queryController.text.isNotEmpty)
            IconButton(
              onPressed: _clearQuery,
              icon: const Icon(Icons.clear),
              iconSize: _effectiveConfig.iconSize,
              color: _getIconColor(theme),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsList(BuildContext context, ThemeData theme) {
    if (widget.state == AppCommandPaletteState.skeleton) {
      return _buildSkeletonResults(context, theme);
    }

    if (widget.state == AppCommandPaletteState.loading) {
      return _buildLoadingResults(context, theme);
    }

    final displayResults = _getDisplayResults();

    if (displayResults.isEmpty) {
      return _buildEmptyState(context, theme);
    }

    return Flexible(
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: displayResults.length,
        itemBuilder: (context, index) {
          final result = displayResults[index];
          final isSelected = index == _selectedIndex;
          return _buildResultItem(context, theme, result, index, isSelected);
        },
      ),
    );
  }

  Widget _buildResultItem(
    BuildContext context,
    ThemeData theme,
    AppCommandResult result,
    int index,
    bool isSelected,
  ) {
    if (widget.resultBuilder != null) {
      return widget.resultBuilder!(context, result, isSelected);
    }

    return _ResultItemWidget(
      result: result,
      isSelected: isSelected,
      config: _effectiveConfig,
      theme: theme,
      query: _queryController.text,
      onTap: () => _invokeResult(result),
      onHover: (hovering) => _handleResultHover(index, hovering),
    );
  }

  Widget _buildLoadingResults(BuildContext context, ThemeData theme) {
    if (widget.loadingBuilder != null) {
      return widget.loadingBuilder!(context);
    }

    return Container(
      height: _effectiveConfig.resultHeight * 3,
      padding: _effectiveConfig.resultPadding,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildSkeletonResults(BuildContext context, ThemeData theme) {
    if (widget.skeletonBuilder != null) {
      return widget.skeletonBuilder!(context);
    }

    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Column(
          children: List.generate(
            _effectiveConfig.skeletonItemCount,
            (index) => _buildSkeletonItem(theme),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonItem(ThemeData theme) {
    return Container(
      height: _effectiveConfig.resultHeight,
      margin: EdgeInsets.symmetric(
        horizontal: _effectiveConfig.resultPadding.horizontal / 2,
        vertical: _effectiveConfig.resultSpacing / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_effectiveConfig.resultBorderRadius),
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
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    if (widget.emptyBuilder != null) {
      return widget.emptyBuilder!(context, _queryController.text);
    }

    return Container(
      height: _effectiveConfig.resultHeight * 2,
      padding: _effectiveConfig.resultPadding,
      child: Center(
        child: Text(
          _queryController.text.isEmpty
              ? 'Start typing to search...'
              : 'No results found',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  List<AppCommandResult> _getDisplayResults() {
    if (_queryController.text.isEmpty && widget.showRecent) {
      return widget.recentCommands;
    }
    return _filteredResults;
  }

  void _onQueryChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_effectiveConfig.debounceDelay, () {
      _filterResults();
      widget.onQuery?.call(_queryController.text);
    });
  }

  void _filterResults() {
    setState(() {
      _filteredResults = AppCommandPaletteUtils.filterResults(
        widget.results,
        _queryController.text,
        fuzzySearch: _effectiveConfig.fuzzySearch,
        maxResults: _effectiveConfig.maxResults,
      );
      _selectedIndex = _filteredResults.isNotEmpty ? 0 : -1;
    });
  }

  void _onSubmitted(String query) {
    if (_selectedIndex >= 0) {
      final displayResults = _getDisplayResults();
      if (_selectedIndex < displayResults.length) {
        _invokeResult(displayResults[_selectedIndex]);
      }
    }
  }

  void _invokeResult(AppCommandResult result) {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    if (widget.enableSoundEffects) {
      SystemSound.play(SystemSoundType.click);
    }

    widget.onInvoke?.call(result);

    if (_effectiveConfig.closeOnSelect) {
      widget.onClose?.call();
    }
  }

  void _clearQuery() {
    _queryController.clear();
    _focusSearchInput();
  }

  void _focusSearchInput() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  void _handleResultHover(int index, bool hovering) {
    if (hovering) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      // Handle shortcuts first
      if (widget.shortcuts != null) {
        for (final entry in widget.shortcuts!.entries) {
          if (AppCommandPaletteUtils.matchesShortcut(entry.key, event)) {
            _invokeResult(entry.value);
            return KeyEventResult.handled;
          }
        }
      }

      switch (event.logicalKey) {
        case LogicalKeyboardKey.escape:
          if (_effectiveConfig.closeOnEscape) {
            widget.onClose?.call();
          }
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowUp:
          _moveFocus(-1);
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowDown:
          _moveFocus(1);
          return KeyEventResult.handled;

        case LogicalKeyboardKey.enter:
          if (_selectedIndex >= 0) {
            final displayResults = _getDisplayResults();
            if (_selectedIndex < displayResults.length) {
              _invokeResult(displayResults[_selectedIndex]);
            }
          }
          return KeyEventResult.handled;

        case LogicalKeyboardKey.tab:
          if (_effectiveConfig.enableTabNavigation) {
            _moveFocus(1);
            return KeyEventResult.handled;
          }
          break;
      }
    }

    return KeyEventResult.ignored;
  }

  void _moveFocus(int direction) {
    final displayResults = _getDisplayResults();
    if (displayResults.isEmpty) return;

    setState(() {
      if (_selectedIndex == -1) {
        _selectedIndex = direction > 0 ? 0 : displayResults.length - 1;
      } else {
        _selectedIndex = (_selectedIndex + direction) % displayResults.length;
        if (_selectedIndex < 0) {
          _selectedIndex = displayResults.length - 1;
        }
      }
    });

    _scrollToSelected();
  }

  void _scrollToSelected() {
    if (_selectedIndex < 0) return;

    final itemHeight = _effectiveConfig.resultHeight + _effectiveConfig.resultSpacing;
    final targetOffset = _selectedIndex * itemHeight;

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  // Theme helper methods
  Color _getBackgroundColor(ThemeData theme) {
    return _effectiveConfig.backgroundColor ?? theme.colorScheme.surface;
  }

  Color _getShadowColor(ThemeData theme) {
    return _effectiveConfig.shadowColor ?? theme.colorScheme.shadow.withValues(alpha: 0.2);
  }

  Color _getInputBorderColor(ThemeData theme) {
    return _focusNode.hasFocus
        ? (_effectiveConfig.inputFocusBorderColor ?? theme.colorScheme.primary)
        : (_effectiveConfig.inputBorderColor ?? theme.colorScheme.outline);
  }

  Color _getIconColor(ThemeData theme) {
    return _effectiveConfig.resultIconColor ?? theme.colorScheme.onSurfaceVariant;
  }

  TextStyle _getInputTextStyle(ThemeData theme) {
    return _effectiveConfig.inputTextStyle ??
        theme.textTheme.bodyLarge!.copyWith(
          fontSize: _effectiveConfig.inputFontSize,
          color: _effectiveConfig.inputTextColor ?? theme.colorScheme.onSurface,
        );
  }

  TextStyle _getPlaceholderStyle(ThemeData theme) {
    return _getInputTextStyle(theme).copyWith(
      color: _effectiveConfig.placeholderColor ?? theme.colorScheme.onSurfaceVariant,
    );
  }

  String _getPlaceholder() {
    return _effectiveConfig.placeholder ??
        (widget.variant == AppCommandPaletteVariant.globalSearch
            ? 'Search anything...'
            : 'Type a command...');
  }
}

/// Internal widget for rendering individual result items
class _ResultItemWidget extends StatefulWidget {
  final AppCommandResult result;
  final bool isSelected;
  final AppCommandPaletteConfig config;
  final ThemeData theme;
  final String query;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;

  const _ResultItemWidget({
    required this.result,
    required this.isSelected,
    required this.config,
    required this.theme,
    required this.query,
    required this.onTap,
    required this.onHover,
  });

  @override
  State<_ResultItemWidget> createState() => _ResultItemWidgetState();
}

class _ResultItemWidgetState extends State<_ResultItemWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHovering(true),
      onExit: (_) => _setHovering(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.config.resultHeight,
          padding: widget.config.resultPadding,
          margin: EdgeInsets.symmetric(vertical: widget.config.resultSpacing / 2),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(widget.config.resultBorderRadius),
          ),
          child: Row(
            children: [
              if (widget.config.showResultIcons && widget.result.icon != null) ...[
                Icon(
                  widget.result.icon,
                  size: widget.config.iconSize,
                  color: _getIconColor(),
                ),
                SizedBox(width: widget.config.iconSpacing),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTitle(),
                    if (widget.config.showResultDescriptions && widget.result.description != null)
                      _buildDescription(),
                  ],
                ),
              ),
              if (widget.config.showResultShortcuts && _hasShortcut()) ...[
                SizedBox(width: widget.config.iconSpacing),
                _buildShortcut(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    if (widget.config.highlightMatches && widget.query.isNotEmpty) {
      final spans = AppCommandPaletteUtils.highlightMatches(
        widget.result.title,
        widget.query,
        _getTitleStyle(),
        widget.config.highlightColor ?? Colors.yellow.withValues(alpha: 0.3),
      );
      return RichText(
        text: TextSpan(children: spans),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return Text(
      widget.result.title,
      style: _getTitleStyle(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.result.description!,
      style: _getDescriptionStyle(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildShortcut() {
    final shortcutText = widget.result.shortcutText ??
        (widget.result.shortcut != null
            ? AppCommandPaletteUtils.formatShortcut(widget.result.shortcut!)
            : '');

    if (shortcutText.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: _getShortcutBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: widget.theme.colorScheme.outline.withValues(alpha: 0.3),
          width: 0.5,
        ),
      ),
      child: Text(
        shortcutText,
        style: _getShortcutStyle(),
      ),
    );
  }

  bool _hasShortcut() {
    return widget.result.shortcut != null || widget.result.shortcutText != null;
  }

  Color _getBackgroundColor() {
    if (widget.isSelected) {
      return widget.config.resultSelectedBackgroundColor ??
          widget.theme.colorScheme.primary.withValues(alpha: 0.12);
    } else if (_isHovering) {
      return widget.config.resultHoverBackgroundColor ??
          widget.theme.colorScheme.onSurface.withValues(alpha: 0.04);
    }
    return widget.config.resultBackgroundColor ?? Colors.transparent;
  }

  Color _getIconColor() {
    return widget.config.resultIconColor ?? widget.theme.colorScheme.onSurfaceVariant;
  }

  TextStyle _getTitleStyle() {
    return widget.config.resultTitleStyle ??
        widget.theme.textTheme.bodyMedium!.copyWith(
          fontSize: widget.config.resultTitleFontSize,
          color: widget.config.resultTextColor ?? widget.theme.colorScheme.onSurface,
          fontWeight: widget.isSelected ? FontWeight.w500 : FontWeight.normal,
        );
  }

  TextStyle _getDescriptionStyle() {
    return widget.config.resultDescriptionStyle ??
        widget.theme.textTheme.bodySmall!.copyWith(
          fontSize: widget.config.resultDescriptionFontSize,
          color: widget.config.resultDescriptionColor ??
              widget.theme.colorScheme.onSurfaceVariant,
        );
  }

  TextStyle _getShortcutStyle() {
    return widget.config.shortcutTextStyle ??
        widget.theme.textTheme.labelSmall!.copyWith(
          fontSize: widget.config.shortcutFontSize,
          color: widget.config.shortcutTextColor ??
              widget.theme.colorScheme.onSurfaceVariant,
        );
  }

  Color _getShortcutBackgroundColor() {
    return widget.config.shortcutBackgroundColor ??
        widget.theme.colorScheme.surface;
  }

  void _setHovering(bool hovering) {
    if (_isHovering != hovering) {
      setState(() {
        _isHovering = hovering;
      });
      widget.onHover(hovering);
    }
  }
}

/// Overlay wrapper for command palette
class _OverlayWrapper extends StatelessWidget {
  final AppCommandPalette palette;
  final VoidCallback? onClose;

  const _OverlayWrapper({
    required this.palette,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final config = palette.config ?? const AppCommandPaletteConfig();

    return Material(
      color: config.overlayColor ?? Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: config.closeOnOutsideTap ? onClose : null,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: _getAlignment(config.position),
          child: GestureDetector(
            onTap: () {}, // Prevent tap propagation
            child: palette,
          ),
        ),
      ),
    );
  }

  Alignment _getAlignment(AppCommandPalettePosition position) {
    switch (position) {
      case AppCommandPalettePosition.top:
        return Alignment.topCenter;
      case AppCommandPalettePosition.center:
        return Alignment.center;
      case AppCommandPalettePosition.bottom:
        return Alignment.bottomCenter;
    }
  }
}