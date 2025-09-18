import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_checkout_forms_config.freezed.dart';
part 'app_checkout_forms_config.g.dart';

/// Configuración completa para el componente AppCheckoutForms
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento de los formularios
@freezed
class AppCheckoutFormsConfig with _$AppCheckoutFormsConfig {
  const factory AppCheckoutFormsConfig({
    @Default(AppCheckoutVariant.address) AppCheckoutVariant variant,
    @Default(AppCheckoutState.defaultState) AppCheckoutState state,
    AppCheckoutColors? colors,
    AppCheckoutSpacing? spacing,
    AppCheckoutAnimation? animation,
    AppCheckoutBehavior? behavior,
    AppCheckoutA11yConfig? a11yConfig,
    AppCheckoutValidation? validation,
  }) = _AppCheckoutFormsConfig;

  factory AppCheckoutFormsConfig.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutFormsConfigFromJson(json);
}

/// Variantes del formulario de checkout
enum AppCheckoutVariant {
  /// Formulario de dirección (shipping/billing)
  address,

  /// Formulario de pago (tarjeta de crédito, etc.)
  payment,
}

/// Estados interactivos del formulario
enum AppCheckoutState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (web/desktop)
  hover,

  /// Estado presionado
  pressed,

  /// Estado enfocado (navegación por teclado)
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado cargando (procesando)
  loading,

  /// Estado skeleton (placeholder)
  skeleton,
}

/// Configuración de un campo del formulario
@freezed
class AppCheckoutField with _$AppCheckoutField {
  const factory AppCheckoutField({
    required String key,
    required String label,
    required AppCheckoutFieldType type,
    String? placeholder,
    String? initialValue,
    @Default(false) bool required,
    @Default(false) bool sensitive,
    @Default(true) bool enabled,
    @Default(false) bool readonly,
    @Default(1) int maxLines,
    int? maxLength,
    String? pattern,
    String? mask,
    List<String>? options,
    String? helperText,
    String? prefixText,
    String? suffixText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    @Default(1) int flex,
    Map<String, dynamic>? metadata,
  }) = _AppCheckoutField;

  factory AppCheckoutField.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutFieldFromJson(json);
}

/// Tipos de campos disponibles
enum AppCheckoutFieldType {
  text,
  email,
  phone,
  password,
  number,
  creditCard,
  expiryDate,
  cvv,
  postalCode,
  dropdown,
  checkbox,
  radio,
  datePicker,
  country,
  state,
  city,
}

/// Configuración de colores del formulario
@freezed
class AppCheckoutColors with _$AppCheckoutColors {
  const factory AppCheckoutColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? disabledBackgroundColor,
    Color? disabledBorderColor,
    Color? shadowColor,
    Color? labelColor,
    Color? hintColor,
    Color? textColor,
    Color? errorColor,
    Color? successColor,
    Color? warningColor,
    Color? helperTextColor,
    Color? requiredIndicatorColor,
    Color? prefixIconColor,
    Color? suffixIconColor,
    Color? placeholderColor,
    Color? dividerColor,
    Color? headerColor,
    Color? headerTextColor,
    Color? sectionBackgroundColor,
    Color? buttonPrimaryColor,
    Color? buttonSecondaryColor,
    Color? buttonTextColor,
    Color? loadingIndicatorColor,
    Color? skeletonColor,
  }) = _AppCheckoutColors;

  factory AppCheckoutColors.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutColorsFromJson(json);
}

/// Configuración de espaciado del formulario
@freezed
class AppCheckoutSpacing with _$AppCheckoutSpacing {
  const factory AppCheckoutSpacing({
    @Default(16.0) double padding,
    @Default(16.0) double margin,
    @Default(12.0) double fieldSpacing,
    @Default(24.0) double sectionSpacing,
    @Default(8.0) double labelSpacing,
    @Default(4.0) double helperSpacing,
    @Default(12.0) double iconSpacing,
    @Default(16.0) double buttonSpacing,
    @Default(8.0) double borderRadius,
    @Default(2.0) double borderWidth,
    @Default(4.0) double focusedBorderWidth,
  }) = _AppCheckoutSpacing;

  factory AppCheckoutSpacing.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutSpacingFromJson(json);
}

