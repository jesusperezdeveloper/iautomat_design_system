import 'package:flutter/material.dart';
import 'colors.dart';

/// Sistema tipográfico completo para el Design System de IAutomat
///
/// Basado en Material Design 3 guidelines con la fuente Inter como principal
/// y fallbacks del sistema para garantizar compatibilidad universal.
///
/// El sistema incluye:
/// - Headers (h1-h6) para jerarquías de contenido
/// - Body text para contenido principal
/// - Labels para formularios y UI elements
/// - Estilos especiales para casos espec�ficos
///
/// Todos los estilos est�n optimizados para:
/// - Legibilidad en diferentes dispositivos
/// - Accesibilidad (contraste, tama�os m�nimos)
/// - Consistencia visual
/// - Performance (cached TextStyles)
class AppTypography {
  AppTypography._();

  // ==========================================================================
  // CONFIGURACI�N BASE
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
  // UTILIDADES DE TIPOGRAFÍA
  // ==========================================================================

  /// Ajusta un TextStyle para una pantalla de cierto ancho
  static TextStyle getResponsiveTextStyle(
      TextStyle baseStyle, double screenWidth) {
    // Factor de escala basado en el ancho de pantalla
    // Para móvil (< 768): escalar hacia abajo
    // Para desktop (>= 768): mantener o escalar hacia arriba
    late double scaleFactor;
    if (screenWidth < 768) {
      // Móvil: reducir tamaño
      scaleFactor = (screenWidth / 768).clamp(0.8, 1.0);
    } else {
      // Desktop: mantener o incrementar ligeramente
      scaleFactor = (screenWidth / 768).clamp(1.0, 1.2);
    }
    return baseStyle.copyWith(
      fontSize: baseStyle.fontSize! * scaleFactor,
      height: baseStyle.height,
    );
  }

  /// Modifica el peso de una fuente manteniendo sus otras propiedades
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Modifica el tamaño de una fuente manteniendo sus otras propiedades
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  // ==========================================================================
  // HEADERS - Para títulos y jerarquías de contenido
  // ==========================================================================

