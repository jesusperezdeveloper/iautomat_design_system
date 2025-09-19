import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chip_config.dart';

/// Callback function type for chip selection
typedef OnChipSelected = void Function(bool selected);

/// Callback function type for chip deletion
typedef OnChipDeleted = void Function();

/// A comprehensive chip widget based on Material Design with multiple variants
///
/// The [DSChip] provides a flexible chip interface with:
/// - Multiple variants: input, filter, choice, assist
/// - Comprehensive state support
/// - Avatar and icon support
/// - Deletable functionality
/// - Platform-adaptive behavior
/// - Full accessibility support
/// - RTL text direction support
/// - Material 3 design integration
///
/// Example usage:
/// ```dart
/// DSChip(
///   variant: DSChipVariant.filter,
///   label: 'Flutter',
///   selected: true,
///   onSelected: (selected) {
///     print('Chip selected: $selected');
///   },
///   avatar: CircleAvatar(child: Text('F')),
///   deletable: true,
/// )
/// ```
class DSChip extends StatefulWidget {
  /// The variant of the chip
  final DSChipVariant variant;

  /// The label text for the chip
  final String label;

  /// Whether the chip is selected
  final bool selected;

  /// Callback when the chip selection changes
  final OnChipSelected? onSelected;

  /// Avatar widget to display
  final Widget? avatar;

  /// Icon to display
  final IconData? icon;

  /// Whether the chip can be deleted
  final bool deletable;

  /// Callback when the chip is deleted
  final OnChipDeleted? onDeleted;

  /// Current state of the chip
  final DSChipState state;

  /// Whether the chip is enabled
  final bool enabled;

  /// Configuration for the chip
  final DSChipConfig? config;

  /// Chip data model for complex configurations
  final DSChipData? data;

  /// Tooltip text
  final String? tooltip;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Color override
  final Color? color;

  /// Background color override
  final Color? backgroundColor;

  /// Custom delete icon
  final IconData? deleteIcon;

  /// Whether to show checkmark when selected
  final bool? showCheckmark;

  /// Custom elevation
  final double? elevation;

  /// Custom padding
  final EdgeInsets? padding;

  /// Custom border radius
  final BorderRadius? borderRadius;

  /// Custom text style
  final TextStyle? textStyle;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable sound effects
  final bool enableSoundEffects;

  /// Custom avatar text (if no avatar widget provided)
  final String? avatarText;

  /// Custom avatar background color
  final Color? avatarBackgroundColor;

  /// Custom size override
  final DSChipSize? size;

  /// Custom shape override
  final DSChipShape? shape;

  const DSChip({
    super.key,
    this.variant = DSChipVariant.assist,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.avatar,
    this.icon,
    this.deletable = false,
    this.onDeleted,
    this.state = DSChipState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.color,
    this.backgroundColor,
    this.deleteIcon,
    this.showCheckmark,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.avatarText,
    this.avatarBackgroundColor,
    this.size,
    this.shape,
  });

  /// Create an input chip
  const DSChip.input({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.avatar,
    this.icon,
    this.deletable = true,
    this.onDeleted,
    this.state = DSChipState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.color,
    this.backgroundColor,
    this.deleteIcon,
    this.showCheckmark,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.avatarText,
    this.avatarBackgroundColor,
    this.size,
    this.shape,
  }) : variant = DSChipVariant.input;

  /// Create a filter chip
  const DSChip.filter({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.avatar,
    this.icon,
    this.deletable = false,
    this.onDeleted,
    this.state = DSChipState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.color,
    this.backgroundColor,
    this.deleteIcon,
    this.showCheckmark = true,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.avatarText,
    this.avatarBackgroundColor,
    this.size,
    this.shape,
  }) : variant = DSChipVariant.filter;

  /// Create a choice chip
  const DSChip.choice({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.avatar,
    this.icon,
    this.deletable = false,
    this.onDeleted,
    this.state = DSChipState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.color,
    this.backgroundColor,
    this.deleteIcon,
    this.showCheckmark = false,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.avatarText,
    this.avatarBackgroundColor,
    this.size,
    this.shape,
  }) : variant = DSChipVariant.choice;

