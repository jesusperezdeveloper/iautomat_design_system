import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_checkout_forms_config.freezed.dart';

/// Configuración completa para el componente DSCheckoutForms
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento de los formularios
@freezed
class DSCheckoutFormsConfig with _$DSCheckoutFormsConfig {
  const factory DSCheckoutFormsConfig({
    @Default(DSCheckoutVariant.address) DSCheckoutVariant variant,
    @Default(DSCheckoutState.defaultState) DSCheckoutState state,
    DSCheckoutColors? colors,
    DSCheckoutSpacing? spacing,
    DSCheckoutAnimation? animation,
    DSCheckoutBehavior? behavior,
    DSCheckoutA11yConfig? a11yConfig,
    DSCheckoutValidation? validation,
  }) = _DSCheckoutFormsConfig;

}

/// Variantes del formulario de checkout
enum DSCheckoutVariant {
  /// Formulario de dirección (shipping/billing)
  address,

  /// Formulario de pago (tarjeta de crédito, etc.)
  payment,
}

/// Estados interactivos del formulario
enum DSCheckoutState {
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
class DSCheckoutField with _$DSCheckoutField {
  const factory DSCheckoutField({
    required String key,
    required String label,
    required DSCheckoutFieldType type,
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
  }) = _DSCheckoutField;

}

/// Tipos de campos disponibles
enum DSCheckoutFieldType {
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
class DSCheckoutColors with _$DSCheckoutColors {
  const factory DSCheckoutColors({
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
  }) = _DSCheckoutColors;

}

/// Configuración de espaciado del formulario
@freezed
class DSCheckoutSpacing with _$DSCheckoutSpacing {
  const factory DSCheckoutSpacing({
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
  }) = _DSCheckoutSpacing;

}

/// Configuración de animaciones
@freezed
class DSCheckoutAnimation with _$DSCheckoutAnimation {
  const factory DSCheckoutAnimation({
    @Default(Duration(milliseconds: 200)) Duration transitionDuration,
    @Default(Duration(milliseconds: 300)) Duration loadingDuration,
    @Default(Duration(milliseconds: 150)) Duration hoverDuration,
    @Default(Duration(milliseconds: 100)) Duration pressDuration,
    @Default(Curves.easeInOut) Curve transitionCurve,
    @Default(Curves.easeOut) Curve loadingCurve,
    @Default(true) bool enableAnimations,
    @Default(true) bool enableRippleEffect,
  }) = _DSCheckoutAnimation;

}

/// Configuración de comportamiento
@freezed
class DSCheckoutBehavior with _$DSCheckoutBehavior {
  const factory DSCheckoutBehavior({
    @Default(true) bool autoValidate,
    @Default(false) bool validateOnChange,
    @Default(true) bool validateOnSubmit,
    @Default(true) bool showRequiredIndicator,
    @Default(true) bool showHelperText,
    @Default(true) bool enableAutofill,
    @Default(true) bool enableFormatting,
    @Default(true) bool enableMasking,
    @Default(false) bool submitOnEnter,
    @Default(DSCheckoutSubmitMode.manual) DSCheckoutSubmitMode submitMode,
    @Default(false) bool clearOnSubmit,
    @Default(true) bool focusNextFieldOnEnter,
    @Default(true) bool showProgressIndicator,
  }) = _DSCheckoutBehavior;

}

/// Modos de envío del formulario
enum DSCheckoutSubmitMode {
  manual,
  auto,
  onValidation,
}

/// Configuración de accesibilidad
@freezed
class DSCheckoutA11yConfig with _$DSCheckoutA11yConfig {
  const factory DSCheckoutA11yConfig({
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
  }) = _DSCheckoutA11yConfig;

}

/// Configuración de validación
@freezed
class DSCheckoutValidation with _$DSCheckoutValidation {
  const factory DSCheckoutValidation({
    @Default(true) bool enabled,
    @Default(true) bool showErrorMessages,
    @Default(true) bool showSuccessIndicators,
    @Default(false) bool strictMode,
    @Default(3) int maxRetries,
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) = _DSCheckoutValidation;

}

/// Resultado de la validación de un campo
@freezed
class DSCheckoutFieldValidation with _$DSCheckoutFieldValidation {
  const factory DSCheckoutFieldValidation({
    required String fieldKey,
    required bool isValid,
    String? errorMessage,
    String? successMessage,
    @Default(DSCheckoutValidationLevel.none) DSCheckoutValidationLevel level,
  }) = _DSCheckoutFieldValidation;

}

/// Niveles de validación
enum DSCheckoutValidationLevel {
  none,
  info,
  warning,
  error,
  success,
}

/// Datos del formulario
@freezed
class DSCheckoutFormData with _$DSCheckoutFormData {
  const factory DSCheckoutFormData({
    required Map<String, dynamic> values,
    required Map<String, DSCheckoutFieldValidation> validations,
    @Default(false) bool isValid,
    @Default(false) bool isDirty,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSubmitted,
    DateTime? lastModified,
    String? submissionId,
  }) = _DSCheckoutFormData;

}

/// Extensiones para DSCheckoutVariant
extension DSCheckoutVariantExtensions on DSCheckoutVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSCheckoutVariant.address:
        return 'Dirección';
      case DSCheckoutVariant.payment:
        return 'Pago';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case DSCheckoutVariant.address:
        return 'Formulario para capturar información de dirección';
      case DSCheckoutVariant.payment:
        return 'Formulario para capturar información de pago';
    }
  }

