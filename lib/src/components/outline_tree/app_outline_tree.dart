/// AppOutlineTree widget for displaying hierarchical tree structures
///
/// A comprehensive tree component that supports:
/// - Async variant with lazy loading of children
/// - Multi-select variant allowing multiple node selections
/// - Platform-adaptive behavior for iOS, Android, and Web
/// - Full keyboard navigation and accessibility
/// - RTL support
/// - Loading and skeleton states
///
/// Example usage:
/// ```dart
/// AppOutlineTree.async(
///   nodes: [
///     AppTreeNode(id: '1', label: 'Root', hasChildren: true),
///   ],
///   onToggle: (node) => print('Toggled: ${node.label}'),
///   onAsyncLoad: (node) async => await fetchChildren(node.id),
/// )
/// ```
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'outline_tree_config.dart';

/// Main AppOutlineTree widget
class AppOutlineTree extends StatefulWidget {
  /// The variant of the outline tree
  final AppOutlineTreeVariant variant;

  /// List of root nodes to display
  final List<AppTreeNode> nodes;

  /// Callback when a node is toggled (expanded/collapsed)
  final OnNodeToggle? onToggle;

  /// Callback when a node is selected
  final OnNodeSelect? onSelect;

  /// Callback when a node is expanded
  final OnNodeExpand? onExpand;

  /// Async callback for loading children (async variant only)
  final OnAsyncLoad? onAsyncLoad;

  /// Custom node builder
  final NodeBuilder? nodeBuilder;

  /// Custom icon builder
  final NodeIconBuilder? iconBuilder;

  /// Current state of the tree
  final AppOutlineTreeState state;

  /// Whether the tree is visible
  final bool isVisible;

  /// Configuration for the tree
  final AppOutlineTreeConfig? config;

  /// Constructor with all parameters
  const AppOutlineTree({
    super.key,
    required this.variant,
    required this.nodes,
    this.onToggle,
    this.onSelect,
    this.onExpand,
    this.onAsyncLoad,
    this.nodeBuilder,
    this.iconBuilder,
    this.state = AppOutlineTreeState.defaultState,
    this.isVisible = true,
    this.config,
  });

  /// Factory constructor for async variant
  factory AppOutlineTree.async({
    Key? key,
    required List<AppTreeNode> nodes,
    OnNodeToggle? onToggle,
    OnNodeSelect? onSelect,
    OnNodeExpand? onExpand,
    required OnAsyncLoad onAsyncLoad,
    NodeBuilder? nodeBuilder,
    NodeIconBuilder? iconBuilder,
    AppOutlineTreeState state = AppOutlineTreeState.defaultState,
    bool isVisible = true,
    AppOutlineTreeConfig? config,
  }) {
    return AppOutlineTree(
      key: key,
      variant: AppOutlineTreeVariant.async,
      nodes: nodes,
      onToggle: onToggle,
      onSelect: onSelect,
      onExpand: onExpand,
      onAsyncLoad: onAsyncLoad,
      nodeBuilder: nodeBuilder,
      iconBuilder: iconBuilder,
      state: state,
      isVisible: isVisible,
      config: config,
    );
  }

  /// Factory constructor for multi-select variant
  factory AppOutlineTree.multiSelect({
    Key? key,
    required List<AppTreeNode> nodes,
    OnNodeToggle? onToggle,
    OnNodeSelect? onSelect,
    OnNodeExpand? onExpand,
    OnAsyncLoad? onAsyncLoad,
    NodeBuilder? nodeBuilder,
    NodeIconBuilder? iconBuilder,
    AppOutlineTreeState state = AppOutlineTreeState.defaultState,
    bool isVisible = true,
    AppOutlineTreeConfig? config,
  }) {
    return AppOutlineTree(
      key: key,
      variant: AppOutlineTreeVariant.multiSelect,
      nodes: nodes,
      onToggle: onToggle,
      onSelect: onSelect,
      onExpand: onExpand,
      onAsyncLoad: onAsyncLoad,
      nodeBuilder: nodeBuilder,
      iconBuilder: iconBuilder,
      state: state,
      isVisible: isVisible,
      config: config,
    );
  }

  @override
  State<AppOutlineTree> createState() => _AppOutlineTreeState();
}

