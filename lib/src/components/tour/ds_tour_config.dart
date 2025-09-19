import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_tour_config.freezed.dart';

enum DSTourVariant { coachmarks }

enum DSTourState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

enum DSTourPosition {
  top,
  bottom,
  left,
  right,
  center,
  auto
}

enum DSTourAlignment {
  start,
  center,
  end
}

@freezed
class DSTourConfig with _$DSTourConfig {
  const factory DSTourConfig({
    @Default(DSTourVariant.coachmarks) DSTourVariant variant,
    @Default(DSTourState.defaultState) DSTourState state,
    @Default(true) bool enableSkip,
    @Default(true) bool enableNext,
    @Default(true) bool enablePrevious,
    @Default(true) bool enableDismissOnTap,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool enableA11y,
    @Default(true) bool autoAdvance,
    @Default(Duration(seconds: 5)) Duration autoAdvanceDuration,
    @Default(Duration(milliseconds: 300)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(true) bool showProgress,
    @Default(true) bool isRtl,
    DSTourColors? colors,
    DSTourSpacing? spacing,
    DSTourTypography? typography,
    DSTourControls? controls,
    DSTourAccessibility? accessibility,
    DSTourAnimation? animation,
  }) = _DSTourConfig;
}

@freezed
class DSTourColors with _$DSTourColors {
  const factory DSTourColors({
    Color? backgroundColor,
    Color? overlayColor,
    Color? highlightColor,
    Color? borderColor,
    Color? textColor,
    Color? titleColor,
    Color? buttonColor,
    Color? buttonTextColor,
    Color? skipButtonColor,
    Color? nextButtonColor,
    Color? previousButtonColor,
    Color? progressColor,
    Color? progressBackgroundColor,
    Color? shadowColor,
    Color? targetHighlightColor,
    Color? targetBorderColor,
  }) = _DSTourColors;
}

@freezed
class DSTourSpacing with _$DSTourSpacing {
  const factory DSTourSpacing({
    @Default(EdgeInsets.all(16.0)) EdgeInsets padding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)) EdgeInsets buttonPadding,
    @Default(EdgeInsets.all(12.0)) EdgeInsets contentPadding,
    @Default(16.0) double spacing,
    @Default(8.0) double buttonSpacing,
    @Default(24.0) double targetPadding,
    @Default(8.0) double borderRadius,
    @Default(40.0) double buttonHeight,
    @Default(120.0) double minWidth,
    @Default(300.0) double maxWidth,
    @Default(4.0) double progressHeight,
    @Default(2.0) double borderWidth,
    @Default(8.0) double elevation,
  }) = _DSTourSpacing;
}

@freezed
class DSTourTypography with _$DSTourTypography {
  const factory DSTourTypography({
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextStyle? buttonStyle,
    TextStyle? skipButtonStyle,
    TextStyle? progressStyle,
  }) = _DSTourTypography;
}

@freezed
class DSTourControls with _$DSTourControls {
  const factory DSTourControls({
    @Default(true) bool showSkipButton,
    @Default(true) bool showNextButton,
    @Default(true) bool showPreviousButton,
    @Default(true) bool showProgress,
    @Default(true) bool showCloseButton,
    Widget? customSkipButton,
    Widget? customNextButton,
    Widget? customPreviousButton,
    Widget? customCloseButton,
    String? skipButtonText,
    String? nextButtonText,
    String? previousButtonText,
    String? finishButtonText,
  }) = _DSTourControls;
}

@freezed
class DSTourAccessibility with _$DSTourAccessibility {
  const factory DSTourAccessibility({
    @Default('Tour') String semanticLabel,
    @Default('Skip tour') String skipButtonLabel,
    @Default('Next step') String nextButtonLabel,
    @Default('Previous step') String previousButtonLabel,
    @Default('Finish tour') String finishButtonLabel,
    @Default('Close tour') String closeButtonLabel,
    @Default('Step {} of {}') String progressLabel,
    @Default('Tour step') String stepLabel,
    @Default(true) bool announceStepChanges,
    @Default(true) bool enableTraversalOrder,
    int? sortKey,
    FocusNode? focusNode,
  }) = _DSTourAccessibility;
}

@freezed
class DSTourAnimation with _$DSTourAnimation {
  const factory DSTourAnimation({
    @Default(Duration(milliseconds: 300)) Duration fadeInDuration,
    @Default(Duration(milliseconds: 200)) Duration fadeOutDuration,
    @Default(Duration(milliseconds: 250)) Duration scaleTransitionDuration,
    @Default(Duration(milliseconds: 150)) Duration slideTransitionDuration,
    @Default(Curves.easeInOut) Curve fadeInCurve,
    @Default(Curves.easeInOut) Curve fadeOutCurve,
    @Default(Curves.easeInOut) Curve scaleTransitionCurve,
    @Default(Curves.easeInOut) Curve slideTransitionCurve,
    @Default(true) bool enableFadeTransition,
    @Default(true) bool enableScaleTransition,
    @Default(true) bool enableSlideTransition,
    @Default(true) bool enableHighlightAnimation,
  }) = _DSTourAnimation;
}

@freezed
class DSTourStep with _$DSTourStep {
  const factory DSTourStep({
    required String id,
    required GlobalKey targetKey,
    required String title,
    String? description,
    @Default(DSTourPosition.auto) DSTourPosition position,
    @Default(DSTourAlignment.center) DSTourAlignment alignment,
    Widget? customContent,
    Widget? customOverlay,
    @Default(true) bool showHighlight,
    @Default(true) bool enableTap,
    @Default(12.0) double targetRadius,
    EdgeInsets? targetPadding,
    Duration? duration,
    VoidCallback? onShow,
    VoidCallback? onHide,
    VoidCallback? onTap,
    Map<String, dynamic>? metadata,
  }) = _DSTourStep;
}

@freezed
class DSTourController with _$DSTourController {
  const factory DSTourController({
    @Default(0) int currentIndex,
    @Default(false) bool isActive,
    @Default(false) bool isCompleted,
    @Default(false) bool isSkipped,
    @Default(false) bool isPaused,
    List<DSTourStep>? steps,
    VoidCallback? onStart,
    VoidCallback? onFinish,
    VoidCallback? onSkip,
    ValueChanged<int>? onStepChanged,
    ValueChanged<DSTourStep>? onStepShow,
    ValueChanged<DSTourStep>? onStepHide,
  }) = _DSTourController;
}