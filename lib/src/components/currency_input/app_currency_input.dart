import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:iautomat_design_system/src/components/currency_input/app_currency_input_config.dart';
import 'package:iautomat_design_system/src/components/currency_input/app_currency_input_platform_adapter.dart';
import 'package:iautomat_design_system/src/components/currency_input/app_currency_input_a11y_helper.dart';
import 'package:iautomat_design_system/src/components/currency_input/app_currency_input_validation_helper.dart';

/// Widget de entrada de moneda del Design System
///
/// Un campo de entrada especializado para cantidades monetarias con soporte para
/// formateo automático, validación y múltiples monedas.
///
/// Features:
/// - Formateo automático de moneda
/// - Validación de rangos y valores
/// - Soporte multiplataforma (Android, iOS, Web)
/// - RTL y accesibilidad completa
/// - Navegación por teclado
/// - Animaciones fluidas
/// - Localización completa
///
/// Ejemplo:
/// ```dart
/// AppCurrencyInput(
///   amount: 1250.50,
///   currency: 'USD',
///   onChanged: (value) => print('Nueva cantidad: \${value.amount}'),
///   locale: Locale('es', 'ES'),
///   variant: AppCurrencyInputVariant.localized,
/// )
/// ```
class AppCurrencyInput extends StatefulWidget {
  /// Configuración completa del input
  final AppCurrencyInputConfig? config;

  /// Cantidad inicial
  final double? amount;

  /// Código de moneda (ISO 4217)
  final String currency;

  /// Callback cuando cambia el valor
  final ValueChanged<AppCurrencyInputValue>? onChanged;

  /// Callback cuando se envía el formulario
  final ValueChanged<AppCurrencyInputValue>? onSubmitted;

  /// Callback cuando termina la edición
  final VoidCallback? onEditingComplete;

  /// Locale para formateo
  final Locale? locale;

  /// Variante del input
  final AppCurrencyInputVariant? variant;

  /// Estado inicial del input
  final AppCurrencyInputState? initialState;

  /// Etiqueta del campo
  final String? label;

  /// Texto de ayuda
  final String? hint;

  /// Texto de ayuda adicional
  final String? helperText;

  /// Texto de error personalizado
  final String? errorText;

  /// Si el campo está habilitado
  final bool enabled;

  /// Si el campo tiene autoFocus
  final bool autoFocus;

  /// FocusNode personalizado
  final FocusNode? focusNode;

  /// Controller personalizado para el texto
  final TextEditingController? controller;

  /// Funciones de validación personalizadas
  final String? Function(AppCurrencyInputValue?)? validator;

  /// Etiqueta semántica para accesibilidad
  final String? semanticLabel;

  /// Dirección del texto
  final ui.TextDirection? textDirection;

  /// Acción del teclado
  final TextInputAction? textInputAction;

  /// Configuración de validación personalizada
  final AppCurrencyInputValidation? validation;

  /// Si es de solo lectura
  final bool readOnly;

  /// Callback cuando se toca el campo
  final VoidCallback? onTap;

  /// Ancho del campo (opcional)
  final double? width;

  /// Altura del campo (opcional)
  final double? height;

  /// Widget de prefijo
  final Widget? prefix;

  /// Widget de sufijo
  final Widget? suffix;

  /// Icono de prefijo
  final IconData? prefixIcon;

  /// Icono de sufijo
  final IconData? suffixIcon;

