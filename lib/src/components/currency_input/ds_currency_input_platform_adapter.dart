import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:iautomat_design_system/src/components/currency_input/ds_currency_input_config.dart';

/// Adaptador que maneja las diferencias específicas de cada plataforma
/// para la entrada de moneda
///
/// Proporciona:
/// - Componentes nativos para cada plataforma
/// - Formateo específico por plataforma
/// - Teclados optimizados
/// - Indicadores de carga nativos
class DSCurrencyInputPlatformAdapter {
  /// Construye el input de moneda usando el componente apropiado para la plataforma
  Widget buildCurrencyInput({
    required BuildContext context,
    required DSCurrencyInputConfig config,
    required TextEditingController controller,
    required FocusNode focusNode,
    required DSCurrencyInputValue? currentValue,
    required DSCurrencyInputState state,
    required DSCurrencyInputColors colors,
    required DSCurrencyInputSpacing spacing,
    String? label,
    String? hint,
    String? helperText,
    String? errorText,
    bool enabled = true,
    bool readOnly = false,
    bool autoFocus = false,
    ui.TextDirection? textDirection,
    TextInputAction? textInputAction,
    Widget? prefix,
    Widget? suffix,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? Function(DSCurrencyInputValue?)? validator,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
  }) {
    final variant = _resolveVariant(config.variant);

    switch (variant) {
      case DSCurrencyInputVariant.localized:
        return _buildLocalizedInput(
          context: context,
          config: config,
          controller: controller,
          focusNode: focusNode,
          currentValue: currentValue,
          state: state,
          colors: colors,
          spacing: spacing,
          label: label,
          hint: hint,
          helperText: helperText,
          errorText: errorText,
          enabled: enabled,
          readOnly: readOnly,
          autoFocus: autoFocus,
          textDirection: textDirection,
          textInputAction: textInputAction,
          prefix: prefix,
          suffix: suffix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          validator: validator,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
        );
    }
  }

  /// Construye un indicador de carga específico de la plataforma
  Widget buildLoadingIndicator(BuildContext context, DSCurrencyInputColors colors) {
    if (kIsWeb) {
      return _buildWebLoadingIndicator(colors);
    } else if (Platform.isIOS) {
      return _buildIOSLoadingIndicator(colors);
    } else {
      return _buildAndroidLoadingIndicator(colors);
    }
  }

  /// Resuelve la variante según la plataforma actual
  DSCurrencyInputVariant _resolveVariant(DSCurrencyInputVariant variant) {
    // Por ahora solo tenemos una variante, pero esto permite extensibilidad
    return variant;
  }

