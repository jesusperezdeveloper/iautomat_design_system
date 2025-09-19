import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'toggle_view_config.dart';

/// Callback function type for toggle view value changes
typedef OnToggleViewChanged = void Function(List<String> selectedValues);

/// Callback function type for toggle view option tap
typedef OnToggleViewOptionTap = void Function(String optionId);

/// A comprehensive toggle view widget based on Material Design with multiple variants
///
/// The [DSToggleView] provides a flexible toggle interface with:
/// - Multiple variants: list, grid, compact
/// - Comprehensive state support
/// - Multi-selection and single-selection modes
/// - Platform-adaptive behavior
/// - Full accessibility support
/// - RTL text direction support
/// - Keyboard navigation support
/// - Material 3 design integration
///
/// Example usage:
/// ```dart
/// DSToggleView(
///   variant: DSToggleViewVariant.grid,
///   value: ['option1', 'option2'],
///   options: [
///     DSToggleViewOption(id: 'option1', label: 'Option 1'),
///     DSToggleViewOption(id: 'option2', label: 'Option 2'),
///     DSToggleViewOption(id: 'option3', label: 'Option 3'),
///   ],
///   onChanged: (selectedValues) {
///     print('Selected: $selectedValues');
///   },
/// )
/// ```
class DSToggleView extends StatefulWidget {
  /// The variant of the toggle view
  final DSToggleViewVariant variant;

  /// The currently selected values
  final List<String> value;

  /// Callback when the selection changes
  final OnToggleViewChanged? onChanged;

  /// Available options for selection
  final List<DSToggleViewOption> options;

  /// Current state of the toggle view
  final DSToggleViewState state;

  /// Whether the toggle view is enabled
  final bool enabled;

  /// Configuration for the toggle view
  final DSToggleViewConfig? config;

  /// Toggle view data model for complex configurations
  final DSToggleViewData? data;

  /// Tooltip text
  final String? tooltip;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Whether to allow multiple selections
  final bool allowMultipleSelection;

  /// Whether to allow deselection of selected items
  final bool allowDeselection;

  /// Custom scroll controller
  final ScrollController? scrollController;

  /// Custom focus node
  final FocusNode? focusNode;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable sound effects
  final bool enableSoundEffects;

  /// Custom size override
  final DSToggleViewSize? size;

  /// Custom orientation override
  final DSToggleViewOrientation? orientation;

  /// Custom constraints
  final BoxConstraints? constraints;

  /// Custom text direction
  final TextDirection? textDirection;

  /// Callback for option tap (in addition to selection change)
  final OnToggleViewOptionTap? onOptionTap;

  /// Custom loading builder
  final Widget Function(BuildContext context)? loadingBuilder;

  /// Custom skeleton builder
  final Widget Function(BuildContext context)? skeletonBuilder;

  /// Custom error builder
  final Widget Function(BuildContext context, String error)? errorBuilder;

  const DSToggleView({
    super.key,
    this.variant = DSToggleViewVariant.list,
    this.value = const [],
    this.onChanged,
    this.options = const [],
    this.state = DSToggleViewState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.allowMultipleSelection = true,
    this.allowDeselection = true,
    this.scrollController,
    this.focusNode,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.size,
    this.orientation,
    this.constraints,
    this.textDirection,
    this.onOptionTap,
    this.loadingBuilder,
    this.skeletonBuilder,
    this.errorBuilder,
  });

  /// Create a list toggle view
  const DSToggleView.list({
    super.key,
    this.value = const [],
    this.onChanged,
    this.options = const [],
    this.state = DSToggleViewState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.allowMultipleSelection = true,
    this.allowDeselection = true,
    this.scrollController,
    this.focusNode,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.size,
    this.orientation,
    this.constraints,
    this.textDirection,
    this.onOptionTap,
    this.loadingBuilder,
    this.skeletonBuilder,
    this.errorBuilder,
  }) : variant = DSToggleViewVariant.list;

  /// Create a grid toggle view
  const DSToggleView.grid({
    super.key,
    this.value = const [],
    this.onChanged,
    this.options = const [],
    this.state = DSToggleViewState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.allowMultipleSelection = true,
    this.allowDeselection = true,
    this.scrollController,
    this.focusNode,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.size,
    this.orientation,
    this.constraints,
    this.textDirection,
    this.onOptionTap,
    this.loadingBuilder,
    this.skeletonBuilder,
    this.errorBuilder,
  }) : variant = DSToggleViewVariant.grid;

