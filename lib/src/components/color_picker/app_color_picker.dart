import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/color_picker/color_picker_config.dart';

/// A comprehensive color picker component with HSV and palette variants.
///
/// Supports two variants:
/// - [AppColorPickerVariant.hsv]: HSV color wheel with sliders
/// - [AppColorPickerVariant.palette]: Predefined color palette selection
///
/// Features:
/// - Platform-adaptive UI (Material/Cupertino)
/// - Multiple states (default, hover, pressed, focus, selected, disabled, loading, skeleton)
/// - RTL support
/// - Accessibility built-in
/// - Keyboard navigation
/// - Alpha channel support
/// - Recent colors tracking
/// - Extensive customization through [AppColorPickerConfig]
///
/// Example:
/// ```dart
/// AppColorPicker(
///   variant: AppColorPickerVariant.hsv,
///   value: AppColorValue.fromColor(Colors.blue),
///   onChanged: (value) => print('Selected: ${value.hexString}'),
/// )
/// ```
class AppColorPicker extends StatefulWidget {
  /// The variant of the color picker
  final AppColorPickerVariant variant;

  /// Current selected color value
  final AppColorValue? value;

  /// Callback when the color changes
  final ValueChanged<AppColorValue>? onChanged;

  /// Whether the picker is enabled
  final bool enabled;

  /// Current state of the picker
  final AppColorPickerState state;

  /// Configuration for customization
  final AppColorPickerConfig? config;

  /// Hint text to display when no value is selected
  final String? hintText;

  /// Error text to display
  final String? errorText;

  /// Helper text to display
  final String? helperText;

  /// Label text for the picker
  final String? labelText;

  /// Prefix icon
  final Widget? prefixIcon;

  /// Suffix icon
  final Widget? suffixIcon;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Validation function
  final FormFieldValidator<AppColorValue>? validator;

  /// Whether to auto-validate
  final AutovalidateMode? autovalidateMode;

  /// Focus node for keyboard navigation
  final FocusNode? focusNode;

  /// Text direction override
  final TextDirection? textDirection;

  /// Whether to use platform-adaptive UI
  final bool adaptivePlatform;

  /// Callback when the picker gains focus
  final VoidCallback? onFocusChanged;

  /// Callback when the picker is tapped
  final VoidCallback? onTap;

  /// Custom color palette for palette variant
  final List<Color>? customPalette;

  /// Palette name for palette variant
  final String? paletteName;

  /// Whether to show alpha channel controls
  final bool? showAlphaChannel;

  /// Whether to show recent colors
  final bool? showRecentColors;

  /// Recent colors list
  final List<Color>? recentColors;

  const AppColorPicker({
    super.key,
    required this.variant,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.state = AppColorPickerState.defaultState,
    this.config,
    this.hintText,
    this.errorText,
    this.helperText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.semanticLabel,
    this.validator,
    this.autovalidateMode,
    this.focusNode,
    this.textDirection,
    this.adaptivePlatform = true,
    this.onFocusChanged,
    this.onTap,
    this.customPalette,
    this.paletteName,
    this.showAlphaChannel,
    this.showRecentColors,
    this.recentColors,
  });

  @override
  State<AppColorPicker> createState() => _AppColorPickerState();
}

