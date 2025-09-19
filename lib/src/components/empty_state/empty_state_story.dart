import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/empty_state/ds_empty_state.dart';

/// Story interactivo que demuestra el uso del widget DSEmptyState
/// con todas sus variantes, estados y configuraciones
class EmptyStateStory extends StatefulWidget {
  const EmptyStateStory({super.key});

  @override
  State<EmptyStateStory> createState() => _EmptyStateStoryState();
}

class _EmptyStateStoryState extends State<EmptyStateStory> {
  EmptyStateVariant _selectedVariant = EmptyStateVariant.illustration;
  DSEmptyStateState _selectedState = DSEmptyStateState.defaultState;
  String _customTitle = 'No items found';
  String _customDescription =
      'There are no items to display at the moment. Try adding some or adjusting your filters.';
  bool _hasDescription = true;
  bool _hasActions = true;
  bool _enableInteraction = false;
  CrossAxisAlignment _alignment = CrossAxisAlignment.center;
  IconData _selectedIcon = Icons.inbox_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSEmptyState Story'),
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
            _buildRealWorldExamples(),
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
              runSpacing: 16,
              children: [
                _buildVariantSelector(),
                _buildStateSelector(),
                _buildAlignmentSelector(),
                _buildIconSelector(),
                _buildOptionsToggles(),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextInputs(),
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
        SegmentedButton<EmptyStateVariant>(
          segments: const [
            ButtonSegment(
              value: EmptyStateVariant.illustration,
              label: Text('Illustration'),
              icon: Icon(Icons.image_outlined),
            ),
            ButtonSegment(
              value: EmptyStateVariant.cta,
              label: Text('CTA'),
              icon: Icon(Icons.call_to_action),
            ),
          ],
          selected: {_selectedVariant},
          onSelectionChanged: (Set<EmptyStateVariant> selection) {
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
        DropdownButton<DSEmptyStateState>(
          value: _selectedState,
          items: DSEmptyStateState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
          onChanged: (DSEmptyStateState? value) {
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

  Widget _buildAlignmentSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alignment:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButton<CrossAxisAlignment>(
          value: _alignment,
          items: const [
            DropdownMenuItem(
              value: CrossAxisAlignment.center,
              child: Text('Center'),
            ),
            DropdownMenuItem(
              value: CrossAxisAlignment.start,
              child: Text('Start'),
            ),
            DropdownMenuItem(
              value: CrossAxisAlignment.end,
              child: Text('End'),
            ),
          ],
          onChanged: (CrossAxisAlignment? value) {
            if (value != null) {
              setState(() {
                _alignment = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildIconSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Icon:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButton<IconData>(
          value: _selectedIcon,
          items: const [
            DropdownMenuItem(
              value: Icons.inbox_outlined,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.inbox_outlined),
                  SizedBox(width: 8),
                  Text('Inbox')
                ],
              ),
            ),
            DropdownMenuItem(
              value: Icons.search_off,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search_off),
                  SizedBox(width: 8),
                  Text('No Search')
                ],
              ),
            ),
            DropdownMenuItem(
              value: Icons.folder_open,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.folder_open),
                  SizedBox(width: 8),
                  Text('Empty Folder')
                ],
              ),
            ),
            DropdownMenuItem(
              value: Icons.cloud_off,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.cloud_off),
                  SizedBox(width: 8),
                  Text('Offline')
                ],
              ),
            ),
          ],
          onChanged: (IconData? value) {
            if (value != null) {
              setState(() {
                _selectedIcon = value;
              });
            }
          },
        ),
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
          title: const Text('Show Description'),
          value: _hasDescription,
          onChanged: (bool? value) {
            setState(() {
              _hasDescription = value ?? true;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
        ),
        CheckboxListTile(
          title: const Text('Show Actions'),
          value: _hasActions,
          onChanged: (bool? value) {
            setState(() {
              _hasActions = value ?? true;
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

  Widget _buildTextInputs() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Custom Title',
            border: OutlineInputBorder(),
          ),
          controller: TextEditingController(text: _customTitle),
          onChanged: (value) {
            setState(() {
              _customTitle = value.isNotEmpty ? value : 'No items found';
            });
          },
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Custom Description',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
          controller: TextEditingController(text: _customDescription),
          onChanged: (value) {
            setState(() {
              _customDescription =
                  value.isNotEmpty ? value : 'Default description';
            });
          },
        ),
      ],
    );
  }

  Widget _buildInteractiveExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text(
              'Ejemplo Interactivo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            Center(
              child: DSEmptyState(
                variant: _selectedVariant,
                title: _customTitle,
                description: _hasDescription ? _customDescription : null,
                state: _selectedState,
                defaultIcon: _selectedIcon,
                alignment: _alignment,
                actions: _hasActions
                    ? [
                        const EmptyStateAction(
                          text: 'Add Item',
                          isPrimary: true,
                          icon: Icons.add,
                        ),
                        const EmptyStateAction(
                          text: 'Learn More',
                          icon: Icons.help_outline,
                        ),
                      ]
                    : [],
                onTap: _enableInteraction
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Empty state tapped!')),
                        );
                      }
                    : null,
                onHover: _enableInteraction
                    ? () {
                        debugPrint('Empty state hovered');
                      }
                    : null,
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
              'Illustration Variant',
              'Enfoque en la ilustración visual para contexto',
              DSEmptyState.illustration(
                title: 'No files found',
                description:
                    'Upload some files to get started with your project.',
                defaultIcon: Icons.folder_open,
                actions: const [
                  EmptyStateAction(
                    text: 'Upload Files',
                    isPrimary: true,
                    icon: Icons.upload_file,
                  ),
                  EmptyStateAction(
                    text: 'Browse Examples',
                    icon: Icons.explore,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildVariantExample(
              'CTA Variant',
              'Enfocado en acciones rápidas del usuario',
              DSEmptyState.cta(
                title: 'Start your first project',
                description: 'Create a new project to begin working.',
                defaultIcon: Icons.add_circle_outline,
                actions: const [
                  EmptyStateAction(
                    text: 'Create Project',
                    isPrimary: true,
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantExample(
      String title, String description, Widget emptyState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(description, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: emptyState),
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
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: DSEmptyStateState.values.map((state) {
                return _buildStateExample(state);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExample(DSEmptyStateState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: DSEmptyState.cta(
              title: 'State Demo',
              description: 'Example state',
              state: state,
              maxWidth: 200,
              actions: const [
                EmptyStateAction(text: 'Action', isPrimary: true),
              ],
            ),
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
              'Desktop Style',
              'Optimizado para pantallas grandes e interacción con mouse',
              DSEmptyState.illustration(
                title: 'Welcome to the Dashboard',
                description:
                    'This is your main workspace. Get started by creating your first project or exploring the available templates.',
                defaultIcon: Icons.dashboard_outlined,
                maxWidth: 500,
                actions: const [
                  EmptyStateAction(
                    text: 'Create Project',
                    isPrimary: true,
                    icon: Icons.add_circle_outline,
                  ),
                  EmptyStateAction(
                    text: 'Browse Templates',
                    icon: Icons.explore,
                  ),
                  EmptyStateAction(
                    text: 'Import Existing',
                    icon: Icons.file_upload,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildPlatformExample(
              'Mobile Style',
              'Compacto y optimizado para interacción táctil',
              DSEmptyState.cta(
                title: 'No messages yet',
                description: 'Start a conversation with someone new.',
                defaultIcon: Icons.message_outlined,
                maxWidth: 280,
                actions: const [
                  EmptyStateAction(
                    text: 'New Message',
                    isPrimary: true,
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildPlatformExample(
              'RTL Support',
              'Soporte completo para right-to-left',
              Directionality(
                textDirection: TextDirection.rtl,
                child: DSEmptyState.illustration(
                  title: 'لا توجد عناصر',
                  description:
                      'قم بإضافة بعض العناصر للبدء في استخدام التطبيق.',
                  defaultIcon: Icons.inventory_2_outlined,
                  rtlSupport: true,
                  actions: const [
                    EmptyStateAction(
                      text: 'إضافة عنصر',
                      isPrimary: true,
                      icon: Icons.add,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformExample(
      String title, String description, Widget emptyState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(description, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: emptyState),
        ),
      ],
    );
  }

  Widget _buildRealWorldExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos del Mundo Real',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildRealWorldExample(
              'E-commerce: Carrito Vacío',
              DSEmptyState.illustration(
                title: 'Your cart is empty',
                description:
                    'Looks like you haven\'t added anything to your cart yet. Start shopping to fill it up!',
                defaultIcon: Icons.shopping_cart_outlined,
                actions: const [
                  EmptyStateAction(
                    text: 'Start Shopping',
                    isPrimary: true,
                    icon: Icons.storefront,
                  ),
                  EmptyStateAction(
                    text: 'View Wishlist',
                    icon: Icons.favorite_outline,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildRealWorldExample(
              'Social: Sin Notificaciones',
              DSEmptyState.cta(
                title: 'You\'re all caught up!',
                description: 'No new notifications right now.',
                defaultIcon: Icons.notifications_none,
                actions: const [
                  EmptyStateAction(
                    text: 'Explore',
                    isPrimary: true,
                    icon: Icons.explore,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildRealWorldExample(
              'Productividad: Sin Tareas',
              DSEmptyState.illustration(
                title: 'No tasks for today',
                description:
                    'You\'ve completed all your tasks! Take a break or plan ahead for tomorrow.',
                defaultIcon: Icons.task_alt,
                actions: const [
                  EmptyStateAction(
                    text: 'Add Task',
                    isPrimary: true,
                    icon: Icons.add_task,
                  ),
                  EmptyStateAction(
                    text: 'Plan Tomorrow',
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildRealWorldExample(
              'Error: Sin Conexión',
              DSEmptyState.cta(
                title: 'No internet connection',
                description: 'Please check your connection and try again.',
                defaultIcon: Icons.wifi_off,
                state: DSEmptyStateState.disabled,
                actions: const [
                  EmptyStateAction(
                    text: 'Retry',
                    isPrimary: true,
                    icon: Icons.refresh,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRealWorldExample(String title, Widget emptyState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: emptyState),
        ),
      ],
    );
  }
}