  /// Create a compact toggle view
  const DSToggleView.compact({
    super.key,
    this.value = const [],
    this.onChanged,
    this.options = const [],
    this.state = DSToggleViewState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.allowMultipleSelection = true,
    this.allowDeselection = true,
    this.scrollController,
    this.focusNode,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.size,
    this.orientation,
    this.constraints,
    this.textDirection,
    this.onOptionTap,
    this.loadingBuilder,
    this.skeletonBuilder,
    this.errorBuilder,
  }) : variant = DSToggleViewVariant.compact;

  @override
  State<DSToggleView> createState() => _DSToggleViewState();
}

class _DSToggleViewState extends State<DSToggleView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _skeletonController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _skeletonAnimation;

  late ScrollController _scrollController;
  late FocusNode _focusNode;

  int _focusIndex = -1;
  DSToggleViewState _currentState = DSToggleViewState.defaultState;
  DSToggleViewConfig _effectiveConfig = const DSToggleViewConfig();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAnimations();
    _updateConfiguration();
    _currentState = widget.state;
  }

  void _initializeControllers() {
    _scrollController = widget.scrollController ?? ScrollController();
    _focusNode = widget.focusNode ?? FocusNode();

    _animationController = AnimationController(
      duration: _effectiveConfig.animationDuration,
      vsync: this,
    );

    _skeletonController = AnimationController(
      duration: _effectiveConfig.skeletonAnimationDuration,
      vsync: this,
    );

    if (widget.state == DSToggleViewState.skeleton) {
      _skeletonController.repeat();
    }
  }

  void _initializeAnimations() {
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _skeletonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _skeletonController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  void _updateConfiguration() {
    _effectiveConfig = widget.config ?? _getDefaultConfig();
  }

  DSToggleViewConfig _getDefaultConfig() {
    final size = widget.size ?? DSToggleViewSize.medium;
    switch (size) {
      case DSToggleViewSize.small:
        return DSToggleViewConfig.small;
      case DSToggleViewSize.medium:
        return DSToggleViewConfig.medium;
      case DSToggleViewSize.large:
        return DSToggleViewConfig.large;
    }
  }

  @override
  void didUpdateWidget(DSToggleView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state) {
      _updateState(widget.state);
    }

    if (oldWidget.config != widget.config || oldWidget.size != widget.size) {
      _updateConfiguration();
    }
  }

  void _updateState(DSToggleViewState newState) {
    setState(() {
      _currentState = newState;
    });

    switch (newState) {
      case DSToggleViewState.skeleton:
        _skeletonController.repeat();
        break;
      case DSToggleViewState.loading:
        _animationController.forward();
        break;
      default:
        _skeletonController.stop();
        _animationController.forward();
        break;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _skeletonController.dispose();
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildToggleView(context);
  }

  Widget _buildToggleView(BuildContext context) {
    final theme = Theme.of(context);
    final textDirection = widget.textDirection ??
        Directionality.maybeOf(context) ??
        TextDirection.ltr;

    return Directionality(
      textDirection: textDirection,
      child: Semantics(
        label: widget.semanticLabel ?? 'Toggle view',
        enabled: widget.enabled,
        child: Focus(
          focusNode: _focusNode,
          onKeyEvent: _handleKeyEvent,
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: _buildContent(context, theme),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme) {
    if (_currentState == DSToggleViewState.skeleton) {
      return _buildSkeletonView(context);
    }

    if (_currentState == DSToggleViewState.loading) {
      return _buildLoadingView(context);
    }

    final constraints = widget.constraints ?? _effectiveConfig.constraints;
    final content = _buildVariantContent(context, theme);

    if (constraints != null) {
      return ConstrainedBox(
        constraints: constraints,
        child: content,
      );
    }

    return content;
  }

  Widget _buildVariantContent(BuildContext context, ThemeData theme) {
    switch (widget.variant) {
      case DSToggleViewVariant.list:
        return _buildListView(context, theme);
      case DSToggleViewVariant.grid:
        return _buildGridView(context, theme);
      case DSToggleViewVariant.compact:
        return _buildCompactView(context, theme);
    }
  }

  Widget _buildListView(BuildContext context, ThemeData theme) {
    final orientation = _getEffectiveOrientation(context);
    final scrollDirection = orientation == DSToggleViewOrientation.horizontal
        ? Axis.horizontal
        : Axis.vertical;

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: scrollDirection,
      physics: _effectiveConfig.listScrollPhysics,
      reverse: _effectiveConfig.listReverse,
      child: Flex(
        direction: scrollDirection,
        mainAxisSize: MainAxisSize.min,
        children: widget.options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          return _buildToggleOption(context, theme, option, index);
        }).toList(),
      ),
    );
  }

  Widget _buildGridView(BuildContext context, ThemeData theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);
        return GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: _effectiveConfig.gridChildAspectRatio,
            mainAxisSpacing: _effectiveConfig.gridMainAxisSpacing,
            crossAxisSpacing: _effectiveConfig.gridCrossAxisSpacing,
          ),
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            final option = widget.options[index];
            return _buildToggleOption(context, theme, option, index);
          },
        );
      },
    );
  }

  Widget _buildCompactView(BuildContext context, ThemeData theme) {
    if (_effectiveConfig.compactWrapItems) {
      return Wrap(
        spacing: _effectiveConfig.itemSpacing,
        runSpacing: _effectiveConfig.itemSpacing,
        alignment: _effectiveConfig.compactAlignment,
        crossAxisAlignment: _effectiveConfig.compactCrossAlignment,
        children: widget.options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          return _buildToggleOption(context, theme, option, index);
        }).toList(),
      );
    } else {
      return SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: widget.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                right: index < widget.options.length - 1
                    ? _effectiveConfig.itemSpacing
                    : 0,
              ),
              child: _buildToggleOption(context, theme, option, index),
            );
          }).toList(),
        ),
      );
    }
  }

  Widget _buildToggleOption(
    BuildContext context,
    ThemeData theme,
    DSToggleViewOption option,
    int index,
  ) {
    final isSelected = widget.value.contains(option.id);
    final isFocused = _focusIndex == index;
    final isEnabled = widget.enabled && option.enabled;

    return _ToggleOptionWidget(
      option: option,
      isSelected: isSelected,
      isFocused: isFocused,
      isEnabled: isEnabled,
      config: _effectiveConfig,
      theme: theme,
      onTap: () => _handleOptionTap(option),
      onHover: (hovering) => _handleOptionHover(option, hovering),
      onFocusChange: (focused) => _handleOptionFocus(option, focused, index),
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    if (widget.loadingBuilder != null) {
      return widget.loadingBuilder!(context);
    }

    return Container(
      height: 40,
      padding: _effectiveConfig.padding,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildSkeletonView(BuildContext context) {
    if (widget.skeletonBuilder != null) {
      return widget.skeletonBuilder!(context);
    }

    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return _buildSkeletonOptions(context);
      },
    );
  }

  Widget _buildSkeletonOptions(BuildContext context) {
    final skeletonCount = widget.options.isNotEmpty ? widget.options.length : 3;

    switch (widget.variant) {
      case DSToggleViewVariant.list:
        return Column(
          children:
              List.generate(skeletonCount, (index) => _buildSkeletonItem()),
        );
      case DSToggleViewVariant.grid:
        return Wrap(
          spacing: _effectiveConfig.itemSpacing,
          runSpacing: _effectiveConfig.itemSpacing,
          children:
              List.generate(skeletonCount, (index) => _buildSkeletonItem()),
        );
      case DSToggleViewVariant.compact:
        return Row(
          children:
              List.generate(skeletonCount, (index) => _buildSkeletonItem()),
        );
    }
  }

  Widget _buildSkeletonItem() {
    return Container(
      width: 80,
      height: 32,
      margin: _effectiveConfig.itemPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            _effectiveConfig.skeletonBaseColor,
            _effectiveConfig.skeletonHighlightColor,
            _effectiveConfig.skeletonBaseColor,
          ],
          stops: [
            0.0,
            _skeletonAnimation.value,
            1.0,
          ],
        ),
      ),
    );
  }

  DSToggleViewOrientation _getEffectiveOrientation(BuildContext context) {
    final orientation = widget.orientation ?? _effectiveConfig.orientation;

    if (orientation == DSToggleViewOrientation.auto) {
      final mediaQuery = MediaQuery.of(context);
      return mediaQuery.orientation == Orientation.landscape
          ? DSToggleViewOrientation.horizontal
          : DSToggleViewOrientation.vertical;
    }

    return orientation;
  }

  int _calculateCrossAxisCount(double availableWidth) {
    final itemWidth =
        DSToggleViewUtils.getItemSize(_effectiveConfig.size).width;
    return DSToggleViewUtils.calculateOptimalCrossAxisCount(
        availableWidth, itemWidth);
  }

  void _handleOptionTap(DSToggleViewOption option) {
    if (!widget.enabled || !option.enabled) return;

    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    if (widget.enableSoundEffects) {
      SystemSound.play(SystemSoundType.click);
    }

    widget.onOptionTap?.call(option.id);

    if (widget.onChanged != null) {
      final newSelection = DSToggleViewUtils.toggleSelection(
        widget.value,
        option.id,
        allowMultiple: widget.allowMultipleSelection,
        allowDeselection: widget.allowDeselection,
      );
      widget.onChanged!(newSelection);
    }
  }

  void _handleOptionHover(DSToggleViewOption option, bool hovering) {
    // Handle hover state changes if needed
  }

  void _handleOptionFocus(DSToggleViewOption option, bool focused, int index) {
    if (focused) {
      setState(() {
        _focusIndex = index;
      });
    } else if (_focusIndex == index) {
      setState(() {
        _focusIndex = -1;
      });
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!_effectiveConfig.enableKeyboardNavigation) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
        case LogicalKeyboardKey.arrowUp:
          _moveFocus(-1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowRight:
        case LogicalKeyboardKey.arrowDown:
          _moveFocus(1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.enter:
        case LogicalKeyboardKey.space:
          if (_focusIndex >= 0 && _focusIndex < widget.options.length) {
            _handleOptionTap(widget.options[_focusIndex]);
          }
          return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  void _moveFocus(int direction) {
    final enabledOptions = widget.options
        .asMap()
        .entries
        .where((entry) => entry.value.enabled)
        .map((entry) => entry.key)
        .toList();

    if (enabledOptions.isEmpty) return;

    int newIndex;
    if (_focusIndex == -1) {
      newIndex = direction > 0 ? enabledOptions.first : enabledOptions.last;
    } else {
      final currentEnabledIndex = enabledOptions.indexOf(_focusIndex);
      if (currentEnabledIndex == -1) {
        newIndex = direction > 0 ? enabledOptions.first : enabledOptions.last;
      } else {
        final nextEnabledIndex = currentEnabledIndex + direction;
        if (nextEnabledIndex < 0) {
          newIndex = enabledOptions.last;
        } else if (nextEnabledIndex >= enabledOptions.length) {
          newIndex = enabledOptions.first;
        } else {
          newIndex = enabledOptions[nextEnabledIndex];
        }
      }
    }

    setState(() {
      _focusIndex = newIndex;
    });
  }
}

/// Internal widget for rendering individual toggle options
class _ToggleOptionWidget extends StatefulWidget {
  final DSToggleViewOption option;
  final bool isSelected;
  final bool isFocused;
  final bool isEnabled;
  final DSToggleViewConfig config;
  final ThemeData theme;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;
  final ValueChanged<bool> onFocusChange;

  const _ToggleOptionWidget({
    required this.option,
    required this.isSelected,
    required this.isFocused,
    required this.isEnabled,
    required this.config,
    required this.theme,
    required this.onTap,
    required this.onHover,
    required this.onFocusChange,
  });

  @override
  State<_ToggleOptionWidget> createState() => _ToggleOptionWidgetState();
}

class _ToggleOptionWidgetState extends State<_ToggleOptionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _hoverAnimation;
  bool _isHovering = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    );
    _hoverAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _hoverController, curve: widget.config.animationCurve),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hoverAnimation,
      builder: (context, child) {
        return MouseRegion(
          onEnter: (_) => _setHovering(true),
          onExit: (_) => _setHovering(false),
          child: GestureDetector(
            onTapDown: (_) => _setPressed(true),
            onTapUp: (_) => _setPressed(false),
            onTapCancel: () => _setPressed(false),
            onTap: widget.isEnabled ? widget.onTap : null,
            child: Focus(
              onFocusChange: widget.onFocusChange,
              child: _buildOptionContent(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionContent() {
    final colors = _getColors();
    final textStyle = _getTextStyle();

    return Container(
      padding: widget.config.itemPadding,
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        border: widget.config.showBorder
            ? Border.all(
                color: colors.borderColor,
                width: widget.config.borderWidth,
              )
            : null,
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        boxShadow: widget.config.showShadow && widget.isSelected
            ? [
                BoxShadow(
                  color: colors.shadowColor,
                  blurRadius: widget.config.elevation,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.option.icon != null && widget.config.showIcon) ...[
            Icon(
              widget.option.icon,
              size: widget.config.iconSize,
              color: colors.iconColor,
            ),
            SizedBox(width: widget.config.iconSpacing),
          ],
          Text(
            widget.option.label,
            style: textStyle,
          ),
        ],
      ),
    );
  }

  _OptionColors _getColors() {
    final theme = widget.theme;
    final colorScheme = theme.colorScheme;

    Color backgroundColor;
    Color borderColor;
    Color textColor;
    Color iconColor;
    Color shadowColor;

    if (!widget.isEnabled) {
      backgroundColor = widget.config.disabledColor ??
          colorScheme.onSurface.withValues(alpha: 0.12);
      borderColor = backgroundColor;
      textColor = colorScheme.onSurface.withValues(alpha: 0.38);
      iconColor = textColor;
      shadowColor = Colors.transparent;
    } else if (widget.isSelected) {
      backgroundColor =
          widget.config.selectedBackgroundColor ?? colorScheme.primary;
      borderColor = widget.config.selectedBorderColor ?? backgroundColor;
      textColor = widget.config.selectedTextColor ?? colorScheme.onPrimary;
      iconColor = widget.config.selectedIconColor ?? textColor;
      shadowColor = colorScheme.primary.withValues(alpha: 0.3);
    } else {
      backgroundColor = widget.config.backgroundColor ?? colorScheme.surface;
      borderColor = widget.config.borderColor ?? colorScheme.outline;
      textColor = widget.config.textColor ?? colorScheme.onSurface;
      iconColor = widget.config.iconColor ?? textColor;
      shadowColor = colorScheme.shadow.withValues(alpha: 0.1);
    }

    // Apply hover and focus effects
    if (_isHovering && widget.isEnabled) {
      final hoverColor = widget.config.hoverColor ??
          colorScheme.primary.withValues(alpha: 0.08);
      backgroundColor =
          Color.lerp(backgroundColor, hoverColor, _hoverAnimation.value) ??
              backgroundColor;
    }

    if (widget.isFocused && widget.config.showFocusIndicator) {
      final focusColor = widget.config.focusColor ?? colorScheme.primary;
      borderColor = focusColor;
    }

    if (_isPressed && widget.isEnabled) {
      final splashColor = widget.config.splashColor ??
          colorScheme.primary.withValues(alpha: 0.12);
      backgroundColor =
          Color.lerp(backgroundColor, splashColor, 0.5) ?? backgroundColor;
    }

    return _OptionColors(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      iconColor: iconColor,
      shadowColor: shadowColor,
    );
  }

  TextStyle _getTextStyle() {
    final theme = widget.theme;
    final colors = _getColors();

    TextStyle baseStyle =
        widget.config.textStyle ?? theme.textTheme.labelLarge!;

    if (widget.isSelected) {
      baseStyle = widget.config.selectedTextStyle ??
          baseStyle.copyWith(
            fontWeight: widget.config.selectedFontWeight,
          );
    } else {
      baseStyle = baseStyle.copyWith(
        fontWeight: widget.config.fontWeight,
      );
    }

    return baseStyle.copyWith(
      color: colors.textColor,
      fontSize: widget.config.fontSize,
    );
  }

  void _setHovering(bool hovering) {
    if (_isHovering != hovering) {
      setState(() {
        _isHovering = hovering;
      });
      widget.onHover(hovering);

      if (hovering) {
        _hoverController.forward();
      } else {
        _hoverController.reverse();
      }
    }
  }

  void _setPressed(bool pressed) {
    if (_isPressed != pressed) {
      setState(() {
        _isPressed = pressed;
      });
    }
  }
}

/// Helper class for option colors
class _OptionColors {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final Color shadowColor;

  const _OptionColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
    required this.shadowColor,
  });
}
