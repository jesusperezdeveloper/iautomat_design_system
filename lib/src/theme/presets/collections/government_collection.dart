import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas gubernamentales institucionales y confiables
///
/// Temas diseñados para entidades gubernamentales, instituciones públicas,
/// organismos oficiales que requieren formalidad y confiabilidad.
///
/// Características:
/// - Colores institucionales y formales
/// - Tipografía clara y accesible
/// - Espaciado generoso para legibilidad
/// - Combinaciones confiables y oficiales
class GovernmentThemeCollection {
  GovernmentThemeCollection._();

  /// Listado completo de temas gubernamentales
  static List<DSThemePreset> get themes => [
    publicBlue,
    institutionalGray,
    civicGreen,
    diplomaticNavy,
    municipalTeal,
    federalPurple,
    justiceMaroon,
    defensiveOlive,
    socialBlue,
    transparentGray,
  ];

  // ==========================================================================
  // PUBLIC BLUE - Azul público con acentos blanco
  // ==========================================================================

  /// Tema confiable azul público con transparencia blanca
  ///
  /// Ideal para: Administración pública, servicios ciudadanos, portales gubernamentales
  /// Personalidad: Confiable, oficial, transparente, accesible
  static final publicBlue = DSThemePreset(
    id: 'government_public_blue',
    displayName: 'Public Blue',
    description: 'Azul público confiable con transparencia blanca para administración',
    category: ThemeCategory.government,
    industries: ['public_administration', 'citizen_services', 'government_portal', 'public_sector', 'municipal'],
    keywords: ['trustworthy', 'official', 'transparent', 'accessible', 'public'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0), // Azul público
      secondary: const Color(0xFFFFFFFF), // Blanco transparencia
      tertiary: const Color(0xFF1976D2),
      surface: const Color(0xFFF8FAFF),
      onSurface: const Color(0xFF0D47A1),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1976D2),
      secondary: const Color(0xFFE3F2FD),
      tertiary: const Color(0xFF42A5F5),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0, // Generoso para accesibilidad
      typographyScale: 1.05, // Ligeramente más legible
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // INSTITUTIONAL GRAY - Gris institucional con acentos azul
  // ==========================================================================

