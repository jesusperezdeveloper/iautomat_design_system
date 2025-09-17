import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_config.freezed.dart';

/// Pagination variant types
enum AppPaginationVariant {
  /// Page-based pagination with numbered pages
  pageBased,

  /// Cursor-based pagination for continuous scrolling
  cursor,
}

/// Pagination state types
enum AppPaginationState {
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

/// Pagination size variants
enum AppPaginationSize {
  /// Small pagination controls
  small,

  /// Medium pagination controls (default)
  medium,

  /// Large pagination controls
  large,
}

/// Pagination layout orientation
enum AppPaginationLayout {
  /// Horizontal layout
  horizontal,

  /// Vertical layout
  vertical,

  /// Compact layout for small screens
  compact,
}

/// Page button style variants
enum AppPageButtonStyle {
  /// Filled button style
  filled,

  /// Outlined button style
  outlined,

  /// Text button style
  text,

  /// Icon button style
  icon,
}

/// Configuration model for AppPagination
@freezed
class AppPaginationConfig with _$AppPaginationConfig {
  const factory AppPaginationConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,

    // Size and layout
    @Default(AppPaginationSize.medium) AppPaginationSize size,
    @Default(AppPaginationLayout.horizontal) AppPaginationLayout layout,
    @Default(AppPageButtonStyle.outlined) AppPageButtonStyle buttonStyle,

    // Dimensions
    @Default(40.0) double buttonSize,
    @Default(8.0) double spacing,
    @Default(4.0) double borderRadius,
    @Default(1.0) double borderWidth,

    // Typography
    @Default(14.0) double fontSize,
    @Default(FontWeight.w500) FontWeight fontWeight,
    @Default(1.2) double lineHeight,

    // Icon configuration
    @Default(20.0) double iconSize,
    @Default(Icons.chevron_left) IconData previousIcon,
    @Default(Icons.chevron_right) IconData nextIcon,
    @Default(Icons.first_page) IconData firstIcon,
    @Default(Icons.last_page) IconData lastIcon,
    @Default(Icons.more_horiz) IconData ellipsisIcon,

    // Pagination behavior
    @Default(5) int maxVisiblePages,
    @Default(true) bool showFirstLast,
    @Default(true) bool showPrevNext,
    @Default(true) bool showPageNumbers,
    @Default(true) bool showPageInfo,
    @Default(true) bool showEllipsis,
    @Default(false) bool showJumpToPage,

    // Cursor pagination specific
    @Default(true) bool showLoadMore,
    @Default(true) bool autoLoadMore,
    @Default(50) int loadMoreThreshold,

    // Colors (will be overridden by theme if null)
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? hoverBackgroundColor,
    Color? disabledBackgroundColor,
    Color? borderColor,
    Color? selectedBorderColor,
    Color? hoverBorderColor,
    Color? disabledBorderColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? hoverTextColor,
    Color? disabledTextColor,
    Color? iconColor,
    Color? selectedIconColor,
    Color? hoverIconColor,
    Color? disabledIconColor,

    // Interaction configuration
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,
    @Default(true) bool enableKeyboardNavigation,

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
    @Default(3) int skeletonButtonCount,

    // RTL support
    @Default(true) bool enableRTL,
    @Default(TextDirection.ltr) TextDirection textDirection,

    // Custom labels
    String? previousLabel,
    String? nextLabel,
    String? firstLabel,
    String? lastLabel,
    String? pageLabel,
    String? ofLabel,
    String? loadMoreLabel,

    // Custom constraints
    BoxConstraints? constraints,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) = _AppPaginationConfig;

  /// Default configuration for small size
  static const AppPaginationConfig small = AppPaginationConfig(
    size: AppPaginationSize.small,
    buttonSize: 32.0,
    spacing: 4.0,
    fontSize: 12.0,
    iconSize: 16.0,
  );

  /// Default configuration for medium size
  static const AppPaginationConfig medium = AppPaginationConfig(
    size: AppPaginationSize.medium,
    buttonSize: 40.0,
    spacing: 8.0,
    fontSize: 14.0,
    iconSize: 20.0,
  );

  /// Default configuration for large size
  static const AppPaginationConfig large = AppPaginationConfig(
    size: AppPaginationSize.large,
    buttonSize: 48.0,
    spacing: 12.0,
    fontSize: 16.0,
    iconSize: 24.0,
  );
}

/// Data model for pagination state
@freezed
class AppPaginationData with _$AppPaginationData {
  const AppPaginationData._();

  const factory AppPaginationData({
    // Current pagination state
    @Default(1) int currentPage,
    @Default(10) int pageSize,
    @Default(0) int totalItems,
    @Default(0) int totalPages,

    // Cursor pagination state
    String? nextCursor,
    String? previousCursor,
    @Default(false) bool hasNextPage,
    @Default(false) bool hasPreviousPage,

    // Loading states
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,

    // Error handling
    String? errorMessage,
    @Default(false) bool hasError,

    // UI state
    @Default(false) bool showJumpDialog,
    @Default(-1) int hoveredPage,
    @Default(-1) int focusedPage,

    // Metadata
    DateTime? lastUpdated,
    Map<String, dynamic>? metadata,
  }) = _AppPaginationData;

  /// Whether there are any items
  bool get hasItems => totalItems > 0;

  /// Whether we're on the first page
  bool get isFirstPage => currentPage <= 1;

  /// Whether we're on the last page
  bool get isLastPage => currentPage >= totalPages;