/// Configuración de animaciones
@freezed
class AppCheckoutAnimation with _$AppCheckoutAnimation {
  const factory AppCheckoutAnimation({
    @Default(Duration(milliseconds: 200)) Duration transitionDuration,
    @Default(Duration(milliseconds: 300)) Duration loadingDuration,
    @Default(Duration(milliseconds: 150)) Duration hoverDuration,
    @Default(Duration(milliseconds: 100)) Duration pressDuration,
    @Default(Curves.easeInOut) Curve transitionCurve,
    @Default(Curves.easeOut) Curve loadingCurve,
    @Default(true) bool enableAnimations,
    @Default(true) bool enableRippleEffect,
  }) = _AppCheckoutAnimation;

  factory AppCheckoutAnimation.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutAnimationFromJson(json);
}

/// Configuración de comportamiento
@freezed
class AppCheckoutBehavior with _$AppCheckoutBehavior {
  const factory AppCheckoutBehavior({
    @Default(true) bool autoValidate,
    @Default(false) bool validateOnChange,
    @Default(true) bool validateOnSubmit,
    @Default(true) bool showRequiredIndicator,
    @Default(true) bool showHelperText,
    @Default(true) bool enableAutofill,
    @Default(true) bool enableFormatting,
    @Default(true) bool enableMasking,
    @Default(false) bool submitOnEnter,
    @Default(AppCheckoutSubmitMode.manual) AppCheckoutSubmitMode submitMode,
    @Default(false) bool clearOnSubmit,
    @Default(true) bool focusNextFieldOnEnter,
    @Default(true) bool showProgressIndicator,
  }) = _AppCheckoutBehavior;

  factory AppCheckoutBehavior.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutBehaviorFromJson(json);
}

/// Modos de envío del formulario
enum AppCheckoutSubmitMode {
  manual,
  auto,
  onValidation,
}

/// Configuración de accesibilidad
@freezed
class AppCheckoutA11yConfig with _$AppCheckoutA11yConfig {
  const factory AppCheckoutA11yConfig({
    @Default(true) bool enabled,
    @Default(true) bool announceErrors,
    @Default(true) bool announceSuccess,
    @Default(true) bool announceValidation,
    @Default(true) bool supportScreenReader,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool enableSemanticLabels,
    @Default(true) bool enableHints,
    @Default(true) bool enableLiveRegions,
    @Default('Formulario de checkout') String formSemanticLabel,
    @Default('Campo requerido') String requiredFieldSemanticLabel,
    @Default('Campo válido') String validFieldSemanticLabel,
    @Default('Campo con error') String errorFieldSemanticLabel,
    @Default('Enviar formulario') String submitButtonSemanticLabel,
  }) = _AppCheckoutA11yConfig;

  factory AppCheckoutA11yConfig.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutA11yConfigFromJson(json);
}

/// Configuración de validación
@freezed
class AppCheckoutValidation with _$AppCheckoutValidation {
  const factory AppCheckoutValidation({
    @Default(true) bool enabled,
    @Default(true) bool showErrorMessages,
    @Default(true) bool showSuccessIndicators,
    @Default(false) bool strictMode,
    @Default(3) int maxRetries,
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) = _AppCheckoutValidation;

  factory AppCheckoutValidation.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutValidationFromJson(json);
}

/// Resultado de la validación de un campo
@freezed
class AppCheckoutFieldValidation with _$AppCheckoutFieldValidation {
  const factory AppCheckoutFieldValidation({
    required String fieldKey,
    required bool isValid,
    String? errorMessage,
    String? successMessage,
    @Default(AppCheckoutValidationLevel.none) AppCheckoutValidationLevel level,
  }) = _AppCheckoutFieldValidation;

  factory AppCheckoutFieldValidation.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutFieldValidationFromJson(json);
}

/// Niveles de validación
enum AppCheckoutValidationLevel {
  none,
  info,
  warning,
  error,
  success,
}

/// Datos del formulario
@freezed
class AppCheckoutFormData with _$AppCheckoutFormData {
  const factory AppCheckoutFormData({
    required Map<String, dynamic> values,
    required Map<String, AppCheckoutFieldValidation> validations,
    @Default(false) bool isValid,
    @Default(false) bool isDirty,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSubmitted,
    DateTime? lastModified,
    String? submissionId,
  }) = _AppCheckoutFormData;

