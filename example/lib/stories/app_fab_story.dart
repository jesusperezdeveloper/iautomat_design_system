import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppFabStory extends StatefulWidget {
  const AppFabStory({super.key});

  @override
  State<AppFabStory> createState() => _AppFabStoryState();
}

class _AppFabStoryState extends State<AppFabStory> {
  AppFabVariant _variant = AppFabVariant.regular;
  AppFabState _state = AppFabState.defaultState;
  AppFabLocation _location = AppFabLocation.endFloat;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _isInteractive = true;
  bool _hasIcon = true;
  bool _hasLabel = false;
  double _borderRadius = 16.0;
  double _elevation = 6.0;
  String _selectedIcon = 'add';

  String? _lastInteraction;

  final Map<String, IconData> _iconOptions = {
    'add': Icons.add,
    'edit': Icons.edit,
    'save': Icons.save,
    'share': Icons.share,
    'favorite': Icons.favorite,
    'delete': Icons.delete,
    'search': Icons.search,
    'settings': Icons.settings,
  };

  void _handlePressed() {
    setState(() {
      _lastInteraction = 'FAB pressed';
    });
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _lastInteraction = isHovered ? 'Hover started' : 'Hover ended';
    });
  }

  void _handleFocusChange(bool isFocused) {
    setState(() {
      _lastInteraction = isFocused ? 'Focus gained' : 'Focus lost';
    });
  }

  Widget _buildSampleFab({required AppFabConfig config}) {
    return AppFab(
      config: config,
      icon: _hasIcon ? Icon(_iconOptions[_selectedIcon]) : null,
      label: _hasLabel ? 'Acción' : null,
      location: _location,
      tooltip: 'FAB de ejemplo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppFab Stories'),
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
                        DropdownButton<AppFabVariant>(
                          value: _variant,
                          onChanged: (value) => setState(() => _variant = value!),
                          items: AppFabVariant.values.map((variant) {
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
                        DropdownButton<AppFabState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: AppFabState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Location
                    Row(
                      children: [
                        const Text('Ubicación: '),
                        const SizedBox(width: 8),
                        DropdownButton<AppFabLocation>(
                          value: _location,
                          onChanged: (value) => setState(() => _location = value!),
                          items: AppFabLocation.values.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Icon Selection
                    Row(
                      children: [
                        const Text('Icono: '),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: _selectedIcon,
                          onChanged: (value) => setState(() => _selectedIcon = value!),
                          items: _iconOptions.keys.map((iconName) {
                            return DropdownMenuItem(
                              value: iconName,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(_iconOptions[iconName], size: 20),
                                  const SizedBox(width: 8),
                                  Text(iconName),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
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
                            max: 16.0,
                            divisions: 16,
                            label: _elevation.toStringAsFixed(0),
                            onChanged: (value) => setState(() => _elevation = value),
                          ),
                        ),
                        Text(_elevation.toStringAsFixed(0)),
                      ],
                    ),

                    // Border Radius
                    Row(
                      children: [
                        const Text('Border Radius: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _borderRadius,
                            min: 0.0,
                            max: 32.0,
                            divisions: 16,
                            label: _borderRadius.toStringAsFixed(0),
                            onChanged: (value) => setState(() => _borderRadius = value),
                          ),
                        ),
                        Text('${_borderRadius.toStringAsFixed(0)}px'),
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
                              onChanged: (value) => setState(() => _isRtl = value),
                            ),
                            const Text('RTL'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableA11y,
                              onChanged: (value) => setState(() => _enableA11y = value),
                            ),
                            const Text('Accesibilidad'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableKeyboard,
                              onChanged: (value) => setState(() => _enableKeyboard = value),
                            ),
                            const Text('Teclado'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _isInteractive,
                              onChanged: (value) => setState(() => _isInteractive = value),
                            ),
                            const Text('Interactivo'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _hasIcon,
                              onChanged: (value) => setState(() => _hasIcon = value),
                            ),
                            const Text('Icono'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _hasLabel,
                              onChanged: (value) => setState(() => _hasLabel = value),
                            ),
                            const Text('Texto'),
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
              'FAB Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          'Área de demostración',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    _buildSampleFab(
                      config: AppFabConfig(
                        variant: _variant,
                        state: _state,
                        location: _location,
                        isRtl: _isRtl,
                        enableA11y: _enableA11y,
                        enableKeyboardSupport: _enableKeyboard,
                        isInteractive: _isInteractive,
                        spacing: AppFabSpacing(
                          borderRadius: _borderRadius,
                        ),
                        elevation: AppFabElevation(
                          defaultElevation: _elevation,
                        ),
                        behavior: const AppFabBehavior(
                          enableHover: true,
                          enableHapticFeedback: true,
                        ),
                        onPressed: _isInteractive ? _handlePressed : null,
                        onHover: _isInteractive ? _handleHover : null,
                        onFocusChange: _isInteractive ? _handleFocusChange : null,
                      ),
                    ),
                  ],
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                itemCount: AppFabVariant.values.length,
                itemBuilder: (context, index) {
                  final variant = AppFabVariant.values[index];
                  return _buildVariantExample(variant);
                },
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
                  childAspectRatio: 1.0,
                ),
                itemCount: AppFabState.values.length,
                itemBuilder: (context, index) {
                  final state = AppFabState.values[index];
                  return _buildStateExample(state);
                },
              ),
            ),

            // Ubicaciones
            _buildExampleSection(
              'Ubicaciones Comunes',
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLocationExample(AppFabLocation.endFloat, 'End Float'),
                      _buildLocationExample(AppFabLocation.centerFloat, 'Center Float'),
                      _buildLocationExample(AppFabLocation.startFloat, 'Start Float'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLocationExample(AppFabLocation.endDocked, 'End Docked'),
                      _buildLocationExample(AppFabLocation.centerDocked, 'Center Docked'),
                      _buildLocationExample(AppFabLocation.startDocked, 'Start Docked'),
                    ],
                  ),
                ],
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
                      AppFab(
                        config: const AppFabConfig(),
                        icon: const Icon(Icons.add),
                        tooltip: 'Agregar elemento',
                      ),
                      AppFab(
                        config: const AppFabConfig(
                          variant: AppFabVariant.extended,
                        ),
                        icon: const Icon(Icons.edit),
                        label: 'Editar',
                        tooltip: 'Editar elemento',
                      ),
                      AppFab(
                        config: const AppFabConfig(
                          variant: AppFabVariant.small,
                        ),
                        icon: const Icon(Icons.favorite),
                        tooltip: 'Me gusta',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppFab(
                        config: const AppFabConfig(
                          variant: AppFabVariant.large,
                          colors: AppFabColors(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.delete),
                        tooltip: 'Eliminar',
                      ),
                      AppFab(
                        config: const AppFabConfig(
                          variant: AppFabVariant.extended,
                          colors: AppFabColors(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.save),
                        label: 'Guardar',
                        tooltip: 'Guardar cambios',
                      ),
                      AppFab(
                        config: const AppFabConfig(
                          colors: AppFabColors(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.share),
                        tooltip: 'Compartir',
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
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        child,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildVariantExample(AppFabVariant variant) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppFab(
          config: AppFabConfig(variant: variant),
          icon: variant.isExtended ? const Icon(Icons.star) : const Icon(Icons.add),
          label: variant.isExtended ? variant.displayName : null,
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

  Widget _buildStateExample(AppFabState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppFab(
          config: AppFabConfig(state: state),
          icon: const Icon(Icons.star),
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

  Widget _buildLocationExample(AppFabLocation location, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              AppFab(
                config: AppFabConfig(
                  location: location,
                  variant: AppFabVariant.small,
                ),
                icon: const Icon(Icons.star, size: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}