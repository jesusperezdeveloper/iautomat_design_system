import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas financieros seguros y prósperos
///
/// Temas diseñados para instituciones financieras, bancos, fintechs
/// y empresas del sector económico que requieren transmitir confianza,
/// seguridad y prosperidad.
///
/// Características:
/// - Colores que transmiten confianza y estabilidad
/// - Paletas que sugieren prosperidad y crecimiento
/// - Excelente contraste para accesibilidad
/// - Diseño profesional y serio
class FinancialThemeCollection {
  FinancialThemeCollection._();

  /// Listado completo de temas financieros
  static List<DSThemePreset> get themes => [
    bankingBlue,
    investmentGreen,
    fintechPurple,
    wealthGold,
    tradingBlack,
    insuranceGray,
    creditRed,
    savingsEmerald,
    mortgageBrown,
    cryptoOrange,
  ];

  // ==========================================================================
  // BANKING BLUE - Azul bancario con acentos dorados
  // ==========================================================================

  /// Tema bancario clásico con azul confiable y acentos dorados
  ///
  /// Ideal para: Bancos tradicionales, instituciones financieras, cooperativas de crédito
  /// Personalidad: Confianza, tradición, solidez financiera
  static final bankingBlue = DSThemePreset(
    id: 'financial_banking_blue',
    displayName: 'Banking Blue',
    description: 'Azul bancario tradicional con acentos dorados para máxima confianza',
    category: ThemeCategory.financial,
    industries: ['banking', 'financial_institutions', 'credit_unions', 'traditional_finance', 'wealth_management'],
    keywords: ['trustworthy', 'traditional', 'solid', 'reliable', 'established'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1E3A8A), // Azul bancario profundo
      secondary: const Color(0xFFD4AF37), // Oro clásico
      tertiary: const Color(0xFF3B82F6),
      surface: const Color(0xFFFAFBFF),
      onSurface: const Color(0xFF1E293B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B82F6),
      secondary: const Color(0xFFFBBF24),
      tertiary: const Color(0xFF60A5FA),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 0.95,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // INVESTMENT GREEN - Verde inversión con acentos azules
  // ==========================================================================

  /// Tema de inversión con verde crecimiento y acentos azul confianza
  ///
  /// Ideal para: Gestoras de fondos, asesores de inversión, plataformas de trading
  /// Personalidad: Crecimiento, rentabilidad, éxito financiero
  static final investmentGreen = DSThemePreset(
    id: 'financial_investment_green',
    displayName: 'Investment Green',
    description: 'Verde inversión próspero con acentos azul para crecimiento financiero',
    category: ThemeCategory.financial,
    industries: ['investment', 'asset_management', 'trading', 'financial_advisory', 'wealth_building'],
    keywords: ['growth', 'profitable', 'successful', 'prosperous', 'wealth'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF059669), // Verde inversión
      secondary: const Color(0xFF1E40AF), // Azul confianza
      tertiary: const Color(0xFF10B981),
      surface: const Color(0xFFF0FDF4),
      onSurface: const Color(0xFF064E3B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981),
      secondary: const Color(0xFF3B82F6),
      tertiary: const Color(0xFF34D399),
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
  // FINTECH PURPLE - Púrpura fintech con acentos plateados
  // ==========================================================================

  /// Tema fintech moderno con púrpura innovador y toques plateados
  ///
  /// Ideal para: Fintechs, bancos digitales, apps de pagos, neobancos
  /// Personalidad: Innovación, tecnología, modernidad financiera
  static final fintechPurple = DSThemePreset(
    id: 'financial_fintech_purple',
    displayName: 'Fintech Purple',
    description: 'Púrpura fintech innovador con acentos plateados tecnológicos',
    category: ThemeCategory.financial,
    industries: ['fintech', 'digital_banking', 'payment_apps', 'neobanking', 'financial_technology'],
    keywords: ['innovative', 'modern', 'technological', 'digital', 'disruptive'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C3AED), // Púrpura fintech
      secondary: const Color(0xFF94A3B8), // Plata tecnológica
      tertiary: const Color(0xFF8B5CF6),
      surface: const Color(0xFFFAF9FF),
      onSurface: const Color(0xFF3C1C6C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8B5CF6),
      secondary: const Color(0xFFE2E8F0),
      tertiary: const Color(0xFFA78BFA),
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
  // WEALTH GOLD - Dorado riqueza con acentos navy
  // ==========================================================================

  /// Tema de riqueza con dorado elegante y navy institucional
  ///
  /// Ideal para: Private banking, gestión patrimonial, family offices
  /// Personalidad: Riqueza, exclusividad, prestigio
  static final wealthGold = DSThemePreset(
    id: 'financial_wealth_gold',
    displayName: 'Wealth Gold',
    description: 'Dorado riqueza elegante con acentos navy para gestión patrimonial',
    category: ThemeCategory.financial,
    industries: ['private_banking', 'wealth_management', 'family_office', 'luxury_finance', 'high_net_worth'],
    keywords: ['wealthy', 'exclusive', 'prestigious', 'luxurious', 'elite'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD97706), // Dorado riqueza
      secondary: const Color(0xFF1E3A8A), // Navy institucional
      tertiary: const Color(0xFFF59E0B),
      surface: const Color(0xFFFFFDF7),
      onSurface: const Color(0xFF92400E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFBBF24),
      secondary: const Color(0xFF3B82F6),
      tertiary: const Color(0xFFFCD34D),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 12.0,
      typographyScale: 1.05,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // TRADING BLACK - Negro trading con acentos verdes
  // ==========================================================================

  /// Tema trading profesional con negro elegante y verdes de ganancia
  ///
  /// Ideal para: Plataformas de trading, brokers, análisis técnico
  /// Personalidad: Profesionalismo, precisión, foco en resultados
  static final tradingBlack = DSThemePreset(
    id: 'financial_trading_black',
    displayName: 'Trading Black',
    description: 'Negro trading profesional con acentos verdes de rendimiento',
    category: ThemeCategory.financial,
    industries: ['trading', 'brokerage', 'technical_analysis', 'forex', 'crypto_trading'],
    keywords: ['professional', 'precise', 'focused', 'performance', 'serious'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1F2937), // Negro trading
      secondary: const Color(0xFF10B981), // Verde ganancia
      tertiary: const Color(0xFF374151),
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF111827),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF374151),
      secondary: const Color(0xFF34D399),
      tertiary: const Color(0xFF4B5563),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 0.98,
      defaultBorderRadius: 6.0,
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // INSURANCE GRAY - Gris seguros con acentos azules
  // ==========================================================================

  /// Tema de seguros con gris confiable y azules protectores
  ///
  /// Ideal para: Compañías de seguros, aseguradoras, corredurías
  /// Personalidad: Protección, estabilidad, confiabilidad
  static final insuranceGray = DSThemePreset(
    id: 'financial_insurance_gray',
    displayName: 'Insurance Gray',
    description: 'Gris seguros estable con acentos azul protección',
    category: ThemeCategory.financial,
    industries: ['insurance', 'assurance', 'risk_management', 'actuarial', 'protection'],
    keywords: ['protective', 'stable', 'reliable', 'secure', 'trustworthy'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6B7280), // Gris seguros
      secondary: const Color(0xFF2563EB), // Azul protección
      tertiary: const Color(0xFF9CA3AF),
      surface: const Color(0xFFF9FAFB),
      onSurface: const Color(0xFF374151),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9CA3AF),
      secondary: const Color(0xFF60A5FA),
      tertiary: const Color(0xFFD1D5DB),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 0.96,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CREDIT RED - Rojo crédito con acentos dorados
  // ==========================================================================

  /// Tema de crédito con rojo energético y dorado de valor
  ///
  /// Ideal para: Empresas de crédito, financieras, prestamistas
  /// Personalidad: Energía financiera, oportunidad, valor
  static final creditRed = DSThemePreset(
    id: 'financial_credit_red',
    displayName: 'Credit Red',
    description: 'Rojo crédito energético con acentos dorados de oportunidad',
    category: ThemeCategory.financial,
    industries: ['credit', 'lending', 'microfinance', 'consumer_finance', 'credit_cards'],
    keywords: ['energetic', 'opportunity', 'dynamic', 'accessible', 'empowering'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFDC2626), // Rojo crédito
      secondary: const Color(0xFFD4AF37), // Oro oportunidad
      tertiary: const Color(0xFFEF4444),
      surface: const Color(0xFFFEF2F2),
      onSurface: const Color(0xFF7F1D1D),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEF4444),
      secondary: const Color(0xFFFBBF24),
      tertiary: const Color(0xFFF87171),
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
  // SAVINGS EMERALD - Esmeralda ahorros con acentos plateados
  // ==========================================================================

  /// Tema de ahorros con esmeralda próspero y plata elegante
  ///
  /// Ideal para: Bancos de ahorro, cajas de ahorro, planes de pensiones
  /// Personalidad: Prosperidad, futuro, seguridad financiera
  static final savingsEmerald = DSThemePreset(
    id: 'financial_savings_emerald',
    displayName: 'Savings Emerald',
    description: 'Esmeralda ahorros próspero con acentos plateados de seguridad',
    category: ThemeCategory.financial,
    industries: ['savings', 'pension_funds', 'retirement_planning', 'long_term_savings', 'financial_security'],
    keywords: ['prosperous', 'secure', 'future_focused', 'stable', 'growing'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF047857), // Esmeralda ahorros
      secondary: const Color(0xFF94A3B8), // Plata seguridad
      tertiary: const Color(0xFF059669),
      surface: const Color(0xFFF0FDF6),
      onSurface: const Color(0xFF064E3B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981),
      secondary: const Color(0xFFE2E8F0),
      tertiary: const Color(0xFF34D399),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 9.0,
      typographyScale: 0.98,
      defaultBorderRadius: 14.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // MORTGAGE BROWN - Marrón hipoteca con acentos azules
  // ==========================================================================

  /// Tema hipotecario con marrón cálido y azules de hogar
  ///
  /// Ideal para: Empresas hipotecarias, inmobiliarias financieras, créditos vivienda
  /// Personalidad: Calidez del hogar, estabilidad, inversión inmobiliaria
  static final mortgageBrown = DSThemePreset(
    id: 'financial_mortgage_brown',
    displayName: 'Mortgage Brown',
    description: 'Marrón hipoteca cálido con acentos azul hogar',
    category: ThemeCategory.financial,
    industries: ['mortgage', 'real_estate_finance', 'housing_credit', 'property_investment', 'home_loans'],
    keywords: ['warm', 'homely', 'stable', 'investment', 'family_oriented'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF92400E), // Marrón hipoteca
      secondary: const Color(0xFF2563EB), // Azul hogar
      tertiary: const Color(0xFFD97706),
      surface: const Color(0xFFFFFBEB),
      onSurface: const Color(0xFF451A03),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD97706),
      secondary: const Color(0xFF60A5FA),
      tertiary: const Color(0xFFF59E0B),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 10.0,
      typographyScale: 0.97,
      defaultBorderRadius: 10.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CRYPTO ORANGE - Naranja cripto con acentos púrpuras
  // ==========================================================================

  /// Tema crypto con naranja energético y púrpura innovador
  ///
  /// Ideal para: Exchanges de criptomonedas, wallets digitales, DeFi
  /// Personalidad: Innovación, energía digital, futuro financiero
  static final cryptoOrange = DSThemePreset(
    id: 'financial_crypto_orange',
    displayName: 'Crypto Orange',
    description: 'Naranja cripto energético con acentos púrpura innovación',
    category: ThemeCategory.financial,
    industries: ['cryptocurrency', 'blockchain', 'defi', 'digital_wallets', 'crypto_exchange'],
    keywords: ['innovative', 'digital', 'energetic', 'futuristic', 'revolutionary'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEA580C), // Naranja cripto
      secondary: const Color(0xFF7C3AED), // Púrpura innovación
      tertiary: const Color(0xFFF97316),
      surface: const Color(0xFFFFF7ED),
      onSurface: const Color(0xFF9A3412),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF97316),
      secondary: const Color(0xFF8B5CF6),
      tertiary: const Color(0xFFFB923C),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.03,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );
}