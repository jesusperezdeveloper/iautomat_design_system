import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas educativos amigables y accesibles
///
/// Temas diseñados para instituciones educativas, plataformas de aprendizaje,
/// universidades y organizaciones académicas que requieren transmitir
/// conocimiento, accesibilidad y ambiente de aprendizaje positivo.
///
/// Características:
/// - Colores amigables y acogedores
/// - Paletas que fomentan el aprendizaje
/// - Excelente accesibilidad y legibilidad
/// - Diseño inclusivo y motivador
class EducationThemeCollection {
  EducationThemeCollection._();

  /// Listado completo de temas educativos
  static List<DSThemePreset> get themes => [
    academicBlue,
    universityGreen,
    learningOrange,
    scholarshipPurple,
    campusTeal,
    studyMint,
    knowledgeIndigo,
    elearningCyan,
    teachingWarm,
    researchGray,
  ];

  // ==========================================================================
  // ACADEMIC BLUE - Azul académico con acentos blancos
  // ==========================================================================

  /// Tema académico clásico con azul confiable y acentos blancos puros
  ///
  /// Ideal para: Universidades tradicionales, colegios, instituciones académicas
  /// Personalidad: Tradición académica, conocimiento, excelencia educativa
  static final academicBlue = DSThemePreset(
    id: 'education_academic_blue',
    displayName: 'Academic Blue',
    description: 'Azul académico tradicional con acentos blancos para excelencia educativa',
    category: ThemeCategory.education,
    industries: ['university', 'college', 'academic_institution', 'traditional_education', 'higher_education'],
    keywords: ['traditional', 'academic', 'knowledgeable', 'excellent', 'scholarly'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1E40AF), // Azul académico
      secondary: const Color(0xFFFFFFFF), // Blanco puro
      tertiary: const Color(0xFF3B82F6),
      surface: const Color(0xFFFAFBFF),
      onSurface: const Color(0xFF1E293B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B82F6),
      secondary: const Color(0xFFF8FAFC),
      tertiary: const Color(0xFF60A5FA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0,
      typographyScale: 1.0,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // UNIVERSITY GREEN - Verde universidad con acentos dorados
  // ==========================================================================

  /// Tema universitario con verde crecimiento y dorado de logros
  ///
  /// Ideal para: Campus universitarios, facultades, programas de grado
  /// Personalidad: Crecimiento intelectual, logros académicos, naturaleza del saber
  static final universityGreen = DSThemePreset(
    id: 'education_university_green',
    displayName: 'University Green',
    description: 'Verde universidad próspero con acentos dorados de logro académico',
    category: ThemeCategory.education,
    industries: ['university_campus', 'academic_programs', 'graduate_school', 'research_university', 'faculty'],
    keywords: ['growing', 'achieving', 'natural', 'prosperous', 'accomplished'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF059669), // Verde universidad
      secondary: const Color(0xFFD4AF37), // Dorado logro
      tertiary: const Color(0xFF10B981),
      surface: const Color(0xFFF0FDF4),
      onSurface: const Color(0xFF064E3B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981),
      secondary: const Color(0xFFFBBF24),
      tertiary: const Color(0xFF34D399),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.02,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // LEARNING ORANGE - Naranja aprendizaje con acentos azules
  // ==========================================================================

  /// Tema de aprendizaje con naranja energético y azules de concentración
  ///
  /// Ideal para: Plataformas e-learning, cursos online, educación digital
  /// Personalidad: Energía de aprender, creatividad, innovación educativa
  static final learningOrange = DSThemePreset(
    id: 'education_learning_orange',
    displayName: 'Learning Orange',
    description: 'Naranja aprendizaje energético con acentos azul concentración',
    category: ThemeCategory.education,
    industries: ['elearning', 'online_courses', 'digital_education', 'educational_technology', 'learning_platforms'],
    keywords: ['energetic', 'creative', 'innovative', 'engaging', 'dynamic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEA580C), // Naranja aprendizaje
      secondary: const Color(0xFF2563EB), // Azul concentración
      tertiary: const Color(0xFFF97316),
      surface: const Color(0xFFFFF7ED),
      onSurface: const Color(0xFF9A3412),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF97316),
      secondary: const Color(0xFF60A5FA),
      tertiary: const Color(0xFFFB923C),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.05,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SCHOLARSHIP PURPLE - Púrpura beca con acentos amarillos
  // ==========================================================================

  /// Tema de becas con púrpura de oportunidad y amarillo de brillantez
  ///
  /// Ideal para: Programas de becas, fundaciones educativas, ayudas estudiantiles
  /// Personalidad: Oportunidad, brillantez académica, apoyo estudiantil
  static final scholarshipPurple = DSThemePreset(
    id: 'education_scholarship_purple',
    displayName: 'Scholarship Purple',
    description: 'Púrpura beca de oportunidad con acentos amarillo brillantez',
    category: ThemeCategory.education,
    industries: ['scholarships', 'educational_foundations', 'student_aid', 'academic_support', 'merit_programs'],
    keywords: ['opportunity', 'brilliant', 'supportive', 'merit_based', 'empowering'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C3AED), // Púrpura beca
      secondary: const Color(0xFFF59E0B), // Amarillo brillantez
      tertiary: const Color(0xFF8B5CF6),
      surface: const Color(0xFFFAF9FF),
      onSurface: const Color(0xFF3C1C6C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8B5CF6),
      secondary: const Color(0xFFFCD34D),
      tertiary: const Color(0xFFA78BFA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 1.0,
      defaultBorderRadius: 14.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CAMPUS TEAL - Teal campus con acentos naranjas
  // ==========================================================================

  /// Tema campus con teal equilibrado y naranjas de vitalidad
  ///
  /// Ideal para: Vida universitaria, servicios estudiantiles, actividades campus
  /// Personalidad: Equilibrio académico, vitalidad estudiantil, comunidad
  static final campusTeal = DSThemePreset(
    id: 'education_campus_teal',
    displayName: 'Campus Teal',
    description: 'Teal campus equilibrado con acentos naranja vitalidad estudiantil',
    category: ThemeCategory.education,
    industries: ['campus_life', 'student_services', 'student_activities', 'university_community', 'student_affairs'],
    keywords: ['balanced', 'vital', 'community', 'engaging', 'social'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F766E), // Teal campus
      secondary: const Color(0xFFEA580C), // Naranja vitalidad
      tertiary: const Color(0xFF14B8A6),
      surface: const Color(0xFFF0FDFA),
      onSurface: const Color(0xFF134E4A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF14B8A6),
      secondary: const Color(0xFFF97316),
      tertiary: const Color(0xFF2DD4BF),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // STUDY MINT - Menta estudio con acentos púrpuras
  // ==========================================================================

  /// Tema de estudio con menta relajante y púrpura concentración
  ///
  /// Ideal para: Bibliotecas, salas de estudio, centros de tutorías
  /// Personalidad: Concentración, tranquilidad, ambiente de estudio
  static final studyMint = DSThemePreset(
    id: 'education_study_mint',
    displayName: 'Study Mint',
    description: 'Menta estudio relajante con acentos púrpura concentración',
    category: ThemeCategory.education,
    industries: ['libraries', 'study_centers', 'tutoring', 'academic_support', 'learning_spaces'],
    keywords: ['concentrated', 'calm', 'focused', 'peaceful', 'productive'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981), // Menta estudio
      secondary: const Color(0xFF7C3AED), // Púrpura concentración
      tertiary: const Color(0xFF34D399),
      surface: const Color(0xFFF0FDF8),
      onSurface: const Color(0xFF064E3B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF34D399),
      secondary: const Color(0xFF8B5CF6),
      tertiary: const Color(0xFF6EE7B7),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 0.98,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // KNOWLEDGE INDIGO - Índigo conocimiento con acentos verdes
  // ==========================================================================

  /// Tema de conocimiento con índigo profundo y verdes de crecimiento
  ///
  /// Ideal para: Investigación académica, postgrados, centros de conocimiento
  /// Personalidad: Profundidad intelectual, sabiduría, crecimiento académico
  static final knowledgeIndigo = DSThemePreset(
    id: 'education_knowledge_indigo',
    displayName: 'Knowledge Indigo',
    description: 'Índigo conocimiento profundo con acentos verde crecimiento intelectual',
    category: ThemeCategory.education,
    industries: ['academic_research', 'graduate_studies', 'knowledge_centers', 'think_tanks', 'scholarly_research'],
    keywords: ['deep', 'wise', 'intellectual', 'scholarly', 'profound'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4338CA), // Índigo conocimiento
      secondary: const Color(0xFF059669), // Verde crecimiento
      tertiary: const Color(0xFF6366F1),
      surface: const Color(0xFFF8F9FF),
      onSurface: const Color(0xFF312E81),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6366F1),
      secondary: const Color(0xFF10B981),
      tertiary: const Color(0xFF818CF8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0,
      typographyScale: 0.96,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // ELEARNING CYAN - Cyan e-learning con acentos rosas
  // ==========================================================================

  /// Tema e-learning con cyan digital y rosas de creatividad
  ///
  /// Ideal para: MOOCs, plataformas educativas, cursos virtuales
  /// Personalidad: Innovación digital, creatividad, aprendizaje moderno
  static final elearningCyan = DSThemePreset(
    id: 'education_elearning_cyan',
    displayName: 'E-Learning Cyan',
    description: 'Cyan e-learning digital con acentos rosa creatividad',
    category: ThemeCategory.education,
    industries: ['moocs', 'online_education', 'virtual_learning', 'educational_apps', 'digital_classrooms'],
    keywords: ['digital', 'creative', 'modern', 'innovative', 'interactive'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0891B2), // Cyan e-learning
      secondary: const Color(0xFFEC4899), // Rosa creatividad
      tertiary: const Color(0xFF06B6D4),
      surface: const Color(0xFFF0F9FF),
      onSurface: const Color(0xFF164E63),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF22D3EE),
      secondary: const Color(0xFFF472B6),
      tertiary: const Color(0xFF67E8F9),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.02,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // TEACHING WARM - Cálido enseñanza con acentos azules
  // ==========================================================================

  /// Tema de enseñanza con tonos cálidos y azules de confianza
  ///
  /// Ideal para: Colegios primarios, educación infantil, escuelas comunitarias
  /// Personalidad: Calidez educativa, confianza, ambiente acogedor
  static final teachingWarm = DSThemePreset(
    id: 'education_teaching_warm',
    displayName: 'Teaching Warm',
    description: 'Tonos cálidos de enseñanza con acentos azul confianza',
    category: ThemeCategory.education,
    industries: ['primary_education', 'elementary_school', 'early_childhood', 'community_schools', 'basic_education'],
    keywords: ['warm', 'trusting', 'welcoming', 'nurturing', 'caring'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFDC2626), // Cálido enseñanza
      secondary: const Color(0xFF2563EB), // Azul confianza
      tertiary: const Color(0xFFEF4444),
      surface: const Color(0xFFFEF7F0),
      onSurface: const Color(0xFF7C2D12),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF97316),
      secondary: const Color(0xFF60A5FA),
      tertiary: const Color(0xFFFB923C),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.05,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // RESEARCH GRAY - Gris investigación con acentos teal
  // ==========================================================================

  /// Tema de investigación con gris neutral y teal de descubrimiento
  ///
  /// Ideal para: Centros de investigación, laboratorios, institutos científicos
  /// Personalidad: Neutralidad científica, descubrimiento, objetividad
  static final researchGray = DSThemePreset(
    id: 'education_research_gray',
    displayName: 'Research Gray',
    description: 'Gris investigación neutral con acentos teal descubrimiento',
    category: ThemeCategory.education,
    industries: ['research_centers', 'laboratories', 'scientific_institutes', 'r_and_d', 'academic_research'],
    keywords: ['neutral', 'scientific', 'objective', 'discovering', 'analytical'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6B7280), // Gris investigación
      secondary: const Color(0xFF0F766E), // Teal descubrimiento
      tertiary: const Color(0xFF9CA3AF),
      surface: const Color(0xFFF9FAFB),
      onSurface: const Color(0xFF374151),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9CA3AF),
      secondary: const Color(0xFF14B8A6),
      tertiary: const Color(0xFFD1D5DB),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 0.98,
      defaultBorderRadius: 8.0,
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );
}