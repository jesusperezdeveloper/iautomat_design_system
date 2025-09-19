import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_auth_screens_config.freezed.dart';

/// Configuración completa para el componente DSAuthScreens
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento de las pantallas de auth
@freezed
class DSAuthScreensConfig with _$DSAuthScreensConfig {
  const factory DSAuthScreensConfig({
    @Default(DSAuthVariant.signIn) DSAuthVariant variant,
    @Default(DSAuthState.defaultState) DSAuthState state,
    DSAuthColors? colors,
    DSAuthSpacing? spacing,
    DSAuthAnimation? animation,
    DSAuthBehavior? behavior,
    DSAuthA11yConfig? a11yConfig,
    DSAuthValidation? validation,
  }) = _DSAuthScreensConfig;
}

/// Variantes de las pantallas de autenticación
enum DSAuthVariant {
  /// Pantalla de inicio de sesión
  signIn,

  /// Pantalla de registro
  signUp,

  /// Pantalla de verificación OTP
  otp,

  /// Pantalla de autenticación social (SSO)
  sso,
}

/// Estados interactivos de las pantallas de auth
enum DSAuthState {
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

  /// Estado cargando
  loading,

  /// Estado skeleton (placeholder)
  skeleton,
}

/// Configuración de un campo del formulario de auth
@freezed
class DSAuthField with _$DSAuthField {
  const factory DSAuthField({
    required String key,
    required String label,
    required DSAuthFieldType type,
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
    String? errorText,
    String? prefixText,
    String? suffixText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    @Default(1) int flex,
    @Default(DSAuthFieldImportance.normal) DSAuthFieldImportance importance,
    Map<String, dynamic>? metadata,
  }) = _AppAuthField;
}

/// Tipos de campos disponibles en auth
enum DSAuthFieldType {
  text,
  email,
  phone,
  password,
  confirmPassword,
  otp,
  dropdown,
  checkbox,
  terms,
  privacy,
}

/// Importancia del campo para UX
enum DSAuthFieldImportance {
  low,
  normal,
  high,
  critical,
}

/// Proveedor de autenticación social (SSO)
@freezed
class DSAuthProvider with _$DSAuthProvider {
  const factory DSAuthProvider({
    required String id,
    required String name,
    required String displayName,
    required IconData icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    @Default(true) bool enabled,
    @Default(DSAuthProviderType.oauth) DSAuthProviderType type,
    Map<String, dynamic>? config,
  }) = _AppAuthProvider;
}

/// Tipos de proveedores de autenticación
enum DSAuthProviderType {
  oauth,
  saml,
  openid,
  custom,
}

/// Configuración de colores de las pantallas de auth
@freezed
class DSAuthColors with _$DSAuthColors {
  const factory DSAuthColors({
    // Colores principales
    Color? backgroundColor,
    Color? surfaceColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? accentColor,

    // Colores de campos
    Color? fieldBackgroundColor,
    Color? fieldBorderColor,
    Color? fieldFocusedBorderColor,
    Color? fieldErrorBorderColor,
    Color? fieldDisabledBackgroundColor,
    Color? fieldDisabledBorderColor,

    // Colores de texto
    Color? titleColor,
    Color? subtitleColor,
    Color? bodyTextColor,
    Color? labelColor,
    Color? hintColor,
    Color? errorColor,
    Color? successColor,
    Color? warningColor,
    Color? linkColor,
    Color? disabledTextColor,

    // Colores de botones
    Color? buttonPrimaryBackgroundColor,
    Color? buttonPrimaryTextColor,
    Color? buttonSecondaryBackgroundColor,
    Color? buttonSecondaryTextColor,
    Color? buttonDisabledBackgroundColor,
    Color? buttonDisabledTextColor,

    // Colores de proveedores SSO
    Color? providerBackgroundColor,
    Color? providerBorderColor,
    Color? providerTextColor,
    Color? providerIconColor,

    // Colores de estado
    Color? shadowColor,
    Color? overlayColor,
    Color? dividerColor,
    Color? focusColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? selectedColor,
    Color? skeletonColor,

    // Colores específicos de OTP
    Color? otpFieldBackgroundColor,
    Color? otpFieldBorderColor,
    Color? otpFieldFocusedBorderColor,
    Color? otpFieldFilledBackgroundColor,
  }) = _AppAuthColors;
}

