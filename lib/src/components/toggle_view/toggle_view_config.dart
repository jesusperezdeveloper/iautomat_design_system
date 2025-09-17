import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_view_config.freezed.dart';

/// Toggle view variant types
enum AppToggleViewVariant {
  /// List view with vertical layout
  list,

  /// Grid view with matrix layout
  grid,

  /// Compact view with horizontal layout
  compact,
}

/// Toggle view state types
enum AppToggleViewState {
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

/// Toggle view size variants
enum AppToggleViewSize {
  /// Small toggle view
  small,

  /// Medium toggle view (default)
  medium,

  /// Large toggle view
  large,
}

/// Toggle view orientation
enum AppToggleViewOrientation {
  /// Horizontal orientation
  horizontal,

  /// Vertical orientation
  vertical,

  /// Auto orientation based on available space
  auto,
}

/// Configuration model for AppToggleView
@freezed
class AppToggleViewConfig with _$AppToggleViewConfig {
  const factory AppToggleViewConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,

    // Size and spacing configuration
    @Default(AppToggleViewSize.medium) AppToggleViewSize size,
    @Default(AppToggleViewOrientation.auto) AppToggleViewOrientation orientation,
    @Default(EdgeInsets.all(8.0)) EdgeInsets padding,
    @Default(EdgeInsets.symmetric(horizontal: 4.0)) EdgeInsets itemPadding,
    @Default(8.0) double itemSpacing,
    @Default(4.0) double borderRadius,
    @Default(1.0) double borderWidth,

    // Grid specific configuration
    @Default(2) int gridCrossAxisCount,
    @Default(1.0) double gridChildAspectRatio,
    @Default(8.0) double gridMainAxisSpacing,
    @Default(8.0) double gridCrossAxisSpacing,

    // List specific configuration
    @Default(false) bool listReverse,
    @Default(ScrollPhysics()) ScrollPhysics listScrollPhysics,
    @Default(Axis.horizontal) Axis listScrollDirection,

    // Compact specific configuration
    @Default(true) bool compactWrapItems,
    @Default(WrapAlignment.start) WrapAlignment compactAlignment,
    @Default(WrapCrossAlignment.center) WrapCrossAlignment compactCrossAlignment,

    // Visual configuration
    @Default(true) bool showBorder,
    @Default(true) bool showRipple,
    @Default(2.0) double elevation,
    @Default(true) bool showShadow,

    // Color configuration
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? borderColor,
    Color? selectedBorderColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? iconColor,
    Color? selectedIconColor,
    Color? disabledColor,
    Color? focusColor,
    Color? hoverColor,
    Color? splashColor,
    Color? highlightColor,

    // Typography configuration
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
    @Default(14.0) double fontSize,
    @Default(FontWeight.w500) FontWeight fontWeight,
    @Default(FontWeight.w600) FontWeight selectedFontWeight,

    // Icon configuration
    @Default(18.0) double iconSize,
    @Default(8.0) double iconSpacing,
    @Default(true) bool showIcon,

    // Interaction configuration
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,
    @Default(true) bool allowMultipleSelection,
    @Default(false) bool allowDeselection,

    // Accessibility configuration
    @Default(true) bool enableAccessibility,
    @Default(true) bool enableSemantics,
    String? semanticLabel,
    String? semanticHint,
    @Default(true) bool excludeSemantics,

    // Platform specific configuration
    @Default(true) bool adaptToTheme,
    @Default(true) bool adaptToPlatform,
    @Default(true) bool useNativeScrolling,

    // Loading and skeleton configuration
    @Default(Color(0xFFE0E0E0)) Color skeletonBaseColor,
    @Default(Color(0xFFF5F5F5)) Color skeletonHighlightColor,
    @Default(Duration(milliseconds: 1500)) Duration skeletonAnimationDuration,

    // Focus and keyboard navigation
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool showFocusIndicator,
    Color? focusIndicatorColor,
    @Default(2.0) double focusIndicatorWidth,

