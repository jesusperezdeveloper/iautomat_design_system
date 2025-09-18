import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TooltipVariant { hover, focus, longPress }

enum AppTooltipState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

enum TooltipPosition {
  top,
  bottom,
  left,
  right,
  topStart,
  topEnd,
  bottomStart,
  bottomEnd
}

class AppTooltip extends StatefulWidget {
  final String message;
  final Widget child;
  final TooltipVariant variant;
  final AppTooltipState state;
  final Duration showDelay;
  final Duration hideDelay;
  final Duration animationDuration;
  final TooltipPosition preferredPosition;
  final bool rtlSupport;
  final bool accessibilitySupport;
  final String? accessibilityLabel;
  final bool enableHapticFeedback;
  final bool excludeFromSemantics;
  final VoidCallback? onShow;
  final VoidCallback? onHide;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? maxWidth;
  final int? maxLines;
  final TextOverflow overflow;
  final BoxShadow? boxShadow;

  const AppTooltip({
    super.key,
    required this.message,
    required this.child,
    this.variant = TooltipVariant.hover,
    this.state = AppTooltipState.defaultState,
    this.showDelay = const Duration(milliseconds: 500),
    this.hideDelay = const Duration(milliseconds: 150),
    this.animationDuration = const Duration(milliseconds: 200),
    this.preferredPosition = TooltipPosition.top,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.enableHapticFeedback = true,
    this.excludeFromSemantics = false,
    this.onShow,
    this.onHide,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.border,
    this.maxWidth,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.boxShadow,
  });

  @override
  State<AppTooltip> createState() => _AppAppTooltipState();

  /// Create a hover tooltip
  factory AppTooltip.hover({
    Key? key,
    required String message,
    Duration showDelay = const Duration(milliseconds: 300),
    TooltipPosition preferredPosition = TooltipPosition.top,
    VoidCallback? onShow,
    VoidCallback? onHide,
    required Widget child,
  }) {
    return AppTooltip(
      key: key,
      message: message,
      variant: TooltipVariant.hover,
      showDelay: showDelay,
      preferredPosition: preferredPosition,
      onShow: onShow,
      onHide: onHide,
      child: child,
    );
  }

  /// Create a focus tooltip
  factory AppTooltip.focus({
    Key? key,
    required String message,
    Duration showDelay = const Duration(milliseconds: 100),
    TooltipPosition preferredPosition = TooltipPosition.top,
    VoidCallback? onShow,
    VoidCallback? onHide,
    required Widget child,
  }) {
    return AppTooltip(
      key: key,
      message: message,
      variant: TooltipVariant.focus,
      showDelay: showDelay,
      preferredPosition: preferredPosition,
      onShow: onShow,
      onHide: onHide,
      child: child,
    );
  }

  /// Create a long-press tooltip
  factory AppTooltip.longPress({
    Key? key,
    required String message,
    Duration showDelay = const Duration(milliseconds: 750),
    TooltipPosition preferredPosition = TooltipPosition.bottom,
    VoidCallback? onShow,
    VoidCallback? onHide,
    required Widget child,
  }) {
    return AppTooltip(
      key: key,
      message: message,
      variant: TooltipVariant.longPress,
      showDelay: showDelay,
      preferredPosition: preferredPosition,
      onShow: onShow,
      onHide: onHide,
      child: child,
    );
  }

