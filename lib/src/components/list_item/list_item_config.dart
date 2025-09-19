import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_item_config.freezed.dart';

/// List item variant types
enum DSListItemVariant {
  /// Single line list item
  oneLine,

  /// Two line list item with subtitle
  twoLine,

  /// Three line list item with extended content
  threeLine,
}

/// List item state types
enum DSListItemState {
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

/// Leading widget types
enum DSListItemLeadingType {
  /// No leading widget
  none,

  /// Icon leading
  icon,

  /// Avatar leading
  avatar,

  /// Image leading
  image,

  /// Checkbox leading
  checkbox,

  /// Radio button leading
  radio,

  /// Custom widget leading
  custom,
}

/// Trailing widget types
enum DSListItemTrailingType {
  /// No trailing widget
  none,

  /// Icon trailing
  icon,

  /// Text trailing
  text,

  /// Switch trailing
  switchWidget,

  /// Checkbox trailing
  checkbox,

  /// Radio button trailing
  radio,

  /// Custom widget trailing
  custom,
}

/// Swipe action direction
enum DSListItemSwipeDirection {
  /// Start to end swipe (left to right in LTR)
  startToEnd,

  /// End to start swipe (right to left in LTR)
  endToStart,

  /// Both directions
  both,
}

/// Swipe action position
enum DSListItemSwipeActionPosition {
  /// Leading position (start side)
  leading,

  /// Trailing position (end side)
  trailing,
}

/// Density options for the list item
enum DSListItemDensity {
  compact,
  standard,
  comfortable,
}

/// Content alignment options
enum DSListItemContentAlignment {
  top,
  center,
  bottom,
}

/// Leading widget configuration
@freezed
class DSListItemLeading with _$DSListItemLeading {
  const DSListItemLeading._();

  const factory DSListItemLeading({
    /// Leading type
    @Default(DSListItemLeadingType.none) DSListItemLeadingType type,

    /// Icon data for icon type
    IconData? icon,

    /// Icon size
    @Default(24.0) double iconSize,

    /// Icon color
    Color? iconColor,

    /// Avatar image provider for avatar type
    ImageProvider? avatarImage,

    /// Avatar radius
    @Default(20.0) double avatarRadius,

    /// Avatar background color
    Color? avatarBackgroundColor,

    /// Avatar text for text avatars
    String? avatarText,

    /// Image provider for image type
    ImageProvider? image,

    /// Image width
    @Default(40.0) double imageWidth,

    /// Image height
    @Default(40.0) double imageHeight,

    /// Image border radius
    @Default(4.0) double imageBorderRadius,

    /// Checkbox value for checkbox type
    bool? checkboxValue,

    /// Radio value for radio type
    bool? radioValue,

    /// Custom widget for custom type
    Widget? customWidget,

    /// Whether the leading is enabled
    @Default(true) bool enabled,

    /// Leading widget padding
    @Default(EdgeInsets.zero) EdgeInsets padding,

    /// Leading widget margin
    @Default(EdgeInsets.only(right: 16)) EdgeInsets margin,

    /// Leading widget constraints
    BoxConstraints? constraints,

    /// Accessibility label
    String? semanticLabel,

    /// Custom tap handler for interactive leading
    VoidCallback? onTap,

    /// Custom data
    Map<String, dynamic>? customData,
  }) = _AppListItemLeading;

  /// Whether the leading has interactive content
  bool get isInteractive =>
      onTap != null ||
      type == DSListItemLeadingType.checkbox ||
      type == DSListItemLeadingType.radio;

  /// Get the effective margin for RTL layouts
  EdgeInsets getEffectiveMargin(TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      return EdgeInsets.only(
        left: margin.right,
        right: margin.left,
        top: margin.top,
        bottom: margin.bottom,
      );
    }
    return margin;
  }
}

/// Trailing widget configuration
@freezed
class DSListItemTrailing with _$DSListItemTrailing {
  const DSListItemTrailing._();

