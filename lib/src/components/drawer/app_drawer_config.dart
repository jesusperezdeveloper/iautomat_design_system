import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_drawer_config.freezed.dart';

enum AppDrawerVariant { modal, permanent }
enum AppDrawerSide { left, right }
enum AppDrawerState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

@freezed
class AppDrawerConfig with _$AppDrawerConfig {
  const factory AppDrawerConfig({
    @Default(AppDrawerVariant.modal) AppDrawerVariant variant,
    @Default(AppDrawerSide.left) AppDrawerSide side,
    @Default(AppDrawerState.defaultState) AppDrawerState state,
    @Default(280.0) double width,
    @Default(true) bool enableSwipeGesture,
    @Default(true) bool enableOverlay,
    @Default(0.4) double overlayOpacity,
    @Default(Duration(milliseconds: 250)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(true) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool autoFocus,
    @Default(4.0) double elevation,
    AppDrawerColors? colors,
    AppDrawerSpacing? spacing,
    AppDrawerHeader? header,
    AppDrawerFooter? footer,
    AppDrawerAccessibility? accessibility,
    AppDrawerBreakpoints? breakpoints,
  }) = _AppDrawerConfig;
}

@freezed
class AppDrawerColors with _$AppDrawerColors {
  const factory AppDrawerColors({
    Color? backgroundColor,
    Color? surfaceColor,
    Color? overlayColor,
    Color? dividerColor,
    Color? selectedItemColor,
    Color? selectedItemBackgroundColor,
    Color? hoverColor,
    Color? focusColor,
    Color? disabledColor,
    Color? textColor,
    Color? iconColor,
    Color? shadowColor,
  }) = _AppDrawerColors;
}

@freezed
class AppDrawerSpacing with _$AppDrawerSpacing {
  const factory AppDrawerSpacing({
    @Default(EdgeInsets.all(16.0)) EdgeInsets padding,
    @Default(EdgeInsets.symmetric(vertical: 8.0)) EdgeInsets itemPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)) EdgeInsets itemContentPadding,
    @Default(8.0) double itemSpacing,
    @Default(16.0) double sectionSpacing,
    @Default(24.0) double headerHeight,
    @Default(56.0) double footerHeight,
    @Default(BorderRadius.zero) BorderRadius borderRadius,
    @Default(BorderRadius.all(Radius.circular(8.0))) BorderRadius itemBorderRadius,
  }) = _AppDrawerSpacing;
}

@freezed
class AppDrawerHeader with _$AppDrawerHeader {
  const factory AppDrawerHeader({
    Widget? content,
    Color? backgroundColor,
    EdgeInsets? padding,
    double? height,
    bool? showDivider,
  }) = _AppDrawerHeader;
}

@freezed
class AppDrawerFooter with _$AppDrawerFooter {
  const factory AppDrawerFooter({
    Widget? content,
    Color? backgroundColor,
    EdgeInsets? padding,
    double? height,
    bool? showDivider,
  }) = _AppDrawerFooter;
}

@freezed
class AppDrawerAccessibility with _$AppDrawerAccessibility {
  const factory AppDrawerAccessibility({
    @Default('Navigation drawer') String semanticLabel,
    @Default('Close drawer') String closeButtonLabel,
    @Default('Open drawer') String openButtonLabel,
    @Default(true) bool isModal,
    @Default(true) bool excludeFromSemantics,
    @Default(true) bool enableTraversalOrder,
    int? sortKey,
    FocusNode? focusNode,
  }) = _AppDrawerAccessibility;
}

@freezed
class AppDrawerBreakpoints with _$AppDrawerBreakpoints {
  const factory AppDrawerBreakpoints({
    @Default(600.0) double mobileBreakpoint,
    @Default(840.0) double tabletBreakpoint,
    @Default(1200.0) double desktopBreakpoint,
    @Default(true) bool autoSwitchVariant,
    @Default(AppDrawerVariant.modal) AppDrawerVariant mobileVariant,
    @Default(AppDrawerVariant.modal) AppDrawerVariant tabletVariant,
    @Default(AppDrawerVariant.permanent) AppDrawerVariant desktopVariant,
  }) = _AppDrawerBreakpoints;
}

@freezed
class AppDrawerItem with _$AppDrawerItem {
  const factory AppDrawerItem({
    required String id,
    required String label,
    IconData? icon,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    @Default(false) bool selected,
    @Default(false) bool disabled,
    @Default(false) bool showDivider,
    List<AppDrawerItem>? children,
    @Default(0) int level,
  }) = _AppDrawerItem;
}

@freezed
class AppDrawerSection with _$AppDrawerSection {
  const factory AppDrawerSection({
    String? title,
    required List<AppDrawerItem> items,
    @Default(true) bool showDivider,
    Widget? customWidget,
  }) = _AppDrawerSection;
}