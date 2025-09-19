import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/menu/ds_menu.dart';

/// Stories para DSMenu - Ejemplos interactivos del menú
class MenuStoryExample extends StatefulWidget {
  const MenuStoryExample({super.key});

  @override
  State<MenuStoryExample> createState() => _MenuStoryExampleState();
}

class _MenuStoryExampleState extends State<MenuStoryExample> {
  String _selectedItem = 'Ninguno';
  String _lastAction = 'Ninguna';
  MenuAlignment _alignment = MenuAlignment.bottomLeft;
  DSMenuState _menuState = DSMenuState.defaultState;
  bool _enableSearch = false;
  double _elevation = 8.0;
  double _borderRadius = 8.0;

  final List<DSMenuItem> _contextMenuItems = [
    const DSMenuItem(
      id: 'new',
      label: 'Nuevo',
      icon: Icons.add,
      shortcut: 'Ctrl+N',
    ),
    const DSMenuItem(
      id: 'open',
      label: 'Abrir',
      icon: Icons.folder_open,
      shortcut: 'Ctrl+O',
    ),
    const DSMenuItem(
      id: 'recent',
      label: 'Recientes',
      icon: Icons.history,
      trailingIcon: Icons.chevron_right,
      children: [
        DSMenuItem(id: 'file1', label: 'Documento 1.pdf'),
        DSMenuItem(id: 'file2', label: 'Imagen.png'),
        DSMenuItem(id: 'file3', label: 'Proyecto.zip'),
      ],
    ),
    const DSMenuItem(
      id: 'divider1',
      label: '',
      showDividerBefore: true,
    ),
    const DSMenuItem(
      id: 'save',
      label: 'Guardar',
      icon: Icons.save,
      shortcut: 'Ctrl+S',
    ),
    const DSMenuItem(
      id: 'save_as',
      label: 'Guardar como...',
      icon: Icons.save_as,
      shortcut: 'Ctrl+Shift+S',
    ),
    const DSMenuItem(
      id: 'divider2',
      label: '',
      showDividerBefore: true,
    ),
    const DSMenuItem(
      id: 'print',
      label: 'Imprimir',
      icon: Icons.print,
      shortcut: 'Ctrl+P',
    ),
    const DSMenuItem(
      id: 'delete',
      label: 'Eliminar',
      icon: Icons.delete,
      destructive: true,
      shortcut: 'Del',
    ),
  ];

  final List<DSMenuItem> _submenuItems = [
    const DSMenuItem(
      id: 'cut',
      label: 'Cortar',
      icon: Icons.cut,
    ),
    const DSMenuItem(
      id: 'copy',
      label: 'Copiar',
      icon: Icons.copy,
    ),
    const DSMenuItem(
      id: 'paste',
      label: 'Pegar',
      icon: Icons.paste,
    ),
  ];

  final List<DSMenuItem> _typeaheadItems = [
    const DSMenuItem(
      id: 'user1',
      label: 'Juan Pérez',
      icon: Icons.person,
      tooltip: 'Desarrollador Frontend',
    ),
    const DSMenuItem(
      id: 'user2',
      label: 'María García',
      icon: Icons.person,
      tooltip: 'Diseñadora UX/UI',
    ),
    const DSMenuItem(
      id: 'user3',
      label: 'Carlos López',
      icon: Icons.person,
      tooltip: 'Backend Developer',
    ),
    const DSMenuItem(
      id: 'user4',
      label: 'Ana Martínez',
      icon: Icons.person,
      tooltip: 'Product Manager',
    ),
    const DSMenuItem(
      id: 'user5',
      label: 'Pedro Rodríguez',
      icon: Icons.person,
      tooltip: 'DevOps Engineer',
    ),
    const DSMenuItem(
      id: 'team1',
      label: 'Equipo Frontend',
      icon: Icons.group,
      tooltip: 'Equipo de desarrollo frontend',
    ),
    const DSMenuItem(
      id: 'team2',
      label: 'Equipo Backend',
      icon: Icons.group,
      tooltip: 'Equipo de desarrollo backend',
    ),
    const DSMenuItem(
      id: 'team3',
      label: 'Equipo QA',
      icon: Icons.group,
      tooltip: 'Equipo de control de calidad',
    ),
  ];

  void _onItemSelected(DSMenuItem item) {
    setState(() {
      _selectedItem = item.label;
      _lastAction = 'Seleccionado: ${item.label}';
    });
  }

