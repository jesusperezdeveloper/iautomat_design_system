import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_top_app_bar_config.freezed.dart';

@freezed
class DSTopAppBarConfig with _$DSTopAppBarConfig {
  const factory DSTopAppBarConfig({
    @Default(DSTopAppBarVariant.primary) DSTopAppBarVariant variant,
    @Default(DSTopAppBarState.defaultState) DSTopAppBarState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    DSTopAppBarTitle? title,
    DSTopAppBarActions? actions,
    DSTopAppBarNavigationIcon? navigationIcon,
    DSTopAppBarElevation? elevation,
    DSTopAppBarScrollBehavior? scrollBehavior,
    DSTopAppBarColors? colors,
    DSTopAppBarTypography? typography,
    DSTopAppBarSpacing? spacing,
  }) = _DSTopAppBarConfig;
}

@freezed
class DSTopAppBarTitle with _$DSTopAppBarTitle {
  const factory DSTopAppBarTitle({
    String? text,
    Widget? customWidget,
    @Default(TextAlign.start) TextAlign alignment,
    @Default(true) bool animated,
    @Default(true) bool responsive,
    int? maxLines,
    TextOverflow? overflow,
  }) = _AppTopAppBarTitle;
}

@freezed
class DSTopAppBarActions with _$DSTopAppBarActions {
  const factory DSTopAppBarActions({
    @Default([]) List<DSTopAppBarAction> primary,
    @Default([]) List<DSTopAppBarAction> secondary,
    @Default(3) int maxPrimary,
    @Default(true) bool showOverflow,
    String? overflowTooltip,
    Widget? overflowIcon,
  }) = _AppTopAppBarActions;
}

@freezed
class DSTopAppBarAction with _$DSTopAppBarAction {
  const factory DSTopAppBarAction({
    required String id,
    Widget? icon,
    String? text,
    String? tooltip,
    VoidCallback? onPressed,
    @Default(false) bool disabled,
    @Default(DSTopAppBarActionType.icon) DSTopAppBarActionType type,
    @Default(DSTopAppBarActionPriority.primary)
    DSTopAppBarActionPriority priority,
  }) = _AppTopAppBarAction;
}

@freezed
class DSTopAppBarNavigationIcon with _$DSTopAppBarNavigationIcon {
  const factory DSTopAppBarNavigationIcon({
    Widget? icon,
    String? tooltip,
    VoidCallback? onPressed,
    @Default(DSTopAppBarNavigationType.auto) DSTopAppBarNavigationType type,
    @Default(false) bool disabled,
  }) = _AppTopAppBarNavigationIcon;
}

