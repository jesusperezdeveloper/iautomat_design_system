import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outline_tree_config.freezed.dart';

/// Outline tree variant types
enum DSOutlineTreeVariant {
  /// Async tree with lazy loading of children
  async,

  /// Multi-select tree allowing multiple node selections
  multiSelect,
}

/// Outline tree state types
enum DSOutlineTreeState {
  /// Default state
  defaultState,

  /// Hover state
  hover,

  /// Pressed state
  pressed,

  /// Focus state
  focus,

  /// Selected state
  selected,

  /// Disabled state
  disabled,

  /// Loading state
  loading,

  /// Skeleton loading state
  skeleton,
}

/// Tree node state
enum DSTreeNodeState {
  /// Node is collapsed
  collapsed,

  /// Node is expanded
  expanded,

  /// Node is loading children
  loading,

  /// Node is in error state
  error,

  /// Node is disabled
  disabled,
}

/// Selection mode for multi-select trees
enum DSTreeSelectionMode {
  /// Single selection only
  single,

  /// Multiple selection allowed
  multiple,

  /// Hierarchical selection (selecting parent selects all children)
  hierarchical,
}

/// Tree layout orientation
enum DSTreeLayout {
  /// Vertical layout (default)
  vertical,

  /// Horizontal layout
  horizontal,
}

/// Expansion animation types
enum DSTreeExpansionAnimation {
  /// No animation
  none,

  /// Fade animation
  fade,

  /// Slide animation
  slide,

  /// Scale animation
  scale,

  /// Custom animation
  custom,
}

/// Configuration model for DSOutlineTree
@freezed
class DSOutlineTreeConfig with _$DSOutlineTreeConfig {
  const factory DSOutlineTreeConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(DSTreeExpansionAnimation.slide)
    DSTreeExpansionAnimation expansionAnimation,

    // Layout and spacing
    @Default(DSTreeLayout.vertical) DSTreeLayout layout,
    @Default(16.0) double indentSize,
    @Default(8.0) double itemSpacing,
    @Default(4.0) double itemPadding,
    @Default(32.0) double itemHeight,
    @Default(2.0) double borderWidth,
    @Default(8.0) double borderRadius,

    // Typography
    @Default(14.0) double fontSize,
    @Default(FontWeight.w400) FontWeight fontWeight,
    @Default(1.4) double lineHeight,

    // Icon configuration
    @Default(20.0) double iconSize,
    @Default(4.0) double iconSpacing,
    @Default(Icons.keyboard_arrow_right) IconData expandIcon,
    @Default(Icons.keyboard_arrow_down) IconData collapseIcon,
    @Default(Icons.circle_outlined) IconData uncheckedIcon,
    @Default(Icons.check_circle) IconData checkedIcon,
    @Default(Icons.radio_button_unchecked) IconData radioUncheckedIcon,
    @Default(Icons.radio_button_checked) IconData radioCheckedIcon,
    @Default(Icons.folder) IconData folderIcon,
    @Default(Icons.folder_open) IconData folderOpenIcon,
    @Default(Icons.insert_drive_file) IconData fileIcon,
    @Default(Icons.refresh) IconData loadingIcon,
    @Default(Icons.error) IconData errorIcon,

    // Selection configuration
    @Default(DSTreeSelectionMode.single) DSTreeSelectionMode selectionMode,
    @Default(true) bool showSelectionCheckboxes,
    @Default(true) bool allowPartialSelection,
    @Default(false) bool autoExpandSelected,
    @Default(false) bool autoCollapseOthers,

    // Behavior configuration
    @Default(true) bool enableExpansion,
    @Default(true) bool enableSelection,
    @Default(true) bool enableHover,
    @Default(true) bool enableRipple,
    @Default(true) bool showIcons,
    @Default(true) bool showConnectors,
    @Default(true) bool showRootExpander,
    @Default(false) bool initiallyExpanded,
    @Default(3) int maxExpandDepth,

