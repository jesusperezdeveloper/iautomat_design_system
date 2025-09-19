import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'ds_auth_screens_config.dart';
import 'ds_auth_screens_platform_adapter.dart';
import 'ds_auth_screens_a11y_helper.dart';

/// Widget de pantallas de autenticación para el Design System de IAutomat
///
/// Componente completo que incluye sign-in, sign-up, OTP y SSO
/// con soporte multiplataforma, RTL, teclado y accesibilidad
class DSAuthScreens extends StatefulWidget {
  /// Configuración del componente
  final DSAuthScreensConfig config;

  /// Lista de campos del formulario
  final List<DSAuthField> fields;

  /// Lista de proveedores SSO disponibles
  final List<DSAuthProvider> providers;

  /// Callback cuando se envía el formulario
  final Future<DSAuthResult> Function(DSAuthFormData data) onSubmit;

  /// Callback cuando se selecciona un proveedor SSO
  final Future<DSAuthResult> Function(DSAuthProvider provider)? onProviderAuth;

  /// Callback cuando cambia el estado del formulario
  final void Function(DSAuthFormData data)? onFormChanged;

  /// Callback cuando se valida un campo
  final void Function(DSAuthFieldValidation validation)? onFieldValidated;

  /// Callback cuando se navega entre pantallas
  final void Function(DSAuthVariant from, DSAuthVariant to)? onNavigate;

  /// Callback cuando se reenvía OTP
  final Future<bool> Function()? onResendOtp;

  /// Widget personalizado para el logo
  final Widget? logo;

  /// Título personalizado
  final String? title;

  /// Subtítulo personalizado
  final String? subtitle;

  /// Widget personalizado para el footer
  final Widget? footer;

  /// Valores iniciales del formulario
  final Map<String, dynamic>? initialValues;

  /// Clave global del formulario para validación externa
  final GlobalKey<FormState>? formKey;

  /// Si debe enfocar automáticamente el primer campo
  final bool autofocus;

  /// Si debe mostrar botón de volver
  final bool showBackButton;

  /// Acción personalizada del botón volver
  final VoidCallback? onBack;

  const DSAuthScreens({
    super.key,
    required this.config,
    required this.fields,
    required this.providers,
    required this.onSubmit,
    this.onProviderAuth,
    this.onFormChanged,
    this.onFieldValidated,
    this.onNavigate,
    this.onResendOtp,
    this.logo,
    this.title,
    this.subtitle,
    this.footer,
    this.initialValues,
    this.formKey,
    this.autofocus = true,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  State<DSAuthScreens> createState() => _DSAuthScreensState();
}

class _DSAuthScreensState extends State<DSAuthScreens>
    with TickerProviderStateMixin {
  late final GlobalKey<FormState> _formKey;
  late final DSAuthScreensPlatformAdapter _platformAdapter;
  late final DSAuthScreensA11yHelper _a11yHelper;

  // Controladores de animación
  late final AnimationController _mainAnimationController;
  late final AnimationController _loadingAnimationController;
  late final AnimationController _skeletonAnimationController;

  // Animaciones
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _loadingAnimation;
  late final Animation<double> _skeletonAnimation;

  // Estado del formulario
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  final Map<String, bool> _obscureText = {};
  DSAuthFormData _formData = const DSAuthFormData(
    values: {},
    validations: {},
  );

  // Estado de la UI
  bool _isSubmitting = false;
  Timer? _otpResendTimer;
  int _otpResendCountdown = 0;

  @override
  void initState() {
    super.initState();
    _initializeComponents();
    _initializeAnimations();
    _initializeFormData();
    _setupKeyboardHandling();
  }

  @override
  void dispose() {
    _disposeComponents();
    _disposeAnimations();
    _disposeFormData();
    _otpResendTimer?.cancel();
    super.dispose();
  }

  void _initializeComponents() {
    _formKey = widget.formKey ?? GlobalKey<FormState>();
    _platformAdapter = DSAuthScreensPlatformAdapter(
      config: widget.config,
      context: context,
    );
    _a11yHelper = DSAuthScreensA11yHelper(
      config: widget.config.a11yConfig ?? const DSAuthA11yConfig(),
    );
  }

  void _initializeAnimations() {
    final animation = widget.config.animation ?? const DSAuthAnimation();

    _mainAnimationController = AnimationController(
      duration: animation.duration,
      vsync: this,
    );

    _loadingAnimationController = AnimationController(
      duration: animation.loadingDuration,
      vsync: this,
    );

    _skeletonAnimationController = AnimationController(
      duration: animation.skeletonDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _mainAnimationController,
      curve: animation.curve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _mainAnimationController,
      curve: animation.transitionCurve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _mainAnimationController,
      curve: animation.curve,
    ));

    _loadingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _loadingAnimationController,
      curve: Curves.easeInOut,
    ));