@freezed
class DSTopAppBarElevation with _$DSTopAppBarElevation {
  const factory DSTopAppBarElevation({
    @Default(4.0) double defaultElevation,
    @Default(8.0) double scrolledElevation,
    @Default(true) bool adaptive,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppTopAppBarElevation;
}

@freezed
class DSTopAppBarScrollBehavior with _$DSTopAppBarScrollBehavior {
  const factory DSTopAppBarScrollBehavior({
    @Default(DSTopAppBarScrollType.pinned) DSTopAppBarScrollType type,
    @Default(true) bool snap,
    @Default(true) bool floating,
    @Default(0.0) double expandedHeight,
    @Default(0.0) double collapsedHeight,
    Widget? flexibleSpace,
    Widget? bottom,
  }) = _AppTopAppBarScrollBehavior;
}

@freezed
class DSTopAppBarColors with _$DSTopAppBarColors {
  const factory DSTopAppBarColors({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? surfaceTintColor,
    Color? shadowColor,
    Color? titleColor,
    Color? iconColor,
    Color? overlayColor,
  }) = _AppTopAppBarColors;
}

@freezed
class DSTopAppBarTypography with _$DSTopAppBarTypography {
  const factory DSTopAppBarTypography({
    TextStyle? titleStyle,
    TextStyle? actionStyle,
    @Default(1.0) double titleScale,
    @Default(1.0) double actionScale,
    @Default(true) bool responsive,
  }) = _AppTopAppBarTypography;
}

@freezed
class DSTopAppBarSpacing with _$DSTopAppBarSpacing {
  const factory DSTopAppBarSpacing({
    @Default(16.0) double titlePadding,
    @Default(8.0) double actionPadding,
    @Default(4.0) double actionSpacing,
    @Default(56.0) double minHeight,
    @Default(112.0) double maxHeight,
    @Default(true) bool adaptive,
  }) = _AppTopAppBarSpacing;
}

enum DSTopAppBarVariant {
  primary,
  center,
  large,
  collapsed,
}

enum DSTopAppBarState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSTopAppBarActionType {
  icon,
  text,
  iconText,
}

enum DSTopAppBarActionPriority {
  primary,
  secondary,
  overflow,
}

enum DSTopAppBarNavigationType {
  auto,
  back,
  close,
  menu,
  drawer,
  custom,
}

enum DSTopAppBarScrollType {
  pinned,
  floating,
  snap,
  expanded,
  collapsed,
}

extension DSTopAppBarVariantExtension on DSTopAppBarVariant {
  String get displayName {
    switch (this) {
      case DSTopAppBarVariant.primary:
        return 'Primary';
      case DSTopAppBarVariant.center:
        return 'Center';
      case DSTopAppBarVariant.large:
        return 'Large';
      case DSTopAppBarVariant.collapsed:
        return 'Collapsed';
    }
  }

  String get description {
    switch (this) {
      case DSTopAppBarVariant.primary:
        return 'AppBar estándar con título alineado a la izquierda';
      case DSTopAppBarVariant.center:
        return 'AppBar con título centrado';
      case DSTopAppBarVariant.large:
        return 'AppBar grande con título prominente';
      case DSTopAppBarVariant.collapsed:
        return 'AppBar colapsado para espacios reducidos';
    }
  }

  double get preferredHeight {
    switch (this) {
      case DSTopAppBarVariant.primary:
        return 56.0;
      case DSTopAppBarVariant.center:
        return 56.0;
      case DSTopAppBarVariant.large:
        return 112.0;
      case DSTopAppBarVariant.collapsed:
        return 48.0;
    }
  }

  bool get centerTitle {
    switch (this) {
      case DSTopAppBarVariant.primary:
        return false;
      case DSTopAppBarVariant.center:
        return true;
      case DSTopAppBarVariant.large:
        return false;
      case DSTopAppBarVariant.collapsed:
        return false;
    }
  }
}

extension DSTopAppBarStateExtension on DSTopAppBarState {
  String get displayName {
    switch (this) {
      case DSTopAppBarState.defaultState:
        return 'Default';
      case DSTopAppBarState.hover:
        return 'Hover';
      case DSTopAppBarState.pressed:
        return 'Pressed';
      case DSTopAppBarState.focus:
        return 'Focus';
      case DSTopAppBarState.selected:
        return 'Selected';
      case DSTopAppBarState.disabled:
        return 'Disabled';
      case DSTopAppBarState.loading:
        return 'Loading';
      case DSTopAppBarState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSTopAppBarState.defaultState:
      case DSTopAppBarState.hover:
      case DSTopAppBarState.pressed:
      case DSTopAppBarState.focus:
      case DSTopAppBarState.selected:
        return true;
      case DSTopAppBarState.disabled:
      case DSTopAppBarState.loading:
      case DSTopAppBarState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSTopAppBarState.defaultState:
      case DSTopAppBarState.hover:
      case DSTopAppBarState.pressed:
      case DSTopAppBarState.focus:
      case DSTopAppBarState.selected:
        return 1.0;
      case DSTopAppBarState.disabled:
        return 0.6;
      case DSTopAppBarState.loading:
        return 0.8;
      case DSTopAppBarState.skeleton:
        return 0.3;
    }
  }
}