/// Configuración de espaciado de las pantallas de auth
@freezed
class DSAuthSpacing with _$DSAuthSpacing {
  const factory DSAuthSpacing({
    // Espaciado general
    @Default(EdgeInsets.all(24.0)) EdgeInsets screenPadding,
    @Default(EdgeInsets.zero) EdgeInsets contentMargin,
    @Default(32.0) double sectionSpacing,
    @Default(24.0) double fieldSpacing,
    @Default(16.0) double elementSpacing,
    @Default(8.0) double smallSpacing,

    // Espaciado de componentes
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 12)) EdgeInsets fieldPadding,
    @Default(EdgeInsets.symmetric(horizontal: 24, vertical: 16)) EdgeInsets buttonPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 12)) EdgeInsets providerPadding,

    // Bordes y radios
    @Default(12.0) double fieldBorderRadius,
    @Default(8.0) double buttonBorderRadius,
    @Default(8.0) double providerBorderRadius,
    @Default(1.0) double borderWidth,
    @Default(2.0) double focusedBorderWidth,
    @Default(4.0) double elevation,

    // Tamaños específicos
    @Default(56.0) double buttonMinHeight,
    @Default(48.0) double fieldMinHeight,
    @Default(48.0) double providerMinHeight,
    @Default(60.0) double otpFieldSize,
    @Default(200.0) double logoMaxHeight,
    @Default(400.0) double formMaxWidth,

    // Espaciado de header
    @Default(EdgeInsets.only(bottom: 32)) EdgeInsets headerPadding,
    @Default(24.0) double titleSpacing,
    @Default(16.0) double subtitleSpacing,
  }) = _AppAuthSpacing;
}

/// Configuración de animaciones
@freezed
class DSAuthAnimation with _$DSAuthAnimation {
  const factory DSAuthAnimation({
    @Default(true) bool enabled,
    @Default(Duration(milliseconds: 300)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Duration(milliseconds: 200)) Duration hoverDuration,
    @Default(Curves.easeOut) Curve hoverCurve,
    @Default(Duration(milliseconds: 150)) Duration pressDuration,
    @Default(Curves.easeIn) Curve pressCurve,
    @Default(Duration(milliseconds: 400)) Duration transitionDuration,
    @Default(Curves.easeInOutCubic) Curve transitionCurve,
    @Default(Duration(milliseconds: 1200)) Duration loadingDuration,
    @Default(Duration(milliseconds: 800)) Duration skeletonDuration,
    @Default(true) bool enableScaleAnimation,
    @Default(true) bool enableSlideAnimation,
    @Default(true) bool enableFadeAnimation,
    @Default(true) bool enableRippleEffect,
    @Default(1.02) double hoverScale,
    @Default(0.98) double pressScale,
    @Default(0.05) double hoverOpacity,
    @Default(0.1) double pressOpacity,
  }) = _AppAuthAnimation;
}

/// Configuración de comportamiento
@freezed
class DSAuthBehavior with _$DSAuthBehavior {
  const factory DSAuthBehavior({
    // Validación
    @Default(true) bool autoValidate,
    @Default(false) bool validateOnChange,
    @Default(true) bool validateOnSubmit,
    @Default(true) bool showFieldErrors,
    @Default(true) bool enableRealTimeValidation,

    // Formulario
    @Default(true) bool enableAutofill,
    @Default(true) bool enableFormatting,
    @Default(true) bool enablePasswordToggle,
    @Default(true) bool remembeMe,
    @Default(false) bool submitOnEnter,
    @Default(true) bool focusNextFieldOnEnter,
    @Default(true) bool clearErrorsOnType,

    // UI/UX
    @Default(true) bool showLogo,
    @Default(true) bool showHeader,
    @Default(true) bool showDividers,
    @Default(true) bool showProgressIndicator,
    @Default(true) bool enableSwipeGestures,
    @Default(true) bool enableKeyboardDismiss,

    // Seguridad
    @Default(true) bool enforceStrongPassword,
    @Default(3) int maxLoginAttempts,
    @Default(true) bool enableBiometric,
    @Default(false) bool requireTerms,
    @Default(false) bool requirePrivacy,

    // OTP específico
    @Default(6) int otpLength,
    @Default(true) bool autoSubmitOtp,
    @Default(Duration(seconds: 30)) Duration otpResendCooldown,
    @Default(Duration(minutes: 5)) Duration otpTimeout,

    // Plataforma
    @Default(DSAuthSubmitMode.manual) DSAuthSubmitMode submitMode,
    @Default(DSAuthKeyboardBehavior.adaptive) DSAuthKeyboardBehavior keyboardBehavior,
    @Default(DSAuthLayoutMode.adaptive) DSAuthLayoutMode layoutMode,
  }) = _AppAuthBehavior;
}

