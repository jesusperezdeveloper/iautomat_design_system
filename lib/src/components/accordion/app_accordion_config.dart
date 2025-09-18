import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_accordion_config.freezed.dart';

/// Configuración principal para AppAccordion
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// accordion, incluyendo variantes single y multiple, estados, colores,
/// espaciado y accesibilidad.
@freezed
class AppAccordionConfig with _$AppAccordionConfig {
  const factory AppAccordionConfig({
    /// Variante del accordion
    @Default(AppAccordionVariant.single) AppAccordionVariant variant,

    /// Estado actual del componente
    @Default(AppAccordionState.defaultState) AppAccordionState state,

    /// Configuración de colores (solo design tokens)
    AppAccordionColors? colors,

    /// Configuración de espaciado (solo design tokens)
    AppAccordionSpacing? spacing,

    /// Configuración de tipografía (solo design tokens)
    AppAccordionTypography? typography,

    /// Configuración de animaciones
    AppAccordionAnimations? animations,

    /// Configuración de comportamiento
    AppAccordionBehavior? behavior,

    /// Configuración de accesibilidad
    AppAccordionAccessibilityConfig? accessibility,

    /// Si permite múltiples elementos expandidos simultáneamente
    @Default(false) bool allowMultiple,

    /// Si muestra dividers entre elementos
    @Default(true) bool showDividers,

    /// Si usa iconos Material para expandir/colapsar
    @Default(true) bool useMaterialIcons,

    /// Radio de border radius personalizado
    double? borderRadius,

    /// Elevación del accordion
    @Default(0.0) double elevation,

    /// Mensaje cuando no hay items
    @Default('No hay elementos disponibles') String emptyMessage,

    /// Mensaje cuando está cargando
    @Default('Cargando elementos...') String loadingMessage,

    /// Mensaje de error personalizado
    String? errorMessage,
  }) = _AppAccordionConfig;
}

/// Variantes disponibles para el accordion
enum AppAccordionVariant {
  /// Solo un elemento puede estar expandido a la vez
  single,

  /// Múltiples elementos pueden estar expandidos simultáneamente
  multiple,
}

/// Estados disponibles del componente
enum AppAccordionState {
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

/// Elemento individual del accordion
@freezed
class AppAccordionItem with _$AppAccordionItem {
  const factory AppAccordionItem({
    /// Identificador único del elemento
    required String key,

    /// Título del elemento
    required String title,

    /// Contenido del elemento
    required Widget content,

    /// Subtítulo opcional
    String? subtitle,

    /// Icono opcional para el header
    Widget? icon,

    /// Widget trailing personalizado
    Widget? trailing,

    /// Si este elemento está deshabilitado
    @Default(false) bool disabled,

    /// Si este elemento está en estado de carga
    @Default(false) bool loading,

    /// Callback cuando se presiona el elemento
    VoidCallback? onTap,

    /// Callback cuando cambia el estado de expansión
    AppAccordionItemCallback? onExpansionChanged,

    /// Configuración de colores específica para este elemento
    AppAccordionItemColors? colors,

    /// Configuración de accesibilidad específica
    AppAccordionItemAccessibility? accessibility,

    /// Datos adicionales asociados al elemento
    Map<String, dynamic>? metadata,
  }) = _AppAccordionItem;
}

/// Extensión para obtener propiedades de los estados
extension AppAccordionStateExtension on AppAccordionState {
  /// Obtiene el nombre del estado para mostrar
  String get displayName {
    switch (this) {
      case AppAccordionState.defaultState:
        return 'Default';
      case AppAccordionState.hover:
        return 'Hover';
      case AppAccordionState.pressed:
        return 'Pressed';
      case AppAccordionState.focus:
        return 'Focus';
      case AppAccordionState.selected:
        return 'Selected';
      case AppAccordionState.disabled:
        return 'Disabled';
      case AppAccordionState.loading:
        return 'Loading';
      case AppAccordionState.skeleton:
        return 'Skeleton';
    }
  }

