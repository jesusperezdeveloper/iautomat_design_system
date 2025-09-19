import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'app_auth_screens_config.dart';

/// Helper para funcionalidades de accesibilidad en DSAuthScreens
///
/// Maneja anuncios de screen reader, navegación por teclado,
/// y otras características de accesibilidad
class DSAuthScreensA11yHelper {
  final DSAuthA11yConfig config;
  Timer? _announceTimer;

  DSAuthScreensA11yHelper({
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

  /// Anuncia navegación
  void announceNavigation(String message) {
    if (!config.enabled || !config.announceNavigation) return;

    _announceMessage(message, assertive: false);
  }

  /// Anuncia un mensaje con prioridad específica
  void _announceMessage(String message, {required bool assertive}) {
    // Cancelar anuncio anterior para evitar spam
    _announceTimer?.cancel();

    _announceTimer = Timer(const Duration(milliseconds: 100), () {
      SemanticsService.announce(message, Directionality.of(_getCurrentContext()));
    });
  }

  /// Obtiene el contexto actual (simplificado para el ejemplo)
  BuildContext _getCurrentContext() {
    // En una implementación real, mantendrías referencia al contexto
    // o usarías un GlobalKey para acceder al contexto
    throw UnimplementedError('Context reference needed');
  }

  /// Configura navegación por teclado para un campo
  Map<LogicalKeySet, Intent> getKeyboardShortcuts(DSAuthField field) {
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
      case DSAuthFieldType.password:
        // Ctrl/Cmd + \ para toggle visibility
        shortcuts[LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.backslash,
        )] = const TogglePasswordVisibilityIntent();
        break;

      case DSAuthFieldType.otp:
        // Números para navegación directa
        for (int i = 1; i <= 9; i++) {
          final key = LogicalKeyboardKey(0x00000030 + i); // '1' to '9'
          shortcuts[LogicalKeySet(LogicalKeyboardKey.alt, key)] =
              OtpFieldFocusIntent(i - 1);
        }
        break;

      default:
        break;
    }

    return shortcuts;
  }

  /// Configura acciones de teclado para un campo
  Map<Type, Action<Intent>> getKeyboardActions(
    DSAuthField field,
    VoidCallback? onSubmit,
    VoidCallback? onTogglePasswordVisibility,
    Function(int)? onOtpFieldFocus,
  ) {
    if (!config.enabled || !config.enableKeyboardNavigation) {
      return {};
    }

    final actions = <Type, Action<Intent>>{};

    // Acción de activar (Enter)
    if (onSubmit != null) {
      actions[ActivateIntent] = CallbackAction<ActivateIntent>(
        onInvoke: (_) => onSubmit(),
      );
    }

    // Toggle password visibility
    if (onTogglePasswordVisibility != null &&
        (field.type == DSAuthFieldType.password ||
         field.type == DSAuthFieldType.confirmPassword)) {
      actions[TogglePasswordVisibilityIntent] =
          CallbackAction<TogglePasswordVisibilityIntent>(
        onInvoke: (_) => onTogglePasswordVisibility(),
      );
    }

    // Navegación OTP
    if (onOtpFieldFocus != null && field.type == DSAuthFieldType.otp) {
      actions[OtpFieldFocusIntent] = CallbackAction<OtpFieldFocusIntent>(
        onInvoke: (intent) => onOtpFieldFocus(intent.fieldIndex),
      );
    }

    return actions;
  }

