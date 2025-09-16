import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_button_config.dart';

class AppButton extends StatefulWidget {
  final AppButtonConfig config;
  final String? label;
  final Widget? leading;
  final Widget? trailing;
  final AppButtonSize? size;
  final bool? isDanger;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    this.config = const AppButtonConfig(),
    this.label,
    this.leading,
    this.trailing,
    this.size,
    this.isDanger,
    this.width,
    this.height,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late AnimationController _hoverAnimationController;
  late AnimationController _pressAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  bool _isHovering = false;
  bool _isPressed = false;
  bool _isFocused = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupFocus();
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
      vsync: this,
    );

    _hoverAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _pressAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverAnimationController,
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
  void didUpdateWidget(AppButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case AppButtonState.loading:
      case AppButtonState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case AppButtonState.disabled:
        _stateAnimationController.animateTo(0.6);
        break;
      default:
        _stateAnimationController.forward();
        break;
    }
  }

  @override
  void dispose() {
    _stateAnimationController.dispose();
    _hoverAnimationController.dispose();
    _pressAnimationController.dispose();
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
        label: widget.config.enableA11y ? 'Button' : null,
        button: widget.config.enableA11y,
        enabled: widget.config.state.canInteract,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _stateAnimationController,
            _hoverAnimationController,
            _pressAnimationController,
          ]),
          builder: (context, child) {
            return AnimatedScale(
              scale: _getScale(),
              duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
              curve: widget.config.animation?.curve ?? Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: widget.config.state.opacity,
                duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
                child: _buildButtonVariant(theme, isRtl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      padding: EdgeInsets.all(_getSize().verticalPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _getSize().iconSize,
            height: _getSize().iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.config.colors?.loadingColor ?? Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Cargando...',
            style: TextStyle(
              fontSize: _getSize().fontSize,
              color: widget.config.colors?.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonState() {
    return Container(
      width: widget.width ?? 120,
      height: _getSize().minHeight,
      decoration: BoxDecoration(
        color: widget.config.colors?.skeletonColor ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      ),
      child: AnimatedBuilder(
        animation: _stateAnimationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment(-1.0 + (_stateAnimationController.value * 2), 0.0),
                end: Alignment(1.0 + (_stateAnimationController.value * 2), 0.0),
              ),
            ),
          );
        },
      ),
    );
  }

  double _getScale() {
    double scale = _scaleAnimation.value;

    if (_isPressed && widget.config.animation?.enablePressAnimation == true) {
      scale *= 0.95;
    } else if (_isHovering && widget.config.animation?.enableHoverAnimation == true) {
      scale *= 1.02;
    }

    return scale;
  }

  double _getElevation() {
    final baseElevation = widget.config.elevation?.defaultElevation ?? 1.0;

    if (!widget.config.state.canInteract) {
      return widget.config.elevation?.disabledElevation ?? 0.0;
    }

    final stateMultiplier = widget.config.state.elevationMultiplier;
    final animationMultiplier = _elevationAnimation.value;

    return baseElevation * stateMultiplier * (1.0 + animationMultiplier);
  }

  AppButtonSize _getSize() {
    return widget.size ?? widget.config.size;
  }

  Widget _buildButtonVariant(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState();
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState();
    }

    Widget buttonContent = _buildInteractiveButton(theme, isRtl);

    switch (widget.config.variant) {
      case AppButtonVariant.filled:
        return _buildFilledButton(buttonContent, theme);
      case AppButtonVariant.tonal:
        return _buildTonalButton(buttonContent, theme);
      case AppButtonVariant.outline:
        return _buildOutlineButton(buttonContent, theme);
      case AppButtonVariant.text:
        return _buildTextButton(buttonContent, theme);
      case AppButtonVariant.icon:
        return _buildIconButton(buttonContent, theme);
      case AppButtonVariant.segmented:
        return _buildSegmentedButton(buttonContent, theme);
    }
  }

  Widget _buildFilledButton(Widget content, ThemeData theme) {
    return Material(
      elevation: _getElevation(),
      shadowColor: _getShadowColor(theme),
      surfaceTintColor: _getSurfaceTintColor(theme),
      borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      color: _getBackgroundColor(theme),
      child: content,
    );
  }

  Widget _buildTonalButton(Widget content, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: _getTonalBackgroundColor(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      ),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildOutlineButton(Widget content, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: _getBorder(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      ),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildTextButton(Widget content, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: _getStateOverlayColor(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      ),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildIconButton(Widget content, ThemeData theme) {
    final size = _getSize();
    return Container(
      width: size.minHeight,
      height: size.minHeight,
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        shape: BoxShape.circle,
      ),
      child: content,
    );
  }

  Widget _buildSegmentedButton(Widget content, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: widget.config.state == AppButtonState.selected
          ? _getSelectedBackgroundColor(theme)
          : _getBackgroundColor(theme),
        border: _getBorder(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 8.0),
      ),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildInteractiveButton(ThemeData theme, bool isRtl) {
    final size = _getSize();
    final isDanger = widget.isDanger ?? widget.config.isDanger;

    Widget button = Container(
      width: widget.width,
      height: widget.height,
      constraints: BoxConstraints(
        minWidth: widget.config.variant.isIconOnly ? size.minHeight : size.horizontalPadding * 4,
        minHeight: size.minHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.config.variant.isIconOnly ? 0 : size.horizontalPadding,
        vertical: size.verticalPadding,
      ),
      decoration: BoxDecoration(
        color: _getStateOverlayColor(theme),
      ),
      child: _buildButtonContent(theme, size, isDanger, isRtl),
    );

    if (widget.config.enableKeyboardSupport) {
      button = Focus(
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        child: button,
      );
    }

    if (widget.config.state.canInteract) {
      button = GestureDetector(
        onTap: _handleTap,
        onLongPress: widget.config.onLongPress,
        onTapDown: (_) => _handleTapDown(),
        onTapUp: (_) => _handleTapUp(),
        onTapCancel: _handleTapCancel,
        child: button,
      );

      button = MouseRegion(
        onEnter: (_) => _handleHoverStart(),
        onExit: (_) => _handleHoverEnd(),
        cursor: SystemMouseCursors.click,
        child: button,
      );
    }

    return button;
  }

  Widget _buildButtonContent(ThemeData theme, AppButtonSize size, bool isDanger, bool isRtl) {
    if (widget.config.variant.isIconOnly) {
      return widget.leading ?? Icon(
        Icons.star,
        size: size.iconSize,
        color: _getForegroundColor(theme, isDanger),
      );
    }

    final List<Widget> children = [];

    if (widget.leading != null) {
      children.add(widget.leading!);
      if (widget.label != null) {
        children.add(SizedBox(width: widget.config.spacing?.iconSpacing ?? 8.0));
      }
    }

    if (widget.label != null) {
      children.add(
        Flexible(
          child: Text(
            widget.label!,
            style: TextStyle(
              fontSize: size.fontSize,
              fontWeight: FontWeight.w500,
              color: _getForegroundColor(theme, isDanger),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    if (widget.trailing != null) {
      if (widget.label != null) {
        children.add(SizedBox(width: widget.config.spacing?.iconSpacing ?? 8.0));
      }
      children.add(widget.trailing!);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: isRtl ? children.reversed.toList() : children,
    );
  }

  Color? _getBackgroundColor(ThemeData theme) {
    final isDanger = widget.isDanger ?? widget.config.isDanger;

    if (isDanger) {
      return widget.config.colors?.dangerColor ?? theme.colorScheme.error;
    }

    if (widget.config.state == AppButtonState.disabled) {
      return widget.config.colors?.disabledColor ??
             theme.colorScheme.onSurface.withValues(alpha: 0.12);
    }

    switch (widget.config.variant) {
      case AppButtonVariant.filled:
        return widget.config.colors?.backgroundColor ??
               theme.colorScheme.primary;
      case AppButtonVariant.tonal:
        return widget.config.colors?.backgroundColor ??
               theme.colorScheme.secondaryContainer;
      case AppButtonVariant.outline:
      case AppButtonVariant.text:
        return Colors.transparent;
      case AppButtonVariant.icon:
        return widget.config.colors?.backgroundColor ??
               theme.colorScheme.surfaceContainerHighest;
      case AppButtonVariant.segmented:
        return widget.config.colors?.backgroundColor ??
               theme.colorScheme.surface;
    }
  }

  Color? _getTonalBackgroundColor(ThemeData theme) {
    final isDanger = widget.isDanger ?? widget.config.isDanger;

    if (isDanger) {
      return widget.config.colors?.dangerColor?.withValues(alpha: 0.12) ??
             theme.colorScheme.error.withValues(alpha: 0.12);
    }

    return widget.config.colors?.backgroundColor ??
           theme.colorScheme.secondaryContainer;
  }

  Color? _getSelectedBackgroundColor(ThemeData theme) {
    return widget.config.colors?.selectedColor ??
           theme.colorScheme.secondaryContainer;
  }

  Color? _getStateOverlayColor(ThemeData theme) {
    if (_isPressed && widget.config.state.canInteract) {
      return widget.config.colors?.pressedColor ??
             theme.colorScheme.primary.withValues(alpha: 0.12);
    }

    if (_isHovering && widget.config.state.canInteract) {
      return widget.config.colors?.hoverColor ??
             theme.colorScheme.primary.withValues(alpha: 0.08);
    }

    if (_isFocused && widget.config.state.canInteract) {
      return widget.config.colors?.focusColor ??
             theme.colorScheme.primary.withValues(alpha: 0.12);
    }

    return null;
  }

  Color? _getForegroundColor(ThemeData theme, bool isDanger) {
    if (isDanger) {
      return widget.config.colors?.dangerForegroundColor ??
             (widget.config.variant == AppButtonVariant.filled
               ? theme.colorScheme.onError
               : theme.colorScheme.error);
    }

    if (widget.config.state == AppButtonState.disabled) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.38);
    }

    switch (widget.config.variant) {
      case AppButtonVariant.filled:
        return widget.config.colors?.foregroundColor ??
               theme.colorScheme.onPrimary;
      case AppButtonVariant.tonal:
        return widget.config.colors?.foregroundColor ??
               theme.colorScheme.onSecondaryContainer;
      case AppButtonVariant.outline:
      case AppButtonVariant.text:
      case AppButtonVariant.segmented:
        return widget.config.colors?.foregroundColor ??
               theme.colorScheme.primary;
      case AppButtonVariant.icon:
        return widget.config.colors?.foregroundColor ??
               theme.colorScheme.onSurfaceVariant;
    }
  }

  Color? _getShadowColor(ThemeData theme) {
    return widget.config.elevation?.shadowColor ??
           widget.config.colors?.shadowColor ??
           theme.colorScheme.shadow;
  }

  Color? _getSurfaceTintColor(ThemeData theme) {
    return widget.config.elevation?.surfaceTintColor ??
           theme.colorScheme.surfaceTint;
  }

  Border? _getBorder(ThemeData theme) {
    if (widget.config.variant.hasBorder) {
      return Border.all(
        color: widget.config.colors?.borderColor ??
               theme.colorScheme.outline,
        width: widget.config.spacing?.borderWidth ?? 1.0,
      );
    }
    return null;
  }

  void _handleTap() {
    if (widget.config.behavior?.enableHapticFeedback == true) {
      HapticFeedback.lightImpact();
    }

    widget.config.onPressed?.call();
  }

  void _handleTapDown() {
    setState(() {
      _isPressed = true;
    });
    _pressAnimationController.forward();
  }

  void _handleTapUp() {
    setState(() {
      _isPressed = false;
    });
    _pressAnimationController.reverse();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _pressAnimationController.reverse();
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