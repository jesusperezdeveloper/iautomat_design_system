import 'package:iautomat_design_system/src/components/currency_input/app_currency_input_config.dart';

/// Helper para validación de valores de moneda
///
/// Proporciona métodos estáticos para validar valores del input de moneda
/// según las reglas definidas en la configuración
class DSCurrencyInputValidationHelper {
  /// Valida un valor de moneda según la configuración de validación
  static String? validate(
    DSCurrencyInputValue value,
    DSCurrencyInputValidation validation,
  ) {
    if (!validation.enabled) return null;

    final result = DSCurrencyInputUtils.validateValue(value, validation);

    if (!result.isValid) {
      return result.errorMessage;
    }

    return null;
  }

  /// Valida el formato del valor
  static bool isValidFormat(String text) {
    if (text.isEmpty) return true;

    // Permitir solo números, puntos, comas y espacios
    final validPattern = RegExp(r'^[\d\s.,]*$');
    return validPattern.hasMatch(text);
  }

  /// Valida que el valor esté en el rango permitido
  static bool isInRange(double value, double? min, double? max) {
    if (min != null && value < min) return false;
    if (max != null && value > max) return false;
    return true;
  }

  /// Valida que la moneda esté permitida
  static bool isCurrencyAllowed(
    String currencyCode,
    List<String>? allowedCurrencies,
    List<String>? blockedCurrencies,
  ) {
    if (blockedCurrencies != null && blockedCurrencies.contains(currencyCode)) {
      return false;
    }

    if (allowedCurrencies != null && !allowedCurrencies.contains(currencyCode)) {
      return false;
    }

    return true;
  }

  /// Obtiene el mensaje de error según el tipo de validación
  static String getErrorMessage(
    DSCurrencyInputValidationLevel level,
    String? customMessage,
  ) {
    if (customMessage != null) return customMessage;

    switch (level) {
      case DSCurrencyInputValidationLevel.error:
        return 'Valor inválido';
      case DSCurrencyInputValidationLevel.warning:
        return 'Advertencia en el valor';
      case DSCurrencyInputValidationLevel.info:
        return 'Información del valor';
      case DSCurrencyInputValidationLevel.success:
        return 'Valor válido';
      case DSCurrencyInputValidationLevel.none:
        return '';
    }
  }
}