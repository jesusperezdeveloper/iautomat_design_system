import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'ds_switch_config.dart';

class DSSwitch extends StatefulWidget {
  final DSSwitchConfig config;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final String? semanticsLabel;

  const DSSwitch({
    super.key,
    this.config = const DSSwitchConfig(),
    this.value,
    this.onChanged,
    this.semanticsLabel,
  });

  @override
  State<DSSwitch> createState() => _DSSwitchState();
}

class _DSSwitchState extends State<DSSwitch> with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late AnimationController _hoverAnimationController;
  late AnimationController _toggleAnimationController;
  late AnimationController _loadingAnimationController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;
  late bool _value;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.config.value;
    _setupAnimations();
    _setupFocus();
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration:
          Duration(milliseconds: widget.config.animation?.duration ?? 200),
      vsync: this,
    );

    _hoverAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _toggleAnimationController = AnimationController(
      duration:
          Duration(milliseconds: widget.config.animation?.duration ?? 200),
      vsync: this,
    );

    _loadingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _hoverAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _loadingAnimationController,
      curve: Curves.linear,
    ));

    _stateAnimationController.forward();
    if (_value) {
      _toggleAnimationController.value = 1.0;
    }
  }

  void _setupFocus() {
    _focusNode.addListener(() {
      widget.config.onFocusChange?.call(_focusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(DSSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newValue = widget.value ?? widget.config.value;
    if (_value != newValue) {
      setState(() {
        _value = newValue;
      });
      _animateToggle();
    }

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case DSSwitchState.loading:
        _loadingAnimationController.repeat();
        break;
      case DSSwitchState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case DSSwitchState.disabled:
        _stateAnimationController.animateTo(0.6);
        break;
      default:
        _loadingAnimationController.stop();
        if (!_stateAnimationController.isCompleted) {
          _stateAnimationController.forward();
        }
        break;
    }
  }

  void _animateToggle() {
    if (_value) {
      _toggleAnimationController.forward();
    } else {
      _toggleAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _hoverAnimationController.dispose();
    _toggleAnimationController.dispose();
    _loadingAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl =
        widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: widget.config.enableA11y
            ? (widget.semanticsLabel ?? widget.config.semanticsLabel)
            : null,
        toggled: widget.config.enableA11y ? _value : null,
        enabled: widget.config.state.canInteract,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _stateAnimationController,
            _hoverAnimationController,
            _toggleAnimationController,
            _loadingAnimationController,
          ]),
          builder: (context, child) {
            return AnimatedOpacity(
              opacity: widget.config.state.opacity,
              duration: Duration(
                  milliseconds: widget.config.animation?.duration ?? 200),
              child: _buildSwitchVariant(theme, isRtl),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    final spacing = widget.config.spacing ?? const DSSwitchSpacing();
    return Container(
      width: spacing.trackWidth,
      height: spacing.trackHeight,
      decoration: BoxDecoration(
        color: _getTrackColor(theme, false),
        borderRadius: BorderRadius.circular(spacing.trackHeight / 2),
        border: Border.all(
          color: _getTrackBorderColor(theme),
          width: spacing.trackBorderWidth,
        ),
      ),
      child: Center(
        child: Transform.rotate(
          angle: _rotationAnimation.value * 2 * 3.14159,
          child: SizedBox(
            width: spacing.thumbRadius,
            height: spacing.thumbRadius,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.config.colors?.loadingColor ?? theme.colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    final spacing = widget.config.spacing ?? const DSSwitchSpacing();
    return AnimatedBuilder(
      animation: _stateAnimationController,
      builder: (context, child) {
        return Container(
          width: spacing.trackWidth,
          height: spacing.trackHeight,
          decoration: BoxDecoration(
            color: widget.config.colors?.skeletonColor ?? Colors.grey[300],
            borderRadius: BorderRadius.circular(spacing.trackHeight / 2),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withValues(alpha: _fadeAnimation.value * 0.3),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin:
                  Alignment(-1.0 + (_stateAnimationController.value * 2), 0.0),
              end: Alignment(1.0 + (_stateAnimationController.value * 2), 0.0),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSwitchVariant(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    Widget switchWidget = _buildInteractiveSwitch(theme, isRtl);

    if (widget.config.enableKeyboardSupport) {
      switchWidget = Focus(
        onKeyEvent: _handleKeyEvent,
        child: switchWidget,
      );
    }

    return switchWidget;
  }

  Widget _buildInteractiveSwitch(ThemeData theme, bool isRtl) {
    Widget content;

    // Determine if we should use adaptive behavior
    if (widget.config.isAdaptive) {
      content = _buildAdaptiveSwitch(theme);
    } else {
      switch (widget.config.variant) {
        case DSSwitchVariant.android:
          content = _buildAndroidSwitch(theme);
          break;
        case DSSwitchVariant.cupertino:
          content = _buildCupertinoSwitch(theme);
          break;
      }
    }

    return _wrapWithEffects(content, theme);
  }

  Widget _buildAdaptiveSwitch(ThemeData theme) {
    // Use platform-specific switch when adaptive is enabled
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _buildCupertinoSwitch(theme);
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildAndroidSwitch(theme);
    }
  }

  Widget _buildAndroidSwitch(ThemeData theme) {
    return Switch(
      value: _value,
      onChanged: widget.config.state.canInteract ? _handleToggle : null,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _getActiveThumbColor(theme);
        }
        return _getInactiveThumbColor(theme);
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _getActiveTrackColor(theme);
        }
        return _getInactiveTrackColor(theme);
      }),
      focusColor: _getFocusColor(theme),
      hoverColor: _getHoverColor(theme),
      overlayColor: WidgetStateProperty.resolveWith(_getOverlayColor),
      splashRadius: widget.config.spacing?.thumbRadius ?? 14.0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildCupertinoSwitch(ThemeData theme) {
    return CupertinoSwitch(
      value: _value,
      onChanged: widget.config.state.canInteract ? _handleToggle : null,
      activeTrackColor: _getActiveTrackColor(theme),
      inactiveTrackColor: _getInactiveTrackColor(theme),
      thumbColor:
          _value ? _getActiveThumbColor(theme) : _getInactiveThumbColor(theme),
      focusColor: _getFocusColor(theme),
    );
  }

  Widget _wrapWithEffects(Widget switchWidget, ThemeData theme) {
    Widget wrappedSwitch = switchWidget;

    if (widget.config.animation?.type == DSSwitchAnimationType.scale) {
      wrappedSwitch = ScaleTransition(
        scale: _scaleAnimation,
        child: wrappedSwitch,
      );
    }

    if (widget.config.animation?.type == DSSwitchAnimationType.fade) {
      wrappedSwitch = AnimatedOpacity(
        opacity: _fadeAnimation.value,
        duration:
            Duration(milliseconds: widget.config.animation?.duration ?? 200),
        child: wrappedSwitch,
      );
    }

    if (widget.config.behavior?.enableHover == true) {
      wrappedSwitch = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        child: wrappedSwitch,
      );
    }

    return wrappedSwitch;
  }

  Color _getActiveTrackColor(ThemeData theme) {
    if (widget.config.state == DSSwitchState.disabled) {
      return widget.config.colors?.disabledTrackColor ??
          theme.colorScheme.onSurface.withValues(alpha: 0.12);
    }

    return widget.config.colors?.activeTrackColor ??
        widget.config.variant.getActiveTrackColor(theme.colorScheme);
  }

  Color _getInactiveTrackColor(ThemeData theme) {
    if (widget.config.state == DSSwitchState.disabled) {
      return widget.config.colors?.disabledTrackColor ??
          theme.colorScheme.onSurface.withValues(alpha: 0.12);
    }

    return widget.config.colors?.inactiveTrackColor ??
        widget.config.variant.getInactiveTrackColor(theme.colorScheme);
  }

  Color _getActiveThumbColor(ThemeData theme) {
    if (widget.config.state == DSSwitchState.disabled) {
      return widget.config.colors?.disabledThumbColor ??
          theme.colorScheme.onSurface.withValues(alpha: 0.38);
    }

    return widget.config.colors?.activeThumbColor ??
        widget.config.variant.getActiveThumbColor(theme.colorScheme);
  }

  Color _getInactiveThumbColor(ThemeData theme) {
    if (widget.config.state == DSSwitchState.disabled) {
      return widget.config.colors?.disabledThumbColor ??
          theme.colorScheme.onSurface.withValues(alpha: 0.38);
    }

    return widget.config.colors?.inactiveThumbColor ??
        widget.config.variant.getInactiveThumbColor(theme.colorScheme);
  }

  Color _getTrackColor(ThemeData theme, bool isActive) {
    return isActive
        ? _getActiveTrackColor(theme)
        : _getInactiveTrackColor(theme);
  }

  Color _getTrackBorderColor(ThemeData theme) {
    return theme.colorScheme.outline;
  }

  Color _getFocusColor(ThemeData theme) {
    return widget.config.colors?.focusColor ??
        theme.colorScheme.primary.withValues(alpha: 0.12);
  }

  Color _getHoverColor(ThemeData theme) {
    return widget.config.colors?.hoverColor ??
        theme.colorScheme.primary.withValues(alpha: 0.08);
  }

  Color? _getOverlayColor(Set<WidgetState> states) {
    final theme = Theme.of(context);

    if (states.contains(WidgetState.pressed)) {
      return theme.colorScheme.primary.withValues(alpha: 0.12);
    }
    if (states.contains(WidgetState.hovered)) {
      return _getHoverColor(theme);
    }
    if (states.contains(WidgetState.focused)) {
      return _getFocusColor(theme);
    }

    return widget.config.colors?.overlayColor;
  }

  void _handleToggle(bool value) {
    if (widget.config.behavior?.enableHapticFeedback == true) {
      HapticFeedback.lightImpact();
    }

    setState(() {
      _value = value;
    });

    _animateToggle();

    // Call the external callback first (from widget prop)
    final onChanged = widget.onChanged ?? widget.config.onChanged;
    onChanged?.call(value);
  }

  void _handleHoverStart() {
    widget.config.onHover?.call(true);
    _hoverAnimationController.forward();
  }

  void _handleHoverEnd() {
    widget.config.onHover?.call(false);
    _hoverAnimationController.reverse();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!widget.config.state.canInteract) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.space) {
        _handleToggle(!_value);
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }
}