  /// Header 1 - T�tulo principal de p�gina
  ///
  /// Uso: T�tulos principales, headlines importantes, hero sections
  /// Tama�o: 48px | Peso: 700 (Bold) | Line Height: 1.2
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.02,
    color: AppColors.textPrimary,
  );

  /// Header 2 - T�tulo secundario
  ///
  /// Uso: Subt�tulos importantes, secciones principales
  /// Tama�o: 40px | Peso: 700 (Bold) | Line Height: 1.25
  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.02,
  );

  /// Header 3 - T�tulo de secci�n
  ///
  /// Uso: T�tulos de secci�n, cards importantes, modales
  /// Tama�o: 32px | Peso: 600 (SemiBold) | Line Height: 1.3
  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.01,
  );

  /// Header 4 - Subt�tulo de secci�n
  ///
  /// Uso: Subt�tulos de secci�n, t�tulos de cards, headers de tabla
  /// Tama�o: 28px | Peso: 600 (SemiBold) | Line Height: 1.35
  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: -0.01,
  );

  /// Header 5 - T�tulo menor
  ///
  /// Uso: T�tulos de subsecciones, labels importantes, breadcrumbs
  /// Tama�o: 24px | Peso: 600 (SemiBold) | Line Height: 1.4
  static const TextStyle h5 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Header 6 - T�tulo m�nimo
  ///
  /// Uso: Subt�tulos menores, labels de grupos, headers de listas
  /// Tama�o: 20px | Peso: 600 (SemiBold) | Line Height: 1.45
  static const TextStyle h6 = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
  );

  // ==========================================================================
  // BODY TEXT - Para contenido principal
  // ==========================================================================

  /// Body Large - Texto principal destacado
  ///
  /// Uso: P�rrafos principales, contenido importante, introducciones
  /// Tama�o: 18px | Peso: 400 (Regular) | Line Height: 1.6
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.55,
    letterSpacing: 0,
  );

  /// Body Medium - Texto principal est�ndar
  ///
  /// Uso: P�rrafos normales, descripciones, contenido general
  /// Tama�o: 16px | Peso: 400 (Regular) | Line Height: 1.5
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  /// Body Small - Texto secundario
  ///
  /// Uso: Texto secundario, notas, metadatos, fechas
  /// Tama�o: 14px | Peso: 400 (Regular) | Line Height: 1.5
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0,
  );

  // ==========================================================================
  // LABELS - Para formularios y elementos UI
  // ==========================================================================

  /// Label Large - Etiquetas principales
  ///
  /// Uso: Labels de formularios principales, t�tulos de inputs
  /// Tama�o: 16px | Peso: 500 (Medium) | Line Height: 1.4
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.01,
    color: AppColors.textPrimary,
  );

  /// Label Medium - Etiquetas est�ndar
  ///
  /// Uso: Labels de formularios, navegaci�n, tabs
  /// Tama�o: 14px | Peso: 500 (Medium) | Line Height: 1.4
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.01,
  );

  /// Label Small - Etiquetas menores
  ///
  /// Uso: Labels secundarios, hints, validaciones
  /// Tama�o: 12px | Peso: 500 (Medium) | Line Height: 1.35
  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0.02,
  );

  // ==========================================================================
  // ESTILOS ESPECIALES - Para casos espec�ficos
  // ==========================================================================

  /// Button - Texto para botones
  ///
  /// Uso: Texto de botones, CTAs, elementos interactivos
  /// Tama�o: 14px | Peso: 600 (SemiBold) | Line Height: 1.2
  /// Letter spacing optimizado para legibilidad en elementos peque�os
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0.02,
  );

  /// Caption - Texto de apoyo
  ///
  /// Uso: Pie de im�genes, metadatos, informaci�n adicional
  /// Tama�o: 12px | Peso: 400 (Regular) | Line Height: 1.35
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.01,
  );

  /// Overline - Texto superior
  ///
  /// Uso: Categor�as, secciones, headers de grupos, breadcrumbs
  /// Tama�o: 11px | Peso: 600 (SemiBold) | Line Height: 1.3
  /// Todo en may�sculas para mejor jerarqu�a visual
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontFamilyFallback: _fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0.08,
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
  // M�TODOS HELPER PARA COLORES PERSONALIZADOS
  // ==========================================================================

  /// Aplica un color personalizado a un estilo tipogr�fico
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
  /// Combina dos TextStyles, donde el segundo tiene precedencia
  ///
  /// [base] El TextStyle base
  /// [override] El TextStyle que sobrescribe las propiedades del base
  ///
  /// Retorna un nuevo TextStyle con las propiedades combinadas.
  /// Las propiedades del [override] tienen precedencia sobre las del [base].
  static TextStyle merge(TextStyle base, TextStyle override) {
    return base.merge(override);
  }

  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Aplica opacidad a un estilo tipogr�fico
  ///
  /// [style] El TextStyle base
  /// [opacity] La opacidad deseada (0.0 - 1.0)
  ///
  /// Retorna una copia del TextStyle con la opacidad aplicada.
  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(
      color: (style.color ?? const Color(0xFF000000)).withValues(alpha: opacity),
    );
  }

  /// Crea una variante del estilo con decoraci�n personalizada
  ///
  /// [style] El TextStyle base
  /// [decoration] La decoraci�n a aplicar (underline, lineThrough, etc.)
  /// [decorationColor] Color opcional para la decoraci�n
  ///
  /// �til para links, texto tachado, etc.
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
  // ESTILOS TEM�TICOS PREDEFINIDOS
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

  /// Texto para �xito - color verde con medium weight
  static TextStyle success(Color successColor) => withColor(
        medium(bodySmall),
        successColor,
      );

  /// Texto para advertencias - color amarillo con medium weight
  static TextStyle warning(Color warningColor) => withColor(
        medium(bodySmall),
        warningColor,
      );

  /// Texto para informaci�n - color azul con medium weight
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
  /// �til para hacer texto responsive en diferentes dispositivos.
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
  // ESTILOS CON COLORES ESPECÍFICOS
  // ==========================================================================

  /// Body Small con color secundario
  static TextStyle get bodySmallSecondary => bodySmall.copyWith(
        color: AppColors.textSecondary,
      );

  /// Caption con color secundario
  static TextStyle get captionSecondary => caption.copyWith(
        color: AppColors.textSecondary,
      );

  /// Body Medium con color deshabilitado
  static TextStyle get bodyMediumDisabled => bodyMedium.copyWith(
        color: AppColors.textDisabled,
      );

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

  /// Altura de l�nea base para c�lculos
  static const double defaultLineHeight = _baseLineHeight;

  /// Lista de font families para uso program�tico
  static const List<String> fontFamilies = _fontFamilyFallback;

  /// Font family base como string para tests
  static const String baseFontFamily = _fontFamily;

  /// Font weights disponibles en el sistema
  static const Map<String, FontWeight> fontWeights = {
    'regular': FontWeight.w400,
    'medium': FontWeight.w500,
    'semibold': FontWeight.w600,
    'bold': FontWeight.w700,
  };

  /// Tama�os de fuente base para diferentes categor�as
  static const Map<String, double> baseSizes = {
    'display': 48,
    'headline': 32,
    'title': 24,
    'body': 16,
    'label': 14,
    'caption': 12,
  };
}
