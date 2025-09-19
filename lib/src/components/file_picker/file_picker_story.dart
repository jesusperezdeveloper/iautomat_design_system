import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/file_picker/ds_file_picker.dart';
import 'package:iautomat_design_system/src/components/file_picker/file_picker_config.dart';

/// Storybook examples for DSFilePicker component
///
/// This file contains various configurations and usage examples
/// of the DSFilePicker component for demonstration and testing purposes.
class DSFilePickerStory {
  static Widget get title => const Text(
        'DSFilePicker',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );

  static Widget get description => const Text(
        'A comprehensive file picker component with drag & drop and multi-selection variants, supporting file validation, preview, and platform-adaptive behavior.',
      );

  /// Basic file picker examples
  static List<FilePickerStoryExample> get basicExamples => [
        FilePickerStoryExample(
          name: 'Drag & Drop - Default',
          description:
              'Basic drag and drop file picker with default configuration',
          widget: _DragDropFilePickerExample(),
        ),
        FilePickerStoryExample(
          name: 'Multi Selector - Default',
          description: 'Basic multi-file selector with button interface',
          widget: _MultiFilePickerExample(),
        ),
      ];

  /// State examples
  static List<FilePickerStoryExample> get stateExamples => [
        FilePickerStoryExample(
          name: 'All States - Drag & Drop',
          description: 'Drag & drop file picker showing all possible states',
          widget: _StateExamplesWidget(),
        ),
        FilePickerStoryExample(
          name: 'Disabled State',
          description: 'File picker in disabled state',
          widget: _DisabledExample(),
        ),
        FilePickerStoryExample(
          name: 'Loading State',
          description: 'File picker in loading state',
          widget: _LoadingExample(),
        ),
        FilePickerStoryExample(
          name: 'Skeleton State',
          description: 'File picker in skeleton loading state',
          widget: _SkeletonExample(),
        ),
        FilePickerStoryExample(
          name: 'With Selected Files',
          description: 'File picker with pre-selected files',
          widget: _WithSelectedFilesExample(),
        ),
      ];

  /// Customization examples
  static List<FilePickerStoryExample> get customizationExamples => [
        FilePickerStoryExample(
          name: 'Custom Configuration',
          description: 'File picker with custom styling and configuration',
          widget: _CustomConfigExample(),
        ),
        FilePickerStoryExample(
          name: 'File Type Restrictions',
          description: 'File picker with specific file type restrictions',
          widget: _FileTypeRestrictionsExample(),
        ),
        FilePickerStoryExample(
          name: 'Size Limitations',
          description: 'File picker with file size limitations',
          widget: _SizeLimitationsExample(),
        ),
        FilePickerStoryExample(
          name: 'Custom Icons',
          description: 'File picker with custom prefix and suffix icons',
          widget: _CustomIconsExample(),
        ),
        FilePickerStoryExample(
          name: 'Custom Colors',
          description: 'File picker with custom color scheme',
          widget: _CustomColorsExample(),
        ),
      ];

  /// Validation examples
  static List<FilePickerStoryExample> get validationExamples => [
        FilePickerStoryExample(
          name: 'With Error Messages',
          description: 'File picker with validation error messages',
          widget: _ValidationErrorExample(),
        ),
        FilePickerStoryExample(
          name: 'Custom Validation',
          description: 'File picker with custom validation logic',
          widget: _CustomValidationExample(),
        ),
        FilePickerStoryExample(
          name: 'Multiple File Limits',
          description: 'File picker with maximum file count restrictions',
          widget: _FileLimitsExample(),
        ),
      ];

  /// Preview examples
  static List<FilePickerStoryExample> get previewExamples => [
        FilePickerStoryExample(
          name: 'Preview Enabled',
          description: 'File picker with file preview functionality',
          widget: _PreviewEnabledExample(),
        ),
        FilePickerStoryExample(
          name: 'Preview Disabled',
          description: 'File picker without file preview',
          widget: _PreviewDisabledExample(),
        ),
        FilePickerStoryExample(
          name: 'Thumbnail Preview',
          description: 'File picker with thumbnail preview mode',
          widget: _ThumbnailPreviewExample(),
        ),
      ];