    // RTL support
    @Default(true) bool enableRTL,
    @Default(TextDirection.ltr) TextDirection textDirection,

    // Custom constraints
    BoxConstraints? constraints,
    @Default(double.infinity) double maxWidth,
    @Default(double.infinity) double maxHeight,
    double? minWidth,
    double? minHeight,
  }) = _AppToggleViewConfig;

  /// Default configuration for small size
  static const AppToggleViewConfig small = AppToggleViewConfig(
    size: AppToggleViewSize.small,
    fontSize: 12.0,
    iconSize: 16.0,
    padding: EdgeInsets.all(6.0),
    itemPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  );

  /// Default configuration for medium size
  static const AppToggleViewConfig medium = AppToggleViewConfig(
    size: AppToggleViewSize.medium,
    fontSize: 14.0,
    iconSize: 18.0,
    padding: EdgeInsets.all(8.0),
    itemPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
  );

  /// Default configuration for large size
  static const AppToggleViewConfig large = AppToggleViewConfig(
    size: AppToggleViewSize.large,
    fontSize: 16.0,
    iconSize: 20.0,
    padding: EdgeInsets.all(10.0),
    itemPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  );
}

/// Data model for toggle view options
@freezed
class AppToggleViewOption with _$AppToggleViewOption {
  const AppToggleViewOption._();

  const factory AppToggleViewOption({
    /// Unique identifier for the option
    required String id,

    /// Display label for the option
    required String label,

    /// Optional icon for the option
    IconData? icon,

    /// Optional value for the option
    dynamic value,

    /// Whether the option is enabled
    @Default(true) bool enabled,

    /// Whether the option is selected
    @Default(false) bool selected,

    /// Custom tooltip for the option
    String? tooltip,

    /// Semantic label for accessibility
    String? semanticLabel,

    /// Custom styling for this specific option
    AppToggleViewConfig? config,

    /// Additional metadata
    Map<String, dynamic>? metadata,
  }) = _AppToggleViewOption;

  /// Create option from simple string
  factory AppToggleViewOption.fromString(String label) {
    return AppToggleViewOption(
      id: label.toLowerCase().replaceAll(' ', '_'),
      label: label,
    );
  }

  /// Create option with icon
  factory AppToggleViewOption.withIcon({
    required String id,
    required String label,
    required IconData icon,
    dynamic value,
    bool enabled = true,
  }) {
    return AppToggleViewOption(
      id: id,
      label: label,
      icon: icon,
      value: value,
      enabled: enabled,
    );
  }
}

/// Data model for toggle view state management
@freezed
class AppToggleViewData with _$AppToggleViewData {
  const AppToggleViewData._();

  const factory AppToggleViewData({
    /// Current variant of the toggle view
    @Default(AppToggleViewVariant.list) AppToggleViewVariant variant,

    /// Current selected value(s)
    @Default([]) List<String> selectedValues,

    /// Available options
    @Default([]) List<AppToggleViewOption> options,

    /// Current state
    @Default(AppToggleViewState.defaultState) AppToggleViewState state,

    /// Whether the toggle view is enabled
    @Default(true) bool enabled,

    /// Current focus index for keyboard navigation
    @Default(-1) int focusIndex,

    /// Loading progress (0.0 to 1.0)
    @Default(0.0) double loadingProgress,

    /// Error message if any
    String? errorMessage,

    /// Additional metadata
    Map<String, dynamic>? metadata,
  }) = _AppToggleViewData;

  /// Check if a specific option is selected
  bool isSelected(String optionId) {
    return selectedValues.contains(optionId);
  }

  /// Check if multiple options are selected
  bool get hasMultipleSelections => selectedValues.length > 1;

  /// Check if any option is selected
  bool get hasSelection => selectedValues.isNotEmpty;

  /// Get the first selected option
  String? get firstSelectedValue =>
      selectedValues.isNotEmpty ? selectedValues.first : null;

