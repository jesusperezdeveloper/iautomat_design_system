import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../providers/theme_provider.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DSThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () {
            themeProvider.toggleDarkMode();
          },
          tooltip: 'Toggle theme mode',
        );
      },
    );
  }
}

class ThemePickerButton extends StatelessWidget {
  const ThemePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DSThemeProvider>(
      builder: (context, themeProvider, child) {
        return PopupMenuButton<dynamic>(
          icon: const Icon(Icons.color_lens),
          tooltip: 'Seleccionar tema',
          onSelected: (value) {
            if (value == 'showcase') {
              // Navegar al Theme Showcase
              context.go('/theme-showcase');
            } else if (value is DSThemePreset) {
              // Aplicar tema seleccionado
              themeProvider.applyTheme(value);
            }
          },
          itemBuilder: (context) =>
              _buildThemeMenuItems(context, themeProvider),
        );
      },
    );
  }

  List<PopupMenuEntry<dynamic>> _buildThemeMenuItems(
    BuildContext context,
    DSThemeProvider themeProvider,
  ) {
    final List<PopupMenuEntry<dynamic>> items = [];

    // Opción para abrir el Theme Showcase completo
    items.add(
      PopupMenuItem<String>(
        value: 'showcase',
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.auto_awesome,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ver Galería Completa',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    '100 temas profesionales',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Theme.of(context).colorScheme.outline,
              ),
            ],
          ),
        ),
      ),
    );

    items.add(const PopupMenuDivider());

    // Obtener todas las categorías
    final allCategories = ThemeCategory.values;

    for (int i = 0; i < allCategories.length; i++) {
      final category = allCategories[i];
      final themes = DSThemeCatalog.getByCategory(category).toList();

      // Encabezado de categoría con icono
      items.add(
        PopupMenuItem<DSThemePreset>(
          enabled: false,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  category.icon,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  category.displayName,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Spacer(),
                Text(
                  '${themes.length} temas',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Mostrar todos los temas de la categoría
      for (final theme in themes) {
        items.add(
          PopupMenuItem<DSThemePreset>(
            value: theme,
            height: 36,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  // Preview de colores
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.lightColorScheme.primary,
                          theme.lightColorScheme.secondary,
                        ],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                        width: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Nombre del tema
                  Expanded(
                    child: Text(
                      theme.displayName,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: theme.id == themeProvider.currentTheme.id
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Check si está seleccionado
                  if (theme.id == themeProvider.currentTheme.id)
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ),
          ),
        );
      }

      // Separador entre categorías (excepto la última)
      if (i < allCategories.length - 1) {
        items.add(const PopupMenuDivider(height: 1));
      }
    }

    return items;
  }
}

class ThemeStatusWidget extends StatelessWidget {
  const ThemeStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DSThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Tema: ${themeProvider.currentTheme.displayName}',
                    style: DSTypography.labelMedium.copyWith(
                      color:
                          Theme.of(context).appBarTheme.foregroundColor ??
                          Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                'Modo: ${themeProvider.isDarkMode ? "Oscuro" : "Claro"}',
                style: DSTypography.caption.copyWith(
                  color:
                      (Theme.of(context).appBarTheme.foregroundColor ??
                              Theme.of(context).colorScheme.onSurface)
                          .withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