/// Modos de envío del formulario
enum DSAuthSubmitMode {
  manual,
  auto,
  onValidation,
}

/// Comportamiento del teclado
enum DSAuthKeyboardBehavior {
  adaptive,
  alwaysVisible,
  dismissOnScroll,
  dismissOnTap,
}

/// Modo de layout
enum DSAuthLayoutMode {
  adaptive,
  mobile,
  tablet,
  desktop,
}

/// Configuración de accesibilidad
@freezed
class DSAuthA11yConfig with _$DSAuthA11yConfig {
  const factory DSAuthA11yConfig({
    @Default(true) bool enabled,
    @Default(true) bool announceErrors,
    @Default(true) bool announceSuccess,
    @Default(true) bool announceStateChanges,
    @Default(true) bool announceNavigation,
    @Default(true) bool supportScreenReader,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool enableSemanticLabels,
    @Default(true) bool enableHints,
    @Default(true) bool enableLiveRegions,
    @Default(true) bool enableHighContrast,
    @Default(true) bool enableLargeText,
    @Default(true) bool enableReducedMotion,

    // Labels semánticos
    @Default('Pantalla de autenticación') String screenSemanticLabel,
    @Default('Formulario de inicio de sesión') String signInSemanticLabel,
    @Default('Formulario de registro') String signUpSemanticLabel,
    @Default('Verificación de código OTP') String otpSemanticLabel,
    @Default('Autenticación social') String ssoSemanticLabel,
    @Default('Campo requerido') String requiredFieldSemanticLabel,
    @Default('Campo válido') String validFieldSemanticLabel,
    @Default('Campo con error') String errorFieldSemanticLabel,
    @Default('Mostrar contraseña') String showPasswordSemanticLabel,
    @Default('Ocultar contraseña') String hidePasswordSemanticLabel,
    @Default('Iniciar sesión') String submitSemanticLabel,
    @Default('Crear cuenta') String createAccountSemanticLabel,
    @Default('Continuar con') String continueWithSemanticLabel,
    @Default('Reenviar código') String resendCodeSemanticLabel,
    @Default('Volver') String backSemanticLabel,
  }) = _DSAuthA11yConfig;
}

/// Configuración de validación
@freezed
class DSAuthValidation with _$DSAuthValidation {
  const factory DSAuthValidation({
    @Default(true) bool enabled,
    @Default(true) bool showErrorMessages,
    @Default(true) bool showSuccessIndicators,
    @Default(false) bool strictMode,
    @Default(3) int maxRetries,
    @Default(8) int minPasswordLength,
    @Default(true) bool requirePasswordNumber,
    @Default(true) bool requirePasswordSpecialChar,
    @Default(true) bool requirePasswordUppercase,
    @Default(true) bool requirePasswordLowercase,
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
  }) = _AppAuthValidation;
}

/// Datos del formulario de auth
@freezed
class DSAuthFormData with _$DSAuthFormData {
  const factory DSAuthFormData({
    required Map<String, dynamic> values,
    required Map<String, DSAuthFieldValidation> validations,
    @Default(false) bool isValid,
    @Default(false) bool isDirty,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSubmitted,
    @Default(0) int attemptCount,
    DateTime? lastModified,
    DateTime? lastAttempt,
    String? submissionId,
    String? sessionId,
  }) = _AppAuthFormData;
}

/// Resultado de la validación de un campo
@freezed
class DSAuthFieldValidation with _$DSAuthFieldValidation {
  const factory DSAuthFieldValidation({
    required String fieldKey,
    required bool isValid,
    String? errorMessage,
    String? successMessage,
    @Default(DSAuthValidationLevel.none) DSAuthValidationLevel level,
    @Default(DSAuthValidationType.client) DSAuthValidationType type,
  }) = _AppAuthFieldValidation;
}