  /// Whether we can navigate to previous page
  bool get canGoToPrevious => !isFirstPage && !isLoading;

  /// Whether we can navigate to next page
  bool get canGoToNext => !isLastPage && !isLoading;

  /// Start index of current page items (1-based)
  int get startIndex => hasItems ? ((currentPage - 1) * pageSize) + 1 : 0;

  /// End index of current page items (1-based)
  int get endIndex {
    if (!hasItems) return 0;
    final end = currentPage * pageSize;
    return end > totalItems ? totalItems : end;
  }

  /// Display text for current page info
  String get pageInfoText => hasItems ? '$startIndex-$endIndex of $totalItems' : '0 of 0';

  /// List of visible page numbers
  List<int> getVisiblePages(int maxVisible) {
    if (totalPages <= maxVisible) {
      return List.generate(totalPages, (index) => index + 1);
    }

    final half = maxVisible ~/ 2;
    int start = currentPage - half;
    int end = currentPage + half;

    if (start < 1) {
      start = 1;
      end = maxVisible;
    } else if (end > totalPages) {
      end = totalPages;
      start = totalPages - maxVisible + 1;
    }

    return List.generate(end - start + 1, (index) => start + index);
  }

  /// Whether to show ellipsis before current page range
  bool shouldShowStartEllipsis(List<int> visiblePages) {
    return visiblePages.isNotEmpty && visiblePages.first > 2;
  }

  /// Whether to show ellipsis after current page range
  bool shouldShowEndEllipsis(List<int> visiblePages) {
    return visiblePages.isNotEmpty && visiblePages.last < totalPages - 1;
  }
}

/// Callback function type for page changes
typedef OnPageChanged = void Function(int page);

/// Callback function type for cursor navigation
typedef OnCursorChanged = void Function(String? cursor, bool isNext);

/// Callback function type for page size changes
typedef OnPageSizeChanged = void Function(int pageSize);

/// Utility functions for AppPagination
class AppPaginationUtils {
  /// Calculate total pages from total items and page size
  static int calculateTotalPages(int totalItems, int pageSize) {
    if (pageSize <= 0) return 0;
    return (totalItems / pageSize).ceil();
  }

  /// Validate page number within bounds
  static int validatePage(int page, int totalPages) {
    if (page < 1) return 1;
    if (page > totalPages) return totalPages;
    return page;
  }

  /// Generate page range for display
  static List<int> generatePageRange(int currentPage, int totalPages, int maxVisible) {
    if (totalPages <= maxVisible) {
      return List.generate(totalPages, (index) => index + 1);
    }

    final half = maxVisible ~/ 2;
    int start = currentPage - half;
    int end = currentPage + half;

    if (start < 1) {
      start = 1;
      end = maxVisible;
    } else if (end > totalPages) {
      end = totalPages;
      start = totalPages - maxVisible + 1;
    }

    return List.generate(end - start + 1, (index) => start + index);
  }

  /// Get platform-specific keyboard shortcuts
  static Map<String, List<LogicalKeyboardKey>> getPlatformShortcuts() {
    return {
      'first': [LogicalKeyboardKey.home],
      'last': [LogicalKeyboardKey.end],
      'previous': [LogicalKeyboardKey.arrowLeft],
      'next': [LogicalKeyboardKey.arrowRight],
      'jump': [LogicalKeyboardKey.keyG],
    };
  }

  /// Format large numbers for display
  static String formatNumber(int number) {
    if (number < 1000) return number.toString();
    if (number < 1000000) return '${(number / 1000).toStringAsFixed(1)}K';
    if (number < 1000000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }

  /// Parse cursor for cursor-based pagination
  static Map<String, dynamic>? parseCursor(String? cursor) {
    if (cursor == null || cursor.isEmpty) return null;

    try {
      // This is a simplified implementation
      // In real apps, you'd decode base64 or parse JSON
      return {'id': cursor, 'timestamp': DateTime.now().toIso8601String()};
    } catch (e) {
      return null;
    }
  }

  /// Encode cursor for cursor-based pagination
  static String? encodeCursor(Map<String, dynamic>? data) {
    if (data == null) return null;

    try {
      // This is a simplified implementation
      // In real apps, you'd encode to base64 or JSON
      return data['id']?.toString();
    } catch (e) {
      return null;
    }
  }

  /// Validate pagination configuration
  static bool isValidConfig(AppPaginationData data) {
    return data.pageSize > 0 &&
           data.currentPage > 0 &&
           data.totalItems >= 0;
  }

  /// Calculate optimal page size for screen size
  static int calculateOptimalPageSize(Size screenSize) {
    final width = screenSize.width;

    if (width < 600) return 10; // Mobile
    if (width < 1200) return 20; // Tablet
    return 50; // Desktop
  }

  /// Generate semantic label for page button
  static String getPageButtonSemanticLabel(int page, int currentPage, int totalPages) {
    if (page == currentPage) {
      return 'Page $page of $totalPages, current page';
    }
    return 'Go to page $page of $totalPages';
  }

  /// Generate semantic label for navigation button
  static String getNavButtonSemanticLabel(String action, bool enabled) {
    final status = enabled ? '' : ', disabled';
    switch (action) {
      case 'first':
        return 'Go to first page$status';
      case 'previous':
        return 'Go to previous page$status';
      case 'next':
        return 'Go to next page$status';
      case 'last':
        return 'Go to last page$status';
      default:
        return '$action$status';
    }
  }
}