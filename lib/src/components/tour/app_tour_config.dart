import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_tour_config.freezed.dart';

enum AppTourVariant { coachmarks }

enum AppTourState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

enum AppTourPosition {
  top,
  bottom,
  left,
  right,
  center,
  auto
}

enum AppTourAlignment {
  start,
  center,
  end
}

@freezed
class AppTourConfig with _$AppTourConfig {
  const factory AppTourConfig({
    @Default(AppTourVariant.coachmarks) AppTourVariant variant,
    @Default(AppTourState.defaultState) AppTourState state,
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
    AppTourColors? colors,
    AppTourSpacing? spacing,
    AppTourTypography? typography,
    AppTourControls? controls,
    AppTourAccessibility? accessibility,
    AppTourAnimation? animation,
  }) = _AppTourConfig;
}

@freezed
class AppTourColors with _$AppTourColors {
  const factory AppTourColors({
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
  }) = _AppTourColors;
}

@freezed
class AppTourSpacing with _$AppTourSpacing {
  const factory AppTourSpacing({
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
  }) = _AppTourSpacing;
}

@freezed
class AppTourTypography with _$AppTourTypography {
  const factory AppTourTypography({
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextStyle? buttonStyle,
    TextStyle? skipButtonStyle,
    TextStyle? progressStyle,
  }) = _AppTourTypography;
}

@freezed
class AppTourControls with _$AppTourControls {
  const factory AppTourControls({
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
  }) = _AppTourControls;
}

@freezed
class AppTourAccessibility with _$AppTourAccessibility {
  const factory AppTourAccessibility({
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
  }) = _AppTourAccessibility;
}

@freezed
class AppTourAnimation with _$AppTourAnimation {
  const factory AppTourAnimation({
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
  }) = _AppTourAnimation;
}

@freezed
class AppTourStep with _$AppTourStep {
  const factory AppTourStep({
    required String id,
    required GlobalKey targetKey,
    required String title,
    String? description,
    @Default(AppTourPosition.auto) AppTourPosition position,
    @Default(AppTourAlignment.center) AppTourAlignment alignment,
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
  }) = _AppTourStep;
}

@freezed
class AppTourController with _$AppTourController {
  const factory AppTourController({
    @Default(0) int currentIndex,
    @Default(false) bool isActive,
    @Default(false) bool isCompleted,
    @Default(false) bool isSkipped,
    @Default(false) bool isPaused,
    List<AppTourStep>? steps,
    VoidCallback? onStart,
    VoidCallback? onFinish,
    VoidCallback? onSkip,
    ValueChanged<int>? onStepChanged,
    ValueChanged<AppTourStep>? onStepShow,
    ValueChanged<AppTourStep>? onStepHide,
  }) = _AppTourController;
}