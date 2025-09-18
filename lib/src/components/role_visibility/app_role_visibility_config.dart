import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_role_visibility_config.freezed.dart';

/// Configuración principal para AppRoleVisibility
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// de visibilidad basada en roles, incluyendo variantes de helpers,
/// estados, colores, espaciado, animaciones y accesibilidad.
@freezed
class AppRoleVisibilityConfig with _$AppRoleVisibilityConfig {
  const factory AppRoleVisibilityConfig({
    /// Variante del componente
    @Default(AppRoleVariant.helpers) AppRoleVariant variant,

    /// Lista de roles permitidos para mostrar el contenido
    @Default([]) List<AppRole> roles,

    /// Estado actual del componente
    @Default(AppRoleState.defaultState) AppRoleState state,

    /// Configuración de colores (solo design tokens)
    AppRoleVisibilityColors? colors,

    /// Configuración de espaciado (solo design tokens)
    AppRoleSpacing? spacing,

    /// Configuración de tipografía (solo design tokens)
    AppRoleTypography? typography,

    /// Configuración de animaciones
    AppRoleVisibilityAnimations? animations,

    /// Configuración de comportamiento
    AppRoleVisibilityBehavior? behavior,

    /// Configuración de accesibilidad
    AppRoleAccessibilityConfig? accessibility,

    /// Modo de evaluación de roles
    @Default(AppRoleEvaluationMode.any) AppRoleEvaluationMode evaluationMode,

    /// Lista de permisos requeridos
    @Default([]) List<String> permissions,

    /// Configuración de jerarquía
    AppRoleHierarchyConfig? hierarchyConfig,

    /// Evaluador personalizado
    AppRoleCustomEvaluator? customEvaluator,

    /// Mensaje cuando se niega el acceso
    String? accessDeniedMessage,

    /// Si debe mostrar helpers de depuración
    @Default(false) bool showDebugHelpers,

    /// Si debe usar animaciones de fade
    @Default(true) bool useFadeAnimation,

    /// Si debe mostrar placeholders cuando no hay permisos
    @Default(false) bool showPlaceholder,

    /// Placeholder personalizado cuando no hay permisos
    Widget? customPlaceholder,
  }) = _AppRoleVisibilityConfig;
}

/// Variantes disponibles para el componente
enum AppRoleVariant {
  /// Vista con helpers de debugging y desarrollo
  helpers,
}

/// Estados disponibles del componente
enum AppRoleState {
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
extension AppRoleStateExtension on AppRoleState {
  /// Obtiene el nombre del estado para mostrar
  String get displayName {
    switch (this) {
      case AppRoleState.defaultState:
        return 'Default';
      case AppRoleState.hover:
        return 'Hover';
      case AppRoleState.pressed:
        return 'Pressed';
      case AppRoleState.focus:
        return 'Focus';
      case AppRoleState.selected:
        return 'Selected';
      case AppRoleState.disabled:
        return 'Disabled';
      case AppRoleState.loading:
        return 'Loading';
      case AppRoleState.skeleton:
        return 'Skeleton';
    }
  }

  /// Indica si el estado permite interacciones
  bool get isInteractive {
    switch (this) {
      case AppRoleState.disabled:
      case AppRoleState.loading:
      case AppRoleState.skeleton:
        return false;
      default:
        return true;
    }
  }

  /// Indica si el estado muestra loading
  bool get isLoading {
    return this == AppRoleState.loading || this == AppRoleState.skeleton;
  }
}

/// Tipos de roles disponibles en el sistema
enum AppRoleType {
  /// Rol de administrador - acceso completo
  admin,

  /// Rol de editor - puede editar contenido
  editor,

  /// Rol de moderador - puede moderar contenido
  moderator,

  /// Rol de usuario - acceso básico
  user,

  /// Rol de invitado - acceso limitado
  guest,

