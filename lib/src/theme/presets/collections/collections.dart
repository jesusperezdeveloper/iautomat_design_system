/// Colecciones de temas barrel file - exports all theme collections
///
/// Proporciona acceso a las 10 colecciones completas de temas (100 temas totales):
///
/// **Colecciones disponibles:**
/// - 🏢 Corporate (10 temas) - Empresas tradicionales y servicios profesionales
/// - 💻 Technology (10 temas) - Empresas tech, startups y plataformas digitales
/// - 🎨 Creative (10 temas) - Agencias creativas, estudios de diseño y portfolios
/// - 🏥 Healthcare (10 temas) - Sector salud, hospitales y servicios médicos
/// - 💰 Financial (10 temas) - Bancos, fintech e instituciones financieras
/// - 🎓 Education (10 temas) - Instituciones educativas y plataformas de aprendizaje
/// - 🛍️ Retail (10 temas) - E-commerce, tiendas y comercio minorista
/// - 🏭 Industrial (10 temas) - Manufactura, logística y sectores industriales
/// - 🏛️ Government (10 temas) - Entidades gubernamentales e instituciones públicas
/// - 🎯 Specialized (10 temas) - Sectores únicos y nichos específicos
///
/// **Total: 100 temas profesionales listos para usar**
library;

// Exports de las 10 colecciones de temas
export 'corporate_collection.dart';
export 'technology_collection.dart';
export 'creative_collection.dart';
export 'healthcare_collection.dart';
export 'financial_collection.dart';
export 'education_collection.dart';
export 'retail_collection.dart';
export 'industrial_collection.dart';
export 'government_collection.dart';
export 'specialized_collection.dart';

import 'corporate_collection.dart';
import 'technology_collection.dart';
import 'creative_collection.dart';
import 'healthcare_collection.dart';
import 'financial_collection.dart';
import 'education_collection.dart';
import 'retail_collection.dart';
import 'industrial_collection.dart';
import 'government_collection.dart';
import 'specialized_collection.dart';
import '../theme_preset_model.dart';

/// Manager central para todas las colecciones de temas
///
/// Proporciona acceso unificado a los 100 temas organizados en 10 colecciones,
/// cada una especializada para diferentes industrias y sectores.
class DSThemeCollections {
  DSThemeCollections._();

  // ==========================================================================
  // COLECCIONES INDIVIDUALES
  // ==========================================================================

  /// 🏢 **Corporate Collection** (10 temas)
  ///
  /// Temas profesionales para empresas tradicionales, servicios corporativos,
  /// consultorías y organizaciones que requieren seriedad y confiabilidad.
  static List<DSThemePreset> get corporate => CorporateThemeCollection.themes;

  /// 💻 **Technology Collection** (10 temas)
  ///
  /// Temas modernos para empresas tech, startups, SaaS, plataformas digitales
  /// y cualquier organización enfocada en innovación tecnológica.
  static List<DSThemePreset> get technology => TechnologyThemeCollection.themes;

  /// 🎨 **Creative Collection** (10 temas)
  ///
  /// Temas vibrantes para agencias creativas, estudios de diseño, portfolios
  /// y empresas que buscan proyectar creatividad e innovación.
  static List<DSThemePreset> get creative => CreativeThemeCollection.themes;

  /// 🏥 **Healthcare Collection** (10 temas)
  ///
  /// Temas confiables para hospitales, clínicas, servicios médicos,
  /// telemedicina y organizaciones del sector salud.
  static List<DSThemePreset> get healthcare => HealthcareThemeCollection.themes;

  /// 💰 **Financial Collection** (10 temas)
  ///
  /// Temas seguros para bancos, fintech, seguros, inversiones
  /// y servicios financieros que requieren máxima confiabilidad.
  static List<DSThemePreset> get financial => FinancialThemeCollection.themes;

  /// 🎓 **Education Collection** (10 temas)
  ///
  /// Temas educativos para escuelas, universidades, plataformas e-learning,
  /// cursos online y organizaciones enfocadas en formación.
  static List<DSThemePreset> get education => EducationThemeCollection.themes;

  /// 🛍️ **Retail Collection** (10 temas)
  ///
  /// Temas comerciales para e-commerce, tiendas online, marketplaces,
  /// retail físico y empresas de comercio minorista.
  static List<DSThemePreset> get retail => RetailThemeCollection.themes;

  /// 🏭 **Industrial Collection** (10 temas)
  ///
  /// Temas robustos para manufactura, logística, construcción,
  /// industria pesada y sectores industriales tradicionales.
  static List<DSThemePreset> get industrial => IndustrialThemeCollection.themes;

  /// 🏛️ **Government Collection** (10 temas)
  ///
  /// Temas institucionales para entidades gubernamentales, organismos públicos,
  /// municipios y servicios de administración pública.
  static List<DSThemePreset> get government => GovernmentThemeCollection.themes;

