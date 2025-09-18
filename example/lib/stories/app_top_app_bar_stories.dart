import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppTopAppBarStories extends StatefulWidget {
  const AppTopAppBarStories({super.key});

  @override
  State<AppTopAppBarStories> createState() => _AppTopAppBarStoriesState();
}

class _AppTopAppBarStoriesState extends State<AppTopAppBarStories> {
  int _currentStory = 0;

  final List<StoryItem> _stories = [
    StoryItem(
      title: 'Primary AppBar',
      description: 'AppBar estándar con configuración primaria',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(variant: AppTopAppBarVariant.primary),
          title: Text('Primary AppBar'),
        ),
      ),
    ),
    StoryItem(
      title: 'Center AppBar',
      description: 'AppBar con título centrado',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(variant: AppTopAppBarVariant.center),
          title: Text('Center AppBar'),
        ),
      ),
    ),
    StoryItem(
      title: 'Large AppBar',
      description: 'AppBar grande con título prominente',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(variant: AppTopAppBarVariant.large),
          title: Text('Large AppBar'),
        ),
      ),
    ),
    StoryItem(
      title: 'Collapsed AppBar',
      description: 'AppBar colapsado para espacios reducidos',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(variant: AppTopAppBarVariant.collapsed),
          title: Text('Collapsed'),
        ),
      ),
    ),
    StoryItem(
      title: 'Loading State',
      description: 'AppBar en estado de carga',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(state: AppTopAppBarState.loading),
        ),
      ),
    ),
    StoryItem(
      title: 'Skeleton State',
      description: 'AppBar con esqueleto de carga',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(state: AppTopAppBarState.skeleton),
        ),
      ),
    ),
    StoryItem(
      title: 'Disabled State',
      description: 'AppBar en estado deshabilitado',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(state: AppTopAppBarState.disabled),
          title: Text('Disabled AppBar'),
        ),
      ),
    ),
    StoryItem(
      title: 'RTL Support',
      description: 'AppBar con soporte para dirección RTL',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(isRtl: true),
          title: Text('مرحبا بك'),
        ),
      ),
    ),
    StoryItem(
      title: 'With Actions',
      description: 'AppBar con acciones personalizadas',
      builder: (context) => _DemoScaffold(
        appBar: AppTopAppBar(
          config: const AppTopAppBarConfig(
            actions: AppTopAppBarActions(
              primary: [
                AppTopAppBarAction(
                  id: 'search',
                  icon: Icon(Icons.search),
                  tooltip: 'Buscar',
                ),
                AppTopAppBarAction(
                  id: 'favorite',
                  icon: Icon(Icons.favorite),
                  tooltip: 'Favoritos',
                ),
                AppTopAppBarAction(
                  id: 'share',
                  icon: Icon(Icons.share),
                  tooltip: 'Compartir',
                ),
              ],
            ),
          ),
          title: const Text('Con Acciones'),
        ),
      ),
    ),
    StoryItem(
      title: 'Actions Overflow',
      description: 'AppBar con desbordamiento de acciones',
      builder: (context) => _DemoScaffold(
        appBar: AppTopAppBar(
          config: const AppTopAppBarConfig(
            actions: AppTopAppBarActions(
              maxPrimary: 2,
              primary: [
                AppTopAppBarAction(
                  id: 'search',
                  icon: Icon(Icons.search),
                  tooltip: 'Buscar',
                ),
                AppTopAppBarAction(
                  id: 'favorite',
                  icon: Icon(Icons.favorite),
                  tooltip: 'Favoritos',
                ),
                AppTopAppBarAction(
                  id: 'share',
                  icon: Icon(Icons.share),
                  tooltip: 'Compartir',
                ),
                AppTopAppBarAction(
                  id: 'download',
                  icon: Icon(Icons.download),
                  tooltip: 'Descargar',
                ),
                AppTopAppBarAction(
                  id: 'edit',
                  icon: Icon(Icons.edit),
                  tooltip: 'Editar',
                ),
              ],
            ),
          ),
          title: const Text('Overflow'),
        ),
      ),
    ),
    StoryItem(
      title: 'With Navigation',
      description: 'AppBar con icono de navegación personalizado',
      builder: (context) => _DemoScaffold(
        appBar: AppTopAppBar(
          config: AppTopAppBarConfig(
            navigationIcon: AppTopAppBarNavigationIcon(
              type: AppTopAppBarNavigationType.menu,
              tooltip: 'Menú',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Menú presionado')),
                );
              },
            ),
          ),
          title: const Text('Con Navegación'),
        ),
      ),
    ),
    StoryItem(
      title: 'Back Navigation',
      description: 'AppBar con botón de retroceso',
      builder: (context) => _DemoScaffold(
        appBar: AppTopAppBar(
          config: AppTopAppBarConfig(
            navigationIcon: AppTopAppBarNavigationIcon(
              type: AppTopAppBarNavigationType.back,
              tooltip: 'Atrás',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Atrás presionado')),
                );
              },
            ),
          ),
          title: const Text('Navegación Atrás'),
        ),
      ),
    ),
    StoryItem(
      title: 'Mixed Action Types',
      description: 'AppBar con diferentes tipos de acciones',
      builder: (context) => _DemoScaffold(
        appBar: AppTopAppBar(
          config: AppTopAppBarConfig(
            actions: AppTopAppBarActions(
              primary: [
                AppTopAppBarAction(
                  id: 'icon',
                  type: AppTopAppBarActionType.icon,
                  icon: const Icon(Icons.star),
                  tooltip: 'Favorito',
                  onPressed: () => _showSnackBar(context, 'Favorito'),
                ),
                AppTopAppBarAction(
                  id: 'text',
                  type: AppTopAppBarActionType.text,
                  text: 'SAVE',
                  onPressed: () => _showSnackBar(context, 'Guardar'),
                ),
                AppTopAppBarAction(
                  id: 'iconText',
                  type: AppTopAppBarActionType.iconText,
                  icon: const Icon(Icons.share),
                  text: 'Share',
                  onPressed: () => _showSnackBar(context, 'Compartir'),
                ),
              ],
            ),
          ),
          title: const Text('Tipos Mixtos'),
        ),
      ),
    ),
    StoryItem(
      title: 'Custom Colors',
      description: 'AppBar con colores personalizados',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(
            colors: AppTopAppBarColors(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              iconColor: Colors.amber,
            ),
          ),
          title: Text('Colores Personalizados'),
          actions: [
            Icon(Icons.star),
            SizedBox(width: 8),
            Icon(Icons.favorite),
            SizedBox(width: 16),
          ],
        ),
      ),
    ),
    StoryItem(
      title: 'Custom Typography',
      description: 'AppBar con tipografía personalizada',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(
            typography: AppTopAppBarTypography(
              titleStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          title: Text('Tipografía Custom'),
        ),
      ),
    ),
    StoryItem(
      title: 'Custom Elevation',
      description: 'AppBar con elevación personalizada',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(
            elevation: AppTopAppBarElevation(
              defaultElevation: 8.0,
              scrolledElevation: 12.0,
              shadowColor: Colors.purple,
            ),
          ),
          title: Text('Elevación Custom'),
        ),
      ),
    ),
    StoryItem(
      title: 'Custom Spacing',
      description: 'AppBar con espaciado personalizado',
      builder: (context) => _DemoScaffold(
        appBar: const AppTopAppBar(
          config: AppTopAppBarConfig(
            spacing: AppTopAppBarSpacing(
              titlePadding: 32.0,
              actionPadding: 16.0,
              minHeight: 72.0,
            ),
          ),
          title: Text('Espaciado Custom'),
          actions: [Icon(Icons.settings), SizedBox(width: 16)],
        ),
      ),
    ),
    StoryItem(
      title: 'Complete Example',
      description: 'Ejemplo completo con todas las características',
      builder: (context) => _DemoScaffold(
        appBar: AppTopAppBar(
          config: AppTopAppBarConfig(
            variant: AppTopAppBarVariant.primary,
            navigationIcon: AppTopAppBarNavigationIcon(
              type: AppTopAppBarNavigationType.menu,
              tooltip: 'Menú principal',
              onPressed: () => _showSnackBar(context, 'Menú'),
            ),
            actions: AppTopAppBarActions(
              maxPrimary: 3,
              primary: [
                AppTopAppBarAction(
                  id: 'search',
                  icon: const Icon(Icons.search),
                  tooltip: 'Buscar contenido',
                  onPressed: () => _showSnackBar(context, 'Buscar'),
                ),
                AppTopAppBarAction(
                  id: 'notifications',
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Notificaciones',
                  onPressed: () => _showSnackBar(context, 'Notificaciones'),
                ),
                AppTopAppBarAction(
                  id: 'profile',
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'Perfil de usuario',
                  onPressed: () => _showSnackBar(context, 'Perfil'),
                ),
                AppTopAppBarAction(
                  id: 'settings',
                  icon: const Icon(Icons.settings),
                  tooltip: 'Configuración',
                  onPressed: () => _showSnackBar(context, 'Configuración'),
                ),
                AppTopAppBarAction(
                  id: 'help',
                  icon: const Icon(Icons.help),
                  tooltip: 'Ayuda',
                  onPressed: () => _showSnackBar(context, 'Ayuda'),
                ),
              ],
            ),
            colors: const AppTopAppBarColors(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            elevation: const AppTopAppBarElevation(
              defaultElevation: 4.0,
              shadowColor: Colors.black26,
            ),
            enableA11y: true,
            enableKeyboardSupport: true,
          ),
          title: const Text('App Completa'),
        ),
      ),
    ),
  ];

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message presionado!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppTopAppBar Stories (${_currentStory + 1}/${_stories.length})',
        ),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showStoryInfo,
          ),
        ],
      ),
      body: _stories[_currentStory].builder(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _currentStory > 0 ? _previousStory : null,
              tooltip: 'Historia anterior',
            ),
            Expanded(
              child: Center(
                child: Text(
                  _stories[_currentStory].title,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: _currentStory < _stories.length - 1
                  ? _nextStory
                  : null,
              tooltip: 'Historia siguiente',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAllStories,
        label: const Text('Ver Todas'),
        icon: const Icon(Icons.list),
      ),
    );
  }

  void _previousStory() {
    if (_currentStory > 0) {
      setState(() {
        _currentStory--;
      });
    }
  }

  void _nextStory() {
    if (_currentStory < _stories.length - 1) {
      setState(() {
        _currentStory++;
      });
    }
  }

  void _showStoryInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_stories[_currentStory].title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_stories[_currentStory].description),
            const SizedBox(height: 16),
            const Text(
              'Características del AppTopAppBar:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('• 4 variantes: primary, center, large, collapsed'),
            const Text(
              '• 8 estados: default, hover, pressed, focus, selected, disabled, loading, skeleton',
            ),
            const Text('• Soporte RTL completo'),
            const Text('• Comportamiento adaptativo por plataforma'),
            const Text('• Accesibilidad integrada'),
            const Text('• Material 3 compatible'),
            const Text('• Configuración mediante design tokens'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _showAllStories() {
    showModalBottomSheet(
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Todas las Historias',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _stories.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(_stories[index].title),
                  subtitle: Text(_stories[index].description),
                  selected: index == _currentStory,
                  onTap: () {
                    setState(() {
                      _currentStory = index;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryItem {
  final String title;
  final String description;
  final Widget Function(BuildContext context) builder;

  const StoryItem({
    required this.title,
    required this.description,
    required this.builder,
  });
}

class _DemoScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;

  const _DemoScaffold({required this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del AppTopAppBar',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'AppTopAppBar es un componente de barra de aplicación avanzado que proporciona:',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Múltiples variantes (primary, center, large, collapsed)',
                    ),
                    const Text(
                      '• Estados dinámicos (loading, skeleton, disabled, etc.)',
                    ),
                    const Text('• Soporte RTL completo'),
                    const Text('• Comportamiento adaptativo por plataforma'),
                    const Text('• Accesibilidad integrada'),
                    const Text('• Acciones configurables con overflow'),
                    const Text('• Iconos de navegación personalizables'),
                    const Text('• Configuración mediante design tokens'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Variantes Disponibles',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    _buildVariantChip(
                      'Primary',
                      'AppBar estándar con título a la izquierda',
                    ),
                    _buildVariantChip('Center', 'AppBar con título centrado'),
                    _buildVariantChip(
                      'Large',
                      'AppBar grande con título prominente',
                    ),
                    _buildVariantChip(
                      'Collapsed',
                      'AppBar colapsado para espacios reducidos',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estados Soportados',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildStateChip('Default'),
                        _buildStateChip('Hover'),
                        _buildStateChip('Pressed'),
                        _buildStateChip('Focus'),
                        _buildStateChip('Selected'),
                        _buildStateChip('Disabled'),
                        _buildStateChip('Loading'),
                        _buildStateChip('Skeleton'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Características Técnicas',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(
                          label: const Text('Material 3'),
                          avatar: const Icon(Icons.design_services, size: 16),
                        ),
                        Chip(
                          label: const Text('Freezed Config'),
                          avatar: const Icon(Icons.settings, size: 16),
                        ),
                        Chip(
                          label: const Text('Platform Adaptive'),
                          avatar: const Icon(Icons.devices, size: 16),
                        ),
                        Chip(
                          label: const Text('RTL Ready'),
                          avatar: const Icon(
                            Icons.text_rotation_none,
                            size: 16,
                          ),
                        ),
                        Chip(
                          label: const Text('Accessible'),
                          avatar: const Icon(Icons.accessibility, size: 16),
                        ),
                        Chip(
                          label: const Text('Production Ready'),
                          avatar: const Icon(Icons.verified, size: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(
              3,
              (index) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('Contenido de ejemplo ${index + 1}'),
                  subtitle: Text('Descripción del contenido ${index + 1}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantChip(String variant, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Chip(
            label: Text(variant),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(description, style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildStateChip(String state) {
    return Chip(
      label: Text(state),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}
