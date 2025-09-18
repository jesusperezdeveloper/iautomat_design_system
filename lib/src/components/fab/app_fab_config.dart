import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_fab_config.freezed.dart';

@freezed
class AppFabConfig with _$AppFabConfig {
  const factory AppFabConfig({
    @Default(AppFabVariant.regular) AppFabVariant variant,
    @Default(AppFabState.defaultState) AppFabState state,
    @Default(AppFabLocation.endFloat) AppFabLocation location,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    AppFabColors? colors,
    AppFabSpacing? spacing,
    AppFabElevation? elevation,
    AppFabBehavior? behavior,
    AppFabAnimation? animation,
    VoidCallback? onPressed,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _AppFabConfig;
}

@freezed
class AppFabColors with _$AppFabColors {
  const factory AppFabColors({
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
    Color? labelColor,
  }) = _AppFabColors;
}

@freezed
class AppFabSpacing with _$AppFabSpacing {
  const factory AppFabSpacing({
    @Default(16.0) double padding,
    @Default(8.0) double iconLabelSpacing,
    @Default(16.0) double borderRadius,
    @Default(56.0) double regularSize,
    @Default(40.0) double smallSize,
    @Default(96.0) double largeSize,
    @Default(true) bool adaptive,
  }) = _AppFabSpacing;
}

@freezed
class AppFabElevation with _$AppFabElevation {
  const factory AppFabElevation({
    @Default(6.0) double defaultElevation,
    @Default(8.0) double hoveredElevation,
    @Default(12.0) double pressedElevation,
    @Default(8.0) double focusedElevation,
    @Default(10.0) double selectedElevation,
    @Default(0.0) double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppFabElevation;
}

@freezed
class AppFabBehavior with _$AppFabBehavior {
  const factory AppFabBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(AppFabClipBehavior.antiAlias) AppFabClipBehavior clipBehavior,
    @Default(300) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool heroAnimation,
  }) = _AppFabBehavior;
}

@freezed
class AppFabAnimation with _$AppFabAnimation {
  const factory AppFabAnimation({
    @Default(AppFabAnimationType.scale) AppFabAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
    @Default(true) bool enableLoadingAnimation,
    @Default(true) bool enableEntryAnimation,
  }) = _AppFabAnimation;
}

enum AppFabVariant {
  regular,
  small,
  large,
  extended,
}

enum AppFabState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppFabLocation {
  startFloat,
  centerFloat,
  endFloat,
  startTop,
  centerTop,
  endTop,
  miniStartTop,
  miniCenterTop,
  miniEndTop,
  startDocked,
  centerDocked,
  endDocked,
  miniStartDocked,
  miniCenterDocked,
  miniEndDocked,
}

enum AppFabClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum AppFabAnimationType {
  none,
  scale,
  fade,
  slide,
  rotation,
}

extension AppFabVariantExtension on AppFabVariant {
  String get displayName {
    switch (this) {
      case AppFabVariant.regular:
        return 'Regular';
      case AppFabVariant.small:
        return 'Small';
      case AppFabVariant.large:
        return 'Large';
      case AppFabVariant.extended:
        return 'Extended';
    }
  }

  String get description {
    switch (this) {
      case AppFabVariant.regular:
        return 'FAB de tamaño estándar con icono';
      case AppFabVariant.small:
        return 'FAB compacto para espacios reducidos';
      case AppFabVariant.large:
        return 'FAB grande para mayor prominencia';
      case AppFabVariant.extended:
        return 'FAB extendido con icono y texto';
    }
  }

  double getSize(AppFabSpacing spacing) {
    switch (this) {
      case AppFabVariant.regular:
        return spacing.regularSize;
      case AppFabVariant.small:
        return spacing.smallSize;
      case AppFabVariant.large:
        return spacing.largeSize;
      case AppFabVariant.extended:
        return spacing.regularSize;
    }
  }

  double get iconSize {
    switch (this) {
      case AppFabVariant.regular:
        return 24.0;
      case AppFabVariant.small:
        return 20.0;
      case AppFabVariant.large:
        return 36.0;
      case AppFabVariant.extended:
        return 24.0;
    }
  }

  bool get isExtended {
    return this == AppFabVariant.extended;
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppFabVariant.regular:
        return const EdgeInsets.all(16.0);
      case AppFabVariant.small:
        return const EdgeInsets.all(8.0);
      case AppFabVariant.large:
        return const EdgeInsets.all(24.0);
      case AppFabVariant.extended:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
    }
  }
}

extension AppFabStateExtension on AppFabState {
  String get displayName {
    switch (this) {
      case AppFabState.defaultState:
        return 'Default';
      case AppFabState.hover:
        return 'Hover';
      case AppFabState.pressed:
        return 'Pressed';
      case AppFabState.focus:
        return 'Focus';
      case AppFabState.selected:
        return 'Selected';
      case AppFabState.disabled:
        return 'Disabled';
      case AppFabState.loading:
        return 'Loading';
      case AppFabState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppFabState.defaultState:
      case AppFabState.hover:
      case AppFabState.pressed:
      case AppFabState.focus:
      case AppFabState.selected:
        return true;
      case AppFabState.disabled:
      case AppFabState.loading:
      case AppFabState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppFabState.defaultState:
      case AppFabState.hover:
      case AppFabState.pressed:
      case AppFabState.focus:
      case AppFabState.selected:
        return 1.0;
      case AppFabState.disabled:
        return 0.6;
      case AppFabState.loading:
        return 0.8;
      case AppFabState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppFabState.loading;
  }

  bool get showsSkeleton {
    return this == AppFabState.skeleton;
  }

  bool get canInteract {
    return isInteractive;
  }

  double get elevationMultiplier {
    switch (this) {
      case AppFabState.defaultState:
        return 1.0;
      case AppFabState.hover:
        return 1.3;
      case AppFabState.pressed:
        return 2.0;
      case AppFabState.focus:
        return 1.3;
      case AppFabState.selected:
        return 1.5;
      case AppFabState.disabled:
        return 0.0;
      case AppFabState.loading:
      case AppFabState.skeleton:
        return 1.0;
    }
  }
}

extension AppFabLocationExtension on AppFabLocation {
  String get displayName {
    switch (this) {
      case AppFabLocation.startFloat:
        return 'Start Float';
      case AppFabLocation.centerFloat:
        return 'Center Float';
      case AppFabLocation.endFloat:
        return 'End Float';
      case AppFabLocation.startTop:
        return 'Start Top';
      case AppFabLocation.centerTop:
        return 'Center Top';
      case AppFabLocation.endTop:
        return 'End Top';
      case AppFabLocation.miniStartTop:
        return 'Mini Start Top';
      case AppFabLocation.miniCenterTop:
        return 'Mini Center Top';
      case AppFabLocation.miniEndTop:
        return 'Mini End Top';
      case AppFabLocation.startDocked:
        return 'Start Docked';
      case AppFabLocation.centerDocked:
        return 'Center Docked';
      case AppFabLocation.endDocked:
        return 'End Docked';
      case AppFabLocation.miniStartDocked:
        return 'Mini Start Docked';
      case AppFabLocation.miniCenterDocked:
        return 'Mini Center Docked';
      case AppFabLocation.miniEndDocked:
        return 'Mini End Docked';
    }
  }

