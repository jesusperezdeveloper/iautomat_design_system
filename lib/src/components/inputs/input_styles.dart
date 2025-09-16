import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../../theme/typography.dart';
import '../../theme/app_theme.dart';

/// Enumeración para los tipos de input disponibles
enum InputType {
  /// Input de texto normal
  text,

  /// Input para email con teclado optimizado
  email,

  /// Input para contrase�a con ocultamiento de texto
  password,

  /// Input para n�meros con teclado num�rico
  number,

  /// Input de texto m�ltiple l�neas
  multiline,

  /// Input para b�squeda con iconograf�a espec�fica
  search,

  /// Input para URLs con validaci�n espec�fica
  url,

  /// Input para tel�fonos con formato espec�fico
  phone,
}

/// Enumeraci�n para los estados visuales del input
enum InputState {
  /// Estado normal, sin interacci�n
  normal,

  /// Estado cuando el input tiene focus
  focused,

  /// Estado cuando hay un error de validaci�n
  error,

  /// Estado deshabilitado
  disabled,

  /// Estado de solo lectura
  readonly,

  /// Estado de �xito (validaci�n pasada)
  success,
}

/// Sistema de estilos para AppInput
///
/// Proporciona decoraciones consistentes para todos los estados
/// y tipos de inputs en el Design System, incluyendo:
/// - Colores espec�ficos por estado
/// - Transiciones suaves entre estados
/// - Decoraciones adaptadas al tema (light/dark)
/// - Configuraciones espec�ficas por tipo de input
/// - Animaciones y efectos visuales
class AppInputStyles {
  AppInputStyles._();

  // ==========================================================================
  // CONFIGURACIONES GENERALES
  // ==========================================================================

  /// Duraci�n de las transiciones entre estados
  static const Duration transitionDuration = AppTheme.durationFast;

  /// Curva de animaci�n para transiciones
  static const Curve transitionCurve = AppTheme.curveStandard;

  /// Radio de borde est�ndar para inputs
  static const BorderRadius borderRadius = AppTheme.radiusMd;

  /// Ancho del borde en estado normal
  static const double normalBorderWidth = 1.0;

  /// Ancho del borde en estado focused/error
  static const double focusedBorderWidth = 2.0;

  // ==========================================================================
  // CONFIGURACI�N DE TECLADOS POR TIPO
  // ==========================================================================

  /// Obtiene el tipo de teclado apropiado para cada InputType
  static TextInputType getKeyboardType(InputType type) {
    switch (type) {
      case InputType.text:
        return TextInputType.text;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.password:
        return TextInputType.visiblePassword;
      case InputType.number:
        return TextInputType.number;
      case InputType.multiline:
        return TextInputType.multiline;
      case InputType.search:
        return TextInputType.text;
      case InputType.url:
        return TextInputType.url;
      case InputType.phone:
        return TextInputType.phone;
    }
  }

  /// Obtiene la acci�n del teclado apropiada para cada InputType
  static TextInputAction getTextInputAction(InputType type, bool isMultiline) {
    if (isMultiline) return TextInputAction.newline;

    switch (type) {
      case InputType.email:
        return TextInputAction.next;
      case InputType.password:
        return TextInputAction.done;
      case InputType.search:
        return TextInputAction.search;
      case InputType.url:
        return TextInputAction.go;
      default:
        return TextInputAction.next;
    }
  }

  // ==========================================================================
  // DECORACIONES POR ESTADO
  // ==========================================================================

  /// Obtiene la decoraci�n completa para un estado espec�fico
  static InputDecoration getDecoration({
    required InputState state,
    required bool isDark,
    String? label,
    String? hint,
    String? helper,
    String? error,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? prefixText,
    String? suffixText,
    Widget? prefix,
    Widget? suffix,
    bool showCounter = false,
    int? maxLength,
    int? currentLength,
  }) {
    final colors = _getColorsForState(state, isDark);

    return InputDecoration(
      // Textos
      labelText: label,
      labelStyle: _getLabelStyle(state, isDark),
      floatingLabelStyle: _getFloatingLabelStyle(state, isDark),
      hintText: hint,
      hintStyle: _getHintStyle(isDark),
      helperText: helper,
      helperStyle: _getHelperStyle(isDark),
      errorText: error,
      errorStyle: _getErrorStyle(isDark),
      errorMaxLines: 2,

      // �conos y widgets
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      prefixText: prefixText,
      suffixText: suffixText,
      prefix: prefix,
      suffix: suffix,

      // Estilos de prefijo/sufijo
      prefixStyle: _getPrefixSuffixStyle(isDark),
      suffixStyle: _getPrefixSuffixStyle(isDark),

      // Counter
      counterText: showCounter && maxLength != null
          ? '${currentLength ?? 0}/$maxLength'
          : null,
      counterStyle: _getCounterStyle(state, isDark, currentLength, maxLength),

      // Background
      filled: true,
      fillColor: colors.fillColor,

      // Padding
      contentPadding: AppSpacing.inputPadding,
      isDense: false,

      // Bordes
      border: _getBorder(colors.borderColor, normalBorderWidth),
      enabledBorder: _getBorder(colors.borderColor, normalBorderWidth),
      focusedBorder: _getBorder(colors.focusedBorderColor, focusedBorderWidth),
      errorBorder: _getBorder(colors.errorBorderColor, normalBorderWidth),
      focusedErrorBorder:
          _getBorder(colors.errorBorderColor, focusedBorderWidth),
      disabledBorder: _getBorder(colors.disabledBorderColor, normalBorderWidth),

      // Constraints
      constraints: const BoxConstraints(
        minHeight: 48,
      ),
    );
  }

