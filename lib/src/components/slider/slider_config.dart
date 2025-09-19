import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'slider_config.freezed.dart';

@freezed
class DSSliderConfig with _$DSSliderConfig {
  const factory DSSliderConfig({
    @Default(Duration(milliseconds: 150)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(20.0) double thumbRadius,
    @Default(2.0) double trackHeight,
    @Default(4.0) double activeTrackHeight,
    @Default(1.0) double borderWidth,
    @Default(0.0) double borderRadius,
    @Default(0.12) double hoverOpacity,
    @Default(0.08) double focusOpacity,
    @Default(0.04) double pressedOpacity,
    @Default(true) bool enableHapticFeedback,
    @Default(48.0) double minimumHeight,
    @Default(16.0) double thumbPadding,
    @Default(8.0) double markSize,
    @Default(2.0) double markThickness,
    @Default(12.0) double markLabelSpacing,
    @Default(true) bool showLabels,
    @Default(true) bool showTicks,
    @Default(true) bool showThumbLabel,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0))
    EdgeInsets contentPadding,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(300.0) double maxSliderWidth,
    @Default(true) bool enableRangeLabels,
    @Default(8.0) double rangeThumbSpacing,
    @Default(true) bool snapToMarks,
    @Default(24.0) double thumbLabelHeight,
    @Default(16.0) double thumbLabelPadding,
    @Default(true) bool showValueInThumbLabel,
    @Default(0) int decimalPlaces,
    @Default('') String valuePrefix,
    @Default('') String valueSuffix,
    @Default(true) bool allowDecimalInput,
    @Default(true) bool constrainToMarks,
  }) = _DSSliderConfig;

  const DSSliderConfig._();
}

@freezed
class DSSliderColors with _$DSSliderColors {
  const factory DSSliderColors({
    required Color trackColor,
    required Color activeTrackColor,
    required Color inactiveTrackColor,
    required Color disabledTrackColor,
    required Color disabledActiveTrackColor,
    required Color thumbColor,
    required Color disabledThumbColor,
    required Color thumbBorderColor,
    required Color focusedThumbBorderColor,
    required Color hoveredThumbColor,
    required Color pressedThumbColor,
    required Color overlayColor,
    required Color focusOverlayColor,
    required Color hoverOverlayColor,
    required Color pressOverlayColor,
    required Color valueIndicatorColor,
    required Color valueIndicatorTextColor,
    required Color tickMarkColor,
    required Color activeTickMarkColor,
    required Color disabledTickMarkColor,
    required Color labelColor,
    required Color disabledLabelColor,
    required Color markColor,
    required Color activeMarkColor,
    required Color disabledMarkColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color loadingIndicatorColor,
    required Color rangeSelectionColor,
    required Color rangeThumbColor,
  }) = _DSSliderColors;

  const DSSliderColors._();

  factory DSSliderColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return DSSliderColors(
      trackColor: colorScheme.surfaceContainerHighest,
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.outline.withValues(alpha: 0.38),
      disabledTrackColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledActiveTrackColor: colorScheme.onSurface.withValues(alpha: 0.38),
      thumbColor: colorScheme.primary,
      disabledThumbColor: colorScheme.onSurface.withValues(alpha: 0.38),
      thumbBorderColor: colorScheme.outline,
      focusedThumbBorderColor: colorScheme.primary,
      hoveredThumbColor: colorScheme.primary.withValues(alpha: 0.08),
      pressedThumbColor: colorScheme.primary.withValues(alpha: 0.12),
      overlayColor: colorScheme.primary.withValues(alpha: 0.12),
      focusOverlayColor: colorScheme.primary.withValues(alpha: 0.12),
      hoverOverlayColor: colorScheme.primary.withValues(alpha: 0.08),
      pressOverlayColor: colorScheme.primary.withValues(alpha: 0.12),
      valueIndicatorColor: colorScheme.inverseSurface,
      valueIndicatorTextColor: colorScheme.onInverseSurface,
      tickMarkColor: colorScheme.onSurfaceVariant,
      activeTickMarkColor: colorScheme.onPrimary,
      disabledTickMarkColor: colorScheme.onSurface.withValues(alpha: 0.38),
      labelColor: colorScheme.onSurfaceVariant,
      disabledLabelColor: colorScheme.onSurface.withValues(alpha: 0.38),
      markColor: colorScheme.onSurfaceVariant,
      activeMarkColor: colorScheme.onPrimary,
      disabledMarkColor: colorScheme.onSurface.withValues(alpha: 0.38),
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      loadingIndicatorColor: colorScheme.primary,
      rangeSelectionColor: colorScheme.primary.withValues(alpha: 0.12),
      rangeThumbColor: colorScheme.primary,
    );
  }
}

enum DSSliderState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSSliderVariant {
  continuous,
  discrete,
  range,
}

@freezed
class DSSliderMark with _$DSSliderMark {
  const factory DSSliderMark({
    required double value,
    required String label,
    @Default(true) bool enabled,
    Widget? icon,
    Color? color,
    Map<String, dynamic>? metadata,
  }) = _DSSliderMark;

  const DSSliderMark._();

  bool isActive(double currentValue, DSSliderVariant variant) {
    switch (variant) {
      case DSSliderVariant.continuous:
      case DSSliderVariant.discrete:
        return currentValue >= value;
      case DSSliderVariant.range:
        return false; // Range marks are handled differently
    }
  }
}

@freezed
class DSSliderRangeValue with _$DSSliderRangeValue {
  const factory DSSliderRangeValue({
    required double start,
    required double end,
  }) = _DSSliderRangeValue;

  const DSSliderRangeValue._();

  bool get isValid => start <= end;
  double get range => end - start;
  double get center => (start + end) / 2;

  DSSliderRangeValue copyWithStart(double newStart) {
    return DSSliderRangeValue(start: newStart, end: end);
  }

  DSSliderRangeValue copyWithEnd(double newEnd) {
    return DSSliderRangeValue(start: start, end: newEnd);
  }

  bool contains(double value) {
    return value >= start && value <= end;
  }
}

class DSSliderValidator {
  static String? Function(double?) range(double min, double max) {
    return (double? value) {
      if (value == null) return null;
      if (value < min || value > max) {
        return 'El valor debe estar entre $min y $max';
      }
      return null;
    };
  }

  static String? Function(double?) minimum(double min) {
    return (double? value) {
      if (value == null) return null;
      if (value < min) {
        return 'El valor debe ser mayor o igual a $min';
      }
      return null;
    };
  }

  static String? Function(double?) maximum(double max) {
    return (double? value) {
      if (value == null) return null;
      if (value > max) {
        return 'El valor debe ser menor o igual a $max';
      }
      return null;
    };
  }

  static String? Function(double?) step(double stepSize) {
    return (double? value) {
      if (value == null) return null;
      if (value % stepSize != 0) {
        return 'El valor debe ser múltiplo de $stepSize';
      }
      return null;
    };
  }

  static String? Function(DSSliderRangeValue?) rangeMinSpan(double minSpan) {
    return (DSSliderRangeValue? value) {
      if (value == null) return null;
      if (value.range < minSpan) {
        return 'El rango mínimo debe ser $minSpan';
      }
      return null;
    };
  }

  static String? Function(DSSliderRangeValue?) rangeMaxSpan(double maxSpan) {
    return (DSSliderRangeValue? value) {
      if (value == null) return null;
      if (value.range > maxSpan) {
        return 'El rango máximo debe ser $maxSpan';
      }
      return null;
    };
  }

  static String? Function(dynamic) combine(
      List<String? Function(dynamic)> validators) {
    return (dynamic value) {
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
