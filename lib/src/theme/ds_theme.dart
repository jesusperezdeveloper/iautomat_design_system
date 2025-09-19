import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'typography.dart';
import 'spacing.dart';

/// Configuración completa del tema para el Design System de IAutomat
///
/// Implementa Material Design 3 con tokens personalizados del sistema.
/// Incluye configuraci�n completa para light y dark themes con:
/// - ColorScheme personalizado integrado con DSColors
/// - TextTheme basado en DSTypography
/// - Component themes para todos los widgets de Material
/// - Sistema de elevaci�n y sombras consistente
/// - Border radius system unificado
/// - Duraciones y curvas de animaci�n optimizadas
///
/// Uso:
/// ```dart
/// MaterialApp(
///   theme: DSTheme.lightTheme,
///   darkTheme: DSTheme.darkTheme,
/// )
/// ```
class DSTheme {
  DSTheme._();

  // ==========================================================================
  // BORDER RADIUS SYSTEM
  // ==========================================================================

  /// Radius extra small - Elementos muy peque�os (4px)
  static const BorderRadius radiusXs = BorderRadius.all(Radius.circular(4));

  /// Radius small - Elementos compactos (8px)
  static const BorderRadius radiusSm = BorderRadius.all(Radius.circular(8));

  /// Radius medium - Elementos est�ndar (12px)
  static const BorderRadius radiusMd = BorderRadius.all(Radius.circular(12));

  /// Radius large - Cards y contenedores (16px)
  static const BorderRadius radiusLg = BorderRadius.all(Radius.circular(16));

  /// Radius extra large - Elementos prominentes (20px)
  static const BorderRadius radiusXl = BorderRadius.all(Radius.circular(20));

  /// Radius circular completo - Botones, avatares
  static const BorderRadius radiusCircular =
      BorderRadius.all(Radius.circular(999));

  // ==========================================================================
  // SISTEMA DE ELEVACI�N
  // ==========================================================================

  /// Elevaci�n nivel 0 - Sin sombra
  static const List<BoxShadow> elevation0 = [];

