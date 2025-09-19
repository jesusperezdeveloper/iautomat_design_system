import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'app_profile_preferences_config.dart';

/// Helper para funcionalidades de accesibilidad en DSProfilePreferences
///
/// Maneja anuncios de screen reader, navegación por teclado,
/// y otras características de accesibilidad
class DSProfilePreferencesA11yHelper {
  final DSProfileA11yConfig config;
  Timer? _announceTimer;

  DSProfilePreferencesA11yHelper({
    required this.config,
  });

  /// Anuncia un mensaje de error
  void announceError(String message) {
    if (!config.enabled || !config.announceErrors) return;

    _announceMessage(message, assertive: true);
  }

  /// Anuncia un mensaje de éxito
  void announceSuccess(String message) {
    if (!config.enabled || !config.announceSuccess) return;

    _announceMessage(message, assertive: false);
  }

  /// Anuncia un cambio de estado
  void announceStateChange(String message) {
    if (!config.enabled || !config.announceStateChanges) return;

    _announceMessage(message, assertive: false);
  }

  /// Anuncia un mensaje con prioridad específica
  void _announceMessage(String message, {required bool assertive}) {
    // Cancelar anuncio anterior para evitar spam
    _announceTimer?.cancel();

    _announceTimer = Timer(const Duration(milliseconds: 100), () {
      SemanticsService.announce(message, TextDirection.ltr);
    });
  }

  /// Configura navegación por teclado para un campo
  Map<LogicalKeySet, Intent> getKeyboardShortcuts(DSProfileField field) {
    if (!config.enabled || !config.enableKeyboardNavigation) {
      return {};
    }

    final shortcuts = <LogicalKeySet, Intent>{};

    // Tab para siguiente campo
    shortcuts[LogicalKeySet(LogicalKeyboardKey.tab)] = const NextFocusIntent();

    // Shift+Tab para campo anterior
    shortcuts[LogicalKeySet(LogicalKeyboardKey.shift, LogicalKeyboardKey.tab)] =
        const PreviousFocusIntent();

    // Enter para enviar formulario
    shortcuts[LogicalKeySet(LogicalKeyboardKey.enter)] = const ActivateIntent();

    // Escape para cancelar
    shortcuts[LogicalKeySet(LogicalKeyboardKey.escape)] = const DismissIntent();

    // Shortcuts específicos por tipo de campo
    switch (field.type) {
      case DSProfileFieldType.toggle:
        // Espacio para toggle
        shortcuts[LogicalKeySet(LogicalKeyboardKey.space)] = const ActivateIntent();
        break;
      case DSProfileFieldType.select:
        // Arrow down para abrir dropdown
        shortcuts[LogicalKeySet(LogicalKeyboardKey.arrowDown)] = const ActivateIntent();
        break;
      case DSProfileFieldType.slider:
        // Arrows para ajustar slider
        shortcuts[LogicalKeySet(LogicalKeyboardKey.arrowLeft)] =
            const SliderDecrementIntent();
        shortcuts[LogicalKeySet(LogicalKeyboardKey.arrowRight)] =
            const SliderIncrementIntent();
        break;
      default:
        break;
    }

    return shortcuts;
  }

  /// Configura acciones de teclado para un campo
  Map<Type, Action<Intent>> getKeyboardActions(
    DSProfileField field,
    VoidCallback? onSubmit,
    VoidCallback? onToggle,
    Function(double)? onSliderChange,
  ) {
    if (!config.enabled || !config.enableKeyboardNavigation) {
      return {};
    }

    final actions = <Type, Action<Intent>>{};

    // Acción de activar (Enter/Space)
    if (onSubmit != null) {
      actions[ActivateIntent] = CallbackAction<ActivateIntent>(
        onInvoke: (_) => onSubmit(),
      );
    }

    // Toggle para switches
    if (onToggle != null && field.type == DSProfileFieldType.toggle) {
      actions[ActivateIntent] = CallbackAction<ActivateIntent>(
        onInvoke: (_) => onToggle(),
      );
    }

    // Slider actions
    if (onSliderChange != null && field.type == DSProfileFieldType.slider) {
      actions[SliderIncrementIntent] = CallbackAction<SliderIncrementIntent>(
        onInvoke: (_) {
          final config = field.config ?? {};
          final step = (config['step'] as num?)?.toDouble() ?? 1.0;
          onSliderChange(step);
          return null;
        },
      );

      actions[SliderDecrementIntent] = CallbackAction<SliderDecrementIntent>(
        onInvoke: (_) {
          final config = field.config ?? {};
          final step = (config['step'] as num?)?.toDouble() ?? 1.0;
          onSliderChange(-step);
          return null;
        },
      );
    }

    return actions;
  }

