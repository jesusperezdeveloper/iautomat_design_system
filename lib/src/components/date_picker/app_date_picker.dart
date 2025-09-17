import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/date_picker/date_picker_config.dart';

/// A comprehensive date picker component with multiple variants and states.
///
/// Supports three variants:
/// - [AppDatePickerVariant.date]: Single date selection
/// - [AppDatePickerVariant.time]: Time selection
/// - [AppDatePickerVariant.range]: Date range selection
///
/// Features:
/// - Platform-adaptive UI (Material/Cupertino)
/// - Multiple states (default, hover, pressed, focus, selected, disabled, loading, skeleton)
/// - RTL support
/// - Accessibility built-in
/// - Keyboard navigation
/// - Locale support
/// - Extensive customization through [AppDatePickerConfig]
///
/// Example:
/// ```dart
/// AppDatePicker(
///   variant: AppDatePickerVariant.date,
///   value: DateTime.now(),
///   onChanged: (value) => print('Selected: $value'),
///   firstDate: DateTime(2020),
///   lastDate: DateTime(2030),
/// )
/// ```
class AppDatePicker extends StatefulWidget {
  /// The variant of the date picker
  final AppDatePickerVariant variant;

  /// Current selected value
  /// - For [AppDatePickerVariant.date]: DateTime?
  /// - For [AppDatePickerVariant.time]: TimeOfDay?
  /// - For [AppDatePickerVariant.range]: AppDateRange?
  final dynamic value;

  /// Callback when the value changes
  final ValueChanged<dynamic>? onChanged;

  /// The earliest selectable date (for date and range variants)
  final DateTime? firstDate;

  /// The latest selectable date (for date and range variants)
  final DateTime? lastDate;

  /// The locale to use for formatting
  final Locale? locale;

  /// Whether the picker is enabled
  final bool enabled;

  /// Current state of the picker
  final AppDatePickerState state;

  /// Configuration for customization
  final AppDatePickerConfig? config;

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

  /// Whether to use 24-hour format for time (defaults to locale preference)
  final bool? use24HourFormat;

  /// Initial entry mode for date picker
  final DatePickerEntryMode? initialEntryMode;

  /// Validation function
  final FormFieldValidator<dynamic>? validator;

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

