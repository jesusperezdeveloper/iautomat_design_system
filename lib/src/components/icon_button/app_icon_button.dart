import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_icon_button_config.dart';

class AppIconButton extends StatefulWidget {
  final AppIconButtonConfig config;
  final Widget icon;
  final String? tooltip;
  final AppIconButtonSize? size;
  final bool? isToggled;

  const AppIconButton({
    super.key,
    this.config = const AppIconButtonConfig(),
    required this.icon,
    this.tooltip,
    this.size,
    this.isToggled,
  });

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late AnimationController _hoverAnimationController;
  late AnimationController _pressAnimationController;
  late AnimationController _rotationController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;

  bool _isHovering = false;
  bool _isFocused = false;
  late bool _isToggled;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isToggled = widget.isToggled ?? widget.config.isToggled;
    _setupAnimations();
    _setupFocus();
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration: Duration(milliseconds: widget.config.animation?.duration ?? 200),
      vsync: this,
    );

    _hoverAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _pressAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _pressAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverAnimationController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: Curves.easeInOut,
    ));

    _stateAnimationController.forward();
  }

  void _setupFocus() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
      widget.config.onFocusChange?.call(_focusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(AppIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newToggleState = widget.isToggled ?? widget.config.isToggled;
    if (_isToggled != newToggleState) {
      setState(() {
        _isToggled = newToggleState;
      });
    }

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case AppIconButtonState.loading:
        _rotationController.repeat();
        break;
      case AppIconButtonState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case AppIconButtonState.disabled:
        _stateAnimationController.animateTo(0.6);
        break;
      default:
        _rotationController.stop();
        if (!_stateAnimationController.isCompleted) {
          _stateAnimationController.forward();
        }
        break;
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _hoverAnimationController.dispose();
    _pressAnimationController.dispose();
    _rotationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl = widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: widget.config.enableA11y ? widget.tooltip : null,
        button: widget.config.enableA11y,
        enabled: widget.config.state.canInteract,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _stateAnimationController,
            _hoverAnimationController,
            _pressAnimationController,
            _rotationController,
          ]),
          builder: (context, child) {
            return AnimatedOpacity(
              opacity: widget.config.state.opacity,
              duration: Duration(milliseconds: widget.config.animation?.duration ?? 200),
              child: _buildIconButtonVariant(theme, isRtl),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    final size = _getSize();
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        shape: BoxShape.circle,
        boxShadow: _buildBoxShadow(theme),
      ),
      child: Center(
        child: Transform.rotate(
          angle: _rotationAnimation.value * 2 * 3.14159,
          child: SizedBox(
            width: _getIconSize() * 0.8,
            height: _getIconSize() * 0.8,
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
    final size = _getSize();
    return AnimatedBuilder(
      animation: _stateAnimationController,
      builder: (context, child) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: widget.config.colors?.skeletonColor ?? Colors.grey[300],
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withValues(alpha: _fadeAnimation.value * 0.3),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1.0 + (_stateAnimationController.value * 2), 0.0),
              end: Alignment(1.0 + (_stateAnimationController.value * 2), 0.0),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconButtonVariant(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    Widget iconButton = _buildInteractiveIconButton(theme, isRtl);

    if (widget.config.enableKeyboardSupport) {
      iconButton = Focus(
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        child: iconButton,
      );
    }

    if (widget.tooltip != null) {
      iconButton = Tooltip(
        message: widget.tooltip!,
        child: iconButton,
      );
    }

    return iconButton;
  }

  Widget _buildInteractiveIconButton(ThemeData theme, bool isRtl) {
    Widget content = _buildIconContent(theme);

    switch (widget.config.variant) {
      case AppIconButtonVariant.standard:
        return _buildStandardIconButton(content, theme);
      case AppIconButtonVariant.filled:
        return _buildFilledIconButton(content, theme);
      case AppIconButtonVariant.tonal:
        return _buildTonalIconButton(content, theme);
    }
  }

  Widget _buildStandardIconButton(Widget content, ThemeData theme) {
    Widget iconButton = IconButton(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      icon: content,
      iconSize: _getIconSize(),
      color: _getForegroundColor(theme),
      splashRadius: _getSize() * 0.5,
      padding: _getPadding(),
      constraints: BoxConstraints(
        minWidth: _getSize(),
        minHeight: _getSize(),
      ),
    );

    return _wrapWithEffects(iconButton, theme);
  }

  Widget _buildFilledIconButton(Widget content, ThemeData theme) {
    Widget iconButton = IconButton.filled(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      icon: content,
      iconSize: _getIconSize(),
      color: _getForegroundColor(theme),
      style: IconButton.styleFrom(
        backgroundColor: _getBackgroundColor(theme),
        foregroundColor: _getForegroundColor(theme),
        padding: _getPadding(),
        minimumSize: Size(_getSize(), _getSize()),
        maximumSize: Size(_getSize(), _getSize()),
        elevation: _getElevation(),
        shadowColor: _getShadowColor(theme),
      ),
    );

    return _wrapWithEffects(iconButton, theme);
  }

  Widget _buildTonalIconButton(Widget content, ThemeData theme) {
    Widget iconButton = IconButton.filledTonal(
      onPressed: widget.config.state.canInteract ? _handleTap : null,
      icon: content,
      iconSize: _getIconSize(),
      color: _getForegroundColor(theme),
      style: IconButton.styleFrom(
        backgroundColor: _getBackgroundColor(theme),
        foregroundColor: _getForegroundColor(theme),
        padding: _getPadding(),
        minimumSize: Size(_getSize(), _getSize()),
        maximumSize: Size(_getSize(), _getSize()),
        elevation: _getElevation(),
        shadowColor: _getShadowColor(theme),
      ),
    );

    return _wrapWithEffects(iconButton, theme);
  }

  Widget _wrapWithEffects(Widget iconButton, ThemeData theme) {
    Widget wrappedButton = iconButton;

    if (widget.config.animation?.type == AppIconButtonAnimationType.scale) {
      wrappedButton = ScaleTransition(
        scale: _scaleAnimation,
        child: wrappedButton,
      );
    }

    if (widget.config.behavior?.enableHover == true) {
      wrappedButton = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        child: wrappedButton,
      );
    }

    return wrappedButton;
  }

  Widget _buildIconContent(ThemeData theme) {
    Widget iconWidget = widget.icon;

    if (widget.config.state == AppIconButtonState.loading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getForegroundColor(theme),
          ),
        ),
      );
    }

    if (widget.config.animation?.type == AppIconButtonAnimationType.rotation) {
      iconWidget = Transform.rotate(
        angle: _rotationAnimation.value * 2 * 3.14159,
        child: iconWidget,
      );
    }

    if (widget.config.animation?.type == AppIconButtonAnimationType.fade) {
      iconWidget = AnimatedOpacity(
        opacity: _fadeAnimation.value,
        duration: Duration(milliseconds: widget.config.animation?.duration ?? 200),
        child: iconWidget,
      );
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: widget.config.animation?.duration ?? 200),
      child: iconWidget,
    );
  }

  double _getSize() {
    final spacing = widget.config.spacing ?? const AppIconButtonSpacing();
    final size = widget.size ?? widget.config.size;
    return size.getSize(spacing);
  }

  double _getIconSize() {
    final size = widget.size ?? widget.config.size;
    return size.iconSize;
  }

  EdgeInsetsGeometry _getPadding() {
    final size = widget.size ?? widget.config.size;
    return size.padding;
  }

  double _getElevation() {
    final baseElevation = widget.config.elevation?.defaultElevation ?? 0.0;

    if (!widget.config.state.canInteract) {
      return widget.config.elevation?.disabledElevation ?? 0.0;
    }

    final stateMultiplier = widget.config.state.elevationMultiplier;
    final animationMultiplier = _elevationAnimation.value;

    return baseElevation * stateMultiplier * (1.0 + animationMultiplier);
  }

  List<BoxShadow> _buildBoxShadow(ThemeData theme) {
    final elevation = _getElevation();
    if (elevation <= 0) return [];

    return [
      BoxShadow(
        color: _getShadowColor(theme).withValues(alpha: 0.3),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.5,
        offset: Offset(0, elevation),
      ),
    ];
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (widget.config.state == AppIconButtonState.disabled) {
      return widget.config.colors?.disabledColor ??
             theme.colorScheme.onSurface.withValues(alpha: 0.12);
    }

    if (_isHovering && widget.config.state.canInteract) {
      return widget.config.colors?.hoverColor ??
             widget.config.variant.getBackgroundColor(theme.colorScheme, _isToggled);
    }

    if (_isFocused && widget.config.state.canInteract) {
      return widget.config.colors?.focusColor ??
             widget.config.variant.getBackgroundColor(theme.colorScheme, _isToggled);
    }

    if (widget.config.state == AppIconButtonState.selected) {
      return widget.config.colors?.selectedColor ??
             widget.config.variant.getBackgroundColor(theme.colorScheme, true);
    }

    if (_isToggled) {
      return widget.config.colors?.toggledBackgroundColor ??
             widget.config.variant.getBackgroundColor(theme.colorScheme, true);
    }

    return widget.config.colors?.backgroundColor ??
           widget.config.variant.getBackgroundColor(theme.colorScheme, false);
  }

  Color _getForegroundColor(ThemeData theme) {
    if (widget.config.state == AppIconButtonState.disabled) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.38);
    }

    if (_isToggled) {
      return widget.config.colors?.toggledColor ??
             widget.config.variant.getForegroundColor(theme.colorScheme, true);
    }

    return widget.config.colors?.foregroundColor ??
           widget.config.variant.getForegroundColor(theme.colorScheme, false);
  }

  Color _getShadowColor(ThemeData theme) {
    return widget.config.elevation?.shadowColor ??
           widget.config.colors?.shadowColor ??
           theme.colorScheme.shadow;
  }

  void _handleTap() {
    if (widget.config.behavior?.enableHapticFeedback == true) {
      HapticFeedback.lightImpact();
    }

    if (widget.config.animation?.type == AppIconButtonAnimationType.rotation) {
      _rotationController.forward(from: 0.0);
    } else if (widget.config.animation?.type == AppIconButtonAnimationType.scale) {
      _pressAnimationController.forward().then((_) {
        _pressAnimationController.reverse();
      });
    }

    if (widget.config.behavior?.enableToggle == true) {
      setState(() {
        _isToggled = !_isToggled;
      });
      widget.config.onToggle?.call(_isToggled);
    }

    widget.config.onPressed?.call();
  }

  void _handleHoverStart() {
    setState(() {
      _isHovering = true;
    });
    widget.config.onHover?.call(true);
    _hoverAnimationController.forward();
  }

  void _handleHoverEnd() {
    setState(() {
      _isHovering = false;
    });
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
        _handleTap();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }
}