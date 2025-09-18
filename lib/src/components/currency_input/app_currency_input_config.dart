import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'app_currency_input_config.freezed.dart';

/// Configuración completa para el componente AppCurrencyInput
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento del input de moneda
@freezed
class AppCurrencyInputConfig with _$AppCurrencyInputConfig {
  const factory AppCurrencyInputConfig({
    @Default(AppCurrencyInputVariant.localized) AppCurrencyInputVariant variant,
    @Default(AppCurrencyInputState.defaultState) AppCurrencyInputState state,
    AppCurrencyInputColors? colors,
    AppCurrencyInputSpacing? spacing,
    AppCurrencyInputAnimation? animation,
    AppCurrencyInputBehavior? behavior,
    AppCurrencyInputA11yConfig? a11yConfig,
    AppCurrencyInputValidation? validation,
    AppCurrencyFormat? format,
  }) = _AppCurrencyInputConfig;

}

/// Variantes del input de moneda
enum AppCurrencyInputVariant {
  /// Versión localizada con formato automático según locale
  localized,
}

/// Estados interactivos del input
enum AppCurrencyInputState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (web/desktop)
  hover,

  /// Estado presionado
  pressed,

  /// Estado enfocado (entrada activa)
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado cargando
  loading,

  /// Estado skeleton (placeholder)
  skeleton,
}

/// Configuración de formato de moneda
@freezed
class AppCurrencyFormat with _$AppCurrencyFormat {
  const factory AppCurrencyFormat({
    required String currencyCode,
    String? symbol,
    @Default(2) int decimalDigits,
    @Default('\$') String fallbackSymbol,
    @Default(AppCurrencyDisplayType.symbol) AppCurrencyDisplayType displayType,
    @Default(true) bool showGroupingSeparator,
    @Default(AppCurrencyPosition.before) AppCurrencyPosition position,
    String? customPattern,
  }) = _AppCurrencyFormat;

}

/// Tipo de visualización de moneda
enum AppCurrencyDisplayType {
  /// Símbolo de moneda ($, €, ¥)
  symbol,

  /// Código de moneda (USD, EUR, JPY)
  code,

  /// Nombre completo (Dollar, Euro, Yen)
  name,

  /// Símbolo estrecho ($ en lugar de US$)
  narrowSymbol,
}

/// Posición del símbolo de moneda
enum AppCurrencyPosition {
  /// Antes del monto ($100)
  before,

  /// Después del monto (100$)
  after,
}

/// Configuración de colores del input
@freezed
class AppCurrencyInputColors with _$AppCurrencyInputColors {
  const factory AppCurrencyInputColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? disabledBackgroundColor,
    Color? disabledBorderColor,
    Color? shadowColor,
    Color? labelColor,
    Color? disabledLabelColor,
    Color? hintColor,
    Color? textColor,
    Color? disabledTextColor,
    Color? helperColor,
    Color? currencyColor,
    Color? currencySymbolColor,
    Color? errorColor,
    Color? successColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? prefixIconColor,
    Color? suffixIconColor,
    Color? selectionColor,
    Color? cursorColor,
  }) = _AppCurrencyInputColors;
}

/// Configuración de espaciado del input
@freezed
class AppCurrencyInputSpacing with _$AppCurrencyInputSpacing {
  const factory AppCurrencyInputSpacing({
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 12)) EdgeInsets padding,
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 12)) EdgeInsets contentPadding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(12.0) double borderRadius,
    @Default(1.0) double borderWidth,
    @Default(2.0) double focusedBorderWidth,
    @Default(2.0) double focusBorderWidth,
    @Default(4.0) double elevation,
    @Default(8.0) double labelSpacing,
    @Default(4.0) double helperSpacing,
    @Default(8.0) double currencySpacing,
    @Default(48.0) double minHeight,
    @Default(24.0) double iconSize,
  }) = _AppCurrencyInputSpacing;

}

/// Configuración de animaciones
@freezed
class AppCurrencyInputAnimation with _$AppCurrencyInputAnimation {
  const factory AppCurrencyInputAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Duration(milliseconds: 200)) Duration transitionDuration,
    @Default(Duration(milliseconds: 150)) Duration hoverDuration,
    @Default(Duration(milliseconds: 300)) Duration loadingDuration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Curves.easeInOut) Curve transitionCurve,
    @Default(Curves.easeOut) Curve hoverCurve,
    @Default(true) bool enableRippleEffect,
    @Default(true) bool enableFocusAnimation,
    @Default(true) bool enableLoadingAnimation,
    @Default(true) bool enableScaleAnimation,
    @Default(1.01) double hoverScale,
    @Default(0.99) double pressScale,
  }) = _AppCurrencyInputAnimation;

}

