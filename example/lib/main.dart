import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import 'stories/app_scaffold_stories.dart';
import 'stories/app_top_app_bar_stories.dart';
import 'stories/app_media_viewer_story.dart';
import 'stories/app_cart_widget_story.dart';
import 'stories/app_checkout_forms_story.dart';
import 'pages/camera_picker_story.dart';

void main() {
  runApp(const DesignSystemExampleApp());
}

class DesignSystemExampleApp extends StatefulWidget {
  const DesignSystemExampleApp({super.key});

  @override
  State<DesignSystemExampleApp> createState() => _DesignSystemExampleAppState();
}

class _DesignSystemExampleAppState extends State<DesignSystemExampleApp> {
  ThemeMode _themeMode = ThemeMode.system;
  ThemePreset _selectedTheme = ThemePresets.corporateBlue;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  void _changeTheme(ThemePreset theme) {
    setState(() {
      _selectedTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IAutomat Design System - 20 Temas Profesionales 2025',
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(_selectedTheme, false),
      darkTheme: _buildThemeData(_selectedTheme, true),
      themeMode: _themeMode,
      home: DesignSystemHomePage(
        themeMode: _themeMode,
        selectedTheme: _selectedTheme,
        onThemeToggle: _toggleTheme,
        onThemeChange: _changeTheme,
      ),
    );
  }

  ThemeData _buildThemeData(ThemePreset preset, bool isDark) {
    final colors = preset.getColors(isDark: isDark);

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: colors.primary,
        secondary: colors.secondary,
        tertiary: colors.tertiary,
        error: colors.error,
        surface: colors.surface,
        // background: colors.background, // Deprecated in favor of surface
        onPrimary: colors.onPrimary,
        onSecondary: colors.onSecondary,
        onSurface: colors.onSurface,
        outline: colors.outline,
      ),
      textTheme: AppTypography.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: preset.style.elevationValue,
        centerTitle: false,
        titleTextStyle: AppTypography.h6.copyWith(color: colors.onSurface),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: preset.style.elevationValue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
        ),
        margin: const EdgeInsets.all(16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: preset.style.elevationValue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          ),
          textStyle: AppTypography.button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          ),
          textStyle: AppTypography.button,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          ),
          textStyle: AppTypography.button,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(preset.style.borderRadiusValue),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        labelStyle: AppTypography.labelMedium,
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: colors.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

class DesignSystemHomePage extends StatefulWidget {
  final ThemeMode themeMode;
  final ThemePreset selectedTheme;
  final VoidCallback onThemeToggle;
  final Function(ThemePreset) onThemeChange;

  const DesignSystemHomePage({
    super.key,
    required this.themeMode,
    required this.selectedTheme,
    required this.onThemeToggle,
    required this.onThemeChange,
  });

  @override
  State<DesignSystemHomePage> createState() => _DesignSystemHomePageState();
}

