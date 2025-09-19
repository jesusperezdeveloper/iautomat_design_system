import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'slider_config.dart';

class DSSlider extends StatefulWidget {
  final double? value;
  final DSSliderRangeValue? rangeValue;
  final double min;
  final double max;
  final double? step;
  final ValueChanged<double>? onChanged;
  final ValueChanged<DSSliderRangeValue>? onRangeChanged;
  final List<DSSliderMark> marks;
  final String? label;
  final String? helperText;
  final String? errorText;
  final String? Function(double?)? validator;
  final String? Function(DSSliderRangeValue?)? rangeValidator;
  final DSSliderVariant variant;
  final DSSliderConfig? config;
  final DSSliderColors? colors;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final DSSliderState? overrideState;
  final TextDirection? textDirection;
  final bool dense;
  final double? width;
  final VoidCallback? onChangeStart;
  final VoidCallback? onChangeEnd;
  final Widget? loadingWidget;
  final String Function(double)? labelFormatter;
  final bool showLabels;
  final bool showTicks;

  const DSSlider({
    super.key,
    this.value,
    this.rangeValue,
    this.min = 0.0,
    this.max = 100.0,
    this.step,
    this.onChanged,
    this.onRangeChanged,
    this.marks = const [],
    this.label,
    this.helperText,
    this.errorText,
    this.validator,
    this.rangeValidator,
    this.variant = DSSliderVariant.continuous,
    this.config,
    this.colors,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.semanticLabel,
    this.overrideState,
    this.textDirection,
    this.dense = false,
    this.width,
    this.onChangeStart,
    this.onChangeEnd,
    this.loadingWidget,
    this.labelFormatter,
    this.showLabels = true,
    this.showTicks = true,
  })  : assert(
          (variant == DSSliderVariant.range &&
                  rangeValue != null &&
                  onRangeChanged != null) ||
              (variant != DSSliderVariant.range &&
                  value != null &&
                  onChanged != null),
          'Range sliders require rangeValue and onRangeChanged, others require value and onChanged',
        ),
        assert(
          min < max,
          'min must be less than max',
        ),
        assert(
          step == null || step > 0,
          'step must be positive',
        );

  @override
  State<DSSlider> createState() => _DSSliderState();
}