class _AppOutlineTreeState extends State<AppOutlineTree>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _skeletonController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _skeletonAnimation;
  late FocusNode _focusNode;
  late List<AppTreeNode> _currentNodes;
  late ScrollController _scrollController;

  String? _hoveredNodeId;
  String? _focusedNodeId;
  String? _pressedNodeId;
  final Map<String, AnimationController> _expansionControllers = {};
  final Map<String, Animation<double>> _expansionAnimations = {};

  AppOutlineTreeConfig get _effectiveConfig {
    return widget.config ?? const AppOutlineTreeConfig();
  }

  @override
  void initState() {
    super.initState();
    _currentNodes = List.from(widget.nodes);
    _initializeAnimations();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: _effectiveConfig.animationDuration,
      vsync: this,
    );

    _skeletonController = AnimationController(
      duration: _effectiveConfig.skeletonAnimationDuration,
      vsync: this,
    )..repeat();

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: _effectiveConfig.animationCurve,
    ));

    _skeletonAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _skeletonController,
      curve: Curves.linear,
    ));

    if (widget.isVisible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(AppOutlineTree oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.nodes != widget.nodes) {
      setState(() {
        _currentNodes = List.from(widget.nodes);
      });
    }

    if (oldWidget.isVisible != widget.isVisible) {
      if (widget.isVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _skeletonController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    for (final controller in _expansionControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleNodeToggle(AppTreeNode node) {
    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    setState(() {
      _currentNodes = _updateNodeInTree(_currentNodes, node.id, (n) {
        return n.withExpansion(!n.isExpanded);
      });
    });

    widget.onToggle?.call(node);
    widget.onExpand?.call(node, !node.isExpanded);

    // Handle async loading if needed
    if (widget.variant == AppOutlineTreeVariant.async &&
        !node.isExpanded &&
        node.hasChildren &&
        node.children.isEmpty &&
        widget.onAsyncLoad != null) {
      _loadNodeChildren(node);
    }
  }

  void _handleNodeSelect(AppTreeNode node) {
    if (_effectiveConfig.enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }

    final newSelection = !node.isSelected;

    setState(() {
      if (_effectiveConfig.selectionMode == AppTreeSelectionMode.single) {
        // Clear all selections first
        _currentNodes = _clearAllSelections(_currentNodes);
      }

      _currentNodes = AppOutlineTreeUtils.updateSelection(
        _currentNodes,
        node.id,
        newSelection,
        _effectiveConfig.selectionMode,
      );
    });

    widget.onSelect?.call(node, newSelection);
  }

  Future<void> _loadNodeChildren(AppTreeNode node) async {
    if (widget.onAsyncLoad == null) return;

    // Set loading state
    setState(() {
      _currentNodes = _updateNodeInTree(_currentNodes, node.id, (n) {
        return n.withLoading(true);
      });
    });

    try {
      final children = await widget.onAsyncLoad!(node);

      setState(() {
        _currentNodes = _updateNodeInTree(_currentNodes, node.id, (n) {
          return n
              .withChildren(children)
              .withLoading(false)
              .withExpansion(true);
        });
      });
    } catch (error) {
      setState(() {
        _currentNodes = _updateNodeInTree(_currentNodes, node.id, (n) {
          return n.withError(error.toString());
        });
      });
    }
  }

  List<AppTreeNode> _updateNodeInTree(
    List<AppTreeNode> nodes,
    String nodeId,
    AppTreeNode Function(AppTreeNode) updater,
  ) {
    return nodes.map((node) => node.updateNode(nodeId, updater)).toList();
  }

  List<AppTreeNode> _clearAllSelections(List<AppTreeNode> nodes) {
    return nodes.map((node) {
      final updatedChildren = _clearAllSelections(node.children);
      return node.copyWith(isSelected: false, children: updatedChildren);
    }).toList();
  }

  AnimationController _getExpansionController(String nodeId) {
    if (!_expansionControllers.containsKey(nodeId)) {
      final controller = AnimationController(
        duration: _effectiveConfig.animationDuration,
        vsync: this,
      );
      _expansionControllers[nodeId] = controller;

      final animation = CurvedAnimation(
        parent: controller,
        curve: _effectiveConfig.animationCurve,
      );
      _expansionAnimations[nodeId] = animation;
    }
    return _expansionControllers[nodeId]!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRTL = Directionality.of(context) == TextDirection.rtl ||
        (_effectiveConfig.enableRTL &&
            _effectiveConfig.textDirection == TextDirection.rtl);

    if (!widget.isVisible) {
      return const SizedBox.shrink();
    }

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: Focus(
              focusNode: _focusNode,
              onKeyEvent: _effectiveConfig.enableKeyboardNavigation
                  ? (node, event) => _handleKeyEvent(event)
                  : null,
              child: Semantics(
                label: _effectiveConfig.semanticLabel ?? 'Tree view',
                hint: _effectiveConfig.semanticHint ??
                    'Use arrow keys to navigate',
                enabled: widget.state != AppOutlineTreeState.disabled,
                child: Container(
                  constraints: _effectiveConfig.constraints,
                  padding: _effectiveConfig.padding,
                  margin: _effectiveConfig.margin,
                  child: _buildContent(context, colorScheme),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ColorScheme colorScheme) {
    switch (widget.state) {
      case AppOutlineTreeState.skeleton:
        return _buildSkeletonState(context, colorScheme);
      case AppOutlineTreeState.loading:
        return _buildLoadingState(context, colorScheme);
      default:
        return _buildNormalState(context, colorScheme);
    }
  }

  Widget _buildNormalState(BuildContext context, ColorScheme colorScheme) {
    final flattenedNodes = AppOutlineTreeUtils.flattenTree(
      _currentNodes,
      maxDepth: _effectiveConfig.maxExpandDepth,
    );

    if (flattenedNodes.isEmpty) {
      return _buildEmptyState(context, colorScheme);
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: _effectiveConfig.layout == AppTreeLayout.vertical
          ? Column(
              children: flattenedNodes
                  .map((node) => _buildTreeNode(context, colorScheme, node))
                  .toList(),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: flattenedNodes
                  .map((node) => _buildTreeNode(context, colorScheme, node))
                  .toList(),
            ),
    );
  }

  Widget _buildTreeNode(
      BuildContext context, ColorScheme colorScheme, AppTreeNode node) {
    if (widget.nodeBuilder != null) {
      return widget.nodeBuilder!(context, node, node.depth);
    }

    final isHovered = _hoveredNodeId == node.id;
    final isFocused = _focusedNodeId == node.id;
    final isPressed = _pressedNodeId == node.id;
    final isDisabled =
        node.isDisabled || widget.state == AppOutlineTreeState.disabled;

    return _buildExpandableNode(context, colorScheme, node, isHovered,
        isFocused, isPressed, isDisabled);
  }

  Widget _buildExpandableNode(
    BuildContext context,
    ColorScheme colorScheme,
    AppTreeNode node,
    bool isHovered,
    bool isFocused,
    bool isPressed,
    bool isDisabled,
  ) {
    final controller = _getExpansionController(node.id);
    final animation = _expansionAnimations[node.id]!;

    if (node.isExpanded && !controller.isCompleted) {
      controller.forward();
    } else if (!node.isExpanded && controller.isCompleted) {
      controller.reverse();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNodeItem(context, colorScheme, node, isHovered, isFocused,
            isPressed, isDisabled),
        if (node.canExpand && node.children.isNotEmpty)
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  heightFactor: _effectiveConfig.expansionAnimation ==
                          AppTreeExpansionAnimation.slide
                      ? animation.value
                      : null,
                  child: Opacity(
                    opacity: _effectiveConfig.expansionAnimation ==
                            AppTreeExpansionAnimation.fade
                        ? animation.value
                        : 1.0,
                    child: Transform.scale(
                      scale: _effectiveConfig.expansionAnimation ==
                              AppTreeExpansionAnimation.scale
                          ? animation.value
                          : 1.0,
                      alignment: Alignment.topLeft,
                      child: _buildChildren(context, colorScheme, node),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildNodeItem(
    BuildContext context,
    ColorScheme colorScheme,
    AppTreeNode node,
    bool isHovered,
    bool isFocused,
    bool isPressed,
    bool isDisabled,
  ) {
    Color? backgroundColor;
    Color? textColor;
    Color? iconColor;

    if (isDisabled) {
      backgroundColor = _effectiveConfig.disabledBackgroundColor ??
          colorScheme.surfaceContainerHighest.withValues(alpha: 0.12);
      textColor = _effectiveConfig.disabledTextColor ??
          colorScheme.onSurface.withValues(alpha: 0.38);
      iconColor = _effectiveConfig.disabledIconColor ??
          colorScheme.onSurface.withValues(alpha: 0.38);
    } else if (node.isSelected) {
      backgroundColor = _effectiveConfig.selectedBackgroundColor ??
          colorScheme.primaryContainer;
      textColor =
          _effectiveConfig.selectedTextColor ?? colorScheme.onPrimaryContainer;
      iconColor =
          _effectiveConfig.selectedIconColor ?? colorScheme.onPrimaryContainer;
    } else if (isPressed) {
      backgroundColor =
          _effectiveConfig.selectedBackgroundColor?.withValues(alpha: 0.8) ??
              colorScheme.primaryContainer.withValues(alpha: 0.8);
      textColor =
          _effectiveConfig.selectedTextColor ?? colorScheme.onPrimaryContainer;
      iconColor =
          _effectiveConfig.selectedIconColor ?? colorScheme.onPrimaryContainer;
    } else if (isHovered) {
      backgroundColor = _effectiveConfig.hoverBackgroundColor ??
          colorScheme.surfaceContainerHighest.withValues(alpha: 0.08);
      textColor = _effectiveConfig.hoverTextColor ?? colorScheme.onSurface;
      iconColor = _effectiveConfig.hoverIconColor ?? colorScheme.onSurface;
    } else if (isFocused) {
      backgroundColor = _effectiveConfig.focusBackgroundColor ??
          colorScheme.surfaceContainerHighest.withValues(alpha: 0.12);
      textColor = _effectiveConfig.focusTextColor ?? colorScheme.onSurface;
      iconColor = _effectiveConfig.iconColor ?? colorScheme.onSurface;
    } else {
      backgroundColor = _effectiveConfig.backgroundColor ?? Colors.transparent;
      textColor = _effectiveConfig.textColor ?? colorScheme.onSurface;
      iconColor = _effectiveConfig.iconColor ?? colorScheme.onSurface;
    }

    return MouseRegion(
      cursor:
          isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      onEnter:
          isDisabled ? null : (_) => setState(() => _hoveredNodeId = node.id),
      onExit: isDisabled ? null : (_) => setState(() => _hoveredNodeId = null),
      child: GestureDetector(
        onTapDown:
            isDisabled ? null : (_) => setState(() => _pressedNodeId = node.id),
        onTapUp:
            isDisabled ? null : (_) => setState(() => _pressedNodeId = null),
        onTapCancel:
            isDisabled ? null : () => setState(() => _pressedNodeId = null),
        onTap: isDisabled ? null : () => _handleNodeSelect(node),
        child: AnimatedContainer(
          duration: _effectiveConfig.animationDuration,
          curve: _effectiveConfig.animationCurve,
          height: _effectiveConfig.itemHeight,
          padding: EdgeInsets.only(
            left: node.depth * _effectiveConfig.indentSize +
                _effectiveConfig.itemPadding,
            right: _effectiveConfig.itemPadding,
            top: _effectiveConfig.itemPadding,
            bottom: _effectiveConfig.itemPadding,
          ),
          margin:
              EdgeInsets.symmetric(vertical: _effectiveConfig.itemSpacing / 2),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(_effectiveConfig.borderRadius),
            border: isFocused
                ? Border.all(
                    color: _effectiveConfig.focusBorderColor ??
                        colorScheme.primary,
                    width: _effectiveConfig.borderWidth,
                  )
                : null,
          ),
          child: Semantics(
            label: AppOutlineTreeUtils.getNodeSemanticLabel(
                node, _effectiveConfig),
            selected: node.isSelected,
            button: true,
            onTap: isDisabled ? null : () => _handleNodeSelect(node),
            child: Row(
              children: [
                if (node.canExpand && _effectiveConfig.enableExpansion)
                  _buildExpanderIcon(
                      context, colorScheme, node, iconColor, isDisabled),
                if (_effectiveConfig.showSelectionCheckboxes &&
                    _effectiveConfig.selectionMode !=
                        AppTreeSelectionMode.single)
                  _buildSelectionIcon(context, colorScheme, node, iconColor),
                if (_effectiveConfig.showIcons)
                  _buildNodeIcon(context, colorScheme, node, iconColor),
                Expanded(child: _buildNodeContent(context, node, textColor)),
                if (node.badge != null) _buildBadge(context, colorScheme, node),
                if (node.isLoading)
                  _buildLoadingIndicator(context, colorScheme),
                if (node.state == AppTreeNodeState.error)
                  _buildErrorIcon(context, colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpanderIcon(
    BuildContext context,
    ColorScheme colorScheme,
    AppTreeNode node,
    Color? iconColor,
    bool isDisabled,
  ) {
    if (!node.canExpand) {
      return SizedBox(
          width: _effectiveConfig.iconSize + _effectiveConfig.iconSpacing);
    }

    return GestureDetector(
      onTap: isDisabled ? null : () => _handleNodeToggle(node),
      child: Container(
        width: _effectiveConfig.iconSize,
        height: _effectiveConfig.iconSize,
        margin: EdgeInsets.only(right: _effectiveConfig.iconSpacing),
        child: AnimatedRotation(
          turns: node.isExpanded ? 0.25 : 0.0,
          duration: _effectiveConfig.animationDuration,
          child: Icon(
            node.isExpanded
                ? _effectiveConfig.collapseIcon
                : _effectiveConfig.expandIcon,
            size: _effectiveConfig.iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionIcon(
    BuildContext context,
    ColorScheme colorScheme,
    AppTreeNode node,
    Color? iconColor,
  ) {
    IconData iconData;
    Color? finalIconColor = iconColor;

    if (_effectiveConfig.selectionMode == AppTreeSelectionMode.single) {
      iconData = node.isSelected
          ? _effectiveConfig.radioCheckedIcon
          : _effectiveConfig.radioUncheckedIcon;
    } else {
      if (node.isSelected) {
        iconData = _effectiveConfig.checkedIcon;
        finalIconColor = _effectiveConfig.selectionColor ?? colorScheme.primary;
      } else if (node.isPartiallySelected) {
        iconData = Icons.indeterminate_check_box;
        finalIconColor = _effectiveConfig.selectionColor ?? colorScheme.primary;
      } else {
        iconData = _effectiveConfig.uncheckedIcon;
      }
    }

    return Container(
      width: _effectiveConfig.iconSize,
      height: _effectiveConfig.iconSize,
      margin: EdgeInsets.only(right: _effectiveConfig.iconSpacing),
      child: Icon(
        iconData,
        size: _effectiveConfig.iconSize,
        color: finalIconColor,
      ),
    );
  }

  Widget _buildNodeIcon(
    BuildContext context,
    ColorScheme colorScheme,
    AppTreeNode node,
    Color? iconColor,
  ) {
    if (widget.iconBuilder != null) {
      return widget.iconBuilder!(context, node);
    }

    IconData iconData;
    if (node.icon != null) {
      iconData = node.icon!;
    } else if (node.canExpand) {
      iconData = node.isExpanded
          ? _effectiveConfig.folderOpenIcon
          : _effectiveConfig.folderIcon;
    } else {
      iconData = _effectiveConfig.fileIcon;
    }

    return Container(
      width: _effectiveConfig.iconSize,
      height: _effectiveConfig.iconSize,
      margin: EdgeInsets.only(right: _effectiveConfig.iconSpacing),
      child: Icon(
        iconData,
        size: _effectiveConfig.iconSize,
        color: node.color ?? iconColor,
      ),
    );
  }

  Widget _buildNodeContent(
      BuildContext context, AppTreeNode node, Color? textColor) {
    if (node.customWidget != null) {
      return node.customWidget!;
    }

    Widget content = Text(
      node.label,
      style: TextStyle(
        fontSize: _effectiveConfig.fontSize,
        fontWeight: _effectiveConfig.fontWeight,
        color: textColor,
        height: _effectiveConfig.lineHeight,
      ),
      overflow: TextOverflow.ellipsis,
    );

    if (node.tooltip != null) {
      content = Tooltip(
        message: node.tooltip!,
        child: content,
      );
    }

    return content;
  }

  Widget _buildBadge(
      BuildContext context, ColorScheme colorScheme, AppTreeNode node) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        node.badge!,
        style: TextStyle(
          fontSize: _effectiveConfig.fontSize - 2,
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context, ColorScheme colorScheme) {
    return Container(
      width: _effectiveConfig.iconSize,
      height: _effectiveConfig.iconSize,
      margin: EdgeInsets.only(left: _effectiveConfig.iconSpacing),
      child: SizedBox(
        width: _effectiveConfig.iconSize - 4,
        height: _effectiveConfig.iconSize - 4,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
        ),
      ),
    );
  }

  Widget _buildErrorIcon(BuildContext context, ColorScheme colorScheme) {
    return Container(
      width: _effectiveConfig.iconSize,
      height: _effectiveConfig.iconSize,
      margin: EdgeInsets.only(left: _effectiveConfig.iconSpacing),
      child: Icon(
        _effectiveConfig.errorIcon,
        size: _effectiveConfig.iconSize,
        color: colorScheme.error,
      ),
    );
  }

  Widget _buildChildren(
      BuildContext context, ColorScheme colorScheme, AppTreeNode node) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: node.children
          .where((child) => child.isVisible)
          .map((child) => _buildTreeNode(context, colorScheme, child))
          .toList(),
    );
  }

  Widget _buildEmptyState(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(_effectiveConfig.itemPadding * 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.folder_open,
              size: _effectiveConfig.iconSize * 2,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            SizedBox(height: _effectiveConfig.itemSpacing),
            Text(
              _effectiveConfig.emptyLabel ?? 'No items to display',
              style: TextStyle(
                fontSize: _effectiveConfig.fontSize,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(_effectiveConfig.itemPadding * 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _effectiveConfig.iconSize,
              height: _effectiveConfig.iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
            SizedBox(width: _effectiveConfig.iconSpacing * 2),
            Text(
              _effectiveConfig.loadingLabel ?? 'Loading...',
              style: TextStyle(
                fontSize: _effectiveConfig.fontSize,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context, ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Column(
          children: List.generate(
            _effectiveConfig.skeletonNodeCount,
            (index) => _buildSkeletonNode(index),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonNode(int index) {
    final depth = index % _effectiveConfig.skeletonMaxDepth;
    final width = 100.0 + (index * 30.0 % 150);

    return Container(
      height: _effectiveConfig.itemHeight,
      margin: EdgeInsets.symmetric(vertical: _effectiveConfig.itemSpacing / 2),
      padding: EdgeInsets.only(
        left:
            depth * _effectiveConfig.indentSize + _effectiveConfig.itemPadding,
        right: _effectiveConfig.itemPadding,
      ),
      child: Row(
        children: [
          Container(
            width: _effectiveConfig.iconSize,
            height: _effectiveConfig.iconSize,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(_effectiveConfig.borderRadius / 2),
              gradient: LinearGradient(
                begin: Alignment(-1 + _skeletonAnimation.value, 0),
                end: Alignment(1 + _skeletonAnimation.value, 0),
                colors: [
                  _effectiveConfig.skeletonBaseColor,
                  _effectiveConfig.skeletonHighlightColor,
                  _effectiveConfig.skeletonBaseColor,
                ],
              ),
            ),
          ),
          SizedBox(width: _effectiveConfig.iconSpacing),
          Container(
            width: width,
            height: _effectiveConfig.fontSize,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(_effectiveConfig.borderRadius / 2),
              gradient: LinearGradient(
                begin: Alignment(-1 + _skeletonAnimation.value, 0),
                end: Alignment(1 + _skeletonAnimation.value, 0),
                colors: [
                  _effectiveConfig.skeletonBaseColor,
                  _effectiveConfig.skeletonHighlightColor,
                  _effectiveConfig.skeletonBaseColor,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  KeyEventResult _handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    final flattenedNodes = AppOutlineTreeUtils.flattenTree(_currentNodes);
    if (flattenedNodes.isEmpty) return KeyEventResult.ignored;

    final currentIndex = _focusedNodeId != null
        ? flattenedNodes.indexWhere((n) => n.id == _focusedNodeId)
        : -1;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowDown:
        _moveFocus(flattenedNodes, currentIndex + 1);
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowUp:
        _moveFocus(flattenedNodes, currentIndex - 1);
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowRight:
        if (currentIndex >= 0) {
          final node = flattenedNodes[currentIndex];
          if (node.canExpand && !node.isExpanded) {
            _handleNodeToggle(node);
          }
        }
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowLeft:
        if (currentIndex >= 0) {
          final node = flattenedNodes[currentIndex];
          if (node.isExpanded) {
            _handleNodeToggle(node);
          }
        }
        return KeyEventResult.handled;

      case LogicalKeyboardKey.space:
        if (currentIndex >= 0) {
          _handleNodeSelect(flattenedNodes[currentIndex]);
        }
        return KeyEventResult.handled;

      case LogicalKeyboardKey.enter:
        if (currentIndex >= 0) {
          _handleNodeToggle(flattenedNodes[currentIndex]);
        }
        return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _moveFocus(List<AppTreeNode> nodes, int newIndex) {
    if (newIndex < 0 || newIndex >= nodes.length) return;

    setState(() {
      _focusedNodeId = nodes[newIndex].id;
    });

    // Scroll to focused item if needed
    // This is a simplified implementation
    _focusNode.requestFocus();
  }
}
