import 'package:flutter/material.dart';

/// Colores específicos de un tema
class ThemeColors {
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color secondary;
  final Color secondaryLight;
  final Color secondaryDark;
  final Color tertiary;
  final Color tertiaryLight;
  final Color tertiaryDark;
  final Color error;
  final Color errorLight;
  final Color errorDark;
  final Color warning;
  final Color warningLight;
  final Color warningDark;
  final Color success;
  final Color successLight;
  final Color successDark;
  final Color info;
  final Color infoLight;
  final Color infoDark;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color onPrimary;
  final Color onSecondary;
  final Color onSurface;
  final Color outline;

  const ThemeColors({
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.secondary,
    required this.secondaryLight,
    required this.secondaryDark,
    required this.tertiary,
    required this.tertiaryLight,
    required this.tertiaryDark,
    required this.error,
    required this.errorLight,
    required this.errorDark,
    required this.warning,
    required this.warningLight,
    required this.warningDark,
    required this.success,
    required this.successLight,
    required this.successDark,
    required this.info,
    required this.infoLight,
    required this.infoDark,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.onPrimary,
    required this.onSecondary,
    required this.onSurface,
    required this.outline,
  });
}

/// Estilo visual de un tema
enum ThemeStyleType {
  outlined,
  filled,
  tonal,
  elevated,
  flat,
}

/// Nivel de border radius
enum BorderRadiusLevel {
  sharp, // 4px
  medium, // 8px
  rounded, // 16px
  full, // 24px
}

/// Nivel de elevación
enum ElevationLevel {
  flat, // 0-1
  subtle, // 1-2
  medium, // 2-4
  high, // 4-8
}

/// Configuración de estilo de un tema
class ThemeStyle {
  final ThemeStyleType componentStyle;
  final BorderRadiusLevel borderRadius;
  final ElevationLevel elevation;
  final bool isDynamic;
  final bool supportsGlassmorphism;
  final bool supportsNeumorphism;
  final double glassOpacity;
  final bool hasGradients;

  const ThemeStyle({
    required this.componentStyle,
    required this.borderRadius,
    required this.elevation,
    this.isDynamic = false,
    this.supportsGlassmorphism = false,
    this.supportsNeumorphism = false,
    this.glassOpacity = 0.1,
    this.hasGradients = false,
  });

  /// Obtiene el valor de border radius en pixels
  double get borderRadiusValue {
    switch (borderRadius) {
      case BorderRadiusLevel.sharp:
        return 4.0;
      case BorderRadiusLevel.medium:
        return 8.0;
      case BorderRadiusLevel.rounded:
        return 16.0;
      case BorderRadiusLevel.full:
        return 24.0;
    }
  }

  /// Obtiene el valor de elevación
  double get elevationValue {
    switch (elevation) {
      case ElevationLevel.flat:
        return 0.0;
      case ElevationLevel.subtle:
        return 1.0;
      case ElevationLevel.medium:
        return 3.0;
      case ElevationLevel.high:
        return 6.0;
    }
  }
}

/// Categoría de un tema
enum ThemeCategory {
  corporate,
  modern,
  industry,
  mood,
  special,
}

/// Metadatos adicionales de un tema
class ThemeMetadata {
  final bool accessibilityOptimized;
  final bool darkModeOptimized;
  final double minContrastRatio;
  final List<String> targetDevices; // ['mobile', 'tablet', 'desktop']
  final List<String> targetAudience; // ['b2b', 'b2c', 'enterprise', etc.]
  final String inspiration; // De dónde viene la inspiración
  final List<String> trendTags; // ['glassmorphism', 'neumorphism', etc.]

  const ThemeMetadata({
    this.accessibilityOptimized = false,
    this.darkModeOptimized = false,
    this.minContrastRatio = 4.5,
    this.targetDevices = const ['mobile'],
    this.targetAudience = const ['general'],
    this.inspiration = '',
    this.trendTags = const [],
  });
}

/// Definición completa de un tema predefinido
class ThemePreset {
  final String id;
  final String name;
  final String displayName;
  final String description;
  final ThemeCategory category;
  final ThemeColors lightColors;
  final ThemeColors darkColors;
  final ThemeStyle style;
  final List<String> useCases;
  final ThemeMetadata metadata;

  const ThemePreset({
    required this.id,
    required this.name,
    required this.displayName,
    required this.description,
    required this.category,
    required this.lightColors,
    required this.darkColors,
    required this.style,
    required this.useCases,
    required this.metadata,
  });

  /// Obtiene los colores según el modo
  ThemeColors getColors({required bool isDark}) {
    return isDark ? darkColors : lightColors;
  }

  /// Obtiene la categoría como string
  String get categoryName {
    switch (category) {
      case ThemeCategory.corporate:
        return 'Corporativo';
      case ThemeCategory.modern:
        return 'Moderno';
      case ThemeCategory.industry:
        return 'Industria';
      case ThemeCategory.mood:
        return 'Emocional';
      case ThemeCategory.special:
        return 'Especial';
    }
  }

  /// Verifica si es apto para una audiencia específica
  bool isTargetFor(String audience) {
    return metadata.targetAudience.contains(audience);
  }

  /// Verifica si soporta un dispositivo específico
  bool supportsDevice(String device) {
    return metadata.targetDevices.contains(device);
  }

  /// Verifica si tiene una tendencia específica
  bool hasTrend(String trend) {
    return metadata.trendTags.contains(trend);
  }
}
