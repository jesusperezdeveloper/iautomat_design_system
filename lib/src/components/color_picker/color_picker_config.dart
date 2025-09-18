import 'dart:math' show pow;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'color_picker_config.freezed.dart';

@freezed
class AppColorPickerConfig with _$AppColorPickerConfig {
  const factory AppColorPickerConfig({
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(EdgeInsets.all(16.0)) EdgeInsets contentPadding,
    @Default(12.0) double borderRadius,
    @Default(2.0) double borderWidth,
    @Default(2.0) double focusBorderWidth,
    @Default(48.0) double minHeight,
    @Default(20.0) double iconSize,
    @Default(8.0) double iconSpacing,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool showAlphaChannel,
    @Default(true) bool showColorValue,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool showRecentColors,
    @Default(8) int maxRecentColors,
    @Default(Duration(milliseconds: 300)) Duration dialogAnimationDuration,
    @Default(300.0) double pickerWidth,
    @Default(300.0) double pickerHeight,
    @Default(40.0) double colorSwatchSize,
    @Default(4.0) double colorSwatchSpacing,
    @Default(true) bool adaptiveDialog,
    @Default(true) bool confirmColorSelection,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(400.0) double maxDialogWidth,
    @Default(500.0) double maxDialogHeight,
    @Default(20.0) double loadingIndicatorSize,
    @Default(0.95) double pressedScale,
    @Default(true) bool enableShadow,
    @Default(4.0) double shadowBlurRadius,
    @Default(Offset(0, 2)) Offset shadowOffset,
    @Default(0.0) double shadowSpreadRadius,
    @Default(6) int paletteColumns,
    @Default(40.0) double hueSliderHeight,
    @Default(40.0) double saturationValueAreaHeight,
    @Default(20.0) double alphaSliderHeight,
    @Default(true) bool showColorPreview,
    @Default(60.0) double colorPreviewSize,
    @Default(true) bool showHexInput,
    @Default(true) bool showRgbInputs,
    @Default(true) bool showHslInputs,
    AppColorPickerColors? colors,
  }) = _AppColorPickerConfig;

  const AppColorPickerConfig._();
}

@freezed
class AppColorPickerColors with _$AppColorPickerColors {
  const factory AppColorPickerColors({
    required Color inputFillColor,
    required Color inputBorderColor,
    required Color inputFocusedBorderColor,
    required Color inputErrorBorderColor,
    required Color inputDisabledBorderColor,
    required Color inputTextColor,
    required Color inputDisabledTextColor,
    required Color inputHintColor,
    required Color inputDisabledHintColor,
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
    required Color overlayColor,
    required Color hoverOverlayColor,
    required Color focusOverlayColor,
    required Color pressedOverlayColor,
    required Color pickerBackgroundColor,
    required Color pickerBorderColor,
    required Color pickerHeaderColor,
    required Color pickerHeaderTextColor,
    required Color hueSliderColor,
    required Color hueSliderThumbColor,
    required Color hueSliderTrackColor,
    required Color saturationSliderColor,
    required Color saturationSliderThumbColor,
    required Color saturationSliderTrackColor,
    required Color valueSliderColor,
    required Color valueSliderThumbColor,
    required Color valueSliderTrackColor,
    required Color alphaSliderColor,
    required Color alphaSliderThumbColor,
    required Color alphaSliderTrackColor,
    required Color colorSwatchBorderColor,
    required Color colorSwatchSelectedBorderColor,
    required Color colorSwatchHoverBorderColor,
    required Color colorPreviewBorderColor,
    required Color colorPreviewBackgroundColor,
    required Color paletteBackgroundColor,
    required Color paletteGridColor,
    required Color dialogBackgroundColor,
    required Color dialogShadowColor,
    required Color dialogBarrierColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color loadingIndicatorColor,
    required Color clearButtonColor,
    required Color clearButtonHoverColor,
    required Color confirmButtonColor,
    required Color confirmButtonTextColor,
    required Color cancelButtonColor,
    required Color cancelButtonTextColor,
    required Color inputFieldBackgroundColor,
    required Color inputFieldBorderColor,
    required Color inputFieldTextColor,
    required Color sliderThumbShadowColor,
    required Color pickerIndicatorColor,
    required Color recentColorsBackgroundColor,
    required Color recentColorsBorderColor,
  }) = _AppColorPickerColors;

  const AppColorPickerColors._();

