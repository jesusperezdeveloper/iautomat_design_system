import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSClipboardShareStory extends StatefulWidget {
  const DSClipboardShareStory({super.key});

  @override
  State<DSClipboardShareStory> createState() => _DSClipboardShareStoryState();
}

class _DSClipboardShareStoryState extends State<DSClipboardShareStory> {
  DSClipboardShareVariant _selectedVariant = DSClipboardShareVariant.shareSheet;
  DSClipboardShareState _selectedState = DSClipboardShareState.defaultState;
  bool _interactive = true;
  bool _showDebugInfo = false;
  bool _showPreview = true;
  bool _allowEdit = false;
  bool _showConfirmation = true;
  String _shareText = 'Hola! Estoy probando el nuevo componente DSClipboardShare del Design System de IAutomat. ¡Es increíble! 🚀';
  String _shareSubject = 'Prueba del DSClipboardShare';
  String _shareUrl = 'https://iautomat.com';

  DSShareData get _currentShareData => DSShareData(
    text: _shareText,
    subject: _shareSubject,
    url: _shareUrl,
    mimeType: 'text/plain',
  );

  final List<DSShareFile> _sampleFiles = [
    DSShareFile(
      name: 'documento.pdf',
      mimeType: 'application/pdf',
      size: 2458369, // ~2.3MB
    ),
    DSShareFile(
      name: 'imagen.jpg',
      mimeType: 'image/jpeg',
      size: 1024576, // ~1MB
    ),
    DSShareFile(
      name: 'video.mp4',
      mimeType: 'video/mp4',
      size: 15728640, // ~15MB
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSClipboardShare Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControls(),
            const SizedBox(height: 24),
            _buildLiveExample(),
            const SizedBox(height: 32),
            _buildVariantExamples(),
            const SizedBox(height: 32),
            _buildStateExamples(),
            const SizedBox(height: 32),
            _buildFileShareExamples(),
            const SizedBox(height: 32),
            _buildAdvancedExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Controles', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),

            // Variant Control
            DropdownButtonFormField<DSClipboardShareVariant>(
              initialValue: _selectedVariant,
              decoration: const InputDecoration(labelText: 'Variante'),
              items: DSClipboardShareVariant.values.map((variant) {
                return DropdownMenuItem(
                  value: variant,
                  child: Text(variant.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedVariant = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // State Control
            DropdownButtonFormField<DSClipboardShareState>(
              initialValue: _selectedState,
              decoration: const InputDecoration(labelText: 'Estado'),
              items: DSClipboardShareState.values.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state.displayName),
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
            const SizedBox(height: 16),

            // Text Content
            TextFormField(
              initialValue: _shareText,
              decoration: const InputDecoration(
                labelText: 'Texto para compartir',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: (value) {
                setState(() {
                  _shareText = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Subject
            TextFormField(
              initialValue: _shareSubject,
              decoration: const InputDecoration(
                labelText: 'Asunto',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _shareSubject = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // URL
            TextFormField(
              initialValue: _shareUrl,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _shareUrl = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Interactive Control
            SwitchListTile(
              title: const Text('Interactivo'),
              value: _interactive,
              onChanged: (value) {
                setState(() {
                  _interactive = value;
                });
              },
            ),

            // Show Preview Control
            SwitchListTile(
              title: const Text('Mostrar preview'),
              value: _showPreview,
              onChanged: (value) {
                setState(() {
                  _showPreview = value;
                });
              },
            ),

            // Allow Edit Control
            SwitchListTile(
              title: const Text('Permitir edición'),
              value: _allowEdit,
              onChanged: (value) {
                setState(() {
                  _allowEdit = value;
                });
              },
            ),

            // Show Confirmation Control
            SwitchListTile(
              title: const Text('Mostrar confirmación'),
              value: _showConfirmation,
              onChanged: (value) {
                setState(() {
                  _showConfirmation = value;
                });
              },
            ),

            // Debug Control
            SwitchListTile(
              title: const Text('Mostrar información de debug'),
              value: _showDebugInfo,
              onChanged: (value) {
                setState(() {
                  _showDebugInfo = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplo en Vivo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            Center(
              child: DSClipboardShare(
                data: _currentShareData,
                subject: _shareSubject,
                config: _buildCurrentConfig(),
                interactive: _interactive,
                onSharePressed: () {
                  debugPrint('Share button pressed!');
                },
                onCopyPressed: () {
                  debugPrint('Copy button pressed!');
                },
                onShareCompleted: (message) {
                  debugPrint('Share completed: $message');
                  if (_showDebugInfo) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Share: $message')),
                    );
                  }
                },
                onCopyCompleted: (message) {
                  debugPrint('Copy completed: $message');
                  if (_showDebugInfo) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copy: $message')),
                    );
                  }
                },
                onShareError: (error) {
                  debugPrint('Share error: $error');
                  if (_showDebugInfo) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $error'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                onStateChanged: (state) {
                  debugPrint('Estado cambiado a: ${state.displayName}');
                },
              ),
            ),

            if (_showDebugInfo) ...[
              const SizedBox(height: 16),
              _buildDebugInfo(),
            ],
          ],
        ),
      ),
    );
  }

  DSClipboardShareConfig _buildCurrentConfig() {
    return DSClipboardShareConfig(
      variant: _selectedVariant,
      state: _selectedState,
      showPreview: _showPreview,
      allowEdit: _allowEdit,
      showConfirmation: _showConfirmation,
      behavior: DSClipboardShareBehavior(
        showDebugInfo: _showDebugInfo,
        enableHoverEffects: _interactive,
        showFocusIndicator: _interactive,
      ),
    );
  }

  Widget _buildDebugInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Información de Debug:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Variante: ${_selectedVariant.name}'),
          Text('Estado: ${_selectedState.displayName}'),
          Text('Texto: ${_shareText.length} caracteres'),
          Text('Asunto: $_shareSubject'),
          Text('URL: $_shareUrl'),
          Text('Interactivo: ${_interactive ? "Sí" : "No"}'),
          Text('Mostrar preview: ${_showPreview ? "Sí" : "No"}'),
          Text('Permitir edición: ${_allowEdit ? "Sí" : "No"}'),
          Text('Mostrar confirmación: ${_showConfirmation ? "Sí" : "No"}'),
        ],
      ),
    );
  }

  Widget _buildVariantExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Variantes', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Share Sheet',
              'Share sheet nativo del sistema',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Ejemplo de share sheet nativo',
                  subject: 'Compartir con share sheet',
                ),
                config: const DSClipboardShareConfig(
                  variant: DSClipboardShareVariant.shareSheet,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Custom Menu',
              'Menú personalizado con opciones',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Ejemplo de menú personalizado',
                  subject: 'Compartir con menú custom',
                ),
                config: const DSClipboardShareConfig(
                  variant: DSClipboardShareVariant.customMenu,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Quick Actions',
              'Botón con acciones rápidas',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Ejemplo de acciones rápidas',
                  subject: 'Compartir rápido',
                ),
                config: const DSClipboardShareConfig(
                  variant: DSClipboardShareVariant.quickActions,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Modal Preview',
              'Modal con preview del contenido',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Ejemplo de modal con preview del contenido antes de compartir',
                  subject: 'Compartir con preview',
                ),
                config: const DSClipboardShareConfig(
                  variant: DSClipboardShareVariant.modalPreview,
                  showPreview: true,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estados', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: DSClipboardShareState.values.map((state) {
                return Column(
                  children: [
                    DSClipboardShare(
                      data: DSShareData(
                        text: 'Ejemplo en estado ${state.displayName}',
                      ),
                      config: DSClipboardShareConfig(
                        state: state,
                      ),
                      interactive: state != DSClipboardShareState.disabled,
                      onShareCompleted: (message) => debugPrint(message),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.displayName,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileShareExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Compartir Archivos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Archivo único',
              'Compartir un solo archivo',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Compartiendo un documento PDF',
                ),
                files: [_sampleFiles.first],
                config: const DSClipboardShareConfig(
                  showPreview: true,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Múltiples archivos',
              'Compartir varios archivos a la vez',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Compartiendo múltiples archivos',
                ),
                files: _sampleFiles,
                config: const DSClipboardShareConfig(
                  showPreview: true,
                  allowMultipleFiles: true,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Solo imágenes',
              'Compartir archivos de imagen',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Mis fotos favoritas',
                ),
                files: _sampleFiles.where((f) => f.isImage).toList(),
                config: const DSClipboardShareConfig(
                  showPreview: true,
                  compressImages: true,
                  imageQuality: 85,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos Avanzados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            _buildExampleSection(
              'Contenido sensible',
              'Compartir contenido marcado como sensible',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Este es contenido sensible que requiere cuidado',
                  isSensitive: true,
                ),
                config: const DSClipboardShareConfig(
                  showConfirmation: true,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Con metadata',
              'Compartir con información adicional',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Contenido con metadata adicional',
                  metadata: {
                    'source': 'IAutomat Design System',
                    'version': '1.0.0',
                    'category': 'example',
                  },
                ),
                config: const DSClipboardShareConfig(
                  showPreview: true,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Sin confirmación',
              'Compartir sin mostrar confirmación',
              DSClipboardShare(
                data: const DSShareData(
                  text: 'Compartir silenciosamente',
                ),
                config: const DSClipboardShareConfig(
                  showConfirmation: false,
                  variant: DSClipboardShareVariant.quickActions,
                ),
                onShareCompleted: (message) => debugPrint(message),
              ),
            ),

            const SizedBox(height: 16),

            _buildExampleSection(
              'Solo copiar',
              'Botón optimizado solo para copiar al portapapeles',
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Código de ejemplo:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'flutter pub add iautomat_design_system',
                              style: TextStyle(fontFamily: 'monospace'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    DSClipboardShare(
                      data: const DSShareData(
                        text: 'flutter pub add iautomat_design_system',
                      ),
                      config: const DSClipboardShareConfig(
                        variant: DSClipboardShareVariant.quickActions,
                      ),
                      onCopyCompleted: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Comando copiado al portapapeles!'),
                          ),
                        );
                      },
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

  Widget _buildExampleSection(
    String title,
    String description,
    Widget shareWidget,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 8),
        shareWidget,
      ],
    );
  }
}