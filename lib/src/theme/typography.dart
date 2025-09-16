import 'package:flutter/material.dart';

/// Sistema tipográfico completo para el Design System de IAutomat
///
/// Basado en Material Design 3 guidelines con la fuente Inter como principal
/// y fallbacks del sistema para garantizar compatibilidad universal.
///
/// El sistema incluye:
/// - Headers (h1-h6) para jerarquías de contenido
/// - Body text para contenido principal
/// - Labels para formularios y UI elements
/// - Estilos especiales para casos específicos
///
/// Todos los estilos están optimizados para:
/// - Legibilidad en diferentes dispositivos
/// - Accesibilidad (contraste, tamaños mínimos)
/// - Consistencia visual
/// - Performance (cached TextStyles)
class AppTypography {
  AppTypography._();

  // ==========================================================================
  // CONFIGURACIÓN BASE
  // ==========================================================================

  /// Font family principal: Inter con fallbacks del sistema
  ///
  /// Inter es una fuente optimizada para interfaces digitales,
  /// con excelente legibilidad en pantalla y amplio soporte de caracteres.
  static const String _fontFamily = 'Inter';

  /// Fallback fonts para diferentes sistemas operativos
  static const List<String> _fontFamilyFallback = [
    'Inter',
    '-apple-system', // iOS/macOS
    'BlinkMacSystemFont', // macOS
    'Segoe UI', // Windows
    'Roboto', // Android
    'Ubuntu', // Linux
    'sans-serif', // Generic fallback
  ];

  /// Base line height para cálculos proporcionales
  static const double _baseLineHeight = 1.5;

  // ==========================================================================
  // HEADERS - Para títulos y jerarquías de contenido
  // ==========================================================================

