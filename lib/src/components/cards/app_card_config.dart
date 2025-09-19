import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_card_config.freezed.dart';

@freezed
class DSCardConfig with _$DSCardConfig {
  const factory DSCardConfig({
    @Default(DSCardVariant.elevated) DSCardVariant variant,
    @Default(DSCardState.defaultState) DSCardState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    DSCardColors? colors,
    DSCardSpacing? spacing,
    DSCardElevation? elevation,
    DSCardBehavior? behavior,
    DSCardAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _DSCardConfig;
}

@freezed
class DSCardColors with _$DSCardColors {
  const factory DSCardColors({
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
class DSCardSpacing with _$DSCardSpacing {
  const factory DSCardSpacing({
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
class DSCardElevation with _$DSCardElevation {
  const factory DSCardElevation({
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
class DSCardBehavior with _$DSCardBehavior {
  const factory DSCardBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(DSCardClipBehavior.antiAlias) DSCardClipBehavior clipBehavior,
    @Default(300) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
  }) = _AppCardBehavior;
}

@freezed
class DSCardAnimation with _$DSCardAnimation {
  const factory DSCardAnimation({
    @Default(DSCardAnimationType.scale) DSCardAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
  }) = _AppCardAnimation;
}

enum DSCardVariant {
  elevated,
  filled,
  outlined,
}

enum DSCardState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSCardClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum DSCardAnimationType {
  none,
  scale,
  fade,
  slide,
  elevation,
}

extension DSCardVariantExtension on DSCardVariant {
  String get displayName {
    switch (this) {
      case DSCardVariant.elevated:
        return 'Elevated';
      case DSCardVariant.filled:
        return 'Filled';
      case DSCardVariant.outlined:
        return 'Outlined';
    }
  }

  String get description {
    switch (this) {
      case DSCardVariant.elevated:
        return 'Tarjeta con elevación y sombra';
      case DSCardVariant.filled:
        return 'Tarjeta con fondo sólido';
      case DSCardVariant.outlined:
        return 'Tarjeta con borde y fondo transparente';
    }
  }

  bool get hasElevation {
    switch (this) {
      case DSCardVariant.elevated:
        return true;
      case DSCardVariant.filled:
      case DSCardVariant.outlined:
        return false;
    }
  }

  bool get hasBorder {
    switch (this) {
      case DSCardVariant.outlined:
        return true;
      case DSCardVariant.elevated:
      case DSCardVariant.filled:
        return false;
    }
  }

  bool get hasBackground {
    switch (this) {
      case DSCardVariant.elevated:
      case DSCardVariant.filled:
        return true;
      case DSCardVariant.outlined:
        return false;
    }
  }
}

extension DSCardStateExtension on DSCardState {
  String get displayName {
    switch (this) {
      case DSCardState.defaultState:
        return 'Default';
      case DSCardState.hover:
        return 'Hover';
      case DSCardState.pressed:
        return 'Pressed';
      case DSCardState.focus:
        return 'Focus';
      case DSCardState.selected:
        return 'Selected';
      case DSCardState.disabled:
        return 'Disabled';
      case DSCardState.loading:
        return 'Loading';
      case DSCardState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSCardState.defaultState:
      case DSCardState.hover:
      case DSCardState.pressed:
      case DSCardState.focus:
      case DSCardState.selected:
        return true;
      case DSCardState.disabled:
      case DSCardState.loading:
      case DSCardState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSCardState.defaultState:
      case DSCardState.hover:
      case DSCardState.pressed:
      case DSCardState.focus:
      case DSCardState.selected:
        return 1.0;
      case DSCardState.disabled:
        return 0.6;
      case DSCardState.loading:
        return 0.8;
      case DSCardState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSCardState.loading;
  }

  bool get showsSkeleton {
    return this == DSCardState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case DSCardState.defaultState:
      case DSCardState.hover:
      case DSCardState.pressed:
      case DSCardState.focus:
      case DSCardState.selected:
        return true;
      case DSCardState.disabled:
      case DSCardState.loading:
      case DSCardState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case DSCardState.defaultState:
        return 1.0;
      case DSCardState.hover:
        return 2.0;
      case DSCardState.pressed:
        return 4.0;
      case DSCardState.focus:
        return 1.5;
      case DSCardState.selected:
        return 3.0;
      case DSCardState.disabled:
        return 0.0;
      case DSCardState.loading:
      case DSCardState.skeleton:
        return 1.0;
    }
  }
}

extension DSCardClipBehaviorExtension on DSCardClipBehavior {
  String get displayName {
    switch (this) {
      case DSCardClipBehavior.none:
        return 'None';
      case DSCardClipBehavior.antiAlias:
        return 'Anti Alias';
      case DSCardClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case DSCardClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case DSCardClipBehavior.none:
        return Clip.none;
      case DSCardClipBehavior.antiAlias:
        return Clip.antiAlias;
      case DSCardClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case DSCardClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension DSCardAnimationTypeExtension on DSCardAnimationType {
  String get displayName {
    switch (this) {
      case DSCardAnimationType.none:
        return 'None';
      case DSCardAnimationType.scale:
        return 'Scale';
      case DSCardAnimationType.fade:
        return 'Fade';
      case DSCardAnimationType.slide:
        return 'Slide';
      case DSCardAnimationType.elevation:
        return 'Elevation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSCardAnimationType.none:
        return Curves.linear;
      case DSCardAnimationType.scale:
        return Curves.elasticOut;
      case DSCardAnimationType.fade:
        return Curves.easeInOut;
      case DSCardAnimationType.slide:
        return Curves.easeOutCubic;
      case DSCardAnimationType.elevation:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != DSCardAnimationType.none;
  }
}