/// Niveles de validación
enum DSAuthValidationLevel {
  none,
  info,
  warning,
  error,
  success,
}

/// Tipos de validación
enum DSAuthValidationType {
  client,
  server,
  realtime,
}

/// Resultado de la autenticación
@freezed
class DSAuthResult with _$DSAuthResult {
  const factory DSAuthResult({
    required bool success,
    String? token,
    String? refreshToken,
    Map<String, dynamic>? user,
    String? error,
    String? errorCode,
    @Default(DSAuthResultType.form) DSAuthResultType type,
    @Default(DSAuthProvider(
      id: 'form',
      name: 'form',
      displayName: 'Formulario',
      icon: Icons.login,
    )) DSAuthProvider provider,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) = _AppAuthResult;
}

/// Tipos de resultado de auth
enum DSAuthResultType {
  form,
  social,
  biometric,
  otp,
}

/// Extensiones para DSAuthVariant
extension DSAuthVariantExtensions on DSAuthVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case DSAuthVariant.signIn:
        return 'Iniciar Sesión';
      case DSAuthVariant.signUp:
        return 'Crear Cuenta';
      case DSAuthVariant.otp:
        return 'Verificación';
      case DSAuthVariant.sso:
        return 'Autenticación Social';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case DSAuthVariant.signIn:
        return 'Pantalla para iniciar sesión con credenciales';
      case DSAuthVariant.signUp:
        return 'Pantalla para crear una nueva cuenta';
      case DSAuthVariant.otp:
        return 'Pantalla para verificar código OTP';
      case DSAuthVariant.sso:
        return 'Pantalla para autenticación con proveedores externos';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case DSAuthVariant.signIn:
        return Icons.login;
      case DSAuthVariant.signUp:
        return Icons.person_add;
      case DSAuthVariant.otp:
        return Icons.verified_user;
      case DSAuthVariant.sso:
        return Icons.account_circle;
    }
  }

  /// Campos por defecto según la variante
  List<DSAuthField> get defaultFields {
    switch (this) {
      case DSAuthVariant.signIn:
        return _defaultSignInFields;
      case DSAuthVariant.signUp:
        return _defaultSignUpFields;
      case DSAuthVariant.otp:
        return _defaultOtpFields;
      case DSAuthVariant.sso:
        return [];
    }
  }
}

/// Campos por defecto para inicio de sesión
const List<DSAuthField> _defaultSignInFields = [
  DSAuthField(
    key: 'email',
    label: 'Email',
    type: DSAuthFieldType.email,
    placeholder: 'ejemplo@correo.com',
    required: true,
    prefixIcon: Icons.email_outlined,
    importance: DSAuthFieldImportance.critical,
  ),
  DSAuthField(
    key: 'password',
    label: 'Contraseña',
    type: DSAuthFieldType.password,
    placeholder: 'Ingresa tu contraseña',
    required: true,
    sensitive: true,
    prefixIcon: Icons.lock_outlined,
    importance: DSAuthFieldImportance.critical,
  ),
];

/// Campos por defecto para registro
const List<DSAuthField> _defaultSignUpFields = [
  DSAuthField(
    key: 'name',
    label: 'Nombre completo',
    type: DSAuthFieldType.text,
    placeholder: 'Tu nombre completo',
    required: true,
    prefixIcon: Icons.person_outlined,
    importance: DSAuthFieldImportance.high,
  ),
  DSAuthField(
    key: 'email',
    label: 'Email',
    type: DSAuthFieldType.email,
    placeholder: 'ejemplo@correo.com',
    required: true,
    prefixIcon: Icons.email_outlined,
    importance: DSAuthFieldImportance.critical,
  ),
  DSAuthField(
    key: 'password',
    label: 'Contraseña',
    type: DSAuthFieldType.password,
    placeholder: 'Crea una contraseña segura',
    required: true,
    sensitive: true,
    prefixIcon: Icons.lock_outlined,
    importance: DSAuthFieldImportance.critical,
  ),
  DSAuthField(
    key: 'confirmPassword',
    label: 'Confirmar contraseña',
    type: DSAuthFieldType.confirmPassword,
    placeholder: 'Confirma tu contraseña',
    required: true,
    sensitive: true,
    prefixIcon: Icons.lock_outlined,
    importance: DSAuthFieldImportance.critical,
  ),
  DSAuthField(
    key: 'terms',
    label: 'Acepto los términos y condiciones',
    type: DSAuthFieldType.terms,
    required: true,
    importance: DSAuthFieldImportance.high,
  ),
];

