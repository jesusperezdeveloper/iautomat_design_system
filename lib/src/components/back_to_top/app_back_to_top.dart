import 'dart:async';
import 'package:flutter/material.dart';

import 'app_back_to_top_config.dart';
import 'app_back_to_top_platform_adapter.dart';
import 'app_back_to_top_a11y_helper.dart';

class DSBackToTop extends StatefulWidget {
  final ScrollController? scrollController;
  final DSBackToTopConfig? config;
  final bool interactive;
  final VoidCallback? onPressed;
  final ValueChanged<DSBackToTopState>? onStateChanged;
  final IconData? icon;
  final Widget? child;
  final bool visible;

  const DSBackToTop({
    super.key,
    this.scrollController,
    this.config,
    this.interactive = true,
    this.onPressed,
    this.onStateChanged,
    this.icon,
    this.child,
    this.visible = true,
  });

  const DSBackToTop.web({
    super.key,
    this.scrollController,
    this.config,
    this.interactive = true,
    this.onPressed,
    this.onStateChanged,
    this.icon,
    this.child,
    this.visible = true,
  });

  @override
  State<DSBackToTop> createState() => _DSBackToTopState();
}

class _DSBackToTopState extends State<DSBackToTop>
    with TickerProviderStateMixin {
  late final DSBackToTopPlatformAdapter _platformAdapter;
  late final DSBackToTopA11yHelper _a11yHelper;
  late DSBackToTopConfig _effectiveConfig;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  ScrollController? _scrollController;
  StreamSubscription<double>? _scrollSubscription;
  Timer? _autoHideTimer;

  DSBackToTopState _currentState = DSBackToTopState.defaultState;
  bool _isVisible = false;
  bool _isHovered = false;
  double _lastScrollPosition = 0.0;
  bool _isScrollingUp = false;

  @override
  void initState() {
    super.initState();
    _platformAdapter = DSBackToTopPlatformAdapter();
    _a11yHelper = DSBackToTopA11yHelper();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeConfig();
    _initializeAnimations();
    _initializeScrollController();
  }

  void _initializeConfig() {
    final baseConfig = _platformAdapter.isWeb
        ? DSBackToTopDefaults.webOptimized
        : DSBackToTopDefaults.mobileOptimized;

    _effectiveConfig = widget.config != null
        ? baseConfig.copyWith(
            variant: widget.config!.variant,
            state: widget.config!.state,
            colors: widget.config!.colors ?? baseConfig.colors,
            spacing: widget.config!.spacing ?? baseConfig.spacing,
            typography: widget.config!.typography ?? baseConfig.typography,
            animations: widget.config!.animations ?? baseConfig.animations,
            accessibility: widget.config!.accessibility ?? baseConfig.accessibility,
            behavior: widget.config!.behavior ?? baseConfig.behavior,
          )
        : baseConfig;

    _effectiveConfig = _effectiveConfig.copyWith(
      colors: _effectiveConfig.colors ?? DSBackToTopDefaults.colors,
      spacing: _effectiveConfig.spacing ?? DSBackToTopDefaults.spacing,
      typography: _effectiveConfig.typography ?? DSBackToTopDefaults.typography,
      animations: _effectiveConfig.animations ?? DSBackToTopDefaults.animations,
      accessibility: _effectiveConfig.accessibility ?? DSBackToTopDefaults.accessibility,
      behavior: _effectiveConfig.behavior ?? DSBackToTopDefaults.behavior,
    );

    // Apply platform-specific adjustments
    _effectiveConfig = _platformAdapter.adjustForAccessibility(_effectiveConfig, context);
  }

  void _initializeAnimations() {
    final animations = _effectiveConfig.animations!;

    _fadeController = AnimationController(
      duration: animations.fadeInDuration,
      reverseDuration: animations.fadeOutDuration,
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: animations.duration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: animations.curve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: animations.curve,
    ));

    if (animations.enabled) {
      _scaleController.forward();
    }
  }

  void _initializeScrollController() {
    _scrollController = widget.scrollController;

    if (_scrollController != null) {
      _scrollController!.addListener(_onScroll);
    }
  }

  @override
  void didUpdateWidget(DSBackToTop oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.scrollController != widget.scrollController) {
      _scrollController?.removeListener(_onScroll);
      _initializeScrollController();
    }

    if (oldWidget.config != widget.config) {
      _initializeConfig();
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _scrollController?.removeListener(_onScroll);
    _scrollSubscription?.cancel();
    _autoHideTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController == null) return;

    final behavior = _effectiveConfig.behavior!;
    final currentPosition = _scrollController!.offset;
    final direction = currentPosition - _lastScrollPosition;

    _isScrollingUp = direction < 0;
    _lastScrollPosition = currentPosition;

    // Determine if button should be visible
    bool shouldShow = false;

    if (currentPosition >= behavior.showAfterPixels) {
      if (behavior.showOnScrollUp && _isScrollingUp) {
        shouldShow = true;
      } else if (!behavior.hideOnScrollDown || _isScrollingUp) {
        shouldShow = true;
      }
    }

    if (behavior.hideAfterPixels > 0 && currentPosition <= behavior.hideAfterPixels) {
      shouldShow = false;
    }

    _updateVisibility(shouldShow);

    // Handle auto-hide timer
    if (behavior.autoHide && shouldShow) {
      _resetAutoHideTimer();
    }
  }

  void _updateVisibility(bool visible) {
    if (_isVisible != visible) {
      setState(() {
        _isVisible = visible;
      });

      if (visible) {
        _fadeController.forward();
        _a11yHelper.announceButtonVisible();
      } else {
        _fadeController.reverse();
        _a11yHelper.announceButtonHidden();
      }
    }
  }

  void _resetAutoHideTimer() {
    _autoHideTimer?.cancel();
    final behavior = _effectiveConfig.behavior!;

    _autoHideTimer = Timer(behavior.autoHideDelay, () {
      if (mounted) {
        _updateVisibility(false);
      }
    });
  }

  void _handleStateChange(DSBackToTopState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });
      widget.onStateChanged?.call(newState);
      _a11yHelper.announceStateChange(newState);
    }
  }

  Future<void> _handlePressed() async {
    if (!widget.interactive || _currentState == DSBackToTopState.disabled) return;

    _handleStateChange(DSBackToTopState.pressed);

    final behavior = _effectiveConfig.behavior!;
    final animations = _effectiveConfig.animations!;

    // Trigger haptic feedback
    if (behavior.hapticFeedback) {
      await _platformAdapter.triggerHapticFeedback();
    }

    // Scroll to top
    if (_scrollController != null) {
      _handleStateChange(DSBackToTopState.loading);

      try {
        if (behavior.smoothScrolling) {
          await _scrollController!.animateTo(
            0.0,
            duration: animations.scrollDuration,
            curve: animations.scrollCurve,
          );
        } else {
          _scrollController!.jumpTo(0.0);
        }

        _a11yHelper.announceScrollComplete();
      } catch (e) {
        _a11yHelper.announceScrollError(e.toString());
      } finally {
        if (mounted) {
          _handleStateChange(_isHovered
            ? DSBackToTopState.hover
            : DSBackToTopState.defaultState);
        }
      }
    }

    // Call custom callback
    widget.onPressed?.call();

    // Reset to default state after brief delay
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _handleStateChange(_isHovered
          ? DSBackToTopState.hover
          : DSBackToTopState.defaultState);
      }
    });
  }

  void _handleHoverEnter() {
    if (!widget.interactive) return;

    setState(() {
      _isHovered = true;
    });
    _handleStateChange(DSBackToTopState.hover);
  }

  void _handleHoverExit() {
    if (!widget.interactive) return;

    setState(() {
      _isHovered = false;
    });
    _handleStateChange(DSBackToTopState.defaultState);
  }

  void _handleFocusChange(bool hasFocus) {
    if (!widget.interactive) return;

    _handleStateChange(hasFocus
      ? DSBackToTopState.focus
      : DSBackToTopState.defaultState);
  }

  Color _getBackgroundColor() {
    final colors = _effectiveConfig.colors!;
    final theme = Theme.of(context);

    Color baseColor = colors.backgroundColor ?? theme.colorScheme.primary;

    switch (_currentState) {
      case DSBackToTopState.hover:
        return colors.hoverColor ?? Color.alphaBlend(
          theme.colorScheme.onPrimary.withValues(alpha: colors.hoverOpacity),
          baseColor,
        );
      case DSBackToTopState.pressed:
        return colors.pressedColor ?? Color.alphaBlend(
          theme.colorScheme.onPrimary.withValues(alpha: colors.pressedOpacity),
          baseColor,
        );
      case DSBackToTopState.focus:
        return colors.focusColor ?? Color.alphaBlend(
          theme.colorScheme.secondary.withValues(alpha: 0.12),
          baseColor,
        );
      case DSBackToTopState.selected:
        return Color.alphaBlend(
          theme.colorScheme.secondary.withValues(alpha: 0.16),
          baseColor,
        );
      case DSBackToTopState.disabled:
        return colors.disabledColor ?? baseColor.withValues(alpha: colors.disabledOpacity);
      case DSBackToTopState.loading:
        return Color.alphaBlend(
          theme.colorScheme.onPrimary.withValues(alpha: 0.08),
          baseColor,
        );
      default:
        return baseColor;
    }
  }

  Color _getForegroundColor() {
    final colors = _effectiveConfig.colors!;
    final theme = Theme.of(context);

    switch (_currentState) {
      case DSBackToTopState.disabled:
        return (colors.foregroundColor ?? theme.colorScheme.onPrimary)
            .withValues(alpha: colors.disabledOpacity);
      default:
        return colors.foregroundColor ?? theme.colorScheme.onPrimary;
    }
  }

  Widget _buildIcon() {
    final spacing = _effectiveConfig.spacing!;
    final iconData = widget.icon ?? DSBackToTopDefaults.getDefaultIcon();

    if (_currentState == DSBackToTopState.loading) {
      return SizedBox(
        width: spacing.iconSize,
        height: spacing.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getForegroundColor()),
        ),
      );
    }

    return Icon(
      iconData,
      size: spacing.iconSize,
      color: _getForegroundColor(),
    );
  }

  Widget _buildButton() {
    final spacing = _effectiveConfig.spacing!;
    final behavior = _effectiveConfig.behavior!;
    final accessibility = _effectiveConfig.accessibility!;

    Widget button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handlePressed,
        onHover: (hovered) {
          if (hovered) {
            _handleHoverEnter();
          } else {
            _handleHoverExit();
          }
        },
        onFocusChange: _handleFocusChange,
        borderRadius: BorderRadius.circular(spacing.borderRadius),
        child: Container(
          width: spacing.size,
          height: spacing.size,
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(spacing.borderRadius),
            border: _effectiveConfig.colors?.borderColor != null
                ? Border.all(
                    color: _effectiveConfig.colors!.borderColor!,
                    width: 1,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: _effectiveConfig.colors?.shadowColor ??
                    Theme.of(context).shadowColor.withValues(alpha: 0.3),
                blurRadius: spacing.elevation,
                offset: Offset(0, spacing.elevation / 2),
              ),
            ],
          ),
          child: widget.child ?? _buildIcon(),
        ),
      ),
    );

    // Add tooltip if enabled
    if (behavior.showTooltip && accessibility.label.isNotEmpty) {
      button = Tooltip(
        message: accessibility.label,
        child: button,
      );
    }

    // Apply padding
    if (spacing.padding != EdgeInsets.zero) {
      button = Padding(
        padding: spacing.padding,
        child: button,
      );
    }

    return button;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible || _scrollController == null) {
      return const SizedBox.shrink();
    }

    final spacing = _effectiveConfig.spacing!;
    final animations = _effectiveConfig.animations!;
    final accessibility = _effectiveConfig.accessibility!;

    Widget backToTopWidget = _buildButton();

    // Apply scale animation
    if (animations.enabled && animations.scaleEnabled) {
      backToTopWidget = ScaleTransition(
        scale: _scaleAnimation,
        child: backToTopWidget,
      );
    }

    // Apply fade animation
    if (animations.enabled && animations.fadeEnabled) {
      backToTopWidget = FadeTransition(
        opacity: _fadeAnimation,
        child: backToTopWidget,
      );
    }

    // Apply accessibility
    if (accessibility.enabled) {
      backToTopWidget = _a11yHelper.wrapWithSemantics(
        backToTopWidget,
        _effectiveConfig,
        _handlePressed,
      );
    }

    // Position the button
    return Positioned.fill(
      child: Align(
        alignment: DSBackToTopDefaults.getAlignmentForPosition(spacing.position),
        child: Container(
          margin: spacing.margin,
          child: backToTopWidget,
        ),
      ),
    );
  }
}

class DSBackToTopOverlay extends StatelessWidget {
  final Widget child;
  final ScrollController? scrollController;
  final DSBackToTopConfig? config;
  final VoidCallback? onPressed;
  final ValueChanged<DSBackToTopState>? onStateChanged;

  const DSBackToTopOverlay({
    super.key,
    required this.child,
    this.scrollController,
    this.config,
    this.onPressed,
    this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        DSBackToTop(
          scrollController: scrollController,
          config: config,
          onPressed: onPressed,
          onStateChanged: onStateChanged,
        ),
      ],
    );
  }
}

class DSBackToTopProvider extends InheritedWidget {
  final ScrollController scrollController;
  final DSBackToTopConfig? config;

  const DSBackToTopProvider({
    super.key,
    required this.scrollController,
    this.config,
    required super.child,
  });

  static DSBackToTopProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DSBackToTopProvider>();
  }

  @override
  bool updateShouldNotify(DSBackToTopProvider oldWidget) {
    return scrollController != oldWidget.scrollController ||
           config != oldWidget.config;
  }
}