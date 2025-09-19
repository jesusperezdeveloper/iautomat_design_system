import 'package:flutter/material.dart';
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
        return PopupMenuButton<DSThemePreset>(
          icon: const Icon(Icons.color_lens),
          tooltip: 'Change theme',
          onSelected: (theme) {
            themeProvider.applyTheme(theme);
          },
          itemBuilder: (context) =>
              _buildThemeMenuItems(context, themeProvider),
        );
      },
    );
  }

  List<PopupMenuEntry<DSThemePreset>> _buildThemeMenuItems(
    BuildContext context,
    DSThemeProvider themeProvider,
  ) {
    final categories = [
      (ThemeCategory.corporate, 'Corporativo'),
      (ThemeCategory.technology, 'Tecnología'),
      (ThemeCategory.creative, 'Creativo'),
      (ThemeCategory.healthcare, 'Salud'),
      (ThemeCategory.financial, 'Financiero'),
    ];

    final List<PopupMenuEntry<DSThemePreset>> items = [];

    for (final (category, categoryName) in categories) {
      final themes = DSThemeCatalog.getByCategory(category).take(3).toList();

      items.add(
        PopupMenuItem<DSThemePreset>(
          enabled: false,
          child: Text(
            categoryName,
            style: DSTypography.labelLarge.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );

      for (final theme in themes) {
        items.add(
          PopupMenuItem<DSThemePreset>(
            value: theme,
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: theme.lightColorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(theme.displayName)),
                if (theme.id == themeProvider.currentTheme.id)
                  Icon(
                    Icons.check,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ],
            ),
          ),
        );
      }

      if (category != ThemeCategory.financial) {
        items.add(const PopupMenuDivider());
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