  /// Genera labels semánticos para un campo
  String getFieldSemanticLabel(DSProfileField field) {
    if (!config.enabled || !config.enableSemanticLabels) {
      return field.label;
    }

    final buffer = StringBuffer();

    // Label base
    buffer.write(field.label);

    // Indicador de requerido
    if (field.required) {
      buffer.write(', ${config.requiredFieldSemanticLabel}');
    }

    // Tipo específico
    switch (field.type) {
      case DSProfileFieldType.email:
        buffer.write(', campo de email');
        break;
      case DSProfileFieldType.phone:
        buffer.write(', campo de teléfono');
        break;
      case DSProfileFieldType.toggle:
        buffer.write(', interruptor');
        break;
      case DSProfileFieldType.slider:
        buffer.write(', deslizador');
        break;
      case DSProfileFieldType.select:
        buffer.write(', lista de selección');
        break;
      case DSProfileFieldType.date:
        buffer.write(', selector de fecha');
        break;
      case DSProfileFieldType.color:
        buffer.write(', selector de color');
        break;
      case DSProfileFieldType.file:
        buffer.write(', selector de archivo');
        break;
      default:
        break;
    }

    // Estado del campo
    if (!field.enabled) {
      buffer.write(', deshabilitado');
    }

    if (field.readonly) {
      buffer.write(', solo lectura');
    }

    return buffer.toString();
  }

  /// Genera hints semánticos para un campo
  String? getFieldSemanticHint(DSProfileField field) {
    if (!config.enabled || !config.enableHints) {
      return field.description;
    }

    final hints = <String>[];

    // Helper text del campo
    if (field.description != null) {
      hints.add(field.description!);
    }

    // Hints específicos por tipo
    switch (field.type) {
      case DSProfileFieldType.toggle:
        hints.add('Presiona espacio para alternar');
        break;
      case DSProfileFieldType.select:
        hints.add('Presiona flecha abajo para ver opciones');
        break;
      case DSProfileFieldType.slider:
        hints.add('Usa las flechas izquierda y derecha para ajustar el valor');
        break;
      case DSProfileFieldType.date:
        hints.add('Toca para seleccionar una fecha');
        break;
      case DSProfileFieldType.color:
        hints.add('Toca para seleccionar un color');
        break;
      case DSProfileFieldType.file:
        hints.add('Toca para seleccionar un archivo');
        break;
      default:
        break;
    }

    return hints.isNotEmpty ? hints.join('. ') : null;
  }

  /// Configura live region para anuncios dinámicos
  Widget buildLiveRegion({
    required Widget child,
    required String label,
  }) {
    if (!config.enabled || !config.enableLiveRegions) {
      return child;
    }

    return Semantics(
      liveRegion: true,
      label: label,
      child: child,
    );
  }

