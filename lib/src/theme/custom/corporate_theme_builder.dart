import 'package:flutter/material.dart';
import 'corporate_palette.dart';
import 'color_variants_generator.dart';
import 'custom_theme_validator.dart';
import 'corporate_color_extensions.dart';

/// Constructor de temas corporativos con Material 3
class CorporateThemeBuilder {
  /// Construye un tema completo a partir de una paleta corporativa
  static CorporateThemeResult buildFromPalette(
    CorporatePalette palette,
  ) {
    final stopwatch = Stopwatch()..start();
    final warnings = <String>[];

    try {
      // Generar variantes de colores si no existen
      final processedPalette = _generateVariantsIfNeeded(palette);

      // Validar paleta
      final validationResults = CustomThemeValidator.validateCorporatePalette(processedPalette);
      final failedValidations = validationResults.where((r) => !r.isValid).toList();

      if (failedValidations.isNotEmpty) {
        warnings.addAll(failedValidations.map((r) => r.message));
      }

      // Construir temas
      final lightTheme = _buildLightTheme(processedPalette);
      final darkTheme = _buildDarkTheme(processedPalette);

      stopwatch.stop();

      return CorporateThemeResult(
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        palette: processedPalette,
        warnings: warnings,
        generationTime: stopwatch.elapsedMilliseconds,
        metadata: {
          'builder_version': '1.0.0',
          'material_version': '3.0',
          'validation_passed': failedValidations.isEmpty,
          'colors_generated': processedPalette.generatedVariants?.length ?? 0,
        },
      );
    } catch (e) {
      stopwatch.stop();
      warnings.add('Error durante la generación: $e');

      return CorporateThemeResult(
        lightTheme: _buildFallbackTheme(Brightness.light),
        darkTheme: _buildFallbackTheme(Brightness.dark),
        palette: palette,
        warnings: warnings,
        generationTime: stopwatch.elapsedMilliseconds,
      );
    }
  }

  /// Genera variantes si no existen en la paleta
  static CorporatePalette _generateVariantsIfNeeded(CorporatePalette palette) {
    if (palette.generatedVariants != null &&
        palette.contrastValidation != null) {
      return palette;
    }

    final variants = <String, Map<int, Color>>{};
    final contrastValidation = <String, bool>{};

    // Generar variantes para color primario
    variants['primary'] = palette.config.autoGenerateVariants
        ? ColorVariantsGenerator.generateVariants(
            palette.primary,
            preserveSaturation: palette.config.preserveSaturation,
            variantFactor: palette.config.variantFactor,
          )
        : {500: palette.primary};

    // Generar variantes para color secundario
    variants['secondary'] = palette.config.autoGenerateVariants
        ? ColorVariantsGenerator.generateVariants(
            palette.secondary,
            preserveSaturation: palette.config.preserveSaturation,
            variantFactor: palette.config.variantFactor,
          )
        : {500: palette.secondary};

    // Generar variantes para otros colores si existen
    if (palette.accent != null) {
      variants['accent'] = palette.config.autoGenerateVariants
          ? ColorVariantsGenerator.generateVariants(palette.accent!)
          : {500: palette.accent!};
    }

    if (palette.neutral != null) {
      variants['neutral'] = palette.config.autoGenerateVariants
          ? ColorVariantsGenerator.generateVariants(palette.neutral!)
          : {500: palette.neutral!};
    }

    // Validar contraste si está habilitado
    if (palette.config.validateContrast) {
      final requiredContrast = palette.config.contrastLevel == ContrastLevel.aaa ? 7.0 : 4.5;

      for (final entry in variants.entries) {
        final colorName = entry.key;
        final colorVariants = entry.value;

        // Validar que el color 500 tenga contraste adecuado
        final baseColor = colorVariants[500]!;
        final contrastWithWhite = baseColor.contrastWith(Colors.white);
        final contrastWithBlack = baseColor.contrastWith(Colors.black);

        contrastValidation[colorName] =
            contrastWithWhite >= requiredContrast ||
            contrastWithBlack >= requiredContrast;
      }
    }

    return palette.copyWith(
      generatedVariants: variants,
      contrastValidation: contrastValidation,
    );
  }

  /// Construye tema light
  static ThemeData _buildLightTheme(CorporatePalette palette) {
    final colorScheme = _buildLightColorScheme(palette);
    return _buildThemeData(colorScheme, palette, Brightness.light);
  }

  /// Construye tema dark
  static ThemeData _buildDarkTheme(CorporatePalette palette) {
    final colorScheme = _buildDarkColorScheme(palette);
    return _buildThemeData(colorScheme, palette, Brightness.dark);
  }

