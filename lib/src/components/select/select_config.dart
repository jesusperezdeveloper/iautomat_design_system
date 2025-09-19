import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'select_config.freezed.dart';

@freezed
class DSSelectConfig with _$DSSelectConfig {
  const factory DSSelectConfig({
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0))
    EdgeInsets contentPadding,
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
    @Default(300.0) double maxDropdownHeight,
    @Default(8.0) double itemSpacing,
    @Default(16.0) double labelSpacing,
    @Default(4.0) double helperErrorSpacing,
    @Default(true) bool enableFloatingLabel,
    @Default(24.0) double iconSize,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(8.0) double dropdownOffset,
    @Default(16.0) double searchFieldHeight,
    @Default(true) bool enableDropdownElevation,
    @Default(4.0) double dropdownElevation,
    @Default(56.0) double itemHeight,
    @Default(8.0) double chipSpacing,
    @Default(32.0) double chipHeight,
    @Default(200) int searchDebounceMs,
  }) = _DSSelectConfig;

  const DSSelectConfig._();
}

@freezed
class DSSelectColors with _$DSSelectColors {
  const factory DSSelectColors({
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
    required Color iconColor,
    required Color disabledIconColor,
    required Color dropdownIconColor,
    required Color cursorColor,
    required Color selectionColor,
    required Color counterTextColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color dropdownBackgroundColor,
    required Color dropdownShadowColor,
    required Color itemBackgroundColor,
    required Color itemHoverColor,
    required Color itemSelectedColor,
    required Color itemTextColor,
    required Color itemDisabledTextColor,
    required Color searchFieldBackgroundColor,
    required Color searchFieldBorderColor,
    required Color chipBackgroundColor,
    required Color chipTextColor,
    required Color chipBorderColor,
    required Color chipDeleteIconColor,
  }) = _DSSelectColors;

  const DSSelectColors._();

  factory DSSelectColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return DSSelectColors(
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
      iconColor: colorScheme.onSurfaceVariant,
      disabledIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      dropdownIconColor: colorScheme.onSurfaceVariant,
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withValues(alpha: 0.12),
      counterTextColor: colorScheme.onSurfaceVariant,
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      dropdownBackgroundColor: colorScheme.surface,
      dropdownShadowColor: colorScheme.shadow.withValues(alpha: 0.1),
      itemBackgroundColor: Colors.transparent,
      itemHoverColor: colorScheme.onSurface.withValues(alpha: 0.08),
      itemSelectedColor: colorScheme.primary.withValues(alpha: 0.12),
      itemTextColor: colorScheme.onSurface,
      itemDisabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      searchFieldBackgroundColor: colorScheme.surfaceContainerHighest,
      searchFieldBorderColor: colorScheme.outline.withValues(alpha: 0.5),
      chipBackgroundColor: colorScheme.secondaryContainer,
      chipTextColor: colorScheme.onSecondaryContainer,
      chipBorderColor: colorScheme.outline.withValues(alpha: 0.2),
      chipDeleteIconColor:
          colorScheme.onSecondaryContainer.withValues(alpha: 0.7),
    );
  }
}

enum DSSelectState {
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

enum DSSelectVariant {
  single,
  multi,
  searchable,
}

@freezed
class DSSelectItem<T> with _$DSSelectItem<T> {
  const factory DSSelectItem({
    required T value,
    required String label,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    @Default(true) bool enabled,
    String? searchableText,
  }) = _DSSelectItem<T>;

  const DSSelectItem._();
}

class DSSelectValidator {
  static String? required<T>(T? value) {
    if (value == null) {
      return 'Este campo es requerido';
    }
    if (value is List && value.isEmpty) {
      return 'Selecciona al menos una opción';
    }
    return null;
  }

  static String? Function(T?) minSelection<T>(int minCount) {
    return (T? value) {
      if (value is List && value.length < minCount) {
        return 'Selecciona al menos $minCount ${minCount > 1 ? 'opciones' : 'opción'}';
      }
      return null;
    };
  }

  static String? Function(T?) maxSelection<T>(int maxCount) {
    return (T? value) {
      if (value is List && value.length > maxCount) {
        return 'Selecciona máximo $maxCount ${maxCount > 1 ? 'opciones' : 'opción'}';
      }
      return null;
    };
  }

  static String? Function(T?) combine<T>(
      List<String? Function(T?)> validators) {
    return (T? value) {
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
