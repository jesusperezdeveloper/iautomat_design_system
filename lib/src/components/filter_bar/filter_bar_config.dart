import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_bar_config.freezed.dart';

/// Filter bar variant types
enum AppFilterBarVariant {
  /// Chip-based filters shown inline
  chips,

  /// Popover-based filters with dropdown menus
  popovers,
}

/// Filter bar state types
enum AppFilterBarState {
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

/// Filter type options
enum FilterType {
  /// Single selection filter
  single,

  /// Multiple selection filter
  multiple,

  /// Range filter (numeric or date)
  range,

  /// Text input filter
  text,

  /// Date filter
  date,

  /// Date range filter
  dateRange,

  /// Color filter
  color,

  /// Boolean toggle filter
  boolean,
}

/// Filter operator types for advanced filtering
enum FilterOperator {
  /// Equals to
  equals,

  /// Not equals to
  notEquals,

  /// Contains
  contains,

  /// Not contains
  notContains,

  /// Starts with
  startsWith,

  /// Ends with
  endsWith,

  /// Greater than
  greaterThan,

  /// Greater than or equals
  greaterThanOrEquals,

  /// Less than
  lessThan,

  /// Less than or equals
  lessThanOrEquals,

  /// Between (inclusive)
  between,

  /// Not between
  notBetween,

  /// In list
  inList,

  /// Not in list
  notInList,

  /// Is null/empty
  isNull,

  /// Is not null/empty
  isNotNull,
}

/// Size variants for filter bar
enum AppFilterBarSize {
  /// Small size
  small,

  /// Medium size (default)
  medium,

  /// Large size
  large,
}

/// Layout options for filter bar
enum AppFilterBarLayout {
  /// Horizontal layout (default)
  horizontal,

  /// Vertical layout
  vertical,

  /// Wrap layout for responsive design
  wrap,

  /// Grid layout
  grid,
}

/// Chip style variants
enum AppFilterChipStyle {
  /// Filled chip style
  filled,

  /// Outlined chip style
  outlined,

  /// Elevated chip style
  elevated,

  /// Tonal chip style (Material 3)
  tonal,
}

/// Configuration model for AppFilterBar
@freezed
class AppFilterBarConfig with _$AppFilterBarConfig {
  const factory AppFilterBarConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,

    // Size and layout
    @Default(AppFilterBarSize.medium) AppFilterBarSize size,
    @Default(AppFilterBarLayout.horizontal) AppFilterBarLayout layout,
    @Default(AppFilterChipStyle.outlined) AppFilterChipStyle chipStyle,

    // Dimensions
    @Default(32.0) double chipHeight,
    @Default(8.0) double spacing,
    @Default(8.0) double runSpacing,
    @Default(4.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(12.0) double padding,

    // Typography
    @Default(14.0) double fontSize,
    @Default(FontWeight.w500) FontWeight fontWeight,
    @Default(1.2) double lineHeight,

    // Icon configuration
    @Default(18.0) double iconSize,
    @Default(4.0) double iconSpacing,
    @Default(Icons.filter_list) IconData filterIcon,
    @Default(Icons.arrow_drop_down) IconData dropdownIcon,
    @Default(Icons.close) IconData clearIcon,
    @Default(Icons.check) IconData selectedIcon,

    // Behavior configuration
    @Default(true) bool showFilterIcon,
    @Default(true) bool showDropdownIcon,
    @Default(true) bool showClearButton,
    @Default(true) bool showSelectedIcon,
    @Default(true) bool showActiveCount,
    @Default(true) bool showTotalCount,
    @Default(false) bool allowEmpty,
    @Default(true) bool closeOnSelect,
    @Default(3) int maxVisibleChips,
    @Default(true) bool enableSearch,
    @Default(true) bool enableClearAll,
    @Default(true) bool enableSelectAll,

    // Popover configuration
    @Default(250.0) double popoverWidth,
    @Default(300.0) double popoverMaxHeight,
    @Default(EdgeInsets.symmetric(vertical: 8.0)) EdgeInsets popoverPadding,
    @Default(8.0) double popoverElevation,

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
    Color? badgeBackgroundColor,
    Color? badgeTextColor,

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
    @Default(4) int skeletonFilterCount,

    // RTL support
    @Default(true) bool enableRTL,
    @Default(TextDirection.ltr) TextDirection textDirection,

    // Custom labels
    String? clearAllLabel,
    String? selectAllLabel,
    String? searchPlaceholder,
    String? noResultsLabel,
    String? loadingLabel,
    String? moreLabel,

    // Summary display configuration
    @Default(true) bool showSummary,
    String? summaryPrefix,
    String? summarySeparator,
    @Default(50) int maxSummaryLength,

    // Custom constraints
    BoxConstraints? constraints,
    EdgeInsets? margin,
  }) = _AppFilterBarConfig;