    _skeletonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _skeletonAnimationController,
      curve: Curves.easeInOut,
    ));

    // Iniciar animaciones según el estado
    if (widget.config.state == DSAuthState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    } else {
      _mainAnimationController.forward();
    }
  }

  void _initializeFormData() {
    // Inicializar controladores y focus nodes
    for (final field in widget.fields) {
      _controllers[field.key] = TextEditingController(
        text: widget.initialValues?[field.key]?.toString() ?? field.initialValue ?? '',
      );

      _focusNodes[field.key] = FocusNode();

      if (field.type == DSAuthFieldType.password ||
          field.type == DSAuthFieldType.confirmPassword) {
        _obscureText[field.key] = true;
      }

      // Agregar listeners
      _controllers[field.key]!.addListener(() => _onFieldChanged(field));
      _focusNodes[field.key]!.addListener(() => _onFieldFocusChanged(field));
    }

    // Enfocar primer campo si está habilitado
    if (widget.autofocus && widget.fields.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[widget.fields.first.key]?.requestFocus();
      });
    }
  }

  void _setupKeyboardHandling() {
    // Configurar manejo del teclado según plataforma
    _platformAdapter.setupKeyboardHandling();
  }

  void _disposeComponents() {
    _platformAdapter.dispose();
    _a11yHelper.dispose();
  }

  void _disposeAnimations() {
    _mainAnimationController.dispose();
    _loadingAnimationController.dispose();
    _skeletonAnimationController.dispose();
  }

  void _disposeFormData() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
  }

  void _onFieldChanged(DSAuthField field) {
    final value = _controllers[field.key]?.text ?? '';
    final newValues = Map<String, dynamic>.from(_formData.values);
    newValues[field.key] = value;

    _updateFormData(newValues);

    // Validar en tiempo real si está habilitado
    final behavior = widget.config.behavior ?? const DSAuthBehavior();
    if (behavior.validateOnChange || behavior.enableRealTimeValidation) {
      _validateField(field);
    }

    // Limpiar errores al escribir si está habilitado
    if (behavior.clearErrorsOnType) {
      _clearFieldError(field.key);
    }
  }

  void _onFieldFocusChanged(DSAuthField field) {
    final validation = widget.config.validation ?? const DSAuthValidation();
    if (_focusNodes[field.key]?.hasFocus == false && validation.enabled) {
      _validateField(field);
    }
  }

  void _updateFormData(Map<String, dynamic> values) {
    final newFormData = _formData.copyWith(
      values: values,
      isDirty: true,
      lastModified: DateTime.now(),
    );

    setState(() {
      _formData = newFormData;
    });

    widget.onFormChanged?.call(newFormData);
  }

  void _validateField(DSAuthField field) {
    final validation = DSAuthUtils.validateField(
      field,
      _controllers[field.key]?.text,
      customMessages: widget.config.validation?.customMessages,
      customPatterns: widget.config.validation?.customPatterns,
      confirmPasswordValue: field.type == DSAuthFieldType.confirmPassword
          ? _controllers['password']?.text
          : null,
      validationConfig: widget.config.validation,
    );

    final newValidations = Map<String, DSAuthFieldValidation>.from(_formData.validations);
    newValidations[field.key] = validation;

    final isFormValid = newValidations.values.every((v) => v.isValid);

    final newFormData = _formData.copyWith(
      validations: newValidations,
      isValid: isFormValid,
    );

    setState(() {
      _formData = newFormData;
    });

    widget.onFieldValidated?.call(validation);

    // Anunciar errores para accesibilidad
    if (!validation.isValid && validation.errorMessage != null) {
      _a11yHelper.announceError(validation.errorMessage!);
    }
  }

  void _clearFieldError(String fieldKey) {
    if (_formData.validations[fieldKey]?.isValid == false) {
      final newValidations = Map<String, DSAuthFieldValidation>.from(_formData.validations);
      newValidations.remove(fieldKey);

      setState(() {
        _formData = _formData.copyWith(validations: newValidations);
      });
    }
  }

  void _togglePasswordVisibility(String fieldKey) {
    setState(() {
      _obscureText[fieldKey] = !(_obscureText[fieldKey] ?? false);
    });

    // Anunciar cambio para accesibilidad
    final isVisible = !(_obscureText[fieldKey] ?? false);
    final a11yConfig = widget.config.a11yConfig ?? const DSAuthA11yConfig();
    final message = isVisible
        ? a11yConfig.showPasswordSemanticLabel
        : a11yConfig.hidePasswordSemanticLabel;
    _a11yHelper.announceStateChange(message);
  }

  Future<void> _submitForm() async {
    if (_isSubmitting) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Validar formulario completo
      final behavior = widget.config.behavior ?? const DSAuthBehavior();
      if (behavior.validateOnSubmit) {
        if (!_formKey.currentState!.validate()) {
          _a11yHelper.announceError('Por favor corrige los errores en el formulario');
          return;
        }
      }

      // Iniciar animación de carga
      _loadingAnimationController.forward();

      // Crear datos para envío
      final submitData = _formData.copyWith(
        isSubmitting: true,
        attemptCount: _formData.attemptCount + 1,
        lastAttempt: DateTime.now(),
      );

      // Enviar formulario
      final result = await widget.onSubmit(submitData);

      if (result.success) {
        _a11yHelper.announceSuccess('Autenticación exitosa');

        // Actualizar estado
        setState(() {
          _formData = _formData.copyWith(
            isSubmitted: true,
            isSubmitting: false,
          );
        });
      } else {
        _a11yHelper.announceError(result.error ?? 'Error en la autenticación');

        // Manejar error
        _handleSubmissionError(result);
      }
    } catch (e) {
      _a11yHelper.announceError('Error inesperado: $e');
      _handleSubmissionError(DSAuthResult(
        success: false,
        error: e.toString(),
      ));
    } finally {
      _loadingAnimationController.reverse();
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void _handleSubmissionError(DSAuthResult result) {
    final behavior = widget.config.behavior ?? const DSAuthBehavior();

    // Verificar límite de intentos
    if (_formData.attemptCount >= behavior.maxLoginAttempts) {
      _a11yHelper.announceError('Máximo número de intentos alcanzado');
      // Aquí podrías implementar bloqueo temporal
    }

    // Mostrar error específico
    if (result.errorCode != null) {
      // Manejar códigos de error específicos
      switch (result.errorCode) {
        case 'invalid_credentials':
          _a11yHelper.announceError('Credenciales inválidas');
          break;
        case 'account_locked':
          _a11yHelper.announceError('Cuenta bloqueada temporalmente');
          break;
        case 'invalid_otp':
          _a11yHelper.announceError('Código OTP inválido');
          break;
        default:
          _a11yHelper.announceError(result.error ?? 'Error desconocido');
      }
    }
  }

  Future<void> _handleProviderAuth(DSAuthProvider provider) async {
    if (_isSubmitting || widget.onProviderAuth == null) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      _loadingAnimationController.forward();

      final result = await widget.onProviderAuth!(provider);

      if (result.success) {
        _a11yHelper.announceSuccess('Autenticación con ${provider.displayName} exitosa');
      } else {
        _a11yHelper.announceError('Error en autenticación con ${provider.displayName}');
      }
    } catch (e) {
      _a11yHelper.announceError('Error con ${provider.displayName}: $e');
    } finally {
      _loadingAnimationController.reverse();
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  Future<void> _handleResendOtp() async {
    if (widget.onResendOtp == null || _otpResendCountdown > 0) return;

    try {
      final success = await widget.onResendOtp!();

      if (success) {
        _a11yHelper.announceSuccess('Código enviado nuevamente');
        _startOtpCountdown();
      } else {
        _a11yHelper.announceError('Error al reenviar código');
      }
    } catch (e) {
      _a11yHelper.announceError('Error al reenviar: $e');
    }
  }

  void _startOtpCountdown() {
    final behavior = widget.config.behavior ?? const DSAuthBehavior();
    _otpResendCountdown = behavior.otpResendCooldown.inSeconds;

    _otpResendTimer?.cancel();
    _otpResendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _otpResendCountdown--;
      });

      if (_otpResendCountdown <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildResponsiveLayout();
  }

  Widget _buildResponsiveLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = widget.config.spacing ?? const DSAuthSpacing();
        final behavior = widget.config.behavior ?? const DSAuthBehavior();

        // Determinar layout según tamaño de pantalla
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        Widget content = _buildMainContent();

        // Envolver en container responsive
        if (isDesktop || isTablet) {
          content = Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 400 : 350,
                minWidth: 300,
              ),
              child: content,
            ),
          );
        }

        return Scaffold(
          backgroundColor: _getBackgroundColor(),
          appBar: widget.showBackButton ? _buildAppBar() : null,
          body: SafeArea(
            child: Padding(
              padding: spacing.screenPadding,
              child: _buildAnimatedContent(content),
            ),
          ),
          resizeToAvoidBottomInset: behavior.keyboardBehavior != DSAuthKeyboardBehavior.alwaysVisible,
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final colors = widget.config.colors ?? const DSAuthColors();
    final a11yConfig = widget.config.a11yConfig ?? const DSAuthA11yConfig();

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          _getDirectionalIcon(Icons.arrow_back, Icons.arrow_forward),
          color: colors.titleColor ?? Theme.of(context).colorScheme.onSurface,
        ),
        onPressed: widget.onBack ?? () => Navigator.of(context).maybePop(),
        tooltip: a11yConfig.backSemanticLabel,
      ),
    );
  }

  IconData _getDirectionalIcon(IconData ltr, IconData rtl) {
    return Directionality.of(context) == ui.TextDirection.rtl ? rtl : ltr;
  }

  Color? _getBackgroundColor() {
    final colors = widget.config.colors ?? const DSAuthColors();
    return colors.backgroundColor ?? colors.surfaceColor;
  }

  Widget _buildAnimatedContent(Widget content) {
    final animation = widget.config.animation ?? const DSAuthAnimation();

    if (!animation.enabled) {
      return content;
    }

    if (widget.config.state == DSAuthState.skeleton) {
      return _buildSkeletonContent();
    }

    return AnimatedBuilder(
      animation: _mainAnimationController,
      builder: (context, child) {
        Widget animatedContent = content;

        if (animation.enableFadeAnimation) {
          animatedContent = FadeTransition(
            opacity: _fadeAnimation,
            child: animatedContent,
          );
        }

        if (animation.enableSlideAnimation) {
          animatedContent = SlideTransition(
            position: _slideAnimation,
            child: animatedContent,
          );
        }

        if (animation.enableScaleAnimation) {
          animatedContent = ScaleTransition(
            scale: _scaleAnimation,
            child: animatedContent,
          );
        }

        return animatedContent;
      },
    );
  }

  Widget _buildSkeletonContent() {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Column(
          children: [
            _buildSkeletonItem(height: 60, width: double.infinity),
            const SizedBox(height: 24),
            _buildSkeletonItem(height: 40, width: 200),
            const SizedBox(height: 16),
            _buildSkeletonItem(height: 20, width: 150),
            const SizedBox(height: 32),
            ..._buildSkeletonFields(),
            const SizedBox(height: 24),
            _buildSkeletonItem(height: 56, width: double.infinity),
          ],
        );
      },
    );
  }

  Widget _buildSkeletonItem({required double height, required double width}) {
    final colors = widget.config.colors ?? const DSAuthColors();
    final spacing = widget.config.spacing ?? const DSAuthSpacing();

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: (colors.skeletonColor ?? Colors.grey[300])?.withValues(
          alpha: 0.3 + (0.7 * _skeletonAnimation.value),
        ),
        borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
      ),
    );
  }

  List<Widget> _buildSkeletonFields() {
    return List.generate(widget.fields.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _buildSkeletonItem(height: 56, width: double.infinity),
      );
    });
  }

  Widget _buildMainContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.config.behavior?.showHeader ?? true) ...[
            _buildHeader(),
            _buildSpacing(32),
          ],

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildForm(),
                  _buildActions(),
                  if (widget.providers.isNotEmpty) ...[
                    _buildDivider(),
                    _buildProviders(),
                  ],
                ],
              ),
            ),
          ),

          if (widget.footer != null) ...[
            _buildSpacing(16),
            widget.footer!,
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final colors = widget.config.colors ?? const DSAuthColors();
    final spacing = widget.config.spacing ?? const DSAuthSpacing();

    return Padding(
      padding: spacing.headerPadding,
      child: Column(
        children: [
          if (widget.logo != null) ...[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: spacing.logoMaxHeight),
              child: widget.logo!,
            ),
            _buildSpacing(spacing.titleSpacing),
          ],

          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colors.titleColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            _buildSpacing(spacing.subtitleSpacing),
          ],

          if (widget.subtitle != null) ...[
            Text(
              widget.subtitle!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colors.subtitleColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildForm() {
    final spacing = widget.config.spacing ?? const DSAuthSpacing();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...widget.fields.map((field) => Padding(
          padding: EdgeInsets.only(bottom: spacing.fieldSpacing),
          child: _buildField(field),
        )),
      ],
    );
  }

  Widget _buildField(DSAuthField field) {
    switch (field.type) {
      case DSAuthFieldType.otp:
        return _buildOtpField(field);
      case DSAuthFieldType.checkbox:
      case DSAuthFieldType.terms:
      case DSAuthFieldType.privacy:
        return _buildCheckboxField(field);
      default:
        return _buildTextFormField(field);
    }
  }

  Widget _buildTextFormField(DSAuthField field) {
    final colors = widget.config.colors ?? const DSAuthColors();
    final spacing = widget.config.spacing ?? const DSAuthSpacing();
    final validation = _formData.validations[field.key];
    final hasError = validation?.isValid == false;

    return TextFormField(
      controller: _controllers[field.key],
      focusNode: _focusNodes[field.key],
      enabled: field.enabled && widget.config.state != DSAuthState.disabled,
      readOnly: field.readonly,
      maxLines: field.maxLines,
      maxLength: field.maxLength,
      obscureText: _obscureText[field.key] ?? false,
      keyboardType: _getKeyboardType(field.type),
      textInputAction: _getTextInputAction(field),
      autofillHints: _getAutofillHints(field.type),
      inputFormatters: _getInputFormatters(field),
      decoration: InputDecoration(
        labelText: field.label,
        hintText: field.placeholder,
        helperText: field.helperText,
        errorText: hasError ? validation?.errorMessage : null,
        prefixIcon: field.prefixIcon != null
            ? Icon(
                field.prefixIcon,
                color: hasError
                    ? colors.errorColor
                    : colors.labelColor,
              )
            : null,
        suffixIcon: _buildSuffixIcon(field),
        filled: true,
        fillColor: field.enabled
            ? colors.fieldBackgroundColor
            : colors.fieldDisabledBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldBorderColor ?? Colors.grey,
            width: spacing.borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldBorderColor ?? Colors.grey,
            width: spacing.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldFocusedBorderColor ?? Theme.of(context).colorScheme.primary,
            width: spacing.focusedBorderWidth,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldErrorBorderColor ?? Theme.of(context).colorScheme.error,
            width: spacing.focusedBorderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldErrorBorderColor ?? Theme.of(context).colorScheme.error,
            width: spacing.focusedBorderWidth,
          ),
        ),
        contentPadding: spacing.fieldPadding,
      ),
      style: TextStyle(
        color: field.enabled
            ? colors.bodyTextColor
            : colors.disabledTextColor,
      ),
      validator: field.required ? (value) {
        final validation = DSAuthUtils.validateField(
          field,
          value,
          customMessages: widget.config.validation?.customMessages,
          customPatterns: widget.config.validation?.customPatterns,
          confirmPasswordValue: field.type == DSAuthFieldType.confirmPassword
              ? _controllers['password']?.text
              : null,
          validationConfig: widget.config.validation,
        );
        return validation.isValid ? null : validation.errorMessage;
      } : null,
      onFieldSubmitted: (_) => _handleFieldSubmitted(field),
    );
  }

  Widget? _buildSuffixIcon(DSAuthField field) {
    final colors = widget.config.colors ?? const DSAuthColors();
    final a11yConfig = widget.config.a11yConfig ?? const DSAuthA11yConfig();

    if (field.type == DSAuthFieldType.password ||
        field.type == DSAuthFieldType.confirmPassword) {
      final isObscured = _obscureText[field.key] ?? false;

      return IconButton(
        icon: Icon(
          isObscured ? Icons.visibility : Icons.visibility_off,
          color: colors.labelColor,
        ),
        onPressed: () => _togglePasswordVisibility(field.key),
        tooltip: isObscured
            ? a11yConfig.showPasswordSemanticLabel
            : a11yConfig.hidePasswordSemanticLabel,
      );
    }

    if (field.suffixIcon != null) {
      return Icon(
        field.suffixIcon,
        color: colors.labelColor,
      );
    }

    return null;
  }

  Widget _buildOtpField(DSAuthField field) {
    final spacing = widget.config.spacing ?? const DSAuthSpacing();
    final behavior = widget.config.behavior ?? const DSAuthBehavior();
    final colors = widget.config.colors ?? const DSAuthColors();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          field.label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: colors.labelColor,
          ),
        ),
        _buildSpacing(8),

        // Campos OTP individuales
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(behavior.otpLength, (index) {
            return SizedBox(
              width: spacing.otpFieldSize,
              height: spacing.otpFieldSize,
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colors.bodyTextColor,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colors.otpFieldBackgroundColor ?? colors.fieldBackgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
                    borderSide: BorderSide(
                      color: colors.otpFieldBorderColor ?? colors.fieldBorderColor ?? Colors.grey,
                      width: spacing.borderWidth,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
                    borderSide: BorderSide(
                      color: colors.otpFieldFocusedBorderColor ?? colors.fieldFocusedBorderColor ?? Theme.of(context).colorScheme.primary,
                      width: spacing.focusedBorderWidth,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) => _handleOtpFieldChanged(index, value),
              ),
            );
          }),
        ),

        if (widget.config.variant == DSAuthVariant.otp) ...[
          _buildSpacing(16),
          _buildResendOtpButton(),
        ],
      ],
    );
  }

  Widget _buildCheckboxField(DSAuthField field) {
    final colors = widget.config.colors ?? const DSAuthColors();
    final validation = _formData.validations[field.key];
    final hasError = validation?.isValid == false;
    final isChecked = _formData.values[field.key] == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: field.enabled ? (value) {
                final newValues = Map<String, dynamic>.from(_formData.values);
                newValues[field.key] = value ?? false;
                _updateFormData(newValues);
              } : null,
              activeColor: colors.primaryColor,
            ),
            Expanded(
              child: GestureDetector(
                onTap: field.enabled ? () {
                  final newValues = Map<String, dynamic>.from(_formData.values);
                  newValues[field.key] = !(isChecked);
                  _updateFormData(newValues);
                } : null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    field.label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: hasError
                          ? colors.errorColor
                          : colors.bodyTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        if (hasError && validation?.errorMessage != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 48, top: 4),
            child: Text(
              validation!.errorMessage!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colors.errorColor,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildResendOtpButton() {
    final colors = widget.config.colors ?? const DSAuthColors();
    final a11yConfig = widget.config.a11yConfig ?? const DSAuthA11yConfig();
    final canResend = _otpResendCountdown <= 0 && !_isSubmitting;

    return TextButton(
      onPressed: canResend ? _handleResendOtp : null,
      child: Text(
        _otpResendCountdown > 0
            ? 'Reenviar código en ${_otpResendCountdown}s'
            : a11yConfig.resendCodeSemanticLabel,
        style: TextStyle(
          color: canResend
              ? colors.linkColor ?? colors.primaryColor
              : colors.disabledTextColor,
        ),
      ),
    );
  }

  Widget _buildActions() {
    final spacing = widget.config.spacing ?? const DSAuthSpacing();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSpacing(spacing.sectionSpacing),
        _buildPrimaryButton(),
        _buildSpacing(16),
        _buildSecondaryActions(),
      ],
    );
  }

  Widget _buildPrimaryButton() {
    final colors = widget.config.colors ?? const DSAuthColors();
    final spacing = widget.config.spacing ?? const DSAuthSpacing();
    final a11yConfig = widget.config.a11yConfig ?? const DSAuthA11yConfig();
    final isEnabled = _canSubmit() && !_isSubmitting;

    String buttonText;
    switch (widget.config.variant) {
      case DSAuthVariant.signIn:
        buttonText = 'Iniciar Sesión';
        break;
      case DSAuthVariant.signUp:
        buttonText = a11yConfig.createAccountSemanticLabel;
        break;
      case DSAuthVariant.otp:
        buttonText = 'Verificar';
        break;
      case DSAuthVariant.sso:
        buttonText = 'Continuar';
        break;
    }

    return SizedBox(
      height: spacing.buttonMinHeight,
      child: ElevatedButton(
        onPressed: isEnabled ? _submitForm : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? colors.buttonPrimaryBackgroundColor
              : colors.buttonDisabledBackgroundColor,
          foregroundColor: isEnabled
              ? colors.buttonPrimaryTextColor
              : colors.buttonDisabledTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
          ),
          padding: spacing.buttonPadding,
        ),
        child: _isSubmitting
            ? _buildLoadingIndicator()
            : Text(
                buttonText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    final colors = widget.config.colors ?? const DSAuthColors();

    return AnimatedBuilder(
      animation: _loadingAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _loadingAnimation.value,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                colors.buttonPrimaryTextColor ?? Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSecondaryActions() {
    return Column(
      children: [
        if (widget.config.variant == DSAuthVariant.signIn) ...[
          TextButton(
            onPressed: () => _navigateTo(DSAuthVariant.signUp),
            child: Text('¿No tienes cuenta? Regístrate'),
          ),
          TextButton(
            onPressed: () {
              // Implementar "Olvidé mi contraseña"
            },
            child: Text('¿Olvidaste tu contraseña?'),
          ),
        ],

        if (widget.config.variant == DSAuthVariant.signUp) ...[
          TextButton(
            onPressed: () => _navigateTo(DSAuthVariant.signIn),
            child: Text('¿Ya tienes cuenta? Inicia sesión'),
          ),
        ],
      ],
    );
  }

  Widget _buildDivider() {
    final colors = widget.config.colors ?? const DSAuthColors();
    final spacing = widget.config.spacing ?? const DSAuthSpacing();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing.sectionSpacing),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: colors.dividerColor,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'o',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colors.subtitleColor,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: colors.dividerColor,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProviders() {
    final spacing = widget.config.spacing ?? const DSAuthSpacing();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.providers.map((provider) {
        return Padding(
          padding: EdgeInsets.only(bottom: spacing.elementSpacing),
          child: _buildProviderButton(provider),
        );
      }).toList(),
    );
  }

  Widget _buildProviderButton(DSAuthProvider provider) {
    final colors = widget.config.colors ?? const DSAuthColors();
    final spacing = widget.config.spacing ?? const DSAuthSpacing();
    final a11yConfig = widget.config.a11yConfig ?? const DSAuthA11yConfig();
    final isEnabled = provider.enabled && !_isSubmitting;

    return SizedBox(
      height: spacing.providerMinHeight,
      child: OutlinedButton.icon(
        onPressed: isEnabled ? () => _handleProviderAuth(provider) : null,
        icon: Icon(
          provider.icon,
          color: provider.iconColor ??
                 (isEnabled
                     ? colors.providerIconColor
                     : colors.buttonDisabledTextColor),
        ),
        label: Text(
          '${a11yConfig.continueWithSemanticLabel} ${provider.displayName}',
          style: TextStyle(
            color: provider.textColor ??
                   (isEnabled
                       ? colors.providerTextColor
                       : colors.buttonDisabledTextColor),
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: provider.backgroundColor ?? colors.providerBackgroundColor,
          side: BorderSide(
            color: colors.providerBorderColor ?? Colors.grey,
            width: spacing.borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.providerBorderRadius),
          ),
          padding: spacing.providerPadding,
        ),
      ),
    );
  }

  Widget _buildSpacing(double height) {
    return SizedBox(height: height);
  }

  // Métodos auxiliares

  TextInputType _getKeyboardType(DSAuthFieldType type) {
    switch (type) {
      case DSAuthFieldType.email:
        return TextInputType.emailAddress;
      case DSAuthFieldType.phone:
        return TextInputType.phone;
      case DSAuthFieldType.otp:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  TextInputAction _getTextInputAction(DSAuthField field) {
    final fieldIndex = widget.fields.indexOf(field);
    final isLastField = fieldIndex == widget.fields.length - 1;
    final behavior = widget.config.behavior ?? const DSAuthBehavior();

    if (behavior.focusNextFieldOnEnter && !isLastField) {
      return TextInputAction.next;
    }

    if (behavior.submitOnEnter) {
      return TextInputAction.done;
    }

    return TextInputAction.next;
  }

  List<String>? _getAutofillHints(DSAuthFieldType type) {
    final behavior = widget.config.behavior ?? const DSAuthBehavior();
    if (!behavior.enableAutofill) return null;

    switch (type) {
      case DSAuthFieldType.email:
        return [AutofillHints.email];
      case DSAuthFieldType.password:
        return [AutofillHints.password];
      case DSAuthFieldType.phone:
        return [AutofillHints.telephoneNumber];
      case DSAuthFieldType.text:
        return [AutofillHints.name];
      default:
        return null;
    }
  }

  List<TextInputFormatter> _getInputFormatters(DSAuthField field) {
    final formatters = <TextInputFormatter>[];

    if (field.maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(field.maxLength!));
    }

    switch (field.type) {
      case DSAuthFieldType.phone:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case DSAuthFieldType.otp:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      default:
        break;
    }

    return formatters;
  }

  void _handleFieldSubmitted(DSAuthField field) {
    final behavior = widget.config.behavior ?? const DSAuthBehavior();

    if (behavior.submitOnEnter && _canSubmit()) {
      _submitForm();
      return;
    }

    if (behavior.focusNextFieldOnEnter) {
      final currentIndex = widget.fields.indexOf(field);
      if (currentIndex < widget.fields.length - 1) {
        final nextField = widget.fields[currentIndex + 1];
        _focusNodes[nextField.key]?.requestFocus();
      }
    }
  }

  void _handleOtpFieldChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.fields.length - 1) {
      // Mover al siguiente campo
      // Aquí necesitarías una lógica más compleja para manejar los campos OTP individuales
    }

    // Auto-submit si está completo
    final behavior = widget.config.behavior ?? const DSAuthBehavior();
    if (behavior.autoSubmitOtp) {
      // Verificar si todos los campos OTP están llenos
      // Implementar lógica de auto-submit
    }
  }

  bool _canSubmit() {
    final behavior = widget.config.behavior ?? const DSAuthBehavior();

    if (!behavior.validateOnSubmit) {
      return true;
    }

    // Verificar campos requeridos
    for (final field in widget.fields) {
      if (field.required) {
        final value = _controllers[field.key]?.text ?? '';
        if (value.isEmpty) {
          return false;
        }
      }
    }

    // Verificar validaciones
    return _formData.validations.values.every((v) => v.isValid);
  }

  void _navigateTo(DSAuthVariant variant) {
    widget.onNavigate?.call(widget.config.variant, variant);
  }
}