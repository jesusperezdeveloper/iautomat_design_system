import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../widgets/theme_switcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSTopAppBar(
        title: ThemeStatusWidget(),
        actions: [
          ThemeSwitcherButton(),
          ThemePickerButton(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Hero Section
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.35, // 35% de la altura de pantalla
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = MediaQuery.of(context).size.width <= 600;
                      final availableHeight = constraints.maxHeight;

                      return Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 16.0 : 24.0,
                              vertical: isMobile ? 8.0 : 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.palette,
                                  size: isMobile
                                    ? (availableHeight < 200 ? 40 : 60)
                                    : (availableHeight < 250 ? 60 : 80),
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                SizedBox(height: availableHeight < 200 ? 8 : (isMobile ? 12 : 16)),
                                Text(
                                  'IAutomat Design System',
                                  style: (isMobile ? DSTypography.h3 : DSTypography.h2).copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: availableHeight < 200 ? 4 : (isMobile ? 6 : 8)),
                                Text(
                                  'Sistema de diseño empresarial completo',
                                  style: (isMobile ? DSTypography.bodyMedium : DSTypography.bodyLarge).copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.9),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: availableHeight < 200 ? 2 : (isMobile ? 2 : 4)),
                                Text(
                                  isMobile
                                    ? '70+ Componentes\nMaterial 3 • 20 Temas'
                                    : '70+ Componentes • Material 3 • 20 Temas Profesionales',
                                  style: (isMobile ? DSTypography.bodySmall : DSTypography.bodyMedium).copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Navegación principal
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth <= 600;
                return Padding(
                  padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explorar el Sistema',
                        style: isMobile ? DSTypography.h4 : DSTypography.h3,
                      ),
                      SizedBox(height: isMobile ? 12 : 16),

                      // Cards de navegación principal
                      _buildNavigationGrid(context),

                      SizedBox(height: isMobile ? 24 : 32),

                      // Información del proyecto
                      _buildProjectInfo(context),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationGrid(BuildContext context) {
    final items = [
      _NavigationItem(
        title: 'Galería de Temas',
        description: '20 temas profesionales para 2025',
        icon: Icons.color_lens,
        route: '/themes',
        color: Theme.of(context).colorScheme.primary,
      ),
      _NavigationItem(
        title: 'Sistema de Colores',
        description: 'Paleta completa y escalas de grises',
        icon: Icons.palette,
        route: '/colors',
        color: Colors.orange,
      ),
      _NavigationItem(
        title: 'Tipografía',
        description: 'Sistema tipográfico Material 3',
        icon: Icons.text_fields,
        route: '/typography',
        color: Colors.purple,
      ),
      _NavigationItem(
        title: 'Componentes',
        description: '70+ componentes listos para usar',
        icon: Icons.widgets,
        route: '/components',
        color: Colors.green,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: isTablet ? 1.1 : 0.95, // Más altura en mobile
            crossAxisSpacing: isTablet ? 16 : 8,
            mainAxisSpacing: isTablet ? 16 : 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildNavigationCard(context, item);
          },
        );
      },
    );
  }

  Widget _buildNavigationCard(BuildContext context, _NavigationItem item) {
    final isMobile = MediaQuery.of(context).size.width <= 600;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(item.route),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                item.color.withValues(alpha: 0.1),
                item.color.withValues(alpha: 0.05),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  size: isMobile ? 36 : 48,
                  color: item.color,
                ),
                SizedBox(height: isMobile ? 8 : 12),
                Text(
                  item.title,
                  style: (isMobile ? DSTypography.labelMedium : DSTypography.labelLarge).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isMobile ? 2 : 4),
                Flexible(
                  child: Text(
                    item.description,
                    style: isMobile ? DSTypography.caption : DSTypography.bodySmall,
                    textAlign: TextAlign.center,
                    maxLines: isMobile ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectInfo(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 600;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: isMobile ? 20 : 24,
                ),
                SizedBox(width: isMobile ? 6 : 8),
                Expanded(
                  child: Text(
                    'Acerca del Proyecto',
                    style: isMobile ? DSTypography.h6 : DSTypography.h5,
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 12 : 16),
            Text(
              'IAutomat Design System es un sistema de diseño empresarial completo creado para Flutter. Incluye más de 70 componentes, 20 temas profesionales, sistema tipográfico Material 3 y cumple con los estándares de accesibilidad WCAG 2.0 AA.',
              style: isMobile ? DSTypography.bodySmall : DSTypography.bodyMedium,
            ),
            SizedBox(height: isMobile ? 12 : 16),
            Wrap(
              spacing: isMobile ? 6 : 8,
              runSpacing: isMobile ? 6 : 8,
              children: [
                Chip(
                  avatar: Icon(Icons.flutter_dash, size: isMobile ? 14 : 16),
                  label: Text('Flutter 3.35+', style: isMobile ? DSTypography.caption : DSTypography.labelSmall),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Chip(
                  avatar: Icon(Icons.design_services, size: isMobile ? 14 : 16),
                  label: Text('Material 3', style: isMobile ? DSTypography.caption : DSTypography.labelSmall),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Chip(
                  avatar: Icon(Icons.accessibility, size: isMobile ? 14 : 16),
                  label: Text('WCAG 2.0 AA', style: isMobile ? DSTypography.caption : DSTypography.labelSmall),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Chip(
                  avatar: Icon(Icons.devices, size: isMobile ? 14 : 16),
                  label: Text('Responsive', style: isMobile ? DSTypography.caption : DSTypography.labelSmall),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem {
  final String title;
  final String description;
  final IconData icon;
  final String route;
  final Color color;

  _NavigationItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    required this.color,
  });
}