  /// Campos por defecto según la variante
  List<DSCheckoutField> get defaultFields {
    switch (this) {
      case DSCheckoutVariant.address:
        return _defaultAddressFields;
      case DSCheckoutVariant.payment:
        return _defaultPaymentFields;
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case DSCheckoutVariant.address:
        return Icons.location_on;
      case DSCheckoutVariant.payment:
        return Icons.payment;
    }
  }
}

/// Campos por defecto para formulario de dirección
const List<DSCheckoutField> _defaultAddressFields = [
  DSCheckoutField(
    key: 'firstName',
    label: 'Nombre',
    type: DSCheckoutFieldType.text,
    placeholder: 'Ingresa tu nombre',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'lastName',
    label: 'Apellido',
    type: DSCheckoutFieldType.text,
    placeholder: 'Ingresa tu apellido',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'email',
    label: 'Email',
    type: DSCheckoutFieldType.email,
    placeholder: 'ejemplo@correo.com',
    required: true,
    flex: 2,
  ),
  DSCheckoutField(
    key: 'phone',
    label: 'Teléfono',
    type: DSCheckoutFieldType.phone,
    placeholder: '+1 (555) 123-4567',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'address1',
    label: 'Dirección',
    type: DSCheckoutFieldType.text,
    placeholder: 'Calle y número',
    required: true,
    flex: 2,
  ),
  DSCheckoutField(
    key: 'address2',
    label: 'Dirección 2',
    type: DSCheckoutFieldType.text,
    placeholder: 'Apartamento, suite, etc. (opcional)',
    required: false,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'city',
    label: 'Ciudad',
    type: DSCheckoutFieldType.city,
    placeholder: 'Ciudad',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'state',
    label: 'Estado/Provincia',
    type: DSCheckoutFieldType.state,
    placeholder: 'Estado',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'postalCode',
    label: 'Código Postal',
    type: DSCheckoutFieldType.postalCode,
    placeholder: '12345',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'country',
    label: 'País',
    type: DSCheckoutFieldType.country,
    placeholder: 'Selecciona un país',
    required: true,
    flex: 1,
  ),
];

