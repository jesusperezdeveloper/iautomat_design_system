import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas creativos vibrantes y expresivos
///
/// Temas diseñados para agencias creativas, estudios de diseño, portfolios
/// y empresas que buscan proyectar creatividad, originalidad e innovación.
///
/// Características:
/// - Colores vibrantes y expresivos
/// - Tipografía dinámica y creativa
/// - Espaciado flexible para layouts creativos
/// - Combinaciones audaces pero accesibles
class CreativeThemeCollection {
  CreativeThemeCollection._();

  /// Listado completo de temas creativos
  static List<DSThemePreset> get themes => [
    artisticCoral,
    designerMagenta,
    creativeIndigo,
    studioLime,
    galleryRose,
    brandingViolet,
    portfolioTurquoise,
    conceptualAmber,
    innovativePink,
    expressiveTeal,
  ];

  // ==========================================================================
  // ARTISTIC CORAL - Coral artístico con acentos teal
  // ==========================================================================

  /// Tema vibrante coral artístico con acentos teal refrescantes
  ///
  /// Ideal para: Estudios de arte, galerías, diseñadores gráficos, artistas visuales
  /// Personalidad: Artístico, cálido, expresivo, creativo
  static final artisticCoral = DSThemePreset(
    id: 'creative_artistic_coral',
    displayName: 'Artistic Coral',
    description: 'Coral artístico vibrante con acentos teal para creativos visuales',
    category: ThemeCategory.creative,
    industries: ['art_studio', 'gallery', 'graphic_design', 'visual_arts', 'creative_agency'],
    keywords: ['artistic', 'warm', 'expressive', 'creative', 'vibrant'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF6B6B), // Coral artístico
      secondary: const Color(0xFF4ECDC4), // Teal fresco
      tertiary: const Color(0xFFFF8E8E),
      surface: const Color(0xFFFFFAFA),
      onSurface: const Color(0xFF2D1B1B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF8A8A),
      secondary: const Color(0xFF5DDDD4),
      tertiary: const Color(0xFFFFA8A8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.15, // Más expresivo
      defaultBorderRadius: 20.0, // Muy redondeado
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // DESIGNER MAGENTA - Magenta diseñador con acentos amarillo
  // ==========================================================================

  /// Tema audaz magenta diseñador con energía amarilla vibrante
  ///
  /// Ideal para: Agencias de branding, estudios de diseño, creativos freelance
  /// Personalidad: Audaz, energético, innovador, vanguardista
  static final designerMagenta = DSThemePreset(
    id: 'creative_designer_magenta',
    displayName: 'Designer Magenta',
    description: 'Magenta diseñador audaz con energía amarilla para vanguardistas',
    category: ThemeCategory.creative,
    industries: ['branding_agency', 'design_studio', 'freelance_creative', 'advertising', 'marketing_creative'],
    keywords: ['bold', 'energetic', 'innovative', 'avant_garde', 'dynamic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63), // Magenta diseñador
      secondary: const Color(0xFFFFEB3B), // Amarillo energético
      tertiary: const Color(0xFFF06292),
      surface: const Color(0xFFFEFEFE),
      onSurface: const Color(0xFF1A0E0E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF48FB1),
      secondary: const Color(0xFFFFF176),
      tertiary: const Color(0xFFCE93D8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0, // Más compacto para dinamismo
      typographyScale: 1.2, // Muy expresivo
      defaultBorderRadius: 24.0, // Súper redondeado
      isCompact: true,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CREATIVE INDIGO - Índigo creativo con acentos naranja
  // ==========================================================================

  /// Tema sofisticado índigo creativo con chispas naranja energéticas
  ///
  /// Ideal para: Portfolios creativos, agencias digitales, diseñadores UX/UI
  /// Personalidad: Sofisticado, creativo, equilibrado, profesional-creativo
  static final creativeIndigo = DSThemePreset(
    id: 'creative_indigo',
    displayName: 'Creative Indigo',
    description: 'Índigo sofisticado con chispas naranja para creativos digitales',
    category: ThemeCategory.creative,
    industries: ['digital_agency', 'ux_ui_design', 'creative_portfolio', 'interactive_design', 'web_design'],
    keywords: ['sophisticated', 'creative', 'balanced', 'digital', 'innovative'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3F51B5), // Índigo creativo
      secondary: const Color(0xFFFF9800), // Naranja energético
      tertiary: const Color(0xFF7986CB),
      surface: const Color(0xFFF8F9FA),
      onSurface: const Color(0xFF1A1A2E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7986CB),
      secondary: const Color(0xFFFFB74D),
      tertiary: const Color(0xFF9FA8DA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.1,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // STUDIO LIME - Lima estudio con acentos púrpura
  // ==========================================================================

  /// Tema fresco lima estudio con toques púrpura creativos
  ///
  /// Ideal para: Estudios creativos, espacios de coworking, startups creativas
  /// Personalidad: Fresco, juvenil, energético, innovador
  static final studioLime = DSThemePreset(
    id: 'creative_studio_lime',
    displayName: 'Studio Lime',
    description: 'Lima fresco de estudio con púrpura para espacios creativos',
    category: ThemeCategory.creative,
    industries: ['creative_studio', 'coworking', 'creative_startup', 'innovation_lab', 'maker_space'],
    keywords: ['fresh', 'youthful', 'energetic', 'innovative', 'collaborative'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFCDDC39), // Lima estudio
      secondary: const Color(0xFF9C27B0), // Púrpura creativo
      tertiary: const Color(0xFFDCE775),
      surface: const Color(0xFFFFFFF8),
      onSurface: const Color(0xFF1B1B0E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFDCE775),
      secondary: const Color(0xFFBA68C8),
      tertiary: const Color(0xFFE6EE9C),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 7.0,
      typographyScale: 1.12,
      defaultBorderRadius: 18.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // GALLERY ROSE - Rosa galería con acentos verde
  // ==========================================================================

  /// Tema elegante rosa galería con frescura verde natural
  ///
  /// Ideal para: Galerías de arte, curadurías, espacios culturales, museos
  /// Personalidad: Elegante, cultural, sofisticado, artístico
  static final galleryRose = DSThemePreset(
    id: 'creative_gallery_rose',
    displayName: 'Gallery Rose',
    description: 'Rosa galería elegante con frescura verde para espacios culturales',
    category: ThemeCategory.creative,
    industries: ['art_gallery', 'museum', 'cultural_space', 'curation', 'fine_arts'],
    keywords: ['elegant', 'cultural', 'sophisticated', 'artistic', 'refined'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63), // Rosa galería
      secondary: const Color(0xFF4CAF50), // Verde fresco
      tertiary: const Color(0xFFF8BBD9),
      surface: const Color(0xFFFDF7FA),
      onSurface: const Color(0xFF2E0A1A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF48FB1),
      secondary: const Color(0xFF81C784),
      tertiary: const Color(0xFFF8BBD9),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0, // Más espacioso para elegancia
      typographyScale: 1.08,
      defaultBorderRadius: 14.0,
      isCompact: false,
      isExpressive: false, // Más controlado
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // BRANDING VIOLET - Violeta branding con acentos dorado
  // ==========================================================================

  /// Tema premium violeta branding con lujo dorado
  ///
  /// Ideal para: Agencias de branding premium, consultorías creativas, luxury design
  /// Personalidad: Premium, lujoso, creativo, exclusivo
  static final brandingViolet = DSThemePreset(
    id: 'creative_branding_violet',
    displayName: 'Branding Violet',
    description: 'Violeta branding premium con lujo dorado para agencias exclusivas',
    category: ThemeCategory.creative,
    industries: ['premium_branding', 'luxury_design', 'creative_consulting', 'high_end_agency', 'exclusive_creative'],
    keywords: ['premium', 'luxurious', 'creative', 'exclusive', 'sophisticated'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF673AB7), // Violeta branding
      secondary: const Color(0xFFFFD700), // Dorado lujo
      tertiary: const Color(0xFF9C27B0),
      surface: const Color(0xFFFEFEFE),
      onSurface: const Color(0xFF1A0A2E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9C27B0),
      secondary: const Color(0xFFFFC107),
      tertiary: const Color(0xFFBA68C8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Espacioso para premium
      typographyScale: 1.05,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false, // Controlado pero elegante
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // PORTFOLIO TURQUOISE - Turquesa portfolio con acentos rojo
  // ==========================================================================

  /// Tema vibrante turquesa portfolio con energía roja contrastante
  ///
  /// Ideal para: Portfolios personales, freelancers creativos, diseñadores independientes
  /// Personalidad: Vibrante, personal, único, contrastante
  static final portfolioTurquoise = DSThemePreset(
    id: 'creative_portfolio_turquoise',
    displayName: 'Portfolio Turquoise',
    description: 'Turquesa vibrante con energía roja para portfolios únicos',
    category: ThemeCategory.creative,
    industries: ['personal_portfolio', 'freelance_creative', 'independent_designer', 'creative_professional', 'artist_portfolio'],
    keywords: ['vibrant', 'personal', 'unique', 'contrasting', 'dynamic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00BCD4), // Turquesa portfolio
      secondary: const Color(0xFFF44336), // Rojo energético
      tertiary: const Color(0xFF26C6DA),
      surface: const Color(0xFFF0FFFE),
      onSurface: const Color(0xFF003C3C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF26C6DA),
      secondary: const Color(0xFFEF5350),
      tertiary: const Color(0xFF4DD0E1),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 7.0,
      typographyScale: 1.18, // Muy expresivo para portfolio
      defaultBorderRadius: 22.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CONCEPTUAL AMBER - Ámbar conceptual con acentos azul
  // ==========================================================================

  /// Tema cálido ámbar conceptual con claridad azul intelectual
  ///
  /// Ideal para: Think tanks creativos, consultorías de innovación, laboratorios de ideas
  /// Personalidad: Conceptual, intelectual, cálido, innovador
  static final conceptualAmber = DSThemePreset(
    id: 'creative_conceptual_amber',
    displayName: 'Conceptual Amber',
    description: 'Ámbar conceptual cálido con claridad azul para innovadores',
    category: ThemeCategory.creative,
    industries: ['innovation_lab', 'think_tank', 'creative_consulting', 'concept_development', 'idea_laboratory'],
    keywords: ['conceptual', 'intellectual', 'warm', 'innovative', 'thoughtful'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFC107), // Ámbar conceptual
      secondary: const Color(0xFF2196F3), // Azul claridad
      tertiary: const Color(0xFFFFD54F),
      surface: const Color(0xFFFFFDF4),
      onSurface: const Color(0xFF2E1A00),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFD54F),
      secondary: const Color(0xFF64B5F6),
      tertiary: const Color(0xFFFFE082),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.06,
      defaultBorderRadius: 15.0,
      isCompact: false,
      isExpressive: false, // Más controlado para conceptual
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // INNOVATIVE PINK - Rosa innovador con acentos gris
  // ==========================================================================

  /// Tema moderno rosa innovador con sofisticación gris
  ///
  /// Ideal para: Startups creativas, agencias modernas, nuevos medios
  /// Personalidad: Moderno, innovador, equilibrado, fresco
  static final innovativePink = DSThemePreset(
    id: 'creative_innovative_pink',
    displayName: 'Innovative Pink',
    description: 'Rosa innovador moderno con sofisticación gris para startups creativas',
    category: ThemeCategory.creative,
    industries: ['creative_startup', 'modern_agency', 'new_media', 'digital_innovation', 'creative_tech'],
    keywords: ['modern', 'innovative', 'balanced', 'fresh', 'contemporary'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63), // Rosa innovador
      secondary: const Color(0xFF607D8B), // Gris sofisticado
      tertiary: const Color(0xFFF48FB1),
      surface: const Color(0xFFFDF8FA),
      onSurface: const Color(0xFF1A1A1A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF48FB1),
      secondary: const Color(0xFF90A4AE),
      tertiary: const Color(0xFFCE93D8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.1,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // EXPRESSIVE TEAL - Teal expresivo con acentos naranja
  // ==========================================================================

  /// Tema equilibrado teal expresivo con chispas naranja creativas
  ///
  /// Ideal para: Estudios multidisciplinarios, colectivos creativos, espacios colaborativos
  /// Personalidad: Expresivo, colaborativo, equilibrado, versátil
  static final expressiveTeal = DSThemePreset(
    id: 'creative_expressive_teal',
    displayName: 'Expressive Teal',
    description: 'Teal expresivo equilibrado con chispas naranja para colaboración creativa',
    category: ThemeCategory.creative,
    industries: ['multidisciplinary_studio', 'creative_collective', 'collaborative_space', 'creative_community', 'design_collective'],
    keywords: ['expressive', 'collaborative', 'balanced', 'versatile', 'community'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF009688), // Teal expresivo
      secondary: const Color(0xFFFF5722), // Naranja creativo
      tertiary: const Color(0xFF4DB6AC),
      surface: const Color(0xFFF0FFFE),
      onSurface: const Color(0xFF00251A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4DB6AC),
      secondary: const Color(0xFFFF7043),
      tertiary: const Color(0xFF80CBC4),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.12,
      defaultBorderRadius: 18.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );
}