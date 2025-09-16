import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Import the design system public API so example can access AppTheme, AppColors, etc.
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// App de ejemplo del Design System de IAutomat
///
/// Demuestra todos los componentes, estilos y funcionalidades
/// del sistema de diseño en una aplicación interactiva completa.
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

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IAutomat Design System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: DesignSystemHomePage(
        themeMode: _themeMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

class DesignSystemHomePage extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;

  const DesignSystemHomePage({
    super.key,
    required this.themeMode,
    required this.onThemeToggle,
  });

  @override
  State<DesignSystemHomePage> createState() => _DesignSystemHomePageState();
}

class _DesignSystemHomePageState extends State<DesignSystemHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Tab> _tabs = [
    const Tab(icon: Icon(Icons.palette), text: 'Colors'),
    const Tab(icon: Icon(Icons.text_fields), text: 'Typography'),
    const Tab(icon: Icon(Icons.space_bar), text: 'Spacing'),
    const Tab(icon: Icon(Icons.smart_button), text: 'Buttons'),
    const Tab(icon: Icon(Icons.input), text: 'Inputs'),
    const Tab(icon: Icon(Icons.crop_portrait), text: 'Cards'),
    const Tab(icon: Icon(Icons.devices), text: 'Responsive'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
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
        title: const Text('IAutomat Design System'),
        actions: [
          IconButton(
            icon: Icon(
              widget.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: widget.onThemeToggle,
            tooltip: 'Toggle theme',
          ),
          const SizedBox(width: 8),
        ],
        bottom: context.isDesktop
            ? TabBar(
                controller: _tabController,
                tabs: _tabs,
                isScrollable: true,
              )
            : null,
      ),
      body: ResponsiveBuilder(
        mobile: (context) => _buildMobileLayout(),
        desktop: (context) => _buildDesktopLayout(),
      ),
      bottomNavigationBar: context.isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _currentIndex.clamp(0, 4),
              onTap: (index) {
                _tabController.animateTo(index);
              },
              type: BottomNavigationBarType.shifting,
              items: _tabs.take(5).map((tab) {
                return BottomNavigationBarItem(
                  icon: tab.icon!,
                  label: tab.text,
                );
              }).toList(),
            ),
    );
  }

  Widget _buildMobileLayout() {
    return TabBarView(controller: _tabController, children: _buildTabViews());
  }

  Widget _buildDesktopLayout() {
    return TabBarView(controller: _tabController, children: _buildTabViews());
  }

  List<Widget> _buildTabViews() {
    return [
      const ColorsShowcase(),
      const TypographyShowcase(),
      const SpacingDemo(),
      const ButtonsGallery(),
      const InputsPlayground(),
      const CardsExamples(),
      const ResponsiveSection(),
    ];
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
      padding: context.responsivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Colors Palette', style: AppTypography.h2),
          AppSpacing.verticalLg,

          _buildColorSection('Primary Colors', [
            _ColorItem('Primary', AppColors.primary, 'AppColors.primary'),
            _ColorItem(
              'Primary Light',
              AppColors.primaryLight,
              'AppColors.primaryLight',
            ),
            _ColorItem(
              'Primary Dark',
              AppColors.primaryDark,
              'AppColors.primaryDark',
            ),
          ]),

          _buildColorSection('Secondary Colors', [
            _ColorItem('Secondary', AppColors.secondary, 'AppColors.secondary'),
            _ColorItem(
              'Secondary Light',
              AppColors.secondaryLight,
              'AppColors.secondaryLight',
            ),
            _ColorItem(
              'Secondary Dark',
              AppColors.secondaryDark,
              'AppColors.secondaryDark',
            ),
          ]),

          _buildColorSection('Semantic Colors', [
            _ColorItem('Success', AppColors.success, 'AppColors.success'),
            _ColorItem('Warning', AppColors.warning, 'AppColors.warning'),
            _ColorItem('Error', AppColors.error, 'AppColors.error'),
            _ColorItem('Info', AppColors.info, 'AppColors.info'),
          ]),

          _buildColorSection('Gray Scale', [
            _ColorItem('Gray 50', AppColors.gray50, 'AppColors.gray50'),
            _ColorItem('Gray 100', AppColors.gray100, 'AppColors.gray100'),
            _ColorItem('Gray 200', AppColors.gray200, 'AppColors.gray200'),
            _ColorItem('Gray 300', AppColors.gray300, 'AppColors.gray300'),
            _ColorItem('Gray 400', AppColors.gray400, 'AppColors.gray400'),
            _ColorItem('Gray 500', AppColors.gray500, 'AppColors.gray500'),
            _ColorItem('Gray 600', AppColors.gray600, 'AppColors.gray600'),
            _ColorItem('Gray 700', AppColors.gray700, 'AppColors.gray700'),
            _ColorItem('Gray 800', AppColors.gray800, 'AppColors.gray800'),
            _ColorItem('Gray 900', AppColors.gray900, 'AppColors.gray900'),
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
        AppSpacing.verticalMd,
        ResponsiveGrid(
          columns: const ResponsiveValue(
            mobile: 2,
            tablet: 3,
            desktop: 4,
            ultraWide: 5,
          ),
          children: colors.map((color) => _buildColorCard(color)).toList(),
        ),
        AppSpacing.verticalXl,
      ],
    );
  }

  Widget _buildColorCard(_ColorItem colorItem) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorItem.color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: AppSpacing.cardPadding,
            child: Column(
              children: [
                Text(colorItem.name, style: AppTypography.labelMedium),
                AppSpacing.verticalXs,
                Text(
                  colorItem.code,
                  style: AppTypography.caption,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorItem {
  final String name;
  final Color color;
  final String code;

  _ColorItem(this.name, this.color, this.code);
}

// ==========================================================================
// TYPOGRAPHY SHOWCASE
// ==========================================================================

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.responsivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Typography System', style: AppTypography.h2),
          AppSpacing.verticalLg,

          _buildTypographySection('Headers', [
            _TypographyItem(
              'H1 - Display Large',
              AppTypography.h1,
              'AppTypography.h1',
            ),
            _TypographyItem(
              'H2 - Display Medium',
              AppTypography.h2,
              'AppTypography.h2',
            ),
            _TypographyItem(
              'H3 - Display Small',
              AppTypography.h3,
              'AppTypography.h3',
            ),
            _TypographyItem(
              'H4 - Headline Large',
              AppTypography.h4,
              'AppTypography.h4',
            ),
            _TypographyItem(
              'H5 - Headline Medium',
              AppTypography.h5,
              'AppTypography.h5',
            ),
            _TypographyItem(
              'H6 - Headline Small',
              AppTypography.h6,
              'AppTypography.h6',
            ),
          ]),

          _buildTypographySection('Body Text', [
            _TypographyItem(
              'Body Large',
              AppTypography.bodyLarge,
              'AppTypography.bodyLarge',
            ),
            _TypographyItem(
              'Body Medium',
              AppTypography.bodyMedium,
              'AppTypography.bodyMedium',
            ),
            _TypographyItem(
              'Body Small',
              AppTypography.bodySmall,
              'AppTypography.bodySmall',
            ),
          ]),

          _buildTypographySection('Labels', [
            _TypographyItem(
              'Label Large',
              AppTypography.labelLarge,
              'AppTypography.labelLarge',
            ),
            _TypographyItem(
              'Label Medium',
              AppTypography.labelMedium,
              'AppTypography.labelMedium',
            ),
            _TypographyItem(
              'Label Small',
              AppTypography.labelSmall,
              'AppTypography.labelSmall',
            ),
          ]),

          _buildTypographySection('Special Styles', [
            _TypographyItem(
              'Button Text',
              AppTypography.button,
              'AppTypography.button',
            ),
            _TypographyItem(
              'Caption Text',
              AppTypography.caption,
              'AppTypography.caption',
            ),
            _TypographyItem(
              'OVERLINE TEXT',
              AppTypography.overline,
              'AppTypography.overline',
            ),
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
        AppSpacing.verticalMd,
        ...items.map((item) => _buildTypographyCard(item)),
        AppSpacing.verticalXl,
      ],
    );
  }

  Widget _buildTypographyCard(_TypographyItem item) {
    return AppCard.outlined(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.example, style: item.style),
          AppSpacing.verticalSm,
          Container(
            padding: const EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(item.code, style: AppTypography.caption),
          ),
        ],
      ),
    );
  }
}