/// Configuración de comportamiento
@freezed
class AppCurrencyInputBehavior with _$AppCurrencyInputBehavior {
  const factory AppCurrencyInputBehavior({
    @Default(true) bool autoFormat,
    @Default(true) bool allowNegative,
    @Default(false) bool allowZero,
    @Default(true) bool showCurrencySymbol,
    @Default(true) bool enableGroupingSeparator,
    @Default(false) bool selectAllOnFocus,
    @Default(true) bool clearSelectionOnInput,
    @Default(TextInputAction.next) TextInputAction textInputAction,
    @Default(false) bool submitOnEnter,
    @Default(true) bool enableAutocorrect,
    @Default(true) bool enableSuggestions,
    @Default(1000000000.0) double maxValue,
    @Default(0.0) double minValue,
  }) = _AppCurrencyInputBehavior;

}

/// Configuración de accesibilidad
@freezed
class AppCurrencyInputA11yConfig with _$AppCurrencyInputA11yConfig {
  const factory AppCurrencyInputA11yConfig({
    @Default(true) bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    String? customLabel,
    String? customHint,
    @Default(true) bool announceFormatChanges,
    @Default(true) bool announceValueChanges,
    @Default(true) bool announceValidationErrors,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool enableKeyboardActivation,
    @Default(true) bool enableKeyboardSelection,
    @Default(true) bool enableKeyboardIncrement,
    @Default(true) bool enableStateAnnouncements,
    @Default(true) bool enableValueAnnouncements,
    @Default(true) bool enableErrorAnnouncements,
    @Default('Campo de entrada de moneda') String defaultLabel,
    @Default('Ingrese el monto en') String amountLabel,
    @Default('Moneda seleccionada:') String currencyLabel,
    @Default('Monto inválido') String invalidAmountLabel,
  }) = _AppCurrencyInputA11yConfig;

}

/// Configuración de validación
@freezed
class AppCurrencyInputValidation with _$AppCurrencyInputValidation {
  const factory AppCurrencyInputValidation({
    @Default(true) bool enabled,
    @Default(true) bool validateOnChange,
    @Default(true) bool validateOnSubmit,
    @Default(true) bool showErrorMessage,
    String? customErrorMessage,
    double? minAmount,
    double? maxAmount,
    List<String>? allowedCurrencies,
    List<String>? blockedCurrencies,
  }) = _AppCurrencyInputValidation;

}

/// Resultado de validación
@freezed
class AppCurrencyInputValidationResult with _$AppCurrencyInputValidationResult {
  const factory AppCurrencyInputValidationResult({
    required bool isValid,
    String? errorMessage,
    @Default(AppCurrencyInputValidationLevel.none) AppCurrencyInputValidationLevel level,
  }) = _AppCurrencyInputValidationResult;

}

/// Niveles de validación
enum AppCurrencyInputValidationLevel {
  none,
  info,
  warning,
  error,
  success,
}

/// Valor del input de moneda
@freezed
class AppCurrencyInputValue with _$AppCurrencyInputValue {
  const factory AppCurrencyInputValue({
    required double amount,
    required String currencyCode,
    String? formattedValue,
    String? rawValue,
    required Locale locale,
  }) = _AppCurrencyInputValue;

}

/// Extensiones para AppCurrencyInputVariant
extension AppCurrencyInputVariantExtensions on AppCurrencyInputVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCurrencyInputVariant.localized:
        return 'Localizado';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case AppCurrencyInputVariant.localized:
        return 'Input de moneda con formato automático según locale';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case AppCurrencyInputVariant.localized:
        return Icons.attach_money;
    }
  }

  /// Si soporta múltiples monedas
  bool get supportsMultipleCurrencies {
    return this == AppCurrencyInputVariant.localized;
  }
}

