import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_switch_config.freezed.dart';

@freezed
class AppSwitchConfig with _$AppSwitchConfig {
  const factory AppSwitchConfig({
    @Default(AppSwitchVariant.android) AppSwitchVariant variant,
    @Default(AppSwitchState.defaultState) AppSwitchState state,
    @Default(false) bool value,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    AppSwitchColors? colors,
    AppSwitchSpacing? spacing,
    AppSwitchElevation? elevation,
    AppSwitchBehavior? behavior,
    AppSwitchAnimation? animation,
    ValueChanged<bool>? onChanged,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    String? semanticsLabel,
  }) = _AppSwitchConfig;
}

@freezed
class AppSwitchColors with _$AppSwitchColors {
  const factory AppSwitchColors({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    Color? focusColor,
    Color? hoverColor,
    Color? overlayColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    Color? disabledTrackColor,
    Color? disabledThumbColor,
    Color? loadingColor,
    Color? skeletonColor,
  }) = _AppSwitchColors;
}

@freezed
class AppSwitchSpacing with _$AppSwitchSpacing {
  const factory AppSwitchSpacing({
    @Default(14.0) double thumbRadius,
    @Default(20.0) double trackHeight,
    @Default(52.0) double trackWidth,
    @Default(2.0) double trackBorderWidth,
    @Default(true) bool adaptive,
  }) = _AppSwitchSpacing;
}

@freezed
class AppSwitchElevation with _$AppSwitchElevation {
  const factory AppSwitchElevation({
    @Default(1.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(3.0) double pressedElevation,
    @Default(2.0) double focusedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppSwitchElevation;
}

@freezed
class AppSwitchBehavior with _$AppSwitchBehavior {
  const factory AppSwitchBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(200) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool autoFocus,
  }) = _AppSwitchBehavior;
}

@freezed
class AppSwitchAnimation with _$AppSwitchAnimation {
  const factory AppSwitchAnimation({
    @Default(AppSwitchAnimationType.slide) AppSwitchAnimationType type,
    @Default(200) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enableToggleAnimation,
    @Default(true) bool enableLoadingAnimation,
  }) = _AppSwitchAnimation;
}

enum AppSwitchVariant {
  android,
  cupertino,
}

enum AppSwitchState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppSwitchAnimationType {
  none,
  slide,
  fade,
  scale,
}

extension AppSwitchVariantExtension on AppSwitchVariant {
  String get displayName {
    switch (this) {
      case AppSwitchVariant.android:
        return 'Android';
      case AppSwitchVariant.cupertino:
        return 'Cupertino';
    }
  }

  String get description {
    switch (this) {
      case AppSwitchVariant.android:
        return 'Switch estilo Material Design para Android';
      case AppSwitchVariant.cupertino:
        return 'Switch estilo iOS/Cupertino';
    }
  }

  bool get isCupertino {
    return this == AppSwitchVariant.cupertino;
  }

  bool get isAndroid {
    return this == AppSwitchVariant.android;
  }

  Color getActiveTrackColor(ColorScheme colorScheme) {
    switch (this) {
      case AppSwitchVariant.android:
        return colorScheme.primary;
      case AppSwitchVariant.cupertino:
        return colorScheme.primary;
    }
  }

  Color getInactiveTrackColor(ColorScheme colorScheme) {
    switch (this) {
      case AppSwitchVariant.android:
        return colorScheme.surfaceContainerHighest;
      case AppSwitchVariant.cupertino:
        return colorScheme.outline;
    }
  }

  Color getActiveThumbColor(ColorScheme colorScheme) {
    switch (this) {
      case AppSwitchVariant.android:
        return colorScheme.onPrimary;
      case AppSwitchVariant.cupertino:
        return colorScheme.onPrimary;
    }
  }

  Color getInactiveThumbColor(ColorScheme colorScheme) {
    switch (this) {
      case AppSwitchVariant.android:
        return colorScheme.outline;
      case AppSwitchVariant.cupertino:
        return colorScheme.onSurfaceVariant;
    }
  }
}

extension AppSwitchStateExtension on AppSwitchState {
  String get displayName {
    switch (this) {
      case AppSwitchState.defaultState:
        return 'Default';
      case AppSwitchState.hover:
        return 'Hover';
      case AppSwitchState.pressed:
        return 'Pressed';
      case AppSwitchState.focus:
        return 'Focus';
      case AppSwitchState.selected:
        return 'Selected';
      case AppSwitchState.disabled:
        return 'Disabled';
      case AppSwitchState.loading:
        return 'Loading';
      case AppSwitchState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppSwitchState.defaultState:
      case AppSwitchState.hover:
      case AppSwitchState.pressed:
      case AppSwitchState.focus:
      case AppSwitchState.selected:
        return true;
      case AppSwitchState.disabled:
      case AppSwitchState.loading:
      case AppSwitchState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppSwitchState.defaultState:
      case AppSwitchState.hover:
      case AppSwitchState.pressed:
      case AppSwitchState.focus:
      case AppSwitchState.selected:
        return 1.0;
      case AppSwitchState.disabled:
        return 0.38;
      case AppSwitchState.loading:
        return 0.8;
      case AppSwitchState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppSwitchState.loading;
  }

  bool get showsSkeleton {
    return this == AppSwitchState.skeleton;
  }

  bool get canInteract {
    return isInteractive;
  }

  double get elevationMultiplier {
    switch (this) {
      case AppSwitchState.defaultState:
        return 1.0;
      case AppSwitchState.hover:
        return 1.5;
      case AppSwitchState.pressed:
        return 2.0;
      case AppSwitchState.focus:
        return 1.5;
      case AppSwitchState.selected:
        return 1.8;
      case AppSwitchState.disabled:
        return 0.0;
      case AppSwitchState.loading:
      case AppSwitchState.skeleton:
        return 1.0;
    }
  }
}

extension AppSwitchAnimationTypeExtension on AppSwitchAnimationType {
  String get displayName {
    switch (this) {
      case AppSwitchAnimationType.none:
        return 'None';
      case AppSwitchAnimationType.slide:
        return 'Slide';
      case AppSwitchAnimationType.fade:
        return 'Fade';
      case AppSwitchAnimationType.scale:
        return 'Scale';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppSwitchAnimationType.none:
        return Curves.linear;
      case AppSwitchAnimationType.slide:
        return Curves.easeInOut;
      case AppSwitchAnimationType.fade:
        return Curves.easeInOut;
      case AppSwitchAnimationType.scale:
        return Curves.elasticOut;
    }
  }

  bool get hasAnimation {
    return this != AppSwitchAnimationType.none;
  }
}