  const AppCurrencyInput({
    super.key,
    this.config,
    this.amount,
    this.currency = 'USD',
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.locale,
    this.variant,
    this.initialState,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.controller,
    this.validator,
    this.semanticLabel,
    this.textDirection,
    this.textInputAction,
    this.validation,
    this.readOnly = false,
    this.onTap,
    this.width,
    this.height,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<AppCurrencyInput> createState() => _AppCurrencyInputState();
}

class _AppCurrencyInputState extends State<AppCurrencyInput>
    with TickerProviderStateMixin {
  late AppCurrencyInputConfig _config;
  late AppCurrencyInputState _currentState;
  late AppCurrencyInputPlatformAdapter _platformAdapter;
  late AppCurrencyInputA11yHelper _a11yHelper;

  // Controladores
  late TextEditingController _controller;
  late FocusNode _focusNode;

  // Controladores de animación
  late AnimationController _stateAnimationController;
  late AnimationController _skeletonAnimationController;

  // Animaciones
  late Animation<double> _skeletonAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // Estado interactivo
  bool _isFocused = false;

  // Formateo y validación
  late NumberFormat _numberFormat;
  AppCurrencyInputValue? _currentValue;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _initializeConfig();
    _initializeControllers();
    _initializeAnimations();
    _initializeHelpers();
    _initializeFormatting();
    _setupInitialValue();
    _setupFocusListener();
  }

  void _initializeConfig() {
    _config = widget.config ??
        AppCurrencyInputConfig(
          variant: widget.variant ?? AppCurrencyInputVariant.localized,
          state: widget.initialState ??
                 (widget.enabled ? AppCurrencyInputState.defaultState : AppCurrencyInputState.disabled),
        );

    _currentState = _config.state;
  }

  void _initializeControllers() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  void _initializeAnimations() {
    // Controlador principal de estado
    _stateAnimationController = AnimationController(
      duration: _config.animation?.duration ?? const Duration(milliseconds: 200),
      vsync: this,
    );

    // Controlador de skeleton
    _skeletonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Configurar animaciones
    final curve = _config.animation?.curve ?? Curves.easeInOut;

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: _getTargetScale(),
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: curve,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: _currentState.opacity,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: curve,
    ));