  /// Default configuration for small size
  static const AppFilterBarConfig small = AppFilterBarConfig(
    size: AppFilterBarSize.small,
    chipHeight: 28.0,
    spacing: 6.0,
    fontSize: 12.0,
    iconSize: 16.0,
    padding: 8.0,
  );

  /// Default configuration for medium size
  static const AppFilterBarConfig medium = AppFilterBarConfig(
    size: AppFilterBarSize.medium,
    chipHeight: 32.0,
    spacing: 8.0,
    fontSize: 14.0,
    iconSize: 18.0,
    padding: 12.0,
  );

  /// Default configuration for large size
  static const AppFilterBarConfig large = AppFilterBarConfig(
    size: AppFilterBarSize.large,
    chipHeight: 40.0,
    spacing: 12.0,
    fontSize: 16.0,
    iconSize: 20.0,
    padding: 16.0,
  );
}

/// Individual filter configuration
@freezed
class AppFilter with _$AppFilter {
  const AppFilter._();

  const factory AppFilter({
    /// Unique identifier for the filter
    required String id,

    /// Display label for the filter
    required String label,

    /// Filter type
    @Default(FilterType.single) FilterType type,

    /// Filter operator
    @Default(FilterOperator.equals) FilterOperator operator,

    /// Current value(s) of the filter
    dynamic value,

    /// Available options for selection filters
    @Default([]) List<AppFilterOption> options,

    /// Icon for the filter
    IconData? icon,

    /// Color for the filter chip/badge
    Color? color,

    /// Whether the filter is required
    @Default(false) bool isRequired,

    /// Whether the filter is disabled
    @Default(false) bool isDisabled,

    /// Whether the filter is visible
    @Default(true) bool isVisible,

    /// Whether the filter is active/has value
    @Default(false) bool isActive,

    /// Group identifier for related filters
    String? group,

    /// Custom metadata
    Map<String, dynamic>? metadata,

    /// Validation function
    String? Function(dynamic)? validator,

    /// Format function for display
    String Function(dynamic)? formatter,

    /// Min value for range filters
    dynamic minValue,

    /// Max value for range filters
    dynamic maxValue,

    /// Step value for numeric filters
    num? stepValue,

    /// Placeholder text for input filters
    String? placeholder,

    /// Help text for the filter
    String? helpText,

    /// Error message
    String? errorMessage,
  }) = _AppFilter;

  /// Whether the filter has a value set
  bool get hasValue {
    if (value == null) return false;
    if (value is String) return (value as String).isNotEmpty;
    if (value is List) return (value as List).isNotEmpty;
    if (value is Map) return (value as Map).isNotEmpty;
    return true;
  }

