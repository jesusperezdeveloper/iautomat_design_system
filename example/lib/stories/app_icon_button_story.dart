import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppIconButtonStory extends StatefulWidget {
  const AppIconButtonStory({super.key});

  @override
  State<AppIconButtonStory> createState() => _AppIconButtonStoryState();
}

class _AppIconButtonStoryState extends State<AppIconButtonStory> {
  AppIconButtonVariant _variant = AppIconButtonVariant.standard;
  AppIconButtonState _state = AppIconButtonState.defaultState;
  AppIconButtonSize _size = AppIconButtonSize.medium;
  bool _isToggled = false;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _isInteractive = true;
  bool _enableToggle = false;
  double _borderRadius = 8.0;
  double _elevation = 0.0;
  String _selectedIcon = 'favorite';

  String? _lastInteraction;

  final Map<String, IconData> _iconOptions = {
    'favorite': Icons.favorite,
    'favorite_outline': Icons.favorite_border,
    'star': Icons.star,
    'star_outline': Icons.star_border,
    'thumb_up': Icons.thumb_up,
    'thumb_up_outline': Icons.thumb_up_outlined,
    'bookmark': Icons.bookmark,
    'bookmark_outline': Icons.bookmark_border,
    'share': Icons.share,
    'edit': Icons.edit,
    'delete': Icons.delete,
    'add': Icons.add,
    'remove': Icons.remove,
    'close': Icons.close,
    'check': Icons.check,
    'settings': Icons.settings,
    'info': Icons.info,
    'search': Icons.search,
    'menu': Icons.menu,
    'more_vert': Icons.more_vert,
    'more_horiz': Icons.more_horiz,
  };

  void _handlePressed() {
    setState(() {
      _lastInteraction = 'Botón presionado';
    });
  }

  void _handleToggle(bool isToggled) {
    setState(() {
      _isToggled = isToggled;
      _lastInteraction = isToggled ? 'Activado' : 'Desactivado';
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

  Widget _buildSampleIconButton({required AppIconButtonConfig config}) {
    return AppIconButton(
      config: config,
      icon: Icon(_iconOptions[_selectedIcon]),
      tooltip: 'Botón de ejemplo',
      size: _size,
      isToggled: _isToggled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppIconButton Stories'),
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
                        DropdownButton<AppIconButtonVariant>(
                          value: _variant,
                          onChanged: (value) =>
                              setState(() => _variant = value!),
                          items: AppIconButtonVariant.values.map((variant) {
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
                        DropdownButton<AppIconButtonState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: AppIconButtonState.values.map((state) {
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
                        DropdownButton<AppIconButtonSize>(
                          value: _size,
                          onChanged: (value) => setState(() => _size = value!),
                          items: AppIconButtonSize.values.map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(size.displayName),
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
                          onChanged: (value) =>
                              setState(() => _selectedIcon = value!),
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
                              value: _enableToggle,
                              onChanged: (value) =>
                                  setState(() => _enableToggle = value),
                            ),
                            const Text('Toggle'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _isToggled,
                              onChanged: _enableToggle
                                  ? (value) =>
                                        setState(() => _isToggled = value)
                                  : null,
                            ),
                            const Text('Activado'),
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
              'IconButton Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _buildSampleIconButton(
                    config: AppIconButtonConfig(
                      variant: _variant,
                      state: _state,
                      size: _size,
                      isToggled: _isToggled,
                      isRtl: _isRtl,
                      enableA11y: _enableA11y,
                      enableKeyboardSupport: _enableKeyboard,
                      isInteractive: _isInteractive,
                      spacing: AppIconButtonSpacing(
                        borderRadius: _borderRadius,
                      ),
                      elevation: AppIconButtonElevation(
                        defaultElevation: _elevation,
                      ),
                      behavior: AppIconButtonBehavior(
                        enableHover: true,
                        enableHapticFeedback: true,
                        enableToggle: _enableToggle,
                      ),
                      onPressed: _isInteractive ? _handlePressed : null,
                      onToggle: _enableToggle ? _handleToggle : null,
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
                children: AppIconButtonVariant.values.map((variant) {
                  return _buildVariantExample(variant);
                }).toList(),
              ),
            ),

            // Tamaños
            _buildExampleSection(
              'Tamaños',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AppIconButtonSize.values.map((size) {
                  return _buildSizeExample(size);
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
                  childAspectRatio: 1.0,
                ),
                itemCount: AppIconButtonState.values.length,
                itemBuilder: (context, index) {
                  final state = AppIconButtonState.values[index];
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
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.standard,
                        ),
                        icon: const Icon(Icons.favorite_border),
                        tooltip: 'Me gusta',
                      ),
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.filled,
                          behavior: AppIconButtonBehavior(enableToggle: true),
                        ),
                        icon: const Icon(Icons.star),
                        tooltip: 'Favorito',
                        isToggled: true,
                      ),
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.tonal,
                        ),
                        icon: const Icon(Icons.share),
                        tooltip: 'Compartir',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.filled,
                          size: AppIconButtonSize.small,
                          colors: AppIconButtonColors(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.delete),
                        tooltip: 'Eliminar',
                      ),
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.tonal,
                          size: AppIconButtonSize.large,
                          colors: AppIconButtonColors(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.check),
                        tooltip: 'Confirmar',
                      ),
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.standard,
                          state: AppIconButtonState.disabled,
                        ),
                        icon: const Icon(Icons.edit),
                        tooltip: 'Editar (deshabilitado)',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.filled,
                          animation: AppIconButtonAnimation(
                            type: AppIconButtonAnimationType.scale,
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        tooltip: 'Agregar con animación',
                      ),
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.tonal,
                          animation: AppIconButtonAnimation(
                            type: AppIconButtonAnimationType.rotation,
                          ),
                        ),
                        icon: const Icon(Icons.refresh),
                        tooltip: 'Actualizar con rotación',
                      ),
                      AppIconButton(
                        config: const AppIconButtonConfig(
                          variant: AppIconButtonVariant.standard,
                          state: AppIconButtonState.loading,
                        ),
                        icon: const Icon(Icons.sync),
                        tooltip: 'Cargando...',
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

  Widget _buildVariantExample(AppIconButtonVariant variant) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppIconButton(
          config: AppIconButtonConfig(variant: variant),
          icon: const Icon(Icons.star),
          tooltip: variant.displayName,
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

  Widget _buildSizeExample(AppIconButtonSize size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppIconButton(
          config: AppIconButtonConfig(size: size),
          icon: const Icon(Icons.star),
          tooltip: size.displayName,
        ),
        const SizedBox(height: 8),
        Text(
          size.displayName,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStateExample(AppIconButtonState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppIconButton(
          config: AppIconButtonConfig(state: state),
          icon: const Icon(Icons.star),
          tooltip: state.displayName,
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
}
