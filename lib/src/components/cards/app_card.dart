import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_card_config.dart';

class AppCard extends StatefulWidget {
  final AppCardConfig config;
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double? width;
  final double? height;
  final Decoration? decoration;

  const AppCard({
    super.key,
    this.config = const AppCardConfig(),
    this.header,
    this.body,
    this.footer,
    this.padding,
    this.elevation,
    this.width,
    this.height,
    this.decoration,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard>
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
  void didUpdateWidget(AppCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case AppCardState.loading:
      case AppCardState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case AppCardState.disabled:
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
      child: Focus(
        focusNode: _focusNode,
        canRequestFocus: widget.config.enableKeyboardSupport && widget.config.state.canInteract,
        child: Semantics(
          label: widget.config.enableA11y ? 'Card' : null,
          container: widget.config.enableA11y,
          button: widget.config.enableA11y && widget.config.isInteractive,
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _stateAnimationController,
              _hoverAnimationController,
              _pressAnimationController,
            ]),
            builder: (context, child) {
              return AnimatedOpacity(
                opacity: widget.config.state.opacity,
                duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
                child: AnimatedScale(
                  scale: _getScaleValue(),
                  duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
                  child: _buildCardContent(theme, isRtl),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    return _buildCardVariant(theme, isRtl);
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Container(
      width: widget.width,
      height: widget.height ?? widget.config.spacing?.minHeight ?? 120.0,
      padding: widget.padding ?? EdgeInsets.all(widget.config.spacing?.padding ?? 16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
        border: _getBorder(theme),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cargando...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _getTextColor(theme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    return Container(
      width: widget.width,
      height: widget.height ?? widget.config.spacing?.minHeight ?? 120.0,
      padding: widget.padding ?? EdgeInsets.all(widget.config.spacing?.padding ?? 16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
        border: _getBorder(theme),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header skeleton
          Container(
            width: double.infinity,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 12),
          // Body skeleton
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardVariant(ThemeData theme, bool isRtl) {
    Widget cardContent = _buildInteractiveCard(theme, isRtl);

    switch (widget.config.variant) {
      case AppCardVariant.elevated:
        return _buildElevatedCard(cardContent, theme);
      case AppCardVariant.filled:
        return _buildFilledCard(cardContent, theme);
      case AppCardVariant.outlined:
        return _buildOutlinedCard(cardContent, theme);
    }
  }

  Widget _buildElevatedCard(Widget content, ThemeData theme) {
    return Material(
      elevation: _getElevation(),
      shadowColor: _getShadowColor(theme),
      surfaceTintColor: _getSurfaceTintColor(theme),
      borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildFilledCard(Widget content, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      ),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildOutlinedCard(Widget content, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: _getBorder(theme),
        borderRadius: BorderRadius.circular(widget.config.spacing?.borderRadius ?? 12.0),
      ),
      clipBehavior: widget.config.behavior?.clipBehavior.flutterClip ?? Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildInteractiveCard(ThemeData theme, bool isRtl) {
    Widget cardBody = _buildCardBody(theme);

    if (widget.config.isInteractive && widget.config.state.canInteract) {
      return MouseRegion(
        onEnter: (_) => _handleHoverEnter(),
        onExit: (_) => _handleHoverExit(),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _handleTap,
          onDoubleTap: _handleDoubleTap,
          onLongPress: _handleLongPress,
          onTapDown: (_) => _handleTapDown(),
          onTapUp: (_) => _handleTapUp(),
          onTapCancel: _handleTapCancel,
          child: cardBody,
        ),
      );
    }

    return cardBody;
  }

  Widget _buildCardBody(ThemeData theme) {
    final spacing = widget.config.spacing;
    final hasHeader = widget.header != null;
    final hasBody = widget.body != null;
    final hasFooter = widget.footer != null;

    return Container(
      width: widget.width,
      height: widget.height,
      constraints: BoxConstraints(
        minHeight: spacing?.minHeight ?? 48.0,
      ),
      decoration: widget.decoration ?? BoxDecoration(
        color: _getStateOverlayColor(theme),
        borderRadius: BorderRadius.circular(spacing?.borderRadius ?? 12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (hasHeader) _buildHeader(theme),
          if (hasBody) _buildBody(theme),
          if (hasFooter) _buildFooter(theme),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        widget.config.spacing?.headerPadding ?? 16.0,
        widget.config.spacing?.headerPadding ?? 16.0,
        widget.config.spacing?.headerPadding ?? 16.0,
        widget.config.spacing?.spacing ?? 8.0,
      ),
      child: DefaultTextStyle(
        style: theme.textTheme.titleMedium?.copyWith(
          color: _getHeaderTextColor(theme),
        ) ?? const TextStyle(),
        child: widget.header!,
      ),
    );
  }

  Widget _buildBody(ThemeData theme) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.config.spacing?.bodyPadding ?? 16.0,
          vertical: widget.config.spacing?.spacing ?? 8.0,
        ),
        child: DefaultTextStyle(
          style: theme.textTheme.bodyMedium?.copyWith(
            color: _getBodyTextColor(theme),
          ) ?? const TextStyle(),
          child: widget.body!,
        ),
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        widget.config.spacing?.footerPadding ?? 16.0,
        widget.config.spacing?.spacing ?? 8.0,
        widget.config.spacing?.footerPadding ?? 16.0,
        widget.config.spacing?.footerPadding ?? 16.0,
      ),
      child: DefaultTextStyle(
        style: theme.textTheme.bodySmall?.copyWith(
          color: _getFooterTextColor(theme),
        ) ?? const TextStyle(),
        child: widget.footer!,
      ),
    );
  }

  // Event handlers
  void _handleHoverEnter() {
    if (!widget.config.state.canInteract || !(widget.config.behavior?.enableHover ?? true)) return;

    setState(() {
      _isHovering = true;
    });

    _hoverAnimationController.forward();
    widget.config.onHover?.call(true);

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }
  }

  void _handleHoverExit() {
    setState(() {
      _isHovering = false;
    });

    _hoverAnimationController.reverse();
    widget.config.onHover?.call(false);
  }

  void _handleTap() {
    if (!widget.config.state.canInteract) return;

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.lightImpact();
    }

    widget.config.onTap?.call();
  }

  void _handleDoubleTap() {
    if (!widget.config.state.canInteract) return;

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.mediumImpact();
    }

    widget.config.onDoubleTap?.call();
  }

  void _handleLongPress() {
    if (!widget.config.state.canInteract) return;

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.heavyImpact();
    }

    widget.config.onLongPress?.call();
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

  // Helper methods
  double _getScaleValue() {
    double scale = _scaleAnimation.value;

    if (_isPressed && widget.config.animation?.enablePressAnimation == true) {
      scale *= 0.95;
    } else if (_isHovering && widget.config.animation?.enableHoverAnimation == true) {
      scale *= 1.02;
    }

    return scale;
  }

  double _getElevation() {
    final baseElevation = widget.elevation ??
                         widget.config.elevation?.defaultElevation ??
                         1.0;

    if (!widget.config.state.canInteract) {
      return widget.config.elevation?.disabledElevation ?? 0.0;
    }

    final stateMultiplier = widget.config.state.elevationMultiplier;
    final animationMultiplier = _elevationAnimation.value;

    return baseElevation * stateMultiplier * (1.0 + animationMultiplier);
  }

  // Color getters
  Color? _getBackgroundColor(ThemeData theme) {
    if (widget.config.state == AppCardState.disabled) {
      return widget.config.colors?.disabledColor ??
             theme.colorScheme.surface.withValues(alpha: 0.5);
    }

    if (widget.config.state == AppCardState.selected) {
      return widget.config.colors?.selectedColor ??
             theme.colorScheme.primaryContainer;
    }

    switch (widget.config.variant) {
      case AppCardVariant.elevated:
      case AppCardVariant.filled:
        return widget.config.colors?.backgroundColor ??
               theme.colorScheme.surface;
      case AppCardVariant.outlined:
        return widget.config.colors?.backgroundColor ??
               Colors.transparent;
    }
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

  Color? _getShadowColor(ThemeData theme) {
    return widget.config.elevation?.shadowColor ??
           widget.config.colors?.shadowColor ??
           theme.colorScheme.shadow;
  }

  Color? _getSurfaceTintColor(ThemeData theme) {
    return widget.config.elevation?.surfaceTintColor ??
           theme.colorScheme.surfaceTint;
  }

  Color? _getTextColor(ThemeData theme) {
    return theme.colorScheme.onSurface;
  }

  Color? _getHeaderTextColor(ThemeData theme) {
    return widget.config.colors?.headerTextColor ??
           theme.colorScheme.onSurface;
  }

  Color? _getBodyTextColor(ThemeData theme) {
    return widget.config.colors?.bodyTextColor ??
           theme.colorScheme.onSurface;
  }

  Color? _getFooterTextColor(ThemeData theme) {
    return widget.config.colors?.footerTextColor ??
           theme.colorScheme.onSurfaceVariant;
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
}