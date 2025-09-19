import 'package:flutter/material.dart';
import '../theme_preset_model.dart';

/// Colección de 10 temas industriales robustos y funcionales
///
/// Temas diseñados para empresas manufactureras, logística, construcción
/// y otros sectores industriales que requieren solidez y funcionalidad.
///
/// Características:
/// - Colores robustos y funcionales
/// - Tipografía clara y legible
/// - Espaciado práctico para interfaces operativas
/// - Combinaciones confiables y profesionales
class IndustrialThemeCollection {
  IndustrialThemeCollection._();

  /// Listado completo de temas industriales
  static List<DSThemePreset> get themes => [
    manufacturingSteel,
    logisticsBlue,
    constructionOrange,
    factoryGreen,
    miningBrown,
    energyRed,
    chemicalPurple,
    machineryGray,
    supplychainTeal,
    heavydutyBlack,
  ];

  // ==========================================================================
  // MANUFACTURING STEEL - Acero manufactura con acentos naranja
  // ==========================================================================

  /// Tema robusto acero manufactura con acentos naranja industriales
  ///
  /// Ideal para: Plantas manufactureras, industria metalúrgica, fabricación
  /// Personalidad: Robusto, industrial, confiable, funcional
  static final manufacturingSteel = DSThemePreset(
    id: 'industrial_manufacturing_steel',
    displayName: 'Manufacturing Steel',
    description: 'Acero manufactura robusto con acentos naranja para industria',
    category: ThemeCategory.industrial,
    industries: ['manufacturing', 'metallurgy', 'fabrication', 'steel_industry', 'heavy_industry'],
    keywords: ['robust', 'industrial', 'reliable', 'functional', 'steel'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF607D8B), // Acero manufactura
      secondary: const Color(0xFFFF9800), // Naranja industrial
      tertiary: const Color(0xFF78909C),
      surface: const Color(0xFFF8F9FA),
      onSurface: const Color(0xFF263238),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF90A4AE),
      secondary: const Color(0xFFFFB74D),
      tertiary: const Color(0xFFB0BEC5),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0, // Funcional
      defaultBorderRadius: 8.0, // Mínimo industrial
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // LOGISTICS BLUE - Azul logística con acentos amarillo
  // ==========================================================================

  /// Tema confiable azul logística con señalización amarilla
  ///
  /// Ideal para: Empresas de logística, transporte, distribución, almacenes
  /// Personalidad: Confiable, eficiente, organizado, sistemático
  static final logisticsBlue = DSThemePreset(
    id: 'industrial_logistics_blue',
    displayName: 'Logistics Blue',
    description: 'Azul logística confiable con señalización amarilla para transporte',
    category: ThemeCategory.industrial,
    industries: ['logistics', 'transportation', 'distribution', 'warehousing', 'supply_chain'],
    keywords: ['reliable', 'efficient', 'organized', 'systematic', 'transport'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1976D2), // Azul logística
      secondary: const Color(0xFFFFEB3B), // Amarillo señalización
      tertiary: const Color(0xFF42A5F5),
      surface: const Color(0xFFF3F7FF),
      onSurface: const Color(0xFF0D47A1),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF42A5F5),
      secondary: const Color(0xFFFFF176),
      tertiary: const Color(0xFF64B5F6),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 6.0, // Muy funcional
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CONSTRUCTION ORANGE - Naranja construcción con acentos gris
  // ==========================================================================

  /// Tema energético naranja construcción con solidez gris
  ///
  /// Ideal para: Empresas constructoras, ingeniería civil, arquitectura industrial
  /// Personalidad: Energético, sólido, visible, seguro
  static final constructionOrange = DSThemePreset(
    id: 'industrial_construction_orange',
    displayName: 'Construction Orange',
    description: 'Naranja construcción energético con solidez gris para obra',
    category: ThemeCategory.industrial,
    industries: ['construction', 'civil_engineering', 'industrial_architecture', 'building', 'infrastructure'],
    keywords: ['energetic', 'solid', 'visible', 'safe', 'construction'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF9800), // Naranja construcción
      secondary: const Color(0xFF616161), // Gris sólido
      tertiary: const Color(0xFFFFB74D),
      surface: const Color(0xFFFFF8F0),
      onSurface: const Color(0xFF3E2723),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFB74D),
      secondary: const Color(0xFF9E9E9E),
      tertiary: const Color(0xFFFFCC02),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.02, // Ligeramente más visible
      defaultBorderRadius: 4.0, // Muy angular
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // FACTORY GREEN - Verde fábrica con acentos azul
  // ==========================================================================

