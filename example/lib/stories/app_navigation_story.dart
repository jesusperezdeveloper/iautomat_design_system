import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Página de ejemplos para el componente AppNavigation
class AppNavigationStory extends StatefulWidget {
  const AppNavigationStory({super.key});

  @override
  State<AppNavigationStory> createState() => _AppNavigationStoryState();
}

class _AppNavigationStoryState extends State<AppNavigationStory> {
  int _currentIndex = 0;
  AppNavigationVariant _selectedVariant = AppNavigationVariant.bottomBar;
  AppNavigationState _selectedState = AppNavigationState.defaultState;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _showBadges = false;

  final List<AppNavigationDestination> _destinations = [
    const AppNavigationDestination(
      id: 'home',
      label: 'Inicio',
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      tooltip: 'Página principal',
    ),
    const AppNavigationDestination(
      id: 'search',
      label: 'Buscar',
      icon: Icon(Icons.search_outlined),
      selectedIcon: Icon(Icons.search),
      tooltip: 'Buscar contenido',
    ),
    const AppNavigationDestination(
      id: 'favorites',
      label: 'Favoritos',
      icon: Icon(Icons.favorite_outline),
      selectedIcon: Icon(Icons.favorite),
      tooltip: 'Elementos favoritos',
    ),
    const AppNavigationDestination(
      id: 'profile',
      label: 'Perfil',
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      tooltip: 'Perfil de usuario',
    ),
    const AppNavigationDestination(
      id: 'settings',
      label: 'Configuración',
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      tooltip: 'Configuración de la aplicación',
    ),
  ];

  List<AppNavigationBadge> get _badges {
    if (!_showBadges) return [];
    return [
      const AppNavigationBadge(
        destinationId: 'search',
        count: 3,
        type: AppNavigationBadgeType.count,
      ),
      const AppNavigationBadge(
        destinationId: 'favorites',
        type: AppNavigationBadgeType.dot,
      ),
      const AppNavigationBadge(
        destinationId: 'profile',
        text: 'NEW',
        type: AppNavigationBadgeType.text,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppNavigation Stories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {
              _currentIndex = 0;
              _selectedVariant = AppNavigationVariant.bottomBar;
              _selectedState = AppNavigationState.defaultState;
              _isRtl = false;
              _enableA11y = true;
              _showBadges = false;
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
        DropdownButtonFormField<AppNavigationVariant>(
          initialValue: _selectedVariant,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: AppNavigationVariant.values
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
        DropdownButtonFormField<AppNavigationState>(
          initialValue: _selectedState,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: AppNavigationState.values
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
          subtitle: const Text('Mostrar notificaciones en destinos'),
          value: _showBadges,
          onChanged: (value) => setState(() {
            _showBadges = value;
          }),
          dense: true,
        ),

        const SizedBox(height: 16),

        // Información del índice actual
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
              Text('Índice seleccionado: $_currentIndex'),
              Text('Destino: ${_destinations[_currentIndex].label}'),
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

          // Contenido principal con navegación
          Expanded(child: _buildNavigationExample()),
        ],
      ),
    );
  }

  Widget _buildNavigationExample() {
    final config = AppNavigationComponentConfig(
      variant: _selectedVariant,
      state: _selectedState,
      isRtl: _isRtl,
      enableA11y: _enableA11y,
      destinations: _destinations,
      currentIndex: _currentIndex,
      badges: _badges,
      onTap: (index) => setState(() {
        _currentIndex = index;
      }),
      behavior: const AppNavigationBehavior(
        labelBehavior: AppNavigationLabelBehavior.alwaysShow,
        showTooltips: true,
        enableHapticFeedback: true,
      ),
      colors: AppNavigationColors(
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      spacing: const AppNavigationSpacing(
        iconSize: 24.0,
        labelSpacing: 4.0,
        itemPadding: 12.0,
        adaptive: true,
      ),
    );

    // Layout diferente según la variante
    switch (_selectedVariant) {
      case AppNavigationVariant.bottomBar:
        return Column(
          children: [
            Expanded(child: _buildPageContent()),
            AppNavigation(config: config),
          ],
        );

      case AppNavigationVariant.rail:
        return Row(
          children: [
            AppNavigation(config: config),
            const VerticalDivider(width: 1),
            Expanded(child: _buildPageContent()),
          ],
        );

      case AppNavigationVariant.drawer:
        return Scaffold(
          drawer: SizedBox(width: 280, child: AppNavigation(config: config)),
          body: _buildPageContent(),
          appBar: AppBar(
            title: const Text('Drawer Navigation'),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        );

      case AppNavigationVariant.permanentDrawer:
        return Row(
          children: [
            SizedBox(width: 280, child: AppNavigation(config: config)),
            const VerticalDivider(width: 1),
            Expanded(child: _buildPageContent()),
          ],
        );
    }
  }

  Widget _buildPageContent() {
    final destination = _destinations[_currentIndex];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: destination.selectedIcon ?? destination.icon,
          ),
          const SizedBox(height: 16),
          Text(
            destination.label,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            destination.tooltip ?? 'Contenido de ${destination.label}',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Información adicional según el estado
          if (_selectedState == AppNavigationState.loading)
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Cargando contenido...'),
              ],
            )
          else if (_selectedState == AppNavigationState.disabled)
            const Column(
              children: [
                Icon(Icons.block, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Navegación deshabilitada',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          else if (_selectedState == AppNavigationState.skeleton)
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
                        _buildInfoCard('Índice', '$_currentIndex'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_showBadges) ...[
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
                                  '${badge.destinationId}: ${badge.type.displayName}',
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

/// Ejemplo de navegación con diferentes configuraciones
class AppNavigationExamples extends StatelessWidget {
  const AppNavigationExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppNavigation - Ejemplos Rápidos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExampleCard(
            context,
            'Navegación Bottom Bar Básica',
            'Ejemplo simple con 3 destinos',
            () => _showBasicBottomNavExample(context),
          ),
          _buildExampleCard(
            context,
            'Navigation Rail con Badges',
            'Rail lateral con notificaciones',
            () => _showRailWithBadgesExample(context),
          ),
          _buildExampleCard(
            context,
            'Drawer Modal',
            'Cajón de navegación deslizable',
            () => _showDrawerExample(context),
          ),
          _buildExampleCard(
            context,
            'Estados Especiales',
            'Loading, skeleton y disabled',
            () => _showSpecialStatesExample(context),
          ),
          _buildExampleCard(
            context,
            'Soporte RTL',
            'Right-to-left languages',
            () => _showRtlExample(context),
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

  void _showBasicBottomNavExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _BasicBottomNavExample()));
  }

  void _showRailWithBadgesExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _RailWithBadgesExample()));
  }

  void _showDrawerExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _DrawerExample()));
  }

  void _showSpecialStatesExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _SpecialStatesExample()));
  }

  void _showRtlExample(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _RtlExample()));
  }
}

