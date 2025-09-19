import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../../theme/typography.dart';
import '../../theme/ds_theme.dart';

/// Enumeración para las variantes de botones disponibles
enum ButtonVariant {
  /// Botón principal - Para acciones primarias importantes
  primary,

  /// Botón secundario - Para acciones secundarias
  secondary,

  /// Botón con borde - Para acciones alternativas
  outline,

  /// Botón fantasma - Para acciones sutiles
  ghost,

  /// Botón de peligro - Para acciones destructivas
  danger,
}

/// Configuración de tamaños para botones
class ButtonSizeConfig {
  final double height;
  final double minWidth;
  final EdgeInsets padding;
  final double iconSize;
  final double borderRadius;
  final double spacing;
  final TextStyle textStyle;

  const ButtonSizeConfig({
    required this.height,
    required this.minWidth,
    required this.padding,
    required this.iconSize,
    required this.borderRadius,
    required this.spacing,
    required this.textStyle,
  });
}

/// Enumeración para los tamaños de botones disponibles
enum ButtonSize {
  /// Botón pequeño - Para espacios reducidos
  small,

  /// Botón mediano - Tamaño estándar
  medium,

  /// Bot�n grande - Para acciones importantes
  large,
}

/// Sistema de estilos para DSButton
///
/// Proporciona estilos consistentes para todas las variantes y tama�os
/// de botones en el Design System, incluyendo:
/// - Colores espec�ficos por variante
/// - Tama�os y espaciado seg�n ButtonSize
/// - Estados interactivos (hover, pressed, disabled)
/// - Animaciones y efectos visuales
/// - Integraci�n completa con el tema
class DSButtonStyles {
  DSButtonStyles._();

  // ==========================================================================
  // CONFIGURACIÓN DE TAMAÑOS
  // ==========================================================================

  /// Configuración de dimensiones según el tamaño del botón
  static Map<ButtonSize, ButtonSizeConfig> get _sizeConfigs => {
        ButtonSize.small: ButtonSizeConfig(
          height: 32,
          minWidth: 64,
          padding: DSSpacing.buttonPaddingSmall,
          textStyle: DSTypography.labelSmall,
          iconSize: 16,
          borderRadius: 4.0,
          spacing: DSSpacing.xxs,
        ),
        ButtonSize.medium: ButtonSizeConfig(
          height: 40,
          minWidth: 80,
          padding: DSSpacing.buttonPadding,
          textStyle: DSTypography.button,
          iconSize: 20,
          borderRadius: 6.0,
          spacing: DSSpacing.xs,
        ),
        ButtonSize.large: ButtonSizeConfig(
          height: 48,
          minWidth: 120,
          padding: DSSpacing.buttonPaddingLarge,
          textStyle: DSTypography.labelLarge,
          iconSize: 24,
          borderRadius: 8.0,
          spacing: DSSpacing.unit,
        ),
      };

  /// Obtiene la configuraci�n de tama�o para un ButtonSize espec�fico
  static ButtonSizeConfig getSizeConfig(ButtonSize size) {
    return _sizeConfigs[size]!;
  }

  // ==========================================================================
  // ESTILOS POR VARIANTE - LIGHT THEME
  // ==========================================================================

  /// Obtiene el estilo para una variante espec�fica en light theme
  static ButtonStyle getVariantStyle(
    ButtonVariant variant,
    ButtonSize size, {
    bool isDark = false,
  }) {
    final sizeConfig = getSizeConfig(size);

    switch (variant) {
      case ButtonVariant.primary:
        return _primaryStyle(sizeConfig, isDark);
      case ButtonVariant.secondary:
        return _secondaryStyle(sizeConfig, isDark);
      case ButtonVariant.outline:
        return _outlineStyle(sizeConfig, isDark);
      case ButtonVariant.ghost:
        return _ghostStyle(sizeConfig, isDark);
      case ButtonVariant.danger:
        return _dangerStyle(sizeConfig, isDark);
    }
  }

