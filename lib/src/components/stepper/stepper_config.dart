import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'stepper_config.freezed.dart';

@freezed
class DSStepperConfig with _$DSStepperConfig {
  const factory DSStepperConfig({
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(24.0) double stepRadius,
    @Default(2.0) double stepBorderWidth,
    @Default(1.0) double connectorThickness,
    @Default(16.0) double horizontalSpacing,
    @Default(24.0) double verticalSpacing,
    @Default(EdgeInsets.all(16.0)) EdgeInsets contentPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0))
    EdgeInsets stepPadding,
    @Default(16.0) double titleSpacing,
    @Default(8.0) double subtitleSpacing,
    @Default(12.0) double iconSize,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool showStepNumbers,
    @Default(true) bool showConnectors,
    @Default(48.0) double minimumStepHeight,
    @Default(true) bool allowStepTapping,
    @Default(false) bool showOptionalBadge,
    @Default(true) bool enableStepValidation,
    @Default(8.0) double badgeSpacing,
    @Default(true) bool animateTransitions,
    @Default(300.0) double maxStepWidth,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(true) bool showProgressIndicator,
    @Default(4.0) double progressIndicatorHeight,
    @Default(true) bool compactMode,
    @Default(12.0) double compactSpacing,
    @Default(true) bool showStepHeaders,
    @Default(true) bool expandActiveStep,
    @Default(200.0) double expandedStepHeight,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool showErrorStates,
    @Default(true) bool autoScrollToActiveStep,
    @Default(Duration(milliseconds: 300)) Duration scrollAnimationDuration,
    @Default(Curves.easeOutCubic) Curve scrollAnimationCurve,
  }) = _DSStepperConfig;

  const DSStepperConfig._();
}

@freezed
class DSStepperColors with _$DSStepperColors {
  const factory DSStepperColors({
    required Color activeStepColor,
    required Color completedStepColor,
    required Color inactiveStepColor,
    required Color disabledStepColor,
    required Color errorStepColor,
    required Color activeStepBorderColor,
    required Color completedStepBorderColor,
    required Color inactiveStepBorderColor,
    required Color disabledStepBorderColor,
    required Color errorStepBorderColor,
    required Color activeStepTextColor,
    required Color completedStepTextColor,
    required Color inactiveStepTextColor,
    required Color disabledStepTextColor,
    required Color errorStepTextColor,
    required Color connectorColor,
    required Color completedConnectorColor,
    required Color inactiveConnectorColor,
    required Color disabledConnectorColor,
    required Color titleColor,
    required Color activeTitleColor,
    required Color completedTitleColor,
    required Color disabledTitleColor,
    required Color errorTitleColor,
    required Color subtitleColor,
    required Color activeSubtitleColor,
    required Color completedSubtitleColor,
    required Color disabledSubtitleColor,
    required Color errorSubtitleColor,
    required Color contentBackgroundColor,
    required Color activeContentBackgroundColor,
    required Color hoverOverlayColor,
    required Color focusOverlayColor,
    required Color pressedOverlayColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color loadingIndicatorColor,
    required Color progressIndicatorColor,
    required Color optionalBadgeColor,
    required Color optionalBadgeTextColor,
    required Color controlButtonColor,
    required Color controlButtonTextColor,
    required Color controlButtonDisabledColor,
    required Color controlButtonDisabledTextColor,
  }) = _DSStepperColors;

  const DSStepperColors._();

  factory DSStepperColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return DSStepperColors(
      activeStepColor: colorScheme.primary,
      completedStepColor: colorScheme.primary,
      inactiveStepColor: colorScheme.outline,
      disabledStepColor: colorScheme.onSurface.withValues(alpha: 0.12),
      errorStepColor: colorScheme.error,
      activeStepBorderColor: colorScheme.primary,
      completedStepBorderColor: colorScheme.primary,
      inactiveStepBorderColor: colorScheme.outline,
      disabledStepBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      errorStepBorderColor: colorScheme.error,
      activeStepTextColor: colorScheme.onPrimary,
      completedStepTextColor: colorScheme.onPrimary,
      inactiveStepTextColor: colorScheme.onSurfaceVariant,
      disabledStepTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      errorStepTextColor: colorScheme.onError,
      connectorColor: colorScheme.outline,
      completedConnectorColor: colorScheme.primary,
      inactiveConnectorColor: colorScheme.outline,
      disabledConnectorColor: colorScheme.onSurface.withValues(alpha: 0.12),
      titleColor: colorScheme.onSurface,
      activeTitleColor: colorScheme.onSurface,
      completedTitleColor: colorScheme.onSurface,
      disabledTitleColor: colorScheme.onSurface.withValues(alpha: 0.38),
      errorTitleColor: colorScheme.error,
      subtitleColor: colorScheme.onSurfaceVariant,
      activeSubtitleColor: colorScheme.onSurfaceVariant,
      completedSubtitleColor: colorScheme.onSurfaceVariant,
      disabledSubtitleColor: colorScheme.onSurface.withValues(alpha: 0.38),
      errorSubtitleColor: colorScheme.error,
      contentBackgroundColor: colorScheme.surface,
      activeContentBackgroundColor: colorScheme.surfaceContainerLowest,
      hoverOverlayColor: colorScheme.onSurface.withValues(alpha: 0.08),
      focusOverlayColor: colorScheme.onSurface.withValues(alpha: 0.12),
      pressedOverlayColor: colorScheme.onSurface.withValues(alpha: 0.12),
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      loadingIndicatorColor: colorScheme.primary,
      progressIndicatorColor: colorScheme.primary,
      optionalBadgeColor: colorScheme.outline,
      optionalBadgeTextColor: colorScheme.onSurfaceVariant,
      controlButtonColor: colorScheme.primary,
      controlButtonTextColor: colorScheme.onPrimary,
      controlButtonDisabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
      controlButtonDisabledTextColor:
          colorScheme.onSurface.withValues(alpha: 0.38),
    );
  }
}