  /// Construye wrapper semántico para botones
  Widget buildSemanticButton({
    required Widget child,
    required String label,
    String? hint,
    bool enabled = true,
    VoidCallback? onTap,
  }) {
    if (!config.enabled) {
      return child;
    }

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      hint: hint,
      onTap: onTap,
      child: child,
    );
  }

  /// Construye wrapper semántico para campos de texto
  Widget buildSemanticTextField({
    required Widget child,
    required DSProfileField field,
    String? value,
    String? errorMessage,
  }) {
    if (!config.enabled) {
      return child;
    }

    return Semantics(
      textField: true,
      enabled: field.enabled,
      readOnly: field.readonly,
      label: getFieldSemanticLabel(field),
      hint: getFieldSemanticHint(field),
      value: value,
      child: ExcludeSemantics(
        excluding: false,
        child: child,
      ),
    );
  }

  /// Construye wrapper semántico para switches
  Widget buildSemanticSwitch({
    required Widget child,
    required DSProfileField field,
    required bool value,
  }) {
    if (!config.enabled) {
      return child;
    }

    return Semantics(
      toggled: value,
      enabled: field.enabled,
      label: getFieldSemanticLabel(field),
      hint: getFieldSemanticHint(field),
      child: child,
    );
  }

  /// Construye wrapper semántico para dropdowns
  Widget buildSemanticDropdown({
    required Widget child,
    required DSProfileField field,
    Object? value,
  }) {
    if (!config.enabled) {
      return child;
    }

    return Semantics(
      button: true,
      enabled: field.enabled,
      label: getFieldSemanticLabel(field),
      hint: getFieldSemanticHint(field),
      value: value?.toString(),
      child: child,
    );
  }

  /// Construye wrapper semántico para sliders
  Widget buildSemanticSlider({
    required Widget child,
    required DSProfileField field,
    required double value,
  }) {
    if (!config.enabled) {
      return child;
    }

    final fieldConfig = field.config ?? {};
    final min = (fieldConfig['min'] as num?)?.toDouble() ?? 0.0;
    final max = (fieldConfig['max'] as num?)?.toDouble() ?? 100.0;

    return Semantics(
      slider: true,
      enabled: field.enabled,
      label: getFieldSemanticLabel(field),
      hint: getFieldSemanticHint(field),
      value: value.toString(),
      increasedValue: (value + 1).clamp(min, max).toString(),
      decreasedValue: (value - 1).clamp(min, max).toString(),
      child: child,
    );
  }

  /// Construye wrapper semántico para headers
  Widget buildSemanticHeader({
    required Widget child,
    required String label,
  }) {
    if (!config.enabled) {
      return child;
    }

    return Semantics(
      header: true,
      label: label,
      child: child,
    );
  }

  /// Construye wrapper semántico para formularios
  Widget buildSemanticForm({
    required Widget child,
  }) {
    if (!config.enabled) {
      return child;
    }

    return Semantics(
      container: true,
      label: config.mainSectionSemanticLabel,
      child: child,
    );
  }

  /// Verifica si las características de accesibilidad están disponibles
  bool get isScreenReaderEnabled => config.enabled && config.supportScreenReader;
  bool get isKeyboardNavigationEnabled => config.enabled && config.enableKeyboardNavigation;
  bool get areSemanticLabelsEnabled => config.enabled && config.enableSemanticLabels;
  bool get areHintsEnabled => config.enabled && config.enableHints;
  bool get areLiveRegionsEnabled => config.enabled && config.enableLiveRegions;

  /// Libera recursos
  void dispose() {
    _announceTimer?.cancel();
    _announceTimer = null;
  }
}

// Intents personalizados para navegación por teclado

/// Intent para incrementar slider
class SliderIncrementIntent extends Intent {
  const SliderIncrementIntent();
}

/// Intent para decrementar slider
class SliderDecrementIntent extends Intent {
  const SliderDecrementIntent();
}

/// Intent para enviar formulario
class SubmitFormIntent extends Intent {
  const SubmitFormIntent();
}

/// Intent para cancelar/retroceder
class CancelIntent extends Intent {
  const CancelIntent();
}

// Extensiones auxiliares

extension DSProfileFieldA11yExtensions on DSProfileField {
  /// Obtiene prioridad de accesibilidad según importancia
  int get accessibilityPriority {
    switch (importance) {
      case DSProfileFieldImportance.critical:
        return 100;
      case DSProfileFieldImportance.high:
        return 75;
      case DSProfileFieldImportance.normal:
        return 50;
      case DSProfileFieldImportance.low:
        return 25;
    }
  }

  /// Verifica si el campo necesita anuncios especiales
  bool get needsSpecialAnnouncements {
    return type == DSProfileFieldType.toggle ||
           type == DSProfileFieldType.slider ||
           importance == DSProfileFieldImportance.critical;
  }

  /// Obtiene el rol semántico del campo
  String get semanticRole {
    switch (type) {
      case DSProfileFieldType.text:
      case DSProfileFieldType.email:
      case DSProfileFieldType.phone:
        return 'text field';
      case DSProfileFieldType.toggle:
        return 'switch';
      case DSProfileFieldType.select:
        return 'dropdown';
      case DSProfileFieldType.slider:
        return 'slider';
      case DSProfileFieldType.date:
        return 'date picker';
      case DSProfileFieldType.color:
        return 'color picker';
      case DSProfileFieldType.file:
        return 'file picker';
      case DSProfileFieldType.header:
        return 'heading';
      case DSProfileFieldType.divider:
        return 'separator';
      default:
        return 'field';
    }
  }
}