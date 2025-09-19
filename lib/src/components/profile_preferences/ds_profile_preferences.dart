import 'dart:async';
import 'package:flutter/material.dart';

import 'ds_profile_preferences_config.dart';
import 'ds_profile_preferences_platform_adapter.dart';
import 'ds_profile_preferences_a11y_helper.dart';

/// DSProfilePreferences - Widget de preferencias de perfil para el Design System
///
/// Un widget completo y personalizable para gestionar preferencias de perfil
/// con soporte para múltiples tipos de campos, validación, accesibilidad,
/// y adaptación de plataforma.
///
/// Características principales:
/// - Material 3 Design
/// - Adaptación automática de plataforma (Android, iOS, Web)
/// - Soporte RTL completo
/// - Accesibilidad integrada
/// - Navegación por teclado
/// - Múltiples tipos de campo
/// - Validación en tiempo real
/// - Estados de carga y skeleton
///
/// Ejemplo de uso:
/// ```dart
/// DSProfilePreferences(
///   config: DSProfilePreferencesConfig(
///     fields: [
///       DSProfileField(
///         id: 'name',
///         type: DSProfileFieldType.text,
///         label: 'Nombre',
///         required: true,
///       ),
///     ],
///   ),
///   onSave: (data) => print('Saved: $data'),
/// )
/// ```
class DSProfilePreferences extends StatefulWidget {
  /// Configuración del componente
  final DSProfilePreferencesConfig config;

  /// Callback para guardar cambios
  final Function(DSProfileFormData data)? onSave;

  /// Callback para cancelar cambios
  final VoidCallback? onCancel;

  /// Callback cuando cambia el formulario
  final Function(DSProfileFormData data)? onFormChanged;

  /// Callback cuando se valida un campo
  final Function(DSProfileFieldValidationResult validation)? onFieldValidated;

  /// Callback para navegación personalizada
  final Function(String from, String to)? onNavigate;

  /// Datos iniciales del formulario
  final DSProfileFormData? initialData;

  /// Si el componente está habilitado
  final bool enabled;

  /// Clave para el formulario
  final GlobalKey<FormState>? formKey;

  const DSProfilePreferences({
    super.key,
    required this.config,
    this.onSave,
    this.onCancel,
    this.onFormChanged,
    this.onFieldValidated,
    this.onNavigate,
    this.initialData,
    this.enabled = true,
    this.formKey,
  });

  @override
  State<DSProfilePreferences> createState() => _DSProfilePreferencesState();
}