  /// Tema productivo verde fábrica con eficiencia azul
  ///
  /// Ideal para: Plantas de producción, industria alimentaria, manufactura verde
  /// Personalidad: Productivo, eficiente, sostenible, operativo
  static final factoryGreen = DSThemePreset(
    id: 'industrial_factory_green',
    displayName: 'Factory Green',
    description: 'Verde fábrica productivo con eficiencia azul para producción',
    category: ThemeCategory.industrial,
    industries: ['production_plant', 'food_industry', 'green_manufacturing', 'factory', 'processing'],
    keywords: ['productive', 'efficient', 'sustainable', 'operative', 'green'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4CAF50), // Verde fábrica
      secondary: const Color(0xFF2196F3), // Azul eficiencia
      tertiary: const Color(0xFF66BB6A),
      surface: const Color(0xFFF1F8E9),
      onSurface: const Color(0xFF1B5E20),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF66BB6A),
      secondary: const Color(0xFF42A5F5),
      tertiary: const Color(0xFF81C784),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 6.0,
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // MINING BROWN - Marrón minería con acentos dorado
  // ==========================================================================

  /// Tema resistente marrón minería con riqueza dorada
  ///
  /// Ideal para: Industria minera, extracción, geología, recursos naturales
  /// Personalidad: Resistente, terrenal, valioso, duradero
  static final miningBrown = DSThemePreset(
    id: 'industrial_mining_brown',
    displayName: 'Mining Brown',
    description: 'Marrón minería resistente con riqueza dorada para extracción',
    category: ThemeCategory.industrial,
    industries: ['mining', 'extraction', 'geology', 'natural_resources', 'minerals'],
    keywords: ['resistant', 'earthy', 'valuable', 'durable', 'mining'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8D6E63), // Marrón minería
      secondary: const Color(0xFFFFD700), // Dorado riqueza
      tertiary: const Color(0xFFA1887F),
      surface: const Color(0xFFFBF7F4),
      onSurface: const Color(0xFF3E2723),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFA1887F),
      secondary: const Color(0xFFFFC107),
      tertiary: const Color(0xFFBCAAA4),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 4.0, // Muy angular
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // ENERGY RED - Rojo energía con acentos blanco
  // ==========================================================================