  /// 🎯 **Specialized Collection** (10 temas)
  ///
  /// Temas únicos para sectores específicos como veterinarias, ONGs,
  /// medios de comunicación, deportes y nichos especializados.
  static List<DSThemePreset> get specialized => SpecializedThemeCollection.themes;

  // ==========================================================================
  // ACCESO UNIFICADO
  // ==========================================================================

  /// **Listado completo de los 100 temas disponibles**
  ///
  /// Combina todas las colecciones en una lista unificada para facilitar
  /// la búsqueda, filtrado y selección de temas.
  ///
  /// **Organización:**
  /// - Temas 1-10: Corporate
  /// - Temas 11-20: Technology
  /// - Temas 21-30: Creative
  /// - Temas 31-40: Healthcare
  /// - Temas 41-50: Financial
  /// - Temas 51-60: Education
  /// - Temas 61-70: Retail
  /// - Temas 71-80: Industrial
  /// - Temas 81-90: Government
  /// - Temas 91-100: Specialized
  static List<DSThemePreset> get allThemes => [
    ...corporate,
    ...technology,
    ...creative,
    ...healthcare,
    ...financial,
    ...education,
    ...retail,
    ...industrial,
    ...government,
    ...specialized,
  ];

  /// **Mapa de colecciones por categoría**
  ///
  /// Facilita el acceso programático a las colecciones usando
  /// la enumeración ThemeCategory.
  static Map<ThemeCategory, List<DSThemePreset>> get collectionsByCategory => {
    ThemeCategory.corporate: corporate,
    ThemeCategory.technology: technology,
    ThemeCategory.creative: creative,
    ThemeCategory.healthcare: healthcare,
    ThemeCategory.financial: financial,
    ThemeCategory.education: education,
    ThemeCategory.retail: retail,
    ThemeCategory.industrial: industrial,
    ThemeCategory.government: government,
    ThemeCategory.specialized: specialized,
  };

  /// **Estadísticas de las colecciones**
  ///
  /// Información útil sobre la distribución de temas.
  static Map<String, int> get stats => {
    'total_themes': allThemes.length,
    'total_collections': collectionsByCategory.length,
    'themes_per_collection': 10,
    'corporate_themes': corporate.length,
    'technology_themes': technology.length,
    'creative_themes': creative.length,
    'healthcare_themes': healthcare.length,
    'financial_themes': financial.length,
    'education_themes': education.length,
    'retail_themes': retail.length,
    'industrial_themes': industrial.length,
    'government_themes': government.length,
    'specialized_themes': specialized.length,
  };

  // ==========================================================================
  // MÉTODOS DE BÚSQUEDA Y FILTRADO
  // ==========================================================================

  /// Busca temas por categoría específica
  ///
  /// ```dart
  /// final techThemes = DSThemeCollections.getThemesByCategory(ThemeCategory.technology);
  /// ```
  static List<DSThemePreset> getThemesByCategory(ThemeCategory category) {
    return collectionsByCategory[category] ?? [];
  }

  /// Busca temas por industria
  ///
  /// ```dart
  /// final healthThemes = DSThemeCollections.getThemesByIndustry('healthcare');
  /// ```
  static List<DSThemePreset> getThemesByIndustry(String industry) {
    return allThemes
        .where((theme) => theme.industries.contains(industry))
        .toList();
  }

  /// Busca temas por palabras clave
  ///
  /// ```dart
  /// final modernThemes = DSThemeCollections.getThemesByKeyword('modern');
  /// ```
  static List<DSThemePreset> getThemesByKeyword(String keyword) {
    return allThemes
        .where((theme) => theme.keywords.contains(keyword))
        .toList();
  }

  /// Busca un tema específico por ID
  ///
  /// ```dart
  /// final theme = DSThemeCollections.getThemeById('corporate_classic_blue');
  /// ```
  static DSThemePreset? getThemeById(String id) {
    try {
      return allThemes.firstWhere((theme) => theme.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Obtiene temas aleatorios para demostración
  ///
  /// ```dart
  /// final randomThemes = DSThemeCollections.getRandomThemes(5);
  /// ```
  static List<DSThemePreset> getRandomThemes(int count) {
    final shuffled = List<DSThemePreset>.from(allThemes)..shuffle();
    return shuffled.take(count).toList();
  }

  /// Valida que todas las colecciones están completas
  ///
  /// Útil para tests y validación en desarrollo.
  static bool validateCollections() {
    // Verificar que tenemos exactamente 10 colecciones
    if (collectionsByCategory.length != 10) return false;

    // Verificar que cada colección tiene exactamente 10 temas
    for (final collection in collectionsByCategory.values) {
      if (collection.length != 10) return false;
    }

    // Verificar que tenemos exactamente 100 temas en total
    if (allThemes.length != 100) return false;

    // Verificar que todos los IDs son únicos
    final ids = allThemes.map((theme) => theme.id).toSet();
    if (ids.length != allThemes.length) return false;

    return true;
  }
}