  const AppDatePicker({
    super.key,
    required this.variant,
    this.value,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    this.locale,
    this.enabled = true,
    this.state = AppDatePickerState.defaultState,
    this.config,
    this.hintText,
    this.errorText,
    this.helperText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.semanticLabel,
    this.use24HourFormat,
    this.initialEntryMode,
    this.validator,
    this.autovalidateMode,
    this.focusNode,
    this.textDirection,
    this.adaptivePlatform = true,
    this.onFocusChanged,
    this.onTap,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final FocusNode _focusNode;

  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  AppDatePickerConfig get _config =>
      widget.config ?? const AppDatePickerConfig();

  AppDatePickerColors get _colors =>
      _config.colors ?? AppDatePickerColors.fromTheme(Theme.of(context));

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

  Color _getBackgroundColor(AppDatePickerState state) {
    switch (state) {
      case AppDatePickerState.defaultState:
        return _colors.inputFillColor;
      case AppDatePickerState.hover:
        return _colors.hoverOverlayColor;
      case AppDatePickerState.pressed:
        return _colors.pressedOverlayColor;
      case AppDatePickerState.focus:
        return _colors.focusOverlayColor;
      case AppDatePickerState.selected:
        return _colors.selectionColor;
      case AppDatePickerState.disabled:
        return _colors.inputFillColor;
      case AppDatePickerState.loading:
        return _colors.inputFillColor;
      case AppDatePickerState.skeleton:
        return _colors.skeletonBaseColor;
    }
  }

  Color _getBorderColor(AppDatePickerState state) {
    switch (state) {
      case AppDatePickerState.defaultState:
        return _colors.inputBorderColor;
      case AppDatePickerState.hover:
        return _colors.inputBorderColor;
      case AppDatePickerState.pressed:
        return _colors.inputFocusedBorderColor;
      case AppDatePickerState.focus:
        return _colors.inputFocusedBorderColor;
      case AppDatePickerState.selected:
        return _colors.inputFocusedBorderColor;
      case AppDatePickerState.disabled:
        return _colors.inputDisabledBorderColor;
      case AppDatePickerState.loading:
        return _colors.inputBorderColor;
      case AppDatePickerState.skeleton:
        return _colors.skeletonBaseColor;
    }
  }

  AppDatePickerState get _currentState {
    if (!widget.enabled || widget.state == AppDatePickerState.disabled) {
      return AppDatePickerState.disabled;
    }
    if (widget.state == AppDatePickerState.loading) {
      return AppDatePickerState.loading;
    }
    if (widget.state == AppDatePickerState.skeleton) {
      return AppDatePickerState.skeleton;
    }
    if (_isPressed) {
      return AppDatePickerState.pressed;
    }
    if (_isFocused) {
      return AppDatePickerState.focus;
    }
    if (_isHovered) {
      return AppDatePickerState.hover;
    }
    if (widget.value != null) {
      return AppDatePickerState.selected;
    }
    return AppDatePickerState.defaultState;
  }

  String get _displayText {
    if (widget.value == null) {
      return widget.hintText ?? _getDefaultHintText();
    }

    switch (widget.variant) {
      case AppDatePickerVariant.date:
        final date = widget.value as DateTime;
        return _formatDate(date);
      case AppDatePickerVariant.time:
        final time = widget.value as TimeOfDay;
        return _formatTime(time);
      case AppDatePickerVariant.range:
        final range = widget.value as AppDateRange;
        final startText = _formatDate(range.start!);
        final endText = range.end != null ? _formatDate(range.end!) : '';
        return endText.isNotEmpty ? '$startText - $endText' : startText;
    }
  }

  String _getDefaultHintText() {
    switch (widget.variant) {
      case AppDatePickerVariant.date:
        return 'Seleccionar fecha';
      case AppDatePickerVariant.time:
        return 'Seleccionar hora';
      case AppDatePickerVariant.range:
        return 'Seleccionar rango de fechas';
    }
  }

  Future<void> _showPicker() async {
    if (!widget.enabled ||
        widget.state == AppDatePickerState.disabled ||
        widget.onChanged == null) {
      return;
    }

    widget.onTap?.call();

    try {
      dynamic result;

      switch (widget.variant) {
        case AppDatePickerVariant.date:
          result = await _showDatePicker();
          break;
        case AppDatePickerVariant.time:
          result = await _showTimePicker();
          break;
        case AppDatePickerVariant.range:
          result = await _showDateRangePicker();
          break;
      }

      if (result != null && widget.onChanged != null) {
        widget.onChanged!(result);
      }
    } catch (e) {
      debugPrint('Error showing picker: $e');
    }
  }

  Future<DateTime?> _showDatePicker() async {
    final currentValue = widget.value as DateTime?;

    if (widget.adaptivePlatform && defaultTargetPlatform == TargetPlatform.iOS) {
      return await _showCupertinoDatePicker(currentValue);
    }

    return await showDatePicker(
      context: context,
      initialDate: currentValue ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
      locale: widget.locale,
      initialEntryMode: widget.initialEntryMode ?? DatePickerEntryMode.calendar,
      helpText: widget.labelText,
      errorFormatText: 'Formato de fecha inválido',
      errorInvalidText: 'Fecha inválida',
      fieldHintText: widget.hintText,
      fieldLabelText: widget.labelText,
    );
  }

  Future<DateTime?> _showCupertinoDatePicker(DateTime? currentValue) async {
    DateTime? selectedDate = currentValue;

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: Column(
            children: [
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Confirmar'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: currentValue ?? DateTime.now(),
                  minimumDate: widget.firstDate,
                  maximumDate: widget.lastDate,
                  onDateTimeChanged: (DateTime value) {
                    selectedDate = value;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    return selectedDate;
  }

  Future<TimeOfDay?> _showTimePicker() async {
    final currentValue = widget.value as TimeOfDay?;

    if (widget.adaptivePlatform && defaultTargetPlatform == TargetPlatform.iOS) {
      return await _showCupertinoTimePicker(currentValue);
    }

    return await showTimePicker(
      context: context,
      initialTime: currentValue ?? TimeOfDay.now(),
      helpText: widget.labelText,
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
      errorInvalidText: 'Hora inválida',
      hourLabelText: 'Hora',
      minuteLabelText: 'Minuto',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: widget.use24HourFormat ?? false,
          ),
          child: child!,
        );
      },
    );
  }

  Future<TimeOfDay?> _showCupertinoTimePicker(TimeOfDay? currentValue) async {
    TimeOfDay? selectedTime = currentValue;

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: Column(
            children: [
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Confirmar'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime.now().copyWith(
                    hour: currentValue?.hour ?? TimeOfDay.now().hour,
                    minute: currentValue?.minute ?? TimeOfDay.now().minute,
                  ),
                  use24hFormat: widget.use24HourFormat ?? false,
                  onDateTimeChanged: (DateTime value) {
                    selectedTime = TimeOfDay.fromDateTime(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    return selectedTime;
  }

  Future<AppDateRange?> _showDateRangePicker() async {
    final currentValue = widget.value as AppDateRange?;

    final result = await showDateRangePicker(
      context: context,
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
      initialDateRange: currentValue != null && currentValue.start != null && currentValue.end != null
          ? DateTimeRange(start: currentValue.start!, end: currentValue.end!)
          : null,
      locale: widget.locale,
      helpText: widget.labelText ?? 'Seleccionar rango de fechas',
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
      saveText: 'Guardar',
      errorFormatText: 'Formato de fecha inválido',
      errorInvalidText: 'Fecha inválida',
      errorInvalidRangeText: 'Rango de fechas inválido',
      fieldStartHintText: 'Fecha de inicio',
      fieldEndHintText: 'Fecha de fin',
      fieldStartLabelText: 'Inicio',
      fieldEndLabelText: 'Fin',
    );

    return result != null ? AppDateRange(start: result.start, end: result.end) : null;
  }

  Widget _buildLoadingState() {
    return SizedBox(
      width: _config.loadingIndicatorSize,
      height: _config.loadingIndicatorSize,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(_colors.calendarSelectedColor),
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

  Widget _buildContent() {
    final currentState = _currentState;

    if (currentState == AppDatePickerState.loading) {
      return _buildLoadingState();
    }

    if (currentState == AppDatePickerState.skeleton) {
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
      case AppDatePickerVariant.date:
        return Icons.calendar_today;
      case AppDatePickerVariant.time:
        return Icons.access_time;
      case AppDatePickerVariant.range:
        return Icons.date_range;
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
            onTap: widget.enabled ? _showPicker : null,
            onTapDown: widget.enabled ? (_) {
              setState(() => _isPressed = true);
              _animationController.forward();
            } : null,
            onTapUp: widget.enabled ? (_) {
              setState(() => _isPressed = false);
              _animationController.reverse();
            } : null,
            onTapCancel: widget.enabled ? () {
              setState(() => _isPressed = false);
              _animationController.reverse();
            } : null,
            child: MouseRegion(
              onEnter: widget.enabled ? (_) => setState(() => _isHovered = true) : null,
              onExit: widget.enabled ? (_) => setState(() => _isHovered = false) : null,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: _config.minHeight,
                        maxHeight: _config.maxHeight ?? double.infinity,
                      ),
                      padding: _config.contentPadding,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(
                          color: borderColor,
                          width: _config.borderWidth,
                        ),
                        borderRadius: BorderRadius.circular(_config.borderRadius),
                        boxShadow: _config.enableShadow && currentState != AppDatePickerState.disabled
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

  String _formatDate(DateTime date) {
    // Simple date formatting - could be enhanced with intl package
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatTime(TimeOfDay time) {
    final use24Hour = widget.use24HourFormat ?? false;
    if (use24Hour) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      final hour12 = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      final period = time.period == DayPeriod.am ? 'AM' : 'PM';
      return '${hour12.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
    }
  }
}