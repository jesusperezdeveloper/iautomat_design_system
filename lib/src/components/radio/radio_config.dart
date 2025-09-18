import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'radio_config.freezed.dart';

@freezed
class AppRadioConfig with _$AppRadioConfig {
  const factory AppRadioConfig({
    @Default(20.0) double size,
    @Default(2.0) double borderWidth,
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
    @Default(8.0) double segmentSpacing,
    @Default(4.0) double segmentBorderRadius,
    @Default(1.0) double segmentBorderWidth,
  }) = _AppRadioConfig;

  const AppRadioConfig._();
}

@freezed
class AppRadioColors with _$AppRadioColors {
  const factory AppRadioColors({
    required Color borderColor,
    required Color fillColor,
    required Color dotColor,
    required Color disabledBorderColor,
    required Color disabledFillColor,
    required Color disabledDotColor,
    required Color hoverOverlay,
    required Color focusOverlay,
    required Color pressedOverlay,
    required Color labelColor,
    required Color disabledLabelColor,
    required Color segmentBackgroundColor,
    required Color segmentSelectedBackgroundColor,
    required Color segmentBorderColor,
    required Color segmentSelectedBorderColor,
    required Color segmentTextColor,
    required Color segmentSelectedTextColor,
  }) = _AppRadioColors;

  const AppRadioColors._();

  factory AppRadioColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AppRadioColors(
      borderColor: isDark
          ? colorScheme.onSurface.withValues(alpha: 0.6)
          : colorScheme.onSurfaceVariant,
      fillColor: colorScheme.primary,
      dotColor: colorScheme.onPrimary,
      disabledBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledFillColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledDotColor: colorScheme.surface,
      hoverOverlay: colorScheme.primary.withValues(alpha: 0.08),
      focusOverlay: colorScheme.primary.withValues(alpha: 0.12),
      pressedOverlay: colorScheme.primary.withValues(alpha: 0.12),
      labelColor: colorScheme.onSurface,
      disabledLabelColor: colorScheme.onSurface.withValues(alpha: 0.38),
      segmentBackgroundColor: colorScheme.surface,
      segmentSelectedBackgroundColor: colorScheme.secondaryContainer,
      segmentBorderColor: colorScheme.outline,
      segmentSelectedBorderColor: colorScheme.primary,
      segmentTextColor: colorScheme.onSurface,
      segmentSelectedTextColor: colorScheme.onSecondaryContainer,
    );
  }
}

enum AppRadioState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppRadioVariant {
  standard,
  segmented,
}

class AppRadioValue<T> {
  const AppRadioValue({
    required this.value,
    required this.label,
    this.enabled = true,
    this.icon,
  });

  final T value;
  final String label;
  final bool enabled;
  final IconData? icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppRadioValue &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() =>
      'AppRadioValue(value: $value, label: $label, enabled: $enabled)';
}