  factory AppCheckoutFormData.fromJson(Map<String, dynamic> json) =>
      _$AppCheckoutFormDataFromJson(json);
}

/// Extensiones para AppCheckoutVariant
extension AppCheckoutVariantExtensions on AppCheckoutVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCheckoutVariant.address:
        return 'Dirección';
      case AppCheckoutVariant.payment:
        return 'Pago';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case AppCheckoutVariant.address:
        return 'Formulario para capturar información de dirección';
      case AppCheckoutVariant.payment:
        return 'Formulario para capturar información de pago';
    }
  }

  /// Campos por defecto según la variante
  List<AppCheckoutField> get defaultFields {
    switch (this) {
      case AppCheckoutVariant.address:
        return _defaultAddressFields;
      case AppCheckoutVariant.payment:
        return _defaultPaymentFields;
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case AppCheckoutVariant.address:
        return Icons.location_on;
      case AppCheckoutVariant.payment:
        return Icons.payment;
    }
  }
}

/// Campos por defecto para formulario de dirección
const List<AppCheckoutField> _defaultAddressFields = [
  AppCheckoutField(
    key: 'firstName',
    label: 'Nombre',
    type: AppCheckoutFieldType.text,
    placeholder: 'Ingresa tu nombre',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'lastName',
    label: 'Apellido',
    type: AppCheckoutFieldType.text,
    placeholder: 'Ingresa tu apellido',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'email',
    label: 'Email',
    type: AppCheckoutFieldType.email,
    placeholder: 'ejemplo@correo.com',
    required: true,
    flex: 2,
  ),
  AppCheckoutField(
    key: 'phone',
    label: 'Teléfono',
    type: AppCheckoutFieldType.phone,
    placeholder: '+1 (555) 123-4567',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'address1',
    label: 'Dirección',
    type: AppCheckoutFieldType.text,
    placeholder: 'Calle y número',
    required: true,
    flex: 2,
  ),
  AppCheckoutField(
    key: 'address2',
    label: 'Dirección 2',
    type: AppCheckoutFieldType.text,
    placeholder: 'Apartamento, suite, etc. (opcional)',
    required: false,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'city',
    label: 'Ciudad',
    type: AppCheckoutFieldType.city,
    placeholder: 'Ciudad',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'state',
    label: 'Estado/Provincia',
    type: AppCheckoutFieldType.state,
    placeholder: 'Estado',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'postalCode',
    label: 'Código Postal',
    type: AppCheckoutFieldType.postalCode,
    placeholder: '12345',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'country',
    label: 'País',
    type: AppCheckoutFieldType.country,
    placeholder: 'Selecciona un país',
    required: true,
    flex: 1,
  ),
];

/// Campos por defecto para formulario de pago
const List<AppCheckoutField> _defaultPaymentFields = [
  AppCheckoutField(
    key: 'cardholderName',
    label: 'Nombre del titular',
    type: AppCheckoutFieldType.text,
    placeholder: 'Nombre como aparece en la tarjeta',
    required: true,
    flex: 2,
  ),
  AppCheckoutField(
    key: 'cardNumber',
    label: 'Número de tarjeta',
    type: AppCheckoutFieldType.creditCard,
    placeholder: '1234 5678 9012 3456',
    required: true,
    sensitive: true,
    mask: '#### #### #### ####',
    flex: 2,
  ),
  AppCheckoutField(
    key: 'expiryDate',
    label: 'Fecha de vencimiento',
    type: AppCheckoutFieldType.expiryDate,
    placeholder: 'MM/AA',
    required: true,
    mask: '##/##',
    flex: 1,
  ),
  AppCheckoutField(
    key: 'cvv',
    label: 'CVV',
    type: AppCheckoutFieldType.cvv,
    placeholder: '123',
    required: true,
    sensitive: true,
    maxLength: 4,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'billingAddress',
    label: 'Dirección de facturación',
    type: AppCheckoutFieldType.text,
    placeholder: 'Dirección completa',
    required: true,
    flex: 2,
  ),
  AppCheckoutField(
    key: 'billingCity',
    label: 'Ciudad',
    type: AppCheckoutFieldType.city,
    placeholder: 'Ciudad',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'billingPostalCode',
    label: 'Código Postal',
    type: AppCheckoutFieldType.postalCode,
    placeholder: '12345',
    required: true,
    flex: 1,
  ),
  AppCheckoutField(
    key: 'saveCard',
    label: 'Guardar tarjeta para futuros pagos',
    type: AppCheckoutFieldType.checkbox,
    required: false,
    flex: 2,
  ),
];

