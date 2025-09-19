import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas corporativos profesionales
///
/// Temas diseñados para empresas establecidas, consultorías y corporaciones
/// que requieren una imagen profesional, confiable y tradicional.
///
/// Características:
/// - Colores conservadores y profesionales
/// - Tipografía legible y formal
/// - Espaciado generoso para claridad
/// - Excelente contraste para accesibilidad
class CorporateThemeCollection {
  CorporateThemeCollection._();

  /// Listado completo de temas corporativos
  static List<DSThemePreset> get themes => [
    executiveNavy,
    corporateSteel,
    businessCharcoal,
    professionalSlate,
    enterpriseGray,
    consultingBlue,
    boardroomBrown,
    institutionalGreen,
    corporateWine,
    establishedTeal,
  ];

  // ==========================================================================
  // EXECUTIVE NAVY - Navy profundo con acentos dorados
  // ==========================================================================

  /// Tema corporativo con navy profundo y acentos dorados elegantes
  ///
  /// Ideal para: Bancos de inversión, bufetes de abogados, consultorías premium
  /// Personalidad: Autoridad, tradición, excelencia
  static final executiveNavy = DSThemePreset(
    id: 'corporate_executive_navy',
    displayName: 'Executive Navy',
    description: 'Navy profundo con acentos dorados para máxima autoridad corporativa',
    category: ThemeCategory.corporate,
    industries: ['banking', 'legal', 'consulting', 'finance', 'insurance'],
    keywords: ['executive', 'premium', 'authority', 'traditional', 'professional'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B3B73), // Navy profundo
      secondary: const Color(0xFFD4AF37), // Oro elegante
      tertiary: const Color(0xFF6B7280), // Gris plateado
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF1F2937),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2563EB), // Navy más claro para dark
      secondary: const Color(0xFFFBBF24), // Oro más brillante
      tertiary: const Color(0xFF9CA3AF),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Espaciado generoso
      typographyScale: 0.95, // Tipografía conservadora
      defaultBorderRadius: 8.0, // Bordes moderados
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CORPORATE STEEL - Gris acero con acentos azul corporativo
  // ==========================================================================

  /// Tema moderno de acero con acentos azul tecnológico
  ///
  /// Ideal para: Corporaciones tech, multinacionales, startups maduras
  /// Personalidad: Innovación controlada, eficiencia, modernidad
  static final corporateSteel = DSThemePreset(
    id: 'corporate_steel',
    displayName: 'Corporate Steel',
    description: 'Gris acero moderno con acentos azul para corporaciones innovadoras',
    category: ThemeCategory.corporate,
    industries: ['technology', 'manufacturing', 'automotive', 'aerospace', 'enterprise'],
    keywords: ['modern', 'efficient', 'innovative', 'sleek', 'professional'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF475569), // Gris acero
      secondary: const Color(0xFF0EA5E9), // Azul corporativo
      tertiary: const Color(0xFF64748B),
      surface: const Color(0xFFF8FAFC),
      onSurface: const Color(0xFF0F172A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF64748B),
      secondary: const Color(0xFF38BDF8),
      tertiary: const Color(0xFF94A3B8),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // BUSINESS CHARCOAL - Carbón elegante con acentos plata
  // ==========================================================================

  /// Tema sofisticado de carbón con toques plateados
  ///
  /// Ideal para: Consultorías estratégicas, firmas de arquitectura, despachos profesionales
  /// Personalidad: Sofisticación, minimalismo, elegancia
  static final businessCharcoal = DSThemePreset(
    id: 'corporate_business_charcoal',
    displayName: 'Business Charcoal',
    description: 'Carbón sofisticado con acentos plateados para máxima elegancia',
    category: ThemeCategory.corporate,
    industries: ['consulting', 'architecture', 'design', 'legal', 'real_estate'],
    keywords: ['sophisticated', 'minimal', 'elegant', 'premium', 'refined'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF374151), // Carbón
      secondary: const Color(0xFF9CA3AF), // Plata
      tertiary: const Color(0xFF6B7280),
      surface: const Color(0xFFFEFEFE),
      onSurface: const Color(0xFF111827),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4B5563),
      secondary: const Color(0xFFD1D5DB),
      tertiary: const Color(0xFF9CA3AF),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 1.05,
      defaultBorderRadius: 6.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // PROFESSIONAL SLATE - Pizarra con acentos cobre
  // ==========================================================================

  /// Tema cálido de pizarra con acentos cobre distintivos
  ///
  /// Ideal para: Estudios contables, asesorías fiscales, gestorías
  /// Personalidad: Confianza, calidez profesional, experiencia
  static final professionalSlate = DSThemePreset(
    id: 'corporate_professional_slate',
    displayName: 'Professional Slate',
    description: 'Pizarra profesional con acentos cobre para confianza y calidez',
    category: ThemeCategory.corporate,
    industries: ['accounting', 'tax', 'audit', 'advisory', 'business_services'],
    keywords: ['trustworthy', 'warm', 'experienced', 'reliable', 'professional'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF64748B), // Pizarra
      secondary: const Color(0xFFEA580C), // Cobre
      tertiary: const Color(0xFF78716C),
      surface: const Color(0xFFF9F9F9),
      onSurface: const Color(0xFF1C1917),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF94A3B8),
      secondary: const Color(0xFFFB923C),
      tertiary: const Color(0xFFA8A29E),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 0.98,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // ENTERPRISE GRAY - Gris neutro con acentos verde corporativo
  // ==========================================================================

  /// Tema versátil gris neutro con toques verdes de crecimiento
  ///
  /// Ideal para: Corporaciones grandes, multinacionales, holding empresariales
  /// Personalidad: Estabilidad, crecimiento, versatilidad
  static final enterpriseGray = DSThemePreset(
    id: 'corporate_enterprise_gray',
    displayName: 'Enterprise Gray',
    description: 'Gris neutro empresarial con acentos verdes de crecimiento',
    category: ThemeCategory.corporate,
    industries: ['enterprise', 'multinational', 'holding', 'conglomerate', 'corporation'],
    keywords: ['stable', 'growth', 'versatile', 'corporate', 'established'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6B7280), // Gris neutro
      secondary: const Color(0xFF059669), // Verde corporativo
      tertiary: const Color(0xFF4B5563),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF111827),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9CA3AF),
      secondary: const Color(0xFF10B981),
      tertiary: const Color(0xFF6B7280),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CONSULTING BLUE - Azul consultoría con acentos naranja energético
  // ==========================================================================

  /// Tema dinámico azul consultoría con energía naranja
  ///
  /// Ideal para: Consultorías de gestión, firmas de estrategia, business consulting
  /// Personalidad: Dinamismo profesional, innovación, resultados
  static final consultingBlue = DSThemePreset(
    id: 'corporate_consulting_blue',
    displayName: 'Consulting Blue',
    description: 'Azul consultoría dinámico con acentos naranja energéticos',
    category: ThemeCategory.corporate,
    industries: ['consulting', 'strategy', 'management', 'business_advisory', 'transformation'],
    keywords: ['dynamic', 'innovative', 'results', 'strategic', 'energetic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1E40AF), // Azul consultoría
      secondary: const Color(0xFFEA580C), // Naranja energético
      tertiary: const Color(0xFF3B82F6),
      surface: const Color(0xFFFCFCFC),
      onSurface: const Color(0xFF1E293B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B82F6),
      secondary: const Color(0xFFFB923C),
      tertiary: const Color(0xFF60A5FA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.02,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // BOARDROOM BROWN - Marrón ejecutivo con acentos azul institucional
  // ==========================================================================

  /// Tema ejecutivo marrón cálido con toques azul institucional
  ///
  /// Ideal para: Juntas directivas, salas de consejo, empresas familiares
  /// Personalidad: Tradición, solidez, institucional
  static final boardroomBrown = DSThemePreset(
    id: 'corporate_boardroom_brown',
    displayName: 'Boardroom Brown',
    description: 'Marrón ejecutivo tradicional con acentos azul institucional',
    category: ThemeCategory.corporate,
    industries: ['family_business', 'traditional', 'board_governance', 'executive', 'institutional'],
    keywords: ['traditional', 'solid', 'institutional', 'warm', 'executive'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF92400E), // Marrón ejecutivo
      secondary: const Color(0xFF1E40AF), // Azul institucional
      tertiary: const Color(0xFFA16207),
      surface: const Color(0xFFFEFEFE),
      onSurface: const Color(0xFF451A03),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD97706),
      secondary: const Color(0xFF3B82F6),
      tertiary: const Color(0xFFF59E0B),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 0.96,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // INSTITUTIONAL GREEN - Verde institucional con acentos dorados
  // ==========================================================================

  /// Tema institucional verde con elegancia dorada
  ///
  /// Ideal para: Instituciones financieras, organismos públicos, fundaciones
  /// Personalidad: Institucional, prestigio, sostenibilidad
  static final institutionalGreen = DSThemePreset(
    id: 'corporate_institutional_green',
    displayName: 'Institutional Green',
    description: 'Verde institucional prestigioso con acentos dorados elegantes',
    category: ThemeCategory.corporate,
    industries: ['institutional', 'finance', 'public_sector', 'foundation', 'sustainability'],
    keywords: ['institutional', 'prestigious', 'sustainable', 'elegant', 'established'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF166534), // Verde institucional
      secondary: const Color(0xFFD4AF37), // Oro
      tertiary: const Color(0xFF15803D),
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF14532D),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF22C55E),
      secondary: const Color(0xFFFBBF24),
      tertiary: const Color(0xFF4ADE80),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 1.0,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CORPORATE WINE - Vino corporativo con acentos plata
  // ==========================================================================

  /// Tema distintivo vino corporativo con sofisticación plateada
  ///
  /// Ideal para: Empresas de lujo, bodegas corporativas, marcas premium
  /// Personalidad: Distinción, lujo discreto, sofisticación
  static final corporateWine = DSThemePreset(
    id: 'corporate_wine',
    displayName: 'Corporate Wine',
    description: 'Vino corporativo distintivo con sofisticación plateada',
    category: ThemeCategory.corporate,
    industries: ['luxury', 'wine', 'premium_brands', 'hospitality', 'fine_goods'],
    keywords: ['distinctive', 'luxury', 'sophisticated', 'premium', 'refined'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF881337), // Vino corporativo
      secondary: const Color(0xFF94A3B8), // Plata
      tertiary: const Color(0xFFBE185D),
      surface: const Color(0xFFFDF2F8),
      onSurface: const Color(0xFF500724),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE11D48),
      secondary: const Color(0xFFE2E8F0),
      tertiary: const Color(0xFFF43F5E),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.03,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // ESTABLISHED TEAL - Teal establecido con acentos cálidos
  // ==========================================================================

  /// Tema equilibrado teal con calidez profesional
  ///
  /// Ideal para: Empresas consolidadas, servicios profesionales, consultorías especializadas
  /// Personalidad: Equilibrio, consolidación, profesionalismo cálido
  static final establishedTeal = DSThemePreset(
    id: 'corporate_established_teal',
    displayName: 'Established Teal',
    description: 'Teal equilibrado con calidez para empresas consolidadas',
    category: ThemeCategory.corporate,
    industries: ['established', 'professional_services', 'specialized_consulting', 'mature_business', 'advisory'],
    keywords: ['balanced', 'established', 'warm_professional', 'consolidated', 'mature'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F766E), // Teal establecido
      secondary: const Color(0xFFEA580C), // Naranja cálido
      tertiary: const Color(0xFF14B8A6),
      surface: const Color(0xFFF0FDFA),
      onSurface: const Color(0xFF134E4A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF14B8A6),
      secondary: const Color(0xFFFB923C),
      tertiary: const Color(0xFF2DD4BF),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 0.99,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );
}