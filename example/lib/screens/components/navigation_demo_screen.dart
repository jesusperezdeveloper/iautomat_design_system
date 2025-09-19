import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class NavigationDemoScreen extends StatefulWidget {
  const NavigationDemoScreen({super.key});

  @override
  State<NavigationDemoScreen> createState() => _NavigationDemoScreenState();
}

class _NavigationDemoScreenState extends State<NavigationDemoScreen> {
  int _currentIndex = 0;
  int _railIndex = 0;
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Navegación Demo'),
        backRoute: '/components',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Componentes de Navegación', style: DSTypography.h2),
            const SizedBox(height: 24),

            // Tab Bar Section
            _buildSection(
              'Tab Bar',
              'Navegación por pestañas',
              _buildTabBarDemo(),
            ),

            // Bottom Navigation Section
            _buildSection(
              'Bottom Navigation Bar',
              'Navegación inferior',
              _buildBottomNavigationDemo(),
            ),

            // Navigation Rail Section
            _buildSection(
              'Navigation Rail',
              'Navegación lateral',
              _buildNavigationRailDemo(),
            ),

            // Drawer Section
            _buildSection(
              'Navigation Drawer',
              'Menú lateral deslizable',
              _buildDrawerDemo(),
            ),

            // Breadcrumbs Section
            _buildSection(
              'Breadcrumbs',
              'Navegación por rutas',
              _buildBreadcrumbsDemo(),
            ),

            // Stepper Section
            _buildSection(
              'Stepper',
              'Navegación paso a paso',
              _buildStepperDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h4),
        const SizedBox(height: 8),
        Text(description, style: DSTypography.bodyMedium.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        )),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTabBarDemo() {
    return DefaultTabController(
      length: 4,
      initialIndex: _tabIndex,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
            tabs: const [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.explore), text: 'Explorar'),
              Tab(icon: Icon(Icons.favorite), text: 'Favoritos'),
              Tab(icon: Icon(Icons.person), text: 'Perfil'),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                _buildTabContent('Contenido de Inicio', Icons.home),
                _buildTabContent('Contenido de Explorar', Icons.explore),
                _buildTabContent('Contenido de Favoritos', Icons.favorite),
                _buildTabContent('Contenido de Perfil', Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(title, style: DSTypography.h6),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationDemo() {
    return Column(
      children: [
        Text('Índice actual: $_currentIndex', style: DSTypography.bodyLarge),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).colorScheme.surface,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notificaciones',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Cuenta',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationRailDemo() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: NavigationRail(
            selectedIndex: _railIndex,
            onDestinationSelected: (index) {
              setState(() {
                _railIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Inicio'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('Guardados'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Configuración'),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_getRailIcon(_railIndex), size: 48),
                  const SizedBox(height: 8),
                  Text(_getRailTitle(_railIndex), style: DSTypography.h6),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _getRailIcon(int index) {
    switch (index) {
      case 0: return Icons.home;
      case 1: return Icons.bookmark;
      case 2: return Icons.settings;
      default: return Icons.home;
    }
  }

  String _getRailTitle(int index) {
    switch (index) {
      case 0: return 'Página de Inicio';
      case 1: return 'Elementos Guardados';
      case 2: return 'Configuración';
      default: return 'Inicio';
    }
  }

  Widget _buildDrawerDemo() {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => _showDrawerDialog(),
          icon: const Icon(Icons.menu),
          label: const Text('Mostrar Navigation Drawer'),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Icon(Icons.menu, size: 48),
              const SizedBox(height: 8),
              Text('Navigation Drawer', style: DSTypography.h6),
              const SizedBox(height: 4),
              Text('Menú lateral con opciones de navegación', style: DSTypography.bodySmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBreadcrumbsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Simple Breadcrumb
        Row(
          children: [
            TextButton(
              onPressed: () => _showResult('Navegando a Inicio'),
              child: const Text('Inicio'),
            ),
            const Icon(Icons.chevron_right),
            TextButton(
              onPressed: () => _showResult('Navegando a Productos'),
              child: const Text('Productos'),
            ),
            const Icon(Icons.chevron_right),
            Text('Detalles', style: DSTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )),
          ],
        ),
        const SizedBox(height: 16),

        // Styled Breadcrumb
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home, size: 16, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () => _showResult('Navegando a Inicio'),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                child: const Text('Inicio'),
              ),
              const Text(' / '),
              TextButton(
                onPressed: () => _showResult('Navegando a Categoría'),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                child: const Text('Categoría'),
              ),
              const Text(' / '),
              Text('Elemento actual', style: DSTypography.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepperDemo() {
    return Column(
      children: [
        const Text('Proceso de configuración'),
        const SizedBox(height: 16),
        Stepper(
          currentStep: 1,
          controlsBuilder: (context, details) {
            return Row(
              children: [
                if (details.stepIndex < 2)
                  ElevatedButton(
                    onPressed: () => _showResult('Siguiente paso'),
                    child: const Text('Siguiente'),
                  ),
                if (details.stepIndex > 0) ...[
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => _showResult('Paso anterior'),
                    child: const Text('Anterior'),
                  ),
                ],
              ],
            );
          },
          steps: [
            Step(
              title: const Text('Información básica'),
              content: const Text('Complete sus datos personales'),
              isActive: true,
              state: StepState.complete,
            ),
            Step(
              title: const Text('Configuración'),
              content: const Text('Configure sus preferencias'),
              isActive: true,
              state: StepState.indexed,
            ),
            Step(
              title: const Text('Confirmación'),
              content: const Text('Revise y confirme su información'),
              isActive: false,
              state: StepState.disabled,
            ),
          ],
        ),
      ],
    );
  }

  void _showDrawerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 280,
            height: 400,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.onPrimary,
                          child: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Usuario Demo',
                          style: DSTypography.h6.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          'usuario@ejemplo.com',
                          style: DSTypography.bodySmall.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Inicio'),
                    onTap: () {
                      Navigator.pop(context);
                      _showResult('Navegando a Inicio');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configuración'),
                    onTap: () {
                      Navigator.pop(context);
                      _showResult('Navegando a Configuración');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Ayuda'),
                    onTap: () {
                      Navigator.pop(context);
                      _showResult('Navegando a Ayuda');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Cerrar sesión'),
                    onTap: () {
                      Navigator.pop(context);
                      _showResult('Cerrando sesión');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}