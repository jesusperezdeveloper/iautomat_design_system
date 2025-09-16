import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../../theme/typography.dart';
import '../../theme/app_theme.dart';

/// Enumeraci�n para las variantes de botones disponibles
enum ButtonVariant {
  /// Bot�n principal - Para acciones primarias importantes
  primary,

  /// Bot�n secundario - Para acciones secundarias
  secondary,

  /// Bot�n con borde - Para acciones alternativas
  outline,

  /// Bot�n fantasma - Para acciones sutiles
  ghost,

  /// Bot�n de peligro - Para acciones destructivas
  danger,
}

/// Enumeraci�n para los tama�os de botones disponibles
enum ButtonSize {
  /// Bot�n peque�o - Para espacios reducidos
  small,

  /// Bot�n mediano - Tama�o est�ndar
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
  // CONFIGURACI�N DE TAMA�OS
  // ==========================================================================

  /// Configuraci�n de dimensiones seg�n el tama�o del bot�n
  static Map<ButtonSize, _ButtonSizeConfig> get _sizeConfigs => {
        ButtonSize.small: _ButtonSizeConfig(
          height: 32,
          minWidth: 64,
          padding: AppSpacing.buttonPaddingSmall,
          textStyle: AppTypography.labelSmall,
          iconSize: 16,
        ),
        ButtonSize.medium: _ButtonSizeConfig(
          height: 40,
          minWidth: 80,
          padding: AppSpacing.buttonPadding,
          textStyle: AppTypography.button,
          iconSize: 20,
        ),
        ButtonSize.large: _ButtonSizeConfig(
          height: 48,
          minWidth: 120,
          padding: AppSpacing.buttonPaddingLarge,
          textStyle: AppTypography.labelLarge,
          iconSize: 24,
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
    final onPrimaryColor = isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;

    return ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
      disabledBackgroundColor: disabledColor,
      disabledForegroundColor: isDark ? AppColors.gray400 : AppColors.textDisabled,

      // Elevaci�n
      elevation: 2,
      focusElevation: 4,
      hoverElevation: 4,
      highlightElevation: 8,
      disabledElevation: 0,

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
    final secondaryColor = isDark ? AppColors.secondaryDarkMode : AppColors.secondary;
    final onSecondaryColor = isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;

    return ElevatedButton.styleFrom(
      backgroundColor: secondaryColor,
      foregroundColor: onSecondaryColor,
      disabledBackgroundColor: disabledColor,
      disabledForegroundColor: isDark ? AppColors.gray400 : AppColors.textDisabled,

      elevation: 1,
      focusElevation: 3,
      hoverElevation: 3,
      highlightElevation: 6,
      disabledElevation: 0,

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
    final disabledTextColor = isDark ? AppColors.gray400 : AppColors.textDisabled;

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

      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.hovered)) {
          return textColor.withOpacity(0.04);
        }
        if (states.contains(MaterialState.focused)) {
          return textColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.pressed)) {
          return textColor.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n ghost
  static ButtonStyle _ghostStyle(_ButtonSizeConfig config, bool isDark) {
    final textColor = isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary;
    final disabledTextColor = isDark ? AppColors.gray400 : AppColors.textDisabled;

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

      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.hovered)) {
          return textColor.withOpacity(0.04);
        }
        if (states.contains(MaterialState.focused)) {
          return textColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.pressed)) {
          return textColor.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  /// Estilo para bot�n danger
  static ButtonStyle _dangerStyle(_ButtonSizeConfig config, bool isDark) {
    final dangerColor = isDark ? AppColors.errorDarkMode : AppColors.error;
    final onDangerColor = isDark ? AppColors.backgroundDarkMode : AppColors.textOnColor;
    final disabledColor = isDark ? AppColors.gray600 : AppColors.gray300;

    return ElevatedButton.styleFrom(
      backgroundColor: dangerColor,
      foregroundColor: onDangerColor,
      disabledBackgroundColor: disabledColor,
      disabledForegroundColor: isDark ? AppColors.gray400 : AppColors.textDisabled,

      elevation: 2,
      focusElevation: 4,
      hoverElevation: 4,
      highlightElevation: 8,
      disabledElevation: 0,

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
          return onDangerColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return onDangerColor.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
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
  static Color getTextColor(ButtonVariant variant, bool isDark, bool isDisabled) {
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
  static Color getBackgroundColor(ButtonVariant variant, bool isDark, bool isDisabled) {
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
class _ButtonSizeConfig {
  final double height;
  final double minWidth;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final double iconSize;

  const _ButtonSizeConfig({
    required this.height,
    required this.minWidth,
    required this.padding,
    required this.textStyle,
    required this.iconSize,
  });
}