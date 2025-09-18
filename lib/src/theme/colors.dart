import 'package:flutter/material.dart';

/// Sistema de colores completo para el Design System de IAutomat
///
/// Incluye colores primarios, secundarios, semánticos, escala de grises
/// y variantes para dark mode. Basado en Material Design 3 guidelines.
///
/// Colores base de IAutomat:
/// - Primary: Azul profesional (#2563EB) - representa confianza y profesionalismo
/// - Secondary: Púrpura innovación (#7C3AED) - representa creatividad e innovación
/// - Success: Verde (#10B981) - para estados exitosos
/// - Warning: Amarillo (#F59E0B) - para advertencias
/// - Error: Rojo (#EF4444) - para errores
/// - Info: Azul claro (#3B82F6) - para informaci�n
class AppColors {
  AppColors._();

  // ==========================================================================
  // COLORES PRIMARIOS - Azul profesional de IAutomat
  // ==========================================================================

  /// Color primario principal de IAutomat - Azul profesional
  ///
  /// Usado para botones principales, enlaces, elementos de marca y acciones primarias.
  /// Este color representa la confianza y profesionalismo de IAutomat.
  static const Color primary = Color(0xFF2563EB);

  /// Variante clara del color primario para modo oscuro
  static const Color primaryLightDarkMode = Color(0xFF93C5FD);

  /// Variante oscura del color primario para modo oscuro
  static const Color primaryDarkDarkMode = Color(0xFF3B82F6);

  /// Color secundario claro para modo oscuro
  static const Color secondaryLightDarkMode = Color(0xFFC084FC);

  /// Color secundario oscuro para modo oscuro
  static const Color secondaryDarkDarkMode = Color(0xFF8B5CF6);

  /// Color de superficie para contenedores
  static const Color surfaceContainer = Color(0xFFF5F5F5);

  /// Color de superficie para contenedores con alto contraste
  static const Color surfaceContainerHigh = Color(0xFFE5E5E5);

  /// Color de superficie para modo oscuro
  static const Color surfaceDark = Color(0xFF111827);

  /// Variante del color de superficie para modo oscuro
  static const Color surfaceVariantDark = Color(0xFF1F2937);

  /// Color de superficie para contenedores en modo oscuro
  static const Color surfaceContainerDark = Color(0xFF374151);

  /// Color de superficie para contenedores de alto contraste en modo oscuro
  static const Color surfaceContainerHighDark = Color(0xFF4B5563);

  /// Color de texto primario en modo oscuro
  static const Color textPrimaryDark = Color(0xFFFFFFFF);

  /// Color de línea/contorno
  static const Color outline = Color(0xFF79747E);