  factory AppColorPickerColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return AppColorPickerColors(
      inputFillColor: colorScheme.surface,
      inputBorderColor: colorScheme.outline,
      inputFocusedBorderColor: colorScheme.primary,
      inputErrorBorderColor: colorScheme.error,
      inputDisabledBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      inputTextColor: colorScheme.onSurface,
      inputDisabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      inputHintColor: colorScheme.onSurfaceVariant,
      inputDisabledHintColor: colorScheme.onSurface.withValues(alpha: 0.38),
      labelColor: colorScheme.onSurfaceVariant,
      focusedLabelColor: colorScheme.primary,
      errorLabelColor: colorScheme.error,
      disabledLabelColor: colorScheme.onSurface.withValues(alpha: 0.38),
      helperTextColor: colorScheme.onSurfaceVariant,
      errorTextColor: colorScheme.error,
      iconColor: colorScheme.onSurfaceVariant,
      disabledIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withValues(alpha: 0.3),
      overlayColor: colorScheme.primary.withValues(alpha: 0.08),
      hoverOverlayColor: colorScheme.primary.withValues(alpha: 0.08),
      focusOverlayColor: colorScheme.primary.withValues(alpha: 0.1),
      pressedOverlayColor: colorScheme.primary.withValues(alpha: 0.12),
      pickerBackgroundColor: colorScheme.surfaceContainerHigh,
      pickerBorderColor: colorScheme.outlineVariant,
      pickerHeaderColor: colorScheme.surfaceContainerHighest,
      pickerHeaderTextColor: colorScheme.onSurface,
      hueSliderColor: colorScheme.primary,
      hueSliderThumbColor: colorScheme.onPrimary,
      hueSliderTrackColor: colorScheme.surfaceContainerHighest,
      saturationSliderColor: colorScheme.secondary,
      saturationSliderThumbColor: colorScheme.onSecondary,
      saturationSliderTrackColor: colorScheme.surfaceContainerHighest,
      valueSliderColor: colorScheme.tertiary,
      valueSliderThumbColor: colorScheme.onTertiary,
      valueSliderTrackColor: colorScheme.surfaceContainerHighest,
      alphaSliderColor: colorScheme.primary,
      alphaSliderThumbColor: colorScheme.onPrimary,
      alphaSliderTrackColor: colorScheme.surfaceContainerHighest,
      colorSwatchBorderColor: colorScheme.outline,
      colorSwatchSelectedBorderColor: colorScheme.primary,
      colorSwatchHoverBorderColor: colorScheme.onSurface,
      colorPreviewBorderColor: colorScheme.outline,
      colorPreviewBackgroundColor: colorScheme.surface,
      paletteBackgroundColor: colorScheme.surfaceContainerLow,
      paletteGridColor: colorScheme.outlineVariant,
      dialogBackgroundColor: colorScheme.surfaceContainerHigh,
      dialogShadowColor: colorScheme.shadow.withValues(alpha: 0.15),
      dialogBarrierColor: colorScheme.scrim.withValues(alpha: 0.32),
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      loadingIndicatorColor: colorScheme.primary,
      clearButtonColor: colorScheme.onSurfaceVariant,
      clearButtonHoverColor: colorScheme.onSurface,
      confirmButtonColor: colorScheme.primary,
      confirmButtonTextColor: colorScheme.onPrimary,
      cancelButtonColor: colorScheme.surfaceContainerHighest,
      cancelButtonTextColor: colorScheme.onSurface,
      inputFieldBackgroundColor: colorScheme.surfaceContainerLowest,
      inputFieldBorderColor: colorScheme.outline,
      inputFieldTextColor: colorScheme.onSurface,
      sliderThumbShadowColor: colorScheme.shadow.withValues(alpha: 0.2),
      pickerIndicatorColor: colorScheme.inverseSurface,
      recentColorsBackgroundColor: colorScheme.surfaceContainer,
      recentColorsBorderColor: colorScheme.outlineVariant,
    );
  }
}

enum AppColorPickerState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppColorPickerVariant {
  hsv,
  palette,
}

enum ColorFormat {
  hex,
  rgb,
  hsl,
  hsv,
}

@freezed
class AppColorValue with _$AppColorValue {
  const factory AppColorValue({
    required Color color,
    @Default(1.0) double alpha,
    @Default(ColorFormat.hex) ColorFormat format,
  }) = _AppColorValue;

  const AppColorValue._();

  factory AppColorValue.fromColor(Color color,
      {ColorFormat format = ColorFormat.hex}) {
    return AppColorValue(
      color: color,
      alpha: (color.a * 255.0).round() / 255.0,
      format: format,
    );
  }

  HSVColor get hsv => HSVColor.fromColor(color);
  HSLColor get hsl => HSLColor.fromColor(color);

  String get hexString {
    final hex =
        color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase();
    return '#${hex.substring(2)}${hex.substring(0, 2)}';
  }

  String get rgbString {
    return 'rgb(${(color.r * 255.0).round()}, ${(color.g * 255.0).round()}, ${(color.b * 255.0).round()})';
  }

  String get rgbaString {
    return 'rgba(${(color.r * 255.0).round()}, ${(color.g * 255.0).round()}, ${(color.b * 255.0).round()}, ${alpha.toStringAsFixed(2)})';
  }