/// Extensiones para AppCurrencyInputState
extension AppCurrencyInputStateExtensions on AppCurrencyInputState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCurrencyInputState.defaultState:
        return 'Normal';
      case AppCurrencyInputState.hover:
        return 'Hover';
      case AppCurrencyInputState.pressed:
        return 'Presionado';
      case AppCurrencyInputState.focus:
        return 'Enfocado';
      case AppCurrencyInputState.selected:
        return 'Seleccionado';
      case AppCurrencyInputState.disabled:
        return 'Deshabilitado';
      case AppCurrencyInputState.loading:
        return 'Cargando';
      case AppCurrencyInputState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado permite interacción
  bool get isInteractive {
    switch (this) {
      case AppCurrencyInputState.defaultState:
      case AppCurrencyInputState.hover:
      case AppCurrencyInputState.pressed:
      case AppCurrencyInputState.focus:
      case AppCurrencyInputState.selected:
        return true;
      case AppCurrencyInputState.disabled:
      case AppCurrencyInputState.loading:
      case AppCurrencyInputState.skeleton:
        return false;
    }
  }

  /// Si el estado muestra loading
  bool get isLoading {
    return this == AppCurrencyInputState.loading;
  }

  /// Si el estado muestra skeleton
  bool get isSkeleton {
    return this == AppCurrencyInputState.skeleton;
  }

  /// Opacidad del estado
  double get opacity {
    switch (this) {
      case AppCurrencyInputState.disabled:
        return 0.5;
      case AppCurrencyInputState.loading:
        return 0.7;
      default:
        return 1.0;
    }
  }
}

/// Extensiones para AppCurrencyFormat
extension AppCurrencyFormatExtensions on AppCurrencyFormat {
  /// Obtiene el símbolo de moneda efectivo
  String getEffectiveSymbol(Locale locale) {
    if (symbol != null) return symbol!;

    try {
      final format = NumberFormat.currency(
        locale: locale.toString(),
        name: currencyCode,
      );
      return format.currencySymbol;
    } catch (e) {
      return fallbackSymbol;
    }
  }

  /// Formatea un monto según la configuración
  String formatAmount(double amount, Locale locale) {
    try {
      final format = NumberFormat.currency(
        locale: locale.toString(),
        name: currencyCode,
        symbol: getEffectiveSymbol(locale),
        decimalDigits: decimalDigits,
      );

      if (customPattern != null) {
        final customFormat = NumberFormat(customPattern, locale.toString());
        return customFormat.format(amount);
      }

      return format.format(amount);
    } catch (e) {
      // Fallback manual
      final symbolStr = getEffectiveSymbol(locale);
      final amountStr = amount.toStringAsFixed(decimalDigits);

      return position == AppCurrencyPosition.before
          ? '$symbolStr$amountStr'
          : '$amountStr$symbolStr';
    }
  }

  /// Parsea una string a double
  double? parseAmount(String input, Locale locale) {
    try {
      final format = NumberFormat.currency(
        locale: locale.toString(),
        name: currencyCode,
      );
      return format.parse(input).toDouble();
    } catch (e) {
      // Fallback: remover símbolos y parsear
      final cleanInput = input
          .replaceAll(getEffectiveSymbol(locale), '')
          .replaceAll(RegExp(r'[^\d.,\-]'), '')
          .replaceAll(',', '.');

      return double.tryParse(cleanInput);
    }
  }

  /// Si la moneda soporta decimales
  bool get supportsDecimals {
    return decimalDigits > 0;
  }

  /// Patrón regex para validar input
  String getValidationPattern(Locale locale) {
    final symbol = RegExp.escape(getEffectiveSymbol(locale));
    if (supportsDecimals) {
      return r'^' + symbol + r'?\s*\d{1,3}(,\d{3})*(\.\d{0,' +
             decimalDigits.toString() + r'})?$';
    } else {
      return r'^' + symbol + r'?\s*\d{1,3}(,\d{3})*$';
    }
  }
}

/// Extensiones para AppCurrencyInputValue
extension AppCurrencyInputValueExtensions on AppCurrencyInputValue {
  /// Si el valor está vacío
  bool get isEmpty {
    return amount == 0.0 && (formattedValue?.isEmpty ?? true);
  }

  /// Si el valor es positivo
  bool get isPositive {
    return amount > 0;
  }

  /// Si el valor es negativo
  bool get isNegative {
    return amount < 0;
  }

  /// Si el valor es cero
  bool get isZero {
    return amount == 0;
  }