  const factory DSListItemTrailing({
    /// Trailing type
    @Default(DSListItemTrailingType.none) DSListItemTrailingType type,

    /// Icon data for icon type
    IconData? icon,

    /// Icon size
    @Default(24.0) double iconSize,

    /// Icon color
    Color? iconColor,

    /// Text for text type
    String? text,

    /// Text style
    TextStyle? textStyle,

    /// Switch value for switch type
    bool? switchValue,

    /// Checkbox value for checkbox type
    bool? checkboxValue,

    /// Radio value for radio type
    bool? radioValue,

    /// Custom widget for custom type
    Widget? customWidget,

    /// Whether the trailing is enabled
    @Default(true) bool enabled,

    /// Trailing widget padding
    @Default(EdgeInsets.zero) EdgeInsets padding,

    /// Trailing widget margin
    @Default(EdgeInsets.only(left: 16)) EdgeInsets margin,

    /// Trailing widget constraints
    BoxConstraints? constraints,

    /// Accessibility label
    String? semanticLabel,

    /// Custom tap handler for interactive trailing
    VoidCallback? onTap,

    /// Switch change handler
    ValueChanged<bool>? onSwitchChanged,

    /// Checkbox change handler
    ValueChanged<bool?>? onCheckboxChanged,

    /// Radio change handler
    ValueChanged<bool>? onRadioChanged,

    /// Custom data
    Map<String, dynamic>? customData,
  }) = _AppListItemTrailing;

  /// Whether the trailing has interactive content
  bool get isInteractive =>
      onTap != null ||
      onSwitchChanged != null ||
      onCheckboxChanged != null ||
      onRadioChanged != null ||
      type == DSListItemTrailingType.switchWidget ||
      type == DSListItemTrailingType.checkbox ||
      type == DSListItemTrailingType.radio;

  /// Get the effective margin for RTL layouts
  EdgeInsets getEffectiveMargin(TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      return EdgeInsets.only(
        left: margin.right,
        right: margin.left,
        top: margin.top,
        bottom: margin.bottom,
      );
    }
    return margin;
  }
}

/// Swipe action configuration
@freezed
class DSListItemSwipeAction with _$DSListItemSwipeAction {
  const factory DSListItemSwipeAction({
    /// Action key
    required String key,

    /// Action label
    required String label,

    /// Action icon
    IconData? icon,

    /// Action color
    Color? color,

    /// Background color
    Color? backgroundColor,

    /// Action callback
    VoidCallback? onPressed,

    /// Whether this is a destructive action
    @Default(false) bool isDestructive,

    /// Action width
    @Default(80.0) double width,

    /// Action position
    @Default(DSListItemSwipeActionPosition.trailing)
    DSListItemSwipeActionPosition position,

    /// Accessibility label
    String? semanticLabel,

    /// Custom data
    Map<String, dynamic>? customData,
  }) = _AppListItemSwipeAction;
}

/// Swipe actions configuration
@freezed
class DSListItemSwipeActions with _$DSListItemSwipeActions {
  const DSListItemSwipeActions._();

  const factory DSListItemSwipeActions({
    /// Leading swipe actions (start side)
    @Default([]) List<DSListItemSwipeAction> leading,

    /// Trailing swipe actions (end side)
    @Default([]) List<DSListItemSwipeAction> trailing,

    /// Swipe direction
    @Default(DSListItemSwipeDirection.both)
    DSListItemSwipeDirection direction,

    /// Whether swipe is enabled
    @Default(true) bool enabled,

    /// Swipe threshold
    @Default(0.5) double threshold,

    /// Whether to dismiss on swipe
    @Default(false) bool dismissible,

    /// Dismiss callback
    VoidCallback? onDismiss,

    /// Custom data
    Map<String, dynamic>? customData,
  }) = _AppListItemSwipeActions;

  /// Whether there are any swipe actions
  bool get hasActions => leading.isNotEmpty || trailing.isNotEmpty;

  /// Whether leading actions are available
  bool get hasLeadingActions => leading.isNotEmpty;

  /// Whether trailing actions are available
  bool get hasTrailingActions => trailing.isNotEmpty;
}

