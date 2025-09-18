import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_list_config.freezed.dart';

@freezed
class AppDescriptionListConfig with _$AppDescriptionListConfig {
  const AppDescriptionListConfig._();

  const factory AppDescriptionListConfig({
    @Default(AppDescriptionListVariant.responsive)
    AppDescriptionListVariant variant,
    @Default(AppDescriptionListState.defaultState)
    AppDescriptionListState state,
    @Default(AppDescriptionListLayout.vertical) AppDescriptionListLayout layout,
    @Default(AppDescriptionListDensity.normal)
    AppDescriptionListDensity density,
    @Default(AppDescriptionListSpacing.normal)
    AppDescriptionListSpacing spacing,
    @Default(AppDescriptionListAlignment.start)
    AppDescriptionListAlignment alignment,
    @Default([]) List<AppDescriptionListItem> items,
    AppDescriptionListStyle? style,
    AppDescriptionListInteraction? interaction,
    AppDescriptionListAccessibility? accessibility,
    AppDescriptionListAnimation? animation,
    AppDescriptionListResponsive? responsive,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
  }) = _AppDescriptionListConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == AppDescriptionListState.disabled;
  bool get isLoading => loading || state == AppDescriptionListState.loading;
  bool get isSkeleton => skeleton || state == AppDescriptionListState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
}

@freezed
class AppDescriptionListItem with _$AppDescriptionListItem {
  const AppDescriptionListItem._();

  const factory AppDescriptionListItem({
    required String term,
    required String description,
    String? secondaryDescription,
    Widget? termWidget,
    Widget? descriptionWidget,
    Widget? leading,
    Widget? trailing,
    IconData? icon,
    Color? iconColor,
    AppDescriptionListItemStyle? style,
    AppDescriptionListItemState? state,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool highlighted,
    @Default(false) bool divider,
  }) = _AppDescriptionListItem;

  bool get hasSecondaryDescription =>
      secondaryDescription != null && secondaryDescription!.isNotEmpty;
  bool get hasCustomTermWidget => termWidget != null;
  bool get hasCustomDescriptionWidget => descriptionWidget != null;
  bool get hasIcon => icon != null;
  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isDisabled =>
      !enabled || state == AppDescriptionListItemState.disabled;
  bool get canInteract => isInteractive && !isDisabled;
}

enum AppDescriptionListVariant {
  responsive,
}

enum AppDescriptionListState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppDescriptionListLayout {
  vertical,
  horizontal,
  grid,
  adaptive,
}

enum AppDescriptionListDensity {
  compact,
  normal,
  comfortable,
}

enum AppDescriptionListSpacing {
  none,
  small,
  normal,
  large,
}

enum AppDescriptionListAlignment {
  start,
  center,
  end,
  justify,
}

enum AppDescriptionListItemState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
}

@freezed
class AppDescriptionListStyle with _$AppDescriptionListStyle {
  const AppDescriptionListStyle._();

  const factory AppDescriptionListStyle({
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
    AppDescriptionListItemStyle? itemStyle,
    AppDescriptionListDividerStyle? dividerStyle,
  }) = _AppDescriptionListStyle;

  AppDescriptionListStyle copyWithState(AppDescriptionListState state) {
    switch (state) {
      case AppDescriptionListState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
        );
      case AppDescriptionListState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
        );
      case AppDescriptionListState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppDescriptionListState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppDescriptionListState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppDescriptionListState.loading:
      case AppDescriptionListState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppDescriptionListItemStyle with _$AppDescriptionListItemStyle {
  const AppDescriptionListItemStyle._();

  const factory AppDescriptionListItemStyle({
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
  }) = _AppDescriptionListItemStyle;

  AppDescriptionListItemStyle copyWithState(AppDescriptionListItemState state,
      {bool highlighted = false}) {
    switch (state) {
      case AppDescriptionListItemState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          backgroundColor: highlighted
              ? highlightColor?.withValues(alpha: 0.08)
              : backgroundColor,
        );
      case AppDescriptionListItemState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          backgroundColor: highlighted
              ? highlightColor?.withValues(alpha: 0.12)
              : backgroundColor,
        );
      case AppDescriptionListItemState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppDescriptionListItemState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppDescriptionListItemState.disabled:
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
class AppDescriptionListDividerStyle with _$AppDescriptionListDividerStyle {
  const factory AppDescriptionListDividerStyle({
    Color? color,
    double? thickness,
    double? height,
    double? indent,
    double? endIndent,
  }) = _AppDescriptionListDividerStyle;
}

@freezed
class AppDescriptionListInteraction with _$AppDescriptionListInteraction {
  const factory AppDescriptionListInteraction({
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
  }) = _AppDescriptionListInteraction;
}

@freezed
class AppDescriptionListAccessibility with _$AppDescriptionListAccessibility {
  const factory AppDescriptionListAccessibility({
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
  }) = _AppDescriptionListAccessibility;
}

@freezed
class AppDescriptionListAnimation with _$AppDescriptionListAnimation {
  const factory AppDescriptionListAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppDescriptionListAnimationType.fade)
    AppDescriptionListAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
  }) = _AppDescriptionListAnimation;
}

