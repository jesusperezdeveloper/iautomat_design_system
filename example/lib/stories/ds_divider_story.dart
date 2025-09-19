import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSDividerStory extends StatefulWidget {
  const DSDividerStory({super.key});

  @override
  State<DSDividerStory> createState() => _DSDividerStoryState();
}

class _DSDividerStoryState extends State<DSDividerStory> {
  DSDividerState _selectedState = DSDividerState.defaultState;
  DSDividerVariant _selectedVariant = DSDividerVariant.full;
  DSDividerOrientation _selectedOrientation = DSDividerOrientation.horizontal;
  bool _interactive = false;
  bool _showDebugInfo = false;
  double _thickness = 1.0;
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSDivider Examples'),
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
            _buildOrientationExamples(),
            const SizedBox(height: 32),
            _buildInteractiveExamples(),
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
            DropdownButtonFormField<DSDividerVariant>(
              initialValue: _selectedVariant,
              decoration: const InputDecoration(labelText: 'Variante'),
              items: DSDividerVariant.values.map((variant) {
                return DropdownMenuItem(
                  value: variant,
                  child: Text(variant.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedVariant = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // State Control
            DropdownButtonFormField<DSDividerState>(
              initialValue: _selectedState,
              decoration: const InputDecoration(labelText: 'Estado'),
              items: DSDividerState.values.map((state) {
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

            // Orientation Control
            DropdownButtonFormField<DSDividerOrientation>(
              initialValue: _selectedOrientation,
              decoration: const InputDecoration(labelText: 'Orientación'),
              items: DSDividerOrientation.values.map((orientation) {
                return DropdownMenuItem(
                  value: orientation,
                  child: Text(orientation.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedOrientation = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // Thickness Control
            Row(
              children: [
                Text('Grosor: ${_thickness.toStringAsFixed(1)}'),
                Expanded(
                  child: Slider(
                    value: _thickness,
                    min: 0.5,
                    max: 5.0,
                    divisions: 9,
                    onChanged: (value) {
                      setState(() {
                        _thickness = value;
                      });
                    },
                  ),
                ),
              ],
            ),

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

            // Color Picker
            ListTile(
              title: const Text('Color personalizado'),
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _selectedColor ?? Theme.of(context).dividerColor,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onTap: () {
                // Selector de color simple
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Seleccionar Color'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _colorOption(Colors.red, 'Rojo'),
                        _colorOption(Colors.blue, 'Azul'),
                        _colorOption(Colors.green, 'Verde'),
                        _colorOption(Colors.orange, 'Naranja'),
                        _colorOption(Colors.purple, 'Morado'),
                        _colorOption(null, 'Por defecto'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorOption(Color? color, String name) {
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).dividerColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      title: Text(name),
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
        Navigator.of(context).pop();
      },
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

            Container(
              width: double.infinity,
              height: _selectedOrientation.isHorizontal ? 100 : 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _selectedOrientation.isHorizontal
                  ? Column(
                      children: [
                        const Text('Contenido superior'),
                        Expanded(
                          child: DSDivider(
                            config: _buildCurrentConfig(),
                            interactive: _interactive,
                            onTap: _interactive
                                ? () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Divider presionado!'),
                                      ),
                                    );
                                  }
                                : null,
                            onStateChanged: (state) {
                              debugPrint(
                                'Estado cambiado a: ${state.displayName}',
                              );
                            },
                          ),
                        ),
                        const Text('Contenido inferior'),
                      ],
                    )
                  : Row(
                      children: [
                        const Text('Izquierda'),
                        DSDivider(
                          config: _buildCurrentConfig(),
                          interactive: _interactive,
                          onTap: _interactive
                              ? () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Divider presionado!'),
                                    ),
                                  );
                                }
                              : null,
                        ),
                        const Text('Derecha'),
                      ],
                    ),
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

  DSDividerConfig _buildCurrentConfig() {
    return DSDividerConfig(
      variant: _selectedVariant,
      state: _selectedState,
      orientation: _selectedOrientation,
      thickness: _thickness,
      color: _selectedColor,
      behavior: DSDividerBehavior(
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
          Text('Orientación: ${_selectedOrientation.name}'),
          Text('Grosor: ${_thickness.toStringAsFixed(1)}px'),
          Text('Interactivo: ${_interactive ? "Sí" : "No"}'),
          Text('Color personalizado: ${_selectedColor != null ? "Sí" : "No"}'),
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
              'Full Divider',
              'Divider que se extiende por todo el ancho',
              const DSDividerConfig(variant: DSDividerVariant.full),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Inset Divider',
              'Divider con márgenes en los extremos',
              const DSDividerConfig(variant: DSDividerVariant.inset),
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

            ...DSDividerState.values.map(
              (state) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildExampleSection(
                  state.displayName,
                  'Divider en estado ${state.displayName.toLowerCase()}',
                  DSDividerConfig(state: state),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrientationExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Orientaciones',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Horizontal',
              'Divider horizontal (por defecto)',
              const DSDividerConfig(
                orientation: DSDividerOrientation.horizontal,
              ),
            ),

            const SizedBox(height: 16),

            Container(
              height: 100,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text('Izquierda'),
                  const DSDivider(
                    config: DSDividerConfig(
                      orientation: DSDividerOrientation.vertical,
                    ),
                  ),
                  const Text('Derecha'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Divider vertical',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dividers Interactivos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            _buildInteractiveSection(
              'Divider Clickeable',
              'Presiona el divider para interactuar',
              DSDividerConfig(
                behavior: const DSDividerBehavior(
                  enableHoverEffects: true,
                  showFocusIndicator: true,
                ),
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
    DSDividerConfig config,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Text('Contenido superior'),
              Expanded(child: DSDivider(config: config)),
              const Text('Contenido inferior'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveSection(
    String title,
    String description,
    DSDividerConfig config,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Text('Contenido superior'),
              Expanded(
                child: DSDivider(
                  config: config,
                  interactive: true,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('¡$title presionado!')),
                    );
                  },
                  onStateChanged: (state) {
                    debugPrint('Estado cambiado a: ${state.displayName}');
                  },
                ),
              ),
              const Text('Contenido inferior'),
            ],
          ),
        ),
      ],
    );
  }
}
