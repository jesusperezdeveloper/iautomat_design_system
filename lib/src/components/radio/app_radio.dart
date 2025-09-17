import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'radio_config.dart';

class AppRadio<T> extends StatefulWidget {
  final T? value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final Widget? labelWidget;
  final AppRadioConfig? config;
  final AppRadioColors? colors;
  final AppRadioVariant variant;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final AppRadioState? overrideState;
  final TextDirection? textDirection;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? spacing;
  final List<AppRadioValue<T>>? options;

  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.labelWidget,
    this.config,
    this.colors,
    this.variant = AppRadioVariant.standard,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.semanticLabel,
    this.overrideState,
    this.textDirection,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.spacing,
    this.options,
  }) : assert(
          label == null || labelWidget == null,
          'Cannot provide both label and labelWidget',
        ),
        assert(
          variant == AppRadioVariant.standard || options != null,
          'Segmented variant requires options parameter',
        );

  @override
  State<AppRadio<T>> createState() => _AppRadioState<T>();
}

class _AppRadioState<T> extends State<AppRadio<T>> with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  AppRadioConfig get _config =>
      widget.config ?? const AppRadioConfig();

  AppRadioColors get _colors =>
      widget.colors ?? AppRadioColors.fromTheme(Theme.of(context));

  bool get _isEnabled => widget.enabled && widget.onChanged != null;

  bool get _isSelected => widget.value == widget.groupValue;

  AppRadioState get _currentState {
    if (widget.overrideState != null) {
      return widget.overrideState!;
    }

    if (widget.overrideState == AppRadioState.skeleton) {
      return AppRadioState.skeleton;
    }

    if (widget.overrideState == AppRadioState.loading) {
      return AppRadioState.loading;
    }

    if (!_isEnabled) {
      return AppRadioState.disabled;
    }

    if (_isPressed) {
      return AppRadioState.pressed;
    }

    if (_isFocused) {
      return AppRadioState.focus;
    }

    if (_isHovered) {
      return AppRadioState.hover;
    }

    if (_isSelected) {
      return AppRadioState.selected;
    }

    return AppRadioState.defaultState;
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

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _config.animationCurve,
    ));

    _updateAnimationState();
  }

  @override
  void didUpdateWidget(AppRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.groupValue != widget.groupValue ||
        oldWidget.value != widget.value) {
      _updateAnimationState();
    }
  }

  void _updateAnimationState() {
    if (_isSelected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _animationController.dispose();
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

    widget.onChanged?.call(widget.value);
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.variant) {
      case AppRadioVariant.standard:
        return _buildStandardRadio();
      case AppRadioVariant.segmented:
        return _buildSegmentedRadio();
    }
  }

  Widget _buildStandardRadio() {
    final theme = Theme.of(context);
    final isRtl = (widget.textDirection ?? Directionality.of(context)) == TextDirection.rtl;

    final radioWidget = _buildRadioControl();

    if (widget.label == null && widget.labelWidget == null) {
      return radioWidget;
    }

    final labelWidget = widget.labelWidget ?? Text(
      widget.label!,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: _isEnabled ? _colors.labelColor : _colors.disabledLabelColor,
      ),
    );

    final spacing = SizedBox(width: widget.spacing ?? 8.0);

    final children = isRtl
        ? [labelWidget, spacing, radioWidget]
        : [radioWidget, spacing, labelWidget];

    return Semantics(
      enabled: _isEnabled,
      checked: _isSelected,
      inMutuallyExclusiveGroup: true,
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

  Widget _buildSegmentedRadio() {
    if (widget.options == null || widget.options!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Semantics(
      enabled: _isEnabled,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _colors.segmentBorderColor,
            width: _config.segmentBorderWidth,
          ),
          borderRadius: BorderRadius.circular(_config.segmentBorderRadius),
        ),
        child: Row(
          mainAxisSize: widget.mainAxisSize,
          children: widget.options!.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            final isFirst = index == 0;
            final isLast = index == widget.options!.length - 1;
            final isSelected = option.value == widget.groupValue;
            final isOptionEnabled = _isEnabled && option.enabled;

            return Expanded(
              child: _SegmentedRadioItem<T>(
                option: option,
                isSelected: isSelected,
                isEnabled: isOptionEnabled,
                isFirst: isFirst,
                isLast: isLast,
                colors: _colors,
                config: _config,
                onTap: () {
                  if (isOptionEnabled) {
                    if (_config.enableHapticFeedback && (Platform.isIOS || Platform.isAndroid)) {
                      HapticFeedback.lightImpact();
                    }
                    widget.onChanged?.call(option.value);
                  }
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRadioControl() {
    if (_currentState == AppRadioState.skeleton) {
      return _buildSkeleton();
    }

    if (_currentState == AppRadioState.loading) {
      return _buildLoadingIndicator();
    }

    return _buildInteractiveRadio();
  }

  Widget _buildSkeleton() {
    return Container(
      width: _config.size,
      height: _config.size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
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

  Widget _buildInteractiveRadio() {
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
                _buildRadioCircle(),
                _buildRadioDot(),
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
      case AppRadioState.hover:
        overlayColor = _colors.hoverOverlay;
        opacity = _config.hoverOpacity;
        break;
      case AppRadioState.focus:
        overlayColor = _colors.focusOverlay;
        opacity = _config.focusOpacity;
        break;
      case AppRadioState.pressed:
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

  Widget _buildRadioCircle() {
    final borderColor = _isEnabled
        ? (_isSelected ? _colors.fillColor : _colors.borderColor)
        : _colors.disabledBorderColor;

    final fillColor = _isEnabled
        ? (_isSelected ? _colors.fillColor : Colors.transparent)
        : (_isSelected ? _colors.disabledFillColor : Colors.transparent);

    return AnimatedContainer(
      duration: _config.animationDuration,
      curve: _config.animationCurve,
      width: _config.size,
      height: _config.size,
      decoration: BoxDecoration(
        color: fillColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: _config.borderWidth,
        ),
      ),
    );
  }

  Widget _buildRadioDot() {
    if (!_isSelected) {
      return const SizedBox.shrink();
    }

    final dotColor = _isEnabled
        ? _colors.dotColor
        : _colors.disabledDotColor;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: _config.size * 0.5,
            height: _config.size * 0.5,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

class _SegmentedRadioItem<T> extends StatefulWidget {
  final AppRadioValue<T> option;
  final bool isSelected;
  final bool isEnabled;
  final bool isFirst;
  final bool isLast;
  final AppRadioColors colors;
  final AppRadioConfig config;
  final VoidCallback onTap;

  const _SegmentedRadioItem({
    required this.option,
    required this.isSelected,
    required this.isEnabled,
    required this.isFirst,
    required this.isLast,
    required this.colors,
    required this.config,
    required this.onTap,
  });

  @override
  State<_SegmentedRadioItem<T>> createState() => _SegmentedRadioItemState<T>();
}

class _SegmentedRadioItemState<T> extends State<_SegmentedRadioItem<T>> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = widget.isSelected
        ? widget.colors.segmentSelectedBackgroundColor
        : widget.colors.segmentBackgroundColor;

    final textColor = widget.isSelected
        ? widget.colors.segmentSelectedTextColor
        : widget.colors.segmentTextColor;

    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(widget.isFirst ? widget.config.segmentBorderRadius : 0),
      bottomLeft: Radius.circular(widget.isFirst ? widget.config.segmentBorderRadius : 0),
      topRight: Radius.circular(widget.isLast ? widget.config.segmentBorderRadius : 0),
      bottomRight: Radius.circular(widget.isLast ? widget.config.segmentBorderRadius : 0),
    );

    return Semantics(
      enabled: widget.isEnabled,
      checked: widget.isSelected,
      inMutuallyExclusiveGroup: true,
      label: widget.option.label,
      child: GestureDetector(
        onTapDown: widget.isEnabled ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: widget.isEnabled ? (_) => setState(() => _isPressed = false) : null,
        onTapCancel: widget.isEnabled ? () => setState(() => _isPressed = false) : null,
        onTap: widget.isEnabled ? widget.onTap : null,
        child: MouseRegion(
          onEnter: widget.isEnabled ? (_) => setState(() => _isHovered = true) : null,
          onExit: widget.isEnabled ? (_) => setState(() => _isHovered = false) : null,
          cursor: widget.isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
              border: !widget.isLast ? Border(
                right: BorderSide(
                  color: widget.colors.segmentBorderColor,
                  width: widget.config.segmentBorderWidth,
                ),
              ) : null,
            ),
            child: Stack(
              children: [
                if (_isHovered && widget.isEnabled)
                  Container(
                    decoration: BoxDecoration(
                      color: widget.colors.hoverOverlay.withValues(alpha: 0.08),
                      borderRadius: borderRadius,
                    ),
                  ),
                if (_isPressed && widget.isEnabled)
                  Container(
                    decoration: BoxDecoration(
                      color: widget.colors.pressedOverlay.withValues(alpha: 0.12),
                      borderRadius: borderRadius,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.option.icon != null) ...[
                        Icon(
                          widget.option.icon,
                          size: 18,
                          color: widget.isEnabled
                              ? textColor
                              : widget.colors.disabledLabelColor,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Text(
                          widget.option.label,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: widget.isEnabled
                                ? textColor
                                : widget.colors.disabledLabelColor,
                            fontWeight: widget.isSelected ? FontWeight.w500 : FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}