  String get hslString {
    final hsl = this.hsl;
    return 'hsl(${hsl.hue.round()}, ${(hsl.saturation * 100).round()}%, ${(hsl.lightness * 100).round()}%)';
  }

  String get hslaString {
    final hsl = this.hsl;
    return 'hsla(${hsl.hue.round()}, ${(hsl.saturation * 100).round()}%, ${(hsl.lightness * 100).round()}%, ${alpha.toStringAsFixed(2)})';
  }

  String get hsvString {
    final hsv = this.hsv;
    return 'hsv(${hsv.hue.round()}, ${(hsv.saturation * 100).round()}%, ${(hsv.value * 100).round()}%)';
  }

  String getFormattedString([ColorFormat? format]) {
    final fmt = format ?? this.format;
    switch (fmt) {
      case ColorFormat.hex:
        return hexString;
      case ColorFormat.rgb:
        return alpha < 1.0 ? rgbaString : rgbString;
      case ColorFormat.hsl:
        return alpha < 1.0 ? hslaString : hslString;
      case ColorFormat.hsv:
        return hsvString;
    }
  }

  Color get colorWithAlpha {
    return color.withValues(alpha: alpha);
  }

  bool get isTransparent => alpha == 0.0;
  bool get isOpaque => alpha == 1.0;

  AppColorValue copyWithAlpha(double newAlpha) {
    return copyWith(alpha: newAlpha.clamp(0.0, 1.0));
  }

  AppColorValue copyWithColor(Color newColor) {
    return copyWith(color: newColor);
  }

  AppColorValue copyWithFormat(ColorFormat newFormat) {
    return copyWith(format: newFormat);
  }
}

/// Predefined color palettes for the palette variant
class AppColorPalettes {
  static const List<Color> material = [
    Color(0xFFF44336), // Red
    Color(0xFFE91E63), // Pink
    Color(0xFF9C27B0), // Purple
    Color(0xFF673AB7), // Deep Purple
    Color(0xFF3F51B5), // Indigo
    Color(0xFF2196F3), // Blue
    Color(0xFF03A9F4), // Light Blue
    Color(0xFF00BCD4), // Cyan
    Color(0xFF009688), // Teal
    Color(0xFF4CAF50), // Green
    Color(0xFF8BC34A), // Light Green
    Color(0xFFCDDC39), // Lime
    Color(0xFFFFEB3B), // Yellow
    Color(0xFFFFC107), // Amber
    Color(0xFFFF9800), // Orange
    Color(0xFFFF5722), // Deep Orange
    Color(0xFF795548), // Brown
    Color(0xFF9E9E9E), // Grey
    Color(0xFF607D8B), // Blue Grey
    Color(0xFF000000), // Black
    Color(0xFFFFFFFF), // White
  ];

  static const List<Color> basic = [
    Color(0xFFFF0000), // Red
    Color(0xFF00FF00), // Green
    Color(0xFF0000FF), // Blue
    Color(0xFFFFFF00), // Yellow
    Color(0xFFFF00FF), // Magenta
    Color(0xFF00FFFF), // Cyan
    Color(0xFFFFFFFF), // White
    Color(0xFF000000), // Black
    Color(0xFF808080), // Gray
    Color(0xFFFFA500), // Orange
    Color(0xFF800080), // Purple
    Color(0xFFA52A2A), // Brown
    Color(0xFFFFC0CB), // Pink
    Color(0xFF90EE90), // Light Green
    Color(0xFFADD8E6), // Light Blue
    Color(0xFFFFFFE0), // Light Yellow
  ];

  static const List<Color> pastel = [
    Color(0xFFFFB3BA), // Light Pink
    Color(0xFFFFDFBA), // Light Orange
    Color(0xFFFFFFBA), // Light Yellow
    Color(0xFFBAFFBA), // Light Green
    Color(0xFFBAFFFF), // Light Cyan
    Color(0xFFBABAFF), // Light Blue
    Color(0xFFFFBAFF), // Light Magenta
    Color(0xFFFFBABA), // Light Red
    Color(0xFFE6E6FA), // Lavender
    Color(0xFFF0E68C), // Khaki
    Color(0xFFDDA0DD), // Plum
    Color(0xFF98FB98), // Pale Green
    Color(0xFFAFEEEE), // Pale Turquoise
    Color(0xFFDB7093), // Pale Violet Red
    Color(0xFFEEE8AA), // Pale Goldenrod
    Color(0xFFD3D3D3), // Light Gray
  ];

