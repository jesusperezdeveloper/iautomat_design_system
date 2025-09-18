import 'package:flutter/material.dart';
import 'app_bottom_sheet.dart';

/// Story para demostrar las diferentes variantes y configuraciones del AppBottomSheet
class BottomSheetStory extends StatefulWidget {
  const BottomSheetStory({super.key});

  @override
  State<BottomSheetStory> createState() => _BottomSheetStoryState();
}

class _BottomSheetStoryState extends State<BottomSheetStory> {
  BottomSheetVariant _selectedVariant = BottomSheetVariant.half;
  AppBottomSheetState _selectedState = AppBottomSheetState.defaultState;
  BottomSheetSnap _selectedSnap = BottomSheetSnap.half;
  bool _draggable = true;
  bool _rtlSupport = true;
  bool _accessibilitySupport = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBottomSheet Story'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Row(
        children: [
          // Panel de configuración
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  right: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Configuración',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    _buildVariantSelector(),
                    const SizedBox(height: 24),
                    _buildStateSelector(),
                    const SizedBox(height: 24),
                    _buildSnapSelector(),
                    const SizedBox(height: 24),
                    _buildOptionsSection(),
                    const SizedBox(height: 24),
                    _buildShowBottomSheetButton(),
                  ],
                ),
              ),
            ),
          ),
          // Panel de ejemplos
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ejemplos de AppBottomSheet',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 32),
                    _buildExamplesGrid(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVariantSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Variante',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Column(
          children: BottomSheetVariant.values.map((variant) {
            return InkWell(
              onTap: () {
                setState(() {
                  _selectedVariant = variant;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(
                      _selectedVariant == variant
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: _selectedVariant == variant
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getVariantName(variant),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            _getVariantDescription(variant),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estado',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<AppBottomSheetState>(
          initialValue: _selectedState,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Estado del bottom sheet',
          ),
          items: AppBottomSheetState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(_getStateName(state)),
            );
          }).toList(),
          onChanged: (value) {
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

  Widget _buildSnapSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Punto de Anclaje Inicial',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<BottomSheetSnap>(
          initialValue: _selectedSnap,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Posición inicial',
          ),
          items: BottomSheetSnap.values.map((snap) {
            return DropdownMenuItem(
              value: snap,
              child: Text(_getSnapName(snap)),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedSnap = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildOptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Opciones',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Draggable'),
          subtitle: const Text('Permite arrastrar el bottom sheet'),
          value: _draggable,
          onChanged: (value) {
            setState(() {
              _draggable = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Soporte RTL'),
          value: _rtlSupport,
          onChanged: (value) {
            setState(() {
              _rtlSupport = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Soporte Accesibilidad'),
          value: _accessibilitySupport,
          onChanged: (value) {
            setState(() {
              _accessibilitySupport = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildShowBottomSheetButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () => _showConfiguredBottomSheet(),
        child: const Text('Mostrar Bottom Sheet Configurado'),
      ),
    );
  }

  Widget _buildExamplesGrid() {
    return Column(
      children: [
        _buildExampleSection('Variantes Básicas', [
          _buildExampleCard(
            'Modal Bottom Sheet',
            'Bottom sheet modal con overlay',
            () => _showExampleBottomSheet(BottomSheetVariant.modal),
          ),
          _buildExampleCard(
            'Half Bottom Sheet',
            'Bottom sheet de media altura',
            () => _showExampleBottomSheet(BottomSheetVariant.half),
          ),
          _buildExampleCard(
            'Full Bottom Sheet',
            'Bottom sheet de altura completa',
            () => _showExampleBottomSheet(BottomSheetVariant.full),
          ),
        ]),
        const SizedBox(height: 32),
        _buildExampleSection('Estados Especiales', [
          _buildExampleCard(
            'Loading Bottom Sheet',
            'Bottom sheet con estado de carga',
            () => _showLoadingBottomSheet(),
          ),
          _buildExampleCard(
            'Skeleton Bottom Sheet',
            'Bottom sheet con estado esqueleto',
            () => _showSkeletonBottomSheet(),
          ),
          _buildExampleCard(
            'Disabled Bottom Sheet',
            'Bottom sheet deshabilitado',
            () => _showDisabledBottomSheet(),
          ),
        ]),
        const SizedBox(height: 32),
        _buildExampleSection('Casos de Uso Reales', [
          _buildExampleCard(
            'Lista de Opciones',
            'Bottom sheet con lista de acciones',
            () => _showOptionsBottomSheet(),
          ),
          _buildExampleCard(
            'Formulario de Filtros',
            'Bottom sheet con formulario',
            () => _showFilterBottomSheet(),
          ),
          _buildExampleCard(
            'Galería de Imágenes',
            'Bottom sheet con contenido visual',
            () => _showGalleryBottomSheet(),
          ),
        ]),
        const SizedBox(height: 32),
        _buildExampleSection('Comportamientos Adaptativos', [
          _buildExampleCard(
            'No Draggable',
            'Bottom sheet sin arrastre',
            () => _showNonDraggableBottomSheet(),
          ),
          _buildExampleCard(
            'Snap Personalizado',
            'Bottom sheet con puntos específicos',
            () => _showCustomSnapBottomSheet(),
          ),
          _buildExampleCard(
            'Contenido Dinámico',
            'Bottom sheet con altura variable',
            () => _showDynamicContentBottomSheet(),
          ),
        ]),
      ],
    );
  }

  Widget _buildExampleSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: cards,
        ),
      ],
    );
  }

  Widget _buildExampleCard(String title, String description, VoidCallback onTap) {
    return SizedBox(
      width: 280,
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Ver ejemplo',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfiguredBottomSheet() {
    final bottomSheet = _createBottomSheet(
      variant: _selectedVariant,
      state: _selectedState,
      initialSnap: _selectedSnap,
      draggable: _draggable,
      content: _getContentForVariant(_selectedVariant),
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showExampleBottomSheet(BottomSheetVariant variant) {
    final bottomSheet = _createBottomSheet(
      variant: variant,
      content: _getContentForVariant(variant),
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showLoadingBottomSheet() {
    final bottomSheet = AppBottomSheet.half(
      content: _buildBasicContent('Cargando datos...'),
      state: AppBottomSheetState.loading,
      draggable: false,
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );

    // Simular carga
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  void _showSkeletonBottomSheet() {
    final bottomSheet = AppBottomSheet.half(
      content: _buildBasicContent('Contenido en carga...'),
      state: AppBottomSheetState.skeleton,
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showDisabledBottomSheet() {
    final bottomSheet = AppBottomSheet.half(
      content: _buildBasicContent('Bottom sheet deshabilitado'),
      state: AppBottomSheetState.disabled,
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showOptionsBottomSheet() {
    final bottomSheet = AppBottomSheet.modal(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Selecciona una opción',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Editar'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Compartir'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ),
        ],
      ),
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showFilterBottomSheet() {
    final bottomSheet = AppBottomSheet.full(
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filtros de Búsqueda',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Palabra clave',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Categoría',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Precio mín.',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Precio máx.',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Limpiar'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Aplicar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showGalleryBottomSheet() {
    final bottomSheet = AppBottomSheet.full(
      content: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Galería de Imágenes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.image,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showNonDraggableBottomSheet() {
    final bottomSheet = AppBottomSheet.half(
      content: _buildBasicContent('Este bottom sheet no se puede arrastrar'),
      draggable: false,
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showCustomSnapBottomSheet() {
    final bottomSheet = AppBottomSheet.modal(
      content: _buildBasicContent('Bottom sheet con puntos de anclaje personalizados'),
      initialSnap: BottomSheetSnap.min,
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  void _showDynamicContentBottomSheet() {
    final bottomSheet = AppBottomSheet.half(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Contenido Dinámico',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < 10; i++)
            ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('Elemento ${i + 1}'),
              subtitle: Text('Descripción del elemento ${i + 1}'),
            ),
        ],
      ),
    );

    AppBottomSheet.showModal(
      context: context,
      bottomSheet: bottomSheet,
    );
  }

  AppBottomSheet _createBottomSheet({
    required BottomSheetVariant variant,
    required Widget content,
    AppBottomSheetState state = AppBottomSheetState.defaultState,
    BottomSheetSnap initialSnap = BottomSheetSnap.half,
    bool draggable = true,
  }) {
    switch (variant) {
      case BottomSheetVariant.modal:
        return AppBottomSheet.modal(
          content: content,
          state: state,
          initialSnap: initialSnap,
          draggable: draggable,
          rtlSupport: _rtlSupport,
          accessibilitySupport: _accessibilitySupport,
        );
      case BottomSheetVariant.half:
        return AppBottomSheet.half(
          content: content,
          state: state,
          initialSnap: initialSnap,
          draggable: draggable,
          rtlSupport: _rtlSupport,
          accessibilitySupport: _accessibilitySupport,
        );
      case BottomSheetVariant.full:
        return AppBottomSheet.full(
          content: content,
          state: state,
          initialSnap: initialSnap,
          draggable: draggable,
          rtlSupport: _rtlSupport,
          accessibilitySupport: _accessibilitySupport,
        );
    }
  }

  Widget _getContentForVariant(BottomSheetVariant variant) {
    switch (variant) {
      case BottomSheetVariant.modal:
        return _buildBasicContent(
          'Este es un bottom sheet modal que permite mostrar contenido '
          'importante que requiere la atención completa del usuario.',
        );
      case BottomSheetVariant.half:
        return _buildBasicContent(
          'Este es un bottom sheet de media altura, perfecto para '
          'mostrar información adicional sin ocupar toda la pantalla.',
        );
      case BottomSheetVariant.full:
        return _buildBasicContent(
          'Este es un bottom sheet de altura completa, ideal para '
          'contenido extenso como formularios o listas largas.',
        );
    }
  }

  Widget _buildBasicContent(String text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.drag_handle,
            size: 32,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  String _getVariantName(BottomSheetVariant variant) {
    switch (variant) {
      case BottomSheetVariant.modal:
        return 'Modal';
      case BottomSheetVariant.half:
        return 'Half';
      case BottomSheetVariant.full:
        return 'Full';
    }
  }

  String _getVariantDescription(BottomSheetVariant variant) {
    switch (variant) {
      case BottomSheetVariant.modal:
        return 'Bottom sheet modal';
      case BottomSheetVariant.half:
        return 'Media altura';
      case BottomSheetVariant.full:
        return 'Altura completa';
    }
  }

  String _getStateName(AppBottomSheetState state) {
    switch (state) {
      case AppBottomSheetState.defaultState:
        return 'Default';
      case AppBottomSheetState.hover:
        return 'Hover';
      case AppBottomSheetState.pressed:
        return 'Pressed';
      case AppBottomSheetState.focus:
        return 'Focus';
      case AppBottomSheetState.selected:
        return 'Selected';
      case AppBottomSheetState.disabled:
        return 'Disabled';
      case AppBottomSheetState.loading:
        return 'Loading';
      case AppBottomSheetState.skeleton:
        return 'Skeleton';
    }
  }

  String _getSnapName(BottomSheetSnap snap) {
    switch (snap) {
      case BottomSheetSnap.min:
        return 'Mínimo';
      case BottomSheetSnap.half:
        return 'Medio';
      case BottomSheetSnap.max:
        return 'Máximo';
    }
  }
}