    _skeletonAnimation = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _skeletonAnimationController,
      curve: Curves.easeInOut,
    ));

    // Iniciar animación skeleton si es necesario
    if (_currentState == AppCurrencyInputState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    }
  }

  void _initializeHelpers() {
    _platformAdapter = AppCurrencyInputPlatformAdapter();
    _a11yHelper = AppCurrencyInputA11yHelper(
      config: _config.a11yConfig ?? const AppCurrencyInputA11yConfig(),
    );
  }

  void _initializeFormatting() {
    final locale = widget.locale ?? Locale('en', 'US');
    try {
      _numberFormat = NumberFormat.currency(
        locale: locale.toString(),
        symbol: _getCurrencySymbol(),
        decimalDigits: _getDecimalDigits(),
      );
    } catch (e) {
      // Fallback to default USD format
      _numberFormat = NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
        decimalDigits: 2,
      );
    }
  }

  void _setupInitialValue() {
    _currentValue = AppCurrencyInputValue(
      amount: widget.amount ?? 0.0,
      currencyCode: widget.currency,
      formattedValue: _formatAmount(widget.amount ?? 0.0),
      locale: widget.locale ?? const Locale('en', 'US'),
    );

    if (_currentValue != null && _currentValue!.formattedValue != null) {
      _controller.text = _currentValue!.formattedValue!;
    }
  }

  void _setupFocusListener() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (_isFocused) {
          _updateState(AppCurrencyInputState.focus);
        } else if (_currentState == AppCurrencyInputState.focus) {
          _updateState(_hasValue()
              ? AppCurrencyInputState.selected
              : AppCurrencyInputState.defaultState);
        }
      });
    });

    _controller.addListener(_handleTextChange);
  }

  double _getTargetScale() {
    if (!widget.enabled) return 1.0;
    if (_config.animation?.enableScaleAnimation != true) return 1.0;

    switch (_currentState) {
      case AppCurrencyInputState.hover:
        return _config.animation?.hoverScale ?? 1.01;
      case AppCurrencyInputState.pressed:
        return _config.animation?.pressScale ?? 0.99;
      case AppCurrencyInputState.selected:
        return 1.0;
      default:
        return 1.0;
    }
  }

  String _getCurrencySymbol() {
    try {
      final locale = widget.locale ?? Locale('en', 'US');
      final format = NumberFormat.simpleCurrency(
        locale: locale.toString(),
        name: widget.currency,
      );
      return format.currencySymbol;
    } catch (e) {
      return '\$'; // Fallback
    }
  }

  int _getDecimalDigits() {
    return _config.format?.decimalDigits ?? 2;
  }

  String _formatAmount(double amount) {
    try {
      return _numberFormat.format(amount);
    } catch (e) {
      return '\$${amount.toStringAsFixed(2)}';
    }
  }

  bool _hasValue() {
    return _currentValue != null && _currentValue!.amount > 0;
  }

  void _updateState(AppCurrencyInputState newState) {
    if (_currentState == newState || !widget.enabled) return;

    setState(() {
      _currentState = newState;
    });

    _stateAnimationController.forward(from: 0);

    // Anunciar cambio de estado para accesibilidad
    _a11yHelper.announceStateChange(_currentState);
  }

  void _handleTextChange() {
    final text = _controller.text;
    final amount = _parseAmount(text);

    if (amount != null) {
      final newValue = AppCurrencyInputValue(
        amount: amount,
        currencyCode: widget.currency,
        formattedValue: text,
        locale: widget.locale ?? const Locale('en', 'US'),
      );

      setState(() {
        _currentValue = newValue;
        _errorText = _validateValue(newValue);
      });

      widget.onChanged?.call(newValue);
    }
  }

  double? _parseAmount(String text) {
    try {
      // Remove currency symbols and formatting
      final cleanText = text.replaceAll(RegExp(r'[^\d.,]'), '');
      if (cleanText.isEmpty) return null;

      // Handle different decimal separators based on locale
      final locale = widget.locale ?? Locale('en', 'US');
      final decimalSeparator = NumberFormat.decimalPattern(locale.toString()).symbols.DECIMAL_SEP;

      String normalizedText = cleanText;
      if (decimalSeparator == ',') {
        // European format: 1.234,56 -> 1234.56
        normalizedText = cleanText.replaceAll('.', '').replaceAll(',', '.');
      } else {
        // US format: 1,234.56 -> 1234.56
        normalizedText = cleanText.replaceAll(',', '');
      }

      return double.parse(normalizedText);
    } catch (e) {
      return null;
    }
  }

  String? _validateValue(AppCurrencyInputValue value) {
    final validation = widget.validation ?? _config.validation;
    if (validation == null) return null;

    return AppCurrencyInputValidationHelper.validate(value, validation);
  }

  void _handleTap() {
    if (!widget.enabled) return;

    _updateState(AppCurrencyInputState.pressed);

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _updateState(_hasValue()
            ? AppCurrencyInputState.selected
            : AppCurrencyInputState.defaultState);
      }
    });

    _focusNode.requestFocus();
    widget.onTap?.call();
  }

  void _handleHover(bool isHovered) {
    if (!widget.enabled) return;

    // setState(() {
    //   _isHovered = isHovered;
    // });

    if (isHovered) {
      _updateState(AppCurrencyInputState.hover);
    } else {
      _updateState(_hasValue()
          ? AppCurrencyInputState.selected
          : AppCurrencyInputState.defaultState);
    }
  }

  void _handleSubmitted(String value) {
    if (_currentValue != null) {
      widget.onSubmitted?.call(_currentValue!);
    }
  }

  @override
  void didUpdateWidget(AppCurrencyInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enabled != oldWidget.enabled) {
      _updateState(widget.enabled
          ? AppCurrencyInputState.defaultState
          : AppCurrencyInputState.disabled);
    }

    if (widget.amount != oldWidget.amount && widget.amount != null) {
      _setupInitialValue();
    }

    if (widget.locale != oldWidget.locale || widget.currency != oldWidget.currency) {
      _initializeFormatting();
      _setupInitialValue();
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _skeletonAnimationController.dispose();
    _focusNode.removeListener(() {});
    _controller.removeListener(_handleTextChange);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == ui.TextDirection.rtl;

    return _a11yHelper.buildSemanticWrapper(
      context: context,
      value: _currentValue,
      state: _currentState,
      isRtl: isRtl,
      child: _buildInput(context),
    );
  }

  Widget _buildInput(BuildContext context) {
    if (_currentState == AppCurrencyInputState.skeleton) {
      return _buildSkeleton();
    }

    if (_currentState == AppCurrencyInputState.loading) {
      return _buildLoadingInput();
    }

    return _buildCurrencyInput(context);
  }

  Widget _buildSkeleton() {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        final colors = _resolveColors(context);
        final spacing = _resolveSpacing();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Container(
                height: 16,
                width: 80,
                decoration: BoxDecoration(
                  color: (colors.skeletonColor ?? Colors.grey.shade300)
                      .withValues(alpha: _skeletonAnimation.value),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: spacing.labelSpacing),
            ],
            Container(
              height: spacing.minHeight,
              decoration: BoxDecoration(
                color: (colors.skeletonColor ?? Colors.grey.shade300)
                    .withValues(alpha: _skeletonAnimation.value),
                borderRadius: BorderRadius.circular(spacing.borderRadius),
                border: Border.all(
                  color: (colors.borderColor ?? Colors.grey)
                      .withValues(alpha: 0.5),
                  width: spacing.borderWidth,
                ),
              ),
            ),
            if (widget.helperText != null) ...[
              SizedBox(height: spacing.helperSpacing),
              Container(
                height: 12,
                width: 120,
                decoration: BoxDecoration(
                  color: (colors.skeletonColor ?? Colors.grey.shade300)
                      .withValues(alpha: _skeletonAnimation.value),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildLoadingInput() {
    final colors = _resolveColors(context);
    final spacing = _resolveSpacing();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.disabledLabelColor ?? Colors.grey,
                ),
          ),
          SizedBox(height: spacing.labelSpacing),
        ],
        Container(
          height: spacing.minHeight,
          padding: spacing.contentPadding,
          decoration: BoxDecoration(
            color: colors.disabledBackgroundColor ?? Colors.grey.shade100,
            borderRadius: BorderRadius.circular(spacing.borderRadius),
            border: Border.all(
              color: colors.disabledBorderColor ?? Colors.grey.shade300,
              width: spacing.borderWidth,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.hint ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.disabledTextColor ?? Colors.grey,
                      ),
                ),
              ),
              _platformAdapter.buildLoadingIndicator(context, colors),
            ],
          ),
        ),
        if (widget.helperText != null) ...[
          SizedBox(height: spacing.helperSpacing),
          Text(
            widget.helperText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.disabledLabelColor ?? Colors.grey,
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildCurrencyInput(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      cursor: widget.enabled ? SystemMouseCursors.text : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.enabled ? _handleTap : null,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _stateAnimationController,
            _skeletonAnimationController,
          ]),
          builder: (context, child) {
            return Transform.scale(
              scale: _config.animation?.enabled == true
                  ? _scaleAnimation.value
                  : 1.0,
              child: AnimatedOpacity(
                opacity: _opacityAnimation.value,
                duration: _config.animation?.duration ??
                          const Duration(milliseconds: 200),
                child: SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: _platformAdapter.buildCurrencyInput(
                    context: context,
                    config: _config,
                    controller: _controller,
                    focusNode: _focusNode,
                    currentValue: _currentValue,
                    state: _currentState,
                    colors: _resolveColors(context),
                    spacing: _resolveSpacing(),
                    label: widget.label,
                    hint: widget.hint,
                    helperText: widget.helperText,
                    errorText: widget.errorText ?? _errorText,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    autoFocus: widget.autoFocus,
                    textDirection: widget.textDirection,
                    textInputAction: widget.textInputAction,
                    prefix: widget.prefix,
                    suffix: widget.suffix,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                    validator: widget.validator,
                    onSubmitted: _handleSubmitted,
                    onEditingComplete: widget.onEditingComplete,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppCurrencyInputColors _resolveColors(BuildContext context) {
    final theme = Theme.of(context);
    final baseColors = _config.colors ?? const AppCurrencyInputColors();

    return AppCurrencyInputColors(
      backgroundColor: baseColors.backgroundColor ?? theme.colorScheme.surface,
      borderColor: baseColors.borderColor ?? theme.colorScheme.outline.withValues(alpha: 0.2),
      focusedBorderColor: baseColors.focusedBorderColor ?? theme.colorScheme.primary,
      errorBorderColor: baseColors.errorBorderColor ?? theme.colorScheme.error,
      disabledBorderColor: baseColors.disabledBorderColor ?? theme.colorScheme.outline.withValues(alpha: 0.1),
      textColor: baseColors.textColor ?? theme.colorScheme.onSurface,
      disabledTextColor: baseColors.disabledTextColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.5),
      hintColor: baseColors.hintColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.6),
      labelColor: baseColors.labelColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.8),
      disabledLabelColor: baseColors.disabledLabelColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.4),
      helperColor: baseColors.helperColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.6),
      errorColor: baseColors.errorColor ?? theme.colorScheme.error,
      currencySymbolColor: baseColors.currencySymbolColor ?? theme.colorScheme.primary,
      disabledBackgroundColor: baseColors.disabledBackgroundColor ?? theme.colorScheme.surface.withValues(alpha: 0.5),
      skeletonColor: baseColors.skeletonColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.1),
    );
  }

  AppCurrencyInputSpacing _resolveSpacing() {
    return _config.spacing ?? const AppCurrencyInputSpacing();
  }
}