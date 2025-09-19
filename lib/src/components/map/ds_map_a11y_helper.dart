import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';

import 'package:iautomat_design_system/src/components/map/ds_map_config.dart';

/// Helper para gestionar accesibilidad, RTL y navegación por teclado
/// en el DSMap
///
/// Proporciona:
/// - Soporte completo para lectores de pantalla
/// - Navegación por teclado intuitiva
/// - Soporte RTL automático
/// - Anuncios de estado para accesibilidad
/// - Semántica contextual para mapas
/// - Navegación espacial por el mapa
class DSMapA11yHelper {
  /// Configuración de accesibilidad
  final DSMapA11yConfig? config;

  const DSMapA11yHelper(this.config);

  /// Construye wrapper de semántica para el mapa
  Widget buildSemanticsWrapper({
    required BuildContext context,
    required DSMapState state,
    required Widget child,
  }) {
    if (!(config?.enabled ?? true)) {
      return child;
    }

    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final effectiveConfig = config ?? const DSMapA11yConfig();

    return Semantics(
      label: effectiveConfig.semanticsLabel ?? _getDefaultLabel(state),
      hint: effectiveConfig.semanticsHint ?? _getDefaultHint(state),
      value: effectiveConfig.semanticsDescription ?? _getDefaultDescription(state),
      enabled: state.canInteract,
      focusable: state.canInteract,
      image: true,
      liveRegion: true,
      onTap: state.canInteract ? () {} : null,
      onIncrease: state.canInteract ? () {} : null, // Zoom in
      onDecrease: state.canInteract ? () {} : null, // Zoom out
      onScrollUp: state.canInteract ? () {} : null, // Pan up
      onScrollDown: state.canInteract ? () {} : null, // Pan down
      onScrollLeft: state.canInteract ? () {} : null, // Pan left
      onScrollRight: state.canInteract ? () {} : null, // Pan right
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: ExcludeSemantics(
        excluding: false,
        child: child,
      ),
    );
  }

