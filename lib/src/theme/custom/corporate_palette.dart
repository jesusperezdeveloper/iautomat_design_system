import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'corporate_palette.freezed.dart';
part 'corporate_palette.g.dart';

/// Niveles de contraste WCAG
enum ContrastLevel {
  /// WCAG 2.0 AA - Contraste mínimo 4.5:1
  aa,
  /// WCAG 2.0 AAA - Contraste mínimo 7:1
  aaa,
}

/// Configuración para la generación de paletas corporativas
@freezed
class CorporatePaletteConfig with _$CorporatePaletteConfig {
  const factory CorporatePaletteConfig({
    /// Nombre de la marca/empresa
    String? brandName,

    /// Generar automáticamente tema dark mode
    @Default(true) bool generateDarkMode,

    /// Nivel de contraste WCAG requerido
    @Default(ContrastLevel.aa) ContrastLevel contrastLevel,

    /// Generar variantes automáticamente (50, 100, 200...900)
    @Default(true) bool autoGenerateVariants,

    /// Validar contraste WCAG automáticamente
    @Default(true) bool validateContrast,

    /// Usar algoritmo inteligente para dark mode
    @Default(true) bool smartDarkMode,

    /// Factor de ajuste para generación de variantes (0.1 - 1.0)
    @Default(0.15) double variantFactor,

    /// Preservar saturación en variantes
    @Default(true) bool preserveSaturation,
  }) = _CorporatePaletteConfig;

  factory CorporatePaletteConfig.fromJson(Map<String, dynamic> json) =>
      _$CorporatePaletteConfigFromJson(json);
}

/// Paleta de colores corporativos personalizada
@freezed
class CorporatePalette with _$CorporatePalette {
  const CorporatePalette._();

  const factory CorporatePalette({
    /// Color primario de la marca (requerido)
    required Color primary,

    /// Color secundario de la marca (requerido)
    required Color secondary,

    /// Color de acento (opcional)
    Color? accent,

    /// Color neutro base (opcional)
    Color? neutral,

    /// Color de éxito (opcional)
    Color? success,

    /// Color de advertencia (opcional)
    Color? warning,

    /// Color de error (opcional)
    Color? error,

    /// Color de información (opcional)
    Color? info,

    /// Configuración de la paleta
    @Default(CorporatePaletteConfig()) CorporatePaletteConfig config,

    /// Variantes generadas automáticamente
    Map<String, Map<int, Color>>? generatedVariants,

    /// Resultados de validación WCAG
    Map<String, bool>? contrastValidation,
  }) = _CorporatePalette;

  factory CorporatePalette.fromJson(Map<String, dynamic> json) =>
      _$CorporatePaletteFromJson(json);

  /// Constructor de conveniencia para paletas mínimas
  factory CorporatePalette.minimal({
    required Color primary,
    required Color secondary,
    CorporatePaletteConfig? config,
  }) {
    return CorporatePalette(
      primary: primary,
      secondary: secondary,
      config: config ?? const CorporatePaletteConfig(),
    );
  }

  /// Constructor de conveniencia para paletas completas
  factory CorporatePalette.complete({
    required Color primary,
    required Color secondary,
    required Color accent,
    required Color neutral,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    CorporatePaletteConfig? config,
  }) {
    return CorporatePalette(
      primary: primary,
      secondary: secondary,
      accent: accent,
      neutral: neutral,
      success: success,
      warning: warning,
      error: error,
      info: info,
      config: config ?? const CorporatePaletteConfig(),
    );
  }

  /// Obtener color por nombre y variante
  Color? getColor(String colorName, [int variant = 500]) {
    if (generatedVariants == null) return null;
    return generatedVariants![colorName]?[variant];
  }

  /// Obtener variante de color primario
  Color? get primary50 => getColor('primary', 50);
  Color? get primary100 => getColor('primary', 100);
  Color? get primary200 => getColor('primary', 200);
  Color? get primary300 => getColor('primary', 300);
  Color? get primary400 => getColor('primary', 400);
  Color? get primary500 => getColor('primary', 500);
  Color? get primary600 => getColor('primary', 600);
  Color? get primary700 => getColor('primary', 700);
  Color? get primary800 => getColor('primary', 800);
  Color? get primary900 => getColor('primary', 900);

  /// Obtener variante de color secundario
  Color? get secondary50 => getColor('secondary', 50);
  Color? get secondary100 => getColor('secondary', 100);
  Color? get secondary200 => getColor('secondary', 200);
  Color? get secondary300 => getColor('secondary', 300);
  Color? get secondary400 => getColor('secondary', 400);
  Color? get secondary500 => getColor('secondary', 500);
  Color? get secondary600 => getColor('secondary', 600);
  Color? get secondary700 => getColor('secondary', 700);
  Color? get secondary800 => getColor('secondary', 800);
  Color? get secondary900 => getColor('secondary', 900);

  /// Verificar si la paleta es válida según WCAG
  bool get isValidWCAG {
    if (contrastValidation == null) return true;
    return !contrastValidation!.values.contains(false);
  }

  /// Obtener colores semánticos con fallbacks
  Color get effectiveSuccess => success ?? const Color(0xFF4CAF50);
  Color get effectiveWarning => warning ?? const Color(0xFFFF9800);
  Color get effectiveError => error ?? const Color(0xFFF44336);
  Color get effectiveInfo => info ?? const Color(0xFF2196F3);
  Color get effectiveNeutral => neutral ?? const Color(0xFF9E9E9E);
}

/// Resultado de generación de tema corporativo
@freezed
class CorporateThemeResult with _$CorporateThemeResult {
  const factory CorporateThemeResult({
    /// Tema light generado
    required ThemeData lightTheme,

    /// Tema dark generado
    required ThemeData darkTheme,

    /// Paleta procesada con variantes
    required CorporatePalette palette,

    /// Advertencias de accesibilidad
    @Default([]) List<String> warnings,

    /// Tiempo de generación en ms
    int? generationTime,

    /// Metadata adicional
    Map<String, dynamic>? metadata,
  }) = _CorporateThemeResult;

  factory CorporateThemeResult.fromJson(Map<String, dynamic> json) =>
      _$CorporateThemeResultFromJson(json);
}