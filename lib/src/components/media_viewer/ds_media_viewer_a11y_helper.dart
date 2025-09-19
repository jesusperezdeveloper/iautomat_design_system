import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'package:iautomat_design_system/src/components/media_viewer/ds_media_viewer_config.dart';

/// Helper para manejar accesibilidad y soporte RTL del DSMediaViewer
///
/// Proporciona utilidades para:
/// - Gestión completa de accesibilidad y semántica
/// - Soporte RTL/LTR automático
/// - Navegación por teclado optimizada
/// - Descripción de estados para lectores de pantalla
/// - Anuncios dinámicos de cambios
/// - Integración con services de accesibilidad del sistema
class DSMediaViewerA11yHelper {
  /// Construye el widget de semántica apropiado para el media viewer
  static Widget buildSemanticsWrapper({
    required Widget child,
    required List<DSMediaItem> items,
    required int currentIndex,
    required DSMediaViewerState state,
    required DSMediaViewerA11yConfig? a11yConfig,
    VoidCallback? onTap,
    bool isPlaying = false,
    double currentPosition = 0.0,
    double duration = 0.0,
  }) {
    if (!(a11yConfig?.enabled ?? true)) {
      return child;
    }

    final currentItem = items[currentIndex];
    final semanticsLabel = _buildSemanticLabel(
      items, currentIndex, state, a11yConfig, isPlaying, currentPosition, duration,
    );
    final semanticsHint = _buildSemanticHint(currentItem, a11yConfig, onTap);
    final semanticsDescription = _buildSemanticDescription(currentItem, a11yConfig);

    return Semantics(
      label: semanticsLabel,
      hint: semanticsHint,
      value: semanticsDescription,
      button: onTap != null,
      focusable: a11yConfig?.enableKeyboardNavigation ?? true,
      enabled: state.canInteract,
      readOnly: !currentItem.isPlayable,
      liveRegion: state == DSMediaViewerState.loading || isPlaying,
      slider: currentItem.isPlayable,
      increasedValue: currentItem.isPlayable ? _formatTime(currentPosition) : null,
      decreasedValue: currentItem.isPlayable ? _formatTime(duration) : null,
      child: child,
    );
  }

  /// Construye la etiqueta semántica completa
  static String _buildSemanticLabel(
    List<DSMediaItem> items,
    int currentIndex,
    DSMediaViewerState state,
    DSMediaViewerA11yConfig? a11yConfig,
    bool isPlaying,
    double currentPosition,
    double duration,
  ) {
    final customLabel = a11yConfig?.semanticsLabel;
    if (customLabel != null && customLabel.isNotEmpty) {
      return customLabel;
    }

    final currentItem = items[currentIndex];
    final parts = <String>[];

    // Tipo de contenido
    parts.add('Visualizador de ${currentItem.type.displayName.toLowerCase()}');

    // Posición en la colección
    if (items.length > 1) {
      parts.add('elemento ${currentIndex + 1} de ${items.length}');
    }

    // Título/caption si existe
    if (currentItem.caption != null && currentItem.caption!.isNotEmpty) {
      parts.add(currentItem.caption!);
    }

    // Estado de reproducción
    if (currentItem.isPlayable) {
      if (isPlaying) {
        parts.add('reproduciéndose');
        if (duration > 0) {
          parts.add('${_formatTime(currentPosition)} de ${_formatTime(duration)}');
        }
      } else {
        parts.add('pausado');
      }
    }

    // Estado del componente
    final stateDescription = _getStateDescription(state);
    if (stateDescription.isNotEmpty) {
      parts.add(stateDescription);
    }

    return parts.join(', ');
  }

  /// Construye la pista semántica para interacciones
  static String? _buildSemanticHint(
    DSMediaItem item,
    DSMediaViewerA11yConfig? a11yConfig,
    VoidCallback? onTap,
  ) {
    final customHint = a11yConfig?.semanticsHint;
    if (customHint != null && customHint.isNotEmpty) {
      return customHint;
    }

    final hints = <String>[];

    if (onTap != null) {
      hints.add('Toca para mostrar u ocultar controles');
    }

    if (item.isPlayable) {
      hints.add('Doble toque para reproducir o pausar');
      hints.add('Usa espacio para controlar reproducción');
    }

    if (item.isImage) {
      hints.add('Doble toque para hacer zoom');
    }

    hints.add('Usa flechas para navegar');

    return hints.isNotEmpty ? hints.join('. ') : null;
  }

