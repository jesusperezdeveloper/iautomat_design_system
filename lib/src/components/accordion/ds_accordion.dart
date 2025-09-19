import 'package:flutter/material.dart';

import 'ds_accordion_config.dart';
import 'ds_accordion_platform_adapter.dart';
import 'ds_accordion_a11y_helper.dart';

class DSAccordion extends StatefulWidget {
  final List<DSAccordionItem> items;
  final Set<String> expandedKeys;
  final ValueChanged<Set<String>>? onChanged;
  final DSAccordionConfig? config;
  final bool interactive;
  final VoidCallback? onTap;
  final ValueChanged<DSAccordionState>? onStateChanged;

  const DSAccordion({
    super.key,
    required this.items,
    this.expandedKeys = const {},
    this.onChanged,
    this.config,
    this.interactive = true,
    this.onTap,
    this.onStateChanged,
  });

  @override
  State<DSAccordion> createState() => _DSAccordionState();
}

class _DSAccordionState extends State<DSAccordion>
    with TickerProviderStateMixin {
  DSAccordionConfig? _effectiveConfig;
  late DSAccordionPlatformAdapter _platformAdapter;
  late DSAccordionA11yHelper _a11yHelper;
  late Set<String> _expandedKeys;
  DSAccordionState _currentState = DSAccordionState.defaultState;
  final Map<String, AnimationController> _animationControllers = {};
  final Map<String, Animation<double>> _animations = {};
  final Map<String, FocusNode> _focusNodes = {};

  @override
  void initState() {
    super.initState();
    _platformAdapter = DSAccordionPlatformAdapter();
    _a11yHelper = DSAccordionA11yHelper();
    _expandedKeys = Set.from(widget.expandedKeys);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeConfig();
    _initializeAnimations();
  }

  @override
  void didUpdateWidget(DSAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config) {
      _initializeConfig();
    }
    if (widget.expandedKeys != oldWidget.expandedKeys) {
      _expandedKeys = Set.from(widget.expandedKeys);
    }
    if (widget.items != oldWidget.items) {
      _initializeAnimations();
    }
  }

  @override
  void dispose() {
    for (final controller in _animationControllers.values) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _initializeConfig() {
    _effectiveConfig = _platformAdapter.adaptConfigForPlatform(
      widget.config ?? const DSAccordionConfig(),
      context,
    );
  }

  void _initializeAnimations() {
    final newControllers = <String, AnimationController>{};
    final newAnimations = <String, Animation<double>>{};
    final newFocusNodes = <String, FocusNode>{};

    for (final item in widget.items) {
      final key = item.key;

      final controller =
          _animationControllers[key] ??
          AnimationController(
            duration: _platformAdapter.getAnimationDuration(
              _effectiveConfig!.animations!,
            ),
            vsync: this,
          );

      final animation = CurvedAnimation(
        parent: controller,
        curve: _platformAdapter.getAnimationCurve(
          _effectiveConfig!.animations!,
        ),
      );

      final focusNode = _focusNodes[key] ?? FocusNode();

      newControllers[key] = controller;
      newAnimations[key] = animation;
      newFocusNodes[key] = focusNode;

      if (_expandedKeys.contains(key)) {
        controller.value = 1.0;
      } else {
        controller.value = 0.0;
      }
    }

    for (final key in _animationControllers.keys.toList()) {
      if (!newControllers.containsKey(key)) {
        _animationControllers[key]?.dispose();
        _focusNodes[key]?.dispose();
      }
    }

    _animationControllers
      ..clear()
      ..addAll(newControllers);
    _animations
      ..clear()
      ..addAll(newAnimations);
    _focusNodes
      ..clear()
      ..addAll(newFocusNodes);
  }

  void _handleExpansionChanged(String key, bool expanded) {
    if (!widget.interactive) return;

    _platformAdapter.triggerHapticFeedback();

    final newExpandedKeys = Set<String>.from(_expandedKeys);

    if (_effectiveConfig!.variant == DSAccordionVariant.single) {
      if (expanded) {
        newExpandedKeys.clear();
        newExpandedKeys.add(key);
      } else {
        newExpandedKeys.remove(key);
      }
    } else {
      if (expanded) {
        newExpandedKeys.add(key);
      } else {
        newExpandedKeys.remove(key);
      }
    }

    setState(() {
      _expandedKeys = newExpandedKeys;
    });

    widget.onChanged?.call(newExpandedKeys);

    final controller = _animationControllers[key];
    if (controller != null) {
      if (expanded) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    _a11yHelper.announceExpansionChange(key, expanded);
  }

  void _handleStateChange(DSAccordionState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });
      widget.onStateChanged?.call(newState);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_effectiveConfig == null) {
      return const SizedBox.shrink();
    }

    if (_currentState == DSAccordionState.skeleton) {
      return _buildSkeletonLoader();
    }

    if (_currentState == DSAccordionState.loading) {
      return _buildLoadingState();
    }

    return _buildAccordion();
  }

  Widget _buildAccordion() {
    final config = _effectiveConfig!;
    final colors = config.colors!;

    return Semantics(
      label: _a11yHelper.getAccordionSemanticLabel(config),
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundColor,
          border: Border.all(
            color: colors.borderColor ?? Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int index = 0; index < widget.items.length; index++)
              _buildAccordionItem(widget.items[index], index),
          ],
        ),
      ),
    );
  }

  Widget _buildAccordionItem(DSAccordionItem item, int index) {
    final config = _effectiveConfig!;
    final key = item.key;
    final isExpanded = _expandedKeys.contains(key);
    final isLast = index == widget.items.length - 1;
    final colors = config.colors!;
    final spacing = config.spacing!;
    final typography = config.typography!;
    final behavior = config.behavior!;
    final focusNode = _focusNodes[key]!;
    final animation = _animations[key]!;

    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.interactive
                ? () => _handleExpansionChanged(key, !isExpanded)
                : null,
            onHover: behavior.enableHoverEffects
                ? (hovering) {
                    _handleStateChange(
                      hovering
                          ? DSAccordionState.hover
                          : DSAccordionState.defaultState,
                    );
                  }
                : null,
            onTapDown: (_) => _handleStateChange(DSAccordionState.pressed),
            onTapUp: (_) => _handleStateChange(DSAccordionState.defaultState),
            onTapCancel: () =>
                _handleStateChange(DSAccordionState.defaultState),
            focusNode: focusNode,
            onFocusChange: (focused) {
              if (focused && behavior.showFocusIndicator) {
                _handleStateChange(DSAccordionState.focus);
              } else if (!focused) {
                _handleStateChange(DSAccordionState.defaultState);
              }
            },
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              padding: spacing.headerPadding,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style:
                              typography.titleStyle?.copyWith(
                                color:
                                    _currentState == DSAccordionState.disabled
                                    ? colors.disabledColor
                                    : colors.titleColor,
                              ) ??
                              Theme.of(context).textTheme.bodyLarge,
                        ),
                        if (item.subtitle != null) ...[
                          SizedBox(height: spacing.titleSubtitleSpacing),
                          Text(
                            item.subtitle!,
                            style:
                                typography.subtitleStyle?.copyWith(
                                  color:
                                      _currentState ==
                                          DSAccordionState.disabled
                                      ? colors.disabledColor
                                      : colors.subtitleColor,
                                ) ??
                                Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: spacing.iconTextSpacing),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: _platformAdapter.getAnimationDuration(
                      config.animations!,
                    ),
                    curve: _platformAdapter.getAnimationCurve(
                      config.animations!,
                    ),
                    child: Icon(
                      config.useMaterialIcons
                          ? Icons.expand_more
                          : Icons.keyboard_arrow_down,
                      color: _currentState == DSAccordionState.disabled
                          ? colors.disabledColor
                          : colors.expansionIconColor,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: animation.value,
                child: child,
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: spacing.contentPadding,
            child: item.content,
          ),
        ),
        if (config.showDividers && !isLast)
          Divider(
            height: 1,
            thickness: 1.0,
            color: colors.dividerColor,
            indent: spacing.headerPadding.left,
            endIndent: spacing.headerPadding.right,
          ),
      ],
    );
  }

  Widget _buildLoadingState() {
    final config = _effectiveConfig!;
    final spacing = config.spacing!;

    return Container(
      padding: spacing.contentPadding,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildSkeletonLoader() {
    final config = _effectiveConfig!;
    final colors = config.colors!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:
              colors.borderColor?.withValues(alpha: 0.3) ??
              Colors.grey.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: List.generate(3, (index) => _buildSkeletonItem(index == 2)),
      ),
    );
  }

  Widget _buildSkeletonItem(bool isLast) {
    final config = _effectiveConfig!;
    final spacing = config.spacing!;
    final colors = config.colors!;

    return Column(
      children: [
        Container(
          padding: spacing.headerPadding,
          child: Row(
            children: [
              _buildShimmerBox(24, 24, colors),
              SizedBox(width: spacing.iconTextSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerBox(200, 16, colors),
                    SizedBox(height: spacing.titleSubtitleSpacing),
                    _buildShimmerBox(150, 12, colors),
                  ],
                ),
              ),
              SizedBox(width: spacing.iconTextSpacing),
              _buildShimmerBox(24, 24, colors),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            thickness: 1.0,
            color:
                colors.dividerColor?.withValues(alpha: 0.3) ??
                Colors.grey.withValues(alpha: 0.3),
            indent: spacing.headerPadding.left,
            endIndent: spacing.headerPadding.right,
          ),
      ],
    );
  }

  Widget _buildShimmerBox(
    double width,
    double height,
    DSAccordionColors colors,
  ) {
    return TweenAnimationBuilder<double>(
      duration: _effectiveConfig!.animations!.skeletonDuration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                colors.skeletonBaseColor ?? Colors.grey.shade300,
                colors.skeletonHighlightColor ?? Colors.grey.shade100,
                colors.skeletonBaseColor ?? Colors.grey.shade300,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }
}