  void _onMenuStateChanged(DSMenuState state) {
    setState(() {
      _menuState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSMenu Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildControls(),
            const SizedBox(height: 32),
            _buildExamples(),
            const SizedBox(height: 32),
            _buildStates(),
            const SizedBox(height: 32),
            _buildPlatformExamples(),
            const SizedBox(height: 32),
            _buildAccessibilityExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DSMenu Component',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sistema de menús adaptativo con soporte para contexto, submenús y typeahead.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estado actual:',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 4),
              Text('Último item: $_selectedItem'),
              Text('Última acción: $_lastAction'),
              Text('Estado del menú: ${_menuState.name}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Alineación:'),
                    DropdownButton<MenuAlignment>(
                      value: _alignment,
                      onChanged: (value) => setState(() => _alignment = value!),
                      items: MenuAlignment.values.map((alignment) {
                        return DropdownMenuItem(
                          value: alignment,
                          child: Text(alignment.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Estado:'),
                    DropdownButton<DSMenuState>(
                      value: _menuState,
                      onChanged: (value) => setState(() => _menuState = value!),
                      items: DSMenuState.values.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Elevación: ${_elevation.toInt()}'),
                    Slider(
                      value: _elevation,
                      min: 0,
                      max: 24,
                      divisions: 12,
                      onChanged: (value) => setState(() => _elevation = value),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Border Radius: ${_borderRadius.toInt()}'),
                    Slider(
                      value: _borderRadius,
                      min: 0,
                      max: 20,
                      divisions: 10,
                      onChanged: (value) => setState(() => _borderRadius = value),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Habilitar búsqueda'),
              value: _enableSearch,
              onChanged: (value) => setState(() => _enableSearch = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Variantes del Menú',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildContextMenuExample(),
            _buildSubmenuExample(),
            _buildTypeaheadExample(),
          ],
        ),
      ],
    );
  }

  Widget _buildContextMenuExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Context Menu',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Menú contextual con opciones de archivo y acciones.',
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;

                  DSMenu.showMenu(
                    context: context,
                    anchorRect: Rect.fromLTWH(
                      position.dx,
                      position.dy,
                      size.width,
                      size.height,
                    ),
                    menu: DSMenu.context(
                      items: _contextMenuItems,
                      onSelected: _onItemSelected,
                      alignment: _alignment,
                      state: _menuState,
                      elevation: _elevation,
                      borderRadius: _borderRadius,
                      onStateChanged: _onMenuStateChanged,
                    ),
                  );
                },
                child: const Text('Mostrar Context Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmenuExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Submenu',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Submenú con opciones de edición.',
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;

                  DSMenu.showMenu(
                    context: context,
                    anchorRect: Rect.fromLTWH(
                      position.dx,
                      position.dy,
                      size.width,
                      size.height,
                    ),
                    menu: DSMenu.submenu(
                      items: _submenuItems,
                      onSelected: _onItemSelected,
                      alignment: _alignment,
                      state: _menuState,
                      elevation: _elevation,
                      borderRadius: _borderRadius,
                      onStateChanged: _onMenuStateChanged,
                    ),
                  );
                },
                child: const Text('Mostrar Submenu'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeaheadExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Typeahead Menu',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Menú con búsqueda para seleccionar usuarios o equipos.',
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;

                  DSMenu.showMenu(
                    context: context,
                    anchorRect: Rect.fromLTWH(
                      position.dx,
                      position.dy,
                      size.width,
                      size.height,
                    ),
                    menu: DSMenu.typeahead(
                      items: _typeaheadItems,
                      onSelected: _onItemSelected,
                      alignment: _alignment,
                      state: _menuState,
                      elevation: _elevation,
                      borderRadius: _borderRadius,
                      onStateChanged: _onMenuStateChanged,
                      onSearchChanged: (query) {
                        setState(() {
                          _lastAction = 'Búsqueda: "$query"';
                        });
                      },
                    ),
                  );
                },
                child: const Text('Mostrar Typeahead'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStates() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estados del Menú',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: DSMenuState.values.map((state) {
            return Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;

                  DSMenu.showMenu(
                    context: context,
                    anchorRect: Rect.fromLTWH(
                      position.dx,
                      position.dy,
                      size.width,
                      size.height,
                    ),
                    menu: DSMenu.context(
                      items: _contextMenuItems.take(3).toList(),
                      onSelected: _onItemSelected,
                      state: state,
                      elevation: _elevation,
                      borderRadius: _borderRadius,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: state == _menuState
                    ? Theme.of(context).colorScheme.primary
                    : null,
                  foregroundColor: state == _menuState
                    ? Theme.of(context).colorScheme.onPrimary
                    : null,
                ),
                child: Text(state.name),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPlatformExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ejemplos Platform-Adaptive',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'El menú se adapta automáticamente a la plataforma:',
                ),
                const SizedBox(height: 8),
                const Text('• Android: Material Design 3'),
                const Text('• iOS: Cupertino-style adaptations'),
                const Text('• Web: Keyboard navigation optimized'),
                const SizedBox(height: 16),
                Text(
                  'Plataforma actual: ${Theme.of(context).platform.name}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccessibilityExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Características de Accesibilidad',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('✓ Navegación por teclado (↑↓ Enter Esc)'),
                const Text('✓ Etiquetas semánticas para screen readers'),
                const Text('✓ Focus management automático'),
                const Text('✓ Soporte RTL completo'),
                const Text('✓ Shortcuts de teclado visibles'),
                const Text('✓ Estados hover/focus/pressed'),
                const Text('✓ Tooltips descriptivos'),
                const Text('✓ Contraste de colores WCAG 2.1'),
                const SizedBox(height: 16),
                const Text(
                  'Instrucciones:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const Text('• Tab: Navegar entre elementos'),
                const Text('• ↑↓: Navegar en el menú'),
                const Text('• Enter/Space: Seleccionar item'),
                const Text('• Esc: Cerrar menú'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}