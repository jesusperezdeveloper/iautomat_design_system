import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppAccordionStory extends StatefulWidget {
  const AppAccordionStory({super.key});

  @override
  State<AppAccordionStory> createState() => _AppAccordionStoryState();
}

class _AppAccordionStoryState extends State<AppAccordionStory> {
  AppAccordionVariant _selectedVariant = AppAccordionVariant.single;
  AppAccordionState _selectedState = AppAccordionState.defaultState;
  Set<String> _expandedKeys = {'item1'};
  bool _interactive = true;
  bool _showDebugInfo = false;
  bool _allowMultiple = false;
  bool _showDividers = true;
  bool _useMaterialIcons = true;

  final List<AppAccordionItem> _sampleItems = [
    AppAccordionItem(
      key: 'item1',
      title: 'Panel de Control',
      subtitle: 'Configuración general del sistema',
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contenido del panel de control'),
            SizedBox(height: 8),
            Text('Aquí puedes configurar las opciones principales del sistema.'),
            SizedBox(height: 16),
            Row(
              children: [
                Chip(label: Text('Configuración')),
                SizedBox(width: 8),
                Chip(label: Text('Sistema')),
              ],
            ),
          ],
        ),
      ),
    ),
    AppAccordionItem(
      key: 'item2',
      title: 'Configuración de Usuario',
      subtitle: 'Personaliza tu perfil y preferencias',
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configuración del usuario'),
            SizedBox(height: 8),
            Text('Modifica tu información personal y preferencias de la aplicación.'),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              subtitle: Text('Editar información personal'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Preferencias'),
              subtitle: Text('Configurar la aplicación'),
            ),
          ],
        ),
      ),
    ),
    AppAccordionItem(
      key: 'item3',
      title: 'Seguridad y Privacidad',
      subtitle: 'Gestiona la seguridad de tu cuenta',
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configuración de seguridad'),
            SizedBox(height: 8),
            Text('Administra las opciones de seguridad y privacidad de tu cuenta.'),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.security, size: 48, color: Colors.green),
                    SizedBox(height: 8),
                    Text('Tu cuenta está protegida'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppAccordion Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControls(),
            const SizedBox(height: 24),
            _buildLiveExample(),
            const SizedBox(height: 32),
            _buildVariantExamples(),
            const SizedBox(height: 32),
            _buildStateExamples(),
            const SizedBox(height: 32),
            _buildAdvancedExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Controles', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),

            // Variant Control
            DropdownButtonFormField<AppAccordionVariant>(
              value: _selectedVariant,
              decoration: const InputDecoration(labelText: 'Variante'),
              items: AppAccordionVariant.values.map((variant) {
                return DropdownMenuItem(
                  value: variant,
                  child: Text(variant.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedVariant = value;
                    _allowMultiple = value == AppAccordionVariant.multiple;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // State Control
            DropdownButtonFormField<AppAccordionState>(
              value: _selectedState,
              decoration: const InputDecoration(labelText: 'Estado'),
              items: AppAccordionState.values.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state.displayName),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedState = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // Interactive Control
            SwitchListTile(
              title: const Text('Interactivo'),
              value: _interactive,
              onChanged: (value) {
                setState(() {
                  _interactive = value;
                });
              },
            ),

            // Show Dividers Control
            SwitchListTile(
              title: const Text('Mostrar divisores'),
              value: _showDividers,
              onChanged: (value) {
                setState(() {
                  _showDividers = value;
                });
              },
            ),

            // Material Icons Control
            SwitchListTile(
              title: const Text('Usar iconos Material'),
              value: _useMaterialIcons,
              onChanged: (value) {
                setState(() {
                  _useMaterialIcons = value;
                });
              },
            ),

            // Debug Control
            SwitchListTile(
              title: const Text('Mostrar información de debug'),
              value: _showDebugInfo,
              onChanged: (value) {
                setState(() {
                  _showDebugInfo = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplo en Vivo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            AppAccordion(
              items: _sampleItems,
              expandedKeys: _expandedKeys,
              onChanged: (expandedKeys) {
                setState(() {
                  _expandedKeys = expandedKeys;
                });
              },
              config: _buildCurrentConfig(),
              interactive: _interactive,
              onStateChanged: (state) {
                debugPrint('Estado cambiado a: ${state.displayName}');
              },
            ),

            if (_showDebugInfo) ...[
              const SizedBox(height: 16),
              _buildDebugInfo(),
            ],
          ],
        ),
      ),
    );
  }

  AppAccordionConfig _buildCurrentConfig() {
    return AppAccordionConfig(
      variant: _selectedVariant,
      state: _selectedState,
      allowMultiple: _allowMultiple,
      showDividers: _showDividers,
      useMaterialIcons: _useMaterialIcons,
      behavior: AppAccordionBehavior(
        showDebugInfo: _showDebugInfo,
        enableHoverEffects: _interactive,
        showFocusIndicator: _interactive,
      ),
    );
  }

  Widget _buildDebugInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Información de Debug:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Variante: ${_selectedVariant.name}'),
          Text('Estado: ${_selectedState.displayName}'),
          Text('Elementos expandidos: ${_expandedKeys.length}'),
          Text('Interactivo: ${_interactive ? "Sí" : "No"}'),
          Text('Mostrar divisores: ${_showDividers ? "Sí" : "No"}'),
          Text('Iconos Material: ${_useMaterialIcons ? "Sí" : "No"}'),
        ],
      ),
    );
  }

  Widget _buildVariantExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Variantes', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Single Accordion',
              'Solo permite un elemento expandido a la vez',
              AppAccordion(
                items: _sampleItems.take(2).toList(),
                expandedKeys: const {'item1'},
                config: const AppAccordionConfig(
                  variant: AppAccordionVariant.single,
                ),
                onChanged: (keys) => debugPrint('Single: $keys'),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Multiple Accordion',
              'Permite múltiples elementos expandidos simultáneamente',
              AppAccordion(
                items: _sampleItems.take(2).toList(),
                expandedKeys: const {'item1', 'item2'},
                config: const AppAccordionConfig(
                  variant: AppAccordionVariant.multiple,
                  allowMultiple: true,
                ),
                onChanged: (keys) => debugPrint('Multiple: $keys'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estados', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Estado Loading',
              'Accordion en estado de carga',
              AppAccordion(
                items: _sampleItems.take(1).toList(),
                config: const AppAccordionConfig(
                  state: AppAccordionState.loading,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Estado Skeleton',
              'Accordion mostrando skeleton loader',
              AppAccordion(
                items: _sampleItems.take(1).toList(),
                config: const AppAccordionConfig(
                  state: AppAccordionState.skeleton,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Estado Disabled',
              'Accordion deshabilitado',
              AppAccordion(
                items: _sampleItems.take(1).toList(),
                config: const AppAccordionConfig(
                  state: AppAccordionState.disabled,
                ),
                interactive: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos Avanzados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Accordion con Contenido Personalizado',
              'Ejemplo con diferentes tipos de contenido',
              AppAccordion(
                items: [
                  AppAccordionItem(
                    key: 'charts',
                    title: 'Gráficos y Estadísticas',
                    subtitle: 'Visualiza datos importantes',
                    content: Container(
                      height: 200,
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bar_chart, size: 64, color: Colors.blue),
                            SizedBox(height: 16),
                            Text('Gráfico de barras simulado'),
                            Text('75% de progreso completado'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppAccordionItem(
                    key: 'form',
                    title: 'Formulario Interactivo',
                    subtitle: 'Completa la información requerida',
                    content: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Formulario enviado!')),
                              );
                            },
                            child: const Text('Enviar'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                expandedKeys: const {'charts'},
                onChanged: (keys) => debugPrint('Advanced: $keys'),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Accordion Sin Divisores',
              'Ejemplo sin líneas divisorias',
              AppAccordion(
                items: _sampleItems.take(2).toList(),
                expandedKeys: const {'item1'},
                config: const AppAccordionConfig(
                  showDividers: false,
                ),
                onChanged: (keys) => debugPrint('No dividers: $keys'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSection(
    String title,
    String description,
    Widget accordion,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 8),
        accordion,
      ],
    );
  }
}