  /// Rol personalizado - definido por el desarrollador
  custom,
}

/// Niveles de prioridad para roles
enum AppRolePriority {
  /// Prioridad crítica - siempre se evalúa primero
  critical,

  /// Prioridad alta
  high,

  /// Prioridad normal
  normal,

  /// Prioridad baja
  low,
}

/// Configuración de un rol
@freezed
class AppRole with _$AppRole {
  const factory AppRole({
    /// ID único del rol
    required String id,

    /// Tipo de rol
    required AppRoleType type,

    /// Nombre del rol para mostrar
    required String name,

    /// Nombre para mostrar (opcional, usa name si no se especifica)
    String? displayName,

    /// Descripción del rol
    String? description,

    /// Permisos asociados al rol
    @Default([]) List<String> permissions,

    /// Prioridad del rol
    @Default(AppRolePriority.normal) AppRolePriority priority,

    /// Importancia del rol
    AppRoleImportance? importance,

    /// Nivel del rol (para jerarquías)
    int? level,

    /// Si el rol está activo
    @Default(true) bool isActive,

    /// Si el rol está habilitado
    @Default(true) bool enabled,

    /// Configuración de accesibilidad
    AppRoleAccessibility? accessibility,

    /// Metadatos adicionales del rol
    @Default({}) Map<String, dynamic> metadata,

    /// Roles padre de los que hereda permisos
    @Default([]) List<String> inheritsFrom,

    /// Fecha de expiración del rol (opcional)
    DateTime? expiresAt,
  }) = _AppRole;
}

/// Configuración de colores (solo design tokens)
@freezed
class AppRoleColors with _$AppRoleColors {
  const factory AppRoleColors({
    /// Color de fondo del componente
    Color? backgroundColor,

    /// Color de fondo del placeholder
    Color? placeholderBackgroundColor,

    /// Color de texto del placeholder
    Color? placeholderTextColor,

    /// Color de bordes
    Color? borderColor,

    /// Color de bordes enfocados
    Color? focusedBorderColor,

    /// Color de bordes cuando está deshabilitado
    Color? disabledBorderColor,

    /// Color de texto para helpers de debug
    Color? debugTextColor,

    /// Color de fondo para helpers de debug
    Color? debugBackgroundColor,

    /// Color de iconos
    Color? iconColor,

    /// Color de iconos deshabilitados
    Color? disabledIconColor,

    /// Color de overlay de loading
    Color? loadingOverlayColor,

    /// Color de skeleton loading
    Color? skeletonBaseColor,

    /// Color de highlight de skeleton
    Color? skeletonHighlightColor,

    /// Color de error para roles no válidos
    Color? errorColor,

    /// Color de warning para roles en conflicto
    Color? warningColor,

    /// Color de éxito para roles válidos
    Color? successColor,
  }) = _AppRoleColors;
}

/// Configuración de espaciado (solo design tokens)
@freezed
class AppRoleSpacing with _$AppRoleSpacing {
  const factory AppRoleSpacing({
    /// Padding del componente principal
    @Default(EdgeInsets.zero) EdgeInsets componentPadding,

    /// Padding del placeholder
    @Default(EdgeInsets.all(16)) EdgeInsets placeholderPadding,

    /// Padding de los helpers de debug
    @Default(EdgeInsets.all(8)) EdgeInsets debugHelperPadding,

    /// Margen entre elementos
    @Default(8.0) double elementSpacing,

    /// Radio de bordes del componente
    @Default(4.0) double borderRadius,

    /// Radio de bordes del placeholder
    @Default(8.0) double placeholderBorderRadius,

    /// Ancho de bordes
    @Default(1.0) double borderWidth,

    /// Ancho de bordes enfocados
    @Default(2.0) double focusedBorderWidth,

    /// Altura mínima del placeholder
    @Default(48.0) double placeholderMinHeight,

    /// Elevación del componente
    @Default(0.0) double elevation,

    /// Elevación del placeholder
    @Default(1.0) double placeholderElevation,
  }) = _AppRoleSpacing;
}

/// Configuración de tipografía (solo design tokens)
@freezed
class AppRoleTypography with _$AppRoleTypography {
  const factory AppRoleTypography({
    /// Estilo para texto del placeholder
    TextStyle? placeholderTextStyle,

    /// Estilo para texto de helpers de debug
    TextStyle? debugTextStyle,

    /// Estilo para mensajes de error
    TextStyle? errorTextStyle,

    /// Estilo para mensajes de warning
    TextStyle? warningTextStyle,

    /// Estilo para mensajes de éxito
    TextStyle? successTextStyle,
  }) = _AppRoleTypography;
}

/// Configuración de animaciones
@freezed
class AppRoleAnimation with _$AppRoleAnimation {
  const factory AppRoleAnimation({
    /// Duración de animaciones principales
    @Default(Duration(milliseconds: 300)) Duration duration,

    /// Duración de animaciones de skeleton
    @Default(Duration(milliseconds: 1200)) Duration skeletonDuration,

    /// Duración de fade in/out
    @Default(Duration(milliseconds: 200)) Duration fadeDuration,

    /// Curva de animación principal
    @Default(Curves.easeInOut) Curve curve,

    /// Curva de animación de skeleton
    @Default(Curves.easeInOut) Curve skeletonCurve,

    /// Curva de animación de fade
    @Default(Curves.easeOut) Curve fadeCurve,

    /// Si las animaciones están habilitadas
    @Default(true) bool enabled,
  }) = _AppRoleAnimation;
}

/// Configuración de comportamiento
@freezed
class AppRoleBehavior with _$AppRoleBehavior {
  const factory AppRoleBehavior({
    /// Modo de evaluación de roles
    @Default(AppRoleEvaluationMode.any) AppRoleEvaluationMode evaluationMode,

    /// Si debe cachear resultados de evaluación
    @Default(true) bool cacheResults,

    /// Tiempo de cache en milisegundos
    @Default(30000) int cacheTimeMs,

    /// Si debe mostrar información de debugging en desarrollo
    @Default(false) bool showDebugInfo,

    /// Si debe registrar accesos para auditoría
    @Default(false) bool logAccess,

    /// Si debe validar roles de forma asíncrona
    @Default(false) bool asyncValidation,

    /// Comportamiento cuando falla la validación
    @Default(AppRoleFailureBehavior.hide) AppRoleFailureBehavior onFailure,

    /// Si debe mostrar loading durante validación asíncrona
    @Default(true) bool showLoadingDuringValidation,
  }) = _AppRoleBehavior;
}

/// Modos de evaluación de roles
enum AppRoleEvaluationMode {
  /// Cualquier rol coincidente permite acceso
  any,

