import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/ds_checkout_forms_config.dart';

/// Adaptador de plataforma para DSCheckoutForms
///
/// Maneja las diferencias de renderizado entre Android, iOS y Web
/// para proporcionar una experiencia nativa en cada plataforma
class DSCheckoutFormsPlatformAdapter {
  /// Construye el formulario adaptado a la plataforma
  Widget buildForm({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutVariant variant,
    required DSCheckoutState state,
    required List<DSCheckoutField> fields,
    required DSCheckoutFormData formData,
    required GlobalKey<FormState> formKey,
    required Map<String, TextEditingController> controllers,
    required Map<String, FocusNode> focusNodes,
    required VoidCallback onSubmit,
    required bool isSubmitting,
    required bool readOnly,
    String? submitButtonText,
    Widget? customSubmitButton,
    bool showSubmitButton = true,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, String Function(String?)>? validators,
    Function(String, dynamic)? onFieldChanged,
    Function(String, bool)? onFocusChanged,
    AnimationController? submitAnimationController,
  }) {
    if (kIsWeb) {
      return _buildWebForm(
        context: context,
        config: config,
        variant: variant,
        state: state,
        fields: fields,
        formData: formData,
        formKey: formKey,
        controllers: controllers,
        focusNodes: focusNodes,
        onSubmit: onSubmit,
        isSubmitting: isSubmitting,
        readOnly: readOnly,
        submitButtonText: submitButtonText,
        customSubmitButton: customSubmitButton,
        showSubmitButton: showSubmitButton,
        fieldDecorations: fieldDecorations,
        validators: validators,
        onFieldChanged: onFieldChanged,
        onFocusChanged: onFocusChanged,
        submitAnimationController: submitAnimationController,
      );
    } else if (Platform.isIOS) {
      return _buildIOSForm(
        context: context,
        config: config,
        variant: variant,
        state: state,
        fields: fields,
        formData: formData,
        formKey: formKey,
        controllers: controllers,
        focusNodes: focusNodes,
        onSubmit: onSubmit,
        isSubmitting: isSubmitting,
        readOnly: readOnly,
        submitButtonText: submitButtonText,
        customSubmitButton: customSubmitButton,
        showSubmitButton: showSubmitButton,
        fieldDecorations: fieldDecorations,
        validators: validators,
        onFieldChanged: onFieldChanged,
        onFocusChanged: onFocusChanged,
        submitAnimationController: submitAnimationController,
      );
    } else {
      return _buildAndroidForm(
        context: context,
        config: config,
        variant: variant,
        state: state,
        fields: fields,
        formData: formData,
        formKey: formKey,
        controllers: controllers,
        focusNodes: focusNodes,
        onSubmit: onSubmit,
        isSubmitting: isSubmitting,
        readOnly: readOnly,
        submitButtonText: submitButtonText,
        customSubmitButton: customSubmitButton,
        showSubmitButton: showSubmitButton,
        fieldDecorations: fieldDecorations,
        validators: validators,
        onFieldChanged: onFieldChanged,
        onFocusChanged: onFocusChanged,
        submitAnimationController: submitAnimationController,
      );
    }
  }