  /// Aclara un color en un porcentaje dado
  static Color lighten(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Oscurece un color en un porcentaje dado
  static Color darken(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Obtiene el color de texto que mejor contrasta con un color de fondo
  static Color getContrastingTextColor(Color backgroundColor) {
    final relativeLuminance = backgroundColor.computeLuminance();
    return relativeLuminance > 0.5 ? Colors.black : Colors.white;
  }

  /// Determina si un color es claro basado en su luminancia
  static bool isLight(Color color) {
    return color.computeLuminance() > 0.5;
  }

  /// Determina si un color es oscuro basado en su luminancia
  static bool isDark(Color color) {
    return color.computeLuminance() <= 0.5;
  }

  /// Variante clara del color primario
  ///
  /// Usado para backgrounds suaves, hover states y elementos secundarios.
  static const Color primaryLight = Color(0xFF60A5FA);

  /// Variante m�s clara del color primario
  ///
  /// Usado para backgrounds muy suaves y elementos de apoyo.
  static const Color primaryLighter = Color(0xFF93C5FD);

  /// Variante oscura del color primario
  ///
  /// Usado para pressed states, elementos de �nfasis y contrastes altos.
  static const Color primaryDark = Color(0xFF1D4ED8);

  /// Variante m�s oscura del color primario
  ///
  /// Usado para elementos de m�ximo contraste y estados activos.
  static const Color primaryDarker = Color(0xFF1E40AF);

  // ==========================================================================
  // COLORES SECUNDARIOS - P�rpura innovaci�n
  // ==========================================================================

  /// Color secundario principal - P�rpura innovaci�n
  ///
  /// Usado para elementos de apoyo, ilustraciones y detalles creativos.
  /// Representa la innovaci�n y creatividad de IAutomat.
  /// Ajustado para mejor contraste con el color primario (> 1.5)
  static const Color secondary = Color(0xFFE879F9);

  /// Variante clara del color secundario
  static const Color secondaryLight = Color(0xFFF0ABFC);

  /// Variante m�s clara del color secundario
  static const Color secondaryLighter = Color(0xFFFAE8FF);

  /// Variante oscura del color secundario
  static const Color secondaryDark = Color(0xFFD946EF);

  /// Variante m�s oscura del color secundario
  static const Color secondaryDarker = Color(0xFFC026D3);

  // ==========================================================================
  // COLORES SEM�NTICOS - Para comunicar estados y acciones
  // ==========================================================================

  /// Color para estados exitosos y confirmaciones positivas
  ///
  /// Usado en mensajes de �xito, iconos de confirmaci�n,
  /// botones de acciones exitosas y elementos de progreso completado.
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);
  static const Color successDark = Color(0xFF059669);

  /// Color para advertencias y alertas importantes
  ///
  /// Usado en mensajes de advertencia, elementos que requieren atenci�n
  /// y estados de precauci�n.
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);
  static const Color warningDark = Color(0xFFD97706);

