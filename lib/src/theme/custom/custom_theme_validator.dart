import 'package:flutter/material.dart';
import 'corporate_palette.dart';
import 'color_variants_generator.dart';

/// Resultado de validación de accesibilidad
class ValidationResult {
  final bool isValid;
  final String message;
  final String? suggestion;
  final double? actualContrast;
  final double requiredContrast;

  const ValidationResult({
    required this.isValid,
    required this.message,
    this.suggestion,
    this.actualContrast,
    required this.requiredContrast,
  });

  @override
  String toString() {
    return 'ValidationResult(isValid: $isValid, message: $message, contrast: $actualContrast)';
  }
}

/// Validador de temas corporativos para cumplimiento WCAG
class CustomThemeValidator {
  /// Valida una paleta corporativa completa
  static List<ValidationResult> validateCorporatePalette(
    CorporatePalette palette,
  ) {
    final results = <ValidationResult>[];
    final contrastLevel = palette.config.contrastLevel;
    final requiredContrast = contrastLevel == ContrastLevel.aaa ? 7.0 : 4.5;

    // Validar colores principales contra blanco y negro
    results.addAll(_validateMainColors(palette, requiredContrast));

    // Validar combinaciones críticas
    results.addAll(_validateCriticalCombinations(palette, requiredContrast));

    // Validar colores semánticos
    results.addAll(_validateSemanticColors(palette, requiredContrast));

    // Validar variantes si existen
    if (palette.generatedVariants != null) {
      results.addAll(_validateVariants(palette, requiredContrast));
    }

    return results;
  }

  /// Valida un conjunto específico de colores
  static List<ValidationResult> validateColorSet(
    Map<String, Color> colors,
    double requiredContrast,
  ) {
    final results = <ValidationResult>[];

    for (final entry in colors.entries) {
      final colorName = entry.key;
      final color = entry.value;

      // Validar contra blanco
      results.add(_validateColorContrast(
        '$colorName vs blanco',
        color,
        Colors.white,
        requiredContrast,
      ));

      // Validar contra negro
      results.add(_validateColorContrast(
        '$colorName vs negro',
        color,
        Colors.black,
        requiredContrast,
      ));
    }

    return results;
  }

  /// Sugiere ajustes para mejorar accesibilidad
  static List<String> suggestImprovements(
    CorporatePalette palette,
    List<ValidationResult> validationResults,
  ) {
    final suggestions = <String>[];
    final failedResults = validationResults.where((r) => !r.isValid).toList();

    if (failedResults.isEmpty) {
      suggestions.add('✅ La paleta cumple con todos los requisitos WCAG');
      return suggestions;
    }

    // Análisis de patrones de fallo
    final lowContrastCount = failedResults.length;
    final totalValidations = validationResults.length;
    final failureRate = lowContrastCount / totalValidations;

    if (failureRate > 0.5) {
      suggestions.add(
        '⚠️ Más del 50% de las combinaciones fallan. Considera ajustar los colores base.'
      );
    }

    // Sugerencias específicas por color
    final colorIssues = <String, int>{};
    for (final result in failedResults) {
      final colorName = result.message.split(' ').first;
      colorIssues[colorName] = (colorIssues[colorName] ?? 0) + 1;
    }

    for (final entry in colorIssues.entries) {
      if (entry.value > 2) {
        suggestions.add(
          '🎨 El color ${entry.key} tiene múltiples problemas de contraste. '
          'Considera hacerlo más claro u oscuro.'
        );
      }
    }

    // Sugerencias automáticas de ajuste
    suggestions.addAll(_generateAutomaticSuggestions(palette, failedResults));

    return suggestions;
  }

  /// Genera colores ajustados automáticamente
  static CorporatePalette generateAdjustedPalette(
    CorporatePalette original,
    List<ValidationResult> validationResults,
  ) {
    var adjustedPalette = original;
    final requiredContrast = original.config.contrastLevel == ContrastLevel.aaa ? 7.0 : 4.5;

    // Ajustar color primario si es necesario
    final primaryIssues = validationResults
        .where((r) => !r.isValid && r.message.contains('primary'))
        .toList();

    if (primaryIssues.isNotEmpty) {
      final adjustedPrimary = _adjustColorForBetterContrast(
        original.primary,
        requiredContrast,
      );
      adjustedPalette = adjustedPalette.copyWith(primary: adjustedPrimary);
    }

    // Ajustar color secundario si es necesario
    final secondaryIssues = validationResults
        .where((r) => !r.isValid && r.message.contains('secondary'))
        .toList();

    if (secondaryIssues.isNotEmpty) {
      final adjustedSecondary = _adjustColorForBetterContrast(
        original.secondary,
        requiredContrast,
      );
      adjustedPalette = adjustedPalette.copyWith(secondary: adjustedSecondary);
    }

    return adjustedPalette;
  }