/// Extensiones para AppCheckoutState
extension AppCheckoutStateExtensions on AppCheckoutState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppCheckoutState.defaultState:
        return 'Default';
      case AppCheckoutState.hover:
        return 'Hover';
      case AppCheckoutState.pressed:
        return 'Pressed';
      case AppCheckoutState.focus:
        return 'Focus';
      case AppCheckoutState.selected:
        return 'Selected';
      case AppCheckoutState.disabled:
        return 'Disabled';
      case AppCheckoutState.loading:
        return 'Loading';
      case AppCheckoutState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado permite interacción
  bool get isInteractive {
    switch (this) {
      case AppCheckoutState.defaultState:
      case AppCheckoutState.hover:
      case AppCheckoutState.pressed:
      case AppCheckoutState.focus:
      case AppCheckoutState.selected:
        return true;
      case AppCheckoutState.disabled:
      case AppCheckoutState.loading:
      case AppCheckoutState.skeleton:
        return false;
    }
  }

  /// Si el estado muestra loading
  bool get isLoading {
    return this == AppCheckoutState.loading;
  }

  /// Si el estado muestra skeleton
  bool get isSkeleton {
    return this == AppCheckoutState.skeleton;
  }
}

/// Extensiones para AppCheckoutFieldType
extension AppCheckoutFieldTypeExtensions on AppCheckoutFieldType {
  /// Tipo de teclado apropiado
  TextInputType get keyboardType {
    switch (this) {
      case AppCheckoutFieldType.text:
        return TextInputType.text;
      case AppCheckoutFieldType.email:
        return TextInputType.emailAddress;
      case AppCheckoutFieldType.phone:
        return TextInputType.phone;
      case AppCheckoutFieldType.password:
        return TextInputType.visiblePassword;
      case AppCheckoutFieldType.number:
      case AppCheckoutFieldType.creditCard:
      case AppCheckoutFieldType.cvv:
      case AppCheckoutFieldType.postalCode:
        return TextInputType.number;
      case AppCheckoutFieldType.expiryDate:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }

  /// Si el campo es sensible (password, CVV, etc.)
  bool get isSensitive {
    switch (this) {
      case AppCheckoutFieldType.password:
      case AppCheckoutFieldType.creditCard:
      case AppCheckoutFieldType.cvv:
        return true;
      default:
        return false;
    }
  }

  /// Patrón de validación por defecto
  String? get defaultPattern {
    switch (this) {
      case AppCheckoutFieldType.email:
        return r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      case AppCheckoutFieldType.phone:
        return r'^\+?[\d\s\-\(\)]+$';
      case AppCheckoutFieldType.creditCard:
        return r'^\d{4}\s?\d{4}\s?\d{4}\s?\d{4}$';
      case AppCheckoutFieldType.expiryDate:
        return r'^(0[1-9]|1[0-2])\/\d{2}$';
      case AppCheckoutFieldType.cvv:
        return r'^\d{3,4}$';
      case AppCheckoutFieldType.postalCode:
        return r'^\d{5}(-\d{4})?$';
      default:
        return null;
    }
  }
}

/// Utilidades para formularios de checkout
class AppCheckoutUtils {
  /// Valida un campo específico
  static AppCheckoutFieldValidation validateField(
    AppCheckoutField field,
    String? value, {
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) {
    if (field.required && (value == null || value.trim().isEmpty)) {
      return AppCheckoutFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['${field.key}_required'] ??
            'Este campo es requerido',
        level: AppCheckoutValidationLevel.error,
      );
    }

    if (value != null && value.isNotEmpty) {
      // Validar patrón
      final pattern = customPatterns?[field.key] ??
          (field.pattern != null ? RegExp(field.pattern!) : null) ??
          (field.type.defaultPattern != null
              ? RegExp(field.type.defaultPattern!)
              : null);

      if (pattern != null && !pattern.hasMatch(value)) {
        return AppCheckoutFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_invalid'] ??
              _getDefaultErrorMessage(field.type),
          level: AppCheckoutValidationLevel.error,
        );
      }

      // Validar longitud máxima
      if (field.maxLength != null && value.length > field.maxLength!) {
        return AppCheckoutFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_too_long'] ??
              'Máximo ${field.maxLength} caracteres',
          level: AppCheckoutValidationLevel.error,
        );
      }
    }