class _TypographyItem {
  final String example;
  final TextStyle style;
  final String code;

  _TypographyItem(this.example, this.style, this.code);
}

// ==========================================================================
// SPACING DEMO
// ==========================================================================

class SpacingDemo extends StatelessWidget {
  const SpacingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.responsivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Spacing System', style: AppTypography.h2),
          AppSpacing.verticalLg,

          Text('Spacing Scale', style: AppTypography.h4),
          AppSpacing.verticalMd,

          _buildSpacingItem('XXXS', AppSpacing.xxxs, 'AppSpacing.xxxs'),
          _buildSpacingItem('XXS', AppSpacing.xxs, 'AppSpacing.xxs'),
          _buildSpacingItem('XS', AppSpacing.xs, 'AppSpacing.xs'),
          _buildSpacingItem('SM', AppSpacing.sm, 'AppSpacing.sm'),
          _buildSpacingItem('MD', AppSpacing.md, 'AppSpacing.md'),
          _buildSpacingItem('LG', AppSpacing.lg, 'AppSpacing.lg'),
          _buildSpacingItem('XL', AppSpacing.xl, 'AppSpacing.xl'),
          _buildSpacingItem('XXL', AppSpacing.xxl, 'AppSpacing.xxl'),
          _buildSpacingItem('XXXL', AppSpacing.xxxl, 'AppSpacing.xxxl'),