    // Loading configuration
    @Default(true) bool showLoadingIndicator,
    @Default(true) bool showRetryButton,
    @Default(3) int maxRetryAttempts,
    @Default(Duration(seconds: 30)) Duration loadTimeout,

    // Colors (will be overridden by theme if null)
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? hoverBackgroundColor,
    Color? focusBackgroundColor,
    Color? disabledBackgroundColor,
    Color? borderColor,
    Color? selectedBorderColor,
    Color? focusBorderColor,
    Color? disabledBorderColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? hoverTextColor,
    Color? focusTextColor,
    Color? disabledTextColor,
    Color? iconColor,
    Color? selectedIconColor,
    Color? hoverIconColor,
    Color? disabledIconColor,
    Color? connectorColor,
    Color? selectionColor,

    // Interaction configuration
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,
    @Default(true) bool enableKeyboardNavigation,

    // Accessibility configuration
    @Default(true) bool enableAccessibility,
    @Default(true) bool enableSemantics,
    String? semanticLabel,
    String? semanticHint,

    // Platform specific configuration
    @Default(true) bool adaptToTheme,
    @Default(true) bool adaptToPlatform,

    // Loading and skeleton configuration
    @Default(Color(0xFFE0E0E0)) Color skeletonBaseColor,
    @Default(Color(0xFFF5F5F5)) Color skeletonHighlightColor,
    @Default(Duration(milliseconds: 1500)) Duration skeletonAnimationDuration,
    @Default(5) int skeletonNodeCount,
    @Default(3) int skeletonMaxDepth,

    // RTL support
    @Default(true) bool enableRTL,
    @Default(TextDirection.ltr) TextDirection textDirection,

    // Custom labels
    String? loadingLabel,
    String? errorLabel,
    String? retryLabel,
    String? emptyLabel,

    // Custom constraints
    BoxConstraints? constraints,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) = _DSOutlineTreeConfig;

  /// Default configuration for compact trees
  static const DSOutlineTreeConfig compact = DSOutlineTreeConfig(
    itemHeight: 24.0,
    indentSize: 12.0,
    itemSpacing: 2.0,
    fontSize: 12.0,
    iconSize: 16.0,
  );

  /// Default configuration for spacious trees
  static const DSOutlineTreeConfig spacious = DSOutlineTreeConfig(
    itemHeight: 48.0,
    indentSize: 24.0,
    itemSpacing: 12.0,
    fontSize: 16.0,
    iconSize: 24.0,
  );
}

/// Tree node data model
@freezed
class DSTreeNode with _$DSTreeNode {
  const DSTreeNode._();

  const factory DSTreeNode({
    /// Unique identifier for the node
    required String id,

    /// Display label for the node
    required String label,

    /// Icon for the node
    IconData? icon,

    /// Custom color for the node
    Color? color,

    /// Child nodes
    @Default([]) List<DSTreeNode> children,

    /// Whether the node is expanded
    @Default(false) bool isExpanded,

    /// Whether the node is selected
    @Default(false) bool isSelected,

    /// Whether the node is disabled
    @Default(false) bool isDisabled,

    /// Whether the node is visible
    @Default(true) bool isVisible,

    /// Current state of the node
    @Default(DSTreeNodeState.collapsed) DSTreeNodeState state,

    /// Whether the node is a leaf (no children possible)
    @Default(false) bool isLeaf,

    /// Whether the node has loadable children (for async trees)
    @Default(false) bool hasChildren,

    /// Loading state for async children
    @Default(false) bool isLoading,

    /// Error message if loading failed
    String? errorMessage,

    /// Depth level in the tree (0 = root)
    @Default(0) int depth,

    /// Parent node ID
    String? parentId,

    /// Custom metadata
    Map<String, dynamic>? metadata,

    /// Custom widget to display instead of default content
    Widget? customWidget,

    /// Tooltip text
    String? tooltip,

    /// Badge text
    String? badge,

    /// Number of children (useful for async trees)
    int? childCount,

    /// Whether the node is partially selected (some children selected)
    @Default(false) bool isPartiallySelected,

    /// Custom data associated with the node
    dynamic data,
  }) = _AppTreeNode;

