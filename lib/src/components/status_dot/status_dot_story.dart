import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/status_dot/app_status_dot.dart';

/// Story interactivo que demuestra el uso del widget DSStatusDot
/// con todas sus variantes, estados y configuraciones
class StatusDotStory extends StatefulWidget {
  const StatusDotStory({super.key});

  @override
  State<StatusDotStory> createState() => _StatusDotStoryState();
}

class _StatusDotStoryState extends State<StatusDotStory> {
  StatusDotVariant _selectedVariant = StatusDotVariant.success;
  DSStatusDotState _selectedState = DSStatusDotState.defaultState;
  String _customLabel = 'Status Label';
  bool _hasLabel = true;
  bool _animate = false;
  bool _enableInteraction = false;
  double _size = 8.0;
  double _spacing = 8.0;
  MainAxisAlignment _alignment = MainAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSStatusDot Story'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildConfigurationPanel(),
            const SizedBox(height: 32),
            _buildInteractiveExample(),
            const SizedBox(height: 32),
            _buildVariantsShowcase(),
            const SizedBox(height: 32),
            _buildStatesShowcase(),
            const SizedBox(height: 32),
            _buildSizesShowcase(),
            const SizedBox(height: 32),
            _buildPlatformSpecificExamples(),
            const SizedBox(height: 32),
            _buildRealWorldExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigurationPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración Interactiva',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildVariantSelector(),
                _buildStateSelector(),
                _buildAlignmentSelector(),
                _buildSizeControls(),
                _buildOptionsToggles(),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextInputs(),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Variant:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        SegmentedButton<StatusDotVariant>(
          segments: const [
            ButtonSegment(
              value: StatusDotVariant.success,
              label: Text('Success'),
              icon: Icon(Icons.check_circle_outline, color: Colors.green),
            ),
            ButtonSegment(
              value: StatusDotVariant.info,
              label: Text('Info'),
              icon: Icon(Icons.info_outline, color: Colors.blue),
            ),
            ButtonSegment(
              value: StatusDotVariant.warn,
              label: Text('Warn'),
              icon: Icon(Icons.warning_amber_outlined, color: Colors.orange),
            ),
            ButtonSegment(
              value: StatusDotVariant.error,
              label: Text('Error'),
              icon: Icon(Icons.error_outline, color: Colors.red),
            ),
          ],
          selected: {_selectedVariant},
          onSelectionChanged: (Set<StatusDotVariant> selection) {
            setState(() {
              _selectedVariant = selection.first;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('State:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButton<DSStatusDotState>(
          value: _selectedState,
          items: DSStatusDotState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
          onChanged: (DSStatusDotState? value) {
            if (value != null) {
              setState(() {
                _selectedState = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildAlignmentSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alignment:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButton<MainAxisAlignment>(
          value: _alignment,
          items: const [
            DropdownMenuItem(
              value: MainAxisAlignment.start,
              child: Text('Start'),
            ),
            DropdownMenuItem(
              value: MainAxisAlignment.center,
              child: Text('Center'),
            ),
            DropdownMenuItem(
              value: MainAxisAlignment.end,
              child: Text('End'),
            ),
          ],
          onChanged: (MainAxisAlignment? value) {
            if (value != null) {
              setState(() {
                _alignment = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildSizeControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text('${_size.toInt()}px'),
        Slider(
          value: _size,
          min: 4.0,
          max: 24.0,
          divisions: 20,
          onChanged: (double value) {
            setState(() {
              _size = value;
            });
          },
        ),
        const SizedBox(height: 8),
        const Text('Spacing:', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${_spacing.toInt()}px'),
        Slider(
          value: _spacing,
          min: 2.0,
          max: 24.0,
          divisions: 22,
          onChanged: (double value) {
            setState(() {
              _spacing = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildOptionsToggles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Options:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        CheckboxListTile(
          title: const Text('Show Label'),
          value: _hasLabel,
          onChanged: (bool? value) {
            setState(() {
              _hasLabel = value ?? true;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Animate'),
          value: _animate,
          onChanged: (bool? value) {
            setState(() {
              _animate = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Enable Interaction'),
          value: _enableInteraction,
          onChanged: (bool? value) {
            setState(() {
              _enableInteraction = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
        ),
      ],
    );
  }

  Widget _buildTextInputs() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Custom Label',
        border: OutlineInputBorder(),
      ),
      controller: TextEditingController(text: _customLabel),
      onChanged: (value) {
        setState(() {
          _customLabel = value.isNotEmpty ? value : 'Status Label';
        });
      },
    );
  }

  Widget _buildInteractiveExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text(
              'Ejemplo Interactivo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            Center(
              child: DSStatusDot(
                status: _selectedVariant,
                label: _hasLabel ? _customLabel : null,
                state: _selectedState,
                size: _size,
                spacing: _spacing,
                animate: _animate,
                alignment: _alignment,
                onTap: _enableInteraction ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Status dot tapped!')),
                  );
                } : null,
                onHover: _enableInteraction ? () {
                  debugPrint('Status dot hovered');
                } : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantsShowcase() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Variantes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildVariantExample(
              'Success',
              'Indica éxito, completado o estado positivo',
              DSStatusDot.success(label: 'Connected'),
            ),
            const SizedBox(height: 16),
            _buildVariantExample(
              'Info',
              'Información general o neutral',
              DSStatusDot.info(label: 'Processing'),
            ),
            const SizedBox(height: 16),
            _buildVariantExample(
              'Warning',
              'Advertencia o precaución necesaria',
              DSStatusDot.warn(label: 'Limited'),
            ),
            const SizedBox(height: 16),
            _buildVariantExample(
              'Error',
              'Error o estado crítico',
              DSStatusDot.error(label: 'Disconnected'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantExample(String title, String description, Widget statusDot) {
    return Row(
      children: [
        statusDot,
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(description, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatesShowcase() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estados',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: DSStatusDotState.values.map((state) {
                return _buildStateExample(state);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExample(DSStatusDotState state) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DSStatusDot(
            status: StatusDotVariant.info,
            label: state.name,
            state: state,
            size: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildSizesShowcase() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tamaños',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                _buildSizeExample('Small (6px)', 6),
                _buildSizeExample('Default (8px)', 8),
                _buildSizeExample('Medium (12px)', 12),
                _buildSizeExample('Large (16px)', 16),
                _buildSizeExample('Extra Large (20px)', 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeExample(String title, double size) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        DSStatusDot.success(
          label: 'Active',
          size: size,
        ),
      ],
    );
  }

  Widget _buildPlatformSpecificExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos Platform-Adaptive',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildPlatformExample(
              'Desktop Hover',
              'Interacción con hover en desktop',
              DSStatusDot.info(
                label: 'Hover me',
                onHover: () {
                  debugPrint('Desktop hover detected');
                },
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Desktop click!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildPlatformExample(
              'Mobile Touch',
              'Optimizado para interacción táctil',
              DSStatusDot.success(
                label: 'Tap me',
                size: 12,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mobile tap!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildPlatformExample(
              'RTL Support',
              'Soporte completo para right-to-left',
              Directionality(
                textDirection: TextDirection.rtl,
                child: DSStatusDot.warn(
                  label: 'تحذير',
                  rtlSupport: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformExample(String title, String description, Widget statusDot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(description, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        statusDot,
      ],
    );
  }

  Widget _buildRealWorldExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos del Mundo Real',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildRealWorldExample(
              'Estados de Servidor',
              Column(
                children: [
                  _buildServerStatus('Database', StatusDotVariant.success),
                  const SizedBox(height: 8),
                  _buildServerStatus('API Gateway', StatusDotVariant.warn),
                  const SizedBox(height: 8),
                  _buildServerStatus('Cache Server', StatusDotVariant.error),
                  const SizedBox(height: 8),
                  _buildServerStatus('CDN', StatusDotVariant.info),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildRealWorldExample(
              'Estados de Usuario',
              Column(
                children: [
                  _buildUserStatus('Online', StatusDotVariant.success),
                  const SizedBox(height: 8),
                  _buildUserStatus('Away', StatusDotVariant.warn),
                  const SizedBox(height: 8),
                  _buildUserStatus('Busy', StatusDotVariant.error),
                  const SizedBox(height: 8),
                  _buildUserStatus('Offline', Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildRealWorldExample(
              'Estados de Proceso',
              Column(
                children: [
                  DSStatusDot.info(label: 'Initializing', animate: true),
                  const SizedBox(height: 8),
                  DSStatusDot.info(label: 'Processing', animate: true),
                  const SizedBox(height: 8),
                  DSStatusDot.success(label: 'Completed'),
                  const SizedBox(height: 8),
                  DSStatusDot.error(label: 'Failed'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildRealWorldExample(
              'Estados de Notificación',
              Column(
                children: [
                  DSStatusDot.info(label: 'New message'),
                  const SizedBox(height: 8),
                  DSStatusDot.warn(label: 'Update available'),
                  const SizedBox(height: 8),
                  DSStatusDot.error(label: 'Action required'),
                  const SizedBox(height: 8),
                  DSStatusDot.success(label: 'Backup completed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServerStatus(String name, StatusDotVariant variant) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        DSStatusDot(
          status: variant,
          label: _getStatusText(variant),
        ),
      ],
    );
  }

  Widget _buildUserStatus(String status, dynamic color) {
    return Row(
      children: [
        if (color is StatusDotVariant)
          DSStatusDot(status: color, size: 10)
        else
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        const SizedBox(width: 12),
        Text(status),
      ],
    );
  }

  String _getStatusText(StatusDotVariant variant) {
    switch (variant) {
      case StatusDotVariant.success:
        return 'Online';
      case StatusDotVariant.warn:
        return 'Issues';
      case StatusDotVariant.error:
        return 'Offline';
      case StatusDotVariant.info:
        return 'Syncing';
    }
  }

  Widget _buildRealWorldExample(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: content,
        ),
      ],
    );
  }
}