import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/drawer/app_drawer.dart';

/// Stories para AppDrawer - Ejemplos interactivos del drawer
class DrawerStoryExample extends StatefulWidget {
  const DrawerStoryExample({super.key});

  @override
  State<DrawerStoryExample> createState() => _DrawerStoryExampleState();
}

class _DrawerStoryExampleState extends State<DrawerStoryExample> {
  DrawerVariant _variant = DrawerVariant.modal;
  DrawerSide _side = DrawerSide.left;
  AppDrawerState _drawerState = AppDrawerState.defaultState;
  double _width = 280.0;
  double _elevation = 16.0;
  double _borderRadius = 0.0;
  double _scrimOpacity = 0.5;
  bool _enableDragGesture = true;
  String _lastAction = 'Ninguna';
  String _visibilityStatus = 'Cerrado';

  final AppDrawerController _modalController = AppDrawerController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildDrawerContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Usuario Demo',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'usuario@iautomat.com',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // Navigation items
          Expanded(
            child: ListView(
              children: [
                _buildNavigationItem(Icons.home, 'Inicio'),
                _buildNavigationItem(Icons.dashboard, 'Dashboard'),
                _buildNavigationItem(Icons.analytics, 'Analíticas'),
                _buildNavigationItem(Icons.people, 'Usuarios'),
                _buildNavigationItem(Icons.settings, 'Configuración'),
                _buildNavigationItem(Icons.folder, 'Proyectos'),
                _buildNavigationItem(Icons.notifications, 'Notificaciones'),
                _buildNavigationItem(Icons.help, 'Ayuda'),

                const Divider(height: 32),

                _buildNavigationItem(Icons.logout, 'Cerrar sesión', isDestructive: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(IconData icon, String title, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        setState(() {
          _lastAction = 'Navegación: $title';
        });
        if (_variant == DrawerVariant.modal) {
          _modalController.close();
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  void _onDrawerStateChanged(AppDrawerState state) {
    setState(() {
      _drawerState = state;
      _lastAction = 'Estado cambiado: ${state.name}';
    });
  }

  void _onDrawerVisibilityChanged(bool visible) {
    setState(() {
      _visibilityStatus = visible ? 'Abierto' : 'Cerrado';
      _lastAction = 'Visibilidad: ${visible ? 'Mostrado' : 'Oculto'}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('AppDrawer Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: _variant == DrawerVariant.modal
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _modalController.open(),
            )
          : null,
        automaticallyImplyLeading: false,
      ),
      body: _variant == DrawerVariant.permanent
        ? Row(
            children: [
              // Permanent drawer
              AppDrawer.permanent(
                content: _buildDrawerContent(),
                side: _side,
                width: _width,
                state: _drawerState,
                elevation: _elevation,
                borderRadius: _borderRadius,
                onStateChanged: _onDrawerStateChanged,
                onVisibilityChanged: _onDrawerVisibilityChanged,
                semanticsLabel: 'Drawer de navegación permanente',
              ),
              // Main content
              Expanded(
                child: _buildMainContent(),
              ),
            ],
          )
        : Stack(
            children: [
              // Main content for modal drawer
              _buildMainContent(),

              // Modal drawer overlay
              if (_modalController.isOpen)
                AppDrawer.modal(
                  key: _modalController.key,
                  content: _buildDrawerContent(),
                  side: _side,
                  width: _width,
                  state: _drawerState,
                  elevation: _elevation,
                  borderRadius: _borderRadius,
                  scrimOpacity: _scrimOpacity,
                  enableDragGesture: _enableDragGesture,
                  onStateChanged: _onDrawerStateChanged,
                  onVisibilityChanged: _onDrawerVisibilityChanged,
                  semanticsLabel: 'Drawer de navegación modal',
                ),
            ],
          ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildControls(),
          const SizedBox(height: 32),
          _buildExamples(),
          const SizedBox(height: 32),
          _buildStates(),
          const SizedBox(height: 32),
          _buildPlatformExamples(),
          const SizedBox(height: 32),
          _buildAccessibilityExamples(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AppDrawer Component',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sistema de navegación lateral adaptativo con soporte modal y permanente.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estado actual:',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 4),
              Text('Variante: ${_variant.name}'),
              Text('Lado: ${_side.name}'),
              Text('Estado: ${_drawerState.name}'),
              Text('Visibilidad: $_visibilityStatus'),
              Text('Última acción: $_lastAction'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Variante:'),
                    DropdownButton<DrawerVariant>(
                      value: _variant,
                      onChanged: (value) => setState(() => _variant = value!),
                      items: DrawerVariant.values.map((variant) {
                        return DropdownMenuItem(
                          value: variant,
                          child: Text(variant.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Lado:'),
                    DropdownButton<DrawerSide>(
                      value: _side,
                      onChanged: (value) => setState(() => _side = value!),
                      items: DrawerSide.values.map((side) {
                        return DropdownMenuItem(
                          value: side,
                          child: Text(side.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Estado:'),
                    DropdownButton<AppDrawerState>(
                      value: _drawerState,
                      onChanged: (value) => setState(() => _drawerState = value!),
                      items: AppDrawerState.values.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ancho: ${_width.toInt()}px'),
                    Slider(
                      value: _width,
                      min: 200,
                      max: 400,
                      divisions: 20,
                      onChanged: (value) => setState(() => _width = value),
                    ),
                  ],
                ),
                if (_variant == DrawerVariant.modal) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Elevación: ${_elevation.toInt()}'),
                      Slider(
                        value: _elevation,
                        min: 0,
                        max: 24,
                        divisions: 12,
                        onChanged: (value) => setState(() => _elevation = value),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Opacidad de fondo: ${(_scrimOpacity * 100).toInt()}%'),
                      Slider(
                        value: _scrimOpacity,
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                        onChanged: (value) => setState(() => _scrimOpacity = value),
                      ),
                    ],
                  ),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Border Radius: ${_borderRadius.toInt()}'),
                    Slider(
                      value: _borderRadius,
                      min: 0,
                      max: 20,
                      divisions: 10,
                      onChanged: (value) => setState(() => _borderRadius = value),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_variant == DrawerVariant.modal)
              SwitchListTile(
                title: const Text('Habilitar gestos de arrastre'),
                value: _enableDragGesture,
                onChanged: (value) => setState(() => _enableDragGesture = value),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Variantes del Drawer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildModalExample(),
            _buildPermanentExample(),
          ],
        ),
      ],
    );
  }

  Widget _buildModalExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Modal Drawer',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Drawer modal que se superpone al contenido principal. Ideal para móviles.',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _variant = DrawerVariant.modal;
                });
                _modalController.open();
              },
              child: const Text('Mostrar Modal Drawer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermanentExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Permanent Drawer',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Drawer permanente siempre visible. Ideal para escritorio.',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _variant = DrawerVariant.permanent;
                });
              },
              child: const Text('Cambiar a Permanent Drawer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStates() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estados del Drawer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: AppDrawerState.values.map((state) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  _drawerState = state;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: state == _drawerState
                  ? Theme.of(context).colorScheme.primary
                  : null,
                foregroundColor: state == _drawerState
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
              ),
              child: Text(state.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPlatformExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ejemplos Platform-Adaptive',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'El drawer se adapta automáticamente a la plataforma:',
                ),
                const SizedBox(height: 8),
                const Text('• Android: Material Design 3 con elevación'),
                const Text('• iOS: Adaptaciones visuales suaves'),
                const Text('• Web: Soporte completo de teclado y mouse'),
                const Text('• Desktop: Drawer permanente recomendado'),
                const SizedBox(height: 16),
                Text(
                  'Plataforma actual: ${Theme.of(context).platform.name}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccessibilityExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Características de Accesibilidad',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('✓ Navegación por teclado (Tab, Enter, Esc)'),
                const Text('✓ Etiquetas semánticas para screen readers'),
                const Text('✓ Focus management automático'),
                const Text('✓ Soporte RTL completo'),
                const Text('✓ Gestos de arrastre configurables'),
                const Text('✓ Estados hover/focus/pressed'),
                const Text('✓ Restoration API para estado persistente'),
                const Text('✓ Contraste de colores WCAG 2.1'),
                const SizedBox(height: 16),
                const Text(
                  'Controles:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const Text('• Tab: Navegar entre elementos'),
                const Text('• Enter/Space: Activar elementos'),
                const Text('• Esc: Cerrar drawer modal'),
                const Text('• Arrastrar: Abrir/cerrar (móvil)'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}