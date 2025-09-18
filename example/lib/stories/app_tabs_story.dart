import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Página de ejemplos para el componente AppTabs
class AppTabsStory extends StatefulWidget {
  const AppTabsStory({super.key});

  @override
  State<AppTabsStory> createState() => _AppTabsStoryState();
}

class _AppTabsStoryState extends State<AppTabsStory>
    with TickerProviderStateMixin {
  late TabController _tabController;
  AppTabsVariant _selectedVariant = AppTabsVariant.fixed;
  AppTabsState _selectedState = AppTabsState.defaultState;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _showBadges = false;
  AppTabType _selectedTabType = AppTabType.text;

  final List<AppTabItem> _basicTabs = [
    const AppTabItem(
      id: 'tab1',
      text: 'Inicio',
      icon: Icon(Icons.home),
      tooltip: 'Página principal',
    ),
    const AppTabItem(
      id: 'tab2',
      text: 'Explorar',
      icon: Icon(Icons.explore),
      tooltip: 'Explorar contenido',
    ),
    const AppTabItem(
      id: 'tab3',
      text: 'Favoritos',
      icon: Icon(Icons.favorite),
      tooltip: 'Elementos favoritos',
    ),
    const AppTabItem(
      id: 'tab4',
      text: 'Perfil',
      icon: Icon(Icons.person),
      tooltip: 'Perfil de usuario',
    ),
    const AppTabItem(
      id: 'tab5',
      text: 'Configuración',
      icon: Icon(Icons.settings),
      tooltip: 'Configuración',
    ),
  ];

  List<AppTabBadge> get _badges {
    if (!_showBadges) return [];
    return [
      const AppTabBadge(tabId: 'tab2', count: 3, type: AppTabBadgeType.count),
      const AppTabBadge(tabId: 'tab3', type: AppTabBadgeType.dot),
      const AppTabBadge(tabId: 'tab4', text: 'NEW', type: AppTabBadgeType.text),
    ];
  }

  List<AppTabItem> get _displayTabs {
    return _basicTabs.map((tab) {
      switch (_selectedTabType) {
        case AppTabType.text:
          return tab.copyWith(type: AppTabType.text, icon: null);
        case AppTabType.icon:
          return tab.copyWith(type: AppTabType.icon, text: '');
        case AppTabType.textWithIcon:
          return tab.copyWith(type: AppTabType.textWithIcon);
        case AppTabType.custom:
          return tab.copyWith(
            type: AppTabType.custom,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                tab.icon ?? const Icon(Icons.tab),
                const SizedBox(height: 2),
                Text(tab.text, style: const TextStyle(fontSize: 10)),
              ],
            ),
          );
      }
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _basicTabs.length, vsync: this);
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
        title: const Text('AppTabs Stories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {
              _selectedVariant = AppTabsVariant.fixed;
              _selectedState = AppTabsState.defaultState;
              _isRtl = false;
              _enableA11y = true;
              _showBadges = false;
              _selectedTabType = AppTabType.text;
              _tabController.animateTo(0);
            }),
            tooltip: 'Resetear configuración',
          ),
        ],
      ),
      body: Row(
        children: [
          // Panel de configuración
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                right: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: _buildConfigPanel(),
          ),
          // Vista principal con ejemplos
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }

  Widget _buildConfigPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Configuración', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),

        // Variante
        Text('Variante', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<AppTabsVariant>(
          initialValue: _selectedVariant,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: AppTabsVariant.values
              .map(
                (variant) => DropdownMenuItem(
                  value: variant,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(variant.displayName),
                      Text(
                        variant.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) => setState(() {
            _selectedVariant = value!;
          }),
        ),

        const SizedBox(height: 16),

        // Estado
        Text('Estado', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<AppTabsState>(
          initialValue: _selectedState,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: AppTabsState.values
              .map(
                (state) => DropdownMenuItem(
                  value: state,
                  child: Text(state.displayName),
                ),
              )
              .toList(),
          onChanged: (value) => setState(() {
            _selectedState = value!;
          }),
        ),

        const SizedBox(height: 16),

        // Tipo de Tab
        Text('Tipo de Tab', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<AppTabType>(
          initialValue: _selectedTabType,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: AppTabType.values
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(type.displayName),
                ),
              )
              .toList(),
          onChanged: (value) => setState(() {
            _selectedTabType = value!;
          }),
        ),

        const SizedBox(height: 16),

        // Configuraciones adicionales
        Text('Opciones', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),

        SwitchListTile(
          title: const Text('RTL (Right-to-Left)'),
          subtitle: const Text('Soporte para idiomas RTL'),
          value: _isRtl,
          onChanged: (value) => setState(() {
            _isRtl = value;
          }),
          dense: true,
        ),

        SwitchListTile(
          title: const Text('Accesibilidad'),
          subtitle: const Text('Habilitar características a11y'),
          value: _enableA11y,
          onChanged: (value) => setState(() {
            _enableA11y = value;
          }),
          dense: true,
        ),

        SwitchListTile(
          title: const Text('Mostrar badges'),
          subtitle: const Text('Mostrar notificaciones en tabs'),
          value: _showBadges,
          onChanged: (value) => setState(() {
            _showBadges = value;
          }),
          dense: true,
        ),

        const SizedBox(height: 16),

        // Información del tab actual
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estado actual',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text('Tab seleccionado: ${_tabController.index}'),
              Text('Texto: ${_displayTabs[_tabController.index].text}'),
              Text('Tipo: ${_selectedTabType.displayName}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return Directionality(
      textDirection: _isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        children: [
          // Header con información
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vista Previa - ${_selectedVariant.displayName}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  _selectedVariant.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Chip(
                      label: Text('Estado: ${_selectedState.displayName}'),
                      backgroundColor: _selectedState.isInteractive
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.errorContainer,
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text('Tipo: ${_selectedTabType.displayName}'),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.secondaryContainer,
                    ),
                    const SizedBox(width: 8),
                    if (_showBadges)
                      const Chip(
                        label: Text('Con badges'),
                        backgroundColor: Colors.orange,
                      ),
                    if (_isRtl)
                      const Chip(
                        label: Text('RTL'),
                        backgroundColor: Colors.purple,
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Componente AppTabs con contenido
          Expanded(child: _buildTabsExample()),
        ],
      ),
    );
  }

  Widget _buildTabsExample() {
    final config = AppTabsConfig(
      variant: _selectedVariant,
      state: _selectedState,
      isRtl: _isRtl,
      enableA11y: _enableA11y,
      tabs: _displayTabs,
      badges: _showBadges && _selectedVariant == AppTabsVariant.withBadges
          ? _badges
          : [],
      onChanged: (index) => setState(() {
        _tabController.animateTo(index);
      }),
      behavior: AppTabsBehavior(
        isScrollable: _selectedVariant.isScrollable,
        showTooltips: true,
        enableHapticFeedback: true,
        tabAlignment: _selectedVariant.defaultAlignment,
      ),
      colors: AppTabsColors(
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedLabelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
        indicatorColor: Theme.of(context).colorScheme.primary,
      ),
      spacing: const AppTabsSpacing(
        iconSize: 24.0,
        labelPadding: 8.0,
        tabPadding: 16.0,
        adaptive: true,
      ),
    );

    final children = _displayTabs.map((tab) => _buildTabContent(tab)).toList();

    return AppTabs(
      config: config,
      controller: _tabController,
      children: children,
    );
  }

  Widget _buildTabContent(AppTabItem tab) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: tab.icon ?? const Icon(Icons.tab, size: 48),
          ),
          const SizedBox(height: 24),
          Text(
            tab.text.isNotEmpty
                ? tab.text
                : 'Tab ${_displayTabs.indexOf(tab) + 1}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            tab.tooltip ?? 'Contenido del tab ${tab.text}',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Información adicional según el estado
          if (_selectedState == AppTabsState.loading)
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Cargando contenido del tab...'),
              ],
            )
          else if (_selectedState == AppTabsState.disabled)
            const Column(
              children: [
                Icon(Icons.block, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Tabs deshabilitados',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          else if (_selectedState == AppTabsState.skeleton)
            Column(
              children: [
                Container(
                  width: 200,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 150,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            )
          else
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoCard(
                          'Variante',
                          _selectedVariant.displayName,
                        ),
                        _buildInfoCard('Estado', _selectedState.displayName),
                        _buildInfoCard('Tipo', _selectedTabType.displayName),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_showBadges &&
                        _selectedVariant == AppTabsVariant.withBadges) ...[
                      const Text(
                        'Badges activos:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _badges
                            .map(
                              (badge) => Chip(
                                label: Text(
                                  '${badge.tabId}: ${badge.type.displayName}',
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

/// Ejemplos rápidos de AppTabs
class AppTabsExamples extends StatelessWidget {
  const AppTabsExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppTabs - Ejemplos Rápidos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExampleCard(
            context,
            'Tabs Fijos Básicos',
            'Pestañas de ancho fijo con texto',
            () => _showBasicFixedTabsExample(context),
          ),
          _buildExampleCard(
            context,
            'Tabs Desplazables',
            'Pestañas horizontales con scroll',
            () => _showScrollableTabsExample(context),
          ),
          _buildExampleCard(
            context,
            'Tabs con Badges',
            'Pestañas con notificaciones',
            () => _showTabsWithBadgesExample(context),
          ),
          _buildExampleCard(
            context,
            'Tabs con Iconos',
            'Pestañas solo con iconos',
            () => _showIconTabsExample(context),
          ),
          _buildExampleCard(
            context,
            'Tabs Texto + Icono',
            'Pestañas con texto e iconos',
            () => _showTextIconTabsExample(context),
          ),
          _buildExampleCard(
            context,
            'Estados Especiales',
            'Loading, skeleton y disabled',
            () => _showSpecialStatesExample(context),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    String title,
    String description,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void _showBasicFixedTabsExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _BasicFixedTabsExample()));
  }

  void _showScrollableTabsExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _ScrollableTabsExample()));
  }

  void _showTabsWithBadgesExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _TabsWithBadgesExample()));
  }

  void _showIconTabsExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _IconTabsExample()));
  }

  void _showTextIconTabsExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _TextIconTabsExample()));
  }

  void _showSpecialStatesExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _SpecialStatesExample()));
  }
}