  /// Tema formal gris institucional con confianza azul
  ///
  /// Ideal para: Instituciones oficiales, organismos públicos, entidades regulatorias
  /// Personalidad: Formal, institucional, estable, neutral
  static final institutionalGray = DSThemePreset(
    id: 'government_institutional_gray',
    displayName: 'Institutional Gray',
    description: 'Gris institucional formal con confianza azul para organismos',
    category: ThemeCategory.government,
    industries: ['government_institution', 'regulatory_body', 'public_agency', 'official_entity', 'bureaucracy'],
    keywords: ['formal', 'institutional', 'stable', 'neutral', 'official'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF616161), // Gris institucional
      secondary: const Color(0xFF1976D2), // Azul confianza
      tertiary: const Color(0xFF757575),
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF212121),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF757575),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFF9E9E9E),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.0,
      defaultBorderRadius: 6.0, // Conservador
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CIVIC GREEN - Verde cívico con acentos dorado
  // ==========================================================================

  /// Tema participativo verde cívico con prestigio dorado
  ///
  /// Ideal para: Participación ciudadana, ayuntamientos, gobiernos locales
  /// Personalidad: Participativo, cívico, comunitario, prestigioso
  static final civicGreen = DSThemePreset(
    id: 'government_civic_green',
    displayName: 'Civic Green',
    description: 'Verde cívico participativo con prestigio dorado para comunidades',
    category: ThemeCategory.government,
    industries: ['civic_participation', 'city_hall', 'local_government', 'community_services', 'municipal_services'],
    keywords: ['participatory', 'civic', 'community', 'prestigious', 'local'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF388E3C), // Verde cívico
      secondary: const Color(0xFFFFD700), // Dorado prestigio
      tertiary: const Color(0xFF4CAF50),
      surface: const Color(0xFFF1F8E9),
      onSurface: const Color(0xFF1B5E20),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4CAF50),
      secondary: const Color(0xFFFFC107),
      tertiary: const Color(0xFF66BB6A),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.02,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // DIPLOMATIC NAVY - Navy diplomático con acentos plata
  // ==========================================================================

  /// Tema elegante navy diplomático con distinción plata
  ///
  /// Ideal para: Relaciones exteriores, embajadas, organismos internacionales
  /// Personalidad: Elegante, diplomático, distinguido, internacional
  static final diplomaticNavy = DSThemePreset(
    id: 'government_diplomatic_navy',
    displayName: 'Diplomatic Navy',
    description: 'Navy diplomático elegante con distinción plata para relaciones',
    category: ThemeCategory.government,
    industries: ['foreign_relations', 'embassy', 'international_organization', 'diplomatic_corps', 'consulate'],
    keywords: ['elegant', 'diplomatic', 'distinguished', 'international', 'formal'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0D47A1), // Navy diplomático
      secondary: const Color(0xFF9E9E9E), // Plata distinción
      tertiary: const Color(0xFF1565C0),
      surface: const Color(0xFFF5F7FA),
      onSurface: const Color(0xFF0D47A1),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0),
      secondary: const Color(0xFFBDBDBD),
      tertiary: const Color(0xFF1976D2),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0, // Más espacioso para elegancia
      typographyScale: 1.0,
      defaultBorderRadius: 6.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // MUNICIPAL TEAL - Teal municipal con acentos naranja
  // ==========================================================================

  /// Tema servicial teal municipal con dinamismo naranja
  ///
  /// Ideal para: Servicios municipales, obras públicas, gestión urbana
  /// Personalidad: Servicial, municipal, dinámico, urbano
  static final municipalTeal = DSThemePreset(
    id: 'government_municipal_teal',
    displayName: 'Municipal Teal',
    description: 'Teal municipal servicial con dinamismo naranja para servicios',
    category: ThemeCategory.government,
    industries: ['municipal_services', 'public_works', 'urban_management', 'city_services', 'infrastructure'],
    keywords: ['helpful', 'municipal', 'dynamic', 'urban', 'services'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00695C), // Teal municipal
      secondary: const Color(0xFFFF9800), // Naranja dinamismo
      tertiary: const Color(0xFF00897B),
      surface: const Color(0xFFF0FDFA),
      onSurface: const Color(0xFF004D40),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00897B),
      secondary: const Color(0xFFFFB74D),
      tertiary: const Color(0xFF26A69A),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.02,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // FEDERAL PURPLE - Púrpura federal con acentos blanco
  // ==========================================================================

  /// Tema autoridad púrpura federal con transparencia blanca
  ///
  /// Ideal para: Gobierno federal, ministerios, secretarías nacionales
  /// Personalidad: Autoritativo, federal, solemne, oficial
  static final federalPurple = DSThemePreset(
    id: 'government_federal_purple',
    displayName: 'Federal Purple',
    description: 'Púrpura federal autoritativo con transparencia blanca para ministerios',
    category: ThemeCategory.government,
    industries: ['federal_government', 'ministry', 'national_secretariat', 'central_government', 'federal_agency'],
    keywords: ['authoritative', 'federal', 'solemn', 'official', 'national'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6A1B9A), // Púrpura federal
      secondary: const Color(0xFFFFFFFF), // Blanco transparencia
      tertiary: const Color(0xFF7B1FA2),
      surface: const Color(0xFFF8F5FF),
      onSurface: const Color(0xFF4A148C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7B1FA2),
      secondary: const Color(0xFFE1BEE7),
      tertiary: const Color(0xFF8E24AA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0, // Espacioso para solemnidad
      typographyScale: 1.0,
      defaultBorderRadius: 6.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // JUSTICE MAROON - Granate justicia con acentos dorado
  // ==========================================================================

  /// Tema solemne granate justicia con prestigio dorado
  ///
  /// Ideal para: Sistema judicial, tribunales, procuradurías, justicia
  /// Personalidad: Solemne, justo, prestigioso, imparcial
  static final justiceMaroon = DSThemePreset(
    id: 'government_justice_maroon',
    displayName: 'Justice Maroon',
    description: 'Granate justicia solemne con prestigio dorado para tribunales',
    category: ThemeCategory.government,
    industries: ['judicial_system', 'courts', 'prosecutor_office', 'justice_department', 'legal_system'],
    keywords: ['solemn', 'just', 'prestigious', 'impartial', 'judicial'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8E24AA), // Granate justicia
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
      baseSpacing: 12.0, // Espacioso para solemnidad
      typographyScale: 1.0,
      defaultBorderRadius: 4.0, // Muy formal
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // DEFENSIVE OLIVE - Oliva defensivo con acentos azul
  // ==========================================================================

  /// Tema protector oliva defensivo con confianza azul
  ///
  /// Ideal para: Defensa nacional, fuerzas armadas, seguridad pública
  /// Personalidad: Protector, defensivo, fuerte, seguro
  static final defensiveOlive = DSThemePreset(
    id: 'government_defensive_olive',
    displayName: 'Defensive Olive',
    description: 'Oliva defensivo protector con confianza azul para seguridad',
    category: ThemeCategory.government,
    industries: ['national_defense', 'armed_forces', 'public_security', 'military', 'homeland_security'],
    keywords: ['protective', 'defensive', 'strong', 'secure', 'military'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF689F38), // Oliva defensivo
      secondary: const Color(0xFF1976D2), // Azul confianza
      tertiary: const Color(0xFF7CB342),
      surface: const Color(0xFFF1F8E9),
      onSurface: const Color(0xFF33691E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7CB342),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFF8BC34A),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0, // Más compacto para funcionalidad
      typographyScale: 1.0,
      defaultBorderRadius: 4.0, // Angular
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SOCIAL BLUE - Azul social con acentos verde
  // ==========================================================================

  /// Tema humano azul social con crecimiento verde
  ///
  /// Ideal para: Servicios sociales, bienestar, desarrollo humano
  /// Personalidad: Humano, social, empático, creciente
  static final socialBlue = DSThemePreset(
    id: 'government_social_blue',
    displayName: 'Social Blue',
    description: 'Azul social humano con crecimiento verde para bienestar',
    category: ThemeCategory.government,
    industries: ['social_services', 'welfare', 'human_development', 'social_security', 'community_development'],
    keywords: ['humane', 'social', 'empathetic', 'growing', 'welfare'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2196F3), // Azul social
      secondary: const Color(0xFF4CAF50), // Verde crecimiento
      tertiary: const Color(0xFF42A5F5),
      surface: const Color(0xFFF3F9FF),
      onSurface: const Color(0xFF0D47A1),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF42A5F5),
      secondary: const Color(0xFF66BB6A),
      tertiary: const Color(0xFF64B5F6),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.02, // Ligeramente más cálido
      defaultBorderRadius: 12.0, // Más suave
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // TRANSPARENT GRAY - Gris transparente con acentos teal
  // ==========================================================================

  /// Tema abierto gris transparente con modernidad teal
  ///
  /// Ideal para: Transparencia gubernamental, datos abiertos, gobierno digital
  /// Personalidad: Transparente, abierto, moderno, accesible
  static final transparentGray = DSThemePreset(
    id: 'government_transparent_gray',
    displayName: 'Transparent Gray',
    description: 'Gris transparente abierto con modernidad teal para datos abiertos',
    category: ThemeCategory.government,
    industries: ['open_government', 'open_data', 'digital_government', 'transparency', 'civic_tech'],
    keywords: ['transparent', 'open', 'modern', 'accessible', 'digital'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF78909C), // Gris transparente
      secondary: const Color(0xFF00BCD4), // Teal modernidad
      tertiary: const Color(0xFF90A4AE),
      surface: const Color(0xFFFAFBFC),
      onSurface: const Color(0xFF37474F),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF90A4AE),
      secondary: const Color(0xFF26C6DA),
      tertiary: const Color(0xFFB0BEC5),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 1.0,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );
}