  /// Tema potente rojo energía con pureza blanca
  ///
  /// Ideal para: Sector energético, petróleo y gas, energías renovables
  /// Personalidad: Potente, dinámico, vital, energético
  static final energyRed = DSThemePreset(
    id: 'industrial_energy_red',
    displayName: 'Energy Red',
    description: 'Rojo energía potente con pureza blanca para sector energético',
    category: ThemeCategory.industrial,
    industries: ['energy_sector', 'oil_gas', 'renewable_energy', 'power_generation', 'utilities'],
    keywords: ['powerful', 'dynamic', 'vital', 'energetic', 'energy'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD32F2F), // Rojo energía
      secondary: const Color(0xFFFFFFFF), // Blanco pureza
      tertiary: const Color(0xFFEF5350),
      surface: const Color(0xFFFFF5F5),
      onSurface: const Color(0xFFB71C1C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFEF5350),
      secondary: const Color(0xFFE0E0E0),
      tertiary: const Color(0xFFE57373),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 6.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // CHEMICAL PURPLE - Púrpura química con acentos plata
  // ==========================================================================

  /// Tema especializado púrpura química con precisión plata
  ///
  /// Ideal para: Industria química, farmacéutica, laboratorios, investigación
  /// Personalidad: Especializado, preciso, científico, técnico
  static final chemicalPurple = DSThemePreset(
    id: 'industrial_chemical_purple',
    displayName: 'Chemical Purple',
    description: 'Púrpura química especializado con precisión plata para laboratorios',
    category: ThemeCategory.industrial,
    industries: ['chemical_industry', 'pharmaceutical', 'laboratories', 'research', 'biotech'],
    keywords: ['specialized', 'precise', 'scientific', 'technical', 'chemical'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7B1FA2), // Púrpura química
      secondary: const Color(0xFF9E9E9E), // Plata precisión
      tertiary: const Color(0xFF8E24AA),
      surface: const Color(0xFFF8F5FF),
      onSurface: const Color(0xFF4A148C),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8E24AA),
      secondary: const Color(0xFFBDBDBD),
      tertiary: const Color(0xFFAB47BC),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 8.0,
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // MACHINERY GRAY - Gris maquinaria con acentos verde
  // ==========================================================================

  /// Tema técnico gris maquinaria con eficiencia verde
  ///
  /// Ideal para: Fabricantes de maquinaria, equipos industriales, ingeniería mecánica
  /// Personalidad: Técnico, eficiente, mecánico, preciso
  static final machineryGray = DSThemePreset(
    id: 'industrial_machinery_gray',
    displayName: 'Machinery Gray',
    description: 'Gris maquinaria técnico con eficiencia verde para equipos',
    category: ThemeCategory.industrial,
    industries: ['machinery_manufacturing', 'industrial_equipment', 'mechanical_engineering', 'automation', 'tools'],
    keywords: ['technical', 'efficient', 'mechanical', 'precise', 'machinery'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF546E7A), // Gris maquinaria
      secondary: const Color(0xFF4CAF50), // Verde eficiencia
      tertiary: const Color(0xFF607D8B),
      surface: const Color(0xFFF6F8FA),
      onSurface: const Color(0xFF263238),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF607D8B),
      secondary: const Color(0xFF66BB6A),
      tertiary: const Color(0xFF78909C),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 4.0, // Muy funcional
      isCompact: true,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // SUPPLYCHAIN TEAL - Teal cadena suministro con acentos naranja
  // ==========================================================================

  /// Tema fluido teal cadena suministro con dinamismo naranja
  ///
  /// Ideal para: Gestión de cadena de suministro, procurement, distribución
  /// Personalidad: Fluido, conectado, dinámico, coordinado
  static final supplychainTeal = DSThemePreset(
    id: 'industrial_supplychain_teal',
    displayName: 'Supplychain Teal',
    description: 'Teal cadena suministro fluido con dinamismo naranja para gestión',
    category: ThemeCategory.industrial,
    industries: ['supply_chain', 'procurement', 'distribution', 'vendor_management', 'operations'],
    keywords: ['fluid', 'connected', 'dynamic', 'coordinated', 'supply_chain'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00897B), // Teal cadena suministro
      secondary: const Color(0xFFFF9800), // Naranja dinamismo
      tertiary: const Color(0xFF26A69A),
      surface: const Color(0xFFF0FDF4),
      onSurface: const Color(0xFF004D40),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF26A69A),
      secondary: const Color(0xFFFFB74D),
      tertiary: const Color(0xFF4DB6AC),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.0,
      defaultBorderRadius: 6.0,
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );

  // ==========================================================================
  // HEAVYDUTY BLACK - Negro trabajo pesado con acentos amarillo
  // ==========================================================================

  /// Tema resistente negro trabajo pesado con visibilidad amarilla
  ///
  /// Ideal para: Trabajo pesado, equipos industriales, maquinaria pesada
  /// Personalidad: Resistente, fuerte, visible, robusto
  static final heavydutyBlack = DSThemePreset(
    id: 'industrial_heavyduty_black',
    displayName: 'Heavyduty Black',
    description: 'Negro trabajo pesado resistente con visibilidad amarilla para equipos',
    category: ThemeCategory.industrial,
    industries: ['heavy_duty', 'industrial_equipment', 'heavy_machinery', 'construction_equipment', 'mining_equipment'],
    keywords: ['resistant', 'strong', 'visible', 'robust', 'heavy_duty'],
    lightColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF212121), // Negro trabajo pesado
      secondary: const Color(0xFFFFEB3B), // Amarillo visibilidad
      tertiary: const Color(0xFF424242),
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF212121),
    ),
    darkColorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF424242),
      secondary: const Color(0xFFFFF176),
      tertiary: const Color(0xFF616161),
      brightness: Brightness.dark,
    ),
    tokens: const DSThemeTokens(
      baseSpacing: 8.0,
      typographyScale: 1.02, // Ligeramente más visible
      defaultBorderRadius: 4.0, // Muy angular
      isCompact: false,
      isExpressive: false,
    ),
    isAccessible: true,
  );
}