enum AppDescriptionListAnimationType {
  none,
  fade,
  slide,
  scale,
  rotation,
}

@freezed
class AppDescriptionListResponsive with _$AppDescriptionListResponsive {
  const AppDescriptionListResponsive._();

  const factory AppDescriptionListResponsive({
    @Default(600) double mobileBreakpoint,
    @Default(900) double tabletBreakpoint,
    @Default(1200) double desktopBreakpoint,
    AppDescriptionListLayout? mobileLayout,
    AppDescriptionListLayout? tabletLayout,
    AppDescriptionListLayout? desktopLayout,
    AppDescriptionListDensity? mobileDensity,
    AppDescriptionListDensity? tabletDensity,
    AppDescriptionListDensity? desktopDensity,
    AppDescriptionListSpacing? mobileSpacing,
    AppDescriptionListSpacing? tabletSpacing,
    AppDescriptionListSpacing? desktopSpacing,
    int? mobileColumns,
    int? tabletColumns,
    int? desktopColumns,
    double? mobileTermWidth,
    double? tabletTermWidth,
    double? desktopTermWidth,
  }) = _AppDescriptionListResponsive;

  AppDescriptionListLayout getLayoutForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileLayout ?? AppDescriptionListLayout.vertical;
    } else if (width < tabletBreakpoint) {
      return tabletLayout ?? AppDescriptionListLayout.horizontal;
    } else {
      return desktopLayout ?? AppDescriptionListLayout.horizontal;
    }
  }

  AppDescriptionListDensity getDensityForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileDensity ?? AppDescriptionListDensity.compact;
    } else if (width < tabletBreakpoint) {
      return tabletDensity ?? AppDescriptionListDensity.normal;
    } else {
      return desktopDensity ?? AppDescriptionListDensity.comfortable;
    }
  }

  AppDescriptionListSpacing getSpacingForWidth(double width) {
    if (width < mobileBreakpoint) {
      return mobileSpacing ?? AppDescriptionListSpacing.small;
    } else if (width < tabletBreakpoint) {
      return tabletSpacing ?? AppDescriptionListSpacing.normal;
    } else {
      return desktopSpacing ?? AppDescriptionListSpacing.large;
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

extension AppDescriptionListStateExtension on AppDescriptionListState {
  bool get isInteractiveState =>
      this == AppDescriptionListState.hover ||
      this == AppDescriptionListState.pressed ||
      this == AppDescriptionListState.focus;

  bool get isDisabledState => this == AppDescriptionListState.disabled;
  bool get isLoadingState => this == AppDescriptionListState.loading;
  bool get isSkeletonState => this == AppDescriptionListState.skeleton;
  bool get isSelectedState => this == AppDescriptionListState.selected;
}

extension AppDescriptionListLayoutExtension on AppDescriptionListLayout {
  bool get isVertical => this == AppDescriptionListLayout.vertical;
  bool get isHorizontal => this == AppDescriptionListLayout.horizontal;
  bool get isGrid => this == AppDescriptionListLayout.grid;
  bool get isAdaptive => this == AppDescriptionListLayout.adaptive;
}

extension AppDescriptionListDensityExtension on AppDescriptionListDensity {
  double get verticalSpacing {
    switch (this) {
      case AppDescriptionListDensity.compact:
        return 8.0;
      case AppDescriptionListDensity.normal:
        return 12.0;
      case AppDescriptionListDensity.comfortable:
        return 16.0;
    }
  }

  double get horizontalSpacing {
    switch (this) {
      case AppDescriptionListDensity.compact:
        return 12.0;
      case AppDescriptionListDensity.normal:
        return 16.0;
      case AppDescriptionListDensity.comfortable:
        return 24.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppDescriptionListDensity.compact:
        return const EdgeInsets.all(8.0);
      case AppDescriptionListDensity.normal:
        return const EdgeInsets.all(12.0);
      case AppDescriptionListDensity.comfortable:
        return const EdgeInsets.all(16.0);
    }
  }
}

extension AppDescriptionListSpacingExtension on AppDescriptionListSpacing {
  double get value {
    switch (this) {
      case AppDescriptionListSpacing.none:
        return 0.0;
      case AppDescriptionListSpacing.small:
        return 8.0;
      case AppDescriptionListSpacing.normal:
        return 16.0;
      case AppDescriptionListSpacing.large:
        return 24.0;
    }
  }
}

class AppDescriptionListConstants {
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
