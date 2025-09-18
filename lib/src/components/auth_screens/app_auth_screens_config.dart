import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_auth_screens_config.freezed.dart';

/// Configuración completa para el componente AppAuthScreens
///
/// Utiliza Freezed para crear modelos inmutables y type-safe
/// que definen todos los aspectos del comportamiento de las pantallas de auth
@freezed
class AppAuthScreensConfig with _$AppAuthScreensConfig {
  const factory AppAuthScreensConfig({
    @Default(AppAuthVariant.signIn) AppAuthVariant variant,
    @Default(AppAuthState.defaultState) AppAuthState state,
    AppAuthColors? colors,
    AppAuthSpacing? spacing,
    AppAuthAnimation? animation,
    AppAuthBehavior? behavior,
    AppAuthA11yConfig? a11yConfig,
    AppAuthValidation? validation,
  }) = _AppAuthScreensConfig;
}

/// Variantes de las pantallas de autenticación
enum AppAuthVariant {
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
enum AppAuthState {
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
class AppAuthField with _$AppAuthField {
  const factory AppAuthField({
    required String key,
    required String label,
    required AppAuthFieldType type,
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
    @Default(AppAuthFieldImportance.normal) AppAuthFieldImportance importance,
    Map<String, dynamic>? metadata,
  }) = _AppAuthField;
}

/// Tipos de campos disponibles en auth
enum AppAuthFieldType {
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
enum AppAuthFieldImportance {
  low,
  normal,
  high,
  critical,
}

/// Proveedor de autenticación social (SSO)
@freezed
class AppAuthProvider with _$AppAuthProvider {
  const factory AppAuthProvider({
    required String id,
    required String name,
    required String displayName,
    required IconData icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    @Default(true) bool enabled,
    @Default(AppAuthProviderType.oauth) AppAuthProviderType type,
    Map<String, dynamic>? config,
  }) = _AppAuthProvider;
}

/// Tipos de proveedores de autenticación
enum AppAuthProviderType {
  oauth,
  saml,
  openid,
  custom,
}

/// Configuración de colores de las pantallas de auth
@freezed
class AppAuthColors with _$AppAuthColors {
  const factory AppAuthColors({
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
class AppAuthSpacing with _$AppAuthSpacing {
  const factory AppAuthSpacing({
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
class AppAuthAnimation with _$AppAuthAnimation {
  const factory AppAuthAnimation({
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
class AppAuthBehavior with _$AppAuthBehavior {
  const factory AppAuthBehavior({
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
    @Default(AppAuthSubmitMode.manual) AppAuthSubmitMode submitMode,
    @Default(AppAuthKeyboardBehavior.adaptive) AppAuthKeyboardBehavior keyboardBehavior,
    @Default(AppAuthLayoutMode.adaptive) AppAuthLayoutMode layoutMode,
  }) = _AppAuthBehavior;
}

/// Modos de envío del formulario
enum AppAuthSubmitMode {
  manual,
  auto,
  onValidation,
}

/// Comportamiento del teclado
enum AppAuthKeyboardBehavior {
  adaptive,
  alwaysVisible,
  dismissOnScroll,
  dismissOnTap,
}

/// Modo de layout
enum AppAuthLayoutMode {
  adaptive,
  mobile,
  tablet,
  desktop,
}

/// Configuración de accesibilidad
@freezed
class AppAuthA11yConfig with _$AppAuthA11yConfig {
  const factory AppAuthA11yConfig({
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
  }) = _AppAuthA11yConfig;
}

/// Configuración de validación
@freezed
class AppAuthValidation with _$AppAuthValidation {
  const factory AppAuthValidation({
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
class AppAuthFormData with _$AppAuthFormData {
  const factory AppAuthFormData({
    required Map<String, dynamic> values,
    required Map<String, AppAuthFieldValidation> validations,
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
class AppAuthFieldValidation with _$AppAuthFieldValidation {
  const factory AppAuthFieldValidation({
    required String fieldKey,
    required bool isValid,
    String? errorMessage,
    String? successMessage,
    @Default(AppAuthValidationLevel.none) AppAuthValidationLevel level,
    @Default(AppAuthValidationType.client) AppAuthValidationType type,
  }) = _AppAuthFieldValidation;
}

/// Niveles de validación
enum AppAuthValidationLevel {
  none,
  info,
  warning,
  error,
  success,
}

/// Tipos de validación
enum AppAuthValidationType {
  client,
  server,
  realtime,
}

/// Resultado de la autenticación
@freezed
class AppAuthResult with _$AppAuthResult {
  const factory AppAuthResult({
    required bool success,
    String? token,
    String? refreshToken,
    Map<String, dynamic>? user,
    String? error,
    String? errorCode,
    @Default(AppAuthResultType.form) AppAuthResultType type,
    @Default(AppAuthProvider(
      id: 'form',
      name: 'form',
      displayName: 'Formulario',
      icon: Icons.login,
    )) AppAuthProvider provider,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) = _AppAuthResult;
}

/// Tipos de resultado de auth
enum AppAuthResultType {
  form,
  social,
  biometric,
  otp,
}

/// Extensiones para AppAuthVariant
extension AppAuthVariantExtensions on AppAuthVariant {
  /// Nombre para mostrar
  String get displayName {
    switch (this) {
      case AppAuthVariant.signIn:
        return 'Iniciar Sesión';
      case AppAuthVariant.signUp:
        return 'Crear Cuenta';
      case AppAuthVariant.otp:
        return 'Verificación';
      case AppAuthVariant.sso:
        return 'Autenticación Social';
    }
  }

  /// Descripción de la variante
  String get description {
    switch (this) {
      case AppAuthVariant.signIn:
        return 'Pantalla para iniciar sesión con credenciales';
      case AppAuthVariant.signUp:
        return 'Pantalla para crear una nueva cuenta';
      case AppAuthVariant.otp:
        return 'Pantalla para verificar código OTP';
      case AppAuthVariant.sso:
        return 'Pantalla para autenticación con proveedores externos';
    }
  }

  /// Icono representativo
  IconData get icon {
    switch (this) {
      case AppAuthVariant.signIn:
        return Icons.login;
      case AppAuthVariant.signUp:
        return Icons.person_add;
      case AppAuthVariant.otp:
        return Icons.verified_user;
      case AppAuthVariant.sso:
        return Icons.account_circle;
    }
  }

  /// Campos por defecto según la variante
  List<AppAuthField> get defaultFields {
    switch (this) {
      case AppAuthVariant.signIn:
        return _defaultSignInFields;
      case AppAuthVariant.signUp:
        return _defaultSignUpFields;
      case AppAuthVariant.otp:
        return _defaultOtpFields;
      case AppAuthVariant.sso:
        return [];
    }
  }
}

/// Campos por defecto para inicio de sesión
const List<AppAuthField> _defaultSignInFields = [
  AppAuthField(
    key: 'email',
    label: 'Email',
    type: AppAuthFieldType.email,
    placeholder: 'ejemplo@correo.com',
    required: true,
    prefixIcon: Icons.email_outlined,
    importance: AppAuthFieldImportance.critical,
  ),
  AppAuthField(
    key: 'password',
    label: 'Contraseña',
    type: AppAuthFieldType.password,
    placeholder: 'Ingresa tu contraseña',
    required: true,
    sensitive: true,
    prefixIcon: Icons.lock_outlined,
    importance: AppAuthFieldImportance.critical,
  ),
];

/// Campos por defecto para registro
const List<AppAuthField> _defaultSignUpFields = [
  AppAuthField(
    key: 'name',
    label: 'Nombre completo',
    type: AppAuthFieldType.text,
    placeholder: 'Tu nombre completo',
    required: true,
    prefixIcon: Icons.person_outlined,
    importance: AppAuthFieldImportance.high,
  ),
  AppAuthField(
    key: 'email',
    label: 'Email',
    type: AppAuthFieldType.email,
    placeholder: 'ejemplo@correo.com',
    required: true,
    prefixIcon: Icons.email_outlined,
    importance: AppAuthFieldImportance.critical,
  ),
  AppAuthField(
    key: 'password',
    label: 'Contraseña',
    type: AppAuthFieldType.password,
    placeholder: 'Crea una contraseña segura',
    required: true,
    sensitive: true,
    prefixIcon: Icons.lock_outlined,
    importance: AppAuthFieldImportance.critical,
  ),
  AppAuthField(
    key: 'confirmPassword',
    label: 'Confirmar contraseña',
    type: AppAuthFieldType.confirmPassword,
    placeholder: 'Confirma tu contraseña',
    required: true,
    sensitive: true,
    prefixIcon: Icons.lock_outlined,
    importance: AppAuthFieldImportance.critical,
  ),
  AppAuthField(
    key: 'terms',
    label: 'Acepto los términos y condiciones',
    type: AppAuthFieldType.terms,
    required: true,
    importance: AppAuthFieldImportance.high,
  ),
];

/// Campos por defecto para OTP
const List<AppAuthField> _defaultOtpFields = [
  AppAuthField(
    key: 'otp',
    label: 'Código de verificación',
    type: AppAuthFieldType.otp,
    placeholder: '000000',
    required: true,
    maxLength: 6,
    importance: AppAuthFieldImportance.critical,
  ),
];

/// Proveedores sociales comunes
class AppAuthProviders {
  static const google = AppAuthProvider(
    id: 'google',
    name: 'google',
    displayName: 'Google',
    icon: Icons.login,
    backgroundColor: Colors.white,
    textColor: Colors.black87,
  );

  static const apple = AppAuthProvider(
    id: 'apple',
    name: 'apple',
    displayName: 'Apple',
    icon: Icons.apple,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );

  static const facebook = AppAuthProvider(
    id: 'facebook',
    name: 'facebook',
    displayName: 'Facebook',
    icon: Icons.facebook,
    backgroundColor: Color(0xFF1877F2),
    textColor: Colors.white,
  );

  static const github = AppAuthProvider(
    id: 'github',
    name: 'github',
    displayName: 'GitHub',
    icon: Icons.code,
    backgroundColor: Color(0xFF181717),
    textColor: Colors.white,
  );

  static const microsoft = AppAuthProvider(
    id: 'microsoft',
    name: 'microsoft',
    displayName: 'Microsoft',
    icon: Icons.business,
    backgroundColor: Color(0xFF00A4EF),
    textColor: Colors.white,
  );

  static const List<AppAuthProvider> common = [
    google,
    apple,
    facebook,
    github,
    microsoft,
  ];
}

/// Utilidades para autenticación
class AppAuthUtils {
  /// Valida un campo específico
  static AppAuthFieldValidation validateField(
    AppAuthField field,
    String? value, {
    Map<String, String>? customMessages,
    Map<String, RegExp>? customPatterns,
    String? confirmPasswordValue,
    AppAuthValidation? validationConfig,
  }) {
    final config = validationConfig ?? const AppAuthValidation();

    if (field.required && (value == null || value.trim().isEmpty)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['${field.key}_required'] ??
            'Este campo es requerido',
        level: AppAuthValidationLevel.error,
      );
    }

    if (value != null && value.isNotEmpty) {
      // Validar patrón
      final pattern = customPatterns?[field.key] ??
          (field.pattern != null ? RegExp(field.pattern!) : null) ??
          _getDefaultPattern(field.type);

      if (pattern != null && !pattern.hasMatch(value)) {
        return AppAuthFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_invalid'] ??
              _getDefaultErrorMessage(field.type),
          level: AppAuthValidationLevel.error,
        );
      }

      // Validaciones específicas
      switch (field.type) {
        case AppAuthFieldType.password:
          return _validatePassword(field, value, config, customMessages);
        case AppAuthFieldType.confirmPassword:
          return _validateConfirmPassword(field, value, confirmPasswordValue, customMessages);
        case AppAuthFieldType.otp:
          return _validateOtp(field, value, customMessages);
        default:
          break;
      }

      // Validar longitud máxima
      if (field.maxLength != null && value.length > field.maxLength!) {
        return AppAuthFieldValidation(
          fieldKey: field.key,
          isValid: false,
          errorMessage: customMessages?['${field.key}_too_long'] ??
              'Máximo ${field.maxLength} caracteres',
          level: AppAuthValidationLevel.error,
        );
      }
    }

    return AppAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: field.required ? 'Campo válido' : null,
      level: field.required
          ? AppAuthValidationLevel.success
          : AppAuthValidationLevel.none,
    );
  }

  /// Valida contraseña
  static AppAuthFieldValidation _validatePassword(
    AppAuthField field,
    String value,
    AppAuthValidation config,
    Map<String, String>? customMessages,
  ) {
    if (value.length < config.minPasswordLength) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_too_short'] ??
            'La contraseña debe tener al menos ${config.minPasswordLength} caracteres',
        level: AppAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordUppercase && !RegExp(r'[A-Z]').hasMatch(value)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_uppercase'] ??
            'La contraseña debe contener al menos una mayúscula',
        level: AppAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordLowercase && !RegExp(r'[a-z]').hasMatch(value)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_lowercase'] ??
            'La contraseña debe contener al menos una minúscula',
        level: AppAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordNumber && !RegExp(r'[0-9]').hasMatch(value)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_number'] ??
            'La contraseña debe contener al menos un número',
        level: AppAuthValidationLevel.error,
      );
    }

    if (config.requirePasswordSpecialChar && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_no_special'] ??
            'La contraseña debe contener al menos un carácter especial',
        level: AppAuthValidationLevel.error,
      );
    }

    return AppAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: 'Contraseña válida',
      level: AppAuthValidationLevel.success,
    );
  }

  /// Valida confirmación de contraseña
  static AppAuthFieldValidation _validateConfirmPassword(
    AppAuthField field,
    String value,
    String? passwordValue,
    Map<String, String>? customMessages,
  ) {
    if (value != passwordValue) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['password_mismatch'] ??
            'Las contraseñas no coinciden',
        level: AppAuthValidationLevel.error,
      );
    }

    return AppAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: 'Las contraseñas coinciden',
      level: AppAuthValidationLevel.success,
    );
  }

  /// Valida código OTP
  static AppAuthFieldValidation _validateOtp(
    AppAuthField field,
    String value,
    Map<String, String>? customMessages,
  ) {
    if (value.length != (field.maxLength ?? 6)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['otp_invalid_length'] ??
            'El código debe tener ${field.maxLength ?? 6} dígitos',
        level: AppAuthValidationLevel.error,
      );
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return AppAuthFieldValidation(
        fieldKey: field.key,
        isValid: false,
        errorMessage: customMessages?['otp_invalid_format'] ??
            'El código solo debe contener números',
        level: AppAuthValidationLevel.error,
      );
    }

    return AppAuthFieldValidation(
      fieldKey: field.key,
      isValid: true,
      successMessage: 'Código válido',
      level: AppAuthValidationLevel.success,
    );
  }

  /// Obtiene patrón por defecto para tipo de campo
  static RegExp? _getDefaultPattern(AppAuthFieldType type) {
    switch (type) {
      case AppAuthFieldType.email:
        return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      case AppAuthFieldType.phone:
        return RegExp(r'^\+?[\d\s\-\(\)]+$');
      case AppAuthFieldType.otp:
        return RegExp(r'^\d{6}$');
      default:
        return null;
    }
  }

  /// Obtiene mensaje de error por defecto
  static String _getDefaultErrorMessage(AppAuthFieldType type) {
    switch (type) {
      case AppAuthFieldType.email:
        return 'Ingresa un email válido';
      case AppAuthFieldType.phone:
        return 'Ingresa un teléfono válido';
      case AppAuthFieldType.password:
        return 'Ingresa una contraseña válida';
      case AppAuthFieldType.otp:
        return 'Ingresa un código válido';
      default:
        return 'Valor inválido';
    }
  }

  /// Formatea el valor de un campo
  static String formatFieldValue(AppAuthFieldType type, String value) {
    switch (type) {
      case AppAuthFieldType.phone:
        return _formatPhone(value);
      case AppAuthFieldType.otp:
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
  static AppAuthScreensConfig getDefaultConfig(AppAuthVariant variant) {
    return AppAuthScreensConfig(
      variant: variant,
      colors: const AppAuthColors(),
      spacing: const AppAuthSpacing(),
      animation: const AppAuthAnimation(),
      behavior: const AppAuthBehavior(),
      a11yConfig: const AppAuthA11yConfig(),
      validation: const AppAuthValidation(),
    );
  }

  /// Máscara para datos sensibles en logging
  static Map<String, dynamic> maskSensitiveData(
    List<AppAuthField> fields,
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