  /// Todos los roles deben coincidir
  all,

  /// Al menos un rol de cada grupo debe coincidir
  groups,

  /// Evaluación personalizada
  custom,
}

/// Comportamiento en caso de fallo de validación
enum AppRoleFailureBehavior {
  /// Ocultar completamente el contenido
  hide,

  /// Mostrar placeholder
  placeholder,

  /// Mostrar mensaje de error
  error,

  /// Mantener contenido pero deshabilitado
  disable,
}

/// Configuración de accesibilidad
@freezed
class AppRoleA11yConfig with _$AppRoleA11yConfig {
  const factory AppRoleA11yConfig({
    /// Si la accesibilidad está habilitada
    @Default(true) bool enabled,

    /// Soporte para screen readers
    @Default(true) bool supportScreenReader,

    /// Si debe anunciar cambios de visibilidad
    @Default(false) bool announceVisibilityChanges,

    /// Si debe anunciar información de roles en debug
    @Default(false) bool announceDebugInfo,

    /// Labels semánticos habilitados
    @Default(true) bool enableSemanticLabels,

    /// Hints habilitados
    @Default(true) bool enableHints,

    /// Label semántico para contenido oculto por roles
    @Default('Contenido no disponible para su rol') String hiddenContentLabel,

    /// Label semántico para contenido en carga
    @Default('Verificando permisos') String loadingContentLabel,

    /// Label semántico para placeholder
    @Default('Contenido restringido') String placeholderLabel,

    /// Hint para explicar por qué el contenido está oculto
    @Default('No tiene los permisos necesarios para ver este contenido') String permissionDeniedHint,
  }) = _AppRoleA11yConfig;
}

/// Contexto de evaluación de roles
@freezed
class AppRoleContext with _$AppRoleContext {
  const factory AppRoleContext({
    /// Usuario actual
    required String userId,

    /// Roles del usuario actual
    @Default([]) List<AppRole> userRoles,

    /// Permisos adicionales del usuario
    @Default([]) List<String> userPermissions,

    /// Contexto de la aplicación
    @Default({}) Map<String, dynamic> appContext,

    /// Timestamp de la evaluación
    DateTime? evaluatedAt,

    /// Si la evaluación fue exitosa
    @Default(false) bool isValid,

    /// Información adicional de debugging
    @Default({}) Map<String, dynamic> debugInfo,
  }) = _AppRoleContext;
}

/// Resultado de evaluación de roles
@freezed
class AppRoleEvaluationResult with _$AppRoleEvaluationResult {
  const factory AppRoleEvaluationResult({
    /// Si el usuario tiene acceso
    required bool hasAccess,

    /// Alias para hasAccess (compatibilidad)
    bool? isVisible,

    /// Error de validación si aplica
    AppRoleValidationError? error,

    /// Roles que coincidieron
    @Default([]) List<AppRole> matchedRoles,

    /// Roles que no coincidieron
    @Default([]) List<AppRole> unmatchedRoles,

    /// Permisos que coincidieron
    @Default([]) List<String> matchedPermissions,

    /// Razón por la que se negó el acceso (si aplica)
    String? denialReason,

    /// Información de debugging
    @Default({}) Map<String, dynamic> debugInfo,

    /// Timestamp de la evaluación
    DateTime? evaluatedAt,

    /// Tiempo que tomó la evaluación en milisegundos
    int? evaluationTimeMs,
  }) = _AppRoleEvaluationResult;
}

/// Funciones de utilidad para configuración

/// Configuración por defecto para diferentes contextos
class AppRoleVisibilityConfigDefaults {
  /// Configuración por defecto estándar
  static const standard = AppRoleVisibilityConfig();

