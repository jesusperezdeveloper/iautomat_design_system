import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_profile_preferences_config.freezed.dart';

/// Configuración principal para AppProfilePreferences
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// de preferencias de perfil, incluyendo todas las variantes de secciones,
/// estados, colores, espaciado, animaciones y accesibilidad.
@freezed
class AppProfilePreferencesConfig with _$AppProfilePreferencesConfig {
  const factory AppProfilePreferencesConfig({
    /// Variante de secciones del componente
    @Default(AppProfileVariant.sections) AppProfileVariant variant,

    /// Lista de campos/secciones de preferencias
    @Default([]) List<AppProfileField> fields,

    /// Estado actual del componente
    @Default(AppProfileState.defaultState) AppProfileState state,

    /// Configuración de colores (solo design tokens)
    AppProfileColors? colors,

    /// Configuración de espaciado (solo design tokens)
    AppProfileSpacing? spacing,

    /// Configuración de tipografía (solo design tokens)
    AppProfileTypography? typography,

    /// Configuración de animaciones
    AppProfileAnimation? animation,

    /// Configuración de comportamiento
    AppProfileBehavior? behavior,

    /// Configuración de accesibilidad
    AppProfileA11yConfig? a11yConfig,
  }) = _AppProfilePreferencesConfig;
}

/// Variantes disponibles para el componente
enum AppProfileVariant {
  /// Vista por secciones (default)
  sections,
}

/// Estados disponibles del componente
enum AppProfileState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (principalmente web/desktop)
  hover,

  /// Estado presionado
  pressed,

  /// Estado enfocado
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado de carga
  loading,

  /// Estado skeleton (carga inicial)
  skeleton,
}

/// Extensión para obtener propiedades de los estados
extension AppProfileStateExtension on AppProfileState {
  /// Obtiene el nombre del estado para mostrar
  String get displayName {
    switch (this) {
      case AppProfileState.defaultState:
        return 'Default';
      case AppProfileState.hover:
        return 'Hover';
      case AppProfileState.pressed:
        return 'Pressed';
      case AppProfileState.focus:
        return 'Focus';
      case AppProfileState.selected:
        return 'Selected';
      case AppProfileState.disabled:
        return 'Disabled';
      case AppProfileState.loading:
        return 'Loading';
      case AppProfileState.skeleton:
        return 'Skeleton';
    }
  }

  /// Indica si el estado permite interacciones
  bool get isInteractive {
    switch (this) {
      case AppProfileState.disabled:
      case AppProfileState.loading:
      case AppProfileState.skeleton:
        return false;
      default:
        return true;
    }
  }

  /// Indica si el estado muestra loading
  bool get isLoading {
    return this == AppProfileState.loading || this == AppProfileState.skeleton;
  }
}

/// Tipos de campos/secciones de preferencias
enum AppProfileFieldType {
  /// Sección de header
  header,

  /// Campo de texto simple
  text,

  /// Campo de email
  email,

  /// Campo de teléfono
  phone,

  /// Campo de switch/toggle
  toggle,

  /// Campo de selección
  select,

  /// Campo de slider
  slider,

  /// Campo de fecha
  date,

  /// Campo de color
  color,

  /// Campo de archivo/imagen
  file,

  /// Sección de acciones
  actions,

  /// Separador
  divider,
}

/// Importancia de los campos para accesibilidad
enum AppProfileFieldImportance {
  /// Crítico - debe ser anunciado inmediatamente
  critical,

  /// Alto - importante para el usuario
  high,

  /// Normal - importancia estándar
  normal,

  /// Bajo - información complementaria
  low,
}

/// Configuración de un campo/sección de preferencias
@freezed
class AppProfileField with _$AppProfileField {
  const factory AppProfileField({
    /// ID único del campo
    required String id,

    /// Tipo de campo
    required AppProfileFieldType type,

    /// Etiqueta principal del campo
    required String label,

    /// Valor actual del campo
    Object? value,

    /// Valor por defecto
    Object? defaultValue,

    /// Descripción o ayuda del campo
    String? description,

    /// Placeholder para campos de texto
    String? placeholder,

    /// Opciones para campos de selección
    @Default([]) List<AppProfileFieldOption> options,

    /// Validación del campo
    AppProfileFieldValidation? validation,

    /// Si el campo es requerido
    @Default(false) bool required,

    /// Si el campo está habilitado
    @Default(true) bool enabled,

    /// Si el campo es de solo lectura
    @Default(false) bool readonly,

    /// Importancia del campo para accesibilidad
    @Default(AppProfileFieldImportance.normal) AppProfileFieldImportance importance,

    /// Icono del campo
    IconData? icon,

    /// Acción personalizada del campo
    VoidCallback? onTap,

    /// Callback de cambio de valor
    ValueChanged<Object?>? onChanged,

    /// Configuraciones específicas del tipo de campo
    Map<String, dynamic>? config,
  }) = _AppProfileField;
}

