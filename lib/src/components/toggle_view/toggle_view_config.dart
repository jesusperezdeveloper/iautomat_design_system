import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_view_config.freezed.dart';

/// Toggle view variant types
enum DSToggleViewVariant {
  /// List view with vertical layout
  list,

  /// Grid view with matrix layout
  grid,

  /// Compact view with horizontal layout
  compact,
}

/// Toggle view state types
enum DSToggleViewState {
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
enum DSToggleViewSize {
  /// Small toggle view
  small,

  /// Medium toggle view (default)
  medium,

  /// Large toggle view
  large,
}

/// Toggle view orientation
enum DSToggleViewOrientation {
  /// Horizontal orientation
  horizontal,

  /// Vertical orientation
  vertical,

  /// Auto orientation based on available space
  auto,
}

/// Configuration model for DSToggleView
@freezed
class DSToggleViewConfig with _$DSToggleViewConfig {
  const factory DSToggleViewConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,

    // Size and spacing configuration
    @Default(DSToggleViewSize.medium) DSToggleViewSize size,
    @Default(DSToggleViewOrientation.auto)
    DSToggleViewOrientation orientation,
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
    @Default(WrapCrossAlignment.center)
    WrapCrossAlignment compactCrossAlignment,

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
  }) = _DSToggleViewConfig;

  /// Default configuration for small size
  static const DSToggleViewConfig small = DSToggleViewConfig(
    size: DSToggleViewSize.small,
    fontSize: 12.0,
    iconSize: 16.0,
    padding: EdgeInsets.all(6.0),
    itemPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  );

  /// Default configuration for medium size
  static const DSToggleViewConfig medium = DSToggleViewConfig(
    size: DSToggleViewSize.medium,
    fontSize: 14.0,
    iconSize: 18.0,
    padding: EdgeInsets.all(8.0),
    itemPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
  );

  /// Default configuration for large size
  static const DSToggleViewConfig large = DSToggleViewConfig(
    size: DSToggleViewSize.large,
    fontSize: 16.0,
    iconSize: 20.0,
    padding: EdgeInsets.all(10.0),
    itemPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  );
}

/// Data model for toggle view options
@freezed
class DSToggleViewOption with _$DSToggleViewOption {
  const DSToggleViewOption._();

  const factory DSToggleViewOption({
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
    DSToggleViewConfig? config,

    /// Additional metadata
    Map<String, dynamic>? metadata,
  }) = _AppToggleViewOption;

  /// Create option from simple string
  factory DSToggleViewOption.fromString(String label) {
    return DSToggleViewOption(
      id: label.toLowerCase().replaceAll(' ', '_'),
      label: label,
    );
  }

  /// Create option with icon
  factory DSToggleViewOption.withIcon({
    required String id,
    required String label,
    required IconData icon,
    dynamic value,
    bool enabled = true,
  }) {
    return DSToggleViewOption(
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
class DSToggleViewData with _$DSToggleViewData {
  const DSToggleViewData._();

  const factory DSToggleViewData({
    /// Current variant of the toggle view
    @Default(DSToggleViewVariant.list) DSToggleViewVariant variant,

    /// Current selected value(s)
    @Default([]) List<String> selectedValues,

    /// Available options
    @Default([]) List<DSToggleViewOption> options,

    /// Current state
    @Default(DSToggleViewState.defaultState) DSToggleViewState state,

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
  List<DSToggleViewOption> get selectedOptions {
    return options
        .where((option) => selectedValues.contains(option.id))
        .toList();
  }

  /// Get enabled options
  List<DSToggleViewOption> get enabledOptions {
    return options.where((option) => option.enabled).toList();
  }
}

/// Utility functions for DSToggleView
class DSToggleViewUtils {
  DSToggleViewUtils._();

  /// Create toggle view data from string list
  static DSToggleViewData fromStringList(
    List<String> items, {
    DSToggleViewVariant variant = DSToggleViewVariant.list,
    List<String>? selectedValues,
  }) {
    final options =
        items.map((item) => DSToggleViewOption.fromString(item)).toList();
    return DSToggleViewData(
      variant: variant,
      options: options,
      selectedValues: selectedValues ?? [],
    );
  }

  /// Create toggle view data with icons
  static DSToggleViewData withIcons(
    Map<String, IconData> itemsWithIcons, {
    DSToggleViewVariant variant = DSToggleViewVariant.list,
    List<String>? selectedValues,
  }) {
    final options = itemsWithIcons.entries
        .map((entry) => DSToggleViewOption.withIcon(
              id: entry.key.toLowerCase().replaceAll(' ', '_'),
              label: entry.key,
              icon: entry.value,
            ))
        .toList();
    return DSToggleViewData(
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
  static Size getItemSize(DSToggleViewSize size) {
    switch (size) {
      case DSToggleViewSize.small:
        return const Size(80, 32);
      case DSToggleViewSize.medium:
        return const Size(100, 40);
      case DSToggleViewSize.large:
        return const Size(120, 48);
    }
  }

  /// Get padding based on toggle view size
  static EdgeInsets getPadding(DSToggleViewSize size) {
    switch (size) {
      case DSToggleViewSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case DSToggleViewSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case DSToggleViewSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  /// Get icon size based on toggle view size
  static double getIconSize(DSToggleViewSize size) {
    switch (size) {
      case DSToggleViewSize.small:
        return 16;
      case DSToggleViewSize.medium:
        return 18;
      case DSToggleViewSize.large:
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
  static int calculateOptimalCrossAxisCount(
      double availableWidth, double itemWidth) {
    if (availableWidth <= 0 || itemWidth <= 0) return 2;
    return (availableWidth / itemWidth).floor().clamp(1, 6);
  }

  /// Validate toggle view data
  static bool validateData(DSToggleViewData data) {
    // Check if all selected values exist in options
    final optionIds = data.options.map((option) => option.id).toSet();
    return data.selectedValues.every((value) => optionIds.contains(value));
  }
}
