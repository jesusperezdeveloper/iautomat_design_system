import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_card_config.freezed.dart';

@freezed
class AppCardConfig with _$AppCardConfig {
  const factory AppCardConfig({
    @Default(AppCardVariant.elevated) AppCardVariant variant,
    @Default(AppCardState.defaultState) AppCardState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    AppCardColors? colors,
    AppCardSpacing? spacing,
    AppCardElevation? elevation,
    AppCardBehavior? behavior,
    AppCardAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _AppCardConfig;
}

@freezed
class AppCardColors with _$AppCardColors {
  const factory AppCardColors({
    Color? backgroundColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? borderColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? headerTextColor,
    Color? bodyTextColor,
    Color? footerTextColor,
  }) = _AppCardColors;
}

@freezed
class AppCardSpacing with _$AppCardSpacing {
  const factory AppCardSpacing({
    @Default(16.0) double padding,
    @Default(12.0) double headerPadding,
    @Default(16.0) double bodyPadding,
    @Default(12.0) double footerPadding,
    @Default(8.0) double spacing,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(48.0) double minHeight,
    @Default(true) bool adaptive,
  }) = _AppCardSpacing;
}

@freezed
class AppCardElevation with _$AppCardElevation {
  const factory AppCardElevation({
    @Default(1.0) double defaultElevation,
    @Default(4.0) double hoveredElevation,
    @Default(8.0) double pressedElevation,
    @Default(2.0) double focusedElevation,
    @Default(6.0) double selectedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppCardElevation;
}

@freezed
class AppCardBehavior with _$AppCardBehavior {
  const factory AppCardBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(AppCardClipBehavior.antiAlias) AppCardClipBehavior clipBehavior,
    @Default(300) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
  }) = _AppCardBehavior;
}

@freezed
class AppCardAnimation with _$AppCardAnimation {
  const factory AppCardAnimation({
    @Default(AppCardAnimationType.scale) AppCardAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
  }) = _AppCardAnimation;
}

enum AppCardVariant {
  elevated,
  filled,
  outlined,
}

enum AppCardState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppCardClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum AppCardAnimationType {
  none,
  scale,
  fade,
  slide,
  elevation,
}

extension AppCardVariantExtension on AppCardVariant {
  String get displayName {
    switch (this) {
      case AppCardVariant.elevated:
        return 'Elevated';
      case AppCardVariant.filled:
        return 'Filled';
      case AppCardVariant.outlined:
        return 'Outlined';
    }
  }

  String get description {
    switch (this) {
      case AppCardVariant.elevated:
        return 'Tarjeta con elevación y sombra';
      case AppCardVariant.filled:
        return 'Tarjeta con fondo sólido';
      case AppCardVariant.outlined:
        return 'Tarjeta con borde y fondo transparente';
    }
  }

  bool get hasElevation {
    switch (this) {
      case AppCardVariant.elevated:
        return true;
      case AppCardVariant.filled:
      case AppCardVariant.outlined:
        return false;
    }
  }

  bool get hasBorder {
    switch (this) {
      case AppCardVariant.outlined:
        return true;
      case AppCardVariant.elevated:
      case AppCardVariant.filled:
        return false;
    }
  }

  bool get hasBackground {
    switch (this) {
      case AppCardVariant.elevated:
      case AppCardVariant.filled:
        return true;
      case AppCardVariant.outlined:
        return false;
    }
  }
}

extension AppCardStateExtension on AppCardState {
  String get displayName {
    switch (this) {
      case AppCardState.defaultState:
        return 'Default';
      case AppCardState.hover:
        return 'Hover';
      case AppCardState.pressed:
        return 'Pressed';
      case AppCardState.focus:
        return 'Focus';
      case AppCardState.selected:
        return 'Selected';
      case AppCardState.disabled:
        return 'Disabled';
      case AppCardState.loading:
        return 'Loading';
      case AppCardState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppCardState.defaultState:
      case AppCardState.hover:
      case AppCardState.pressed:
      case AppCardState.focus:
      case AppCardState.selected:
        return true;
      case AppCardState.disabled:
      case AppCardState.loading:
      case AppCardState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppCardState.defaultState:
      case AppCardState.hover:
      case AppCardState.pressed:
      case AppCardState.focus:
      case AppCardState.selected:
        return 1.0;
      case AppCardState.disabled:
        return 0.6;
      case AppCardState.loading:
        return 0.8;
      case AppCardState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppCardState.loading;
  }

  bool get showsSkeleton {
    return this == AppCardState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case AppCardState.defaultState:
      case AppCardState.hover:
      case AppCardState.pressed:
      case AppCardState.focus:
      case AppCardState.selected:
        return true;
      case AppCardState.disabled:
      case AppCardState.loading:
      case AppCardState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case AppCardState.defaultState:
        return 1.0;
      case AppCardState.hover:
        return 2.0;
      case AppCardState.pressed:
        return 4.0;
      case AppCardState.focus:
        return 1.5;
      case AppCardState.selected:
        return 3.0;
      case AppCardState.disabled:
        return 0.0;
      case AppCardState.loading:
      case AppCardState.skeleton:
        return 1.0;
    }
  }
}

extension AppCardClipBehaviorExtension on AppCardClipBehavior {
  String get displayName {
    switch (this) {
      case AppCardClipBehavior.none:
        return 'None';
      case AppCardClipBehavior.antiAlias:
        return 'Anti Alias';
      case AppCardClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case AppCardClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case AppCardClipBehavior.none:
        return Clip.none;
      case AppCardClipBehavior.antiAlias:
        return Clip.antiAlias;
      case AppCardClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case AppCardClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension AppCardAnimationTypeExtension on AppCardAnimationType {
  String get displayName {
    switch (this) {
      case AppCardAnimationType.none:
        return 'None';
      case AppCardAnimationType.scale:
        return 'Scale';
      case AppCardAnimationType.fade:
        return 'Fade';
      case AppCardAnimationType.slide:
        return 'Slide';
      case AppCardAnimationType.elevation:
        return 'Elevation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppCardAnimationType.none:
        return Curves.linear;
      case AppCardAnimationType.scale:
        return Curves.elasticOut;
      case AppCardAnimationType.fade:
        return Curves.easeInOut;
      case AppCardAnimationType.slide:
        return Curves.easeOutCubic;
      case AppCardAnimationType.elevation:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != AppCardAnimationType.none;
  }
}
