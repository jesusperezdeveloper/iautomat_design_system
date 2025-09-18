import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_top_app_bar_config.freezed.dart';

@freezed
class AppTopAppBarConfig with _$AppTopAppBarConfig {
  const factory AppTopAppBarConfig({
    @Default(AppTopAppBarVariant.primary) AppTopAppBarVariant variant,
    @Default(AppTopAppBarState.defaultState) AppTopAppBarState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    AppTopAppBarTitle? title,
    AppTopAppBarActions? actions,
    AppTopAppBarNavigationIcon? navigationIcon,
    AppTopAppBarElevation? elevation,
    AppTopAppBarScrollBehavior? scrollBehavior,
    AppTopAppBarColors? colors,
    AppTopAppBarTypography? typography,
    AppTopAppBarSpacing? spacing,
  }) = _AppTopAppBarConfig;
}

@freezed
class AppTopAppBarTitle with _$AppTopAppBarTitle {
  const factory AppTopAppBarTitle({
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
class AppTopAppBarActions with _$AppTopAppBarActions {
  const factory AppTopAppBarActions({
    @Default([]) List<AppTopAppBarAction> primary,
    @Default([]) List<AppTopAppBarAction> secondary,
    @Default(3) int maxPrimary,
    @Default(true) bool showOverflow,
    String? overflowTooltip,
    Widget? overflowIcon,
  }) = _AppTopAppBarActions;
}

@freezed
class AppTopAppBarAction with _$AppTopAppBarAction {
  const factory AppTopAppBarAction({
    required String id,
    Widget? icon,
    String? text,
    String? tooltip,
    VoidCallback? onPressed,
    @Default(false) bool disabled,
    @Default(AppTopAppBarActionType.icon) AppTopAppBarActionType type,
    @Default(AppTopAppBarActionPriority.primary)
    AppTopAppBarActionPriority priority,
  }) = _AppTopAppBarAction;
}

@freezed
class AppTopAppBarNavigationIcon with _$AppTopAppBarNavigationIcon {
  const factory AppTopAppBarNavigationIcon({
    Widget? icon,
    String? tooltip,
    VoidCallback? onPressed,
    @Default(AppTopAppBarNavigationType.auto) AppTopAppBarNavigationType type,
    @Default(false) bool disabled,
  }) = _AppTopAppBarNavigationIcon;
}

@freezed
class AppTopAppBarElevation with _$AppTopAppBarElevation {
  const factory AppTopAppBarElevation({
    @Default(4.0) double defaultElevation,
    @Default(8.0) double scrolledElevation,
    @Default(true) bool adaptive,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppTopAppBarElevation;
}

@freezed
class AppTopAppBarScrollBehavior with _$AppTopAppBarScrollBehavior {
  const factory AppTopAppBarScrollBehavior({
    @Default(AppTopAppBarScrollType.pinned) AppTopAppBarScrollType type,
    @Default(true) bool snap,
    @Default(true) bool floating,
    @Default(0.0) double expandedHeight,
    @Default(0.0) double collapsedHeight,
    Widget? flexibleSpace,
    Widget? bottom,
  }) = _AppTopAppBarScrollBehavior;
}

@freezed
class AppTopAppBarColors with _$AppTopAppBarColors {
  const factory AppTopAppBarColors({
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
class AppTopAppBarTypography with _$AppTopAppBarTypography {
  const factory AppTopAppBarTypography({
    TextStyle? titleStyle,
    TextStyle? actionStyle,
    @Default(1.0) double titleScale,
    @Default(1.0) double actionScale,
    @Default(true) bool responsive,
  }) = _AppTopAppBarTypography;
}

@freezed
class AppTopAppBarSpacing with _$AppTopAppBarSpacing {
  const factory AppTopAppBarSpacing({
    @Default(16.0) double titlePadding,
    @Default(8.0) double actionPadding,
    @Default(4.0) double actionSpacing,
    @Default(56.0) double minHeight,
    @Default(112.0) double maxHeight,
    @Default(true) bool adaptive,
  }) = _AppTopAppBarSpacing;
}

enum AppTopAppBarVariant {
  primary,
  center,
  large,
  collapsed,
}

enum AppTopAppBarState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppTopAppBarActionType {
  icon,
  text,
  iconText,
}

enum AppTopAppBarActionPriority {
  primary,
  secondary,
  overflow,
}

enum AppTopAppBarNavigationType {
  auto,
  back,
  close,
  menu,
  drawer,
  custom,
}

enum AppTopAppBarScrollType {
  pinned,
  floating,
  snap,
  expanded,
  collapsed,
}

extension AppTopAppBarVariantExtension on AppTopAppBarVariant {
  String get displayName {
    switch (this) {
      case AppTopAppBarVariant.primary:
        return 'Primary';
      case AppTopAppBarVariant.center:
        return 'Center';
      case AppTopAppBarVariant.large:
        return 'Large';
      case AppTopAppBarVariant.collapsed:
        return 'Collapsed';
    }
  }

  String get description {
    switch (this) {
      case AppTopAppBarVariant.primary:
        return 'AppBar estándar con título alineado a la izquierda';
      case AppTopAppBarVariant.center:
        return 'AppBar con título centrado';
      case AppTopAppBarVariant.large:
        return 'AppBar grande con título prominente';
      case AppTopAppBarVariant.collapsed:
        return 'AppBar colapsado para espacios reducidos';
    }
  }

  double get preferredHeight {
    switch (this) {
      case AppTopAppBarVariant.primary:
        return 56.0;
      case AppTopAppBarVariant.center:
        return 56.0;
      case AppTopAppBarVariant.large:
        return 112.0;
      case AppTopAppBarVariant.collapsed:
        return 48.0;
    }
  }

  bool get centerTitle {
    switch (this) {
      case AppTopAppBarVariant.primary:
        return false;
      case AppTopAppBarVariant.center:
        return true;
      case AppTopAppBarVariant.large:
        return false;
      case AppTopAppBarVariant.collapsed:
        return false;
    }
  }
}

extension AppTopAppBarStateExtension on AppTopAppBarState {
  String get displayName {
    switch (this) {
      case AppTopAppBarState.defaultState:
        return 'Default';
      case AppTopAppBarState.hover:
        return 'Hover';
      case AppTopAppBarState.pressed:
        return 'Pressed';
      case AppTopAppBarState.focus:
        return 'Focus';
      case AppTopAppBarState.selected:
        return 'Selected';
      case AppTopAppBarState.disabled:
        return 'Disabled';
      case AppTopAppBarState.loading:
        return 'Loading';
      case AppTopAppBarState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppTopAppBarState.defaultState:
      case AppTopAppBarState.hover:
      case AppTopAppBarState.pressed:
      case AppTopAppBarState.focus:
      case AppTopAppBarState.selected:
        return true;
      case AppTopAppBarState.disabled:
      case AppTopAppBarState.loading:
      case AppTopAppBarState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppTopAppBarState.defaultState:
      case AppTopAppBarState.hover:
      case AppTopAppBarState.pressed:
      case AppTopAppBarState.focus:
      case AppTopAppBarState.selected:
        return 1.0;
      case AppTopAppBarState.disabled:
        return 0.6;
      case AppTopAppBarState.loading:
        return 0.8;
      case AppTopAppBarState.skeleton:
        return 0.3;
    }
  }
}
