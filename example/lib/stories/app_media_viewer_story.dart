import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSMediaViewerStory extends StatefulWidget {
  const DSMediaViewerStory({super.key});

  @override
  State<DSMediaViewerStory> createState() => _DSMediaViewerStoryState();
}

class _DSMediaViewerStoryState extends State<DSMediaViewerStory> {
  DSMediaViewerVariant _variant = DSMediaViewerVariant.image;
  DSMediaViewerState _state = DSMediaViewerState.defaultState;
  int _initialIndex = 0;
  bool _showCaptions = true;
  bool _showControls = true;
  bool _showThumbnails = true;
  bool _isRtl = false;
  bool _enableA11y = true;
  bool _enableKeyboard = true;
  bool _autoHideControls = true;
  bool _enableZoom = true;
  bool _enableFullscreen = true;
  double _autoHideDelay = 3.0;
  double _thumbnailSize = 60.0;
  double _borderRadius = 12.0;

  String? _lastInteraction;

  // Datos de ejemplo
  static const List<DSMediaItem> _sampleImageItems = [
    DSMediaItem(
      type: DSMediaType.image,
      src: 'https://picsum.photos/800/600?random=1',
      caption: 'Imagen de ejemplo 1 - Paisaje natural',
      alt: 'Hermoso paisaje con montañas y lago',
      thumbnail: 'https://picsum.photos/100/100?random=1',
    ),
    DSMediaItem(
      type: DSMediaType.image,
      src: 'https://picsum.photos/800/600?random=2',
      caption: 'Imagen de ejemplo 2 - Arquitectura moderna',
      alt: 'Edificio moderno con líneas geométricas',
      thumbnail: 'https://picsum.photos/100/100?random=2',
    ),
    DSMediaItem(
      type: DSMediaType.image,
      src: 'https://picsum.photos/800/600?random=3',
      caption: 'Imagen de ejemplo 3 - Naturaleza urbana',
      alt: 'Parque urbano con árboles y senderos',
      thumbnail: 'https://picsum.photos/100/100?random=3',
    ),
  ];

  static const List<DSMediaItem> _sampleVideoItems = [
    DSMediaItem(
      type: DSMediaType.video,
      src: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      caption: 'Video de ejemplo 1 - Demostración',
      alt: 'Video demostrativo de funcionalidades',
      thumbnail: 'https://img.youtube.com/vi/dQw4w9WgXcQ/maxresdefault.jpg',
      duration: 212.0,
    ),
    DSMediaItem(
      type: DSMediaType.video,
      src: 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
      caption: 'Video de ejemplo 2 - Contenido educativo',
      alt: 'Video educativo sobre tecnología',
      duration: 30.0,
    ),
  ];

  static const List<DSMediaItem> _sampleAudioItems = [
    DSMediaItem(
      type: DSMediaType.audio,
      src: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
      caption: 'Audio de ejemplo 1 - Sonido de campana',
      alt: 'Sonido de campana repicando',
      duration: 5.0,
    ),
    DSMediaItem(
      type: DSMediaType.audio,
      src: 'https://www.soundjay.com/nature/sounds/wind.wav',
      caption: 'Audio de ejemplo 2 - Sonidos de la naturaleza',
      alt: 'Sonido del viento en el bosque',
      duration: 15.0,
    ),
  ];

  static const List<DSMediaItem> _sampleMixedItems = [
    DSMediaItem(
      type: DSMediaType.image,
      src: 'https://picsum.photos/800/600?random=4',
      caption: 'Imagen en colección mixta',
      alt: 'Imagen de muestra en colección mixta',
      thumbnail: 'https://picsum.photos/100/100?random=4',
    ),
    DSMediaItem(
      type: DSMediaType.video,
      src: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
      caption: 'Video en colección mixta',
      alt: 'Video de muestra en colección mixta',
      thumbnail: 'https://img.youtube.com/vi/9bZkp7q19f0/maxresdefault.jpg',
      duration: 600.0,
    ),
    DSMediaItem(
      type: DSMediaType.audio,
      src: 'https://www.soundjay.com/misc/sounds/beep-07a.wav',
      caption: 'Audio en colección mixta',
      alt: 'Audio de muestra en colección mixta',
      duration: 2.0,
    ),
  ];

  List<DSMediaItem> get _currentItems {
    switch (_variant) {
      case DSMediaViewerVariant.image:
        return _sampleImageItems;
      case DSMediaViewerVariant.video:
        return _sampleVideoItems;
      case DSMediaViewerVariant.audio:
        return _sampleAudioItems;
    }
  }