class _DSProfilePreferencesState extends State<DSProfilePreferences>
    with TickerProviderStateMixin {
  // Controladores de animación
  late final AnimationController _mainAnimationController;
  late final AnimationController _skeletonAnimationController;

  // Animaciones
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _skeletonAnimation;

  // Estado del formulario
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  late final GlobalKey<FormState> _formKey;
  DSProfileFormData _formData = const DSProfileFormData();

  // Estado de la UI
  bool _isSubmitting = false;
  Timer? _autoSaveTimer;

  // Helpers
  late final DSProfilePreferencesPlatformAdapter _platformAdapter;
  late final DSProfilePreferencesA11yHelper _a11yHelper;

  @override
  void initState() {
    super.initState();

    _initializeFormKey();
    _initializeAnimations();
    _initializeHelpers();
    _initializeFormData();
    _initializeControllers();
    _setupAutoSave();
  }

  void _initializeFormKey() {
    _formKey = widget.formKey ?? GlobalKey<FormState>();
  }

  void _initializeAnimations() {
    final animation = widget.config.animation ?? const DSProfileAnimation();

    _mainAnimationController = AnimationController(
      duration: animation.duration,
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
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _mainAnimationController,
      curve: animation.curve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _mainAnimationController,
      curve: animation.curve,
    ));

    _skeletonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _skeletonAnimationController,
      curve: animation.skeletonCurve,
    ));

    // Iniciar animaciones
    if (widget.config.state == DSProfileState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    } else {
      _mainAnimationController.forward();
    }
  }

  void _initializeHelpers() {
    _platformAdapter = DSProfilePreferencesPlatformAdapter(
      config: widget.config,
      context: context,
    );

    _a11yHelper = DSProfilePreferencesA11yHelper(
      config: widget.config.a11yConfig ?? const DSProfileA11yConfig(),
    );
  }

  void _initializeFormData() {
    _formData = widget.initialData ?? const DSProfileFormData();
  }

  void _initializeControllers() {
    for (final field in widget.config.fields) {
      if (_needsTextController(field.type)) {
        _controllers[field.id] = TextEditingController(
          text: _formData.values[field.id]?.toString() ?? '',
        );
        _focusNodes[field.id] = FocusNode();

        // Escuchar cambios
        _controllers[field.id]!.addListener(() => _handleFieldChanged(field.id));
        _focusNodes[field.id]!.addListener(() => _handleFocusChanged(field.id));
      }
    }
  }

  bool _needsTextController(DSProfileFieldType type) {
    return [
      DSProfileFieldType.text,
      DSProfileFieldType.email,
      DSProfileFieldType.phone,
    ].contains(type);
  }

  void _setupAutoSave() {
    final behavior = widget.config.behavior ?? const DSProfileBehavior();
    if (behavior.autoSave) {
      _autoSaveTimer = Timer.periodic(
        Duration(milliseconds: behavior.autoSaveDelay),
        (_) => _performAutoSave(),
      );
    }
  }

  @override
  void dispose() {
    _mainAnimationController.dispose();
    _skeletonAnimationController.dispose();

    for (final controller in _controllers.values) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }

    _autoSaveTimer?.cancel();
    _a11yHelper.dispose();
    _platformAdapter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _getTextDirection(),
      child: _buildResponsiveLayout(),
    );
  }

  TextDirection _getTextDirection() {
    return Directionality.of(context);
  }

  Widget _buildResponsiveLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;

        Widget content = _buildMainContent();

        // Envolver en container responsive
        if (isDesktop || isTablet) {
          content = Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 600 : 500,
              ),
              child: content,
            ),
          );
        }

        return content;
      },
    );
  }

  Widget _buildMainContent() {
    if (widget.config.state == DSProfileState.skeleton) {
      return _buildSkeletonView();
    }

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: _buildFormContent(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFormContent() {
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    return _a11yHelper.buildSemanticForm(
      child: Form(
        key: _formKey,
        onChanged: _handleFormChanged,
        child: CustomScrollView(
          physics: _platformAdapter.getScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: spacing.screenPadding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildFieldItem(widget.config.fields[index]),
                  childCount: widget.config.fields.length,
                ),
              ),
            ),
            if (_hasActionFields())
              SliverPadding(
                padding: spacing.screenPadding,
                sliver: SliverToBoxAdapter(
                  child: _buildActionButtons(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldItem(DSProfileField field) {
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    Widget fieldWidget;

    switch (field.type) {
      case DSProfileFieldType.header:
        fieldWidget = _buildHeaderField(field);
        break;
      case DSProfileFieldType.text:
      case DSProfileFieldType.email:
      case DSProfileFieldType.phone:
        fieldWidget = _buildTextFormField(field);
        break;
      case DSProfileFieldType.toggle:
        fieldWidget = _buildToggleField(field);
        break;
      case DSProfileFieldType.select:
        fieldWidget = _buildSelectField(field);
        break;
      case DSProfileFieldType.slider:
        fieldWidget = _buildSliderField(field);
        break;
      case DSProfileFieldType.date:
        fieldWidget = _buildDateField(field);
        break;
      case DSProfileFieldType.color:
        fieldWidget = _buildColorField(field);
        break;
      case DSProfileFieldType.file:
        fieldWidget = _buildFileField(field);
        break;
      case DSProfileFieldType.divider:
        fieldWidget = _buildDividerField();
        break;
      case DSProfileFieldType.actions:
        fieldWidget = const SizedBox.shrink(); // Manejado separadamente
        break;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: spacing.fieldSpacing),
      child: fieldWidget,
    );
  }

  Widget _buildHeaderField(DSProfileField field) {
    final typography = widget.config.typography ?? const DSProfileTypography();
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    return _a11yHelper.buildSemanticHeader(
      label: field.label,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: spacing.sectionSpacing,
          bottom: spacing.smallSpacing,
        ),
        child: Text(
          field.label,
          style: typography.sectionHeaderStyle ??
                 Theme.of(context).textTheme.headlineSmall?.copyWith(
                   color: colors.textColor,
                   fontWeight: FontWeight.w600,
                 ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final controller = _controllers[field.id];
    final focusNode = _focusNodes[field.id];

    return _a11yHelper.buildSemanticTextField(
      field: field,
      value: controller?.text,
      errorMessage: _formData.errors[field.id],
      child: Container(
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: _getFieldBorderColor(field),
            width: _getFieldBorderWidth(field),
          ),
        ),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          enabled: field.enabled && widget.enabled,
          readOnly: field.readonly,
          keyboardType: _getKeyboardType(field.type),
          textInputAction: _getTextInputAction(field),
          autocorrect: field.type != DSProfileFieldType.email,
          autofillHints: _getAutofillHints(field.type),
          style: typography.fieldTextStyle ?? Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            labelText: field.label,
            labelStyle: typography.fieldLabelStyle,
            hintText: field.placeholder,
            hintStyle: typography.placeholderStyle,
            helperText: field.description,
            helperStyle: typography.helperTextStyle,
            errorText: _formData.errors[field.id],
            errorStyle: typography.errorTextStyle,
            prefixIcon: field.icon != null ? Icon(field.icon) : null,
            suffixIcon: _buildFieldSuffixIcon(field),
            border: InputBorder.none,
            contentPadding: spacing.fieldPadding,
          ),
          validator: (value) => _validateField(field, value),
          onChanged: (value) => _handleFieldValueChanged(field.id, value),
          onFieldSubmitted: (_) => _focusNextField(field.id),
        ),
      ),
    );
  }

  Widget _buildToggleField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final value = _formData.values[field.id] as bool? ?? false;

    return _a11yHelper.buildSemanticSwitch(
      field: field,
      value: value,
      child: Container(
        padding: spacing.fieldPadding,
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
        ),
        child: Row(
          children: [
            if (field.icon != null) ...[
              Icon(
                field.icon,
                color: colors.iconColor ?? Theme.of(context).colorScheme.onSurface,
              ),
              SizedBox(width: spacing.smallSpacing),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.label,
                    style: typography.fieldLabelStyle ??
                           Theme.of(context).textTheme.bodyLarge?.copyWith(
                             fontWeight: FontWeight.w500,
                           ),
                  ),
                  if (field.description != null) ...[
                    SizedBox(height: spacing.smallSpacing / 2),
                    Text(
                      field.description!,
                      style: typography.descriptionStyle ??
                             Theme.of(context).textTheme.bodySmall?.copyWith(
                               color: colors.secondaryTextColor,
                             ),
                    ),
                  ],
                ],
              ),
            ),
            Switch.adaptive(
              value: value,
              onChanged: field.enabled && widget.enabled
                  ? (newValue) => _handleFieldValueChanged(field.id, newValue)
                  : null,
              activeThumbColor: colors.switchActiveColor ?? Theme.of(context).colorScheme.primary,
              inactiveThumbColor: colors.switchInactiveColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final currentValue = _formData.values[field.id];

    return _a11yHelper.buildSemanticDropdown(
      field: field,
      value: currentValue,
      child: Container(
        padding: spacing.fieldPadding,
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
        ),
        child: DropdownButtonFormField<Object>(
          initialValue: currentValue,
          items: field.options.map((option) {
            return DropdownMenuItem<Object>(
              value: option.value,
              enabled: option.enabled,
              child: Row(
                children: [
                  if (option.icon != null) ...[
                    Icon(option.icon, size: 20),
                    SizedBox(width: spacing.smallSpacing),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          option.label,
                          style: typography.fieldTextStyle,
                        ),
                        if (option.description != null)
                          Text(
                            option.description!,
                            style: typography.descriptionStyle?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: field.enabled && widget.enabled
              ? (value) => _handleFieldValueChanged(field.id, value)
              : null,
          decoration: InputDecoration(
            labelText: field.label,
            labelStyle: typography.fieldLabelStyle,
            hintText: field.placeholder,
            helperText: field.description,
            border: InputBorder.none,
            prefixIcon: field.icon != null ? Icon(field.icon) : null,
          ),
          style: typography.fieldTextStyle,
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
      ),
    );
  }

  Widget _buildSliderField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final value = (_formData.values[field.id] as num?)?.toDouble() ?? 0.0;
    final config = field.config ?? {};
    final min = (config['min'] as num?)?.toDouble() ?? 0.0;
    final max = (config['max'] as num?)?.toDouble() ?? 100.0;
    final divisions = config['divisions'] as int?;

    return _a11yHelper.buildSemanticSlider(
      field: field,
      value: value,
      child: Container(
        padding: spacing.fieldPadding,
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (field.icon != null) ...[
                  Icon(field.icon),
                  SizedBox(width: spacing.smallSpacing),
                ],
                Expanded(
                  child: Text(
                    field.label,
                    style: typography.fieldLabelStyle,
                  ),
                ),
                Text(
                  value.toStringAsFixed(divisions != null ? 0 : 1),
                  style: typography.fieldTextStyle?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (field.description != null) ...[
              SizedBox(height: spacing.smallSpacing / 2),
              Text(
                field.description!,
                style: typography.descriptionStyle,
              ),
            ],
            Slider.adaptive(
              value: value,
              min: min,
              max: max,
              divisions: divisions,
              label: value.toString(),
              onChanged: field.enabled && widget.enabled
                  ? (newValue) => _handleFieldValueChanged(field.id, newValue)
                  : null,
              activeColor: colors.sliderActiveColor ?? Theme.of(context).colorScheme.primary,
              inactiveColor: colors.sliderTrackColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final value = _formData.values[field.id] as DateTime?;
    final displayText = value?.toString().split(' ')[0] ?? field.placeholder ?? 'Seleccionar fecha';

    return _a11yHelper.buildSemanticButton(
      label: '${field.label}: $displayText',
      hint: 'Toca para seleccionar fecha',
      enabled: field.enabled && widget.enabled,
      onTap: () => _showDatePicker(field),
      child: Container(
        padding: spacing.fieldPadding,
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
        ),
        child: Row(
          children: [
            if (field.icon != null) ...[
              Icon(field.icon),
              SizedBox(width: spacing.smallSpacing),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.label,
                    style: typography.fieldLabelStyle,
                  ),
                  SizedBox(height: spacing.smallSpacing / 2),
                  Text(
                    displayText,
                    style: typography.fieldTextStyle?.copyWith(
                      color: value != null
                          ? colors.textColor
                          : colors.placeholderTextColor,
                    ),
                  ),
                  if (field.description != null) ...[
                    SizedBox(height: spacing.smallSpacing / 2),
                    Text(
                      field.description!,
                      style: typography.descriptionStyle,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.calendar_today,
              color: colors.iconColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final value = _formData.values[field.id] as Color? ?? Colors.blue;

    return _a11yHelper.buildSemanticButton(
      label: '${field.label}: Color seleccionado',
      hint: 'Toca para cambiar color',
      enabled: field.enabled && widget.enabled,
      onTap: () => _showColorPicker(field),
      child: Container(
        padding: spacing.fieldPadding,
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
        ),
        child: Row(
          children: [
            if (field.icon != null) ...[
              Icon(field.icon),
              SizedBox(width: spacing.smallSpacing),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.label,
                    style: typography.fieldLabelStyle,
                  ),
                  if (field.description != null) ...[
                    SizedBox(height: spacing.smallSpacing / 2),
                    Text(
                      field.description!,
                      style: typography.descriptionStyle,
                    ),
                  ],
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: value,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileField(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();

    final value = _formData.values[field.id] as String?;

    return _a11yHelper.buildSemanticButton(
      label: '${field.label}: ${value ?? "Ningún archivo seleccionado"}',
      hint: 'Toca para seleccionar archivo',
      enabled: field.enabled && widget.enabled,
      onTap: () => _showFilePicker(field),
      child: Container(
        padding: spacing.fieldPadding,
        decoration: BoxDecoration(
          color: colors.fieldBackgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
        ),
        child: Row(
          children: [
            if (field.icon != null) ...[
              Icon(field.icon),
              SizedBox(width: spacing.smallSpacing),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.label,
                    style: typography.fieldLabelStyle,
                  ),
                  SizedBox(height: spacing.smallSpacing / 2),
                  Text(
                    value ?? field.placeholder ?? 'Seleccionar archivo',
                    style: typography.fieldTextStyle?.copyWith(
                      color: value != null
                          ? colors.textColor
                          : colors.placeholderTextColor,
                    ),
                  ),
                  if (field.description != null) ...[
                    SizedBox(height: spacing.smallSpacing / 2),
                    Text(
                      field.description!,
                      style: typography.descriptionStyle,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.attach_file,
              color: colors.iconColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerField() {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing.smallSpacing),
      child: Divider(
        color: colors.dividerColor ?? Theme.of(context).colorScheme.outline,
        thickness: 1,
      ),
    );
  }

  Widget _buildActionButtons() {
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    return Padding(
      padding: EdgeInsets.only(top: spacing.sectionSpacing),
      child: Row(
        children: [
          if (widget.onCancel != null)
            Expanded(
              child: _buildSecondaryButton(),
            ),
          if (widget.onCancel != null && widget.onSave != null)
            SizedBox(width: spacing.smallSpacing),
          if (widget.onSave != null)
            Expanded(
              flex: widget.onCancel != null ? 1 : 1,
              child: _buildPrimaryButton(),
            ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton() {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();
    final a11yConfig = widget.config.a11yConfig ?? const DSProfileA11yConfig();

    final isEnabled = _canSave() && !_isSubmitting && widget.enabled;

    return SizedBox(
      height: spacing.buttonMinHeight,
      child: ElevatedButton(
        onPressed: isEnabled ? _saveForm : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? colors.primaryButtonColor ?? Theme.of(context).colorScheme.primary
              : colors.disabledButtonColor,
          foregroundColor: isEnabled
              ? colors.primaryButtonTextColor ?? Theme.of(context).colorScheme.onPrimary
              : colors.disabledButtonTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
          ),
          padding: spacing.buttonPadding,
        ),
        child: _isSubmitting
            ? _buildLoadingIndicator()
            : Text(
                a11yConfig.saveButtonSemanticLabel,
                style: typography.buttonTextStyle?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final typography = widget.config.typography ?? const DSProfileTypography();
    final a11yConfig = widget.config.a11yConfig ?? const DSProfileA11yConfig();

    return SizedBox(
      height: spacing.buttonMinHeight,
      child: OutlinedButton(
        onPressed: widget.enabled && !_isSubmitting ? widget.onCancel : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.secondaryButtonTextColor ?? Theme.of(context).colorScheme.onSurface,
          side: BorderSide(
            color: colors.borderColor ?? Theme.of(context).colorScheme.outline,
            width: spacing.borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
          ),
          padding: spacing.buttonPadding,
        ),
        child: Text(
          a11yConfig.cancelButtonSemanticLabel,
          style: typography.buttonTextStyle,
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    final colors = widget.config.colors ?? const DSProfileColors();

    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          colors.primaryButtonTextColor ?? Colors.white,
        ),
      ),
    );
  }

  Widget _buildSkeletonView() {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return _buildSkeletonContent();
      },
    );
  }

  Widget _buildSkeletonContent() {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    return Padding(
      padding: spacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header skeleton
          _buildSkeletonBox(
            width: 200,
            height: 24,
            color: colors.skeletonBaseColor,
          ),
          SizedBox(height: spacing.sectionSpacing),

          // Field skeletons
          ...List.generate(5, (index) => Padding(
            padding: EdgeInsets.only(bottom: spacing.fieldSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSkeletonBox(
                  width: 100 + (index * 20).toDouble(),
                  height: 16,
                  color: colors.skeletonBaseColor,
                ),
                SizedBox(height: spacing.smallSpacing),
                _buildSkeletonBox(
                  width: double.infinity,
                  height: spacing.fieldMinHeight,
                  color: colors.skeletonBaseColor,
                ),
              ],
            ),
          )),

          SizedBox(height: spacing.sectionSpacing),

          // Button skeletons
          Row(
            children: [
              Expanded(
                child: _buildSkeletonBox(
                  width: double.infinity,
                  height: spacing.buttonMinHeight,
                  color: colors.skeletonBaseColor,
                ),
              ),
              SizedBox(width: spacing.smallSpacing),
              Expanded(
                child: _buildSkeletonBox(
                  width: double.infinity,
                  height: spacing.buttonMinHeight,
                  color: colors.skeletonBaseColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonBox({
    required double width,
    required double height,
    Color? color,
  }) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final spacing = widget.config.spacing ?? const DSProfileSpacing();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing.fieldBorderRadius / 2),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            color ?? colors.skeletonBaseColor ?? Colors.grey[300]!,
            colors.skeletonHighlightColor ?? Colors.grey[100]!,
            color ?? colors.skeletonBaseColor ?? Colors.grey[300]!,
          ],
          stops: [
            0.0,
            _skeletonAnimation.value,
            1.0,
          ],
        ),
      ),
    );
  }

  // Helpers para campos de texto

  TextInputType _getKeyboardType(DSProfileFieldType type) {
    switch (type) {
      case DSProfileFieldType.email:
        return TextInputType.emailAddress;
      case DSProfileFieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  TextInputAction _getTextInputAction(DSProfileField field) {
    final fieldIndex = widget.config.fields.indexOf(field);
    final isLastField = fieldIndex == widget.config.fields.length - 1;
    return isLastField ? TextInputAction.done : TextInputAction.next;
  }

  List<String> _getAutofillHints(DSProfileFieldType type) {
    switch (type) {
      case DSProfileFieldType.email:
        return [AutofillHints.email];
      case DSProfileFieldType.phone:
        return [AutofillHints.telephoneNumber];
      case DSProfileFieldType.text:
        return [AutofillHints.name];
      default:
        return [];
    }
  }

  Widget? _buildFieldSuffixIcon(DSProfileField field) {
    if (field.type == DSProfileFieldType.email) {
      final isValid = _formData.errors[field.id] == null;
      final hasValue = _controllers[field.id]?.text.isNotEmpty ?? false;

      if (hasValue) {
        return Icon(
          isValid ? Icons.check_circle : Icons.error,
          color: isValid ? Colors.green : Colors.red,
        );
      }
    }

    return null;
  }

  Color _getFieldBorderColor(DSProfileField field) {
    final colors = widget.config.colors ?? const DSProfileColors();
    final focusNode = _focusNodes[field.id];
    final hasError = _formData.errors[field.id] != null;

    if (hasError) {
      return colors.errorBorderColor ?? Colors.red;
    }

    if (focusNode?.hasFocus ?? false) {
      return colors.focusedBorderColor ?? Theme.of(context).colorScheme.primary;
    }

    return colors.borderColor ?? Theme.of(context).colorScheme.outline;
  }

  double _getFieldBorderWidth(DSProfileField field) {
    final spacing = widget.config.spacing ?? const DSProfileSpacing();
    final focusNode = _focusNodes[field.id];

    if (focusNode?.hasFocus ?? false) {
      return spacing.focusedBorderWidth;
    }

    return spacing.borderWidth;
  }

  // Event handlers

  void _handleFieldChanged(String fieldId) {
    final controller = _controllers[fieldId];
    if (controller != null) {
      _handleFieldValueChanged(fieldId, controller.text);
    }
  }

  void _handleFocusChanged(String fieldId) {
    setState(() {
      // Trigger rebuild to update border colors
    });
  }

  void _handleFieldValueChanged(String fieldId, Object? value) {
    setState(() {
      _formData = _formData.copyWith(
        values: {..._formData.values, fieldId: value},
        hasUnsavedChanges: true,
        lastModified: DateTime.now(),
      );
    });

    // Validar en tiempo real si está habilitado
    final behavior = widget.config.behavior ?? const DSProfileBehavior();
    if (behavior.realtimeValidation) {
      _validateField(widget.config.fields.firstWhere((f) => f.id == fieldId), value);
    }

    _handleFormChanged();
  }

  void _handleFormChanged() {
    widget.onFormChanged?.call(_formData);
  }

  void _focusNextField(String currentFieldId) {
    final currentIndex = widget.config.fields.indexWhere((f) => f.id == currentFieldId);
    if (currentIndex >= 0 && currentIndex < widget.config.fields.length - 1) {
      final nextField = widget.config.fields[currentIndex + 1];
      final nextFocusNode = _focusNodes[nextField.id];
      nextFocusNode?.requestFocus();
    } else {
      // Si es el último campo, quitar el foco
      FocusScope.of(context).unfocus();
    }
  }

  // Validation

  String? _validateField(DSProfileField field, Object? value) {
    final validation = field.validation;
    if (validation == null) return null;

    // Validación de requerido
    if (field.required && (value == null || value.toString().trim().isEmpty)) {
      return validation.errorMessage ?? 'Este campo es requerido';
    }

    if (value == null || value.toString().isEmpty) return null;

    final stringValue = value.toString();

    // Validación de longitud mínima
    if (validation.minLength != null && stringValue.length < validation.minLength!) {
      return validation.errorMessage ?? 'Debe tener al menos ${validation.minLength} caracteres';
    }

    // Validación de longitud máxima
    if (validation.maxLength != null && stringValue.length > validation.maxLength!) {
      return validation.errorMessage ?? 'No puede tener más de ${validation.maxLength} caracteres';
    }

    // Validación de patrón
    if (validation.pattern != null) {
      final regex = RegExp(validation.pattern!);
      if (!regex.hasMatch(stringValue)) {
        return validation.errorMessage ?? 'Formato inválido';
      }
    }

    // Validación personalizada
    if (validation.validator != null) {
      final result = validation.validator!(value);
      if (result != null) return result;
    }

    // Validaciones por tipo de campo
    switch (field.type) {
      case DSProfileFieldType.email:
        return DSProfileValidators.email(value);
      case DSProfileFieldType.phone:
        return DSProfileValidators.phone(value);
      default:
        break;
    }

    return null;
  }

  bool _validateForm() {
    final errors = <String, String>{};
    bool isValid = true;

    for (final field in widget.config.fields) {
      final value = _formData.values[field.id];
      final error = _validateField(field, value);

      if (error != null) {
        errors[field.id] = error;
        isValid = false;
      }
    }

    setState(() {
      _formData = _formData.copyWith(
        errors: errors,
        isValid: isValid,
      );
    });

    return isValid;
  }

  bool _canSave() {
    return _formData.hasUnsavedChanges && _formData.isValid;
  }

  bool _hasActionFields() {
    return widget.onSave != null || widget.onCancel != null;
  }

  // Actions

  Future<void> _saveForm() async {
    if (!_validateForm()) {
      _a11yHelper.announceError('Hay errores en el formulario');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final saveData = _formData.copyWith(
        saveAttempts: _formData.saveAttempts + 1,
        lastSaveAttempt: DateTime.now(),
      );

      widget.onSave?.call(saveData);

      setState(() {
        _formData = _formData.copyWith(
          hasUnsavedChanges: false,
        );
      });

      _a11yHelper.announceSuccess('Preferencias guardadas exitosamente');

    } catch (e) {
      _a11yHelper.announceError('Error al guardar: $e');
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void _performAutoSave() {
    if (_canSave() && !_isSubmitting) {
      _saveForm();
    }
  }

  // Pickers

  Future<void> _showDatePicker(DSProfileField field) async {
    final currentValue = _formData.values[field.id] as DateTime?;
    final config = field.config ?? {};

    final firstDate = config['firstDate'] as DateTime? ?? DateTime(1900);
    final lastDate = config['lastDate'] as DateTime? ?? DateTime(2100);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentValue ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      _handleFieldValueChanged(field.id, pickedDate);
    }
  }

  Future<void> _showColorPicker(DSProfileField field) async {
    // Implementación simplificada - en un caso real usarías un color picker completo
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    final selectedColor = await showDialog<Color>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Seleccionar ${field.label}'),
        content: Wrap(
          spacing: 8,
          children: colors.map((color) => GestureDetector(
            onTap: () => Navigator.of(context).pop(color),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
            ),
          )).toList(),
        ),
      ),
    );

    if (selectedColor != null) {
      _handleFieldValueChanged(field.id, selectedColor);
    }
  }

  Future<void> _showFilePicker(DSProfileField field) async {
    // Implementación simplificada - en un caso real usarías file_picker
    final fileName = 'archivo_seleccionado.pdf';
    _handleFieldValueChanged(field.id, fileName);

    _a11yHelper.announceSuccess('Archivo seleccionado: $fileName');
  }
}