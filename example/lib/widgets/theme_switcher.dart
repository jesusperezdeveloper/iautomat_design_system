import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../providers/theme_provider.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          icon: Icon(
            themeProvider.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () {
            themeProvider.toggleTheme();
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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return PopupMenuButton<ThemePreset>(
          icon: const Icon(Icons.color_lens),
          tooltip: 'Change theme',
          onSelected: (theme) {
            themeProvider.changeTheme(theme);
          },
          itemBuilder: (context) =>
              _buildThemeMenuItems(context, themeProvider),
        );
      },
    );
  }

  List<PopupMenuEntry<ThemePreset>> _buildThemeMenuItems(
    BuildContext context,
    ThemeProvider themeProvider,
  ) {
    final categories = [
      (ThemeCategory.corporate, 'Corporativo', ThemePresets.corporateThemes),
      (ThemeCategory.modern, 'Moderno', ThemePresets.modernThemes),
      (ThemeCategory.industry, 'Industria', ThemePresets.industryThemes),
      (ThemeCategory.mood, 'Emocional', ThemePresets.moodThemes),
      (ThemeCategory.special, 'Especial', ThemePresets.specialThemes),
    ];

    final List<PopupMenuEntry<ThemePreset>> items = [];

    for (final (category, categoryName, themes) in categories) {
      items.add(
        PopupMenuItem<ThemePreset>(
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
          PopupMenuItem<ThemePreset>(
            value: theme,
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: theme.lightColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(theme.displayName)),
                if (theme == themeProvider.selectedTheme)
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

      if (category != ThemeCategory.special) {
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
    return Consumer<ThemeProvider>(
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
                    'Tema: ${themeProvider.selectedTheme.displayName}',
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
                'Modo: ${_getThemeModeDisplayName(themeProvider.themeMode)}',
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

  String _getThemeModeDisplayName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Claro';
      case ThemeMode.dark:
        return 'Oscuro';
      case ThemeMode.system:
        return 'Sistema';
    }
  }
}
