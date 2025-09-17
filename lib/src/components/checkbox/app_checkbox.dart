import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'checkbox_config.dart';

class AppCheckbox extends StatefulWidget {
  final AppCheckboxValue? value;
  final ValueChanged<AppCheckboxValue?>? onChanged;
  final String? label;
  final Widget? labelWidget;
  final AppCheckboxConfig? config;
  final AppCheckboxColors? colors;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final AppCheckboxState? overrideState;
  final bool tristate;
  final TextDirection? textDirection;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? spacing;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.labelWidget,
    this.config,
    this.colors,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.semanticLabel,
    this.overrideState,
    this.tristate = false,
    this.textDirection,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.spacing,
  }) : assert(
          label == null || labelWidget == null,
          'Cannot provide both label and labelWidget',
        );

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late AnimationController _indeterminateAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _indeterminateAnimation;

  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  AppCheckboxConfig get _config =>
      widget.config ?? const AppCheckboxConfig();

  AppCheckboxColors get _colors =>
      widget.colors ?? AppCheckboxColors.fromTheme(Theme.of(context));

  bool get _isEnabled => widget.enabled && widget.onChanged != null;

  AppCheckboxState get _currentState {
    if (widget.overrideState != null) {
      return widget.overrideState!;
    }

    if (widget.overrideState == AppCheckboxState.skeleton) {
      return AppCheckboxState.skeleton;
    }

    if (widget.overrideState == AppCheckboxState.loading) {
      return AppCheckboxState.loading;
    }

    if (!_isEnabled) {
      return AppCheckboxState.disabled;
    }

    if (_isPressed) {
      return AppCheckboxState.pressed;
    }

    if (_isFocused) {
      return AppCheckboxState.focus;
    }

    if (_isHovered) {
      return AppCheckboxState.hover;
    }

    if (widget.value == AppCheckboxValue.checked) {
      return AppCheckboxState.selected;
    }

    return AppCheckboxState.defaultState;
  }

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);

    _animationController = AnimationController(
      duration: _config.animationDuration,
      vsync: this,
    );

    _indeterminateAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _config.animationCurve,
    ));

    _indeterminateAnimation = Tween<double>(
      begin: 0.25,
      end: 0.75,
    ).animate(CurvedAnimation(
      parent: _indeterminateAnimationController,
      curve: Curves.linear,
    ));

    _updateAnimationState();

    if (widget.value == AppCheckboxValue.indeterminate) {
      _indeterminateAnimationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AppCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _updateAnimationState();

      if (widget.value == AppCheckboxValue.indeterminate) {
        _indeterminateAnimationController.repeat(reverse: true);
      } else {
        _indeterminateAnimationController.stop();
      }
    }
  }

  void _updateAnimationState() {
    if (widget.value == AppCheckboxValue.checked) {
      _animationController.forward();
    } else if (widget.value == AppCheckboxValue.unchecked) {
      _animationController.reverse();
    } else {
      _animationController.value = 0.5;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _animationController.dispose();
    _indeterminateAnimationController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleTap() {
    if (!_isEnabled) return;

    if (_config.enableHapticFeedback && (Platform.isIOS || Platform.isAndroid)) {
      HapticFeedback.lightImpact();
    }

    final newValue = widget.tristate
        ? _getNextTriStateValue()
        : _getNextBiStateValue();

    widget.onChanged?.call(newValue);
    _focusNode.requestFocus();
  }

  AppCheckboxValue _getNextBiStateValue() {
    return widget.value == AppCheckboxValue.checked
        ? AppCheckboxValue.unchecked
        : AppCheckboxValue.checked;
  }

  AppCheckboxValue? _getNextTriStateValue() {
    switch (widget.value) {
      case AppCheckboxValue.unchecked:
        return AppCheckboxValue.checked;
      case AppCheckboxValue.checked:
        return widget.tristate ? AppCheckboxValue.indeterminate : AppCheckboxValue.unchecked;
      case AppCheckboxValue.indeterminate:
        return AppCheckboxValue.unchecked;
      case null:
        return AppCheckboxValue.checked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl = (widget.textDirection ?? Directionality.of(context)) == TextDirection.rtl;

    final checkboxWidget = _buildCheckbox();

    if (widget.label == null && widget.labelWidget == null) {
      return checkboxWidget;
    }

    final labelWidget = widget.labelWidget ?? Text(
      widget.label!,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: _isEnabled ? _colors.labelColor : _colors.disabledLabelColor,
      ),
    );

    final spacing = SizedBox(width: widget.spacing ?? 8.0);

    final children = isRtl
        ? [labelWidget, spacing, checkboxWidget]
        : [checkboxWidget, spacing, labelWidget];

    return Semantics(
      enabled: _isEnabled,
      checked: widget.value == AppCheckboxValue.checked,
      mixed: widget.value == AppCheckboxValue.indeterminate,
      label: widget.semanticLabel ?? widget.label,
      child: GestureDetector(
        onTap: _handleTap,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            mainAxisSize: widget.mainAxisSize,
            textDirection: widget.textDirection ?? (isRtl ? TextDirection.rtl : TextDirection.ltr),
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    if (_currentState == AppCheckboxState.skeleton) {
      return _buildSkeleton();
    }

    if (_currentState == AppCheckboxState.loading) {
      return _buildLoadingIndicator();
    }

    return _buildInteractiveCheckbox();
  }

  Widget _buildSkeleton() {
    return Container(
      width: _config.size,
      height: _config.size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: _config.borderRadius,
      ),
      child: const _SkeletonAnimation(),
    );
  }

  Widget _buildLoadingIndicator() {
    final theme = Theme.of(context);
    final size = _config.size * 0.6;

    if (Platform.isIOS || Platform.isMacOS) {
      return SizedBox(
        width: _config.size,
        height: _config.size,
        child: Center(
          child: CupertinoActivityIndicator(
            radius: size / 2,
            color: theme.colorScheme.primary,
          ),
        ),
      );
    }

    return SizedBox(
      width: _config.size,
      height: _config.size,
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInteractiveCheckbox() {
    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autoFocus,
      child: GestureDetector(
        onTapDown: _isEnabled ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: _isEnabled ? (_) => setState(() => _isPressed = false) : null,
        onTapCancel: _isEnabled ? () => setState(() => _isPressed = false) : null,
        onTap: _handleTap,
        child: MouseRegion(
          onEnter: _isEnabled ? (_) => setState(() => _isHovered = true) : null,
          onExit: _isEnabled ? (_) => setState(() => _isHovered = false) : null,
          cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Container(
            width: _config.minimumTouchTargetSize,
            height: _config.minimumTouchTargetSize,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildStateOverlay(),
                _buildCheckboxBox(),
                _buildCheckMark(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStateOverlay() {
    Color? overlayColor;
    double opacity = 0.0;

    switch (_currentState) {
      case AppCheckboxState.hover:
        overlayColor = _colors.hoverOverlay;
        opacity = _config.hoverOpacity;
        break;
      case AppCheckboxState.focus:
        overlayColor = _colors.focusOverlay;
        opacity = _config.focusOpacity;
        break;
      case AppCheckboxState.pressed:
        overlayColor = _colors.pressedOverlay;
        opacity = _config.pressedOpacity;
        break;
      default:
        break;
    }

    if (overlayColor == null) {
      return const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: _config.minimumTouchTargetSize,
      height: _config.minimumTouchTargetSize,
      decoration: BoxDecoration(
        color: overlayColor.withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCheckboxBox() {
    final isChecked = widget.value == AppCheckboxValue.checked ||
        widget.value == AppCheckboxValue.indeterminate;

    final borderColor = _isEnabled
        ? (isChecked ? _colors.fillColor : _colors.borderColor)
        : _colors.disabledBorderColor;

    final fillColor = _isEnabled
        ? (isChecked ? _colors.fillColor : Colors.transparent)
        : (isChecked ? _colors.disabledFillColor : Colors.transparent);

    return AnimatedContainer(
      duration: _config.animationDuration,
      curve: _config.animationCurve,
      width: _config.size,
      height: _config.size,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: _config.borderRadius,
        border: Border.all(
          color: borderColor,
          width: _config.borderWidth,
        ),
      ),
    );
  }

  Widget _buildCheckMark() {
    if (widget.value == AppCheckboxValue.unchecked) {
      return const SizedBox.shrink();
    }

    final checkColor = _isEnabled
        ? _colors.checkColor
        : _colors.disabledCheckColor;

    if (widget.value == AppCheckboxValue.indeterminate) {
      return AnimatedBuilder(
        animation: _indeterminateAnimation,
        builder: (context, child) {
          return CustomPaint(
            size: Size(_config.size, _config.size),
            painter: _IndeterminatePainter(
              color: checkColor,
              progress: _indeterminateAnimation.value,
              strokeWidth: _config.size * 0.12,
            ),
          );
        },
      );
    }

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: CustomPaint(
            size: Size(_config.size, _config.size),
            painter: _CheckPainter(
              color: checkColor,
              strokeWidth: _config.size * 0.12,
            ),
          ),
        );
      },
    );
  }
}

class _CheckPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const _CheckPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    final startX = size.width * 0.25;
    final startY = size.height * 0.5;
    final midX = size.width * 0.42;
    final midY = size.height * 0.65;
    final endX = size.width * 0.75;
    final endY = size.height * 0.32;

    path.moveTo(startX, startY);
    path.lineTo(midX, midY);
    path.lineTo(endX, endY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CheckPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}

class _IndeterminatePainter extends CustomPainter {
  final Color color;
  final double progress;
  final double strokeWidth;

  const _IndeterminatePainter({
    required this.color,
    required this.progress,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final lineStart = size.width * progress;
    final lineEnd = size.width * (1 - progress);
    final y = size.height * 0.5;

    canvas.drawLine(
      Offset(lineStart, y),
      Offset(lineEnd, y),
      paint,
    );
  }

  @override
  bool shouldRepaint(_IndeterminatePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

class _SkeletonAnimation extends StatefulWidget {
  const _SkeletonAnimation();

  @override
  State<_SkeletonAnimation> createState() => _SkeletonAnimationState();
}

class _SkeletonAnimationState extends State<_SkeletonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .surfaceContainerHighest
                .withValues(alpha: _animation.value),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }
}