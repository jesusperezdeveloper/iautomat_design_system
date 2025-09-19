import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_divider_config.freezed.dart';

/// Configuración principal para DSDivider
///
/// Define el comportamiento, apariencia y funcionalidad del componente
/// divider, incluyendo variantes inset y full, estados, colores,
/// espaciado y accesibilidad.
@freezed
class DSDividerConfig with _$DSDividerConfig {
  const factory DSDividerConfig({
    /// Variante del divider
    @Default(DSDividerVariant.full) DSDividerVariant variant,

    /// Estado actual del componente
    @Default(DSDividerState.defaultState) DSDividerState state,

    /// Grosor del divider (design token)
    double? thickness,

    /// Color del divider (design token)
    Color? color,

    /// Configuración de colores (solo design tokens)
    DSDividerColors? colors,

    /// Configuración de espaciado (solo design tokens)
    DSDividerSpacing? spacing,

    /// Configuración de animaciones
    DSDividerAnimations? animations,

    /// Configuración de comportamiento
    DSDividerBehavior? behavior,

    /// Configuración de accesibilidad
    DSDividerAccessibilityConfig? accessibility,

    /// Orientación del divider
    @Default(DSDividerOrientation.horizontal)
    DSDividerOrientation orientation,

    /// Si el divider es interactivo (clickeable)
    @Default(false) bool interactive,

    /// Altura del divider cuando es horizontal
    double? height,

    /// Ancho del divider cuando es vertical
    double? width,

    /// Indentación desde el borde izquierdo (para variant inset)
    double? indent,

    /// Indentación desde el borde derecho (para variant inset)
    double? endIndent,
  }) = _DSDividerConfig;
}

/// Variantes disponibles para el divider
enum DSDividerVariant {
  /// Divider completo que se extiende por todo el ancho/alto
  full,

  /// Divider con indentación en los bordes
  inset,
}

/// Estados disponibles del componente
enum DSDividerState {
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

/// Orientación del divider
enum DSDividerOrientation {
  /// Divider horizontal
  horizontal,

  /// Divider vertical
  vertical,
}

/// Extensión para obtener propiedades de los estados
extension DSDividerStateExtension on DSDividerState {
  /// Obtiene el nombre del estado para mostrar
  String get displayName {
    switch (this) {
      case DSDividerState.defaultState:
        return 'Default';
      case DSDividerState.hover:
        return 'Hover';
      case DSDividerState.pressed:
        return 'Pressed';
      case DSDividerState.focus:
        return 'Focus';
      case DSDividerState.selected:
        return 'Selected';
      case DSDividerState.disabled:
        return 'Disabled';
      case DSDividerState.loading:
        return 'Loading';
      case DSDividerState.skeleton:
        return 'Skeleton';
    }
  }

  /// Indica si el estado permite interacciones
  bool get isInteractive {
    switch (this) {
      case DSDividerState.disabled:
      case DSDividerState.loading:
      case DSDividerState.skeleton:
        return false;
      default:
        return true;
    }
  }

  /// Indica si el estado muestra loading
  bool get isLoading {
    return this == DSDividerState.loading || this == DSDividerState.skeleton;
  }
}

/// Configuración de colores (solo design tokens)
@freezed
class DSDividerColors with _$DSDividerColors {
  const factory DSDividerColors({
    /// Color por defecto del divider
    Color? defaultColor,

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
  }) = _AppDividerColors;
}

/// Configuración de espaciado (solo design tokens)
@freezed
class DSDividerSpacing with _$DSDividerSpacing {
  const factory DSDividerSpacing({
    /// Indentación por defecto para variant inset
    @Default(16.0) double defaultIndent,

    /// Indentación al final para variant inset
    @Default(16.0) double defaultEndIndent,

    /// Grosor por defecto del divider
    @Default(1.0) double defaultThickness,

    /// Altura por defecto para dividers horizontales
    @Default(1.0) double defaultHeight,

    /// Ancho por defecto para dividers verticales
    @Default(1.0) double defaultWidth,

    /// Espaciado mínimo interactivo (para touch targets)
    @Default(44.0) double minInteractiveSize,

    /// Padding para dividers interactivos
    @Default(EdgeInsets.all(8.0)) EdgeInsets interactivePadding,
  }) = _AppDividerSpacing;
}

/// Configuración de animaciones
@freezed
class DSDividerAnimations with _$DSDividerAnimations {
  const factory DSDividerAnimations({
    /// Duración de animaciones de estado
    @Default(Duration(milliseconds: 200)) Duration stateDuration,

    /// Duración de animaciones de skeleton
    @Default(Duration(milliseconds: 1200)) Duration skeletonDuration,

    /// Curva de animación de estado
    @Default(Curves.easeInOut) Curve stateCurve,

    /// Curva de animación de skeleton
    @Default(Curves.easeInOut) Curve skeletonCurve,

    /// Si las animaciones están habilitadas
    @Default(true) bool enabled,

    /// Si debe respetar la configuración de reduced motion
    @Default(true) bool respectReducedMotion,
  }) = _AppDividerAnimations;
}

/// Configuración de comportamiento
@freezed
class DSDividerBehavior with _$DSDividerBehavior {
  const factory DSDividerBehavior({
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
  }) = _AppDividerBehavior;
}

/// Configuración de accesibilidad
@freezed
class DSDividerAccessibilityConfig with _$DSDividerAccessibilityConfig {
  const factory DSDividerAccessibilityConfig({
    /// Si la accesibilidad está habilitada
    @Default(true) bool enabled,

    /// Rol semántico del divider
    @Default('separator') String semanticRole,

    /// Label para screen readers
    String? semanticLabel,

    /// Descripción para screen readers
    String? semanticDescription,

    /// Si debe ser enfocable por teclado (para dividers interactivos)
    @Default(false) bool focusable,

    /// Si debe excluirse de la navegación semántica
    @Default(false) bool excludeSemantics,

    /// Label para estado de loading
    @Default('Loading') String loadingLabel,

    /// Label para estado disabled
    @Default('Disabled') String disabledLabel,
  }) = _DSDividerAccessibilityConfig;
}

/// Typedefs para callbacks
typedef DSDividerCallback = void Function();
typedef DSDividerStateCallback = void Function(DSDividerState state);

/// Configuración por defecto para diferentes contextos
class DSDividerConfigDefaults {
  /// Configuración por defecto estándar
  static const standard = DSDividerConfig();

