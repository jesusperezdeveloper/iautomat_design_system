import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story de DSCameraPicker con ejemplos y casos de uso
class CameraPickerStory extends StatefulWidget {
  const CameraPickerStory({super.key});

  @override
  State<CameraPickerStory> createState() => _CameraPickerStoryState();
}

class _CameraPickerStoryState extends State<CameraPickerStory> {
  List<DSCameraPickerFile> _selectedFiles = [];
  String? _lastError;
  bool _permissionDenied = false;
  bool _cancelled = false;

  void _onPicked(List<DSCameraPickerFile> files) {
    setState(() {
      _selectedFiles = files;
      _lastError = null;
      _permissionDenied = false;
      _cancelled = false;
    });
  }

  void _onError(String error) {
    setState(() {
      _lastError = error;
      _selectedFiles = [];
    });
  }

  void _onPermissionDenied() {
    setState(() {
      _permissionDenied = true;
      _lastError = null;
      _selectedFiles = [];
    });
  }

  void _onCancelled() {
    setState(() {
      _cancelled = true;
      _lastError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSCameraPicker Story'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de estado
            _buildStatusCard(),
            const SizedBox(height: DSSpacing.lg),

            // Casos de uso básicos
            _buildSection(
              title: 'Casos de Uso Básicos',
              children: [
                _buildExample(
                  title: 'Picker por Defecto',
                  description: 'Permite elegir entre cámara y galería',
                  widget: const DSCameraPicker(),
                ),
                _buildExample(
                  title: 'Solo Cámara',
                  description: 'Acceso directo a la cámara',
                  widget: const DSCameraPicker(
                    source: DSCameraPickerSource.camera,
                  ),
                ),
                _buildExample(
                  title: 'Solo Galería',
                  description: 'Acceso directo a la galería',
                  widget: const DSCameraPicker(
                    source: DSCameraPickerSource.gallery,
                  ),
                ),
                _buildExample(
                  title: 'Selección Múltiple',
                  description: 'Permite seleccionar múltiples archivos',
                  widget: DSCameraPicker(
                    allowMultiple: true,
                    onPicked: _onPicked,
                    onError: _onError,
                    onPermissionDenied: _onPermissionDenied,
                    onCancelled: _onCancelled,
                  ),
                ),
              ],
            ),

            // Estados del componente
            _buildSection(
              title: 'Estados del Componente',
              children: [
                _buildExample(
                  title: 'Estado Deshabilitado',
                  description: 'Componente no interactivo',
                  widget: const DSCameraPicker(
                    enabled: false,
                  ),
                ),
                _buildExample(
                  title: 'Estado de Carga',
                  description: 'Muestra indicador de progreso',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      state: DSCameraPickerState.loading,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Skeleton',
                  description: 'Placeholder durante carga inicial',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      state: DSCameraPickerState.skeleton,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Focus',
                  description: 'Resaltado para navegación por teclado',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      state: DSCameraPickerState.focus,
                    ),
                  ),
                ),
              ],
            ),

            // Variantes de plataforma
            _buildSection(
              title: 'Variantes de Plataforma',
              children: [
                _buildExample(
                  title: 'Variante iOS',
                  description: 'UI estilo iOS con ActionSheet',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      variant: DSCameraPickerVariant.ios,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Variante Android',
                  description: 'UI estilo Android con BottomSheet',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      variant: DSCameraPickerVariant.android,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Variante Web',
                  description: 'UI optimizada para navegadores',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      variant: DSCameraPickerVariant.web,
                    ),
                  ),
                ),
              ],
            ),

            // Personalización avanzada
            _buildSection(
              title: 'Personalización Avanzada',
              children: [
                _buildExample(
                  title: 'Textos Personalizados',
                  description: 'Textos e iconos customizados',
                  widget: const DSCameraPicker(
                    buttonText: 'Subir Archivo',
                    buttonIcon: Icons.cloud_upload,
                  ),
                ),
                _buildExample(
                  title: 'Colores Personalizados',
                  description: 'Paleta de colores customizada',
                  widget: DSCameraPicker(
                    config: DSCameraPickerConfig(
                      colors: const DSCameraPickerColors(
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        borderColor: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Espaciado Personalizado',
                  description: 'Tamaños y padding ajustados',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      spacing: DSCameraPickerSpacing(
                        borderRadius: 20.0,
                        padding: EdgeInsets.all(20.0),
                        minHeight: 80.0,
                        minWidth: 200.0,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Sin Animaciones',
                  description: 'Comportamiento estático',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      animation: DSCameraPickerAnimation(
                        enabled: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Configuración de comportamiento
            _buildSection(
              title: 'Configuración de Comportamiento',
              children: [
                _buildExample(
                  title: 'Solo Videos',
                  description: 'Restricción a archivos de video',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      fileType: DSCameraPickerFileType.video,
                      behavior: DSCameraPickerBehavior(
                        allowMultiple: true,
                        maxFiles: 3,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Calidad Personalizada',
                  description: 'Control de calidad de imagen',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      behavior: DSCameraPickerBehavior(
                        allowMultiple: false,
                        maxFiles: 1,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Con Callbacks Completos',
                  description: 'Manejo completo de eventos',
                  widget: DSCameraPicker(
                    onPicked: _onPicked,
                    onError: _onError,
                    onPermissionDenied: _onPermissionDenied,
                    onCancelled: _onCancelled,
                    config: const DSCameraPickerConfig(
                      behavior: DSCameraPickerBehavior(
                        allowMultiple: true,
                        maxFiles: 5,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Accesibilidad y RTL
            _buildSection(
              title: 'Accesibilidad y RTL',
              children: [
                _buildExample(
                  title: 'Configuración A11y Completa',
                  description: 'Optimizado para lectores de pantalla',
                  widget: DSCameraPicker(
                    config: const DSCameraPickerConfig(
                      a11yConfig: DSCameraPickerA11yConfig(
                        semanticsLabel: 'Selector de imágenes personalizado',
                        semanticsDescription: 'Permite seleccionar imágenes desde cámara o galería',
                        semanticsHint: 'Toca dos veces para activar',
                        announceStateChanges: true,
                        enableKeyboardNavigation: true,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Layout RTL',
                  description: 'Soporte para idiomas de derecha a izquierda',
                  widget: Directionality(
                    textDirection: TextDirection.rtl,
                    child: const DSCameraPicker(
                      buttonText: 'اختيار صورة',
                    ),
                  ),
                ),
              ],
            ),

            // Casos de uso en formularios
            _buildSection(
              title: 'Integración en Formularios',
              children: [
                _buildFormExample(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estado Actual',
              style: DSTypography.h6,
            ),
            const SizedBox(height: DSSpacing.sm),
            if (_selectedFiles.isNotEmpty) ...[
              Text(
                'Archivos seleccionados: ${_selectedFiles.length}',
                style: DSTypography.bodyMedium.copyWith(
                  color: DSColors.success,
                ),
              ),
              for (final file in _selectedFiles)
                Padding(
                  padding: const EdgeInsets.only(left: DSSpacing.md, top: 4),
                  child: Text(
                    '• ${file.name} (${file.formattedSize})',
                    style: DSTypography.bodySmall,
                  ),
                ),
            ],
            if (_lastError != null)
              Text(
                'Error: $_lastError',
                style: DSTypography.bodyMedium.copyWith(
                  color: DSColors.error,
                ),
              ),
            if (_permissionDenied)
              Text(
                'Permisos denegados',
                style: DSTypography.bodyMedium.copyWith(
                  color: DSColors.warning,
                ),
              ),
            if (_cancelled)
              Text(
                'Operación cancelada',
                style: DSTypography.bodyMedium.copyWith(
                  color: DSColors.gray600,
                ),
              ),
            if (_selectedFiles.isEmpty && _lastError == null && !_permissionDenied && !_cancelled)
              Text(
                'Ningún archivo seleccionado',
                style: DSTypography.bodyMedium.copyWith(
                  color: DSColors.gray600,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: DSTypography.h5,
        ),
        const SizedBox(height: DSSpacing.md),
        ...children,
        const SizedBox(height: DSSpacing.lg),
      ],
    );
  }

  Widget _buildExample({
    required String title,
    required String description,
    required Widget widget,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: DSSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: DSTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: DSTypography.bodySmall.copyWith(
                color: DSColors.gray600,
              ),
            ),
            const SizedBox(height: DSSpacing.md),
            Center(
              child: SizedBox(
                width: 300,
                height: 60,
                child: widget,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormExample() {
    return Card(
      margin: const EdgeInsets.only(bottom: DSSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Formulario de Perfil',
              style: DSTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Ejemplo de uso en un formulario real',
              style: DSTypography.bodySmall.copyWith(
                color: DSColors.gray600,
              ),
            ),
            const SizedBox(height: DSSpacing.md),

            // Simulación de formulario
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: DSSpacing.md),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: DSSpacing.md),

            // Campo de foto de perfil
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foto de Perfil',
                  style: DSTypography.labelMedium,
                ),
                const SizedBox(height: DSSpacing.sm),
                DSCameraPicker(
                  buttonText: 'Seleccionar Foto',
                  buttonIcon: Icons.person,
                  onPicked: _onPicked,
                  onError: _onError,
                  config: const DSCameraPickerConfig(
                    fileType: DSCameraPickerFileType.image,
                    behavior: DSCameraPickerBehavior(
                      allowMultiple: false,
                      maxFiles: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.md),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Formulario enviado'),
                    ),
                  );
                },
                child: const Text('Guardar Perfil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}