/// Opción para campos de selección
@freezed
class AppProfileFieldOption with _$AppProfileFieldOption {
  const factory AppProfileFieldOption({
    /// Valor de la opción
    required Object value,

    /// Label de la opción
    required String label,

    /// Descripción de la opción
    String? description,

    /// Icono de la opción
    IconData? icon,

    /// Si la opción está habilitada
    @Default(true) bool enabled,
  }) = _AppProfileFieldOption;
}

/// Validación de campos
@freezed
class AppProfileFieldValidation with _$AppProfileFieldValidation {
  const factory AppProfileFieldValidation({
    /// Si el campo es requerido
    @Default(false) bool required,

    /// Longitud mínima
    int? minLength,

    /// Longitud máxima
    int? maxLength,

    /// Valor mínimo (para números)
    num? min,

    /// Valor máximo (para números)
    num? max,

    /// Patrón regex
    String? pattern,

    /// Función de validación personalizada
    String? Function(Object?)? validator,

    /// Mensaje de error personalizado
    String? errorMessage,
  }) = _AppProfileFieldValidation;
}

/// Configuración de colores (solo design tokens)
@freezed
class AppProfileColors with _$AppProfileColors {
  const factory AppProfileColors({
    /// Color de fondo principal
    Color? backgroundColor,

    /// Color de fondo de las secciones
    Color? sectionBackgroundColor,

    /// Color de fondo de los campos
    Color? fieldBackgroundColor,

    /// Color de bordes
    Color? borderColor,

    /// Color de bordes enfocados
    Color? focusedBorderColor,

    /// Color de bordes de error
    Color? errorBorderColor,

    /// Color de texto principal
    Color? textColor,

    /// Color de texto secundario
    Color? secondaryTextColor,

    /// Color de texto de placeholder
    Color? placeholderTextColor,

    /// Color de texto de error
    Color? errorTextColor,

    /// Color de texto de ayuda
    Color? helperTextColor,

    /// Color de iconos
    Color? iconColor,

    /// Color de iconos deshabilitados
    Color? disabledIconColor,

    /// Color de botones primarios
    Color? primaryButtonColor,

    /// Color de texto de botones primarios
    Color? primaryButtonTextColor,

    /// Color de botones secundarios
    Color? secondaryButtonColor,

    /// Color de texto de botones secundarios
    Color? secondaryButtonTextColor,

    /// Color de botones deshabilitados
    Color? disabledButtonColor,

    /// Color de texto de botones deshabilitados
    Color? disabledButtonTextColor,

    /// Color de switches activos
    Color? switchActiveColor,

    /// Color de switches inactivos
    Color? switchInactiveColor,

    /// Color de sliders
    Color? sliderActiveColor,

    /// Color de track de sliders
    Color? sliderTrackColor,

    /// Color de separadores
    Color? dividerColor,

    /// Color de skeleton loading
    Color? skeletonBaseColor,

    /// Color de highlight de skeleton
    Color? skeletonHighlightColor,
  }) = _AppProfileColors;
}

/// Configuración de espaciado (solo design tokens)
@freezed
class AppProfileSpacing with _$AppProfileSpacing {
  const factory AppProfileSpacing({
    /// Padding de la pantalla principal
    @Default(EdgeInsets.all(16)) EdgeInsets screenPadding,

    /// Padding de las secciones
    @Default(EdgeInsets.all(16)) EdgeInsets sectionPadding,

    /// Padding de los campos
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 12)) EdgeInsets fieldPadding,

    /// Padding de los botones
    @Default(EdgeInsets.symmetric(horizontal: 24, vertical: 12)) EdgeInsets buttonPadding,

    /// Espacio entre secciones
    @Default(24.0) double sectionSpacing,

    /// Espacio entre campos
    @Default(16.0) double fieldSpacing,

    /// Espacio entre elementos pequeños
    @Default(8.0) double smallSpacing,

    /// Radio de bordes de secciones
    @Default(12.0) double sectionBorderRadius,

    /// Radio de bordes de campos
    @Default(8.0) double fieldBorderRadius,

    /// Radio de bordes de botones
    @Default(8.0) double buttonBorderRadius,

    /// Ancho de bordes
    @Default(1.0) double borderWidth,

