import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_divider_config.dart';

typedef AnnouncementCallback = void Function(String message);

class DSDividerA11yHelper {
  final DSDividerConfig config;
  final AnnouncementCallback? onAnnouncementRequested;

  const DSDividerA11yHelper({
    required this.config,
    this.onAnnouncementRequested,
  });

  void announceStateChange(
    DSDividerState previousState,
    DSDividerState newState,
  ) {
    if (!_shouldAnnounceStateChange(previousState, newState)) return;

    final message = _getStateChangeMessage(previousState, newState);
    if (message != null) {
      _announce(message);
    }
  }

  void announceVisibilityChange(bool isVisible) {
    if (!_shouldAnnounceVisibilityChange()) return;

    final message = isVisible ? 'Separador visible' : 'Separador oculto';
    _announce(message);
  }

  void announceInteraction(String action) {
    if (!_shouldAnnounceInteraction()) return;

    final message = _getInteractionMessage(action);
    if (message != null) {
      _announce(message);
    }
  }

  void announceError(String errorMessage) {
    if (!_shouldAnnounceError()) return;

    _announce('Error: $errorMessage');
  }

  void announceLoading(bool isLoading) {
    if (!_shouldAnnounceLoading()) return;

    final message = isLoading ? 'Cargando separador' : 'Carga completada';
    _announce(message);
  }

  String? getSemanticLabel() {
    final accessibility = _getAccessibilityConfig();

    if (!accessibility.enabled) return null;

    return accessibility.semanticLabel ?? _getDefaultSemanticLabel();
  }

  String? getSemanticHint() {
    final accessibility = _getAccessibilityConfig();

    if (!accessibility.enabled) return null;

    return accessibility.semanticDescription ?? _getDefaultSemanticHint();
  }

  String? getSemanticValue() {
    final state = _getCurrentState();

    switch (state) {
      case DSDividerState.loading:
        return 'Cargando';
      case DSDividerState.disabled:
        return 'Deshabilitado';
      case DSDividerState.selected:
        return 'Seleccionado';
      case DSDividerState.focus:
        return 'Enfocado';
      default:
        return null;
    }
  }

  Map<String, dynamic> getSemanticsProperties() {
    final accessibility = _getAccessibilityConfig();
    final state = _getCurrentState();

    return {
      'enabled': accessibility.enabled && state != DSDividerState.disabled,
      'button': _isInteractive(),
      'focusable': accessibility.focusable && state.isInteractive,
      'hidden': !accessibility.enabled || accessibility.excludeSemantics,
      'label': getSemanticLabel(),
      'hint': getSemanticHint(),
      'value': getSemanticValue(),
      'identifier': _getSemanticIdentifier(),
      'liveRegion': _isLiveRegion(),
      'readOnly': !_isInteractive(),
    };
  }

  List<Map<String, dynamic>> getCustomSemanticsActions() {
    final actions = <Map<String, dynamic>>[];

    if (!_isInteractive()) return actions;

    // Acción principal de tap
    actions.add({'label': 'Activar', 'action': 'tap'});

    // Acciones adicionales según el estado
    final state = _getCurrentState();
    if (state == DSDividerState.focus) {
      actions.add({'label': 'Confirmar', 'action': 'activate'});
    }

    return actions;
  }

  EdgeInsets getAccessibilityPadding() {
    final spacing = _getSpacingConfig();
    final isInteractive = _isInteractive();

    if (!isInteractive) {
      return EdgeInsets.zero;
    }

    return spacing.interactivePadding;
  }

  Size getMinimumTouchTarget() {
    final spacing = _getSpacingConfig();
    final minSize = spacing.minInteractiveSize;

    return Size(minSize, minSize);
  }

  bool shouldExcludeFromSemantics() {
    final accessibility = _getAccessibilityConfig();
    return !accessibility.enabled || accessibility.excludeSemantics;
  }

  void _announce(String message) {
    if (kDebugMode) {
      debugPrint('[A11y] $message');
    }

    onAnnouncementRequested?.call(message);
  }

  bool _shouldAnnounceStateChange(
    DSDividerState previousState,
    DSDividerState newState,
  ) {
    final accessibility = _getAccessibilityConfig();
    if (!accessibility.enabled) return false;

    // No anunciar cambios menores como hover
    if (newState == DSDividerState.hover) return false;
    if (previousState == DSDividerState.hover &&
        newState == DSDividerState.defaultState) {
      return false;
    }

    // Anunciar cambios importantes
    return previousState != newState &&
        (newState == DSDividerState.loading ||
            newState == DSDividerState.disabled ||
            newState == DSDividerState.selected ||
            newState == DSDividerState.focus);
  }

  bool _shouldAnnounceVisibilityChange() {
    final accessibility = _getAccessibilityConfig();
    return accessibility.enabled;
  }

  bool _shouldAnnounceInteraction() {
    final accessibility = _getAccessibilityConfig();
    return accessibility.enabled && _isInteractive();
  }

  bool _shouldAnnounceError() {
    final accessibility = _getAccessibilityConfig();
    return accessibility.enabled;
  }

  bool _shouldAnnounceLoading() {
    final accessibility = _getAccessibilityConfig();
    return accessibility.enabled;
  }

  String? _getStateChangeMessage(
    DSDividerState previousState,
    DSDividerState newState,
  ) {
    switch (newState) {
      case DSDividerState.loading:
        return 'Cargando';
      case DSDividerState.disabled:
        return 'Deshabilitado';
      case DSDividerState.selected:
        return 'Seleccionado';
      case DSDividerState.focus:
        return 'Enfocado';
      case DSDividerState.pressed:
        return 'Presionado';
      default:
        return null;
    }
  }

  String? _getInteractionMessage(String action) {
    switch (action) {
      case 'tap':
        return 'Separador activado';
      case 'focus':
        return 'Separador enfocado';
      case 'hover':
        return null; // No anunciar hover
      default:
        return 'Interacción: $action';
    }
  }

  String _getDefaultSemanticLabel() {
    final variant = _getVariant();
    final orientation = _getOrientation();

    String label = 'Separador';

    if (orientation.isVertical) {
      label = '$label vertical';
    }

    if (variant.isInset) {
      label = '$label con margen';
    }

    return label;
  }

  String? _getDefaultSemanticHint() {
    if (_isInteractive()) {
      return 'Doble toque para activar';
    }
    return null;
  }

  String _getSemanticIdentifier() {
    final variant = _getVariant();
    final orientation = _getOrientation();

    return 'divider_${variant.name}_${orientation.name}';
  }

  bool _isLiveRegion() {
    final state = _getCurrentState();
    return state == DSDividerState.loading ||
        state == DSDividerState.skeleton;
  }

  bool _isInteractive() {
    // Necesito acceder a la propiedad interactive del widget
    // Por ahora retorno false ya que no tengo acceso directo
    return false;
  }

  DSDividerAccessibilityConfig _getAccessibilityConfig() {
    return const DSDividerAccessibilityConfig();
  }

  DSDividerSpacing _getSpacingConfig() {
    return const DSDividerSpacing();
  }

  DSDividerState _getCurrentState() {
    return DSDividerState.defaultState;
  }

  DSDividerVariant _getVariant() {
    return DSDividerVariant.full;
  }

  DSDividerOrientation _getOrientation() {
    return DSDividerOrientation.horizontal;
  }
}
