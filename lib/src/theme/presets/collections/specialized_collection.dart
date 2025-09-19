import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas especializados únicos para nichos específicos
///
/// Temas diseñados para sectores muy específicos y únicos que requieren
/// personalidad distintiva y funcionalidad especializada.
///
/// Características:
/// - Colores únicos y distintivos
/// - Tipografía adaptada al sector
/// - Espaciado optimizado para cada uso
/// - Combinaciones especializadas y memorables
class SpecializedThemeCollection {
  SpecializedThemeCollection._();

  /// Listado completo de temas especializados
  static List<DSThemePreset> get themes => [
    veterinaryGreen,
    legalMaroon,
    spiritualPurple,
    nonprofitOrange,
    consultingSlate,
    researchIndigo,
    mediaVibrant,
    sportsEnergetic,
    culturalAmber,
    environmentEarth,
  ];

  // ==========================================================================
  // VETERINARY GREEN - Verde veterinario con acentos azul
  // ==========================================================================

  /// Tema cuidadoso verde veterinario con confianza azul
  ///
  /// Ideal para: Clínicas veterinarias, hospitales de animales, cuidado animal
  /// Personalidad: Cuidadoso, sanador, confiable, compasivo
  static final veterinaryGreen = DSThemePreset(
    id: 'specialized_veterinary_green',
    displayName: 'Veterinary Green',
    description: 'Verde veterinario cuidadoso con confianza azul para cuidado animal',
    category: ThemeCategory.specialized,
    industries: ['veterinary_clinic', 'animal_hospital', 'pet_care', 'animal_health', 'veterinary_services'],
    keywords: ['caring', 'healing', 'trustworthy', 'compassionate', 'veterinary'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2E7D32), // Verde veterinario
      secondary: const Color(0xFF1976D2), // Azul confianza
      tertiary: const Color(0xFF388E3C),
      surface: const Color(0xFFF1F8E9),
      onSurface: const Color(0xFF1B5E20),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF388E3C),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFF4CAF50),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Espacioso para tranquilidad
      typographyScale: 1.02,
      defaultBorderRadius: 12.0, // Suave y amigable
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // LEGAL MAROON - Granate legal con acentos dorado
  // ==========================================================================

  /// Tema autoridad granate legal con prestigio dorado
  ///
  /// Ideal para: Bufetes de abogados, estudios jurídicos, consultoría legal
  /// Personalidad: Autoritativo, prestigioso, serio, profesional
  static final legalMaroon = DSThemePreset(
    id: 'specialized_legal_maroon',
    displayName: 'Legal Maroon',
    description: 'Granate legal autoritativo con prestigio dorado para jurídicos',
    category: ThemeCategory.specialized,
    industries: ['law_firm', 'legal_services', 'legal_consulting', 'attorney_office', 'legal_practice'],
    keywords: ['authoritative', 'prestigious', 'serious', 'professional', 'legal'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8E24AA), // Granate legal
      secondary: const Color(0xFFFFD700), // Dorado prestigio
      tertiary: const Color(0xFF9C27B0),
      surface: const Color(0xFFFDF7FF),
      onSurface: const Color(0xFF4A148C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9C27B0),
      secondary: const Color(0xFFFFC107),
      tertiary: const Color(0xFFAB47BC),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0, // Espacioso para formalidad
      typographyScale: 1.0,
      defaultBorderRadius: 4.0, // Formal y angular
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SPIRITUAL PURPLE - Púrpura espiritual con acentos plata
  // ==========================================================================

  /// Tema trascendente púrpura espiritual con pureza plata
  ///
  /// Ideal para: Centros espirituales, meditación, bienestar holístico
  /// Personalidad: Trascendente, espiritual, puro, contemplativo
  static final spiritualPurple = DSThemePreset(
    id: 'specialized_spiritual_purple',
    displayName: 'Spiritual Purple',
    description: 'Púrpura espiritual trascendente con pureza plata para bienestar',
    category: ThemeCategory.specialized,
    industries: ['spiritual_center', 'meditation', 'holistic_wellness', 'mindfulness', 'spiritual_practice'],
    keywords: ['transcendent', 'spiritual', 'pure', 'contemplative', 'mindful'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF673AB7), // Púrpura espiritual
      secondary: const Color(0xFF9E9E9E), // Plata pureza
      tertiary: const Color(0xFF7B1FA2),
      surface: const Color(0xFFF8F5FF),
      onSurface: const Color(0xFF4A148C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7B1FA2),
      secondary: const Color(0xFFBDBDBD),
      tertiary: const Color(0xFF8E24AA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 14.0, // Muy espacioso para contemplación
      typographyScale: 1.05,
      defaultBorderRadius: 20.0, // Muy suave
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // NONPROFIT ORANGE - Naranja sin fines de lucro con acentos verde
  // ==========================================================================

  /// Tema solidario naranja sin fines de lucro con esperanza verde
  ///
  /// Ideal para: ONGs, fundaciones, organizaciones benéficas, causas sociales
  /// Personalidad: Solidario, esperanzador, humano, generoso
  static final nonprofitOrange = DSThemePreset(
    id: 'specialized_nonprofit_orange',
    displayName: 'Nonprofit Orange',
    description: 'Naranja solidario sin fines de lucro con esperanza verde para ONGs',
    category: ThemeCategory.specialized,
    industries: ['ngo', 'foundation', 'charity', 'social_cause', 'nonprofit_organization'],
    keywords: ['supportive', 'hopeful', 'humane', 'generous', 'nonprofit'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF6F00), // Naranja solidario
      secondary: const Color(0xFF4CAF50), // Verde esperanza
      tertiary: const Color(0xFFFF8F00),
      surface: const Color(0xFFFFF8E1),
      onSurface: const Color(0xFFE65100),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF8F00),
      secondary: const Color(0xFF66BB6A),
      tertiary: const Color(0xFFFFB74D),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.08, // Más cálido y accesible
      defaultBorderRadius: 16.0, // Amigable
      isCompact: false,
      isExpressive: true, // Más expresivo para causar impacto
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CONSULTING SLATE - Pizarra consultoría con acentos azul
  // ==========================================================================

  /// Tema estratégico pizarra consultoría con claridad azul
  ///
  /// Ideal para: Consultorías estratégicas, asesoría empresarial, think tanks
  /// Personalidad: Estratégico, analítico, claro, profesional
  static final consultingSlate = DSThemePreset(
    id: 'specialized_consulting_slate',
    displayName: 'Consulting Slate',
    description: 'Pizarra consultoría estratégico con claridad azul para asesoría',
    category: ThemeCategory.specialized,
    industries: ['strategic_consulting', 'business_advisory', 'management_consulting', 'strategy_firm', 'think_tank'],
    keywords: ['strategic', 'analytical', 'clear', 'professional', 'consulting'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF455A64), // Pizarra consultoría
      secondary: const Color(0xFF2196F3), // Azul claridad
      tertiary: const Color(0xFF546E7A),
      surface: const Color(0xFFF8F9FA),
      onSurface: const Color(0xFF263238),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF546E7A),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFF607D8B),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.0,
      defaultBorderRadius: 6.0, // Profesional
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // RESEARCH INDIGO - Índigo investigación con acentos naranja
  // ==========================================================================

  /// Tema intelectual índigo investigación con innovación naranja
  ///
  /// Ideal para: Centros de investigación, universidades, laboratorios científicos
  /// Personalidad: Intelectual, innovador, riguroso, académico
  static final researchIndigo = DSThemePreset(
    id: 'specialized_research_indigo',
    displayName: 'Research Indigo',
    description: 'Índigo investigación intelectual con innovación naranja para academia',
    category: ThemeCategory.specialized,
    industries: ['research_center', 'university', 'scientific_laboratory', 'academic_institution', 'r_and_d'],
    keywords: ['intellectual', 'innovative', 'rigorous', 'academic', 'research'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF303F9F), // Índigo investigación
      secondary: const Color(0xFFFF9800), // Naranja innovación
      tertiary: const Color(0xFF3F51B5),
      surface: const Color(0xFFF5F7FF),
      onSurface: const Color(0xFF1A237E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3F51B5),
      secondary: const Color(0xFFFFB74D),
      tertiary: const Color(0xFF5C6BC0),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.02, // Ligeramente más legible para academia
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // MEDIA VIBRANT - Vibrante medios con acentos púrpura
  // ==========================================================================

  /// Tema dinámico vibrante medios con creatividad púrpura
  ///
  /// Ideal para: Medios de comunicación, periodismo digital, content creators
  /// Personalidad: Dinámico, vibrante, creativo, informativo
  static final mediaVibrant = DSThemePreset(
    id: 'specialized_media_vibrant',
    displayName: 'Media Vibrant',
    description: 'Vibrante medios dinámico con creatividad púrpura para comunicación',
    category: ThemeCategory.specialized,
    industries: ['media', 'digital_journalism', 'content_creation', 'broadcasting', 'news_media'],
    keywords: ['dynamic', 'vibrant', 'creative', 'informative', 'media'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63), // Vibrante medios
      secondary: const Color(0xFF9C27B0), // Púrpura creatividad
      tertiary: const Color(0xFFF06292),
      surface: const Color(0xFFFDF8FA),
      onSurface: const Color(0xFF880E4F),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF06292),
      secondary: const Color(0xFFBA68C8),
      tertiary: const Color(0xFFCE93D8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0, // Más compacto para dinamismo
      typographyScale: 1.15, // Más expresivo
      defaultBorderRadius: 20.0, // Muy dinámico
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SPORTS ENERGETIC - Energético deportes con acentos amarillo
  // ==========================================================================

  /// Tema activo energético deportes con vitalidad amarilla
  ///
  /// Ideal para: Clubes deportivos, gimnasios, actividad física, deportes
  /// Personalidad: Activo, energético, vital, motivador
  static final sportsEnergetic = DSThemePreset(
    id: 'specialized_sports_energetic',
    displayName: 'Sports Energetic',
    description: 'Energético deportes activo con vitalidad amarilla para actividad física',
    category: ThemeCategory.specialized,
    industries: ['sports_club', 'gymnasium', 'fitness', 'athletics', 'sports_facility'],
    keywords: ['active', 'energetic', 'vital', 'motivating', 'sports'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD32F2F), // Energético deportes
      secondary: const Color(0xFFFFEB3B), // Amarillo vitalidad
      tertiary: const Color(0xFFEF5350),
      surface: const Color(0xFFFFF8F0),
      onSurface: const Color(0xFFB71C1C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEF5350),
      secondary: const Color(0xFFFFF176),
      tertiary: const Color(0xFFE57373),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0, // Dinámico
      typographyScale: 1.12, // Energético
      defaultBorderRadius: 16.0, // Dinámico pero funcional
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CULTURAL AMBER - Ámbar cultural con acentos teal
  // ==========================================================================

  /// Tema cálido ámbar cultural con frescura teal
  ///
  /// Ideal para: Centros culturales, museos, galerías, patrimonio cultural
  /// Personalidad: Cálido, cultural, histórico, artístico
  static final culturalAmber = DSThemePreset(
    id: 'specialized_cultural_amber',
    displayName: 'Cultural Amber',
    description: 'Ámbar cultural cálido con frescura teal para patrimonio',
    category: ThemeCategory.specialized,
    industries: ['cultural_center', 'museum', 'gallery', 'cultural_heritage', 'arts_center'],
    keywords: ['warm', 'cultural', 'historical', 'artistic', 'heritage'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFC107), // Ámbar cultural
      secondary: const Color(0xFF00BCD4), // Teal frescura
      tertiary: const Color(0xFFFFD54F),
      surface: const Color(0xFFFFFDF4),
      onSurface: const Color(0xFFFF8F00),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFD54F),
      secondary: const Color(0xFF26C6DA),
      tertiary: const Color(0xFFFFE082),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0, // Espacioso para contemplación
      typographyScale: 1.05,
      defaultBorderRadius: 12.0, // Elegante
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // ENVIRONMENT EARTH - Tierra ambiente con acentos verde
  // ==========================================================================

  /// Tema natural tierra ambiente con vida verde
  ///
  /// Ideal para: Organizaciones ambientales, sostenibilidad, ecología
  /// Personalidad: Natural, sostenible, responsable, vital
  static final environmentEarth = DSThemePreset(
    id: 'specialized_environment_earth',
    displayName: 'Environment Earth',
    description: 'Tierra ambiente natural con vida verde para sostenibilidad',
    category: ThemeCategory.specialized,
    industries: ['environmental_organization', 'sustainability', 'ecology', 'conservation', 'green_initiative'],
    keywords: ['natural', 'sustainable', 'responsible', 'vital', 'environmental'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8D6E63), // Tierra ambiente
      secondary: const Color(0xFF4CAF50), // Verde vida
      tertiary: const Color(0xFFA1887F),
      surface: const Color(0xFFFBF7F4),
      onSurface: const Color(0xFF3E2723),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFA1887F),
      secondary: const Color(0xFF66BB6A),
      tertiary: const Color(0xFFBCAAA4),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.02,
      defaultBorderRadius: 16.0, // Natural y orgánico
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );
}