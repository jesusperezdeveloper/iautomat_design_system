import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story de AppCameraPicker con ejemplos y casos de uso
class CameraPickerStory extends StatefulWidget {
  const CameraPickerStory({super.key});

  @override
  State<CameraPickerStory> createState() => _CameraPickerStoryState();
}

class _CameraPickerStoryState extends State<CameraPickerStory> {
  List<AppCameraPickerFile> _selectedFiles = [];
  String? _lastError;
  bool _permissionDenied = false;
  bool _cancelled = false;

  void _onPicked(List<AppCameraPickerFile> files) {
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
        title: const Text('AppCameraPicker Story'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de estado
            _buildStatusCard(),
            const SizedBox(height: AppSpacing.lg),

            // Casos de uso básicos
            _buildSection(
              title: 'Casos de Uso Básicos',
              children: [
                _buildExample(
                  title: 'Picker por Defecto',
                  description: 'Permite elegir entre cámara y galería',
                  widget: const AppCameraPicker(),
                ),
                _buildExample(
                  title: 'Solo Cámara',
                  description: 'Acceso directo a la cámara',
                  widget: const AppCameraPicker(
                    source: AppCameraPickerSource.camera,
                  ),
                ),
                _buildExample(
                  title: 'Solo Galería',
                  description: 'Acceso directo a la galería',
                  widget: const AppCameraPicker(
                    source: AppCameraPickerSource.gallery,
                  ),
                ),
                _buildExample(
                  title: 'Selección Múltiple',
                  description: 'Permite seleccionar múltiples archivos',
                  widget: AppCameraPicker(
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
                  widget: const AppCameraPicker(
                    enabled: false,
                  ),
                ),
                _buildExample(
                  title: 'Estado de Carga',
                  description: 'Muestra indicador de progreso',
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      state: AppCameraPickerState.loading,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Skeleton',
                  description: 'Placeholder durante carga inicial',
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      state: AppCameraPickerState.skeleton,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Estado Focus',
                  description: 'Resaltado para navegación por teclado',
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      state: AppCameraPickerState.focus,
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
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      variant: AppCameraPickerVariant.ios,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Variante Android',
                  description: 'UI estilo Android con BottomSheet',
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      variant: AppCameraPickerVariant.android,
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Variante Web',
                  description: 'UI optimizada para navegadores',
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      variant: AppCameraPickerVariant.web,
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
                  widget: const AppCameraPicker(
                    buttonText: 'Subir Archivo',
                    buttonIcon: Icons.cloud_upload,
                  ),
                ),
                _buildExample(
                  title: 'Colores Personalizados',
                  description: 'Paleta de colores customizada',
                  widget: AppCameraPicker(
                    config: AppCameraPickerConfig(
                      colors: const AppCameraPickerColors(
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
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      spacing: AppCameraPickerSpacing(
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
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      animation: AppCameraPickerAnimation(
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
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      fileType: AppCameraPickerFileType.video,
                      behavior: AppCameraPickerBehavior(
                        allowMultiple: true,
                        maxFiles: 3,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Calidad Personalizada',
                  description: 'Control de calidad de imagen',
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      behavior: AppCameraPickerBehavior(
                        allowMultiple: false,
                        maxFiles: 1,
                      ),
                    ),
                  ),
                ),
                _buildExample(
                  title: 'Con Callbacks Completos',
                  description: 'Manejo completo de eventos',
                  widget: AppCameraPicker(
                    onPicked: _onPicked,
                    onError: _onError,
                    onPermissionDenied: _onPermissionDenied,
                    onCancelled: _onCancelled,
                    config: const AppCameraPickerConfig(
                      behavior: AppCameraPickerBehavior(
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
                  widget: AppCameraPicker(
                    config: const AppCameraPickerConfig(
                      a11yConfig: AppCameraPickerA11yConfig(
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
                    child: const AppCameraPicker(
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
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estado Actual',
              style: AppTypography.h6,
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_selectedFiles.isNotEmpty) ...[
              Text(
                'Archivos seleccionados: ${_selectedFiles.length}',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.success,
                ),
              ),
              for (final file in _selectedFiles)
                Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.md, top: 4),
                  child: Text(
                    '• ${file.name} (${file.formattedSize})',
                    style: AppTypography.bodySmall,
                  ),
                ),
            ],
            if (_lastError != null)
              Text(
                'Error: $_lastError',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.error,
                ),
              ),
            if (_permissionDenied)
              Text(
                'Permisos denegados',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.warning,
                ),
              ),
            if (_cancelled)
              Text(
                'Operación cancelada',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.gray600,
                ),
              ),
            if (_selectedFiles.isEmpty && _lastError == null && !_permissionDenied && !_cancelled)
              Text(
                'Ningún archivo seleccionado',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.gray600,
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
          style: AppTypography.h5,
        ),
        const SizedBox(height: AppSpacing.md),
        ...children,
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  Widget _buildExample({
    required String title,
    required String description,
    required Widget widget,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.gray600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
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
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Formulario de Perfil',
              style: AppTypography.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Ejemplo de uso en un formulario real',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.gray600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Simulación de formulario
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Campo de foto de perfil
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foto de Perfil',
                  style: AppTypography.labelMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                AppCameraPicker(
                  buttonText: 'Seleccionar Foto',
                  buttonIcon: Icons.person,
                  onPicked: _onPicked,
                  onError: _onError,
                  config: const AppCameraPickerConfig(
                    fileType: AppCameraPickerFileType.image,
                    behavior: AppCameraPickerBehavior(
                      allowMultiple: false,
                      maxFiles: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

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