  /// Maneja eventos de teclado para navegación por el mapa
  KeyEventResult handleKeyEvent(
    KeyEvent event, {
    VoidCallback? onActivate,
    VoidCallback? onZoomIn,
    VoidCallback? onZoomOut,
    Function(String direction)? onMove,
  }) {
    if (!_isKeyboardNavigationEnabled()) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        // Activación
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.space:
          onActivate?.call();
          return KeyEventResult.handled;

        // Zoom
        case LogicalKeyboardKey.equal:
        case LogicalKeyboardKey.add:
        case LogicalKeyboardKey.numpadAdd:
          onZoomIn?.call();
          return KeyEventResult.handled;

        case LogicalKeyboardKey.minus:
        case LogicalKeyboardKey.numpadSubtract:
          onZoomOut?.call();
          return KeyEventResult.handled;

        // Navegación
        case LogicalKeyboardKey.arrowUp:
        case LogicalKeyboardKey.keyW:
          onMove?.call('up');
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowDown:
        case LogicalKeyboardKey.keyS:
          onMove?.call('down');
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowLeft:
        case LogicalKeyboardKey.keyA:
          onMove?.call('left');
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowRight:
        case LogicalKeyboardKey.keyD:
          onMove?.call('right');
          return KeyEventResult.handled;

        // Cancelar/salir
        case LogicalKeyboardKey.escape:
          return KeyEventResult.handled;

        default:
          return KeyEventResult.ignored;
      }
    }

    return KeyEventResult.ignored;
  }

  /// Anuncia cambios de estado para accesibilidad
  void announceStateChange(DSMapState state) {
    if (!_shouldAnnounceStateChanges()) return;

    final announcement = _getStateAnnouncement(state);
    if (announcement.isNotEmpty) {
      SemanticsService.announce(
        announcement,
        TextDirection.ltr,
      );
    }
  }

  /// Anuncia interacción con marcador
  void announceMarkerTap(DSMapMarker marker) {
    if (!_shouldAnnounceStateChanges()) return;

    final effectiveConfig = config ?? const DSMapA11yConfig();
    final title = marker.title?.isNotEmpty == true ? marker.title! : 'Marcador';
    final announcement = '${effectiveConfig.markerLabel}: $title';

    SemanticsService.announce(
      announcement,
      TextDirection.ltr,
    );
  }

  /// Anuncia interacción con forma
  void announceShapeTap(DSMapShape shape) {
    if (!_shouldAnnounceStateChanges()) return;

    final effectiveConfig = config ?? const DSMapA11yConfig();
    final title = shape.title?.isNotEmpty == true ? shape.title! : shape.type.displayName;
    final announcement = '${effectiveConfig.shapeLabel}: $title';

    SemanticsService.announce(
      announcement,
      TextDirection.ltr,
    );
  }

  /// Anuncia cambio de posición del mapa
  void announceCameraMove({
    required DSLatLng center,
    required double zoom,
  }) {
    if (!_shouldAnnounceStateChanges()) return;

    final announcement = 'Mapa centrado en ${center.displayString}, zoom ${zoom.toStringAsFixed(1)}';

    SemanticsService.announce(
      announcement,
      TextDirection.ltr,
    );
  }

  /// Anuncia carga de marcadores
  void announceMarkersLoaded(int count) {
    if (!_shouldAnnounceStateChanges()) return;

    final announcement = count == 1
        ? 'Un marcador cargado en el mapa'
        : '$count marcadores cargados en el mapa';

    SemanticsService.announce(
      announcement,
      TextDirection.ltr,
    );
  }

  /// Construye widget con soporte RTL para el mapa
  Widget buildRtlAware({
    required BuildContext context,
    required Widget child,
  }) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    if (!isRtl) {
      return child;
    }

    // Para mapas, normalmente no necesitamos transformar el contenido
    // ya que las coordenadas geográficas son universales
    // Sin embargo, podemos ajustar elementos de UI como controles
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child,
    );
  }

  /// Obtiene label por defecto según el estado
  String _getDefaultLabel(DSMapState state) {
    final effectiveConfig = config ?? const DSMapA11yConfig();

    switch (state) {
      case DSMapState.defaultState:
        return effectiveConfig.mapLabel;
      case DSMapState.hover:
        return '${effectiveConfig.mapLabel}, resaltado';
      case DSMapState.pressed:
        return '${effectiveConfig.mapLabel}, presionado';
      case DSMapState.focus:
        return '${effectiveConfig.mapLabel}, enfocado';
      case DSMapState.selected:
        return '${effectiveConfig.mapLabel}, seleccionado';
      case DSMapState.disabled:
        return '${effectiveConfig.mapLabel}, deshabilitado';
      case DSMapState.loading:
        return '${effectiveConfig.mapLabel}, cargando';
      case DSMapState.skeleton:
        return 'Cargando mapa';
    }
  }

  /// Obtiene hint por defecto según el estado
  String _getDefaultHint(DSMapState state) {
    switch (state) {
      case DSMapState.defaultState:
      case DSMapState.hover:
      case DSMapState.focus:
        return 'Toca para interactuar, usa + y - para zoom, flechas para navegar';
      case DSMapState.pressed:
        return 'Procesando interacción';
      case DSMapState.selected:
        return 'Mapa seleccionado';
      case DSMapState.disabled:
        return 'Mapa no disponible';
      case DSMapState.loading:
        return 'Cargando contenido del mapa';
      case DSMapState.skeleton:
        return 'Preparando vista del mapa';
    }
  }

  /// Obtiene descripción por defecto según el estado
  String _getDefaultDescription(DSMapState state) {
    switch (state) {
      case DSMapState.defaultState:
        return 'Mapa interactivo con marcadores y navegación';
      case DSMapState.hover:
        return 'Mapa resaltado, listo para interactuar';
      case DSMapState.pressed:
        return 'Mapa presionado, procesando interacción';
      case DSMapState.focus:
        return 'Mapa enfocado, navegable con teclado';
      case DSMapState.selected:
        return 'Vista de mapa seleccionada';
      case DSMapState.disabled:
        return 'Mapa deshabilitado temporalmente';
      case DSMapState.loading:
        return 'Cargando datos del mapa';
      case DSMapState.skeleton:
        return 'Cargando interfaz del mapa';
    }
  }

  /// Obtiene anuncio de cambio de estado
  String _getStateAnnouncement(DSMapState state) {
    switch (state) {
      case DSMapState.loading:
        return 'Cargando mapa';
      case DSMapState.disabled:
        return 'Mapa deshabilitado';
      case DSMapState.focus:
        return 'Mapa enfocado, navega con teclado';
      default:
        return '';
    }
  }

  /// Verifica si la navegación por teclado está habilitada
  bool _isKeyboardNavigationEnabled() {
    return config?.enableKeyboardNavigation ?? true;
  }

  /// Verifica si se deben anunciar cambios de estado
  bool _shouldAnnounceStateChanges() {
    return config?.announceStateChanges ?? true;
  }

  /// Construye indicador de estado para lectores de pantalla
  Widget buildStateIndicator(DSMapState state) {
    if (!_shouldAnnounceStateChanges()) {
      return const SizedBox.shrink();
    }

    String stateText;
    switch (state) {
      case DSMapState.loading:
        stateText = 'Cargando';
        break;
      case DSMapState.disabled:
        stateText = 'Deshabilitado';
        break;
      case DSMapState.focus:
        stateText = 'Enfocado';
        break;
      default:
        return const SizedBox.shrink();
    }

    return Semantics(
      liveRegion: true,
      child: Text(
        stateText,
        style: const TextStyle(fontSize: 0),
      ),
    );
  }

  /// Construye instrucciones de navegación para accesibilidad
  Widget buildNavigationInstructions() {
    if (!_isKeyboardNavigationEnabled()) {
      return const SizedBox.shrink();
    }

    return Semantics(
      hint: '''
Controles del mapa:
• Flechas o WASD: mover el mapa
• + o =: acercar zoom
• - : alejar zoom
• Enter o Espacio: interactuar
• Escape: cancelar
''',
      child: const SizedBox.shrink(),
    );
  }

  /// Construye descripción de marcadores para accesibilidad
  Widget buildMarkersDescription(List<DSMapMarker> markers) {
    if (markers.isEmpty) {
      return const SizedBox.shrink();
    }

    final effectiveConfig = config ?? const DSMapA11yConfig();
    final description = _buildMarkersListDescription(markers, effectiveConfig);

    return Semantics(
      label: description,
      readOnly: true,
      child: const SizedBox.shrink(),
    );
  }

  /// Construye descripción textual de lista de marcadores
  String _buildMarkersListDescription(List<DSMapMarker> markers, DSMapA11yConfig config) {
    if (markers.isEmpty) {
      return 'No hay marcadores en el mapa';
    }

    if (markers.length == 1) {
      final marker = markers.first;
      final title = marker.title?.isNotEmpty == true ? marker.title! : 'Sin título';
      return '${config.markerLabel}: $title en ${marker.position.displayString}';
    }

    final clusters = markers.where((m) => m.type == DSMapMarkerType.cluster).length;
    final individual = markers.length - clusters;

    if (clusters > 0) {
      return '$individual marcadores individuales y $clusters grupos en el mapa';
    }

    return '${markers.length} marcadores en el mapa';
  }

  /// Construye descripción de formas para accesibilidad
  Widget buildShapesDescription(List<DSMapShape> shapes) {
    if (shapes.isEmpty) {
      return const SizedBox.shrink();
    }

    final effectiveConfig = config ?? const DSMapA11yConfig();
    final description = _buildShapesListDescription(shapes, effectiveConfig);

    return Semantics(
      label: description,
      readOnly: true,
      child: const SizedBox.shrink(),
    );
  }

  /// Construye descripción textual de lista de formas
  String _buildShapesListDescription(List<DSMapShape> shapes, DSMapA11yConfig config) {
    if (shapes.isEmpty) {
      return 'No hay formas en el mapa';
    }

    if (shapes.length == 1) {
      final shape = shapes.first;
      final title = shape.title?.isNotEmpty == true ? shape.title! : shape.type.displayName;
      return '${config.shapeLabel}: $title';
    }

    final typeGroups = <DSMapShapeType, int>{};
    for (final shape in shapes) {
      typeGroups[shape.type] = (typeGroups[shape.type] ?? 0) + 1;
    }

    final descriptions = typeGroups.entries.map((entry) {
      final count = entry.value;
      final type = entry.key.displayName.toLowerCase();
      return count == 1 ? '1 $type' : '$count ${type}s';
    }).join(', ');

    return '$descriptions en el mapa';
  }

  /// Construye ayuda contextual para el usuario
  Widget buildContextualHelp({
    required DSMapTheme theme,
    required DSMapVariant variant,
    required int markerCount,
    required int shapeCount,
  }) {
    final helpText = _buildHelpText(
      theme: theme,
      variant: variant,
      markerCount: markerCount,
      shapeCount: shapeCount,
    );

    return Semantics(
      hint: helpText,
      child: const SizedBox.shrink(),
    );
  }

  /// Construye texto de ayuda contextual
  String _buildHelpText({
    required DSMapTheme theme,
    required DSMapVariant variant,
    required int markerCount,
    required int shapeCount,
  }) {
    final parts = <String>[];

    // Tema
    parts.add('Tema: ${theme.displayName}');

    // Variante
    parts.add(variant.description);

    // Contenido
    if (markerCount > 0) {
      parts.add('$markerCount marcadores');
    }
    if (shapeCount > 0) {
      parts.add('$shapeCount formas');
    }

    if (markerCount == 0 && shapeCount == 0) {
      parts.add('Mapa vacío');
    }

    return parts.join(', ');
  }

  /// Maneja focus automático para accesibilidad
  void requestFocus(FocusNode focusNode) {
    if (_isKeyboardNavigationEnabled()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (focusNode.canRequestFocus) {
          focusNode.requestFocus();
        }
      });
    }
  }

  /// Construye indicador de progreso accesible para carga del mapa
  Widget buildAccessibleProgressIndicator({
    double? progress,
    String? description,
  }) {
    return Semantics(
      label: description ?? 'Cargando mapa',
      value: progress != null
          ? '${(progress * 100).round()}% completado'
          : 'En progreso',
      liveRegion: true,
      child: const SizedBox.shrink(),
    );
  }

  /// Construye controles accesibles para el mapa
  Widget buildAccessibleControls({
    required VoidCallback onZoomIn,
    required VoidCallback onZoomOut,
    required VoidCallback onCenterMap,
    bool canZoomIn = true,
    bool canZoomOut = true,
  }) {
    if (!_isKeyboardNavigationEnabled()) {
      return const SizedBox.shrink();
    }

    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            button: true,
            enabled: canZoomIn,
            label: 'Acercar zoom',
            hint: 'Aumenta el nivel de zoom del mapa',
            onTap: canZoomIn ? onZoomIn : null,
            child: const SizedBox.shrink(),
          ),
          Semantics(
            button: true,
            enabled: canZoomOut,
            label: 'Alejar zoom',
            hint: 'Disminuye el nivel de zoom del mapa',
            onTap: canZoomOut ? onZoomOut : null,
            child: const SizedBox.shrink(),
          ),
          Semantics(
            button: true,
            label: 'Centrar mapa',
            hint: 'Regresa el mapa a la posición inicial',
            onTap: onCenterMap,
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  /// Anuncia cambio de tema del mapa
  void announceThemeChange(DSMapTheme newTheme) {
    if (!_shouldAnnounceStateChanges()) return;

    SemanticsService.announce(
      'Tema del mapa cambiado a ${newTheme.displayName}',
      TextDirection.ltr,
    );
  }

  /// Anuncia cambio de variante del mapa
  void announceVariantChange(DSMapVariant newVariant) {
    if (!_shouldAnnounceStateChanges()) return;

    SemanticsService.announce(
      'Modo del mapa cambiado a ${newVariant.displayName}',
      TextDirection.ltr,
    );
  }

  /// Anuncia error en el mapa
  void announceError(String error) {
    if (!_shouldAnnounceStateChanges()) return;

    SemanticsService.announce(
      'Error en el mapa: $error',
      TextDirection.ltr,
    );
  }
}