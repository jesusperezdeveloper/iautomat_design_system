import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_list_config.freezed.dart';

@freezed
class DSDescriptionListConfig with _$DSDescriptionListConfig {
  const DSDescriptionListConfig._();

  const factory DSDescriptionListConfig({
    @Default(DSDescriptionListVariant.responsive)
    DSDescriptionListVariant variant,
    @Default(DSDescriptionListState.defaultState)
    DSDescriptionListState state,
    @Default(DSDescriptionListLayout.vertical) DSDescriptionListLayout layout,
    @Default(DSDescriptionListDensity.normal)
    DSDescriptionListDensity density,
    @Default(DSDescriptionListSpacing.normal)
    DSDescriptionListSpacing spacing,
    @Default(DSDescriptionListAlignment.start)
    DSDescriptionListAlignment alignment,
    @Default([]) List<DSDescriptionListItem> items,
    DSDescriptionListStyle? style,
    DSDescriptionListInteraction? interaction,
    DSDescriptionListAccessibility? accessibility,
    DSDescriptionListAnimation? animation,
    DSDescriptionListResponsive? responsive,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
  }) = _DSDescriptionListConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == DSDescriptionListState.disabled;
  bool get isLoading => loading || state == DSDescriptionListState.loading;
  bool get isSkeleton => skeleton || state == DSDescriptionListState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
}

@freezed
class DSDescriptionListItem with _$DSDescriptionListItem {
  const DSDescriptionListItem._();

  const factory DSDescriptionListItem({
    required String term,
    required String description,
    String? secondaryDescription,
    Widget? termWidget,
    Widget? descriptionWidget,
    Widget? leading,
    Widget? trailing,
    IconData? icon,
    Color? iconColor,
    DSDescriptionListItemStyle? style,
    DSDescriptionListItemState? state,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool highlighted,
    @Default(false) bool divider,
  }) = _DSDescriptionListItem;

  bool get hasSecondaryDescription =>
      secondaryDescription != null && secondaryDescription!.isNotEmpty;
  bool get hasCustomTermWidget => termWidget != null;
  bool get hasCustomDescriptionWidget => descriptionWidget != null;
  bool get hasIcon => icon != null;
  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isDisabled =>
      !enabled || state == DSDescriptionListItemState.disabled;
  bool get canInteract => isInteractive && !isDisabled;
}

enum DSDescriptionListVariant {
  responsive,
}

enum DSDescriptionListState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSDescriptionListLayout {
  vertical,
  horizontal,
  grid,
  adaptive,
}

enum DSDescriptionListDensity {
  compact,
  normal,
  comfortable,
}

enum DSDescriptionListSpacing {
  none,
  small,
  normal,
  large,
}

enum DSDescriptionListAlignment {
  start,
  center,
  end,
  justify,
}

enum DSDescriptionListItemState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
}

@freezed
class DSDescriptionListStyle with _$DSDescriptionListStyle {
  const DSDescriptionListStyle._();

  const factory DSDescriptionListStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    double? borderWidth,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    TextStyle? termTextStyle,
    TextStyle? descriptionTextStyle,
    TextStyle? secondaryDescriptionTextStyle,
    DSDescriptionListItemStyle? itemStyle,
    DSDescriptionListDividerStyle? dividerStyle,
  }) = _DSDescriptionListStyle;

  DSDescriptionListStyle copyWithState(DSDescriptionListState state) {
    switch (state) {
      case DSDescriptionListState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
        );
      case DSDescriptionListState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
        );
      case DSDescriptionListState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSDescriptionListState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSDescriptionListState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSDescriptionListState.loading:
      case DSDescriptionListState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSDescriptionListItemStyle with _$DSDescriptionListItemStyle {
  const DSDescriptionListItemStyle._();

  const factory DSDescriptionListItemStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? highlightColor,
    double? borderWidth,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    TextStyle? termTextStyle,
    TextStyle? descriptionTextStyle,
    TextStyle? secondaryDescriptionTextStyle,
    double? iconSize,
    Color? iconColor,
    double? spacing,
    double? termWidth,
    double? descriptionWidth,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
  }) = _DSDescriptionListItemStyle;

  DSDescriptionListItemStyle copyWithState(DSDescriptionListItemState state,
      {bool highlighted = false}) {
    switch (state) {
      case DSDescriptionListItemState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          backgroundColor: highlighted
              ? highlightColor?.withValues(alpha: 0.08)
              : backgroundColor,
        );
      case DSDescriptionListItemState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          backgroundColor: highlighted
              ? highlightColor?.withValues(alpha: 0.12)
              : backgroundColor,
        );
      case DSDescriptionListItemState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSDescriptionListItemState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSDescriptionListItemState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          iconColor: iconColor?.withValues(alpha: 0.38),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSDescriptionListDividerStyle with _$DSDescriptionListDividerStyle {
  const factory DSDescriptionListDividerStyle({
    Color? color,
    double? thickness,
    double? height,
    double? indent,
    double? endIndent,
  }) = _DSDescriptionListDividerStyle;
}

@freezed
class DSDescriptionListInteraction with _$DSDescriptionListInteraction {
  const factory DSDescriptionListInteraction({
    @Default(true) bool enabled,
    @Default(true) bool focusable,
    @Default(true) bool hoverable,
    @Default(false) bool autofocus,
    @Default(false) bool excludeFromSemantics,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    GestureTapCallback? onSecondaryTap,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _DSDescriptionListInteraction;
}

@freezed
class DSDescriptionListAccessibility with _$DSDescriptionListAccessibility {
  const factory DSDescriptionListAccessibility({
    String? semanticLabel,
    String? tooltip,
    bool? excludeSemantics,
    bool? obscureText,
    String? onTapHint,
    String? onLongPressHint,
    @Default(false) bool sortKey,
    @Default(false) bool liveRegion,
    @Default(false) bool focusable,
    @Default(false) bool button,
    @Default(false) bool link,
    @Default(false) bool header,
    @Default(false) bool textField,
    @Default(false) bool readOnly,
    @Default(false) bool keyboardKey,
  }) = _DSDescriptionListAccessibility;
}

@freezed
class DSDescriptionListAnimation with _$DSDescriptionListAnimation {
  const factory DSDescriptionListAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSDescriptionListAnimationType.fade)
    DSDescriptionListAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
  }) = _DSDescriptionListAnimation;
}

