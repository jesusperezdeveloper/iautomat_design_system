import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_preset_model.freezed.dart';

/// Categorías de temas profesionales para clasificación
enum ThemeCategory {
  corporate,
  technology,
  creative,
  healthcare,
  financial,
  education,
  retail,
  industrial,
  government,
  specialized;

  /// Nombre para mostrar de la categoría
  String get displayName {
    switch (this) {
      case ThemeCategory.corporate:
        return 'Corporativo';
      case ThemeCategory.technology:
        return 'Tecnología';
      case ThemeCategory.creative:
        return 'Creativo';
      case ThemeCategory.healthcare:
        return 'Salud';
      case ThemeCategory.financial:
        return 'Financiero';
      case ThemeCategory.education:
        return 'Educación';
      case ThemeCategory.retail:
        return 'Retail';
      case ThemeCategory.industrial:
        return 'Industrial';
      case ThemeCategory.government:
        return 'Gobierno';
      case ThemeCategory.specialized:
        return 'Especializado';
    }
  }

  /// Icono representativo de la categoría
  IconData get icon {
    switch (this) {
      case ThemeCategory.corporate:
        return Icons.business;
      case ThemeCategory.technology:
        return Icons.computer;
      case ThemeCategory.creative:
        return Icons.brush;
      case ThemeCategory.healthcare:
        return Icons.local_hospital;
      case ThemeCategory.financial:
        return Icons.account_balance;
      case ThemeCategory.education:
        return Icons.school;
      case ThemeCategory.retail:
        return Icons.shopping_cart;
      case ThemeCategory.industrial:
        return Icons.factory;
      case ThemeCategory.government:
        return Icons.account_balance;
      case ThemeCategory.specialized:
        return Icons.star;
    }
  }

  /// Descripción de la categoría
  String get description {
    switch (this) {
      case ThemeCategory.corporate:
        return 'Temas profesionales para empresas establecidas';
      case ThemeCategory.technology:
        return 'Temas modernos para startups y tech companies';
      case ThemeCategory.creative:
        return 'Temas vibrantes para agencias y diseño';
      case ThemeCategory.healthcare:
        return 'Temas limpios para sector médico y wellness';
      case ThemeCategory.financial:
        return 'Temas seguros para bancos y fintech';
      case ThemeCategory.education:
        return 'Temas amigables para educación y e-learning';
      case ThemeCategory.retail:
        return 'Temas atractivos para e-commerce y tiendas';
      case ThemeCategory.industrial:
        return 'Temas robustos para manufactura y B2B';
      case ThemeCategory.government:
        return 'Temas institucionales para sector público';
      case ThemeCategory.specialized:
        return 'Temas únicos para nichos específicos';
    }
  }
}

/// Configuración de tokens personalizados para un tema
@freezed
class DSThemeTokens with _$DSThemeTokens {
  const factory DSThemeTokens({
    @Default(8.0) double baseSpacing,
    @Default(1.0) double typographyScale,
    @Default(12.0) double defaultBorderRadius,
    @Default(false) bool isCompact,
    @Default(false) bool isExpressive,
  }) = _DSThemeTokens;
}

/// Preview visual de un tema para mostrar en listas
@freezed
class DSThemePreview with _$DSThemePreview {
  const factory DSThemePreview({
    required Color primaryColor,
    required Color secondaryColor,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color textColor,
    String? gradientPreview,
  }) = _DSThemePreview;
}

/// Modelo completo de un preset de tema profesional
@freezed
class DSThemePreset with _$DSThemePreset {
  const factory DSThemePreset({
    required String id,
    required String displayName,
    required String description,
    required ThemeCategory category,
    required List<String> industries,
    required List<String> keywords,
    required ColorScheme lightColorScheme,
    required ColorScheme darkColorScheme,
    required DSThemeTokens tokens,
    @Default(false) bool isPremium,
    @Default(true) bool isAccessible,
    DSThemePreview? preview,
    @Default('Material Design 3') String designSystem,
    @Default('2025') String year,
  }) = _DSThemePreset;

  const DSThemePreset._();

  /// Genera preview automático si no se proporciona
  DSThemePreview get effectivePreview {
    return preview ??
        DSThemePreview(
          primaryColor: lightColorScheme.primary,
          secondaryColor: lightColorScheme.secondary,
          backgroundColor: lightColorScheme.surface,
          surfaceColor: lightColorScheme.surfaceContainer,
          textColor: lightColorScheme.onSurface,
        );
  }

  /// Verifica si el tema coincide con las keywords de búsqueda
  bool matchesSearch(String query) {
    final searchQuery = query.toLowerCase().trim();
    if (searchQuery.isEmpty) return true;

    return displayName.toLowerCase().contains(searchQuery) ||
        description.toLowerCase().contains(searchQuery) ||
        keywords.any((keyword) => keyword.toLowerCase().contains(searchQuery)) ||
        industries.any((industry) => industry.toLowerCase().contains(searchQuery)) ||
        category.displayName.toLowerCase().contains(searchQuery);
  }

  /// Verifica si el tema coincide con una industria específica
  bool matchesIndustry(String industry) {
    final industryLower = industry.toLowerCase();
    return industries.any((i) => i.toLowerCase() == industryLower);
  }

  /// Genera ThemeData para Material App (modo claro)
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      // Aquí se aplicarían personalizaciones adicionales basadas en tokens
    );
  }

  /// Genera ThemeData para Material App (modo oscuro)
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      brightness: Brightness.dark,
      // Aquí se aplicarían personalizaciones adicionales basadas en tokens
    );
  }
}

/// Resultado de validación de accesibilidad
@freezed
class ValidationResult with _$ValidationResult {
  const factory ValidationResult({
    required String property,
    required bool isValid,
    required double contrastRatio,
    required String message,
    String? suggestion,
  }) = _ValidationResult;
}

/// Configuración para generar paletas corporativas
@freezed
class CorporatePaletteConfig with _$CorporatePaletteConfig {
  const factory CorporatePaletteConfig({
    @Default(ContrastLevel.aa) ContrastLevel contrastLevel,
    @Default(true) bool generateVariants,
    @Default(true) bool optimizeForDarkMode,
    @Default(false) bool allowBoldColors,
  }) = _CorporatePaletteConfig;
}

/// Nivel de contraste requerido
enum ContrastLevel {
  aa,
  aaa;

  double get minRatio {
    switch (this) {
      case ContrastLevel.aa:
        return 4.5;
      case ContrastLevel.aaa:
        return 7.0;
    }
  }
}

/// Extensiones útiles para ColorScheme
extension ColorSchemeExtensions on ColorScheme {
  /// Crea una versión del ColorScheme con mejores contrastes
  ColorScheme ensureAccessibility() {
    // Implementación básica - se puede expandir
    return this;
  }

  /// Genera variantes de colores para modo oscuro
  ColorScheme generateDarkVariant() {
    return ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    );
  }
}