  /// Form integration examples
  static List<FilePickerStoryExample> get formExamples => [
        FilePickerStoryExample(
          name: 'Form Integration',
          description: 'File picker integrated within a form',
          widget: _FormIntegrationExample(),
        ),
        FilePickerStoryExample(
          name: 'Multiple File Pickers',
          description: 'Multiple file pickers in a single form',
          widget: _MultiplePickersExample(),
        ),
        FilePickerStoryExample(
          name: 'With Form Validation',
          description: 'File picker with form validation integration',
          widget: _FormValidationExample(),
        ),
      ];

  /// Accessibility examples
  static List<FilePickerStoryExample> get accessibilityExamples => [
        FilePickerStoryExample(
          name: 'With Semantic Labels',
          description:
              'File picker with proper semantic labels for accessibility',
          widget: _AccessibilityExample(),
        ),
        FilePickerStoryExample(
          name: 'Keyboard Navigation',
          description: 'File picker optimized for keyboard navigation',
          widget: _KeyboardNavigationExample(),
        ),
        FilePickerStoryExample(
          name: 'High Contrast',
          description:
              'File picker with high contrast colors for accessibility',
          widget: _HighContrastExample(),
        ),
      ];

  /// RTL examples
  static List<FilePickerStoryExample> get rtlExamples => [
        FilePickerStoryExample(
          name: 'RTL Support',
          description: 'File picker with Right-to-Left text direction',
          widget: _RTLExample(),
        ),
        FilePickerStoryExample(
          name: 'RTL with Icons',
          description: 'File picker with RTL support and custom icons',
          widget: _RTLWithIconsExample(),
        ),
      ];

  /// Platform examples
  static List<FilePickerStoryExample> get platformExamples => [
        FilePickerStoryExample(
          name: 'Platform Adaptive',
          description: 'File picker that adapts to platform conventions',
          widget: _PlatformAdaptiveExample(),
        ),
        FilePickerStoryExample(
          name: 'Web Optimized',
          description: 'File picker optimized for web platform',
          widget: _WebOptimizedExample(),
        ),
        FilePickerStoryExample(
          name: 'Mobile Optimized',
          description: 'File picker optimized for mobile platforms',
          widget: _MobileOptimizedExample(),
        ),
      ];

  /// All examples grouped by category
  static Map<String, List<FilePickerStoryExample>> get allExamples => {
        'Basic Usage': basicExamples,
        'States': stateExamples,
        'Customization': customizationExamples,
        'Validation': validationExamples,
        'Preview': previewExamples,
        'Form Integration': formExamples,
        'Accessibility': accessibilityExamples,
        'RTL Support': rtlExamples,
        'Platform Adaptive': platformExamples,
      };
}

/// Data class for story examples
class FilePickerStoryExample {
  final String name;
  final String description;
  final Widget widget;

  const FilePickerStoryExample({
    required this.name,
    required this.description,
    required this.widget,
  });
}

// Example Widgets

class _DragDropFilePickerExample extends StatefulWidget {
  @override
  _DragDropFilePickerExampleState createState() =>
      _DragDropFilePickerExampleState();
}

class _DragDropFilePickerExampleState
    extends State<_DragDropFilePickerExample> {
  List<DSFileData>? selectedFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Seleccionar archivos',
            hint: 'Arrastra archivos aquí o haz clic para seleccionar',
            onFilesSelected: (files) {
              setState(() {
                selectedFiles = files;
              });
            },
          ),
          if (selectedFiles != null && selectedFiles!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Archivos seleccionados: ${selectedFiles!.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}

class _MultiFilePickerExample extends StatefulWidget {
  @override
  _MultiFilePickerExampleState createState() => _MultiFilePickerExampleState();
}

class _MultiFilePickerExampleState extends State<_MultiFilePickerExample> {
  List<DSFileData>? selectedFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Seleccionar archivos',
            hint: 'Elegir archivos',
            onFilesSelected: (files) {
              setState(() {
                selectedFiles = files;
              });
            },
          ),
          if (selectedFiles != null && selectedFiles!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Archivos seleccionados: ${selectedFiles!.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}

class _StateExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildStateExample('Default', DSFilePickerState.defaultState),
          const SizedBox(height: 16),
          _buildStateExample('Hover', DSFilePickerState.hover),
          const SizedBox(height: 16),
          _buildStateExample('Focus', DSFilePickerState.focus),
          const SizedBox(height: 16),
          _buildStateExample('Selected', DSFilePickerState.selected),
          const SizedBox(height: 16),
          _buildStateExample('Disabled', DSFilePickerState.disabled,
              enabled: false),
          const SizedBox(height: 16),
          _buildStateExample('Loading', DSFilePickerState.loading),
        ],
      ),
    );
  }

  Widget _buildStateExample(String label, DSFilePickerState state,
      {bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DSFilePicker(
          variant: DSFilePickerVariant.dragAndDrop,
          state: state,
          enabled: enabled,
          hint: 'Estado: $label',
          onFilesSelected: (files) {},
        ),
      ],
    );
  }
}