    return AppCheckoutFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: field.required ? 'Campo válido' : null,
      level: field.required
          ? AppCheckoutValidationLevel.success
          : AppCheckoutValidationLevel.none,
    );
  }

  /// Valida todo el formulario
  static AppCheckoutFormData validateForm(
    List<AppCheckoutField> fields,
    Map<String, dynamic> values, {
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) {
    final validations = <String, AppCheckoutFieldValidation>{};
    bool isFormValid = true;

    for (final field in fields) {
      final validation = validateField(
        field,
        values[field.key]?.toString(),
        customMessages: customMessages,
        customPatterns: customPatterns,
      );
      validations[field.key] = validation;
      if (!validation.isValid) {
        isFormValid = false;
      }
    }

    return AppCheckoutFormData(
      values: values,
      validations: validations,
      isValid: isFormValid,
      isDirty: values.isNotEmpty,
      lastModified: DateTime.now(),
    );
  }

  /// Aplica formato a un valor según el tipo de campo
  static String formatFieldValue(AppCheckoutFieldType type, String value) {
    switch (type) {
      case AppCheckoutFieldType.creditCard:
        return _formatCreditCard(value);
      case AppCheckoutFieldType.expiryDate:
        return _formatExpiryDate(value);
      case AppCheckoutFieldType.phone:
        return _formatPhone(value);
      case AppCheckoutFieldType.postalCode:
        return _formatPostalCode(value);
      default:
        return value;
    }
  }

  /// Formatea número de tarjeta de crédito
  static String _formatCreditCard(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length <= 4) return digitsOnly;
    if (digitsOnly.length <= 8) {
      return '${digitsOnly.substring(0, 4)} ${digitsOnly.substring(4)}';
    }
    if (digitsOnly.length <= 12) {
      return '${digitsOnly.substring(0, 4)} ${digitsOnly.substring(4, 8)} ${digitsOnly.substring(8)}';
    }
    return '${digitsOnly.substring(0, 4)} ${digitsOnly.substring(4, 8)} ${digitsOnly.substring(8, 12)} ${digitsOnly.substring(12, math.min(16, digitsOnly.length))}';
  }

  /// Formatea fecha de vencimiento
  static String _formatExpiryDate(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length <= 2) return digitsOnly;
    return '${digitsOnly.substring(0, 2)}/${digitsOnly.substring(2, math.min(4, digitsOnly.length))}';
  }

  /// Formatea número de teléfono
  static String _formatPhone(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length <= 3) return digitsOnly;
    if (digitsOnly.length <= 6) {
      return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3)}';
    }
    return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6, math.min(10, digitsOnly.length))}';
  }

  /// Formatea código postal
  static String _formatPostalCode(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length <= 5) return digitsOnly;
    return '${digitsOnly.substring(0, 5)}-${digitsOnly.substring(5, math.min(9, digitsOnly.length))}';
  }

  /// Obtiene mensaje de error por defecto
  static String _getDefaultErrorMessage(AppCheckoutFieldType type) {
    switch (type) {
      case AppCheckoutFieldType.email:
        return 'Ingresa un email válido';
      case AppCheckoutFieldType.phone:
        return 'Ingresa un teléfono válido';
      case AppCheckoutFieldType.creditCard:
        return 'Ingresa un número de tarjeta válido';
      case AppCheckoutFieldType.expiryDate:
        return 'Ingresa una fecha válida (MM/AA)';
      case AppCheckoutFieldType.cvv:
        return 'Ingresa un CVV válido';
      case AppCheckoutFieldType.postalCode:
        return 'Ingresa un código postal válido';
      default:
        return 'Valor inválido';
    }
  }

  /// Detecta tipo de tarjeta de crédito
  static String detectCardType(String cardNumber) {
    final number = cardNumber.replaceAll(RegExp(r'\D'), '');

    if (number.startsWith('4')) return 'Visa';
    if (number.startsWith('5') ||
        (number.length >= 4 && int.parse(number.substring(0, 4)) >= 2221 && int.parse(number.substring(0, 4)) <= 2720)) {
      return 'Mastercard';
    }
    if (number.startsWith('34') || number.startsWith('37')) return 'American Express';
    if (number.startsWith('6011') || number.startsWith('65')) return 'Discover';

    return 'Unknown';
  }

  /// Enmascara datos sensibles para logging
  static Map<String, dynamic> maskSensitiveData(
    List<AppCheckoutField> fields,
    Map<String, dynamic> values,
  ) {
    final masked = <String, dynamic>{};

    for (final field in fields) {
      final value = values[field.key];
      if (field.sensitive && value != null) {
        final stringValue = value.toString();
        if (stringValue.isNotEmpty) {
          if (field.type == AppCheckoutFieldType.creditCard) {
            masked[field.key] = '**** **** **** ${stringValue.replaceAll(RegExp(r'\D'), '').substring(math.max(0, stringValue.replaceAll(RegExp(r'\D'), '').length - 4))}';
          } else {
            masked[field.key] = '*' * stringValue.length;
          }
        } else {
          masked[field.key] = value;
        }
      } else {
        masked[field.key] = value;
      }
    }

    return masked;
  }
}