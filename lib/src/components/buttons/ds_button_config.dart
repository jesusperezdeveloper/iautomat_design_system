import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_button_config.freezed.dart';

@freezed
class DSButtonConfig with _$DSButtonConfig {
  const factory DSButtonConfig({
    @Default(DSButtonVariant.filled) DSButtonVariant variant,
    @Default(DSButtonState.defaultState) DSButtonState state,
    @Default(DSButtonSize.medium) DSButtonSize size,
    @Default(false) bool isDanger,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    DSButtonColors? colors,
    DSButtonSpacing? spacing,
    DSButtonElevation? elevation,
    DSButtonBehavior? behavior,
    DSButtonAnimation? animation,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _DSButtonConfig;
}

@freezed
class DSButtonColors with _$DSButtonColors {
  const factory DSButtonColors({
    Color? backgroundColor,
    Color? foregroundColor,
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
    Color? dangerColor,
    Color? dangerForegroundColor,
    Color? textColor,
    Color? iconColor,
  }) = _DSButtonColors;
}

@freezed
class DSButtonSpacing with _$DSButtonSpacing {
  const factory DSButtonSpacing({
    @Default(16.0) double horizontalPadding,
    @Default(12.0) double verticalPadding,
    @Default(8.0) double iconSpacing,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(24.0) double minHeight,
    @Default(88.0) double minWidth,
    @Default(true) bool adaptive,
  }) = _DSButtonSpacing;
}

@freezed
class DSButtonElevation with _$DSButtonElevation {
  const factory DSButtonElevation({
    @Default(1.0) double defaultElevation,
    @Default(4.0) double hoveredElevation,
    @Default(8.0) double pressedElevation,
    @Default(2.0) double focusedElevation,
    @Default(6.0) double selectedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _DSButtonElevation;
}

@freezed
class DSButtonBehavior with _$DSButtonBehavior {
  const factory DSButtonBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(DSButtonClipBehavior.antiAlias)
    DSButtonClipBehavior clipBehavior,
    @Default(300) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool autoSize,
  }) = _DSButtonBehavior;
}

@freezed
class DSButtonAnimation with _$DSButtonAnimation {
  const factory DSButtonAnimation({
    @Default(DSButtonAnimationType.scale) DSButtonAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
    @Default(true) bool enableLoadingAnimation,
  }) = _DSButtonAnimation;
}

enum DSButtonVariant {
  filled,
  tonal,
  outline,
  text,
  icon,
  segmented,
}

enum DSButtonState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSButtonSize {
  small,
  medium,
  large,
}

enum DSButtonClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum DSButtonAnimationType {
  none,
  scale,
  fade,
  slide,
  elevation,
}

extension DSButtonVariantExtension on DSButtonVariant {
  String get displayName {
    switch (this) {
      case DSButtonVariant.filled:
        return 'Filled';
      case DSButtonVariant.tonal:
        return 'Tonal';
      case DSButtonVariant.outline:
        return 'Outline';
      case DSButtonVariant.text:
        return 'Text';
      case DSButtonVariant.icon:
        return 'Icon';
      case DSButtonVariant.segmented:
        return 'Segmented';
    }
  }

  String get description {
    switch (this) {
      case DSButtonVariant.filled:
        return 'Botón con fondo sólido y alta prominencia';
      case DSButtonVariant.tonal:
        return 'Botón con fondo tonal y prominencia media';
      case DSButtonVariant.outline:
        return 'Botón con borde y fondo transparente';
      case DSButtonVariant.text:
        return 'Botón sin fondo, solo texto';
      case DSButtonVariant.icon:
        return 'Botón circular solo con icono';
      case DSButtonVariant.segmented:
        return 'Botón para uso en grupos segmentados';
    }
  }

  bool get hasElevation {
    switch (this) {
      case DSButtonVariant.filled:
        return true;
      case DSButtonVariant.tonal:
      case DSButtonVariant.outline:
      case DSButtonVariant.text:
      case DSButtonVariant.icon:
      case DSButtonVariant.segmented:
        return false;
    }
  }

  bool get hasBorder {
    switch (this) {
      case DSButtonVariant.outline:
      case DSButtonVariant.segmented:
        return true;
      case DSButtonVariant.filled:
      case DSButtonVariant.tonal:
      case DSButtonVariant.text:
      case DSButtonVariant.icon:
        return false;
    }
  }

  bool get hasBackground {
    switch (this) {
      case DSButtonVariant.filled:
      case DSButtonVariant.tonal:
      case DSButtonVariant.segmented:
        return true;
      case DSButtonVariant.outline:
      case DSButtonVariant.text:
      case DSButtonVariant.icon:
        return false;
    }
  }

  bool get isIconOnly {
    return this == DSButtonVariant.icon;
  }
}

extension DSButtonStateExtension on DSButtonState {
  String get displayName {
    switch (this) {
      case DSButtonState.defaultState:
        return 'Default';
      case DSButtonState.hover:
        return 'Hover';
      case DSButtonState.pressed:
        return 'Pressed';
      case DSButtonState.focus:
        return 'Focus';
      case DSButtonState.selected:
        return 'Selected';
      case DSButtonState.disabled:
        return 'Disabled';
      case DSButtonState.loading:
        return 'Loading';
      case DSButtonState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSButtonState.defaultState:
      case DSButtonState.hover:
      case DSButtonState.pressed:
      case DSButtonState.focus:
      case DSButtonState.selected:
        return true;
      case DSButtonState.disabled:
      case DSButtonState.loading:
      case DSButtonState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSButtonState.defaultState:
      case DSButtonState.hover:
      case DSButtonState.pressed:
      case DSButtonState.focus:
      case DSButtonState.selected:
        return 1.0;
      case DSButtonState.disabled:
        return 0.6;
      case DSButtonState.loading:
        return 0.8;
      case DSButtonState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSButtonState.loading;
  }

  bool get showsSkeleton {
    return this == DSButtonState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case DSButtonState.defaultState:
      case DSButtonState.hover:
      case DSButtonState.pressed:
      case DSButtonState.focus:
      case DSButtonState.selected:
        return true;
      case DSButtonState.disabled:
      case DSButtonState.loading:
      case DSButtonState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case DSButtonState.defaultState:
        return 1.0;
      case DSButtonState.hover:
        return 2.0;
      case DSButtonState.pressed:
        return 4.0;
      case DSButtonState.focus:
        return 1.5;
      case DSButtonState.selected:
        return 3.0;
      case DSButtonState.disabled:
        return 0.0;
      case DSButtonState.loading:
      case DSButtonState.skeleton:
        return 1.0;
    }
  }
}

extension DSButtonSizeExtension on DSButtonSize {
  String get displayName {
    switch (this) {
      case DSButtonSize.small:
        return 'Small';
      case DSButtonSize.medium:
        return 'Medium';
      case DSButtonSize.large:
        return 'Large';
    }
  }

  double get fontSize {
    switch (this) {
      case DSButtonSize.small:
        return 12.0;
      case DSButtonSize.medium:
        return 14.0;
      case DSButtonSize.large:
        return 16.0;
    }
  }

  double get iconSize {
    switch (this) {
      case DSButtonSize.small:
        return 16.0;
      case DSButtonSize.medium:
        return 20.0;
      case DSButtonSize.large:
        return 24.0;
    }
  }

  double get minHeight {
    switch (this) {
      case DSButtonSize.small:
        return 32.0;
      case DSButtonSize.medium:
        return 40.0;
      case DSButtonSize.large:
        return 48.0;
    }
  }

  double get horizontalPadding {
    switch (this) {
      case DSButtonSize.small:
        return 12.0;
      case DSButtonSize.medium:
        return 16.0;
      case DSButtonSize.large:
        return 20.0;
    }
  }

  double get verticalPadding {
    switch (this) {
      case DSButtonSize.small:
        return 8.0;
      case DSButtonSize.medium:
        return 10.0;
      case DSButtonSize.large:
        return 12.0;
    }
  }
}

extension DSButtonClipBehaviorExtension on DSButtonClipBehavior {
  String get displayName {
    switch (this) {
      case DSButtonClipBehavior.none:
        return 'None';
      case DSButtonClipBehavior.antiAlias:
        return 'Anti Alias';
      case DSButtonClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case DSButtonClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case DSButtonClipBehavior.none:
        return Clip.none;
      case DSButtonClipBehavior.antiAlias:
        return Clip.antiAlias;
      case DSButtonClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case DSButtonClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension DSButtonAnimationTypeExtension on DSButtonAnimationType {
  String get displayName {
    switch (this) {
      case DSButtonAnimationType.none:
        return 'None';
      case DSButtonAnimationType.scale:
        return 'Scale';
      case DSButtonAnimationType.fade:
        return 'Fade';
      case DSButtonAnimationType.slide:
        return 'Slide';
      case DSButtonAnimationType.elevation:
        return 'Elevation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSButtonAnimationType.none:
        return Curves.linear;
      case DSButtonAnimationType.scale:
        return Curves.elasticOut;
      case DSButtonAnimationType.fade:
        return Curves.easeInOut;
      case DSButtonAnimationType.slide:
        return Curves.easeOutCubic;
      case DSButtonAnimationType.elevation:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != DSButtonAnimationType.none;
  }
}