  /// Valida si una paleta es apta para usuarios con discapacidades visuales
  static Map<String, bool> validateAccessibilityFeatures(
    CorporatePalette palette,
  ) {
    return {
      'deuteranopia_friendly': _validateColorBlindness(palette, 'deuteranopia'),
      'protanopia_friendly': _validateColorBlindness(palette, 'protanopia'),
      'tritanopia_friendly': _validateColorBlindness(palette, 'tritanopia'),
      'high_contrast_available': _validateHighContrast(palette),
      'sufficient_color_diversity': _validateColorDiversity(palette),
    };
  }

  /// Valida colores principales
  static List<ValidationResult> _validateMainColors(
    CorporatePalette palette,
    double requiredContrast,
  ) {
    final results = <ValidationResult>[];

    // Validar primario
    results.add(_validateColorContrast(
      'primary vs blanco',
      palette.primary,
      Colors.white,
      requiredContrast,
    ));
    results.add(_validateColorContrast(
      'primary vs negro',
      palette.primary,
      Colors.black,
      requiredContrast,
    ));

    // Validar secundario
    results.add(_validateColorContrast(
      'secondary vs blanco',
      palette.secondary,
      Colors.white,
      requiredContrast,
    ));
    results.add(_validateColorContrast(
      'secondary vs negro',
      palette.secondary,
      Colors.black,
      requiredContrast,
    ));

    return results;
  }

  /// Valida combinaciones críticas
  static List<ValidationResult> _validateCriticalCombinations(
    CorporatePalette palette,
    double requiredContrast,
  ) {
    final results = <ValidationResult>[];

    // Primary vs Secondary
    results.add(_validateColorContrast(
      'primary vs secondary',
      palette.primary,
      palette.secondary,
      requiredContrast,
    ));

    // Validar contra neutral si existe
    if (palette.neutral != null) {
      results.add(_validateColorContrast(
        'primary vs neutral',
        palette.primary,
        palette.neutral!,
        requiredContrast,
      ));
      results.add(_validateColorContrast(
        'secondary vs neutral',
        palette.secondary,
        palette.neutral!,
        requiredContrast,
      ));
    }

    return results;
  }

  /// Valida colores semánticos
  static List<ValidationResult> _validateSemanticColors(
    CorporatePalette palette,
    double requiredContrast,
  ) {
    final results = <ValidationResult>[];
    final semanticColors = {
      'success': palette.success,
      'warning': palette.warning,
      'error': palette.error,
      'info': palette.info,
    };

    for (final entry in semanticColors.entries) {
      if (entry.value != null) {
        results.add(_validateColorContrast(
          '${entry.key} vs blanco',
          entry.value!,
          Colors.white,
          requiredContrast,
        ));
        results.add(_validateColorContrast(
          '${entry.key} vs negro',
          entry.value!,
          Colors.black,
          requiredContrast,
        ));
      }
    }

    return results;
  }

  /// Valida variantes generadas
  static List<ValidationResult> _validateVariants(
    CorporatePalette palette,
    double requiredContrast,
  ) {
    final results = <ValidationResult>[];
    final variants = palette.generatedVariants!;

    for (final colorEntry in variants.entries) {
      final colorName = colorEntry.key;
      final colorVariants = colorEntry.value;

      // Validar que las variantes claras contrasten con oscuras
      final light = colorVariants[100];
      final dark = colorVariants[800];

      if (light != null && dark != null) {
        results.add(_validateColorContrast(
          '$colorName 100 vs 800',
          light,
          dark,
          requiredContrast,
        ));
      }
    }

    return results;
  }

  /// Valida contraste entre dos colores específicos
  static ValidationResult _validateColorContrast(
    String description,
    Color color1,
    Color color2,
    double requiredContrast,
  ) {
    final actualContrast = ColorVariantsGenerator.calculateContrast(color1, color2);
    final isValid = actualContrast >= requiredContrast;

    String suggestion = '';
    if (!isValid) {
      suggestion = 'Ajustar colores para alcanzar contraste ${requiredContrast.toStringAsFixed(1)}:1';
    }

    return ValidationResult(
      isValid: isValid,
      message: description,
      suggestion: suggestion.isNotEmpty ? suggestion : null,
      actualContrast: actualContrast,
      requiredContrast: requiredContrast,
    );
  }

