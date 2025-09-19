import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemePreset _selectedTheme = ThemePresets.corporateBlue;

  ThemeMode get themeMode => _themeMode;
  ThemePreset get selectedTheme => _selectedTheme;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  void changeTheme(ThemePreset theme) {
    _selectedTheme = theme;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  ThemeData buildThemeData(ThemePreset preset, bool isDark) {
    final colors = preset.getColors(isDark: isDark);

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: colors.primary,
        secondary: colors.secondary,
        tertiary: colors.tertiary,
        error: colors.error,
        surface: colors.surface,
        onPrimary: colors.onPrimary,
        onSecondary: colors.onSecondary,
        onSurface: colors.onSurface,
        outline: colors.outline,
      ),
      textTheme: DSTypography.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: preset.style.elevationValue,
        centerTitle: false,
        titleTextStyle: DSTypography.h6.copyWith(color: colors.onSurface),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: preset.style.elevationValue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
        ),
        margin: const EdgeInsets.all(16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: preset.style.elevationValue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          ),
          textStyle: DSTypography.button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          ),
          textStyle: DSTypography.button,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          ),
          textStyle: DSTypography.button,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        labelStyle: DSTypography.labelMedium,
        hintStyle: DSTypography.bodyMedium.copyWith(
          color: colors.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}