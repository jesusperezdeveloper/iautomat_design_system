import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'package:iautomat_design_system/src/components/image/app_image_config.dart';

/// Helper para manejar accesibilidad y soporte RTL del DSImage
///
/// Proporciona utilidades para:
/// - Gestión completa de accesibilidad y semántica
/// - Soporte RTL/LTR automático
/// - Navegación por teclado optimizada
/// - Descripción de estados para lectores de pantalla
/// - Integración con services de accesibilidad del sistema
class DSImageA11yHelper {
  /// Construye el widget de semántica apropiado para la imagen
  static Widget buildSemanticsWrapper({
    required Widget child,
    required String alt,
    required DSImageState state,
    required DSImageA11yConfig? a11yConfig,
    VoidCallback? onTap,
  }) {
    if (a11yConfig?.isDecorative == true) {
      return ExcludeSemantics(child: child);
    }

    final semanticsLabel = _buildSemanticLabel(alt, state, a11yConfig);
    final semanticsHint = _buildSemanticHint(state, a11yConfig, onTap);
    final semanticsDescription = _buildSemanticDescription(state, a11yConfig);

    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      value: semanticsDescription,
      image: true,
      button: onTap != null,
      focusable: a11yConfig?.enableKeyboardNavigation ?? true,
      enabled: state.canInteract,
      readOnly: onTap == null,
      liveRegion: state == DSImageState.loading,
      child: child,
    );
  }

  /// Construye la etiqueta semántica completa
  static String _buildSemanticLabel(
    String alt,
    DSImageState state,
    DSImageA11yConfig? a11yConfig,
  ) {
    final baseLabel = a11yConfig?.semanticsLabel ?? alt;

    if (baseLabel.isEmpty) {
      return 'Imagen';
    }

    // Agregar información de estado si es relevante
    final stateDescription = _getStateDescription(state);
    if (stateDescription.isNotEmpty) {
      return '$baseLabel, $stateDescription';
    }

    return baseLabel;
  }

  /// Construye la pista semántica para interacciones
  static String? _buildSemanticHint(
    DSImageState state,
    DSImageA11yConfig? a11yConfig,
    VoidCallback? onTap,
  ) {
    final customHint = a11yConfig?.semanticsHint;
    if (customHint != null && customHint.isNotEmpty) {
      return customHint;
    }

    if (!state.canInteract) {
      return null;
    }

    if (onTap != null) {
      return 'Toca dos veces para interactuar';
    }

    return null;
  }

  /// Construye la descripción semántica detallada
  static String? _buildSemanticDescription(
    DSImageState state,
    DSImageA11yConfig? a11yConfig,
  ) {
    final customDescription = a11yConfig?.semanticsDescription;
    if (customDescription != null && customDescription.isNotEmpty) {
      return customDescription;
    }

    return _getDetailedStateDescription(state);
  }

  /// Obtiene la descripción del estado actual
  static String _getStateDescription(DSImageState state) {
    switch (state) {
      case DSImageState.loading:
        return 'cargando';
      case DSImageState.skeleton:
        return 'preparando imagen';
      case DSImageState.disabled:
        return 'no disponible';
      case DSImageState.selected:
        return 'seleccionada';
      case DSImageState.focus:
        return 'enfocada';
      case DSImageState.hover:
      case DSImageState.pressed:
      case DSImageState.defaultState:
        return '';
    }
  }

  /// Obtiene una descripción detallada del estado
  static String? _getDetailedStateDescription(DSImageState state) {
    switch (state) {
      case DSImageState.loading:
        return 'La imagen se está cargando, por favor espera';
      case DSImageState.skeleton:
        return 'Preparando la imagen para mostrar';
      case DSImageState.disabled:
        return 'Esta imagen no está disponible actualmente';
      default:
        return null;
    }
  }

  /// Maneja la navegación por teclado
  static KeyEventResult handleKeyEvent(
    FocusNode focusNode,
    KeyEvent event,
    VoidCallback? onTap,
    DSImageA11yConfig? a11yConfig,
  ) {
    if (!(a11yConfig?.enableKeyboardNavigation ?? true)) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent && onTap != null) {
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.space) {
        onTap();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  /// Construye el wrapper de navegación por teclado
  static Widget buildKeyboardNavigationWrapper({
    required Widget child,
    required FocusNode focusNode,
    required DSImageA11yConfig? a11yConfig,
    VoidCallback? onTap,
  }) {
    if (!(a11yConfig?.enableKeyboardNavigation ?? true)) {
      return child;
    }

    return Focus(
      focusNode: focusNode,
      onKeyEvent: (node, event) => handleKeyEvent(
        node,
        event,
        onTap,
        a11yConfig,
      ),
      child: child,
    );
  }

  /// Resuelve la dirección del layout para soporte RTL
  static TextDirection resolveTextDirection(BuildContext context) {
    return Directionality.of(context);
  }

  /// Aplica transformaciones RTL a las coordenadas si es necesario
  static EdgeInsetsGeometry resolveEdgeInsets(
    EdgeInsetsGeometry insets,
    TextDirection textDirection,
  ) {
    return insets.resolve(textDirection);
  }

  /// Aplica transformaciones RTL a la alineación
  static AlignmentGeometry resolveAlignment(
    AlignmentGeometry alignment,
    TextDirection textDirection,
  ) {
    return alignment.resolve(textDirection);
  }

  /// Construye decoración con soporte RTL para bordes direccionales
  static BoxDecoration buildRTLAwareDecoration({
    Color? color,
    Color? borderColor,
    double borderWidth = 0.0,
    double borderRadius = 0.0,
    TextDirection? textDirection,
    bool hasDirectionalBorder = false,
  }) {
    BorderSide? borderSide;
    if (borderWidth > 0 && borderColor != null) {
      borderSide = BorderSide(color: borderColor, width: borderWidth);
    }

    Border? border;
    if (hasDirectionalBorder && borderSide != null) {
      // Crear borde direccional según RTL/LTR
      if (textDirection == TextDirection.rtl) {
        border = Border(
          right: borderSide,
          top: borderSide,
          bottom: borderSide,
        );
      } else {
        border = Border(
          left: borderSide,
          top: borderSide,
          bottom: borderSide,
        );
      }
    } else if (borderSide != null) {
      border = Border.all(color: borderColor!, width: borderWidth);
    }

    return BoxDecoration(
      color: color,
      border: border,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// Valida y mejora el texto alternativo proporcionado
  static String validateAndImproveAltText(String alt, String src) {
    if (alt.trim().isEmpty) {
      // Intentar extraer información útil del src
      final uri = Uri.tryParse(src);
      if (uri != null) {
        final filename = uri.pathSegments.isNotEmpty
            ? uri.pathSegments.last
            : 'imagen';

        // Limpiar extensión y formato del nombre
        final nameWithoutExt = filename.split('.').first;
        final cleanName = nameWithoutExt
            .replaceAll(RegExp(r'[_-]'), ' ')
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();

        if (cleanName.isNotEmpty) {
          return 'Imagen: $cleanName';
        }
      }

      return 'Imagen sin descripción';
    }

    // Verificar que el alt text sea descriptivo
    if (alt.length < 3) {
      return 'Imagen: $alt';
    }

    // Verificar que no sea solo el nombre del archivo
    if (alt.contains('.') && (alt.contains('jpg') || alt.contains('png') || alt.contains('gif'))) {
      final cleanAlt = alt.split('.').first.replaceAll(RegExp(r'[_-]'), ' ');
      return 'Imagen: $cleanAlt';
    }

    return alt;
  }

  /// Construye anuncios para lectores de pantalla según el estado
  static void announceStateChange(
    BuildContext context,
    DSImageState oldState,
    DSImageState newState,
  ) {
    if (oldState == newState) return;

    String? announcement;

    switch (newState) {
      case DSImageState.loading:
        announcement = 'Cargando imagen';
        break;
      case DSImageState.defaultState:
        if (oldState == DSImageState.loading || oldState == DSImageState.skeleton) {
          announcement = 'Imagen cargada';
        }
        break;
      case DSImageState.disabled:
        announcement = 'Imagen no disponible';
        break;
      case DSImageState.selected:
        announcement = 'Imagen seleccionada';
        break;
      default:
        break;
    }

    if (announcement != null) {
      SemanticsService.announce(announcement, TextDirection.ltr);
    }
  }

  /// Verifica si las funciones de accesibilidad están habilitadas en el sistema
  static bool isAccessibilityEnabled(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.accessibleNavigation ||
           mediaQuery.boldText ||
           mediaQuery.highContrast;
  }

  /// Ajusta el comportamiento según las preferencias de accesibilidad
  static DSImageAnimation adjustAnimationForA11y(
    BuildContext context,
    DSImageAnimation? animation,
  ) {
    final mediaQuery = MediaQuery.of(context);

    // Reducir animaciones si el usuario prefiere menos movimiento
    if (mediaQuery.disableAnimations) {
      return DSImageAnimation(
        type: DSImageAnimationType.none,
        duration: 0,
        enableStateTransitions: false,
        enableHoverAnimation: false,
        enablePressAnimation: false,
        enableLoadingAnimation: false,
        enableFadeIn: false,
      );
    }

    // Animaciones más lentas para mejor accesibilidad
    if (isAccessibilityEnabled(context)) {
      return (animation ?? const DSImageAnimation()).copyWith(
        duration: (animation?.duration ?? 300) * 2,
        enableHoverAnimation: false, // Menos distracciones
      );
    }

    return animation ?? const DSImageAnimation();
  }

  /// Construye hints contextuales para interacciones
  static String buildInteractionHint(
    DSImageState state,
    bool hasOnTap,
    bool hasOnLongPress,
  ) {
    if (!state.canInteract) {
      return '';
    }

    final actions = <String>[];

    if (hasOnTap) {
      actions.add('tocar');
    }

    if (hasOnLongPress) {
      actions.add('mantener presionado');
    }

    if (actions.isEmpty) {
      return '';
    }

    if (actions.length == 1) {
      return 'Doble toque para ${actions.first}';
    }

    return 'Doble toque para ${actions.join(' o ')}';
  }
}

/// Extension para facilitar el trabajo con configuración de accesibilidad
extension DSImageA11yConfigExtension on DSImageA11yConfig {
  /// Combina esta configuración con valores por defecto
  DSImageA11yConfig withDefaults() {
    return DSImageA11yConfig(
      enabled: enabled,
      semanticsLabel: semanticsLabel,
      semanticsDescription: semanticsDescription,
      semanticsHint: semanticsHint,
      isDecorative: isDecorative,
      enableKeyboardNavigation: enableKeyboardNavigation,
      expandedAltText: expandedAltText,
      semanticsRole: semanticsRole,
    );
  }

  /// Verifica si la configuración tiene valores personalizados
  bool get hasCustomSemantics {
    return semanticsLabel != null ||
           semanticsDescription != null ||
           semanticsHint != null ||
           expandedAltText != null;
  }
}

/// Widget helper para anuncios de accesibilidad
class AccessibilityAnnouncer extends StatefulWidget {
  final Widget child;
  final String? announcement;
  final TextDirection textDirection;

  const AccessibilityAnnouncer({
    super.key,
    required this.child,
    this.announcement,
    this.textDirection = TextDirection.ltr,
  });

  @override
  State<AccessibilityAnnouncer> createState() => _AccessibilityAnnouncerState();
}

class _AccessibilityAnnouncerState extends State<AccessibilityAnnouncer> {
  String? _lastAnnouncement;

  @override
  void didUpdateWidget(AccessibilityAnnouncer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.announcement != null &&
        widget.announcement != _lastAnnouncement) {
      _lastAnnouncement = widget.announcement;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          SemanticsService.announce(
            widget.announcement!,
            widget.textDirection,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}