    /// Ancho de bordes enfocados
    @Default(2.0) double focusedBorderWidth,

    /// Altura mínima de campos
    @Default(48.0) double fieldMinHeight,

    /// Altura mínima de botones
    @Default(44.0) double buttonMinHeight,

    /// Elevación de secciones
    @Default(1.0) double sectionElevation,

    /// Elevación de campos enfocados
    @Default(2.0) double focusedElevation,
  }) = _AppProfileSpacing;
}

/// Configuración de tipografía (solo design tokens)
@freezed
class AppProfileTypography with _$AppProfileTypography {
  const factory AppProfileTypography({
    /// Estilo para títulos de sección
    TextStyle? sectionHeaderStyle,

    /// Estilo para labels de campos
    TextStyle? fieldLabelStyle,

    /// Estilo para texto de campos
    TextStyle? fieldTextStyle,

    /// Estilo para placeholder
    TextStyle? placeholderStyle,

    /// Estilo para texto de ayuda
    TextStyle? helperTextStyle,

    /// Estilo para texto de error
    TextStyle? errorTextStyle,

    /// Estilo para texto de botones
    TextStyle? buttonTextStyle,

    /// Estilo para texto de descripción
    TextStyle? descriptionStyle,
  }) = _AppProfileTypography;
}

/// Configuración de animaciones
@freezed
class AppProfileAnimation with _$AppProfileAnimation {
  const factory AppProfileAnimation({
    /// Duración de animaciones principales
    @Default(Duration(milliseconds: 200)) Duration duration,

    /// Duración de animaciones de skeleton
    @Default(Duration(milliseconds: 1200)) Duration skeletonDuration,

    /// Curva de animación principal
    @Default(Curves.easeInOut) Curve curve,

    /// Curva de animación de skeleton
    @Default(Curves.easeInOut) Curve skeletonCurve,

    /// Si las animaciones están habilitadas
    @Default(true) bool enabled,
  }) = _AppProfileAnimation;
}

/// Configuración de comportamiento
@freezed
class AppProfileBehavior with _$AppProfileBehavior {
  const factory AppProfileBehavior({
    /// Auto-guardar cambios
    @Default(false) bool autoSave,

    /// Retraso para auto-guardar (ms)
    @Default(1000) int autoSaveDelay,

    /// Confirmar antes de salir con cambios
    @Default(true) bool confirmUnsavedChanges,

    /// Validar en tiempo real
    @Default(true) bool realtimeValidation,

    /// Colapsar secciones por defecto
    @Default(false) bool collapseSections,

    /// Permitir reordenar secciones
    @Default(false) bool allowReorder,

    /// Comportamiento de scroll
    @Default(AppProfileScrollBehavior.adaptive) AppProfileScrollBehavior scrollBehavior,

    /// Comportamiento de teclado
    @Default(AppProfileKeyboardBehavior.adaptive) AppProfileKeyboardBehavior keyboardBehavior,
  }) = _AppProfileBehavior;
}

/// Comportamiento de scroll
enum AppProfileScrollBehavior {
  /// Adaptativo según plataforma
  adaptive,

  /// Scroll suave (iOS style)
  smooth,

  /// Scroll con límites (Android style)
  clamping,
}

/// Comportamiento de teclado
enum AppProfileKeyboardBehavior {
  /// Adaptativo según plataforma
  adaptive,

  /// Siempre visible
  alwaysVisible,

  /// Dismiss al hacer scroll
  dismissOnScroll,

  /// Dismiss al tocar fuera
  dismissOnTap,
}

/// Configuración de accesibilidad
@freezed
class AppProfileA11yConfig with _$AppProfileA11yConfig {
  const factory AppProfileA11yConfig({
    /// Si la accesibilidad está habilitada
    @Default(true) bool enabled,

    /// Soporte para screen readers
    @Default(true) bool supportScreenReader,

    /// Navegación por teclado habilitada
    @Default(true) bool enableKeyboardNavigation,

    /// Labels semánticos habilitados
    @Default(true) bool enableSemanticLabels,

    /// Hints habilitados
    @Default(true) bool enableHints,

    /// Live regions habilitadas
    @Default(true) bool enableLiveRegions,

    /// Anunciar errores
    @Default(true) bool announceErrors,

    /// Anunciar cambios exitosos
    @Default(true) bool announceSuccess,

    /// Anunciar cambios de estado
    @Default(false) bool announceStateChanges,

    /// Label semántico para campos requeridos
    @Default('requerido') String requiredFieldSemanticLabel,

    /// Label semántico para sección principal
    @Default('Preferencias de perfil') String mainSectionSemanticLabel,

    /// Label semántico para botón guardar
    @Default('Guardar cambios') String saveButtonSemanticLabel,

    /// Label semántico para botón cancelar
    @Default('Cancelar cambios') String cancelButtonSemanticLabel,
  }) = _AppProfileA11yConfig;
}

