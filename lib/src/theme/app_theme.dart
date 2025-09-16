import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'typography.dart';
import 'spacing.dart';

/// Configuración completa del tema para el Design System de IAutomat
///
/// Implementa Material Design 3 con tokens personalizados del sistema.
/// Incluye configuraci�n completa para light y dark themes con:
/// - ColorScheme personalizado integrado con AppColors
/// - TextTheme basado en AppTypography
/// - Component themes para todos los widgets de Material
/// - Sistema de elevaci�n y sombras consistente
/// - Border radius system unificado
/// - Duraciones y curvas de animaci�n optimizadas
///
/// Uso:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
/// )
/// ```
class AppTheme {
  AppTheme._();

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
        primary: AppColors.primary,
        onPrimary: AppColors.textOnColor,
        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: AppColors.primaryDarker,

        // Colores secundarios
        secondary: AppColors.secondary,
        onSecondary: AppColors.textOnColor,
        secondaryContainer: AppColors.secondaryLight,
        onSecondaryContainer: AppColors.secondaryDarker,

        // Colores terciarios (usando info como terciario)
        tertiary: AppColors.info,
        onTertiary: AppColors.textOnColor,
        tertiaryContainer: AppColors.infoLight,
        onTertiaryContainer: AppColors.infoDark,

        // Colores de error
        error: AppColors.error,
        onError: AppColors.textOnColor,
        errorContainer: AppColors.errorLight,
        onErrorContainer: AppColors.errorDark,

        // Colores de superficie
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.textSecondary,

        // Colores de outline
        outline: AppColors.gray300,
        outlineVariant: AppColors.gray200,

        // Colores de superficie inversa
        inverseSurface: AppColors.gray800,
        onInverseSurface: AppColors.textOnColor,
        inversePrimary: AppColors.primaryLight,

