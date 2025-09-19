import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'color_variants_generator.dart';

/// Extensions para Color que añaden funcionalidad corporativa
extension CorporateColorExtensions on Color {
  /// Calcula la luminancia relativa del color
  double get relativeLuminance => computeLuminance();

  /// Obtiene el contraste con otro color
  double contrastWith(Color other) {
    return ColorVariantsGenerator.calculateContrast(this, other);
  }

  /// Verifica si cumple con WCAG AA (4.5:1) contra otro color
  bool meetsWCAGAA(Color other) {
    return contrastWith(other) >= 4.5;
  }

  /// Verifica si cumple con WCAG AAA (7:1) contra otro color
  bool meetsWCAGAAA(Color other) {
    return contrastWith(other) >= 7.0;
  }

  /// Ajusta el color para cumplir contraste mínimo con otro color
  Color adjustContrastWith(
    Color other, {
    double targetContrast = 4.5,
    bool makeLighter = true,
  }) {
    return ColorVariantsGenerator.adjustColorForContrast(
      this,
      other,
      targetContrast,
      makeLighter: makeLighter,
    );
  }

  /// Genera el mejor color de texto para este fondo
  Color get bestTextColor {
    return ColorVariantsGenerator.generateOptimalTextColor(this);
  }

  /// Obtiene variantes corporativas del color
  Map<int, Color> get variants {
    return ColorVariantsGenerator.generateVariants(this);
  }

  /// Obtiene variantes optimizadas para dark mode
  Map<int, Color> get darkModeVariants {
    return ColorVariantsGenerator.generateDarkModeVariants(this);
  }

  /// Convierte a HSL para manipulación avanzada
  HSLColor get hsl => HSLColor.fromColor(this);

  /// Convierte a HSV para manipulación avanzada
  HSVColor get hsv => HSVColor.fromColor(this);