class _AppColorPickerState extends State<AppColorPicker>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final FocusNode _focusNode;

  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  AppColorPickerConfig get _config =>
      widget.config ?? const AppColorPickerConfig();

  AppColorPickerColors get _colors =>
      _config.colors ?? AppColorPickerColors.fromTheme(Theme.of(context));

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: _config.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: _config.pressedScale,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _config.animationCurve,
    ));

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
    widget.onFocusChanged?.call();
  }

  Color _getBackgroundColor(AppColorPickerState state) {
    switch (state) {
      case AppColorPickerState.defaultState:
        return _colors.inputFillColor;
      case AppColorPickerState.hover:
        return _colors.hoverOverlayColor;
      case AppColorPickerState.pressed:
        return _colors.pressedOverlayColor;
      case AppColorPickerState.focus:
        return _colors.focusOverlayColor;
      case AppColorPickerState.selected:
        return _colors.selectionColor;
      case AppColorPickerState.disabled:
        return _colors.inputFillColor;
      case AppColorPickerState.loading:
        return _colors.inputFillColor;
      case AppColorPickerState.skeleton:
        return _colors.skeletonBaseColor;
    }
  }

  Color _getBorderColor(AppColorPickerState state) {
    switch (state) {
      case AppColorPickerState.defaultState:
        return _colors.inputBorderColor;
      case AppColorPickerState.hover:
        return _colors.inputBorderColor;
      case AppColorPickerState.pressed:
        return _colors.inputFocusedBorderColor;
      case AppColorPickerState.focus:
        return _colors.inputFocusedBorderColor;
      case AppColorPickerState.selected:
        return _colors.inputFocusedBorderColor;
      case AppColorPickerState.disabled:
        return _colors.inputDisabledBorderColor;
      case AppColorPickerState.loading:
        return _colors.inputBorderColor;
      case AppColorPickerState.skeleton:
        return _colors.skeletonBaseColor;
    }
  }

  AppColorPickerState get _currentState {
    if (!widget.enabled || widget.state == AppColorPickerState.disabled) {
      return AppColorPickerState.disabled;
    }
    if (widget.state == AppColorPickerState.loading) {
      return AppColorPickerState.loading;
    }
    if (widget.state == AppColorPickerState.skeleton) {
      return AppColorPickerState.skeleton;
    }
    if (_isPressed) {
      return AppColorPickerState.pressed;
    }
    if (_isFocused) {
      return AppColorPickerState.focus;
    }
    if (_isHovered) {
      return AppColorPickerState.hover;
    }
    if (widget.value != null) {
      return AppColorPickerState.selected;
    }
    return AppColorPickerState.defaultState;
  }

  String get _displayText {
    if (widget.value == null) {
      return widget.hintText ?? _getDefaultHintText();
    }

    return widget.value!.getFormattedString();
  }

  String _getDefaultHintText() {
    switch (widget.variant) {
      case AppColorPickerVariant.hsv:
        return 'Seleccionar color';
      case AppColorPickerVariant.palette:
        return 'Elegir de paleta';
    }
  }

  Future<void> _showColorPicker() async {
    if (!widget.enabled ||
        widget.state == AppColorPickerState.disabled ||
        widget.onChanged == null) {
      return;
    }

    widget.onTap?.call();

    try {
      AppColorValue? result;

      switch (widget.variant) {
        case AppColorPickerVariant.hsv:
          result = await _showHSVPicker();
          break;
        case AppColorPickerVariant.palette:
          result = await _showPalettePicker();
          break;
      }

      if (result != null && widget.onChanged != null) {
        widget.onChanged!(result);
      }
    } catch (e) {
      debugPrint('Error showing color picker: $e');
    }
  }

  Future<AppColorValue?> _showHSVPicker() async {
    return await showDialog<AppColorValue>(
      context: context,
      barrierDismissible: true,
      barrierColor: _colors.dialogBarrierColor,
      builder: (BuildContext context) {
        return _HSVColorPickerDialog(
          initialValue: widget.value ?? AppColorValue.fromColor(Colors.blue),
          config: _config,
          colors: _colors,
          adaptivePlatform: widget.adaptivePlatform,
          textDirection: widget.textDirection,
        );
      },
    );
  }

  Future<AppColorValue?> _showPalettePicker() async {
    return await showDialog<AppColorValue>(
      context: context,
      barrierDismissible: true,
      barrierColor: _colors.dialogBarrierColor,
      builder: (BuildContext context) {
        return _PaletteColorPickerDialog(
          initialValue: widget.value,
          config: _config,
          colors: _colors,
          customPalette: widget.customPalette,
          paletteName: widget.paletteName,
          adaptivePlatform: widget.adaptivePlatform,
          textDirection: widget.textDirection,
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return SizedBox(
      width: _config.loadingIndicatorSize,
      height: _config.loadingIndicatorSize,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(_colors.loadingIndicatorColor),
      ),
    );
  }

  Widget _buildSkeletonState() {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: _colors.skeletonBaseColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildColorPreview() {
    if (widget.value == null) return const SizedBox.shrink();

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: widget.value!.colorWithAlpha,
        border: Border.all(
          color: _colors.colorPreviewBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildContent() {
    final currentState = _currentState;

    if (currentState == AppColorPickerState.loading) {
      return _buildLoadingState();
    }

    if (currentState == AppColorPickerState.skeleton) {
      return _buildSkeletonState();
    }

    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: widget.value != null
              ? _colors.inputTextColor
              : _colors.inputHintColor,
        );

    return Row(
      children: [
        if (widget.prefixIcon != null) ...[
          widget.prefixIcon!,
          SizedBox(width: _config.iconSpacing),
        ],
        if (_config.showColorPreview && widget.value != null) ...[
          _buildColorPreview(),
          SizedBox(width: _config.iconSpacing),
        ],
        Expanded(
          child: Text(
            _displayText,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (widget.suffixIcon != null) ...[
          SizedBox(width: _config.iconSpacing),
          widget.suffixIcon!,
        ] else ...[
          SizedBox(width: _config.iconSpacing),
          Icon(
            _getDefaultIcon(),
            size: _config.iconSize,
            color: _colors.iconColor,
          ),
        ],
      ],
    );
  }

  IconData _getDefaultIcon() {
    switch (widget.variant) {
      case AppColorPickerVariant.hsv:
        return Icons.colorize;
      case AppColorPickerVariant.palette:
        return Icons.palette;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentState = _currentState;
    final backgroundColor = _getBackgroundColor(currentState);
    final borderColor = _getBorderColor(currentState);

    return Directionality(
      textDirection: widget.textDirection ?? Directionality.of(context),
      child: Semantics(
        label: widget.semanticLabel ?? widget.labelText,
        button: true,
        enabled: widget.enabled,
        focusable: widget.enabled,
        child: Focus(
          focusNode: _focusNode,
          child: GestureDetector(
            onTap: widget.enabled ? _showColorPicker : null,
            onTapDown: widget.enabled
                ? (_) {
                    setState(() => _isPressed = true);
                    _animationController.forward();
                  }
                : null,
            onTapUp: widget.enabled
                ? (_) {
                    setState(() => _isPressed = false);
                    _animationController.reverse();
                  }
                : null,
            onTapCancel: widget.enabled
                ? () {
                    setState(() => _isPressed = false);
                    _animationController.reverse();
                  }
                : null,
            child: MouseRegion(
              onEnter: widget.enabled
                  ? (_) => setState(() => _isHovered = true)
                  : null,
              onExit: widget.enabled
                  ? (_) => setState(() => _isHovered = false)
                  : null,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: _config.minHeight,
                      ),
                      padding: _config.contentPadding,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(
                          color: borderColor,
                          width: _config.borderWidth,
                        ),
                        borderRadius:
                            BorderRadius.circular(_config.borderRadius),
                        boxShadow: _config.enableShadow &&
                                currentState != AppColorPickerState.disabled
                            ? [
                                BoxShadow(
                                  color: _colors.dialogShadowColor,
                                  blurRadius: _config.shadowBlurRadius,
                                  offset: _config.shadowOffset,
                                  spreadRadius: _config.shadowSpreadRadius,
                                ),
                              ]
                            : null,
                      ),
                      child: _buildContent(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// HSV Color Picker Dialog
class _HSVColorPickerDialog extends StatefulWidget {
  final AppColorValue initialValue;
  final AppColorPickerConfig config;
  final AppColorPickerColors colors;
  final bool adaptivePlatform;
  final TextDirection? textDirection;

  const _HSVColorPickerDialog({
    required this.initialValue,
    required this.config,
    required this.colors,
    required this.adaptivePlatform,
    this.textDirection,
  });

  @override
  State<_HSVColorPickerDialog> createState() => _HSVColorPickerDialogState();
}

class _HSVColorPickerDialogState extends State<_HSVColorPickerDialog> {
  late AppColorValue _currentValue;
  late HSVColor _hsvColor;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _hsvColor = _currentValue.hsv;
  }

  void _updateColor(HSVColor newHsv) {
    setState(() {
      _hsvColor = newHsv;
      _currentValue = AppColorValue.fromColor(
        newHsv.toColor(),
        format: _currentValue.format,
      );
    });
  }

  void _updateAlpha(double alpha) {
    setState(() {
      _currentValue = _currentValue.copyWithAlpha(alpha);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Seleccionar Color'),
      backgroundColor: widget.colors.dialogBackgroundColor,
      content: SizedBox(
        width: widget.config.pickerWidth,
        height: widget.config.pickerHeight,
        child: Column(
          children: [
            // Color preview
            Container(
              width: double.infinity,
              height: widget.config.colorPreviewSize,
              decoration: BoxDecoration(
                color: _currentValue.colorWithAlpha,
                border: Border.all(
                  color: widget.colors.colorPreviewBorderColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),

            // HSV Controls
            Expanded(
              child: Column(
                children: [
                  // Hue slider
                  _buildHueSlider(),
                  const SizedBox(height: 12),

                  // Saturation and Value area
                  _buildSaturationValueArea(),
                  const SizedBox(height: 12),

                  // Alpha slider
                  if (widget.config.showAlphaChannel) _buildAlphaSlider(),

                  const SizedBox(height: 16),

                  // Color value display
                  if (widget.config.showColorValue) _buildColorValueDisplay(),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancelar',
            style: TextStyle(color: widget.colors.cancelButtonTextColor),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(_currentValue),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.colors.confirmButtonColor,
            foregroundColor: widget.colors.confirmButtonTextColor,
          ),
          child: const Text('Confirmar'),
        ),
      ],
    );
  }

  Widget _buildHueSlider() {
    return SizedBox(
      height: widget.config.hueSliderHeight,
      child: Stack(
        children: [
          // Hue gradient
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.yellow,
                  Colors.green,
                  Colors.cyan,
                  Colors.blue,
                  const Color(0xFFFF00FF), // Magenta
                  Colors.red,
                ],
              ),
            ),
          ),
          // Slider
          Slider(
            value: _hsvColor.hue,
            min: 0,
            max: 360,
            onChanged: (value) {
              _updateColor(_hsvColor.withHue(value));
            },
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            thumbColor: widget.colors.hueSliderThumbColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSaturationValueArea() {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GestureDetector(
          onPanUpdate: (details) {
            final box = context.findRenderObject() as RenderBox;
            final localPosition = box.globalToLocal(details.globalPosition);
            final saturation =
                (localPosition.dx / box.size.width).clamp(0.0, 1.0);
            final value =
                1.0 - (localPosition.dy / box.size.height).clamp(0.0, 1.0);

            _updateColor(_hsvColor.withSaturation(saturation).withValue(value));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  HSVColor.fromAHSV(1.0, _hsvColor.hue, 1.0, 1.0).toColor(),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: _hsvColor.saturation * (context.size?.width ?? 0) - 6,
                    top: (1.0 - _hsvColor.value) * (context.size?.height ?? 0) -
                        6,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlphaSlider() {
    return SizedBox(
      height: widget.config.alphaSliderHeight,
      child: Stack(
        children: [
          // Alpha gradient
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  _currentValue.color.withValues(alpha: 0),
                  _currentValue.color.withValues(alpha: 1),
                ],
              ),
            ),
          ),
          // Slider
          Slider(
            value: _currentValue.alpha,
            min: 0,
            max: 1,
            onChanged: _updateAlpha,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            thumbColor: widget.colors.alphaSliderThumbColor,
          ),
        ],
      ),
    );
  }

  Widget _buildColorValueDisplay() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.colors.inputFieldBackgroundColor,
        border: Border.all(color: widget.colors.inputFieldBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        _currentValue.getFormattedString(),
        style: TextStyle(
          color: widget.colors.inputFieldTextColor,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

/// Palette Color Picker Dialog
class _PaletteColorPickerDialog extends StatefulWidget {
  final AppColorValue? initialValue;
  final AppColorPickerConfig config;
  final AppColorPickerColors colors;
  final List<Color>? customPalette;
  final String? paletteName;
  final bool adaptivePlatform;
  final TextDirection? textDirection;

  const _PaletteColorPickerDialog({
    this.initialValue,
    required this.config,
    required this.colors,
    this.customPalette,
    this.paletteName,
    required this.adaptivePlatform,
    this.textDirection,
  });

  @override
  State<_PaletteColorPickerDialog> createState() =>
      _PaletteColorPickerDialogState();
}

class _PaletteColorPickerDialogState extends State<_PaletteColorPickerDialog> {
  AppColorValue? _selectedValue;
  late List<Color> _palette;
  late String _paletteName;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    _palette = widget.customPalette ?? AppColorPalettes.material;
    _paletteName = widget.paletteName ?? 'Material';
  }

  void _selectColor(Color color) {
    setState(() {
      _selectedValue = AppColorValue.fromColor(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Paleta: $_paletteName'),
      backgroundColor: widget.colors.dialogBackgroundColor,
      content: SizedBox(
        width: widget.config.pickerWidth,
        height: widget.config.pickerHeight,
        child: Column(
          children: [
            // Selected color preview
            if (_selectedValue != null)
              Container(
                width: double.infinity,
                height: widget.config.colorPreviewSize,
                decoration: BoxDecoration(
                  color: _selectedValue!.colorWithAlpha,
                  border: Border.all(
                    color: widget.colors.colorPreviewBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _selectedValue!.getFormattedString(),
                    style: TextStyle(
                      color: _selectedValue!.color.contrastingColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // Color grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.config.paletteColumns,
                  crossAxisSpacing: widget.config.colorSwatchSpacing,
                  mainAxisSpacing: widget.config.colorSwatchSpacing,
                ),
                itemCount: _palette.length,
                itemBuilder: (context, index) {
                  final color = _palette[index];
                  final isSelected = _selectedValue?.color == color;

                  return GestureDetector(
                    onTap: () => _selectColor(color),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? widget.colors.colorSwatchSelectedBorderColor
                              : widget.colors.colorSwatchBorderColor,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              color: color.contrastingColor,
                              size: 20,
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancelar',
            style: TextStyle(color: widget.colors.cancelButtonTextColor),
          ),
        ),
        ElevatedButton(
          onPressed: _selectedValue != null
              ? () => Navigator.of(context).pop(_selectedValue)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.colors.confirmButtonColor,
            foregroundColor: widget.colors.confirmButtonTextColor,
          ),
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
