import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../../theme/colors.dart';
import '../../theme/s  /// Estilo para el botón primario
  static ButtonStyle _primaryStyle(_ButtonSizeConfig config, bool isDark) {
    final primaryColor = isDark ? AppColors.primaryDarkMode : AppColors.primary;
    final onPrimaryColor =
        isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;.dart';
import '../../theme/typography.dart';
import '../../theme/app_theme.dart';

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
class _ButtonSizeConfig {
  final double height;
  final double minWidth;
  final EdgeInsets padding;
  final double iconSize;
  final double borderRadius;
  final double spacing;
  final TextStyle textStyle;

  const _ButtonSizeConfig({
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

/// Sistema de estilos para AppButton
///
/// Proporciona estilos consistentes para todas las variantes y tama�os
/// de botones en el Design System, incluyendo:
/// - Colores espec�ficos por variante
/// - Tama�os y espaciado seg�n ButtonSize
/// - Estados interactivos (hover, pressed, disabled)
/// - Animaciones y efectos visuales
/// - Integraci�n completa con el tema
class AppButtonStyles {
  AppButtonStyles._();

  // ==========================================================================
  // CONFIGURACIÓN DE TAMAÑOS
  // ==========================================================================

  /// Configuración de dimensiones según el tamaño del botón
  static Map<ButtonSize, _ButtonSizeConfig> get _sizeConfigs => {
        ButtonSize.small: _ButtonSizeConfig(
          height: 32,
          minWidth: 64,
          padding: AppSpacing.buttonPaddingSmall,
          textStyle: AppTypography.labelSmall,
          iconSize: 16,
          borderRadius: 4.0,
          spacing: AppSpacing.xxs,
        ),
        ButtonSize.medium: _ButtonSizeConfig(
          height: 40,
          minWidth: 80,
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          iconSize: 20,
          borderRadius: 6.0,
          spacing: AppSpacing.xs,
        ),
        ButtonSize.large: _ButtonSizeConfig(
          height: 48,
          minWidth: 120,
          padding: AppSpacing.buttonPaddingLarge,
          textStyle: AppTypography.labelLarge,
          iconSize: 24,
          borderRadius: 8.0,
          spacing: AppSpacing.unit,
        ),
      };

  /// Obtiene la configuraci�n de tama�o para un ButtonSize espec�fico
  static _ButtonSizeConfig getSizeConfig(ButtonSize size) {
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
  static ButtonStyle _primaryStyle(_ButtonSizeConfig config, bool isDark) {
    final primaryColor = isDark ? AppColors.primaryDarkMode : AppColors.primary;
    final onPrimaryColor =
        isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) return disabledColor;
        return primaryColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) return isDark ? AppColors.gray400 : AppColors.textDisabled;
        return onPrimaryColor;
      }),
      elevation: MaterialStateProperty.resolveWith<double>((states) {
        if (states.contains(MaterialState.disabled)) return 0;
        if (states.contains(MaterialState.pressed)) return 8;
        if (states.contains(MaterialState.hovered)) return 4;
        if (states.contains(MaterialState.focused)) return 4;
        return 2;
      }),

      // Sombra
      shadowColor: isDark ? Colors.black : AppColors.shadow,

      // Forma y tama�o
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radiusMd),
      minimumSize: Size(config.minWidth, config.height),
      maximumSize: Size.infinite,
      padding: config.padding,

      // Texto
      textStyle: config.textStyle,

      // Animaciones
      animationDuration: AppTheme.durationFast,

      // Splash
      splashFactory: InkRipple.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.hovered)) {
          return onPrimaryColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return onPrimaryColor.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return onPrimaryColor.withOpacity(0.16);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n secondary
  static ButtonStyle _secondaryStyle(_ButtonSizeConfig config, bool isDark) {
    final secondaryColor =
        isDark ? AppColors.secondaryDarkMode : AppColors.secondary;
    final onSecondaryColor =
        isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) return disabledColor;
        return primaryColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) return isDark ? AppColors.gray400 : AppColors.textDisabled;
        return onPrimaryColor;
      }),
      disabledBackgroundColor: disabledColor,
      disabledForegroundColor:
          isDark ? AppColors.gray400 : AppColors.textDisabled,
      elevation: MaterialStateProperty.resolveWith<double>((states) {
        if (states.contains(MaterialState.disabled)) return 0;
        if (states.contains(MaterialState.pressed)) return 6;
        if (states.contains(MaterialState.hovered)) return 3;
        if (states.contains(MaterialState.focused)) return 3;
        return 1;
      }),
      shadowColor: isDark ? Colors.black : AppColors.shadow,
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radiusMd),
      minimumSize: Size(config.minWidth, config.height),
      maximumSize: Size.infinite,
      padding: config.padding,
      textStyle: config.textStyle,
      animationDuration: AppTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.hovered)) {
          return onSecondaryColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return onSecondaryColor.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return onSecondaryColor.withOpacity(0.16);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n outline
  static ButtonStyle _outlineStyle(_ButtonSizeConfig config, bool isDark) {
    final borderColor = isDark ? AppColors.primaryDarkMode : AppColors.primary;
    final textColor = isDark ? AppColors.primaryDarkMode : AppColors.primary;
    final backgroundColor = isDark ? Colors.transparent : Colors.transparent;
    final disabledBorderColor = isDark ? AppColors.gray600 : AppColors.gray300;
    final disabledTextColor =
        isDark ? AppColors.gray400 : AppColors.textDisabled;

    return OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      disabledForegroundColor: disabledTextColor,
      side: MaterialStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(color: disabledBorderColor, width: 1);
        }
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(color: borderColor, width: 2);
        }
        return BorderSide(color: borderColor, width: 1);
      }),
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radiusMd),
      minimumSize: Size(config.minWidth, config.height),
      maximumSize: Size.infinite,
      padding: config.padding,
      textStyle: config.textStyle,
      animationDuration: AppTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return textColor.withOpacity(0.04);
        }
        if (states.contains(WidgetState.focused)) {
          return textColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return textColor.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n ghost
  static ButtonStyle _ghostStyle(_ButtonSizeConfig config, bool isDark) {
    final textColor =
        isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary;
    final disabledTextColor =
        isDark ? AppColors.gray400 : AppColors.textDisabled;

    return TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: textColor,
      disabledForegroundColor: disabledTextColor,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radiusMd),
      minimumSize: Size(config.minWidth, config.height),
      maximumSize: Size.infinite,
      padding: config.padding,
      textStyle: config.textStyle,
      animationDuration: AppTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return textColor.withOpacity(0.04);
        }
        if (states.contains(WidgetState.focused)) {
          return textColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return textColor.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n danger
  static ButtonStyle _dangerStyle(_ButtonSizeConfig config, bool isDark) {
    final dangerColor = isDark ? AppColors.errorDarkMode : AppColors.error;
    final onDangerColor =
        isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) return disabledColor;
        return dangerColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return isDark ? AppColors.gray400 : AppColors.textDisabled;
        }
        return onDangerColor;
      }),
      elevation: MaterialStateProperty.resolveWith<double>((states) {
        if (states.contains(MaterialState.disabled)) return 0;
        if (states.contains(MaterialState.pressed)) return 8;
        if (states.contains(MaterialState.hovered)) return 4;
        if (states.contains(MaterialState.focused)) return 4;
        return 2;
      }),
      shadowColor: isDark ? Colors.black : AppColors.shadow,
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radiusMd),
      minimumSize: Size(config.minWidth, config.height),
      maximumSize: Size.infinite,
      padding: config.padding,
      textStyle: config.textStyle,
      animationDuration: AppTheme.durationFast,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return onDangerColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return onDangerColor.withOpacity(0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return onDangerColor.withOpacity(0.16);
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
  static Duration get hoverAnimationDuration => AppTheme.durationFast;

  /// Duraci�n de animaci�n para tap effects
  static Duration get tapAnimationDuration => AppTheme.durationExtraFast;

  /// Curva de animaci�n para efectos interactivos
  static Curve get interactionCurve => AppTheme.curveStandard;

  // ==========================================================================
  // UTILIDADES DE COLOR
  // ==========================================================================

  /// Obtiene el color de texto apropiado para una variante
  static Color getTextColor(
      ButtonVariant variant, bool isDark, bool isDisabled) {
    if (isDisabled) {
      return isDark ? AppColors.gray400 : AppColors.textDisabled;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
      case ButtonVariant.secondary:
        return isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
      case ButtonVariant.outline:
        return isDark ? AppColors.primaryDarkMode : AppColors.primary;
      case ButtonVariant.ghost:
        return isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary;
      case ButtonVariant.danger:
        return isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    }
  }

  /// Obtiene el color de fondo para una variante
  static Color getBackgroundColor(
      ButtonVariant variant, bool isDark, bool isDisabled) {
    if (isDisabled) {
      return isDark ? AppColors.gray600 : AppColors.gray300;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return isDark ? AppColors.primaryDarkMode : AppColors.primary;
      case ButtonVariant.secondary:
        return isDark ? AppColors.secondaryDarkMode : AppColors.secondary;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.ghost:
        return Colors.transparent;
      case ButtonVariant.danger:
        return isDark ? AppColors.errorDarkMode : AppColors.error;
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
    String role = 'button';
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

/// Configuraci�n interna para tama�os de bot�n