  AppTooltip copyWith({
    String? message,
    Widget? child,
    TooltipVariant? variant,
    AppTooltipState? state,
    Duration? showDelay,
    Duration? hideDelay,
    Duration? animationDuration,
    TooltipPosition? preferredPosition,
    bool? rtlSupport,
    bool? accessibilitySupport,
    String? accessibilityLabel,
    bool? enableHapticFeedback,
    bool? excludeFromSemantics,
    VoidCallback? onShow,
    VoidCallback? onHide,
    Color? backgroundColor,
    Color? textColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? elevation,
    BorderRadius? borderRadius,
    Border? border,
    double? maxWidth,
    int? maxLines,
    TextOverflow? overflow,
    BoxShadow? boxShadow,
  }) {
    return AppTooltip(
      key: key,
      message: message ?? this.message,
      variant: variant ?? this.variant,
      state: state ?? this.state,
      showDelay: showDelay ?? this.showDelay,
      hideDelay: hideDelay ?? this.hideDelay,
      animationDuration: animationDuration ?? this.animationDuration,
      preferredPosition: preferredPosition ?? this.preferredPosition,
      rtlSupport: rtlSupport ?? this.rtlSupport,
      accessibilitySupport: accessibilitySupport ?? this.accessibilitySupport,
      accessibilityLabel: accessibilityLabel ?? this.accessibilityLabel,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
      onShow: onShow ?? this.onShow,
      onHide: onHide ?? this.onHide,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      maxWidth: maxWidth ?? this.maxWidth,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      boxShadow: boxShadow ?? this.boxShadow,
      child: child ?? this.child,
    );
  }
}

