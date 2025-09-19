import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_palette_config.freezed.dart';

/// Command palette variant types
enum DSCommandPaletteVariant {
  /// Global search functionality
  globalSearch,

  /// Actions command palette
  actions,
}

/// Command palette state types
enum DSCommandPaletteState {
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

/// Command palette size variants
enum DSCommandPaletteSize {
  /// Small command palette
  small,

  /// Medium command palette (default)
  medium,

  /// Large command palette
  large,
}

/// Command palette position
enum DSCommandPalettePosition {
  /// Center of the screen
  center,

  /// Top of the screen
  top,

  /// Bottom of the screen
  bottom,
}

/// Command palette result type
enum DSCommandResultType {
  /// Command action
  command,

  /// Navigation item
  navigation,

  /// File or document
  file,

  /// Person or contact
  person,

  /// Setting or preference
  setting,

  /// Search result
  search,

  /// Custom type
  custom,
}

/// Configuration model for DSCommandPalette
@freezed
class DSCommandPaletteConfig with _$DSCommandPaletteConfig {
  const factory DSCommandPaletteConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 300)) Duration animationDuration,
    @Default(Curves.easeInOutCubic) Curve animationCurve,
    @Default(Duration(milliseconds: 200)) Duration debounceDelay,

    // Size and positioning
    @Default(DSCommandPaletteSize.medium) DSCommandPaletteSize size,
    @Default(DSCommandPalettePosition.center)
    DSCommandPalettePosition position,
    @Default(600.0) double maxWidth,
    @Default(400.0) double maxHeight,
    @Default(EdgeInsets.all(16.0)) EdgeInsets margin,

    // Search configuration
    @Default(20) int maxResults,
    @Default(true) bool showRecentCommands,
    @Default(5) int maxRecentCommands,
    @Default(true) bool fuzzySearch,
    @Default(true) bool highlightMatches,

    // Input configuration
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0))
    EdgeInsets inputPadding,
    @Default(8.0) double inputBorderRadius,
    @Default(1.0) double inputBorderWidth,
    String? placeholder,
    @Default(TextInputType.text) TextInputType keyboardType,

    // Results configuration
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0))
    EdgeInsets resultPadding,
    @Default(48.0) double resultHeight,
    @Default(8.0) double resultSpacing,
    @Default(4.0) double resultBorderRadius,
    @Default(true) bool showResultIcons,
    @Default(true) bool showResultShortcuts,
    @Default(true) bool showResultDescriptions,

    // Icon configuration
    @Default(20.0) double iconSize,
    @Default(8.0) double iconSpacing,
    @Default(Icons.search) IconData searchIcon,
    @Default(Icons.keyboard_arrow_right) IconData actionIcon,

    // Typography configuration
    TextStyle? inputTextStyle,
    TextStyle? resultTitleStyle,
    TextStyle? resultDescriptionStyle,
    TextStyle? shortcutTextStyle,
    @Default(16.0) double inputFontSize,
    @Default(14.0) double resultTitleFontSize,
    @Default(12.0) double resultDescriptionFontSize,
    @Default(11.0) double shortcutFontSize,

    // Color configuration
    Color? backgroundColor,
    Color? overlayColor,
    Color? inputBackgroundColor,
    Color? inputBorderColor,
    Color? inputFocusBorderColor,
    Color? inputTextColor,
    Color? placeholderColor,
    Color? resultBackgroundColor,
    Color? resultHoverBackgroundColor,
    Color? resultSelectedBackgroundColor,
    Color? resultTextColor,
    Color? resultDescriptionColor,
    Color? resultIconColor,
    Color? shortcutBackgroundColor,
    Color? shortcutTextColor,
    Color? highlightColor,
    Color? shadowColor,

    // Elevation and shadow
    @Default(8.0) double elevation,
    @Default(16.0) double borderRadius,
    @Default(true) bool showShadow,

    // Interaction configuration
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,
    @Default(true) bool closeOnSelect,
    @Default(true) bool closeOnEscape,
    @Default(true) bool closeOnOutsideTap,

    // Keyboard navigation
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool showKeyboardShortcuts,
    @Default(true) bool enableTabNavigation,

    // Accessibility configuration
    @Default(true) bool enableAccessibility,
    @Default(true) bool enableSemantics,
    String? semanticLabel,
    String? semanticHint,

    // Platform specific configuration
    @Default(true) bool adaptToTheme,
    @Default(true) bool adaptToPlatform,
    @Default(true) bool useSystemShortcuts,

    // Loading and skeleton configuration
    @Default(Color(0xFFE0E0E0)) Color skeletonBaseColor,
    @Default(Color(0xFFF5F5F5)) Color skeletonHighlightColor,
    @Default(Duration(milliseconds: 1500)) Duration skeletonAnimationDuration,
    @Default(3) int skeletonItemCount,

    // RTL support
    @Default(true) bool enableRTL,
    @Default(TextDirection.ltr) TextDirection textDirection,

    // Custom constraints
    BoxConstraints? constraints,
    double? minWidth,
    double? minHeight,
  }) = _DSCommandPaletteConfig;

  /// Default configuration for small size
  static const DSCommandPaletteConfig small = DSCommandPaletteConfig(
    size: DSCommandPaletteSize.small,
    maxWidth: 480.0,
    maxHeight: 320.0,
    resultHeight: 40.0,
    inputFontSize: 14.0,
    resultTitleFontSize: 13.0,
    resultDescriptionFontSize: 11.0,
    iconSize: 18.0,
  );

  /// Default configuration for medium size
  static const DSCommandPaletteConfig medium = DSCommandPaletteConfig(
    size: DSCommandPaletteSize.medium,
    maxWidth: 600.0,
    maxHeight: 400.0,
    resultHeight: 48.0,
    inputFontSize: 16.0,
    resultTitleFontSize: 14.0,
    resultDescriptionFontSize: 12.0,
    iconSize: 20.0,
  );

  /// Default configuration for large size
  static const DSCommandPaletteConfig large = DSCommandPaletteConfig(
    size: DSCommandPaletteSize.large,
    maxWidth: 720.0,
    maxHeight: 480.0,
    resultHeight: 56.0,
    inputFontSize: 18.0,
    resultTitleFontSize: 16.0,
    resultDescriptionFontSize: 14.0,
    iconSize: 24.0,
  );
}