class _BasicBottomNavExample extends StatefulWidget {
  @override
  State<_BasicBottomNavExample> createState() => __BasicBottomNavExampleState();
}

class __BasicBottomNavExampleState extends State<_BasicBottomNavExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Navigation Básica')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Página ${_currentIndex + 1}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          AppNavigation(
            config: AppNavigationComponentConfig(
              variant: AppNavigationVariant.bottomBar,
              destinations: const [
                AppNavigationDestination(
                  id: 'home',
                  label: 'Inicio',
                  icon: Icon(Icons.home),
                ),
                AppNavigationDestination(
                  id: 'search',
                  label: 'Buscar',
                  icon: Icon(Icons.search),
                ),
                AppNavigationDestination(
                  id: 'profile',
                  label: 'Perfil',
                  icon: Icon(Icons.person),
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
        ],
      ),
    );
  }
}

class _RailWithBadgesExample extends StatefulWidget {
  @override
  State<_RailWithBadgesExample> createState() => __RailWithBadgesExampleState();
}

class __RailWithBadgesExampleState extends State<_RailWithBadgesExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Rail con Badges')),
      body: Row(
        children: [
          AppNavigation(
            config: AppNavigationComponentConfig(
              variant: AppNavigationVariant.rail,
              destinations: const [
                AppNavigationDestination(
                  id: 'inbox',
                  label: 'Bandeja',
                  icon: Icon(Icons.inbox),
                ),
                AppNavigationDestination(
                  id: 'notifications',
                  label: 'Notificaciones',
                  icon: Icon(Icons.notifications),
                ),
                AppNavigationDestination(
                  id: 'messages',
                  label: 'Mensajes',
                  icon: Icon(Icons.message),
                ),
              ],
              badges: const [
                AppNavigationBadge(
                  destinationId: 'notifications',
                  count: 5,
                  type: AppNavigationBadgeType.count,
                ),
                AppNavigationBadge(
                  destinationId: 'messages',
                  type: AppNavigationBadgeType.dot,
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Center(
              child: Text(
                'Contenido de navegación ${_currentIndex + 1}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerExample extends StatefulWidget {
  @override
  State<_DrawerExample> createState() => __DrawerExampleState();
}

class __DrawerExampleState extends State<_DrawerExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: SizedBox(
        width: 280,
        child: AppNavigation(
          config: AppNavigationComponentConfig(
            variant: AppNavigationVariant.drawer,
            destinations: const [
              AppNavigationDestination(
                id: 'dashboard',
                label: 'Dashboard',
                icon: Icon(Icons.dashboard),
              ),
              AppNavigationDestination(
                id: 'analytics',
                label: 'Analíticas',
                icon: Icon(Icons.analytics),
              ),
              AppNavigationDestination(
                id: 'settings',
                label: 'Configuración',
                icon: Icon(Icons.settings),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
              Navigator.of(context).pop(); // Cerrar drawer
            },
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Contenido principal ${_currentIndex + 1}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

class _SpecialStatesExample extends StatefulWidget {
  @override
  State<_SpecialStatesExample> createState() => __SpecialStatesExampleState();
}

class __SpecialStatesExampleState extends State<_SpecialStatesExample> {
  AppNavigationState _currentState = AppNavigationState.defaultState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estados Especiales'),
        actions: [
          DropdownButton<AppNavigationState>(
            value: _currentState,
            items: AppNavigationState.values
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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Estado actual: ${_currentState.displayName}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          AppNavigation(
            config: AppNavigationComponentConfig(
              variant: AppNavigationVariant.bottomBar,
              state: _currentState,
              destinations: const [
                AppNavigationDestination(
                  id: 'home',
                  label: 'Inicio',
                  icon: Icon(Icons.home),
                ),
                AppNavigationDestination(
                  id: 'work',
                  label: 'Trabajo',
                  icon: Icon(Icons.work),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RtlExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RTL Support')),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'نص تجريبي للعربية',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    const Text('התמיכה בשפות מימין לשמאל'),
                  ],
                ),
              ),
            ),
            AppNavigation(
              config: const AppNavigationComponentConfig(
                variant: AppNavigationVariant.bottomBar,
                isRtl: true,
                destinations: [
                  AppNavigationDestination(
                    id: 'home',
                    label: 'الرئيسية',
                    icon: Icon(Icons.home),
                  ),
                  AppNavigationDestination(
                    id: 'search',
                    label: 'البحث',
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
