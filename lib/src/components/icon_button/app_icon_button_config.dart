import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_icon_button_config.freezed.dart';

@freezed
class DSIconButtonConfig with _$DSIconButtonConfig {
  const factory DSIconButtonConfig({
    @Default(DSIconButtonVariant.standard) DSIconButtonVariant variant,
    @Default(DSIconButtonState.defaultState) DSIconButtonState state,
    @Default(DSIconButtonSize.medium) DSIconButtonSize size,
    @Default(false) bool isToggled,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    DSIconButtonColors? colors,
    DSIconButtonSpacing? spacing,
    DSIconButtonElevation? elevation,
    DSIconButtonBehavior? behavior,
    DSIconButtonAnimation? animation,
    VoidCallback? onPressed,
    ValueChanged<bool>? onToggle,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _DSIconButtonConfig;
}

@freezed
class DSIconButtonColors with _$DSIconButtonColors {
  const factory DSIconButtonColors({
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
class DSIconButtonSpacing with _$DSIconButtonSpacing {
  const factory DSIconButtonSpacing({
    @Default(8.0) double padding,
    @Default(8.0) double borderRadius,
    @Default(24.0) double smallSize,
    @Default(40.0) double mediumSize,
    @Default(56.0) double largeSize,
    @Default(true) bool adaptive,
  }) = _AppIconButtonSpacing;
}

@freezed
class DSIconButtonElevation with _$DSIconButtonElevation {
  const factory DSIconButtonElevation({
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
class DSIconButtonBehavior with _$DSIconButtonBehavior {
  const factory DSIconButtonBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(DSIconButtonClipBehavior.antiAlias)
    DSIconButtonClipBehavior clipBehavior,
    @Default(200) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool enableToggle,
  }) = _AppIconButtonBehavior;
}

@freezed
class DSIconButtonAnimation with _$DSIconButtonAnimation {
  const factory DSIconButtonAnimation({
    @Default(DSIconButtonAnimationType.scale) DSIconButtonAnimationType type,
    @Default(200) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
    @Default(true) bool enableLoadingAnimation,
    @Default(true) bool enableToggleAnimation,
  }) = _AppIconButtonAnimation;
}

enum DSIconButtonVariant {
  standard,
  filled,
  tonal,
}

enum DSIconButtonState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSIconButtonSize {
  small,
  medium,
  large,
}

enum DSIconButtonClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum DSIconButtonAnimationType {
  none,
  scale,
  fade,
  rotation,
}

extension DSIconButtonVariantExtension on DSIconButtonVariant {
  String get displayName {
    switch (this) {
      case DSIconButtonVariant.standard:
        return 'Standard';
      case DSIconButtonVariant.filled:
        return 'Filled';
      case DSIconButtonVariant.tonal:
        return 'Tonal';
    }
  }

  String get description {
    switch (this) {
      case DSIconButtonVariant.standard:
        return 'Botón de icono estándar sin fondo';
      case DSIconButtonVariant.filled:
        return 'Botón de icono con fondo sólido';
      case DSIconButtonVariant.tonal:
        return 'Botón de icono con fondo tonal';
    }
  }

  bool get hasBackground {
    switch (this) {
      case DSIconButtonVariant.standard:
        return false;
      case DSIconButtonVariant.filled:
      case DSIconButtonVariant.tonal:
        return true;
    }
  }

  Color getBackgroundColor(ColorScheme colorScheme, bool isToggled) {
    if (isToggled) {
      switch (this) {
        case DSIconButtonVariant.standard:
          return colorScheme.inverseSurface;
        case DSIconButtonVariant.filled:
          return colorScheme.primary;
        case DSIconButtonVariant.tonal:
          return colorScheme.secondaryContainer;
      }
    }

    switch (this) {
      case DSIconButtonVariant.standard:
        return Colors.transparent;
      case DSIconButtonVariant.filled:
        return colorScheme.surfaceContainerHighest;
      case DSIconButtonVariant.tonal:
        return colorScheme.secondaryContainer;
    }
  }

  Color getForegroundColor(ColorScheme colorScheme, bool isToggled) {
    if (isToggled) {
      switch (this) {
        case DSIconButtonVariant.standard:
          return colorScheme.onInverseSurface;
        case DSIconButtonVariant.filled:
          return colorScheme.onPrimary;
        case DSIconButtonVariant.tonal:
          return colorScheme.onSecondaryContainer;
      }
    }

    switch (this) {
      case DSIconButtonVariant.standard:
        return colorScheme.onSurfaceVariant;
      case DSIconButtonVariant.filled:
        return colorScheme.primary;
      case DSIconButtonVariant.tonal:
        return colorScheme.onSecondaryContainer;
    }
  }
}

extension DSIconButtonStateExtension on DSIconButtonState {
  String get displayName {
    switch (this) {
      case DSIconButtonState.defaultState:
        return 'Default';
      case DSIconButtonState.hover:
        return 'Hover';
      case DSIconButtonState.pressed:
        return 'Pressed';
      case DSIconButtonState.focus:
        return 'Focus';
      case DSIconButtonState.selected:
        return 'Selected';
      case DSIconButtonState.disabled:
        return 'Disabled';
      case DSIconButtonState.loading:
        return 'Loading';
      case DSIconButtonState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSIconButtonState.defaultState:
      case DSIconButtonState.hover:
      case DSIconButtonState.pressed:
      case DSIconButtonState.focus:
      case DSIconButtonState.selected:
        return true;
      case DSIconButtonState.disabled:
      case DSIconButtonState.loading:
      case DSIconButtonState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSIconButtonState.defaultState:
      case DSIconButtonState.hover:
      case DSIconButtonState.pressed:
      case DSIconButtonState.focus:
      case DSIconButtonState.selected:
        return 1.0;
      case DSIconButtonState.disabled:
        return 0.38;
      case DSIconButtonState.loading:
        return 0.8;
      case DSIconButtonState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSIconButtonState.loading;
  }

  bool get showsSkeleton {
    return this == DSIconButtonState.skeleton;
  }

  bool get canInteract {
    return isInteractive;
  }

  double get elevationMultiplier {
    switch (this) {
      case DSIconButtonState.defaultState:
        return 1.0;
      case DSIconButtonState.hover:
        return 1.5;
      case DSIconButtonState.pressed:
        return 2.0;
      case DSIconButtonState.focus:
        return 1.5;
      case DSIconButtonState.selected:
        return 1.8;
      case DSIconButtonState.disabled:
        return 0.0;
      case DSIconButtonState.loading:
      case DSIconButtonState.skeleton:
        return 1.0;
    }
  }
}

extension DSIconButtonSizeExtension on DSIconButtonSize {
  String get displayName {
    switch (this) {
      case DSIconButtonSize.small:
        return 'Small';
      case DSIconButtonSize.medium:
        return 'Medium';
      case DSIconButtonSize.large:
        return 'Large';
    }
  }

  double getSize(DSIconButtonSpacing spacing) {
    switch (this) {
      case DSIconButtonSize.small:
        return spacing.smallSize;
      case DSIconButtonSize.medium:
        return spacing.mediumSize;
      case DSIconButtonSize.large:
        return spacing.largeSize;
    }
  }

  double get iconSize {
    switch (this) {
      case DSIconButtonSize.small:
        return 18.0;
      case DSIconButtonSize.medium:
        return 24.0;
      case DSIconButtonSize.large:
        return 32.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSIconButtonSize.small:
        return const EdgeInsets.all(4.0);
      case DSIconButtonSize.medium:
        return const EdgeInsets.all(8.0);
      case DSIconButtonSize.large:
        return const EdgeInsets.all(12.0);
    }
  }
}

extension DSIconButtonClipBehaviorExtension on DSIconButtonClipBehavior {
  String get displayName {
    switch (this) {
      case DSIconButtonClipBehavior.none:
        return 'None';
      case DSIconButtonClipBehavior.antiAlias:
        return 'Anti Alias';
      case DSIconButtonClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case DSIconButtonClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case DSIconButtonClipBehavior.none:
        return Clip.none;
      case DSIconButtonClipBehavior.antiAlias:
        return Clip.antiAlias;
      case DSIconButtonClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case DSIconButtonClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension DSIconButtonAnimationTypeExtension on DSIconButtonAnimationType {
  String get displayName {
    switch (this) {
      case DSIconButtonAnimationType.none:
        return 'None';
      case DSIconButtonAnimationType.scale:
        return 'Scale';
      case DSIconButtonAnimationType.fade:
        return 'Fade';
      case DSIconButtonAnimationType.rotation:
        return 'Rotation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSIconButtonAnimationType.none:
        return Curves.linear;
      case DSIconButtonAnimationType.scale:
        return Curves.easeInOutCubic;
      case DSIconButtonAnimationType.fade:
        return Curves.easeInOut;
      case DSIconButtonAnimationType.rotation:
        return Curves.easeInOutCubic;
    }
  }

  bool get hasAnimation {
    return this != DSIconButtonAnimationType.none;
  }
}