/// Data model for command palette results
@freezed
class DSCommandResult with _$DSCommandResult {
  const DSCommandResult._();

  const factory DSCommandResult({
    /// Unique identifier for the result
    required String id,

    /// Title of the result
    required String title,

    /// Optional description
    String? description,

    /// Optional icon
    IconData? icon,

    /// Result type
    @Default(DSCommandResultType.command) DSCommandResultType type,

    /// Optional keyboard shortcut
    List<LogicalKeyboardKey>? shortcut,

    /// Shortcut display text
    String? shortcutText,

    /// Additional metadata
    Map<String, dynamic>? metadata,

    /// Whether the result is enabled
    @Default(true) bool enabled,

    /// Custom score for sorting
    @Default(1.0) double score,

    /// Tags for filtering
    @Default([]) List<String> tags,

    /// Category for grouping
    String? category,
  }) = _DSCommandResult;

  /// Create a navigation result
  factory DSCommandResult.navigation({
    required String id,
    required String title,
    String? description,
    IconData? icon,
    List<LogicalKeyboardKey>? shortcut,
    String? shortcutText,
  }) {
    return DSCommandResult(
      id: id,
      title: title,
      description: description,
      icon: icon ?? Icons.navigation,
      type: DSCommandResultType.navigation,
      shortcut: shortcut,
      shortcutText: shortcutText,
    );
  }

  /// Create a command action result
  factory DSCommandResult.action({
    required String id,
    required String title,
    String? description,
    IconData? icon,
    List<LogicalKeyboardKey>? shortcut,
    String? shortcutText,
  }) {
    return DSCommandResult(
      id: id,
      title: title,
      description: description,
      icon: icon ?? Icons.flash_on,
      type: DSCommandResultType.command,
      shortcut: shortcut,
      shortcutText: shortcutText,
    );
  }

  /// Create a search result
  factory DSCommandResult.search({
    required String id,
    required String title,
    String? description,
    IconData? icon,
    double? score,
  }) {
    return DSCommandResult(
      id: id,
      title: title,
      description: description,
      icon: icon ?? Icons.search,
      type: DSCommandResultType.search,
      score: score ?? 1.0,
    );
  }

  /// Get icon for result type
  IconData get defaultIcon {
    switch (type) {
      case DSCommandResultType.command:
        return Icons.flash_on;
      case DSCommandResultType.navigation:
        return Icons.navigation;
      case DSCommandResultType.file:
        return Icons.description;
      case DSCommandResultType.person:
        return Icons.person;
      case DSCommandResultType.setting:
        return Icons.settings;
      case DSCommandResultType.search:
        return Icons.search;
      case DSCommandResultType.custom:
        return Icons.extension;
    }
  }

  /// Check if result matches query
  bool matches(String query) {
    if (query.isEmpty) return true;

    final lowerQuery = query.toLowerCase();
    final lowerTitle = title.toLowerCase();
    final lowerDescription = description?.toLowerCase() ?? '';

    return lowerTitle.contains(lowerQuery) ||
        lowerDescription.contains(lowerQuery) ||
        tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
  }

