import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppBreadcrumbsStory extends StatefulWidget {
  const AppBreadcrumbsStory({super.key});

  @override
  State<AppBreadcrumbsStory> createState() => _AppBreadcrumbsStoryState();
}

class _AppBreadcrumbsStoryState extends State<AppBreadcrumbsStory> {
  AppBreadcrumbsVariant _variant = AppBreadcrumbsVariant.defaultVariant;
  AppBreadcrumbsState _state = AppBreadcrumbsState.defaultState;
  AppBreadcrumbSeparatorType _separatorType =
      AppBreadcrumbSeparatorType.chevron;
  AppBreadcrumbsCollapseMode _collapseMode =
      AppBreadcrumbsCollapseMode.ellipsis;
  bool _isRtl = false;
  bool _showHome = true;
  bool _enableA11y = true;
  int _maxVisibleItems = 3;

  final List<AppBreadcrumbItem> _defaultItems = [
    const AppBreadcrumbItem(
      id: 'products',
      title: 'Productos',
      type: AppBreadcrumbType.text,
      route: '/products',
    ),
    const AppBreadcrumbItem(
      id: 'electronics',
      title: 'Electrónicos',
      type: AppBreadcrumbType.text,
      route: '/products/electronics',
    ),
    const AppBreadcrumbItem(
      id: 'phones',
      title: 'Teléfonos',
      type: AppBreadcrumbType.text,
      route: '/products/electronics/phones',
    ),
    const AppBreadcrumbItem(
      id: 'smartphones',
      title: 'Smartphones',
      type: AppBreadcrumbType.text,
      route: '/products/electronics/phones/smartphones',
    ),
    const AppBreadcrumbItem(
      id: 'iphone',
      title: 'iPhone 15 Pro',
      type: AppBreadcrumbType.text,
      route: '/products/electronics/phones/smartphones/iphone-15-pro',
    ),
  ];

  final List<AppBreadcrumbItem> _iconItems = [
    const AppBreadcrumbItem(
      id: 'home',
      title: 'Inicio',
      icon: Icon(Icons.home, size: 16),
      type: AppBreadcrumbType.icon,
      route: '/',
    ),
    const AppBreadcrumbItem(
      id: 'dashboard',
      title: 'Dashboard',
      icon: Icon(Icons.dashboard, size: 16),
      type: AppBreadcrumbType.textWithIcon,
      route: '/dashboard',
    ),
    const AppBreadcrumbItem(
      id: 'analytics',
      title: 'Analytics',
      icon: Icon(Icons.analytics, size: 16),
      type: AppBreadcrumbType.textWithIcon,
      route: '/dashboard/analytics',
    ),
    const AppBreadcrumbItem(
      id: 'reports',
      title: 'Reportes',
      type: AppBreadcrumbType.text,
      route: '/dashboard/analytics/reports',
    ),
  ];

  String? _lastTappedItem;

