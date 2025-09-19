import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_drawer_config.freezed.dart';

enum DSDrawerVariant { modal, permanent }
enum DSDrawerSide { left, right }
enum DSDrawerState {
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
class DSDrawerConfig with _$DSDrawerConfig {
  const factory DSDrawerConfig({
    @Default(DSDrawerVariant.modal) DSDrawerVariant variant,
    @Default(DSDrawerSide.left) DSDrawerSide side,
    @Default(DSDrawerState.defaultState) DSDrawerState state,
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
    DSDrawerColors? colors,
    DSDrawerSpacing? spacing,
    DSDrawerHeader? header,
    DSDrawerFooter? footer,
    DSDrawerAccessibility? accessibility,
    DSDrawerBreakpoints? breakpoints,
  }) = _DSDrawerConfig;
}

@freezed
class DSDrawerColors with _$DSDrawerColors {
  const factory DSDrawerColors({
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
  }) = _DSDrawerColors;
}

@freezed
class DSDrawerSpacing with _$DSDrawerSpacing {
  const factory DSDrawerSpacing({
    @Default(EdgeInsets.all(16.0)) EdgeInsets padding,
    @Default(EdgeInsets.symmetric(vertical: 8.0)) EdgeInsets itemPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)) EdgeInsets itemContentPadding,
    @Default(8.0) double itemSpacing,
    @Default(16.0) double sectionSpacing,
    @Default(24.0) double headerHeight,
    @Default(56.0) double footerHeight,
    @Default(BorderRadius.zero) BorderRadius borderRadius,
    @Default(BorderRadius.all(Radius.circular(8.0))) BorderRadius itemBorderRadius,
  }) = _DSDrawerSpacing;
}

@freezed
class DSDrawerHeader with _$DSDrawerHeader {
  const factory DSDrawerHeader({
    Widget? content,
    Color? backgroundColor,
    EdgeInsets? padding,
    double? height,
    bool? showDivider,
  }) = _DSDrawerHeader;
}

@freezed
class DSDrawerFooter with _$DSDrawerFooter {
  const factory DSDrawerFooter({
    Widget? content,
    Color? backgroundColor,
    EdgeInsets? padding,
    double? height,
    bool? showDivider,
  }) = _DSDrawerFooter;
}

@freezed
class DSDrawerAccessibility with _$DSDrawerAccessibility {
  const factory DSDrawerAccessibility({
    @Default('Navigation drawer') String semanticLabel,
    @Default('Close drawer') String closeButtonLabel,
    @Default('Open drawer') String openButtonLabel,
    @Default(true) bool isModal,
    @Default(true) bool excludeFromSemantics,
    @Default(true) bool enableTraversalOrder,
    int? sortKey,
    FocusNode? focusNode,
  }) = _DSDrawerAccessibility;
}

@freezed
class DSDrawerBreakpoints with _$DSDrawerBreakpoints {
  const factory DSDrawerBreakpoints({
    @Default(600.0) double mobileBreakpoint,
    @Default(840.0) double tabletBreakpoint,
    @Default(1200.0) double desktopBreakpoint,
    @Default(true) bool autoSwitchVariant,
    @Default(DSDrawerVariant.modal) DSDrawerVariant mobileVariant,
    @Default(DSDrawerVariant.modal) DSDrawerVariant tabletVariant,
    @Default(DSDrawerVariant.permanent) DSDrawerVariant desktopVariant,
  }) = _DSDrawerBreakpoints;
}

@freezed
class DSDrawerItem with _$DSDrawerItem {
  const factory DSDrawerItem({
    required String id,
    required String label,
    IconData? icon,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    @Default(false) bool selected,
    @Default(false) bool disabled,
    @Default(false) bool showDivider,
    List<DSDrawerItem>? children,
    @Default(0) int level,
  }) = _DSDrawerItem;
}

@freezed
class DSDrawerSection with _$DSDrawerSection {
  const factory DSDrawerSection({
    String? title,
    required List<DSDrawerItem> items,
    @Default(true) bool showDivider,
    Widget? customWidget,
  }) = _DSDrawerSection;
}