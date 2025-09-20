import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../providers/theme_provider.dart';

/// Pantalla de preview detallado de un tema específico
///
/// Muestra el tema aplicado temporalmente con todos sus componentes
/// y permite comparar entre modo claro y oscuro
class ThemePreviewScreen extends StatefulWidget {
  /// Tema a previsualizar
  final DSThemePreset theme;

  const ThemePreviewScreen({super.key, required this.theme});

  @override
  State<ThemePreviewScreen> createState() => _ThemePreviewScreenState();
}

class _ThemePreviewScreenState extends State<ThemePreviewScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final AnimationController _fabAnimationController;
  late final Animation<double> _fabAnimation;

  bool _isPreviewMode = false;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fabAnimation = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    );

    _fabAnimationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _togglePreviewMode() {
    setState(() => _isPreviewMode = !_isPreviewMode);
    HapticFeedback.mediumImpact();
  }

  void _toggleDarkMode() {
    setState(() => _isDarkMode = !_isDarkMode);
    HapticFeedback.selectionClick();
  }

  void _applyTheme() {
    final provider = context.read<DSThemeProvider>();
    provider.applyTheme(widget.theme);
    HapticFeedback.heavyImpact();

    // Mostrar snackbar de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tema "${widget.theme.displayName}" aplicado'),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Aplicar tema temporalmente si está en modo preview
    final previewTheme = _isPreviewMode
        ? (_isDarkMode ? widget.theme.darkTheme : widget.theme.lightTheme)
        : null;

    return Theme(
      data: previewTheme ?? Theme.of(context),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.theme.displayName),
          Text(widget.theme.category.displayName, style: DSTypography.caption),
        ],
      ),
      actions: [
        // Toggle preview mode
        IconButton(
          icon: Icon(_isPreviewMode ? Icons.visibility_off : Icons.visibility),
          onPressed: _togglePreviewMode,
          tooltip: _isPreviewMode ? 'Desactivar preview' : 'Activar preview',
        ),
        // Toggle dark mode in preview
        if (_isPreviewMode)
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleDarkMode,
            tooltip: _isDarkMode ? 'Modo claro' : 'Modo oscuro',
          ),
        // Favorite button
        Consumer<DSThemeProvider>(
          builder: (context, provider, child) {
            final isFavorite = provider.isFavorite(widget.theme);
            return IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () => provider.toggleFavorite(widget.theme),
              tooltip: isFavorite
                  ? 'Quitar de favoritos'
                  : 'Agregar a favoritos',
            );
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        //if (_isPreviewMode) _buildPreviewBanner(),
        _buildThemeInfo(),
        _buildTabBar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildColorsTab(),
              _buildTypographyTab(),
              _buildComponentsTab(),
              _buildDetailsTab(),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildThemeInfo() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.theme.lightColorScheme.primary,
                        widget.theme.lightColorScheme.secondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.theme.displayName, style: DSTypography.h5),
                      Text(
                        widget.theme.description,
                        style: DSTypography.bodyMedium.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    if (widget.theme.isPremium)
                      const Chip(
                        label: Text('PREMIUM'),
                        backgroundColor: Colors.amber,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    if (widget.theme.isAccessible) const SizedBox(height: 4),
                    if (widget.theme.isAccessible)
                      Chip(
                        avatar: Icon(Icons.accessibility, size: 16),
                        label: const Text('ACCESIBLE'),
                        backgroundColor: Colors.green.shade100,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Industries y keywords
            if (widget.theme.industries.isNotEmpty) ...[
              Text('Industrias:', style: DSTypography.labelMedium),
              const SizedBox(height: 4),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: widget.theme.industries.map((industry) {
                  return Chip(
                    label: Text(industry),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
            ],
            if (widget.theme.keywords.isNotEmpty) ...[
              Text('Keywords:', style: DSTypography.labelMedium),
              const SizedBox(height: 4),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: widget.theme.keywords.take(6).map((keyword) {
                  return Chip(
                    label: Text(keyword),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(icon: Icon(Icons.palette), text: 'Colores'),
        Tab(icon: Icon(Icons.text_fields), text: 'Tipografía'),
        Tab(icon: Icon(Icons.widgets), text: 'Componentes'),
        Tab(icon: Icon(Icons.info), text: 'Detalles'),
      ],
    );
  }

  Widget _buildColorsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColorSection('Modo Claro', widget.theme.lightColorScheme),
          const SizedBox(height: 24),
          _buildColorSection('Modo Oscuro', widget.theme.darkColorScheme),
        ],
      ),
    );
  }

  Widget _buildColorSection(String title, ColorScheme colorScheme) {
    final colors = [
      ('Primary', colorScheme.primary, colorScheme.onPrimary),
      ('Secondary', colorScheme.secondary, colorScheme.onSecondary),
      ('Tertiary', colorScheme.tertiary, colorScheme.onTertiary),
      ('Surface', colorScheme.surface, colorScheme.onSurface),
      ('Background', colorScheme.surface, colorScheme.onSurface),
      ('Error', colorScheme.error, colorScheme.onError),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h6),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final color = colors[index];
            return _buildColorTile(color.$1, color.$2, color.$3);
          },
        ),
      ],
    );
  }

  Widget _buildColorTile(String name, Color backgroundColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: DSTypography.labelMedium.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '#${backgroundColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
              style: DSTypography.caption.copyWith(
                color: textColor.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Display Large', style: DSTypography.h1),
          Text('Display Medium', style: DSTypography.h2),
          Text('Display Small', style: DSTypography.h3),
          const SizedBox(height: 16),
          Text('Headline Large', style: DSTypography.h1),
          Text('Headline Medium', style: DSTypography.h2),
          Text('Headline Small', style: DSTypography.h3),
          const SizedBox(height: 16),
          Text('Title Large', style: DSTypography.h4),
          Text('Title Medium', style: DSTypography.h5),
          Text('Title Small', style: DSTypography.h6),
          const SizedBox(height: 16),
          Text('Body Large', style: DSTypography.bodyLarge),
          Text('Body Medium', style: DSTypography.bodyMedium),
          Text('Body Small', style: DSTypography.bodySmall),
          const SizedBox(height: 16),
          Text('Label Large', style: DSTypography.labelLarge),
          Text('Label Medium', style: DSTypography.labelMedium),
          Text('Label Small', style: DSTypography.labelSmall),
        ],
      ),
    );
  }

  Widget _buildComponentsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Botones', style: DSTypography.h6),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              TextButton(onPressed: () {}, child: const Text('Text')),
            ],
          ),
          const SizedBox(height: 24),
          Text('Cards', style: DSTypography.h6),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Este es un ejemplo de Card con el tema aplicado'),
            ),
          ),
          const SizedBox(height: 24),
          Text('Form Controls', style: DSTypography.h6),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Campo de texto',
              hintText: 'Ingresa tu texto aquí',
            ),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Switch'),
            value: true,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Checkbox'),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailSection('Información General', [
            'ID: ${widget.theme.id}',
            'Categoría: ${widget.theme.category.displayName}',
            'Sistema de Diseño: ${widget.theme.designSystem}',
            'Año: ${widget.theme.year}',
          ]),
          _buildDetailSection('Características', [
            'Premium: ${widget.theme.isPremium ? 'Sí' : 'No'}',
            'Accesible: ${widget.theme.isAccessible ? 'Sí' : 'No'}',
            'Industrias: ${widget.theme.industries.length}',
            'Keywords: ${widget.theme.keywords.length}',
          ]),
          _buildDetailSection('Tokens de Diseño', [
            'Espaciado base: ${widget.theme.tokens.baseSpacing}px',
            'Escala tipográfica: ${widget.theme.tokens.typographyScale}',
            'Border radius: ${widget.theme.tokens.defaultBorderRadius}px',
            'Compacto: ${widget.theme.tokens.isCompact ? 'Sí' : 'No'}',
            'Expresivo: ${widget.theme.tokens.isExpressive ? 'Sí' : 'No'}',
          ]),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String title, List<String> items) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: DSTypography.h6),
            const SizedBox(height: 12),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(item, style: DSTypography.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Consumer<DSThemeProvider>(
      builder: (context, provider, child) {
        final isCurrentTheme = provider.currentTheme.id == widget.theme.id;

        return ScaleTransition(
          scale: _fabAnimation,
          child: FloatingActionButton.extended(
            onPressed: isCurrentTheme ? null : _applyTheme,
            icon: Icon(isCurrentTheme ? Icons.check : Icons.palette),
            label: Text(isCurrentTheme ? 'Aplicado' : 'Aplicar Tema'),
            backgroundColor: isCurrentTheme
                ? Theme.of(context).colorScheme.surfaceContainerHighest
                : null,
          ),
        );
      },
    );
  }
}