class _DisabledExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        enabled: false,
        label: 'File Picker Deshabilitado',
        hint: 'Este file picker está deshabilitado',
      ),
    );
  }
}

class _LoadingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.multi,
        state: DSFilePickerState.loading,
        label: 'Cargando archivos',
        hint: 'Procesando...',
      ),
    );
  }
}

class _SkeletonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        state: DSFilePickerState.skeleton,
        label: 'Skeleton Loading',
      ),
    );
  }
}

class _WithSelectedFilesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mockFiles = [
      DSFileData(
        name: 'documento.pdf',
        size: 1024 * 1024,
        type: 'application/pdf',
        lastModified: DateTime.now(),
      ),
      DSFileData(
        name: 'imagen.jpg',
        size: 512 * 1024,
        type: 'image/jpeg',
        lastModified: DateTime.now(),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Con archivos pre-seleccionados',
        value: mockFiles,
        preview: true,
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _CustomConfigExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customConfig = DSFilePickerConfig(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      borderWidth: 3.0,
      minSize: const Size(300, 150),
      animationDuration: const Duration(milliseconds: 300),
      colors: DSFilePickerColors.fromTheme(Theme.of(context)).copyWith(
        borderColor: Colors.purple,
        hoverBorderColor: Colors.purpleAccent,
        focusBorderColor: Colors.deepPurple,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Configuración personalizada',
        config: customConfig,
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _FileTypeRestrictionsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Solo imágenes',
            accept: const ['jpg', 'jpeg', 'png', 'gif'],
            hint: 'Acepta solo archivos de imagen',
            helperText: 'Formatos permitidos: JPG, JPEG, PNG, GIF',
            onFilesSelected: (files) {},
          ),
          const SizedBox(height: 24),
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Solo documentos',
            accept: const ['pdf', 'doc', 'docx', 'txt'],
            hint: 'Seleccionar documentos',
            helperText: 'Formatos permitidos: PDF, DOC, DOCX, TXT',
            onFilesSelected: (files) {},
          ),
        ],
      ),
    );
  }
}

class _SizeLimitationsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Tamaño máximo: 5MB',
            maxSize: const DSFileSize(5, DSFileSizeUnit.mb),
            helperText: 'Los archivos no pueden exceder 5MB',
            onFilesSelected: (files) {},
            onValidationError: (error, file) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
          ),
          const SizedBox(height: 24),
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Archivos pequeños (500KB)',
            maxSize: const DSFileSize(500, DSFileSizeUnit.kb),
            helperText: 'Solo archivos menores a 500KB',
            onFilesSelected: (files) {},
          ),
        ],
      ),
    );
  }
}

class _CustomIconsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Con icono personalizado',
            prefixIcon: const Icon(Icons.cloud_upload, color: Colors.blue),
            hint: 'Subir a la nube',
            onFilesSelected: (files) {},
          ),
          const SizedBox(height: 24),
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Con iconos prefix y suffix',
            prefixIcon: const Icon(Icons.attach_file, color: Colors.green),
            suffixIcon: const Icon(Icons.arrow_forward, color: Colors.orange),
            hint: 'Adjuntar archivo',
            onFilesSelected: (files) {},
          ),
        ],
      ),
    );
  }
}

