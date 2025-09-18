import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppCardStory extends StatefulWidget {
  const AppCardStory({super.key});

  @override
  State<AppCardStory> createState() => _AppCardStoryState();
}

class _AppCardStoryState extends State<AppCardStory> {
  AppCardVariant _variant = AppCardVariant.elevated;
  AppCardState _state = AppCardState.defaultState;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _isInteractive = true;
  bool _hasHeader = true;
  bool _hasFooter = true;
  double _padding = 16.0;
  double _elevation = 1.0;
  double _borderRadius = 12.0;

  String? _lastInteraction;

  void _handleTap() {
    setState(() {
      _lastInteraction = 'Tap detected';
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _lastInteraction = 'Double tap detected';
    });
  }

  void _handleLongPress() {
    setState(() {
      _lastInteraction = 'Long press detected';
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

  Widget _buildSampleCard({required AppCardConfig config}) {
    return AppCard(
      config: config,
      header: _hasHeader
          ? Row(
              children: [
                const Icon(Icons.card_giftcard, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Card Header',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sample Card Content',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Esta es una tarjeta de ejemplo que demuestra las capacidades del componente AppCard. Incluye soporte para diferentes variantes, estados e interacciones.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text('4.5', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Text('5 min ago', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
      footer: _hasFooter
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text('Cancel')),
                ElevatedButton(onPressed: () {}, child: const Text('Accept')),
              ],
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppCard Stories'),
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
                        DropdownButton<AppCardVariant>(
                          value: _variant,
                          onChanged: (value) =>
                              setState(() => _variant = value!),
                          items: AppCardVariant.values.map((variant) {
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
                        DropdownButton<AppCardState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: AppCardState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Padding
                    Row(
                      children: [
                        const Text('Padding: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _padding,
                            min: 8.0,
                            max: 32.0,
                            divisions: 6,
                            label: _padding.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _padding = value),
                          ),
                        ),
                        Text('${_padding.toStringAsFixed(0)}px'),
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
                            onChanged: (value) =>
                                setState(() => _elevation = value),
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
                            max: 24.0,
                            divisions: 12,
                            label: _borderRadius.toStringAsFixed(0),
                            onChanged: (value) =>
                                setState(() => _borderRadius = value),
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
                              value: _hasHeader,
                              onChanged: (value) =>
                                  setState(() => _hasHeader = value),
                            ),
                            const Text('Header'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _hasFooter,
                              onChanged: (value) =>
                                  setState(() => _hasFooter = value),
                            ),
                            const Text('Footer'),
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
              'Card Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 400),
              child: _buildSampleCard(
                config: AppCardConfig(
                  variant: _variant,
                  state: _state,
                  isRtl: _isRtl,
                  enableA11y: _enableA11y,
                  enableKeyboardSupport: _enableKeyboard,
                  isInteractive: _isInteractive,
                  spacing: AppCardSpacing(
                    padding: _padding,
                    borderRadius: _borderRadius,
                  ),
                  elevation: AppCardElevation(defaultElevation: _elevation),
                  onTap: _isInteractive ? _handleTap : null,
                  onDoubleTap: _isInteractive ? _handleDoubleTap : null,
                  onLongPress: _isInteractive ? _handleLongPress : null,
                  onHover: _isInteractive ? _handleHover : null,
                  onFocusChange: _isInteractive ? _handleFocusChange : null,
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: AppCardVariant.values.length,
                itemBuilder: (context, index) {
                  final variant = AppCardVariant.values[index];
                  return _buildVariantCard(variant);
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
                itemCount: AppCardState.values.length,
                itemBuilder: (context, index) {
                  final state = AppCardState.values[index];
                  return _buildStateCard(state);
                },
              ),
            ),

            // Casos de Uso Comunes
            _buildExampleSection(
              'Casos de Uso Comunes',
              Column(
                children: [
                  _buildUseCaseCard(
                    'Perfil de Usuario',
                    Icons.person,
                    'Juan Pérez',
                    'Desarrollador Senior • 5 años de experiencia',
                  ),
                  const SizedBox(height: 16),
                  _buildUseCaseCard(
                    'Notificación',
                    Icons.notifications,
                    'Nueva actualización disponible',
                    'Se ha liberado la versión 2.1.0 con mejoras de rendimiento.',
                  ),
                  const SizedBox(height: 16),
                  _buildUseCaseCard(
                    'Producto',
                    Icons.shopping_cart,
                    'iPhone 15 Pro',
                    '\$999 • En stock • 4.8 ★',
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

  Widget _buildVariantCard(AppCardVariant variant) {
    return AppCard(
      config: AppCardConfig(variant: variant),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            variant.hasElevation
                ? Icons.layers
                : variant.hasBorder
                ? Icons.crop_free
                : Icons.square,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            variant.displayName,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            variant.description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStateCard(AppCardState state) {
    return AppCard(
      config: AppCardConfig(state: state),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_getStateIcon(state), size: 24),
          const SizedBox(height: 4),
          Text(
            state.displayName,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildUseCaseCard(
    String title,
    IconData icon,
    String subtitle,
    String description,
  ) {
    return AppCard(
      config: const AppCardConfig(variant: AppCardVariant.elevated),
      body: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(description, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getStateIcon(AppCardState state) {
    switch (state) {
      case AppCardState.defaultState:
        return Icons.check_circle_outline;
      case AppCardState.hover:
        return Icons.touch_app;
      case AppCardState.pressed:
        return Icons.touch_app;
      case AppCardState.focus:
        return Icons.center_focus_strong;
      case AppCardState.selected:
        return Icons.check_circle;
      case AppCardState.disabled:
        return Icons.block;
      case AppCardState.loading:
        return Icons.hourglass_empty;
      case AppCardState.skeleton:
        return Icons.view_module;
    }
  }
}