  /// Configuración para debugging
  static const debug = AppRoleVisibilityConfig(
    showDebugHelpers: true,
    behavior: AppRoleVisibilityBehavior(
      enableDebugMode: true,
      enableLogging: true,
    ),
  );

  /// Configuración para producción
  static const production = AppRoleVisibilityConfig(
    showDebugHelpers: false,
    behavior: AppRoleVisibilityBehavior(
      enableDebugMode: false,
      enableLogging: true,
      cacheResults: true,
    ),
  );

  /// Configuración con placeholder
  static const withPlaceholder = AppRoleVisibilityConfig(
    showPlaceholder: true,
    behavior: AppRoleVisibilityBehavior(
      showErrorMessages: true,
    ),
  );
}

/// Roles predefinidos comunes
class AppRolePredefined {
  /// Rol de administrador con todos los permisos
  static const admin = AppRole(
    id: 'admin',
    type: AppRoleType.admin,
    name: 'Administrador',
    description: 'Acceso completo a todas las funcionalidades',
    permissions: ['*'],
    priority: AppRolePriority.critical,
  );

  /// Rol de editor con permisos de contenido
  static const editor = AppRole(
    id: 'editor',
    type: AppRoleType.editor,
    name: 'Editor',
    description: 'Puede crear y editar contenido',
    permissions: ['content.create', 'content.edit', 'content.view'],
    priority: AppRolePriority.high,
  );

