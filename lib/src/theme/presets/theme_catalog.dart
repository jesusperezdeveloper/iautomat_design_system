import 'package:flutter/material.dart';
import 'theme_preset_model.dart';
import 'collections/corporate_collection.dart';
import 'collections/technology_collection.dart';
import 'collections/creative_collection.dart';
import 'collections/healthcare_collection.dart';
import 'collections/financial_collection.dart';
import 'collections/education_collection.dart';
import 'collections/retail_collection.dart';
import 'collections/industrial_collection.dart';
import 'collections/government_collection.dart';
import 'collections/specialized_collection.dart';

/// Catálogo central de todos los temas del Design System
///
/// Proporciona funcionalidades avanzadas de búsqueda, filtrado y
/// recomendaciones para navegar la colección completa de 100 temas
/// profesionales organizados por categoría.
///
/// Funcionalidades principales:
/// - Búsqueda textual inteligente
/// - Filtrado por categoría, industria y keywords
/// - Sistema de recomendaciones
/// - Validación de accesibilidad
/// - Analytics de uso
class DSThemeCatalog {
  DSThemeCatalog._();

  // ==========================================================================
  // COLECCIONES COMPLETAS
  // ==========================================================================

  /// Mapa de todas las colecciones organizadas por categoría
  static final Map<ThemeCategory, List<DSThemePreset>> _collections = {
    ThemeCategory.corporate: CorporateThemeCollection.themes,
    ThemeCategory.technology: TechnologyThemeCollection.themes,
    ThemeCategory.creative: CreativeThemeCollection.themes,
    ThemeCategory.healthcare: HealthcareThemeCollection.themes,
    ThemeCategory.financial: FinancialThemeCollection.themes,
    ThemeCategory.education: EducationThemeCollection.themes,
    ThemeCategory.retail: RetailThemeCollection.themes,
    ThemeCategory.industrial: IndustrialThemeCollection.themes,
    ThemeCategory.government: GovernmentThemeCollection.themes,
    ThemeCategory.specialized: SpecializedThemeCollection.themes,
  };

