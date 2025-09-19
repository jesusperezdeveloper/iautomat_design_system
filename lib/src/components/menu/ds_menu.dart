import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Enums para las variantes y estados del menú
enum MenuVariant {
  context,
  submenu,
  typeahead,
}

enum DSMenuState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum MenuAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
}

/// Item de menú simplificado para evitar dependencias de freezed
class DSMenuItem {
  const DSMenuItem({
    required this.id,
    required this.label,
    this.icon,
    this.trailingIcon,
    this.enabled = true,
    this.selected = false,
    this.showDividerBefore = false,
    this.children = const [],
    this.data,
    this.tooltip,
    this.shortcut,
    this.color,
    this.destructive = false,
  });

  final String id;
  final String label;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool enabled;
  final bool selected;
  final bool showDividerBefore;
  final List<DSMenuItem> children;
  final Object? data;
  final String? tooltip;
  final String? shortcut;
  final Color? color;
  final bool destructive;

  bool get hasChildren => children.isNotEmpty;
}

/// Widget principal del menú
class DSMenu extends StatefulWidget {
  /// Constructor para variante context
  const DSMenu.context({
    super.key,
    required this.items,
    required this.onSelected,
    this.anchor,
    this.alignment = MenuAlignment.bottomLeft,
    this.state = DSMenuState.defaultState,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.hoverColor,
    this.focusColor,
    this.pressedColor,
    this.selectedColor,
    this.disabledColor,
    this.elevation = 8.0,
    this.borderRadius = 8.0,
    this.minWidth = 200.0,
    this.maxWidth = 300.0,
    this.maxHeight = 400.0,
    this.itemHeight = 48.0,
    this.onStateChanged,
    this.onVisibilityChanged,
    this.dismissOnTap = true,
    this.dismissOnSelect = true,
    this.enableKeyboardNavigation = true,
    this.semanticsLabel,
  })  : variant = MenuVariant.context,
        enableSearch = false,
        searchPlaceholder = '',
        onSearchChanged = null,
        searchDelay = Duration.zero;

  /// Constructor para variante submenu
  const DSMenu.submenu({
    super.key,
    required this.items,
    required this.onSelected,
    this.anchor,
    this.alignment = MenuAlignment.topRight,
    this.state = DSMenuState.defaultState,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.hoverColor,
    this.focusColor,
    this.pressedColor,
    this.selectedColor,
    this.disabledColor,
    this.elevation = 4.0,
    this.borderRadius = 8.0,
    this.minWidth = 150.0,
    this.maxWidth = 250.0,
    this.maxHeight = 300.0,
    this.itemHeight = 40.0,
    this.onStateChanged,
    this.onVisibilityChanged,
    this.dismissOnTap = true,
    this.dismissOnSelect = true,
    this.enableKeyboardNavigation = true,
    this.semanticsLabel,
  })  : variant = MenuVariant.submenu,
        enableSearch = false,
        searchPlaceholder = '',
        onSearchChanged = null,
        searchDelay = Duration.zero;

  /// Constructor para variante typeahead
  const DSMenu.typeahead({
    super.key,
    required this.items,
    required this.onSelected,
    this.anchor,
    this.alignment = MenuAlignment.bottomLeft,
    this.state = DSMenuState.defaultState,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.hoverColor,
    this.focusColor,
    this.pressedColor,
    this.selectedColor,
    this.disabledColor,
    this.elevation = 8.0,
    this.borderRadius = 8.0,
    this.minWidth = 250.0,
    this.maxWidth = 400.0,
    this.maxHeight = 300.0,
    this.itemHeight = 48.0,
    this.enableSearch = true,
    this.searchPlaceholder = 'Buscar...',
    this.onSearchChanged,
    this.searchDelay = const Duration(milliseconds: 300),
    this.onStateChanged,
    this.onVisibilityChanged,
    this.dismissOnTap = true,
    this.dismissOnSelect = true,
    this.enableKeyboardNavigation = true,
    this.semanticsLabel,
  }) : variant = MenuVariant.typeahead;

  final MenuVariant variant;
  final List<DSMenuItem> items;
  final void Function(DSMenuItem item) onSelected;
  final Widget? anchor;
  final MenuAlignment alignment;
  final DSMenuState state;

  // Design tokens - Colors
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? pressedColor;
  final Color? selectedColor;
  final Color? disabledColor;

  // Design tokens - Layout
  final double elevation;
  final double borderRadius;
  final double minWidth;
  final double maxWidth;
  final double maxHeight;
  final double itemHeight;

  // Búsqueda (typeahead)
  final bool enableSearch;
  final String searchPlaceholder;
  final void Function(String query)? onSearchChanged;
  final Duration searchDelay;

