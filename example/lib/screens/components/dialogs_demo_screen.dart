import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class DialogsDemoScreen extends StatefulWidget {
  const DialogsDemoScreen({super.key});

  @override
  State<DialogsDemoScreen> createState() => _DialogsDemoScreenState();
}

class _DialogsDemoScreenState extends State<DialogsDemoScreen> {
  String _selectedOption = 'Opción 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Diálogos Demo'),
        backRoute: '/components',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Diálogos y Modales', style: DSTypography.h2),
            const SizedBox(height: 24),

            // Alert Dialogs Section
            _buildSection(
              'Alert Dialogs',
              'Diálogos de confirmación y alerta',
              _buildAlertDialogsDemo(),
            ),

            // Simple Dialogs Section
            _buildSection(
              'Simple Dialogs',
              'Diálogos de selección simple',
              _buildSimpleDialogsDemo(),
            ),

            // Custom Dialogs Section
            _buildSection(
              'Custom Dialogs',
              'Diálogos personalizados y modales',
              _buildCustomDialogsDemo(),
            ),

            // Bottom Sheets Section
            _buildSection(
              'Bottom Sheets',
              'Paneles deslizantes desde abajo',
              _buildBottomSheetsDemo(),
            ),

            // Full Screen Dialogs Section
            _buildSection(
              'Full Screen Dialogs',
              'Diálogos de pantalla completa',
              _buildFullScreenDialogsDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h4),
        const SizedBox(height: 8),
        Text(description, style: DSTypography.bodyMedium.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        )),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildAlertDialogsDemo() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          onPressed: () => _showBasicAlertDialog(),
          icon: const Icon(Icons.info_outline),
          label: const Text('Alerta Básica'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showConfirmDialog(),
          icon: const Icon(Icons.help_outline),
          label: const Text('Confirmación'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showDestructiveDialog(),
          icon: const Icon(Icons.warning),
          label: const Text('Acción Destructiva'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showSuccessDialog(),
          icon: const Icon(Icons.check_circle),
          label: const Text('Éxito'),
        ),
      ],
    );
  }

  Widget _buildSimpleDialogsDemo() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          onPressed: () => _showSelectionDialog(),
          icon: const Icon(Icons.list),
          label: const Text('Lista de Opciones'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showRadioDialog(),
          icon: const Icon(Icons.radio_button_checked),
          label: const Text('Selección Única'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showCheckboxDialog(),
          icon: const Icon(Icons.checklist),
          label: const Text('Selección Múltiple'),
        ),
      ],
    );
  }

  Widget _buildCustomDialogsDemo() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          onPressed: () => _showFormDialog(),
          icon: const Icon(Icons.edit),
          label: const Text('Formulario'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showLoadingDialog(),
          icon: const Icon(Icons.hourglass_empty),
          label: const Text('Cargando'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showImageDialog(),
          icon: const Icon(Icons.image),
          label: const Text('Con Imagen'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showCustomStyledDialog(),
          icon: const Icon(Icons.palette),
          label: const Text('Estilo Personalizado'),
        ),
      ],
    );
  }

  Widget _buildBottomSheetsDemo() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          onPressed: () => _showModalBottomSheet(),
          icon: const Icon(Icons.menu),
          label: const Text('Modal Bottom Sheet'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showPersistentBottomSheet(),
          icon: const Icon(Icons.vertical_align_bottom),
          label: const Text('Persistent Bottom Sheet'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showDraggableBottomSheet(),
          icon: const Icon(Icons.drag_handle),
          label: const Text('Draggable Sheet'),
        ),
      ],
    );
  }

  Widget _buildFullScreenDialogsDemo() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          onPressed: () => _showFullScreenDialog(),
          icon: const Icon(Icons.fullscreen),
          label: const Text('Pantalla Completa'),
        ),
        ElevatedButton.icon(
          onPressed: () => _showSlideDialog(),
          icon: const Icon(Icons.slideshow),
          label: const Text('Con Transición'),
        ),
      ],
    );
  }

  // Alert Dialog Methods
  void _showBasicAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información'),
          content: const Text('Esta es una alerta básica con información importante para el usuario.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Entendido'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar acción'),
          content: const Text('¿Estás seguro de que deseas continuar con esta acción?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Acción confirmada')),
                );
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void _showDestructiveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.warning, color: Theme.of(context).colorScheme.error, size: 48),
          title: const Text('Eliminar elemento'),
          content: const Text('Esta acción no se puede deshacer. El elemento será eliminado permanentemente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Elemento eliminado')),
                );
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.check_circle, color: Colors.green, size: 48),
          title: const Text('¡Operación exitosa!'),
          content: const Text('La operación se ha completado correctamente.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Continuar'),
            ),
          ],
        );
      },
    );
  }

  // Simple Dialog Methods
  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Selecciona una opción'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                _showResult('Opción 1 seleccionada');
              },
              child: const Text('Opción 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                _showResult('Opción 2 seleccionada');
              },
              child: const Text('Opción 2'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                _showResult('Opción 3 seleccionada');
              },
              child: const Text('Opción 3'),
            ),
          ],
        );
      },
    );
  }

  void _showRadioDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempSelected = _selectedOption;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Selecciona una opción'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioMenuButton<String>(
                    value: 'Opción 1',
                    groupValue: tempSelected,
                    onChanged: (String? value) {
                      setState(() {
                        tempSelected = value!;
                      });
                    },
                    child: const Text('Opción 1'),
                  ),
                  RadioMenuButton<String>(
                    value: 'Opción 2',
                    groupValue: tempSelected,
                    onChanged: (String? value) {
                      setState(() {
                        tempSelected = value!;
                      });
                    },
                    child: const Text('Opción 2'),
                  ),
                  RadioMenuButton<String>(
                    value: 'Opción 3',
                    groupValue: tempSelected,
                    onChanged: (String? value) {
                      setState(() {
                        tempSelected = value!;
                      });
                    },
                    child: const Text('Opción 3'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    this.setState(() {
                      _selectedOption = tempSelected;
                    });
                    Navigator.of(context).pop();
                    _showResult('Seleccionado: $tempSelected');
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showCheckboxDialog() {
    List<String> selectedItems = [];
    final items = ['Elemento 1', 'Elemento 2', 'Elemento 3', 'Elemento 4'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Selecciona elementos'),
              content: SingleChildScrollView(
                child: Column(
                  children: items.map((item) {
                    return CheckboxListTile(
                      title: Text(item),
                      value: selectedItems.contains(item),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedItems.add(item);
                          } else {
                            selectedItems.remove(item);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showResult('Seleccionados: ${selectedItems.join(', ')}');
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Custom Dialog Methods
  void _showFormDialog() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información de usuario'),
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showResult('Guardado: ${nameController.text}, ${emailController.text}');
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Cargando...'),
            ],
          ),
        );
      },
    );

    // Simular carga
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
        _showResult('Carga completada');
      }
    });
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 64,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Imagen de ejemplo', style: DSTypography.h5),
                    const SizedBox(height: 8),
                    const Text('Esta es una demostración de un diálogo con imagen.'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCustomStyledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 16),
                Text(
                  '¡Felicidades!',
                  style: DSTypography.h4.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Has desbloqueado un nuevo logro',
                  style: DSTypography.bodyMedium.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('¡Genial!'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Bottom Sheet Methods
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Modal Bottom Sheet', style: DSTypography.h5),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Compartir'),
                onTap: () {
                  Navigator.pop(context);
                  _showResult('Compartir seleccionado');
                },
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Copiar enlace'),
                onTap: () {
                  Navigator.pop(context);
                  _showResult('Enlace copiado');
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Editar'),
                onTap: () {
                  Navigator.pop(context);
                  _showResult('Editar seleccionado');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPersistentBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha:0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text('Persistent Bottom Sheet', style: DSTypography.h5),
              const SizedBox(height: 16),
              const Text('Este bottom sheet permanece hasta que se cierre manualmente.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDraggableBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha:0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text('Draggable Bottom Sheet', style: DSTypography.h5),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text('Elemento ${index + 1}'),
                          subtitle: Text('Descripción del elemento ${index + 1}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Full Screen Dialog Methods
  void _showFullScreenDialog() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Diálogo Pantalla Completa'),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showResult('Guardado desde pantalla completa');
                  },
                  child: const Text('GUARDAR'),
                ),
              ],
            ),
            body: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contenido del diálogo de pantalla completa'),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Campo de texto',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSlideDialog() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Diálogo con Transición'),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.slideshow,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text('Diálogo con transición personalizada', style: DSTypography.h5),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cerrar'),
                  ),
                ],
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}