/// Campos por defecto para OTP
const List<DSAuthField> _defaultOtpFields = [
  DSAuthField(
    key: 'otp',
    label: 'Código de verificación',
    type: DSAuthFieldType.otp,
    placeholder: '000000',
    required: true,
    maxLength: 6,
    importance: DSAuthFieldImportance.critical,
  ),
];

/// Proveedores sociales comunes
class DSAuthProviders {
  static const google = DSAuthProvider(
    id: 'google',
    name: 'google',
    displayName: 'Google',
    icon: Icons.login,
    backgroundColor: Colors.white,
    textColor: Colors.black87,
  );

  static const apple = DSAuthProvider(
    id: 'apple',
    name: 'apple',
    displayName: 'Apple',
    icon: Icons.apple,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );

  static const facebook = DSAuthProvider(
    id: 'facebook',
    name: 'facebook',
    displayName: 'Facebook',
    icon: Icons.facebook,
    backgroundColor: Color(0xFF1877F2),
    textColor: Colors.white,
  );

  static const github = DSAuthProvider(
    id: 'github',
    name: 'github',
    displayName: 'GitHub',
    icon: Icons.code,
    backgroundColor: Color(0xFF181717),
    textColor: Colors.white,
  );

  static const microsoft = DSAuthProvider(
    id: 'microsoft',
    name: 'microsoft',
    displayName: 'Microsoft',
    icon: Icons.business,
    backgroundColor: Color(0xFF00A4EF),
    textColor: Colors.white,
  );

  static const List<DSAuthProvider> common = [
    google,
    apple,
    facebook,
    github,
    microsoft,
  ];
}

/// Utilidades para autenticación
class DSAuthUtils {
  /// Valida un campo específico
  static DSAuthFieldValidation validateField(
    DSAuthField field,
    String? value, {
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
    String? confirmPasswordValue,
    DSAuthValidation? validationConfig,
  }) {
    final config = validationConfig ?? const DSAuthValidation();

    if (field.required && (value == null || value.trim().isEmpty)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['${field.key}_required'] ??
            'Este campo es requerido',
        level: DSAuthValidationLevel.error,
      );
    }

    if (value != null && value.isNotEmpty) {
      // Validar patrón
      final pattern = customPatterns?[field.key] ??
          (field.pattern != null ? RegExp(field.pattern!) : null) ??
          _getDefaultPattern(field.type);

      if (pattern != null && !pattern.hasMatch(value)) {
        return DSAuthFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_invalid'] ??
              _getDefaultErrorMessage(field.type),
          level: DSAuthValidationLevel.error,
        );
      }

      // Validaciones específicas
      switch (field.type) {
        case DSAuthFieldType.password:
          return _validatePassword(field, value, config, customMessages);
        case DSAuthFieldType.confirmPassword:
          return _validateConfirmPassword(field, value, confirmPasswordValue, customMessages);
        case DSAuthFieldType.otp:
          return _validateOtp(field, value, customMessages);
        default:
          break;
      }