  /// Create an assist chip
  const DSChip.assist({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.avatar,
    this.icon,
    this.deletable = false,
    this.onDeleted,
    this.state = DSChipState.defaultState,
    this.enabled = true,
    this.config,
    this.data,
    this.tooltip,
    this.semanticLabel,
    this.color,
    this.backgroundColor,
    this.deleteIcon,
    this.showCheckmark = false,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.avatarText,
    this.avatarBackgroundColor,
    this.size,
    this.shape,
  }) : variant = DSChipVariant.assist;

  @override
  State<DSChip> createState() => _DSChipState();
}

class _DSChipState extends State<DSChip> with TickerProviderStateMixin {
  late DSChipConfig _config;
  late AnimationController _animationController;
  late AnimationController _deleteAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _deleteAnimation;

  bool _isHovered = false;
  bool _isFocused = false;
  bool _isPressed = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeFiles();
    _setupFocusListener();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeConfig();
    _initializeAnimations();
  }

  void _initializeConfig() {
    _config = widget.config ?? DSChipConfig.fromTheme(Theme.of(context));
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: _config.animationDuration,
      vsync: this,
    );

    _deleteAnimationController = AnimationController(
      duration: _config.deleteAnimationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _config.animationCurve,
    ));

    _deleteAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _deleteAnimationController,
      curve: _config.animationCurve,
    ));
  }

  void _initializeFiles() {
    // Initialize any file-related state if needed
  }

  void _setupFocusListener() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void didUpdateWidget(DSChip oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config != oldWidget.config) {
      _initializeConfig();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _deleteAnimationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == DSChipState.skeleton) {
      return _buildSkeleton();
    }

    Widget chip = _buildChip();

    if (widget.tooltip != null) {
      chip = Tooltip(
        message: widget.tooltip!,
        child: chip,
      );
    }

    return AnimatedBuilder(
      animation: _deleteAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _deleteAnimation.value,
          child: Opacity(
            opacity: _deleteAnimation.value,
            child: child,
          ),
        );
      },
      child: chip,
    );
  }

  Widget _buildChip() {
    final colors = _getColors();
    final sizes = _config.sizes ?? const DSChipSizes();
    final chipSize = widget.size ?? _config.size;
    final chipShape = widget.shape ?? _config.shape;

    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      button: widget.onSelected != null,
      selected: widget.selected,
      enabled: widget.enabled,
      child: Focus(
        focusNode: _focusNode,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: MouseRegion(
                onEnter: (_) => _onHoverStart(),
                onExit: (_) => _onHoverEnd(),
                child: GestureDetector(
                  onTap: widget.enabled ? _onTap : null,
                  onTapDown: (_) => _onTapDown(),
                  onTapUp: (_) => _onTapUp(),
                  onTapCancel: _onTapCancel,
                  child: AnimatedContainer(
                    duration: _config.animationDuration,
                    curve: _config.animationCurve,
                    height: DSChipUtils.getHeight(chipSize, sizes),
                    padding: widget.padding ??
                        DSChipUtils.getPadding(chipSize, sizes),
                    decoration:
                        _getDecoration(colors, chipSize, chipShape, sizes),
                    child: _buildChipContent(colors, chipSize, sizes),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildChipContent(
      DSChipColors colors, DSChipSize chipSize, DSChipSizes sizes) {
    final typography =
        _config.typography ?? DSChipTypography.fromTheme(Theme.of(context));
    final icons = _config.icons ?? const DSChipIcons();

    if (widget.state == DSChipState.loading) {
      return _buildLoadingContent(colors, chipSize);
    }

    final children = <Widget>[];

    // Add avatar or icon
    final avatarWidget = _buildAvatar(colors, chipSize, sizes);
    if (avatarWidget != null) {
      children.add(avatarWidget);
      children.add(SizedBox(width: _config.avatarSpacing));
    }

    // Add checkmark for selected filter chips
    if (_shouldShowCheckmark()) {
      children.add(_buildCheckmark(colors, chipSize, sizes));
      children.add(SizedBox(width: _config.iconSpacing));
    }

    // Add label
    children.add(
      Flexible(
        child: Text(
          widget.label,
          style: _getTextStyle(colors, chipSize, typography),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    // Add delete button
    if (_shouldShowDeleteButton()) {
      children.add(SizedBox(width: _config.iconSpacing));
      children.add(_buildDeleteButton(colors, chipSize, sizes, icons));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget? _buildAvatar(
      DSChipColors colors, DSChipSize chipSize, DSChipSizes sizes) {
    // Check data model first
    if (widget.data?.hasAvatar == true) {
      if (widget.data!.avatarUrl != null) {
        // Network avatar
        return CircleAvatar(
          radius: DSChipUtils.getAvatarSize(chipSize, sizes).width / 2,
          backgroundImage: NetworkImage(widget.data!.avatarUrl!),
        );
      } else if (widget.data!.avatarText != null) {
        // Text avatar
        return _buildTextAvatar(
          widget.data!.avatarText!,
          colors,
          chipSize,
          sizes,
        );
      }
    }

    // Use widget properties
    if (widget.avatar != null) {
      return widget.avatar;
    }

    if (widget.avatarText != null) {
      return _buildTextAvatar(widget.avatarText!, colors, chipSize, sizes);
    }

    if (widget.icon != null || widget.data?.icon != null) {
      return _buildIcon(colors, chipSize, sizes);
    }

    return null;
  }

  Widget _buildTextAvatar(String text, DSChipColors colors,
      DSChipSize chipSize, DSChipSizes sizes) {
    final typography =
        _config.typography ?? DSChipTypography.fromTheme(Theme.of(context));
    final avatarSize = DSChipUtils.getAvatarSize(chipSize, sizes);

    return Container(
      width: avatarSize.width,
      height: avatarSize.height,
      decoration: BoxDecoration(
        color: widget.avatarBackgroundColor ?? colors.avatarBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text.isNotEmpty ? text[0].toUpperCase() : '',
          style: DSChipUtils.getAvatarTextStyle(chipSize, typography).copyWith(
            color: colors.avatarTextColor,
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(
      DSChipColors colors, DSChipSize chipSize, DSChipSizes sizes) {
    final iconData = widget.icon ?? widget.data?.icon;
    if (iconData == null) return const SizedBox.shrink();

    final iconSize = DSChipUtils.getIconSize(chipSize, sizes);
    final iconColor = _getIconColor(colors);

    return Icon(
      iconData,
      size: iconSize.width,
      color: iconColor,
    );
  }

  Widget _buildCheckmark(
      DSChipColors colors, DSChipSize chipSize, DSChipSizes sizes) {
    final icons = _config.icons ?? const DSChipIcons();
    final checkmarkSize = _getCheckmarkSize(chipSize, sizes);

    return AnimatedSwitcher(
      duration: _config.animationDuration,
      child: widget.selected
          ? Icon(
              icons.checkIcon,
              size: checkmarkSize.width,
              color: widget.selected
                  ? colors.selectedCheckmarkColor
                  : colors.checkmarkColor,
              key: const ValueKey('checkmark'),
            )
          : SizedBox(
              width: checkmarkSize.width,
              height: checkmarkSize.height,
              key: const ValueKey('empty'),
            ),
    );
  }

  Widget _buildDeleteButton(DSChipColors colors, DSChipSize chipSize,
      DSChipSizes sizes, DSChipIcons icons) {
    final deleteIconSize = _getDeleteIconSize(chipSize, sizes);
    final deleteIconData = widget.deleteIcon ?? icons.deleteIcon;

    return GestureDetector(
      onTap: widget.enabled ? _onDeleteTap : null,
      child: Container(
        width: deleteIconSize.width + 4,
        height: deleteIconSize.height + 4,
        padding: const EdgeInsets.all(2),
        child: Icon(
          deleteIconData,
          size: deleteIconSize.width,
          color: _getDeleteIconColor(colors),
        ),
      ),
    );
  }

  Widget _buildLoadingContent(DSChipColors colors, DSChipSize chipSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: _config.loadingIndicatorSize.width,
          height: _config.loadingIndicatorSize.height,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor:
                AlwaysStoppedAnimation<Color>(colors.loadingIndicatorColor),
          ),
        ),
        SizedBox(width: _config.iconSpacing),
        Text(
          widget.label,
          style: _getLoadingTextStyle(colors),
        ),
      ],
    );
  }

  Widget _buildSkeleton() {
    final colors = _config.colors ?? DSChipColors.fromTheme(Theme.of(context));
    final sizes = _config.sizes ?? const DSChipSizes();
    final chipSize = widget.size ?? _config.size;

    return Container(
      height: DSChipUtils.getHeight(chipSize, sizes),
      width: 80,
      decoration: BoxDecoration(
        color: colors.skeletonBaseColor,
        borderRadius: widget.borderRadius ??
            DSChipUtils.getBorderRadius(
                chipSize, widget.shape ?? _config.shape, sizes),
      ),
    );
  }

  // Styling methods
  DSChipColors _getColors() {
    final baseColors =
        _config.colors ?? DSChipColors.fromTheme(Theme.of(context));
    return DSChipUtils.getVariantColors(widget.variant, baseColors);
  }

  BoxDecoration _getDecoration(DSChipColors colors, DSChipSize chipSize,
      DSChipShape chipShape, DSChipSizes sizes) {
    Color backgroundColor;
    Color borderColor;
    double borderWidth;
    double elevation;

    if (!widget.enabled) {
      backgroundColor = colors.disabledBackgroundColor;
      borderColor = colors.disabledBorderColor;
      borderWidth = _config.borderWidth;
      elevation = _config.disabledElevation;
    } else if (widget.state == DSChipState.loading) {
      backgroundColor = colors.loadingBackgroundColor;
      borderColor = colors.loadingBorderColor;
      borderWidth = _config.borderWidth;
      elevation = widget.elevation ?? _config.elevation;
    } else if (widget.selected) {
      backgroundColor =
          widget.backgroundColor ?? colors.selectedBackgroundColor;
      borderColor = colors.selectedBorderColor;
      borderWidth = _config.borderWidth;
      elevation = widget.elevation ?? _config.elevation;
    } else if (_isPressed) {
      backgroundColor = colors.pressedBackgroundColor;
      borderColor = colors.pressedBorderColor;
      borderWidth = _config.borderWidth;
      elevation = widget.elevation ?? _config.pressedElevation;
    } else if (_isFocused) {
      backgroundColor = colors.focusBackgroundColor;
      borderColor = colors.focusBorderColor;
      borderWidth = _config.focusBorderWidth;
      elevation = widget.elevation ?? _config.elevation;
    } else if (_isHovered) {
      backgroundColor = colors.hoverBackgroundColor;
      borderColor = colors.hoverBorderColor;
      borderWidth = _config.borderWidth;
      elevation = widget.elevation ?? _config.hoverElevation;
    } else {
      backgroundColor = widget.backgroundColor ?? colors.backgroundColor;
      borderColor = colors.borderColor;
      borderWidth = _config.borderWidth;
      elevation = widget.elevation ?? _config.elevation;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: widget.borderRadius ??
          DSChipUtils.getBorderRadius(chipSize, chipShape, sizes),
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      boxShadow: elevation > 0
          ? [
              BoxShadow(
                color: _getShadowColor(colors),
                blurRadius: elevation,
                offset: Offset(0, elevation / 2),
              ),
            ]
          : null,
    );
  }

  TextStyle _getTextStyle(DSChipColors colors, DSChipSize chipSize,
      DSChipTypography typography) {
    final baseStyle =
        widget.textStyle ?? DSChipUtils.getTextStyle(chipSize, typography);

    Color textColor;
    if (!widget.enabled) {
      textColor = colors.disabledTextColor;
    } else if (widget.state == DSChipState.loading) {
      textColor = colors.loadingTextColor;
    } else if (widget.selected) {
      textColor = colors.selectedTextColor;
    } else if (_isPressed) {
      textColor = colors.pressedTextColor;
    } else if (_isFocused) {
      textColor = colors.focusTextColor;
    } else if (_isHovered) {
      textColor = colors.hoverTextColor;
    } else {
      textColor = widget.color ?? colors.textColor;
    }

    return baseStyle.copyWith(color: textColor);
  }

  TextStyle _getLoadingTextStyle(DSChipColors colors) {
    final typography =
        _config.typography ?? DSChipTypography.fromTheme(Theme.of(context));
    return typography.loadingStyle.copyWith(color: colors.loadingTextColor);
  }

  Color _getIconColor(DSChipColors colors) {
    if (!widget.enabled) {
      return colors.disabledIconColor;
    } else if (widget.state == DSChipState.loading) {
      return colors.loadingIconColor;
    } else if (widget.selected) {
      return colors.selectedIconColor;
    } else if (_isPressed) {
      return colors.pressedIconColor;
    } else if (_isFocused) {
      return colors.focusIconColor;
    } else if (_isHovered) {
      return colors.hoverIconColor;
    } else {
      return colors.iconColor;
    }
  }

  Color _getDeleteIconColor(DSChipColors colors) {
    if (!widget.enabled) {
      return colors.deleteIconDisabledColor;
    } else if (_isPressed) {
      return colors.deleteIconPressedColor;
    } else if (_isHovered) {
      return colors.deleteIconHoverColor;
    } else {
      return colors.deleteIconColor;
    }
  }

  Color _getShadowColor(DSChipColors colors) {
    if (_isPressed) {
      return colors.pressedShadowColor;
    } else if (_isHovered) {
      return colors.hoverShadowColor;
    } else {
      return colors.shadowColor;
    }
  }

  Size _getCheckmarkSize(DSChipSize chipSize, DSChipSizes sizes) {
    switch (chipSize) {
      case DSChipSize.small:
        return sizes.smallCheckmarkSize;
      case DSChipSize.medium:
        return sizes.mediumCheckmarkSize;
      case DSChipSize.large:
        return sizes.largeCheckmarkSize;
    }
  }

  Size _getDeleteIconSize(DSChipSize chipSize, DSChipSizes sizes) {
    switch (chipSize) {
      case DSChipSize.small:
        return sizes.smallDeleteIconSize;
      case DSChipSize.medium:
        return sizes.mediumDeleteIconSize;
      case DSChipSize.large:
        return sizes.largeDeleteIconSize;
    }
  }

  // Interaction methods
  void _onHoverStart() {
    if (!widget.enabled) return;
    setState(() {
      _isHovered = true;
    });
  }

  void _onHoverEnd() {
    setState(() {
      _isHovered = false;
    });
  }

  void _onTapDown() {
    if (!widget.enabled) return;
    setState(() {
      _isPressed = true;
    });
    _animationController.forward();
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _onTapUp() {
    setState(() {
      _isPressed = false;
    });
    _animationController.reverse();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _animationController.reverse();
  }

  void _onTap() {
    if (!widget.enabled) return;
    _focusNode.requestFocus();

    if (widget.onSelected != null) {
      widget.onSelected!(!widget.selected);
    }
  }

  void _onDeleteTap() {
    if (!widget.enabled) return;

    if (widget.enableHapticFeedback) {
      HapticFeedback.mediumImpact();
    }

    if (widget.onDeleted != null) {
      _deleteAnimationController.forward().then((_) {
        widget.onDeleted!();
      });
    }
  }

  // Helper methods
  bool _shouldShowCheckmark() {
    final showCheckmark = widget.showCheckmark ?? _config.showCheckmark;
    return showCheckmark &&
        widget.variant == DSChipVariant.filter &&
        widget.selected;
  }

  bool _shouldShowDeleteButton() {
    return widget.deletable &&
        (widget.onDeleted != null || widget.data?.isDeletable == true) &&
        _config.showDeleteIcon;
  }
}