  /// Get selected options
  List<AppToggleViewOption> get selectedOptions {
    return options.where((option) => selectedValues.contains(option.id)).toList();
  }

  /// Get enabled options
  List<AppToggleViewOption> get enabledOptions {
    return options.where((option) => option.enabled).toList();
  }
}

/// Utility functions for AppToggleView
class AppToggleViewUtils {
  AppToggleViewUtils._();

  /// Create toggle view data from string list
  static AppToggleViewData fromStringList(
    List<String> items, {
    AppToggleViewVariant variant = AppToggleViewVariant.list,
    List<String>? selectedValues,
  }) {
    final options = items.map((item) => AppToggleViewOption.fromString(item)).toList();
    return AppToggleViewData(
      variant: variant,
      options: options,
      selectedValues: selectedValues ?? [],
    );
  }

  /// Create toggle view data with icons
  static AppToggleViewData withIcons(
    Map<String, IconData> itemsWithIcons, {
    AppToggleViewVariant variant = AppToggleViewVariant.list,
    List<String>? selectedValues,
  }) {
    final options = itemsWithIcons.entries
        .map((entry) => AppToggleViewOption.withIcon(
              id: entry.key.toLowerCase().replaceAll(' ', '_'),
              label: entry.key,
              icon: entry.value,
            ))
        .toList();
    return AppToggleViewData(
      variant: variant,
      options: options,
      selectedValues: selectedValues ?? [],
    );
  }

  /// Toggle selection for an option
  static List<String> toggleSelection(
    List<String> currentSelection,
    String optionId, {
    bool allowMultiple = true,
    bool allowDeselection = true,
  }) {
    final newSelection = List<String>.from(currentSelection);

    if (newSelection.contains(optionId)) {
      if (allowDeselection) {
        newSelection.remove(optionId);
      }
    } else {
      if (allowMultiple) {
        newSelection.add(optionId);
      } else {
        newSelection.clear();
        newSelection.add(optionId);
      }
    }

    return newSelection;
  }

  /// Get item size based on toggle view size
  static Size getItemSize(AppToggleViewSize size) {
    switch (size) {
      case AppToggleViewSize.small:
        return const Size(80, 32);
      case AppToggleViewSize.medium:
        return const Size(100, 40);
      case AppToggleViewSize.large:
        return const Size(120, 48);
    }
  }

  /// Get padding based on toggle view size
  static EdgeInsets getPadding(AppToggleViewSize size) {
    switch (size) {
      case AppToggleViewSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case AppToggleViewSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case AppToggleViewSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  /// Get icon size based on toggle view size
  static double getIconSize(AppToggleViewSize size) {
    switch (size) {
      case AppToggleViewSize.small:
        return 16;
      case AppToggleViewSize.medium:
        return 18;
      case AppToggleViewSize.large:
        return 20;
    }
  }

  /// Check if platform supports native features
  static bool isPlatformSupported(TargetPlatform platform) {
    return [
      TargetPlatform.android,
      TargetPlatform.iOS,
      TargetPlatform.fuchsia,
      TargetPlatform.linux,
      TargetPlatform.macOS,
      TargetPlatform.windows,
    ].contains(platform);
  }

  /// Get appropriate scroll physics for platform
  static ScrollPhysics getPlatformScrollPhysics(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }

  /// Calculate optimal grid cross axis count based on available width
  static int calculateOptimalCrossAxisCount(double availableWidth, double itemWidth) {
    if (availableWidth <= 0 || itemWidth <= 0) return 2;
    return (availableWidth / itemWidth).floor().clamp(1, 6);
  }

  /// Validate toggle view data
  static bool validateData(AppToggleViewData data) {
    // Check if all selected values exist in options
    final optionIds = data.options.map((option) => option.id).toSet();
    return data.selectedValues.every((value) => optionIds.contains(value));
  }
}