class _DSSliderState extends State<DSSlider> with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  DSSliderConfig? _config;
  DSSliderColors? _colors;
  DSSliderState _currentState = DSSliderState.defaultState;
  bool _isPressed = false;
  bool _isHovered = false;
  String? _validationError;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOutSine,
    ));

    _focusNode.addListener(_handleFocusChange);
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateColors();
    _updateState();
  }

  @override
  void didUpdateWidget(DSSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_handleFocusChange);
    }
    _updateColors();
    _updateState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _animationController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  void _updateColors() {
    final theme = Theme.of(context);
    _colors = widget.colors ?? DSSliderColors.fromTheme(theme);
    _config = widget.config ?? const DSSliderConfig();
  }

  void _updateState() {
    if (widget.overrideState != null) {
      _currentState = widget.overrideState!;
    } else if (!widget.enabled) {
      _currentState = DSSliderState.disabled;
    } else if (_isPressed) {
      _currentState = DSSliderState.pressed;
    } else if (_isHovered) {
      _currentState = DSSliderState.hover;
    } else if (_focusNode.hasFocus) {
      _currentState = DSSliderState.focus;
    } else {
      _currentState = DSSliderState.defaultState;
    }

    if (_currentState == DSSliderState.skeleton) {
      _shimmerController.repeat();
    } else {
      _shimmerController.stop();
    }
  }

  void _handleFocusChange() {
    setState(() {
      _updateState();
    });
  }

  void _handleSliderChanged(double value) {
    if (!widget.enabled) return;

    if (widget.config?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    // Validate the value
    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _validationError = error;
      });
    }

    widget.onChanged?.call(value);
  }

  void _handleRangeChanged(RangeValues values) {
    if (!widget.enabled) return;

    if (widget.config?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    final rangeValue =
        DSSliderRangeValue(start: values.start, end: values.end);

    // Validate the range
    if (widget.rangeValidator != null) {
      final error = widget.rangeValidator!(rangeValue);
      setState(() {
        _validationError = error;
      });
    }

    widget.onRangeChanged?.call(rangeValue);
  }

  void _handleChangeStart() {
    setState(() {
      _isPressed = true;
      _updateState();
    });
    widget.onChangeStart?.call();
  }

  void _handleChangeEnd() {
    setState(() {
      _isPressed = false;
      _updateState();
    });
    widget.onChangeEnd?.call();
  }

  String _formatValue(double value) {
    if (widget.labelFormatter != null) {
      return widget.labelFormatter!(value);
    }

    final decimalPlaces = _config?.decimalPlaces ?? 0;
    final prefix = _config?.valuePrefix ?? '';
    final suffix = _config?.valueSuffix ?? '';

    return '$prefix${value.toStringAsFixed(decimalPlaces)}$suffix';
  }

  Widget _buildLoadingIndicator() {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: _colors!.loadingIndicatorColor,
      );
    } else {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor:
              AlwaysStoppedAnimation<Color>(_colors!.loadingIndicatorColor),
        ),
      );
    }
  }

  Widget _buildSkeleton() {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return Container(
          height: _config!.minimumHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_config!.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                _colors!.skeletonBaseColor,
                _colors!.skeletonHighlightColor,
                _colors!.skeletonBaseColor,
              ],
              stops: [
                (_shimmerAnimation.value - 1).clamp(0.0, 1.0),
                _shimmerAnimation.value.clamp(0.0, 1.0),
                (_shimmerAnimation.value + 1).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSlider() {
    switch (widget.variant) {
      case DSSliderVariant.continuous:
        return _buildContinuousSlider();
      case DSSliderVariant.discrete:
        return _buildDiscreteSlider();
      case DSSliderVariant.range:
        return _buildRangeSlider();
    }
  }

  Widget _buildContinuousSlider() {
    return SliderTheme(
      data: _buildSliderThemeData(),
      child: Slider(
        value: widget.value!,
        min: widget.min,
        max: widget.max,
        onChanged: widget.enabled ? _handleSliderChanged : null,
        onChangeStart: widget.enabled ? (_) => _handleChangeStart() : null,
        onChangeEnd: widget.enabled ? (_) => _handleChangeEnd() : null,
        focusNode: _focusNode,
        semanticFormatterCallback: (value) => _formatValue(value),
        label: widget.showLabels ? _formatValue(widget.value!) : null,
      ),
    );
  }

  Widget _buildDiscreteSlider() {
    final divisions = widget.step != null
        ? ((widget.max - widget.min) / widget.step!).round()
        : null;

    return SliderTheme(
      data: _buildSliderThemeData(),
      child: Slider(
        value: widget.value!,
        min: widget.min,
        max: widget.max,
        divisions: divisions,
        onChanged: widget.enabled ? _handleSliderChanged : null,
        onChangeStart: widget.enabled ? (_) => _handleChangeStart() : null,
        onChangeEnd: widget.enabled ? (_) => _handleChangeEnd() : null,
        focusNode: _focusNode,
        semanticFormatterCallback: (value) => _formatValue(value),
        label: widget.showLabels ? _formatValue(widget.value!) : null,
      ),
    );
  }

  Widget _buildRangeSlider() {
    return SliderTheme(
      data: _buildSliderThemeData(),
      child: RangeSlider(
        values: RangeValues(widget.rangeValue!.start, widget.rangeValue!.end),
        min: widget.min,
        max: widget.max,
        divisions: widget.step != null
            ? ((widget.max - widget.min) / widget.step!).round()
            : null,
        onChanged: widget.enabled ? _handleRangeChanged : null,
        onChangeStart: widget.enabled ? (_) => _handleChangeStart() : null,
        onChangeEnd: widget.enabled ? (_) => _handleChangeEnd() : null,
        semanticFormatterCallback: (value) => _formatValue(value),
        labels: widget.showLabels
            ? RangeLabels(
                _formatValue(widget.rangeValue!.start),
                _formatValue(widget.rangeValue!.end),
              )
            : null,
      ),
    );
  }

  SliderThemeData _buildSliderThemeData() {
    return SliderThemeData(
      trackHeight: _config!.trackHeight,
      activeTrackColor: _colors!.activeTrackColor,
      inactiveTrackColor: _colors!.inactiveTrackColor,
      disabledActiveTrackColor: _colors!.disabledActiveTrackColor,
      disabledInactiveTrackColor: _colors!.disabledTrackColor,
      thumbColor: _getThumbColor(),
      disabledThumbColor: _colors!.disabledThumbColor,
      overlayColor: _getOverlayColor(),
      valueIndicatorColor: _colors!.valueIndicatorColor,
      valueIndicatorTextStyle: TextStyle(
        color: _colors!.valueIndicatorTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      thumbShape: RoundSliderThumbShape(
        enabledThumbRadius: _config!.thumbRadius,
        disabledThumbRadius: _config!.thumbRadius * 0.8,
      ),
      overlayShape: RoundSliderOverlayShape(
        overlayRadius: _config!.thumbRadius + _config!.thumbPadding,
      ),
      tickMarkShape: _buildTickMarkShape(),
      activeTickMarkColor: _colors!.activeTickMarkColor,
      inactiveTickMarkColor: _colors!.tickMarkColor,
      disabledActiveTickMarkColor: _colors!.disabledTickMarkColor,
      disabledInactiveTickMarkColor: _colors!.disabledTickMarkColor,
      showValueIndicator: widget.showLabels
          ? ShowValueIndicator.onlyForDiscrete
          : ShowValueIndicator.never,
    );
  }

  Color _getThumbColor() {
    switch (_currentState) {
      case DSSliderState.pressed:
        return _colors!.pressedThumbColor;
      case DSSliderState.hover:
        return _colors!.hoveredThumbColor;
      case DSSliderState.focus:
      case DSSliderState.selected:
        return _colors!.thumbColor;
      case DSSliderState.disabled:
        return _colors!.disabledThumbColor;
      case DSSliderState.loading:
      case DSSliderState.skeleton:
        return _colors!.thumbColor.withValues(alpha: 0.5);
      case DSSliderState.defaultState:
        return _colors!.thumbColor;
    }
  }

  Color _getOverlayColor() {
    switch (_currentState) {
      case DSSliderState.pressed:
        return _colors!.pressOverlayColor;
      case DSSliderState.hover:
        return _colors!.hoverOverlayColor;
      case DSSliderState.focus:
      case DSSliderState.selected:
        return _colors!.focusOverlayColor;
      case DSSliderState.disabled:
      case DSSliderState.loading:
      case DSSliderState.skeleton:
        return Colors.transparent;
      case DSSliderState.defaultState:
        return _colors!.overlayColor;
    }
  }

  SliderTickMarkShape _buildTickMarkShape() {
    if (!widget.showTicks) {
      return const RoundSliderTickMarkShape(tickMarkRadius: 0);
    }
    return RoundSliderTickMarkShape(
      tickMarkRadius: _config!.markSize / 2,
    );
  }

  Widget _buildMarks() {
    if (widget.marks.isEmpty || !widget.showTicks) {
      return const SizedBox.shrink();
    }

    return const SizedBox.shrink(); // Simplified for now to avoid layout issues
  }

  Widget _buildLabel() {
    if (widget.label == null) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(bottom: _config!.contentPadding.bottom),
      child: Text(
        widget.label!,
        style: TextStyle(
          color: _colors!.labelColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildHelperText() {
    final text = _validationError ?? widget.errorText ?? widget.helperText;
    if (text == null) return const SizedBox.shrink();

    final isError = _validationError != null || widget.errorText != null;
    final color =
        isError ? _colors!.valueIndicatorTextColor : _colors!.labelColor;

    return Padding(
      padding: EdgeInsets.only(top: _config!.contentPadding.top),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final directionality = widget.textDirection ?? Directionality.of(context);

    return Directionality(
      textDirection: directionality,
      child: Semantics(
        label: widget.semanticLabel ?? widget.label,
        value: widget.variant == DSSliderVariant.range
            ? '${_formatValue(widget.rangeValue!.start)} to ${_formatValue(widget.rangeValue!.end)}'
            : _formatValue(widget.value ?? 0),
        enabled: widget.enabled,
        child: MouseRegion(
          onEnter: widget.enabled
              ? (_) {
                  setState(() {
                    _isHovered = true;
                    _updateState();
                  });
                }
              : null,
          onExit: widget.enabled
              ? (_) {
                  setState(() {
                    _isHovered = false;
                    _updateState();
                  });
                }
              : null,
          child: Container(
            width: widget.width,
            padding: _config!.contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLabel(),
                SizedBox(
                  height: _config!.minimumHeight,
                  child: _currentState == DSSliderState.loading
                      ? Center(
                          child:
                              widget.loadingWidget ?? _buildLoadingIndicator(),
                        )
                      : _currentState == DSSliderState.skeleton
                          ? _buildSkeleton()
                          : Stack(
                              children: [
                                _buildSlider(),
                                _buildMarks(),
                              ],
                            ),
                ),
                _buildHelperText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