  static const List<Color> vibrant = [
    Color(0xFFFF1744), // Red A400
    Color(0xFFE91E63), // Pink 500
    Color(0xFF9C27B0), // Purple 500
    Color(0xFF673AB7), // Deep Purple 500
    Color(0xFF3F51B5), // Indigo 500
    Color(0xFF2196F3), // Blue 500
    Color(0xFF03A9F4), // Light Blue 500
    Color(0xFF00BCD4), // Cyan 500
    Color(0xFF009688), // Teal 500
    Color(0xFF4CAF50), // Green 500
    Color(0xFF8BC34A), // Light Green 500
    Color(0xFFCDDC39), // Lime 500
    Color(0xFFFFEB3B), // Yellow 500
    Color(0xFFFFC107), // Amber 500
    Color(0xFFFF9800), // Orange 500
    Color(0xFFFF5722), // Deep Orange 500
  ];

  static Map<String, List<Color>> get all => {
        'Material': material,
        'Basic': basic,
        'Pastel': pastel,
        'Vibrant': vibrant,
      };
}

/// Validation helpers for color values
class AppColorValidators {
  static String? Function(AppColorValue?) required() {
    return (AppColorValue? value) {
      if (value == null) {
        return 'El color es requerido';
      }
      return null;
    };
  }

  static String? Function(AppColorValue?) hexFormat() {
    return (AppColorValue? value) {
      if (value == null) return null;
      final hex = value.hexString;
      final hexRegex = RegExp(r'^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$');
      if (!hexRegex.hasMatch(hex)) {
        return 'Formato hexadecimal inválido';
      }
      return null;
    };
  }

  static String? Function(AppColorValue?) alphaRange(double min, double max) {
    return (AppColorValue? value) {
      if (value == null) return null;
      if (value.alpha < min || value.alpha > max) {
        return 'El valor alpha debe estar entre $min y $max';
      }
      return null;
    };
  }

  static String? Function(AppColorValue?) notTransparent() {
    return (AppColorValue? value) {
      if (value == null) return null;
      if (value.isTransparent) {
        return 'El color no puede ser transparente';
      }
      return null;
    };
  }

  static String? Function(AppColorValue?) contrast(
      Color background, double minRatio) {
    return (AppColorValue? value) {
      if (value == null) return null;
      final ratio = _calculateContrastRatio(value.colorWithAlpha, background);
      if (ratio < minRatio) {
        return 'El contraste es insuficiente (${ratio.toStringAsFixed(1)}:1, mínimo ${minRatio.toStringAsFixed(1)}:1)';
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

  static double _calculateContrastRatio(Color color1, Color color2) {
    final luminance1 = _calculateLuminance(color1);
    final luminance2 = _calculateLuminance(color2);
    final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final darker = luminance1 > luminance2 ? luminance2 : luminance1;
    return (lighter + 0.05) / (darker + 0.05);
  }

  static double _calculateLuminance(Color color) {
    final r = _gamma(color.r);
    final g = _gamma(color.g);
    final b = _gamma(color.b);
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  static double _gamma(double value) {
    return value <= 0.03928
        ? value / 12.92
        : pow((value + 0.055) / 1.055, 2.4).toDouble();
  }
}

/// Extension for additional color utilities
extension AppColorPickerHelpers on Color {
  /// Checks if the color is light (luminance > 0.5)
  bool get isLight => _calculateLuminance() > 0.5;

  /// Checks if the color is dark (luminance <= 0.5)
  bool get isDark => !isLight;

  /// Gets a contrasting color (black or white) for text
  Color get contrastingColor => isLight ? Colors.black : Colors.white;

  /// Calculates the relative luminance of the color
  double _calculateLuminance() {
    final r = _gamma(this.r);
    final g = _gamma(this.g);
    final b = _gamma(this.b);
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  double _gamma(double value) {
    return value <= 0.03928
        ? value / 12.92
        : pow((value + 0.055) / 1.055, 2.4).toDouble();
  }

  /// Creates a lighter version of the color
  Color lighten([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Creates a darker version of the color
  Color darken([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Creates a more saturated version of the color
  Color saturate([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withSaturation((hsl.saturation + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Creates a less saturated version of the color
  Color desaturate([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withSaturation((hsl.saturation - amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Rotates the hue of the color
  Color rotateHue(double degrees) {
    final hsl = HSLColor.fromColor(this);
    final newHue = (hsl.hue + degrees) % 360;
    return hsl.withHue(newHue).toColor();
  }

  /// Gets complementary color (opposite on color wheel)
  Color get complement => rotateHue(180);

  /// Gets analogous colors (adjacent on color wheel)
  List<Color> get analogous => [
        rotateHue(-30),
        this,
        rotateHue(30),
      ];

  /// Gets triadic colors (120 degrees apart on color wheel)
  List<Color> get triadic => [
        this,
        rotateHue(120),
        rotateHue(240),
      ];

  /// Gets tetradic colors (90 degrees apart on color wheel)
  List<Color> get tetradic => [
        this,
        rotateHue(90),
        rotateHue(180),
        rotateHue(270),
      ];
}
