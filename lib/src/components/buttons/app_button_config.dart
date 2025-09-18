import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_button_config.freezed.dart';

@freezed
class AppButtonConfig with _$AppButtonConfig {
  const factory AppButtonConfig({
    @Default(AppButtonVariant.filled) AppButtonVariant variant,
    @Default(AppButtonState.defaultState) AppButtonState state,
    @Default(AppButtonSize.medium) AppButtonSize size,
    @Default(false) bool isDanger,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    AppButtonColors? colors,
    AppButtonSpacing? spacing,
    AppButtonElevation? elevation,
    AppButtonBehavior? behavior,
    AppButtonAnimation? animation,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _AppButtonConfig;
}

@freezed
class AppButtonColors with _$AppButtonColors {
  const factory AppButtonColors({
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
  }) = _AppButtonColors;
}

@freezed
class AppButtonSpacing with _$AppButtonSpacing {
  const factory AppButtonSpacing({
    @Default(16.0) double horizontalPadding,
    @Default(12.0) double verticalPadding,
    @Default(8.0) double iconSpacing,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(24.0) double minHeight,
    @Default(88.0) double minWidth,
    @Default(true) bool adaptive,
  }) = _AppButtonSpacing;
}

@freezed
class AppButtonElevation with _$AppButtonElevation {
  const factory AppButtonElevation({
    @Default(1.0) double defaultElevation,
    @Default(4.0) double hoveredElevation,
    @Default(8.0) double pressedElevation,
    @Default(2.0) double focusedElevation,
    @Default(6.0) double selectedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppButtonElevation;
}

@freezed
class AppButtonBehavior with _$AppButtonBehavior {
  const factory AppButtonBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(AppButtonClipBehavior.antiAlias)
    AppButtonClipBehavior clipBehavior,
    @Default(300) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool autoSize,
  }) = _AppButtonBehavior;
}

@freezed
class AppButtonAnimation with _$AppButtonAnimation {
  const factory AppButtonAnimation({
    @Default(AppButtonAnimationType.scale) AppButtonAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
    @Default(true) bool enableLoadingAnimation,
  }) = _AppButtonAnimation;
}

enum AppButtonVariant {
  filled,
  tonal,
  outline,
  text,
  icon,
  segmented,
}

enum AppButtonState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppButtonSize {
  small,
  medium,
  large,
}

enum AppButtonClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum AppButtonAnimationType {
  none,
  scale,
  fade,
  slide,
  elevation,
}

extension AppButtonVariantExtension on AppButtonVariant {
  String get displayName {
    switch (this) {
      case AppButtonVariant.filled:
        return 'Filled';
      case AppButtonVariant.tonal:
        return 'Tonal';
      case AppButtonVariant.outline:
        return 'Outline';
      case AppButtonVariant.text:
        return 'Text';
      case AppButtonVariant.icon:
        return 'Icon';
      case AppButtonVariant.segmented:
        return 'Segmented';
    }
  }

  String get description {
    switch (this) {
      case AppButtonVariant.filled:
        return 'Botón con fondo sólido y alta prominencia';
      case AppButtonVariant.tonal:
        return 'Botón con fondo tonal y prominencia media';
      case AppButtonVariant.outline:
        return 'Botón con borde y fondo transparente';
      case AppButtonVariant.text:
        return 'Botón sin fondo, solo texto';
      case AppButtonVariant.icon:
        return 'Botón circular solo con icono';
      case AppButtonVariant.segmented:
        return 'Botón para uso en grupos segmentados';
    }
  }

  bool get hasElevation {
    switch (this) {
      case AppButtonVariant.filled:
        return true;
      case AppButtonVariant.tonal:
      case AppButtonVariant.outline:
      case AppButtonVariant.text:
      case AppButtonVariant.icon:
      case AppButtonVariant.segmented:
        return false;
    }
  }

  bool get hasBorder {
    switch (this) {
      case AppButtonVariant.outline:
      case AppButtonVariant.segmented:
        return true;
      case AppButtonVariant.filled:
      case AppButtonVariant.tonal:
      case AppButtonVariant.text:
      case AppButtonVariant.icon:
        return false;
    }
  }

  bool get hasBackground {
    switch (this) {
      case AppButtonVariant.filled:
      case AppButtonVariant.tonal:
      case AppButtonVariant.segmented:
        return true;
      case AppButtonVariant.outline:
      case AppButtonVariant.text:
      case AppButtonVariant.icon:
        return false;
    }
  }

  bool get isIconOnly {
    return this == AppButtonVariant.icon;
  }
}

extension AppButtonStateExtension on AppButtonState {
  String get displayName {
    switch (this) {
      case AppButtonState.defaultState:
        return 'Default';
      case AppButtonState.hover:
        return 'Hover';
      case AppButtonState.pressed:
        return 'Pressed';
      case AppButtonState.focus:
        return 'Focus';
      case AppButtonState.selected:
        return 'Selected';
      case AppButtonState.disabled:
        return 'Disabled';
      case AppButtonState.loading:
        return 'Loading';
      case AppButtonState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppButtonState.defaultState:
      case AppButtonState.hover:
      case AppButtonState.pressed:
      case AppButtonState.focus:
      case AppButtonState.selected:
        return true;
      case AppButtonState.disabled:
      case AppButtonState.loading:
      case AppButtonState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppButtonState.defaultState:
      case AppButtonState.hover:
      case AppButtonState.pressed:
      case AppButtonState.focus:
      case AppButtonState.selected:
        return 1.0;
      case AppButtonState.disabled:
        return 0.6;
      case AppButtonState.loading:
        return 0.8;
      case AppButtonState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppButtonState.loading;
  }

  bool get showsSkeleton {
    return this == AppButtonState.skeleton;
  }

  bool get canInteract {
    switch (this) {
      case AppButtonState.defaultState:
      case AppButtonState.hover:
      case AppButtonState.pressed:
      case AppButtonState.focus:
      case AppButtonState.selected:
        return true;
      case AppButtonState.disabled:
      case AppButtonState.loading:
      case AppButtonState.skeleton:
        return false;
    }
  }

  double get elevationMultiplier {
    switch (this) {
      case AppButtonState.defaultState:
        return 1.0;
      case AppButtonState.hover:
        return 2.0;
      case AppButtonState.pressed:
        return 4.0;
      case AppButtonState.focus:
        return 1.5;
      case AppButtonState.selected:
        return 3.0;
      case AppButtonState.disabled:
        return 0.0;
      case AppButtonState.loading:
      case AppButtonState.skeleton:
        return 1.0;
    }
  }
}

extension AppButtonSizeExtension on AppButtonSize {
  String get displayName {
    switch (this) {
      case AppButtonSize.small:
        return 'Small';
      case AppButtonSize.medium:
        return 'Medium';
      case AppButtonSize.large:
        return 'Large';
    }
  }

  double get fontSize {
    switch (this) {
      case AppButtonSize.small:
        return 12.0;
      case AppButtonSize.medium:
        return 14.0;
      case AppButtonSize.large:
        return 16.0;
    }
  }

  double get iconSize {
    switch (this) {
      case AppButtonSize.small:
        return 16.0;
      case AppButtonSize.medium:
        return 20.0;
      case AppButtonSize.large:
        return 24.0;
    }
  }

  double get minHeight {
    switch (this) {
      case AppButtonSize.small:
        return 32.0;
      case AppButtonSize.medium:
        return 40.0;
      case AppButtonSize.large:
        return 48.0;
    }
  }

  double get horizontalPadding {
    switch (this) {
      case AppButtonSize.small:
        return 12.0;
      case AppButtonSize.medium:
        return 16.0;
      case AppButtonSize.large:
        return 20.0;
    }
  }

  double get verticalPadding {
    switch (this) {
      case AppButtonSize.small:
        return 8.0;
      case AppButtonSize.medium:
        return 10.0;
      case AppButtonSize.large:
        return 12.0;
    }
  }
}

extension AppButtonClipBehaviorExtension on AppButtonClipBehavior {
  String get displayName {
    switch (this) {
      case AppButtonClipBehavior.none:
        return 'None';
      case AppButtonClipBehavior.antiAlias:
        return 'Anti Alias';
      case AppButtonClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case AppButtonClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case AppButtonClipBehavior.none:
        return Clip.none;
      case AppButtonClipBehavior.antiAlias:
        return Clip.antiAlias;
      case AppButtonClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case AppButtonClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension AppButtonAnimationTypeExtension on AppButtonAnimationType {
  String get displayName {
    switch (this) {
      case AppButtonAnimationType.none:
        return 'None';
      case AppButtonAnimationType.scale:
        return 'Scale';
      case AppButtonAnimationType.fade:
        return 'Fade';
      case AppButtonAnimationType.slide:
        return 'Slide';
      case AppButtonAnimationType.elevation:
        return 'Elevation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppButtonAnimationType.none:
        return Curves.linear;
      case AppButtonAnimationType.scale:
        return Curves.elasticOut;
      case AppButtonAnimationType.fade:
        return Curves.easeInOut;
      case AppButtonAnimationType.slide:
        return Curves.easeOutCubic;
      case AppButtonAnimationType.elevation:
        return Curves.easeInOutQuart;
    }
  }

  bool get hasAnimation {
    return this != AppButtonAnimationType.none;
  }
}