  /// Formatea el valor según locale
  String formatForLocale(Locale targetLocale) {
    if (formattedValue != null && locale == targetLocale) {
      return formattedValue!;
    }

    try {
      final format = NumberFormat.currency(
        locale: targetLocale.toString(),
        name: currencyCode,
      );
      return format.format(amount);
    } catch (e) {
      return '$amount $currencyCode';
    }
  }

  /// Crea una copia con nuevo monto
  AppCurrencyInputValue copyWithAmount(double newAmount) {
    return copyWith(
      amount: newAmount,
      formattedValue: null, // Se recalculará
      rawValue: newAmount.toString(),
    );
  }

  /// Crea una copia con nueva moneda
  AppCurrencyInputValue copyWithCurrency(String newCurrencyCode) {
    return copyWith(
      currencyCode: newCurrencyCode,
      formattedValue: null, // Se recalculará
    );
  }
}

/// Utilidades para el input de moneda
class AppCurrencyInputUtils {
  /// Lista de monedas comunes con sus símbolos
  static const Map<String, String> commonCurrencies = {
    'USD': '\$',
    'EUR': '€',
    'GBP': '£',
    'JPY': '¥',
    'CNY': '¥',
    'KRW': '₩',
    'INR': '₹',
    'RUB': '₽',
    'BRL': 'R\$',
    'CAD': 'C\$',
    'AUD': 'A\$',
    'CHF': 'CHF',
    'MXN': '\$',
    'ARS': '\$',
    'COP': '\$',
    'PEN': 'S/',
    'CLP': '\$',
  };

  /// Valida un valor de moneda
  static AppCurrencyInputValidationResult validateValue(
    AppCurrencyInputValue value,
    AppCurrencyInputValidation validation,
  ) {
    if (!validation.enabled) {
      return const AppCurrencyInputValidationResult(isValid: true);
    }

    // Validar rango de monto
    if (validation.minAmount != null && value.amount < validation.minAmount!) {
      return AppCurrencyInputValidationResult(
        isValid: false,
        errorMessage: validation.customErrorMessage ??
            'El monto debe ser mayor a ${validation.minAmount}',
        level: AppCurrencyInputValidationLevel.error,
      );
    }

    if (validation.maxAmount != null && value.amount > validation.maxAmount!) {
      return AppCurrencyInputValidationResult(
        isValid: false,
        errorMessage: validation.customErrorMessage ??
            'El monto debe ser menor a ${validation.maxAmount}',
        level: AppCurrencyInputValidationLevel.error,
      );
    }

    // Validar monedas permitidas
    if (validation.allowedCurrencies != null &&
        !validation.allowedCurrencies!.contains(value.currencyCode)) {
      return AppCurrencyInputValidationResult(
        isValid: false,
        errorMessage: validation.customErrorMessage ??
            'Moneda ${value.currencyCode} no permitida',
        level: AppCurrencyInputValidationLevel.error,
      );
    }

    // Validar monedas bloqueadas
    if (validation.blockedCurrencies != null &&
        validation.blockedCurrencies!.contains(value.currencyCode)) {
      return AppCurrencyInputValidationResult(
        isValid: false,
        errorMessage: validation.customErrorMessage ??
            'Moneda ${value.currencyCode} no disponible',
        level: AppCurrencyInputValidationLevel.error,
      );
    }

    return const AppCurrencyInputValidationResult(
      isValid: true,
      level: AppCurrencyInputValidationLevel.success,
    );
  }

  /// Formatea un valor para mostrar
  static String formatValueForDisplay(
    double amount,
    String currencyCode,
    Locale locale, {
    int? decimalDigits,
    bool showSymbol = true,
  }) {
    try {
      final format = NumberFormat.currency(
        locale: locale.toString(),
        name: currencyCode,
        symbol: showSymbol ? null : '',
        decimalDigits: decimalDigits,
      );
      return format.format(amount);
    } catch (e) {
      final symbol = showSymbol ? (commonCurrencies[currencyCode] ?? currencyCode) : '';
      final amountStr = amount.toStringAsFixed(decimalDigits ?? 2);
      return '$symbol$amountStr';
    }
  }