/// Campos por defecto para formulario de pago
const List<DSCheckoutField> _defaultPaymentFields = [
  DSCheckoutField(
    key: 'cardholderName',
    label: 'Nombre del titular',
    type: DSCheckoutFieldType.text,
    placeholder: 'Nombre como aparece en la tarjeta',
    required: true,
    flex: 2,
  ),
  DSCheckoutField(
    key: 'cardNumber',
    label: 'Número de tarjeta',
    type: DSCheckoutFieldType.creditCard,
    placeholder: '1234 5678 9012 3456',
    required: true,
    sensitive: true,
    mask: '#### #### #### ####',
    flex: 2,
  ),
  DSCheckoutField(
    key: 'expiryDate',
    label: 'Fecha de vencimiento',
    type: DSCheckoutFieldType.expiryDate,
    placeholder: 'MM/AA',
    required: true,
    mask: '##/##',
    flex: 1,
  ),
  DSCheckoutField(
    key: 'cvv',
    label: 'CVV',
    type: DSCheckoutFieldType.cvv,
    placeholder: '123',
    required: true,
    sensitive: true,
    maxLength: 4,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'billingAddress',
    label: 'Dirección de facturación',
    type: DSCheckoutFieldType.text,
    placeholder: 'Dirección completa',
    required: true,
    flex: 2,
  ),
  DSCheckoutField(
    key: 'billingCity',
    label: 'Ciudad',
    type: DSCheckoutFieldType.city,
    placeholder: 'Ciudad',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'billingPostalCode',
    label: 'Código Postal',
    type: DSCheckoutFieldType.postalCode,
    placeholder: '12345',
    required: true,
    flex: 1,
  ),
  DSCheckoutField(
    key: 'saveCard',
    label: 'Guardar tarjeta para futuros pagos',
    type: DSCheckoutFieldType.checkbox,
    required: false,
    flex: 2,
  ),
];

/// Extensiones para DSCheckoutState
extension DSCheckoutStateExtensions on DSCheckoutState {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSCheckoutState.defaultState:
        return 'Default';
      case DSCheckoutState.hover:
        return 'Hover';
      case DSCheckoutState.pressed:
        return 'Pressed';
      case DSCheckoutState.focus:
        return 'Focus';
      case DSCheckoutState.selected:
        return 'Selected';
      case DSCheckoutState.disabled:
        return 'Disabled';
      case DSCheckoutState.loading:
        return 'Loading';
      case DSCheckoutState.skeleton:
        return 'Skeleton';
    }
  }

  /// Si el estado permite interacción
  bool get isInteractive {
    switch (this) {
      case DSCheckoutState.defaultState:
      case DSCheckoutState.hover:
      case DSCheckoutState.pressed:
      case DSCheckoutState.focus:
      case DSCheckoutState.selected:
        return true;
      case DSCheckoutState.disabled:
      case DSCheckoutState.loading:
      case DSCheckoutState.skeleton:
        return false;
    }
  }

  /// Si el estado muestra loading
  bool get isLoading {
    return this == DSCheckoutState.loading;
  }

  /// Si el estado muestra skeleton
  bool get isSkeleton {
    return this == DSCheckoutState.skeleton;
  }
}