  /// Rol de moderador con permisos de moderación
  static const moderator = AppRole(
    id: 'moderator',
    type: AppRoleType.moderator,
    name: 'Moderador',
    description: 'Puede moderar contenido y usuarios',
    permissions: ['content.moderate', 'users.moderate', 'content.view'],
    priority: AppRolePriority.high,
  );

  /// Rol de usuario estándar
  static const user = AppRole(
    id: 'user',
    type: AppRoleType.user,
    name: 'Usuario',
    description: 'Acceso básico a la aplicación',
    permissions: ['content.view', 'profile.edit'],
    priority: AppRolePriority.normal,
  );

  /// Rol de invitado con acceso mínimo
  static const guest = AppRole(
    id: 'guest',
    type: AppRoleType.guest,
    name: 'Invitado',
    description: 'Acceso de solo lectura',
    permissions: ['content.view'],
    priority: AppRolePriority.low,
  );

  /// Lista de todos los roles predefinidos
  static const List<AppRole> all = [
    admin,
    editor,
    moderator,
    user,
    guest,
  ];
}

/// Validadores de roles
class AppRoleValidators {
  /// Valida si un rol es válido
  static bool isValidRole(AppRole role) {
    return role.id.isNotEmpty &&
           role.name.isNotEmpty &&
           role.isActive;
  }

  /// Valida si un usuario tiene un permiso específico
  static bool hasPermission(List<AppRole> userRoles, String permission) {
    for (final role in userRoles) {
      if (!role.isActive) continue;

      // Permiso de admin (*) da acceso a todo
      if (role.permissions.contains('*')) return true;

      // Permiso específico
      if (role.permissions.contains(permission)) return true;

      // Permiso con wildcard (ej: content.*)
      for (final rolePermission in role.permissions) {
        if (rolePermission.endsWith('*')) {
          final prefix = rolePermission.substring(0, rolePermission.length - 1);
          if (permission.startsWith(prefix)) return true;
        }
      }
    }

    return false;
  }

  /// Evalúa si los roles del usuario coinciden con los requeridos
  static AppRoleEvaluationResult evaluateRoles({
    required List<AppRole> userRoles,
    required List<AppRole> requiredRoles,
    required AppRoleEvaluationMode mode,
    AppRoleContext? context,
  }) {
    final startTime = DateTime.now();
    final matchedRoles = <AppRole>[];
    final unmatchedRoles = <AppRole>[];
    final matchedPermissions = <String>[];

    bool hasAccess = false;
    String? denialReason;

    switch (mode) {
      case AppRoleEvaluationMode.any:
        // Cualquier rol coincidente permite acceso
        for (final requiredRole in requiredRoles) {
          bool found = false;
          for (final userRole in userRoles) {
            if (_rolesMatch(userRole, requiredRole)) {
              matchedRoles.add(requiredRole);
              matchedPermissions.addAll(userRole.permissions);
              found = true;
              break;
            }
          }
          if (!found) {
            unmatchedRoles.add(requiredRole);
          }
        }
        hasAccess = matchedRoles.isNotEmpty;
        if (!hasAccess) {
          denialReason = 'No tiene ninguno de los roles requeridos';
        }
        break;

      case AppRoleEvaluationMode.all:
        // Todos los roles deben coincidir
        for (final requiredRole in requiredRoles) {
          bool found = false;
          for (final userRole in userRoles) {
            if (_rolesMatch(userRole, requiredRole)) {
              matchedRoles.add(requiredRole);
              matchedPermissions.addAll(userRole.permissions);
              found = true;
              break;
            }
          }
          if (!found) {
            unmatchedRoles.add(requiredRole);
          }
        }
        hasAccess = unmatchedRoles.isEmpty && requiredRoles.isNotEmpty;
        if (!hasAccess) {
          denialReason = 'No tiene todos los roles requeridos';
        }
        break;

      case AppRoleEvaluationMode.groups:
      case AppRoleEvaluationMode.custom:
        // Implementación simplificada para el ejemplo
        hasAccess = matchedRoles.isNotEmpty;
        break;
    }

    final endTime = DateTime.now();
    final evaluationTime = endTime.difference(startTime).inMilliseconds;

    return AppRoleEvaluationResult(
      hasAccess: hasAccess,
      matchedRoles: matchedRoles,
      unmatchedRoles: unmatchedRoles,
      matchedPermissions: matchedPermissions.toSet().toList(),
      denialReason: denialReason,
      evaluatedAt: endTime,
      evaluationTimeMs: evaluationTime,
      debugInfo: context?.debugInfo ?? {},
    );
  }