  /// Estilo para bot�n primary
  static ButtonStyle _primaryStyle(ButtonSizeConfig config, bool isDark) {
    final primaryColor = isDark ? DSColors.primaryDarkMode : DSColors.primary;
    final onPrimaryColor =
        isDark ? DSColors.backgroundDarkMode : DSColors.textOnColor;
    final disabledColor = isDark ? DSColors.gray600 : DSColors.gray300;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return disabledColor;
        return primaryColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return isDark ? DSColors.gray400 : DSColors.textDisabled;
        }
        return onPrimaryColor;
      }),
      elevation: WidgetStateProperty.resolveWith<double>((states) {
        if (states.contains(WidgetState.disabled)) return 0;
        if (states.contains(WidgetState.pressed)) return 8;
        if (states.contains(WidgetState.hovered)) return 4;
        if (states.contains(WidgetState.focused)) return 4;
        return 2;
      }),

      // Sombra
      shadowColor:
          WidgetStateProperty.all(isDark ? Colors.black : DSColors.shadow),

      // Forma y tama�o
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: DSTheme.radiusMd)),
      minimumSize:
          WidgetStateProperty.all(Size(config.minWidth, config.height)),
      maximumSize: WidgetStateProperty.all(Size.infinite),
      padding: WidgetStateProperty.all(config.padding),

      // Texto
      textStyle: WidgetStateProperty.all(config.textStyle),

      // Animaciones
      animationDuration: DSTheme.durationFast,

      // Splash
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return onPrimaryColor.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return onPrimaryColor.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return onPrimaryColor.withValues(alpha: 0.16);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n secondary
  static ButtonStyle _secondaryStyle(ButtonSizeConfig config, bool isDark) {
    final secondaryColor =
        isDark ? DSColors.secondaryDarkMode : DSColors.secondary;
    final onSecondaryColor =
        isDark ? DSColors.backgroundDarkMode : DSColors.textOnColor;
    final disabledColor = isDark ? DSColors.gray600 : DSColors.gray300;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return disabledColor;
        return secondaryColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return isDark ? DSColors.gray400 : DSColors.textDisabled;
        }
        return onSecondaryColor;
      }),
      elevation: WidgetStateProperty.resolveWith<double>((states) {
        if (states.contains(WidgetState.disabled)) return 0;
        if (states.contains(WidgetState.pressed)) return 6;
        if (states.contains(WidgetState.hovered)) return 3;
        if (states.contains(WidgetState.focused)) return 3;
        return 1;
      }),
      shadowColor:
          WidgetStateProperty.all(isDark ? Colors.black : DSColors.shadow),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: DSTheme.radiusMd)),
      minimumSize:
          WidgetStateProperty.all(Size(config.minWidth, config.height)),
      maximumSize: WidgetStateProperty.all(Size.infinite),
      padding: WidgetStateProperty.all(config.padding),
      textStyle: WidgetStateProperty.all(config.textStyle),
      animationDuration: DSTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return onSecondaryColor.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return onSecondaryColor.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return onSecondaryColor.withValues(alpha: 0.16);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n outline
  static ButtonStyle _outlineStyle(ButtonSizeConfig config, bool isDark) {
    final borderColor = isDark ? DSColors.primaryDarkMode : DSColors.primary;
    final textColor = isDark ? DSColors.primaryDarkMode : DSColors.primary;
    final backgroundColor = isDark ? Colors.transparent : Colors.transparent;
    final disabledBorderColor = isDark ? DSColors.gray600 : DSColors.gray300;
    final disabledTextColor =
        isDark ? DSColors.gray400 : DSColors.textDisabled;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return disabledTextColor;
        return textColor;
      }),
      side: WidgetStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: disabledBorderColor, width: 1);
        }
        if (states.contains(WidgetState.pressed)) {
          return BorderSide(color: borderColor, width: 2);
        }
        return BorderSide(color: borderColor, width: 1);
      }),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: DSTheme.radiusMd)),
      minimumSize:
          WidgetStateProperty.all(Size(config.minWidth, config.height)),
      maximumSize: WidgetStateProperty.all(Size.infinite),
      padding: WidgetStateProperty.all(config.padding),
      textStyle: WidgetStateProperty.all(config.textStyle),
      animationDuration: DSTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return textColor.withValues(alpha: 0.04);
        }
        if (states.contains(WidgetState.focused)) {
          return textColor.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return textColor.withValues(alpha: 0.12);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n ghost
  static ButtonStyle _ghostStyle(ButtonSizeConfig config, bool isDark) {
    final textColor =
        isDark ? DSColors.textPrimaryDarkMode : DSColors.textPrimary;
    final disabledTextColor =
        isDark ? DSColors.gray400 : DSColors.textDisabled;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return disabledTextColor;
        return textColor;
      }),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: DSTheme.radiusMd)),
      minimumSize:
          WidgetStateProperty.all(Size(config.minWidth, config.height)),
      maximumSize: WidgetStateProperty.all(Size.infinite),
      padding: WidgetStateProperty.all(config.padding),
      textStyle: WidgetStateProperty.all(config.textStyle),
      animationDuration: DSTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return textColor.withValues(alpha: 0.04);
        }
        if (states.contains(WidgetState.focused)) {
          return textColor.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return textColor.withValues(alpha: 0.12);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n danger
  static ButtonStyle _dangerStyle(ButtonSizeConfig config, bool isDark) {
    final dangerColor = isDark ? DSColors.errorDarkMode : DSColors.error;
    final onDangerColor =
        isDark ? DSColors.backgroundDarkMode : DSColors.textOnColor;
    final disabledColor = isDark ? DSColors.gray600 : DSColors.gray300;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return disabledColor;
        return dangerColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return isDark ? DSColors.gray400 : DSColors.textDisabled;
        }
        return onDangerColor;
      }),
      elevation: WidgetStateProperty.resolveWith<double>((states) {
        if (states.contains(WidgetState.disabled)) return 0;
        if (states.contains(WidgetState.pressed)) return 8;
        if (states.contains(WidgetState.hovered)) return 4;
        if (states.contains(WidgetState.focused)) return 4;
        return 2;
      }),
      shadowColor:
          WidgetStateProperty.all(isDark ? Colors.black : DSColors.shadow),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: DSTheme.radiusMd)),
      minimumSize:
          WidgetStateProperty.all(Size(config.minWidth, config.height)),
      maximumSize: WidgetStateProperty.all(Size.infinite),
      padding: WidgetStateProperty.all(config.padding),
      textStyle: WidgetStateProperty.all(config.textStyle),
      animationDuration: DSTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return onDangerColor.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return onDangerColor.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return onDangerColor.withValues(alpha: 0.16);
        }
        return null;
      }),
    );
  }

  // ==========================================================================
  // EFECTOS VISUALES Y ANIMACIONES
  // ==========================================================================

  /// Splash factory personalizado para efectos m�s suaves
  static InteractiveInkFeatureFactory get customSplashFactory {
    return InkRipple.splashFactory;
  }

  /// Duraci�n de animaci�n para hover effects
  static Duration get hoverAnimationDuration => DSTheme.durationFast;

  /// Duraci�n de animaci�n para tap effects
  static Duration get tapAnimationDuration => DSTheme.durationExtraFast;

  /// Curva de animaci�n para efectos interactivos
  static Curve get interactionCurve => DSTheme.curveStandard;

  // ==========================================================================
  // UTILIDADES DE COLOR
  // ==========================================================================

  /// Obtiene el color de texto apropiado para una variante
  static Color getTextColor(
      ButtonVariant variant, bool isDark, bool isDisabled) {
    if (isDisabled) {
      return isDark ? DSColors.gray400 : DSColors.textDisabled;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return isDark ? DSColors.backgroundDarkMode : DSColors.textOnColor;
      case ButtonVariant.secondary:
        return isDark ? DSColors.backgroundDarkMode : DSColors.textOnColor;
      case ButtonVariant.outline:
        return isDark ? DSColors.primaryDarkMode : DSColors.primary;
      case ButtonVariant.ghost:
        return isDark ? DSColors.textPrimaryDarkMode : DSColors.textPrimary;
      case ButtonVariant.danger:
        return isDark ? DSColors.backgroundDarkMode : DSColors.textOnColor;
    }
  }

  /// Obtiene el color de fondo para una variante
  static Color getBackgroundColor(
      ButtonVariant variant, bool isDark, bool isDisabled) {
    if (isDisabled) {
      return isDark ? DSColors.gray600 : DSColors.gray300;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return isDark ? DSColors.primaryDarkMode : DSColors.primary;
      case ButtonVariant.secondary:
        return isDark ? DSColors.secondaryDarkMode : DSColors.secondary;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.ghost:
        return Colors.transparent;
      case ButtonVariant.danger:
        return isDark ? DSColors.errorDarkMode : DSColors.error;
    }
  }

  // ==========================================================================
  // CONFIGURACI�N DE ACCESIBILIDAD
  // ==========================================================================

  /// Configuraci�n de sem�ntica para accesibilidad
  static SemanticsProperties getSemanticsProperties(
    ButtonVariant variant,
    String? text,
    bool isEnabled,
    bool isLoading,
  ) {
    String? hint;

    switch (variant) {
      case ButtonVariant.primary:
        hint = 'Bot�n principal';
        break;
      case ButtonVariant.secondary:
        hint = 'Bot�n secundario';
        break;
      case ButtonVariant.outline:
        hint = 'Bot�n con borde';
        break;
      case ButtonVariant.ghost:
        hint = 'Bot�n de texto';
        break;
      case ButtonVariant.danger:
        hint = 'Bot�n de acci�n destructiva';
        break;
    }

    if (!isEnabled) {
      hint = '$hint, deshabilitado';
    } else if (isLoading) {
      hint = '$hint, cargando';
    }

    return SemanticsProperties(
      label: text,
      hint: hint,
      button: true,
      enabled: isEnabled && !isLoading,
    );
  }
}
