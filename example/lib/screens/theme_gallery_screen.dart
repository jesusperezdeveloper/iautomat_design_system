import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../widgets/theme_switcher.dart';
import '../widgets/ds_app_bar_with_back.dart';

class ThemeGalleryScreen extends StatelessWidget {
  const ThemeGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Galería de Temas'),
        actions: [
          ThemeSwitcherButton(),
          ThemePickerButton(),
        ],
      ),
      body: const ThemesShowcaseScreen(),
    );
  }
}

// Reutilizo el código existente de ThemesShowcase pero como pantalla independiente
class ThemesShowcaseScreen extends StatefulWidget {
  const ThemesShowcaseScreen({super.key});

  @override
  State<ThemesShowcaseScreen> createState() => _ThemesShowcaseScreenState();
}

class _ThemesShowcaseScreenState extends State<ThemesShowcaseScreen> {
  ThemePreset selectedTheme = ThemePresets.corporateBlue;

  void _onThemeChange(ThemePreset theme) {
    setState(() {
      selectedTheme = theme;
    });
    // Aquí podrías notificar al widget padre para cambiar el tema globalmente
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('20 Temas Profesionales para 2025', style: DSTypography.h2),
          const SizedBox(height: 24),

          // Información del tema actual
          _buildCurrentThemeInfo(context),
          const SizedBox(height: 32),

          // Categorías de temas
          _buildThemeCategory(
            context,
            'Corporativo',
            ThemePresets.corporateThemes,
          ),
          _buildThemeCategory(context, 'Moderno', ThemePresets.modernThemes),
          _buildThemeCategory(
            context,
            'Industria',
            ThemePresets.industryThemes,
          ),
          _buildThemeCategory(context, 'Emocional', ThemePresets.moodThemes),
          _buildThemeCategory(context, 'Especial', ThemePresets.specialThemes),
        ],
      ),
    );
  }

  Widget _buildCurrentThemeInfo(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: selectedTheme.lightColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedTheme.displayName,
                    style: DSTypography.h5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    selectedTheme.categoryName,
                    style: DSTypography.labelSmall,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(selectedTheme.description),
            const SizedBox(height: 16),

            // Paleta de colores actual
            Text('Paleta de colores', style: DSTypography.labelLarge),
            const SizedBox(height: 8),
            _buildColorPalette(selectedTheme.lightColors),

            const SizedBox(height: 16),

            // Casos de uso
            Text('Casos de uso:', style: DSTypography.labelLarge),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: selectedTheme.useCases.map((useCase) {
                return Chip(
                  label: Text(useCase, style: DSTypography.labelSmall),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPalette(ThemeColors colors) {
    final colorList = [
      ('Primary', colors.primary),
      ('Secondary', colors.secondary),
      ('Tertiary', colors.tertiary),
      ('Success', colors.success),
      ('Warning', colors.warning),
      ('Error', colors.error),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colorList.map((colorData) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorData.$2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  colorData.$1,
                  style: DSTypography.caption,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildThemeCategory(
    BuildContext context,
    String categoryName,
    List<ThemePreset> themes,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(categoryName, style: DSTypography.h4),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: themes.length,
          itemBuilder: (context, index) {
            final theme = themes[index];
            final isSelected = theme == selectedTheme;

            return GestureDetector(
              onTap: () => _onThemeChange(theme),
              child: Card(
                elevation: isSelected ? 8 : 2,
                color: isSelected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: theme.lightColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              theme.displayName,
                              style: DSTypography.labelLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          theme.description,
                          style: DSTypography.caption,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: theme.lightColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: theme.lightColors.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: theme.lightColors.tertiary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}