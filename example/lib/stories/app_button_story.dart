import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppButtonStory extends StatefulWidget {
  const AppButtonStory({super.key});

  @override
  State<AppButtonStory> createState() => _AppButtonStoryState();
}

class _AppButtonStoryState extends State<AppButtonStory> {
  AppButtonVariant _variant = AppButtonVariant.filled;
  AppButtonState _state = AppButtonState.defaultState;
  AppButtonSize _size = AppButtonSize.medium;
  bool _isDanger = false;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _isInteractive = true;
  bool _hasLeading = false;
  bool _hasTrailing = false;
  double _borderRadius = 12.0;
  double _horizontalPadding = 16.0;
  double _elevation = 1.0;

  String? _lastInteraction;

  void _handlePressed() {
    setState(() {
      _lastInteraction = 'Button pressed';
    });
  }

  void _handleLongPress() {
    setState(() {
      _lastInteraction = 'Button long pressed';
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

  Widget _buildSampleButton({required AppButtonConfig config}) {
    return AppButton(
      config: config,
      label: 'Sample Button',
      leading: _hasLeading ? const Icon(Icons.star) : null,
      trailing: _hasTrailing ? const Icon(Icons.arrow_forward) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppButton Stories'),
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
                        DropdownButton<AppButtonVariant>(
                          value: _variant,
                          onChanged: (value) => setState(() => _variant = value!),
                          items: AppButtonVariant.values.map((variant) {
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
                        DropdownButton<AppButtonState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: AppButtonState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Size
                    Row(
                      children: [
                        const Text('Tamaño: '),
                        const SizedBox(width: 8),
                        DropdownButton<AppButtonSize>(
                          value: _size,
                          onChanged: (value) => setState(() => _size = value!),
                          items: AppButtonSize.values.map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(size.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Horizontal Padding
                    Row(
                      children: [
                        const Text('Padding Horizontal: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _horizontalPadding,
                            min: 8.0,
                            max: 32.0,
                            divisions: 12,
                            label: _horizontalPadding.toStringAsFixed(0),
                            onChanged: (value) => setState(() => _horizontalPadding = value),
                          ),
                        ),
                        Text('${_horizontalPadding.toStringAsFixed(0)}px'),
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
                            max: 24.0,
                            divisions: 12,
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
                              value: _isDanger,
                              onChanged: (value) => setState(() => _isDanger = value),
                            ),
                            const Text('Peligro'),
                          ],
                        ),
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
                              value: _hasLeading,
                              onChanged: (value) => setState(() => _hasLeading = value),
                            ),
                            const Text('Icono Leading'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _hasTrailing,
                              onChanged: (value) => setState(() => _hasTrailing = value),
                            ),
                            const Text('Icono Trailing'),
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
              'Botón Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Center(
              child: _buildSampleButton(
                config: AppButtonConfig(
                  variant: _variant,
                  state: _state,
                  size: _size,
                  isDanger: _isDanger,
                  isRtl: _isRtl,
                  enableA11y: _enableA11y,
                  enableKeyboardSupport: _enableKeyboard,
                  isInteractive: _isInteractive,
                  spacing: AppButtonSpacing(
                    horizontalPadding: _horizontalPadding,
                    borderRadius: _borderRadius,
                  ),
                  elevation: AppButtonElevation(
                    defaultElevation: _elevation,
                  ),
                  onPressed: _isInteractive ? _handlePressed : null,
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
                  childAspectRatio: 2.0,
                ),
                itemCount: AppButtonVariant.values.length,
                itemBuilder: (context, index) {
                  final variant = AppButtonVariant.values[index];
                  return _buildVariantButton(variant);
                },
              ),
            ),

            // Tamaños
            _buildExampleSection(
              'Tamaños',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AppButtonSize.values.map((size) {
                  return _buildSizeButton(size);
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
                  childAspectRatio: 1.5,
                ),
                itemCount: AppButtonState.values.length,
                itemBuilder: (context, index) {
                  final state = AppButtonState.values[index];
                  return _buildStateButton(state);
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
                      AppButton(
                        config: const AppButtonConfig(
                          variant: AppButtonVariant.filled,
                        ),
                        label: 'Guardar',
                        leading: const Icon(Icons.save),
                      ),
                      AppButton(
                        config: const AppButtonConfig(
                          variant: AppButtonVariant.outline,
                        ),
                        label: 'Cancelar',
                      ),
                      AppButton(
                        config: const AppButtonConfig(
                          variant: AppButtonVariant.text,
                          isDanger: true,
                        ),
                        label: 'Eliminar',
                        leading: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                        config: const AppButtonConfig(
                          variant: AppButtonVariant.icon,
                          size: AppButtonSize.small,
                        ),
                        leading: const Icon(Icons.favorite),
                      ),
                      AppButton(
                        config: const AppButtonConfig(
                          variant: AppButtonVariant.tonal,
                        ),
                        label: 'Compartir',
                        trailing: const Icon(Icons.share),
                      ),
                      AppButton(
                        config: const AppButtonConfig(
                          variant: AppButtonVariant.segmented,
                          state: AppButtonState.selected,
                        ),
                        label: 'Activo',
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

  Widget _buildVariantButton(AppButtonVariant variant) {
    return AppButton(
      config: AppButtonConfig(variant: variant),
      label: variant.displayName,
      leading: variant == AppButtonVariant.icon ? const Icon(Icons.star) : null,
    );
  }

  Widget _buildSizeButton(AppButtonSize size) {
    return AppButton(
      config: AppButtonConfig(size: size),
      label: size.displayName,
    );
  }

  Widget _buildStateButton(AppButtonState state) {
    return AppButton(
      config: AppButtonConfig(state: state),
      label: state.displayName,
    );
  }
}