  /// Indica si el estado permite interacciones
  bool get isInteractive {
    switch (this) {
      case AppAccordionState.disabled:
      case AppAccordionState.loading:
      case AppAccordionState.skeleton:
        return false;
      default:
        return true;
    }
  }

  /// Indica si el estado muestra loading
  bool get isLoading {
    return this == AppAccordionState.loading || this == AppAccordionState.skeleton;
  }
}

/// Configuración de colores (solo design tokens)
@freezed
class AppAccordionColors with _$AppAccordionColors {
  const factory AppAccordionColors({
    /// Color de fondo del accordion
    Color? backgroundColor,

    /// Color de superficie para elementos
    Color? surfaceColor,

    /// Color del header
    Color? headerColor,

    /// Color del header cuando está expandido
    Color? headerExpandedColor,

    /// Color del contenido
    Color? contentColor,

    /// Color de los bordes
    Color? borderColor,

    /// Color del divider
    Color? dividerColor,

    /// Color del texto del título
    Color? titleColor,

    /// Color del texto del subtítulo
    Color? subtitleColor,

    /// Color del texto del contenido
    Color? contentTextColor,

    /// Color del icono de expansión
    Color? expansionIconColor,

    /// Color en estado hover
    Color? hoverColor,

    /// Color en estado pressed
    Color? pressedColor,

    /// Color en estado focus
    Color? focusColor,

    /// Color en estado selected
    Color? selectedColor,

    /// Color en estado disabled
    Color? disabledColor,

    /// Color de loading
    Color? loadingColor,

    /// Color base del skeleton
    Color? skeletonBaseColor,

    /// Color de highlight del skeleton
    Color? skeletonHighlightColor,

    /// Color de shadow/elevación
    Color? shadowColor,
  }) = _AppAccordionColors;
}

/// Configuración de espaciado (solo design tokens)
@freezed
class AppAccordionSpacing with _$AppAccordionSpacing {
  const factory AppAccordionSpacing({
    /// Padding interno del accordion
    @Default(EdgeInsets.zero) EdgeInsets padding,

    /// Margin externo del accordion
    @Default(EdgeInsets.zero) EdgeInsets margin,

    /// Padding del header
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0))
    EdgeInsets headerPadding,

    /// Padding del contenido
    @Default(EdgeInsets.all(16.0)) EdgeInsets contentPadding,

    /// Espaciado entre título y subtítulo
    @Default(4.0) double titleSubtitleSpacing,

    /// Espaciado entre icono y texto
    @Default(12.0) double iconTextSpacing,

    /// Altura mínima del header
    @Default(56.0) double minHeaderHeight,

    /// Altura mínima interactiva (para touch targets)
    @Default(44.0) double minInteractiveSize,

    /// Espaciado entre elementos del accordion
    @Default(1.0) double itemSpacing,

    /// Grosor del divider
    @Default(1.0) double dividerThickness,

    /// Espaciado del focus indicator
    @Default(2.0) double focusIndicatorSpacing,
  }) = _AppAccordionSpacing;
}

/// Configuración de tipografía (solo design tokens)
@freezed
class AppAccordionTypography with _$AppAccordionTypography {
  const factory AppAccordionTypography({
    /// Estilo del título
    TextStyle? titleStyle,

    /// Estilo del subtítulo
    TextStyle? subtitleStyle,

    /// Estilo del contenido
    TextStyle? contentStyle,

    /// Estilo del texto de loading
    TextStyle? loadingStyle,

    /// Estilo del texto de error
    TextStyle? errorStyle,

    /// Estilo del texto de empty state
    TextStyle? emptyStyle,
  }) = _AppAccordionTypography;
}

