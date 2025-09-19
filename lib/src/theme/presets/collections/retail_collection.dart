import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas retail atractivos para ventas
///
/// Temas diseñados para tiendas en línea, marketplaces, aplicaciones
/// de compras y plataformas de e-commerce que requieren generar
/// confianza en la compra y motivar las conversiones.
///
/// Características:
/// - Colores atractivos que impulsan la compra
/// - Paletas que generan confianza y urgencia
/// - Excelente usabilidad para conversión
/// - Diseño orientado a la experiencia de compra
class RetailThemeCollection {
  RetailThemeCollection._();

  /// Listado completo de temas retail
  static List<DSThemePreset> get themes => [
    ecommerceBlue,
    shopPink,
    marketplaceGreen,
    brandRed,
    retailTeal,
    fashionPurple,
    saleOrange,
    luxuryBlack,
    trendsYellow,
    customerMint,
  ];

  // ==========================================================================
  // ECOMMERCE BLUE - Azul e-commerce con acentos naranjas
  // ==========================================================================

  /// Tema e-commerce clásico con azul confiable y naranjas de acción
  ///
  /// Ideal para: Tiendas online generalistas, marketplaces principales, plataformas B2C
  /// Personalidad: Confianza comercial, llamadas a la acción efectivas
  static final ecommerceBlue = DSThemePreset(
    id: 'retail_ecommerce_blue',
    displayName: 'E-commerce Blue',
    description: 'Azul e-commerce confiable con acentos naranja llamada a la acción',
    category: ThemeCategory.retail,
    industries: ['ecommerce', 'online_retail', 'marketplace', 'b2c_platforms', 'digital_commerce'],
    keywords: ['trustworthy', 'actionable', 'commercial', 'reliable', 'converting'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2563EB), // Azul e-commerce
      secondary: const Color(0xFFEA580C), // Naranja acción
      tertiary: const Color(0xFF3B82F6),
      surface: const Color(0xFFFAFBFF),
      onSurface: const Color(0xFF1E293B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B82F6),
      secondary: const Color(0xFFF97316),
      tertiary: const Color(0xFF60A5FA),
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
  // SHOP PINK - Rosa tienda con acentos verdes
  // ==========================================================================

  /// Tema tienda con rosa atractivo y verdes de éxito comercial
  ///
  /// Ideal para: Moda femenina, cosméticos, lifestyle, productos de belleza
  /// Personalidad: Atractivo visual, éxito de ventas, lifestyle aspiracional
  static final shopPink = DSThemePreset(
    id: 'retail_shop_pink',
    displayName: 'Shop Pink',
    description: 'Rosa tienda atractivo con acentos verde éxito comercial',
    category: ThemeCategory.retail,
    industries: ['fashion', 'beauty', 'cosmetics', 'lifestyle', 'womens_retail'],
    keywords: ['attractive', 'successful', 'aspirational', 'trendy', 'appealing'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEC4899), // Rosa tienda
      secondary: const Color(0xFF059669), // Verde éxito
      tertiary: const Color(0xFFF472B6),
      surface: const Color(0xFFFDF2F8),
      onSurface: const Color(0xFF831843),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF472B6),
      secondary: const Color(0xFF10B981),
      tertiary: const Color(0xFFF9A8D4),
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
  // MARKETPLACE GREEN - Verde marketplace con acentos púrpuras
  // ==========================================================================

  /// Tema marketplace con verde crecimiento y púrpura premium
  ///
  /// Ideal para: Marketplaces multi-vendor, plataformas B2B, comercio colaborativo
  /// Personalidad: Crecimiento comercial, calidad premium, ecosistema próspero
  static final marketplaceGreen = DSThemePreset(
    id: 'retail_marketplace_green',
    displayName: 'Marketplace Green',
    description: 'Verde marketplace próspero con acentos púrpura premium',
    category: ThemeCategory.retail,
    industries: ['marketplace', 'multi_vendor', 'b2b_commerce', 'collaborative_commerce', 'vendor_platforms'],
    keywords: ['growing', 'premium', 'prosperous', 'collaborative', 'scalable'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF059669), // Verde marketplace
      secondary: const Color(0xFF7C3AED), // Púrpura premium
      tertiary: const Color(0xFF10B981),
      surface: const Color(0xFFF0FDF4),
      onSurface: const Color(0xFF064E3B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981),
      secondary: const Color(0xFF8B5CF6),
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
  // BRAND RED - Rojo marca con acentos dorados
  // ==========================================================================

  /// Tema de marca con rojo impactante y dorado de valor
  ///
  /// Ideal para: Marcas establecidas, productos de consumo, retail tradicional
  /// Personalidad: Impacto de marca, valor percibido, presencia comercial
  static final brandRed = DSThemePreset(
    id: 'retail_brand_red',
    displayName: 'Brand Red',
    description: 'Rojo marca impactante con acentos dorado valor premium',
    category: ThemeCategory.retail,
    industries: ['established_brands', 'consumer_goods', 'traditional_retail', 'brand_commerce', 'flagship_stores'],
    keywords: ['impactful', 'valuable', 'established', 'premium', 'recognizable'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFDC2626), // Rojo marca
      secondary: const Color(0xFFD4AF37), // Dorado valor
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
      baseSpacing: 10.0,
      typographyScale: 1.03,
      defaultBorderRadius: 8.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // RETAIL TEAL - Teal retail con acentos coral
  // ==========================================================================

  /// Tema retail con teal equilibrado y coral de vitalidad comercial
  ///
  /// Ideal para: Tiendas departamentales, retail moderno, experiencias omnicanal
  /// Personalidad: Equilibrio comercial, vitalidad de marca, modernidad retail
  static final retailTeal = DSThemePreset(
    id: 'retail_teal',
    displayName: 'Retail Teal',
    description: 'Teal retail equilibrado con acentos coral vitalidad comercial',
    category: ThemeCategory.retail,
    industries: ['department_stores', 'modern_retail', 'omnichannel', 'retail_experience', 'store_chains'],
    keywords: ['balanced', 'vital', 'modern', 'experiential', 'dynamic'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F766E), // Teal retail
      secondary: const Color(0xFFF97316), // Coral vitalidad
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
      typographyScale: 1.0,
      defaultBorderRadius: 12.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // FASHION PURPLE - Púrpura moda con acentos plateados
  // ==========================================================================

  /// Tema moda con púrpura sofisticado y plata de elegancia
  ///
  /// Ideal para: Moda de lujo, boutiques, diseñadores, alta costura
  /// Personalidad: Sofisticación fashion, elegancia, exclusividad de moda
  static final fashionPurple = DSThemePreset(
    id: 'retail_fashion_purple',
    displayName: 'Fashion Purple',
    description: 'Púrpura moda sofisticado con acentos plata elegancia',
    category: ThemeCategory.retail,
    industries: ['luxury_fashion', 'boutiques', 'designer_brands', 'haute_couture', 'fashion_retail'],
    keywords: ['sophisticated', 'elegant', 'exclusive', 'fashionable', 'luxurious'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C3AED), // Púrpura moda
      secondary: const Color(0xFF94A3B8), // Plata elegancia
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
      baseSpacing: 12.0,
      typographyScale: 1.05,
      defaultBorderRadius: 16.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SALE ORANGE - Naranja venta con acentos azules
  // ==========================================================================

  /// Tema de ventas con naranja urgente y azul de confianza comercial
  ///
  /// Ideal para: Promociones, ofertas especiales, liquidaciones, rebajas
  /// Personalidad: Urgencia de compra, oportunidad comercial, confianza en ofertas
  static final saleOrange = DSThemePreset(
    id: 'retail_sale_orange',
    displayName: 'Sale Orange',
    description: 'Naranja venta urgente con acentos azul confianza comercial',
    category: ThemeCategory.retail,
    industries: ['sales_promotions', 'special_offers', 'clearance', 'discount_retail', 'promotional_campaigns'],
    keywords: ['urgent', 'opportunistic', 'promotional', 'energetic', 'converting'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEA580C), // Naranja venta
      secondary: const Color(0xFF2563EB), // Azul confianza
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
      typographyScale: 1.02,
      defaultBorderRadius: 14.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // LUXURY BLACK - Negro lujo con acentos dorados
  // ==========================================================================

  /// Tema lujo con negro sofisticado y dorado exclusivo
  ///
  /// Ideal para: Marcas de lujo, productos premium, experiencias exclusivas
  /// Personalidad: Lujo absoluto, exclusividad, sofisticación premium
  static final luxuryBlack = DSThemePreset(
    id: 'retail_luxury_black',
    displayName: 'Luxury Black',
    description: 'Negro lujo sofisticado con acentos dorado exclusividad',
    category: ThemeCategory.retail,
    industries: ['luxury_brands', 'premium_products', 'exclusive_retail', 'high_end_fashion', 'luxury_goods'],
    keywords: ['luxurious', 'exclusive', 'sophisticated', 'premium', 'elite'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1F2937), // Negro lujo
      secondary: const Color(0xFFD4AF37), // Dorado exclusivo
      tertiary: const Color(0xFF374151),
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF111827),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF374151),
      secondary: const Color(0xFFFBBF24),
      tertiary: const Color(0xFF4B5563),
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
  // TRENDS YELLOW - Amarillo tendencias con acentos rosas
  // ==========================================================================

  /// Tema tendencias con amarillo vibrante y rosa de novedad
  ///
  /// Ideal para: Fast fashion, productos trendy, novedades, generación Z
  /// Personalidad: Tendencias actuales, novedad, vibración juvenil
  static final trendsYellow = DSThemePreset(
    id: 'retail_trends_yellow',
    displayName: 'Trends Yellow',
    description: 'Amarillo tendencias vibrante con acentos rosa novedad',
    category: ThemeCategory.retail,
    industries: ['fast_fashion', 'trendy_products', 'youth_retail', 'novelty_items', 'gen_z_brands'],
    keywords: ['trendy', 'novel', 'vibrant', 'youthful', 'contemporary'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF59E0B), // Amarillo tendencias
      secondary: const Color(0xFFEC4899), // Rosa novedad
      tertiary: const Color(0xFFFCD34D),
      surface: const Color(0xFFFFFBEB),
      onSurface: const Color(0xFF92400E),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFCD34D),
      secondary: const Color(0xFFF472B6),
      tertiary: const Color(0xFFFDE047),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.03,
      defaultBorderRadius: 20.0,
      isCompact: false,
      isExpressive: true,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CUSTOMER MINT - Menta cliente con acentos navy
  // ==========================================================================

  /// Tema cliente con menta fresco y navy de confianza customer-centric
  ///
  /// Ideal para: Experiencia del cliente, servicios retail, atención personalizada
  /// Personalidad: Frescura en el servicio, confianza del cliente, atención personalizada
  static final customerMint = DSThemePreset(
    id: 'retail_customer_mint',
    displayName: 'Customer Mint',
    description: 'Menta cliente fresco con acentos navy confianza customer-centric',
    category: ThemeCategory.retail,
    industries: ['customer_experience', 'retail_services', 'personalized_shopping', 'customer_support', 'service_retail'],
    keywords: ['fresh', 'customer_focused', 'personalized', 'caring', 'service_oriented'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF10B981), // Menta cliente
      secondary: const Color(0xFF1E3A8A), // Navy confianza
      tertiary: const Color(0xFF34D399),
      surface: const Color(0xFFF0FDF8),
      onSurface: const Color(0xFF064E3B),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF34D399),
      secondary: const Color(0xFF3B82F6),
      tertiary: const Color(0xFF6EE7B7),
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
}