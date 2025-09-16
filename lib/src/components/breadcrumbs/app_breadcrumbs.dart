import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_breadcrumbs_config.dart';

class AppBreadcrumbs extends StatefulWidget {
  final AppBreadcrumbsConfig config;
  final List<AppBreadcrumbItem>? items;
  final ValueChanged<AppBreadcrumbItem>? onTap;
  final AppBreadcrumbSeparator? separator;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;

  const AppBreadcrumbs({
    super.key,
    this.config = const AppBreadcrumbsConfig(),
    this.items,
    this.onTap,
    this.separator,
    this.padding,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
  });

  @override
  State<AppBreadcrumbs> createState() => _AppBreadcrumbsState();
}

class _AppBreadcrumbsState extends State<AppBreadcrumbs>
    with TickerProviderStateMixin {
  late AnimationController _stateAnimationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _stateAnimationController = AnimationController(
      duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
      vsync: this,
    );



    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stateAnimationController,
      curve: widget.config.animation?.curve ?? Curves.easeInOut,
    ));


    _stateAnimationController.forward();
  }

  @override
  void didUpdateWidget(AppBreadcrumbs oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config.state != oldWidget.config.state) {
      _updateStateAnimation();
    }
  }

  void _updateStateAnimation() {
    switch (widget.config.state) {
      case AppBreadcrumbsState.loading:
      case AppBreadcrumbsState.skeleton:
        _stateAnimationController.repeat(reverse: true);
        break;
      case AppBreadcrumbsState.disabled:
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl = widget.config.isRtl || Directionality.of(context) == TextDirection.rtl;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Semantics(
        label: widget.config.enableA11y ? 'Breadcrumb navigation' : null,
        container: widget.config.enableA11y,
        explicitChildNodes: widget.config.enableA11y,
        child: AnimatedBuilder(
          animation: _stateAnimationController,
          builder: (context, child) {
            return AnimatedOpacity(
              opacity: widget.config.state.opacity,
              duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
              child: AnimatedScale(
                scale: _scaleAnimation.value,
                duration: Duration(milliseconds: widget.config.animation?.duration ?? 300),
                child: _buildBreadcrumbsContent(theme, isRtl),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBreadcrumbsContent(ThemeData theme, bool isRtl) {
    if (widget.config.state.showsLoader) {
      return _buildLoadingState(theme);
    }

    if (widget.config.state.showsSkeleton) {
      return _buildSkeletonState(theme);
    }

    return _buildBreadcrumbsVariant(theme, isRtl);
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Container(
      height: widget.height ?? widget.config.spacing?.minHeight ?? 48.0,
      padding: widget.padding ?? EdgeInsets.all(widget.config.spacing?.containerPadding ?? 16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 8),
          Text('Cargando navegación...'),
        ],
      ),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    return Container(
      height: widget.height ?? widget.config.spacing?.minHeight ?? 48.0,
      padding: widget.padding ?? EdgeInsets.all(widget.config.spacing?.containerPadding ?? 16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.grey[300], size: 16),
          const SizedBox(width: 8),
          Container(
            width: 80,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.grey[300], size: 16),
          const SizedBox(width: 8),
          Container(
            width: 100,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbsVariant(ThemeData theme, bool isRtl) {
    final items = _getItems();
    if (items.isEmpty) return const SizedBox.shrink();

    switch (widget.config.variant) {
      case AppBreadcrumbsVariant.defaultVariant:
        return _buildDefaultBreadcrumbs(items, theme, isRtl);
      case AppBreadcrumbsVariant.collapsing:
        return _buildCollapsingBreadcrumbs(items, theme, isRtl);
    }
  }

  Widget _buildDefaultBreadcrumbs(List<AppBreadcrumbItem> items, ThemeData theme, bool isRtl) {
    return Container(
      height: widget.height ?? widget.config.spacing?.minHeight ?? 48.0,
      padding: widget.padding ?? EdgeInsets.all(widget.config.spacing?.containerPadding ?? 16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: widget.config.colors?.borderColor != null
            ? Border.all(color: widget.config.colors!.borderColor!)
            : null,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _buildBreadcrumbItems(items, theme, isRtl),
        ),
      ),
    );
  }

  Widget _buildCollapsingBreadcrumbs(List<AppBreadcrumbItem> items, ThemeData theme, bool isRtl) {
    final maxVisible = widget.config.maxVisibleItems;
    final shouldCollapse = items.length > maxVisible;

    List<Widget> breadcrumbWidgets = [];

    if (shouldCollapse) {
      // Mostrar primer elemento
      if (items.isNotEmpty) {
        breadcrumbWidgets.add(_buildBreadcrumbItem(items.first, 0, theme, isRtl, false));
        breadcrumbWidgets.add(_buildSeparator(theme));
      }

      // Mostrar indicador de colapso
      if (widget.config.behavior?.collapseMode.showsCollapsedIndicator ?? true) {
        breadcrumbWidgets.add(_buildCollapseIndicator(items, theme));
        breadcrumbWidgets.add(_buildSeparator(theme));
      }

      // Mostrar últimos elementos
      final remainingItems = items.length > 2 ? items.sublist(items.length - (maxVisible - 1)) : items.sublist(1);
      for (int i = 0; i < remainingItems.length; i++) {
        final item = remainingItems[i];
        final originalIndex = items.indexOf(item);
        final isLast = i == remainingItems.length - 1;

        breadcrumbWidgets.add(_buildBreadcrumbItem(item, originalIndex, theme, isRtl, isLast));

        if (!isLast) {
          breadcrumbWidgets.add(_buildSeparator(theme));
        }
      }
    } else {
      breadcrumbWidgets = _buildBreadcrumbItems(items, theme, isRtl);
    }

    return Container(
      height: widget.height ?? widget.config.spacing?.minHeight ?? 48.0,
      padding: widget.padding ?? EdgeInsets.all(widget.config.spacing?.containerPadding ?? 16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: widget.config.colors?.borderColor != null
            ? Border.all(color: widget.config.colors!.borderColor!)
            : null,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: breadcrumbWidgets),
      ),
    );
  }

  List<Widget> _buildBreadcrumbItems(List<AppBreadcrumbItem> items, ThemeData theme, bool isRtl) {
    List<Widget> widgets = [];

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final isLast = i == items.length - 1;

      widgets.add(_buildBreadcrumbItem(item, i, theme, isRtl, isLast));

      if (!isLast) {
        widgets.add(_buildSeparator(theme));
      }
    }

    return widgets;
  }

  Widget _buildBreadcrumbItem(AppBreadcrumbItem item, int index, ThemeData theme, bool isRtl, bool isLast) {
    final isClickable = !isLast && widget.config.state.isInteractive && !item.disabled;

    Widget content = _buildItemContent(item, theme, isLast);

    if (isClickable) {
      content = InkWell(
        onTap: () => _handleItemTap(item),
        onHover: widget.config.behavior?.enableHapticFeedback ?? true ? (hovering) {
          if (hovering) {
            HapticFeedback.selectionClick();
          }
        } : null,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: EdgeInsets.all(widget.config.spacing?.itemPadding ?? 8.0),
          child: content,
        ),
      );
    } else {
      content = Padding(
        padding: EdgeInsets.all(widget.config.spacing?.itemPadding ?? 8.0),
        child: content,
      );
    }

    return Semantics(
      label: widget.config.enableA11y ? _buildSemanticLabel(item, index, isLast) : null,
      button: widget.config.enableA11y && isClickable,
      child: Tooltip(
        message: (widget.config.behavior?.showTooltips ?? true) ? item.tooltip ?? item.title : '',
        child: content,
      ),
    );
  }

  Widget _buildItemContent(AppBreadcrumbItem item, ThemeData theme, bool isLast) {
    switch (item.type) {
      case AppBreadcrumbType.text:
        return Text(
          item.title,
          style: _getTextStyle(theme, isLast),
          overflow: widget.config.typography?.overflow ?? TextOverflow.ellipsis,
          maxLines: widget.config.typography?.maxLines ?? 1,
        );
      case AppBreadcrumbType.icon:
        return item.icon ?? Icon(
          Icons.folder,
          size: 16,
          color: _getTextColor(theme, isLast),
        );
      case AppBreadcrumbType.textWithIcon:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.icon != null) ...[
              item.icon!,
              SizedBox(width: widget.config.spacing?.iconSpacing ?? 4.0),
            ],
            Flexible(
              child: Text(
                item.title,
                style: _getTextStyle(theme, isLast),
                overflow: widget.config.typography?.overflow ?? TextOverflow.ellipsis,
                maxLines: widget.config.typography?.maxLines ?? 1,
              ),
            ),
          ],
        );
      case AppBreadcrumbType.custom:
        return item.icon ?? Text(item.title);
    }
  }

  Widget _buildSeparator(ThemeData theme) {
    final separator = widget.separator ?? widget.config.separator ?? const AppBreadcrumbSeparator();

    Widget separatorWidget;

    switch (separator.type) {
      case AppBreadcrumbSeparatorType.custom:
        separatorWidget = separator.custom ?? Text(
          separator.text ?? '>',
          style: TextStyle(
            color: separator.color ?? _getSeparatorColor(theme),
            fontSize: separator.size,
          ),
        );
        break;
      default:
        if (separator.text?.isNotEmpty == true) {
          separatorWidget = Text(
            separator.text!,
            style: TextStyle(
              color: separator.color ?? _getSeparatorColor(theme),
              fontSize: separator.size,
            ),
          );
        } else {
          separatorWidget = Icon(
            separator.icon ?? separator.type.defaultIcon,
            size: separator.size,
            color: separator.color ?? _getSeparatorColor(theme),
          );
        }
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.config.spacing?.separatorSpacing ?? 4.0,
      ),
      child: separatorWidget,
    );
  }

  Widget _buildCollapseIndicator(List<AppBreadcrumbItem> items, ThemeData theme) {
    final mode = widget.config.behavior?.collapseMode ?? AppBreadcrumbsCollapseMode.ellipsis;

    switch (mode) {
      case AppBreadcrumbsCollapseMode.ellipsis:
        return Padding(
          padding: EdgeInsets.all(widget.config.spacing?.itemPadding ?? 8.0),
          child: Text(
            '...',
            style: _getTextStyle(theme, false),
          ),
        );
      case AppBreadcrumbsCollapseMode.dropdown:
        return PopupMenuButton<AppBreadcrumbItem>(
          icon: Icon(
            Icons.more_horiz,
            color: _getTextColor(theme, false),
            size: 16,
          ),
          itemBuilder: (context) {
            final hiddenItems = _getHiddenItems(items);
            return hiddenItems.map((item) => PopupMenuItem<AppBreadcrumbItem>(
              value: item,
              child: Text(item.title),
            )).toList();
          },
          onSelected: _handleItemTap,
        );
      case AppBreadcrumbsCollapseMode.hidden:
        return const SizedBox.shrink();
    }
  }

  List<AppBreadcrumbItem> _getHiddenItems(List<AppBreadcrumbItem> items) {
    final maxVisible = widget.config.maxVisibleItems;
    if (items.length <= maxVisible) return [];

    return items.sublist(1, items.length - (maxVisible - 1));
  }

  void _handleItemTap(AppBreadcrumbItem item) {
    if (!widget.config.state.isInteractive || item.disabled) return;

    if (widget.config.behavior?.enableHapticFeedback ?? true) {
      HapticFeedback.selectionClick();
    }

    widget.onTap?.call(item);
    widget.config.onTap?.call(item);
    item.onTap?.call();
  }

  String _buildSemanticLabel(AppBreadcrumbItem item, int index, bool isLast) {
    if (isLast) {
      return 'Current page: ${item.title}';
    } else {
      return 'Navigate to ${item.title}, level ${index + 1}';
    }
  }

  List<AppBreadcrumbItem> _getItems() {
    final items = widget.items ?? widget.config.items;

    if (widget.config.showHome && items.isNotEmpty && items.first.id != 'home') {
      return [
        const AppBreadcrumbItem(
          id: 'home',
          title: 'Inicio',
          icon: Icon(Icons.home, size: 16),
          type: AppBreadcrumbType.icon,
        ),
        ...items,
      ];
    }

    return items;
  }

  // Color getters
  Color? _getBackgroundColor(ThemeData theme) {
    return widget.backgroundColor ??
           widget.config.colors?.backgroundColor ??
           theme.scaffoldBackgroundColor;
  }

  Color? _getTextColor(ThemeData theme, bool isLast) {
    if (isLast) {
      return widget.config.colors?.selectedTextColor ??
             theme.colorScheme.primary;
    } else {
      return widget.textColor ??
             widget.config.colors?.textColor ??
             theme.colorScheme.onSurface;
    }
  }

  Color? _getSeparatorColor(ThemeData theme) {
    return widget.config.colors?.separatorColor ??
           theme.colorScheme.onSurfaceVariant;
  }

  // Typography getters
  TextStyle? _getTextStyle(ThemeData theme, bool isLast) {
    final baseStyle = widget.textStyle ??
                     widget.config.typography?.textStyle ??
                     theme.textTheme.bodyMedium;

    if (isLast) {
      return widget.config.typography?.selectedTextStyle ??
             baseStyle?.copyWith(
               color: _getTextColor(theme, isLast),
               fontWeight: FontWeight.w600,
             );
    } else {
      return baseStyle?.copyWith(
        color: _getTextColor(theme, isLast),
      );
    }
  }
}