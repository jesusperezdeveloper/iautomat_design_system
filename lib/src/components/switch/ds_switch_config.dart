import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_switch_config.freezed.dart';

@freezed
class DSSwitchConfig with _$DSSwitchConfig {
  const factory DSSwitchConfig({
    @Default(DSSwitchVariant.android) DSSwitchVariant variant,
    @Default(DSSwitchState.defaultState) DSSwitchState state,
    @Default(false) bool value,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    DSSwitchColors? colors,
    DSSwitchSpacing? spacing,
    DSSwitchElevation? elevation,
    DSSwitchBehavior? behavior,
    DSSwitchAnimation? animation,
    ValueChanged<bool>? onChanged,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    String? semanticsLabel,
  }) = _DSSwitchConfig;
}

@freezed
class DSSwitchColors with _$DSSwitchColors {
  const factory DSSwitchColors({
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
  }) = _DSSwitchColors;
}

@freezed
class DSSwitchSpacing with _$DSSwitchSpacing {
  const factory DSSwitchSpacing({
    @Default(14.0) double thumbRadius,
    @Default(20.0) double trackHeight,
    @Default(52.0) double trackWidth,
    @Default(2.0) double trackBorderWidth,
    @Default(true) bool adaptive,
  }) = _DSSwitchSpacing;
}

@freezed
class DSSwitchElevation with _$DSSwitchElevation {
  const factory DSSwitchElevation({
    @Default(1.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(3.0) double pressedElevation,
    @Default(2.0) double focusedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _DSSwitchElevation;
}

@freezed
class DSSwitchBehavior with _$DSSwitchBehavior {
  const factory DSSwitchBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(200) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool autoFocus,
  }) = _DSSwitchBehavior;
}

@freezed
class DSSwitchAnimation with _$DSSwitchAnimation {
  const factory DSSwitchAnimation({
    @Default(DSSwitchAnimationType.slide) DSSwitchAnimationType type,
    @Default(200) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enableToggleAnimation,
    @Default(true) bool enableLoadingAnimation,
  }) = _DSSwitchAnimation;
}

enum DSSwitchVariant {
  android,
  cupertino,
}

enum DSSwitchState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSSwitchAnimationType {
  none,
  slide,
  fade,
  scale,
}

extension DSSwitchVariantExtension on DSSwitchVariant {
  String get displayName {
    switch (this) {
      case DSSwitchVariant.android:
        return 'Android';
      case DSSwitchVariant.cupertino:
        return 'Cupertino';
    }
  }

  String get description {
    switch (this) {
      case DSSwitchVariant.android:
        return 'Switch estilo Material Design para Android';
      case DSSwitchVariant.cupertino:
        return 'Switch estilo iOS/Cupertino';
    }
  }

  bool get isCupertino {
    return this == DSSwitchVariant.cupertino;
  }

  bool get isAndroid {
    return this == DSSwitchVariant.android;
  }

  Color getActiveTrackColor(ColorScheme colorScheme) {
    switch (this) {
      case DSSwitchVariant.android:
        return colorScheme.primary;
      case DSSwitchVariant.cupertino:
        return colorScheme.primary;
    }
  }

  Color getInactiveTrackColor(ColorScheme colorScheme) {
    switch (this) {
      case DSSwitchVariant.android:
        return colorScheme.surfaceContainerHighest;
      case DSSwitchVariant.cupertino:
        return colorScheme.outline;
    }
  }

  Color getActiveThumbColor(ColorScheme colorScheme) {
    switch (this) {
      case DSSwitchVariant.android:
        return colorScheme.onPrimary;
      case DSSwitchVariant.cupertino:
        return colorScheme.onPrimary;
    }
  }

  Color getInactiveThumbColor(ColorScheme colorScheme) {
    switch (this) {
      case DSSwitchVariant.android:
        return colorScheme.outline;
      case DSSwitchVariant.cupertino:
        return colorScheme.onSurfaceVariant;
    }
  }
}

extension DSSwitchStateExtension on DSSwitchState {
  String get displayName {
    switch (this) {
      case DSSwitchState.defaultState:
        return 'Default';
      case DSSwitchState.hover:
        return 'Hover';
      case DSSwitchState.pressed:
        return 'Pressed';
      case DSSwitchState.focus:
        return 'Focus';
      case DSSwitchState.selected:
        return 'Selected';
      case DSSwitchState.disabled:
        return 'Disabled';
      case DSSwitchState.loading:
        return 'Loading';
      case DSSwitchState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSSwitchState.defaultState:
      case DSSwitchState.hover:
      case DSSwitchState.pressed:
      case DSSwitchState.focus:
      case DSSwitchState.selected:
        return true;
      case DSSwitchState.disabled:
      case DSSwitchState.loading:
      case DSSwitchState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSSwitchState.defaultState:
      case DSSwitchState.hover:
      case DSSwitchState.pressed:
      case DSSwitchState.focus:
      case DSSwitchState.selected:
        return 1.0;
      case DSSwitchState.disabled:
        return 0.38;
      case DSSwitchState.loading:
        return 0.8;
      case DSSwitchState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSSwitchState.loading;
  }

  bool get showsSkeleton {
    return this == DSSwitchState.skeleton;
  }

  bool get canInteract {
    return isInteractive;
  }

  double get elevationMultiplier {
    switch (this) {
      case DSSwitchState.defaultState:
        return 1.0;
      case DSSwitchState.hover:
        return 1.5;
      case DSSwitchState.pressed:
        return 2.0;
      case DSSwitchState.focus:
        return 1.5;
      case DSSwitchState.selected:
        return 1.8;
      case DSSwitchState.disabled:
        return 0.0;
      case DSSwitchState.loading:
      case DSSwitchState.skeleton:
        return 1.0;
    }
  }
}

extension DSSwitchAnimationTypeExtension on DSSwitchAnimationType {
  String get displayName {
    switch (this) {
      case DSSwitchAnimationType.none:
        return 'None';
      case DSSwitchAnimationType.slide:
        return 'Slide';
      case DSSwitchAnimationType.fade:
        return 'Fade';
      case DSSwitchAnimationType.scale:
        return 'Scale';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSSwitchAnimationType.none:
        return Curves.linear;
      case DSSwitchAnimationType.slide:
        return Curves.easeInOut;
      case DSSwitchAnimationType.fade:
        return Curves.easeInOut;
      case DSSwitchAnimationType.scale:
        return Curves.elasticOut;
    }
  }

  bool get hasAnimation {
    return this != DSSwitchAnimationType.none;
  }
}