/// Configuración de animaciones
@freezed
class AppAccordionAnimations with _$AppAccordionAnimations {
  const factory AppAccordionAnimations({
    /// Duración de la animación de expansión
    @Default(Duration(milliseconds: 300)) Duration expansionDuration,

    /// Duración de animaciones de estado
    @Default(Duration(milliseconds: 200)) Duration stateDuration,

    /// Duración de animaciones de skeleton
    @Default(Duration(milliseconds: 1200)) Duration skeletonDuration,

    /// Curva de animación de expansión
    @Default(Curves.easeInOut) Curve expansionCurve,

    /// Curva de animación de estado
    @Default(Curves.easeInOut) Curve stateCurve,

    /// Curva de animación de skeleton
    @Default(Curves.easeInOut) Curve skeletonCurve,

    /// Si las animaciones están habilitadas
    @Default(true) bool enabled,

    /// Si debe respetar la configuración de reduced motion
    @Default(true) bool respectReducedMotion,

    /// Offset de animación de entrada
    @Default(Offset(0, 10)) Offset enterOffset,

    /// Offset de animación de salida
    @Default(Offset(0, -10)) Offset exitOffset,
  }) = _AppAccordionAnimations;
}

/// Configuración de comportamiento
@freezed
class AppAccordionBehavior with _$AppAccordionBehavior {
  const factory AppAccordionBehavior({
    /// Si debe mostrar información de debugging en desarrollo
    @Default(false) bool showDebugInfo,

    /// Si debe usar efectos de hover en web/desktop
    @Default(true) bool enableHoverEffects,

    /// Si debe mostrar estados de focus
    @Default(true) bool showFocusIndicator,

    /// Si debe usar haptic feedback en móvil
    @Default(true) bool enableHapticFeedback,

    /// Si debe cachear las configuraciones de estilo
    @Default(true) bool cacheStyles,

    /// Si debe adaptar automáticamente según la plataforma
    @Default(true) bool platformAdaptive,

    /// Si permite navegación por teclado
    @Default(true) bool enableKeyboardNavigation,

    /// Si debe mantener un elemento expandido siempre
    @Default(false) bool maintainState,

    /// Si permite scroll automático al expandir
    @Default(true) bool autoScroll,

    /// Duración del scroll automático
    @Default(Duration(milliseconds: 500)) Duration autoScrollDuration,

    /// Si debe colapsar otros elementos al expandir uno nuevo (solo single)
    @Default(true) bool collapseOthers,

    /// Si debe animar el icono de expansión
    @Default(true) bool animateExpansionIcon,
  }) = _AppAccordionBehavior;
}

/// Configuración de accesibilidad
@freezed
class AppAccordionAccessibilityConfig with _$AppAccordionAccessibilityConfig {
  const factory AppAccordionAccessibilityConfig({
    /// Si la accesibilidad está habilitada
    @Default(true) bool enabled,

    /// Rol semántico del accordion
    @Default('tree') String semanticRole,

    /// Label para screen readers
    String? semanticLabel,

    /// Descripción para screen readers
    String? semanticDescription,

    /// Si debe ser enfocable por teclado
    @Default(true) bool focusable,

    /// Si debe excluirse de la navegación semántica
    @Default(false) bool excludeSemantics,

    /// Label para estado expandido
    @Default('Expandido') String expandedLabel,

    /// Label para estado colapsado
    @Default('Colapsado') String collapsedLabel,

    /// Label para acción de expandir
    @Default('Presiona para expandir') String expandHint,

    /// Label para acción de colapsar
    @Default('Presiona para colapsar') String collapseHint,

    /// Label para estado de loading
    @Default('Cargando') String loadingLabel,

    /// Label para estado disabled
    @Default('No disponible') String disabledLabel,

    /// Si debe anunciar cambios de estado
    @Default(true) bool announceStateChanges,

    /// Si debe usar hints para navegación por teclado
    @Default(true) bool useKeyboardHints,
  }) = _AppAccordionAccessibilityConfig;
}

/// Configuración de colores para elementos individuales
@freezed
class AppAccordionItemColors with _$AppAccordionItemColors {
  const factory AppAccordionItemColors({
    /// Color de fondo del elemento
    Color? backgroundColor,

    /// Color del header del elemento
    Color? headerColor,

    /// Color del contenido del elemento
    Color? contentColor,

    /// Color del texto del título
    Color? titleColor,

    /// Color del texto del subtítulo
    Color? subtitleColor,

    /// Color del icono
    Color? iconColor,

    /// Color del border
    Color? borderColor,
  }) = _AppAccordionItemColors;
}

