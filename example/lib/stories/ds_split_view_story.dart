import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSSplitViewStory extends StatefulWidget {
  const DSSplitViewStory({super.key});

  @override
  State<DSSplitViewStory> createState() => _DSSplitViewStoryState();
}

class _DSSplitViewStoryState extends State<DSSplitViewStory> {
  DSSplitViewVariant _variant = DSSplitViewVariant.resizable;
  DSSplitViewState _state = DSSplitViewState.defaultState;
  DSSplitViewDirection _direction = DSSplitViewDirection.horizontal;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _enableResize = true;
  bool _snapToEdges = true;
  double _initialRatio = 0.5;
  double _dividerWidth = 8.0;

  String? _lastRatioChange;

  void _handleRatioChanged(double ratio) {
    setState(() {
      _lastRatioChange = 'Ratio changed to: ${ratio.toStringAsFixed(2)}';
    });
  }

  Widget _buildStartPanel() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.dashboard, size: 48, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              'Panel Principal',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Este es el contenido del panel principal. Puede contener cualquier widget de Flutter.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Inicio'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configuración'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Información'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEndPanel() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.analytics, size: 48, color: Colors.green),
            const SizedBox(height: 16),
            Text(
              'Panel Secundario',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Panel complementario con información adicional o herramientas.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('Gráfico de ejemplo')),
                  ),
                  const SizedBox(height: 16),
                  const LinearProgressIndicator(),
                  const SizedBox(height: 8),
                  Text(
                    'Progreso: 75%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSSplitView Stories'),
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
                        DropdownButton<DSSplitViewVariant>(
                          value: _variant,
                          onChanged: (value) =>
                              setState(() => _variant = value!),
                          items: DSSplitViewVariant.values.map((variant) {
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
                        DropdownButton<DSSplitViewState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: DSSplitViewState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Direction
                    Row(
                      children: [
                        const Text('Dirección: '),
                        const SizedBox(width: 8),
                        DropdownButton<DSSplitViewDirection>(
                          value: _direction,
                          onChanged: (value) =>
                              setState(() => _direction = value!),
                          items: DSSplitViewDirection.values.map((direction) {
                            return DropdownMenuItem(
                              value: direction,
                              child: Text(direction.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Initial Ratio
                    Row(
                      children: [
                        const Text('Ratio Inicial: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _initialRatio,
                            min: 0.1,
                            max: 0.9,
                            divisions: 16,
                            label: _initialRatio.toStringAsFixed(2),
                            onChanged: (value) =>
                                setState(() => _initialRatio = value),
                          ),
                        ),
                        Text(_initialRatio.toStringAsFixed(2)),
                      ],
                    ),

                    // Divider Width
                    Row(
                      children: [
                        const Text('Ancho Divisor: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _dividerWidth,
                            min: 1.0,
                            max: 20.0,
                            divisions: 19,
                            label: _dividerWidth.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _dividerWidth = value),
                          ),
                        ),
                        Text('${_dividerWidth.toStringAsFixed(0)}px'),
                      ],
                    ),

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
                              value: _enableA11y,
                              onChanged: (value) =>
                                  setState(() => _enableA11y = value),
                            ),
                            const Text('Accesibilidad'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableKeyboard,
                              onChanged: (value) =>
                                  setState(() => _enableKeyboard = value),
                            ),
                            const Text('Teclado'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableResize,
                              onChanged: (value) =>
                                  setState(() => _enableResize = value),
                            ),
                            const Text('Redimensionar'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _snapToEdges,
                              onChanged: (value) =>
                                  setState(() => _snapToEdges = value),
                            ),
                            const Text('Snap to Edges'),
                          ],
                        ),
                      ],
                    ),

                    if (_lastRatioChange != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_lastRatioChange!),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Ejemplo Configurable
            Text(
              'Vista Dividida Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Container(
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DSSplitView(
                config: DSSplitViewConfig(
                  variant: _variant,
                  state: _state,
                  direction: _direction,
                  isRtl: _isRtl,
                  enableA11y: _enableA11y,
                  enableKeyboardSupport: _enableKeyboard,
                  initialRatio: _initialRatio,
                  spacing: DSSplitViewSpacing(
                    handleWidth: _dividerWidth,
                    dividerWidth: _dividerWidth / 2,
                  ),
                  behavior: DSSplitViewBehavior(
                    enableResize: _enableResize,
                    snapToEdges: _snapToEdges,
                  ),
                ),
                start: _buildStartPanel(),
                end: _buildEndPanel(),
                onRatioChanged: _handleRatioChanged,
              ),
            ),

            const SizedBox(height: 32),

            // Ejemplos Predefinidos
            Text(
              'Ejemplos Predefinidos',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Horizontal Resizable
            _buildExampleSection(
              'Horizontal Redimensionable',
              DSSplitView(
                config: const DSSplitViewConfig(
                  variant: DSSplitViewVariant.resizable,
                  direction: DSSplitViewDirection.horizontal,
                ),
                start: _buildSimplePanel('Izquierda', Colors.blue[100]!),
                end: _buildSimplePanel('Derecha', Colors.red[100]!),
              ),
            ),

            // Vertical Resizable
            _buildExampleSection(
              'Vertical Redimensionable',
              DSSplitView(
                config: const DSSplitViewConfig(
                  variant: DSSplitViewVariant.resizable,
                  direction: DSSplitViewDirection.vertical,
                ),
                start: _buildSimplePanel('Superior', Colors.green[100]!),
                end: _buildSimplePanel('Inferior', Colors.orange[100]!),
              ),
            ),

            // Two Pane Fixed
            _buildExampleSection(
              'Dos Paneles Fijos',
              DSSplitView(
                config: const DSSplitViewConfig(
                  variant: DSSplitViewVariant.twoPane,
                  initialRatio: 0.3,
                ),
                start: _buildSimplePanel('30%', Colors.purple[100]!),
                end: _buildSimplePanel('70%', Colors.teal[100]!),
              ),
            ),

            // Custom Colors
            _buildExampleSection(
              'Colores Personalizados',
              DSSplitView(
                config: const DSSplitViewConfig(
                  colors: DSSplitViewColors(
                    backgroundColor: Color(0xFFF5F5F5),
                    startPaneColor: Color(0xFFE3F2FD),
                    endPaneColor: Color(0xFFF3E5F5),
                    dividerColor: Color(0xFF2196F3),
                    handleColor: Color(0xFF1976D2),
                  ),
                ),
                start: _buildSimplePanel('Panel A', Colors.transparent),
                end: _buildSimplePanel('Panel B', Colors.transparent),
              ),
            ),

            // Estados
            _buildExampleSection(
              'Estados del Componente',
              Column(
                children: [
                  ...DSSplitViewState.values.map((state) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.displayName}:',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            height: 150,
                            child: DSSplitView(
                              config: DSSplitViewConfig(state: state),
                              start: _buildSimplePanel(
                                'Start',
                                Colors.blue[50]!,
                              ),
                              end: _buildSimplePanel('End', Colors.red[50]!),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSection(String title, Widget splitView) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: splitView,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSimplePanel(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(text, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