  /// Construye el input localizado usando Material Design
  Widget _buildLocalizedInput({
    required BuildContext context,
    required DSCurrencyInputConfig config,
    required TextEditingController controller,
    required FocusNode focusNode,
    required DSCurrencyInputValue? currentValue,
    required DSCurrencyInputState state,
    required DSCurrencyInputColors colors,
    required DSCurrencyInputSpacing spacing,
    String? label,
    String? hint,
    String? helperText,
    String? errorText,
    bool enabled = true,
    bool readOnly = false,
    bool autoFocus = false,
    ui.TextDirection? textDirection,
    TextInputAction? textInputAction,
    Widget? prefix,
    Widget? suffix,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? Function(DSCurrencyInputValue?)? validator,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
  }) {
    final theme = Theme.of(context);
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: hasError
                  ? colors.errorColor
                  : state == DSCurrencyInputState.focus
                      ? colors.focusedBorderColor
                      : enabled
                          ? colors.labelColor
                          : colors.disabledLabelColor ?? Colors.grey,
            ),
          ),
          SizedBox(height: spacing.labelSpacing),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          readOnly: readOnly,
          autofocus: autoFocus,
          textDirection: textDirection,
          textInputAction: textInputAction ?? _getDefaultTextInputAction(),
          keyboardType: _getCurrencyKeyboardType(),
          inputFormatters: _getCurrencyInputFormatters(config),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: enabled ? colors.textColor : colors.disabledTextColor ?? Colors.grey,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: _buildPrefixIcon(prefixIcon, colors, enabled),
            suffixIcon: _buildSuffixIcon(suffixIcon, colors, enabled),
            prefix: prefix,
            suffix: suffix,
            filled: true,
            fillColor: enabled
                ? colors.backgroundColor
                : colors.disabledBackgroundColor ?? Colors.grey.shade100,
            contentPadding: spacing.contentPadding,
            border: _buildBorder(colors.borderColor ?? Colors.grey, spacing),
            enabledBorder: _buildBorder(colors.borderColor ?? Colors.grey, spacing),
            focusedBorder: _buildBorder(colors.focusedBorderColor ?? Colors.blue, spacing, spacing.focusBorderWidth),
            errorBorder: _buildBorder(colors.errorBorderColor ?? Colors.red, spacing),
            focusedErrorBorder: _buildBorder(colors.errorBorderColor ?? Colors.red, spacing, spacing.focusBorderWidth),
            disabledBorder: _buildBorder(colors.disabledBorderColor ?? Colors.grey.shade300, spacing),
            errorText: errorText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: enabled ? colors.hintColor : colors.disabledTextColor ?? Colors.grey,
            ),
            errorStyle: theme.textTheme.bodySmall?.copyWith(
              color: colors.errorColor,
            ),
          ),
          onFieldSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
        ),
        if (helperText != null && errorText == null) ...[
          SizedBox(height: spacing.helperSpacing),
          Text(
            helperText,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.helperColor ?? Colors.grey,
            ),
          ),
        ],
      ],
    );
  }

  /// Construye el icono de prefijo
  Widget? _buildPrefixIcon(IconData? icon, DSCurrencyInputColors colors, bool enabled) {
    if (icon == null) return null;

    return Icon(
      icon,
      color: enabled ? colors.textColor : colors.disabledTextColor ?? Colors.grey,
      size: 20,
    );
  }

  /// Construye el icono de sufijo
  Widget? _buildSuffixIcon(IconData? icon, DSCurrencyInputColors colors, bool enabled) {
    if (icon == null) return null;

    return Icon(
      icon,
      color: enabled ? colors.textColor : colors.disabledTextColor ?? Colors.grey,
      size: 20,
    );
  }

  /// Construye el borde del input
  OutlineInputBorder _buildBorder(Color color, DSCurrencyInputSpacing spacing, [double? width]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(spacing.borderRadius),
      borderSide: BorderSide(
        color: color,
        width: width ?? spacing.borderWidth,
      ),
    );
  }

  /// Obtiene el tipo de teclado apropiado para moneda
  TextInputType _getCurrencyKeyboardType() {
    return const TextInputType.numberWithOptions(decimal: true);
  }

  /// Obtiene la acción de teclado por defecto
  TextInputAction _getDefaultTextInputAction() {
    return TextInputAction.done;
  }

  /// Obtiene los formateadores de entrada para moneda
  List<TextInputFormatter> _getCurrencyInputFormatters(DSCurrencyInputConfig config) {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
      _CurrencyInputFormatter(config),
    ];
  }

  /// Construye indicador de carga para iOS
  Widget _buildIOSLoadingIndicator(DSCurrencyInputColors colors) {
    return CupertinoActivityIndicator(
      radius: 8,
      color: colors.textColor,
    );
  }

  /// Construye indicador de carga para Android
  Widget _buildAndroidLoadingIndicator(DSCurrencyInputColors colors) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(colors.textColor),
      ),
    );
  }

  /// Construye indicador de carga para Web
  Widget _buildWebLoadingIndicator(DSCurrencyInputColors colors) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(colors.textColor),
      ),
    );
  }
}

/// Formateador personalizado para entrada de moneda
class _CurrencyInputFormatter extends TextInputFormatter {
  final DSCurrencyInputConfig config;

  _CurrencyInputFormatter(this.config);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Permitir borrar todo el texto
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Filtrar solo números y separadores decimales
    final filtered = newValue.text.replaceAll(RegExp(r'[^0-9.,]'), '');

    // Limitar la cantidad de decimales
    final decimalDigits = _getDecimalDigits();
    final parts = filtered.split(RegExp(r'[.,]'));

    if (parts.length > 2) {
      // Si hay múltiples separadores decimales, conservar solo el primero
      final integerPart = parts[0];
      final decimalPart = parts[1];
      final limitedDecimal = decimalPart.length > decimalDigits
          ? decimalPart.substring(0, decimalDigits)
          : decimalPart;

      final formattedText = '$integerPart.$limitedDecimal';

      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(
          offset: formattedText.length.clamp(0, formattedText.length),
        ),
      );
    } else if (parts.length == 2) {
      // Limitar decimales
      final integerPart = parts[0];
      final decimalPart = parts[1];
      final limitedDecimal = decimalPart.length > decimalDigits
          ? decimalPart.substring(0, decimalDigits)
          : decimalPart;

      final formattedText = '$integerPart.$limitedDecimal';

      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(
          offset: formattedText.length.clamp(0, formattedText.length),
        ),
      );
    }

    // Solo parte entera
    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(
        offset: filtered.length.clamp(0, filtered.length),
      ),
    );
  }

  int _getDecimalDigits() {
    return 2; // Por defecto 2 decimales para monedas
  }
}