  /// Lista completa de todos los 100 temas disponibles
  static List<DSThemePreset> get allThemes {
    return _collections.values
        .expand((themes) => themes)
        .toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  /// Obtiene todos los IDs de temas únicos
  static List<String> get allThemeIds {
    return allThemes.map((theme) => theme.id).toList();
  }

  /// Estadísticas generales del catálogo
  static Map<String, dynamic> get statistics {
    final allThemesList = allThemes;
    final totalThemes = allThemesList.length;
    final categoriesCount = _collections.length;
    final accessibleThemes = allThemesList.where((t) => t.isAccessible).length;
    final premiumThemes = allThemesList.where((t) => t.isPremium).length;

    return {
      'totalThemes': totalThemes,
      'categoriesCount': categoriesCount,
      'accessibleThemes': accessibleThemes,
      'premiumThemes': premiumThemes,
      'freeThemes': totalThemes - premiumThemes,
      'accessibilityRate': accessibleThemes / totalThemes,
    };
  }

  // ==========================================================================
  // MÉTODOS DE ACCESO POR CATEGORÍA
  // ==========================================================================

  /// Obtiene todos los temas de una categoría específica
  static List<DSThemePreset> getByCategory(ThemeCategory category) {
    return _collections[category] ?? [];
  }

  /// Obtiene temas de múltiples categorías
  static List<DSThemePreset> getByCategories(List<ThemeCategory> categories) {
    return categories
        .expand((category) => getByCategory(category))
        .toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  /// Obtiene un tema específico por su ID
  static DSThemePreset? getById(String id) {
    try {
      return allThemes.firstWhere((theme) => theme.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Verifica si existe un tema con el ID especificado
  static bool exists(String id) {
    return getById(id) != null;
  }

  // ==========================================================================
  // BÚSQUEDA Y FILTRADO AVANZADO
  // ==========================================================================

  /// Búsqueda textual inteligente en nombres, descripciones y keywords
  static List<DSThemePreset> search(
    String query, {
    List<ThemeCategory>? categories,
    bool caseSensitive = false,
  }) {
    if (query.trim().isEmpty) return [];

    final searchQuery = caseSensitive ? query : query.toLowerCase();
    final targetThemes = categories != null
        ? getByCategories(categories)
        : allThemes;

    return targetThemes.where((theme) {
      return theme.matchesSearch(searchQuery);
    }).toList();
  }

  /// Filtrado por industria específica
  static List<DSThemePreset> getByIndustry(String industry) {
    return allThemes
        .where((theme) => theme.matchesIndustry(industry))
        .toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  /// Filtrado por múltiples industrias
  static List<DSThemePreset> getByIndustries(List<String> industries) {
    return allThemes.where((theme) {
      return industries.any((industry) => theme.matchesIndustry(industry));
    }).toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  /// Búsqueda por keywords específicas
  static List<DSThemePreset> getByKeywords(List<String> keywords) {
    return allThemes.where((theme) {
      return keywords.any((keyword) {
        return theme.keywords.any((themeKeyword) =>
            themeKeyword.toLowerCase().contains(keyword.toLowerCase()));
      });
    }).toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  /// Filtrado avanzado con múltiples criterios
  static List<DSThemePreset> filter({
    ThemeCategory? category,
    List<ThemeCategory>? categories,
    String? industry,
    List<String>? industries,
    List<String>? keywords,
    bool? isPremium,
    bool? isAccessible,
    String? searchQuery,
  }) {
    var results = allThemes;

    // Filtrar por categoría(s)
    if (category != null) {
      results = results.where((theme) => theme.category == category).toList();
    } else if (categories != null && categories.isNotEmpty) {
      results = results.where((theme) => categories.contains(theme.category)).toList();
    }

    // Filtrar por industria(s)
    if (industry != null) {
      results = results.where((theme) => theme.matchesIndustry(industry)).toList();
    } else if (industries != null && industries.isNotEmpty) {
      results = results.where((theme) {
        return industries.any((ind) => theme.matchesIndustry(ind));
      }).toList();
    }

    // Filtrar por keywords
    if (keywords != null && keywords.isNotEmpty) {
      results = results.where((theme) {
        return keywords.any((keyword) {
          return theme.keywords.any((themeKeyword) =>
              themeKeyword.toLowerCase().contains(keyword.toLowerCase()));
        });
      }).toList();
    }

    // Filtrar por premium
    if (isPremium != null) {
      results = results.where((theme) => theme.isPremium == isPremium).toList();
    }

    // Filtrar por accesibilidad
    if (isAccessible != null) {
      results = results.where((theme) => theme.isAccessible == isAccessible).toList();
    }

    // Búsqueda textual
    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      results = results.where((theme) => theme.matchesSearch(searchQuery)).toList();
    }

    return results..sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  // ==========================================================================
  // SISTEMA DE RECOMENDACIONES
  // ==========================================================================

  /// Recomendaciones basadas en un tema actual
  static List<DSThemePreset> getRecommendations(
    DSThemePreset currentTheme, {
    int limit = 5,
    List<DSThemePreset>? userFavorites,
  }) {
    final candidates = allThemes
        .where((theme) => theme.id != currentTheme.id)
        .toList();

    // Sistema de puntuación para recomendaciones
    final scored = candidates.map((theme) {
      double score = 0.0;

      // Misma categoría (+30 puntos)
      if (theme.category == currentTheme.category) {
        score += 30;
      }

      // Industrias en común (+20 puntos por industria)
      final commonIndustries = theme.industries
          .where((industry) => currentTheme.industries.contains(industry))
          .length;
      score += commonIndustries * 20;

      // Keywords en común (+10 puntos por keyword)
      final commonKeywords = theme.keywords
          .where((keyword) => currentTheme.keywords.contains(keyword))
          .length;
      score += commonKeywords * 10;

      // Boost si está en favoritos del usuario (+50 puntos)
      if (userFavorites?.contains(theme) == true) {
        score += 50;
      }

      // Mismo nivel de accesibilidad (+5 puntos)
      if (theme.isAccessible == currentTheme.isAccessible) {
        score += 5;
      }

      // Mismo nivel premium (+5 puntos)
      if (theme.isPremium == currentTheme.isPremium) {
        score += 5;
      }

      return MapEntry(theme, score);
    }).toList();

    // Ordenar por puntuación y devolver los mejores
    scored.sort((a, b) => b.value.compareTo(a.value));
    return scored
        .take(limit)
        .map((entry) => entry.key)
        .toList();
  }

  /// Recomendaciones basadas en industria del usuario
  static List<DSThemePreset> getRecommendationsForIndustry(
    String userIndustry, {
    int limit = 10,
  }) {
    return getByIndustry(userIndustry).take(limit).toList();
  }

  /// Temas populares (simulado - en producción sería basado en analytics)
  static List<DSThemePreset> getPopularThemes({int limit = 10}) {
    // Simulamos popularidad basada en categorías comunes
    final popularCategories = [
      ThemeCategory.corporate,
      ThemeCategory.technology,
      ThemeCategory.creative,
      ThemeCategory.financial,
    ];

    final popular = <DSThemePreset>[];
    for (final category in popularCategories) {
      popular.addAll(getByCategory(category).take(3));
    }

    return popular.take(limit).toList();
  }

  /// Temas nuevos (últimos agregados - simulado)
  static List<DSThemePreset> getNewestThemes({int limit = 5}) {
    // En una implementación real, esto sería basado en fechas de creación
    // Por ahora, devolvemos algunos temas de specialized (última categoría)
    return getByCategory(ThemeCategory.specialized).take(limit).toList();
  }

  // ==========================================================================
  // VALIDACIÓN Y DIAGNÓSTICOS
  // ==========================================================================

  /// Valida la integridad de todo el catálogo
  static List<String> validateCatalog() {
    final issues = <String>[];

    // Verificar que tenemos exactamente 100 temas
    final totalThemes = allThemes.length;
    if (totalThemes != 100) {
      issues.add('Se esperaban 100 temas, encontrados: $totalThemes');
    }

    // Verificar que cada categoría tiene exactamente 10 temas
    for (final category in ThemeCategory.values) {
      final categoryThemes = getByCategory(category).length;
      if (categoryThemes != 10) {
        issues.add('${category.displayName}: se esperaban 10 temas, encontrados: $categoryThemes');
      }
    }

    // Verificar IDs únicos
    final ids = allThemes.map((theme) => theme.id).toList();
    final uniqueIds = ids.toSet();
    if (ids.length != uniqueIds.length) {
      issues.add('Se encontraron IDs duplicados en los temas');
    }

    // Verificar accesibilidad
    final inaccessibleThemes = allThemes.where((theme) => !theme.isAccessible);
    if (inaccessibleThemes.isNotEmpty) {
      issues.add('${inaccessibleThemes.length} temas no cumplen con accesibilidad');
    }

    return issues;
  }

  /// Obtiene estadísticas detalladas por categoría
  static Map<ThemeCategory, Map<String, int>> getCategoryStatistics() {
    final stats = <ThemeCategory, Map<String, int>>{};

    for (final category in ThemeCategory.values) {
      final themes = getByCategory(category);
      stats[category] = {
        'total': themes.length,
        'accessible': themes.where((t) => t.isAccessible).length,
        'premium': themes.where((t) => t.isPremium).length,
        'industries': themes.expand((t) => t.industries).toSet().length,
        'keywords': themes.expand((t) => t.keywords).toSet().length,
      };
    }

    return stats;
  }

  /// Lista todas las industrias disponibles
  static List<String> getAllIndustries() {
    return allThemes
        .expand((theme) => theme.industries)
        .toSet()
        .toList()
      ..sort();
  }

  /// Lista todas las keywords disponibles
  static List<String> getAllKeywords() {
    return allThemes
        .expand((theme) => theme.keywords)
        .toSet()
        .toList()
      ..sort();
  }

  // ==========================================================================
  // UTILIDADES PARA UI
  // ==========================================================================

  /// Agrupa temas por primera letra para navegación alfabética
  static Map<String, List<DSThemePreset>> getAlphabeticalGroups() {
    final groups = <String, List<DSThemePreset>>{};

    for (final theme in allThemes) {
      final firstLetter = theme.displayName[0].toUpperCase();
      groups.putIfAbsent(firstLetter, () => []).add(theme);
    }

    return groups;
  }

  /// Obtiene colores predominantes para preview rápido
  static List<Color> getPreviewColors(DSThemePreset theme) {
    return [
      theme.lightColorScheme.primary,
      theme.lightColorScheme.secondary,
      theme.lightColorScheme.tertiary,
      theme.lightColorScheme.surface,
    ];
  }

  /// Genera sugerencias de autocompletado para búsqueda
  static List<String> getSearchSuggestions(String query) {
    if (query.length < 2) return [];

    final suggestions = <String>{};
    final lowerQuery = query.toLowerCase();

    // Agregar nombres de temas que coincidan
    for (final theme in allThemes) {
      if (theme.displayName.toLowerCase().contains(lowerQuery)) {
        suggestions.add(theme.displayName);
      }
    }

    // Agregar industrias que coincidan
    for (final industry in getAllIndustries()) {
      if (industry.toLowerCase().contains(lowerQuery)) {
        suggestions.add(industry);
      }
    }

    // Agregar keywords que coincidan
    for (final keyword in getAllKeywords()) {
      if (keyword.toLowerCase().contains(lowerQuery)) {
        suggestions.add(keyword);
      }
    }

    return suggestions.take(10).toList()..sort();
  }
}