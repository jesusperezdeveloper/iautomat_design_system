import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'dart:ui' as ui;

import 'package:iautomat_design_system/src/components/currency_input/app_currency_input_config.dart';

/// Helper que maneja todas las funcionalidades de accesibilidad
/// para el input de moneda
///
/// Proporciona:
/// - Etiquetas semánticas apropiadas
/// - Navegación por teclado
/// - Anuncios de cambios de estado
/// - Soporte para lectores de pantalla
/// - Hints de accesibilidad contextuales
class AppCurrencyInputA11yHelper {
  final AppCurrencyInputA11yConfig config;

  const AppCurrencyInputA11yHelper({
    required this.config,
  });

  /// Construye el wrapper semántico completo para el input
  Widget buildSemanticWrapper({
    required BuildContext context,
    required AppCurrencyInputValue? value,
    required AppCurrencyInputState state,
    required bool isRtl,
    required Widget child,
  }) {
    return Semantics(
      enabled: state != AppCurrencyInputState.disabled,
      textField: true,
      readOnly: state == AppCurrencyInputState.disabled || state == AppCurrencyInputState.loading,
      focusable: state != AppCurrencyInputState.disabled,
      focused: state == AppCurrencyInputState.focus,
      label: _buildSemanticLabel(value, state),
      hint: _buildSemanticHint(value, state),
      value: _buildSemanticValue(value, state),
      textDirection: isRtl ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      excludeSemantics: false,
      child: child,
    );
  }

  /// Maneja eventos de teclado para navegación y acciones
  void handleKeyEvent(
    KeyEvent event, {
    required VoidCallback onActivate,
    required VoidCallback onSelect,
    VoidCallback? onIncrement,
    VoidCallback? onDecrement,
  }) {
    if (event is! KeyDownEvent) return;

    final isControlPressed = HardwareKeyboard.instance.isControlPressed;
    final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;

    switch (event.logicalKey) {
      // Activación con Enter o Espacio
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        if (config.enableKeyboardActivation) {
          onActivate();
        }
        break;

      // Selección con Ctrl+A
      case LogicalKeyboardKey.keyA:
        if (isControlPressed && config.enableKeyboardSelection) {
          onSelect();
        }
        break;

      // Incremento/Decremento con flechas
      case LogicalKeyboardKey.arrowUp:
        if (config.enableKeyboardIncrement && onIncrement != null) {
          onIncrement();
        }
        break;

      case LogicalKeyboardKey.arrowDown:
        if (config.enableKeyboardIncrement && onDecrement != null) {
          onDecrement();
        }
        break;

      // Incremento/Decremento rápido con Shift+Flechas
      case LogicalKeyboardKey.arrowUp when isShiftPressed:
        if (config.enableKeyboardIncrement && onIncrement != null) {
          // Incremento rápido (x10)
          for (int i = 0; i < 10; i++) {
            onIncrement();
          }
        }
        break;

      case LogicalKeyboardKey.arrowDown when isShiftPressed:
        if (config.enableKeyboardIncrement && onDecrement != null) {
          // Decremento rápido (x10)
          for (int i = 0; i < 10; i++) {
            onDecrement();
          }
        }
        break;
    }
  }

  /// Anuncia cambios de estado para lectores de pantalla
  void announceStateChange(AppCurrencyInputState state) {
    if (!config.enableStateAnnouncements) return;

    final announcement = _getStateAnnouncement(state);
    if (announcement != null) {
      SemanticsService.announce(
        announcement,
        ui.TextDirection.ltr,
        assertiveness: _getAnnouncementAssertiveness(state),
      );
    }
  }

  /// Anuncia cambios de valor para lectores de pantalla
  void announceValueChange(AppCurrencyInputValue value) {
    if (!config.enableValueAnnouncements) return;

    final announcement = _getValueAnnouncement(value);
    if (announcement != null) {
      SemanticsService.announce(
        announcement,
        ui.TextDirection.ltr,
        assertiveness: Assertiveness.polite,
      );
    }
  }

  /// Anuncia errores de validación
  void announceValidationError(String error) {
    if (!config.enableErrorAnnouncements) return;

    SemanticsService.announce(
      'Error: $error',
      ui.TextDirection.ltr,
      assertiveness: Assertiveness.assertive,
    );
  }

  /// Construye la etiqueta semántica
  String _buildSemanticLabel(AppCurrencyInputValue? value, AppCurrencyInputState state) {
    final baseLabel = config.customLabel ?? 'Campo de entrada de moneda';

    if (value != null) {
      return '$baseLabel, cantidad actual ${_formatValueForAnnouncement(value)}';
    }

    return baseLabel;
  }

