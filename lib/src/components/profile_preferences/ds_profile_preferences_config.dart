import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_profile_preferences_config.freezed.dart';

/// Configuración principal para DSProfilePreferences
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// de preferencias de perfil, incluyendo todas las variantes de secciones,
/// estados, colores, espaciado, animaciones y accesibilidad.
@freezed
class DSProfilePreferencesConfig with _$DSProfilePreferencesConfig {
  const factory DSProfilePreferencesConfig({
    /// Variante de secciones del componente
    @Default(DSProfileVariant.sections) DSProfileVariant variant,

    /// Lista de campos/secciones de preferencias
    @Default([]) List<DSProfileField> fields,

    /// Estado actual del componente
    @Default(DSProfileState.defaultState) DSProfileState state,

    /// Configuración de colores (solo design tokens)
    DSProfileColors? colors,

    /// Configuración de espaciado (solo design tokens)
    DSProfileSpacing? spacing,

    /// Configuración de tipografía (solo design tokens)
    DSProfileTypography? typography,

    /// Configuración de animaciones
    DSProfileAnimation? animation,

    /// Configuración de comportamiento
    DSProfileBehavior? behavior,

    /// Configuración de accesibilidad
    DSProfileA11yConfig? a11yConfig,
  }) = _DSProfilePreferencesConfig;
}

/// Variantes disponibles para el componente
enum DSProfileVariant {
  /// Vista por secciones (default)
  sections,
}

/// Estados disponibles del componente
enum DSProfileState {
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
extension DSProfileStateExtension on DSProfileState {
  /// Obtiene el nombre del estado para mostrar
  String get displayName {
    switch (this) {
      case DSProfileState.defaultState:
        return 'Default';
      case DSProfileState.hover:
        return 'Hover';
      case DSProfileState.pressed:
        return 'Pressed';
      case DSProfileState.focus:
        return 'Focus';
      case DSProfileState.selected:
        return 'Selected';
      case DSProfileState.disabled:
        return 'Disabled';
      case DSProfileState.loading:
        return 'Loading';
      case DSProfileState.skeleton:
        return 'Skeleton';
    }
  }

  /// Indica si el estado permite interacciones
  bool get isInteractive {
    switch (this) {
      case DSProfileState.disabled:
      case DSProfileState.loading:
      case DSProfileState.skeleton:
        return false;
      default:
        return true;
    }
  }

  /// Indica si el estado muestra loading
  bool get isLoading {
    return this == DSProfileState.loading || this == DSProfileState.skeleton;
  }
}

/// Tipos de campos/secciones de preferencias
enum DSProfileFieldType {
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
enum DSProfileFieldImportance {
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
class DSProfileField with _$DSProfileField {
  const factory DSProfileField({
    /// ID único del campo
    required String id,

    /// Tipo de campo
    required DSProfileFieldType type,

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
    @Default([]) List<DSProfileFieldOption> options,

    /// Validación del campo
    DSProfileFieldValidation? validation,

    /// Si el campo es requerido
    @Default(false) bool required,

    /// Si el campo está habilitado
    @Default(true) bool enabled,

    /// Si el campo es de solo lectura
    @Default(false) bool readonly,

    /// Importancia del campo para accesibilidad
    @Default(DSProfileFieldImportance.normal) DSProfileFieldImportance importance,

    /// Icono del campo
    IconData? icon,

    /// Acción personalizada del campo
    VoidCallback? onTap,

    /// Callback de cambio de valor
    ValueChanged<Object?>? onChanged,

    /// Configuraciones específicas del tipo de campo
    Map<String, dynamic>? config,
  }) = _DSProfileField;
}

/// Opción para campos de selección
@freezed
class DSProfileFieldOption with _$DSProfileFieldOption {
  const factory DSProfileFieldOption({
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
  }) = _DSProfileFieldOption;
}

/// Validación de campos
@freezed
class DSProfileFieldValidation with _$DSProfileFieldValidation {
  const factory DSProfileFieldValidation({
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
  }) = _DSProfileFieldValidation;
}

/// Configuración de colores (solo design tokens)
@freezed
class DSProfileColors with _$DSProfileColors {
  const factory DSProfileColors({
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
  }) = _DSProfileColors;
}

/// Configuración de espaciado (solo design tokens)
@freezed
class DSProfileSpacing with _$DSProfileSpacing {
  const factory DSProfileSpacing({
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
  }) = _DSProfileSpacing;
}

/// Configuración de tipografía (solo design tokens)
@freezed
class DSProfileTypography with _$DSProfileTypography {
  const factory DSProfileTypography({
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
  }) = _DSProfileTypography;
}

/// Configuración de animaciones
@freezed
class DSProfileAnimation with _$DSProfileAnimation {
  const factory DSProfileAnimation({
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
  }) = _DSProfileAnimation;
}

/// Configuración de comportamiento
@freezed
class DSProfileBehavior with _$DSProfileBehavior {
  const factory DSProfileBehavior({
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
    @Default(DSProfileScrollBehavior.adaptive) DSProfileScrollBehavior scrollBehavior,

    /// Comportamiento de teclado
    @Default(DSProfileKeyboardBehavior.adaptive) DSProfileKeyboardBehavior keyboardBehavior,
  }) = _DSProfileBehavior;
}

/// Comportamiento de scroll
enum DSProfileScrollBehavior {
  /// Adaptativo según plataforma
  adaptive,