  /// Calculate fuzzy match score
  double fuzzyScore(String query) {
    if (query.isEmpty) return score;

    final lowerQuery = query.toLowerCase();
    final lowerTitle = title.toLowerCase();

    // Exact match gets highest score
    if (lowerTitle == lowerQuery) return 100.0;

    // Title starts with query
    if (lowerTitle.startsWith(lowerQuery)) return 80.0;

    // Title contains query
    if (lowerTitle.contains(lowerQuery)) return 60.0;

    // Description contains query
    if (description?.toLowerCase().contains(lowerQuery) == true) return 40.0;

    // Tag matches
    if (tags.any((tag) => tag.toLowerCase().contains(lowerQuery))) return 30.0;

    return 0.0;
  }
}

/// Data model for command palette state management
@freezed
class DSCommandPaletteData with _$DSCommandPaletteData {
  const DSCommandPaletteData._();

  const factory DSCommandPaletteData({
    /// Current variant
    @Default(DSCommandPaletteVariant.globalSearch)
    DSCommandPaletteVariant variant,

    /// Current query
    @Default('') String query,

    /// Available results
    @Default([]) List<DSCommandResult> results,

    /// Filtered results
    @Default([]) List<DSCommandResult> filteredResults,

    /// Currently selected index
    @Default(-1) int selectedIndex,

    /// Recent commands
    @Default([]) List<DSCommandResult> recentCommands,

    /// Current state
    @Default(DSCommandPaletteState.defaultState) DSCommandPaletteState state,

    /// Whether the palette is visible
    @Default(false) bool isVisible,

    /// Whether the palette is loading
    @Default(false) bool isLoading,

    /// Error message if any
    String? errorMessage,

    /// Additional metadata
    Map<String, dynamic>? metadata,
  }) = _DSCommandPaletteData;

  /// Get currently selected result
  DSCommandResult? get selectedResult {
    if (selectedIndex >= 0 && selectedIndex < filteredResults.length) {
      return filteredResults[selectedIndex];
    }
    return null;
  }

  /// Check if there are any results
  bool get hasResults => filteredResults.isNotEmpty;

  /// Check if query is empty
  bool get hasQuery => query.isNotEmpty;

  /// Get display results (filtered or recent)
  List<DSCommandResult> get displayResults {
    if (hasQuery) {
      return filteredResults;
    } else {
      return recentCommands;
    }
  }
}

/// Utility functions for DSCommandPalette
class DSCommandPaletteUtils {
  DSCommandPaletteUtils._();

  /// Filter results based on query
  static List<DSCommandResult> filterResults(
    List<DSCommandResult> results,
    String query, {
    bool fuzzySearch = true,
    int maxResults = 20,
  }) {
    if (query.isEmpty) return results.take(maxResults).toList();

    List<DSCommandResult> filtered;

    if (fuzzySearch) {
      // Calculate scores and sort by relevance
      final scored = results
          .map((result) => MapEntry(result, result.fuzzyScore(query)))
          .where((entry) => entry.value > 0)
          .toList();

      scored.sort((a, b) => b.value.compareTo(a.value));
      filtered = scored.map((entry) => entry.key).toList();
    } else {
      // Simple contains filter
      filtered = results.where((result) => result.matches(query)).toList();
    }

    return filtered.take(maxResults).toList();
  }

  /// Create command palette data from simple list
  static DSCommandPaletteData fromCommandList(
    List<String> commands, {
    DSCommandPaletteVariant variant = DSCommandPaletteVariant.actions,
  }) {
    final results = commands
        .asMap()
        .entries
        .map((entry) => DSCommandResult(
              id: 'cmd_${entry.key}',
              title: entry.value,
              type: variant == DSCommandPaletteVariant.globalSearch
                  ? DSCommandResultType.search
                  : DSCommandResultType.command,
            ))
        .toList();

    return DSCommandPaletteData(
      variant: variant,
      results: results,
      filteredResults: results,
    );
  }

  /// Add command to recent history
  static List<DSCommandResult> addToRecent(
    List<DSCommandResult> recentCommands,
    DSCommandResult command,
    int maxRecent,
  ) {
    final updated = List<DSCommandResult>.from(recentCommands);

    // Remove if already exists
    updated.removeWhere((item) => item.id == command.id);

    // Add to beginning
    updated.insert(0, command);

    // Limit size
    if (updated.length > maxRecent) {
      updated.removeRange(maxRecent, updated.length);
    }

    return updated;
  }