/// Extensiones para DSCheckoutFieldType
extension DSCheckoutFieldTypeExtensions on DSCheckoutFieldType {
  /// Tipo de teclado apropiado
  TextInputType get keyboardType {
    switch (this) {
      case DSCheckoutFieldType.text:
        return TextInputType.text;
      case DSCheckoutFieldType.email:
        return TextInputType.emailAddress;
      case DSCheckoutFieldType.phone:
        return TextInputType.phone;
      case DSCheckoutFieldType.password:
        return TextInputType.visiblePassword;
      case DSCheckoutFieldType.number:
      case DSCheckoutFieldType.creditCard:
      case DSCheckoutFieldType.cvv:
      case DSCheckoutFieldType.postalCode:
        return TextInputType.number;
      case DSCheckoutFieldType.expiryDate:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }

  /// Si el campo es sensible (password, CVV, etc.)
  bool get isSensitive {
    switch (this) {
      case DSCheckoutFieldType.password:
      case DSCheckoutFieldType.creditCard:
      case DSCheckoutFieldType.cvv:
        return true;
      default:
        return false;
    }
  }

  /// Patrón de validación por defecto
  String? get defaultPattern {
    switch (this) {
      case DSCheckoutFieldType.email:
        return r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      case DSCheckoutFieldType.phone:
        return r'^\+?[\d\s\-\(\)]+$';
      case DSCheckoutFieldType.creditCard:
        return r'^\d{4}\s?\d{4}\s?\d{4}\s?\d{4}$';
      case DSCheckoutFieldType.expiryDate:
        return r'^(0[1-9]|1[0-2])\/\d{2}$';
      case DSCheckoutFieldType.cvv:
        return r'^\d{3,4}$';
      case DSCheckoutFieldType.postalCode:
        return r'^\d{5}(-\d{4})?$';
      default:
        return null;
    }
  }
}

/// Utilidades para formularios de checkout
class DSCheckoutUtils {
  /// Valida un campo específico
  static DSCheckoutFieldValidation validateField(
    DSCheckoutField field,
    String? value, {
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) {
    if (field.required && (value == null || value.trim().isEmpty)) {
      return DSCheckoutFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['${field.key}_required'] ??
            'Este campo es requerido',
        level: DSCheckoutValidationLevel.error,
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
        return DSCheckoutFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_invalid'] ??
              _getDefaultErrorMessage(field.type),
          level: DSCheckoutValidationLevel.error,
        );
      }

      // Validar longitud máxima
      if (field.maxLength != null && value.length > field.maxLength!) {
        return DSCheckoutFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_too_long'] ??
              'Máximo ${field.maxLength} caracteres',
          level: DSCheckoutValidationLevel.error,
        );
      }
    }

    return DSCheckoutFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: field.required ? 'Campo válido' : null,
      level: field.required
          ? DSCheckoutValidationLevel.success
          : DSCheckoutValidationLevel.none,
    );
  }

  /// Valida todo el formulario
  static DSCheckoutFormData validateForm(
    List<DSCheckoutField> fields,
    Map<String, dynamic> values, {
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) {
    final validations = <String, DSCheckoutFieldValidation>{};
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

    return DSCheckoutFormData(
      values: values,
      validations: validations,
      isValid: isFormValid,
      isDirty: values.isNotEmpty,
      lastModified: DateTime.now(),
    );
  }

  /// Aplica formato a un valor según el tipo de campo
  static String formatFieldValue(DSCheckoutFieldType type, String value) {
    switch (type) {
      case DSCheckoutFieldType.creditCard:
        return _formatCreditCard(value);
      case DSCheckoutFieldType.expiryDate:
        return _formatExpiryDate(value);
      case DSCheckoutFieldType.phone:
        return _formatPhone(value);
      case DSCheckoutFieldType.postalCode:
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
  static String _getDefaultErrorMessage(DSCheckoutFieldType type) {
    switch (type) {
      case DSCheckoutFieldType.email:
        return 'Ingresa un email válido';
      case DSCheckoutFieldType.phone:
        return 'Ingresa un teléfono válido';
      case DSCheckoutFieldType.creditCard:
        return 'Ingresa un número de tarjeta válido';
      case DSCheckoutFieldType.expiryDate:
        return 'Ingresa una fecha válida (MM/AA)';
      case DSCheckoutFieldType.cvv:
        return 'Ingresa un CVV válido';
      case DSCheckoutFieldType.postalCode:
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
    List<DSCheckoutField> fields,
    Map<String, dynamic> values,
  ) {
    final masked = <String, dynamic>{};

    for (final field in fields) {
      final value = values[field.key];
      if (field.sensitive && value != null) {
        final stringValue = value.toString();
        if (stringValue.isNotEmpty) {
          if (field.type == DSCheckoutFieldType.creditCard) {
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