          AppSpacing.verticalXl,
          Text('Spacing Widgets', style: AppTypography.h4),
          AppSpacing.verticalMd,

          AppCard.outlined(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(width: 50, height: 30, color: AppColors.primary),
                    AppSpacing.horizontalSm,
                    const Text('horizontalSm'),
                    AppSpacing.horizontalSm,
                    Container(
                      width: 50,
                      height: 30,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
                AppSpacing.verticalMd,
                const Text('verticalMd spacing above'),
                AppSpacing.verticalLg,
                const Text('verticalLg spacing above'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpacingItem(String name, double size, String code) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(name, style: AppTypography.labelMedium),
          ),
          Container(width: size, height: 20, color: AppColors.primary),
          AppSpacing.horizontalSm,
          Text('${size}px', style: AppTypography.bodySmall),
          AppSpacing.horizontalSm,
          Expanded(child: Text(code, style: AppTypography.caption)),
        ],
      ),
    );
  }
}

// ==========================================================================
// BUTTONS GALLERY
// ==========================================================================

class ButtonsGallery extends StatefulWidget {
  const ButtonsGallery({super.key});

  @override
  State<ButtonsGallery> createState() => _ButtonsGalleryState();
}

class _ButtonsGalleryState extends State<ButtonsGallery> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.responsivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Buttons Gallery', style: AppTypography.h2),
          AppSpacing.verticalLg,

          _buildVariantsSection(),
          AppSpacing.verticalXl,
          _buildSizesSection(),
          AppSpacing.verticalXl,
          _buildStatesSection(),
          AppSpacing.verticalXl,
          _buildIconButtonsSection(),
        ],
      ),
    );
  }

  Widget _buildVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Button Variants', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveWrap(
          children: [
            _buildButtonExample(
              'Primary',
              AppButton.primary(
                text: 'Primary',
                onPressed: () => _showSnackbar('Primary pressed'),
              ),
              'AppButton.primary(text: "Primary", onPressed: () {})',
            ),
            _buildButtonExample(
              'Secondary',
              AppButton.secondary(
                text: 'Secondary',
                onPressed: () => _showSnackbar('Secondary pressed'),
              ),
              'AppButton.secondary(text: "Secondary", onPressed: () {})',
            ),
            _buildButtonExample(
              'Outline',
              AppButton.outline(
                text: 'Outline',
                onPressed: () => _showSnackbar('Outline pressed'),
              ),
              'AppButton.outline(text: "Outline", onPressed: () {})',
            ),
            _buildButtonExample(
              'Ghost',
              AppButton.ghost(
                text: 'Ghost',
                onPressed: () => _showSnackbar('Ghost pressed'),
              ),
              'AppButton.ghost(text: "Ghost", onPressed: () {})',
            ),
            _buildButtonExample(
              'Danger',
              AppButton.danger(
                text: 'Danger',
                onPressed: () => _showSnackbar('Danger pressed'),
              ),
              'AppButton.danger(text: "Danger", onPressed: () {})',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Button Sizes', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveWrap(
          children: [
            _buildButtonExample(
              'Small',
              AppButton.primary(
                text: 'Small',
                size: ButtonSize.small,
                onPressed: () => _showSnackbar('Small pressed'),
              ),
              'AppButton.primary(text: "Small", size: ButtonSize.small)',
            ),
            _buildButtonExample(
              'Medium',
              AppButton.primary(
                text: 'Medium',
                size: ButtonSize.medium,
                onPressed: () => _showSnackbar('Medium pressed'),
              ),
              'AppButton.primary(text: "Medium", size: ButtonSize.medium)',
            ),
            _buildButtonExample(
              'Large',
              AppButton.primary(
                text: 'Large',
                size: ButtonSize.large,
                onPressed: () => _showSnackbar('Large pressed'),
              ),
              'AppButton.primary(text: "Large", size: ButtonSize.large)',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Button States', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveWrap(
          children: [
            _buildButtonExample(
              'Enabled',
              AppButton.primary(
                text: 'Enabled',
                onPressed: () => _showSnackbar('Enabled pressed'),
              ),
              'AppButton.primary(text: "Enabled", onPressed: () {})',
            ),
            _buildButtonExample(
              'Disabled',
              const AppButton.primary(text: 'Disabled', onPressed: null),
              'AppButton.primary(text: "Disabled", onPressed: null)',
            ),
            _buildButtonExample(
              'Loading',
              AppButton.primary(
                text: 'Loading',
                isLoading: _isLoading,
                onPressed: () {
                  setState(() => _isLoading = true);
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() => _isLoading = false);
                    }
                  });
                },
              ),
              'AppButton.primary(text: "Loading", isLoading: true)',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButtonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Icon Buttons', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveWrap(
          children: [
            _buildButtonExample(
              'Leading Icon',
              AppButton.primary(
                text: 'Download',
                leadingIcon: Icons.download,
                onPressed: () => _showSnackbar('Download pressed'),
              ),
              'AppButton.primary(text: "Download", leadingIcon: Icons.download)',
            ),
            _buildButtonExample(
              'Trailing Icon',
              AppButton.primary(
                text: 'Next',
                trailingIcon: Icons.arrow_forward,
                onPressed: () => _showSnackbar('Next pressed'),
              ),
              'AppButton.primary(text: "Next", trailingIcon: Icons.arrow_forward)',
            ),
            _buildButtonExample(
              'Full Width',
              AppButton.primary(
                text: 'Full Width Button',
                leadingIcon: Icons.check,
                isFullWidth: true,
                onPressed: () => _showSnackbar('Full width pressed'),
              ),
              'AppButton.primary(text: "Full Width", isFullWidth: true)',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonExample(String title, Widget button, String code) {
    return AppCard.outlined(
      width: context.isMobile ? null : 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTypography.labelLarge),
          AppSpacing.verticalSm,
          button,
          AppSpacing.verticalSm,
          Container(
            padding: const EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(code, style: AppTypography.caption),
          ),
        ],
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

// ==========================================================================
// INPUTS PLAYGROUND
// ==========================================================================

class InputsPlayground extends StatefulWidget {
  const InputsPlayground({super.key});

  @override
  State<InputsPlayground> createState() => _InputsPlaygroundState();
}

class _InputsPlaygroundState extends State<InputsPlayground> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _multilineController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _multilineController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.responsivePadding,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inputs Playground', style: AppTypography.h2),
            AppSpacing.verticalLg,

            _buildInputTypesSection(),
            AppSpacing.verticalXl,
            _buildInputStatesSection(),
            AppSpacing.verticalXl,
            _buildSpecialFeaturesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputTypesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Input Types', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveGrid(
          columns: const ResponsiveValue(
            mobile: 1,
            tablet: 2,
            desktop: 2,
            ultraWide: 3,
          ),
          children: [
            _buildInputExample(
              'Email Input',
              AppInput.email(
                label: 'Email Address',
                hint: 'Enter your email',
                controller: _emailController,
                validator: Validators.compose([
                  Validators.required(),
                  Validators.email(),
                ]),
                prefixIcon: Icons.email,
              ),
              'AppInput.email(label: "Email", validator: Validators.email())',
            ),
            _buildInputExample(
              'Password Input',
              AppInput.password(
                label: 'Password',
                hint: 'Enter password',
                controller: _passwordController,
                validator: Validators.password(),
              ),
              'AppInput.password(label: "Password", validator: Validators.password())',
            ),
            _buildInputExample(
              'Search Input',
              AppInput.search(
                hint: 'Search...',
                controller: _searchController,
                onChanged: (value) {
                  // Simular búsqueda
                },
              ),
              'AppInput.search(hint: "Search...", onChanged: (value) {})',
            ),
            _buildInputExample(
              'Number Input',
              AppInput(
                label: 'Age',
                type: InputType.number,
                validator: Validators.compose([
                  Validators.required(),
                  Validators.numeric(),
                  Validators.range(18, 120),
                ]),
                prefixIcon: Icons.numbers,
              ),
              'AppInput(type: InputType.number, validator: Validators.numeric())',
            ),
            _buildInputExample(
              'Phone Input',
              AppInput(
                label: 'Phone Number',
                type: InputType.phone,
                validator: Validators.phone(),
                prefixText: '+57',
              ),
              'AppInput(type: InputType.phone, prefixText: "+57")',
            ),
            _buildInputExample(
              'URL Input',
              AppInput(
                label: 'Website',
                type: InputType.url,
                validator: Validators.url(),
                prefixIcon: Icons.link,
              ),
              'AppInput(type: InputType.url, validator: Validators.url())',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Input States', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveGrid(
          columns: const ResponsiveValue(
            mobile: 1,
            tablet: 2,
            desktop: 3,
            ultraWide: 4,
          ),
          children: [
            _buildInputExample(
              'Normal State',
              const AppInput(label: 'Normal Input', hint: 'Type something...'),
              'AppInput(label: "Normal Input", hint: "Type something...")',
            ),
            _buildInputExample(
              'Disabled State',
              const AppInput(
                label: 'Disabled Input',
                hint: 'Cannot type here',
                enabled: false,
              ),
              'AppInput(label: "Disabled Input", enabled: false)',
            ),
            _buildInputExample(
              'Read Only',
              const AppInput(
                label: 'Read Only',
                initialValue: 'This is read only',
                readOnly: true,
              ),
              'AppInput(initialValue: "Read only", readOnly: true)',
            ),
            _buildInputExample(
              'With Helper',
              const AppInput(
                label: 'Username',
                helper: 'Must be unique',
                hint: 'Enter username',
              ),
              'AppInput(label: "Username", helper: "Must be unique")',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecialFeaturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Special Features', style: AppTypography.h4),
        AppSpacing.verticalMd,

        _buildInputExample(
          'Multiline Input',
          AppInput.multiline(
            label: 'Description',
            hint: 'Enter a detailed description...',
            controller: _multilineController,
            maxLength: 200,
            showCounter: true,
            maxLines: 5,
            minLines: 3,
            validator: Validators.minLength(10),
          ),
          '''AppInput.multiline(
  label: "Description",
  maxLength: 200,
  showCounter: true,
  maxLines: 5,
  minLines: 3,
)''',
        ),

        AppSpacing.verticalMd,

        _buildInputExample(
          'Input with Custom Validation',
          AppInput(
            label: 'Full Name',
            validator: Validators.compose([
              Validators.required('Name is required'),
              Validators.fullName(),
              Validators.minLength(5, 'Name too short'),
            ]),
            prefixIcon: Icons.person,
            helper: 'Enter your first and last name',
          ),
          '''AppInput(
  label: "Full Name",
  validator: Validators.compose([
    Validators.required(),
    Validators.fullName(),
    Validators.minLength(5),
  ]),
)''',
        ),

        AppSpacing.verticalMd,

        AppButton.primary(
          text: 'Validate Form',
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Form is valid!')));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fix the errors')),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildInputExample(String title, Widget input, String code) {
    return AppCard.outlined(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTypography.labelLarge),
          AppSpacing.verticalMd,
          input,
          AppSpacing.verticalSm,
          Container(
            padding: const EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(code, style: AppTypography.caption),
          ),
        ],
      ),
    );
  }
}

// ==========================================================================
// CARDS EXAMPLES
// ==========================================================================

class CardsExamples extends StatelessWidget {
  const CardsExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.responsivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cards Examples', style: AppTypography.h2),
          AppSpacing.verticalLg,

          _buildCardVariantsSection(),
          AppSpacing.verticalXl,
          _buildSpecialCardsSection(),
          AppSpacing.verticalXl,
          _buildInteractiveCardsSection(),
        ],
      ),
    );
  }

  Widget _buildCardVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card Variants', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveGrid(
          columns: const ResponsiveValue(
            mobile: 1,
            tablet: 2,
            desktop: 2,
            ultraWide: 3,
          ),
          children: [
            _buildCardExample(
              'Flat Card',
              AppCard.flat(child: _buildSampleContent('Flat Card Content')),
              'AppCard.flat(child: content)',
            ),
            _buildCardExample(
              'Elevated Card',
              AppCard.elevated(
                elevation: 3,
                child: _buildSampleContent('Elevated Card Content'),
              ),
              'AppCard.elevated(elevation: 3, child: content)',
            ),
            _buildCardExample(
              'Outlined Card',
              AppCard.outlined(
                borderColor: AppColors.primary,
                child: _buildSampleContent('Outlined Card Content'),
              ),
              'AppCard.outlined(borderColor: AppColors.primary)',
            ),
            _buildCardExample(
              'Gradient Card',
              AppCard.gradient(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                child: _buildSampleContent('Gradient Card', isLight: true),
              ),
              '''AppCard.gradient(
  gradient: LinearGradient(
    colors: [AppColors.primary, AppColors.secondary],
  ),
)''',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecialCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Special Cards', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveGrid(
          columns: const ResponsiveValue(
            mobile: 1,
            tablet: 2,
            desktop: 3,
            ultraWide: 4,
          ),
          children: [
            AppImageCard(
              image: Container(
                color: AppColors.primary.withOpacity(0.1),
                child: const Center(
                  child: Icon(Icons.image, size: 64, color: AppColors.primary),
                ),
              ),
              overlay: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Image Card',
                    style: AppTypography.withColor(
                      AppTypography.h6,
                      Colors.white,
                    ),
                  ),
                  Text(
                    'With overlay content',
                    style: AppTypography.withColor(
                      AppTypography.bodySmall,
                      Colors.white70,
                    ),
                  ),
                ],
              ),
              height: 150,
            ),
            const AppActionCard(
              icon: Icons.analytics,
              title: 'Analytics',
              description: 'View your data insights',
            ),
            const AppActionCard(
              icon: Icons.settings,
              title: 'Settings',
              description: 'Configure your app',
            ),
            const AppActionCard(
              icon: Icons.help,
              title: 'Help',
              description: 'Get support',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interactive Cards', style: AppTypography.h4),
        AppSpacing.verticalMd,
        ResponsiveGrid(
          columns: const ResponsiveValue(
            mobile: 1,
            tablet: 2,
            desktop: 3,
            ultraWide: 4,
          ),
          children: [
            AppCard.elevated(
              onTap: () {
                // Handle tap
              },
              child: _buildSampleContent('Tappable Card'),
            ),
            AppCard.outlined(
              onTap: () {
                // Handle tap
              },
              onLongPress: () {
                // Handle long press
              },
              child: _buildSampleContent('Tap & Long Press'),
            ),
            AppCard.flat(
              backgroundColor: AppColors.success.withOpacity(0.1),
              borderColor: AppColors.success,
              borderWidth: 2,
              child: _buildSampleContent('Custom Colors'),
            ),
            AppCard.elevated(
              elevation: 5,
              borderRadius: BorderRadius.circular(24),
              child: _buildSampleContent('Custom Radius'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardExample(String title, Widget card, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.labelLarge),
        AppSpacing.verticalSm,
        card,
        AppSpacing.verticalSm,
        Container(
          padding: const EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(code, style: AppTypography.caption),
        ),
      ],
    );
  }

  Widget _buildSampleContent(String title, {bool isLight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: isLight
              ? AppTypography.withColor(AppTypography.h6, Colors.white)
              : AppTypography.h6,
        ),
        AppSpacing.verticalXs,
        Text(
          'This is sample content for the card component demonstration.',
          style: isLight
              ? AppTypography.withColor(AppTypography.bodySmall, Colors.white70)
              : AppTypography.bodySmall,
        ),
      ],
    );
  }
}

