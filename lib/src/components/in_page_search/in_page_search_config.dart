import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_page_search_config.freezed.dart';

/// In-page search variant types
enum DSInPageSearchVariant {
  /// Inline search within content
  inline,
}

/// In-page search state types
enum DSInPageSearchState {
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

/// In-page search size variants
enum DSInPageSearchSize {
  /// Small search bar
  small,

  /// Medium search bar (default)
  medium,

  /// Large search bar
  large,
}

/// In-page search position
enum DSInPageSearchPosition {
  /// Top of the container
  top,

  /// Bottom of the container
  bottom,

  /// Floating over content
  floating,
}

/// Search result highlight style
enum DSHighlightStyle {
  /// Solid background highlight
  solid,

  /// Outlined highlight
  outline,

  /// Underlined highlight
  underline,

  /// Box shadow highlight
  shadow,
}

/// Configuration model for DSInPageSearch
@freezed
class DSInPageSearchConfig with _$DSInPageSearchConfig {
  const factory DSInPageSearchConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(Duration(milliseconds: 300)) Duration debounceDelay,

    // Size and positioning
    @Default(DSInPageSearchSize.medium) DSInPageSearchSize size,
    @Default(DSInPageSearchPosition.top) DSInPageSearchPosition position,
    @Default(320.0) double width,
    @Default(40.0) double height,

    // Styling
    @Default(8.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(true) bool showBorder,
    @Default(2.0) double elevation,
    @Default(true) bool showShadow,

    // Padding and spacing
    @Default(EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0))
    EdgeInsets padding,
    @Default(EdgeInsets.all(8.0)) EdgeInsets margin,
    @Default(8.0) double iconSpacing,
    @Default(16.0) double buttonSpacing,

    // Typography
    @Default(14.0) double fontSize,
    @Default(FontWeight.w400) FontWeight fontWeight,
    @Default(1.4) double lineHeight,
    @Default(0.0) double letterSpacing,

    // Icon configuration
    @Default(20.0) double iconSize,
    @Default(Icons.search) IconData searchIcon,
    @Default(Icons.clear) IconData clearIcon,
    @Default(Icons.keyboard_arrow_up) IconData previousIcon,
    @Default(Icons.keyboard_arrow_down) IconData nextIcon,
    @Default(Icons.close) IconData closeIcon,

    // Colors (will be overridden by theme if null)
    Color? backgroundColor,
    Color? borderColor,
    Color? focusBorderColor,
    Color? textColor,
    Color? placeholderColor,
    Color? iconColor,
    Color? shadowColor,

    // Highlight configuration
    @Default(DSHighlightStyle.solid) DSHighlightStyle highlightStyle,
    Color? highlightColor,
    Color? highlightTextColor,
    @Default(2.0) double highlightBorderWidth,
    @Default(4.0) double highlightBorderRadius,

    // Interaction configuration
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,
    @Default(true) bool caseSensitive,
    @Default(true) bool wholeWordsOnly,
    @Default(false) bool useRegex,

    // UI elements visibility
    @Default(true) bool showClearButton,
    @Default(true) bool showNavigationButtons,
    @Default(true) bool showResultCount,
    @Default(true) bool showCloseButton,

    // Placeholder and labels
    String? placeholder,
    String? noResultsMessage,
    String? searchingMessage,

    // Keyboard shortcuts
    @Default([LogicalKeyboardKey.escape])
    List<LogicalKeyboardKey> closeShortcut,
    @Default([LogicalKeyboardKey.enter])
    List<LogicalKeyboardKey> searchShortcut,
    @Default([LogicalKeyboardKey.f3]) List<LogicalKeyboardKey> nextShortcut,
    @Default([LogicalKeyboardKey.shift, LogicalKeyboardKey.f3])
    List<LogicalKeyboardKey> previousShortcut,

    // Accessibility configuration
    @Default(true) bool enableAccessibility,
    @Default(true) bool enableSemantics,
    String? semanticLabel,
    String? semanticHint,

    // Platform specific configuration
    @Default(true) bool adaptToTheme,
    @Default(true) bool adaptToPlatform,

    // Loading and skeleton configuration
    @Default(Color(0xFFE0E0E0)) Color skeletonBaseColor,
    @Default(Color(0xFFF5F5F5)) Color skeletonHighlightColor,
    @Default(Duration(milliseconds: 1500)) Duration skeletonAnimationDuration,

    // RTL support
    @Default(true) bool enableRTL,
    @Default(TextDirection.ltr) TextDirection textDirection,

    // Custom constraints
    BoxConstraints? constraints,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) = _DSInPageSearchConfig;

  /// Default configuration for small size
  static const DSInPageSearchConfig small = DSInPageSearchConfig(
    size: DSInPageSearchSize.small,
    width: 280.0,
    height: 32.0,
    fontSize: 12.0,
    iconSize: 16.0,
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  );

  /// Default configuration for medium size
  static const DSInPageSearchConfig medium = DSInPageSearchConfig(
    size: DSInPageSearchSize.medium,
    width: 320.0,
    height: 40.0,
    fontSize: 14.0,
    iconSize: 20.0,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
  );

  /// Default configuration for large size
  static const DSInPageSearchConfig large = DSInPageSearchConfig(
    size: DSInPageSearchSize.large,
    width: 400.0,
    height: 48.0,
    fontSize: 16.0,
    iconSize: 24.0,
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  );
}

/// Data model for search highlights
@freezed
class DSSearchHighlight with _$DSSearchHighlight {
  const factory DSSearchHighlight({
    /// Start position of the highlight
    required int start,

    /// End position of the highlight
    required int end,

    /// The highlighted text
    required String text,

    /// Whether this highlight is currently active/selected
    @Default(false) bool isActive,

    /// Custom style for this highlight
    DSHighlightStyle? style,

    /// Custom color for this highlight
    Color? color,

    /// Additional metadata
    Map<String, dynamic>? metadata,
  }) = _AppSearchHighlight;
}

