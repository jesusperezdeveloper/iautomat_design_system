import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms_config.dart';

/// Helper de accesibilidad para DSCheckoutForms
///
/// Proporciona soporte completo para accesibilidad, incluyendo:
/// - Navegación por teclado
/// - Soporte para lectores de pantalla
/// - Etiquetas semánticas
/// - Anuncios de cambios de estado
/// - Soporte RTL
class DSCheckoutFormsA11yHelper {
  /// Construye un wrapper semántico para el formulario
  Widget buildSemanticWrapper({
    required DSCheckoutFormsConfig config,
    required DSCheckoutState state,
    required DSCheckoutFormData formData,
    required Widget child,
  }) {
    final a11yConfig = config.a11yConfig ?? const DSCheckoutA11yConfig();

    if (!a11yConfig.enabled) {
      return child;
    }

    return Semantics(
      label: a11yConfig.formSemanticLabel,
      container: true,
      enabled: state.isInteractive,
      child: ExcludeSemantics(
        excluding: false,
        child: child,
      ),
    );
  }

  /// Construye etiquetas semánticas para un campo
  Widget buildFieldSemantics({
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    required DSCheckoutA11yConfig a11yConfig,
    required Widget child,
  }) {
    final validation = formData.validations[field.key];
    final hasError = validation?.isValid == false;
    final isValid = validation?.isValid == true;

    String semanticLabel = field.label;
    if (field.required && a11yConfig.enableSemanticLabels) {
      semanticLabel += ', ${a11yConfig.requiredFieldSemanticLabel}';
    }

    String? semanticHint;
    if (field.helperText != null && a11yConfig.enableHints) {
      semanticHint = field.helperText;
    }

    String? liveRegionAnnouncement;
    if (hasError && a11yConfig.announceErrors) {
      liveRegionAnnouncement = validation?.errorMessage;
    } else if (isValid && a11yConfig.announceSuccess) {
      liveRegionAnnouncement = a11yConfig.validFieldSemanticLabel;
    }

    return MergeSemantics(
      child: Semantics(
        label: semanticLabel,
        hint: semanticHint,
        textField: _isTextualField(field.type),
        enabled: field.enabled,
        focusable: field.enabled,
        focused: false, // Se actualiza dinámicamente
        readOnly: field.readonly,
        obscured: field.sensitive,
        liveRegion: a11yConfig.enableLiveRegions && liveRegionAnnouncement != null,
        child: child,
      ),
    );
  }

  /// Maneja la navegación por teclado
  KeyEventResult handleKeyEvent(
    KeyEvent event, {
    required List<DSCheckoutField> fields,
    required Map<String, FocusNode> focusNodes,
    String? currentFocusedField,
    VoidCallback? onSubmit,
    Function(String)? onFieldFocus,
  }) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.tab:
        return _handleTabNavigation(
          event,
          fields: fields,
          focusNodes: focusNodes,
          currentFocusedField: currentFocusedField,
          onFieldFocus: onFieldFocus,
        );

      case LogicalKeyboardKey.enter:
        return _handleEnterKey(
          fields: fields,
          focusNodes: focusNodes,
          currentFocusedField: currentFocusedField,
          onSubmit: onSubmit,
          onFieldFocus: onFieldFocus,
        );

      case LogicalKeyboardKey.escape:
        return _handleEscapeKey(focusNodes: focusNodes);

      case LogicalKeyboardKey.arrowUp:
      case LogicalKeyboardKey.arrowDown:
        return _handleArrowNavigation(
          event.logicalKey,
          fields: fields,
          focusNodes: focusNodes,
          currentFocusedField: currentFocusedField,
          onFieldFocus: onFieldFocus,
        );