  /// Whether the node can be expanded
  bool get canExpand => !isLeaf && (children.isNotEmpty || hasChildren);

  /// Whether the node is expandable and not expanded
  bool get isCollapsed => canExpand && !isExpanded;

  /// Whether the node has visible children
  bool get hasVisibleChildren => children.any((child) => child.isVisible);

  /// Get all descendants of this node
  List<DSTreeNode> get allDescendants {
    final descendants = <DSTreeNode>[];
    for (final child in children) {
      descendants.add(child);
      descendants.addAll(child.allDescendants);
    }
    return descendants;
  }

  /// Get all selected descendants
  List<DSTreeNode> get selectedDescendants {
    return allDescendants.where((node) => node.isSelected).toList();
  }

  /// Get path from root to this node
  List<String> getPath() {
    final path = <String>[];
    var current = this;
    while (current.parentId != null) {
      path.insert(0, current.id);
      // In a real implementation, you'd navigate up the tree
      break; // Simplified for this example
    }
    path.insert(0, current.id);
    return path;
  }

  /// Create a copy with updated selection state
  DSTreeNode withSelection(bool selected) {
    return copyWith(isSelected: selected);
  }

  /// Create a copy with updated expansion state
  DSTreeNode withExpansion(bool expanded) {
    return copyWith(
        isExpanded: expanded,
        state:
            expanded ? DSTreeNodeState.expanded : DSTreeNodeState.collapsed);
  }

  /// Create a copy with updated children
  DSTreeNode withChildren(List<DSTreeNode> newChildren) {
    return copyWith(children: newChildren);
  }

  /// Create a copy with loading state
  DSTreeNode withLoading(bool loading) {
    return copyWith(
      isLoading: loading,
      state: loading ? DSTreeNodeState.loading : DSTreeNodeState.collapsed,
    );
  }

  /// Create a copy with error state
  DSTreeNode withError(String? error) {
    return copyWith(
      errorMessage: error,
      state:
          error != null ? DSTreeNodeState.error : DSTreeNodeState.collapsed,
      isLoading: false,
    );
  }

  /// Find a node by ID in this subtree
  DSTreeNode? findNode(String nodeId) {
    if (id == nodeId) return this;

    for (final child in children) {
      final found = child.findNode(nodeId);
      if (found != null) return found;
    }

    return null;
  }

  /// Update a node by ID in this subtree
  DSTreeNode updateNode(
      String nodeId, DSTreeNode Function(DSTreeNode) updater) {
    if (id == nodeId) {
      return updater(this);
    }

    final updatedChildren = children.map((child) {
      return child.updateNode(nodeId, updater);
    }).toList();

    return copyWith(children: updatedChildren);
  }

  /// Get selection state considering partial selection
  TreeSelectionState get selectionState {
    if (isSelected) return TreeSelectionState.selected;
    if (isPartiallySelected) return TreeSelectionState.partial;
    return TreeSelectionState.unselected;
  }
}

/// Selection state enum
enum TreeSelectionState {
  selected,
  partial,
  unselected,
}

/// Callback function types
typedef OnNodeToggle = void Function(DSTreeNode node);
typedef OnNodeSelect = void Function(DSTreeNode node, bool selected);
typedef OnNodeExpand = void Function(DSTreeNode node, bool expanded);
typedef OnAsyncLoad = Future<List<DSTreeNode>> Function(DSTreeNode node);
typedef NodeBuilder = Widget Function(
    BuildContext context, DSTreeNode node, int depth);
typedef NodeIconBuilder = Widget Function(
    BuildContext context, DSTreeNode node);

/// Tree event data
@freezed
class DSTreeEvent with _$DSTreeEvent {
  const factory DSTreeEvent.toggle({
    required DSTreeNode node,
  }) = DSTreeToggleEvent;

  const factory DSTreeEvent.select({
    required DSTreeNode node,
    required bool selected,
  }) = DSTreeSelectEvent;

  const factory DSTreeEvent.expand({
    required DSTreeNode node,
    required bool expanded,
  }) = DSTreeExpandEvent;

