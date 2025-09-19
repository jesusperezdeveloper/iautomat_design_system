import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_split_view_config.freezed.dart';

@freezed
class DSSplitViewConfig with _$DSSplitViewConfig {
  const factory DSSplitViewConfig({
    @Default(DSSplitViewVariant.resizable) DSSplitViewVariant variant,
    @Default(DSSplitViewState.defaultState) DSSplitViewState state,
    @Default(DSSplitViewDirection.horizontal) DSSplitViewDirection direction,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(0.5) double initialRatio,
    DSSplitViewMinSizes? minSizes,
    DSSplitViewColors? colors,
    DSSplitViewSpacing? spacing,
    DSSplitViewElevation? elevation,
    DSSplitViewBehavior? behavior,
    DSSplitViewAnimation? animation,
    VoidCallback? onRatioChanged,
    ValueChanged<double>? onRatioUpdated,
  }) = _DSSplitViewConfig;
}

@freezed
class DSSplitViewMinSizes with _$DSSplitViewMinSizes {
  const factory DSSplitViewMinSizes({
    @Default(100.0) double startMin,
    @Default(100.0) double endMin,
    @Default(200.0) double startMax,
    @Default(200.0) double endMax,
  }) = _DSSplitViewMinSizes;
}

@freezed
class DSSplitViewColors with _$DSSplitViewColors {
  const factory DSSplitViewColors({
    Color? backgroundColor,
    Color? startPaneColor,
    Color? endPaneColor,
    Color? dividerColor,
    Color? dividerHoverColor,
    Color? dividerPressedColor,
    Color? dividerFocusColor,
    Color? dividerDisabledColor,
    Color? handleColor,
    Color? handleHoverColor,
    Color? handlePressedColor,
    Color? shadowColor,
    Color? borderColor,
  }) = _DSSplitViewColors;
}

@freezed
class DSSplitViewSpacing with _$DSSplitViewSpacing {
  const factory DSSplitViewSpacing({
    @Default(1.0) double dividerWidth,
    @Default(8.0) double handleWidth,
    @Default(24.0) double handleHeight,
    @Default(4.0) double padding,
    @Default(2.0) double borderRadius,
    @Default(48.0) double minHeight,
    @Default(48.0) double minWidth,
    @Default(true) bool adaptive,
  }) = _DSSplitViewSpacing;
}

@freezed
class DSSplitViewElevation with _$DSSplitViewElevation {
  const factory DSSplitViewElevation({
    @Default(0.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(4.0) double pressedElevation,
    @Default(1.0) double focusedElevation,
    @Default(1.0) double dividerElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _DSSplitViewElevation;
}

@freezed
class DSSplitViewBehavior with _$DSSplitViewBehavior {
  const factory DSSplitViewBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableResize,
    @Default(true) bool enableKeyboardResize,
    @Default(DSSplitViewResizeMode.drag) DSSplitViewResizeMode resizeMode,
    @Default(true) bool snapToEdges,
    @Default(0.1) double snapThreshold,
    @Default(300) int animationDuration,
    @Default(true) bool maintainState,
    @Default(false) bool collapseOnOverflow,
  }) = _DSSplitViewBehavior;
}

@freezed
class DSSplitViewAnimation with _$DSSplitViewAnimation {
  const factory DSSplitViewAnimation({
    @Default(DSSplitViewAnimationType.easeInOut)
    DSSplitViewAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableResizeAnimation,
  }) = _DSSplitViewAnimation;
}

enum DSSplitViewVariant {
  resizable,
  twoPane,
}

enum DSSplitViewState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSSplitViewDirection {
  horizontal,
  vertical,
}

enum DSSplitViewResizeMode {
  drag,
  tap,
  keyboard,
  programmatic,
}

enum DSSplitViewAnimationType {
  none,
  linear,
  easeIn,
  easeOut,
  easeInOut,
  bounce,
}

extension DSSplitViewVariantExtension on DSSplitViewVariant {
  String get displayName {
    switch (this) {
      case DSSplitViewVariant.resizable:
        return 'Resizable';
      case DSSplitViewVariant.twoPane:
        return 'Two Pane';
    }
  }

  String get description {
    switch (this) {
      case DSSplitViewVariant.resizable:
        return 'Vista dividida redimensionable con divisor arrastrable';
      case DSSplitViewVariant.twoPane:
        return 'Vista de dos paneles fija sin redimensionar';
    }
  }

  bool get isResizable {
    switch (this) {
      case DSSplitViewVariant.resizable:
        return true;
      case DSSplitViewVariant.twoPane:
        return false;
    }
  }