  /// Construye la descripción semántica detallada
  static String? _buildSemanticDescription(
    DSMediaItem item,
    DSMediaViewerA11yConfig? a11yConfig,
  ) {
    final customDescription = a11yConfig?.semanticsDescription;
    if (customDescription != null && customDescription.isNotEmpty) {
      return customDescription;
    }

    final parts = <String>[];

    // Información del archivo
    if (item.fileExtension.isNotEmpty) {
      parts.add('Formato ${item.fileExtension.toUpperCase()}');
    }

    // Duración para contenido reproducible
    if (item.duration != null) {
      parts.add('Duración ${item.formattedDuration}');
    }

    // Dimensiones para imágenes
    if (item.dimensions != null) {
      parts.add('${item.dimensions!.width.round()} por ${item.dimensions!.height.round()} píxeles');
    }

    return parts.isNotEmpty ? parts.join(', ') : null;
  }

  /// Obtiene la descripción del estado actual
  static String _getStateDescription(DSMediaViewerState state) {
    switch (state) {
      case DSMediaViewerState.loading:
        return 'cargando';
      case DSMediaViewerState.skeleton:
        return 'preparando contenido';
      case DSMediaViewerState.disabled:
        return 'no disponible';
      case DSMediaViewerState.selected:
        return 'seleccionado';
      case DSMediaViewerState.focus:
        return 'enfocado';
      case DSMediaViewerState.hover:
      case DSMediaViewerState.pressed:
      case DSMediaViewerState.defaultState:
        return '';
    }
  }

  /// Formatea tiempo en formato accesible
  static String _formatTime(double seconds) {
    if (seconds < 60) {
      return '${seconds.round()} segundos';
    } else if (seconds < 3600) {
      final minutes = (seconds / 60).floor();
      final remainingSeconds = (seconds % 60).round();
      return '$minutes minutos y $remainingSeconds segundos';
    } else {
      final hours = (seconds / 3600).floor();
      final minutes = ((seconds % 3600) / 60).floor();
      return '$hours horas y $minutes minutos';
    }
  }