  const factory DSTreeEvent.load({
    required DSTreeNode node,
    required List<DSTreeNode> children,
  }) = DSTreeLoadEvent;

  const factory DSTreeEvent.error({
    required DSTreeNode node,
    required String error,
  }) = DSTreeErrorEvent;
}

/// Utility functions for DSOutlineTree
class DSOutlineTreeUtils {
  /// Flatten tree into a list for rendering
  static List<DSTreeNode> flattenTree(
    List<DSTreeNode> nodes, {
    bool showCollapsed = false,
    int maxDepth = -1,
  }) {
    final flattened = <DSTreeNode>[];

    void flatten(List<DSTreeNode> currentNodes, int depth) {
      if (maxDepth >= 0 && depth > maxDepth) return;

      for (final node in currentNodes) {
        if (!node.isVisible) continue;

        flattened.add(node.copyWith(depth: depth));

        if ((node.isExpanded || showCollapsed) && node.children.isNotEmpty) {
          flatten(node.children, depth + 1);
        }
      }
    }

    flatten(nodes, 0);
    return flattened;
  }

  /// Get selected nodes from tree
  static List<DSTreeNode> getSelectedNodes(List<DSTreeNode> nodes) {
    final selected = <DSTreeNode>[];

    void collectSelected(List<DSTreeNode> currentNodes) {
      for (final node in currentNodes) {
        if (node.isSelected) {
          selected.add(node);
        }
        collectSelected(node.children);
      }
    }

    collectSelected(nodes);
    return selected;
  }

  /// Update node selection with hierarchical logic
  static List<DSTreeNode> updateSelection(
    List<DSTreeNode> nodes,
    String nodeId,
    bool selected,
    DSTreeSelectionMode mode,
  ) {
    return nodes
        .map((node) => _updateNodeSelection(node, nodeId, selected, mode))
        .toList();
  }

  static DSTreeNode _updateNodeSelection(
    DSTreeNode node,
    String targetId,
    bool selected,
    DSTreeSelectionMode mode,
  ) {
    if (node.id == targetId) {
      var updatedNode = node.copyWith(isSelected: selected);

      if (mode == DSTreeSelectionMode.hierarchical) {
        // Update all children
        final updatedChildren = node.children.map((child) {
          return _selectAllDescendants(child, selected);
        }).toList();
        updatedNode = updatedNode.copyWith(children: updatedChildren);
      }

      return updatedNode;
    }

    // Update children
    final updatedChildren = node.children.map((child) {
      return _updateNodeSelection(child, targetId, selected, mode);
    }).toList();

    var updatedNode = node.copyWith(children: updatedChildren);

    // Update partial selection state
    if (mode == DSTreeSelectionMode.hierarchical) {
      final selectedCount = updatedChildren.where((c) => c.isSelected).length;
      final partialCount =
          updatedChildren.where((c) => c.isPartiallySelected).length;

      if (selectedCount == updatedChildren.length &&
          updatedChildren.isNotEmpty) {
        updatedNode =
            updatedNode.copyWith(isSelected: true, isPartiallySelected: false);
      } else if (selectedCount > 0 || partialCount > 0) {
        updatedNode =
            updatedNode.copyWith(isSelected: false, isPartiallySelected: true);
      } else {
        updatedNode =
            updatedNode.copyWith(isSelected: false, isPartiallySelected: false);
      }
    }

    return updatedNode;
  }

  static DSTreeNode _selectAllDescendants(DSTreeNode node, bool selected) {
    final updatedChildren = node.children.map((child) {
      return _selectAllDescendants(child, selected);
    }).toList();

    return node.copyWith(
      isSelected: selected,
      isPartiallySelected: false,
      children: updatedChildren,
    );
  }

  /// Expand path to a specific node
  static List<DSTreeNode> expandPath(
      List<DSTreeNode> nodes, List<String> path) {
    if (path.isEmpty) return nodes;

    return nodes.map((node) {
      if (path.contains(node.id)) {
        final updatedChildren = expandPath(node.children, path);
        return node.copyWith(isExpanded: true, children: updatedChildren);
      }
      return node;
    }).toList();
  }

