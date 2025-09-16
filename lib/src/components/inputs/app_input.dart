import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_styles.dart';
import 'validators.dart';
import '../../theme/app_theme.dart';

/// Componente de input personalizado para el Design System de IAutomat
///
/// AppInput es el componente base para todos los campos de entrada en la aplicación.
/// Proporciona una interfaz consistente y accesible con múltiples tipos,
/// estados y funcionalidades avanzadas.
///
/// Características:
/// - Múltiples tipos: text, email, password, number, multiline, search, url, phone
/// - Estados completos: normal, focused, error, disabled, readonly, success
/// - Validación integrada con FormField
/// - Soporte para prefijos y sufijos (iconos y widgets)
/// - Character counter opcional
/// - Clear button automático
/// - Password visibility toggle
/// - Accesibilidad completa
/// - Transiciones animadas entre estados
///
/// Ejemplo de uso:
/// ```dart
/// AppInput(
///   label: 'Email',
///   type: InputType.email,
///   validator: Validators.email(),
///   onChanged: (value) => print(value),
///   prefixIcon: Icons.email,
/// )
/// ```
class AppInput extends StatefulWidget {
  /// Controlador del texto del input
  final TextEditingController? controller;

  /// Valor inicial del input
  final String? initialValue;

  /// Label del input
  final String? label;

  /// Texto de hint
  final String? hint;

  /// Texto de ayuda
  final String? helper;

  /// Tipo de input
  final InputType type;

  /// Función de validación
  final String? Function(String?)? validator;

  /// Callback cuando cambia el valor
  final void Function(String)? onChanged;

  /// Callback cuando se envía el formulario
  final void Function(String)? onSubmitted;

  /// Callback cuando se toca el campo
  final VoidCallback? onTap;

  /// Si el input está habilitado
  final bool enabled;

  /// Si el input es de solo lectura
  final bool readOnly;

  /// Si se debe ocultar el texto (para contraseñas)
  final bool obscureText;

  /// Carácter de oscurecimiento
  final String obscuringCharacter;

  /// Longitud máxima del texto
  final int? maxLength;

  /// Número máximo de líneas
  final int? maxLines;

  /// Número mínimo de líneas (para multiline)
  final int? minLines;

  /// Si se debe mostrar el contador de caracteres
  final bool showCounter;

  /// Si se debe mostrar el botón de limpiar
  final bool showClearButton;

  /// Si se debe mostrar toggle de visibilidad (password)
  final bool showVisibilityToggle;

  /// Ícono de prefijo
  final IconData? prefixIcon;

  /// Widget personalizado de prefijo
  final Widget? prefixWidget;

  /// Texto de prefijo
  final String? prefixText;

  /// Ícono de sufijo
  final IconData? suffixIcon;

  /// Widget personalizado de sufijo
  final Widget? suffixWidget;

  /// Texto de sufijo
  final String? suffixText;

  /// Estilo personalizado del texto
  final TextStyle? style;

  /// Auto focus del input
  final bool autofocus;

  /// Acción del teclado
  final TextInputAction? textInputAction;

  /// Nodo de focus personalizado
  final FocusNode? focusNode;

  /// Formatters del input
  final List<TextInputFormatter>? inputFormatters;

  /// Si se debe auto validar
  final AutovalidateMode? autovalidateMode;

  /// Key para el FormField
  final Key? formFieldKey;

  /// Tooltip del input
  final String? tooltip;

  /// Label semántico para accesibilidad
  final String? semanticsLabel;

  /// Crear un AppInput
  const AppInput({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.helper,
    this.type = InputType.text,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '"',
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.showCounter = false,
    this.showClearButton = true,
    this.showVisibilityToggle = true,
    this.prefixIcon,
    this.prefixWidget,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixText,
    this.style,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.inputFormatters,
    this.autovalidateMode,
    this.formFieldKey,
    this.tooltip,
    this.semanticsLabel,
  }) : assert(
         controller == null || initialValue == null,
         'No se pueden proporcionar controller e initialValue al mismo tiempo',
       );

  /// Constructor para email
  const AppInput.email({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.helper,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.showCounter = false,
    this.showClearButton = true,
    this.prefixIcon,
    this.prefixWidget,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixText,
    this.style,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.inputFormatters,
    this.autovalidateMode,
    this.formFieldKey,
    this.tooltip,
    this.semanticsLabel,
  }) : type = InputType.email,
       obscureText = false,
       obscuringCharacter = '"',
       maxLines = 1,
       minLines = null,
       showVisibilityToggle = false;

  /// Constructor para password
  const AppInput.password({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.helper,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.obscuringCharacter = '"',
    this.maxLength,
    this.showCounter = false,
    this.showClearButton = false,
    this.showVisibilityToggle = true,
    this.prefixIcon,
    this.prefixWidget,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixText,
    this.style,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.inputFormatters,
    this.autovalidateMode,
    this.formFieldKey,
    this.tooltip,
    this.semanticsLabel,
  }) : type = InputType.password,
       obscureText = true,
       maxLines = 1,
       minLines = null;

