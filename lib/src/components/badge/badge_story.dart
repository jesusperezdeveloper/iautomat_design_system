import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class BadgeStoryExample extends StatefulWidget {
  const BadgeStoryExample({super.key});

  @override
  State<BadgeStoryExample> createState() => _BadgeStoryExampleState();
}

class _BadgeStoryExampleState extends State<BadgeStoryExample> {
  AppBadgeVariant _selectedVariant = AppBadgeVariant.dot;
  AppBadgeSize _selectedSize = AppBadgeSize.medium;
  AppBadgePosition _selectedPosition = AppBadgePosition.topRight;
  AppBadgeShape _selectedShape = AppBadgeShape.circle;
  AppBadgeStatus? _selectedStatus = AppBadgeStatus.success;
  bool _hasChild = true;
  bool _enabled = true;
  bool _loading = false;
  bool _skeleton = false;
  bool _visible = true;
  bool _showZero = false;
  int _value = 5;
  int _maxValue = 99;
  String _label = 'Nuevo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Stories')),
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
            _buildPositionExamples(),
            const SizedBox(height: 32.0),
            _buildStatusExamples(),
            const SizedBox(height: 32.0),
            _buildStateExamples(),
            const SizedBox(height: 32.0),
            _buildAnimationExamples(),
            const SizedBox(height: 32.0),
            _buildInteractiveExamples(),
            const SizedBox(height: 32.0),
            _buildStandaloneExamples(),
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
                _buildPositionSelector(),
                _buildShapeSelector(),
                _buildStatusSelector(),
                _buildValueControls(),
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
        DropdownButton<AppBadgeVariant>(
          value: _selectedVariant,
          onChanged: (value) => setState(() => _selectedVariant = value!),
          items: AppBadgeVariant.values.map((variant) {
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
        DropdownButton<AppBadgeSize>(
          value: _selectedSize,
          onChanged: (value) => setState(() => _selectedSize = value!),
          items: AppBadgeSize.values.map((size) {
            return DropdownMenuItem(
              value: size,
              child: Text(size.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPositionSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Posición:'),
        DropdownButton<AppBadgePosition>(
          value: _selectedPosition,
          onChanged: (value) => setState(() => _selectedPosition = value!),
          items: AppBadgePosition.values.map((position) {
            return DropdownMenuItem(
              value: position,
              child: Text(position.name),
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
        DropdownButton<AppBadgeShape>(
          value: _selectedShape,
          onChanged: (value) => setState(() => _selectedShape = value!),
          items: AppBadgeShape.values.map((shape) {
            return DropdownMenuItem(
              value: shape,
              child: Text(shape.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStatusSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estado:'),
        DropdownButton<AppBadgeStatus?>(
          value: _selectedStatus,
          onChanged: (value) => setState(() => _selectedStatus = value),
          items: [
            const DropdownMenuItem<AppBadgeStatus?>(
              value: null,
              child: Text('Ninguno'),
            ),
            ...AppBadgeStatus.values.map((status) {
              return DropdownMenuItem(
                value: status,
                child: Text(status.label),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildValueControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Valor: $_value'),
        SizedBox(
          width: 200,
          child: Slider(
            value: _value.toDouble(),
            min: 0,
            max: 150,
            divisions: 150,
            onChanged: (value) => setState(() => _value = value.round()),
          ),
        ),
        Text('Max: $_maxValue'),
        SizedBox(
          width: 200,
          child: Slider(
            value: _maxValue.toDouble(),
            min: 1,
            max: 999,
            divisions: 998,
            onChanged: (value) => setState(() => _maxValue = value.round()),
          ),
        ),
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
          title: const Text('Con hijo'),
          value: _hasChild,
          onChanged: (value) => setState(() => _hasChild = value!),
          dense: true,
        ),
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
          title: const Text('Mostrar cero'),
          value: _showZero,
          onChanged: (value) => setState(() => _showZero = value!),
          dense: true,
        ),
      ],
    );
  }

  Widget _buildMainExample() {
    return _buildExampleSection(
      'Ejemplo Principal',
      [
        AppBadge.counter(
          value: _value,
          size: _selectedSize,
          position: _selectedPosition,
          shape: _selectedShape,
          enabled: _enabled,
          loading: _loading,
          skeleton: _skeleton,
          visible: _visible,
          showZero: _showZero,
          maxValue: _maxValue,
          child: _hasChild ? _buildExampleChild() : null,
          onTap: () => _showSnackBar('Badge presionado'),
        ),
      ],
    );
  }

  Widget _buildVariantExamples() {
    return _buildExampleSection(
      'Variantes de Badge',
      [
        AppBadge.dot(
          child: _buildExampleChild(),
        ),
        AppBadge.counter(
          value: 42,
          child: _buildExampleChild(),
        ),
        AppBadge.status(
          status: AppBadgeStatus.success,
          label: 'Activo',
          child: _buildExampleChild(),
        ),
      ],
    );
  }

  Widget _buildSizeExamples() {
    return _buildExampleSection(
      'Tamaños',
      [
        AppBadge.counter(
          value: 5,
          size: AppBadgeSize.small,
          child: _buildExampleChild(),
        ),
        AppBadge.counter(
          value: 15,
          size: AppBadgeSize.medium,
          child: _buildExampleChild(),
        ),
        AppBadge.counter(
          value: 25,
          size: AppBadgeSize.large,
          child: _buildExampleChild(),
        ),
      ],
    );
  }

  Widget _buildPositionExamples() {
    return _buildExampleSection(
      'Posiciones',
      AppBadgePosition.values.map((position) {
        return AppBadge.counter(
          value: 9,
          position: position,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                position.name,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStatusExamples() {
    return _buildExampleSection(
      'Estados de Status',
      AppBadgeStatus.values.map((status) {
        return AppBadge.status(
          status: status,
          label: status.label,
          child: _buildExampleChild(),
        );
      }).toList(),
    );
  }

  Widget _buildStateExamples() {
    return _buildExampleSection(
      'Estados del Badge',
      [
        AppBadge.counter(
          value: 1,
          enabled: true,
          child: _buildExampleChild('Normal'),
        ),
        AppBadge.counter(
          value: 2,
          enabled: false,
          child: _buildExampleChild('Deshabilitado'),
        ),
        AppBadge.counter(
          value: 3,
          loading: true,
          child: _buildExampleChild('Cargando'),
        ),
        AppBadge.counter(
          value: 4,
          skeleton: true,
          child: _buildExampleChild('Esqueleto'),
        ),
      ],
    );
  }

  Widget _buildAnimationExamples() {
    return _buildExampleSection(
      'Animaciones',
      [
        AppBadge.dot(
          animation: const AppBadgeAnimation(
            enabled: true,
            pulse: true,
            type: AppBadgeAnimationType.pulse,
          ),
          child: _buildExampleChild('Pulse'),
        ),
        AppBadge.counter(
          value: 3,
          animation: const AppBadgeAnimation(
            enabled: true,
            type: AppBadgeAnimationType.scale,
          ),
          child: _buildExampleChild('Scale'),
        ),
        AppBadge.counter(
          value: 7,
          animation: const AppBadgeAnimation(
            enabled: true,
            type: AppBadgeAnimationType.bounce,
          ),
          child: _buildExampleChild('Bounce'),
        ),
      ],
    );
  }

  Widget _buildInteractiveExamples() {
    return _buildExampleSection(
      'Badges Interactivos',
      [
        AppBadge.counter(
          value: 1,
          onTap: () => _showSnackBar('Badge con Tap'),
          child: _buildExampleChild('Tap'),
        ),
        AppBadge.status(
          status: AppBadgeStatus.warning,
          label: 'Hover',
          onHover: () => _showSnackBar('Badge con Hover'),
          child: _buildExampleChild('Hover'),
        ),
        AppBadge.counter(
          value: 99,
          onLongPress: () => _showSnackBar('Badge con Long Press'),
          child: _buildExampleChild('Long Press'),
        ),
      ],
    );
  }

  Widget _buildStandaloneExamples() {
    return _buildExampleSection(
      'Badges Independientes',
      [
        AppBadge.dot(),
        AppBadge.counter(value: 42),
        AppBadge.counter(value: 150, maxValue: 99),
        AppBadge.status(
          status: AppBadgeStatus.error,
          label: 'Error',
        ),
        AppBadge.status(
          status: AppBadgeStatus.info,
          label: 'Info con texto largo',
        ),
      ],
    );
  }

  Widget _buildExampleSection(String title, List<Widget> badges) {
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
          children: badges,
        ),
      ],
    );
  }

  Widget _buildExampleChild([String? label]) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.onSurface,
              size: 20,
            ),
            if (label != null) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
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

class BadgeStoryBasic extends StatelessWidget {
  const BadgeStoryBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge - Básico')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Badges Básicos',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24.0),
            Wrap(
              spacing: 32.0,
              runSpacing: 32.0,
              children: [
                _buildBasicExample(
                  'Dot Badge',
                  AppBadge.dot(
                    child: const Icon(Icons.mail, size: 32),
                  ),
                ),
                _buildBasicExample(
                  'Counter Badge',
                  AppBadge.counter(
                    value: 5,
                    child: const Icon(Icons.notifications, size: 32),
                  ),
                ),
                _buildBasicExample(
                  'Status Badge',
                  AppBadge.status(
                    status: AppBadgeStatus.success,
                    label: 'Activo',
                    child: const Icon(Icons.person, size: 32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicExample(String title, Widget badge) {
    return Column(
      children: [
        badge,
        const SizedBox(height: 8.0),
        Text(title),
      ],
    );
  }
}

class BadgeStoryPlayground extends StatefulWidget {
  const BadgeStoryPlayground({super.key});

  @override
  State<BadgeStoryPlayground> createState() => _BadgeStoryPlaygroundState();
}

class _BadgeStoryPlaygroundState extends State<BadgeStoryPlayground> {
  int _notificationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Playground'),
        actions: [
          AppBadge.counter(
            value: _notificationCount,
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: _handleNotificationTap,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: AppBadge.dot(
                  child: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                title: const Text('Usuario en línea'),
                subtitle: const Text('Activo hace 2 minutos'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: AppBadge.status(
                  status: AppBadgeStatus.warning,
                  label: 'Pendiente',
                  child: const Icon(Icons.task),
                ),
                title: const Text('Tarea pendiente'),
                subtitle: const Text('Revisión requerida'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: AppBadge.counter(
                  value: 99,
                  maxValue: 50,
                  child: const Icon(Icons.message),
                ),
                title: const Text('Mensajes'),
                subtitle: const Text('Muchos mensajes sin leer'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AppBadge.counter(
        value: _notificationCount > 0 ? _notificationCount : null,
        child: FloatingActionButton(
          onPressed: _addNotification,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _handleNotificationTap() {
    setState(() {
      _notificationCount = 0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notificaciones marcadas como leídas'),
      ),
    );
  }

  void _addNotification() {
    setState(() {
      _notificationCount++;
    });
  }
}