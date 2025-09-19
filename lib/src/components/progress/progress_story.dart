import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/progress/ds_progress.dart';

/// Story interactivo que demuestra el uso del widget DSProgress
/// con todas sus variantes, estados y configuraciones
class ProgressStory extends StatefulWidget {
  const ProgressStory({super.key});

  @override
  State<ProgressStory> createState() => _ProgressStoryState();
}

class _ProgressStoryState extends State<ProgressStory>
    with TickerProviderStateMixin {
  ProgressVariant _selectedVariant = ProgressVariant.linear;
  DSProgressState _selectedState = DSProgressState.defaultState;
  double? _progressValue = 0.7;
  bool _isIndeterminate = false;
  bool _hasLabel = true;
  bool _enableInteraction = false;
  String _customLabel = 'Loading progress';

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSProgress Story'),
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
            _buildPlatformSpecificExamples(),
            const SizedBox(height: 32),
            _buildAnimatedExample(),
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
              runSpacing: 8,
              children: [
                _buildVariantSelector(),
                _buildStateSelector(),
                _buildProgressControls(),
                _buildOptionsToggles(),
              ],
            ),
            if (_hasLabel) ...[
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Custom Label',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _customLabel =
                        value.isNotEmpty ? value : 'Loading progress';
                  });
                },
              ),
            ],
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
        SegmentedButton<ProgressVariant>(
          segments: const [
            ButtonSegment(
              value: ProgressVariant.linear,
              label: Text('Linear'),
              icon: Icon(Icons.linear_scale),
            ),
            ButtonSegment(
              value: ProgressVariant.circular,
              label: Text('Circular'),
              icon: Icon(Icons.radio_button_unchecked),
            ),
          ],
          selected: {_selectedVariant},
          onSelectionChanged: (Set<ProgressVariant> selection) {
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
        DropdownButton<DSProgressState>(
          value: _selectedState,
          items: DSProgressState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
          onChanged: (DSProgressState? value) {
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

  Widget _buildProgressControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Progress:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Row(
          children: [
            Checkbox(
              value: _isIndeterminate,
              onChanged: (bool? value) {
                setState(() {
                  _isIndeterminate = value ?? false;
                  if (_isIndeterminate) {
                    _progressValue = null;
                  } else {
                    _progressValue = 0.7;
                  }
                });
              },
            ),
            const Text('Indeterminate'),
          ],
        ),
        if (!_isIndeterminate) ...[
          const SizedBox(height: 8),
          Text('Value: ${(_progressValue! * 100).round()}%'),
          Slider(
            value: _progressValue!,
            onChanged: (double value) {
              setState(() {
                _progressValue = value;
              });
            },
          ),
        ],
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

  Widget _buildInteractiveExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Ejemplo Interactivo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: _selectedVariant == ProgressVariant.linear ? 300 : 100,
                child: DSProgress(
                  variant: _selectedVariant,
                  value: _progressValue,
                  label: _hasLabel ? _customLabel : null,
                  state: _selectedState,
                  onTap: _enableInteraction
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Progress tapped!')),
                          );
                        }
                      : null,
                  onHover: _enableInteraction
                      ? () {
                          debugPrint('Progress hovered');
                        }
                      : null,
                ),
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
              'Linear Progress',
              'Ideal para mostrar progreso de cargas lineales',
              DSProgress.linear(
                value: 0.65,
                label: 'Uploading files',
              ),
            ),
            const SizedBox(height: 24),
            _buildVariantExample(
              'Circular Progress',
              'Perfecto para indicadores de carga compactos',
              DSProgress.circular(
                value: 0.80,
                label: 'Processing',
              ),
            ),
            const SizedBox(height: 24),
            _buildVariantExample(
              'Indeterminate Linear',
              'Para procesos sin duración conocida',
              DSProgress.linear(),
            ),
            const SizedBox(height: 24),
            _buildVariantExample(
              'Indeterminate Circular',
              'Spinner clásico para cargas',
              DSProgress.circular(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantExample(
      String title, String description, Widget progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(description, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 12),
        SizedBox(
          width: progress is DSProgress &&
                  progress.variant == ProgressVariant.linear
              ? 250
              : 60,
          child: progress,
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
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: DSProgressState.values.map((state) {
                return _buildStateExample(state);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExample(DSProgressState state) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          Text(
            state.name,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          DSProgress.circular(
            value: 0.6,
            state: state,
            radius: 20,
          ),
        ],
      ),
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
              DSProgress.linear(
                value: 0.45,
                label: 'Download Progress',
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
              DSProgress.circular(
                value: 0.75,
                label: 'Sync',
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
                child: DSProgress.linear(
                  value: 0.55,
                  label: 'تحميل الملفات',
                  rtlSupport: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformExample(
      String title, String description, Widget progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(description, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        progress,
      ],
    );
  }

  Widget _buildAnimatedExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplo Animado',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Text('Progress que se anima automáticamente:'),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return Column(
                  children: [
                    DSProgress.linear(
                      value: _progressAnimation.value,
                      label: 'Animated Progress',
                    ),
                    const SizedBox(height: 16),
                    DSProgress.circular(
                      value: _progressAnimation.value,
                      label:
                          'Sync ${(_progressAnimation.value * 100).round()}%',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