  /// Construye el hint semántico
  String? _buildSemanticHint(AppCurrencyInputValue? value, AppCurrencyInputState state) {
    final hints = <String>[];

    // Hint base
    if (config.customHint != null) {
      hints.add(config.customHint!);
    } else {
      hints.add('Ingrese una cantidad monetaria');
    }

    // Hints específicos del estado
    switch (state) {
      case AppCurrencyInputState.disabled:
        hints.add('Campo deshabilitado');
        break;
      case AppCurrencyInputState.loading:
        hints.add('Cargando');
        break;
      case AppCurrencyInputState.skeleton:
        hints.add('Contenido placeholder');
        break;
      case AppCurrencyInputState.focus:
        if (config.enableKeyboardIncrement) {
          hints.add('Use las flechas arriba y abajo para incrementar o decrementar');
        }
        break;
      default:
        break;
    }

    // Hints de navegación por teclado
    if (state == AppCurrencyInputState.focus && config.enableKeyboardActivation) {
      hints.add('Presione Enter para confirmar');
    }

    return hints.isNotEmpty ? hints.join('. ') : null;
  }

  /// Construye el valor semántico
  String? _buildSemanticValue(AppCurrencyInputValue? value, AppCurrencyInputState state) {
    if (value == null) return null;

    return _formatValueForAnnouncement(value);
  }

  /// Formatea el valor para anuncios de accesibilidad
  String _formatValueForAnnouncement(AppCurrencyInputValue value) {
    // Formato específico para lectores de pantalla
    final amount = value.amount;
    final currency = value.currencyCode;

    if (amount == 0) {
      return 'cero $currency';
    }

    final integerPart = amount.floor();
    final decimalPart = ((amount - integerPart) * 100).round();

    if (decimalPart == 0) {
      return '$integerPart $currency';
    } else {
      return '$integerPart $currency con $decimalPart centavos';
    }
  }

  /// Obtiene el anuncio para cambios de estado
  String? _getStateAnnouncement(AppCurrencyInputState state) {
    switch (state) {
      case AppCurrencyInputState.disabled:
        return 'Campo deshabilitado';
      case AppCurrencyInputState.loading:
        return 'Cargando';
      case AppCurrencyInputState.skeleton:
        return null; // No anunciar estados skeleton
      case AppCurrencyInputState.focus:
        return 'Campo enfocado';
      case AppCurrencyInputState.selected:
        return 'Valor seleccionado';
      case AppCurrencyInputState.hover:
        return null; // No anunciar hover para evitar spam
      case AppCurrencyInputState.pressed:
        return null; // No anunciar pressed para evitar spam
      case AppCurrencyInputState.defaultState:
        return null; // No anunciar estado por defecto
    }
  }

  /// Obtiene el anuncio para cambios de valor
  String? _getValueAnnouncement(AppCurrencyInputValue value) {
    return 'Nuevo valor: ${_formatValueForAnnouncement(value)}';
  }

  /// Obtiene el nivel de assertividad para anuncios de estado
  Assertiveness _getAnnouncementAssertiveness(AppCurrencyInputState state) {
    switch (state) {
      case AppCurrencyInputState.disabled:
      case AppCurrencyInputState.loading:
        return Assertiveness.assertive;
      default:
        return Assertiveness.polite;
    }
  }


  /// Proporciona texto de ayuda contextual
  String getContextualHelp(AppCurrencyInputState state) {
    switch (state) {
      case AppCurrencyInputState.focus:
        return 'Campo enfocado. Ingrese una cantidad monetaria. '
               '${config.enableKeyboardIncrement ? "Use flechas para incrementar/decrementar. " : ""}'
               '${config.enableKeyboardActivation ? "Presione Enter para confirmar." : ""}';

      case AppCurrencyInputState.selected:
        return 'Valor seleccionado. Puede modificar la cantidad o confirmar con Enter.';

      case AppCurrencyInputState.disabled:
        return 'Este campo está actualmente deshabilitado.';

      case AppCurrencyInputState.loading:
        return 'Procesando información. Por favor espere.';

      case AppCurrencyInputState.skeleton:
        return 'Cargando contenido del campo.';

      default:
        return 'Campo de entrada de moneda. Toque para ingresar una cantidad.';
    }
  }

  /// Proporciona instrucciones de uso para lectores de pantalla
  String getUsageInstructions() {
    final instructions = <String>[
      'Campo de entrada para cantidades monetarias.',
      'Ingrese números y puntos decimales.',
    ];

    if (config.enableKeyboardIncrement) {
      instructions.add('Use las flechas arriba y abajo para incrementar o decrementar valores.');
      instructions.add('Mantenga Shift presionado para cambios más rápidos.');
    }

    if (config.enableKeyboardActivation) {
      instructions.add('Presione Enter para confirmar la cantidad.');
    }

    if (config.enableKeyboardSelection) {
      instructions.add('Use Ctrl+A para seleccionar todo el texto.');
    }

    return instructions.join(' ');
  }
}