  /// Maneja la navegación por teclado
  static KeyEventResult handleKeyEvent(
    KeyEvent event,
    List<DSMediaItem> items,
    int currentIndex,
    DSMediaViewerA11yConfig? a11yConfig, {
    required VoidCallback? onPrevious,
    required VoidCallback? onNext,
    required VoidCallback? onPlayPause,
    required VoidCallback? onToggleControls,
    required VoidCallback? onFullscreen,
    required VoidCallback? onClose,
    required ValueChanged<double>? onVolumeChange,
    required ValueChanged<double>? onSeek,
    bool isPlaying = false,
    double volume = 1.0,
    double currentPosition = 0.0,
    double duration = 0.0,
  }) {
    if (!(a11yConfig?.enableKeyboardNavigation ?? true)) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      final currentItem = items[currentIndex];

      switch (event.logicalKey) {
        // Navegación básica
        case LogicalKeyboardKey.arrowLeft:
        case LogicalKeyboardKey.keyH:
          onPrevious?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowRight:
        case LogicalKeyboardKey.keyL:
          onNext?.call();
          return KeyEventResult.handled;

        // Control de reproducción
        case LogicalKeyboardKey.space:
        case LogicalKeyboardKey.keyK:
          if (currentItem.isPlayable) {
            onPlayPause?.call();
            return KeyEventResult.handled;
          }
          break;

        // Controles de tiempo
        case LogicalKeyboardKey.arrowUp:
          if (currentItem.isPlayable && onSeek != null) {
            final newPosition = (currentPosition + 10).clamp(0.0, duration);
            onSeek(newPosition);
            return KeyEventResult.handled;
          }
          break;

        case LogicalKeyboardKey.arrowDown:
          if (currentItem.isPlayable && onSeek != null) {
            final newPosition = (currentPosition - 10).clamp(0.0, duration);
            onSeek(newPosition);
            return KeyEventResult.handled;
          }
          break;

        case LogicalKeyboardKey.keyJ:
          if (currentItem.isPlayable && onSeek != null) {
            final newPosition = (currentPosition - 10).clamp(0.0, duration);
            onSeek(newPosition);
            return KeyEventResult.handled;
          }
          break;

        // Control de volumen
        case LogicalKeyboardKey.keyM:
          if (currentItem.hasAudio && onVolumeChange != null) {
            onVolumeChange(volume > 0 ? 0.0 : 1.0);
            return KeyEventResult.handled;
          }
          break;

        case LogicalKeyboardKey.equal:
        case LogicalKeyboardKey.add:
          if (currentItem.hasAudio && onVolumeChange != null) {
            final newVolume = (volume + 0.1).clamp(0.0, 1.0);
            onVolumeChange(newVolume);
            return KeyEventResult.handled;
          }
          break;

        case LogicalKeyboardKey.minus:
          if (currentItem.hasAudio && onVolumeChange != null) {
            final newVolume = (volume - 0.1).clamp(0.0, 1.0);
            onVolumeChange(newVolume);
            return KeyEventResult.handled;
          }
          break;

        // Pantalla completa
        case LogicalKeyboardKey.keyF:
        case LogicalKeyboardKey.f11:
          onFullscreen?.call();
          return KeyEventResult.handled;

        // Mostrar/ocultar controles
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.keyC:
          onToggleControls?.call();
          return KeyEventResult.handled;

        // Cerrar
        case LogicalKeyboardKey.escape:
        case LogicalKeyboardKey.keyQ:
          onClose?.call();
          return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  /// Construye el wrapper de navegación por teclado
  static Widget buildKeyboardNavigationWrapper({
    required Widget child,
    required FocusNode focusNode,
    required List<DSMediaItem> items,
    required int currentIndex,
    required DSMediaViewerA11yConfig? a11yConfig,
    VoidCallback? onPrevious,
    VoidCallback? onNext,
    VoidCallback? onPlayPause,
    VoidCallback? onToggleControls,
    VoidCallback? onFullscreen,
    VoidCallback? onClose,
    ValueChanged<double>? onVolumeChange,
    ValueChanged<double>? onSeek,
    bool isPlaying = false,
    double volume = 1.0,
    double currentPosition = 0.0,
    double duration = 0.0,
  }) {
    if (!(a11yConfig?.enableKeyboardNavigation ?? true)) {
      return child;
    }

    return Focus(
      focusNode: focusNode,
      onKeyEvent: (node, event) => handleKeyEvent(
        event,
        items,
        currentIndex,
        a11yConfig,
        onPrevious: onPrevious,
        onNext: onNext,
        onPlayPause: onPlayPause,
        onToggleControls: onToggleControls,
        onFullscreen: onFullscreen,
        onClose: onClose,
        onVolumeChange: onVolumeChange,
        onSeek: onSeek,
        isPlaying: isPlaying,
        volume: volume,
        currentPosition: currentPosition,
        duration: duration,
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

  /// Construye decoración con soporte RTL
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

  /// Construye iconos con soporte RTL
  static Widget buildRTLAwareIcon(
    IconData icon,
    TextDirection textDirection, {
    double? size,
    Color? color,
  }) {
    // Algunos iconos necesitan ser invertidos en RTL
    final rtlIcons = {
      Icons.arrow_back: Icons.arrow_forward,
      Icons.arrow_forward: Icons.arrow_back,
      Icons.arrow_back_ios: Icons.arrow_forward_ios,
      Icons.arrow_forward_ios: Icons.arrow_back_ios,
      Icons.chevron_left: Icons.chevron_right,
      Icons.chevron_right: Icons.chevron_left,
      Icons.skip_previous: Icons.skip_next,
      Icons.skip_next: Icons.skip_previous,
    };

    IconData resolvedIcon = icon;
    if (textDirection == TextDirection.rtl && rtlIcons.containsKey(icon)) {
      resolvedIcon = rtlIcons[icon]!;
    }

    return Icon(
      resolvedIcon,
      size: size,
      color: color,
    );
  }

  /// Anuncios para lectores de pantalla según cambios de estado
  static void announceStateChange(
    BuildContext context,
    DSMediaViewerState oldState,
    DSMediaViewerState newState,
    DSMediaItem currentItem,
    DSMediaViewerA11yConfig? a11yConfig,
  ) {
    if (!(a11yConfig?.enableStateAnnouncements ?? true)) return;
    if (oldState == newState) return;

    String? announcement;

    switch (newState) {
      case DSMediaViewerState.loading:
        announcement = 'Cargando ${currentItem.type.displayName.toLowerCase()}';
        break;
      case DSMediaViewerState.defaultState:
        if (oldState == DSMediaViewerState.loading) {
          announcement = '${currentItem.type.displayName} cargado';
        }
        break;
      case DSMediaViewerState.disabled:
        announcement = '${currentItem.type.displayName} no disponible';
        break;
      case DSMediaViewerState.selected:
        announcement = '${currentItem.type.displayName} seleccionado';
        break;
      default:
        break;
    }

    if (announcement != null) {
      SemanticsService.announce(announcement, resolveTextDirection(context));
    }
  }

  /// Anuncia cambios en la reproducción
  static void announcePlaybackChange(
    BuildContext context,
    bool isPlaying,
    DSMediaItem currentItem,
    DSMediaViewerA11yConfig? a11yConfig,
  ) {
    if (!(a11yConfig?.enableStateAnnouncements ?? true)) return;
    if (!currentItem.isPlayable) return;

    final announcement = isPlaying
        ? '${currentItem.type.displayName} reproduciéndose'
        : '${currentItem.type.displayName} pausado';

    SemanticsService.announce(announcement, resolveTextDirection(context));
  }

  /// Anuncia cambios de página/elemento
  static void announcePageChange(
    BuildContext context,
    int newIndex,
    List<DSMediaItem> items,
    DSMediaViewerA11yConfig? a11yConfig,
  ) {
    if (!(a11yConfig?.enableStateAnnouncements ?? true)) return;
    if (items.isEmpty) return;

    final currentItem = items[newIndex];
    final announcement = '${currentItem.type.displayName} ${newIndex + 1} de ${items.length}';

    if (currentItem.caption != null && currentItem.caption!.isNotEmpty) {
      SemanticsService.announce(
        '$announcement, ${currentItem.caption}',
        resolveTextDirection(context),
      );
    } else {
      SemanticsService.announce(announcement, resolveTextDirection(context));
    }
  }

  /// Verifica si las funciones de accesibilidad están habilitadas en el sistema
  static bool isAccessibilityEnabled(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.accessibleNavigation ||
           mediaQuery.boldText ||
           mediaQuery.highContrast;
  }

  /// Ajusta la configuración según las preferencias de accesibilidad
  static DSMediaViewerAnimation adjustAnimationForA11y(
    BuildContext context,
    DSMediaViewerAnimation? animation,
  ) {
    final mediaQuery = MediaQuery.of(context);

    // Reducir animaciones si el usuario prefiere menos movimiento
    if (mediaQuery.disableAnimations) {
      return DSMediaViewerAnimation(
        type: DSMediaViewerAnimationType.none,
        duration: 0,
        enableStateTransitions: false,
        enableHoverAnimation: false,
        enablePressAnimation: false,
        enableLoadingAnimation: false,
        enableControlsAnimation: false,
      );
    }

    // Animaciones más lentas para mejor accesibilidad
    if (isAccessibilityEnabled(context)) {
      return (animation ?? const DSMediaViewerAnimation()).copyWith(
        duration: (animation?.duration ?? 300) * 2,
        enableHoverAnimation: false, // Menos distracciones
        controlsFadeInDuration: (animation?.controlsFadeInDuration ?? 200) * 2,
        controlsFadeOutDuration: (animation?.controlsFadeOutDuration ?? 500) * 2,
      );
    }

    return animation ?? const DSMediaViewerAnimation();
  }

  /// Construye hints contextuales para el teclado
  static String buildKeyboardHints(DSMediaItem currentItem) {
    final hints = <String>[];

    hints.add('Flechas: navegar');

    if (currentItem.isPlayable) {
      hints.add('Espacio: reproducir/pausar');
      hints.add('↑↓: saltar 10s');
      hints.add('M: silenciar');
      hints.add('+/-: volumen');
    }

    if (currentItem.isImage) {
      hints.add('Doble clic: zoom');
    }

    hints.add('F: pantalla completa');
    hints.add('Esc: cerrar');

    return hints.join(' | ');
  }
}

/// Widget helper para anuncios de accesibilidad
class DSMediaViewerAccessibilityAnnouncer extends StatefulWidget {
  final Widget child;
  final String? announcement;
  final TextDirection textDirection;

  const DSMediaViewerAccessibilityAnnouncer({
    super.key,
    required this.child,
    this.announcement,
    this.textDirection = TextDirection.ltr,
  });

  @override
  State<DSMediaViewerAccessibilityAnnouncer> createState() =>
      _DSMediaViewerAccessibilityAnnouncerState();
}

class _DSMediaViewerAccessibilityAnnouncerState
    extends State<DSMediaViewerAccessibilityAnnouncer> {
  String? _lastAnnouncement;

  @override
  void didUpdateWidget(DSMediaViewerAccessibilityAnnouncer oldWidget) {
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