import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_icon_button_config.freezed.dart';

@freezed
class AppIconButtonConfig with _$AppIconButtonConfig {
  const factory AppIconButtonConfig({
    @Default(AppIconButtonVariant.standard) AppIconButtonVariant variant,
    @Default(AppIconButtonState.defaultState) AppIconButtonState state,
    @Default(AppIconButtonSize.medium) AppIconButtonSize size,
    @Default(false) bool isToggled,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    AppIconButtonColors? colors,
    AppIconButtonSpacing? spacing,
    AppIconButtonElevation? elevation,
    AppIconButtonBehavior? behavior,
    AppIconButtonAnimation? animation,
    VoidCallback? onPressed,
    ValueChanged<bool>? onToggle,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _AppIconButtonConfig;
}

@freezed
class AppIconButtonColors with _$AppIconButtonColors {
  const factory AppIconButtonColors({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? iconColor,
    Color? toggledColor,
    Color? toggledBackgroundColor,
  }) = _AppIconButtonColors;
}

@freezed
class AppIconButtonSpacing with _$AppIconButtonSpacing {
  const factory AppIconButtonSpacing({
    @Default(8.0) double padding,
    @Default(8.0) double borderRadius,
    @Default(24.0) double smallSize,
    @Default(40.0) double mediumSize,
    @Default(56.0) double largeSize,
    @Default(true) bool adaptive,
  }) = _AppIconButtonSpacing;
}

@freezed
class AppIconButtonElevation with _$AppIconButtonElevation {
  const factory AppIconButtonElevation({
    @Default(0.0) double defaultElevation,
    @Default(1.0) double hoveredElevation,
    @Default(3.0) double pressedElevation,
    @Default(1.0) double focusedElevation,
    @Default(2.0) double selectedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppIconButtonElevation;
}

@freezed
class AppIconButtonBehavior with _$AppIconButtonBehavior {
  const factory AppIconButtonBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(AppIconButtonClipBehavior.antiAlias) AppIconButtonClipBehavior clipBehavior,
    @Default(200) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool enableToggle,
  }) = _AppIconButtonBehavior;
}

@freezed
class AppIconButtonAnimation with _$AppIconButtonAnimation {
  const factory AppIconButtonAnimation({
    @Default(AppIconButtonAnimationType.scale) AppIconButtonAnimationType type,
    @Default(200) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
    @Default(true) bool enableLoadingAnimation,
    @Default(true) bool enableToggleAnimation,
  }) = _AppIconButtonAnimation;
}

enum AppIconButtonVariant {
  standard,
  filled,
  tonal,
}

enum AppIconButtonState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppIconButtonSize {
  small,
  medium,
  large,
}

enum AppIconButtonClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum AppIconButtonAnimationType {
  none,
  scale,
  fade,
  rotation,
}

extension AppIconButtonVariantExtension on AppIconButtonVariant {
  String get displayName {
    switch (this) {
      case AppIconButtonVariant.standard:
        return 'Standard';
      case AppIconButtonVariant.filled:
        return 'Filled';
      case AppIconButtonVariant.tonal:
        return 'Tonal';
    }
  }

  String get description {
    switch (this) {
      case AppIconButtonVariant.standard:
        return 'Botón de icono estándar sin fondo';
      case AppIconButtonVariant.filled:
        return 'Botón de icono con fondo sólido';
      case AppIconButtonVariant.tonal:
        return 'Botón de icono con fondo tonal';
    }
  }

  bool get hasBackground {
    switch (this) {
      case AppIconButtonVariant.standard:
        return false;
      case AppIconButtonVariant.filled:
      case AppIconButtonVariant.tonal:
        return true;
    }
  }

  Color getBackgroundColor(ColorScheme colorScheme, bool isToggled) {
    if (isToggled) {
      switch (this) {
        case AppIconButtonVariant.standard:
          return colorScheme.inverseSurface;
        case AppIconButtonVariant.filled:
          return colorScheme.primary;
        case AppIconButtonVariant.tonal:
          return colorScheme.secondaryContainer;
      }
    }

    switch (this) {
      case AppIconButtonVariant.standard:
        return Colors.transparent;
      case AppIconButtonVariant.filled:
        return colorScheme.surfaceContainerHighest;
      case AppIconButtonVariant.tonal:
        return colorScheme.secondaryContainer;
    }
  }

  Color getForegroundColor(ColorScheme colorScheme, bool isToggled) {
    if (isToggled) {
      switch (this) {
        case AppIconButtonVariant.standard:
          return colorScheme.onInverseSurface;
        case AppIconButtonVariant.filled:
          return colorScheme.onPrimary;
        case AppIconButtonVariant.tonal:
          return colorScheme.onSecondaryContainer;
      }
    }

    switch (this) {
      case AppIconButtonVariant.standard:
        return colorScheme.onSurfaceVariant;
      case AppIconButtonVariant.filled:
        return colorScheme.primary;
      case AppIconButtonVariant.tonal:
        return colorScheme.onSecondaryContainer;
    }
  }
}

extension AppIconButtonStateExtension on AppIconButtonState {
  String get displayName {
    switch (this) {
      case AppIconButtonState.defaultState:
        return 'Default';
      case AppIconButtonState.hover:
        return 'Hover';
      case AppIconButtonState.pressed:
        return 'Pressed';
      case AppIconButtonState.focus:
        return 'Focus';
      case AppIconButtonState.selected:
        return 'Selected';
      case AppIconButtonState.disabled:
        return 'Disabled';
      case AppIconButtonState.loading:
        return 'Loading';
      case AppIconButtonState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppIconButtonState.defaultState:
      case AppIconButtonState.hover:
      case AppIconButtonState.pressed:
      case AppIconButtonState.focus:
      case AppIconButtonState.selected:
        return true;
      case AppIconButtonState.disabled:
      case AppIconButtonState.loading:
      case AppIconButtonState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppIconButtonState.defaultState:
      case AppIconButtonState.hover:
      case AppIconButtonState.pressed:
      case AppIconButtonState.focus:
      case AppIconButtonState.selected:
        return 1.0;
      case AppIconButtonState.disabled:
        return 0.38;
      case AppIconButtonState.loading:
        return 0.8;
      case AppIconButtonState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppIconButtonState.loading;
  }

  bool get showsSkeleton {
    return this == AppIconButtonState.skeleton;
  }

  bool get canInteract {
    return isInteractive;
  }

  double get elevationMultiplier {
    switch (this) {
      case AppIconButtonState.defaultState:
        return 1.0;
      case AppIconButtonState.hover:
        return 1.5;
      case AppIconButtonState.pressed:
        return 2.0;
      case AppIconButtonState.focus:
        return 1.5;
      case AppIconButtonState.selected:
        return 1.8;
      case AppIconButtonState.disabled:
        return 0.0;
      case AppIconButtonState.loading:
      case AppIconButtonState.skeleton:
        return 1.0;
    }
  }
}

extension AppIconButtonSizeExtension on AppIconButtonSize {
  String get displayName {
    switch (this) {
      case AppIconButtonSize.small:
        return 'Small';
      case AppIconButtonSize.medium:
        return 'Medium';
      case AppIconButtonSize.large:
        return 'Large';
    }
  }

  double getSize(AppIconButtonSpacing spacing) {
    switch (this) {
      case AppIconButtonSize.small:
        return spacing.smallSize;
      case AppIconButtonSize.medium:
        return spacing.mediumSize;
      case AppIconButtonSize.large:
        return spacing.largeSize;
    }
  }

  double get iconSize {
    switch (this) {
      case AppIconButtonSize.small:
        return 18.0;
      case AppIconButtonSize.medium:
        return 24.0;
      case AppIconButtonSize.large:
        return 32.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppIconButtonSize.small:
        return const EdgeInsets.all(4.0);
      case AppIconButtonSize.medium:
        return const EdgeInsets.all(8.0);
      case AppIconButtonSize.large:
        return const EdgeInsets.all(12.0);
    }
  }
}

extension AppIconButtonClipBehaviorExtension on AppIconButtonClipBehavior {
  String get displayName {
    switch (this) {
      case AppIconButtonClipBehavior.none:
        return 'None';
      case AppIconButtonClipBehavior.antiAlias:
        return 'Anti Alias';
      case AppIconButtonClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case AppIconButtonClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case AppIconButtonClipBehavior.none:
        return Clip.none;
      case AppIconButtonClipBehavior.antiAlias:
        return Clip.antiAlias;
      case AppIconButtonClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case AppIconButtonClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension AppIconButtonAnimationTypeExtension on AppIconButtonAnimationType {
  String get displayName {
    switch (this) {
      case AppIconButtonAnimationType.none:
        return 'None';
      case AppIconButtonAnimationType.scale:
        return 'Scale';
      case AppIconButtonAnimationType.fade:
        return 'Fade';
      case AppIconButtonAnimationType.rotation:
        return 'Rotation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppIconButtonAnimationType.none:
        return Curves.linear;
      case AppIconButtonAnimationType.scale:
        return Curves.easeInOutCubic;
      case AppIconButtonAnimationType.fade:
        return Curves.easeInOut;
      case AppIconButtonAnimationType.rotation:
        return Curves.easeInOutCubic;
    }
  }

  bool get hasAnimation {
    return this != AppIconButtonAnimationType.none;
  }
}