  // Callbacks
  final void Function(DSMenuState state)? onStateChanged;
  final void Function(bool visible)? onVisibilityChanged;

  // Comportamiento
  final bool dismissOnTap;
  final bool dismissOnSelect;
  final bool enableKeyboardNavigation;

  // Accesibilidad
  final String? semanticsLabel;

  @override
  State<DSMenu> createState() => _DSMenuState();

  /// Muestra el menú como overlay
  static OverlayEntry showMenu({
    required BuildContext context,
    required DSMenu menu,
    Offset? position,
    Rect? anchorRect,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _MenuOverlay(
        menu: menu,
        position: position,
        anchorRect: anchorRect,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
    return entry;
  }
}

class _DSMenuState extends State<DSMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  String _searchQuery = '';
  List<DSMenuItem> _filteredItems = [];
  int _focusedIndex = -1;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _filteredItems = widget.items;
    _searchController.addListener(_onSearchChanged);

    if (widget.onVisibilityChanged != null) {
      widget.onVisibilityChanged!(true);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    if (query == _searchQuery) return;

    setState(() {
      _searchQuery = query;
      _filteredItems = _filterItems(widget.items, query);
      _focusedIndex = -1;
    });

    widget.onSearchChanged?.call(query);
  }

  List<DSMenuItem> _filterItems(List<DSMenuItem> items, String query) {
    if (query.isEmpty) return items;

    return items.where((item) {
      final matchesLabel = item.label.toLowerCase().contains(query.toLowerCase());
      final hasMatchingChildren = item.children.any((child) =>
          child.label.toLowerCase().contains(query.toLowerCase()));
      return matchesLabel || hasMatchingChildren;
    }).toList();
  }

  void _handleItemSelection(DSMenuItem item) {
    if (!item.enabled) return;

    if (widget.dismissOnSelect) {
      _animationController.reverse().then((_) {
        widget.onSelected(item);
        if (widget.onVisibilityChanged != null) {
          widget.onVisibilityChanged!(false);
        }
      });
    } else {
      widget.onSelected(item);
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (!widget.enableKeyboardNavigation) return;
    if (event is! KeyDownEvent) return;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowDown:
        _moveFocus(1);
        break;
      case LogicalKeyboardKey.arrowUp:
        _moveFocus(-1);
        break;
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        if (_focusedIndex >= 0 && _focusedIndex < _filteredItems.length) {
          _handleItemSelection(_filteredItems[_focusedIndex]);
        }
        break;
      case LogicalKeyboardKey.escape:
        _animationController.reverse();
        break;
    }
  }

  void _moveFocus(int direction) {
    setState(() {
      _focusedIndex = (_focusedIndex + direction).clamp(-1, _filteredItems.length - 1);
      if (_focusedIndex >= 0) {
        _scrollToItem(_focusedIndex);
      }
    });
  }

  void _scrollToItem(int index) {
    const itemHeight = 48.0;
    final scrollOffset = index * itemHeight;
    _scrollController.animateTo(
      scrollOffset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: _buildMenu(context),
          ),
        );
      },
    );
  }

  Widget _buildMenu(BuildContext context) {
    final theme = Theme.of(context);

    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: _handleKeyEvent,
      child: Container(
        constraints: BoxConstraints(
          minWidth: widget.minWidth,
          maxWidth: widget.maxWidth,
          maxHeight: widget.maxHeight,
        ),
        decoration: BoxDecoration(
          color: _getBackgroundColor(theme.colorScheme),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: widget.elevation,
              offset: Offset(0, widget.elevation / 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.enableSearch) _buildSearchField(theme),
              Flexible(
                child: _buildMenuItems(theme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        decoration: InputDecoration(
          hintText: widget.searchPlaceholder,
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: _getIconColor(theme.colorScheme),
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
        style: TextStyle(
          color: _getTextColor(theme.colorScheme),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildMenuItems(ThemeData theme) {
    if (widget.state == DSMenuState.loading) {
      return _buildLoadingState();
    }

    if (widget.state == DSMenuState.skeleton) {
      return _buildSkeletonState();
    }

    if (_filteredItems.isEmpty) {
      return _buildEmptyState(theme);
    }

    return Scrollbar(
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 4),
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          final item = _filteredItems[index];
          return _buildMenuItem(theme, item, index);
        },
      ),
    );
  }

  Widget _buildMenuItem(ThemeData theme, DSMenuItem item, int index) {
    final isFocused = index == _focusedIndex;
    final isSelected = item.selected;
    final isDisabled = !item.enabled || widget.state == DSMenuState.disabled;

    return Column(
      children: [
        if (item.showDividerBefore)
          Divider(
            height: 1,
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        Semantics(
          label: item.tooltip ?? item.label,
          enabled: item.enabled,
          selected: item.selected,
          child: InkWell(
            onTap: isDisabled ? null : () => _handleItemSelection(item),
            onHover: (hovering) {
              if (hovering && !isDisabled) {
                setState(() => _focusedIndex = index);
                widget.onStateChanged?.call(DSMenuState.hover);
              }
            },
            onFocusChange: (focused) {
              if (focused && !isDisabled) {
                setState(() => _focusedIndex = index);
                widget.onStateChanged?.call(DSMenuState.focus);
              }
            },
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: widget.itemHeight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _getItemBackgroundColor(theme.colorScheme, isFocused, isSelected, isDisabled),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    Icon(
                      item.icon,
                      size: 20,
                      color: _getItemIconColor(theme.colorScheme, item, isDisabled),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      item.label,
                      style: TextStyle(
                        color: _getItemTextColor(theme.colorScheme, item, isDisabled),
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (item.shortcut != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      item.shortcut!,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                  if (item.trailingIcon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      item.trailingIcon,
                      size: 16,
                      color: _getIconColor(theme.colorScheme).withValues(alpha: 0.7),
                    ),
                  ],
                  if (item.hasChildren) ...[
                    const SizedBox(width: 8),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: _getIconColor(theme.colorScheme).withValues(alpha: 0.7),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(24),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildSkeletonState() {
    return Column(
      children: List.generate(5, (index) =>
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          'No se encontraron elementos',
          style: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // Theme helpers
  Color _getBackgroundColor(ColorScheme colorScheme) {
    return widget.backgroundColor ?? colorScheme.surface;
  }

  Color _getTextColor(ColorScheme colorScheme) {
    return widget.textColor ?? colorScheme.onSurface;
  }

  Color _getIconColor(ColorScheme colorScheme) {
    return widget.iconColor ?? colorScheme.onSurface.withValues(alpha: 0.7);
  }

  Color? _getItemBackgroundColor(ColorScheme colorScheme, bool isFocused, bool isSelected, bool isDisabled) {
    if (isDisabled) return null;
    if (isSelected) return widget.selectedColor ?? colorScheme.primary.withValues(alpha: 0.1);
    if (isFocused) return widget.hoverColor ?? colorScheme.onSurface.withValues(alpha: 0.08);
    return null;
  }

  Color _getItemTextColor(ColorScheme colorScheme, DSMenuItem item, bool isDisabled) {
    if (isDisabled) return widget.disabledColor ?? colorScheme.onSurface.withValues(alpha: 0.38);
    if (item.destructive) return colorScheme.error;
    if (item.color != null) return item.color!;
    return widget.textColor ?? colorScheme.onSurface;
  }

  Color _getItemIconColor(ColorScheme colorScheme, DSMenuItem item, bool isDisabled) {
    if (isDisabled) return widget.disabledColor ?? colorScheme.onSurface.withValues(alpha: 0.38);
    if (item.destructive) return colorScheme.error;
    if (item.color != null) return item.color!;
    return widget.iconColor ?? colorScheme.onSurface.withValues(alpha: 0.7);
  }
}

/// Overlay para mostrar el menú flotante
class _MenuOverlay extends StatelessWidget {
  const _MenuOverlay({
    required this.menu,
    this.position,
    this.anchorRect,
    this.onDismiss,
  });

  final DSMenu menu;
  final Offset? position;
  final Rect? anchorRect;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop para cerrar el menú
        if (menu.dismissOnTap)
          Positioned.fill(
            child: GestureDetector(
              onTap: onDismiss,
              child: Container(color: Colors.transparent),
            ),
          ),
        // Menú posicionado
        _buildPositionedMenu(context),
      ],
    );
  }

  Widget _buildPositionedMenu(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final offset = _calculatePosition(screenSize);

    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: menu,
    );
  }

  Offset _calculatePosition(Size screenSize) {
    if (position != null) return position!;
    if (anchorRect == null) return Offset.zero;

    final rect = anchorRect!;

    switch (menu.alignment) {
      case MenuAlignment.topLeft:
        return Offset(rect.left, rect.top - 8);
      case MenuAlignment.topRight:
        return Offset(rect.right - menu.minWidth, rect.top - 8);
      case MenuAlignment.bottomLeft:
        return Offset(rect.left, rect.bottom + 8);
      case MenuAlignment.bottomRight:
        return Offset(rect.right - menu.minWidth, rect.bottom + 8);
      case MenuAlignment.center:
        return Offset(
          rect.center.dx - menu.minWidth / 2,
          rect.center.dy,
        );
    }
  }
}