/// Configuración de accesibilidad para elementos individuales
@freezed
class AppAccordionItemAccessibility with _$AppAccordionItemAccessibility {
  const factory AppAccordionItemAccessibility({
    /// Label semántico del elemento
    String? semanticLabel,

    /// Descripción semántica del elemento
    String? semanticDescription,

    /// Hint semántico del elemento
    String? semanticHint,

    /// Si debe excluirse de la navegación semántica
    @Default(false) bool excludeSemantics,
  }) = _AppAccordionItemAccessibility;
}

/// Typedefs para callbacks
typedef AppAccordionCallback = void Function(List<String> expandedKeys);
typedef AppAccordionItemCallback = void Function(String key, bool expanded);
typedef AppAccordionValidationCallback = void Function(AppAccordionValidationError error);
typedef AppAccordionLoadingBuilder = Widget Function(BuildContext context, AppAccordionConfig config);
typedef AppAccordionErrorBuilder = Widget Function(BuildContext context, String error, AppAccordionConfig config);
typedef AppAccordionEmptyBuilder = Widget Function(BuildContext context, AppAccordionConfig config);

/// Error de validación del accordion
@freezed
class AppAccordionValidationError with _$AppAccordionValidationError {
  const factory AppAccordionValidationError({
    required AppAccordionErrorType type,
    required String message,
    List<AppAccordionItem>? items,
    List<String>? expandedKeys,
    String? itemKey,
  }) = _AppAccordionValidationError;
}

/// Tipos de error del accordion
enum AppAccordionErrorType {
  invalidConfig,
  itemNotFound,
  duplicateKeys,
  expansionError,
  validationError,
  accessibilityError,
}

/// Configuración por defecto para diferentes contextos
class AppAccordionConfigDefaults {
  /// Configuración por defecto estándar
  static const standard = AppAccordionConfig();

  /// Configuración para multiple selection
  static const multiple = AppAccordionConfig(
    variant: AppAccordionVariant.multiple,
    allowMultiple: true,
  );

  /// Configuración sin dividers
  static const noDividers = AppAccordionConfig(
    showDividers: false,
  );

  /// Configuración con elevación
  static const elevated = AppAccordionConfig(
    elevation: 2.0,
  );

  /// Configuración para debugging
  static const debug = AppAccordionConfig(
    behavior: AppAccordionBehavior(
      showDebugInfo: true,
    ),
  );
}

/// Configuraciones predefinidas por plataforma
class AppAccordionPlatformDefaults {
  /// Configuración optimizada para Android
  static const android = AppAccordionConfig(
    animations: AppAccordionAnimations(
      expansionDuration: Duration(milliseconds: 300),
      stateDuration: Duration(milliseconds: 250),
      expansionCurve: Curves.fastOutSlowIn,
      stateCurve: Curves.fastOutSlowIn,
    ),
    behavior: AppAccordionBehavior(
      enableHapticFeedback: true,
    ),
  );

  /// Configuración optimizada para iOS
  static const ios = AppAccordionConfig(
    animations: AppAccordionAnimations(
      expansionDuration: Duration(milliseconds: 250),
      stateDuration: Duration(milliseconds: 200),
      expansionCurve: Curves.easeInOut,
      stateCurve: Curves.easeInOut,
    ),
    behavior: AppAccordionBehavior(
      enableHapticFeedback: true,
    ),
  );

  /// Configuración optimizada para Web
  static const web = AppAccordionConfig(
    behavior: AppAccordionBehavior(
      enableHoverEffects: true,
      showFocusIndicator: true,
      enableHapticFeedback: false,
    ),
    animations: AppAccordionAnimations(
      expansionDuration: Duration(milliseconds: 200),
      stateDuration: Duration(milliseconds: 150),
      expansionCurve: Curves.easeOut,
      stateCurve: Curves.easeOut,
    ),
  );
}