class _DesignSystemHomePageState extends State<DesignSystemHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = [
    const Tab(icon: Icon(Icons.palette), text: 'Temas'),
    const Tab(icon: Icon(Icons.color_lens), text: 'Colores'),
    const Tab(icon: Icon(Icons.text_fields), text: 'Tipografía'),
    const Tab(icon: Icon(Icons.widgets), text: 'Componentes'),
    const Tab(icon: Icon(Icons.app_shortcut), text: 'AppScaffold'),
    const Tab(icon: Icon(Icons.web_asset), text: 'AppTopAppBar'),
    const Tab(icon: Icon(Icons.photo_library), text: 'MediaViewer'),
    const Tab(icon: Icon(Icons.shopping_cart), text: 'CartWidget'),
    const Tab(icon: Icon(Icons.payment), text: 'CheckoutForms'),
    const Tab(icon: Icon(Icons.add_a_photo), text: 'CameraPicker'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('IAutomat Design System'),
            Text(
              widget.selectedTheme.displayName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: widget.onThemeToggle,
            tooltip: 'Toggle theme mode',
          ),
          PopupMenuButton<ThemePreset>(
            icon: const Icon(Icons.color_lens),
            tooltip: 'Change theme',
            onSelected: widget.onThemeChange,
            itemBuilder: (context) => _buildThemeMenuItems(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ThemesShowcase(
            selectedTheme: widget.selectedTheme,
            onThemeChange: widget.onThemeChange,
          ),
          const ColorsShowcase(),
          const TypographyShowcase(),
          const ComponentsShowcase(),
          const AppScaffoldStories(),
          const AppTopAppBarStories(),
          const AppMediaViewerStory(),
          const AppCartWidgetStory(),
          const AppCheckoutFormsStory(),
          const CameraPickerStory(),
        ],
      ),
    );
  }

  List<PopupMenuEntry<ThemePreset>> _buildThemeMenuItems() {
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
            style: AppTypography.labelLarge.copyWith(
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
                if (theme == widget.selectedTheme)
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

// ==========================================================================
// THEMES SHOWCASE
// ==========================================================================

class ThemesShowcase extends StatelessWidget {
  final ThemePreset selectedTheme;
  final Function(ThemePreset) onThemeChange;

  const ThemesShowcase({
    super.key,
    required this.selectedTheme,
    required this.onThemeChange,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('20 Temas Profesionales para 2025', style: AppTypography.h2),
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
                    style: AppTypography.h5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    selectedTheme.categoryName,
                    style: AppTypography.labelSmall,
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
            Text('Paleta de colores', style: AppTypography.labelLarge),
            const SizedBox(height: 8),
            _buildColorPalette(selectedTheme.lightColors),

            const SizedBox(height: 16),

            // Casos de uso
            Text('Casos de uso:', style: AppTypography.labelLarge),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: selectedTheme.useCases.map((useCase) {
                return Chip(
                  label: Text(useCase, style: AppTypography.labelSmall),
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
                  style: AppTypography.caption,
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
        Text(categoryName, style: AppTypography.h4),
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
              onTap: () => onThemeChange(theme),
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
                              style: AppTypography.labelLarge,
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
                          style: AppTypography.caption,
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

// ==========================================================================
// COLORS SHOWCASE
// ==========================================================================

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sistema de Colores', style: AppTypography.h2),
          const SizedBox(height: 24),

          _buildColorSection('Primarios', [
            _ColorItem('Primary', AppColors.primary),
            _ColorItem('Primary Light', AppColors.primaryLight),
            _ColorItem('Primary Dark', AppColors.primaryDark),
          ]),

          _buildColorSection('Secundarios', [
            _ColorItem('Secondary', AppColors.secondary),
            _ColorItem('Secondary Light', AppColors.secondaryLight),
            _ColorItem('Secondary Dark', AppColors.secondaryDark),
          ]),

          _buildColorSection('Semánticos', [
            _ColorItem('Success', AppColors.success),
            _ColorItem('Warning', AppColors.warning),
            _ColorItem('Error', AppColors.error),
            _ColorItem('Info', AppColors.info),
          ]),

          _buildColorSection('Escala de Grises', [
            _ColorItem('Gray 100', AppColors.gray100),
            _ColorItem('Gray 200', AppColors.gray200),
            _ColorItem('Gray 300', AppColors.gray300),
            _ColorItem('Gray 400', AppColors.gray400),
            _ColorItem('Gray 500', AppColors.gray500),
            _ColorItem('Gray 600', AppColors.gray600),
            _ColorItem('Gray 700', AppColors.gray700),
            _ColorItem('Gray 800', AppColors.gray800),
            _ColorItem('Gray 900', AppColors.gray900),
          ]),
        ],
      ),
    );
  }

  Widget _buildColorSection(String title, List<_ColorItem> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h4),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final crossAxisCount = screenWidth > 600
                ? 4
                : (screenWidth > 400 ? 3 : 2);

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.9,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final color = colors[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          color: color.color,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                color.name,
                                style: AppTypography.labelSmall.copyWith(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '#${color.color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                                style: AppTypography.caption.copyWith(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _ColorItem {
  final String name;
  final Color color;

  _ColorItem(this.name, this.color);
}

// ==========================================================================
// TYPOGRAPHY SHOWCASE
// ==========================================================================

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sistema Tipográfico', style: AppTypography.h2),
          const SizedBox(height: 24),

          _buildTypographySection('Headers', [
            _TypographyItem('H1 - Display Large', AppTypography.h1),
            _TypographyItem('H2 - Display Medium', AppTypography.h2),
            _TypographyItem('H3 - Display Small', AppTypography.h3),
            _TypographyItem('H4 - Headline Large', AppTypography.h4),
            _TypographyItem('H5 - Headline Medium', AppTypography.h5),
            _TypographyItem('H6 - Headline Small', AppTypography.h6),
          ]),

          _buildTypographySection('Body Text', [
            _TypographyItem('Body Large', AppTypography.bodyLarge),
            _TypographyItem('Body Medium', AppTypography.bodyMedium),
            _TypographyItem('Body Small', AppTypography.bodySmall),
          ]),

          _buildTypographySection('Labels', [
            _TypographyItem('Label Large', AppTypography.labelLarge),
            _TypographyItem('Label Medium', AppTypography.labelMedium),
            _TypographyItem('Label Small', AppTypography.labelSmall),
          ]),

          _buildTypographySection('Especiales', [
            _TypographyItem('Button Text', AppTypography.button),
            _TypographyItem('Caption Text', AppTypography.caption),
            _TypographyItem('OVERLINE TEXT', AppTypography.overline),
          ]),
        ],
      ),
    );
  }

  Widget _buildTypographySection(String title, List<_TypographyItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h4),
        const SizedBox(height: 16),
        ...items.map((item) => _buildTypographyCard(item)),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTypographyCard(_TypographyItem item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.text, style: item.style),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Size: ${item.style.fontSize?.toStringAsFixed(0)}px, Weight: ${item.style.fontWeight.toString()}',
                style: AppTypography.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypographyItem {
  final String text;
  final TextStyle style;

  _TypographyItem(this.text, this.style);
}

// ==========================================================================
// COMPONENTS SHOWCASE
// ==========================================================================

class ComponentsShowcase extends StatefulWidget {
  const ComponentsShowcase({super.key});

  @override
  State<ComponentsShowcase> createState() => _ComponentsShowcaseState();
}

class _ComponentsShowcaseState extends State<ComponentsShowcase> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 50;
  String _selectedOption = 'option1';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Componentes', style: AppTypography.h2),
            const SizedBox(height: 24),

            // Botones
            Text('Botones', style: AppTypography.h4),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ElevatedButton(
                  onPressed: () => _showSnackBar('ElevatedButton pressed'),
                  child: const Text('Elevated Button'),
                ),
                OutlinedButton(
                  onPressed: () => _showSnackBar('OutlinedButton pressed'),
                  child: const Text('Outlined Button'),
                ),
                FilledButton(
                  onPressed: () => _showSnackBar('FilledButton pressed'),
                  child: const Text('Filled Button'),
                ),
                TextButton(
                  onPressed: () => _showSnackBar('TextButton pressed'),
                  child: const Text('Text Button'),
                ),
                const ElevatedButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            const SizedBox(height: 32),

            // Inputs
            Text('Inputs', style: AppTypography.h4),
            const SizedBox(height: 16),
            Column(
              children: [
                TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Ingresa tu email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Email requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingresa tu contraseña',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Comentarios',
                    hintText: 'Escribe tus comentarios aquí...',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Controles
            Text('Controles', style: AppTypography.h4),
            const SizedBox(height: 16),
            Column(
              children: [
                SwitchListTile(
                  title: const Text('Notificaciones'),
                  subtitle: const Text('Recibir notificaciones push'),
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Términos y condiciones'),
                  subtitle: const Text('He leído y acepto los términos'),
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value ?? false;
                    });
                  },
                ),
                ListTile(
                  title: const Text('Volumen'),
                  subtitle: Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _sliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Opciones de selección (implementación personalizada sin deprecation warnings)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opciones', style: AppTypography.labelLarge),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        _buildCustomRadioOption('option1', 'Opción 1'),
                        _buildCustomRadioOption('option2', 'Opción 2'),
                        _buildCustomRadioOption('option3', 'Opción 3'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Chips
            Text('Chips', style: AppTypography.h4),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const Chip(avatar: Icon(Icons.person), label: Text('Usuario')),
                ActionChip(
                  avatar: const Icon(Icons.settings),
                  label: const Text('Configuración'),
                  onPressed: () => _showSnackBar('Configuración pressed'),
                ),
                FilterChip(
                  label: const Text('Filtro'),
                  selected: true,
                  onSelected: (value) {},
                ),
                const Chip(
                  label: Text('Etiqueta'),
                  deleteIcon: Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Cards y dividers
            Text('Cards y Dividers', style: AppTypography.h4),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card Example', style: AppTypography.h6),
                    const SizedBox(height: 8),
                    const Text('Este es un ejemplo de card con contenido.'),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('CANCELAR'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('ACEPTAR'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Botón de validación
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _showSnackBar('Formulario válido!');
                  } else {
                    _showSnackBar('Por favor corrige los errores');
                  }
                },
                child: const Text('Validar Formulario'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomRadioOption(String value, String label) {
    final isSelected = _selectedOption == value;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            width: 2,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            : null,
      ),
      title: Text(label),
      onTap: () {
        setState(() {
          _selectedOption = value;
        });
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