  /// Color para errores y estados destructivos
  ///
  /// Usado en mensajes de error, validaciones fallidas,
  /// botones destructivos y elementos de peligro.
  /// Ajustado para cumplir WCAG 2.0 AA (contraste >= 4.5 con fondo blanco)
  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFF87171);
  static const Color errorDark = Color(0xFFB91C1C);

  /// Color para informaci�n y elementos informativos
  ///
  /// Usado en mensajes informativos, tooltips,
  /// elementos de ayuda y contenido explicativo.
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFF60A5FA);
  static const Color infoDark = Color(0xFF2563EB);

  // ==========================================================================
  // ESCALA DE GRISES - Para textos, backgrounds y elementos neutros
  // ==========================================================================

  /// Gris m�s claro - backgrounds muy suaves
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray50 = Color(0xFFFAFAFA);

  /// Gris claro - backgrounds suaves, divisores sutiles
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray100 = Color(0xFFF5F5F5);

  /// Gris claro medio - backgrounds de secci�n, cards suaves
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray200 = Color(0xFFE5E5E5);

  /// Gris medio claro - bordes, divisores, placeholders
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray300 = Color(0xFFD4D4D4);

  /// Gris medio - bordes activos, iconos secundarios
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray400 = Color(0xFFA3A3A3);

  /// Gris medio oscuro - texto secundario, iconos
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray500 = Color(0xFF737373);

  /// Gris oscuro medio - texto terciario, etiquetas
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray600 = Color(0xFF525252);

  /// Gris oscuro - texto secundario en light mode
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray700 = Color(0xFF404040);

  /// Gris muy oscuro - texto principal en light mode
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray800 = Color(0xFF262626);

  /// Gris m�s oscuro - headers, elementos de m�ximo contraste
  /// Ajustado para ser verdaderamente neutral (saturaci�n < 0.1)
  static const Color gray900 = Color(0xFF171717);

  // ==========================================================================
  // COLORES PARA DARK MODE
  // ==========================================================================

  /// Color primario adaptado para dark mode
  ///
  /// Versi�n m�s clara y vibrante del primary para mantener
  /// buena legibilidad sobre fondos oscuros.
  static const Color primaryDarkMode = Color(0xFF60A5FA);

  /// Color secundario adaptado para dark mode
  static const Color secondaryDarkMode = Color(0xFFE879F9);

  /// Colores sem�nticos para dark mode - m�s vibrantes
  static const Color successDarkMode = Color(0xFF34D399);
  static const Color warningDarkMode = Color(0xFFFBBF24);
  static const Color errorDarkMode = Color(0xFFF87171);
  static const Color infoDarkMode = Color(0xFF60A5FA);

  /// Background principal para dark mode
  static const Color backgroundDarkMode = Color(0xFF0F172A);

  /// Background secundario para dark mode (cards, modales)
  static const Color backgroundSecondaryDarkMode = Color(0xFF1E293B);

  /// Background terciario para dark mode (sections, inputs)
  static const Color backgroundTertiaryDarkMode = Color(0xFF334155);

  /// Texto principal para dark mode
  static const Color textPrimaryDarkMode = Color(0xFFF8FAFC);

  /// Texto secundario para dark mode
  static const Color textSecondaryDarkMode = Color(0xFFCBD5E1);

  /// Texto terciario para dark mode
  static const Color textTertiaryDarkMode = Color(0xFF94A3B8);

  // ==========================================================================
  // COLORES DE SUPERFICIE Y BACKGROUND
  // ==========================================================================

  /// Background principal de la aplicaci�n
  static const Color background = Color(0xFFFFFFFF);

  /// Background para surfaces (cards, sheets, modals)
  static const Color surface = Color(0xFFFFFFFF);

  /// Background alternativo para secciones
  static const Color surfaceVariant = gray50;

  /// Color para overlays y m�scaras
  static const Color overlay = Color(0x80000000);

  /// Color para divisores y bordes sutiles
  static const Color divider = gray200;

  /// Color para sombras
  static const Color shadow = Color(0x1A000000);

  // ==========================================================================
  // COLORES DE TEXTO
  // ==========================================================================

  /// Texto principal - m�ximo contraste
  static const Color textPrimary = gray900;

  /// Texto secundario - medio contraste
  static const Color textSecondary = gray600;

  /// Texto terciario - bajo contraste
  static const Color textTertiary = gray500;

  /// Texto sobre fondos de color (botones, chips)
  static const Color textOnColor = Color(0xFFFFFFFF);

  /// Texto deshabilitado
  static const Color textDisabled = gray400;

  // ==========================================================================
  // M�TODOS UTILITARIOS
  // ==========================================================================

  /// Genera un MaterialColor a partir de un Color base
  ///
  /// �til para crear swatches personalizados que Flutter puede usar
  /// en temas y componentes que requieren MaterialColor.
  ///
  /// [color] El color base del cual generar el MaterialColor
  ///
  /// Retorna un MaterialColor con variantes autom�ticamente generadas.
  static MaterialColor createMaterialColor(Color color) {
    final List<double> strengths = <double>[
      .05,
      .1,
      .2,
      .3,
      .4,
      .5,
      .6,
      .7,
      .8,
      .9
    ];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = (color.r * 255.0).round() & 0xff;
    final int g = (color.g * 255.0).round() & 0xff;
    final int b = (color.b * 255.0).round() & 0xff;

    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.toARGB32(), swatch);
  }

  /// MaterialColor primario para uso en ThemeData
  static MaterialColor get primaryMaterial => createMaterialColor(primary);

  /// MaterialColor secundario para uso en ThemeData
  static MaterialColor get secondaryMaterial => createMaterialColor(secondary);

  /// Obtiene el color de texto apropiado para un background dado
  ///
  /// Calcula autom�ticamente si usar texto claro u oscuro
  /// basado en el contraste con el color de fondo.
  ///
  /// [backgroundColor] El color de fondo sobre el cual se mostrar� el texto
  ///
  /// Retorna [textOnColor] para fondos oscuros o [textPrimary] para fondos claros.
  static Color getTextColorForBackground(Color backgroundColor) {
    // Calcular luminancia del color de fondo
    final double luminance = backgroundColor.computeLuminance();

    // Si el fondo es oscuro (luminancia < 0.5), usar texto claro
    // Si el fondo es claro (luminancia >= 0.5), usar texto oscuro
    return luminance < 0.5 ? textOnColor : textPrimary;
  }

  /// Aplica opacidad a cualquier color
  ///
  /// [color] El color base
  /// [opacity] La opacidad deseada (0.0 - 1.0)
  ///
  /// Retorna el color con la opacidad aplicada.
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
}