  /// Genera labels semánticos para un campo
  String getFieldSemanticLabel(DSAuthField field) {
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
      case DSAuthFieldType.password:
        buffer.write(', campo de contraseña');
        break;
      case DSAuthFieldType.email:
        buffer.write(', campo de email');
        break;
      case DSAuthFieldType.otp:
        buffer.write(', campo de código de verificación');
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
  String? getFieldSemanticHint(DSAuthField field) {
    if (!config.enabled || !config.enableHints) {
      return field.helperText;
    }

    final hints = <String>[];

    // Helper text del campo
    if (field.helperText != null) {
      hints.add(field.helperText!);
    }

    // Hints específicos por tipo
    switch (field.type) {
      case DSAuthFieldType.password:
        hints.add('Presiona Control + barra invertida para mostrar u ocultar la contraseña');
        break;
      case DSAuthFieldType.otp:
        hints.add('Ingresa ${field.maxLength ?? 6} dígitos del código de verificación');
        break;
      case DSAuthFieldType.email:
        hints.add('Formato: ejemplo@correo.com');
        break;
      default:
        break;
    }

    // Límites de caracteres
    if (field.maxLength != null) {
      hints.add('Máximo ${field.maxLength} caracteres');
    }

    return hints.isNotEmpty ? hints.join('. ') : null;
  }

  /// Genera valor semántico para un campo
  String getFieldSemanticValue(DSAuthField field, String? value) {
    if (!config.enabled || value == null || value.isEmpty) {
      return '';
    }

    switch (field.type) {
      case DSAuthFieldType.password:
      case DSAuthFieldType.confirmPassword:
        // No anunciar contraseñas por seguridad
        return 'contraseña ingresada';

      case DSAuthFieldType.otp:
        // Anunciar cantidad de dígitos
        return '${value.length} de ${field.maxLength ?? 6} dígitos ingresados';

      case DSAuthFieldType.email:
        // Validar formato básico para feedback
        if (value.contains('@')) {
          return 'email ingresado';
        } else {
          return 'email incompleto';
        }

      default:
        return value;
    }
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
    required DSAuthField field,
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
      obscured: field.type == DSAuthFieldType.password ||
                field.type == DSAuthFieldType.confirmPassword,
      label: getFieldSemanticLabel(field),
      hint: getFieldSemanticHint(field),
      value: getFieldSemanticValue(field, value),
      child: ExcludeSemantics(
        excluding: false,
        child: child,
      ),
    );
  }

  /// Construye wrapper semántico para formularios
  Widget buildSemanticForm({
    required Widget child,
    required DSAuthVariant variant,
  }) {
    if (!config.enabled) {
      return child;
    }

    String label;
    switch (variant) {
      case DSAuthVariant.signIn:
        label = config.signInSemanticLabel;
        break;
      case DSAuthVariant.signUp:
        label = config.signUpSemanticLabel;
        break;
      case DSAuthVariant.otp:
        label = config.otpSemanticLabel;
        break;
      case DSAuthVariant.sso:
        label = config.ssoSemanticLabel;
        break;
    }

    return Semantics(
      container: true,
      label: label,
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

/// Intent para toggle de visibilidad de contraseña
class TogglePasswordVisibilityIntent extends Intent {
  const TogglePasswordVisibilityIntent();
}

/// Intent para enfocar campo OTP específico
class OtpFieldFocusIntent extends Intent {
  final int fieldIndex;

  const OtpFieldFocusIntent(this.fieldIndex);
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

extension DSAuthFieldA11yExtensions on DSAuthField {
  /// Obtiene prioridad de accesibilidad según importancia
  int get accessibilityPriority {
    switch (importance) {
      case DSAuthFieldImportance.critical:
        return 100;
      case DSAuthFieldImportance.high:
        return 75;
      case DSAuthFieldImportance.normal:
        return 50;
      case DSAuthFieldImportance.low:
        return 25;
    }
  }

  /// Verifica si el campo necesita anuncios especiales
  bool get needsSpecialAnnouncements {
    return type == DSAuthFieldType.otp ||
           type == DSAuthFieldType.password ||
           importance == DSAuthFieldImportance.critical;
  }

  /// Obtiene el rol semántico del campo
  String get semanticRole {
    switch (type) {
      case DSAuthFieldType.password:
      case DSAuthFieldType.confirmPassword:
        return 'secure text field';
      case DSAuthFieldType.email:
        return 'email field';
      case DSAuthFieldType.phone:
        return 'phone field';
      case DSAuthFieldType.otp:
        return 'verification code field';
      case DSAuthFieldType.checkbox:
      case DSAuthFieldType.terms:
      case DSAuthFieldType.privacy:
        return 'checkbox';
      default:
        return 'text field';
    }
  }
}