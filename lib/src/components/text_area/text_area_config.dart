import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'text_area_config.freezed.dart';

@freezed
class AppTextAreaConfig with _$AppTextAreaConfig {
  const factory AppTextAreaConfig({
    @Default(EdgeInsets.all(16.0)) EdgeInsets contentPadding,
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(2.0) double borderWidth,
    @Default(12.0) double borderRadius,
    @Default(2.0) double focusBorderWidth,
    @Default(0.12) double hoverOpacity,
    @Default(0.08) double focusOpacity,
    @Default(0.04) double pressedOpacity,
    @Default(true) bool enableHapticFeedback,
    @Default(80.0) double minimumHeight,
    @Default(200.0) double maximumHeight,
    @Default(3) int defaultMinLines,
    @Default(null) int? defaultMaxLines, // null = unlimited
    @Default(8.0) double prefixSuffixSpacing,
    @Default(16.0) double labelSpacing,
    @Default(4.0) double helperErrorSpacing,
    @Default(true) bool enableFloatingLabel,
    @Default(true) bool enableCharacterCounter,
    @Default(24.0) double iconSize,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(true) bool enableAutoResize,
    @Default(20.0) double lineHeight,
    @Default(true) bool enableScrollPhysics,
  }) = _AppTextAreaConfig;

  const AppTextAreaConfig._();
}

@freezed
class AppTextAreaColors with _$AppTextAreaColors {
  const factory AppTextAreaColors({
    required Color borderColor,
    required Color focusedBorderColor,
    required Color errorBorderColor,
    required Color disabledBorderColor,
    required Color fillColor,
    required Color disabledFillColor,
    required Color textColor,
    required Color disabledTextColor,
    required Color hintColor,
    required Color disabledHintColor,
    required Color labelColor,
    required Color focusedLabelColor,
    required Color errorLabelColor,
    required Color disabledLabelColor,
    required Color helperTextColor,
    required Color errorTextColor,
    required Color prefixIconColor,
    required Color suffixIconColor,
    required Color disabledPrefixIconColor,
    required Color disabledSuffixIconColor,
    required Color cursorColor,
    required Color selectionColor,
    required Color selectionHandleColor,
    required Color counterTextColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color scrollbarColor,
    required Color scrollbarThumbColor,
  }) = _AppTextAreaColors;

  const AppTextAreaColors._();

  factory AppTextAreaColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AppTextAreaColors(
      borderColor: colorScheme.outline,
      focusedBorderColor: colorScheme.primary,
      errorBorderColor: colorScheme.error,
      disabledBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      fillColor: isDark
        ? colorScheme.surfaceContainerHighest
        : colorScheme.surfaceContainerLowest,
      disabledFillColor: colorScheme.onSurface.withValues(alpha: 0.04),
      textColor: colorScheme.onSurface,
      disabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      hintColor: colorScheme.onSurfaceVariant,
      disabledHintColor: colorScheme.onSurface.withValues(alpha: 0.38),
      labelColor: colorScheme.onSurfaceVariant,
      focusedLabelColor: colorScheme.primary,
      errorLabelColor: colorScheme.error,
      disabledLabelColor: colorScheme.onSurface.withValues(alpha: 0.38),
      helperTextColor: colorScheme.onSurfaceVariant,
      errorTextColor: colorScheme.error,
      prefixIconColor: colorScheme.onSurfaceVariant,
      suffixIconColor: colorScheme.onSurfaceVariant,
      disabledPrefixIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      disabledSuffixIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withValues(alpha: 0.12),
      selectionHandleColor: colorScheme.primary,
      counterTextColor: colorScheme.onSurfaceVariant,
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      scrollbarColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.2),
      scrollbarThumbColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
    );
  }
}

enum AppTextAreaState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
  error,
}

enum AppTextAreaVariant {
  autoResize,
}

class AppTextAreaValidator {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  static String? Function(String?) minLength(int minLength) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      if (value.length < minLength) {
        return 'Mínimo $minLength caracteres';
      }
      return null;
    };
  }

  static String? Function(String?) maxLength(int maxLength) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      if (value.length > maxLength) {
        return 'Máximo $maxLength caracteres';
      }
      return null;
    };
  }

  static String? Function(String?) minWords(int minWords) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return null;
      }
      final words = value.trim().split(RegExp(r'\s+'));
      if (words.length < minWords) {
        return 'Mínimo $minWords palabra${minWords > 1 ? 's' : ''}';
      }
      return null;
    };
  }

  static String? Function(String?) maxWords(int maxWords) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return null;
      }
      final words = value.trim().split(RegExp(r'\s+'));
      if (words.length > maxWords) {
        return 'Máximo $maxWords palabra${maxWords > 1 ? 's' : ''}';
      }
      return null;
    };
  }

  static String? Function(String?) combine(List<String? Function(String?)> validators) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}