  /// Crea un OutlineInputBorder con los par�metros especificados
  static OutlineInputBorder _getBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  // ==========================================================================
  // ESTILOS DE TEXTO
  // ==========================================================================

  /// Estilo para el label en diferentes estados
  static TextStyle _getLabelStyle(InputState state, bool isDark) {
    Color color;

    switch (state) {
      case InputState.error:
        color = isDark ? AppColors.errorDarkMode : AppColors.error;
        break;
      case InputState.focused:
        color = isDark ? AppColors.primaryDarkMode : AppColors.primary;
        break;
      case InputState.disabled:
        color = isDark ? AppColors.gray500 : AppColors.gray400;
        break;
      case InputState.success:
        color = isDark ? AppColors.successDarkMode : AppColors.success;
        break;
      default:
        color =
            isDark ? AppColors.textSecondaryDarkMode : AppColors.textSecondary;
    }

    return AppTypography.withColor(AppTypography.labelMedium, color);
  }

  /// Estilo para el floating label
  static TextStyle _getFloatingLabelStyle(InputState state, bool isDark) {
    Color color;

    switch (state) {
      case InputState.error:
        color = isDark ? AppColors.errorDarkMode : AppColors.error;
        break;
      case InputState.focused:
        color = isDark ? AppColors.primaryDarkMode : AppColors.primary;
        break;
      case InputState.success:
        color = isDark ? AppColors.successDarkMode : AppColors.success;
        break;
      default:
        color = isDark ? AppColors.primaryDarkMode : AppColors.primary;
    }

    return AppTypography.withColor(AppTypography.labelSmall, color);
  }

  /// Estilo para el hint text
  static TextStyle _getHintStyle(bool isDark) {
    final color =
        isDark ? AppColors.textTertiaryDarkMode : AppColors.textTertiary;
    return AppTypography.withColor(AppTypography.bodyMedium, color);
  }

  /// Estilo para el helper text
  static TextStyle _getHelperStyle(bool isDark) {
    final color =
        isDark ? AppColors.textTertiaryDarkMode : AppColors.textTertiary;
    return AppTypography.withColor(AppTypography.caption, color);
  }

  /// Estilo para el error text
  static TextStyle _getErrorStyle(bool isDark) {
    final color = isDark ? AppColors.errorDarkMode : AppColors.error;
    return AppTypography.withColor(AppTypography.caption, color);
  }

  /// Estilo para prefix/suffix text
  static TextStyle _getPrefixSuffixStyle(bool isDark) {
    final color =
        isDark ? AppColors.textSecondaryDarkMode : AppColors.textSecondary;
    return AppTypography.withColor(AppTypography.bodyMedium, color);
  }

  /// Estilo para el counter
  static TextStyle _getCounterStyle(
    InputState state,
    bool isDark,
    int? currentLength,
    int? maxLength,
  ) {
    Color color;

    if (state == InputState.error ||
        (currentLength != null &&
            maxLength != null &&
            currentLength > maxLength)) {
      color = isDark ? AppColors.errorDarkMode : AppColors.error;
    } else {
      color = isDark ? AppColors.textTertiaryDarkMode : AppColors.textTertiary;
    }

    return AppTypography.withColor(AppTypography.caption, color);
  }

  // ==========================================================================
  // COLORES POR ESTADO
  // ==========================================================================

