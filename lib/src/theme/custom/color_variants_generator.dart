import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Generador de variantes de colores corporativos
///
/// Utiliza algoritmos HSL y HSV para generar escalas de colores
/// manteniendo la consistencia visual y accesibilidad.
class ColorVariantsGenerator {
  /// Genera variantes completas de un color base
  ///
  /// [baseColor] Color base del cual generar variantes
  /// [preserveSaturation] Si mantener la saturación original
  /// [variantFactor] Factor de ajuste para las variantes (0.1 - 1.0)
  static Map<int, Color> generateVariants(
    Color baseColor, {
    bool preserveSaturation = true,
    double variantFactor = 0.15,
  }) {
    final hsl = HSLColor.fromColor(baseColor);
    final variants = <int, Color>{};

    // Definir los stops estándar de Material Design
    const stops = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

    // 500 es el color base
    variants[500] = baseColor;

    // Generar tints (colores más claros) - 50, 100, 200, 300, 400
    for (int i = 0; i < 5; i++) {
      final stop = stops[i];
      final factor = _calculateLightnessFactor(stop, true);

      variants[stop] = _generateLighterVariant(
        hsl,
        factor,
        preserveSaturation: preserveSaturation,
        variantFactor: variantFactor,
      );
    }

    // Generar shades (colores más oscuros) - 600, 700, 800, 900
    for (int i = 5; i < stops.length; i++) {
      final stop = stops[i];
      final factor = _calculateLightnessFactor(stop, false);

      variants[stop] = _generateDarkerVariant(
        hsl,
        factor,
        preserveSaturation: preserveSaturation,
        variantFactor: variantFactor,
      );
    }

    return variants;
  }

  /// Genera paleta optimizada para dark mode
  static Map<int, Color> generateDarkModeVariants(
    Color baseColor, {
    bool preserveSaturation = true,
    double variantFactor = 0.12,
  }) {
    final hsl = HSLColor.fromColor(baseColor);
    final variants = <int, Color>{};

    // En dark mode, queremos que los colores sean menos saturados
    // y con mejor contraste sobre fondos oscuros
    final adjustedHsl = hsl.withSaturation(
      preserveSaturation ? hsl.saturation : hsl.saturation * 0.8
    );

    const stops = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    variants[500] = adjustedHsl.toColor();

    // Para dark mode, invertimos la lógica de claridad
    for (int i = 0; i < 5; i++) {
      final stop = stops[i];
      final factor = _calculateDarkModeFactor(stop, true);

      variants[stop] = _generateDarkModeVariant(
        adjustedHsl,
        factor,
        true,
        variantFactor: variantFactor,
      );
    }

    for (int i = 5; i < stops.length; i++) {
      final stop = stops[i];
      final factor = _calculateDarkModeFactor(stop, false);

      variants[stop] = _generateDarkModeVariant(
        adjustedHsl,
        factor,
        false,
        variantFactor: variantFactor,
      );
    }

    return variants;
  }

  /// Genera color de texto óptimo para un fondo dado
  static Color generateOptimalTextColor(
    Color backgroundColor, {
    Color lightTextColor = Colors.white,
    Color darkTextColor = Colors.black,
    double contrastThreshold = 4.5,
  }) {
    final lightContrast = calculateContrast(backgroundColor, lightTextColor);
    final darkContrast = calculateContrast(backgroundColor, darkTextColor);

    if (lightContrast >= contrastThreshold && darkContrast >= contrastThreshold) {
      // Si ambos cumplen, elegir el de mayor contraste
      return lightContrast > darkContrast ? lightTextColor : darkTextColor;
    } else if (lightContrast >= contrastThreshold) {
      return lightTextColor;
    } else if (darkContrast >= contrastThreshold) {
      return darkTextColor;
    } else {
      // Si ninguno cumple, ajustar el fondo o devolver el de mayor contraste
      return lightContrast > darkContrast ? lightTextColor : darkTextColor;
    }
  }

  /// Calcula el contraste entre dos colores según WCAG
  static double calculateContrast(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();

    final brightest = math.max(luminance1, luminance2);
    final darkest = math.min(luminance1, luminance2);

    return (brightest + 0.05) / (darkest + 0.05);
  }

  /// Verifica si un color cumple con WCAG AA (4.5:1)
  static bool meetsWCAGAA(Color backgroundColor, Color foregroundColor) {
    return calculateContrast(backgroundColor, foregroundColor) >= 4.5;
  }

  /// Verifica si un color cumple con WCAG AAA (7:1)
  static bool meetsWCAGAAA(Color backgroundColor, Color foregroundColor) {
    return calculateContrast(backgroundColor, foregroundColor) >= 7.0;
  }