  /// Parsea una string de input a valor numérico
  static double? parseInputValue(String input, Locale locale) {
    if (input.isEmpty) return null;

    try {
      // Intentar parse directo primero
      final directParse = double.tryParse(input);
      if (directParse != null) return directParse;

      // Limpiar la string de símbolos comunes
      String cleaned = input;
      for (final symbol in commonCurrencies.values) {
        cleaned = cleaned.replaceAll(symbol, '');
      }

      // Remover espacios y caracteres no numéricos excepto . , -
      cleaned = cleaned.replaceAll(RegExp(r'[^\d.,-]'), '');

      // Manejar separadores decimales según locale
      if (locale.toString().startsWith('en')) {
        // Formato inglés: 1,234.56
        cleaned = cleaned.replaceAll(',', '');
      } else {
        // Formato europeo: 1.234,56
        if (cleaned.contains(',') && cleaned.contains('.')) {
          // Si tiene ambos, . es separador de miles, , es decimal
          cleaned = cleaned.replaceAll('.', '').replaceAll(',', '.');
        } else if (cleaned.contains(',')) {
          // Solo coma, probablemente decimal
          cleaned = cleaned.replaceAll(',', '.');
        }
      }

      return double.tryParse(cleaned);
    } catch (e) {
      return null;
    }
  }

  /// Obtiene el símbolo de una moneda
  static String getCurrencySymbol(String currencyCode, [Locale? locale]) {
    // Primero revisar nuestro mapa de monedas comunes
    if (commonCurrencies.containsKey(currencyCode)) {
      return commonCurrencies[currencyCode]!;
    }

    // Intentar con NumberFormat si se proporciona locale
    if (locale != null) {
      try {
        final format = NumberFormat.currency(
          locale: locale.toString(),
          name: currencyCode,
        );
        return format.currencySymbol;
      } catch (e) {
        // Fallback al código
      }
    }

    return currencyCode;
  }

  /// Crea un input formatter para moneda
  static List<TextInputFormatter> createInputFormatters(
    AppCurrencyFormat format,
    Locale locale,
    AppCurrencyInputBehavior behavior,
  ) {
    final formatters = <TextInputFormatter>[];

    // Filtrar solo dígitos, punto, coma y símbolo de moneda
    final allowedChars = RegExp(r'[\d.,\-\s]');
    formatters.add(FilteringTextInputFormatter.allow(allowedChars));

    // Limitar a valores razonables
    if (behavior.maxValue < double.infinity) {
      formatters.add(
        FilteringTextInputFormatter.deny(
          RegExp(r'^\d{10,}'), // Más de 10 dígitos
        ),
      );
    }

    // Formatter personalizado para formato de moneda
    formatters.add(_CurrencyInputFormatter(format, locale, behavior));

    return formatters;
  }

  /// Detecta el locale desde el código de moneda
  static Locale? detectLocaleFromCurrency(String currencyCode) {
    const currencyLocales = {
      'USD': Locale('en', 'US'),
      'EUR': Locale('en', 'EU'),
      'GBP': Locale('en', 'GB'),
      'JPY': Locale('ja', 'JP'),
      'CNY': Locale('zh', 'CN'),
      'KRW': Locale('ko', 'KR'),
      'INR': Locale('hi', 'IN'),
      'RUB': Locale('ru', 'RU'),
      'BRL': Locale('pt', 'BR'),
      'CAD': Locale('en', 'CA'),
      'AUD': Locale('en', 'AU'),
      'MXN': Locale('es', 'MX'),
      'ARS': Locale('es', 'AR'),
      'COP': Locale('es', 'CO'),
    };

    return currencyLocales[currencyCode];
  }
}

/// Formatter personalizado para input de moneda
class _CurrencyInputFormatter extends TextInputFormatter {
  final AppCurrencyFormat format;
  final Locale locale;
  final AppCurrencyInputBehavior behavior;

  _CurrencyInputFormatter(this.format, this.locale, this.behavior);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Parsear el valor numérico
    final numericValue = AppCurrencyInputUtils.parseInputValue(
      newValue.text,
      locale,
    );

    if (numericValue == null) {
      return oldValue; // Revertir si no es válido
    }

    // Aplicar límites
    final clampedValue = math.max(
      behavior.minValue,
      math.min(behavior.maxValue, numericValue),
    );

    // Formatear el valor
    if (behavior.autoFormat) {
      final formatted = format.formatAmount(clampedValue, locale);

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }

    return newValue;
  }
}