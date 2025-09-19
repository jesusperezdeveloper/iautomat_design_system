import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSBreadcrumbsStory extends StatefulWidget {
  const DSBreadcrumbsStory({super.key});

  @override
  State<DSBreadcrumbsStory> createState() => _DSBreadcrumbsStoryState();
}

class _DSBreadcrumbsStoryState extends State<DSBreadcrumbsStory> {
  DSBreadcrumbsVariant _variant = DSBreadcrumbsVariant.defaultVariant;
  DSBreadcrumbsState _state = DSBreadcrumbsState.defaultState;
  DSBreadcrumbSeparatorType _separatorType =
      DSBreadcrumbSeparatorType.chevron;
  DSBreadcrumbsCollapseMode _collapseMode =
      DSBreadcrumbsCollapseMode.ellipsis;
  bool _isRtl = false;
  bool _showHome = true;
  bool _enableA11y = true;
  int _maxVisibleItems = 3;

  final List<DSBreadcrumbItem> _defaultItems = [
    const DSBreadcrumbItem(
      id: 'products',
      title: 'Productos',
      type: DSBreadcrumbType.text,
      route: '/products',
    ),
    const DSBreadcrumbItem(
      id: 'electronics',
      title: 'Electrónicos',
      type: DSBreadcrumbType.text,
      route: '/products/electronics',
    ),
    const DSBreadcrumbItem(
      id: 'phones',
      title: 'Teléfonos',
      type: DSBreadcrumbType.text,
      route: '/products/electronics/phones',
    ),
    const DSBreadcrumbItem(
      id: 'smartphones',
      title: 'Smartphones',
      type: DSBreadcrumbType.text,
      route: '/products/electronics/phones/smartphones',
    ),
    const DSBreadcrumbItem(
      id: 'iphone',
      title: 'iPhone 15 Pro',
      type: DSBreadcrumbType.text,
      route: '/products/electronics/phones/smartphones/iphone-15-pro',
    ),
  ];

  final List<DSBreadcrumbItem> _iconItems = [
    const DSBreadcrumbItem(
      id: 'home',
      title: 'Inicio',
      icon: Icon(Icons.home, size: 16),
      type: DSBreadcrumbType.icon,
      route: '/',
    ),
    const DSBreadcrumbItem(
      id: 'dashboard',
      title: 'Dashboard',
      icon: Icon(Icons.dashboard, size: 16),
      type: DSBreadcrumbType.textWithIcon,
      route: '/dashboard',
    ),
    const DSBreadcrumbItem(
      id: 'analytics',
      title: 'Analytics',
      icon: Icon(Icons.analytics, size: 16),
      type: DSBreadcrumbType.textWithIcon,
      route: '/dashboard/analytics',
    ),
    const DSBreadcrumbItem(
      id: 'reports',
      title: 'Reportes',
      type: DSBreadcrumbType.text,
      route: '/dashboard/analytics/reports',
    ),
  ];

  String? _lastTappedItem;

  void _handleBreadcrumbTap(DSBreadcrumbItem item) {
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
        title: const Text('DSBreadcrumbs Stories'),
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
                        DropdownButton<DSBreadcrumbsVariant>(
                          value: _variant,
                          onChanged: (value) =>
                              setState(() => _variant = value!),
                          items: DSBreadcrumbsVariant.values.map((variant) {
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
                        DropdownButton<DSBreadcrumbsState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: DSBreadcrumbsState.values.map((state) {
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
                        DropdownButton<DSBreadcrumbSeparatorType>(
                          value: _separatorType,
                          onChanged: (value) =>
                              setState(() => _separatorType = value!),
                          items: DSBreadcrumbSeparatorType.values.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    if (_variant == DSBreadcrumbsVariant.collapsing) ...[
                      // Collapse Mode
                      Row(
                        children: [
                          const Text('Modo Colapso: '),
                          const SizedBox(width: 8),
                          DropdownButton<DSBreadcrumbsCollapseMode>(
                            value: _collapseMode,
                            onChanged: (value) =>
                                setState(() => _collapseMode = value!),
                            items: DSBreadcrumbsCollapseMode.values.map((
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
                    DSBreadcrumbs(
                      config: DSBreadcrumbsConfig(
                        variant: _variant,
                        state: _state,
                        isRtl: _isRtl,
                        showHome: _showHome,
                        enableA11y: _enableA11y,
                        maxVisibleItems: _maxVisibleItems,
                        separator: DSBreadcrumbSeparator(type: _separatorType),
                        behavior: DSBreadcrumbsBehavior(
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
                    DSBreadcrumbs(
                      config: const DSBreadcrumbsConfig(showHome: false),
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

                    ...DSBreadcrumbSeparatorType.values.map((type) {
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
                            DSBreadcrumbs(
                              config: DSBreadcrumbsConfig(
                                separator: DSBreadcrumbSeparator(
                                  type: type,
                                  text:
                                      type == DSBreadcrumbSeparatorType.custom
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

                    ...DSBreadcrumbsState.values.map((state) {
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
                            DSBreadcrumbs(
                              config: DSBreadcrumbsConfig(
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
                    DSBreadcrumbs(
                      config: const DSBreadcrumbsConfig(
                        variant: DSBreadcrumbsVariant.collapsing,
                        maxVisibleItems: 3,
                        behavior: DSBreadcrumbsBehavior(
                          collapseMode: DSBreadcrumbsCollapseMode.ellipsis,
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
                    DSBreadcrumbs(
                      config: const DSBreadcrumbsConfig(
                        variant: DSBreadcrumbsVariant.collapsing,
                        maxVisibleItems: 3,
                        behavior: DSBreadcrumbsBehavior(
                          collapseMode: DSBreadcrumbsCollapseMode.dropdown,
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
                    DSBreadcrumbs(
                      config: const DSBreadcrumbsConfig(
                        variant: DSBreadcrumbsVariant.collapsing,
                        maxVisibleItems: 3,
                        behavior: DSBreadcrumbsBehavior(
                          collapseMode: DSBreadcrumbsCollapseMode.hidden,
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