class _AppAppTooltipState extends State<AppTooltip>
    with TickerProviderStateMixin {
  Timer? _showTimer;
  Timer? _hideTimer;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  OverlayEntry? _overlayEntry;
  bool _isVisible = false;
  AppTooltipState _currentState = AppTooltipState.defaultState;

  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _setupFocusListener();
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    _hideTimer?.cancel();
    _removeOverlay();
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));
  }

  void _setupFocusListener() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _handleFocusGained();
      } else {
        _handleFocusLost();
      }
    });
  }

  bool get _isDisabled => widget.state == AppTooltipState.disabled;
  bool get _isLoading => widget.state == AppTooltipState.loading;
  bool get _isSkeleton => widget.state == AppTooltipState.skeleton;

  bool get _shouldShowOnHover =>
      widget.variant == TooltipVariant.hover && !_isDisabled;
  bool get _shouldShowOnFocus =>
      widget.variant == TooltipVariant.focus && !_isDisabled;
  bool get _shouldShowOnLongPress =>
      widget.variant == TooltipVariant.longPress && !_isDisabled;

  @override
  Widget build(BuildContext context) {
    Widget child = CompositedTransformTarget(
      link: _layerLink,
      child: _buildChildWrapper(),
    );

    if (widget.accessibilitySupport && !widget.excludeFromSemantics) {
      child = Semantics(
        label: widget.accessibilityLabel ?? widget.message,
        tooltip: widget.message,
        child: child,
      );
    }

    return child;
  }

  Widget _buildChildWrapper() {
    Widget wrappedChild = widget.child;

    // Handle different states
    if (_isSkeleton) {
      wrappedChild = _buildSkeletonChild();
    } else if (_isLoading) {
      wrappedChild = _buildLoadingChild();
    }

    // Apply state-specific styling
    wrappedChild = _applyStateEffects(wrappedChild);

    // Apply focus wrapper if needed
    if (_shouldShowOnFocus) {
      wrappedChild = Focus(
        focusNode: _focusNode,
        child: wrappedChild,
      );
    }

    // Apply gesture detection based on variant and platform
    return _wrapWithGestureDetection(wrappedChild);
  }

  Widget _applyStateEffects(Widget child) {
    switch (_currentState) {
      case AppTooltipState.hover:
        return Transform.scale(
          scale: 1.02,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            child: child,
          ),
        );
      case AppTooltipState.pressed:
        return Transform.scale(
          scale: 0.98,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            child: child,
          ),
        );
      case AppTooltipState.focus:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
              width: 2,
            ),
          ),
          child: child,
        );
      case AppTooltipState.disabled:
        return Opacity(
          opacity: 0.5,
          child: child,
        );
      case AppTooltipState.selected:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          ),
          child: child,
        );
      case AppTooltipState.defaultState:
      case AppTooltipState.loading:
      case AppTooltipState.skeleton:
        return child;
    }
  }

  Widget _wrapWithGestureDetection(Widget child) {
    final isDesktop = kIsWeb ||
        (!kIsWeb &&
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux));
    final isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    if (_shouldShowOnHover && (isDesktop || kIsWeb)) {
      child = MouseRegion(
        onEnter: _handleMouseEnter,
        onExit: _handleMouseExit,
        child: child,
      );
    }

    if (_shouldShowOnLongPress && isMobile) {
      child = GestureDetector(
        onLongPressStart: _handleLongPressStart,
        onLongPressEnd: _handleLongPressEnd,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: child,
      );
    }

    // For focus variant, we handle it in the Focus widget above
    return child;
  }

  Widget _buildSkeletonChild() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: widget.child,
    );
  }

  Widget _buildLoadingChild() {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: widget.child,
        ),
        Positioned.fill(
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Event Handlers
  void _handleMouseEnter(PointerEnterEvent event) {
    if (!_isDisabled) {
      setState(() {
        _currentState = AppTooltipState.hover;
      });
      _showTooltip();
    }
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _currentState = AppTooltipState.defaultState;
    });
    _hideTooltip();
  }

  void _handleFocusGained() {
    if (!_isDisabled) {
      setState(() {
        _currentState = AppTooltipState.focus;
      });
      if (_shouldShowOnFocus) {
        _showTooltip();
      }
    }
  }

  void _handleFocusLost() {
    setState(() {
      _currentState = AppTooltipState.defaultState;
    });
    _hideTooltip();
  }

  void _handleLongPressStart(LongPressStartDetails details) {
    if (!_isDisabled) {
      setState(() {
        _currentState = AppTooltipState.pressed;
      });
      _showTooltip();
      _triggerHapticFeedback();
    }
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _currentState = AppTooltipState.defaultState;
    });
    _hideTooltip();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _currentState = AppTooltipState.pressed;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _currentState = AppTooltipState.defaultState;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _currentState = AppTooltipState.defaultState;
    });
  }

  void _triggerHapticFeedback() {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  // Tooltip show/hide logic
  void _showTooltip() {
    _hideTimer?.cancel();

    if (_isVisible) return;

    _showTimer?.cancel();
    _showTimer = Timer(widget.showDelay, () {
      if (mounted && !_isVisible) {
        _createOverlayEntry();
        widget.onShow?.call();
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  void _hideTooltip() {
    _showTimer?.cancel();

    if (!_isVisible) return;

    _hideTimer?.cancel();
    _hideTimer = Timer(widget.hideDelay, () {
      if (mounted && _isVisible) {
        _removeOverlay();
        widget.onHide?.call();
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  void _createOverlayEntry() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => _TooltipOverlay(
        layerLink: _layerLink,
        message: widget.message,
        preferredPosition: widget.preferredPosition,
        fadeAnimation: _fadeAnimation,
        scaleAnimation: _scaleAnimation,
        backgroundColor: widget.backgroundColor,
        textColor: widget.textColor,
        textStyle: widget.textStyle,
        padding: widget.padding,
        margin: widget.margin,
        elevation: widget.elevation,
        borderRadius: widget.borderRadius,
        border: widget.border,
        maxWidth: widget.maxWidth,
        maxLines: widget.maxLines,
        overflow: widget.overflow,
        boxShadow: widget.boxShadow,
        rtlSupport: widget.rtlSupport,
      ),
    );

    overlay.insert(_overlayEntry!);
    _animationController.forward();
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      if (_animationController.isAnimating || !mounted) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      } else {
        _animationController.reverse().then((_) {
          _overlayEntry?.remove();
          _overlayEntry = null;
        });
      }
    }
  }
}

class _TooltipOverlay extends StatelessWidget {
  final LayerLink layerLink;
  final String message;
  final TooltipPosition preferredPosition;
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? maxWidth;
  final int? maxLines;
  final TextOverflow overflow;
  final BoxShadow? boxShadow;
  final bool rtlSupport;

  const _TooltipOverlay({
    required this.layerLink,
    required this.message,
    required this.preferredPosition,
    required this.fadeAnimation,
    required this.scaleAnimation,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.border,
    this.maxWidth,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.boxShadow,
    this.rtlSupport = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Positioned.fill(
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        offset: _calculateOffset(),
        child: AnimatedBuilder(
          animation: Listenable.merge([fadeAnimation, scaleAnimation]),
          builder: (context, child) {
            return Opacity(
              opacity: fadeAnimation.value,
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: _buildTooltipContent(theme, colorScheme),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTooltipContent(ThemeData theme, ColorScheme colorScheme) {
    final effectiveBackgroundColor =
        backgroundColor ?? colorScheme.inverseSurface;
    final effectiveTextColor = textColor ?? colorScheme.onInverseSurface;
    final effectivePadding =
        padding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(8.0);
    final effectiveElevation = elevation ?? 4.0;
    final effectiveTextStyle = textStyle ??
        theme.textTheme.bodySmall?.copyWith(
          color: effectiveTextColor,
          fontWeight: FontWeight.w500,
        );

    Widget tooltip = Material(
      color: Colors.transparent,
      child: Container(
        constraints: maxWidth != null
            ? BoxConstraints(maxWidth: maxWidth!)
            : const BoxConstraints(maxWidth: 300),
        margin: margin,
        padding: effectivePadding,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: effectiveBorderRadius,
          border: border,
          boxShadow: boxShadow != null
              ? [boxShadow!]
              : [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.2),
                    blurRadius: effectiveElevation,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Text(
          message,
          style: effectiveTextStyle,
          maxLines: maxLines,
          overflow: overflow,
          textDirection: rtlSupport ? TextDirection.ltr : null,
        ),
      ),
    );

    // Add arrow/pointer based on position
    return _addArrow(tooltip, theme.colorScheme);
  }

  Widget _addArrow(Widget tooltip, ColorScheme colorScheme) {
    const arrowSize = 8.0;
    final arrowColor = backgroundColor ?? colorScheme.inverseSurface;

    Widget arrow = CustomPaint(
      size: const Size(arrowSize * 2, arrowSize),
      painter: _ArrowPainter(
        color: arrowColor,
        position: preferredPosition,
      ),
    );

    switch (preferredPosition) {
      case TooltipPosition.top:
      case TooltipPosition.topStart:
      case TooltipPosition.topEnd:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [tooltip, arrow],
        );
      case TooltipPosition.bottom:
      case TooltipPosition.bottomStart:
      case TooltipPosition.bottomEnd:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [arrow, tooltip],
        );
      case TooltipPosition.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [tooltip, arrow],
        );
      case TooltipPosition.right:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [arrow, tooltip],
        );
    }
  }

  Offset _calculateOffset() {
    const spacing = 12.0;
    const arrowHeight = 8.0;

    switch (preferredPosition) {
      case TooltipPosition.top:
        return const Offset(0, -(spacing + arrowHeight));
      case TooltipPosition.bottom:
        return const Offset(0, spacing + arrowHeight);
      case TooltipPosition.left:
        return const Offset(-(spacing + arrowHeight), 0);
      case TooltipPosition.right:
        return const Offset(spacing + arrowHeight, 0);
      case TooltipPosition.topStart:
        return const Offset(-50, -(spacing + arrowHeight));
      case TooltipPosition.topEnd:
        return const Offset(50, -(spacing + arrowHeight));
      case TooltipPosition.bottomStart:
        return const Offset(-50, spacing + arrowHeight);
      case TooltipPosition.bottomEnd:
        return const Offset(50, spacing + arrowHeight);
    }
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;
  final TooltipPosition position;

  const _ArrowPainter({
    required this.color,
    required this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    switch (position) {
      case TooltipPosition.top:
      case TooltipPosition.topStart:
      case TooltipPosition.topEnd:
        path.moveTo(size.width / 2, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width, 0);
        path.close();
        break;
      case TooltipPosition.bottom:
      case TooltipPosition.bottomStart:
      case TooltipPosition.bottomEnd:
        path.moveTo(size.width / 2, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.close();
        break;
      case TooltipPosition.left:
        path.moveTo(size.width, size.height / 2);
        path.lineTo(0, 0);
        path.lineTo(0, size.height);
        path.close();
        break;
      case TooltipPosition.right:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        path.close();
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
