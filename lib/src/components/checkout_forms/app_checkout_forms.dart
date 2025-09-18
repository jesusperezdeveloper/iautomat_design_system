import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms_config.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms_platform_adapter.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms_a11y_helper.dart';

/// Widget de formularios de checkout del Design System
///
/// Proporciona formularios adaptativos para direcciones y pagos
/// con validación completa, accesibilidad y soporte multiplataforma
class AppCheckoutForms extends StatefulWidget {
  /// Configuración completa del formulario
  final AppCheckoutFormsConfig? config;

  /// Lista de campos del formulario
  final List<AppCheckoutField> fields;

  /// Variante del formulario (address o payment)
  final AppCheckoutVariant? variant;

  /// Estado inicial del formulario
  final AppCheckoutState? initialState;

  /// Validadores personalizados por campo
  final Map<String, String Function(String?)>? validators;

  /// Callback cuando se envía el formulario
  final Function(AppCheckoutFormData)? onSubmit;

  /// Callback cuando cambia un campo
  final Function(String fieldKey, dynamic value)? onFieldChanged;

  /// Callback cuando cambia la validación
  final Function(AppCheckoutFormData)? onValidationChanged;

  /// Valores iniciales del formulario
  final Map<String, dynamic>? initialValues;

  /// Si debe auto-enfocar el primer campo
  final bool autoFocus;

  /// Si debe validar automáticamente
  final bool autoValidate;

  /// Texto del botón de envío
  final String? submitButtonText;

  /// Widget personalizado para el botón de envío
  final Widget? customSubmitButton;

  /// Si mostrar el botón de envío
  final bool showSubmitButton;

  /// Si el formulario es de solo lectura
  final bool readOnly;

  /// Estilo personalizado para campos específicos
  final Map<String, InputDecoration>? fieldDecorations;

  /// Controladores personalizados para campos específicos
  final Map<String, TextEditingController>? fieldControllers;

  /// Nodos de enfoque personalizados para campos específicos
  final Map<String, FocusNode>? fieldFocusNodes;

  const AppCheckoutForms({
    super.key,
    this.config,
    required this.fields,
    this.variant,
    this.initialState,
    this.validators,
    this.onSubmit,
    this.onFieldChanged,
    this.onValidationChanged,
    this.initialValues,
    this.autoFocus = false,
    this.autoValidate = true,
    this.submitButtonText,
    this.customSubmitButton,
    this.showSubmitButton = true,
    this.readOnly = false,
    this.fieldDecorations,
    this.fieldControllers,
    this.fieldFocusNodes,
  });

  /// Crea un formulario de dirección predefinido
  factory AppCheckoutForms.address({
    Key? key,
    AppCheckoutFormsConfig? config,
    List<AppCheckoutField>? customFields,
    Map<String, String Function(String?)>? validators,
    Function(AppCheckoutFormData)? onSubmit,
    Function(String, dynamic)? onFieldChanged,
    Function(AppCheckoutFormData)? onValidationChanged,
    Map<String, dynamic>? initialValues,
    bool autoFocus = false,
    bool autoValidate = true,
    String? submitButtonText,
    Widget? customSubmitButton,
    bool showSubmitButton = true,
    bool readOnly = false,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, TextEditingController>? fieldControllers,
    Map<String, FocusNode>? fieldFocusNodes,
  }) {
    return AppCheckoutForms(
      key: key,
      config: config ?? const AppCheckoutFormsConfig(variant: AppCheckoutVariant.address),
      fields: customFields ?? AppCheckoutVariant.address.defaultFields,
      variant: AppCheckoutVariant.address,
      validators: validators,
      onSubmit: onSubmit,
      onFieldChanged: onFieldChanged,
      onValidationChanged: onValidationChanged,
      initialValues: initialValues,
      autoFocus: autoFocus,
      autoValidate: autoValidate,
      submitButtonText: submitButtonText ?? 'Continuar',
      customSubmitButton: customSubmitButton,
      showSubmitButton: showSubmitButton,
      readOnly: readOnly,
      fieldDecorations: fieldDecorations,
      fieldControllers: fieldControllers,
      fieldFocusNodes: fieldFocusNodes,
    );
  }