      // Validar longitud máxima
      if (field.maxLength != null && value.length > field.maxLength!) {
        return DSAuthFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_too_long'] ??
              'Máximo ${field.maxLength} caracteres',
          level: DSAuthValidationLevel.error,
        );
      }
    }

    return DSAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: field.required ? 'Campo válido' : null,
      level: field.required
          ? DSAuthValidationLevel.success
          : DSAuthValidationLevel.none,
    );
  }

  /// Valida contraseña
  static DSAuthFieldValidation _validatePassword(
    DSAuthField field,
    String value,
    DSAuthValidation config,
    Map<String, String>? customMessages,
  ) {
    if (value.length < config.minPasswordLength) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_too_short'] ??
            'La contraseña debe tener al menos ${config.minPasswordLength} caracteres',
        level: DSAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordUppercase && !RegExp(r'[A-Z]').hasMatch(value)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_uppercase'] ??
            'La contraseña debe contener al menos una mayúscula',
        level: DSAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordLowercase && !RegExp(r'[a-z]').hasMatch(value)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_lowercase'] ??
            'La contraseña debe contener al menos una minúscula',
        level: DSAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordNumber && !RegExp(r'[0-9]').hasMatch(value)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_number'] ??
            'La contraseña debe contener al menos un número',
        level: DSAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordSpecialChar && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_special'] ??
            'La contraseña debe contener al menos un carácter especial',
        level: DSAuthValidationLevel.error,
      );
    }

    return DSAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: 'Contraseña válida',
      level: DSAuthValidationLevel.success,
    );
  }

  /// Valida confirmación de contraseña
  static DSAuthFieldValidation _validateConfirmPassword(
    DSAuthField field,
    String value,
    String? passwordValue,
    Map<String, String>? customMessages,
  ) {
    if (value != passwordValue) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_mismatch'] ??
            'Las contraseñas no coinciden',
        level: DSAuthValidationLevel.error,
      );
    }

    return DSAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: 'Las contraseñas coinciden',
      level: DSAuthValidationLevel.success,
    );
  }

  /// Valida código OTP
  static DSAuthFieldValidation _validateOtp(
    DSAuthField field,
    String value,
    Map<String, String>? customMessages,
  ) {
    if (value.length != (field.maxLength ?? 6)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['otp_invalid_length'] ??
            'El código debe tener ${field.maxLength ?? 6} dígitos',
        level: DSAuthValidationLevel.error,
      );
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return DSAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['otp_invalid_format'] ??
            'El código solo debe contener números',
        level: DSAuthValidationLevel.error,
      );
    }

    return DSAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: 'Código válido',
      level: DSAuthValidationLevel.success,
    );
  }

  /// Obtiene patrón por defecto para tipo de campo
  static RegExp? _getDefaultPattern(DSAuthFieldType type) {
    switch (type) {
      case DSAuthFieldType.email:
        return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      case DSAuthFieldType.phone:
        return RegExp(r'^\+?[\d\s\-\(\)]+$');
      case DSAuthFieldType.otp:
        return RegExp(r'^\d{6}$');
      default:
        return null;
    }
  }

  /// Obtiene mensaje de error por defecto
  static String _getDefaultErrorMessage(DSAuthFieldType type) {
    switch (type) {
      case DSAuthFieldType.email:
        return 'Ingresa un email válido';
      case DSAuthFieldType.phone:
        return 'Ingresa un teléfono válido';
      case DSAuthFieldType.password:
        return 'Ingresa una contraseña válida';
      case DSAuthFieldType.otp:
        return 'Ingresa un código válido';
      default:
        return 'Valor inválido';
    }
  }

  /// Formatea el valor de un campo
  static String formatFieldValue(DSAuthFieldType type, String value) {
    switch (type) {
      case DSAuthFieldType.phone:
        return _formatPhone(value);
      case DSAuthFieldType.otp:
        return _formatOtp(value);
      default:
        return value;
    }
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

  /// Formatea código OTP
  static String _formatOtp(String value) {
    return value.replaceAll(RegExp(r'\D'), '').toUpperCase();
  }

  /// Genera configuración por defecto
  static DSAuthScreensConfig getDefaultConfig(DSAuthVariant variant) {
    return DSAuthScreensConfig(
      variant: variant,
      colors: const DSAuthColors(),
      spacing: const DSAuthSpacing(),
      animation: const DSAuthAnimation(),
      behavior: const DSAuthBehavior(),
      a11yConfig: const DSAuthA11yConfig(),
      validation: const DSAuthValidation(),
    );
  }

  /// Máscara para datos sensibles en logging
  static Map<String, dynamic> maskSensitiveData(
    List<DSAuthField> fields,
    Map<String, dynamic> values,
  ) {
    final masked = <String, dynamic>{};

    for (final field in fields) {
      final value = values[field.key];
      if (field.sensitive && value != null) {
        final stringValue = value.toString();
        masked[field.key] = '*' * stringValue.length;
      } else {
        masked[field.key] = value;
      }
    }

    return masked;
  }
}