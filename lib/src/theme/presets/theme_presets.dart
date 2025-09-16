import 'package:flutter/material.dart';
import 'theme_preset.dart';

/// Colección de 20 temas predefinidos profesionales para 2025
///
/// Basados en las últimas tendencias de UI/UX y optimizados para
/// aplicaciones empresariales de movilidad y automatización.
class ThemePresets {
  ThemePresets._();

  // ==========================================================================
  // 🏢 TEMAS CORPORATIVOS (4)
  // ==========================================================================

  /// Corporate Blue - Tema azul corporativo clásico
  /// Inspira confianza, profesionalismo y estabilidad
  static const corporateBlue = ThemePreset(
    id: 'corporate_blue',
    name: 'corporateBlue',
    displayName: 'Corporate Blue',
    description: 'Azul corporativo que inspira confianza y profesionalismo. Ideal para aplicaciones empresariales.',
    category: ThemeCategory.corporate,
    lightColors: ThemeColors(
      primary: Color(0xFF1565C0),      // Azul corporativo profundo
      primaryLight: Color(0xFF5E92F3), // Azul más claro
      primaryDark: Color(0xFF003C8F),  // Azul oscuro
      secondary: Color(0xFF424242),    // Gris neutral
      secondaryLight: Color(0xFF6D6D6D),
      secondaryDark: Color(0xFF1B1B1B),
      tertiary: Color(0xFF00695C),     // Verde azulado
      tertiaryLight: Color(0xFF439A86),
      tertiaryDark: Color(0xFF003D33),
      error: Color(0xFFD32F2F),
      errorLight: Color(0xFFFF6659),
      errorDark: Color(0xFF9A0007),
      warning: Color(0xFFF57C00),
      warningLight: Color(0xFFFFAD42),
      warningDark: Color(0xFFBB4D00),
      success: Color(0xFF388E3C),
      successLight: Color(0xFF6ABF69),
      successDark: Color(0xFF00600F),
      info: Color(0xFF0288D1),
      infoLight: Color(0xFF5EB8FF),
      infoDark: Color(0xFF005B9F),
      background: Color(0xFFFAFAFA),
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF5F5F5),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1A1A1A),
      outline: Color(0xFFE0E0E0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF64B5F6),      // Azul más claro para dark
      primaryLight: Color(0xFF9BE7FF),
      primaryDark: Color(0xFF2286C3),
      secondary: Color(0xFF90A4AE),    // Gris azulado
      secondaryLight: Color(0xFFC1D5E0),
      secondaryDark: Color(0xFF62757F),
      tertiary: Color(0xFF4DB6AC),     // Verde azulado claro
      tertiaryLight: Color(0xFF82E9DE),
      tertiaryDark: Color(0xFF00867D),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFB71C1C),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFE97D),
      warningDark: Color(0xFFF57C00),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF98EE99),
      successDark: Color(0xFF338A3E),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF0077C2),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      surfaceVariant: Color(0xFF2A2A2A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFE5E5E5),
      outline: Color(0xFF404040),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.outlined,
      borderRadius: BorderRadiusLevel.medium,
      elevation: ElevationLevel.subtle,
      hasGradients: false,
    ),
    useCases: [
      'Aplicaciones empresariales',
      'Plataformas B2B',
      'Software corporativo',
      'Herramientas de productividad',
      'Sistemas de gestión',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['mobile', 'tablet', 'desktop'],
      targetAudience: ['enterprise', 'b2b', 'corporate'],
      inspiration: 'Corporativos tradicionales + Material Design 3',
      trendTags: ['professional', 'accessible', 'material3'],
    ),
  );

  /// Executive Dark - Tema premium oscuro elegante
  /// Para ejecutivos y aplicaciones de alta gama
  static const executiveDark = ThemePreset(
    id: 'executive_dark',
    name: 'executiveDark',
    displayName: 'Executive Dark',
    description: 'Tema premium oscuro con toques dorados. Elegante y sofisticado para ejecutivos.',
    category: ThemeCategory.corporate,
    lightColors: ThemeColors(
      primary: Color(0xFF2C2C2C),      // Gris carbón
      primaryLight: Color(0xFF525252),
      primaryDark: Color(0xFF000000),
      secondary: Color(0xFFD4AF37),    // Dorado elegante
      secondaryLight: Color(0xFFFFE082),
      secondaryDark: Color(0xFFA47F1B),
      tertiary: Color(0xFF6A4C93),     // Púrpura premium
      tertiaryLight: Color(0xFF9A7BB1),
      tertiaryDark: Color(0xFF3E2765),
      error: Color(0xFFBF3F3F),
      errorLight: Color(0xFFE57373),
      errorDark: Color(0xFF8F2929),
      warning: Color(0xFFE67E22),
      warningLight: Color(0xFFFFB74D),
      warningDark: Color(0xFFBF6415),
      success: Color(0xFF27AE60),
      successLight: Color(0xFF4CAF50),
      successDark: Color(0xFF1E8449),
      info: Color(0xFF3498DB),
      infoLight: Color(0xFF64B5F6),
      infoDark: Color(0xFF2471A3),
      background: Color(0xFFF8F8F8),
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF0F0F0),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF1A1A1A),
      outline: Color(0xFFDDDDDD),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF1A1A1A),      // Negro profundo
      primaryLight: Color(0xFF2C2C2C),
      primaryDark: Color(0xFF000000),
      secondary: Color(0xFFFFD700),    // Dorado brillante
      secondaryLight: Color(0xFFFFE54C),
      secondaryDark: Color(0xFFB8860B),
      tertiary: Color(0xFF9B59B6),     // Púrpura vibrante
      tertiaryLight: Color(0xFFAB6AC7),
      tertiaryDark: Color(0xFF7D3C98),
      error: Color(0xFFE74C3C),
      errorLight: Color(0xFFFF5722),
      errorDark: Color(0xFFC0392B),
      warning: Color(0xFFF39C12),
      warningLight: Color(0xFFFFB347),
      warningDark: Color(0xFFD68910),
      success: Color(0xFF2ECC71),
      successLight: Color(0xFF58D68D),
      successDark: Color(0xFF239B56),
      info: Color(0xFF5DADE2),
      infoLight: Color(0xFF85C1E9),
      infoDark: Color(0xFF3498DB),
      background: Color(0xFF0A0A0A),   // Negro OLED
      surface: Color(0xFF1A1A1A),
      surfaceVariant: Color(0xFF2A2A2A),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFEEEEEE),
      outline: Color(0xFF404040),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.medium,
      hasGradients: true,
      supportsNeumorphism: true,
    ),
    useCases: [
      'Apps ejecutivas',
      'Plataformas premium',
      'Fintech de alta gama',
      'Consulting firms',
      'C-Level dashboards',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: false,
      darkModeOptimized: true,
      minContrastRatio: 4.5,
      targetDevices: ['mobile', 'tablet'],
      targetAudience: ['executive', 'premium', 'luxury'],
      inspiration: 'Diseño de lujo + Dark mode optimization',
      trendTags: ['premium', 'dark', 'neumorphism', 'luxury'],
    ),
  );

  /// Trust Green - Tema verde sostenible y ecológico
  /// Para empresas eco-friendly y sostenibles
  static const trustGreen = ThemePreset(
    id: 'trust_green',
    name: 'trustGreen',
    displayName: 'Trust Green',
    description: 'Verde sostenible que transmite confianza y responsabilidad ambiental.',
    category: ThemeCategory.corporate,
    lightColors: ThemeColors(
      primary: Color(0xFF2E7D32),      // Verde bosque
      primaryLight: Color(0xFF60AD5E),
      primaryDark: Color(0xFF005005),
      secondary: Color(0xFF6A9B73),    // Verde salvia
      secondaryLight: Color(0xFF9CCC65),
      secondaryDark: Color(0xFF33691E),
      tertiary: Color(0xFF00695C),     // Verde azulado
      tertiaryLight: Color(0xFF26A69A),
      tertiaryDark: Color(0xFF00251A),
      error: Color(0xFFC62828),
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFF8E0000),
      warning: Color(0xFFEF6C00),
      warningLight: Color(0xFFFF9800),
      warningDark: Color(0xFFBF360C),
      success: Color(0xFF2E7D32),      // Mismo que primary
      successLight: Color(0xFF4CAF50),
      successDark: Color(0xFF1B5E20),
      info: Color(0xFF0097A7),
      infoLight: Color(0xFF00BCD4),
      infoDark: Color(0xFF006064),
      background: Color(0xFFF1F8E9),   // Verde muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFE8F5E8),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1B5E20),
      outline: Color(0xFFC8E6C9),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF66BB6A),      // Verde claro
      primaryLight: Color(0xFF98EE99),
      primaryDark: Color(0xFF338A3E),
      secondary: Color(0xFF81C784),    // Verde menta
      secondaryLight: Color(0xFFA5D6A7),
      secondaryDark: Color(0xFF519657),
      tertiary: Color(0xFF4DB6AC),     // Verde aqua
      tertiaryLight: Color(0xFF80CBC4),
      tertiaryDark: Color(0xFF00695C),
      error: Color(0xFFE57373),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFD32F2F),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF66BB6A),      // Mismo que primary
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF4DD0E1),
      infoLight: Color(0xFF80DEEA),
      infoDark: Color(0xFF00ACC1),
      background: Color(0xFF0E1D0E),   // Verde muy oscuro
      surface: Color(0xFF1B2E1B),
      surfaceVariant: Color(0xFF2E3A2E),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFE8F5E8),
      outline: Color(0xFF4A5F4A),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.tonal,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.subtle,
      hasGradients: false,
    ),
    useCases: [
      'Empresas sostenibles',
      'Apps de reciclaje',
      'Energías renovables',
      'Agricultura orgánica',
      'Eco-friendly brands',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 6.0,
      targetDevices: ['mobile', 'tablet', 'desktop'],
      targetAudience: ['eco-conscious', 'sustainability', 'b2b'],
      inspiration: 'Naturaleza + Sostenibilidad corporativa',
      trendTags: ['sustainable', 'natural', 'eco-friendly', 'organic'],
    ),
  );

  /// Enterprise Gray - Tema gris neutral formal
  /// Para aplicaciones enterprise serias y formales
  static const enterpriseGray = ThemePreset(
    id: 'enterprise_gray',
    name: 'enterpriseGray',
    displayName: 'Enterprise Gray',
    description: 'Gris neutral y formal. Perfecto para aplicaciones enterprise que requieren seriedad.',
    category: ThemeCategory.corporate,
    lightColors: ThemeColors(
      primary: Color(0xFF455A64),      // Gris azulado
      primaryLight: Color(0xFF718792),
      primaryDark: Color(0xFF1C313A),
      secondary: Color(0xFF546E7A),    // Gris medio
      secondaryLight: Color(0xFF819CA9),
      secondaryDark: Color(0xFF29434E),
      tertiary: Color(0xFF78909C),     // Gris claro azulado
      tertiaryLight: Color(0xFFA7C0CD),
      tertiaryDark: Color(0xFF4B636E),
      error: Color(0xFFD32F2F),
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFF9A0007),
      warning: Color(0xFFF57C00),
      warningLight: Color(0xFFFFB74D),
      warningDark: Color(0xFFBF360C),
      success: Color(0xFF388E3C),
      successLight: Color(0xFF4CAF50),
      successDark: Color(0xFF1B5E20),
      info: Color(0xFF1976D2),
      infoLight: Color(0xFF42A5F5),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFFAFAFA),
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF0F0F0),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212121),
      outline: Color(0xFFE0E0E0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF90A4AE),      // Gris claro
      primaryLight: Color(0xFFC1D5E0),
      primaryDark: Color(0xFF62757F),
      secondary: Color(0xFF78909C),    // Gris medio-claro
      secondaryLight: Color(0xFFA7C0CD),
      secondaryDark: Color(0xFF4B636E),
      tertiary: Color(0xFF607D8B),     // Gris azulado
      tertiaryLight: Color(0xFF8EACBB),
      tertiaryDark: Color(0xFF34515E),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFB71C1C),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF0077C2),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      surfaceVariant: Color(0xFF2A2A2A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFE0E0E0),
      outline: Color(0xFF404040),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.outlined,
      borderRadius: BorderRadiusLevel.sharp,
      elevation: ElevationLevel.flat,
      hasGradients: false,
    ),
    useCases: [
      'Software enterprise',
      'Sistemas bancarios',
      'Plataformas gubernamentales',
      'ERP systems',
      'Aplicaciones de auditoría',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['desktop', 'tablet'],
      targetAudience: ['enterprise', 'government', 'formal'],
      inspiration: 'Minimalismo + Seriedad corporativa',
      trendTags: ['minimalist', 'formal', 'enterprise', 'serious'],
    ),
  );

  // ==========================================================================
  // 🚀 TEMAS MODERNOS/TRENDY (4)
  // ==========================================================================

  /// Neon Cyber - Futurista gaming con neones
  /// Para apps gaming, tech startups y interfaces futuristas
  static const neonCyber = ThemePreset(
    id: 'neon_cyber',
    name: 'neonCyber',
    displayName: 'Neon Cyber',
    description: 'Tema futurista con colores neón y estética cyber. Perfecto para gaming y tech startups.',
    category: ThemeCategory.modern,
    lightColors: ThemeColors(
      primary: Color(0xFF00FFFF),      // Cyan neón
      primaryLight: Color(0xFF64FFDA),
      primaryDark: Color(0xFF00BCD4),
      secondary: Color(0xFFFF00FF),    // Magenta neón
      secondaryLight: Color(0xFFE1BEE7),
      secondaryDark: Color(0xFFAD1457),
      tertiary: Color(0xFF00FF41),     // Verde matrix
      tertiaryLight: Color(0xFF69F0AE),
      tertiaryDark: Color(0xFF00C853),
      error: Color(0xFFFF073A),
      errorLight: Color(0xFFFF5722),
      errorDark: Color(0xFFD50000),
      warning: Color(0xFFFFD600),
      warningLight: Color(0xFFFFEB3B),
      warningDark: Color(0xFFF57F17),
      success: Color(0xFF00FF41),
      successLight: Color(0xFF69F0AE),
      successDark: Color(0xFF00C853),
      info: Color(0xFF00E5FF),
      infoLight: Color(0xFF40C4FF),
      infoDark: Color(0xFF0091EA),
      background: Color(0xFF0A0A0A),   // Negro OLED
      surface: Color(0xFF1A1A1A),
      surfaceVariant: Color(0xFF2A2A2A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF00FFFF),
      outline: Color(0xFF00FFFF),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF00FFFF),      // Cyan neón brillante
      primaryLight: Color(0xFF18FFFF),
      primaryDark: Color(0xFF00ACC1),
      secondary: Color(0xFFE91E63),    // Rosa neón
      secondaryLight: Color(0xFFF48FB1),
      secondaryDark: Color(0xFFAD1457),
      tertiary: Color(0xFF76FF03),     // Verde lima neón
      tertiaryLight: Color(0xFFB2FF59),
      tertiaryDark: Color(0xFF64DD17),
      error: Color(0xFFFF1744),
      errorLight: Color(0xFFFF5722),
      errorDark: Color(0xFFD50000),
      warning: Color(0xFFFFD600),
      warningLight: Color(0xFFFFFF00),
      warningDark: Color(0xFFF57F17),
      success: Color(0xFF00FF41),
      successLight: Color(0xFF76FF03),
      successDark: Color(0xFF00C853),
      info: Color(0xFF00E5FF),
      infoLight: Color(0xFF18FFFF),
      infoDark: Color(0xFF00BCD4),
      background: Color(0xFF000000),   // Negro puro
      surface: Color(0xFF0D1117),      // Gris GitHub dark
      surfaceVariant: Color(0xFF21262D),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF00FFFF),
      outline: Color(0xFF00FFFF),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.high,
      hasGradients: true,
      supportsGlassmorphism: true,
    ),
    useCases: [
      'Apps gaming',
      'Tech startups',
      'Interfaces futuristas',
      'Apps de desarrolladores',
      'Plataformas crypto',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: false,
      darkModeOptimized: true,
      minContrastRatio: 3.0,
      targetDevices: ['mobile', 'desktop'],
      targetAudience: ['gamers', 'developers', 'tech-enthusiasts'],
      inspiration: 'Cyberpunk + Gaming aesthetics',
      trendTags: ['cyberpunk', 'gaming', 'neon', 'futuristic'],
    ),
  );

  /// Gradient Sunset - Gradientes cálidos creativos
  /// Para apps creativas, social media y lifestyle
  static const gradientSunset = ThemePreset(
    id: 'gradient_sunset',
    name: 'gradientSunset',
    displayName: 'Gradient Sunset',
    description: 'Gradientes cálidos inspirados en atardeceres. Vibrante y creativo para apps de lifestyle.',
    category: ThemeCategory.modern,
    lightColors: ThemeColors(
      primary: Color(0xFFFF6B35),      // Naranja sunset
      primaryLight: Color(0xFFFF8A65),
      primaryDark: Color(0xFFBF360C),
      secondary: Color(0xFFFF8E53),    // Rosa coral
      secondaryLight: Color(0xFFFFAB91),
      secondaryDark: Color(0xFFE64A19),
      tertiary: Color(0xFFFFD54F),     // Amarillo cálido
      tertiaryLight: Color(0xFFFFF176),
      tertiaryDark: Color(0xFFFF8F00),
      error: Color(0xFFE57373),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFD32F2F),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFF57C00),
      success: Color(0xFF81C784),
      successLight: Color(0xFFA5D6A7),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF64B5F6),
      infoLight: Color(0xFF90CAF9),
      infoDark: Color(0xFF2196F3),
      background: Color(0xFFFFF8E1),   // Crema cálido
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFFF3E0),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF3E2723),
      outline: Color(0xFFFFE0B2),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFFF7043),      // Naranja vibrante
      primaryLight: Color(0xFFFF8A65),
      primaryDark: Color(0xFFD84315),
      secondary: Color(0xFFAB47BC),    // Púrpura sunset
      secondaryLight: Color(0xFFCE93D8),
      secondaryDark: Color(0xFF7B1FA2),
      tertiary: Color(0xFFFFD54F),     // Amarillo dorado
      tertiaryLight: Color(0xFFFFF176),
      tertiaryDark: Color(0xFFFF8F00),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF5722),
      errorDark: Color(0xFFC62828),
      warning: Color(0xFFFFCA28),
      warningLight: Color(0xFFFFD54F),
      warningDark: Color(0xFFFFA000),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF81C784),
      successDark: Color(0xFF388E3C),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF64B5F6),
      infoDark: Color(0xFF1976D2),
      background: Color(0xFF1A0A0A),   // Marrón muy oscuro
      surface: Color(0xFF2D1B1B),
      surfaceVariant: Color(0xFF3E2723),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFFFFE0B2),
      outline: Color(0xFF8D6E63),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.full,
      elevation: ElevationLevel.medium,
      hasGradients: true,
    ),
    useCases: [
      'Apps creativas',
      'Social media',
      'Lifestyle apps',
      'Photography apps',
      'Travel & experiences',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: false,
      darkModeOptimized: true,
      minContrastRatio: 4.0,
      targetDevices: ['mobile', 'tablet'],
      targetAudience: ['creatives', 'millennials', 'lifestyle'],
      inspiration: 'Instagram gradients + Sunset colors',
      trendTags: ['gradient', 'creative', 'vibrant', 'instagram'],
    ),
  );

  /// Glass Morphism - Transparencias modernas
  /// Para apps premium, iOS-style y modernos
  static const glassMorphism = ThemePreset(
    id: 'glass_morphism',
    name: 'glassMorphism',
    displayName: 'Glass Morphism',
    description: 'Efectos de vidrio y transparencias modernas. Elegante y premium con estética iOS.',
    category: ThemeCategory.modern,
    lightColors: ThemeColors(
      primary: Color(0xFF3B82F6),      // Azul glass
      primaryLight: Color(0xFF60A5FA),
      primaryDark: Color(0xFF1D4ED8),
      secondary: Color(0xFF8B5CF6),    // Púrpura glass
      secondaryLight: Color(0xFFA78BFA),
      secondaryDark: Color(0xFF7C3AED),
      tertiary: Color(0xFF06B6D4),     // Cyan glass
      tertiaryLight: Color(0xFF22D3EE),
      tertiaryDark: Color(0xFF0891B2),
      error: Color(0xFFEF4444),
      errorLight: Color(0xFFF87171),
      errorDark: Color(0xFFDC2626),
      warning: Color(0xFFF59E0B),
      warningLight: Color(0xFFFBBF24),
      warningDark: Color(0xFFD97706),
      success: Color(0xFF10B981),
      successLight: Color(0xFF34D399),
      successDark: Color(0xFF059669),
      info: Color(0xFF0EA5E9),
      infoLight: Color(0xFF38BDF8),
      infoDark: Color(0xFF0284C7),
      background: Color(0xFFF8FAFC),   // Gris muy claro
      surface: Color(0x80FFFFFF),      // Blanco translúcido
      surfaceVariant: Color(0x60F1F5F9),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1E293B),
      outline: Color(0x40E2E8F0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF60A5FA),      // Azul claro glass
      primaryLight: Color(0xFF93C5FD),
      primaryDark: Color(0xFF3B82F6),
      secondary: Color(0xFFA78BFA),    // Púrpura claro glass
      secondaryLight: Color(0xFFC4B5FD),
      secondaryDark: Color(0xFF8B5CF6),
      tertiary: Color(0xFF22D3EE),     // Cyan brillante
      tertiaryLight: Color(0xFF67E8F9),
      tertiaryDark: Color(0xFF06B6D4),
      error: Color(0xFFF87171),
      errorLight: Color(0xFFFCA5A5),
      errorDark: Color(0xFFEF4444),
      warning: Color(0xFFFBBF24),
      warningLight: Color(0xFFFDE68A),
      warningDark: Color(0xFFF59E0B),
      success: Color(0xFF34D399),
      successLight: Color(0xFF6EE7B7),
      successDark: Color(0xFF10B981),
      info: Color(0xFF38BDF8),
      infoLight: Color(0xFF7DD3FC),
      infoDark: Color(0xFF0EA5E9),
      background: Color(0xFF0F172A),   // Slate oscuro
      surface: Color(0x801E293B),      // Slate translúcido
      surfaceVariant: Color(0x60334155),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFF1F5F9),
      outline: Color(0x40475569),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.medium,
      hasGradients: true,
      supportsGlassmorphism: true,
    ),
    useCases: [
      'Apps premium',
      'iOS-style apps',
      'Interfaces modernas',
      'Apps de productividad',
      'Herramientas creativas',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 4.5,
      targetDevices: ['mobile', 'tablet'],
      targetAudience: ['premium', 'design-conscious', 'ios-users'],
      inspiration: 'iOS + Glassmorphism trend',
      trendTags: ['glassmorphism', 'premium', 'ios', 'modern'],
    ),
  );

  /// Bold Brutalist - Minimalismo extremo
  /// Para portfolios, arte y diseños minimalistas
  static const boldBrutalist = ThemePreset(
    id: 'bold_brutalist',
    name: 'boldBrutalist',
    displayName: 'Bold Brutalist',
    description: 'Minimalismo extremo en blanco y negro. Diseño brutalist para portfolios y arte.',
    category: ThemeCategory.modern,
    lightColors: ThemeColors(
      primary: Color(0xFF000000),      // Negro puro
      primaryLight: Color(0xFF424242),
      primaryDark: Color(0xFF000000),
      secondary: Color(0xFFFFFFFF),    // Blanco puro
      secondaryLight: Color(0xFFFFFFFF),
      secondaryDark: Color(0xFFEEEEEE),
      tertiary: Color(0xFF757575),     // Gris medio
      tertiaryLight: Color(0xFF9E9E9E),
      tertiaryDark: Color(0xFF424242),
      error: Color(0xFF000000),        // Mantener monocromo
      errorLight: Color(0xFF424242),
      errorDark: Color(0xFF000000),
      warning: Color(0xFF616161),
      warningLight: Color(0xFF757575),
      warningDark: Color(0xFF424242),
      success: Color(0xFF424242),
      successLight: Color(0xFF616161),
      successDark: Color(0xFF212121),
      info: Color(0xFF757575),
      infoLight: Color(0xFF9E9E9E),
      infoDark: Color(0xFF424242),
      background: Color(0xFFFFFFFF),   // Blanco puro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFAFAFA),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF000000),
      outline: Color(0xFF000000),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFFFFFFF),      // Blanco en dark mode
      primaryLight: Color(0xFFFFFFFF),
      primaryDark: Color(0xFFEEEEEE),
      secondary: Color(0xFF000000),    // Negro en dark mode
      secondaryLight: Color(0xFF212121),
      secondaryDark: Color(0xFF000000),
      tertiary: Color(0xFF9E9E9E),     // Gris claro
      tertiaryLight: Color(0xFFBDBDBD),
      tertiaryDark: Color(0xFF757575),
      error: Color(0xFFFFFFFF),        // Mantener monocromo
      errorLight: Color(0xFFFFFFFF),
      errorDark: Color(0xFFEEEEEE),
      warning: Color(0xFF9E9E9E),
      warningLight: Color(0xFFBDBDBD),
      warningDark: Color(0xFF757575),
      success: Color(0xFFBDBDBD),
      successLight: Color(0xFFEEEEEE),
      successDark: Color(0xFF9E9E9E),
      info: Color(0xFF757575),
      infoLight: Color(0xFF9E9E9E),
      infoDark: Color(0xFF616161),
      background: Color(0xFF000000),   // Negro puro
      surface: Color(0xFF000000),
      surfaceVariant: Color(0xFF121212),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFFFFFFFF),
      outline: Color(0xFFFFFFFF),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.outlined,
      borderRadius: BorderRadiusLevel.sharp,
      elevation: ElevationLevel.flat,
      hasGradients: false,
    ),
    useCases: [
      'Portfolios de diseño',
      'Apps de arte',
      'Interfaces minimalistas',
      'Editorial apps',
      'Apps conceptuales',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 21.0, // Máximo contraste
      targetDevices: ['desktop', 'tablet'],
      targetAudience: ['designers', 'artists', 'minimalists'],
      inspiration: 'Brutalism + Swiss design',
      trendTags: ['brutalist', 'minimalist', 'monochrome', 'editorial'],
    ),
  );

  // ==========================================================================
  // 🏭 INDUSTRY-SPECIFIC (4)
  // ==========================================================================

  /// Mobility Hub - Para transporte/mapas
  /// Optimizado para apps de navegación, transporte y delivery
  static const mobilityHub = ThemePreset(
    id: 'mobility_hub',
    name: 'mobilityHub',
    displayName: 'Mobility Hub',
    description: 'Colores optimizados para mapas y transporte. Accesible y funcional para navegación.',
    category: ThemeCategory.industry,
    lightColors: ThemeColors(
      primary: Color(0xFF1976D2),      // Azul map
      primaryLight: Color(0xFF42A5F5),
      primaryDark: Color(0xFF0D47A1),
      secondary: Color(0xFF4CAF50),    // Verde ruta
      secondaryLight: Color(0xFF66BB6A),
      secondaryDark: Color(0xFF2E7D32),
      tertiary: Color(0xFFFF9800),     // Naranja tráfico
      tertiaryLight: Color(0xFFFFB74D),
      tertiaryDark: Color(0xFFE65100),
      error: Color(0xFFD32F2F),        // Rojo peligro
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFF9A0007),
      warning: Color(0xFFFF9800),      // Naranja advertencia
      warningLight: Color(0xFFFFB74D),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF4CAF50),      // Verde éxito
      successLight: Color(0xFF66BB6A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF2196F3),         // Azul información
      infoLight: Color(0xFF64B5F6),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFE8F5E8),   // Verde muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF1F8E9),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1B5E20),
      outline: Color(0xFFC8E6C9),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF42A5F5),      // Azul claro
      primaryLight: Color(0xFF64B5F6),
      primaryDark: Color(0xFF1976D2),
      secondary: Color(0xFF66BB6A),    // Verde claro
      secondaryLight: Color(0xFF81C784),
      secondaryDark: Color(0xFF4CAF50),
      tertiary: Color(0xFFFFB74D),     // Naranja claro
      tertiaryLight: Color(0xFFFFCC02),
      tertiaryDark: Color(0xFFFF9800),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFD32F2F),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF2196F3),
      background: Color(0xFF1A1A1A),   // Gris oscuro para mapas
      surface: Color(0xFF2D2D2D),
      surfaceVariant: Color(0xFF3A3A3A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFE8F5E8),
      outline: Color(0xFF4A5F4A),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.medium,
      elevation: ElevationLevel.medium,
      hasGradients: false,
    ),
    useCases: [
      'Apps de navegación',
      'Transporte público',
      'Delivery apps',
      'Ride sharing',
      'Logistics platforms',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['mobile', 'tablet', 'automotive'],
      targetAudience: ['commuters', 'drivers', 'logistics'],
      inspiration: 'Google Maps + Transport apps',
      trendTags: ['navigation', 'transport', 'functional', 'accessible'],
    ),
  );

  /// Health Care - Médico limpio
  /// Para aplicaciones médicas, hospitales y salud
  static const healthCare = ThemePreset(
    id: 'health_care',
    name: 'healthCare',
    displayName: 'Health Care',
    description: 'Tema médico limpio y confiable. Optimizado para aplicaciones de salud y hospitales.',
    category: ThemeCategory.industry,
    lightColors: ThemeColors(
      primary: Color(0xFF2196F3),      // Azul médico
      primaryLight: Color(0xFF42A5F5),
      primaryDark: Color(0xFF1565C0),
      secondary: Color(0xFF4CAF50),    // Verde salud
      secondaryLight: Color(0xFF66BB6A),
      secondaryDark: Color(0xFF2E7D32),
      tertiary: Color(0xFF00BCD4),     // Cyan sanitario
      tertiaryLight: Color(0xFF26C6DA),
      tertiaryDark: Color(0xFF0097A7),
      error: Color(0xFFE53935),        // Rojo urgencia
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFFC62828),
      warning: Color(0xFFFFC107),      // Amarillo precaución
      warningLight: Color(0xFFFFD54F),
      warningDark: Color(0xFFFFA000),
      success: Color(0xFF4CAF50),      // Verde éxito
      successLight: Color(0xFF66BB6A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF2196F3),         // Azul información
      infoLight: Color(0xFF42A5F5),
      infoDark: Color(0xFF1565C0),
      background: Color(0xFFFAFAFA),   // Blanco hospital
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF5F5F5),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212121),
      outline: Color(0xFFE0E0E0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF64B5F6),      // Azul claro médico
      primaryLight: Color(0xFF90CAF9),
      primaryDark: Color(0xFF42A5F5),
      secondary: Color(0xFF81C784),    // Verde claro salud
      secondaryLight: Color(0xFFA5D6A7),
      secondaryDark: Color(0xFF66BB6A),
      tertiary: Color(0xFF4DD0E1),     // Cyan claro
      tertiaryLight: Color(0xFF80DEEA),
      tertiaryDark: Color(0xFF26C6DA),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFE53935),
      warning: Color(0xFFFFD54F),
      warningLight: Color(0xFFFFF176),
      warningDark: Color(0xFFFFC107),
      success: Color(0xFF81C784),
      successLight: Color(0xFFA5D6A7),
      successDark: Color(0xFF66BB6A),
      info: Color(0xFF64B5F6),
      infoLight: Color(0xFF90CAF9),
      infoDark: Color(0xFF42A5F5),
      background: Color(0xFF121212),   // Negro suave
      surface: Color(0xFF1E1E1E),
      surfaceVariant: Color(0xFF2A2A2A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFE0E0E0),
      outline: Color(0xFF404040),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.subtle,
      hasGradients: false,
    ),
    useCases: [
      'Apps médicas',
      'Sistemas hospitalarios',
      'Telemedicina',
      'Health tracking',
      'Medical records',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['mobile', 'tablet', 'desktop'],
      targetAudience: ['healthcare', 'patients', 'medical'],
      inspiration: 'Medical apps + Trust design',
      trendTags: ['medical', 'clean', 'trustworthy', 'accessible'],
    ),
  );

  /// Fintech Pro - Financiero seguro
  /// Para fintech, banking y aplicaciones de inversión
  static const fintechPro = ThemePreset(
    id: 'fintech_pro',
    name: 'fintechPro',
    displayName: 'Fintech Pro',
    description: 'Tema financiero que inspira seguridad y confianza. Para fintech, banking e inversiones.',
    category: ThemeCategory.industry,
    lightColors: ThemeColors(
      primary: Color(0xFF388E3C),      // Verde dinero
      primaryLight: Color(0xFF4CAF50),
      primaryDark: Color(0xFF2E7D32),
      secondary: Color(0xFF1565C0),    // Azul confianza
      secondaryLight: Color(0xFF1976D2),
      secondaryDark: Color(0xFF0D47A1),
      tertiary: Color(0xFF6A1B9A),     // Púrpura premium
      tertiaryLight: Color(0xFF7B1FA2),
      tertiaryDark: Color(0xFF4A148C),
      error: Color(0xFFD32F2F),        // Rojo pérdida
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFF9A0007),
      warning: Color(0xFFF57C00),      // Naranja advertencia
      warningLight: Color(0xFFFF9800),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF388E3C),      // Verde ganancia
      successLight: Color(0xFF4CAF50),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF1565C0),         // Azul información
      infoLight: Color(0xFF1976D2),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFF8F9FA),   // Gris muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF1F3F4),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF202124),
      outline: Color(0xFFDADCE0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF66BB6A),      // Verde claro
      primaryLight: Color(0xFF81C784),
      primaryDark: Color(0xFF4CAF50),
      secondary: Color(0xFF42A5F5),    // Azul claro
      secondaryLight: Color(0xFF64B5F6),
      secondaryDark: Color(0xFF2196F3),
      tertiary: Color(0xFFAB47BC),     // Púrpura claro
      tertiaryLight: Color(0xFFBA68C8),
      tertiaryDark: Color(0xFF9C27B0),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFD32F2F),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF9800),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF81C784),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF64B5F6),
      infoDark: Color(0xFF2196F3),
      background: Color(0xFF1A1A1A),   // Negro profesional
      surface: Color(0xFF2D2D2D),
      surfaceVariant: Color(0xFF3A3A3A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFE8EAED),
      outline: Color(0xFF5F6368),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.medium,
      elevation: ElevationLevel.medium,
      hasGradients: true,
    ),
    useCases: [
      'Fintech apps',
      'Banking mobile',
      'Investment platforms',
      'Crypto exchanges',
      'Payment systems',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['mobile', 'desktop'],
      targetAudience: ['investors', 'banking', 'finance'],
      inspiration: 'Banking apps + Trust signals',
      trendTags: ['fintech', 'secure', 'professional', 'trustworthy'],
    ),
  );

  /// Retail Pop - E-commerce vibrante
  /// Para e-commerce, retail y aplicaciones de ventas
  static const retailPop = ThemePreset(
    id: 'retail_pop',
    name: 'retailPop',
    displayName: 'Retail Pop',
    description: 'Colores vibrantes que impulsan conversiones. Energético y llamativo para e-commerce.',
    category: ThemeCategory.industry,
    lightColors: ThemeColors(
      primary: Color(0xFFE53935),      // Rojo venta
      primaryLight: Color(0xFFEF5350),
      primaryDark: Color(0xFFC62828),
      secondary: Color(0xFFFF9800),    // Naranja oferta
      secondaryLight: Color(0xFFFFB74D),
      secondaryDark: Color(0xFFE65100),
      tertiary: Color(0xFFAD1457),     // Rosa intenso
      tertiaryLight: Color(0xFFE91E63),
      tertiaryDark: Color(0xFF880E4F),
      error: Color(0xFFD32F2F),
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFF9A0007),
      warning: Color(0xFFF57C00),
      warningLight: Color(0xFFFF9800),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF388E3C),      // Verde compra
      successLight: Color(0xFF4CAF50),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF1976D2),
      infoLight: Color(0xFF2196F3),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFFFF8E1),   // Crema cálido
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFFF3E0),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF3E2723),
      outline: Color(0xFFFFCCBC),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFEF5350),      // Rojo vibrante
      primaryLight: Color(0xFFFF8A80),
      primaryDark: Color(0xFFE53935),
      secondary: Color(0xFFFFB74D),    // Naranja brillante
      secondaryLight: Color(0xFFFFCC02),
      secondaryDark: Color(0xFFFF9800),
      tertiary: Color(0xFFE91E63),     // Rosa neón
      tertiaryLight: Color(0xFFF48FB1),
      tertiaryDark: Color(0xFFAD1457),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFD32F2F),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF2196F3),
      background: Color(0xFF1A0E0E),   // Rojo muy oscuro
      surface: Color(0xFF2D1B1B),
      surfaceVariant: Color(0xFF3E2723),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFFFE0B2),
      outline: Color(0xFF8D6E63),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.medium,
      hasGradients: true,
    ),
    useCases: [
      'E-commerce apps',
      'Retail platforms',
      'Shopping apps',
      'Flash sales',
      'Marketplace apps',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: false,
      darkModeOptimized: true,
      minContrastRatio: 4.0,
      targetDevices: ['mobile', 'tablet'],
      targetAudience: ['shoppers', 'retail', 'consumers'],
      inspiration: 'Amazon + Alibaba + Sale urgency',
      trendTags: ['retail', 'energetic', 'conversion', 'shopping'],
    ),
  );

  // ==========================================================================
  // 😊 MOODS/EMOCIONALES (4)
  // ==========================================================================

  /// Calm Zen - Relajante meditación
  /// Para apps de meditación, wellness y mindfulness
  static const calmZen = ThemePreset(
    id: 'calm_zen',
    name: 'calmZen',
    displayName: 'Calm Zen',
    description: 'Colores suaves y relajantes. Optimizado para meditación, wellness y mindfulness.',
    category: ThemeCategory.mood,
    lightColors: ThemeColors(
      primary: Color(0xFF64B5F6),      // Azul calma
      primaryLight: Color(0xFF90CAF9),
      primaryDark: Color(0xFF42A5F5),
      secondary: Color(0xFF81C784),    // Verde zen
      secondaryLight: Color(0xFFA5D6A7),
      secondaryDark: Color(0xFF66BB6A),
      tertiary: Color(0xFFB39DDB),     // Lavanda suave
      tertiaryLight: Color(0xFFC5CAE9),
      tertiaryDark: Color(0xFF9575CD),
      error: Color(0xFFEF9A9A),        // Rojo suave
      errorLight: Color(0xFFFFCDD2),
      errorDark: Color(0xFFE57373),
      warning: Color(0xFFFFE082),      // Amarillo suave
      warningLight: Color(0xFFFFF176),
      warningDark: Color(0xFFFFD54F),
      success: Color(0xFF81C784),      // Verde suave
      successLight: Color(0xFFA5D6A7),
      successDark: Color(0xFF66BB6A),
      info: Color(0xFF81D4FA),         // Azul suave
      infoLight: Color(0xFFB3E5FC),
      infoDark: Color(0xFF4FC3F7),
      background: Color(0xFFF3F8FF),   // Azul muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFEBF3FD),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF2C3E50),
      outline: Color(0xFFDAE8FC),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF64B5F6),      // Azul calma mantenido
      primaryLight: Color(0xFF90CAF9),
      primaryDark: Color(0xFF42A5F5),
      secondary: Color(0xFF81C784),    // Verde zen mantenido
      secondaryLight: Color(0xFFA5D6A7),
      secondaryDark: Color(0xFF66BB6A),
      tertiary: Color(0xFF9575CD),     // Lavanda oscuro
      tertiaryLight: Color(0xFFB39DDB),
      tertiaryDark: Color(0xFF7E57C2),
      error: Color(0xFFE57373),
      errorLight: Color(0xFFEF9A9A),
      errorDark: Color(0xFFE53935),
      warning: Color(0xFFFFD54F),
      warningLight: Color(0xFFFFE082),
      warningDark: Color(0xFFFFC107),
      success: Color(0xFF81C784),
      successLight: Color(0xFFA5D6A7),
      successDark: Color(0xFF66BB6A),
      info: Color(0xFF4FC3F7),
      infoLight: Color(0xFF81D4FA),
      infoDark: Color(0xFF29B6F6),
      background: Color(0xFF1A1F2E),   // Azul marino oscuro
      surface: Color(0xFF2C3E50),
      surfaceVariant: Color(0xFF34495E),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFECF0F1),
      outline: Color(0xFF5D6D7E),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.tonal,
      borderRadius: BorderRadiusLevel.full,
      elevation: ElevationLevel.subtle,
      hasGradients: false,
    ),
    useCases: [
      'Apps de meditación',
      'Wellness platforms',
      'Mindfulness apps',
      'Sleep apps',
      'Yoga platforms',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 4.5,
      targetDevices: ['mobile', 'tablet'],
      targetAudience: ['wellness', 'mindfulness', 'relaxation'],
      inspiration: 'Calm app + Headspace aesthetics',
      trendTags: ['zen', 'calm', 'wellness', 'mindfulness'],
    ),
  );

  /// Energy Boost - Motivacional fitness
  /// Para apps de fitness, sports y motivación
  static const energyBoost = ThemePreset(
    id: 'energy_boost',
    name: 'energyBoost',
    displayName: 'Energy Boost',
    description: 'Colores energéticos que motivan. Perfecto para fitness, sports y aplicaciones motivacionales.',
    category: ThemeCategory.mood,
    lightColors: ThemeColors(
      primary: Color(0xFFFF5722),      // Naranja energía
      primaryLight: Color(0xFFFF7043),
      primaryDark: Color(0xFFD84315),
      secondary: Color(0xFFF44336),    // Rojo potencia
      secondaryLight: Color(0xFFEF5350),
      secondaryDark: Color(0xFFD32F2F),
      tertiary: Color(0xFFFFEB3B),     // Amarillo energía
      tertiaryLight: Color(0xFFFFF176),
      tertiaryDark: Color(0xFFFBC02D),
      error: Color(0xFFD32F2F),
      errorLight: Color(0xFFEF5350),
      errorDark: Color(0xFF9A0007),
      warning: Color(0xFFF57C00),
      warningLight: Color(0xFFFF9800),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF4CAF50),      // Verde éxito
      successLight: Color(0xFF66BB6A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF2196F3),
      infoLight: Color(0xFF42A5F5),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFFFF8E1),   // Amarillo muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFFF3E0),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFFBF360C),
      outline: Color(0xFFFFE0B2),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFFF7043),      // Naranja vibrante
      primaryLight: Color(0xFFFF8A65),
      primaryDark: Color(0xFFFF5722),
      secondary: Color(0xFFEF5350),    // Rojo vibrante
      secondaryLight: Color(0xFFFF8A80),
      secondaryDark: Color(0xFFF44336),
      tertiary: Color(0xFFFFD54F),     // Amarillo dorado
      tertiaryLight: Color(0xFFFFF176),
      tertiaryDark: Color(0xFFFFEB3B),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFD32F2F),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF9800),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF2196F3),
      background: Color(0xFF1A0A00),   // Marrón muy oscuro
      surface: Color(0xFF2D1B00),
      surfaceVariant: Color(0xFF3E2723),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFFFE0B2),
      outline: Color(0xFF8D6E63),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.high,
      hasGradients: true,
    ),
    useCases: [
      'Fitness apps',
      'Sports tracking',
      'Workout platforms',
      'Motivation apps',
      'Activity trackers',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: false,
      darkModeOptimized: true,
      minContrastRatio: 3.0,
      targetDevices: ['mobile', 'wearable'],
      targetAudience: ['fitness', 'athletes', 'active-lifestyle'],
      inspiration: 'Nike Training + Strava energy',
      trendTags: ['energetic', 'fitness', 'motivational', 'dynamic'],
    ),
  );

  /// Dark Focus - Productividad nocturna
  /// Para apps de productividad, trabajo nocturno y concentración
  static const darkFocus = ThemePreset(
    id: 'dark_focus',
    name: 'darkFocus',
    displayName: 'Dark Focus',
    description: 'Dark mode optimizado para concentración. Perfecto para productividad y trabajo nocturno.',
    category: ThemeCategory.mood,
    lightColors: ThemeColors(
      primary: Color(0xFF673AB7),      // Morado focus
      primaryLight: Color(0xFF7986CB),
      primaryDark: Color(0xFF5E35B1),
      secondary: Color(0xFF3F51B5),    // Azul night
      secondaryLight: Color(0xFF5C6BC0),
      secondaryDark: Color(0xFF303F9F),
      tertiary: Color(0xFF607D8B),     // Gris azulado
      tertiaryLight: Color(0xFF78909C),
      tertiaryDark: Color(0xFF546E7A),
      error: Color(0xFFE91E63),
      errorLight: Color(0xFFF06292),
      errorDark: Color(0xFFAD1457),
      warning: Color(0xFFFF9800),
      warningLight: Color(0xFFFFB74D),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF4CAF50),
      successLight: Color(0xFF66BB6A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF2196F3),
      infoLight: Color(0xFF42A5F5),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFF5F5F5),   // Gris muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF0F0F0),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF37474F),
      outline: Color(0xFFE0E0E0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF9575CD),      // Morado claro
      primaryLight: Color(0xFFB39DDB),
      primaryDark: Color(0xFF673AB7),
      secondary: Color(0xFF5C6BC0),    // Azul suave
      secondaryLight: Color(0xFF7986CB),
      secondaryDark: Color(0xFF3F51B5),
      tertiary: Color(0xFF78909C),     // Gris azulado claro
      tertiaryLight: Color(0xFF90A4AE),
      tertiaryDark: Color(0xFF607D8B),
      error: Color(0xFFF06292),
      errorLight: Color(0xFFF8BBD9),
      errorDark: Color(0xFFE91E63),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF42A5F5),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF0077C2),
      background: Color(0xFF0F0F23),   // Azul muy oscuro
      surface: Color(0xFF1A1A2E),
      surfaceVariant: Color(0xFF16213E),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFFE3F2FD),
      outline: Color(0xFF3E4A59),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.medium,
      elevation: ElevationLevel.subtle,
      hasGradients: false,
    ),
    useCases: [
      'Productivity apps',
      'Code editors',
      'Writing apps',
      'Focus tools',
      'Night mode apps',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['desktop', 'tablet'],
      targetAudience: ['developers', 'writers', 'knowledge-workers'],
      inspiration: 'VS Code Dark + Focus apps',
      trendTags: ['focus', 'productivity', 'dark', 'concentration'],
    ),
  );

  /// Playful Kids - Infantil educativo
  /// Para aplicaciones infantiles, educación y juegos
  static const playfulKids = ThemePreset(
    id: 'playful_kids',
    name: 'playfulKids',
    displayName: 'Playful Kids',
    description: 'Colores alegres y divertidos. Optimizado para aplicaciones infantiles y educativas.',
    category: ThemeCategory.mood,
    lightColors: ThemeColors(
      primary: Color(0xFFFFEB3B),      // Amarillo alegre
      primaryLight: Color(0xFFFFF176),
      primaryDark: Color(0xFFFBC02D),
      secondary: Color(0xFF2196F3),    // Azul juego
      secondaryLight: Color(0xFF42A5F5),
      secondaryDark: Color(0xFF0D47A1),
      tertiary: Color(0xFFE91E63),     // Rosa divertido
      tertiaryLight: Color(0xFFF06292),
      tertiaryDark: Color(0xFFAD1457),
      error: Color(0xFFEF5350),        // Rojo suave
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFE53935),
      warning: Color(0xFFFF9800),      // Naranja juguetón
      warningLight: Color(0xFFFFB74D),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF4CAF50),      // Verde éxito
      successLight: Color(0xFF66BB6A),
      successDark: Color(0xFF2E7D32),
      info: Color(0xFF00BCD4),         // Cyan información
      infoLight: Color(0xFF26C6DA),
      infoDark: Color(0xFF0097A7),
      background: Color(0xFFFFFDE7),   // Amarillo muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFFF8E1),
      onPrimary: Color(0xFF3E2723),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF3E2723),
      outline: Color(0xFFFFE0B2),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFFFF176),      // Amarillo suave
      primaryLight: Color(0xFFFFFF8D),
      primaryDark: Color(0xFFFFEB3B),
      secondary: Color(0xFF64B5F6),    // Azul claro
      secondaryLight: Color(0xFF90CAF9),
      secondaryDark: Color(0xFF42A5F5),
      tertiary: Color(0xFFF48FB1),     // Rosa claro
      tertiaryLight: Color(0xFFF8BBD9),
      tertiaryDark: Color(0xFFE91E63),
      error: Color(0xFFEF5350),
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFE53935),
      warning: Color(0xFFFFB74D),
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF66BB6A),
      successLight: Color(0xFF8BC34A),
      successDark: Color(0xFF4CAF50),
      info: Color(0xFF4DD0E1),
      infoLight: Color(0xFF80DEEA),
      infoDark: Color(0xFF26C6DA),
      background: Color(0xFF1A1611),   // Marrón muy oscuro
      surface: Color(0xFF2D251D),
      surfaceVariant: Color(0xFF3E342A),
      onPrimary: Color(0xFF3E2723),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFFFF8E1),
      outline: Color(0xFF8D6E63),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.filled,
      borderRadius: BorderRadiusLevel.full,
      elevation: ElevationLevel.medium,
      hasGradients: true,
    ),
    useCases: [
      'Apps infantiles',
      'Juegos educativos',
      'Learning platforms',
      'Kids entertainment',
      'Educational games',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: false,
      minContrastRatio: 4.5,
      targetDevices: ['tablet', 'mobile'],
      targetAudience: ['children', 'parents', 'education'],
      inspiration: 'PBS Kids + Educational toys',
      trendTags: ['playful', 'educational', 'colorful', 'kids'],
    ),
  );

  // ==========================================================================
  // 🎯 ESPECIALES (4)
  // ==========================================================================

  /// Accessibility High - Máximo contraste
  /// Optimizado para usuarios con discapacidad visual
  static const accessibilityHigh = ThemePreset(
    id: 'accessibility_high',
    name: 'accessibilityHigh',
    displayName: 'Accessibility High',
    description: 'Máximo contraste para accesibilidad. Optimizado para usuarios con discapacidad visual.',
    category: ThemeCategory.special,
    lightColors: ThemeColors(
      primary: Color(0xFF000000),      // Negro contraste
      primaryLight: Color(0xFF424242),
      primaryDark: Color(0xFF000000),
      secondary: Color(0xFFFFEB3B),    // Amarillo accesible
      secondaryLight: Color(0xFFFFF176),
      secondaryDark: Color(0xFFF57F17),
      tertiary: Color(0xFF0D47A1),     // Azul oscuro
      tertiaryLight: Color(0xFF1976D2),
      tertiaryDark: Color(0xFF0D47A1),
      error: Color(0xFFB71C1C),        // Rojo muy oscuro
      errorLight: Color(0xFFD32F2F),
      errorDark: Color(0xFFB71C1C),
      warning: Color(0xFFE65100),      // Naranja muy oscuro
      warningLight: Color(0xFFFF9800),
      warningDark: Color(0xFFE65100),
      success: Color(0xFF1B5E20),      // Verde muy oscuro
      successLight: Color(0xFF4CAF50),
      successDark: Color(0xFF1B5E20),
      info: Color(0xFF0D47A1),
      infoLight: Color(0xFF2196F3),
      infoDark: Color(0xFF0D47A1),
      background: Color(0xFFFFFFFF),   // Blanco puro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFFFFFF),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF000000),
      outline: Color(0xFF000000),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFFFFFFF),      // Blanco contraste
      primaryLight: Color(0xFFFFFFFF),
      primaryDark: Color(0xFFEEEEEE),
      secondary: Color(0xFFFFEB3B),    // Amarillo mantenido
      secondaryLight: Color(0xFFFFF176),
      secondaryDark: Color(0xFFFBC02D),
      tertiary: Color(0xFF64B5F6),     // Azul claro
      tertiaryLight: Color(0xFF90CAF9),
      tertiaryDark: Color(0xFF42A5F5),
      error: Color(0xFFFF5252),        // Rojo brillante
      errorLight: Color(0xFFFF8A80),
      errorDark: Color(0xFFFF1744),
      warning: Color(0xFFFFAB00),      // Naranja brillante
      warningLight: Color(0xFFFFCC02),
      warningDark: Color(0xFFFF8F00),
      success: Color(0xFF69F0AE),      // Verde brillante
      successLight: Color(0xFFB2FF59),
      successDark: Color(0xFF00E676),
      info: Color(0xFF40C4FF),
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF00B0FF),
      background: Color(0xFF000000),   // Negro puro
      surface: Color(0xFF000000),
      surfaceVariant: Color(0xFF000000),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFFFFFFF),
      outline: Color(0xFFFFFFFF),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.outlined,
      borderRadius: BorderRadiusLevel.sharp,
      elevation: ElevationLevel.flat,
      hasGradients: false,
    ),
    useCases: [
      'Accessibility apps',
      'Gobierno apps',
      'Medical interfaces',
      'Elder care',
      'Vision assistance',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 21.0, // WCAG AAA
      targetDevices: ['mobile', 'tablet', 'desktop'],
      targetAudience: ['visually-impaired', 'elderly', 'accessibility'],
      inspiration: 'WCAG AAA + Government standards',
      trendTags: ['accessibility', 'high-contrast', 'wcag', 'inclusive'],
    ),
  );

  /// Monochrome Ink - Un solo color
  /// Monocromático elegante en escala de grises
  static const monochromeInk = ThemePreset(
    id: 'monochrome_ink',
    name: 'monochromeInk',
    displayName: 'Monochrome Ink',
    description: 'Elegante monocromático en escala de grises. Perfecto para editorial y arte.',
    category: ThemeCategory.special,
    lightColors: ThemeColors(
      primary: Color(0xFF212121),      // Negro ink
      primaryLight: Color(0xFF484848),
      primaryDark: Color(0xFF000000),
      secondary: Color(0xFF424242),    // Gris oscuro
      secondaryLight: Color(0xFF6D6D6D),
      secondaryDark: Color(0xFF1B1B1B),
      tertiary: Color(0xFF757575),     // Gris medio
      tertiaryLight: Color(0xFF9E9E9E),
      tertiaryDark: Color(0xFF424242),
      error: Color(0xFF424242),        // Mantener monocromo
      errorLight: Color(0xFF6D6D6D),
      errorDark: Color(0xFF212121),
      warning: Color(0xFF616161),
      warningLight: Color(0xFF757575),
      warningDark: Color(0xFF424242),
      success: Color(0xFF616161),
      successLight: Color(0xFF757575),
      successDark: Color(0xFF424242),
      info: Color(0xFF757575),
      infoLight: Color(0xFF9E9E9E),
      infoDark: Color(0xFF616161),
      background: Color(0xFFFAFAFA),   // Gris muy claro
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF5F5F5),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212121),
      outline: Color(0xFFE0E0E0),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFEEEEEE),      // Gris muy claro
      primaryLight: Color(0xFFFFFFFF),
      primaryDark: Color(0xFFBDBDBD),
      secondary: Color(0xFFBDBDBD),    // Gris claro
      secondaryLight: Color(0xFFEEEEEE),
      secondaryDark: Color(0xFF9E9E9E),
      tertiary: Color(0xFF9E9E9E),     // Gris medio-claro
      tertiaryLight: Color(0xFFBDBDBD),
      tertiaryDark: Color(0xFF757575),
      error: Color(0xFFBDBDBD),        // Mantener monocromo
      errorLight: Color(0xFFEEEEEE),
      errorDark: Color(0xFF9E9E9E),
      warning: Color(0xFF9E9E9E),
      warningLight: Color(0xFFBDBDBD),
      warningDark: Color(0xFF757575),
      success: Color(0xFFBDBDBD),
      successLight: Color(0xFFEEEEEE),
      successDark: Color(0xFF9E9E9E),
      info: Color(0xFF9E9E9E),
      infoLight: Color(0xFFBDBDBD),
      infoDark: Color(0xFF757575),
      background: Color(0xFF121212),   // Negro material
      surface: Color(0xFF1E1E1E),
      surfaceVariant: Color(0xFF2A2A2A),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFEEEEEE),
      outline: Color(0xFF404040),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.outlined,
      borderRadius: BorderRadiusLevel.sharp,
      elevation: ElevationLevel.flat,
      hasGradients: false,
    ),
    useCases: [
      'Editorial apps',
      'Portfolio websites',
      'Art platforms',
      'Reading apps',
      'Minimalist tools',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 7.0,
      targetDevices: ['desktop', 'tablet'],
      targetAudience: ['designers', 'artists', 'writers'],
      inspiration: 'Editorial design + Japanese minimalism',
      trendTags: ['monochrome', 'editorial', 'minimalist', 'artistic'],
    ),
  );

  /// Retro Terminal - Nostálgico tech
  /// Inspirado en terminales retro y computing clásico
  static const retroTerminal = ThemePreset(
    id: 'retro_terminal',
    name: 'retroTerminal',
    displayName: 'Retro Terminal',
    description: 'Nostálgico estilo terminal retro. Para developer tools y apps vintage.',
    category: ThemeCategory.special,
    lightColors: ThemeColors(
      primary: Color(0xFF00FF41),      // Verde terminal
      primaryLight: Color(0xFF69F0AE),
      primaryDark: Color(0xFF00E676),
      secondary: Color(0xFFFFC107),    // Ámbar retro
      secondaryLight: Color(0xFFFFD54F),
      secondaryDark: Color(0xFFFF8F00),
      tertiary: Color(0xFF00E5FF),     // Cyan terminal
      tertiaryLight: Color(0xFF40C4FF),
      tertiaryDark: Color(0xFF00B0FF),
      error: Color(0xFFFF1744),        // Rojo terminal
      errorLight: Color(0xFFFF5722),
      errorDark: Color(0xFFD50000),
      warning: Color(0xFFFFD600),      // Amarillo terminal
      warningLight: Color(0xFFFFF176),
      warningDark: Color(0xFFF57F17),
      success: Color(0xFF00FF41),      // Verde terminal
      successLight: Color(0xFF69F0AE),
      successDark: Color(0xFF00E676),
      info: Color(0xFF40C4FF),         // Azul terminal
      infoLight: Color(0xFF80D6FF),
      infoDark: Color(0xFF0091EA),
      background: Color(0xFFF5F5DC),   // Beige papel
      surface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFF0F0E6),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF2E2E2E),
      outline: Color(0xFFD3D3D3),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFF00FF41),      // Verde terminal brillante
      primaryLight: Color(0xFF76FF03),
      primaryDark: Color(0xFF00C853),
      secondary: Color(0xFFFFC107),    // Ámbar brillante
      secondaryLight: Color(0xFFFFE082),
      secondaryDark: Color(0xFFFF8F00),
      tertiary: Color(0xFF18FFFF),     // Cyan brillante
      tertiaryLight: Color(0xFF64FFDA),
      tertiaryDark: Color(0xFF00E5FF),
      error: Color(0xFFFF073A),
      errorLight: Color(0xFFFF5722),
      errorDark: Color(0xFFD50000),
      warning: Color(0xFFFFD600),
      warningLight: Color(0xFFFFEB3B),
      warningDark: Color(0xFFF57F17),
      success: Color(0xFF00FF41),
      successLight: Color(0xFF76FF03),
      successDark: Color(0xFF00C853),
      info: Color(0xFF00E5FF),
      infoLight: Color(0xFF18FFFF),
      infoDark: Color(0xFF00BCD4),
      background: Color(0xFF0A0A0A),   // Negro terminal
      surface: Color(0xFF1A1A1A),
      surfaceVariant: Color(0xFF2E2E2E),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFF00FF41),
      outline: Color(0xFF00FF41),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.outlined,
      borderRadius: BorderRadiusLevel.sharp,
      elevation: ElevationLevel.flat,
      hasGradients: false,
    ),
    useCases: [
      'Developer tools',
      'Code editors',
      'Terminal apps',
      'Retro gaming',
      'System utilities',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: false,
      darkModeOptimized: true,
      minContrastRatio: 4.5,
      targetDevices: ['desktop', 'mobile'],
      targetAudience: ['developers', 'retro-enthusiasts', 'gamers'],
      inspiration: 'VT100 terminal + Commodore 64',
      trendTags: ['retro', 'terminal', 'vintage', 'computing'],
    ),
  );

  /// Material You - Adaptativo personal
  /// Sistema adaptativo de Material Design 3
  static const materialYou = ThemePreset(
    id: 'material_you',
    name: 'materialYou',
    displayName: 'Material You',
    description: 'Sistema adaptativo de Material Design 3. Personalización dinámica de colores.',
    category: ThemeCategory.special,
    lightColors: ThemeColors(
      primary: Color(0xFF6750A4),      // Dinámico base
      primaryLight: Color(0xFF7F67BE),
      primaryDark: Color(0xFF553C9A),
      secondary: Color(0xFF625B71),    // Complementario
      secondaryLight: Color(0xFF7A7289),
      secondaryDark: Color(0xFF4A4458),
      tertiary: Color(0xFF7D5260),     // Acento terciario
      tertiaryLight: Color(0xFF986977),
      tertiaryDark: Color(0xFF633B48),
      error: Color(0xFFBA1A1A),
      errorLight: Color(0xFFDE3730),
      errorDark: Color(0xFF93000A),
      warning: Color(0xFF825500),
      warningLight: Color(0xFF9D6B00),
      warningDark: Color(0xFF6B4700),
      success: Color(0xFF006E1C),
      successLight: Color(0xFF208930),
      successDark: Color(0xFF00530F),
      info: Color(0xFF0061A4),
      infoLight: Color(0xFF1A7BC4),
      infoDark: Color(0xFF004787),
      background: Color(0xFFFFFBFE),   // Surface tint
      surface: Color(0xFFFFFBFE),
      surfaceVariant: Color(0xFFE7E0EC),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1C1B1F),
      outline: Color(0xFF79747E),
    ),
    darkColors: ThemeColors(
      primary: Color(0xFFD0BCFF),      // Primario adaptativo
      primaryLight: Color(0xFFEADDFF),
      primaryDark: Color(0xFFB69DF8),
      secondary: Color(0xFFCCC2DC),    // Secundario adaptativo
      secondaryLight: Color(0xFFE8DEF8),
      secondaryDark: Color(0xFFB0A7C0),
      tertiary: Color(0xFFEFB8C8),     // Terciario adaptativo
      tertiaryLight: Color(0xFFFFD9E2),
      tertiaryDark: Color(0xFFD29BAC),
      error: Color(0xFFFFB4AB),
      errorLight: Color(0xFFFFDAD6),
      errorDark: Color(0xFFF2B8B5),
      warning: Color(0xFFFABF2C),
      warningLight: Color(0xFFFFE270),
      warningDark: Color(0xFFDDA60A),
      success: Color(0xFF4DD865),
      successLight: Color(0xFF88F999),
      successDark: Color(0xFF1BB434),
      info: Color(0xFF5DBAFF),
      infoLight: Color(0xFF9CCCFF),
      infoDark: Color(0xFF4285F4),
      background: Color(0xFF1C1B1F),   // Surface tint dark
      surface: Color(0xFF1C1B1F),
      surfaceVariant: Color(0xFF49454F),
      onPrimary: Color(0xFF371E73),
      onSecondary: Color(0xFF4A4458),
      onSurface: Color(0xFFE6E1E5),
      outline: Color(0xFF938F99),
    ),
    style: ThemeStyle(
      componentStyle: ThemeStyleType.tonal,
      borderRadius: BorderRadiusLevel.rounded,
      elevation: ElevationLevel.medium,
      hasGradients: true,
      isDynamic: true, // Característica especial
    ),
    useCases: [
      'Android apps nativas',
      'Material Design 3',
      'Personalización adaptativa',
      'Apps modernas',
      'Google ecosystem',
    ],
    metadata: ThemeMetadata(
      accessibilityOptimized: true,
      darkModeOptimized: true,
      minContrastRatio: 4.5,
      targetDevices: ['mobile', 'tablet', 'desktop'],
      targetAudience: ['android-users', 'material-design', 'modern'],
      inspiration: 'Material Design 3 + Dynamic theming',
      trendTags: ['material3', 'adaptive', 'dynamic', 'personal'],
    ),
  );

  // ==========================================================================
  // Utilidades para manejo de temas
  // ==========================================================================

  /// Lista de todos los temas corporativos
  static const List<ThemePreset> corporateThemes = [
    corporateBlue,
    executiveDark,
    trustGreen,
    enterpriseGray,
  ];

  /// Lista de todos los temas modernos/trendy
  static const List<ThemePreset> modernThemes = [
    neonCyber,
    gradientSunset,
    glassMorphism,
    boldBrutalist,
  ];

  /// Lista de todos los temas específicos de industria
  static const List<ThemePreset> industryThemes = [
    mobilityHub,
    healthCare,
    fintechPro,
    retailPop,
  ];

  /// Lista de todos los temas emocionales/mood
  static const List<ThemePreset> moodThemes = [
    calmZen,
    energyBoost,
    darkFocus,
    playfulKids,
  ];

  /// Lista de todos los temas especiales
  static const List<ThemePreset> specialThemes = [
    accessibilityHigh,
    monochromeInk,
    retroTerminal,
    materialYou,
  ];

  /// Lista completa de todos los 20 temas predefinidos
  static const List<ThemePreset> allThemes = [
    // Corporativos (4)
    ...corporateThemes,
    // Modernos (4)
    ...modernThemes,
    // Industria (4)
    ...industryThemes,
    // Emocionales (4)
    ...moodThemes,
    // Especiales (4)
    ...specialThemes,
  ];

  /// Obtiene un tema por su ID
  static ThemePreset? getById(String id) {
    try {
      return allThemes.firstWhere((theme) => theme.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Obtiene temas por categoría
  static List<ThemePreset> getByCategory(ThemeCategory category) {
    return allThemes.where((theme) => theme.category == category).toList();
  }

  /// Obtiene temas por audiencia objetivo
  static List<ThemePreset> getByAudience(String audience) {
    return allThemes
        .where((theme) => theme.isTargetFor(audience))
        .toList();
  }

  /// Obtiene temas que soportan un dispositivo específico
  static List<ThemePreset> getByDevice(String device) {
    return allThemes
        .where((theme) => theme.supportsDevice(device))
        .toList();
  }

  /// Obtiene temas optimizados para accesibilidad
  static List<ThemePreset> getAccessibilityOptimized() {
    return allThemes
        .where((theme) => theme.metadata.accessibilityOptimized)
        .toList();
  }

  /// Obtiene temas optimizados para dark mode
  static List<ThemePreset> getDarkModeOptimized() {
    return allThemes
        .where((theme) => theme.metadata.darkModeOptimized)
        .toList();
  }

  /// Obtiene temas por tag de tendencia
  static List<ThemePreset> getByTrendTag(String tag) {
    return allThemes
        .where((theme) => theme.metadata.trendTags.contains(tag))
        .toList();
  }

  /// Obtiene temas con contraste mínimo específico
  static List<ThemePreset> getByMinContrast(double minRatio) {
    return allThemes
        .where((theme) => theme.metadata.minContrastRatio >= minRatio)
        .toList();
  }

  /// Obtiene temas que soportan gradientes
  static List<ThemePreset> getWithGradients() {
    return allThemes
        .where((theme) => theme.style.hasGradients)
        .toList();
  }

  /// Obtiene temas dinámicos (como Material You)
  static List<ThemePreset> getDynamicThemes() {
    return allThemes
        .where((theme) => theme.style.isDynamic == true)
        .toList();
  }

  /// Obtiene estadísticas de los temas
  static Map<String, int> getThemeStats() {
    return {
      'total': allThemes.length,
      'corporate': corporateThemes.length,
      'modern': modernThemes.length,
      'industry': industryThemes.length,
      'mood': moodThemes.length,
      'special': specialThemes.length,
      'accessibility_optimized': getAccessibilityOptimized().length,
      'dark_mode_optimized': getDarkModeOptimized().length,
      'with_gradients': getWithGradients().length,
      'dynamic': getDynamicThemes().length,
    };
  }
}