  /// Get all expanded node IDs
  static Set<String> getExpandedNodeIds(List<DSTreeNode> nodes) {
    final expanded = <String>{};

    void collectExpanded(List<DSTreeNode> currentNodes) {
      for (final node in currentNodes) {
        if (node.isExpanded) {
          expanded.add(node.id);
        }
        collectExpanded(node.children);
      }
    }

    collectExpanded(nodes);
    return expanded;
  }

  /// Search nodes by label
  static List<DSTreeNode> searchNodes(
    List<DSTreeNode> nodes,
    String query, {
    bool caseSensitive = false,
  }) {
    final results = <DSTreeNode>[];
    final searchQuery = caseSensitive ? query : query.toLowerCase();

    void search(List<DSTreeNode> currentNodes) {
      for (final node in currentNodes) {
        final nodeLabel = caseSensitive ? node.label : node.label.toLowerCase();
        if (nodeLabel.contains(searchQuery)) {
          results.add(node);
        }
        search(node.children);
      }
    }

    search(nodes);
    return results;
  }

  /// Get keyboard shortcuts
  static Map<String, List<LogicalKeyboardKey>> getKeyboardShortcuts() {
    return {
      'expand': [LogicalKeyboardKey.arrowRight],
      'collapse': [LogicalKeyboardKey.arrowLeft],
      'next': [LogicalKeyboardKey.arrowDown],
      'previous': [LogicalKeyboardKey.arrowUp],
      'select': [LogicalKeyboardKey.space],
      'toggle': [LogicalKeyboardKey.enter],
      'selectAll': [LogicalKeyboardKey.keyA, LogicalKeyboardKey.controlLeft],
      'expandAll': [LogicalKeyboardKey.asterisk],
      'collapseAll': [LogicalKeyboardKey.slash],
    };
  }

  /// Generate semantic description for a node
  static String getNodeSemanticLabel(
      DSTreeNode node, DSOutlineTreeConfig config) {
    final parts = <String>[];

    parts.add(node.label);

    if (config.selectionMode != DSTreeSelectionMode.single) {
      if (node.isSelected) {
        parts.add('selected');
      } else if (node.isPartiallySelected) {
        parts.add('partially selected');
      }
    }

    if (node.canExpand) {
      parts.add(node.isExpanded ? 'expanded' : 'collapsed');
      if (node.children.isNotEmpty) {
        parts.add('${node.children.length} children');
      }
    }

    if (node.isDisabled) {
      parts.add('disabled');
    }

    if (node.isLoading) {
      parts.add('loading');
    }

    parts.add('level ${node.depth + 1}');

    return parts.join(', ');
  }

  /// Calculate tree statistics
  static TreeStatistics calculateStatistics(List<DSTreeNode> nodes) {
    var totalNodes = 0;
    var selectedNodes = 0;
    var expandedNodes = 0;
    var maxDepth = 0;
    var leafNodes = 0;

    void analyze(List<DSTreeNode> currentNodes, int depth) {
      for (final node in currentNodes) {
        totalNodes++;
        maxDepth = math.max(maxDepth, depth);

        if (node.isSelected) selectedNodes++;
        if (node.isExpanded) expandedNodes++;
        if (node.isLeaf || node.children.isEmpty) leafNodes++;

        analyze(node.children, depth + 1);
      }
    }

    analyze(nodes, 0);

    return TreeStatistics(
      totalNodes: totalNodes,
      selectedNodes: selectedNodes,
      expandedNodes: expandedNodes,
      maxDepth: maxDepth,
      leafNodes: leafNodes,
    );
  }
}

/// Tree statistics data class
@freezed
class TreeStatistics with _$TreeStatistics {
  const factory TreeStatistics({
    @Default(0) int totalNodes,
    @Default(0) int selectedNodes,
    @Default(0) int expandedNodes,
    @Default(0) int maxDepth,
    @Default(0) int leafNodes,
  }) = _TreeStatistics;
}