  /// Construye el formulario para Web
  Widget _buildWebForm({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutVariant variant,
    required DSCheckoutState state,
    required List<DSCheckoutField> fields,
    required DSCheckoutFormData formData,
    required GlobalKey<FormState> formKey,
    required Map<String, TextEditingController> controllers,
    required Map<String, FocusNode> focusNodes,
    required VoidCallback onSubmit,
    required bool isSubmitting,
    required bool readOnly,
    String? submitButtonText,
    Widget? customSubmitButton,
    bool showSubmitButton = true,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, String Function(String?)>? validators,
    Function(String, dynamic)? onFieldChanged,
    Function(String, bool)? onFocusChanged,
    AnimationController? submitAnimationController,
  }) {
    final theme = Theme.of(context);
    final spacing = config.spacing ?? const DSCheckoutSpacing();
    final colors = config.colors ?? const DSCheckoutColors();

    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: EdgeInsets.all(spacing.padding),
      decoration: BoxDecoration(
        color: colors.backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        boxShadow: [
          BoxShadow(
            color: colors.shadowColor ?? theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormHeader(context, config, variant),
            SizedBox(height: spacing.sectionSpacing),
            _buildWebFieldsGrid(
              context: context,
              config: config,
              state: state,
              fields: fields,
              formData: formData,
              controllers: controllers,
              focusNodes: focusNodes,
              readOnly: readOnly,
              fieldDecorations: fieldDecorations,
              validators: validators,
              onFieldChanged: onFieldChanged,
              onFocusChanged: onFocusChanged,
            ),
            if (showSubmitButton) ...[
              SizedBox(height: spacing.buttonSpacing * 2),
              _buildSubmitButton(
                context: context,
                config: config,
                onSubmit: onSubmit,
                isSubmitting: isSubmitting,
                submitButtonText: submitButtonText,
                customSubmitButton: customSubmitButton,
                submitAnimationController: submitAnimationController,
                isValid: formData.isValid,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Construye el formulario para iOS
  Widget _buildIOSForm({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutVariant variant,
    required DSCheckoutState state,
    required List<DSCheckoutField> fields,
    required DSCheckoutFormData formData,
    required GlobalKey<FormState> formKey,
    required Map<String, TextEditingController> controllers,
    required Map<String, FocusNode> focusNodes,
    required VoidCallback onSubmit,
    required bool isSubmitting,
    required bool readOnly,
    String? submitButtonText,
    Widget? customSubmitButton,
    bool showSubmitButton = true,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, String Function(String?)>? validators,
    Function(String, dynamic)? onFieldChanged,
    Function(String, bool)? onFocusChanged,
    AnimationController? submitAnimationController,
  }) {
    final spacing = config.spacing ?? const DSCheckoutSpacing();

    return CupertinoFormSection.insetGrouped(
      margin: EdgeInsets.all(spacing.margin),
      children: [
        ...fields.map((field) => _buildIOSField(
              context: context,
              config: config,
              field: field,
              formData: formData,
              controller: controllers[field.key]!,
              focusNode: focusNodes[field.key]!,
              readOnly: readOnly,
              decoration: fieldDecorations?[field.key],
              validator: validators?[field.key],
              onChanged: (value) => onFieldChanged?.call(field.key, value),
              onFocusChanged: (hasFocus) => onFocusChanged?.call(field.key, hasFocus),
            )),
        if (showSubmitButton)
          _buildIOSSubmitButton(
            context: context,
            config: config,
            onSubmit: onSubmit,
            isSubmitting: isSubmitting,
            submitButtonText: submitButtonText,
            isValid: formData.isValid,
          ),
      ],
    );
  }

  /// Construye el formulario para Android
  Widget _buildAndroidForm({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutVariant variant,
    required DSCheckoutState state,
    required List<DSCheckoutField> fields,
    required DSCheckoutFormData formData,
    required GlobalKey<FormState> formKey,
    required Map<String, TextEditingController> controllers,
    required Map<String, FocusNode> focusNodes,
    required VoidCallback onSubmit,
    required bool isSubmitting,
    required bool readOnly,
    String? submitButtonText,
    Widget? customSubmitButton,
    bool showSubmitButton = true,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, String Function(String?)>? validators,
    Function(String, dynamic)? onFieldChanged,
    Function(String, bool)? onFocusChanged,
    AnimationController? submitAnimationController,
  }) {
    final spacing = config.spacing ?? const DSCheckoutSpacing();

    return Padding(
      padding: EdgeInsets.all(spacing.padding),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormHeader(context, config, variant),
            SizedBox(height: spacing.sectionSpacing),
            ...fields.map((field) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.fieldSpacing),
                  child: _buildAndroidField(
                    context: context,
                    config: config,
                    field: field,
                    formData: formData,
                    controller: controllers[field.key]!,
                    focusNode: focusNodes[field.key]!,
                    readOnly: readOnly,
                    decoration: fieldDecorations?[field.key],
                    validator: validators?[field.key],
                    onChanged: (value) => onFieldChanged?.call(field.key, value),
                    onFocusChanged: (hasFocus) => onFocusChanged?.call(field.key, hasFocus),
                  ),
                )),
            if (showSubmitButton) ...[
              SizedBox(height: spacing.buttonSpacing),
              _buildSubmitButton(
                context: context,
                config: config,
                onSubmit: onSubmit,
                isSubmitting: isSubmitting,
                submitButtonText: submitButtonText,
                customSubmitButton: customSubmitButton,
                submitAnimationController: submitAnimationController,
                isValid: formData.isValid,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Construye el header del formulario
  Widget _buildFormHeader(
    BuildContext context,
    DSCheckoutFormsConfig config,
    DSCheckoutVariant variant,
  ) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();

    return Row(
      children: [
        Icon(
          variant.icon,
          color: colors.headerColor ?? theme.colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                variant.displayName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.headerTextColor ?? theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                variant.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.helperTextColor ?? theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Construye la cuadrícula de campos para Web
  Widget _buildWebFieldsGrid({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutState state,
    required List<DSCheckoutField> fields,
    required DSCheckoutFormData formData,
    required Map<String, TextEditingController> controllers,
    required Map<String, FocusNode> focusNodes,
    required bool readOnly,
    Map<String, InputDecoration>? fieldDecorations,
    Map<String, String Function(String?)>? validators,
    Function(String, dynamic)? onFieldChanged,
    Function(String, bool)? onFocusChanged,
  }) {
    final spacing = config.spacing ?? const DSCheckoutSpacing();

    // Agrupar campos por filas basado en flex
    final rows = <List<DSCheckoutField>>[];
    List<DSCheckoutField> currentRow = [];
    int currentRowFlex = 0;

    for (final field in fields) {
      if (currentRowFlex + field.flex > 3 || field.flex >= 2) {
        if (currentRow.isNotEmpty) {
          rows.add(currentRow);
          currentRow = [];
          currentRowFlex = 0;
        }
      }

      currentRow.add(field);
      currentRowFlex += field.flex;

      if (currentRowFlex >= 3) {
        rows.add(currentRow);
        currentRow = [];
        currentRowFlex = 0;
      }
    }

    if (currentRow.isNotEmpty) {
      rows.add(currentRow);
    }

    return Column(
      children: rows.map((rowFields) {
        return Padding(
          padding: EdgeInsets.only(bottom: spacing.fieldSpacing),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowFields.asMap().entries.map((entry) {
              final field = entry.value;
              final isLast = entry.key == rowFields.length - 1;

              return Expanded(
                flex: field.flex,
                child: Padding(
                  padding: EdgeInsets.only(right: isLast ? 0 : spacing.fieldSpacing),
                  child: _buildWebField(
                    context: context,
                    config: config,
                    field: field,
                    formData: formData,
                    controller: controllers[field.key]!,
                    focusNode: focusNodes[field.key]!,
                    readOnly: readOnly,
                    decoration: fieldDecorations?[field.key],
                    validator: validators?[field.key],
                    onChanged: (value) => onFieldChanged?.call(field.key, value),
                    onFocusChanged: (hasFocus) => onFocusChanged?.call(field.key, hasFocus),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  /// Construye un campo para Web
  Widget _buildWebField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool readOnly,
    InputDecoration? decoration,
    String Function(String?)? validator,
    Function(String)? onChanged,
    Function(bool)? onFocusChanged,
  }) {
    return _buildBaseField(
      context: context,
      config: config,
      field: field,
      formData: formData,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      decoration: decoration,
      validator: validator,
      onChanged: onChanged,
      onFocusChanged: onFocusChanged,
      platformStyle: _PlatformStyle.web,
    );
  }

  /// Construye un campo para iOS
  Widget _buildIOSField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool readOnly,
    InputDecoration? decoration,
    String Function(String?)? validator,
    Function(String)? onChanged,
    Function(bool)? onFocusChanged,
  }) {
    if (field.type == DSCheckoutFieldType.checkbox) {
      return _buildIOSCheckboxField(
        context: context,
        config: config,
        field: field,
        formData: formData,
        onChanged: onChanged,
      );
    }

    return CupertinoFormRow(
      prefix: SizedBox(
        width: 100,
        child: Text(
          field.label,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      ),
      child: CupertinoTextFormFieldRow(
        controller: controller,
        focusNode: focusNode,
        placeholder: field.placeholder,
        keyboardType: field.type.keyboardType,
        obscureText: field.type.isSensitive && field.type == DSCheckoutFieldType.password,
        maxLines: field.maxLines,
        maxLength: field.maxLength,
        readOnly: readOnly || !field.enabled,
        onChanged: onChanged,
        validator: validator ?? (value) => _validateField(field, value, formData),
        inputFormatters: _getInputFormatters(field),
      ),
    );
  }

  /// Construye un campo de checkbox para iOS
  Widget _buildIOSCheckboxField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    Function(String)? onChanged,
  }) {
    final currentValue = formData.values[field.key] == true;

    return CupertinoFormRow(
      prefix: Text(field.label),
      child: CupertinoSwitch(
        value: currentValue,
        onChanged: (value) => onChanged?.call(value.toString()),
      ),
    );
  }

  /// Construye un campo para Android
  Widget _buildAndroidField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool readOnly,
    InputDecoration? decoration,
    String Function(String?)? validator,
    Function(String)? onChanged,
    Function(bool)? onFocusChanged,
  }) {
    return _buildBaseField(
      context: context,
      config: config,
      field: field,
      formData: formData,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      decoration: decoration,
      validator: validator,
      onChanged: onChanged,
      onFocusChanged: onFocusChanged,
      platformStyle: _PlatformStyle.android,
    );
  }

  /// Construye un campo base adaptable
  Widget _buildBaseField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool readOnly,
    required _PlatformStyle platformStyle,
    InputDecoration? decoration,
    String Function(String?)? validator,
    Function(String)? onChanged,
    Function(bool)? onFocusChanged,
  }) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();
    final spacing = config.spacing ?? const DSCheckoutSpacing();

    // Campos especiales
    if (field.type == DSCheckoutFieldType.checkbox) {
      return _buildCheckboxField(
        context: context,
        config: config,
        field: field,
        formData: formData,
        onChanged: onChanged,
      );
    }

    if (field.type == DSCheckoutFieldType.dropdown) {
      return _buildDropdownField(
        context: context,
        config: config,
        field: field,
        formData: formData,
        onChanged: onChanged,
      );
    }

    // Campo de texto estándar
    final effectiveDecoration = decoration ?? _buildInputDecoration(
      context: context,
      config: config,
      field: field,
      formData: formData,
      platformStyle: platformStyle,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (field.label.isNotEmpty) ...[
          _buildFieldLabel(context, config, field),
          SizedBox(height: spacing.labelSpacing),
        ],
        Focus(
          onFocusChange: onFocusChanged,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: effectiveDecoration,
            keyboardType: field.type.keyboardType,
            obscureText: field.type.isSensitive && field.type == DSCheckoutFieldType.password,
            maxLines: field.maxLines,
            maxLength: field.maxLength,
            readOnly: readOnly || !field.enabled,
            onChanged: onChanged,
            validator: validator ?? (value) => _validateField(field, value, formData),
            inputFormatters: _getInputFormatters(field),
            textInputAction: _getTextInputAction(field),
            autofillHints: _getAutofillHints(field),
          ),
        ),
        if (field.helperText != null) ...[
          SizedBox(height: spacing.helperSpacing),
          Text(
            field.helperText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.helperTextColor ?? theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  /// Construye la etiqueta del campo
  Widget _buildFieldLabel(
    BuildContext context,
    DSCheckoutFormsConfig config,
    DSCheckoutField field,
  ) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();

    return Row(
      children: [
        Text(
          field.label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: colors.labelColor ?? theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (field.required) ...[
          const SizedBox(width: 4),
          Text(
            '*',
            style: theme.textTheme.labelLarge?.copyWith(
              color: colors.requiredIndicatorColor ?? theme.colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }

  /// Construye un campo checkbox
  Widget _buildCheckboxField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    Function(String)? onChanged,
  }) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();
    final currentValue = formData.values[field.key] == true;

    return CheckboxListTile(
      value: currentValue,
      onChanged: field.enabled ? (value) => onChanged?.call(value.toString()) : null,
      title: Text(
        field.label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colors.textColor ?? theme.colorScheme.onSurface,
        ),
      ),
      subtitle: field.helperText != null
          ? Text(
              field.helperText!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.helperTextColor ?? theme.colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }

  /// Construye un campo dropdown
  Widget _buildDropdownField({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    Function(String)? onChanged,
  }) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();
    final spacing = config.spacing ?? const DSCheckoutSpacing();
    final currentValue = formData.values[field.key]?.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (field.label.isNotEmpty) ...[
          _buildFieldLabel(context, config, field),
          SizedBox(height: spacing.labelSpacing),
        ],
        DropdownButtonFormField<String>(
          initialValue: currentValue,
          items: field.options?.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: field.enabled ? (value) => onChanged?.call(value ?? '') : null,
          decoration: _buildInputDecoration(
            context: context,
            config: config,
            field: field,
            formData: formData,
            platformStyle: _PlatformStyle.android,
          ),
          validator: (value) => _validateField(field, value, formData),
        ),
        if (field.helperText != null) ...[
          SizedBox(height: spacing.helperSpacing),
          Text(
            field.helperText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.helperTextColor ?? theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  /// Construye la decoración del input
  InputDecoration _buildInputDecoration({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required DSCheckoutField field,
    required DSCheckoutFormData formData,
    required _PlatformStyle platformStyle,
  }) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();
    final spacing = config.spacing ?? const DSCheckoutSpacing();

    final validation = formData.validations[field.key];
    final hasError = validation?.isValid == false;
    final hasSuccess = validation?.isValid == true && validation?.level == DSCheckoutValidationLevel.success;

    Color? borderColor;
    if (hasError) {
      borderColor = colors.errorBorderColor ?? theme.colorScheme.error;
    } else if (hasSuccess) {
      borderColor = colors.successColor ?? Colors.green;
    } else {
      borderColor = colors.borderColor ?? theme.colorScheme.outline;
    }

    return InputDecoration(
      hintText: field.placeholder,
      hintStyle: TextStyle(
        color: colors.hintColor ?? theme.colorScheme.onSurfaceVariant,
      ),
      prefixIcon: field.prefixIcon != null
          ? Icon(
              field.prefixIcon,
              color: colors.prefixIconColor ?? theme.colorScheme.onSurfaceVariant,
            )
          : null,
      suffixIcon: _buildSuffixIcon(context, config, field, formData),
      prefixText: field.prefixText,
      suffixText: field.suffixText,
      filled: true,
      fillColor: field.enabled
          ? colors.backgroundColor ?? theme.colorScheme.surface
          : colors.disabledBackgroundColor ?? theme.disabledColor.withValues(alpha: 0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        borderSide: BorderSide(
          color: borderColor,
          width: spacing.borderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        borderSide: BorderSide(
          color: borderColor,
          width: spacing.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        borderSide: BorderSide(
          color: colors.focusedBorderColor ?? theme.colorScheme.primary,
          width: spacing.focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        borderSide: BorderSide(
          color: colors.errorBorderColor ?? theme.colorScheme.error,
          width: spacing.borderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        borderSide: BorderSide(
          color: colors.errorBorderColor ?? theme.colorScheme.error,
          width: spacing.focusedBorderWidth,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        borderSide: BorderSide(
          color: colors.disabledBorderColor ?? theme.disabledColor,
          width: spacing.borderWidth,
        ),
      ),
      errorText: hasError ? validation?.errorMessage : null,
      errorStyle: TextStyle(
        color: colors.errorColor ?? theme.colorScheme.error,
      ),
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.padding,
        vertical: spacing.padding * 0.75,
      ),
    );
  }

  /// Construye el ícono de sufijo
  Widget? _buildSuffixIcon(
    BuildContext context,
    DSCheckoutFormsConfig config,
    DSCheckoutField field,
    DSCheckoutFormData formData,
  ) {
    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();
    final validation = formData.validations[field.key];

    // Ícono de validación
    if (validation != null) {
      if (validation.isValid && validation.level == DSCheckoutValidationLevel.success) {
        return Icon(
          Icons.check_circle,
          color: colors.successColor ?? Colors.green,
          size: 20,
        );
      } else if (!validation.isValid) {
        return Icon(
          Icons.error,
          color: colors.errorColor ?? theme.colorScheme.error,
          size: 20,
        );
      }
    }

    // Ícono personalizado del campo
    if (field.suffixIcon != null) {
      return Icon(
        field.suffixIcon,
        color: colors.suffixIconColor ?? theme.colorScheme.onSurfaceVariant,
      );
    }

    // Ícono específico del tipo de campo
    switch (field.type) {
      case DSCheckoutFieldType.creditCard:
        return const Icon(Icons.credit_card, size: 20);
      case DSCheckoutFieldType.email:
        return const Icon(Icons.email, size: 20);
      case DSCheckoutFieldType.phone:
        return const Icon(Icons.phone, size: 20);
      case DSCheckoutFieldType.password:
        return const Icon(Icons.visibility_off, size: 20);
      default:
        return null;
    }
  }

  /// Construye el botón de envío
  Widget _buildSubmitButton({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required VoidCallback onSubmit,
    required bool isSubmitting,
    String? submitButtonText,
    Widget? customSubmitButton,
    AnimationController? submitAnimationController,
    required bool isValid,
  }) {
    if (customSubmitButton != null) {
      return customSubmitButton;
    }

    final theme = Theme.of(context);
    final colors = config.colors ?? const DSCheckoutColors();

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: (isValid && !isSubmitting) ? onSubmit : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.buttonPrimaryColor ?? theme.colorScheme.primary,
          foregroundColor: colors.buttonTextColor ?? theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isSubmitting
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colors.buttonTextColor ?? theme.colorScheme.onPrimary,
                  ),
                ),
              )
            : Text(
                submitButtonText ?? 'Enviar',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  /// Construye el botón de envío para iOS
  Widget _buildIOSSubmitButton({
    required BuildContext context,
    required DSCheckoutFormsConfig config,
    required VoidCallback onSubmit,
    required bool isSubmitting,
    String? submitButtonText,
    required bool isValid,
  }) {
    return CupertinoButton.filled(
      onPressed: (isValid && !isSubmitting) ? onSubmit : null,
      child: isSubmitting
          ? const CupertinoActivityIndicator(color: CupertinoColors.white)
          : Text(submitButtonText ?? 'Enviar'),
    );
  }

  /// Valida un campo
  String? _validateField(
    DSCheckoutField field,
    String? value,
    DSCheckoutFormData formData,
  ) {
    final validation = formData.validations[field.key];
    return validation?.isValid == false ? validation?.errorMessage : null;
  }

  /// Obtiene los formateadores de input
  List<TextInputFormatter> _getInputFormatters(DSCheckoutField field) {
    final formatters = <TextInputFormatter>[];

    // Longitud máxima
    if (field.maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(field.maxLength));
    }

    // Formatters específicos por tipo
    switch (field.type) {
      case DSCheckoutFieldType.number:
      case DSCheckoutFieldType.cvv:
      case DSCheckoutFieldType.postalCode:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;

      case DSCheckoutFieldType.creditCard:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        formatters.add(LengthLimitingTextInputFormatter(16));
        break;

      case DSCheckoutFieldType.expiryDate:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        formatters.add(LengthLimitingTextInputFormatter(4));
        break;

      case DSCheckoutFieldType.phone:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\d\+\-\(\)\s]')));
        break;

      default:
        break;
    }

    return formatters;
  }

  /// Obtiene la acción del teclado
  TextInputAction _getTextInputAction(DSCheckoutField field) {
    if (field.maxLines > 1) {
      return TextInputAction.newline;
    }
    return TextInputAction.next;
  }

  /// Obtiene las sugerencias de autocompletado
  Iterable<String>? _getAutofillHints(DSCheckoutField field) {
    switch (field.type) {
      case DSCheckoutFieldType.email:
        return [AutofillHints.email];
      case DSCheckoutFieldType.phone:
        return [AutofillHints.telephoneNumber];
      case DSCheckoutFieldType.text:
        if (field.key.toLowerCase().contains('name')) {
          return [AutofillHints.name];
        }
        if (field.key.toLowerCase().contains('address')) {
          return [AutofillHints.streetAddressLine1];
        }
        break;
      case DSCheckoutFieldType.creditCard:
        return [AutofillHints.creditCardNumber];
      case DSCheckoutFieldType.expiryDate:
        return [AutofillHints.creditCardExpirationDate];
      case DSCheckoutFieldType.cvv:
        return [AutofillHints.creditCardSecurityCode];
      case DSCheckoutFieldType.postalCode:
        return [AutofillHints.postalCode];
      case DSCheckoutFieldType.city:
        return [AutofillHints.addressCity];
      case DSCheckoutFieldType.state:
        return [AutofillHints.addressState];
      case DSCheckoutFieldType.country:
        return [AutofillHints.countryName];
      default:
        break;
    }
    return null;
  }
}

/// Estilos de plataforma
enum _PlatformStyle {
  android,
  web,
}

