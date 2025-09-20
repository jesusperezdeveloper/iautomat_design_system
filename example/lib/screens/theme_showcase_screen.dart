import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../providers/theme_provider.dart';
import '../widgets/theme_card.dart';
import '../widgets/theme_filter_bar.dart';
import 'theme_preview_screen.dart';

/// Pantalla principal de galería de temas del Design System
///
/// Muestra los 100 temas profesionales organizados por categorías
/// con funcionalidades de búsqueda, filtrado y navegación
class ThemeShowcaseScreen extends StatefulWidget {
  const ThemeShowcaseScreen({super.key});

  @override
  State<ThemeShowcaseScreen> createState() => _ThemeShowcaseScreenState();
}

class _ThemeShowcaseScreenState extends State<ThemeShowcaseScreen>
    with TickerProviderStateMixin {
  late final TextEditingController _searchController;
  late final AnimationController _fabAnimationController;
  late final Animation<double> _fabAnimation;

  ThemeCategory? _selectedCategory;
  List<DSThemePreset> _filteredThemes = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fabAnimation = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    );

    // Inicializar con todos los temas
    _filteredThemes = DSThemeCatalog.allThemes;
    _fabAnimationController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    final provider = context.read<DSThemeProvider>();
    provider.updateLastSearchQuery(query);

    setState(() {
      _isSearching = query.isNotEmpty;
      if (query.trim().isEmpty) {
        _filteredThemes = _selectedCategory != null
            ? DSThemeCatalog.getByCategory(_selectedCategory!)
            : DSThemeCatalog.allThemes;
      } else {
        _filteredThemes = DSThemeCatalog.search(
          query,
          categories: _selectedCategory != null ? [_selectedCategory!] : null,
        );
      }
    });
  }

  void _onCategoryChanged(ThemeCategory? category) {
    final provider = context.read<DSThemeProvider>();
    provider.updateLastFilterCategory(category);

    setState(() {
      _selectedCategory = category;
      final query = _searchController.text;

      if (query.trim().isEmpty) {
        _filteredThemes = category != null
            ? DSThemeCatalog.getByCategory(category)
            : DSThemeCatalog.allThemes;
      } else {
        _filteredThemes = DSThemeCatalog.search(
          query,
          categories: category != null ? [category] : null,
        );
      }
    });
  }

  void _onRandomTheme() {
    final provider = context.read<DSThemeProvider>();
    provider.applyRandomTheme(_selectedCategory);

    // Feedback háptico
    HapticFeedback.mediumImpact();

    // Animación del FAB
    _fabAnimationController.reset();
    _fabAnimationController.forward();
  }

  void _onThemePreview(DSThemePreset theme) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ThemePreviewScreen(theme: theme),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DSThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: _buildAppBar(context, themeProvider),
          body: _buildBody(context, themeProvider),
          floatingActionButton: _buildFloatingActionButton(context),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    DSThemeProvider themeProvider,
  ) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            context.go('/');
          }
        },
        tooltip: 'Volver',
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Theme Gallery'),
          Text(
            '${_filteredThemes.length} temas profesionales',
            style: DSTypography.caption,
          ),
        ],
      ),
      elevation: 1,
      actions: [
        IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: themeProvider.toggleDarkMode,
          tooltip: 'Cambiar modo',
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showInfoDialog(context),
          tooltip: 'Información',
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, DSThemeProvider themeProvider) {
    return Column(
      children: [
        _buildHeader(context),
        _buildSearchBar(context),
        ThemeFilterBar(
          selectedCategory: _selectedCategory,
          onCategoryChanged: _onCategoryChanged,
          themeCount: _filteredThemes.length,
        ),
        Expanded(child: _buildThemeGrid(context, themeProvider)),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: DSSpacing.pagePadding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(
              context,
            ).colorScheme.primaryContainer.withValues(alpha: 0.3),
            Theme.of(
              context,
            ).colorScheme.secondaryContainer.withValues(alpha: 0.1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Design System Gallery',
            style: DSTypography.h3.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          DSSpacing.verticalXs,
          Text(
            '100 Temas Profesionales para 2025',
            style: DSTypography.bodyMedium.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: DSSpacing.pagePadding,
      child: SearchBar(
        controller: _searchController,
        hintText: 'Buscar temas por nombre, industria o keywords...',
        leading: const Icon(Icons.search),
        trailing: _isSearching
            ? [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged('');
                  },
                ),
              ]
            : null,
        onChanged: _onSearchChanged,
        elevation: WidgetStateProperty.all(1),
      ),
    );
  }

  Widget _buildThemeGrid(BuildContext context, DSThemeProvider themeProvider) {
    if (_filteredThemes.isEmpty) {
      return _buildEmptyState(context);
    }

    // Responsive grid columns
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 800) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return GridView.builder(
      padding: DSSpacing.pagePadding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.05,
        crossAxisSpacing: DSSpacing.md,
        mainAxisSpacing: DSSpacing.md,
      ),
      itemCount: _filteredThemes.length,
      itemBuilder: (context, index) {
        final theme = _filteredThemes[index];
        final isCurrentTheme = theme.id == themeProvider.currentTheme.id;
        final isFavorite = themeProvider.isFavorite(theme);

        return ThemeCard(
          theme: theme,
          isCurrentTheme: isCurrentTheme,
          isFavorite: isFavorite,
          onApply: () => themeProvider.applyTheme(theme),
          onFavorite: () => themeProvider.toggleFavorite(theme),
          onPreview: () => _onThemePreview(theme),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          DSSpacing.verticalMd,
          Text(
            'No se encontraron temas',
            style: DSTypography.h5.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          DSSpacing.verticalSm,
          Text(
            'Intenta cambiar los filtros o términos de búsqueda',
            style: DSTypography.bodyMedium.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          DSSpacing.verticalMd,
          FilledButton.icon(
            onPressed: () {
              _searchController.clear();
              _onSearchChanged('');
              _onCategoryChanged(null);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Limpiar filtros'),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return ScaleTransition(
      scale: _fabAnimation,
      child: FloatingActionButton.extended(
        onPressed: _onRandomTheme,
        icon: const Icon(Icons.shuffle),
        label: const Text('Tema Aleatorio'),
        tooltip: 'Aplicar tema aleatorio',
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Theme Gallery'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Galería completa del Design System con 100 temas profesionales organizados en 10 categorías.',
              style: DSTypography.bodyMedium,
            ),
            DSSpacing.verticalMd,
            Text('Funcionalidades:', style: DSTypography.labelLarge),
            DSSpacing.verticalSm,
            const Text('• Búsqueda inteligente por texto'),
            const Text('• Filtrado por categorías'),
            const Text('• Sistema de favoritos'),
            const Text('• Vista previa completa'),
            const Text('• Aplicación de temas en tiempo real'),
            const Text('• Tema aleatorio'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
