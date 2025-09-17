import 'package:flutter/material.dart';

/// Sistema de bordes para el Design System de IAutomat
///
/// Define bordes reutilizables con radio consistente siguiendo
/// las guías de Material Design 3.
class AppBorders {
  AppBorders._();

  // ==========================================================================
  // BORDER RADIUS PRESETS
  // ==========================================================================

  /// Sin borde redondeado
  static const BorderRadius none = BorderRadius.zero;

  /// Bordes extra small - 2px
  static const BorderRadius xs = BorderRadius.all(Radius.circular(2));

  /// Bordes small - 4px
  static const BorderRadius small = BorderRadius.all(Radius.circular(4));

  /// Bordes medium - 8px
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8));

  /// Bordes large - 12px
  static const BorderRadius large = BorderRadius.all(Radius.circular(12));

  /// Bordes extra large - 16px
  static const BorderRadius xl = BorderRadius.all(Radius.circular(16));

  /// Bordes extra extra large - 24px
  static const BorderRadius xxl = BorderRadius.all(Radius.circular(24));

  /// Circular - 50% del ancho/alto
  static const BorderRadius circular = BorderRadius.all(Radius.circular(999));

  // ==========================================================================
  // BORDER RADIUS ESPECÍFICOS
  // ==========================================================================

  /// Bordes para botones
  static const BorderRadius button = medium;

  /// Bordes para cards
  static const BorderRadius card = large;

  /// Bordes para chips
  static const BorderRadius chip = large;

  /// Bordes para inputs
  static const BorderRadius input = medium;

  /// Bordes para dialogs
  static const BorderRadius dialog = xl;

  /// Bordes para modales
  static const BorderRadius modal = xl;

  /// Bordes para tooltips
  static const BorderRadius tooltip = small;
}