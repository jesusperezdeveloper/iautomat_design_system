import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'text_field_config.freezed.dart';

@freezed
class DSTextFieldConfig with _$DSTextFieldConfig {
  const factory DSTextFieldConfig({
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
    @Default(48.0) double minimumHeight,
    @Default(4) int maxLinesMultiline,
    @Default(8.0) double prefixSuffixSpacing,
    @Default(16.0) double labelSpacing,
    @Default(4.0) double helperErrorSpacing,
    @Default(true) bool enableFloatingLabel,
    @Default(true) bool enableCharacterCounter,
    @Default(24.0) double iconSize,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
  }) = _DSTextFieldConfig;

  const DSTextFieldConfig._();
}

@freezed
class DSTextFieldColors with _$DSTextFieldColors {
  const factory DSTextFieldColors({
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
  }) = _AppTextFieldColors;

  const DSTextFieldColors._();

  factory DSTextFieldColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return DSTextFieldColors(
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
    );
  }
}

enum DSTextFieldState {
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

enum DSTextFieldVariant {
  single,
  multiline,
  password,
}

class DSTextFieldValidator {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Ingresa un email válido';
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

  static String? numeric(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    if (double.tryParse(value.trim()) == null) {
      return 'Solo se permiten números';
    }
    return null;
  }

  static String? Function(String?) combine(
      List<String? Function(String?)> validators) {
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

class DSTextFieldFormatters {
  static List<TextInputFormatter> numeric() => [
        FilteringTextInputFormatter.digitsOnly,
      ];

  static List<TextInputFormatter> decimal() => [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ];

  static List<TextInputFormatter> alphanumeric() => [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
      ];

  static List<TextInputFormatter> phoneNumber() => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ];

  static List<TextInputFormatter> upperCase() => [
        UpperCaseTextFormatter(),
      ];

  static List<TextInputFormatter> lowerCase() => [
        LowerCaseTextFormatter(),
      ];

  static List<TextInputFormatter> noSpaces() => [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ];

  static List<TextInputFormatter> maxLength(int length) => [
        LengthLimitingTextInputFormatter(length),
      ];
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
