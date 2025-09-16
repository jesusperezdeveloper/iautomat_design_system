import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_split_view_config.freezed.dart';

@freezed
class AppSplitViewConfig with _$AppSplitViewConfig {
  const factory AppSplitViewConfig({
    @Default(AppSplitViewVariant.resizable) AppSplitViewVariant variant,
    @Default(AppSplitViewState.defaultState) AppSplitViewState state,
    @Default(AppSplitViewDirection.horizontal) AppSplitViewDirection direction,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(0.5) double initialRatio,
    AppSplitViewMinSizes? minSizes,
    AppSplitViewColors? colors,
    AppSplitViewSpacing? spacing,
    AppSplitViewElevation? elevation,
    AppSplitViewBehavior? behavior,
    AppSplitViewAnimation? animation,
    VoidCallback? onRatioChanged,
    ValueChanged<double>? onRatioUpdated,
  }) = _AppSplitViewConfig;
}

@freezed
class AppSplitViewMinSizes with _$AppSplitViewMinSizes {
  const factory AppSplitViewMinSizes({
    @Default(100.0) double startMin,
    @Default(100.0) double endMin,
    @Default(200.0) double startMax,
    @Default(200.0) double endMax,
  }) = _AppSplitViewMinSizes;
}

@freezed
class AppSplitViewColors with _$AppSplitViewColors {
  const factory AppSplitViewColors({
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
  }) = _AppSplitViewColors;
}

@freezed
class AppSplitViewSpacing with _$AppSplitViewSpacing {
  const factory AppSplitViewSpacing({
    @Default(1.0) double dividerWidth,
    @Default(8.0) double handleWidth,
    @Default(24.0) double handleHeight,
    @Default(4.0) double padding,
    @Default(2.0) double borderRadius,
    @Default(48.0) double minHeight,
    @Default(48.0) double minWidth,
    @Default(true) bool adaptive,
  }) = _AppSplitViewSpacing;
}

@freezed
class AppSplitViewElevation with _$AppSplitViewElevation {
  const factory AppSplitViewElevation({
    @Default(0.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(4.0) double pressedElevation,
    @Default(1.0) double focusedElevation,
    @Default(1.0) double dividerElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppSplitViewElevation;
}

@freezed
class AppSplitViewBehavior with _$AppSplitViewBehavior {
  const factory AppSplitViewBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableResize,
    @Default(true) bool enableKeyboardResize,
    @Default(AppSplitViewResizeMode.drag) AppSplitViewResizeMode resizeMode,
    @Default(true) bool snapToEdges,
    @Default(0.1) double snapThreshold,
    @Default(300) int animationDuration,
    @Default(true) bool maintainState,
    @Default(false) bool collapseOnOverflow,
  }) = _AppSplitViewBehavior;
}

@freezed
class AppSplitViewAnimation with _$AppSplitViewAnimation {
  const factory AppSplitViewAnimation({
    @Default(AppSplitViewAnimationType.easeInOut) AppSplitViewAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableResizeAnimation,
  }) = _AppSplitViewAnimation;
}

enum AppSplitViewVariant {
  resizable,
  twoPane,
}

enum AppSplitViewState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppSplitViewDirection {
  horizontal,
  vertical,
}

enum AppSplitViewResizeMode {
  drag,
  tap,
  keyboard,
  programmatic,
}

enum AppSplitViewAnimationType {
  none,
  linear,
  easeIn,
  easeOut,
  easeInOut,
  bounce,
}

extension AppSplitViewVariantExtension on AppSplitViewVariant {
  String get displayName {
    switch (this) {
      case AppSplitViewVariant.resizable:
        return 'Resizable';
      case AppSplitViewVariant.twoPane:
        return 'Two Pane';
    }
  }

  String get description {
    switch (this) {
      case AppSplitViewVariant.resizable:
        return 'Vista dividida redimensionable con divisor arrastrable';
      case AppSplitViewVariant.twoPane:
        return 'Vista de dos paneles fija sin redimensionar';
    }
  }

  bool get isResizable {
    switch (this) {
      case AppSplitViewVariant.resizable:
        return true;
      case AppSplitViewVariant.twoPane:
        return false;
    }
  }