// ==========================================================================
// RESPONSIVE SECTION
// ==========================================================================

class ResponsiveSection extends StatelessWidget {
  const ResponsiveSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;
    final screenSize = context.screenSize;

    return SingleChildScrollView(
      padding: context.responsivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsive Utilities', style: AppTypography.h2),
          AppSpacing.verticalLg,

          // Info actual
          AppCard.outlined(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Screen Info', style: AppTypography.h5),
                AppSpacing.verticalMd,
                Text('Breakpoint: ${breakpoint.toString().split('.').last}'),
                Text(
                  'Size: ${screenSize.width.round()} x ${screenSize.height.round()}px',
                ),
                Text(
                  'Orientation: ${context.isPortrait ? 'Portrait' : 'Landscape'}',
                ),
                Text('Device: ${_getDeviceType(context)}'),
              ],
            ),
          ),

          AppSpacing.verticalXl,

          // Responsive Builder Example
          Text('ResponsiveBuilder Example', style: AppTypography.h4),
          AppSpacing.verticalMd,

          ResponsiveBuilder(
            mobile: (context) => _buildMobileExample(),
            tablet: (context) => _buildTabletExample(),
            desktop: (context) => _buildDesktopExample(),
          ),

          AppSpacing.verticalXl,

          // Responsive Grid Example
          Text('ResponsiveGrid Example', style: AppTypography.h4),
          AppSpacing.verticalMd,

          ResponsiveGrid(
            children: List.generate(
              12,
              (index) =>
                  AppCard.elevated(child: Center(child: Text('${index + 1}'))),
            ),
          ),

          AppSpacing.verticalXl,

          // Responsive Values Example
          Text('ResponsiveValue Example', style: AppTypography.h4),
          AppSpacing.verticalMd,

          AppCard.flat(
            padding: EdgeInsets.all(
              ResponsiveValue<double>(
                mobile: 16,
                tablet: 24,
                desktop: 32,
                ultraWide: 40,
              ).getValue(context),
            ),
            child: ResponsiveText(
              'This text and padding adapts to screen size',
              baseFontSize: 16,
              style: AppTypography.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileExample() {
    return AppCard.outlined(
      backgroundColor: AppColors.primary.withOpacity(0.1),
      child: Column(
        children: [
          const Icon(Icons.phone_android, size: 48),
          AppSpacing.verticalSm,
          Text('Mobile Layout', style: AppTypography.h5),
          const Text('Single column, stacked elements'),
        ],
      ),
    );
  }

  Widget _buildTabletExample() {
    return AppCard.outlined(
      backgroundColor: AppColors.secondary.withOpacity(0.1),
      child: Row(
        children: [
          const Icon(Icons.tablet_mac, size: 48),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tablet Layout', style: AppTypography.h5),
                const Text('Horizontal layout, more space'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopExample() {
    return AppCard.outlined(
      backgroundColor: AppColors.success.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Desktop Layout', style: AppTypography.h5),
                const Text('Full width, multiple columns, rich interactions'),
              ],
            ),
          ),
          AppSpacing.horizontalLg,
          const Icon(Icons.desktop_mac, size: 64),
          AppSpacing.horizontalMd,
          Column(
            children: [
              AppButton.primary(
                text: 'Action 1',
                size: ButtonSize.small,
                onPressed: () {},
              ),
              AppSpacing.verticalSm,
              AppButton.outline(
                text: 'Action 2',
                size: ButtonSize.small,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getDeviceType(BuildContext context) {
    if (context.isMobile) return 'Mobile';
    if (context.isTablet) return 'Tablet';
    if (context.isDesktop) return 'Desktop';
    if (context.isUltraWide) return 'Ultra Wide';
    return 'Unknown';
  }
}