  bool get showsDivider {
    switch (this) {
      case DSSplitViewVariant.resizable:
        return true;
      case DSSplitViewVariant.twoPane:
        return true;
    }
  }
}

extension DSSplitViewStateExtension on DSSplitViewState {
  String get displayName {
    switch (this) {
      case DSSplitViewState.defaultState:
        return 'Default';
      case DSSplitViewState.hover:
        return 'Hover';
      case DSSplitViewState.pressed:
        return 'Pressed';
      case DSSplitViewState.focus:
        return 'Focus';
      case DSSplitViewState.selected:
        return 'Selected';
      case DSSplitViewState.disabled:
        return 'Disabled';
      case DSSplitViewState.loading:
        return 'Loading';
      case DSSplitViewState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSSplitViewState.defaultState:
      case DSSplitViewState.hover:
      case DSSplitViewState.pressed:
      case DSSplitViewState.focus:
      case DSSplitViewState.selected:
        return true;
      case DSSplitViewState.disabled:
      case DSSplitViewState.loading:
      case DSSplitViewState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSSplitViewState.defaultState:
      case DSSplitViewState.hover:
      case DSSplitViewState.pressed:
      case DSSplitViewState.focus:
      case DSSplitViewState.selected:
        return 1.0;
      case DSSplitViewState.disabled:
        return 0.6;
      case DSSplitViewState.loading:
        return 0.8;
      case DSSplitViewState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSSplitViewState.loading;
  }

  bool get showsSkeleton {
    return this == DSSplitViewState.skeleton;
  }

  bool get canResize {
    switch (this) {
      case DSSplitViewState.defaultState:
      case DSSplitViewState.hover:
      case DSSplitViewState.pressed:
      case DSSplitViewState.focus:
      case DSSplitViewState.selected:
        return true;
      case DSSplitViewState.disabled:
      case DSSplitViewState.loading:
      case DSSplitViewState.skeleton:
        return false;
    }
  }
}

extension DSSplitViewDirectionExtension on DSSplitViewDirection {
  String get displayName {
    switch (this) {
      case DSSplitViewDirection.horizontal:
        return 'Horizontal';
      case DSSplitViewDirection.vertical:
        return 'Vertical';
    }
  }

  bool get isHorizontal {
    return this == DSSplitViewDirection.horizontal;
  }

  bool get isVertical {
    return this == DSSplitViewDirection.vertical;
  }

  Axis get axis {
    switch (this) {
      case DSSplitViewDirection.horizontal:
        return Axis.horizontal;
      case DSSplitViewDirection.vertical:
        return Axis.vertical;
    }
  }
}

extension DSSplitViewResizeModeExtension on DSSplitViewResizeMode {
  String get displayName {
    switch (this) {
      case DSSplitViewResizeMode.drag:
        return 'Drag';
      case DSSplitViewResizeMode.tap:
        return 'Tap';
      case DSSplitViewResizeMode.keyboard:
        return 'Keyboard';
      case DSSplitViewResizeMode.programmatic:
        return 'Programmatic';
    }
  }

  bool get supportsDrag {
    switch (this) {
      case DSSplitViewResizeMode.drag:
      case DSSplitViewResizeMode.keyboard:
        return true;
      case DSSplitViewResizeMode.tap:
      case DSSplitViewResizeMode.programmatic:
        return false;
    }
  }

  bool get supportsKeyboard {
    switch (this) {
      case DSSplitViewResizeMode.keyboard:
      case DSSplitViewResizeMode.drag:
        return true;
      case DSSplitViewResizeMode.tap:
      case DSSplitViewResizeMode.programmatic:
        return false;
    }
  }
}

extension DSSplitViewAnimationTypeExtension on DSSplitViewAnimationType {
  String get displayName {
    switch (this) {
      case DSSplitViewAnimationType.none:
        return 'None';
      case DSSplitViewAnimationType.linear:
        return 'Linear';
      case DSSplitViewAnimationType.easeIn:
        return 'Ease In';
      case DSSplitViewAnimationType.easeOut:
        return 'Ease Out';
      case DSSplitViewAnimationType.easeInOut:
        return 'Ease In Out';
      case DSSplitViewAnimationType.bounce:
        return 'Bounce';
    }
  }

  Curve get curve {
    switch (this) {
      case DSSplitViewAnimationType.none:
        return Curves.linear;
      case DSSplitViewAnimationType.linear:
        return Curves.linear;
      case DSSplitViewAnimationType.easeIn:
        return Curves.easeIn;
      case DSSplitViewAnimationType.easeOut:
        return Curves.easeOut;
      case DSSplitViewAnimationType.easeInOut:
        return Curves.easeInOut;
      case DSSplitViewAnimationType.bounce:
        return Curves.bounceOut;
    }
  }
}
