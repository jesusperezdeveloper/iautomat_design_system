import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_fab_config.freezed.dart';

@freezed
class DSFabConfig with _$DSFabConfig {
  const factory DSFabConfig({
    @Default(DSFabVariant.regular) DSFabVariant variant,
    @Default(DSFabState.defaultState) DSFabState state,
    @Default(DSFabLocation.endFloat) DSFabLocation location,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isInteractive,
    DSFabColors? colors,
    DSFabSpacing? spacing,
    DSFabElevation? elevation,
    DSFabBehavior? behavior,
    DSFabAnimation? animation,
    VoidCallback? onPressed,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) = _DSFabConfig;
}

@freezed
class DSFabColors with _$DSFabColors {
  const factory DSFabColors({
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
class DSFabSpacing with _$DSFabSpacing {
  const factory DSFabSpacing({
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
class DSFabElevation with _$DSFabElevation {
  const factory DSFabElevation({
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
class DSFabBehavior with _$DSFabBehavior {
  const factory DSFabBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableRipple,
    @Default(true) bool enableHover,
    @Default(true) bool enableFocus,
    @Default(true) bool maintainState,
    @Default(DSFabClipBehavior.antiAlias) DSFabClipBehavior clipBehavior,
    @Default(300) int animationDuration,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showSkeletonAnimation,
    @Default(true) bool heroAnimation,
  }) = _AppFabBehavior;
}

@freezed
class DSFabAnimation with _$DSFabAnimation {
  const factory DSFabAnimation({
    @Default(DSFabAnimationType.scale) DSFabAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableHoverAnimation,
    @Default(true) bool enablePressAnimation,
    @Default(true) bool enableLoadingAnimation,
    @Default(true) bool enableEntryAnimation,
  }) = _AppFabAnimation;
}

enum DSFabVariant {
  regular,
  small,
  large,
  extended,
}

enum DSFabState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSFabLocation {
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

enum DSFabClipBehavior {
  none,
  antiAlias,
  antiAliasWithSaveLayer,
  hardEdge,
}

enum DSFabAnimationType {
  none,
  scale,
  fade,
  slide,
  rotation,
}

extension DSFabVariantExtension on DSFabVariant {
  String get displayName {
    switch (this) {
      case DSFabVariant.regular:
        return 'Regular';
      case DSFabVariant.small:
        return 'Small';
      case DSFabVariant.large:
        return 'Large';
      case DSFabVariant.extended:
        return 'Extended';
    }
  }

  String get description {
    switch (this) {
      case DSFabVariant.regular:
        return 'FAB de tamaño estándar con icono';
      case DSFabVariant.small:
        return 'FAB compacto para espacios reducidos';
      case DSFabVariant.large:
        return 'FAB grande para mayor prominencia';
      case DSFabVariant.extended:
        return 'FAB extendido con icono y texto';
    }
  }

  double getSize(DSFabSpacing spacing) {
    switch (this) {
      case DSFabVariant.regular:
        return spacing.regularSize;
      case DSFabVariant.small:
        return spacing.smallSize;
      case DSFabVariant.large:
        return spacing.largeSize;
      case DSFabVariant.extended:
        return spacing.regularSize;
    }
  }

  double get iconSize {
    switch (this) {
      case DSFabVariant.regular:
        return 24.0;
      case DSFabVariant.small:
        return 20.0;
      case DSFabVariant.large:
        return 36.0;
      case DSFabVariant.extended:
        return 24.0;
    }
  }

  bool get isExtended {
    return this == DSFabVariant.extended;
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSFabVariant.regular:
        return const EdgeInsets.all(16.0);
      case DSFabVariant.small:
        return const EdgeInsets.all(8.0);
      case DSFabVariant.large:
        return const EdgeInsets.all(24.0);
      case DSFabVariant.extended:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
    }
  }
}

extension DSFabStateExtension on DSFabState {
  String get displayName {
    switch (this) {
      case DSFabState.defaultState:
        return 'Default';
      case DSFabState.hover:
        return 'Hover';
      case DSFabState.pressed:
        return 'Pressed';
      case DSFabState.focus:
        return 'Focus';
      case DSFabState.selected:
        return 'Selected';
      case DSFabState.disabled:
        return 'Disabled';
      case DSFabState.loading:
        return 'Loading';
      case DSFabState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSFabState.defaultState:
      case DSFabState.hover:
      case DSFabState.pressed:
      case DSFabState.focus:
      case DSFabState.selected:
        return true;
      case DSFabState.disabled:
      case DSFabState.loading:
      case DSFabState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSFabState.defaultState:
      case DSFabState.hover:
      case DSFabState.pressed:
      case DSFabState.focus:
      case DSFabState.selected:
        return 1.0;
      case DSFabState.disabled:
        return 0.6;
      case DSFabState.loading:
        return 0.8;
      case DSFabState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSFabState.loading;
  }

  bool get showsSkeleton {
    return this == DSFabState.skeleton;
  }

  bool get canInteract {
    return isInteractive;
  }

  double get elevationMultiplier {
    switch (this) {
      case DSFabState.defaultState:
        return 1.0;
      case DSFabState.hover:
        return 1.3;
      case DSFabState.pressed:
        return 2.0;
      case DSFabState.focus:
        return 1.3;
      case DSFabState.selected:
        return 1.5;
      case DSFabState.disabled:
        return 0.0;
      case DSFabState.loading:
      case DSFabState.skeleton:
        return 1.0;
    }
  }
}

extension DSFabLocationExtension on DSFabLocation {
  String get displayName {
    switch (this) {
      case DSFabLocation.startFloat:
        return 'Start Float';
      case DSFabLocation.centerFloat:
        return 'Center Float';
      case DSFabLocation.endFloat:
        return 'End Float';
      case DSFabLocation.startTop:
        return 'Start Top';
      case DSFabLocation.centerTop:
        return 'Center Top';
      case DSFabLocation.endTop:
        return 'End Top';
      case DSFabLocation.miniStartTop:
        return 'Mini Start Top';
      case DSFabLocation.miniCenterTop:
        return 'Mini Center Top';
      case DSFabLocation.miniEndTop:
        return 'Mini End Top';
      case DSFabLocation.startDocked:
        return 'Start Docked';
      case DSFabLocation.centerDocked:
        return 'Center Docked';
      case DSFabLocation.endDocked:
        return 'End Docked';
      case DSFabLocation.miniStartDocked:
        return 'Mini Start Docked';
      case DSFabLocation.miniCenterDocked:
        return 'Mini Center Docked';
      case DSFabLocation.miniEndDocked:
        return 'Mini End Docked';
    }
  }

  FloatingActionButtonLocation get flutterLocation {
    switch (this) {
      case DSFabLocation.startFloat:
        return FloatingActionButtonLocation.startFloat;
      case DSFabLocation.centerFloat:
        return FloatingActionButtonLocation.centerFloat;
      case DSFabLocation.endFloat:
        return FloatingActionButtonLocation.endFloat;
      case DSFabLocation.startTop:
        return FloatingActionButtonLocation.startTop;
      case DSFabLocation.centerTop:
        return FloatingActionButtonLocation.centerTop;
      case DSFabLocation.endTop:
        return FloatingActionButtonLocation.endTop;
      case DSFabLocation.miniStartTop:
        return FloatingActionButtonLocation.miniStartTop;
      case DSFabLocation.miniCenterTop:
        return FloatingActionButtonLocation.miniCenterTop;
      case DSFabLocation.miniEndTop:
        return FloatingActionButtonLocation.miniEndTop;
      case DSFabLocation.startDocked:
        return FloatingActionButtonLocation.startDocked;
      case DSFabLocation.centerDocked:
        return FloatingActionButtonLocation.centerDocked;
      case DSFabLocation.endDocked:
        return FloatingActionButtonLocation.endDocked;
      case DSFabLocation.miniStartDocked:
        return FloatingActionButtonLocation.miniStartDocked;
      case DSFabLocation.miniCenterDocked:
        return FloatingActionButtonLocation.miniCenterDocked;
      case DSFabLocation.miniEndDocked:
        return FloatingActionButtonLocation.miniEndDocked;
    }
  }
}

extension DSFabClipBehaviorExtension on DSFabClipBehavior {
  String get displayName {
    switch (this) {
      case DSFabClipBehavior.none:
        return 'None';
      case DSFabClipBehavior.antiAlias:
        return 'Anti Alias';
      case DSFabClipBehavior.antiAliasWithSaveLayer:
        return 'Anti Alias with Save Layer';
      case DSFabClipBehavior.hardEdge:
        return 'Hard Edge';
    }
  }

  Clip get flutterClip {
    switch (this) {
      case DSFabClipBehavior.none:
        return Clip.none;
      case DSFabClipBehavior.antiAlias:
        return Clip.antiAlias;
      case DSFabClipBehavior.antiAliasWithSaveLayer:
        return Clip.antiAliasWithSaveLayer;
      case DSFabClipBehavior.hardEdge:
        return Clip.hardEdge;
    }
  }
}

extension DSFabAnimationTypeExtension on DSFabAnimationType {
  String get displayName {
    switch (this) {
      case DSFabAnimationType.none:
        return 'None';
      case DSFabAnimationType.scale:
        return 'Scale';
      case DSFabAnimationType.fade:
        return 'Fade';
      case DSFabAnimationType.slide:
        return 'Slide';
      case DSFabAnimationType.rotation:
        return 'Rotation';
    }
  }

  Curve get defaultCurve {
    switch (this) {
      case DSFabAnimationType.none:
        return Curves.linear;
      case DSFabAnimationType.scale:
        return Curves.elasticOut;
      case DSFabAnimationType.fade:
        return Curves.easeInOut;
      case DSFabAnimationType.slide:
        return Curves.easeOutCubic;
      case DSFabAnimationType.rotation:
        return Curves.easeInOutCubic;
    }
  }

  bool get hasAnimation {
    return this != DSFabAnimationType.none;
  }
}
