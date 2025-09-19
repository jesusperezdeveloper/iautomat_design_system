import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/lightbox/app_lightbox.dart';
import 'package:iautomat_design_system/src/components/lightbox/app_lightbox_config.dart';

/// Story examples for DSLightbox component
///
/// This file provides interactive examples demonstrating:
/// - Zoom variant with single image
/// - Gallery variant with multiple images
/// - Different gestures and controls
/// - Loading and error states
/// - Custom configurations
/// - Accessibility features
/// - RTL support
class LightboxStoryPage extends StatefulWidget {
  const LightboxStoryPage({super.key});

  @override
  State<LightboxStoryPage> createState() => _LightboxStoryPageState();
}

class _LightboxStoryPageState extends State<LightboxStoryPage> {
  bool _isZoomLightboxVisible = false;
  bool _isGalleryLightboxVisible = false;
  bool _isLoadingLightboxVisible = false;
  bool _isCustomLightboxVisible = false;
  int _currentIndex = 0;

  static const List<DSLightboxImage> _galleryImages = [
    DSLightboxImage(
      id: 'image_1',
      imageProvider: NetworkImage('https://picsum.photos/800/600?random=1'),
      title: 'Imagen de Paisaje 1',
      description: 'Una hermosa vista de montañas al atardecer',
      alt: 'Paisaje montañoso con atardecer dorado',
    ),
    DSLightboxImage(
      id: 'image_2',
      imageProvider: NetworkImage('https://picsum.photos/800/600?random=2'),
      title: 'Imagen de Paisaje 2',
      description: 'Bosque verde con un río serpenteante',
      alt: 'Bosque frondoso atravesado por un río',
    ),
    DSLightboxImage(
      id: 'image_3',
      imageProvider: NetworkImage('https://picsum.photos/800/600?random=3'),
      title: 'Imagen de Paisaje 3',
      description: 'Costa oceánica con acantilados rocosos',
      alt: 'Acantilados rocosos frente al océano azul',
    ),
    DSLightboxImage(
      id: 'image_4',
      imageProvider: NetworkImage('https://picsum.photos/800/600?random=4'),
      title: 'Imagen de Paisaje 4',
      description: 'Campo de flores silvestres en primavera',
      alt: 'Campo colorido lleno de flores silvestres',
    ),
  ];

  static const DSLightboxImage _singleImage = DSLightboxImage(
    id: 'single_image',
    imageProvider: NetworkImage('https://picsum.photos/1200/800?random=5'),
    title: 'Imagen Principal',
    description: 'Imagen para demostrar el modo zoom',
    alt: 'Imagen de demostración para lightbox zoom',
  );

  static const DSLightboxImage _loadingImage = DSLightboxImage(
    id: 'loading_image',
    imageProvider: NetworkImage('https://httpstat.us/200?sleep=5000'),
    title: 'Imagen Cargando',
    description: 'Esta imagen simula una carga lenta',
    alt: 'Imagen que simula carga lenta',
    isLoading: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSLightbox Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStorySection(
                  'Lightbox Zoom',
                  'Lightbox con una sola imagen y capacidades de zoom',
                  [
                    _buildDemoCard(
                      'Zoom Básico',
                      'Lightbox simple con zoom y controles básicos',
                      _buildImagePreview(_singleImage),
                      () => setState(() => _isZoomLightboxVisible = true),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildStorySection(
                  'Lightbox Gallery',
                  'Galería de imágenes con navegación y miniaturas',
                  [
                    _buildDemoCard(
                      'Galería Completa',
                      'Galería con navegación, contador y miniaturas',
                      _buildGalleryPreview(),
                      () => setState(() => _isGalleryLightboxVisible = true),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildStorySection(
                  'Estados Especiales',
                  'Lightbox en diferentes estados (loading, error, etc.)',
                  [
                    _buildDemoCard(
                      'Estado Loading',
                      'Lightbox mostrando indicador de carga',
                      _buildImagePreview(_loadingImage),
                      () => setState(() => _isLoadingLightboxVisible = true),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildStorySection(
                  'Configuración Personalizada',
                  'Lightbox con configuración personalizada de colores y controles',
                  [
                    _buildDemoCard(
                      'Estilo Personalizado',
                      'Lightbox con colores personalizados y controles modificados',
                      _buildImagePreview(_singleImage),
                      () => setState(() => _isCustomLightboxVisible = true),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Lightbox Zoom
          if (_isZoomLightboxVisible)
            DSLightbox(
              config: const DSLightboxConfig(
                variant: DSLightboxVariant.zoom,
                enableCounter: false,
                enableThumbnails: false,
              ),
              images: [_singleImage],
              onClose: () => setState(() => _isZoomLightboxVisible = false),
            ),

          // Lightbox Gallery
          if (_isGalleryLightboxVisible)
            DSLightbox(
              config: DSLightboxConfig(
                variant: DSLightboxVariant.gallery,
                initialIndex: _currentIndex,
                enableCounter: true,
                enableThumbnails: true,
                enableZoom: true,
              ),
              images: _galleryImages,
              onClose: () => setState(() => _isGalleryLightboxVisible = false),
              onIndexChanged: (index) => setState(() => _currentIndex = index),
            ),

          // Lightbox Loading
          if (_isLoadingLightboxVisible)
            DSLightbox(
              config: const DSLightboxConfig(
                variant: DSLightboxVariant.zoom,
                state: DSLightboxState.loading,
              ),
              images: [_loadingImage],
              onClose: () => setState(() => _isLoadingLightboxVisible = false),
            ),

          // Lightbox Personalizado
          if (_isCustomLightboxVisible)
            DSLightbox(
              config: DSLightboxConfig(
                variant: DSLightboxVariant.zoom,
                colors: const DSLightboxColors(
                  backgroundColor: Color(0xFF1A1A1A),
                  overlayColor: Color(0x99000000),
                  controlsColor: Color(0xFFFFFFFF),
                  closeButtonColor: Color(0xFFFF5722),
                ),
                controls: const DSLightboxControls(
                  showZoomControls: true,
                  autoHideControls: false,
                ),
                animation: const DSLightboxAnimation(
                  fadeInDuration: Duration(milliseconds: 500),
                  enableZoomTransition: true,
                ),
              ),
              images: [_singleImage],
              onClose: () => setState(() => _isCustomLightboxVisible = false),
            ),
        ],
      ),
    );
  }

  Widget _buildStorySection(String title, String description, List<Widget> demos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        ...demos,
      ],
    );
  }

  Widget _buildDemoCard(
    String title,
    String description,
    Widget preview,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.launch, size: 20),
                ],
              ),
              const SizedBox(height: 12),
              preview,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview(DSLightboxImage image) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: image.imageProvider,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.onErrorContainer,
                size: 32,
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGalleryPreview() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _galleryImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: index < _galleryImages.length - 1 ? 8 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: _galleryImages[index].imageProvider,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      size: 24,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Example of how to use DSLightbox in a real application
class LightboxStoryExample extends StatelessWidget {
  const LightboxStoryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const LightboxStoryPage();
  }
}