import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/theme_switcher.dart';
import '../screens/home_screen.dart';
import '../screens/theme_gallery_screen.dart';
import '../screens/colors_screen.dart';
import '../screens/typography_screen.dart';
import '../screens/components/buttons_demo_screen.dart';
import '../screens/components/inputs_demo_screen.dart';
import '../screens/components/cards_demo_screen.dart';
import '../screens/components/navigation_demo_screen.dart';
import '../screens/components/dialogs_demo_screen.dart';
import '../screens/components/feedback_demo_screen.dart';
import '../screens/components/appbar_demo_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Ruta principal - Homepage
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Galería de temas
      GoRoute(
        path: '/themes',
        name: 'themes',
        builder: (context, state) => const ThemeGalleryScreen(),
      ),

      // Sistema de colores
      GoRoute(
        path: '/colors',
        name: 'colors',
        builder: (context, state) => const ColorsScreen(),
      ),

      // Sistema tipográfico
      GoRoute(
        path: '/typography',
        name: 'typography',
        builder: (context, state) => const TypographyScreen(),
      ),

      // Demos de componentes
      GoRoute(
        path: '/components',
        name: 'components',
        builder: (context, state) => const ComponentsOverviewScreen(),
      ),

      // Demos individuales de componentes
      GoRoute(
        path: '/components/buttons',
        name: 'buttons-demo',
        builder: (context, state) => const ButtonsDemoScreen(),
      ),
      GoRoute(
        path: '/components/inputs',
        name: 'inputs-demo',
        builder: (context, state) => const InputsDemoScreen(),
      ),
      GoRoute(
        path: '/components/cards',
        name: 'cards-demo',
        builder: (context, state) => const CardsDemoScreen(),
      ),
      GoRoute(
        path: '/components/navigation',
        name: 'navigation-demo',
        builder: (context, state) => const NavigationDemoScreen(),
      ),
      GoRoute(
        path: '/components/dialogs',
        name: 'dialogs-demo',
        builder: (context, state) => const DialogsDemoScreen(),
      ),
      GoRoute(
        path: '/components/feedback',
        name: 'feedback-demo',
        builder: (context, state) => const FeedbackDemoScreen(),
      ),
      GoRoute(
        path: '/components/appbar',
        name: 'appbar-demo',
        builder: (context, state) => const AppBarDemoScreen(),
      ),
    ],
  );
}

// ComponentsOverviewScreen con navegación a demos
class ComponentsOverviewScreen extends StatelessWidget {
  const ComponentsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final componentDemos = [
      _ComponentDemo(
        title: 'Botones',
        description: 'Elevated, Outlined, Filled y Text buttons',
        icon: Icons.smart_button,
        route: '/components/buttons',
        color: Colors.blue,
      ),
      _ComponentDemo(
        title: 'Inputs',
        description: 'Campos de texto, validación y estados',
        icon: Icons.input,
        route: '/components/inputs',
        color: Colors.green,
      ),
      _ComponentDemo(
        title: 'Cards',
        description: 'Contenedores y tarjetas de información',
        icon: Icons.credit_card,
        route: '/components/cards',
        color: Colors.purple,
      ),
      _ComponentDemo(
        title: 'Navegación',
        description: 'Componentes de navegación y menús',
        icon: Icons.navigation,
        route: '/components/navigation',
        color: Colors.orange,
      ),
      _ComponentDemo(
        title: 'Diálogos',
        description: 'Modales, alerts y popups',
        icon: Icons.chat_bubble,
        route: '/components/dialogs',
        color: Colors.red,
      ),
      _ComponentDemo(
        title: 'Feedback',
        description: 'SnackBars, progress y notifications',
        icon: Icons.feedback,
        route: '/components/feedback',
        color: Colors.teal,
      ),
      _ComponentDemo(
        title: 'DSTopAppBar',
        description: 'AppBar del Design System con arrow back',
        icon: Icons.vertical_align_top,
        route: '/components/appbar',
        color: Colors.indigo,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes DS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              context.go('/');
            }
          },
          tooltip: 'Volver',
        ),
        actions: const [
          ThemeSwitcherButton(),
          ThemePickerButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Demos de Componentes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explora todos los componentes del Design System con ejemplos interactivos.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: componentDemos.length,
                itemBuilder: (context, index) {
                  final demo = componentDemos[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => context.go(demo.route),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              demo.color.withValues(alpha: 0.1),
                              demo.color.withValues(alpha: 0.05),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                demo.icon,
                                size: 36,
                                color: demo.color,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                demo.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Flexible(
                                child: Text(
                                  demo.description,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComponentDemo {
  final String title;
  final String description;
  final IconData icon;
  final String route;
  final Color color;

  _ComponentDemo({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    required this.color,
  });
}