  /// Construye ColorScheme para light mode
  static ColorScheme _buildLightColorScheme(CorporatePalette palette) {
    final primaryVariants = palette.generatedVariants!['primary']!;
    final secondaryVariants = palette.generatedVariants!['secondary']!;

    return ColorScheme.light(
      primary: primaryVariants[500]!,
      onPrimary: primaryVariants[500]!.bestTextColor,
      primaryContainer: primaryVariants[100]!,
      onPrimaryContainer: primaryVariants[900]!,

      secondary: secondaryVariants[500]!,
      onSecondary: secondaryVariants[500]!.bestTextColor,
      secondaryContainer: secondaryVariants[100]!,
      onSecondaryContainer: secondaryVariants[900]!,

      tertiary: palette.accent ?? _generateTertiaryColor(palette.primary),
      onTertiary: (palette.accent ?? _generateTertiaryColor(palette.primary)).bestTextColor,
      tertiaryContainer: (palette.accent ?? _generateTertiaryColor(palette.primary)).lighten(0.8),
      onTertiaryContainer: (palette.accent ?? _generateTertiaryColor(palette.primary)).darken(0.6),

      error: palette.effectiveError,
      onError: palette.effectiveError.bestTextColor,
      errorContainer: palette.effectiveError.lighten(0.8),
      onErrorContainer: palette.effectiveError.darken(0.6),

      surface: Colors.white,
      onSurface: const Color(0xFF1C1B1F),
      surfaceContainerLowest: const Color(0xFFFFFFFF),
      surfaceContainerLow: const Color(0xFFF7F2FA),
      surfaceContainer: const Color(0xFFF3EDF7),
      surfaceContainerHigh: const Color(0xFFECE6F0),
      surfaceContainerHighest: const Color(0xFFE6E0E9),

      onSurfaceVariant: const Color(0xFF49454F),
      outline: const Color(0xFF79747E),
      outlineVariant: const Color(0xFFCAC4D0),

      shadow: Colors.black,
      scrim: Colors.black,

      inverseSurface: const Color(0xFF313033),
      onInverseSurface: const Color(0xFFF4EFF4),
      inversePrimary: primaryVariants[200]!,
    );
  }

  /// Construye ColorScheme para dark mode
  static ColorScheme _buildDarkColorScheme(CorporatePalette palette) {
    // Para dark mode, usamos variantes optimizadas
    final primaryDarkVariants = palette.config.smartDarkMode
        ? ColorVariantsGenerator.generateDarkModeVariants(palette.primary)
        : palette.generatedVariants!['primary']!;

    final secondaryDarkVariants = palette.config.smartDarkMode
        ? ColorVariantsGenerator.generateDarkModeVariants(palette.secondary)
        : palette.generatedVariants!['secondary']!;

    return ColorScheme.dark(
      primary: primaryDarkVariants[300]!,
      onPrimary: primaryDarkVariants[900]!,
      primaryContainer: primaryDarkVariants[700]!,
      onPrimaryContainer: primaryDarkVariants[100]!,

      secondary: secondaryDarkVariants[300]!,
      onSecondary: secondaryDarkVariants[900]!,
      secondaryContainer: secondaryDarkVariants[700]!,
      onSecondaryContainer: secondaryDarkVariants[100]!,

      tertiary: (palette.accent ?? _generateTertiaryColor(palette.primary)).lighten(0.2),
      onTertiary: (palette.accent ?? _generateTertiaryColor(palette.primary)).darken(0.8),
      tertiaryContainer: (palette.accent ?? _generateTertiaryColor(palette.primary)).darken(0.3),
      onTertiaryContainer: (palette.accent ?? _generateTertiaryColor(palette.primary)).lighten(0.6),

      error: palette.effectiveError.lighten(0.2),
      onError: palette.effectiveError.darken(0.8),
      errorContainer: palette.effectiveError.darken(0.3),
      onErrorContainer: palette.effectiveError.lighten(0.6),

      surface: const Color(0xFF1C1B1F),
      onSurface: const Color(0xFFE6E0E9),
      surfaceContainerLowest: const Color(0xFF0F0D13),
      surfaceContainerLow: const Color(0xFF1D1B20),
      surfaceContainer: const Color(0xFF211F26),
      surfaceContainerHigh: const Color(0xFF2B2930),
      surfaceContainerHighest: const Color(0xFF36343B),

      onSurfaceVariant: const Color(0xFFCAC4D0),
      outline: const Color(0xFF938F99),
      outlineVariant: const Color(0xFF49454F),

      shadow: Colors.black,
      scrim: Colors.black,

      inverseSurface: const Color(0xFFE6E0E9),
      onInverseSurface: const Color(0xFF313033),
      inversePrimary: primaryDarkVariants[600]!,
    );
  }

  /// Construye ThemeData completo
  static ThemeData _buildThemeData(
    ColorScheme colorScheme,
    CorporatePalette palette,
    Brightness brightness,
  ) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: brightness,

      // Configuración de fuentes
      fontFamily: 'Inter',

      // AppBar
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 3,
        surfaceTintColor: colorScheme.surfaceContainerHighest,
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Botones
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        elevation: isDark ? 2 : 1,
        color: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),

      // Chips
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        deleteIconColor: colorScheme.onSurfaceVariant,
        disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
        selectedColor: colorScheme.secondaryContainer,
        secondarySelectedColor: colorScheme.secondaryContainer,
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        secondaryLabelStyle: TextStyle(color: colorScheme.onSecondaryContainer),
        brightness: brightness,
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Lista de elementos
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.transparent,
        selectedTileColor: colorScheme.primaryContainer,
        iconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
      ),

      // Sliders
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.surfaceContainerHighest,
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.12),
        valueIndicatorColor: colorScheme.primary,
        valueIndicatorTextStyle: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),

      // Switches
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.surfaceContainerHighest;
        }),
      ),

      // Progress indicators
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
        circularTrackColor: colorScheme.surfaceContainerHighest,
      ),

      // Dialogs
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? colorScheme.surface : colorScheme.inverseSurface,
        contentTextStyle: TextStyle(
          color: isDark ? colorScheme.onSurface : colorScheme.onInverseSurface,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// Genera color terciario basado en el primario
  static Color _generateTertiaryColor(Color primary) {
    return primary.rotateHue(120); // Triádico
  }

  /// Construye tema de fallback en caso de error
  static ThemeData _buildFallbackTheme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: brightness == Brightness.light
          ? const ColorScheme.light()
          : const ColorScheme.dark(),
    );
  }
}