      default:
        return KeyEventResult.ignored;
    }
  }

  /// Maneja la navegación con Tab
  KeyEventResult _handleTabNavigation(
    KeyEvent event, {
    required List<DSCheckoutField> fields,
    required Map<String, FocusNode> focusNodes,
    String? currentFocusedField,
    Function(String)? onFieldFocus,
  }) {
    final isShiftPressed = event.logicalKey == LogicalKeyboardKey.tab &&
        HardwareKeyboard.instance.logicalKeysPressed.contains(LogicalKeyboardKey.shift);

    final enabledFields = fields.where((field) => field.enabled).toList();

    if (enabledFields.isEmpty) return KeyEventResult.ignored;

    int currentIndex = -1;
    if (currentFocusedField != null) {
      currentIndex = enabledFields.indexWhere((field) => field.key == currentFocusedField);
    }

    int nextIndex;
    if (isShiftPressed) {
      // Navegación hacia atrás
      nextIndex = currentIndex <= 0 ? enabledFields.length - 1 : currentIndex - 1;
    } else {
      // Navegación hacia adelante
      nextIndex = currentIndex >= enabledFields.length - 1 ? 0 : currentIndex + 1;
    }

    final nextField = enabledFields[nextIndex];
    focusNodes[nextField.key]?.requestFocus();
    onFieldFocus?.call(nextField.key);

    return KeyEventResult.handled;
  }

  /// Maneja la tecla Enter
  KeyEventResult _handleEnterKey({
    required List<DSCheckoutField> fields,
    required Map<String, FocusNode> focusNodes,
    String? currentFocusedField,
    VoidCallback? onSubmit,
    Function(String)? onFieldFocus,
  }) {
    if (currentFocusedField == null) {
      onSubmit?.call();
      return KeyEventResult.handled;
    }

    final currentField = fields.firstWhere(
      (field) => field.key == currentFocusedField,
      orElse: () => fields.first,
    );

    // Si es un campo de múltiples líneas, permite nueva línea
    if (currentField.maxLines > 1) {
      return KeyEventResult.ignored;
    }

    // Buscar el siguiente campo habilitado
    final enabledFields = fields.where((field) => field.enabled).toList();
    final currentIndex = enabledFields.indexWhere((field) => field.key == currentFocusedField);

    if (currentIndex < enabledFields.length - 1) {
      // Ir al siguiente campo
      final nextField = enabledFields[currentIndex + 1];
      focusNodes[nextField.key]?.requestFocus();
      onFieldFocus?.call(nextField.key);
    } else {
      // Es el último campo, enviar formulario
      onSubmit?.call();
    }

    return KeyEventResult.handled;
  }

  /// Maneja la tecla Escape
  KeyEventResult _handleEscapeKey({
    required Map<String, FocusNode> focusNodes,
  }) {
    // Quitar el foco de todos los campos
    for (final focusNode in focusNodes.values) {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
        break;
      }
    }
    return KeyEventResult.handled;
  }

  /// Maneja la navegación con flechas
  KeyEventResult _handleArrowNavigation(
    LogicalKeyboardKey key, {
    required List<DSCheckoutField> fields,
    required Map<String, FocusNode> focusNodes,
    String? currentFocusedField,
    Function(String)? onFieldFocus,
  }) {
    if (currentFocusedField == null) return KeyEventResult.ignored;

    final enabledFields = fields.where((field) => field.enabled).toList();
    final currentIndex = enabledFields.indexWhere((field) => field.key == currentFocusedField);

    if (currentIndex == -1) return KeyEventResult.ignored;

    int nextIndex;
    if (key == LogicalKeyboardKey.arrowUp) {
      nextIndex = currentIndex <= 0 ? enabledFields.length - 1 : currentIndex - 1;
    } else {
      nextIndex = currentIndex >= enabledFields.length - 1 ? 0 : currentIndex + 1;
    }

    final nextField = enabledFields[nextIndex];
    focusNodes[nextField.key]?.requestFocus();
    onFieldFocus?.call(nextField.key);

    return KeyEventResult.handled;
  }

  /// Anuncia cambios de estado para lectores de pantalla
  void announceStateChange({
    required DSCheckoutState state,
    required DSCheckoutA11yConfig a11yConfig,
  }) {
    if (!a11yConfig.enabled || !a11yConfig.supportScreenReader) return;

    String announcement;
    switch (state) {
      case DSCheckoutState.loading:
        announcement = 'Procesando formulario';
        break;
      case DSCheckoutState.disabled:
        announcement = 'Formulario deshabilitado';
        break;
      case DSCheckoutState.skeleton:
        announcement = 'Cargando formulario';
        break;
      default:
        return;
    }

    SemanticsService.announce(announcement, TextDirection.ltr);
  }

  /// Anuncia errores de validación
  void announceValidationError({
    required String fieldLabel,
    required String errorMessage,
    required DSCheckoutA11yConfig a11yConfig,
  }) {
    if (!a11yConfig.enabled || !a11yConfig.announceErrors) return;

    final announcement = 'Error en $fieldLabel: $errorMessage';
    SemanticsService.announce(announcement, TextDirection.ltr);
  }

  /// Anuncia éxito de validación
  void announceValidationSuccess({
    required String fieldLabel,
    required DSCheckoutA11yConfig a11yConfig,
  }) {
    if (!a11yConfig.enabled || !a11yConfig.announceSuccess) return;

    final announcement = '$fieldLabel validado correctamente';
    SemanticsService.announce(announcement, TextDirection.ltr);
  }

  /// Anuncia envío del formulario
  void announceFormSubmission({
    required DSCheckoutVariant variant,
    required DSCheckoutA11yConfig a11yConfig,
  }) {
    if (!a11yConfig.enabled || !a11yConfig.announceSuccess) return;

    String announcement;
    switch (variant) {
      case DSCheckoutVariant.address:
        announcement = 'Información de dirección enviada correctamente';
        break;
      case DSCheckoutVariant.payment:
        announcement = 'Información de pago procesada correctamente';
        break;
    }

    SemanticsService.announce(announcement, TextDirection.ltr);
  }

  /// Anuncia errores generales
  void announceError(String error) {
    SemanticsService.announce('Error: $error', TextDirection.ltr);
  }

  /// Resuelve la dirección del texto basada en el contexto
  TextDirection resolveTextDirection(BuildContext context) {
    return Directionality.of(context);
  }

  /// Determina si un campo es de tipo textual
  bool _isTextualField(DSCheckoutFieldType type) {
    switch (type) {
      case DSCheckoutFieldType.text:
      case DSCheckoutFieldType.email:
      case DSCheckoutFieldType.phone:
      case DSCheckoutFieldType.password:
      case DSCheckoutFieldType.number:
      case DSCheckoutFieldType.creditCard:
      case DSCheckoutFieldType.expiryDate:
      case DSCheckoutFieldType.cvv:
      case DSCheckoutFieldType.postalCode:
        return true;
      case DSCheckoutFieldType.dropdown:
      case DSCheckoutFieldType.checkbox:
      case DSCheckoutFieldType.radio:
      case DSCheckoutFieldType.datePicker:
      case DSCheckoutFieldType.country:
      case DSCheckoutFieldType.state:
      case DSCheckoutFieldType.city:
        return false;
    }
  }

  /// Crea un callback de focus compatible con a11y
  Function(bool) createA11yFocusCallback({
    required String fieldKey,
    required DSCheckoutField field,
    required DSCheckoutA11yConfig a11yConfig,
    Function(String, bool)? originalCallback,
  }) {
    return (bool hasFocus) {
      originalCallback?.call(fieldKey, hasFocus);

      if (hasFocus && a11yConfig.enabled && a11yConfig.supportScreenReader) {
        String announcement = 'Enfocado en ${field.label}';
        if (field.required) {
          announcement += ', campo requerido';
        }
        if (field.helperText != null) {
          announcement += ', ${field.helperText}';
        }

        SemanticsService.announce(announcement, TextDirection.ltr);
      }
    };
  }

  /// Crea etiquetas semánticas para botones
  Widget buildButtonSemantics({
    required String label,
    required bool enabled,
    required DSCheckoutA11yConfig a11yConfig,
    required Widget child,
    String? hint,
  }) {
    if (!a11yConfig.enabled) return child;

    return Semantics(
      label: label,
      hint: hint,
      button: true,
      enabled: enabled,
      focusable: enabled,
      child: child,
    );
  }

  /// Crea wrapper para soporte RTL
  Widget buildRTLWrapper({
    required BuildContext context,
    required Widget child,
  }) {
    final isRTL = resolveTextDirection(context) == TextDirection.rtl;

    if (!isRTL) return child;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: child,
    );
  }

  /// Construye overlay de carga accesible
  Widget buildAccessibleLoadingOverlay({
    required bool isLoading,
    required DSCheckoutA11yConfig a11yConfig,
    required Widget child,
    String? loadingMessage,
  }) {
    if (!isLoading) return child;

    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: Center(
                child: Semantics(
                  label: loadingMessage ?? 'Procesando',
                  liveRegion: a11yConfig.enableLiveRegions,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Construye indicadores de validación accesibles
  Widget buildValidationIndicator({
    required DSCheckoutFieldValidation? validation,
    required DSCheckoutA11yConfig a11yConfig,
  }) {
    if (validation == null || !a11yConfig.enabled) {
      return const SizedBox.shrink();
    }

    IconData? icon;
    Color? color;
    String? semanticLabel;

    if (validation.isValid) {
      icon = Icons.check_circle;
      color = Colors.green;
      semanticLabel = a11yConfig.validFieldSemanticLabel;
    } else {
      icon = Icons.error;
      color = Colors.red;
      semanticLabel = a11yConfig.errorFieldSemanticLabel;
    }

    return Semantics(
      label: semanticLabel,
      child: Icon(
        icon,
        color: color,
        size: 16,
      ),
    );
  }

  /// Crea un wrapper para manejar gestos accesibles
  Widget buildGestureWrapper({
    required Widget child,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
  }) {
    return MergeSemantics(
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }

  /// Construye tooltip accesible
  Widget buildAccessibleTooltip({
    required String message,
    required Widget child,
    required DSCheckoutA11yConfig a11yConfig,
  }) {
    if (!a11yConfig.enabled || !a11yConfig.enableHints) {
      return child;
    }

    return Tooltip(
      message: message,
      child: Semantics(
        tooltip: message,
        child: child,
      ),
    );
  }

  /// Construye separadores semánticos
  Widget buildSemanticDivider({
    required String label,
    Widget? child,
  }) {
    return Semantics(
      label: label,
      container: true,
      child: child ?? const Divider(),
    );
  }

  /// Valida y sanitiza entrada de texto para a11y
  String sanitizeTextForA11y(String? text) {
    if (text == null || text.isEmpty) return '';

    // Remover caracteres problemáticos para lectores de pantalla
    return text
        .replaceAll(RegExp(r'[^\w\s\-.,\:\;\!\?()]+'), '')
        .trim();
  }

  /// Crea anuncios programáticos para cambios dinámicos
  void announceDataChange({
    required String description,
    required TextDirection textDirection,
  }) {
    SemanticsService.announce(description, textDirection);
  }

  /// Construye regiones en vivo para cambios de estado
  Widget buildLiveRegion({
    required String announcement,
    required bool isActive,
    required Widget child,
  }) {
    return Semantics(
      liveRegion: isActive,
      label: isActive ? announcement : null,
      child: child,
    );
  }
}