class _CustomColorsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColors = DSFilePickerColors(
      backgroundColor: Colors.lightBlue.shade50,
      borderColor: Colors.blue,
      hoverBackgroundColor: Colors.blue.shade100,
      hoverBorderColor: Colors.blue.shade700,
      focusBackgroundColor: Colors.blue.shade50,
      focusBorderColor: Colors.blue.shade900,
      textColor: Colors.blue.shade900,
      iconColor: Colors.blue.shade600,
    );

    final customConfig = DSFilePickerConfig(
      colors: customColors,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Esquema de colores personalizado',
        config: customConfig,
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _ValidationErrorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Con mensaje de error',
        errorText: 'El archivo seleccionado es demasiado grande',
        onFilesSelected: null,
      ),
    );
  }
}

class _CustomValidationExample extends StatefulWidget {
  @override
  _CustomValidationExampleState createState() =>
      _CustomValidationExampleState();
}

class _CustomValidationExampleState extends State<_CustomValidationExample> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Validación personalizada',
        helperText:
            'Solo se permiten archivos con nombres que contengan "test"',
        errorText: errorMessage,
        customValidator: (file) {
          return file.name.toLowerCase().contains('test');
        },
        onValidationError: (error, file) {
          setState(() {
            errorMessage =
                'El archivo "${file?.name}" debe contener "test" en el nombre';
          });
        },
        onFilesSelected: (files) {
          setState(() {
            errorMessage = null;
          });
        },
      ),
    );
  }
}

class _FileLimitsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Máximo 3 archivos',
            allowMultiple: true,
            maxFiles: 3,
            helperText: 'Puedes seleccionar hasta 3 archivos',
            onFilesSelected: (files) {},
          ),
          const SizedBox(height: 24),
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Solo un archivo',
            allowMultiple: false,
            helperText: 'Solo se permite seleccionar un archivo',
            onFilesSelected: (files) {},
          ),
        ],
      ),
    );
  }
}

class _PreviewEnabledExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mockFiles = [
      DSFileData(
        name: 'presentacion.pptx',
        size: 2 * 1024 * 1024,
        type:
            'application/vnd.openxmlformats-officedocument.presentationml.presentation',
        lastModified: DateTime.now(),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Con preview habilitado',
        preview: true,
        value: mockFiles,
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _PreviewDisabledExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Sin preview',
        preview: false,
        helperText: 'El preview está deshabilitado',
        onFilesSelected: null,
      ),
    );
  }
}

class _ThumbnailPreviewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customConfig = DSFilePickerConfig(
      previewMode: DSFilePreviewMode.thumbnail,
      thumbnailSize: const Size(100, 100),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Preview con thumbnails',
        config: customConfig,
        preview: true,
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _FormIntegrationExample extends StatefulWidget {
  @override
  _FormIntegrationExampleState createState() => _FormIntegrationExampleState();
}

class _FormIntegrationExampleState extends State<_FormIntegrationExample> {
  final _formKey = GlobalKey<FormState>();
  List<DSFileData>? selectedFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre del proyecto',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DSFilePicker(
              variant: DSFilePickerVariant.dragAndDrop,
              label: 'Archivos del proyecto',
              accept: const ['pdf', 'doc', 'docx', 'jpg', 'png'],
              onFilesSelected: (files) {
                setState(() {
                  selectedFiles = files;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Formulario válido. Archivos: ${selectedFiles?.length ?? 0}',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MultiplePickersExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Documentos',
            accept: const ['pdf', 'doc', 'docx'],
            onFilesSelected: (files) {},
          ),
          const SizedBox(height: 24),
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Imágenes',
            accept: const ['jpg', 'jpeg', 'png', 'gif'],
            onFilesSelected: (files) {},
          ),
          const SizedBox(height: 24),
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Videos',
            accept: const ['mp4', 'avi', 'mov'],
            maxSize: const DSFileSize(100, DSFileSizeUnit.mb),
            onFilesSelected: (files) {},
          ),
        ],
      ),
    );
  }
}

class _FormValidationExample extends StatefulWidget {
  @override
  _FormValidationExampleState createState() => _FormValidationExampleState();
}

