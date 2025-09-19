import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AvatarStoryExample extends StatefulWidget {
  const AvatarStoryExample({super.key});

  @override
  State<AvatarStoryExample> createState() => _AvatarStoryExampleState();
}

class _AvatarStoryExampleState extends State<AvatarStoryExample> {
  DSAvatarVariant _selectedVariant = DSAvatarVariant.image;
  DSAvatarSize _selectedSize = DSAvatarSize.medium;
  DSAvatarShape _selectedShape = DSAvatarShape.circle;
  DSAvatarPresence? _selectedPresence = DSAvatarPresence.online;
  bool _enabled = true;
  bool _loading = false;
  bool _skeleton = false;
  bool _visible = true;
  bool _showPresence = true;
  bool _showBorder = false;
  String _imageUrl = 'https://api.dicebear.com/7.x/avataaars/png?seed=Felix';
  String _initials = 'JD';
  int _maxGroupCount = 3;

  final List<String> _sampleImageUrls = [
    'https://api.dicebear.com/7.x/avataaars/png?seed=Felix',
    'https://api.dicebear.com/7.x/avataaars/png?seed=Aneka',
    'https://api.dicebear.com/7.x/avataaars/png?seed=John',
    'https://api.dicebear.com/7.x/avataaars/png?seed=Sarah',
    'https://api.dicebear.com/7.x/avataaars/png?seed=Mike',
  ];