enum DSStepperState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSStepperVariant {
  horizontal,
  vertical,
}

enum DSStepState {
  inactive,
  active,
  completed,
  disabled,
  error,
}

@freezed
class DSStep with _$DSStep {
  const factory DSStep({
    required String title,
    String? subtitle,
    Widget? content,
    Widget? icon,
    @Default(DSStepState.inactive) DSStepState state,
    @Default(false) bool isOptional,
    @Default(true) bool isInteractive,
    String? errorText,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
    String? semanticLabel,
  }) = _DSStep;

  const DSStep._();

  bool get isActive => state == DSStepState.active;
  bool get isCompleted => state == DSStepState.completed;
  bool get isDisabled => state == DSStepState.disabled;
  bool get hasError => state == DSStepState.error;
  bool get canInteract => isInteractive && !isDisabled;
}

@freezed
class DSStepperControlsBuilder with _$DSStepperControlsBuilder {
  const factory DSStepperControlsBuilder({
    Widget? continueButton,
    Widget? cancelButton,
    String? continueLabel,
    String? cancelLabel,
    bool? showContinue,
    bool? showCancel,
    bool? enableContinue,
    bool? enableCancel,
  }) = _DSStepperControlsBuilder;

  const DSStepperControlsBuilder._();
}

class DSStepperValidator {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este paso es requerido';
    }
    return null;
  }

  static String? Function(String?) custom(
      bool Function(String?) validator, String message) {
    return (String? value) {
      if (value != null && !validator(value)) {
        return message;
      }
      return null;
    };
  }

  static String? Function(DSStep) stepValidator(
      bool Function(DSStep) validator, String message) {
    return (DSStep step) {
      if (!validator(step)) {
        return message;
      }
      return null;
    };
  }

  static String? Function(List<DSStep>) allStepsValidator(
    bool Function(List<DSStep>) validator,
    String message,
  ) {
    return (List<DSStep> steps) {
      if (!validator(steps)) {
        return message;
      }
      return null;
    };
  }

  static String? Function(int, List<DSStep>) currentStepValidator(
    bool Function(int, List<DSStep>) validator,
    String message,
  ) {
    return (int currentStep, List<DSStep> steps) {
      if (!validator(currentStep, steps)) {
        return message;
      }
      return null;
    };
  }
}

extension DSStepperExtensions on List<DSStep> {
  int get activeStepIndex {
    for (int i = 0; i < length; i++) {
      if (this[i].isActive) return i;
    }
    return -1;
  }

  int get completedStepsCount {
    return where((step) => step.isCompleted).length;
  }

  int get totalStepsCount => length;

  double get progress {
    if (isEmpty) return 0.0;
    return completedStepsCount / totalStepsCount;
  }

  bool get allStepsCompleted {
    return every((step) => step.isCompleted || step.isOptional);
  }

  bool get hasErrors {
    return any((step) => step.hasError);
  }

  List<DSStep> get errorSteps {
    return where((step) => step.hasError).toList();
  }

  DSStep? get currentStep {
    final index = activeStepIndex;
    return index != -1 ? this[index] : null;
  }

  DSStep? stepAt(int index) {
    return index >= 0 && index < length ? this[index] : null;
  }

  List<DSStep> updateStepAt(int index, DSStep newStep) {
    if (index < 0 || index >= length) return this;
    final newList = List<DSStep>.from(this);
    newList[index] = newStep;
    return newList;
  }

  List<DSStep> markStepCompleted(int index) {
    return updateStepAt(
        index, stepAt(index)!.copyWith(state: DSStepState.completed));
  }

  List<DSStep> markStepActive(int index) {
    final newList = <DSStep>[];
    for (int i = 0; i < length; i++) {
      if (i == index) {
        newList.add(this[i].copyWith(state: DSStepState.active));
      } else if (this[i].isActive) {
        newList.add(this[i].copyWith(state: DSStepState.inactive));
      } else {
        newList.add(this[i]);
      }
    }
    return newList;
  }

  List<DSStep> markStepError(int index, String? errorText) {
    return updateStepAt(
      index,
      stepAt(index)!.copyWith(state: DSStepState.error, errorText: errorText),
    );
  }
}