/// List item theme configuration
@freezed
class DSListItemTheme with _$DSListItemTheme {
  const factory DSListItemTheme({
    /// Default background color
    Color? backgroundColor,

    /// Hover background color
    Color? hoverColor,

    /// Pressed background color
    Color? pressedColor,

    /// Focus background color
    Color? focusColor,

    /// Selected background color
    Color? selectedColor,

    /// Disabled background color
    Color? disabledColor,

    /// Text color
    Color? textColor,

    /// Subtitle text color
    Color? subtitleColor,

    /// Disabled text color
    Color? disabledTextColor,

    /// Border color
    Color? borderColor,

    /// Divider color
    Color? dividerColor,

    /// Shadow color
    Color? shadowColor,

    /// Elevation
    @Default(0.0) double elevation,

    /// Border radius
    @Default(0.0) double borderRadius,

    /// Border width
    @Default(0.0) double borderWidth,

    /// Splash color
    Color? splashColor,

    /// Highlight color
    Color? highlightColor,

    /// Loading indicator color
    Color? loadingColor,

    /// Skeleton base color
    Color? skeletonBaseColor,

    /// Skeleton highlight color
    Color? skeletonHighlightColor,

    /// Custom properties
    Map<String, dynamic>? customProperties,
  }) = _AppListItemTheme;
}

/// List item style configuration
@freezed
class DSListItemStyle with _$DSListItemStyle {
  const DSListItemStyle._();

  const factory DSListItemStyle({
    /// Content padding
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 8))
    EdgeInsets contentPadding,

    /// Minimum height
    double? minHeight,

    /// Maximum height
    double? maxHeight,

    /// Title text style
    TextStyle? titleStyle,

    /// Subtitle text style
    TextStyle? subtitleStyle,

    /// Leading-title spacing
    @Default(16.0) double leadingTitleSpacing,

    /// Title-trailing spacing
    @Default(16.0) double titleTrailingSpacing,

    /// Title-subtitle spacing
    @Default(4.0) double titleSubtitleSpacing,

    /// Content alignment
    @Default(DSListItemContentAlignment.center)
    DSListItemContentAlignment contentAlignment,

    /// Dense layout
    @Default(false) bool dense,

    /// Visual density
    VisualDensity? visualDensity,

    /// Material type
    @Default(MaterialType.transparency) MaterialType materialType,

    /// Clip behavior
    @Default(Clip.none) Clip clipBehavior,

    /// Animation duration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,

    /// Animation curve
    @Default(Curves.easeInOut) Curve animationCurve,

    /// Custom properties
    Map<String, dynamic>? customProperties,
  }) = _AppListItemStyle;

  /// Get content padding for the given density
  EdgeInsets getContentPaddingForDensity(DSListItemDensity density) {
    switch (density) {
      case DSListItemDensity.compact:
        return EdgeInsets.symmetric(
          horizontal: contentPadding.horizontal,
          vertical: contentPadding.vertical * 0.5,
        );
      case DSListItemDensity.comfortable:
        return EdgeInsets.symmetric(
          horizontal: contentPadding.horizontal,
          vertical: contentPadding.vertical * 1.5,
        );
      case DSListItemDensity.standard:
        return contentPadding;
    }
  }

  /// Get minimum height for the given variant and density
  double getMinHeightForVariant(
      DSListItemVariant variant, DSListItemDensity density) {
    final baseHeight = switch (variant) {
      DSListItemVariant.oneLine => 48.0,
      DSListItemVariant.twoLine => 64.0,
      DSListItemVariant.threeLine => 88.0,
    };

    return switch (density) {
      DSListItemDensity.compact => baseHeight * 0.8,
      DSListItemDensity.comfortable => baseHeight * 1.2,
      DSListItemDensity.standard => baseHeight,
    };
  }
}

/// Main list item configuration
@freezed
class DSListItemConfig with _$DSListItemConfig {
  const DSListItemConfig._();