enum DSDescriptionListAnimationType {
  none,
  fade,
  slide,
  scale,
  rotation,
}

@freezed
class DSDescriptionListResponsive with _$DSDescriptionListResponsive {
  const DSDescriptionListResponsive._();

  const factory DSDescriptionListResponsive({
    @Default(600) double mobileBreakpoint,
    @Default(900) double tabletBreakpoint,
    @Default(1200) double desktopBreakpoint,
    DSDescriptionListLayout? mobileLayout,
    DSDescriptionListLayout? tabletLayout,
    DSDescriptionListLayout? desktopLayout,
    DSDescriptionListDensity? mobileDensity,
    DSDescriptionListDensity? tabletDensity,
    DSDescriptionListDensity? desktopDensity,
    DSDescriptionListSpacing? mobileSpacing,
    DSDescriptionListSpacing? tabletSpacing,
    DSDescriptionListSpacing? desktopSpacing,
    int? mobileColumns,
    int? tabletColumns,
    int? desktopColumns,
    double? mobileTermWidth,
    double? tabletTermWidth,
    double? desktopTermWidth,
  }) = _DSDescriptionListResponsive;

  DSDescriptionListLayout getLayoutForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileLayout ?? DSDescriptionListLayout.vertical;
    } else if (width < tabletBreakpoint) {
      return tabletLayout ?? DSDescriptionListLayout.horizontal;
    } else {
      return desktopLayout ?? DSDescriptionListLayout.horizontal;
    }
  }

  DSDescriptionListDensity getDensityForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileDensity ?? DSDescriptionListDensity.compact;
    } else if (width < tabletBreakpoint) {
      return tabletDensity ?? DSDescriptionListDensity.normal;
    } else {
      return desktopDensity ?? DSDescriptionListDensity.comfortable;
    }
  }

  DSDescriptionListSpacing getSpacingForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileSpacing ?? DSDescriptionListSpacing.small;
    } else if (width < tabletBreakpoint) {
      return tabletSpacing ?? DSDescriptionListSpacing.normal;
    } else {
      return desktopSpacing ?? DSDescriptionListSpacing.large;
    }
  }

  int getColumnsForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileColumns ?? 1;
    } else if (width < tabletBreakpoint) {
      return tabletColumns ?? 2;
    } else {
      return desktopColumns ?? 3;
    }
  }

  double? getTermWidthForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileTermWidth;
    } else if (width < tabletBreakpoint) {
      return tabletTermWidth;
    } else {
      return desktopTermWidth;
    }
  }
}

extension DSDescriptionListStateExtension on DSDescriptionListState {
  bool get isInteractiveState =>
      this == DSDescriptionListState.hover ||
      this == DSDescriptionListState.pressed ||
      this == DSDescriptionListState.focus;

  bool get isDisabledState => this == DSDescriptionListState.disabled;
  bool get isLoadingState => this == DSDescriptionListState.loading;
  bool get isSkeletonState => this == DSDescriptionListState.skeleton;
  bool get isSelectedState => this == DSDescriptionListState.selected;
}

extension DSDescriptionListLayoutExtension on DSDescriptionListLayout {
  bool get isVertical => this == DSDescriptionListLayout.vertical;
  bool get isHorizontal => this == DSDescriptionListLayout.horizontal;
  bool get isGrid => this == DSDescriptionListLayout.grid;
  bool get isAdaptive => this == DSDescriptionListLayout.adaptive;
}

extension DSDescriptionListDensityExtension on DSDescriptionListDensity {
  double get verticalSpacing {
    switch (this) {
      case DSDescriptionListDensity.compact:
        return 8.0;
      case DSDescriptionListDensity.normal:
        return 12.0;
      case DSDescriptionListDensity.comfortable:
        return 16.0;
    }
  }

  double get horizontalSpacing {
    switch (this) {
      case DSDescriptionListDensity.compact:
        return 12.0;
      case DSDescriptionListDensity.normal:
        return 16.0;
      case DSDescriptionListDensity.comfortable:
        return 24.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSDescriptionListDensity.compact:
        return const EdgeInsets.all(8.0);
      case DSDescriptionListDensity.normal:
        return const EdgeInsets.all(12.0);
      case DSDescriptionListDensity.comfortable:
        return const EdgeInsets.all(16.0);
    }
  }
}

extension DSDescriptionListSpacingExtension on DSDescriptionListSpacing {
  double get value {
    switch (this) {
      case DSDescriptionListSpacing.none:
        return 0.0;
      case DSDescriptionListSpacing.small:
        return 8.0;
      case DSDescriptionListSpacing.normal:
        return 16.0;
      case DSDescriptionListSpacing.large:
        return 24.0;
    }
  }
}

class DSDescriptionListConstants {
  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 2.0;
  static const double defaultBorderWidth = 1.0;
  static const double defaultIconSize = 24.0;
  static const double defaultTermWidth = 120.0;
  static const double defaultDividerThickness = 1.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry defaultItemPadding =
      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: 0.0,
    maxWidth: double.infinity,
    minHeight: 0.0,
    maxHeight: double.infinity,
  );
}