  /// Ajusta un color para mejor contraste
  static Color _adjustColorForBetterContrast(
    Color color,
    double requiredContrast,
  ) {
    // Intentar ajustar contra blanco primero
    final adjustedForWhite = ColorVariantsGenerator.adjustColorForContrast(
      color,
      Colors.white,
      requiredContrast,
      makeLighter: false,
    );

    // Verificar si el ajuste es suficiente
    final contrastWithWhite = ColorVariantsGenerator.calculateContrast(
      adjustedForWhite,
      Colors.white,
    );

    if (contrastWithWhite >= requiredContrast) {
      return adjustedForWhite;
    }

    // Si no funciona, intentar ajustar contra negro
    return ColorVariantsGenerator.adjustColorForContrast(
      color,
      Colors.black,
      requiredContrast,
      makeLighter: true,
    );
  }

  /// Genera sugerencias automáticas
  static List<String> _generateAutomaticSuggestions(
    CorporatePalette palette,
    List<ValidationResult> failedResults,
  ) {
    final suggestions = <String>[];

    // Contar tipos de fallos
    int primaryIssues = 0;
    int secondaryIssues = 0;
    int semanticIssues = 0;

    for (final result in failedResults) {
      if (result.message.contains('primary')) primaryIssues++;
      if (result.message.contains('secondary')) secondaryIssues++;
      if (result.message.contains('success') ||
          result.message.contains('warning') ||
          result.message.contains('error') ||
          result.message.contains('info')) {
        semanticIssues++;
      }
    }

    if (primaryIssues > 0) {
      suggestions.add('🔄 Considera ajustar el brillo del color primario');
    }

    if (secondaryIssues > 0) {
      suggestions.add('🔄 Considera ajustar la saturación del color secundario');
    }

    if (semanticIssues > 0) {
      suggestions.add('🎯 Los colores semánticos pueden usar valores estándar más accesibles');
    }

    return suggestions;
  }

  /// Valida daltonismo
  static bool _validateColorBlindness(CorporatePalette palette, String type) {
    // Simulación básica - en implementación real usaríamos algoritmos más sofisticados
    final primary = palette.primary;
    final secondary = palette.secondary;

    // Verificar que los colores principales sean distinguibles
    final hslPrimary = HSLColor.fromColor(primary);
    final hslSecondary = HSLColor.fromColor(secondary);

    final hueDifference = (hslPrimary.hue - hslSecondary.hue).abs();
    final saturationDifference = (hslPrimary.saturation - hslSecondary.saturation).abs();
    final lightnessDifference = (hslPrimary.lightness - hslSecondary.lightness).abs();

    // Los colores deben diferir suficientemente en al menos dos dimensiones
    int differingDimensions = 0;
    if (hueDifference > 30) differingDimensions++;
    if (saturationDifference > 0.2) differingDimensions++;
    if (lightnessDifference > 0.2) differingDimensions++;

    return differingDimensions >= 2;
  }

  /// Valida disponibilidad de alto contraste
  static bool _validateHighContrast(CorporatePalette palette) {
    // Verificar que al menos un color tenga contraste 7:1 con blanco y negro
    final colors = [palette.primary, palette.secondary];
    if (palette.accent != null) colors.add(palette.accent!);

    for (final color in colors) {
      final contrastWithWhite = ColorVariantsGenerator.calculateContrast(color, Colors.white);
      final contrastWithBlack = ColorVariantsGenerator.calculateContrast(color, Colors.black);

      if (contrastWithWhite >= 7.0 || contrastWithBlack >= 7.0) {
        return true;
      }
    }

    return false;
  }

  /// Valida diversidad de colores
  static bool _validateColorDiversity(CorporatePalette palette) {
    final colors = [palette.primary, palette.secondary];
    if (palette.accent != null) colors.add(palette.accent!);
    if (palette.neutral != null) colors.add(palette.neutral!);

    // Verificar que los colores cubran diferentes rangos de matiz
    final hues = colors.map((c) => HSLColor.fromColor(c).hue).toList();
    hues.sort();

    // Debe haber al menos 60 grados de diferencia entre colores extremos
    if (hues.isEmpty) return false;
    final range = hues.last - hues.first;
    return range >= 60;
  }
}