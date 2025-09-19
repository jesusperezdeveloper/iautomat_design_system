import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSSwitchStory extends StatefulWidget {
  const DSSwitchStory({super.key});

  @override
  State<DSSwitchStory> createState() => _DSSwitchStoryState();
}

class _DSSwitchStoryState extends State<DSSwitchStory> {
  DSSwitchVariant _variant = DSSwitchVariant.android;
  DSSwitchState _state = DSSwitchState.defaultState;
  bool _value = false;
  bool _isAdaptive = false;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _isInteractive = true;
  double _thumbRadius = 14.0;
  double _trackWidth = 52.0;
  double _trackHeight = 20.0;
  double _elevation = 1.0;

  String? _lastInteraction;

  void _handleChanged(bool value) {
    setState(() {
      _value = value;
      _lastInteraction = value ? 'Switch activado' : 'Switch desactivado';
    });
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _lastInteraction = isHovered ? 'Hover iniciado' : 'Hover terminado';
    });
  }

  void _handleFocusChange(bool isFocused) {
    setState(() {
      _lastInteraction = isFocused ? 'Foco obtenido' : 'Foco perdido';
    });
  }

  Widget _buildSampleSwitch({required DSSwitchConfig config}) {
    return DSSwitch(
      config: config,
      value: _value,
      onChanged: _isInteractive ? _handleChanged : null,
      semanticsLabel: 'Switch de ejemplo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSSwitch Stories'),
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
                        DropdownButton<DSSwitchVariant>(
                          value: _variant,
                          onChanged: (value) =>
                              setState(() => _variant = value!),
                          items: DSSwitchVariant.values.map((variant) {
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
                        DropdownButton<DSSwitchState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: DSSwitchState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Thumb Radius
                    Row(
                      children: [
                        const Text('Radio del Thumb: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _thumbRadius,
                            min: 8.0,
                            max: 20.0,
                            divisions: 12,
                            label: _thumbRadius.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _thumbRadius = value),
                          ),
                        ),
                        Text('${_thumbRadius.toStringAsFixed(0)}px'),
                      ],
                    ),

                    // Track Width
                    Row(
                      children: [
                        const Text('Ancho del Track: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _trackWidth,
                            min: 40.0,
                            max: 70.0,
                            divisions: 15,
                            label: _trackWidth.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _trackWidth = value),
                          ),
                        ),
                        Text('${_trackWidth.toStringAsFixed(0)}px'),
                      ],
                    ),

                    // Track Height
                    Row(
                      children: [
                        const Text('Alto del Track: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _trackHeight,
                            min: 16.0,
                            max: 32.0,
                            divisions: 16,
                            label: _trackHeight.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _trackHeight = value),
                          ),
                        ),
                        Text('${_trackHeight.toStringAsFixed(0)}px'),
                      ],
                    ),

                    // Elevation
                    Row(
                      children: [
                        const Text('Elevación: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _elevation,
                            min: 0.0,
                            max: 8.0,
                            divisions: 8,
                            label: _elevation.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _elevation = value),
                          ),
                        ),
                        Text(_elevation.toStringAsFixed(0)),
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
                              value: _isAdaptive,
                              onChanged: (value) =>
                                  setState(() => _isAdaptive = value),
                            ),
                            const Text('Adaptativo'),
                          ],
                        ),
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
                              value: _isInteractive,
                              onChanged: (value) =>
                                  setState(() => _isInteractive = value),
                            ),
                            const Text('Interactivo'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _value,
                              onChanged: _isInteractive
                                  ? (value) => setState(() => _value = value)
                                  : null,
                            ),
                            const Text('Valor'),
                          ],
                        ),
                      ],
                    ),

                    if (_lastInteraction != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_lastInteraction!),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Ejemplo Configurable
            Text(
              'Switch Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Center(
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _buildSampleSwitch(
                    config: DSSwitchConfig(
                      variant: _variant,
                      state: _state,
                      value: _value,
                      isAdaptive: _isAdaptive,
                      isRtl: _isRtl,
                      enableA11y: _enableA11y,
                      enableKeyboardSupport: _enableKeyboard,
                      isInteractive: _isInteractive,
                      spacing: DSSwitchSpacing(
                        thumbRadius: _thumbRadius,
                        trackWidth: _trackWidth,
                        trackHeight: _trackHeight,
                      ),
                      elevation: DSSwitchElevation(
                        defaultElevation: _elevation,
                      ),
                      behavior: const DSSwitchBehavior(
                        enableHover: true,
                        enableHapticFeedback: true,
                      ),
                      onChanged: _isInteractive ? _handleChanged : null,
                      onHover: _isInteractive ? _handleHover : null,
                      onFocusChange: _isInteractive ? _handleFocusChange : null,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Ejemplos Predefinidos
            Text(
              'Ejemplos Predefinidos',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Variantes
            _buildExampleSection(
              'Variantes',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: DSSwitchVariant.values.map((variant) {
                  return _buildVariantExample(variant);
                }).toList(),
              ),
            ),

            // Estados
            _buildExampleSection(
              'Estados del Componente',
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.0,
                ),
                itemCount: DSSwitchState.values.length,
                itemBuilder: (context, index) {
                  final state = DSSwitchState.values[index];
                  return _buildStateExample(state);
                },
              ),
            ),

            // Casos de Uso Comunes
            _buildExampleSection(
              'Casos de Uso Comunes',
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildUseCaseExample(
                        'Configuraciones',
                        'Activar notificaciones',
                        const DSSwitchConfig(),
                      ),
                      _buildUseCaseExample(
                        'Modo Oscuro',
                        'Tema oscuro',
                        const DSSwitchConfig(
                          colors: DSSwitchColors(
                            activeTrackColor: Colors.purple,
                            activeThumbColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildUseCaseExample(
                        'iOS Style',
                        'Switch Cupertino',
                        const DSSwitchConfig(
                          variant: DSSwitchVariant.cupertino,
                          colors: DSSwitchColors(
                            activeTrackColor: Colors.green,
                          ),
                        ),
                      ),
                      _buildUseCaseExample(
                        'Peligro',
                        'Eliminar datos',
                        const DSSwitchConfig(
                          colors: DSSwitchColors(
                            activeTrackColor: Colors.red,
                            activeThumbColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildUseCaseExample(
                        'Deshabilitado',
                        'Función no disponible',
                        const DSSwitchConfig(state: DSSwitchState.disabled),
                      ),
                      _buildUseCaseExample(
                        'Cargando',
                        'Sincronizando...',
                        const DSSwitchConfig(state: DSSwitchState.loading),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        child,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildVariantExample(DSSwitchVariant variant) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DSSwitch(
          config: DSSwitchConfig(variant: variant),
          value: true,
          onChanged: (_) {},
        ),
        const SizedBox(height: 8),
        Text(
          variant.displayName,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStateExample(DSSwitchState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DSSwitch(
          config: DSSwitchConfig(state: state),
          value: state != DSSwitchState.defaultState,
          onChanged: state.canInteract ? (_) {} : null,
        ),
        const SizedBox(height: 8),
        Text(
          state.displayName,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildUseCaseExample(
    String title,
    String description,
    DSSwitchConfig config,
  ) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          DSSwitch(
            config: config,
            value: true,
            onChanged: config.state.canInteract ? (_) {} : null,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