  final List<String> _sampleInitials = ['JD', 'AM', 'RS', 'LK', 'MH', 'SP'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Stories')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControlPanel(),
            const SizedBox(height: 32.0),
            _buildMainExample(),
            const SizedBox(height: 32.0),
            _buildVariantExamples(),
            const SizedBox(height: 32.0),
            _buildSizeExamples(),
            const SizedBox(height: 32.0),
            _buildShapeExamples(),
            const SizedBox(height: 32.0),
            _buildPresenceExamples(),
            const SizedBox(height: 32.0),
            _buildStateExamples(),
            const SizedBox(height: 32.0),
            _buildGroupExamples(),
            const SizedBox(height: 32.0),
            _buildInteractiveExamples(),
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
                _buildVariantSelector(),
                _buildSizeSelector(),
                _buildShapeSelector(),
                _buildPresenceSelector(),
                _buildTextControls(),
                _buildBooleanControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Variante:'),
        DropdownButton<DSAvatarVariant>(
          value: _selectedVariant,
          onChanged: (value) => setState(() => _selectedVariant = value!),
          items: DSAvatarVariant.values.map((variant) {
            return DropdownMenuItem(
              value: variant,
              child: Text(variant.name),
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
        DropdownButton<DSAvatarSize>(
          value: _selectedSize,
          onChanged: (value) => setState(() => _selectedSize = value!),
          items: DSAvatarSize.values.map((size) {
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
        DropdownButton<DSAvatarShape>(
          value: _selectedShape,
          onChanged: (value) => setState(() => _selectedShape = value!),
          items: DSAvatarShape.values.map((shape) {
            return DropdownMenuItem(
              value: shape,
              child: Text(shape.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPresenceSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Presencia:'),
        DropdownButton<DSAvatarPresence?>(
          value: _selectedPresence,
          onChanged: (value) => setState(() => _selectedPresence = value),
          items: [
            const DropdownMenuItem<DSAvatarPresence?>(
              value: null,
              child: Text('Ninguna'),
            ),
            ...DSAvatarPresence.values.map((presence) {
              return DropdownMenuItem(
                value: presence,
                child: Text(presence.label),
              );
            }),
          ],
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
            decoration: const InputDecoration(labelText: 'URL de imagen'),
            onChanged: (value) => setState(() => _imageUrl = value),
            controller: TextEditingController()..text = _imageUrl,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: TextField(
            decoration: const InputDecoration(labelText: 'Iniciales'),
            onChanged: (value) => setState(() => _initials = value),
            controller: TextEditingController()..text = _initials,
          ),
        ),
        const SizedBox(height: 8),
        Text('Max Grupo: $_maxGroupCount'),
        SizedBox(
          width: 200,
          child: Slider(
            value: _maxGroupCount.toDouble(),
            min: 1,
            max: 5,
            divisions: 4,
            onChanged: (value) =>
                setState(() => _maxGroupCount = value.round()),
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
          title: const Text('Mostrar presencia'),
          value: _showPresence,
          onChanged: (value) => setState(() => _showPresence = value!),
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Mostrar borde'),
          value: _showBorder,
          onChanged: (value) => setState(() => _showBorder = value!),
          dense: true,
        ),
      ],
    );
  }

  Widget _buildMainExample() {
    return _buildExampleSection(
      'Ejemplo Principal',
      [
        _buildConfiguredAvatar(),
      ],
    );
  }

  Widget _buildConfiguredAvatar() {
    switch (_selectedVariant) {
      case DSAvatarVariant.image:
        return DSAvatar.image(
          imageUrl: _imageUrl,
          size: _selectedSize,
          shape: _selectedShape,
          presence: _selectedPresence,
          enabled: _enabled,
          loading: _loading,
          skeleton: _skeleton,
          visible: _visible,
          showPresence: _showPresence,
          showBorder: _showBorder,
          onTap: () => _showSnackBar('Avatar presionado'),
        );
      case DSAvatarVariant.initials:
        return DSAvatar.initials(
          initials: _initials,
          size: _selectedSize,
          shape: _selectedShape,
          presence: _selectedPresence,
          enabled: _enabled,
          loading: _loading,
          skeleton: _skeleton,
          visible: _visible,
          showPresence: _showPresence,
          showBorder: _showBorder,
          onTap: () => _showSnackBar('Avatar presionado'),
        );
      case DSAvatarVariant.group:
        return DSAvatar.group(
          groupImageUrls: _sampleImageUrls,
          size: _selectedSize,
          shape: _selectedShape,
          enabled: _enabled,
          loading: _loading,
          skeleton: _skeleton,
          visible: _visible,
          showBorder: _showBorder,
          maxGroupCount: _maxGroupCount,
          onTap: () => _showSnackBar('Grupo presionado'),
        );
    }
  }

  Widget _buildVariantExamples() {
    return _buildExampleSection(
      'Variantes de Avatar',
      [
        DSAvatar.image(
          imageUrl: _sampleImageUrls[0],
          onTap: () => _showSnackBar('Avatar con imagen'),
        ),
        DSAvatar.initials(
          initials: 'AB',
          onTap: () => _showSnackBar('Avatar con iniciales'),
        ),
        DSAvatar.group(
          groupImageUrls: _sampleImageUrls.take(3).toList(),
          onTap: () => _showSnackBar('Avatar de grupo'),
        ),
      ],
    );
  }

  Widget _buildSizeExamples() {
    return _buildExampleSection(
      'Tamaños',
      DSAvatarSize.values.map((size) {
        return Column(
          children: [
            DSAvatar.initials(
              initials: 'AB',
              size: size,
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
      DSAvatarShape.values.map((shape) {
        return Column(
          children: [
            DSAvatar.image(
              imageUrl: _sampleImageUrls[0],
              shape: shape,
              size: DSAvatarSize.large,
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

  Widget _buildPresenceExamples() {
    return _buildExampleSection(
      'Estados de Presencia',
      DSAvatarPresence.values.map((presence) {
        return Column(
          children: [
            DSAvatar.image(
              imageUrl: _sampleImageUrls[0],
              presence: presence,
              showPresence: true,
            ),
            const SizedBox(height: 8),
            Text(
              presence.label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildStateExamples() {
    return _buildExampleSection(
      'Estados del Avatar',
      [
        Column(
          children: [
            DSAvatar.initials(
              initials: 'AB',
              enabled: true,
            ),
            const SizedBox(height: 8),
            const Text('Normal'),
          ],
        ),
        Column(
          children: [
            DSAvatar.initials(
              initials: 'CD',
              enabled: false,
            ),
            const SizedBox(height: 8),
            const Text('Deshabilitado'),
          ],
        ),
        Column(
          children: [
            DSAvatar.initials(
              initials: 'EF',
              loading: true,
            ),
            const SizedBox(height: 8),
            const Text('Cargando'),
          ],
        ),
        Column(
          children: [
            DSAvatar.initials(
              initials: 'GH',
              skeleton: true,
            ),
            const SizedBox(height: 8),
            const Text('Esqueleto'),
          ],
        ),
      ],
    );
  }

  Widget _buildGroupExamples() {
    return _buildExampleSection(
      'Avatares de Grupo',
      [
        Column(
          children: [
            DSAvatar.group(
              groupImageUrls: _sampleImageUrls.take(2).toList(),
              maxGroupCount: 2,
            ),
            const SizedBox(height: 8),
            const Text('2 imágenes'),
          ],
        ),
        Column(
          children: [
            DSAvatar.group(
              groupImageUrls: _sampleImageUrls.take(3).toList(),
              maxGroupCount: 3,
            ),
            const SizedBox(height: 8),
            const Text('3 imágenes'),
          ],
        ),
        Column(
          children: [
            DSAvatar.group(
              groupImageUrls: _sampleImageUrls,
              maxGroupCount: 3,
            ),
            const SizedBox(height: 8),
            const Text('5 → 3 + contador'),
          ],
        ),
        Column(
          children: [
            DSAvatar.group(
              groupInitials: _sampleInitials.take(3).toList(),
              maxGroupCount: 3,
            ),
            const SizedBox(height: 8),
            const Text('Iniciales'),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveExamples() {
    return _buildExampleSection(
      'Avatares Interactivos',
      [
        DSAvatar.image(
          imageUrl: _sampleImageUrls[0],
          onTap: () => _showSnackBar('Avatar con Tap'),
        ),
        DSAvatar.initials(
          initials: 'LG',
          onLongPress: () => _showSnackBar('Avatar con Long Press'),
        ),
        DSAvatar.group(
          groupImageUrls: _sampleImageUrls.take(2).toList(),
          onHover: () => _showSnackBar('Avatar con Hover'),
        ),
      ],
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
        _buildUserProfileCard(),
        const SizedBox(height: 16.0),
        _buildChatUsersList(),
        const SizedBox(height: 16.0),
        _buildTeamMembersGrid(),
      ],
    );
  }

  Widget _buildUserProfileCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            DSAvatar.image(
              imageUrl: _sampleImageUrls[0],
              size: DSAvatarSize.large,
              presence: DSAvatarPresence.online,
              showPresence: true,
              onTap: () => _showSnackBar('Perfil de usuario'),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Juan Pérez',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Desarrollador Senior',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'En línea',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatUsersList() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Usuarios en Chat',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ...List.generate(3, (index) {
            final presenceStates = [
              DSAvatarPresence.online,
              DSAvatarPresence.away,
              DSAvatarPresence.busy,
            ];
            final names = ['Ana García', 'Carlos López', 'María Rodríguez'];

            return ListTile(
              leading: DSAvatar.image(
                imageUrl: _sampleImageUrls[index + 1],
                presence: presenceStates[index],
                showPresence: true,
              ),
              title: Text(names[index]),
              subtitle: Text(presenceStates[index].label),
              onTap: () => _showSnackBar('Chat con ${names[index]}'),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTeamMembersGrid() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Equipo de Desarrollo',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                DSAvatar.group(
                  groupImageUrls: _sampleImageUrls,
                  maxGroupCount: 4,
                  onTap: () => _showSnackBar('Ver todo el equipo'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    DSAvatar.initials(
                      initials: _sampleInitials[index % _sampleInitials.length],
                      size: DSAvatarSize.medium,
                      onTap: () => _showSnackBar('Miembro ${index + 1}'),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Usuario ${index + 1}',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
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

  Widget _buildExampleSection(String title, List<Widget> avatars) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16.0),
        Wrap(
          spacing: 24.0,
          runSpacing: 24.0,
          children: avatars,
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

class AvatarStoryBasic extends StatelessWidget {
  const AvatarStoryBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar - Básico')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Avatares Básicos',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24.0),
            Wrap(
              spacing: 32.0,
              runSpacing: 32.0,
              children: [
                _buildBasicExample(
                  'Avatar con Imagen',
                  DSAvatar.image(
                    imageUrl:
                        'https://api.dicebear.com/7.x/avataaars/png?seed=Felix',
                  ),
                ),
                _buildBasicExample(
                  'Avatar con Iniciales',
                  DSAvatar.initials(
                    initials: 'JD',
                  ),
                ),
                _buildBasicExample(
                  'Avatar de Grupo',
                  DSAvatar.group(
                    groupImageUrls: [
                      'https://api.dicebear.com/7.x/avataaars/png?seed=Felix',
                      'https://api.dicebear.com/7.x/avataaars/png?seed=Aneka',
                      'https://api.dicebear.com/7.x/avataaars/png?seed=John',
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicExample(String title, Widget avatar) {
    return Column(
      children: [
        avatar,
        const SizedBox(height: 8.0),
        Text(title),
      ],
    );
  }
}

class AvatarStoryPlayground extends StatefulWidget {
  const AvatarStoryPlayground({super.key});

  @override
  State<AvatarStoryPlayground> createState() => _AvatarStoryPlaygroundState();
}

class _AvatarStoryPlaygroundState extends State<AvatarStoryPlayground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Playground'),
        actions: [
          DSAvatar.initials(
            initials: 'JP',
            size: DSAvatarSize.small,
            presence: DSAvatarPresence.online,
            showPresence: true,
            onTap: () => _showProfileDialog(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildMessagesCard(),
            const SizedBox(height: 16),
            _buildTeamCard(),
            const SizedBox(height: 16),
            _buildCollaboratorsCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNotification,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMessagesCard() {
    return Card(
      child: ListTile(
        leading: DSAvatar.image(
          imageUrl: 'https://api.dicebear.com/7.x/avataaars/png?seed=Sarah',
          presence: DSAvatarPresence.online,
          showPresence: true,
        ),
        title: const Text('Sarah Connor'),
        subtitle: const Text('Te envió un mensaje'),
        trailing: Text('Ahora'),
        onTap: () => _showSnackBar('Abrir conversación con Sarah'),
      ),
    );
  }

  Widget _buildTeamCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Equipo de Proyecto',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DSAvatar.group(
                  groupImageUrls: [
                    'https://api.dicebear.com/7.x/avataaars/png?seed=Felix',
                    'https://api.dicebear.com/7.x/avataaars/png?seed=Aneka',
                    'https://api.dicebear.com/7.x/avataaars/png?seed=John',
                    'https://api.dicebear.com/7.x/avataaars/png?seed=Sarah',
                    'https://api.dicebear.com/7.x/avataaars/png?seed=Mike',
                  ],
                  maxGroupCount: 3,
                  size: DSAvatarSize.small,
                  onTap: () => _showSnackBar('Ver todos los miembros'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('5 miembros activos'),
          ],
        ),
      ),
    );
  }

  Widget _buildCollaboratorsCard() {
    final collaborators = [
      {
        'name': 'Alex Johnson',
        'initials': 'AJ',
        'presence': DSAvatarPresence.away,
      },
      {
        'name': 'Lisa Kim',
        'initials': 'LK',
        'presence': DSAvatarPresence.busy,
      },
      {
        'name': 'Mike Rodriguez',
        'initials': 'MR',
        'presence': DSAvatarPresence.online,
      },
    ];

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Colaboradores',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...collaborators.map((collaborator) {
            return ListTile(
              leading: DSAvatar.initials(
                initials: collaborator['initials'] as String,
                presence: collaborator['presence'] as DSAvatarPresence,
                showPresence: true,
                size: DSAvatarSize.small,
              ),
              title: Text(collaborator['name'] as String),
              subtitle:
                  Text((collaborator['presence'] as DSAvatarPresence).label),
              onTap: () => _showSnackBar('Contactar a ${collaborator['name']}'),
            );
          }),
        ],
      ),
    );
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DSAvatar.image(
              imageUrl: 'https://api.dicebear.com/7.x/avataaars/png?seed=Felix',
              size: DSAvatarSize.xlarge,
              presence: DSAvatarPresence.online,
              showPresence: true,
            ),
            const SizedBox(height: 16),
            const Text(
              'Juan Pérez',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Desarrollador Senior'),
            const SizedBox(height: 8),
            Text(
              'En línea',
              style: TextStyle(color: Colors.green[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _addNotification() {
    _showSnackBar('Nueva notificación agregada');
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