  /// Constructor para multiline
  const AppInput.multiline({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.helper,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.showCounter = true,
    this.showClearButton = true,
    this.prefixIcon,
    this.prefixWidget,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixText,
    this.style,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.inputFormatters,
    this.autovalidateMode,
    this.formFieldKey,
    this.tooltip,
    this.semanticsLabel,
  }) : type = InputType.multiline,
       obscureText = false,
       obscuringCharacter = '"',
       showVisibilityToggle = false;

  /// Constructor para search
  const AppInput.search({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.helper,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.showCounter = false,
    this.showClearButton = true,
    this.prefixIcon,
    this.prefixWidget,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixText,
    this.style,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.inputFormatters,
    this.autovalidateMode,
    this.formFieldKey,
    this.tooltip,
    this.semanticsLabel,
  }) : type = InputType.search,
       obscureText = false,
       obscuringCharacter = '"',
       maxLines = 1,
       minLines = null,
       showVisibilityToggle = false;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _obscureText = false;
  bool _hasError = false;
  bool _hasSuccess = false;
  String _currentValue = '';

  @override
  void initState() {
    super.initState();

    // Inicializar controller
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _currentValue = _controller.text;

    // Inicializar focus node
    _focusNode = widget.focusNode ?? FocusNode();

    // Configurar obscureText para password
    _obscureText = widget.obscureText;

    // Escuchar cambios en el texto
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(AppInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Actualizar obscureText si cambió
    if (oldWidget.obscureText != widget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  void _handleTextChange() {
    final newValue = _controller.text;
    if (newValue != _currentValue) {
      setState(() {
        _currentValue = newValue;
      });
      widget.onChanged?.call(newValue);
    }
  }

  void _handleClear() {
    _controller.clear();
    widget.onChanged?.call('');
    _focusNode.requestFocus();
  }

  void _handleVisibilityToggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _handleSubmitted(String value) {
    widget.onSubmitted?.call(value);
  }

  void _handleValidationChange(String? error) {
    final hasError = error != null;
    final hasSuccess = error == null && _currentValue.isNotEmpty;

    if (_hasError != hasError || _hasSuccess != hasSuccess) {
      setState(() {
        _hasError = hasError;
        _hasSuccess = hasSuccess;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Determinar estado del input
    final inputState = AppInputStyles.getInputState(
      hasError: _hasError,
      isFocused: _focusNode.hasFocus,
      isEnabled: widget.enabled,
      isReadOnly: widget.readOnly,
      hasSuccess: _hasSuccess,
    );

    // Configurar teclado y formatters
    final keyboardType = AppInputStyles.getKeyboardType(widget.type);
    final textInputAction = widget.textInputAction ??
        AppInputStyles.getTextInputAction(widget.type, widget.type == InputType.multiline);

    // Configurar máximo de líneas
    final maxLines = widget.type == InputType.multiline
        ? (widget.maxLines ?? 4)
        : (widget.maxLines ?? 1);

    final minLines = widget.type == InputType.multiline
        ? (widget.minLines ?? 2)
        : null;

    // Construir sufijos
    final suffixWidgets = _buildSuffixWidgets(inputState, isDark);

    // Construir decoración
    final decoration = AppInputStyles.getDecoration(
      state: inputState,
      isDark: isDark,
      label: widget.label,
      hint: widget.hint,
      helper: widget.helper,
      prefixIcon: _buildPrefixIcon(inputState, isDark),
      suffixIcon: suffixWidgets,
      prefixText: widget.prefixText,
      suffixText: widget.suffixText,
      prefix: widget.prefixWidget,
      suffix: widget.suffixWidget,
      showCounter: widget.showCounter,
      maxLength: widget.maxLength,
      currentLength: _currentValue.length,
    );

    // FormField para validación
    Widget textField = TextFormField(
      key: widget.formFieldKey,
      controller: _controller,
      focusNode: _focusNode,
      decoration: decoration,
      style: widget.style,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: _obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      maxLength: widget.maxLength,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: (value) {
        final error = widget.validator?.call(value);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleValidationChange(error);
        });
        return error;
      },
      onFieldSubmitted: _handleSubmitted,
      onTap: widget.onTap,
      buildCounter: widget.showCounter ? null : (context, {required currentLength, required isFocused, maxLength}) => null,
    );

    // Wrapper con tooltip
    if (widget.tooltip != null) {
      textField = Tooltip(
        message: widget.tooltip!,
        child: textField,
      );
    }

    // Wrapper con semántica
    if (widget.semanticsLabel != null) {
      textField = Semantics(
        label: widget.semanticsLabel,
        child: textField,
      );
    }

    return textField;
  }

  /// Construye el ícono de prefijo
  Widget? _buildPrefixIcon(InputState state, bool isDark) {
    if (widget.prefixWidget != null) return null;
    if (widget.prefixIcon != null) {
      return AppInputStyles.animatedIcon(
        icon: widget.prefixIcon!,
        state: state,
        isDark: isDark,
      );
    }

    // Ícono por defecto según el tipo
    final defaultIcon = AppInputStyles.getDefaultIcon(widget.type);
    if (defaultIcon != null) {
      return AppInputStyles.animatedIcon(
        icon: defaultIcon,
        state: state,
        isDark: isDark,
      );
    }

    return null;
  }

  /// Construye los widgets de sufijo
  Widget? _buildSuffixWidgets(InputState state, bool isDark) {
    final List<Widget> suffixes = [];

    // Clear button
    if (AppInputStyles.shouldShowClearButton(
      text: _currentValue,
      isFocused: _focusNode.hasFocus,
      showClearButton: widget.showClearButton,
      type: widget.type,
    )) {
      suffixes.add(
        AppInputStyles.animatedIcon(
          icon: Icons.clear,
          state: state,
          isDark: isDark,
          size: 20,
          onTap: _handleClear,
        ),
      );
    }

    // Password visibility toggle
    if (widget.type == InputType.password && widget.showVisibilityToggle) {
      suffixes.add(
        AppInputStyles.animatedIcon(
          icon: _obscureText ? Icons.visibility : Icons.visibility_off,
          state: state,
          isDark: isDark,
          size: 20,
          onTap: _handleVisibilityToggle,
        ),
      );
    }

    // Sufijo personalizado
    if (widget.suffixWidget != null) {
      suffixes.add(widget.suffixWidget!);
    } else if (widget.suffixIcon != null) {
      suffixes.add(
        AppInputStyles.animatedIcon(
          icon: widget.suffixIcon!,
          state: state,
          isDark: isDark,
        ),
      );
    }

    if (suffixes.isEmpty) return null;
    if (suffixes.length == 1) return suffixes.first;

    // Múltiples sufijos en fila
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: suffixes,
    );
  }
}

// ==========================================================================
// EXTENSIONES ÚTILES
// ==========================================================================

/// Extensión para facilitar el uso de AppInput
extension AppInputExtension on AppInput {
  /// Crea una copia del input con propiedades modificadas
  AppInput copyWith({
    Key? key,
    TextEditingController? controller,
    String? initialValue,
    String? label,
    String? hint,
    String? helper,
    InputType? type,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    void Function(String)? onSubmitted,
    VoidCallback? onTap,
    bool? enabled,
    bool? readOnly,
    bool? obscureText,
    String? obscuringCharacter,
    int? maxLength,
    int? maxLines,
    int? minLines,
    bool? showCounter,
    bool? showClearButton,
    bool? showVisibilityToggle,
    IconData? prefixIcon,
    Widget? prefixWidget,
    String? prefixText,
    IconData? suffixIcon,
    Widget? suffixWidget,
    String? suffixText,
    TextStyle? style,
    bool? autofocus,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    AutovalidateMode? autovalidateMode,
    Key? formFieldKey,
    String? tooltip,
    String? semanticsLabel,
  }) {
    return AppInput(
      key: key ?? this.key,
      controller: controller ?? this.controller,
      initialValue: initialValue ?? this.initialValue,
      label: label ?? this.label,
      hint: hint ?? this.hint,
      helper: helper ?? this.helper,
      type: type ?? this.type,
      validator: validator ?? this.validator,
      onChanged: onChanged ?? this.onChanged,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onTap: onTap ?? this.onTap,
      enabled: enabled ?? this.enabled,
      readOnly: readOnly ?? this.readOnly,
      obscureText: obscureText ?? this.obscureText,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      maxLength: maxLength ?? this.maxLength,
      maxLines: maxLines ?? this.maxLines,
      minLines: minLines ?? this.minLines,
      showCounter: showCounter ?? this.showCounter,
      showClearButton: showClearButton ?? this.showClearButton,
      showVisibilityToggle: showVisibilityToggle ?? this.showVisibilityToggle,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      prefixWidget: prefixWidget ?? this.prefixWidget,
      prefixText: prefixText ?? this.prefixText,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      suffixWidget: suffixWidget ?? this.suffixWidget,
      suffixText: suffixText ?? this.suffixText,
      style: style ?? this.style,
      autofocus: autofocus ?? this.autofocus,
      textInputAction: textInputAction ?? this.textInputAction,
      focusNode: focusNode ?? this.focusNode,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      formFieldKey: formFieldKey ?? this.formFieldKey,
      tooltip: tooltip ?? this.tooltip,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
    );
  }
}

// ==========================================================================
// WIDGETS DE CONVENIENCIA
// ==========================================================================

/// Grupo de inputs con spacing automático
class AppInputGroup extends StatelessWidget {
  /// Lista de inputs a mostrar
  final List<Widget> children;

  /// Espaciado entre inputs
  final double spacing;

  /// Crear un grupo de inputs
  const AppInputGroup({
    super.key,
    required this.children,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index < children.length - 1 ? spacing : 0,
          ),
          child: child,
        );
      }).toList(),
    );
  }
}