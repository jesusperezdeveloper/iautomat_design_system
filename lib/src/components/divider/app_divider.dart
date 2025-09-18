import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_divider_config.dart';
import 'app_divider_platform_adapter.dart';
import 'app_divider_a11y_helper.dart';

class AppDivider extends StatefulWidget {
  final AppDividerConfig config;
  final AppDividerCallback? onTap;
  final AppDividerStateCallback? onStateChanged;
  final bool enabled;
  final bool interactive;
  final Widget? child;
  final String? semanticLabel;
  final bool excludeSemantics;

  const AppDivider({
    super.key,
    this.config = const AppDividerConfig(),
    this.onTap,
    this.onStateChanged,
    this.enabled = true,
    this.interactive = false,
    this.child,
    this.semanticLabel,
    this.excludeSemantics = false,
  });

  @override
  State<AppDivider> createState() => _AppDividerState();
}

class _AppDividerState extends State<AppDivider> with TickerProviderStateMixin {
  late AppDividerPlatformAdapter _platformAdapter;
  late AppDividerA11yHelper _a11yHelper;
  late AnimationController _animationController;
  late AnimationController _skeletonAnimationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _skeletonAnimation;

  AppDividerState _currentState = AppDividerState.defaultState;
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _initializePlatformAdapter();
    _initializeA11y();
    _updateStateFromConfig();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeAnimations();
  }

  @override
  void didUpdateWidget(AppDivider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config != widget.config) {
      _updateStateFromConfig();
      _updateAnimations();
    }

    if (oldWidget.enabled != widget.enabled) {
      _updateEnabledState();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _skeletonAnimationController.dispose();
    super.dispose();
  }

  void _initializePlatformAdapter() {
    _platformAdapter = AppDividerPlatformAdapter();
  }

  void _initializeA11y() {
    _a11yHelper = AppDividerA11yHelper(
      config: widget.config,
      onAnnouncementRequested: _announceToScreenReader,
    );
  }

  void _initializeAnimations() {
    final animationConfig =
        widget.config.animations ?? const AppDividerAnimations();

    _animationController = AnimationController(
      duration: animationConfig.stateDuration,
      vsync: this,
    );

    _skeletonAnimationController = AnimationController(
      duration: animationConfig.skeletonDuration,
      vsync: this,
    );

    _updateAnimations();
  }

  void _updateAnimations() {
    final animationConfig =
        widget.config.animations ?? const AppDividerAnimations();

    _colorAnimation =
        ColorTween(
          begin: _getStateColor(AppDividerState.defaultState),
          end: _getStateColor(_currentState),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: animationConfig.stateCurve,
          ),
        );

    _skeletonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _skeletonAnimationController,
        curve: animationConfig.skeletonCurve,
      ),
    );

    if (_currentState == AppDividerState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    } else {
      _skeletonAnimationController.stop();
    }
  }

  void _updateStateFromConfig() {
    _updateState(widget.config.state);
  }

  void _updateEnabledState() {
    if (!widget.enabled) {
      _updateState(AppDividerState.disabled);
    } else {
      _updateState(widget.config.state);
    }
  }

  void _updateState(AppDividerState newState) {
    if (_currentState != newState) {
      final previousState = _currentState;
      setState(() {
        _currentState = newState;
      });

      _animateToCurrentState();
      widget.onStateChanged?.call(newState);
      _a11yHelper.announceStateChange(previousState, newState);

      final behavior = widget.config.behavior;
      if (behavior?.enableHapticFeedback == true) {
        _triggerHapticFeedback();
      }
    }
  }

  void _animateToCurrentState() {
    final animationConfig = widget.config.animations;
    if (animationConfig?.enabled != true) return;

    _animationController.forward();

    if (_currentState == AppDividerState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    } else {
      _skeletonAnimationController.stop();
    }
  }

  Color? _getStateColor(AppDividerState state) {
    final colors = widget.config.colors;

    // Manejo seguro del theme - usar valores por defecto si no hay contexto
    ThemeData? theme;
    try {
      theme = mounted ? Theme.of(context) : null;
    } catch (e) {
      theme = null;
    }

    switch (state) {
      case AppDividerState.defaultState:
        return colors?.defaultColor ??
            widget.config.color ??
            theme?.dividerColor ??
            Colors.grey;
      case AppDividerState.hover:
        return colors?.hoverColor ??
            theme?.colorScheme.primary.withValues(alpha: 0.1) ??
            Colors.blue.withValues(alpha: 0.1);
      case AppDividerState.pressed:
        return colors?.pressedColor ??
            theme?.colorScheme.primary.withValues(alpha: 0.2) ??
            Colors.blue.withValues(alpha: 0.2);
      case AppDividerState.focus:
        return colors?.focusColor ?? theme?.colorScheme.primary ?? Colors.blue;
      case AppDividerState.selected:
        return colors?.selectedColor ??
            theme?.colorScheme.primary ??
            Colors.blue;
      case AppDividerState.disabled:
        return colors?.disabledColor ??
            theme?.disabledColor ??
            Colors.grey.withValues(alpha: 0.38);
      case AppDividerState.loading:
        return colors?.loadingColor ??
            theme?.colorScheme.primary.withValues(alpha: 0.6) ??
            Colors.blue.withValues(alpha: 0.6);
      case AppDividerState.skeleton:
        return colors?.skeletonBaseColor ??
            theme?.colorScheme.surfaceContainerHighest ??
            Colors.grey.shade200;
    }
  }

  double _getEffectiveThickness() {
    final spacing = widget.config.spacing ?? const AppDividerSpacing();
    return widget.config.thickness ?? spacing.defaultThickness;
  }

  double _getEffectiveHeight() {
    final spacing = widget.config.spacing ?? const AppDividerSpacing();
    return widget.config.height ?? spacing.defaultHeight;
  }

  double _getEffectiveWidth() {
    final spacing = widget.config.spacing ?? const AppDividerSpacing();
    return widget.config.width ?? spacing.defaultWidth;
  }

  double? _getEffectiveIndent() {
    if (widget.config.variant != AppDividerVariant.inset) return null;
    final spacing = widget.config.spacing ?? const AppDividerSpacing();
    return widget.config.indent ?? spacing.defaultIndent;
  }

  double? _getEffectiveEndIndent() {
    if (widget.config.variant != AppDividerVariant.inset) return null;
    final spacing = widget.config.spacing ?? const AppDividerSpacing();
    return widget.config.endIndent ?? spacing.defaultEndIndent;
  }

  void _triggerHapticFeedback() {
    if (_platformAdapter.supportsHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _announceToScreenReader(String message) {
    if (_platformAdapter.supportsScreenReaderAnnouncements) {
      // En un proyecto real, esto usaría SemanticsService.announce
      debugPrint('Screen reader: $message');
    }
  }

  void _handleTap() {
    if (!widget.enabled || !_currentState.isInteractive) return;

    _updateState(AppDividerState.pressed);

    // Revertir al estado anterior después de un breve momento
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        _updateState(
          _isHovered ? AppDividerState.hover : AppDividerState.defaultState,
        );
      }
    });

    widget.onTap?.call();
  }

  void _handleHover(bool isHovering) {
    if (!widget.enabled || !_currentState.isInteractive) return;

    final behavior = widget.config.behavior;
    if (behavior?.enableHoverEffects != true) return;

    setState(() {
      _isHovered = isHovering;
    });

    if (isHovering) {
      _updateState(AppDividerState.hover);
    } else if (!_isFocused) {
      _updateState(AppDividerState.defaultState);
    }
  }

  void _handleFocusChange(bool hasFocus) {
    if (!widget.enabled || !_currentState.isInteractive) return;

    final behavior = widget.config.behavior;
    if (behavior?.showFocusIndicator != true) return;

    setState(() {
      _isFocused = hasFocus;
    });

    if (hasFocus) {
      _updateState(AppDividerState.focus);
    } else if (!_isHovered) {
      _updateState(AppDividerState.defaultState);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled && widget.config.state != AppDividerState.disabled) {
      return const SizedBox.shrink();
    }

    return _buildDividerWidget();
  }

  Widget _buildDividerWidget() {
    final isInteractive = widget.interactive && _currentState.isInteractive;

    Widget dividerWidget = _buildDividerContent();

    if (isInteractive) {
      dividerWidget = _buildInteractiveDivider(dividerWidget);
    }

    return _buildSemanticWrapper(dividerWidget);
  }

  Widget _buildDividerContent() {
    if (_currentState.isLoading) {
      return _buildLoadingDivider();
    }

    if (_currentState == AppDividerState.skeleton) {
      return _buildSkeletonDivider();
    }

    return _buildStandardDivider();
  }

  Widget _buildStandardDivider() {
    final isHorizontal = widget.config.orientation.isHorizontal;

    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        if (isHorizontal) {
          return Divider(
            thickness: _getEffectiveThickness(),
            height: _getEffectiveHeight(),
            color: _colorAnimation.value,
            indent: _getEffectiveIndent(),
            endIndent: _getEffectiveEndIndent(),
          );
        } else {
          return VerticalDivider(
            thickness: _getEffectiveThickness(),
            width: _getEffectiveWidth(),
            color: _colorAnimation.value,
            indent: _getEffectiveIndent(),
            endIndent: _getEffectiveEndIndent(),
          );
        }
      },
    );
  }

  Widget _buildLoadingDivider() {
    final isHorizontal = widget.config.orientation.isHorizontal;
    final color = _getStateColor(AppDividerState.loading);

    return SizedBox(
      height: isHorizontal ? _getEffectiveHeight() : null,
      width: isHorizontal ? null : _getEffectiveWidth(),
      child: LinearProgressIndicator(
        backgroundColor: color?.withValues(alpha: 0.2),
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.grey),
      ),
    );
  }

  Widget _buildSkeletonDivider() {
    final isHorizontal = widget.config.orientation.isHorizontal;
    final colors = widget.config.colors;

    ThemeData? theme;
    try {
      theme = mounted ? Theme.of(context) : null;
    } catch (e) {
      theme = null;
    }

    final baseColor =
        colors?.skeletonBaseColor ??
        theme?.colorScheme.surfaceContainerHighest ??
        Colors.grey.shade200;
    final highlightColor =
        colors?.skeletonHighlightColor ??
        theme?.colorScheme.surface ??
        Colors.white;

    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        final animationValue = _skeletonAnimation.value;
        final shimmerColor = Color.lerp(
          baseColor,
          highlightColor,
          animationValue,
        );

        return Container(
          height: isHorizontal
              ? _getEffectiveThickness()
              : _getEffectiveHeight(),
          width: isHorizontal ? double.infinity : _getEffectiveThickness(),
          margin: EdgeInsets.only(
            left: _getEffectiveIndent() ?? 0,
            right: _getEffectiveEndIndent() ?? 0,
          ),
          decoration: BoxDecoration(
            color: shimmerColor,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      },
    );
  }

  Widget _buildInteractiveDivider(Widget dividerWidget) {
    final spacing = widget.config.spacing ?? const AppDividerSpacing();
    final accessibility =
        widget.config.accessibility ?? const AppDividerAccessibilityConfig();

    return GestureDetector(
      onTap: _handleTap,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: Focus(
          onFocusChange: _handleFocusChange,
          canRequestFocus: accessibility.focusable,
          child: Container(
            constraints: BoxConstraints(
              minHeight: spacing.minInteractiveSize,
              minWidth: spacing.minInteractiveSize,
            ),
            padding: spacing.interactivePadding,
            child: dividerWidget,
          ),
        ),
      ),
    );
  }

  Widget _buildSemanticWrapper(Widget child) {
    final accessibility =
        widget.config.accessibility ?? const AppDividerAccessibilityConfig();

    if (!accessibility.enabled || widget.excludeSemantics) {
      return child;
    }

    String? semanticLabel = widget.semanticLabel ?? accessibility.semanticLabel;

    if (_currentState == AppDividerState.loading) {
      semanticLabel = accessibility.loadingLabel;
    } else if (_currentState == AppDividerState.disabled) {
      semanticLabel = accessibility.disabledLabel;
    }

    return Semantics(
      label: semanticLabel,
      hint: accessibility.semanticDescription,
      button: widget.interactive && _currentState.isInteractive,
      focusable: accessibility.focusable,
      excludeSemantics: accessibility.excludeSemantics,
      child: child,
    );
  }
}