        // Shadow y scrim
        shadow: AppColors.shadow,
        scrim: AppColors.overlay,
      );

  /// ColorScheme para dark theme
  static ColorScheme get _darkColorScheme => ColorScheme.dark(
        // Colores principales
        primary: AppColors.primaryDarkMode,
        onPrimary: AppColors.backgroundDarkMode,
        primaryContainer: AppColors.primaryDark,
        onPrimaryContainer: AppColors.primaryLighter,

        // Colores secundarios
        secondary: AppColors.secondaryDarkMode,
        onSecondary: AppColors.backgroundDarkMode,
        secondaryContainer: AppColors.secondaryDark,
        onSecondaryContainer: AppColors.secondaryLighter,

        // Colores terciarios
        tertiary: AppColors.infoDarkMode,
        onTertiary: AppColors.backgroundDarkMode,
        tertiaryContainer: AppColors.infoDark,
        onTertiaryContainer: AppColors.infoLight,

        // Colores de error
        error: AppColors.errorDarkMode,
        onError: AppColors.backgroundDarkMode,
        errorContainer: AppColors.errorDark,
        onErrorContainer: AppColors.errorLight,

        // Colores de superficie
        surface: AppColors.backgroundSecondaryDarkMode,
        onSurface: AppColors.textPrimaryDarkMode,
        surfaceContainerHighest: AppColors.backgroundTertiaryDarkMode,
        onSurfaceVariant: AppColors.textSecondaryDarkMode,

        // Colores de outline
        outline: AppColors.gray600,
        outlineVariant: AppColors.gray700,

        // Colores de superficie inversa
        inverseSurface: AppColors.gray100,
        onInverseSurface: AppColors.textPrimary,
        inversePrimary: AppColors.primary,

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
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),

      // Primary swatch (para compatibilidad)
      primarySwatch: AppColors.primaryMaterial,

      // Scaffold
      scaffoldBackgroundColor: AppColors.background,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle:
            AppTypography.withColor(AppTypography.h6, AppColors.textPrimary),
        toolbarTextStyle: AppTypography.withColor(
            AppTypography.bodyMedium, AppColors.textSecondary),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.surface,
        shadowColor: AppColors.shadow,
        elevation: 2,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
        margin: AppSpacing.cardPadding,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnColor,
          disabledBackgroundColor: AppColors.gray300,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 2,
          shadowColor: AppColors.shadow,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.textDisabled,
          side: const BorderSide(color: AppColors.primary, width: 1),
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.textDisabled,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnColor,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        highlightElevation: 12,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: const BorderSide(color: AppColors.gray200),
        ),
        contentPadding: AppSpacing.inputPadding,
        labelStyle: AppTypography.labelMedium,
        hintStyle: AppTypography.withColor(
            AppTypography.bodyMedium, AppColors.textTertiary),
        errorStyle: AppTypography.error(AppColors.error),
        helperStyle: AppTypography.withColor(
            AppTypography.caption, AppColors.textTertiary),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        disabledColor: AppColors.gray200,
        selectedColor: AppColors.primaryLight,
        secondarySelectedColor: AppColors.secondaryLight,
        shadowColor: AppColors.shadow,
        selectedShadowColor: AppColors.shadow,
        labelStyle: AppTypography.labelSmall,
        secondaryLabelStyle: AppTypography.labelSmall,
        brightness: Brightness.light,
        elevation: 1,
        pressElevation: 4,
        padding: AppSpacing.chipPadding,
        shape: const RoundedRectangleBorder(borderRadius: radiusSm),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: AppSpacing.listItemPadding,
        minLeadingWidth: 40,
        shape: const RoundedRectangleBorder(borderRadius: radiusMd),
        titleTextStyle: AppTypography.bodyMedium,
        subtitleTextStyle: AppTypography.withColor(
            AppTypography.bodySmall, AppColors.textSecondary),
        leadingAndTrailingTextStyle: AppTypography.labelMedium,
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.surface,
        elevation: 24,
        shadowColor: AppColors.shadow,
        shape: const RoundedRectangleBorder(borderRadius: radiusXl),
        titleTextStyle: AppTypography.h5,
        contentTextStyle: AppTypography.bodyMedium,
        actionsPadding: AppSpacing.dialogContentPadding,
        insetPadding: const EdgeInsets.all(AppSpacing.md),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        elevation: 16,
        modalElevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: AppTypography.labelLarge,
        unselectedLabelStyle: AppTypography.labelMedium,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.divider,
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.surface;
        }),
        checkColor: WidgetStateProperty.all(AppColors.textOnColor),
        overlayColor:
            WidgetStateProperty.all(AppColors.primary.withOpacity(0.1)),
        shape: const RoundedRectangleBorder(borderRadius: radiusXs),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.gray400;
        }),
        overlayColor:
            WidgetStateProperty.all(AppColors.primary.withOpacity(0.1)),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.gray400;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary.withOpacity(0.3);
          }
          return AppColors.gray300;
        }),
        overlayColor:
            WidgetStateProperty.all(AppColors.primary.withOpacity(0.1)),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.primary.withOpacity(0.3),
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withOpacity(0.1),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: AppTypography.withColor(
            AppTypography.labelSmall, AppColors.textOnColor),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.gray200,
        circularTrackColor: AppColors.gray200,
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.gray800,
          borderRadius: radiusSm,
        ),
        textStyle: AppTypography.withColor(
            AppTypography.caption, AppColors.textOnColor),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xs, vertical: AppSpacing.xxs),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        elevation: 3,
        indicatorColor: AppColors.primary.withOpacity(0.1),
        labelTextStyle: WidgetStateProperty.all(AppTypography.labelSmall),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary);
          }
          return const IconThemeData(color: AppColors.textSecondary);
        }),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: AppColors.textOnColor,
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
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textPrimaryDarkMode,
        displayColor: AppColors.textPrimaryDarkMode,
      ),

      // Primary swatch (para compatibilidad)
      primarySwatch: AppColors.createMaterialColor(AppColors.primaryDarkMode),

      // Scaffold
      scaffoldBackgroundColor: AppColors.backgroundDarkMode,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundSecondaryDarkMode,
        foregroundColor: AppColors.textPrimaryDarkMode,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.withColor(
            AppTypography.h6, AppColors.textPrimaryDarkMode),
        toolbarTextStyle: AppTypography.withColor(
            AppTypography.bodyMedium, AppColors.textSecondaryDarkMode),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.backgroundSecondaryDarkMode,
        shadowColor: Colors.black,
        elevation: 2,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
        margin: AppSpacing.cardPadding,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDarkMode,
          foregroundColor: AppColors.backgroundDarkMode,
          disabledBackgroundColor: AppColors.gray600,
          disabledForegroundColor: AppColors.gray400,
          elevation: 2,
          shadowColor: Colors.black,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryDarkMode,
          disabledForegroundColor: AppColors.gray400,
          side: BorderSide(color: AppColors.primaryDarkMode, width: 1),
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryDarkMode,
          disabledForegroundColor: AppColors.gray400,
          shape: const RoundedRectangleBorder(borderRadius: radiusMd),
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          minimumSize: const Size(64, 40),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDarkMode,
        foregroundColor: AppColors.backgroundDarkMode,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        highlightElevation: 12,
        shape: const RoundedRectangleBorder(borderRadius: radiusLg),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundTertiaryDarkMode,
        border: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: AppColors.gray600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: AppColors.gray600),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: AppColors.primaryDarkMode, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: AppColors.errorDarkMode),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: AppColors.errorDarkMode, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusMd,
          borderSide: BorderSide(color: AppColors.gray700),
        ),
        contentPadding: AppSpacing.inputPadding,
        labelStyle: AppTypography.withColor(
            AppTypography.labelMedium, AppColors.textSecondaryDarkMode),
        hintStyle: AppTypography.withColor(
            AppTypography.bodyMedium, AppColors.textTertiaryDarkMode),
        errorStyle: AppTypography.withColor(
            AppTypography.bodySmall, AppColors.errorDarkMode),
        helperStyle: AppTypography.withColor(
            AppTypography.caption, AppColors.textTertiaryDarkMode),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.backgroundTertiaryDarkMode,
        disabledColor: AppColors.gray700,
        selectedColor: AppColors.primaryDarkMode.withOpacity(0.2),
        secondarySelectedColor: AppColors.secondaryDarkMode.withOpacity(0.2),
        shadowColor: Colors.black,
        selectedShadowColor: Colors.black,
        labelStyle: AppTypography.withColor(
            AppTypography.labelSmall, AppColors.textPrimaryDarkMode),
        secondaryLabelStyle: AppTypography.withColor(
            AppTypography.labelSmall, AppColors.textPrimaryDarkMode),
        brightness: Brightness.dark,
        elevation: 1,
        pressElevation: 4,
        padding: AppSpacing.chipPadding,
        shape: const RoundedRectangleBorder(borderRadius: radiusSm),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: AppSpacing.listItemPadding,
        minLeadingWidth: 40,
        shape: const RoundedRectangleBorder(borderRadius: radiusMd),
        titleTextStyle: AppTypography.withColor(
            AppTypography.bodyMedium, AppColors.textPrimaryDarkMode),
        subtitleTextStyle: AppTypography.withColor(
            AppTypography.bodySmall, AppColors.textSecondaryDarkMode),
        leadingAndTrailingTextStyle: AppTypography.withColor(
            AppTypography.labelMedium, AppColors.textSecondaryDarkMode),
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.backgroundSecondaryDarkMode,
        elevation: 24,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(borderRadius: radiusXl),
        titleTextStyle: AppTypography.withColor(
            AppTypography.h5, AppColors.textPrimaryDarkMode),
        contentTextStyle: AppTypography.withColor(
            AppTypography.bodyMedium, AppColors.textPrimaryDarkMode),
        actionsPadding: AppSpacing.dialogContentPadding,
        insetPadding: const EdgeInsets.all(AppSpacing.md),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.backgroundSecondaryDarkMode,
        elevation: 16,
        modalElevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primaryDarkMode,
        unselectedLabelColor: AppColors.textSecondaryDarkMode,
        labelStyle: AppTypography.withColor(
            AppTypography.labelLarge, AppColors.primaryDarkMode),
        unselectedLabelStyle: AppTypography.withColor(
            AppTypography.labelMedium, AppColors.textSecondaryDarkMode),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.primaryDarkMode, width: 2),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.gray600,
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryDarkMode;
          }
          return AppColors.backgroundTertiaryDarkMode;
        }),
        checkColor: WidgetStateProperty.all(AppColors.backgroundDarkMode),
        overlayColor:
            WidgetStateProperty.all(AppColors.primaryDarkMode.withOpacity(0.1)),
        shape: const RoundedRectangleBorder(borderRadius: radiusXs),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryDarkMode;
          }
          return AppColors.gray500;
        }),
        overlayColor:
            WidgetStateProperty.all(AppColors.primaryDarkMode.withOpacity(0.1)),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryDarkMode;
          }
          return AppColors.gray500;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryDarkMode.withOpacity(0.3);
          }
          return AppColors.gray600;
        }),
        overlayColor:
            WidgetStateProperty.all(AppColors.primaryDarkMode.withOpacity(0.1)),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primaryDarkMode,
        inactiveTrackColor: AppColors.primaryDarkMode.withOpacity(0.3),
        thumbColor: AppColors.primaryDarkMode,
        overlayColor: AppColors.primaryDarkMode.withOpacity(0.1),
        valueIndicatorColor: AppColors.primaryDarkMode,
        valueIndicatorTextStyle: AppTypography.withColor(
            AppTypography.labelSmall, AppColors.backgroundDarkMode),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryDarkMode,
        linearTrackColor: AppColors.gray600,
        circularTrackColor: AppColors.gray600,
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: radiusSm,
        ),
        textStyle: AppTypography.withColor(
            AppTypography.caption, AppColors.textPrimary),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xs, vertical: AppSpacing.xxs),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.backgroundSecondaryDarkMode,
        elevation: 3,
        indicatorColor: AppColors.primaryDarkMode.withOpacity(0.1),
        labelTextStyle: WidgetStateProperty.all(AppTypography.withColor(
            AppTypography.labelSmall, AppColors.textSecondaryDarkMode)),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: AppColors.primaryDarkMode);
          }
          return IconThemeData(color: AppColors.textSecondaryDarkMode);
        }),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.gray600,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.textSecondaryDarkMode,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: AppColors.backgroundDarkMode,
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
      color: color ?? AppColors.surface,
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