  /// Header 1 - Título principal de página
  ///
  /// Uso: Títulos principales, headlines importantes, hero sections
  /// Tamaño: 48px | Peso: 700 (Bold) | Line Height: 1.2
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5, // Mejor legibilidad en tamaños grandes
  );

  /// Header 2 - Título secundario
  ///
  /// Uso: Subtítulos importantes, secciones principales
  /// Tamaño: 40px | Peso: 700 (Bold) | Line Height: 1.25
  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.25,
  );

  /// Header 3 - Título de sección
  ///
  /// Uso: Títulos de sección, cards importantes, modales
  /// Tamaño: 32px | Peso: 600 (SemiBold) | Line Height: 1.3
  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Header 4 - Subtítulo de sección
  ///
  /// Uso: Subtítulos de sección, títulos de cards, headers de tabla
  /// Tamaño: 28px | Peso: 600 (SemiBold) | Line Height: 1.35
  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
  );

  /// Header 5 - Título menor
  ///
  /// Uso: Títulos de subsecciones, labels importantes, breadcrumbs
  /// Tamaño: 24px | Peso: 600 (SemiBold) | Line Height: 1.4
  static const TextStyle h5 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Header 6 - Título mínimo
  ///
  /// Uso: Subtítulos menores, labels de grupos, headers de listas
  /// Tamaño: 20px | Peso: 600 (SemiBold) | Line Height: 1.45
  static const TextStyle h6 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.15,
  );

  // ==========================================================================
  // BODY TEXT - Para contenido principal
  // ==========================================================================

  /// Body Large - Texto principal destacado
  ///
  /// Uso: Párrafos principales, contenido importante, introducciones
  /// Tamaño: 18px | Peso: 400 (Regular) | Line Height: 1.6
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.15,
  );

  /// Body Medium - Texto principal estándar
  ///
  /// Uso: Párrafos normales, descripciones, contenido general
  /// Tamaño: 16px | Peso: 400 (Regular) | Line Height: 1.5
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.15,
  );

  /// Body Small - Texto secundario
  ///
  /// Uso: Texto secundario, notas, metadatos, fechas
  /// Tamaño: 14px | Peso: 400 (Regular) | Line Height: 1.5
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
  );

  // ==========================================================================
  // LABELS - Para formularios y elementos UI
  // ==========================================================================

  /// Label Large - Etiquetas principales
  ///
  /// Uso: Labels de formularios principales, títulos de inputs
  /// Tamaño: 16px | Peso: 500 (Medium) | Line Height: 1.4
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
  );

  /// Label Medium - Etiquetas estándar
  ///
  /// Uso: Labels de formularios, navegación, tabs
  /// Tamaño: 14px | Peso: 500 (Medium) | Line Height: 1.4
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
  );

  /// Label Small - Etiquetas menores
  ///
  /// Uso: Labels secundarios, hints, validaciones
  /// Tamaño: 12px | Peso: 500 (Medium) | Line Height: 1.35
  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0.4,
  );

  // ==========================================================================
  // ESTILOS ESPECIALES - Para casos específicos
  // ==========================================================================

  /// Button - Texto para botones
  ///
  /// Uso: Texto de botones, CTAs, elementos interactivos
  /// Tamaño: 14px | Peso: 600 (SemiBold) | Line Height: 1.2
  /// Letter spacing optimizado para legibilidad en elementos pequeños
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
  );

  /// Caption - Texto de apoyo
  ///
  /// Uso: Pie de imágenes, metadatos, información adicional
  /// Tamaño: 12px | Peso: 400 (Regular) | Line Height: 1.35
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.35,
    letterSpacing: 0.4,
  );

  /// Overline - Texto superior
  ///
  /// Uso: Categorías, secciones, headers de grupos, breadcrumbs
  /// Tamaño: 11px | Peso: 600 (SemiBold) | Line Height: 1.3
  /// Todo en mayúsculas para mejor jerarquía visual
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 1.5,
  );

  // ==========================================================================
  // VARIANTES CON PESO PERSONALIZADO
  // ==========================================================================

  /// Convierte cualquier TextStyle a Medium weight (500)
  static TextStyle medium(TextStyle style) => style.copyWith(
        fontWeight: FontWeight.w500,
      );

  /// Convierte cualquier TextStyle a SemiBold weight (600)
  static TextStyle semiBold(TextStyle style) => style.copyWith(
        fontWeight: FontWeight.w600,
      );

  /// Convierte cualquier TextStyle a Bold weight (700)
  static TextStyle bold(TextStyle style) => style.copyWith(
        fontWeight: FontWeight.w700,
      );

  // ==========================================================================
  // MÉTODOS HELPER PARA COLORES PERSONALIZADOS
  // ==========================================================================

  /// Aplica un color personalizado a un estilo tipográfico
  ///
  /// [style] El TextStyle base al cual aplicar el color
  /// [color] El color a aplicar
  ///
  /// Retorna una copia del TextStyle con el nuevo color aplicado.
  ///
  /// Ejemplo:
  /// ```dart
  /// Text(
  ///   'Texto con color',
  ///   style: AppTypography.withColor(AppTypography.h1, Colors.red),
  /// )
  /// ```
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Aplica opacidad a un estilo tipográfico
  ///
  /// [style] El TextStyle base
  /// [opacity] La opacidad deseada (0.0 - 1.0)
  ///
  /// Retorna una copia del TextStyle con la opacidad aplicada.
  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(
      color: (style.color ?? const Color(0xFF000000)).withOpacity(opacity),
    );
  }

  /// Crea una variante del estilo con decoración personalizada
  ///
  /// [style] El TextStyle base
  /// [decoration] La decoración a aplicar (underline, lineThrough, etc.)
  /// [decorationColor] Color opcional para la decoración
  ///
  /// Útil para links, texto tachado, etc.
  static TextStyle withDecoration(
    TextStyle style,
    TextDecoration decoration, {
    Color? decorationColor,
  }) {
    return style.copyWith(
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  // ==========================================================================
  // ESTILOS TEMÁTICOS PREDEFINIDOS
  // ==========================================================================

  /// Texto para links - incluye underline y color azul
  static TextStyle link(Color linkColor) => withDecoration(
        withColor(bodyMedium, linkColor),
        TextDecoration.underline,
        decorationColor: linkColor,
      );

  /// Texto para errores - color rojo con medium weight
  static TextStyle error(Color errorColor) => withColor(
        medium(bodySmall),
        errorColor,
      );

  /// Texto para éxito - color verde con medium weight
  static TextStyle success(Color successColor) => withColor(
        medium(bodySmall),
        successColor,
      );

  /// Texto para advertencias - color amarillo con medium weight
  static TextStyle warning(Color warningColor) => withColor(
        medium(bodySmall),
        warningColor,
      );

  /// Texto para información - color azul con medium weight
  static TextStyle info(Color infoColor) => withColor(
        medium(bodySmall),
        infoColor,
      );

  /// Texto muted - gris con opacidad reducida
  static TextStyle muted(Color textColor) => withOpacity(
        bodySmall,
        0.6,
      );

  // ==========================================================================
  // HELPERS PARA RESPONSIVE TEXT
  // ==========================================================================

  /// Escala un TextStyle basado en el factor proporcionado
  ///
  /// [style] El TextStyle base a escalar
  /// [scaleFactor] Factor de escalado (1.0 = sin cambios)
  ///
  /// Útil para hacer texto responsive en diferentes dispositivos.
  static TextStyle scale(TextStyle style, double scaleFactor) {
    return style.copyWith(
      fontSize: (style.fontSize ?? 16) * scaleFactor,
    );
  }

  /// Versiones escaladas de los headers para mobile
  static TextStyle get h1Mobile => scale(h1, 0.8);
  static TextStyle get h2Mobile => scale(h2, 0.85);
  static TextStyle get h3Mobile => scale(h3, 0.9);

  // ==========================================================================
  // MAPEO PARA MATERIAL THEME
  // ==========================================================================

  /// Mapea los estilos de AppTypography a Material Design TextTheme
  ///
  /// Esto permite usar los estilos personalizados dentro del ThemeData
  /// de Flutter manteniendo compatibilidad con widgets del framework.
  static TextTheme get textTheme => const TextTheme(
        // Display styles (headers)
        displayLarge: h1,
        displayMedium: h2,
        displaySmall: h3,

        // Headline styles
        headlineLarge: h1,
        headlineMedium: h2,
        headlineSmall: h3,

        // Title styles
        titleLarge: h4,
        titleMedium: h5,
        titleSmall: h6,

        // Body styles
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,

        // Label styles
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );

  // ==========================================================================
  // CONSTANTES DE UTILIDAD
  // ==========================================================================

  /// Altura de línea base para cálculos
  static const double defaultLineHeight = _baseLineHeight;

  /// Lista de font families para uso programático
  static const List<String> fontFamilies = _fontFamilyFallback;

  /// Font weights disponibles en el sistema
  static const Map<String, FontWeight> fontWeights = {
    'regular': FontWeight.w400,
    'medium': FontWeight.w500,
    'semibold': FontWeight.w600,
    'bold': FontWeight.w700,
  };

  /// Tamaños de fuente base para diferentes categorías
  static const Map<String, double> baseSizes = {
    'display': 48,
    'headline': 32,
    'title': 24,
    'body': 16,
    'label': 14,
    'caption': 12,
  };
}