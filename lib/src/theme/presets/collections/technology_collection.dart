import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas tecnológicos modernos
///
/// Temas diseñados para startups, empresas tech, SaaS y compañías innovadoras
/// que buscan proyectar modernidad, dinamismo e innovación.
///
/// Características:
/// - Colores vibrantes y futuristas
/// - Tipografía moderna y dinámica
/// - Espaciado optimizado para interfaces
/// - Contrastes energéticos con accesibilidad
class TechnologyThemeCollection {
  TechnologyThemeCollection._();

  /// Listado completo de temas tecnológicos
  static List<DSThemePreset> get themes => [
    cyberNeon,
    quantumPurple,
    digitalMint,
    aiSilver,
    blockchainOrange,
    cloudWhite,
    dataGreen,
    roboticRed,
    techGold,
    futureBlack,
  ];

  // ==========================================================================
  // CYBER NEON - Azul neón con acentos eléctricos
  // ==========================================================================

  /// Tema futurista con azul neón y acentos eléctricos vibrantes
  ///
  /// Ideal para: Startups tech, cyberseguridad, gaming, aplicaciones futuristas
  /// Personalidad: Futurista, energético, cutting-edge
  static final cyberNeon = DSThemePreset(
    id: 'technology_cyber_neon',
    displayName: 'Cyber Neon',
    description: 'Azul neón futurista con acentos eléctricos para startups tech',
    category: ThemeCategory.technology,
    industries: ['startup', 'cybersecurity', 'gaming', 'web3', 'blockchain'],
    keywords: ['futuristic', 'energetic', 'neon', 'cyber', 'innovative'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0066FF), // Azul neón
      secondary: const Color(0xFF00FF88), // Verde eléctrico
      tertiary: const Color(0xFF8B5CF6), // Púrpura tech
      surface: const Color(0xFFF8FAFC),
      onSurface: const Color(0xFF0F172A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B82F6),
      secondary: const Color(0xFF10B981),
      tertiary: const Color(0xFFA855F7),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0, // Más compacto para tech
      typographyScale: 1.1, // Más dramático
      defaultBorderRadius: 16.0, // Más redondeado
      isCompact: true,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // QUANTUM PURPLE - Púrpura cuántico con acentos cyan
  // ==========================================================================

  /// Tema innovador púrpura con toques cyan para AI y quantum computing
  ///
  /// Ideal para: IA, machine learning, quantum computing, investigación
  /// Personalidad: Innovación científica, inteligencia, misterio tech
  static final quantumPurple = DSThemePreset(
    id: 'technology_quantum_purple',
    displayName: 'Quantum Purple',
    description: 'Púrpura cuántico con cyan para AI y tecnologías emergentes',
    category: ThemeCategory.technology,
    industries: ['ai', 'machine_learning', 'quantum_computing', 'research', 'data_science'],
    keywords: ['quantum', 'intelligent', 'mysterious', 'advanced', 'scientific'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C3AED), // Púrpura cuántico
      secondary: const Color(0xFF06B6D4), // Cyan científico
      tertiary: const Color(0xFF8B5CF6),
      surface: const Color(0xFFFAF9FF),
      onSurface: const Color(0xFF1E1B4B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8B5CF6),
      secondary: const Color(0xFF22D3EE),
      tertiary: const Color(0xFFA78BFA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0,
      typographyScale: 1.15,
      defaultBorderRadius: 14.0,
      isCompact: true,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // DIGITAL MINT - Menta digital con acentos púrpura
  // ==========================================================================

  /// Tema refrescante menta digital con energía púrpura
  ///
  /// Ideal para: Apps móviles, UX/UI, design systems, productos digitales
  /// Personalidad: Fresco, creativo, user-friendly, moderno
  static final digitalMint = DSThemePreset(
    id: 'technology_digital_mint',
    displayName: 'Digital Mint',
    description: 'Menta digital refrescante con energía púrpura creativa',
    category: ThemeCategory.technology,
    industries: ['mobile_apps', 'ux_ui', 'design_tools', 'digital_products', 'saas'],
    keywords: ['fresh', 'creative', 'user_friendly', 'modern', 'digital'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF14B8A6), // Menta digital
      secondary: const Color(0xFF8B5CF6), // Púrpura creativo
      tertiary: const Color(0xFF06B6D4),
      surface: const Color(0xFFF0FDFA),
      onSurface: const Color(0xFF134E4A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2DD4BF),
      secondary: const Color(0xFFA855F7),
      tertiary: const Color(0xFF22D3EE),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.05,
      defaultBorderRadius: 20.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // AI SILVER - Plata AI con acentos azul inteligente
  // ==========================================================================

  /// Tema sofisticado plata con toques azul para inteligencia artificial
  ///
  /// Ideal para: AI companies, automation, robotics, smart systems
  /// Personalidad: Inteligente, sofisticado, automatizado, preciso
  static final aiSilver = DSThemePreset(
    id: 'technology_ai_silver',
    displayName: 'AI Silver',
    description: 'Plata inteligente con azul para empresas de inteligencia artificial',
    category: ThemeCategory.technology,
    industries: ['artificial_intelligence', 'automation', 'robotics', 'smart_systems', 'ml_ops'],
    keywords: ['intelligent', 'sophisticated', 'automated', 'precise', 'smart'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF64748B), // Plata AI
      secondary: const Color(0xFF2563EB), // Azul inteligente
      tertiary: const Color(0xFF94A3B8),
      surface: const Color(0xFFFBFBFB),
      onSurface: const Color(0xFF0F172A),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF94A3B8),
      secondary: const Color(0xFF3B82F6),
      tertiary: const Color(0xFFCBD5E1),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0,
      typographyScale: 1.0,
      defaultBorderRadius: 12.0,
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // BLOCKCHAIN ORANGE - Naranja blockchain con acentos oscuros
  // ==========================================================================

  /// Tema energético naranja blockchain con toques oscuros profesionales
  ///
  /// Ideal para: Blockchain, criptomonedas, DeFi, Web3, fintech innovador
  /// Personalidad: Revolucionario, energético, descentralizado, audaz
  static final blockchainOrange = DSThemePreset(
    id: 'technology_blockchain_orange',
    displayName: 'Blockchain Orange',
    description: 'Naranja blockchain revolucionario con acentos oscuros profesionales',
    category: ThemeCategory.technology,
    industries: ['blockchain', 'cryptocurrency', 'defi', 'web3', 'fintech'],
    keywords: ['revolutionary', 'energetic', 'decentralized', 'bold', 'crypto'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEA580C), // Naranja blockchain
      secondary: const Color(0xFF1F2937), // Gris oscuro
      tertiary: const Color(0xFFFB923C),
      surface: const Color(0xFFFFFBEB),
      onSurface: const Color(0xFF9A3412),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFB923C),
      secondary: const Color(0xFF374151),
      tertiary: const Color(0xFFFDE68A),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0,
      typographyScale: 1.08,
      defaultBorderRadius: 8.0,
      isCompact: true,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CLOUD WHITE - Blanco nube con acentos multicolor
  // ==========================================================================

  /// Tema limpio cloud-first con acentos tecnológicos multicolor
  ///
  /// Ideal para: Cloud computing, SaaS, infraestructura, DevOps
  /// Personalidad: Limpio, escalable, versátil, confiable
  static final cloudWhite = DSThemePreset(
    id: 'technology_cloud_white',
    displayName: 'Cloud White',
    description: 'Blanco nube limpio con acentos multicolor para cloud computing',
    category: ThemeCategory.technology,
    industries: ['cloud_computing', 'saas', 'infrastructure', 'devops', 'platform'],
    keywords: ['clean', 'scalable', 'versatile', 'reliable', 'cloud'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFFFFF), // Blanco nube
      secondary: const Color(0xFF3B82F6), // Azul cloud
      tertiary: const Color(0xFF10B981), // Verde success
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF111827),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF9FAFB),
      secondary: const Color(0xFF60A5FA),
      tertiary: const Color(0xFF34D399),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // DATA GREEN - Verde datos con acentos naranja analíticos
  // ==========================================================================

  /// Tema inteligente verde datos con energía naranja para analytics
  ///
  /// Ideal para: Data analytics, big data, business intelligence, metrics
  /// Personalidad: Analítico, crecimiento, insights, inteligente
  static final dataGreen = DSThemePreset(
    id: 'technology_data_green',
    displayName: 'Data Green',
    description: 'Verde datos inteligente con naranja para analytics y big data',
    category: ThemeCategory.technology,
    industries: ['data_analytics', 'big_data', 'business_intelligence', 'metrics', 'insights'],
    keywords: ['analytical', 'growth', 'insights', 'intelligent', 'data_driven'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF059669), // Verde datos
      secondary: const Color(0xFFEA580C), // Naranja analítico
      tertiary: const Color(0xFF10B981),
      surface: const Color(0xFFF0FDF4),
      onSurface: const Color(0xFF14532D),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981),
      secondary: const Color(0xFFFB923C),
      tertiary: const Color(0xFF4ADE80),
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
  // ROBOTIC RED - Rojo robótico con acentos azul tecnológico
  // ==========================================================================

  /// Tema dinámico rojo robótico con precisión azul tecnológica
  ///
  /// Ideal para: Robótica, IoT, hardware tech, manufacturing 4.0
  /// Personalidad: Dinámico, preciso, industrial-tech, potente
  static final roboticRed = DSThemePreset(
    id: 'technology_robotic_red',
    displayName: 'Robotic Red',
    description: 'Rojo robótico dinámico con precisión azul para robótica e IoT',
    category: ThemeCategory.technology,
    industries: ['robotics', 'iot', 'hardware', 'manufacturing_4_0', 'industrial_tech'],
    keywords: ['dynamic', 'precise', 'industrial', 'powerful', 'robotic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFDC2626), // Rojo robótico
      secondary: const Color(0xFF2563EB), // Azul tecnológico
      tertiary: const Color(0xFFEF4444),
      surface: const Color(0xFFFEF2F2),
      onSurface: const Color(0xFF7F1D1D),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEF4444),
      secondary: const Color(0xFF3B82F6),
      tertiary: const Color(0xFFF87171),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0,
      typographyScale: 1.06,
      defaultBorderRadius: 8.0,
      isCompact: true,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // TECH GOLD - Dorado tech con acentos negro elegante
  // ==========================================================================

  /// Tema premium dorado tech con sofisticación negra
  ///
  /// Ideal para: Tech premium, enterprise solutions, B2B tech, consulting tech
  /// Personalidad: Premium, sofisticado, enterprise, valuable
  static final techGold = DSThemePreset(
    id: 'technology_tech_gold',
    displayName: 'Tech Gold',
    description: 'Dorado tech premium con sofisticación negra para enterprise',
    category: ThemeCategory.technology,
    industries: ['enterprise_tech', 'b2b_saas', 'premium_tech', 'consulting_tech', 'high_value'],
    keywords: ['premium', 'sophisticated', 'enterprise', 'valuable', 'elite'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD97706), // Dorado tech
      secondary: const Color(0xFF111827), // Negro sofisticado
      tertiary: const Color(0xFFF59E0B),
      surface: const Color(0xFFFEFCE8),
      onSurface: const Color(0xFF92400E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFBBF24),
      secondary: const Color(0xFF1F2937),
      tertiary: const Color(0xFFFDE047),
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
  // FUTURE BLACK - Negro futuro con acentos neón
  // ==========================================================================

  /// Tema futurista negro con acentos neón para máximo impacto
  ///
  /// Ideal para: Gaming, VR/AR, metaverso, tech avant-garde, startups disruptivas
  /// Personalidad: Futurista, disruptivo, avant-garde, impactante
  static final futureBlack = DSThemePreset(
    id: 'technology_future_black',
    displayName: 'Future Black',
    description: 'Negro futuro con acentos neón para startups disruptivas',
    category: ThemeCategory.technology,
    industries: ['gaming', 'vr_ar', 'metaverse', 'disruptive_tech', 'avant_garde'],
    keywords: ['futuristic', 'disruptive', 'avant_garde', 'impactful', 'dark_mode'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF111827), // Negro futuro
      secondary: const Color(0xFF06FFA5), // Verde neón
      tertiary: const Color(0xFF8B5CF6), // Púrpura neón
      surface: const Color(0xFFF9FAFB),
      onSurface: const Color(0xFF111827),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1F2937),
      secondary: const Color(0xFF10B981),
      tertiary: const Color(0xFFA855F7),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 6.0,
      typographyScale: 1.12,
      defaultBorderRadius: 20.0,
      isCompact: true,
      isExpressive: true,
    ),
    isAccessible: true,
  );
}