  /// Scroll suave (iOS style)
  smooth,

  /// Scroll con límites (Android style)
  clamping,
}

/// Comportamiento de teclado
enum DSProfileKeyboardBehavior {
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
class DSProfileA11yConfig with _$DSProfileA11yConfig {
  const factory DSProfileA11yConfig({
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
  }) = _DSProfileA11yConfig;
}

/// Datos del formulario de preferencias
@freezed
class DSProfileFormData with _$DSProfileFormData {
  const factory DSProfileFormData({
    /// Valores de los campos
    @Default({}) Map<String, dynamic> values,

    /// Validaciones de los campos
    @Default({}) Map<String, DSProfileFieldValidation> validations,

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
  }) = _DSProfileFormData;
}

/// Resultado de validación de campo
@freezed
class DSProfileFieldValidationResult with _$DSProfileFieldValidationResult {
  const factory DSProfileFieldValidationResult({
    /// ID del campo
    required String fieldId,

    /// Si es válido
    required bool isValid,

    /// Mensaje de error
    String? errorMessage,

    /// Timestamp de la validación
    DateTime? timestamp,
  }) = _DSProfileFieldValidationResult;
}

/// Funciones de utilidad para configuración

/// Configuración por defecto para diferentes contextos
class DSProfilePreferencesConfigDefaults {
  /// Configuración por defecto estándar
  static const standard = DSProfilePreferencesConfig();

  /// Configuración para perfil básico
  static DSProfilePreferencesConfig get basicProfile => const DSProfilePreferencesConfig(
    fields: [
      DSProfileField(
        id: 'personal_info',
        type: DSProfileFieldType.header,
        label: 'Información Personal',
      ),
      DSProfileField(
        id: 'name',
        type: DSProfileFieldType.text,
        label: 'Nombre',
        required: true,
      ),
      DSProfileField(
        id: 'email',
        type: DSProfileFieldType.email,
        label: 'Email',
        required: true,
      ),
    ],
  );

  /// Configuración para perfil completo
  static DSProfilePreferencesConfig get fullProfile => const DSProfilePreferencesConfig(
    fields: [
      DSProfileField(
        id: 'personal_info',
        type: DSProfileFieldType.header,
        label: 'Información Personal',
      ),
      DSProfileField(
        id: 'name',
        type: DSProfileFieldType.text,
        label: 'Nombre completo',
        required: true,
      ),
      DSProfileField(
        id: 'email',
        type: DSProfileFieldType.email,
        label: 'Correo electrónico',
        required: true,
      ),
      DSProfileField(
        id: 'phone',
        type: DSProfileFieldType.phone,
        label: 'Teléfono',
      ),
      DSProfileField(
        id: 'notifications_header',
        type: DSProfileFieldType.header,
        label: 'Notificaciones',
      ),
      DSProfileField(
        id: 'email_notifications',
        type: DSProfileFieldType.toggle,
        label: 'Notificaciones por email',
        value: true,
      ),
      DSProfileField(
        id: 'push_notifications',
        type: DSProfileFieldType.toggle,
        label: 'Notificaciones push',
        value: false,
      ),
    ],
  );
}

/// Validadores comunes
class DSProfileValidators {
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