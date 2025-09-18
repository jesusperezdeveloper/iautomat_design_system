import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class TagStoryExample extends StatefulWidget {
  const TagStoryExample({super.key});

  @override
  State<TagStoryExample> createState() => _TagStoryExampleState();
}

class _TagStoryExampleState extends State<TagStoryExample> {
  AppTagSemanticColor _selectedColor = AppTagSemanticColor.primary;
  AppTagSize _selectedSize = AppTagSize.medium;
  AppTagShape _selectedShape = AppTagShape.rounded;
  bool _enabled = true;
  bool _loading = false;
  bool _skeleton = false;
  bool _visible = true;
  bool _selected = false;
  bool _removable = false;
  bool _outlined = false;
  String _label = 'Etiqueta';
  bool _hasLeadingIcon = false;
  bool _hasTrailingIcon = false;

  final List<String> _sampleTags = [
    'Flutter',
    'Dart',
    'Mobile',
    'UI/UX',
    'Design',
    'Development',
    'Frontend',
    'Backend',
    'JavaScript',
    'TypeScript',
    'React',
    'Vue',
    'Angular',
    'Node.js',
    'Python',
    'Java',
    'Swift',
    'Kotlin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tag Stories')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControlPanel(),
            const SizedBox(height: 32.0),
            _buildMainExample(),
            const SizedBox(height: 32.0),
            _buildSemanticColorExamples(),
            const SizedBox(height: 32.0),
            _buildSizeExamples(),
            const SizedBox(height: 32.0),
            _buildShapeExamples(),
            const SizedBox(height: 32.0),
            _buildStateExamples(),
            const SizedBox(height: 32.0),
            _buildIconExamples(),
            const SizedBox(height: 32.0),
            _buildInteractiveExamples(),
            const SizedBox(height: 32.0),
            _buildTagCollections(),
            const SizedBox(height: 32.0),
            _buildRealWorldExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildControlPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panel de Control',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildColorSelector(),
                _buildSizeSelector(),
                _buildShapeSelector(),
                _buildTextControls(),
                _buildBooleanControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color Semántico:'),
        DropdownButton<AppTagSemanticColor>(
          value: _selectedColor,
          onChanged: (value) => setState(() => _selectedColor = value!),
          items: AppTagSemanticColor.values.map((color) {
            return DropdownMenuItem(
              value: color,
              child: Text(color.label),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tamaño:'),
        DropdownButton<AppTagSize>(
          value: _selectedSize,
          onChanged: (value) => setState(() => _selectedSize = value!),
          items: AppTagSize.values.map((size) {
            return DropdownMenuItem(
              value: size,
              child: Text(size.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildShapeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Forma:'),
        DropdownButton<AppTagShape>(
          value: _selectedShape,
          onChanged: (value) => setState(() => _selectedShape = value!),
          items: AppTagShape.values.map((shape) {
            return DropdownMenuItem(
              value: shape,
              child: Text(shape.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTextControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            decoration: const InputDecoration(labelText: 'Etiqueta'),
            onChanged: (value) => setState(() => _label = value),
            controller: TextEditingController()..text = _label,
          ),
        ),
      ],
    );
  }

  Widget _buildBooleanControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: const Text('Habilitado'),
          value: _enabled,
          onChanged: (value) => setState(() => _enabled = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Cargando'),
          value: _loading,
          onChanged: (value) => setState(() => _loading = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Esqueleto'),
          value: _skeleton,
          onChanged: (value) => setState(() => _skeleton = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Visible'),
          value: _visible,
          onChanged: (value) => setState(() => _visible = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Seleccionado'),
          value: _selected,
          onChanged: (value) => setState(() => _selected = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Removible'),
          value: _removable,
          onChanged: (value) => setState(() => _removable = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Outlined'),
          value: _outlined,
          onChanged: (value) => setState(() => _outlined = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Icono inicial'),
          value: _hasLeadingIcon,
          onChanged: (value) => setState(() => _hasLeadingIcon = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Icono final'),
          value: _hasTrailingIcon,
          onChanged: (value) => setState(() => _hasTrailingIcon = value!),
          dense: true,
        ),
      ],
    );
  }

  Widget _buildMainExample() {
    return _buildExampleSection(
      'Ejemplo Principal',
      [
        AppTag.semantic(
          label: _label,
          semanticColor: _selectedColor,
          size: _selectedSize,
          shape: _selectedShape,
          enabled: _enabled,
          loading: _loading,
          skeleton: _skeleton,
          visible: _visible,
          selected: _selected,
          removable: _removable,
          outlined: _outlined,
          leadingIcon: _hasLeadingIcon ? _selectedColor.icon : null,
          trailingIcon: _hasTrailingIcon ? Icons.arrow_forward : null,
          onTap: () => _showSnackBar('Tag presionado: $_label'),
          onRemove:
              _removable ? () => _showSnackBar('Tag removido: $_label') : null,
        ),
      ],
    );
  }

  Widget _buildSemanticColorExamples() {
    return _buildExampleSection(
      'Colores Semánticos',
      AppTagSemanticColor.values.map((color) {
        return Column(
          children: [
            AppTag.semantic(
              label: color.label,
              semanticColor: color,
              leadingIcon: color.icon,
              onTap: () => _showSnackBar('Color: ${color.label}'),
            ),
            const SizedBox(height: 8),
            AppTag.semantic(
              label: color.label,
              semanticColor: color,
              outlined: true,
              leadingIcon: color.icon,
              onTap: () => _showSnackBar('Outlined: ${color.label}'),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSizeExamples() {
    return _buildExampleSection(
      'Tamaños',
      AppTagSize.values.map((size) {
        return Column(
          children: [
            AppTag.semantic(
              label: size.name.toUpperCase(),
              size: size,
              semanticColor: AppTagSemanticColor.primary,
              leadingIcon: Icons.star,
            ),
            const SizedBox(height: 4),
            Text(
              size.name,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildShapeExamples() {
    return _buildExampleSection(
      'Formas',
      AppTagShape.values.map((shape) {
        return Column(
          children: [
            AppTag.semantic(
              label: shape.name,
              shape: shape,
              semanticColor: AppTagSemanticColor.secondary,
            ),
            const SizedBox(height: 8),
            Text(
              shape.name,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildStateExamples() {
    return _buildExampleSection(
      'Estados',
      [
        Column(
          children: [
            AppTag.semantic(
              label: 'Normal',
              semanticColor: AppTagSemanticColor.primary,
            ),
            const SizedBox(height: 4),
            const Text('Normal'),
          ],
        ),
        Column(
          children: [
            AppTag.semantic(
              label: 'Seleccionado',
              semanticColor: AppTagSemanticColor.primary,
              selected: true,
            ),
            const SizedBox(height: 4),
            const Text('Seleccionado'),
          ],
        ),
        Column(
          children: [
            AppTag.semantic(
              label: 'Deshabilitado',
              semanticColor: AppTagSemanticColor.primary,
              enabled: false,
            ),
            const SizedBox(height: 4),
            const Text('Deshabilitado'),
          ],
        ),
        Column(
          children: [
            AppTag.semantic(
              label: 'Cargando',
              semanticColor: AppTagSemanticColor.primary,
              loading: true,
            ),
            const SizedBox(height: 4),
            const Text('Cargando'),
          ],
        ),
        Column(
          children: [
            AppTag.semantic(
              label: 'Esqueleto',
              semanticColor: AppTagSemanticColor.primary,
              skeleton: true,
            ),
            const SizedBox(height: 4),
            const Text('Esqueleto'),
          ],
        ),
      ],
    );
  }

  Widget _buildIconExamples() {
    return _buildExampleSection(
      'Con Iconos',
      [
        AppTag.semantic(
          label: 'Solo icono inicial',
          semanticColor: AppTagSemanticColor.info,
          leadingIcon: Icons.info,
        ),
        AppTag.semantic(
          label: 'Solo icono final',
          semanticColor: AppTagSemanticColor.success,
          trailingIcon: Icons.check,
        ),
        AppTag.semantic(
          label: 'Ambos iconos',
          semanticColor: AppTagSemanticColor.warning,
          leadingIcon: Icons.warning,
          trailingIcon: Icons.arrow_forward,
        ),
        AppTag.semantic(
          label: 'Removible',
          semanticColor: AppTagSemanticColor.error,
          removable: true,
          onRemove: () => _showSnackBar('Tag removido'),
        ),
      ],
    );
  }

  Widget _buildInteractiveExamples() {
    return _buildExampleSection(
      'Tags Interactivos',
      [
        AppTag.semantic(
          label: 'Tap',
          semanticColor: AppTagSemanticColor.primary,
          onTap: () => _showSnackBar('Tag con Tap'),
        ),
        AppTag.semantic(
          label: 'Long Press',
          semanticColor: AppTagSemanticColor.secondary,
          onLongPress: () => _showSnackBar('Tag con Long Press'),
        ),
        AppTag.semantic(
          label: 'Hover',
          semanticColor: AppTagSemanticColor.info,
          onHover: () => _showSnackBar('Tag con Hover'),
        ),
        AppTag.semantic(
          label: 'Removible',
          semanticColor: AppTagSemanticColor.error,
          removable: true,
          onRemove: () => _showSnackBar('Tag removido'),
        ),
      ],
    );
  }

  Widget _buildTagCollections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colecciones de Tags',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16.0),
        _buildTagFilterSection(),
        const SizedBox(height: 24.0),
        _buildSkillsSection(),
        const SizedBox(height: 24.0),
        _buildCategoriesSection(),
      ],
    );
  }

  Widget _buildTagFilterSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtros',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                AppTag.semantic(
                  label: 'Todos',
                  semanticColor: AppTagSemanticColor.primary,
                  selected: true,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'Activos',
                  semanticColor: AppTagSemanticColor.success,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'Pendientes',
                  semanticColor: AppTagSemanticColor.warning,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'Completados',
                  semanticColor: AppTagSemanticColor.info,
                  size: AppTagSize.small,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habilidades Técnicas',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _sampleTags.take(10).map((tag) {
                final colors = AppTagSemanticColor.values;
                final colorIndex = tag.hashCode % colors.length;
                return AppTag.semantic(
                  label: tag,
                  semanticColor: colors[colorIndex],
                  size: AppTagSize.small,
                  removable: true,
                  onRemove: () => _showSnackBar('Removido: $tag'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categorías',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                AppTag.semantic(
                  label: 'Frontend',
                  semanticColor: AppTagSemanticColor.primary,
                  leadingIcon: Icons.web,
                  outlined: true,
                ),
                AppTag.semantic(
                  label: 'Backend',
                  semanticColor: AppTagSemanticColor.secondary,
                  leadingIcon: Icons.storage,
                  outlined: true,
                ),
                AppTag.semantic(
                  label: 'Mobile',
                  semanticColor: AppTagSemanticColor.success,
                  leadingIcon: Icons.phone_android,
                  outlined: true,
                ),
                AppTag.semantic(
                  label: 'DevOps',
                  semanticColor: AppTagSemanticColor.warning,
                  leadingIcon: Icons.cloud,
                  outlined: true,
                ),
                AppTag.semantic(
                  label: 'Design',
                  semanticColor: AppTagSemanticColor.info,
                  leadingIcon: Icons.palette,
                  outlined: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRealWorldExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ejemplos del Mundo Real',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16.0),
        _buildProjectCard(),
        const SizedBox(height: 16.0),
        _buildTaskCard(),
        const SizedBox(height: 16.0),
        _buildUserProfileCard(),
      ],
    );
  }

  Widget _buildProjectCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Proyecto: Design System',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                AppTag.semantic(
                  label: 'En progreso',
                  semanticColor: AppTagSemanticColor.warning,
                  size: AppTagSize.small,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Sistema de diseño modular para aplicaciones Flutter',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: [
                AppTag.semantic(
                  label: 'Flutter',
                  semanticColor: AppTagSemanticColor.primary,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'UI/UX',
                  semanticColor: AppTagSemanticColor.info,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'Design Tokens',
                  semanticColor: AppTagSemanticColor.secondary,
                  size: AppTagSize.small,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Implementar componente AppTag',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                AppTag.semantic(
                  label: 'Alta prioridad',
                  semanticColor: AppTagSemanticColor.error,
                  size: AppTagSize.small,
                  leadingIcon: Icons.priority_high,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: [
                AppTag.semantic(
                  label: 'Frontend',
                  semanticColor: AppTagSemanticColor.primary,
                  size: AppTagSize.small,
                  outlined: true,
                ),
                AppTag.semantic(
                  label: '2 días',
                  semanticColor: AppTagSemanticColor.neutral,
                  size: AppTagSize.small,
                  leadingIcon: Icons.schedule,
                ),
                AppTag.semantic(
                  label: 'Juan Pérez',
                  semanticColor: AppTagSemanticColor.info,
                  size: AppTagSize.small,
                  leadingIcon: Icons.person,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfileCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ana García',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Senior Flutter Developer',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                AppTag.semantic(
                  label: 'Disponible',
                  semanticColor: AppTagSemanticColor.success,
                  size: AppTagSize.small,
                  leadingIcon: Icons.check_circle,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Habilidades:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: [
                AppTag.semantic(
                  label: 'Flutter',
                  semanticColor: AppTagSemanticColor.primary,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'Dart',
                  semanticColor: AppTagSemanticColor.primary,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'UI Design',
                  semanticColor: AppTagSemanticColor.info,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: 'State Management',
                  semanticColor: AppTagSemanticColor.secondary,
                  size: AppTagSize.small,
                ),
                AppTag.semantic(
                  label: '+3 más',
                  semanticColor: AppTagSemanticColor.neutral,
                  size: AppTagSize.small,
                  outlined: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSection(String title, List<Widget> tags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16.0),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: tags,
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class TagStoryBasic extends StatelessWidget {
  const TagStoryBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tag - Básico')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tags Básicos',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24.0),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildBasicExample(
                  'Tag Primario',
                  AppTag.semantic(
                    label: 'Primario',
                    semanticColor: AppTagSemanticColor.primary,
                  ),
                ),
                _buildBasicExample(
                  'Tag de Éxito',
                  AppTag.semantic(
                    label: 'Éxito',
                    semanticColor: AppTagSemanticColor.success,
                    leadingIcon: Icons.check,
                  ),
                ),
                _buildBasicExample(
                  'Tag Removible',
                  AppTag.semantic(
                    label: 'Removible',
                    semanticColor: AppTagSemanticColor.error,
                    removable: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicExample(String title, Widget tag) {
    return Column(
      children: [
        tag,
        const SizedBox(height: 8.0),
        Text(title),
      ],
    );
  }
}

class TagStoryPlayground extends StatefulWidget {
  const TagStoryPlayground({super.key});

  @override
  State<TagStoryPlayground> createState() => _TagStoryPlaygroundState();
}

class _TagStoryPlaygroundState extends State<TagStoryPlayground> {
  final List<String> _selectedTags = ['Flutter', 'Dart'];
  final List<String> _availableTags = [
    'Flutter',
    'Dart',
    'Mobile',
    'UI/UX',
    'Design',
    'Development',
    'Frontend',
    'Backend',
    'JavaScript',
    'TypeScript',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag Playground'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectedTagsSection(),
            const SizedBox(height: 24),
            _buildAvailableTagsSection(),
            const SizedBox(height: 24),
            _buildFilterTagsSection(),
            const SizedBox(height: 24),
            _buildStatusTagsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedTagsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tags Seleccionados (${_selectedTags.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            if (_selectedTags.isEmpty)
              const Text('No hay tags seleccionados')
            else
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _selectedTags.map((tag) {
                  return AppTag.semantic(
                    label: tag,
                    semanticColor: AppTagSemanticColor.primary,
                    removable: true,
                    onRemove: () => _removeTag(tag),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableTagsSection() {
    final availableForSelection =
        _availableTags.where((tag) => !_selectedTags.contains(tag)).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tags Disponibles',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            if (availableForSelection.isEmpty)
              const Text('Todos los tags están seleccionados')
            else
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: availableForSelection.map((tag) {
                  return AppTag.semantic(
                    label: tag,
                    semanticColor: AppTagSemanticColor.neutral,
                    outlined: true,
                    onTap: () => _addTag(tag),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTagsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtros de Categoría',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                AppTag.semantic(
                  label: 'Todos',
                  semanticColor: AppTagSemanticColor.primary,
                  selected: true,
                ),
                AppTag.semantic(
                  label: 'Frontend',
                  semanticColor: AppTagSemanticColor.info,
                  leadingIcon: Icons.web,
                ),
                AppTag.semantic(
                  label: 'Backend',
                  semanticColor: AppTagSemanticColor.secondary,
                  leadingIcon: Icons.storage,
                ),
                AppTag.semantic(
                  label: 'Mobile',
                  semanticColor: AppTagSemanticColor.success,
                  leadingIcon: Icons.phone_android,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTagsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estados del Proyecto',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                AppTag.semantic(
                  label: 'Activo',
                  semanticColor: AppTagSemanticColor.success,
                  leadingIcon: Icons.play_arrow,
                ),
                AppTag.semantic(
                  label: 'En pausa',
                  semanticColor: AppTagSemanticColor.warning,
                  leadingIcon: Icons.pause,
                ),
                AppTag.semantic(
                  label: 'Completado',
                  semanticColor: AppTagSemanticColor.info,
                  leadingIcon: Icons.check_circle,
                ),
                AppTag.semantic(
                  label: 'Cancelado',
                  semanticColor: AppTagSemanticColor.error,
                  leadingIcon: Icons.cancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addTag(String tag) {
    setState(() {
      _selectedTags.add(tag);
    });
    _showSnackBar('Agregado: $tag');
  }

  void _removeTag(String tag) {
    setState(() {
      _selectedTags.remove(tag);
    });
    _showSnackBar('Removido: $tag');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