  const factory DSListItemConfig({
    /// List item variant
    @Default(DSListItemVariant.oneLine) DSListItemVariant variant,

    /// Current state
    @Default(DSListItemState.defaultState) DSListItemState state,

    /// Leading configuration
    DSListItemLeading? leading,

    /// Trailing configuration
    DSListItemTrailing? trailing,

    /// Swipe actions configuration
    DSListItemSwipeActions? swipeActions,

    /// Theme configuration
    DSListItemTheme? theme,

    /// Style configuration
    DSListItemStyle? style,

    /// Density
    @Default(DSListItemDensity.standard) DSListItemDensity density,

    /// Whether the item is enabled
    @Default(true) bool enabled,

    /// Whether the item is selected
    @Default(false) bool selected,

    /// Whether the item is loading
    @Default(false) bool loading,

    /// Whether to show skeleton
    @Default(false) bool skeleton,

    /// Whether to show divider
    @Default(false) bool showDivider,

    /// Whether to auto-focus
    @Default(false) bool autofocus,

    /// Focus node
    FocusNode? focusNode,

    /// Keyboard shortcuts
    Map<ShortcutActivator, VoidCallback>? shortcuts,

    /// Accessibility configuration
    String? semanticLabel,

    /// Whether this item is a header
    @Default(false) bool isHeader,

    /// Whether keyboard navigation is enabled
    @Default(true) bool keyboardNavigation,

    /// Platform adaptive behavior
    @Default(true) bool platformAdaptive,

    /// Custom data
    Map<String, dynamic>? customData,
  }) = _DSListItemConfig;

  /// Whether the item is interactive
  bool get isInteractive => enabled && !loading && !skeleton;

  /// Whether the item shows loading state
  bool get isLoading => loading || state == DSListItemState.loading;

  /// Whether the item shows skeleton state
  bool get isSkeleton => skeleton || state == DSListItemState.skeleton;

  /// Whether the item is in a pressed state
  bool get isPressed => state == DSListItemState.pressed;

  /// Whether the item is in a hover state
  bool get isHovered => state == DSListItemState.hover;

  /// Whether the item is focused
  bool get isFocused => state == DSListItemState.focus;

  /// Whether the item is in a disabled state
  bool get isDisabled => !enabled || state == DSListItemState.disabled;

  /// Get the effective state considering loading and skeleton
  DSListItemState get effectiveState {
    if (isSkeleton) return DSListItemState.skeleton;
    if (isLoading) return DSListItemState.loading;
    if (isDisabled) return DSListItemState.disabled;
    if (selected) return DSListItemState.selected;
    return state;
  }
}

/// Callback type definitions
typedef DSListItemTapCallback = void Function();
typedef DSListItemLongPressCallback = void Function();
typedef DSListItemFocusCallback = void Function(bool focused);
typedef DSListItemHoverCallback = void Function(bool hovered);
typedef DSListItemStateChangeCallback = void Function(DSListItemState state);

/// Builder type definitions
typedef DSListItemLeadingBuilder = Widget Function(
  BuildContext context,
  DSListItemLeading leading,
  DSListItemState state,
);

typedef DSListItemTrailingBuilder = Widget Function(
  BuildContext context,
  DSListItemTrailing trailing,
  DSListItemState state,
);

typedef DSListItemTitleBuilder = Widget Function(
  BuildContext context,
  String title,
  DSListItemState state,
);

typedef DSListItemSubtitleBuilder = Widget Function(
  BuildContext context,
  String subtitle,
  DSListItemState state,
);

/// Utility extensions
extension DSListItemVariantExtension on DSListItemVariant {
  /// Get the maximum number of lines for this variant
  int get maxLines {
    switch (this) {
      case DSListItemVariant.oneLine:
        return 1;
      case DSListItemVariant.twoLine:
        return 2;
      case DSListItemVariant.threeLine:
        return 3;
    }
  }

  /// Whether this variant supports subtitle
  bool get supportsSubtitle {
    return this != DSListItemVariant.oneLine;
  }

  /// Get the default height for this variant
  double get defaultHeight {
    switch (this) {
      case DSListItemVariant.oneLine:
        return 48.0;
      case DSListItemVariant.twoLine:
        return 64.0;
      case DSListItemVariant.threeLine:
        return 88.0;
    }
  }
}

extension DSListItemStateExtension on DSListItemState {
  /// Whether this state is interactive
  bool get isInteractive {
    return this != DSListItemState.disabled &&
        this != DSListItemState.loading &&
        this != DSListItemState.skeleton;
  }

  /// Whether this state shows visual feedback
  bool get hasVisualFeedback {
    return this == DSListItemState.hover ||
        this == DSListItemState.pressed ||
        this == DSListItemState.focus ||
        this == DSListItemState.selected;
  }

  /// Whether this state is temporary
  bool get isTemporary {
    return this == DSListItemState.hover ||
        this == DSListItemState.pressed ||
        this == DSListItemState.focus;
  }
}