  /// Crea un formulario de pago predefinido
  factory AppCheckoutForms.payment({
    Key? key,
    AppCheckoutFormsConfig? config,
    List<AppCheckoutField>? customFields,
    Map<String, String Function(String?)>? validators,
    Function(AppCheckoutFormData)? onSubmit,
    Function(String, dynamic)? onFieldChanged,
    Function(AppCheckoutFormData)? onValidationChanged,
    Map<String, dynamic>? initialValues,
    bool autoFocus = false,
    bool autoValidate = true,
    String? submitButtonText,
    Widget? customSubmitButton,
    bool showSubmitButton = true,
    bool readOnly = false,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, TextEditingController>? fieldControllers,
    Map<String, FocusNode>? fieldFocusNodes,
  }) {
    return AppCheckoutForms(
      key: key,
      config: config ?? const AppCheckoutFormsConfig(variant: AppCheckoutVariant.payment),
      fields: customFields ?? AppCheckoutVariant.payment.defaultFields,
      variant: AppCheckoutVariant.payment,
      validators: validators,
      onSubmit: onSubmit,
      onFieldChanged: onFieldChanged,
      onValidationChanged: onValidationChanged,
      initialValues: initialValues,
      autoFocus: autoFocus,
      autoValidate: autoValidate,
      submitButtonText: submitButtonText ?? 'Procesar Pago',
      customSubmitButton: customSubmitButton,
      showSubmitButton: showSubmitButton,
      readOnly: readOnly,
      fieldDecorations: fieldDecorations,
      fieldControllers: fieldControllers,
      fieldFocusNodes: fieldFocusNodes,
    );
  }

  @override
  State<AppCheckoutForms> createState() => _AppCheckoutFormsState();
}