  void _handleBreadcrumbTap(AppBreadcrumbItem item) {
    setState(() {
      _lastTappedItem = item.title;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navegando a: ${item.title} (${item.route ?? item.id})'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBreadcrumbs Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Controles
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Controles',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),

                    // Variant
                    Row(
                      children: [
                        const Text('Variante: '),
                        const SizedBox(width: 8),
                        DropdownButton<AppBreadcrumbsVariant>(
                          value: _variant,
                          onChanged: (value) =>
                              setState(() => _variant = value!),
                          items: AppBreadcrumbsVariant.values.map((variant) {
                            return DropdownMenuItem(
                              value: variant,
                              child: Text(variant.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // State
                    Row(
                      children: [
                        const Text('Estado: '),
                        const SizedBox(width: 8),
                        DropdownButton<AppBreadcrumbsState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: AppBreadcrumbsState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Separator
                    Row(
                      children: [
                        const Text('Separador: '),
                        const SizedBox(width: 8),
                        DropdownButton<AppBreadcrumbSeparatorType>(
                          value: _separatorType,
                          onChanged: (value) =>
                              setState(() => _separatorType = value!),
                          items: AppBreadcrumbSeparatorType.values.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    if (_variant == AppBreadcrumbsVariant.collapsing) ...[
                      // Collapse Mode
                      Row(
                        children: [
                          const Text('Modo Colapso: '),
                          const SizedBox(width: 8),
                          DropdownButton<AppBreadcrumbsCollapseMode>(
                            value: _collapseMode,
                            onChanged: (value) =>
                                setState(() => _collapseMode = value!),
                            items: AppBreadcrumbsCollapseMode.values.map((
                              mode,
                            ) {
                              return DropdownMenuItem(
                                value: mode,
                                child: Text(mode.displayName),
                              );
                            }).toList(),
                          ),
                        ],
                      ),

                      // Max Visible Items
                      Row(
                        children: [
                          const Text('Máx. Elementos: '),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 100,
                            child: Slider(
                              value: _maxVisibleItems.toDouble(),
                              min: 2,
                              max: 6,
                              divisions: 4,
                              label: _maxVisibleItems.toString(),
                              onChanged: (value) => setState(
                                () => _maxVisibleItems = value.round(),
                              ),
                            ),
                          ),
                          Text(_maxVisibleItems.toString()),
                        ],
                      ),
                    ],

                    // Switches
                    Wrap(
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _isRtl,
                              onChanged: (value) =>
                                  setState(() => _isRtl = value),
                            ),
                            const Text('RTL'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _showHome,
                              onChanged: (value) =>
                                  setState(() => _showHome = value),
                            ),
                            const Text('Mostrar Home'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableA11y,
                              onChanged: (value) =>
                                  setState(() => _enableA11y = value),
                            ),
                            const Text('Accesibilidad'),
                          ],
                        ),
                      ],
                    ),

                    if (_lastTappedItem != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('Último elemento tocado: $_lastTappedItem'),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Ejemplos
            Text('Ejemplos', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),

            // Breadcrumbs configurables
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Breadcrumbs Configurables',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    AppBreadcrumbs(
                      config: AppBreadcrumbsConfig(
                        variant: _variant,
                        state: _state,
                        isRtl: _isRtl,
                        showHome: _showHome,
                        enableA11y: _enableA11y,
                        maxVisibleItems: _maxVisibleItems,
                        separator: AppBreadcrumbSeparator(type: _separatorType),
                        behavior: AppBreadcrumbsBehavior(
                          collapseMode: _collapseMode,
                        ),
                      ),
                      items: _defaultItems,
                      onTap: _handleBreadcrumbTap,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Breadcrumbs con iconos
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Breadcrumbs con Iconos',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    AppBreadcrumbs(
                      config: const AppBreadcrumbsConfig(showHome: false),
                      items: _iconItems,
                      onTap: _handleBreadcrumbTap,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Diferentes separadores
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Diferentes Separadores',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),

                    ...AppBreadcrumbSeparatorType.values.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${type.displayName}:',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(height: 4),
                            AppBreadcrumbs(
                              config: AppBreadcrumbsConfig(
                                separator: AppBreadcrumbSeparator(
                                  type: type,
                                  text:
                                      type == AppBreadcrumbSeparatorType.custom
                                      ? ' | '
                                      : null,
                                ),
                                showHome: false,
                              ),
                              items: _defaultItems.take(3).toList(),
                              onTap: _handleBreadcrumbTap,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Estados del componente
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estados del Componente',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),

                    ...AppBreadcrumbsState.values.map((state) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.displayName}:',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(height: 4),
                            AppBreadcrumbs(
                              config: AppBreadcrumbsConfig(
                                state: state,
                                showHome: false,
                              ),
                              items: _defaultItems.take(3).toList(),
                              onTap: _handleBreadcrumbTap,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Variante colapsable
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Variante Colapsable',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Modo Ellipsis:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    AppBreadcrumbs(
                      config: const AppBreadcrumbsConfig(
                        variant: AppBreadcrumbsVariant.collapsing,
                        maxVisibleItems: 3,
                        behavior: AppBreadcrumbsBehavior(
                          collapseMode: AppBreadcrumbsCollapseMode.ellipsis,
                        ),
                        showHome: false,
                      ),
                      items: _defaultItems,
                      onTap: _handleBreadcrumbTap,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Modo Dropdown:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    AppBreadcrumbs(
                      config: const AppBreadcrumbsConfig(
                        variant: AppBreadcrumbsVariant.collapsing,
                        maxVisibleItems: 3,
                        behavior: AppBreadcrumbsBehavior(
                          collapseMode: AppBreadcrumbsCollapseMode.dropdown,
                        ),
                        showHome: false,
                      ),
                      items: _defaultItems,
                      onTap: _handleBreadcrumbTap,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Modo Hidden:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 4),
                    AppBreadcrumbs(
                      config: const AppBreadcrumbsConfig(
                        variant: AppBreadcrumbsVariant.collapsing,
                        maxVisibleItems: 3,
                        behavior: AppBreadcrumbsBehavior(
                          collapseMode: AppBreadcrumbsCollapseMode.hidden,
                        ),
                        showHome: false,
                      ),
                      items: _defaultItems,
                      onTap: _handleBreadcrumbTap,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
