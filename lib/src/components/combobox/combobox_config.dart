import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'combobox_config.freezed.dart';

@freezed
class AppComboBoxConfig with _$AppComboBoxConfig {
  const factory AppComboBoxConfig({
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)) EdgeInsets contentPadding,
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
    @Default(300.0) double maxSuggestionsHeight,
    @Default(8.0) double itemSpacing,
    @Default(16.0) double labelSpacing,
    @Default(4.0) double helperErrorSpacing,
    @Default(true) bool enableFloatingLabel,
    @Default(24.0) double iconSize,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(8.0) double suggestionsOffset,
    @Default(true) bool enableSuggestionsElevation,
    @Default(4.0) double suggestionsElevation,
    @Default(56.0) double suggestionItemHeight,
    @Default(300) int typeaheadDebounceMs,
    @Default(1) int minQueryLength,
    @Default(10) int maxSuggestions,
    @Default(true) bool highlightMatches,
    @Default(true) bool caseSensitive,
    @Default(true) bool trimWhitespace,
    @Default(false) bool allowCustomValues,
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showNoResultsMessage,
    @Default(false) bool autoSelectSingle,
    @Default(true) bool dismissOnSelection,
    @Default(true) bool clearOnSelection,
  }) = _AppComboBoxConfig;

  const AppComboBoxConfig._();
}

@freezed
class AppComboBoxColors with _$AppComboBoxColors {
  const factory AppComboBoxColors({
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
    required Color cursorColor,
    required Color selectionColor,
    required Color counterTextColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color suggestionsBackgroundColor,
    required Color suggestionsShadowColor,
    required Color suggestionItemBackgroundColor,
    required Color suggestionItemHoverColor,
    required Color suggestionItemSelectedColor,
    required Color suggestionItemTextColor,
    required Color suggestionItemDisabledTextColor,
    required Color suggestionItemSubtitleColor,
    required Color highlightTextColor,
    required Color highlightBackgroundColor,
    required Color loadingIndicatorColor,
    required Color noResultsTextColor,
  }) = _AppComboBoxColors;

  const AppComboBoxColors._();

  factory AppComboBoxColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AppComboBoxColors(
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
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withValues(alpha: 0.12),
      counterTextColor: colorScheme.onSurfaceVariant,
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      suggestionsBackgroundColor: colorScheme.surface,
      suggestionsShadowColor: colorScheme.shadow.withValues(alpha: 0.1),
      suggestionItemBackgroundColor: Colors.transparent,
      suggestionItemHoverColor: colorScheme.onSurface.withValues(alpha: 0.08),
      suggestionItemSelectedColor: colorScheme.primary.withValues(alpha: 0.12),
      suggestionItemTextColor: colorScheme.onSurface,
      suggestionItemDisabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      suggestionItemSubtitleColor: colorScheme.onSurfaceVariant,
      highlightTextColor: colorScheme.primary,
      highlightBackgroundColor: colorScheme.primary.withValues(alpha: 0.12),
      loadingIndicatorColor: colorScheme.primary,
      noResultsTextColor: colorScheme.onSurfaceVariant,
    );
  }
}

enum AppComboBoxState {
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

enum AppComboBoxVariant {
  typeahead,
}

@freezed
class AppComboBoxSuggestion<T> with _$AppComboBoxSuggestion<T> {
  const factory AppComboBoxSuggestion({
    required T value,
    required String label,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    @Default(true) bool enabled,
    String? searchableText,
    Map<String, dynamic>? metadata,
  }) = _AppComboBoxSuggestion<T>;

  const AppComboBoxSuggestion._();

  /// Get the text to search against
  String get effectiveSearchText => searchableText ?? label;

  /// Check if this suggestion matches the query
  bool matches(String query, {bool caseSensitive = false, bool trimWhitespace = true}) {
    if (query.isEmpty) return true;

    String searchText = effectiveSearchText;
    String searchQuery = query;

    if (trimWhitespace) {
      searchText = searchText.trim();
      searchQuery = searchQuery.trim();
    }

    if (!caseSensitive) {
      searchText = searchText.toLowerCase();
      searchQuery = searchQuery.toLowerCase();
    }

    return searchText.contains(searchQuery);
  }

  /// Get highlighted parts of the label for typeahead display
  List<TextSpan> getHighlightedLabel(String query, Color textColor, Color highlightColor) {
    if (query.isEmpty) {
      return [TextSpan(text: label, style: TextStyle(color: textColor))];
    }

    final queryLower = query.toLowerCase();
    final labelLower = label.toLowerCase();
    final spans = <TextSpan>[];

    int start = 0;
    int index = labelLower.indexOf(queryLower, start);

    while (index != -1) {
      // Add text before match
      if (index > start) {
        spans.add(TextSpan(
          text: label.substring(start, index),
          style: TextStyle(color: textColor),
        ));
      }

      // Add highlighted match
      spans.add(TextSpan(
        text: label.substring(index, index + query.length),
        style: TextStyle(
          color: highlightColor,
          fontWeight: FontWeight.w600,
        ),
      ));

      start = index + query.length;
      index = labelLower.indexOf(queryLower, start);
    }

    // Add remaining text
    if (start < label.length) {
      spans.add(TextSpan(
        text: label.substring(start),
        style: TextStyle(color: textColor),
      ));
    }

    return spans;
  }
}

class AppComboBoxValidator {
  static String? required<T>(T? value) {
    if (value == null) {
      return 'Este campo es requerido';
    }
    if (value is String && value.isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  static String? Function(String?) minLength(int minLength) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;
      if (value.length < minLength) {
        return 'Mínimo $minLength caracteres';
      }
      return null;
    };
  }

  static String? Function(String?) maxLength(int maxLength) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;
      if (value.length > maxLength) {
        return 'Máximo $maxLength caracteres';
      }
      return null;
    };
  }

  static String? Function(String?) pattern(RegExp pattern, String message) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;
      if (!pattern.hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Formato de email inválido';
    }
    return null;
  }

  static String? url(String? value) {
    if (value == null || value.isEmpty) return null;
    final urlRegex = RegExp(r'^https?:\/\/[^\s$.?#].[^\s]*$');
    if (!urlRegex.hasMatch(value)) {
      return 'Formato de URL inválido';
    }
    return null;
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