  /// Configuración para divider inset
  static const inset = DSDividerConfig(variant: DSDividerVariant.inset);

  /// Configuración para divider vertical
  static const vertical = DSDividerConfig(
    orientation: DSDividerOrientation.vertical,
  );

  /// Configuración para divider interactivo
  static const interactive = DSDividerConfig(
    interactive: true,
    behavior: DSDividerBehavior(
      enableHoverEffects: true,
      showFocusIndicator: true,
    ),
    accessibility: DSDividerAccessibilityConfig(focusable: true),
  );

  /// Configuración para debugging
  static const debug = DSDividerConfig(
    behavior: DSDividerBehavior(showDebugInfo: true),
  );
}

/// Configuraciones predefinidas por plataforma
class DSDividerPlatformDefaults {
  /// Configuración optimizada para Android
  static const android = DSDividerConfig(
    animations: DSDividerAnimations(
      stateDuration: Duration(milliseconds: 300),
      stateCurve: Curves.fastOutSlowIn,
    ),
  );

  /// Configuración optimizada para iOS
  static const ios = DSDividerConfig(
    animations: DSDividerAnimations(
      stateDuration: Duration(milliseconds: 200),
      stateCurve: Curves.easeInOut,
    ),
  );

  /// Configuración optimizada para Web
  static const web = DSDividerConfig(
    behavior: DSDividerBehavior(
      enableHoverEffects: true,
      showFocusIndicator: true,
    ),
    animations: DSDividerAnimations(
      stateDuration: Duration(milliseconds: 150),
      stateCurve: Curves.easeOut,
    ),
  );
}

/// Extensiones auxiliares

extension DSDividerVariantExtensions on DSDividerVariant {
  /// Indica si es un divider inset
  bool get isInset => this == DSDividerVariant.inset;

  /// Indica si es un divider full
  bool get isFull => this == DSDividerVariant.full;
}

extension DSDividerOrientationExtensions on DSDividerOrientation {
  /// Indica si es horizontal
  bool get isHorizontal => this == DSDividerOrientation.horizontal;

  /// Indica si es vertical
  bool get isVertical => this == DSDividerOrientation.vertical;

  /// Obtiene el axis correspondiente
  Axis get axis => isHorizontal ? Axis.horizontal : Axis.vertical;
}

/// Validadores de configuración
class DSDividerValidators {
  /// Valida si el grosor está en un rango válido
  static bool isValidThickness(double? thickness) {
    if (thickness == null) return true;
    return thickness >= 0.0 && thickness <= 10.0;
  }

  /// Valida si la indentación es válida
  static bool isValidIndent(double? indent) {
    if (indent == null) return true;
    return indent >= 0.0;
  }

  /// Valida si las dimensiones son coherentes
  static bool isValidDimensions({
    double? height,
    double? width,
    DSDividerOrientation orientation = DSDividerOrientation.horizontal,
  }) {
    if (orientation.isHorizontal && height != null && height <= 0) return false;
    if (orientation.isVertical && width != null && width <= 0) return false;
    return true;
  }

  /// Valida toda la configuración
  static bool isValidConfig(DSDividerConfig config) {
    return isValidThickness(config.thickness) &&
        isValidIndent(config.indent) &&
        isValidIndent(config.endIndent) &&
        isValidDimensions(
          height: config.height,
          width: config.width,
          orientation: config.orientation,
        );
  }
}