  /// Format keyboard shortcut for display
  static String formatShortcut(List<LogicalKeyboardKey> keys) {
    if (keys.isEmpty) return '';

    final keyNames = keys.map((key) {
      // Handle special keys
      if (key == LogicalKeyboardKey.meta ||
          key == LogicalKeyboardKey.metaLeft ||
          key == LogicalKeyboardKey.metaRight) {
        return '⌘';
      } else if (key == LogicalKeyboardKey.control ||
          key == LogicalKeyboardKey.controlLeft ||
          key == LogicalKeyboardKey.controlRight) {
        return 'Ctrl';
      } else if (key == LogicalKeyboardKey.alt ||
          key == LogicalKeyboardKey.altLeft ||
          key == LogicalKeyboardKey.altRight) {
        return 'Alt';
      } else if (key == LogicalKeyboardKey.shift ||
          key == LogicalKeyboardKey.shiftLeft ||
          key == LogicalKeyboardKey.shiftRight) {
        return 'Shift';
      } else if (key == LogicalKeyboardKey.escape) {
        return 'Esc';
      } else if (key == LogicalKeyboardKey.enter) {
        return 'Enter';
      } else if (key == LogicalKeyboardKey.space) {
        return 'Space';
      } else if (key == LogicalKeyboardKey.backspace) {
        return 'Backspace';
      } else if (key == LogicalKeyboardKey.delete) {
        return 'Del';
      } else if (key == LogicalKeyboardKey.tab) {
        return 'Tab';
      } else if (key == LogicalKeyboardKey.arrowUp) {
        return '↑';
      } else if (key == LogicalKeyboardKey.arrowDown) {
        return '↓';
      } else if (key == LogicalKeyboardKey.arrowLeft) {
        return '←';
      } else if (key == LogicalKeyboardKey.arrowRight) {
        return '→';
      } else {
        // Regular keys
        return key.keyLabel.toUpperCase();
      }
    }).toList();

    return keyNames.join(' + ');
  }

  /// Check if shortcut matches key event
  static bool matchesShortcut(
      List<LogicalKeyboardKey> shortcut, KeyEvent event) {
    if (shortcut.isEmpty) return false;

    final pressedKeys = <LogicalKeyboardKey>{};

    // Add modifier keys
    if (event.logicalKey == LogicalKeyboardKey.meta ||
        HardwareKeyboard.instance.isMetaPressed) {
      pressedKeys.add(LogicalKeyboardKey.meta);
    }
    if (event.logicalKey == LogicalKeyboardKey.control ||
        HardwareKeyboard.instance.isControlPressed) {
      pressedKeys.add(LogicalKeyboardKey.control);
    }
    if (event.logicalKey == LogicalKeyboardKey.alt ||
        HardwareKeyboard.instance.isAltPressed) {
      pressedKeys.add(LogicalKeyboardKey.alt);
    }
    if (event.logicalKey == LogicalKeyboardKey.shift ||
        HardwareKeyboard.instance.isShiftPressed) {
      pressedKeys.add(LogicalKeyboardKey.shift);
    }

    // Add the main key
    pressedKeys.add(event.logicalKey);

    // Check if all shortcut keys are pressed
    return shortcut.every((key) => pressedKeys.contains(key)) &&
        pressedKeys.length == shortcut.length;
  }

  /// Get appropriate position based on screen size
  static DSCommandPalettePosition getOptimalPosition(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

    // On smaller screens, prefer top position
    if (screenHeight < 600) {
      return DSCommandPalettePosition.top;
    }

    return DSCommandPalettePosition.center;
  }

  /// Validate command palette data
  static bool validateData(DSCommandPaletteData data) {
    // Check for duplicate IDs
    final ids = data.results.map((result) => result.id).toSet();
    if (ids.length != data.results.length) return false;

    // Check selected index bounds
    if (data.selectedIndex >= data.filteredResults.length) return false;

    return true;
  }

  /// Highlight matching text in result title
  static List<TextSpan> highlightMatches(
    String text,
    String query,
    TextStyle baseStyle,
    Color highlightColor,
  ) {
    if (query.isEmpty) {
      return [TextSpan(text: text, style: baseStyle)];
    }

    final spans = <TextSpan>[];
    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();

    int start = 0;
    int index = lowerText.indexOf(lowerQuery);

    while (index != -1) {
      // Add text before match
      if (index > start) {
        spans.add(TextSpan(
          text: text.substring(start, index),
          style: baseStyle,
        ));
      }

      // Add highlighted match
      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: baseStyle.copyWith(
          backgroundColor: highlightColor,
          fontWeight: FontWeight.bold,
        ),
      ));

      start = index + query.length;
      index = lowerText.indexOf(lowerQuery, start);
    }

    // Add remaining text
    if (start < text.length) {
      spans.add(TextSpan(
        text: text.substring(start),
        style: baseStyle,
      ));
    }

    return spans;
  }
}