  /// Verifica si dos roles coinciden
  static bool _rolesMatch(AppRole userRole, AppRole requiredRole) {
    if (!userRole.isActive) return false;

    // Coincidencia por ID
    if (userRole.id == requiredRole.id) return true;

    // Coincidencia por tipo
    if (userRole.type == requiredRole.type) return true;

    // Admin tiene acceso a todo
    if (userRole.type == AppRoleType.admin) return true;

    // Verificar herencia
    if (requiredRole.inheritsFrom.contains(userRole.id)) return true;

    return false;
  }
}

/// Extensiones auxiliares

extension AppRoleExtensions on AppRole {
  /// Verifica si el rol ha expirado
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Verifica si el rol está efectivamente activo
  bool get isEffectivelyActive {
    return isActive && !isExpired;
  }

  /// Obtiene la prioridad numérica del rol
  int get priorityValue {
    switch (priority) {
      case AppRolePriority.critical:
        return 100;
      case AppRolePriority.high:
        return 75;
      case AppRolePriority.normal:
        return 50;
      case AppRolePriority.low:
        return 25;
    }
  }
}

extension AppRoleTypeExtensions on AppRoleType {
  /// Obtiene el nivel de acceso del tipo de rol
  int get accessLevel {
    switch (this) {
      case AppRoleType.admin:
        return 100;
      case AppRoleType.editor:
        return 75;
      case AppRoleType.moderator:
        return 75;
      case AppRoleType.user:
        return 50;
      case AppRoleType.guest:
        return 25;
      case AppRoleType.custom:
        return 50;
    }
  }