  FloatingActionButtonLocation get flutterLocation {
    switch (this) {
      case AppFabLocation.startFloat:
        return FloatingActionButtonLocation.startFloat;
      case AppFabLocation.centerFloat:
        return FloatingActionButtonLocation.centerFloat;
      case AppFabLocation.endFloat:
        return FloatingActionButtonLocation.endFloat;
      case AppFabLocation.startTop:
        return FloatingActionButtonLocation.startTop;
      case AppFabLocation.centerTop:
        return FloatingActionButtonLocation.centerTop;
      case AppFabLocation.endTop:
        return FloatingActionButtonLocation.endTop;
      case AppFabLocation.miniStartTop:
        return FloatingActionButtonLocation.miniStartTop;
      case AppFabLocation.miniCenterTop:
        return FloatingActionButtonLocation.miniCenterTop;
      case AppFabLocation.miniEndTop:
        return FloatingActionButtonLocation.miniEndTop;
      case AppFabLocation.startDocked:
        return FloatingActionButtonLocation.startDocked;
      case AppFabLocation.centerDocked:
        return FloatingActionButtonLocation.centerDocked;
      case AppFabLocation.endDocked:
        return FloatingActionButtonLocation.endDocked;
      case AppFabLocation.miniStartDocked:
        return FloatingActionButtonLocation.miniStartDocked;
      case AppFabLocation.miniCenterDocked:
        return FloatingActionButtonLocation.miniCenterDocked;
      case AppFabLocation.miniEndDocked:
        return FloatingActionButtonLocation.miniEndDocked;
    }
  }
}

extension AppFabClipBehaviorExtension on AppFabClipBehavior {
  String get displayName {
    switch (this) {
      case AppFabClipBehavior.none:
        return 'None';
      case AppFabClipBehavior.antiAlias:
        return 'Anti Alias';
      case AppFabClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case AppFabClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case AppFabClipBehavior.none:
        return Clip.none;
      case AppFabClipBehavior.antiAlias:
        return Clip.antiAlias;
      case AppFabClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case AppFabClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension AppFabAnimationTypeExtension on AppFabAnimationType {
  String get displayName {
    switch (this) {
      case AppFabAnimationType.none:
        return 'None';
      case AppFabAnimationType.scale:
        return 'Scale';
      case AppFabAnimationType.fade:
        return 'Fade';
      case AppFabAnimationType.slide:
        return 'Slide';
      case AppFabAnimationType.rotation:
        return 'Rotation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case AppFabAnimationType.none:
        return Curves.linear;
      case AppFabAnimationType.scale:
        return Curves.elasticOut;
      case AppFabAnimationType.fade:
        return Curves.easeInOut;
      case AppFabAnimationType.slide:
        return Curves.easeOutCubic;
      case AppFabAnimationType.rotation:
        return Curves.easeInOutCubic;
    }
  }

  bool get hasAnimation {
    return this != AppFabAnimationType.none;
  }
}