  /// Get display value for the filter
  String get displayValue {
    if (!hasValue) return '';

    if (formatter != null) {
      return formatter!(value);
    }

    switch (type) {
      case FilterType.single:
        if (value is AppFilterOption) {
          return (value as AppFilterOption).label;
        }
        return value?.toString() ?? '';

      case FilterType.multiple:
        if (value is List<AppFilterOption>) {
          return (value as List<AppFilterOption>)
              .map((o) => o.label)
              .join(', ');
        }
        if (value is List) {
          return (value as List).join(', ');
        }
        return value?.toString() ?? '';

      case FilterType.range:
        if (value is List && (value as List).length == 2) {
          final list = value as List;
          return '${list[0]} - ${list[1]}';
        }
        return value?.toString() ?? '';

      case FilterType.date:
        if (value is DateTime) {
          return _formatDate(value as DateTime);
        }
        return value?.toString() ?? '';

      case FilterType.dateRange:
        if (value is List && (value as List).length == 2) {
          final list = value as List;
          if (list[0] is DateTime && list[1] is DateTime) {
            return '${_formatDate(list[0])} - ${_formatDate(list[1])}';
          }
        }
        return value?.toString() ?? '';

      case FilterType.boolean:
        return value == true ? 'Yes' : 'No';

      default:
        return value?.toString() ?? '';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  /// Get count of selected options for multiple selection filters
  int get selectedCount {
    if (type != FilterType.multiple) return hasValue ? 1 : 0;
    if (value is List) return (value as List).length;
    return 0;
  }

  /// Clear the filter value
  AppFilter clear() {
    return copyWith(value: null, isActive: false);
  }

  /// Apply a new value to the filter
  AppFilter apply(dynamic newValue) {
    return copyWith(value: newValue, isActive: newValue != null);
  }
}

/// Filter option for selection filters
@freezed
class AppFilterOption with _$AppFilterOption {
  const factory AppFilterOption({
    /// Unique value for the option
    required dynamic value,

    /// Display label for the option
    required String label,

    /// Icon for the option
    IconData? icon,

    /// Color for the option
    Color? color,

    /// Whether the option is disabled
    @Default(false) bool isDisabled,

    /// Additional metadata
    Map<String, dynamic>? metadata,

    /// Child options for hierarchical filters
    @Default([]) List<AppFilterOption> children,
  }) = _AppFilterOption;
}

/// Filter group for organizing related filters
@freezed
class AppFilterGroup with _$AppFilterGroup {
  const factory AppFilterGroup({
    /// Group identifier
    required String id,

    /// Group label
    required String label,

    /// Filters in this group
    @Default([]) List<AppFilter> filters,

    /// Icon for the group
    IconData? icon,

    /// Whether the group is expanded
    @Default(true) bool isExpanded,

    /// Whether the group is visible
    @Default(true) bool isVisible,
  }) = _AppFilterGroup;
}

/// Summary builder function type
typedef SummaryBuilder = Widget Function(
  BuildContext context,
  List<AppFilter> activeFilters,
  int totalCount,
);

/// Filter changed callback
typedef OnFiltersChanged = void Function(List<AppFilter> filters);

/// Filter applied callback
typedef OnFilterApplied = void Function(AppFilter filter, dynamic value);

/// Filter cleared callback
typedef OnFilterCleared = void Function(AppFilter filter);

/// Utility functions for AppFilterBar
class AppFilterBarUtils {
  /// Get active filters from a list
  static List<AppFilter> getActiveFilters(List<AppFilter> filters) {
    return filters.where((f) => f.isActive && f.hasValue).toList();
  }

  /// Get filter count summary
  static String getFilterSummary(List<AppFilter> filters) {
    final activeFilters = getActiveFilters(filters);
    if (activeFilters.isEmpty) return 'No filters';
    if (activeFilters.length == 1) return '1 filter';
    return '${activeFilters.length} filters';
  }

  /// Clear all filters
  static List<AppFilter> clearAllFilters(List<AppFilter> filters) {
    return filters.map((f) => f.clear()).toList();
  }

  /// Apply filter value
  static List<AppFilter> applyFilter(
    List<AppFilter> filters,
    String filterId,
    dynamic value,
  ) {
    return filters.map((f) {
      if (f.id == filterId) {
        return f.apply(value);
      }
      return f;
    }).toList();
  }

  /// Group filters by group ID
  static Map<String?, List<AppFilter>> groupFilters(List<AppFilter> filters) {
    final Map<String?, List<AppFilter>> grouped = {};

    for (final filter in filters) {
      if (!grouped.containsKey(filter.group)) {
        grouped[filter.group] = [];
      }
      grouped[filter.group]!.add(filter);
    }

    return grouped;
  }

  /// Validate all filters
  static Map<String, String> validateFilters(List<AppFilter> filters) {
    final Map<String, String> errors = {};

    for (final filter in filters) {
      if (filter.validator != null) {
        final error = filter.validator!(filter.value);
        if (error != null) {
          errors[filter.id] = error;
        }
      }

      // Check required filters
      if (filter.isRequired && !filter.hasValue) {
        errors[filter.id] = '${filter.label} is required';
      }
    }

    return errors;
  }

  /// Get platform-specific keyboard shortcuts
  static Map<String, List<LogicalKeyboardKey>> getPlatformShortcuts() {
    return {
      'clearAll': [LogicalKeyboardKey.escape],
      'apply': [LogicalKeyboardKey.enter],
      'search': [LogicalKeyboardKey.keyF, LogicalKeyboardKey.controlLeft],
      'next': [LogicalKeyboardKey.tab],
      'previous': [LogicalKeyboardKey.tab, LogicalKeyboardKey.shiftLeft],
    };
  }

  /// Generate semantic label for filter
  static String getFilterSemanticLabel(AppFilter filter) {
    final status = filter.isActive ? 'active' : 'inactive';
    final value = filter.hasValue ? ', value: ${filter.displayValue}' : '';
    final required = filter.isRequired ? ', required' : '';
    final disabled = filter.isDisabled ? ', disabled' : '';

    return '${filter.label} filter, $status$value$required$disabled';
  }

  /// Generate summary text for active filters
  static String generateSummaryText(
    List<AppFilter> filters, {
    String separator = ' • ',
    int maxLength = 50,
  }) {
    final activeFilters = getActiveFilters(filters);
    if (activeFilters.isEmpty) return '';

    final parts = activeFilters.map((f) => '${f.label}: ${f.displayValue}');
    final full = parts.join(separator);

    if (full.length <= maxLength) return full;

    // Truncate and add ellipsis
    final truncated = full.substring(0, maxLength - 3);
    return '$truncated...';
  }
}