/// Datos del formulario de preferencias
@freezed
class AppProfileFormData with _$AppProfileFormData {
  const factory AppProfileFormData({
    /// Valores de los campos
    @Default({}) Map<String, dynamic> values,

    /// Validaciones de los campos
    @Default({}) Map<String, AppProfileFieldValidation> validations,

    /// Errores de validación
    @Default({}) Map<String, String> errors,

    /// Si el formulario es válido
    @Default(true) bool isValid,

    /// Si hay cambios sin guardar
    @Default(false) bool hasUnsavedChanges,

    /// Timestamp del último cambio
    DateTime? lastModified,

    /// Contador de intentos de guardado
    @Default(0) int saveAttempts,

    /// Último intento de guardado
    DateTime? lastSaveAttempt,
  }) = _AppProfileFormData;
}

/// Resultado de validación de campo
@freezed
class AppProfileFieldValidationResult with _$AppProfileFieldValidationResult {
  const factory AppProfileFieldValidationResult({
    /// ID del campo
    required String fieldId,

    /// Si es válido
    required bool isValid,

    /// Mensaje de error
    String? errorMessage,

    /// Timestamp de la validación
    DateTime? timestamp,
  }) = _AppProfileFieldValidationResult;
}

/// Funciones de utilidad para configuración

/// Configuración por defecto para diferentes contextos
class AppProfilePreferencesConfigDefaults {
  /// Configuración por defecto estándar
  static const standard = AppProfilePreferencesConfig();

  /// Configuración para perfil básico
  static AppProfilePreferencesConfig get basicProfile => const AppProfilePreferencesConfig(
    fields: [
      AppProfileField(
        id: 'personal_info',
        type: AppProfileFieldType.header,
        label: 'Información Personal',
      ),
      AppProfileField(
        id: 'name',
        type: AppProfileFieldType.text,
        label: 'Nombre',
        required: true,
      ),
      AppProfileField(
        id: 'email',
        type: AppProfileFieldType.email,
        label: 'Email',
        required: true,
      ),
    ],
  );

  /// Configuración para perfil completo
  static AppProfilePreferencesConfig get fullProfile => const AppProfilePreferencesConfig(
    fields: [
      AppProfileField(
        id: 'personal_info',
        type: AppProfileFieldType.header,
        label: 'Información Personal',
      ),
      AppProfileField(
        id: 'name',
        type: AppProfileFieldType.text,
        label: 'Nombre completo',
        required: true,
      ),
      AppProfileField(
        id: 'email',
        type: AppProfileFieldType.email,
        label: 'Correo electrónico',
        required: true,
      ),
      AppProfileField(
        id: 'phone',
        type: AppProfileFieldType.phone,
        label: 'Teléfono',
      ),
      AppProfileField(
        id: 'notifications_header',
        type: AppProfileFieldType.header,
        label: 'Notificaciones',
      ),
      AppProfileField(
        id: 'email_notifications',
        type: AppProfileFieldType.toggle,
        label: 'Notificaciones por email',
        value: true,
      ),
      AppProfileField(
        id: 'push_notifications',
        type: AppProfileFieldType.toggle,
        label: 'Notificaciones push',
        value: false,
      ),
    ],
  );
}

/// Validadores comunes
class AppProfileValidators {
  /// Validador de email
  static String? email(Object? value) {
    if (value == null || value.toString().isEmpty) return null;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.toString())) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  /// Validador de teléfono
  static String? phone(Object? value) {
    if (value == null || value.toString().isEmpty) return null;
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{8,}$');
    if (!phoneRegex.hasMatch(value.toString())) {
      return 'Ingresa un teléfono válido';
    }
    return null;
  }

  /// Validador de requerido
  static String? required(Object? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  /// Validador de longitud mínima
  static String? Function(Object?) minLength(int min) {
    return (Object? value) {
      if (value == null || value.toString().length < min) {
        return 'Debe tener al menos $min caracteres';
      }
      return null;
    };
  }

  /// Validador de longitud máxima
  static String? Function(Object?) maxLength(int max) {
    return (Object? value) {
      if (value != null && value.toString().length > max) {
        return 'No puede tener más de $max caracteres';
      }
      return null;
    };
  }
}