  /// Elevaci�n nivel 1 - Elementos flotantes sutiles
  static const List<BoxShadow> elevation1 = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacidad
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000), // 10% opacidad
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
    ),
  ];

  /// Elevaci�n nivel 2 - Cards, botones elevados
  static const List<BoxShadow> elevation2 = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 1),
      blurRadius: 5,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
  ];

  /// Elevaci�n nivel 3 - Modales, men�s
  static const List<BoxShadow> elevation3 = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 6),
      blurRadius: 20,
      spreadRadius: 5,
    ),
  ];

  /// Elevaci�n nivel 4 - Navigation drawers, sheets
  static const List<BoxShadow> elevation4 = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 8),
      blurRadius: 12,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 12),
      blurRadius: 40,
      spreadRadius: 8,
    ),
  ];

  /// Elevaci�n nivel 5 - Di�logos, popovers principales
  static const List<BoxShadow> elevation5 = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 12),
      blurRadius: 16,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 24),
      blurRadius: 80,
      spreadRadius: 12,
    ),
  ];

  // ==========================================================================
  // DURACIONES Y CURVAS DE ANIMACI�N
  // ==========================================================================

  /// Duraci�n extra r�pida - Micro interacciones (100ms)
  static const Duration durationExtraFast = Duration(milliseconds: 100);

  /// Duraci�n r�pida - Hover states, ripples (200ms)
  static const Duration durationFast = Duration(milliseconds: 200);

  /// Duraci�n normal - Transiciones est�ndar (300ms)
  static const Duration durationNormal = Duration(milliseconds: 300);

  /// Duraci�n lenta - Animaciones complejas (500ms)
  static const Duration durationSlow = Duration(milliseconds: 500);

  /// Duraci�n extra lenta - Animaciones dram�ticas (800ms)
  static const Duration durationExtraSlow = Duration(milliseconds: 800);

  /// Curva est�ndar - Para la mayor�a de animaciones
  static const Curve curveStandard = Curves.easeInOut;

  /// Curva de entrada - Para elementos que aparecen
  static const Curve curveEnter = Curves.easeOut;

  /// Curva de salida - Para elementos que desaparecen
  static const Curve curveExit = Curves.easeIn;

  /// Curva dram�tica - Para animaciones de �nfasis
  static const Curve curveEmphasized = Curves.easeInOutCubic;

  // ==========================================================================
  // COLOR SCHEMES
  // ==========================================================================

  /// ColorScheme para light theme
  static ColorScheme get _lightColorScheme => ColorScheme.light(
        // Colores principales
        primary: DSColors.primary,
        onPrimary: DSColors.textOnColor,
        primaryContainer: DSColors.primaryLight,
        onPrimaryContainer: DSColors.primaryDarker,

        // Colores secundarios
        secondary: DSColors.secondary,
        onSecondary: DSColors.textOnColor,
        secondaryContainer: DSColors.secondaryLight,
        onSecondaryContainer: DSColors.secondaryDarker,

        // Colores terciarios (usando info como terciario)
        tertiary: DSColors.info,
        onTertiary: DSColors.textOnColor,
        tertiaryContainer: DSColors.infoLight,
        onTertiaryContainer: DSColors.infoDark,

        // Colores de error
        error: DSColors.error,
        onError: DSColors.textOnColor,
        errorContainer: DSColors.errorLight,
        onErrorContainer: DSColors.errorDark,

        // Colores de superficie
        surface: DSColors.surface,
        onSurface: DSColors.textPrimary,
        surfaceContainerHighest: DSColors.surfaceVariant,
        onSurfaceVariant: DSColors.textSecondary,

        // Colores de outline
        outline: DSColors.gray300,
        outlineVariant: DSColors.gray200,

        // Colores de superficie inversa
        inverseSurface: DSColors.gray800,
        onInverseSurface: DSColors.textOnColor,
        inversePrimary: DSColors.primaryLight,

        // Shadow y scrim
        shadow: DSColors.shadow,
        scrim: DSColors.overlay,
      );

  /// ColorScheme para dark theme
  static ColorScheme get _darkColorScheme => ColorScheme.dark(
        // Colores principales
        primary: DSColors.primaryDarkMode,
        onPrimary: DSColors.backgroundDarkMode,
        primaryContainer: DSColors.primaryDark,
        onPrimaryContainer: DSColors.primaryLighter,

        // Colores secundarios
        secondary: DSColors.secondaryDarkMode,
        onSecondary: DSColors.backgroundDarkMode,
        secondaryContainer: DSColors.secondaryDark,
        onSecondaryContainer: DSColors.secondaryLighter,

        // Colores terciarios
        tertiary: DSColors.infoDarkMode,
        onTertiary: DSColors.backgroundDarkMode,
        tertiaryContainer: DSColors.infoDark,
        onTertiaryContainer: DSColors.infoLight,

        // Colores de error
        error: DSColors.errorDarkMode,
        onError: DSColors.backgroundDarkMode,
        errorContainer: DSColors.errorDark,
        onErrorContainer: DSColors.errorLight,

        // Colores de superficie
        surface: DSColors.backgroundSecondaryDarkMode,
        onSurface: DSColors.textPrimaryDarkMode,
        surfaceContainerHighest: DSColors.backgroundTertiaryDarkMode,
        onSurfaceVariant: DSColors.textSecondaryDarkMode,

        // Colores de outline
        outline: DSColors.gray600,
        outlineVariant: DSColors.gray700,

        // Colores de superficie inversa
        inverseSurface: DSColors.gray100,
        onInverseSurface: DSColors.textPrimary,
        inversePrimary: DSColors.primary,

        // Shadow y scrim
        shadow: Color(0xFF000000),
        scrim: Color(0x99000000),
      );

  // ==========================================================================
  // LIGHT THEME
  // ==========================================================================

  static ThemeData get lightTheme {
    final colorScheme = _lightColorScheme;

    return ThemeData(
      // Material 3
      useMaterial3: true,

      // Color scheme
      colorScheme: colorScheme,

      // Typography
      textTheme: DSTypography.textTheme.apply(
        bodyColor: DSColors.textPrimary,
        displayColor: DSColors.textPrimary,
      ),

      // Primary swatch (para compatibilidad)
      primarySwatch: DSColors.primaryMaterial,

      // Scaffold
      scaffoldBackgroundColor: DSColors.background,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: DSColors.surface,
        foregroundColor: DSColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle:
            DSTypography.withColor(DSTypography.h6, DSColors.textPrimary),
        toolbarTextStyle: DSTypography.withColor(
            DSTypography.bodyMedium, DSColors.textSecondary),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: DSColors.surface,
        shadowColor: DSColors.shadow,
        elevation: 2,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
        margin: DSSpacing.cardPadding,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DSColors.primary,
          foregroundColor: DSColors.textOnColor,
          disabledBackgroundColor: DSColors.gray300,
          disabledForegroundColor: DSColors.textDisabled,
          elevation: 2,
          shadowColor: DSColors.shadow,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DSColors.primary,
          disabledForegroundColor: DSColors.textDisabled,
          side: const BorderSide(color: DSColors.primary, width: 1),
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DSColors.primary,
          disabledForegroundColor: DSColors.textDisabled,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: DSColors.primary,
        foregroundColor: DSColors.textOnColor,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        highlightElevation: 12,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DSColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: DSColors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: DSColors.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: DSColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: DSColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: DSColors.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: DSColors.gray200),
        ),
        contentPadding: DSSpacing.inputPadding,
        labelStyle: DSTypography.labelMedium,
        hintStyle: DSTypography.withColor(
            DSTypography.bodyMedium, DSColors.textTertiary),
        errorStyle: DSTypography.error(DSColors.error),
        helperStyle: DSTypography.withColor(
            DSTypography.caption, DSColors.textTertiary),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: DSColors.surfaceVariant,
        disabledColor: DSColors.gray200,
        selectedColor: DSColors.primaryLight,
        secondarySelectedColor: DSColors.secondaryLight,
        shadowColor: DSColors.shadow,
        selectedShadowColor: DSColors.shadow,
        labelStyle: DSTypography.labelSmall,
        secondaryLabelStyle: DSTypography.labelSmall,
        brightness: Brightness.light,
        elevation: 1,
        pressElevation: 4,
        padding: DSSpacing.chipPadding,
        shape: const RoundedRectangleBorder(borderRadius: radiusSm),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: DSSpacing.listItemPadding,
        minLeadingWidth: 40,
        shape: const RoundedRectangleBorder(borderRadius: radiusMd),
        titleTextStyle: DSTypography.bodyMedium,
        subtitleTextStyle: DSTypography.withColor(
            DSTypography.bodySmall, DSColors.textSecondary),
        leadingAndTrailingTextStyle: DSTypography.labelMedium,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: DSColors.surface,
        elevation: 24,
        shadowColor: DSColors.shadow,
        shape: const RoundedRectangleBorder(borderRadius: radiusXl),
        titleTextStyle: DSTypography.h5,
        contentTextStyle: DSTypography.bodyMedium,
        actionsPadding: DSSpacing.dialogContentPadding,
        insetPadding: const EdgeInsets.all(DSSpacing.md),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: DSColors.surface,
        elevation: 16,
        modalElevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: DSColors.primary,
        unselectedLabelColor: DSColors.textSecondary,
        labelStyle: DSTypography.labelLarge,
        unselectedLabelStyle: DSTypography.labelMedium,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: DSColors.primary, width: 2),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: DSColors.divider,
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return DSColors.primary;
          return DSColors.surface;
        }),
        checkColor: WidgetStateProperty.all(DSColors.textOnColor),
        overlayColor:
            WidgetStateProperty.all(DSColors.primary.withValues(alpha: 0.1)),
        shape: const RoundedRectangleBorder(borderRadius: radiusXs),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return DSColors.primary;
          return DSColors.gray400;
        }),
        overlayColor:
            WidgetStateProperty.all(DSColors.primary.withValues(alpha: 0.1)),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return DSColors.primary;
          return DSColors.gray400;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return DSColors.primary.withValues(alpha: 0.3);
          }
          return DSColors.gray300;
        }),
        overlayColor:
            WidgetStateProperty.all(DSColors.primary.withValues(alpha: 0.1)),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: DSColors.primary,
        inactiveTrackColor: DSColors.primary.withValues(alpha: 0.3),
        thumbColor: DSColors.primary,
        overlayColor: DSColors.primary.withValues(alpha: 0.1),
        valueIndicatorColor: DSColors.primary,
        valueIndicatorTextStyle: DSTypography.withColor(
            DSTypography.labelSmall, DSColors.textOnColor),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: DSColors.primary,
        linearTrackColor: DSColors.gray200,
        circularTrackColor: DSColors.gray200,
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: DSColors.gray800,
          borderRadius: radiusSm,
        ),
        textStyle: DSTypography.withColor(
            DSTypography.caption, DSColors.textOnColor),
        padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.xs, vertical: DSSpacing.xxs),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: DSColors.surface,
        elevation: 3,
        indicatorColor: DSColors.primary.withValues(alpha: 0.1),
        labelTextStyle: WidgetStateProperty.all(DSTypography.labelSmall),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: DSColors.primary);
          }
          return const IconThemeData(color: DSColors.textSecondary);
        }),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: DSColors.divider,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: DSColors.textSecondary,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: DSColors.textOnColor,
        size: 24,
      ),
    );
  }

  // ==========================================================================
  // DARK THEME
  // ==========================================================================

  static ThemeData get darkTheme {
    final colorScheme = _darkColorScheme;

    return ThemeData(
      // Material 3
      useMaterial3: true,

      // Color scheme
      colorScheme: colorScheme,

      // Typography
      textTheme: DSTypography.textTheme.apply(
        bodyColor: DSColors.textPrimaryDarkMode,
        displayColor: DSColors.textPrimaryDarkMode,
      ),

      // Primary swatch (para compatibilidad)
      primarySwatch: DSColors.createMaterialColor(DSColors.primaryDarkMode),

      // Scaffold
      scaffoldBackgroundColor: DSColors.backgroundDarkMode,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: DSColors.backgroundSecondaryDarkMode,
        foregroundColor: DSColors.textPrimaryDarkMode,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: DSTypography.withColor(
            DSTypography.h6, DSColors.textPrimaryDarkMode),
        toolbarTextStyle: DSTypography.withColor(
            DSTypography.bodyMedium, DSColors.textSecondaryDarkMode),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: DSColors.backgroundSecondaryDarkMode,
        shadowColor: Colors.black,
        elevation: 2,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
        margin: DSSpacing.cardPadding,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DSColors.primaryDarkMode,
          foregroundColor: DSColors.backgroundDarkMode,
          disabledBackgroundColor: DSColors.gray600,
          disabledForegroundColor: DSColors.gray400,
          elevation: 2,
          shadowColor: Colors.black,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DSColors.primaryDarkMode,
          disabledForegroundColor: DSColors.gray400,
          side: BorderSide(color: DSColors.primaryDarkMode, width: 1),
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DSColors.primaryDarkMode,
          disabledForegroundColor: DSColors.gray400,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: DSColors.primaryDarkMode,
        foregroundColor: DSColors.backgroundDarkMode,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        highlightElevation: 12,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DSColors.backgroundTertiaryDarkMode,
        border: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: DSColors.gray600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: DSColors.gray600),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: DSColors.primaryDarkMode, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: DSColors.errorDarkMode),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: DSColors.errorDarkMode, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: DSColors.gray700),
        ),
        contentPadding: DSSpacing.inputPadding,
        labelStyle: DSTypography.withColor(
            DSTypography.labelMedium, DSColors.textSecondaryDarkMode),
        hintStyle: DSTypography.withColor(
            DSTypography.bodyMedium, DSColors.textTertiaryDarkMode),
        errorStyle: DSTypography.withColor(
            DSTypography.bodySmall, DSColors.errorDarkMode),
        helperStyle: DSTypography.withColor(
            DSTypography.caption, DSColors.textTertiaryDarkMode),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: DSColors.backgroundTertiaryDarkMode,
        disabledColor: DSColors.gray700,
        selectedColor: DSColors.primaryDarkMode.withValues(alpha: 0.2),
        secondarySelectedColor:
            DSColors.secondaryDarkMode.withValues(alpha: 0.2),
        shadowColor: Colors.black,
        selectedShadowColor: Colors.black,
        labelStyle: DSTypography.withColor(
            DSTypography.labelSmall, DSColors.textPrimaryDarkMode),
        secondaryLabelStyle: DSTypography.withColor(
            DSTypography.labelSmall, DSColors.textPrimaryDarkMode),
        brightness: Brightness.dark,
        elevation: 1,
        pressElevation: 4,
        padding: DSSpacing.chipPadding,
        shape: const RoundedRectangleBorder(borderRadius: radiusSm),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: DSSpacing.listItemPadding,
        minLeadingWidth: 40,
        shape: const RoundedRectangleBorder(borderRadius: radiusMd),
        titleTextStyle: DSTypography.withColor(
            DSTypography.bodyMedium, DSColors.textPrimaryDarkMode),
        subtitleTextStyle: DSTypography.withColor(
            DSTypography.bodySmall, DSColors.textSecondaryDarkMode),
        leadingAndTrailingTextStyle: DSTypography.withColor(
            DSTypography.labelMedium, DSColors.textSecondaryDarkMode),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: DSColors.backgroundSecondaryDarkMode,
        elevation: 24,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(borderRadius: radiusXl),
        titleTextStyle: DSTypography.withColor(
            DSTypography.h5, DSColors.textPrimaryDarkMode),
        contentTextStyle: DSTypography.withColor(
            DSTypography.bodyMedium, DSColors.textPrimaryDarkMode),
        actionsPadding: DSSpacing.dialogContentPadding,
        insetPadding: const EdgeInsets.all(DSSpacing.md),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: DSColors.backgroundSecondaryDarkMode,
        elevation: 16,
        modalElevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: DSColors.primaryDarkMode,
        unselectedLabelColor: DSColors.textSecondaryDarkMode,
        labelStyle: DSTypography.withColor(
            DSTypography.labelLarge, DSColors.primaryDarkMode),
        unselectedLabelStyle: DSTypography.withColor(
            DSTypography.labelMedium, DSColors.textSecondaryDarkMode),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: DSColors.primaryDarkMode, width: 2),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: DSColors.gray600,
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return DSColors.primaryDarkMode;
          }
          return DSColors.backgroundTertiaryDarkMode;
        }),
        checkColor: WidgetStateProperty.all(DSColors.backgroundDarkMode),
        overlayColor: WidgetStateProperty.all(
            DSColors.primaryDarkMode.withValues(alpha: 0.1)),
        shape: const RoundedRectangleBorder(borderRadius: radiusXs),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return DSColors.primaryDarkMode;
          }
          return DSColors.gray500;
        }),
        overlayColor: WidgetStateProperty.all(
            DSColors.primaryDarkMode.withValues(alpha: 0.1)),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return DSColors.primaryDarkMode;
          }
          return DSColors.gray500;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return DSColors.primaryDarkMode.withValues(alpha: 0.3);
          }
          return DSColors.gray600;
        }),
        overlayColor: WidgetStateProperty.all(
            DSColors.primaryDarkMode.withValues(alpha: 0.1)),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: DSColors.primaryDarkMode,
        inactiveTrackColor: DSColors.primaryDarkMode.withValues(alpha: 0.3),
        thumbColor: DSColors.primaryDarkMode,
        overlayColor: DSColors.primaryDarkMode.withValues(alpha: 0.1),
        valueIndicatorColor: DSColors.primaryDarkMode,
        valueIndicatorTextStyle: DSTypography.withColor(
            DSTypography.labelSmall, DSColors.backgroundDarkMode),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: DSColors.primaryDarkMode,
        linearTrackColor: DSColors.gray600,
        circularTrackColor: DSColors.gray600,
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: DSColors.gray200,
          borderRadius: radiusSm,
        ),
        textStyle: DSTypography.withColor(
            DSTypography.caption, DSColors.textPrimary),
        padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.xs, vertical: DSSpacing.xxs),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: DSColors.backgroundSecondaryDarkMode,
        elevation: 3,
        indicatorColor: DSColors.primaryDarkMode.withValues(alpha: 0.1),
        labelTextStyle: WidgetStateProperty.all(DSTypography.withColor(
            DSTypography.labelSmall, DSColors.textSecondaryDarkMode)),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: DSColors.primaryDarkMode);
          }
          return IconThemeData(color: DSColors.textSecondaryDarkMode);
        }),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: DSColors.gray600,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: DSColors.textSecondaryDarkMode,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: DSColors.backgroundDarkMode,
        size: 24,
      ),
    );
  }

  // ==========================================================================
  // M�TODOS UTILITARIOS
  // ==========================================================================

  /// Obtiene el tema apropiado basado en el brightness del sistema
  static ThemeData getThemeForBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }

  /// Crea un tema personalizado extendiendo el tema base
  static ThemeData customTheme({
    required ThemeData baseTheme,
    Color? primaryColor,
    Color? accentColor,
    TextTheme? textTheme,
  }) {
    return baseTheme.copyWith(
      colorScheme: primaryColor != null
          ? baseTheme.colorScheme.copyWith(primary: primaryColor)
          : null,
      textTheme: textTheme ?? baseTheme.textTheme,
    );
  }

  /// Aplica elevaci�n a un Container con el sistema de sombras
  static BoxDecoration elevatedDecoration({
    required int level,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    assert(level >= 0 && level <= 5, 'Elevation level must be between 0 and 5');

    late List<BoxShadow> shadows;
    switch (level) {
      case 0:
        shadows = elevation0;
        break;
      case 1:
        shadows = elevation1;
        break;
      case 2:
        shadows = elevation2;
        break;
      case 3:
        shadows = elevation3;
        break;
      case 4:
        shadows = elevation4;
        break;
      case 5:
        shadows = elevation5;
        break;
    }

    return BoxDecoration(
      color: color ?? DSColors.surface,
      borderRadius: borderRadius ?? radiusMd,
      boxShadow: shadows,
    );
  }

  /// Transici�n est�ndar para p�ginas
  static PageRouteBuilder<T> pageTransition<T>({
    required Widget child,
    Duration? duration,
    Curve? curve,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, _) => child,
      transitionDuration: duration ?? durationNormal,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final curveTween = CurveTween(curve: curve ?? curveStandard);
        final tween = Tween(begin: begin, end: end).chain(curveTween);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
