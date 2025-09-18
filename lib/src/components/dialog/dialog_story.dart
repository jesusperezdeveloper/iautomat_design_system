import 'package:flutter/material.dart';
import 'app_dialog.dart';

/// Story para demostrar las diferentes variantes y configuraciones del AppDialog
class DialogStory extends StatefulWidget {
  const DialogStory({super.key});

  @override
  State<DialogStory> createState() => _DialogStoryState();
}

class _DialogStoryState extends State<DialogStory> {
  DialogVariant _selectedVariant = DialogVariant.md;
  AppDialogState _selectedState = AppDialogState.defaultState;
  bool _barrierDismissible = true;
  bool _showTitle = true;
  bool _showContent = true;
  bool _showActions = true;
  bool _rtlSupport = true;
  bool _accessibilitySupport = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppDialog Story'),
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
                    _buildOptionsSection(),
                    const SizedBox(height: 24),
                    _buildShowDialogButton(),
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
                      'Ejemplos de AppDialog',
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
          children: DialogVariant.values.map((variant) {
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
        DropdownButtonFormField<AppDialogState>(
          initialValue: _selectedState,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Estado del dialog',
          ),
          items: AppDialogState.values.map((state) {
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
          title: const Text('Barrier Dismissible'),
          subtitle: const Text('Permite cerrar tocando fuera'),
          value: _barrierDismissible,
          onChanged: (value) {
            setState(() {
              _barrierDismissible = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Mostrar título'),
          value: _showTitle,
          onChanged: (value) {
            setState(() {
              _showTitle = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Mostrar contenido'),
          value: _showContent,
          onChanged: (value) {
            setState(() {
              _showContent = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Mostrar acciones'),
          value: _showActions,
          onChanged: (value) {
            setState(() {
              _showActions = value;
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

  Widget _buildShowDialogButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () => _showConfiguredDialog(),
        child: const Text('Mostrar Dialog Configurado'),
      ),
    );
  }

  Widget _buildExamplesGrid() {
    return Column(
      children: [
        _buildExampleSection('Tamaños Básicos', [
          _buildExampleCard(
            'Small Dialog',
            'Dialog compacto para confirmaciones simples',
            () => _showExampleDialog(DialogVariant.sm),
          ),
          _buildExampleCard(
            'Medium Dialog',
            'Dialog estándar para contenido regular',
            () => _showExampleDialog(DialogVariant.md),
          ),
          _buildExampleCard(
            'Large Dialog',
            'Dialog amplio para contenido extenso',
            () => _showExampleDialog(DialogVariant.lg),
          ),
        ]),
        const SizedBox(height: 32),
        _buildExampleSection('Variantes Especiales', [
          _buildExampleCard(
            'Destructive Dialog',
            'Dialog para acciones peligrosas',
            () => _showExampleDialog(DialogVariant.destructive),
          ),
          _buildExampleCard(
            'Form Dialog',
            'Dialog optimizado para formularios',
            () => _showExampleDialog(DialogVariant.form),
          ),
        ]),
        const SizedBox(height: 32),
        _buildExampleSection('Estados Especiales', [
          _buildExampleCard(
            'Loading Dialog',
            'Dialog con estado de carga',
            () => _showLoadingDialog(),
          ),
          _buildExampleCard(
            'Skeleton Dialog',
            'Dialog con estado esqueleto',
            () => _showSkeletonDialog(),
          ),
        ]),
        const SizedBox(height: 32),
        _buildExampleSection('Casos de Uso Reales', [
          _buildExampleCard(
            'Confirmar Eliminación',
            'Dialog destructivo con confirmación',
            () => _showDeleteConfirmation(),
          ),
          _buildExampleCard(
            'Formulario de Contacto',
            'Dialog de formulario con validación',
            () => _showContactForm(),
          ),
          _buildExampleCard(
            'Información Detallada',
            'Dialog grande con información extensa',
            () => _showDetailedInfo(),
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
                      Icons.arrow_forward,
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

  void _showConfiguredDialog() {
    final dialog = AppDialog(
      variant: _selectedVariant,
      state: _selectedState,
      title: _showTitle ? _getTitleForVariant(_selectedVariant) : null,
      content: _showContent ? _getContentForVariant(_selectedVariant) : null,
      actions: _showActions ? _getActionsForVariant(_selectedVariant) : [],
      barrierDismissible: _barrierDismissible,
      rtlSupport: _rtlSupport,
      accessibilitySupport: _accessibilitySupport,
    );

    AppDialog.show(context: context, dialog: dialog);
  }

  void _showExampleDialog(DialogVariant variant) {
    final dialog = AppDialog(
      variant: variant,
      title: _getTitleForVariant(variant),
      content: _getContentForVariant(variant),
      actions: _getActionsForVariant(variant),
    );

    AppDialog.show(context: context, dialog: dialog);
  }

  void _showLoadingDialog() {
    final dialog = AppDialog.md(
      title: 'Procesando',
      content: const Text('Por favor espere mientras procesamos su solicitud...'),
      state: AppDialogState.loading,
      barrierDismissible: false,
    );

    AppDialog.show(context: context, dialog: dialog);

    // Simular carga
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  void _showSkeletonDialog() {
    final dialog = AppDialog.md(
      title: 'Cargando contenido',
      content: const Text('El contenido se está cargando...'),
      state: AppDialogState.skeleton,
      actions: [
        DialogAction(
          label: 'Cancelar',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    AppDialog.show(context: context, dialog: dialog);
  }

  void _showDeleteConfirmation() {
    final dialog = AppDialog.destructive(
      title: '¿Eliminar elemento?',
      content: const Text(
        'Esta acción no se puede deshacer. El elemento será eliminado permanentemente.',
      ),
      actions: [
        DialogAction(
          label: 'Cancelar',
          onPressed: () => Navigator.of(context).pop(),
        ),
        DialogAction(
          label: 'Eliminar',
          isPrimary: true,
          isDestructive: true,
          icon: Icons.delete,
          onPressed: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Elemento eliminado')),
            );
          },
        ),
      ],
    );

    AppDialog.show(context: context, dialog: dialog);
  }

  void _showContactForm() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    final dialog = AppDialog.form(
      title: 'Formulario de Contacto',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: messageController,
            decoration: const InputDecoration(
              labelText: 'Mensaje',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        DialogAction(
          label: 'Cancelar',
          onPressed: () => Navigator.of(context).pop(),
        ),
        DialogAction(
          label: 'Enviar',
          isPrimary: true,
          icon: Icons.send,
          onPressed: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Mensaje enviado')),
            );
          },
        ),
      ],
    );

    AppDialog.show(context: context, dialog: dialog);
  }

  void _showDetailedInfo() {
    final dialog = AppDialog.lg(
      title: 'Información Detallada del Sistema',
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Especificaciones Técnicas:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Flutter Framework 3.35.3'),
            Text('• Dart SDK 3.9.2'),
            Text('• Material Design 3'),
            Text('• Platform adaptive UI'),
            Text('• RTL support'),
            Text('• Accessibility compliant'),
            SizedBox(height: 16),
            Text(
              'Características del Dialog:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Responsive design'),
            Text('• Multiple size variants'),
            Text('• Interactive states'),
            Text('• Animation support'),
            Text('• Keyboard navigation'),
            Text('• Screen reader compatible'),
            SizedBox(height: 16),
            Text(
              'Este dialog demuestra la capacidad de manejar contenido extenso '
              'manteniendo una experiencia de usuario óptima y accesible.',
            ),
          ],
        ),
      ),
      actions: [
        DialogAction(
          label: 'Documentación',
          icon: Icons.description,
          onPressed: () => Navigator.of(context).pop(),
        ),
        DialogAction(
          label: 'Cerrar',
          isPrimary: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    AppDialog.show(context: context, dialog: dialog);
  }

  String _getVariantName(DialogVariant variant) {
    switch (variant) {
      case DialogVariant.sm:
        return 'Small';
      case DialogVariant.md:
        return 'Medium';
      case DialogVariant.lg:
        return 'Large';
      case DialogVariant.destructive:
        return 'Destructive';
      case DialogVariant.form:
        return 'Form';
    }
  }

  String _getVariantDescription(DialogVariant variant) {
    switch (variant) {
      case DialogVariant.sm:
        return 'Confirmaciones simples';
      case DialogVariant.md:
        return 'Contenido estándar';
      case DialogVariant.lg:
        return 'Contenido extenso';
      case DialogVariant.destructive:
        return 'Acciones peligrosas';
      case DialogVariant.form:
        return 'Formularios';
    }
  }

  String _getStateName(AppDialogState state) {
    switch (state) {
      case AppDialogState.defaultState:
        return 'Default';
      case AppDialogState.hover:
        return 'Hover';
      case AppDialogState.pressed:
        return 'Pressed';
      case AppDialogState.focus:
        return 'Focus';
      case AppDialogState.selected:
        return 'Selected';
      case AppDialogState.disabled:
        return 'Disabled';
      case AppDialogState.loading:
        return 'Loading';
      case AppDialogState.skeleton:
        return 'Skeleton';
    }
  }

  String _getTitleForVariant(DialogVariant variant) {
    switch (variant) {
      case DialogVariant.sm:
        return 'Confirmación';
      case DialogVariant.md:
        return 'Información';
      case DialogVariant.lg:
        return 'Detalles Completos';
      case DialogVariant.destructive:
        return '¡Acción Peligrosa!';
      case DialogVariant.form:
        return 'Formulario';
    }
  }

  Widget _getContentForVariant(DialogVariant variant) {
    switch (variant) {
      case DialogVariant.sm:
        return const Text('¿Está seguro de continuar?');
      case DialogVariant.md:
        return const Text(
          'Este es un contenido de ejemplo para demostrar '
          'las capacidades del dialog mediano.',
        );
      case DialogVariant.lg:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Este dialog grande puede contener información extensa y detallada.',
            ),
            SizedBox(height: 16),
            Text('Características:'),
            Text('• Contenido extenso'),
            Text('• Múltiples secciones'),
            Text('• Scroll automático'),
            Text('• Responsive design'),
          ],
        );
      case DialogVariant.destructive:
        return const Text(
          'Esta acción no puede deshacerse. '
          'Por favor confirme que desea continuar.',
        );
      case DialogVariant.form:
        return Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Campo de ejemplo',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
    }
  }

  List<DialogAction> _getActionsForVariant(DialogVariant variant) {
    switch (variant) {
      case DialogVariant.sm:
        return [
          DialogAction(
            label: 'Cancelar',
            onPressed: () => Navigator.of(context).pop(),
          ),
          DialogAction(
            label: 'Aceptar',
            isPrimary: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ];
      case DialogVariant.md:
        return [
          DialogAction(
            label: 'Cancelar',
            onPressed: () => Navigator.of(context).pop(),
          ),
          DialogAction(
            label: 'Entendido',
            isPrimary: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ];
      case DialogVariant.lg:
        return [
          DialogAction(
            label: 'Más Info',
            icon: Icons.info,
            onPressed: () => Navigator.of(context).pop(),
          ),
          DialogAction(
            label: 'Cerrar',
            isPrimary: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ];
      case DialogVariant.destructive:
        return [
          DialogAction(
            label: 'Cancelar',
            onPressed: () => Navigator.of(context).pop(),
          ),
          DialogAction(
            label: 'Eliminar',
            isPrimary: true,
            isDestructive: true,
            icon: Icons.delete,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ];
      case DialogVariant.form:
        return [
          DialogAction(
            label: 'Cancelar',
            onPressed: () => Navigator.of(context).pop(),
          ),
          DialogAction(
            label: 'Guardar',
            isPrimary: true,
            icon: Icons.save,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ];
    }
  }
}