/// Data model for search controller state
@freezed
class DSInPageSearchData with _$DSInPageSearchData {
  const DSInPageSearchData._();

  const factory DSInPageSearchData({
    /// Current search query
    @Default('') String query,

    /// Current search results/highlights
    @Default([]) List<DSSearchHighlight> highlights,

    /// Currently active highlight index
    @Default(-1) int activeHighlightIndex,

    /// Whether search is currently in progress
    @Default(false) bool isSearching,

    /// Whether the search bar is visible
    @Default(true) bool isVisible,

    /// Whether the search bar is expanded
    @Default(false) bool isExpanded,

    /// Total number of results found
    @Default(0) int totalResults,

    /// Current result index (1-based for display)
    @Default(0) int currentResultIndex,

    /// Error message if search failed
    String? errorMessage,

    /// Last search timestamp
    DateTime? lastSearchTime,

    /// Search history
    @Default([]) List<String> searchHistory,

    /// Whether case sensitive search is enabled
    @Default(false) bool caseSensitive,

    /// Whether whole words only search is enabled
    @Default(false) bool wholeWordsOnly,

    /// Whether regex search is enabled
    @Default(false) bool useRegex,
  }) = _AppInPageSearchData;

  /// Whether there are any results
  bool get hasResults => totalResults > 0;

  /// Whether there is an active highlight
  bool get hasActiveHighlight =>
      activeHighlightIndex >= 0 && activeHighlightIndex < highlights.length;

  /// Current active highlight if any
  DSSearchHighlight? get activeHighlight =>
      hasActiveHighlight ? highlights[activeHighlightIndex] : null;

  /// Whether we can navigate to next result
  bool get canNavigateNext => hasResults && currentResultIndex < totalResults;

  /// Whether we can navigate to previous result
  bool get canNavigatePrevious => hasResults && currentResultIndex > 1;

  /// Display text for current result position
  String get resultPositionText {
    if (!hasResults) return '0 / 0';
    return '$currentResultIndex / $totalResults';
  }
}

/// Utility functions for DSInPageSearch
class DSInPageSearchUtils {
  /// Filter highlights based on search query
  static List<DSSearchHighlight> filterHighlights(
    String text,
    String query, {
    bool caseSensitive = false,
    bool wholeWordsOnly = false,
    bool useRegex = false,
  }) {
    if (query.isEmpty || text.isEmpty) return [];

    try {
      late RegExp pattern;

      if (useRegex) {
        pattern = RegExp(
          query,
          caseSensitive: caseSensitive,
          multiLine: true,
        );
      } else {
        final escapedQuery = RegExp.escape(query);
        final wordBoundary = wholeWordsOnly ? r'\b' : '';
        pattern = RegExp(
          '$wordBoundary$escapedQuery$wordBoundary',
          caseSensitive: caseSensitive,
          multiLine: true,
        );
      }

      final matches = pattern.allMatches(text);
      return matches
          .map((match) => DSSearchHighlight(
                start: match.start,
                end: match.end,
                text: match.group(0) ?? '',
              ))
          .toList();
    } catch (e) {
      // Invalid regex or other error
      return [];
    }
  }

  /// Get platform-specific keyboard shortcuts
  static Map<String, List<LogicalKeyboardKey>> getPlatformShortcuts() {
    return {
      'close': [LogicalKeyboardKey.escape],
      'search': [LogicalKeyboardKey.enter],
      'next': [LogicalKeyboardKey.f3],
      'previous': [LogicalKeyboardKey.shift, LogicalKeyboardKey.f3],
      'find': [LogicalKeyboardKey.control, LogicalKeyboardKey.keyF],
    };
  }

  /// Create highlighted text spans
  static List<TextSpan> createHighlightedTextSpans(
    String text,
    List<DSSearchHighlight> highlights, {
    TextStyle? defaultStyle,
    TextStyle? highlightStyle,
    int? activeHighlightIndex,
    TextStyle? activeHighlightStyle,
  }) {
    if (highlights.isEmpty) {
      return [TextSpan(text: text, style: defaultStyle)];
    }

    final spans = <TextSpan>[];
    int lastEnd = 0;

    for (int i = 0; i < highlights.length; i++) {
      final highlight = highlights[i];

      // Add text before highlight
      if (highlight.start > lastEnd) {
        spans.add(TextSpan(
          text: text.substring(lastEnd, highlight.start),
          style: defaultStyle,
        ));
      }

      // Add highlighted text
      final isActive = activeHighlightIndex == i;
      spans.add(TextSpan(
        text: highlight.text,
        style: isActive ? activeHighlightStyle : highlightStyle,
      ));

      lastEnd = highlight.end;
    }

    // Add remaining text
    if (lastEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: defaultStyle,
      ));
    }

    return spans;
  }

  /// Validate search query
  static bool isValidQuery(String query, {bool useRegex = false}) {
    if (query.isEmpty) return false;

    if (useRegex) {
      try {
        RegExp(query);
        return true;
      } catch (e) {
        return false;
      }
    }

    return query.trim().isNotEmpty;
  }

  /// Calculate search score for relevance
  static double calculateSearchScore(
      DSSearchHighlight highlight, String fullText) {
    // Basic scoring: longer matches and earlier positions get higher scores
    final lengthScore = highlight.text.length / fullText.length;
    final positionScore = 1.0 - (highlight.start / fullText.length);
    return (lengthScore * 0.3) + (positionScore * 0.7);
  }
}
