import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSScaffoldStories extends StatefulWidget {
  const DSScaffoldStories({super.key});

  @override
  State<DSScaffoldStories> createState() => _DSScaffoldStoriesState();
}

class _DSScaffoldStoriesState extends State<DSScaffoldStories> {
  int _currentStory = 0;

  final List<StoryItem> _stories = [
    StoryItem(
      title: 'Default DSShell',
      description: 'Scaffold básico con configuración por defecto',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(variant: DSScaffoldVariant.appShell),
        body: _DemoContent(title: 'App Shell Básico'),
      ),
    ),
    StoryItem(
      title: 'Loading State',
      description: 'Scaffold en estado de carga',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(state: DSScaffoldState.loading),
        body: _DemoContent(title: 'Contenido Cargando'),
      ),
    ),
    StoryItem(
      title: 'Skeleton State',
      description: 'Scaffold con esqueleto de carga',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(state: DSScaffoldState.skeleton),
        body: _DemoContent(title: 'Contenido Esqueleto'),
      ),
    ),
    StoryItem(
      title: 'With Gutters',
      description: 'Layout con márgenes laterales',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(
          variant: DSScaffoldVariant.gutters,
          hasGutters: true,
        ),
        body: _DemoContent(title: 'Layout con Gutters'),
      ),
    ),
    StoryItem(
      title: 'Responsive Layout',
      description: 'Layout que se adapta al tamaño de pantalla',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(variant: DSScaffoldVariant.responsive),
        body: _DemoContent(title: 'Layout Responsive'),
      ),
    ),
    StoryItem(
      title: 'RTL Support',
      description: 'Scaffold con soporte para dirección RTL',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(isRtl: true),
        body: _DemoContent(title: 'محتوى RTL'),
      ),
    ),
    StoryItem(
      title: 'With AppBar',
      description: 'Scaffold con barra de aplicación personalizada',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(appBar: DSBarConfig(height: 64.0)),
        appBar: _DemoAppBar(),
        body: _DemoContent(title: 'Con AppBar'),
      ),
    ),
    StoryItem(
      title: 'With Navigation Drawer',
      description: 'Scaffold con drawer de navegación',
      builder: (context) => DSScaffold(
        config: const DSScaffoldConfig(
          navigation: DSNavigationConfig(
            type: NavigationType.drawer,
            width: 280.0,
            items: [
              NavigationItem(
                label: 'Dashboard',
                icon: Icons.dashboard,
                isSelected: true,
              ),
              NavigationItem(label: 'Analytics', icon: Icons.analytics),
              NavigationItem(label: 'Users', icon: Icons.people),
              NavigationItem(label: 'Settings', icon: Icons.settings),
            ],
          ),
        ),
        body: const _DemoContent(title: 'Con Navigation Drawer'),
      ),
    ),
    StoryItem(
      title: 'With Bottom Navigation',
      description: 'Scaffold con navegación inferior',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(
          bottomBar: BottomBarConfig(
            items: [
              BottomBarItem(label: 'Home', icon: Icons.home),
              BottomBarItem(label: 'Search', icon: Icons.search),
              BottomBarItem(label: 'Notifications', icon: Icons.notifications),
              BottomBarItem(label: 'Profile', icon: Icons.person),
            ],
            selectedIndex: 0,
          ),
        ),
        body: _DemoContent(title: 'Con Bottom Navigation'),
      ),
    ),
    StoryItem(
      title: 'With FloatingActionButton',
      description: 'Scaffold con botón de acción flotante',
      builder: (context) => DSScaffold(
        config: const DSScaffoldConfig(
          floatingAction: FloatingActionConfig(
            mini: false,
            tooltip: 'Agregar elemento',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: const _DemoContent(title: 'Con FAB'),
      ),
    ),
    StoryItem(
      title: 'Desktop Layout with Rail',
      description: 'Layout de escritorio con rail de navegación',
      builder: (context) => const DSScaffold(
        config: DSScaffoldConfig(
          variant: DSScaffoldVariant.appShell,
          navigation: DSNavigationConfig(
            type: NavigationType.rail,
            items: [
              NavigationItem(label: 'Home', icon: Icons.home, isSelected: true),
              NavigationItem(label: 'Explore', icon: Icons.explore),
              NavigationItem(label: 'Library', icon: Icons.library_books),
            ],
          ),
        ),
        body: _DemoContent(title: 'Desktop con Rail'),
      ),
    ),
    StoryItem(
      title: 'Complete Example',
      description: 'Ejemplo completo con todas las características',
      builder: (context) => DSScaffold(
        config: DSScaffoldConfig(
          variant: DSScaffoldVariant.responsive,
          appBar: const DSBarConfig(height: 64.0),
          navigation: const DSNavigationConfig(
            type: NavigationType.drawer,
            items: [
              NavigationItem(
                label: 'Dashboard',
                icon: Icons.dashboard,
                isSelected: true,
              ),
              NavigationItem(label: 'Projects', icon: Icons.work),
              NavigationItem(label: 'Team', icon: Icons.people),
              NavigationItem(label: 'Settings', icon: Icons.settings),
            ],
          ),
          bottomBar: BottomBarConfig(
            items: const [
              BottomBarItem(label: 'Home', icon: Icons.home),
              BottomBarItem(label: 'Search', icon: Icons.search),
              BottomBarItem(label: 'Profile', icon: Icons.person),
            ],
            selectedIndex: 0,
          ),
          floatingAction: const FloatingActionConfig(tooltip: 'Nuevo proyecto'),
        ),
        appBar: const _DemoAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: const _DemoContent(title: 'Aplicación Completa'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DSScaffold Stories (${_currentStory + 1}/${_stories.length})',
        ),
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
        content: Text(_stories[_currentStory].description),
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

class _DemoContent extends StatelessWidget {
  final String title;

  const _DemoContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información del Componente',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'DSScaffold es un componente de scaffold avanzado que proporciona:',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Múltiples variantes (app shell, gutters, responsive)',
                  ),
                  Text(
                    '• Estados dinámicos (loading, skeleton, disabled, etc.)',
                  ),
                  Text('• Soporte RTL completo'),
                  Text('• Comportamiento adaptativo por plataforma'),
                  Text('• Accesibilidad integrada'),
                  Text('• Configuración mediante Freezed'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                label: const Text('Material 3'),
                avatar: const Icon(Icons.design_services, size: 16),
              ),
              Chip(
                label: const Text('Responsive'),
                avatar: const Icon(Icons.devices, size: 16),
              ),
              Chip(
                label: const Text('RTL Ready'),
                avatar: const Icon(Icons.text_rotation_none, size: 16),
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
          const SizedBox(height: 24),
          ...List.generate(
            6,
            (index) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('Elemento ${index + 1}'),
                subtitle: Text('Descripción del elemento ${index + 1}'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _DemoAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Demo AppBar'),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