class _FormValidationExampleState extends State<_FormValidationExample> {
  final _formKey = GlobalKey<FormState>();
  List<DSFileData>? selectedFiles;
  String? fileError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DSFilePicker(
              variant: DSFilePickerVariant.dragAndDrop,
              label: 'Archivo requerido *',
              errorText: fileError,
              onFilesSelected: (files) {
                setState(() {
                  selectedFiles = files;
                  fileError = null;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                bool isValid = true;

                if (selectedFiles?.isEmpty ?? true) {
                  setState(() {
                    fileError = 'Debes seleccionar al menos un archivo';
                  });
                  isValid = false;
                }

                if (isValid) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Formulario válido')),
                  );
                }
              },
              child: const Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccessibilityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Selector de archivos accesible',
        semanticLabel:
            'Seleccionar archivos para subir. Arrastra archivos aquí o usa el botón para explorar',
        helperText: 'Usa Tab para navegar y Enter para seleccionar archivos',
        onFilesSelected: null,
      ),
    );
  }
}

class _KeyboardNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Navegación por teclado:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('• Tab: Mover al siguiente elemento'),
          Text('• Shift+Tab: Mover al elemento anterior'),
          Text('• Enter/Space: Abrir selector de archivos'),
          Text('• Escape: Cancelar selección'),
          SizedBox(height: 16),
          DSFilePicker(
            variant: DSFilePickerVariant.multi,
            label: 'Prueba la navegación por teclado',
            hint: 'Usa Tab y Enter',
            onFilesSelected: null,
          ),
        ],
      ),
    );
  }
}

class _HighContrastExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final highContrastColors = DSFilePickerColors(
      backgroundColor: Colors.black,
      borderColor: Colors.white,
      hoverBackgroundColor: Colors.grey.shade900,
      hoverBorderColor: Colors.yellow,
      focusBackgroundColor: Colors.black,
      focusBorderColor: Colors.yellow,
      textColor: Colors.white,
      hintTextColor: Colors.grey.shade300,
      iconColor: Colors.white,
    );

    final highContrastConfig = DSFilePickerConfig(
      colors: highContrastColors,
      borderWidth: 3.0,
      focusBorderWidth: 4.0,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Alto contraste',
        config: highContrastConfig,
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _RTLExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: DSFilePicker(
          variant: DSFilePickerVariant.dragAndDrop,
          label: 'منتخب کریں فائلز',
          hint: 'یہاں فائلز گھسیٹیں یا منتخب کرنے کے لیے کلک کریں',
          helperText: 'صرف PDF اور تصاویر کی اجازت ہے',
          onFilesSelected: null,
        ),
      ),
    );
  }
}

class _RTLWithIconsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DSFilePicker(
          variant: DSFilePickerVariant.multi,
          label: 'منتخب کریں فائلز',
          prefixIcon: const Icon(Icons.upload_file),
          suffixIcon: const Icon(Icons.folder_open),
          hint: 'فائل منتخب کریں',
          onFilesSelected: (files) {},
        ),
      ),
    );
  }
}

class _PlatformAdaptiveExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final adaptiveConfig = DSFilePickerConfig(
      adaptToPlatform: true,
      useNativeFilePicker: true,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Este file picker se adapta a la plataforma actual',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          DSFilePicker(
            variant: DSFilePickerVariant.dragAndDrop,
            label: 'Platform Adaptive',
            config: adaptiveConfig,
            onFilesSelected: (files) {},
          ),
        ],
      ),
    );
  }
}

class _WebOptimizedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final webConfig = DSFilePickerConfig(
      enableDragAndDrop: true,
      maxSize: const Size(400, 250),
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.dragAndDrop,
        label: 'Optimizado para Web',
        config: webConfig,
        helperText: 'Soporte completo para drag & drop en navegadores',
        onFilesSelected: (files) {},
      ),
    );
  }
}

class _MobileOptimizedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobileConfig = DSFilePickerConfig(
      minSize: const Size(double.infinity, 100),
      contentPadding: const EdgeInsets.all(20.0),
      enableHapticFeedback: true,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSFilePicker(
        variant: DSFilePickerVariant.multi,
        label: 'Optimizado para Móvil',
        config: mobileConfig,
        hint: 'Tocar para seleccionar archivos',
        helperText: 'Optimizado para pantallas táctiles',
        enableHapticFeedback: true,
        onFilesSelected: (files) {},
      ),
    );
  }
}