  /// Genera una versión más clara del color
  Color lighten([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final lightness = math.min(1.0, hsl.lightness + amount);
    return hsl.withLightness(lightness).toColor();
  }

  /// Genera una versión más oscura del color
  Color darken([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final lightness = math.max(0.0, hsl.lightness - amount);
    return hsl.withLightness(lightness).toColor();
  }

  /// Aumenta la saturación del color
  Color saturate([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final saturation = math.min(1.0, hsl.saturation + amount);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Disminuye la saturación del color
  Color desaturate([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final saturation = math.max(0.0, hsl.saturation - amount);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Rota el matiz del color
  Color rotateHue(double degrees) {
    final hsl = HSLColor.fromColor(this);
    final newHue = (hsl.hue + degrees) % 360;
    return hsl.withHue(newHue).toColor();
  }

  /// Genera colores análogos (±30 grados de matiz)
  List<Color> get analogousColors {
    return [
      rotateHue(-30),
      this,
      rotateHue(30),
    ];
  }

  /// Genera colores complementarios
  List<Color> get complementaryColors {
    return [
      this,
      rotateHue(180),
    ];
  }

  /// Genera colores triádicos
  List<Color> get triadicColors {
    return [
      this,
      rotateHue(120),
      rotateHue(240),
    ];
  }

  /// Genera paleta monocromática
  List<Color> get monochromaticPalette {
    return ColorVariantsGenerator.generateMonochromaticPalette(this);
  }

  /// Verifica si el color es claro
  bool get isLight => relativeLuminance > 0.5;

  /// Verifica si el color es oscuro
  bool get isDark => !isLight;

  /// Obtiene la temperatura del color (cálido/frío)
  String get temperature {
    final hue = hsl.hue;
    if (hue >= 0 && hue < 60) return 'cálido'; // Rojo-amarillo
    if (hue >= 60 && hue < 120) return 'neutral'; // Amarillo-verde
    if (hue >= 120 && hue < 240) return 'frío'; // Verde-azul
    if (hue >= 240 && hue < 300) return 'frío'; // Azul-púrpura
    return 'cálido'; // Púrpura-rojo
  }

  /// Genera un color de sombra apropiado
  Color get shadowColor {
    if (isDark) {
      return Colors.black.withValues(alpha: 0.4);
    } else {
      return darken(0.3).withValues(alpha: 0.2);
    }
  }

  /// Convierte a escala de grises preservando luminancia
  Color get grayscale {
    final luminance = relativeLuminance;
    final grayValue = (luminance * 255).round();
    return Color.fromARGB((a * 255.0).round() & 0xff, grayValue, grayValue, grayValue);
  }

  /// Simula daltonismo (deuteranopia)
  Color get deuteranopia {
    // Simulación simplificada de deuteranopia
    final r = (this.r * 255.0).round() & 0xff;
    final g = (this.g * 255.0).round() & 0xff;
    final b = (this.b * 255.0).round() & 0xff;

    final newR = (r * 0.8 + g * 0.2).round().clamp(0, 255);
    final newG = (r * 0.258 + g * 0.742).round().clamp(0, 255);
    final newB = b;

    return Color.fromARGB((a * 255.0).round() & 0xff, newR, newG, newB);
  }

  /// Simula daltonismo (protanopia)
  Color get protanopia {
    // Simulación simplificada de protanopia
    final r = (this.r * 255.0).round() & 0xff;
    final g = (this.g * 255.0).round() & 0xff;
    final b = (this.b * 255.0).round() & 0xff;

    final newR = (r * 0.567 + g * 0.433).round().clamp(0, 255);
    final newG = (r * 0.558 + g * 0.442).round().clamp(0, 255);
    final newB = b;

    return Color.fromARGB((a * 255.0).round() & 0xff, newR, newG, newB);
  }

  /// Simula daltonismo (tritanopia)
  Color get tritanopia {
    // Simulación simplificada de tritanopia
    final r = (this.r * 255.0).round() & 0xff;
    final g = (this.g * 255.0).round() & 0xff;
    final b = (this.b * 255.0).round() & 0xff;

    final newR = r;
    final newG = (g * 0.967 + b * 0.033).round().clamp(0, 255);
    final newB = (g * 0.183 + b * 0.817).round().clamp(0, 255);

    return Color.fromARGB((a * 255.0).round() & 0xff, newR, newG, newB);
  }

  /// Mezcla con otro color
  Color mix(Color other, [double ratio = 0.5]) {
    ratio = ratio.clamp(0.0, 1.0);
    final inverseRatio = 1.0 - ratio;

    final thisRed = (r * 255.0).round() & 0xff;
    final thisGreen = (g * 255.0).round() & 0xff;
    final thisBlue = (b * 255.0).round() & 0xff;
    final thisAlpha = (a * 255.0).round() & 0xff;

    final otherRed = (other.r * 255.0).round() & 0xff;
    final otherGreen = (other.g * 255.0).round() & 0xff;
    final otherBlue = (other.b * 255.0).round() & 0xff;
    final otherAlpha = (other.a * 255.0).round() & 0xff;

    final newRed = (thisRed * inverseRatio + otherRed * ratio).round();
    final newGreen = (thisGreen * inverseRatio + otherGreen * ratio).round();
    final newBlue = (thisBlue * inverseRatio + otherBlue * ratio).round();
    final newAlpha = (thisAlpha * inverseRatio + otherAlpha * ratio).round();

    return Color.fromARGB(newAlpha, newRed, newGreen, newBlue);
  }

  /// Genera gradiente hacia otro color
  List<Color> gradientTo(Color end, {int steps = 10}) {
    final colors = <Color>[];
    for (int i = 0; i < steps; i++) {
      final ratio = i / (steps - 1);
      colors.add(mix(end, ratio));
    }
    return colors;
  }

  /// Convierte a formato hexadecimal
  String get hex {
    return '#${toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  /// Convierte a formato CSS rgb
  String get cssRgb {
    return 'rgb(${(r * 255.0).round() & 0xff}, ${(g * 255.0).round() & 0xff}, ${(b * 255.0).round() & 0xff})';
  }

  /// Convierte a formato CSS rgba
  String get cssRgba {
    final alphaValue = a.toStringAsFixed(2);
    final redValue = (r * 255.0).round() & 0xff;
    final greenValue = (g * 255.0).round() & 0xff;
    final blueValue = (b * 255.0).round() & 0xff;
    return 'rgba($redValue, $greenValue, $blueValue, $alphaValue)';
  }

  /// Convierte a formato CSS hsl
  String get cssHsl {
    final hslColor = hsl;
    final h = hslColor.hue.round();
    final s = (hslColor.saturation * 100).round();
    final l = (hslColor.lightness * 100).round();
    return 'hsl($h, $s%, $l%)';
  }

  /// Obtiene información detallada del color
  Map<String, dynamic> get colorInfo {
    final hslColor = hsl;
    final hsvColor = hsv;

    return {
      'hex': hex,
      'rgb': {
        'r': (r * 255.0).round() & 0xff,
        'g': (g * 255.0).round() & 0xff,
        'b': (b * 255.0).round() & 0xff,
        'a': (a * 255.0).round() & 0xff
      },
      'hsl': {
        'h': hslColor.hue.round(),
        's': (hslColor.saturation * 100).round(),
        'l': (hslColor.lightness * 100).round(),
      },
      'hsv': {
        'h': hsvColor.hue.round(),
        's': (hsvColor.saturation * 100).round(),
        'v': (hsvColor.value * 100).round(),
      },
      'luminance': relativeLuminance,
      'isLight': isLight,
      'temperature': temperature,
      'css': {
        'rgb': cssRgb,
        'rgba': cssRgba,
        'hsl': cssHsl,
      },
    };
  }
}

/// Extensions para `List<Color>` con utilidades corporativas
extension CorporateColorListExtensions on List<Color> {
  /// Encuentra el color con mejor contraste contra un fondo
  Color bestContrastWith(Color background) {
    if (isEmpty) return Colors.black;

    return reduce((current, next) {
      final currentContrast = current.contrastWith(background);
      final nextContrast = next.contrastWith(background);
      return nextContrast > currentContrast ? next : current;
    });
  }

  /// Filtra colores que cumplen WCAG AA
  List<Color> filterWCAGAA(Color reference) {
    return where((color) => color.meetsWCAGAA(reference)).toList();
  }

  /// Filtra colores que cumplen WCAG AAA
  List<Color> filterWCAGAAA(Color reference) {
    return where((color) => color.meetsWCAGAAA(reference)).toList();
  }

  /// Ordena por luminancia (claro a oscuro)
  List<Color> sortByLuminance({bool ascending = true}) {
    final sorted = List<Color>.from(this);
    sorted.sort((a, b) {
      final comparison = a.relativeLuminance.compareTo(b.relativeLuminance);
      return ascending ? comparison : -comparison;
    });
    return sorted;
  }

  /// Ordena por matiz
  List<Color> sortByHue({bool ascending = true}) {
    final sorted = List<Color>.from(this);
    sorted.sort((a, b) {
      final comparison = a.hsl.hue.compareTo(b.hsl.hue);
      return ascending ? comparison : -comparison;
    });
    return sorted;
  }

  /// Obtiene el color promedio
  Color get averageColor {
    if (isEmpty) return Colors.grey;

    final totalRed = fold<int>(0, (sum, color) => sum + ((color.r * 255.0).round() & 0xff));
    final totalGreen = fold<int>(0, (sum, color) => sum + ((color.g * 255.0).round() & 0xff));
    final totalBlue = fold<int>(0, (sum, color) => sum + ((color.b * 255.0).round() & 0xff));
    final totalAlpha = fold<int>(0, (sum, color) => sum + ((color.a * 255.0).round() & 0xff));

    return Color.fromARGB(
      (totalAlpha / length).round(),
      (totalRed / length).round(),
      (totalGreen / length).round(),
      (totalBlue / length).round(),
    );
  }

  /// Verifica si todos los colores tienen suficiente contraste entre sí
  bool get hasGoodContrast {
    for (int i = 0; i < length; i++) {
      for (int j = i + 1; j < length; j++) {
        if (!this[i].meetsWCAGAA(this[j])) {
          return false;
        }
      }
    }
    return true;
  }

  /// Genera paleta accesible ajustando colores si es necesario
  List<Color> get accessiblePalette {
    if (length <= 1) return this;

    final result = <Color>[first];

    for (int i = 1; i < length; i++) {
      var currentColor = this[i];

      // Verificar contraste con todos los colores anteriores
      for (final previousColor in result) {
        if (!currentColor.meetsWCAGAA(previousColor)) {
          // Ajustar el color para mejor contraste
          currentColor = currentColor.adjustContrastWith(previousColor);
        }
      }

      result.add(currentColor);
    }

    return result;
  }
}