  /// Obtiene el color asociado al tipo de rol
  Color get color {
    switch (this) {
      case AppRoleType.admin:
        return Colors.red;
      case AppRoleType.editor:
        return Colors.blue;
      case AppRoleType.moderator:
        return Colors.orange;
      case AppRoleType.user:
        return Colors.green;
      case AppRoleType.guest:
        return Colors.grey;
      case AppRoleType.custom:
        return Colors.purple;
    }
  }
}

// Typedefs para callbacks
typedef AppRoleCustomEvaluator = Future<bool> Function(
  List<AppRole> userRoles,
  List<AppRole> requiredRoles,
  AppRoleContext? context,
);

typedef AppRoleVisibilityCallback = void Function(AppRoleEvaluationResult result);
typedef AppRoleValidationCallback = void Function(AppRoleValidationError error);
typedef AppRoleVisibilityErrorBuilder = Widget Function(
  BuildContext context,
  AppRoleValidationError error,
  AppRoleVisibilityConfig config,
);
typedef AppRoleVisibilityLoadingBuilder = Widget Function(
  BuildContext context,
  AppRoleVisibilityConfig config,
);

// Clases adicionales necesarias para el componente
@freezed
class AppRoleValidationError with _$AppRoleValidationError {
  const factory AppRoleValidationError({
    required AppRoleErrorType type,
    required String message,
    List<AppRole>? requiredRoles,
    List<AppRole>? userRoles,
    String? code,
    Map<String, dynamic>? details,
  }) = _AppRoleValidationError;
}

enum AppRoleErrorType {
  accessDenied,
  evaluationError,
  configurationError,
  permissionError,
  roleExpired,
  invalidRole,
}

@freezed
class AppRoleVisibilityColors with _$AppRoleVisibilityColors {
  const factory AppRoleVisibilityColors({
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? focusColor,
    Color? hoverColor,
    Color? loadingColor,
    Color? errorColor,
    Color? errorBackgroundColor,
    Color? errorBorderColor,
    Color? errorTextColor,
    Color? errorIconColor,
    Color? disabledColor,
    Color? disabledBackgroundColor,
  }) = _AppRoleVisibilityColors;
}

@freezed
class AppRoleVisibilityAnimations with _$AppRoleVisibilityAnimations {
  const factory AppRoleVisibilityAnimations({
    @Default(Duration(milliseconds: 300)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableAnimations,
    @Default(true) bool respectReducedMotion,
  }) = _AppRoleVisibilityAnimations;
}

@freezed
class AppRoleVisibilityBehavior with _$AppRoleVisibilityBehavior {
  const factory AppRoleVisibilityBehavior({
    @Default(false) bool preserveSpaceWhenHidden,
    @Default(true) bool showErrorMessages,
    @Default(false) bool enableDebugMode,
    @Default(true) bool cacheResults,
    @Default(Duration(minutes: 5)) Duration cacheDuration,
    @Default(false) bool enableLogging,
    @Default(false) bool automaticRefresh,
    @Default(Duration(minutes: 10)) Duration refreshInterval,
  }) = _AppRoleVisibilityBehavior;
}

@freezed
class AppRoleAccessibilityConfig with _$AppRoleAccessibilityConfig {
  const factory AppRoleAccessibilityConfig({
    @Default(true) bool enableA11yAnnouncements,
    String? accessGrantedMessage,
    String? accessDeniedMessage,
    String? roleChangeMessage,
    String? errorAnnouncementMessage,
  }) = _AppRoleAccessibilityConfig;
}

@freezed
class AppRoleAccessibility with _$AppRoleAccessibility {
  const factory AppRoleAccessibility({
    String? label,
    String? hint,
    String? value,
    @Default(true) bool focusable,
  }) = _AppRoleAccessibility;
}

enum AppRoleImportance {
  low,
  medium,
  high,
  critical,
}

@freezed
class AppRoleHierarchyConfig with _$AppRoleHierarchyConfig {
  const factory AppRoleHierarchyConfig({
    @Default(0) int minimumLevel,
    @Default(false) bool strictMode,
  }) = _AppRoleHierarchyConfig;
}

// Clases de styling adicionales para el platform adapter
@freezed
class AppRoleVisibilityPadding with _$AppRoleVisibilityPadding {
  const factory AppRoleVisibilityPadding({
    @Default(16.0) double horizontal,
    @Default(8.0) double vertical,
  }) = _AppRoleVisibilityPadding;
}

@freezed
class AppRoleVisibilityBorderRadius with _$AppRoleVisibilityBorderRadius {
  const factory AppRoleVisibilityBorderRadius({
    @Default(8.0) double radius,
  }) = _AppRoleVisibilityBorderRadius;
}

@freezed
class AppRoleVisibilityTextStyle with _$AppRoleVisibilityTextStyle {
  const factory AppRoleVisibilityTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) = _AppRoleVisibilityTextStyle;
}

@freezed
class AppRoleVisibilityShadow with _$AppRoleVisibilityShadow {
  const factory AppRoleVisibilityShadow({
    @Default(Colors.black26) Color color,
    @Default(0.3) double opacity,
    @Default(4.0) double blurRadius,
    @Default(Offset.zero) Offset offset,
    @Default(1.0) double spreadRadius,
  }) = _AppRoleVisibilityShadow;
}

@freezed
class AppRoleVisibilityInputDecoration with _$AppRoleVisibilityInputDecoration {
  const factory AppRoleVisibilityInputDecoration({
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    @Default(true) bool filled,
    Color? fillColor,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    @Default(AppRoleVisibilityPadding()) AppRoleVisibilityPadding contentPadding,
  }) = _AppRoleVisibilityInputDecoration;
}