  bool get showsDivider {
    switch (this) {
      case AppSplitViewVariant.resizable:
        return true;
      case AppSplitViewVariant.twoPane:
        return true;
    }
  }
}

extension AppSplitViewStateExtension on AppSplitViewState {
  String get displayName {
    switch (this) {
      case AppSplitViewState.defaultState:
        return 'Default';
      case AppSplitViewState.hover:
        return 'Hover';
      case AppSplitViewState.pressed:
        return 'Pressed';
      case AppSplitViewState.focus:
        return 'Focus';
      case AppSplitViewState.selected:
        return 'Selected';
      case AppSplitViewState.disabled:
        return 'Disabled';
      case AppSplitViewState.loading:
        return 'Loading';
      case AppSplitViewState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppSplitViewState.defaultState:
      case AppSplitViewState.hover:
      case AppSplitViewState.pressed:
      case AppSplitViewState.focus:
      case AppSplitViewState.selected:
        return true;
      case AppSplitViewState.disabled:
      case AppSplitViewState.loading:
      case AppSplitViewState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppSplitViewState.defaultState:
      case AppSplitViewState.hover:
      case AppSplitViewState.pressed:
      case AppSplitViewState.focus:
      case AppSplitViewState.selected:
        return 1.0;
      case AppSplitViewState.disabled:
        return 0.6;
      case AppSplitViewState.loading:
        return 0.8;
      case AppSplitViewState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppSplitViewState.loading;
  }

  bool get showsSkeleton {
    return this == AppSplitViewState.skeleton;
  }

  bool get canResize {
    switch (this) {
      case AppSplitViewState.defaultState:
      case AppSplitViewState.hover:
      case AppSplitViewState.pressed:
      case AppSplitViewState.focus:
      case AppSplitViewState.selected:
        return true;
      case AppSplitViewState.disabled:
      case AppSplitViewState.loading:
      case AppSplitViewState.skeleton:
        return false;
    }
  }
}

extension AppSplitViewDirectionExtension on AppSplitViewDirection {
  String get displayName {
    switch (this) {
      case AppSplitViewDirection.horizontal:
        return 'Horizontal';
      case AppSplitViewDirection.vertical:
        return 'Vertical';
    }
  }

  bool get isHorizontal {
    return this == AppSplitViewDirection.horizontal;
  }

  bool get isVertical {
    return this == AppSplitViewDirection.vertical;
  }

  Axis get axis {
    switch (this) {
      case AppSplitViewDirection.horizontal:
        return Axis.horizontal;
      case AppSplitViewDirection.vertical:
        return Axis.vertical;
    }
  }
}

extension AppSplitViewResizeModeExtension on AppSplitViewResizeMode {
  String get displayName {
    switch (this) {
      case AppSplitViewResizeMode.drag:
        return 'Drag';
      case AppSplitViewResizeMode.tap:
        return 'Tap';
      case AppSplitViewResizeMode.keyboard:
        return 'Keyboard';
      case AppSplitViewResizeMode.programmatic:
        return 'Programmatic';
    }
  }

  bool get supportsDrag {
    switch (this) {
      case AppSplitViewResizeMode.drag:
      case AppSplitViewResizeMode.keyboard:
        return true;
      case AppSplitViewResizeMode.tap:
      case AppSplitViewResizeMode.programmatic:
        return false;
    }
  }

  bool get supportsKeyboard {
    switch (this) {
      case AppSplitViewResizeMode.keyboard:
      case AppSplitViewResizeMode.drag:
        return true;
      case AppSplitViewResizeMode.tap:
      case AppSplitViewResizeMode.programmatic:
        return false;
    }
  }
}

extension AppSplitViewAnimationTypeExtension on AppSplitViewAnimationType {
  String get displayName {
    switch (this) {
      case AppSplitViewAnimationType.none:
        return 'None';
      case AppSplitViewAnimationType.linear:
        return 'Linear';
      case AppSplitViewAnimationType.easeIn:
        return 'Ease In';
      case AppSplitViewAnimationType.easeOut:
        return 'Ease Out';
      case AppSplitViewAnimationType.easeInOut:
        return 'Ease In Out';
      case AppSplitViewAnimationType.bounce:
        return 'Bounce';
    }
  }

  Curve get curve {
    switch (this) {
      case AppSplitViewAnimationType.none:
        return Curves.linear;
      case AppSplitViewAnimationType.linear:
        return Curves.linear;
      case AppSplitViewAnimationType.easeIn:
        return Curves.easeIn;
      case AppSplitViewAnimationType.easeOut:
        return Curves.easeOut;
      case AppSplitViewAnimationType.easeInOut:
        return Curves.easeInOut;
      case AppSplitViewAnimationType.bounce:
        return Curves.bounceOut;
    }
  }
}