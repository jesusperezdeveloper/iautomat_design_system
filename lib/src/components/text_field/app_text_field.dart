import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_field_config.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AppTextFieldVariant variant;
  final AppTextFieldConfig? config;
  final AppTextFieldColors? colors;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final AppTextFieldState? overrideState;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? helperText;
  final String? errorText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool obscureText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool enableSuggestions;
  final bool autocorrect;
  final String obscuringCharacter;
  final bool enableInteractiveSelection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;

  const AppTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
    this.variant = AppTextFieldVariant.single,
    this.config,
    this.colors,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.semanticLabel,
    this.overrideState,
    this.textDirection,
    this.keyboardType,
    this.textInputAction,
    this.helperText,
    this.errorText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with TickerProviderStateMixin {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late AnimationController _skeletonAnimationController;
  late Animation<double> _skeletonAnimation;

  bool _isHovered = false;
  final bool _isPressed = false;
  bool _isFocused = false;
  bool _obscureText = false;
  String? _errorText;

  AppTextFieldConfig get _config => widget.config ?? const AppTextFieldConfig();

  AppTextFieldColors get _colors =>
      widget.colors ?? AppTextFieldColors.fromTheme(Theme.of(context));

  bool get _isEnabled => widget.enabled && !widget.readOnly;

  bool get _hasError => _errorText != null || widget.errorText != null;

  String? get _effectiveErrorText => widget.errorText ?? _errorText;

  AppTextFieldState get _currentState {
    if (widget.overrideState != null) {
      return widget.overrideState!;
    }

    if (widget.overrideState == AppTextFieldState.skeleton) {
      return AppTextFieldState.skeleton;
    }

    if (widget.overrideState == AppTextFieldState.loading) {
      return AppTextFieldState.loading;
    }

    if (!_isEnabled) {
      return AppTextFieldState.disabled;
    }

    if (_hasError) {
      return AppTextFieldState.error;
    }

    if (_isPressed) {
      return AppTextFieldState.pressed;
    }

    if (_isFocused) {
      return AppTextFieldState.focus;
    }

    if (_isHovered) {
      return AppTextFieldState.hover;
    }

    if (_controller.text.isNotEmpty) {
      return AppTextFieldState.selected;
    }

    return AppTextFieldState.defaultState;
  }

  int get _effectiveMaxLines {
    switch (widget.variant) {
      case AppTextFieldVariant.single:
      case AppTextFieldVariant.password:
        return 1;
      case AppTextFieldVariant.multiline:
        return widget.maxLines ?? _config.maxLinesMultiline;
    }
  }

  int? get _effectiveMinLines {
    switch (widget.variant) {
      case AppTextFieldVariant.single:
      case AppTextFieldVariant.password:
        return null;
      case AppTextFieldVariant.multiline:
        return widget.minLines;
    }
  }

  bool get _effectiveObscureText {
    if (widget.variant == AppTextFieldVariant.password) {
      return widget.obscureText || _obscureText;
    }
    return widget.obscureText;
  }

  TextInputType? get _effectiveKeyboardType {
    if (widget.keyboardType != null) {
      return widget.keyboardType;
    }

    switch (widget.variant) {
      case AppTextFieldVariant.single:
        return TextInputType.text;
      case AppTextFieldVariant.multiline:
        return TextInputType.multiline;
      case AppTextFieldVariant.password:
        return TextInputType.visiblePassword;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);

    _obscureText = widget.variant == AppTextFieldVariant.password;

    _animationController = AnimationController(
      duration: _config.animationDuration,
      vsync: this,
    );

    _skeletonAnimationController = AnimationController(
      duration:
          Duration(milliseconds: (1000 / _config.skeletonShimmerSpeed).round()),
      vsync: this,
    );

    _skeletonAnimation = Tween<double>(
      begin: 0.3,
      end: 0.3 + _config.skeletonOpacityRange,
    ).animate(CurvedAnimation(
      parent: _skeletonAnimationController,
      curve: Curves.easeInOut,
    ));

    if (_currentState == AppTextFieldState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      if (oldWidget.controller == null) {
        _controller.dispose();
      }
      _controller = widget.controller ?? TextEditingController();
    }

    if (oldWidget.overrideState != widget.overrideState) {
      if (_currentState == AppTextFieldState.skeleton) {
        _skeletonAnimationController.repeat(reverse: true);
      } else {
        _skeletonAnimationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _controller.removeListener(_handleTextChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    _animationController.dispose();
    _skeletonAnimationController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleTextChange() {
    setState(() {
      // Trigger rebuild for character counter
    });
  }

  void _handleChanged(String value) {
    widget.onChanged?.call(value);
  }

  void _handleTap() {
    if (!_isEnabled) return;

    if (_config.enableHapticFeedback &&
        (Platform.isIOS || Platform.isAndroid)) {
      HapticFeedback.lightImpact();
    }

    _focusNode.requestFocus();
    widget.onTap?.call();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentState == AppTextFieldState.skeleton) {
      return _buildSkeleton();
    }

    if (_currentState == AppTextFieldState.loading) {
      return _buildLoadingField();
    }

    return _buildTextField();
  }

  Widget _buildSkeleton() {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Container(
                height: 16,
                width: 80,
                decoration: BoxDecoration(
                  color: _colors.skeletonBaseColor
                      .withValues(alpha: _skeletonAnimation.value),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: _config.labelSpacing),
            ],
            Container(
              height: _config.minimumHeight,
              decoration: BoxDecoration(
                color: _colors.skeletonBaseColor
                    .withValues(alpha: _skeletonAnimation.value),
                borderRadius: BorderRadius.circular(_config.borderRadius),
                border: Border.all(
                  color: _colors.skeletonHighlightColor.withValues(alpha: 0.5),
                  width: _config.borderWidth,
                ),
              ),
            ),
            if (widget.helperText != null) ...[
              SizedBox(height: _config.helperErrorSpacing),
              Container(
                height: 12,
                width: 120,
                decoration: BoxDecoration(
                  color: _colors.skeletonBaseColor
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

  Widget _buildLoadingField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _colors.disabledLabelColor,
                ),
          ),
          SizedBox(height: _config.labelSpacing),
        ],
        Container(
          height: _config.minimumHeight,
          padding: _config.contentPadding,
          decoration: BoxDecoration(
            color: _colors.disabledFillColor,
            borderRadius: BorderRadius.circular(_config.borderRadius),
            border: Border.all(
              color: _colors.disabledBorderColor,
              width: _config.borderWidth,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.hint ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _colors.disabledHintColor,
                      ),
                ),
              ),
              if (Platform.isIOS || Platform.isMacOS)
                CupertinoActivityIndicator(
                  radius: 8,
                  color: _colors.disabledHintColor,
                )
              else
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation(_colors.disabledHintColor),
                  ),
                ),
            ],
          ),
        ),
        if (widget.helperText != null) ...[
          SizedBox(height: _config.helperErrorSpacing),
          Text(
            widget.helperText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _colors.disabledLabelColor,
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildTextField() {
    final theme = Theme.of(context);

    return Semantics(
      enabled: _isEnabled,
      label: widget.semanticLabel ?? widget.label,
      child: GestureDetector(
        onTap: _handleTap,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor:
              _isEnabled ? SystemMouseCursors.text : SystemMouseCursors.basic,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label != null && !_config.enableFloatingLabel) ...[
                Text(
                  widget.label!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _hasError
                        ? _colors.errorLabelColor
                        : _isFocused
                            ? _colors.focusedLabelColor
                            : _isEnabled
                                ? _colors.labelColor
                                : _colors.disabledLabelColor,
                  ),
                ),
                SizedBox(height: _config.labelSpacing),
              ],
              _buildTextFormField(),
              if (_effectiveErrorText != null) ...[
                SizedBox(height: _config.helperErrorSpacing),
                Text(
                  _effectiveErrorText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _colors.errorTextColor,
                  ),
                ),
              ] else if (widget.helperText != null) ...[
                SizedBox(height: _config.helperErrorSpacing),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.helperText!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _colors.helperTextColor,
                        ),
                      ),
                    ),
                    if (widget.maxLength != null &&
                        _config.enableCharacterCounter)
                      Text(
                        '${_controller.text.length}/${widget.maxLength}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _colors.counterTextColor,
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    final theme = Theme.of(context);

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: _isEnabled,
      readOnly: widget.readOnly,
      autofocus: widget.autoFocus,
      obscureText: _effectiveObscureText,
      obscuringCharacter: widget.obscuringCharacter,
      maxLines: _effectiveMaxLines,
      minLines: _effectiveMinLines,
      maxLength: widget.maxLength,
      keyboardType: _effectiveKeyboardType,
      textInputAction: widget.textInputAction,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      onChanged: _handleChanged,
      onFieldSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onTap: _handleTap,
      onTapOutside: (_) => _focusNode.unfocus(),
      style: theme.textTheme.bodyMedium?.copyWith(
        color: _isEnabled ? _colors.textColor : _colors.disabledTextColor,
      ),
      cursorColor: _colors.cursorColor,
      selectionControls: theme.platform == TargetPlatform.iOS
          ? cupertinoTextSelectionControls
          : materialTextSelectionControls,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: _config.enableFloatingLabel ? widget.label : null,
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),
        prefix: widget.prefix,
        suffix: widget.suffix,
        counterText: '',
        filled: true,
        fillColor: _isEnabled ? _colors.fillColor : _colors.disabledFillColor,
        contentPadding: _config.contentPadding,
        border: _buildBorder(_colors.borderColor),
        enabledBorder: _buildBorder(_colors.borderColor),
        focusedBorder:
            _buildBorder(_colors.focusedBorderColor, _config.focusBorderWidth),
        errorBorder: _buildBorder(_colors.errorBorderColor),
        focusedErrorBorder:
            _buildBorder(_colors.errorBorderColor, _config.focusBorderWidth),
        disabledBorder: _buildBorder(_colors.disabledBorderColor),
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: _isEnabled ? _colors.hintColor : _colors.disabledHintColor,
        ),
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: _hasError
              ? _colors.errorLabelColor
              : _isFocused
                  ? _colors.focusedLabelColor
                  : _isEnabled
                      ? _colors.labelColor
                      : _colors.disabledLabelColor,
        ),
        floatingLabelStyle: theme.textTheme.bodySmall?.copyWith(
          color: _hasError
              ? _colors.errorLabelColor
              : _isFocused
                  ? _colors.focusedLabelColor
                  : _colors.labelColor,
        ),
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon == null) return null;

    return Icon(
      widget.prefixIcon,
      size: _config.iconSize,
      color: _isEnabled
          ? _colors.prefixIconColor
          : _colors.disabledPrefixIconColor,
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.variant == AppTextFieldVariant.password) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          size: _config.iconSize,
          color: _isEnabled
              ? _colors.suffixIconColor
              : _colors.disabledSuffixIconColor,
        ),
        onPressed: _isEnabled ? _togglePasswordVisibility : null,
        tooltip: _obscureText ? 'Mostrar contraseña' : 'Ocultar contraseña',
      );
    }

    if (widget.suffixIcon == null) return null;

    return Icon(
      widget.suffixIcon,
      size: _config.iconSize,
      color: _isEnabled
          ? _colors.suffixIconColor
          : _colors.disabledSuffixIconColor,
    );
  }

  OutlineInputBorder _buildBorder(Color color, [double? width]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_config.borderRadius),
      borderSide: BorderSide(
        color: color,
        width: width ?? _config.borderWidth,
      ),
    );
  }
}
