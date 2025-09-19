import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Barra de filtros horizontal con chips de categorías
///
/// Permite filtrar los temas por categoría con indicadores visuales
/// del filtro activo y conteo de temas en cada categoría
class ThemeFilterBar extends StatefulWidget {
  /// Categoría actualmente seleccionada
  final ThemeCategory? selectedCategory;

  /// Callback cuando cambia la categoría seleccionada
  final ValueChanged<ThemeCategory?> onCategoryChanged;

  /// Número total de temas actualmente mostrados
  final int themeCount;

  const ThemeFilterBar({
    super.key,
    this.selectedCategory,
    required this.onCategoryChanged,
    required this.themeCount,
  });

  @override
  State<ThemeFilterBar> createState() => _ThemeFilterBarState();
}

class _ThemeFilterBarState extends State<ThemeFilterBar>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  final Map<ThemeCategory, int> _categoryStats = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _loadCategoryStats();
    _animationController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _loadCategoryStats() {
    // Obtener estadísticas de cada categoría
    for (final category in ThemeCategory.values) {
      final themes = DSThemeCatalog.getByCategory(category);
      _categoryStats[category] = themes.length;
    }
  }

  void _onCategorySelected(ThemeCategory? category) {
    HapticFeedback.selectionClick();
    widget.onCategoryChanged(category);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildChipsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.filter_list,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            'Filtrar por categoría',
            style: DSTypography.labelMedium.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${widget.themeCount} temas',
              style: DSTypography.caption.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipsList(BuildContext context) {
    return Expanded(
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // Chip "Todos"
          _buildFilterChip(
            context,
            label: 'Todos',
            icon: Icons.grid_view,
            isSelected: widget.selectedCategory == null,
            count: DSThemeCatalog.allThemes.length,
            onSelected: () => _onCategorySelected(null),
          ),
          const SizedBox(width: 8),
          // Chips de categorías
          ...ThemeCategory.values.map((category) {
            final count = _categoryStats[category] ?? 0;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildFilterChip(
                context,
                label: category.displayName,
                icon: category.icon,
                isSelected: widget.selectedCategory == category,
                count: count,
                onSelected: () => _onCategorySelected(category),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required IconData icon,
    required bool isSelected,
    required int count,
    required VoidCallback onSelected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: DSTypography.labelMedium.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (count > 0) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.2)
                      : Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  count.toString(),
                  style: DSTypography.caption.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        selected: isSelected,
        onSelected: (_) => onSelected(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: Theme.of(context).colorScheme.primary,
        checkmarkColor: Theme.of(context).colorScheme.onPrimary,
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
          width: isSelected ? 2 : 1,
        ),
        elevation: isSelected ? 4 : 1,
        shadowColor: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
            : null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.comfortable,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}

/// Widget decorativo para mostrar estadísticas de categorías
class CategoryStatsWidget extends StatelessWidget {
  /// Estadísticas por categoría
  final Map<ThemeCategory, int> stats;

  const CategoryStatsWidget({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Estadísticas por Categoría',
                  style: DSTypography.h6.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: stats.entries.map((entry) {
                return Chip(
                  avatar: Icon(entry.key.icon, size: 16),
                  label: Text('${entry.key.displayName}: ${entry.value}'),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget expandible que muestra información detallada de filtros
class FilterInfoPanel extends StatefulWidget {
  /// Categoría seleccionada
  final ThemeCategory? selectedCategory;

  /// Total de temas filtrados
  final int filteredCount;

  /// Total de temas disponibles
  final int totalCount;

  const FilterInfoPanel({
    super.key,
    this.selectedCategory,
    required this.filteredCount,
    required this.totalCount,
  });

  @override
  State<FilterInfoPanel> createState() => _FilterInfoPanelState();
}

class _FilterInfoPanelState extends State<FilterInfoPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Información de Filtros',
              style: DSTypography.labelLarge,
            ),
            subtitle: Text(
              '${widget.filteredCount} de ${widget.totalCount} temas',
              style: DSTypography.caption,
            ),
            trailing: IconButton(
              icon: AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.expand_more),
              ),
              onPressed: () {
                setState(() => _isExpanded = !_isExpanded);
              },
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.selectedCategory != null) ...[
                    Text(
                      'Categoría Activa:',
                      style: DSTypography.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    Chip(
                      avatar: Icon(widget.selectedCategory!.icon),
                      label: Text(widget.selectedCategory!.displayName),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.selectedCategory!.description,
                      style: DSTypography.caption,
                    ),
                  ] else
                    const Text('Mostrando todos los temas disponibles'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}