/// Extensiones auxiliares

extension AppAccordionVariantExtensions on AppAccordionVariant {
  /// Indica si permite múltiples elementos expandidos
  bool get allowsMultiple => this == AppAccordionVariant.multiple;

  /// Indica si solo permite un elemento expandido
  bool get allowsSingle => this == AppAccordionVariant.single;
}

/// Validadores de configuración
class AppAccordionValidators {
  /// Valida si la lista de items es válida
  static bool isValidItems(List<AppAccordionItem> items) {
    if (items.isEmpty) return true;

    // Verificar que no hay claves duplicadas
    final keys = items.map((item) => item.key).toSet();
    if (keys.length != items.length) return false;

    // Verificar que todas las claves son válidas
    return items.every((item) => item.key.isNotEmpty);
  }

  /// Valida si las claves expandidas son válidas
  static bool isValidExpandedKeys(
    List<String> expandedKeys,
    List<AppAccordionItem> items,
  ) {
    if (expandedKeys.isEmpty) return true;

    final itemKeys = items.map((item) => item.key).toSet();
    return expandedKeys.every((key) => itemKeys.contains(key));
  }

  /// Valida si la configuración es coherente con la variante
  static bool isValidConfigForVariant(
    AppAccordionConfig config,
    List<String> expandedKeys,
  ) {
    if (config.variant == AppAccordionVariant.single) {
      return expandedKeys.length <= 1;
    }
    return true;
  }

  /// Valida si el spacing es válido
  static bool isValidSpacing(AppAccordionSpacing? spacing) {
    if (spacing == null) return true;

    return spacing.minHeaderHeight >= 0 &&
           spacing.minInteractiveSize >= 0 &&
           spacing.itemSpacing >= 0 &&
           spacing.dividerThickness >= 0 &&
           spacing.focusIndicatorSpacing >= 0;
  }

  /// Valida toda la configuración
  static bool isValidConfig(
    AppAccordionConfig config,
    List<AppAccordionItem> items,
    List<String> expandedKeys,
  ) {
    return isValidItems(items) &&
           isValidExpandedKeys(expandedKeys, items) &&
           isValidConfigForVariant(config, expandedKeys) &&
           isValidSpacing(config.spacing);
  }

  /// Valida un elemento individual
  static bool isValidItem(AppAccordionItem item) {
    return item.key.isNotEmpty;
  }
}

/// Extensiones para elementos de accordion
extension AppAccordionItemExtensions on AppAccordionItem {
  /// Indica si el elemento está habilitado
  bool get isEnabled => !disabled && !loading;

  /// Indica si el elemento puede expandirse
  bool get isExpandable => isEnabled;

  /// Indica si tiene subtítulo
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;

  /// Indica si tiene icono
  bool get hasIcon => icon != null;

  /// Indica si tiene trailing widget
  bool get hasTrailing => trailing != null;

  /// Indica si tiene metadata
  bool get hasMetadata => metadata != null && metadata!.isNotEmpty;
}

/// Extensiones para errores
extension AppAccordionErrorTypeExtensions on AppAccordionErrorType {
  /// Obtiene el mensaje por defecto para el tipo de error
  String get defaultMessage {
    switch (this) {
      case AppAccordionErrorType.invalidConfig:
        return 'Configuración inválida del accordion';
      case AppAccordionErrorType.itemNotFound:
        return 'Elemento no encontrado';
      case AppAccordionErrorType.duplicateKeys:
        return 'Claves duplicadas detectadas';
      case AppAccordionErrorType.expansionError:
        return 'Error al expandir/colapsar elemento';
      case AppAccordionErrorType.validationError:
        return 'Error de validación';
      case AppAccordionErrorType.accessibilityError:
        return 'Error de accesibilidad';
    }
  }

  /// Indica si es un error crítico
  bool get isCritical {
    switch (this) {
      case AppAccordionErrorType.invalidConfig:
      case AppAccordionErrorType.duplicateKeys:
        return true;
      default:
        return false;
    }
  }
}