  /// Ajusta un color para cumplir contraste mínimo
  static Color adjustColorForContrast(
    Color color,
    Color referenceColor,
    double targetContrast, {
    bool makeLighter = true,
  }) {
    var adjustedColor = color;
    var currentContrast = calculateContrast(adjustedColor, referenceColor);

    if (currentContrast >= targetContrast) return adjustedColor;

    final hsl = HSLColor.fromColor(color);
    var lightness = hsl.lightness;

    const step = 0.01;
    const maxIterations = 100;

    for (int i = 0; i < maxIterations; i++) {
      if (makeLighter) {
        lightness = math.min(1.0, lightness + step);
      } else {
        lightness = math.max(0.0, lightness - step);
      }

      adjustedColor = hsl.withLightness(lightness).toColor();
      currentContrast = calculateContrast(adjustedColor, referenceColor);

      if (currentContrast >= targetContrast) break;

      // Evitar extremos
      if (lightness >= 1.0 || lightness <= 0.0) break;
    }

    return adjustedColor;
  }

  /// Calcula factor de luminosidad para stops específicos
  static double _calculateLightnessFactor(int stop, bool isLighter) {
    if (isLighter) {
      switch (stop) {
        case 50: return 0.95;
        case 100: return 0.85;
        case 200: return 0.75;
        case 300: return 0.65;
        case 400: return 0.55;
        default: return 0.5;
      }
    } else {
      switch (stop) {
        case 600: return 0.45;
        case 700: return 0.35;
        case 800: return 0.25;
        case 900: return 0.15;
        default: return 0.5;
      }
    }
  }

  /// Calcula factor para dark mode
  static double _calculateDarkModeFactor(int stop, bool isLighter) {
    if (isLighter) {
      switch (stop) {
        case 50: return 0.85;
        case 100: return 0.75;
        case 200: return 0.65;
        case 300: return 0.58;
        case 400: return 0.52;
        default: return 0.5;
      }
    } else {
      switch (stop) {
        case 600: return 0.48;
        case 700: return 0.42;
        case 800: return 0.35;
        case 900: return 0.28;
        default: return 0.5;
      }
    }
  }

  /// Genera variante más clara
  static Color _generateLighterVariant(
    HSLColor hsl,
    double lightnessFactor, {
    required bool preserveSaturation,
    required double variantFactor,
  }) {
    final saturation = preserveSaturation
        ? hsl.saturation
        : math.max(0.0, hsl.saturation - (variantFactor * 0.5));

    return hsl
        .withLightness(lightnessFactor)
        .withSaturation(saturation)
        .toColor();
  }

  /// Genera variante más oscura
  static Color _generateDarkerVariant(
    HSLColor hsl,
    double lightnessFactor, {
    required bool preserveSaturation,
    required double variantFactor,
  }) {
    final saturation = preserveSaturation
        ? hsl.saturation
        : math.min(1.0, hsl.saturation + (variantFactor * 0.3));

    return hsl
        .withLightness(lightnessFactor)
        .withSaturation(saturation)
        .toColor();
  }

  /// Genera variante optimizada para dark mode
  static Color _generateDarkModeVariant(
    HSLColor hsl,
    double lightnessFactor,
    bool isLighter, {
    required double variantFactor,
  }) {
    var saturation = hsl.saturation;

    if (isLighter) {
      // Para variantes más claras en dark mode, reducir saturación
      saturation = math.max(0.0, saturation - (variantFactor * 0.4));
    } else {
      // Para variantes más oscuras en dark mode, mantener o aumentar ligeramente
      saturation = math.min(1.0, saturation + (variantFactor * 0.2));
    }

    return hsl
        .withLightness(lightnessFactor)
        .withSaturation(saturation)
        .toColor();
  }

  /// Genera colores harmonicos basados en teoría del color
  static List<Color> generateHarmoniousColors(
    Color baseColor, {
    int count = 5,
    double hueStep = 30.0,
  }) {
    final hsl = HSLColor.fromColor(baseColor);
    final colors = <Color>[];

    for (int i = 0; i < count; i++) {
      final newHue = (hsl.hue + (hueStep * i)) % 360;
      colors.add(hsl.withHue(newHue).toColor());
    }

    return colors;
  }

  /// Genera paleta monocromática
  static List<Color> generateMonochromaticPalette(
    Color baseColor, {
    int count = 7,
  }) {
    final hsl = HSLColor.fromColor(baseColor);
    final colors = <Color>[];

    for (int i = 0; i < count; i++) {
      final lightness = 0.2 + (0.6 * i / (count - 1));
      colors.add(hsl.withLightness(lightness).toColor());
    }

    return colors;
  }
}