class _BasicFixedTabsExample extends StatefulWidget {
  @override
  State<_BasicFixedTabsExample> createState() => __BasicFixedTabsExampleState();
}

class __BasicFixedTabsExampleState extends State<_BasicFixedTabsExample>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs Fijos Básicos')),
      body: AppTabs(
        config: const AppTabsConfig(
          variant: AppTabsVariant.fixed,
          tabs: [
            AppTabItem(id: 'home', text: 'Inicio'),
            AppTabItem(id: 'search', text: 'Buscar'),
            AppTabItem(id: 'profile', text: 'Perfil'),
          ],
        ),
        controller: _controller,
        children: const [
          Center(
            child: Text('Contenido de Inicio', style: TextStyle(fontSize: 24)),
          ),
          Center(
            child: Text(
              'Contenido de Búsqueda',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Center(
            child: Text('Contenido de Perfil', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}

class _ScrollableTabsExample extends StatefulWidget {
  @override
  State<_ScrollableTabsExample> createState() => __ScrollableTabsExampleState();
}

class __ScrollableTabsExampleState extends State<_ScrollableTabsExample>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs Desplazables')),
      body: AppTabs(
        config: const AppTabsConfig(
          variant: AppTabsVariant.scrollable,
          tabs: [
            AppTabItem(id: 'tech', text: 'Tecnología'),
            AppTabItem(id: 'design', text: 'Diseño'),
            AppTabItem(id: 'business', text: 'Negocios'),
            AppTabItem(id: 'marketing', text: 'Marketing'),
            AppTabItem(id: 'dev', text: 'Desarrollo'),
            AppTabItem(id: 'data', text: 'Análisis de Datos'),
          ],
        ),
        controller: _controller,
        children: List.generate(6, (index) {
          final topics = [
            'Tecnología',
            'Diseño',
            'Negocios',
            'Marketing',
            'Desarrollo',
            'Análisis de Datos',
          ];
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.category,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Contenido de ${topics[index]}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _TabsWithBadgesExample extends StatefulWidget {
  @override
  State<_TabsWithBadgesExample> createState() => __TabsWithBadgesExampleState();
}

class __TabsWithBadgesExampleState extends State<_TabsWithBadgesExample>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs con Badges')),
      body: AppTabs(
        config: const AppTabsConfig(
          variant: AppTabsVariant.withBadges,
          tabs: [
            AppTabItem(id: 'inbox', text: 'Bandeja', icon: Icon(Icons.inbox)),
            AppTabItem(
              id: 'messages',
              text: 'Mensajes',
              icon: Icon(Icons.message),
            ),
            AppTabItem(
              id: 'notifications',
              text: 'Notificaciones',
              icon: Icon(Icons.notifications),
            ),
            AppTabItem(
              id: 'updates',
              text: 'Actualizaciones',
              icon: Icon(Icons.update),
            ),
          ],
          badges: [
            AppTabBadge(tabId: 'inbox', count: 12, type: AppTabBadgeType.count),
            AppTabBadge(tabId: 'messages', type: AppTabBadgeType.dot),
            AppTabBadge(
              tabId: 'notifications',
              count: 5,
              type: AppTabBadgeType.count,
            ),
            AppTabBadge(
              tabId: 'updates',
              text: 'NEW',
              type: AppTabBadgeType.text,
            ),
          ],
        ),
        controller: _controller,
        children: const [
          Center(
            child: Text(
              'Bandeja de entrada (12 nuevos)',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text('Mensajes (nuevo)', style: TextStyle(fontSize: 18)),
          ),
          Center(
            child: Text(
              'Notificaciones (5 nuevas)',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              'Actualizaciones disponibles',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconTabsExample extends StatefulWidget {
  @override
  State<_IconTabsExample> createState() => __IconTabsExampleState();
}

class __IconTabsExampleState extends State<_IconTabsExample>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs con Iconos')),
      body: AppTabs(
        config: const AppTabsConfig(
          variant: AppTabsVariant.fixed,
          tabs: [
            AppTabItem(
              id: 'dashboard',
              text: 'Dashboard',
              type: AppTabType.icon,
              icon: Icon(Icons.dashboard),
              tooltip: 'Panel de control',
            ),
            AppTabItem(
              id: 'analytics',
              text: 'Analytics',
              type: AppTabType.icon,
              icon: Icon(Icons.analytics),
              tooltip: 'Análisis y métricas',
            ),
            AppTabItem(
              id: 'reports',
              text: 'Reports',
              type: AppTabType.icon,
              icon: Icon(Icons.assessment),
              tooltip: 'Reportes',
            ),
            AppTabItem(
              id: 'settings',
              text: 'Settings',
              type: AppTabType.icon,
              icon: Icon(Icons.settings),
              tooltip: 'Configuración',
            ),
          ],
        ),
        controller: _controller,
        children: const [
          Center(
            child: Text('Panel de Control', style: TextStyle(fontSize: 24)),
          ),
          Center(
            child: Text('Análisis y Métricas', style: TextStyle(fontSize: 24)),
          ),
          Center(child: Text('Reportes', style: TextStyle(fontSize: 24))),
          Center(child: Text('Configuración', style: TextStyle(fontSize: 24))),
        ],
      ),
    );
  }
}

class _TextIconTabsExample extends StatefulWidget {
  @override
  State<_TextIconTabsExample> createState() => __TextIconTabsExampleState();
}

class __TextIconTabsExampleState extends State<_TextIconTabsExample>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs Texto + Icono')),
      body: AppTabs(
        config: const AppTabsConfig(
          variant: AppTabsVariant.scrollable,
          tabs: [
            AppTabItem(
              id: 'projects',
              text: 'Proyectos',
              type: AppTabType.textWithIcon,
              icon: Icon(Icons.work),
            ),
            AppTabItem(
              id: 'team',
              text: 'Equipo',
              type: AppTabType.textWithIcon,
              icon: Icon(Icons.group),
            ),
            AppTabItem(
              id: 'calendar',
              text: 'Calendario',
              type: AppTabType.textWithIcon,
              icon: Icon(Icons.calendar_today),
            ),
          ],
        ),
        controller: _controller,
        children: const [
          Center(
            child: Text('Gestión de Proyectos', style: TextStyle(fontSize: 24)),
          ),
          Center(
            child: Text('Gestión de Equipo', style: TextStyle(fontSize: 24)),
          ),
          Center(
            child: Text('Vista de Calendario', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}

class _SpecialStatesExample extends StatefulWidget {
  @override
  State<_SpecialStatesExample> createState() => __SpecialStatesExampleState();
}

class __SpecialStatesExampleState extends State<_SpecialStatesExample>
    with TickerProviderStateMixin {
  late TabController _controller;
  AppTabsState _currentState = AppTabsState.defaultState;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estados Especiales'),
        actions: [
          DropdownButton<AppTabsState>(
            value: _currentState,
            items: AppTabsState.values
                .map(
                  (state) => DropdownMenuItem(
                    value: state,
                    child: Text(state.displayName),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => _currentState = value!),
          ),
        ],
      ),
      body: AppTabs(
        config: AppTabsConfig(
          variant: AppTabsVariant.fixed,
          state: _currentState,
          tabs: const [
            AppTabItem(id: 'data', text: 'Datos'),
            AppTabItem(id: 'charts', text: 'Gráficos'),
          ],
        ),
        controller: _controller,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Estado actual: ${_currentState.displayName}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                const Text('Contenido de Datos'),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Estado actual: ${_currentState.displayName}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                const Text('Contenido de Gráficos'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