class _AppCheckoutFormsState extends State<AppCheckoutForms>
    with TickerProviderStateMixin {
  // Configuración efectiva
  late AppCheckoutFormsConfig _effectiveConfig;

  // Estado del formulario
  late AppCheckoutState _currentState;
  late AppCheckoutFormData _formData;

  // Controladores de animación
  late AnimationController _stateAnimationController;
  late AnimationController _submitAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  // Controladores de campos
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Helpers
  late AppCheckoutFormsPlatformAdapter _platformAdapter;
  late AppCheckoutFormsA11yHelper _a11yHelper;

  // Estado interno
  bool _isSubmitting = false;
  bool _hasInteracted = false;
  String? _currentFocusedField;

  @override
  void initState() {
    super.initState();
    _initializeConfig();
    _initializeState();
    _initializeAnimations();
    _initializeControllers();
    _initializeHelpers();
    _initializeFormData();
  }

  @override
  void didUpdateWidget(AppCheckoutForms oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config) {
      _initializeConfig();
    }
    if (widget.initialState != oldWidget.initialState) {
      _updateState(widget.initialState ?? AppCheckoutState.defaultState);
    }
    if (widget.fields != oldWidget.fields) {
      _reinitializeControllers();
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _submitAnimationController.dispose();
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _initializeConfig() {
    _effectiveConfig = widget.config ?? const AppCheckoutFormsConfig();
  }

  void _initializeState() {
    _currentState = widget.initialState ?? _effectiveConfig.state;
  }

  void _initializeAnimations() {
    final animConfig = _effectiveConfig.animation ?? const AppCheckoutAnimation();

    _stateAnimationController = AnimationController(
      duration: animConfig.transitionDuration,
      vsync: this,
    );

    _submitAnimationController = AnimationController(
      duration: animConfig.loadingDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: animConfig.transitionCurve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: animConfig.transitionCurve,
    ));

    _slideAnimation = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: animConfig.transitionCurve,
    ));

    _stateAnimationController.forward();
  }

  void _initializeControllers() {
    for (final field in widget.fields) {
      // Usar controlador personalizado o crear uno nuevo
      final controller = widget.fieldControllers?[field.key] ??
          TextEditingController(
            text: widget.initialValues?[field.key]?.toString() ?? field.initialValue ?? '',
          );
      _controllers[field.key] = controller;

      // Usar nodo de enfoque personalizado o crear uno nuevo
      final focusNode = widget.fieldFocusNodes?[field.key] ?? FocusNode();
      _focusNodes[field.key] = focusNode;

      // Configurar listeners
      controller.addListener(() => _onFieldChanged(field.key, controller.text));
      focusNode.addListener(() => _onFocusChanged(field.key, focusNode.hasFocus));
    }

    // Auto-enfocar el primer campo si está habilitado
    if (widget.autoFocus && widget.fields.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final firstField = widget.fields.first;
        _focusNodes[firstField.key]?.requestFocus();
      });
    }
  }

  void _reinitializeControllers() {
    // Limpiar controladores existentes que ya no se necesitan
    final fieldsToRemove = _controllers.keys
        .where((key) => !widget.fields.any((field) => field.key == key))
        .toList();

    for (final key in fieldsToRemove) {
      _controllers[key]?.dispose();
      _controllers.remove(key);
      _focusNodes[key]?.dispose();
      _focusNodes.remove(key);
    }

    // Agregar controladores para campos nuevos
    for (final field in widget.fields) {
      if (!_controllers.containsKey(field.key)) {
        final controller = widget.fieldControllers?[field.key] ??
            TextEditingController(
              text: widget.initialValues?[field.key]?.toString() ?? field.initialValue ?? '',
            );
        _controllers[field.key] = controller;

        final focusNode = widget.fieldFocusNodes?[field.key] ?? FocusNode();
        _focusNodes[field.key] = focusNode;

        controller.addListener(() => _onFieldChanged(field.key, controller.text));
        focusNode.addListener(() => _onFocusChanged(field.key, focusNode.hasFocus));
      }
    }
  }

  void _initializeHelpers() {
    _platformAdapter = AppCheckoutFormsPlatformAdapter();
    _a11yHelper = AppCheckoutFormsA11yHelper();
  }

  void _initializeFormData() {
    final initialValues = <String, dynamic>{};
    for (final field in widget.fields) {
      final value = widget.initialValues?[field.key] ?? field.initialValue;
      if (value != null) {
        initialValues[field.key] = value;
      }
    }

    _formData = AppCheckoutFormData(
      values: initialValues,
      validations: {},
      isValid: false,
      isDirty: false,
    );

    // Validar estado inicial si auto-validación está habilitada
    if (widget.autoValidate) {
      _validateForm();
    }
  }

  void _onFieldChanged(String fieldKey, dynamic value) {
    setState(() {
      _hasInteracted = true;
      _formData = _formData.copyWith(
        values: {..._formData.values, fieldKey: value},
        isDirty: true,
        lastModified: DateTime.now(),
      );
    });

    // Formatear valor si es necesario
    final field = widget.fields.firstWhere((f) => f.key == fieldKey);
    if (_effectiveConfig.behavior?.enableFormatting == true) {
      final formattedValue = AppCheckoutUtils.formatFieldValue(field.type, value.toString());
      if (formattedValue != value) {
        _controllers[fieldKey]?.value = _controllers[fieldKey]!.value.copyWith(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );
      }
    }

    // Validar en tiempo real si está habilitado
    if (_effectiveConfig.behavior?.validateOnChange == true && _hasInteracted) {
      _validateForm();
    }

    // Callback externo
    widget.onFieldChanged?.call(fieldKey, value);
  }

  void _onFocusChanged(String fieldKey, bool hasFocus) {
    setState(() {
      _currentFocusedField = hasFocus ? fieldKey : null;
    });

    if (hasFocus) {
      _updateState(AppCheckoutState.focus);
    } else if (_currentFocusedField == null) {
      _updateState(AppCheckoutState.defaultState);
    }
  }

  void _validateForm() {
    final validatedData = AppCheckoutUtils.validateForm(
      widget.fields,
      _formData.values,
      customMessages: _effectiveConfig.validation?.customMessages,
      customPatterns: _effectiveConfig.validation?.customPatterns,
    );

    setState(() {
      _formData = validatedData;
    });

    widget.onValidationChanged?.call(validatedData);
  }

  void _updateState(AppCheckoutState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });

      if (_effectiveConfig.animation?.enableAnimations == true) {
        _stateAnimationController.forward(from: 0.0);
      }
    }
  }

  Future<void> _submitForm() async {
    if (_isSubmitting) return;

    setState(() {
      _isSubmitting = true;
    });

    _updateState(AppCheckoutState.loading);

    // Validar formulario antes del envío
    _validateForm();

    if (!_formData.isValid) {
      setState(() {
        _isSubmitting = false;
      });
      _updateState(AppCheckoutState.defaultState);

      // Enfocar el primer campo con error
      final firstErrorField = widget.fields.firstWhere(
        (field) => _formData.validations[field.key]?.isValid == false,
        orElse: () => widget.fields.first,
      );
      _focusNodes[firstErrorField.key]?.requestFocus();
      return;
    }

    try {
      // Animar botón de envío
      if (_effectiveConfig.animation?.enableAnimations == true) {
        await _submitAnimationController.forward();
      }

      // Crear datos finales del formulario
      final finalFormData = _formData.copyWith(
        isSubmitting: true,
        submissionId: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      // Callback de envío
      widget.onSubmit?.call(finalFormData);

      // Marcar como enviado
      setState(() {
        _formData = finalFormData.copyWith(
          isSubmitting: false,
          isSubmitted: true,
        );
      });

      // Limpiar formulario si está configurado
      if (_effectiveConfig.behavior?.clearOnSubmit == true) {
        _clearForm();
      }

    } catch (error) {
      // Manejar error de envío
      setState(() {
        _isSubmitting = false;
        _formData = _formData.copyWith(isSubmitting: false);
      });
      _updateState(AppCheckoutState.defaultState);

      // Notificar error via a11y
      if (_effectiveConfig.a11yConfig?.announceErrors == true) {
        _a11yHelper.announceError('Error al enviar formulario: $error');
      }
    } finally {
      setState(() {
        _isSubmitting = false;
      });

      if (_effectiveConfig.animation?.enableAnimations == true) {
        _submitAnimationController.reverse();
      }

      if (_currentState == AppCheckoutState.loading) {
        _updateState(AppCheckoutState.defaultState);
      }
    }
  }

  void _clearForm() {
    for (final controller in _controllers.values) {
      controller.clear();
    }

    setState(() {
      _formData = AppCheckoutFormData(
        values: {},
        validations: {},
        isValid: false,
        isDirty: false,
      );
      _hasInteracted = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return _a11yHelper.buildSemanticWrapper(
      config: _effectiveConfig,
      state: _currentState,
      formData: _formData,
      child: AnimatedBuilder(
        animation: _stateAnimationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: _platformAdapter.buildForm(
          context: context,
          config: _effectiveConfig,
          variant: widget.variant ?? _effectiveConfig.variant,
          state: _currentState,
          fields: widget.fields,
          formData: _formData,
          formKey: _formKey,
          controllers: _controllers,
          focusNodes: _focusNodes,
          onSubmit: _submitForm,
          isSubmitting: _isSubmitting,
          readOnly: widget.readOnly,
          submitButtonText: widget.submitButtonText,
          customSubmitButton: widget.customSubmitButton,
          showSubmitButton: widget.showSubmitButton,
          fieldDecorations: widget.fieldDecorations,
          validators: widget.validators,
          onFieldChanged: _onFieldChanged,
          onFocusChanged: _onFocusChanged,
          submitAnimationController: _submitAnimationController,
        ),
      ),
    );
  }
}

