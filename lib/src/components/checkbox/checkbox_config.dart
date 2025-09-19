import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'checkbox_config.freezed.dart';

@freezed
class DSCheckboxConfig with _$DSCheckboxConfig {
  const factory DSCheckboxConfig({
    @Default(20.0) double size,
    @Default(2.0) double borderWidth,
    @Default(BorderRadius.all(Radius.circular(4))) BorderRadius borderRadius,
    @Default(EdgeInsets.symmetric(horizontal: 8.0)) EdgeInsets contentPadding,
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(2.0) double focusWidth,
    @Default(4.0) double focusOffset,
    @Default(0.12) double hoverOpacity,
    @Default(0.08) double focusOpacity,
    @Default(0.04) double pressedOpacity,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSplashEffect,
    @Default(48.0) double minimumTouchTargetSize,
  }) = _DSCheckboxConfig;

  const DSCheckboxConfig._();
}

@freezed
class DSCheckboxColors with _$DSCheckboxColors {
  const factory DSCheckboxColors({
    required Color borderColor,
    required Color fillColor,
    required Color checkColor,
    required Color disabledBorderColor,
    required Color disabledFillColor,
    required Color disabledCheckColor,
    required Color hoverOverlay,
    required Color focusOverlay,
    required Color pressedOverlay,
    required Color labelColor,
    required Color disabledLabelColor,
  }) = _AppCheckboxColors;

  const DSCheckboxColors._();

  factory DSCheckboxColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return DSCheckboxColors(
      borderColor: isDark
          ? colorScheme.onSurface.withValues(alpha: 0.6)
          : colorScheme.onSurfaceVariant,
      fillColor: colorScheme.primary,
      checkColor: colorScheme.onPrimary,
      disabledBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledFillColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledCheckColor: colorScheme.surface,
      hoverOverlay: colorScheme.primary.withValues(alpha: 0.08),
      focusOverlay: colorScheme.primary.withValues(alpha: 0.12),
      pressedOverlay: colorScheme.primary.withValues(alpha: 0.12),
      labelColor: colorScheme.onSurface,
      disabledLabelColor: colorScheme.onSurface.withValues(alpha: 0.38),
    );
  }
}

enum DSCheckboxState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSCheckboxValue {
  unchecked,
  checked,
  indeterminate,
}