  void _handleMediaChanged(int index) {
    setState(() {
      _lastInteraction = 'Media cambiado a índice: $index';
    });
  }

  void _handleMediaTapped(int index) {
    setState(() {
      _lastInteraction = 'Media tocado en índice: $index';
    });
  }

  void _handleFullscreenToggle(bool isFullscreen) {
    setState(() {
      _lastInteraction = isFullscreen ? 'Fullscreen activado' : 'Fullscreen desactivado';
    });
  }

  void _handlePlayPause(bool isPlaying) {
    setState(() {
      _lastInteraction = isPlaying ? 'Reproducción iniciada' : 'Reproducción pausada';
    });
  }

  Widget _buildSampleViewer({required DSMediaViewerConfig config}) {
    return SizedBox(
      height: 400,
      child: DSMediaViewer(
        items: _currentItems,
        initialIndex: _initialIndex,
        showCaptions: _showCaptions,
        config: config,
        onPageChanged: _handleMediaChanged,
        onItemTap: (item) => _handleMediaTapped(_currentItems.indexOf(item)),
        onFullscreenToggle: () => _handleFullscreenToggle(true),
        onPlayPause: _handlePlayPause,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSMediaViewer Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Controles
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Controles',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),

                    // Variant
                    Row(
                      children: [
                        const Text('Variante: '),
                        const SizedBox(width: 8),
                        DropdownButton<DSMediaViewerVariant>(
                          value: _variant,
                          onChanged: (value) => setState(() {
                            _variant = value!;
                            _initialIndex = 0; // Reset index when changing variant
                          }),
                          items: DSMediaViewerVariant.values.map((variant) {
                            return DropdownMenuItem(
                              value: variant,
                              child: Text(variant.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // State
                    Row(
                      children: [
                        const Text('Estado: '),
                        const SizedBox(width: 8),
                        DropdownButton<DSMediaViewerState>(
                          value: _state,
                          onChanged: (value) => setState(() => _state = value!),
                          items: DSMediaViewerState.values.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.displayName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // Initial Index
                    Row(
                      children: [
                        const Text('Índice Inicial: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 100,
                          child: DropdownButton<int>(
                            value: _initialIndex,
                            onChanged: (value) => setState(() => _initialIndex = value!),
                            items: List.generate(_currentItems.length, (index) {
                              return DropdownMenuItem(
                                value: index,
                                child: Text('$index'),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),

                    // Auto Hide Delay
                    Row(
                      children: [
                        const Text('Delay Auto-ocultar: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _autoHideDelay,
                            min: 1.0,
                            max: 10.0,
                            divisions: 9,
                            label: '${_autoHideDelay.toStringAsFixed(0)}s',
                            onChanged: (value) =>
                                setState(() => _autoHideDelay = value),
                          ),
                        ),
                        Text('${_autoHideDelay.toStringAsFixed(0)}s'),
                      ],
                    ),

                    // Thumbnail Size
                    Row(
                      children: [
                        const Text('Tamaño Thumbnail: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _thumbnailSize,
                            min: 40.0,
                            max: 100.0,
                            divisions: 12,
                            label: '${_thumbnailSize.toStringAsFixed(0)}px',
                            onChanged: (value) =>
                                setState(() => _thumbnailSize = value),
                          ),
                        ),
                        Text('${_thumbnailSize.toStringAsFixed(0)}px'),
                      ],
                    ),

                    // Border Radius
                    Row(
                      children: [
                        const Text('Border Radius: '),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            value: _borderRadius,
                            min: 0.0,
                            max: 24.0,
                            divisions: 12,
                            label: '${_borderRadius.toStringAsFixed(0)}px',
                            onChanged: (value) =>
                                setState(() => _borderRadius = value),
                          ),
                        ),
                        Text('${_borderRadius.toStringAsFixed(0)}px'),
                      ],
                    ),

                    // Switches
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _showCaptions,
                              onChanged: (value) =>
                                  setState(() => _showCaptions = value),
                            ),
                            const Text('Subtítulos'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _showControls,
                              onChanged: (value) =>
                                  setState(() => _showControls = value),
                            ),
                            const Text('Controles'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _showThumbnails,
                              onChanged: (value) =>
                                  setState(() => _showThumbnails = value),
                            ),
                            const Text('Thumbnails'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _isRtl,
                              onChanged: (value) =>
                                  setState(() => _isRtl = value),
                            ),
                            const Text('RTL'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableA11y,
                              onChanged: (value) =>
                                  setState(() => _enableA11y = value),
                            ),
                            const Text('Accesibilidad'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableKeyboard,
                              onChanged: (value) =>
                                  setState(() => _enableKeyboard = value),
                            ),
                            const Text('Teclado'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _autoHideControls,
                              onChanged: (value) =>
                                  setState(() => _autoHideControls = value),
                            ),
                            const Text('Auto-ocultar'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableZoom,
                              onChanged: (value) =>
                                  setState(() => _enableZoom = value),
                            ),
                            const Text('Zoom'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: _enableFullscreen,
                              onChanged: (value) =>
                                  setState(() => _enableFullscreen = value),
                            ),
                            const Text('Fullscreen'),
                          ],
                        ),
                      ],
                    ),

                    if (_lastInteraction != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_lastInteraction!),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Viewer Configurable
            Text(
              'Media Viewer Configurable',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            _buildSampleViewer(
              config: DSMediaViewerConfig(
                variant: _variant,
                state: _state,
                showCaptions: _showCaptions,
                showControls: _showControls,
                allowZoom: _enableZoom,
                allowFullscreen: _enableFullscreen,
                behavior: DSMediaViewerBehavior(
                  autoHideControls: _autoHideControls,
                  autoHideControlsDelay: _autoHideDelay.toInt(),
                  enableDoubleTapZoom: _enableZoom,
                  enablePinchZoom: _enableZoom,
                ),
                controls: DSMediaViewerControls(
                  showPlayPause: _showControls,
                  showFullscreenButton: _enableFullscreen,
                ),
                a11yConfig: DSMediaViewerA11yConfig(
                  enabled: _enableA11y,
                  enableKeyboardNavigation: _enableKeyboard,
                ),
                spacing: DSMediaViewerSpacing(
                  borderRadius: _borderRadius,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Ejemplos Predefinidos
            Text(
              'Ejemplos Predefinidos',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Variantes
            _buildExampleSection(
              'Variantes por Tipo de Media',
              Column(
                children: [
                  _buildVariantExample('Galería de Imágenes', DSMediaViewerVariant.image, _sampleImageItems),
                  const SizedBox(height: 16),
                  _buildVariantExample('Reproductor de Video', DSMediaViewerVariant.video, _sampleVideoItems),
                  const SizedBox(height: 16),
                  _buildVariantExample('Reproductor de Audio', DSMediaViewerVariant.audio, _sampleAudioItems),
                ],
              ),
            ),

            // Estados
            _buildExampleSection(
              'Estados del Componente',
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: DSMediaViewerState.values.length,
                itemBuilder: (context, index) {
                  final state = DSMediaViewerState.values[index];
                  return _buildStateExample(state);
                },
              ),
            ),

            // Casos de Uso Especiales
            _buildExampleSection(
              'Casos de Uso Especiales',
              Column(
                children: [
                  _buildSpecialUseCase(
                    'Colección Mixta',
                    'Mezcla de imágenes, videos y audio',
                    _sampleMixedItems,
                  ),
                  const SizedBox(height: 16),
                  _buildSpecialUseCase(
                    'Modo Compacto',
                    'Viewer optimizado para espacios pequeños',
                    _sampleImageItems.take(2).toList(),
                    config: const DSMediaViewerConfig(
                      controls: DSMediaViewerControls(
                        showPlayPause: true,
                      ),
                      spacing: DSMediaViewerSpacing(
                        borderRadius: 8,
                      ),
                    ),
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  _buildSpecialUseCase(
                    'Modo Presentación',
                    'Fullscreen con controles mínimos',
                    _sampleImageItems,
                    config: const DSMediaViewerConfig(
                      behavior: DSMediaViewerBehavior(
                        autoHideControls: true,
                        autoHideControlsDelay: 1,
                      ),
                      controls: DSMediaViewerControls(
                        showPlayPause: true,
                        showFullscreenButton: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        child,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildVariantExample(String title, DSMediaViewerVariant variant, List<DSMediaItem> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: DSMediaViewer(
                items: items,
                initialIndex: 0,
                config: DSMediaViewerConfig(
                  variant: variant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExample(DSMediaViewerState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.displayName,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: DSMediaViewer(
                items: _sampleImageItems.take(1).toList(),
                config: DSMediaViewerConfig(
                  state: state,
                  controls: const DSMediaViewerControls(
                    showPlayPause: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialUseCase(
    String title,
    String description,
    List<DSMediaItem> items, {
    DSMediaViewerConfig? config,
    double height = 300,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: height,
              child: DSMediaViewer(
                items: items,
                config: config ?? const DSMediaViewerConfig(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}