  /// Colores para cada estado del input
  static _InputColors _getColorsForState(InputState state, bool isDark) {
    switch (state) {
      case InputState.normal:
        return _InputColors(
          fillColor: isDark
              ? AppColors.backgroundTertiaryDarkMode
              : AppColors.surfaceVariant,
          borderColor: isDark ? AppColors.gray600 : AppColors.gray300,
          focusedBorderColor:
              isDark ? AppColors.primaryDarkMode : AppColors.primary,
          errorBorderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          disabledBorderColor: isDark ? AppColors.gray700 : AppColors.gray200,
          textColor:
              isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary,
          iconColor: isDark
              ? AppColors.textSecondaryDarkMode
              : AppColors.textSecondary,
        );

      case InputState.focused:
        return _InputColors(
          fillColor: isDark
              ? AppColors.backgroundTertiaryDarkMode
              : AppColors.surfaceVariant,
          borderColor: isDark ? AppColors.primaryDarkMode : AppColors.primary,
          focusedBorderColor:
              isDark ? AppColors.primaryDarkMode : AppColors.primary,
          errorBorderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          disabledBorderColor: isDark ? AppColors.gray700 : AppColors.gray200,
          textColor:
              isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary,
          iconColor: isDark ? AppColors.primaryDarkMode : AppColors.primary,
        );

      case InputState.error:
        return _InputColors(
          fillColor: isDark
              ? AppColors.errorDarkMode.withOpacity(0.05)
              : AppColors.errorLight.withOpacity(0.05),
          borderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          focusedBorderColor:
              isDark ? AppColors.errorDarkMode : AppColors.error,
          errorBorderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          disabledBorderColor: isDark ? AppColors.gray700 : AppColors.gray200,
          textColor:
              isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary,
          iconColor: isDark ? AppColors.errorDarkMode : AppColors.error,
        );

      case InputState.success:
        return _InputColors(
          fillColor: isDark
              ? AppColors.successDarkMode.withOpacity(0.05)
              : AppColors.successLight.withOpacity(0.05),
          borderColor: isDark ? AppColors.successDarkMode : AppColors.success,
          focusedBorderColor:
              isDark ? AppColors.successDarkMode : AppColors.success,
          errorBorderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          disabledBorderColor: isDark ? AppColors.gray700 : AppColors.gray200,
          textColor:
              isDark ? AppColors.textPrimaryDarkMode : AppColors.textPrimary,
          iconColor: isDark ? AppColors.successDarkMode : AppColors.success,
        );

      case InputState.disabled:
        return _InputColors(
          fillColor: isDark ? AppColors.gray700 : AppColors.gray100,
          borderColor: isDark ? AppColors.gray600 : AppColors.gray200,
          focusedBorderColor: isDark ? AppColors.gray600 : AppColors.gray200,
          errorBorderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          disabledBorderColor: isDark ? AppColors.gray700 : AppColors.gray200,
          textColor: isDark ? AppColors.gray400 : AppColors.textDisabled,
          iconColor: isDark ? AppColors.gray500 : AppColors.gray400,
        );

      case InputState.readonly:
        return _InputColors(
          fillColor:
              isDark ? AppColors.gray700.withOpacity(0.5) : AppColors.gray50,
          borderColor: isDark ? AppColors.gray600 : AppColors.gray300,
          focusedBorderColor: isDark ? AppColors.gray600 : AppColors.gray300,
          errorBorderColor: isDark ? AppColors.errorDarkMode : AppColors.error,
          disabledBorderColor: isDark ? AppColors.gray700 : AppColors.gray200,
          textColor: isDark
              ? AppColors.textSecondaryDarkMode
              : AppColors.textSecondary,
          iconColor:
              isDark ? AppColors.textTertiaryDarkMode : AppColors.textTertiary,
        );
    }
  }

  // ==========================================================================
  // ANIMACIONES
  // ==========================================================================

  /// Crear un AnimatedContainer para transiciones suaves de decoraci�n
  static Widget animatedDecoration({
    required Widget child,
    required InputState currentState,
    required InputState previousState,
  }) {
    return AnimatedContainer(
      duration: transitionDuration,
      curve: transitionCurve,
      child: child,
    );
  }

  /// Transici�n de color animada para �conos
  static Widget animatedIcon({
    required IconData icon,
    required InputState state,
    required bool isDark,
    double? size,
    VoidCallback? onTap,
  }) {
    final colors = _getColorsForState(state, isDark);

    return AnimatedContainer(
      duration: transitionDuration,
      curve: transitionCurve,
      child: IconButton(
        icon: Icon(icon),
        color: colors.iconColor,
        iconSize: size ?? 24,
        onPressed: onTap,
        constraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  // ==========================================================================
  // UTILIDADES
  // ==========================================================================

  /// Obtiene el estado apropiado basado en las condiciones del input
  static InputState getInputState({
    required bool hasError,
    required bool isFocused,
    required bool isEnabled,
    required bool isReadOnly,
    bool hasSuccess = false,
  }) {
    if (!isEnabled) return InputState.disabled;
    if (isReadOnly) return InputState.readonly;
    if (hasError) return InputState.error;
    if (hasSuccess && !isFocused) return InputState.success;
    if (isFocused) return InputState.focused;
    return InputState.normal;
  }

  /// Determina si debe mostrar el clear button
  static bool shouldShowClearButton({
    required String text,
    required bool isFocused,
    required bool showClearButton,
    required InputType type,
  }) {
    return showClearButton &&
        text.isNotEmpty &&
        isFocused &&
        type != InputType.password;
  }

  /// Obtiene el �cono apropiado para un tipo de input
  static IconData? getDefaultIcon(InputType type) {
    switch (type) {
      case InputType.email:
        return Icons.email_outlined;
      case InputType.password:
        return Icons.lock_outlined;
      case InputType.search:
        return Icons.search;
      case InputType.phone:
        return Icons.phone_outlined;
      case InputType.url:
        return Icons.link;
      default:
        return null;
    }
  }
}

/// Clase interna para agrupar colores de un estado espec�fico
class _InputColors {
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color disabledBorderColor;
  final Color textColor;
  final Color iconColor;

  const _InputColors({
    required this.fillColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.disabledBorderColor,
    required this.textColor,
    required this.iconColor,
  });
}
