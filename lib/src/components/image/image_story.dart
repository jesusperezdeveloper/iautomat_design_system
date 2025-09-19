import 'package:flutter/material.dart';

import 'package:iautomat_design_system/src/components/image/ds_image.dart';
import 'package:iautomat_design_system/src/components/image/ds_image_config.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

/// Stories y ejemplos para el componente DSImage
///
/// Esta clase proporciona ejemplos de uso del DSImage para:
/// - Diferentes variantes (responsive, lazy)
/// - Todos los estados (default, hover, pressed, focus, selected, disabled, loading, skeleton)
/// - Diferentes tamaños y configuraciones
/// - Ejemplos de accesibilidad y RTL
/// - Casos de uso comunes en aplicaciones
class DSImageStory extends StatefulWidget {
  const DSImageStory({super.key});

  @override
  State<DSImageStory> createState() => _DSImageStoryState();
}

class _DSImageStoryState extends State<DSImageStory> {
  DSImageState _selectedState = DSImageState.defaultState;
  DSImageVariant _selectedVariant = DSImageVariant.responsive;
  BoxFit _selectedFit = BoxFit.cover;
  double _selectedRatio = 16.0 / 9.0;
  bool _showElevation = false;
  bool _showBorder = false;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSImage Stories',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DSImage Examples'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(DSSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildControlPanel(),
              const SizedBox(height: DSSpacing.lg),
              _buildExampleSection(),
              const SizedBox(height: DSSpacing.xl),
              _buildAllStatesSection(),
              const SizedBox(height: DSSpacing.xl),
              _buildAllVariantsSection(),
              const SizedBox(height: DSSpacing.xl),
              _buildDifferentSizesSection(),
              const SizedBox(height: DSSpacing.xl),
              _buildInteractiveExamplesSection(),
              const SizedBox(height: DSSpacing.xl),
              _buildResponsiveExamplesSection(),
              const SizedBox(height: DSSpacing.xl),
              _buildAccessibilityExamplesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DSSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control Panel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: DSSpacing.sm),
            Wrap(
              spacing: DSSpacing.md,
              runSpacing: DSSpacing.sm,
              children: [
                _buildStateSelector(),
                _buildVariantSelector(),
                _buildFitSelector(),
                _buildRatioSelector(),
                _buildToggleControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estado:', style: TextStyle(fontWeight: FontWeight.w500)),
        DropdownButton<DSImageState>(
          value: _selectedState,
          onChanged: (value) => setState(() => _selectedState = value!),
          items: DSImageState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.displayName),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildVariantSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Variante:', style: TextStyle(fontWeight: FontWeight.w500)),
        DropdownButton<DSImageVariant>(
          value: _selectedVariant,
          onChanged: (value) => setState(() => _selectedVariant = value!),
          items: DSImageVariant.values.map((variant) {
            return DropdownMenuItem(
              value: variant,
              child: Text(variant.displayName),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFitSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Fit:', style: TextStyle(fontWeight: FontWeight.w500)),
        DropdownButton<BoxFit>(
          value: _selectedFit,
          onChanged: (value) => setState(() => _selectedFit = value!),
          items: BoxFit.values.map((fit) {
            return DropdownMenuItem(
              value: fit,
              child: Text(fit.toString().split('.').last),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRatioSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Ratio:', style: TextStyle(fontWeight: FontWeight.w500)),
        DropdownButton<double>(
          value: _selectedRatio,
          onChanged: (value) => setState(() => _selectedRatio = value!),
          items: const [
            DropdownMenuItem(value: 1.0, child: Text('1:1')),
            DropdownMenuItem(value: 4.0 / 3.0, child: Text('4:3')),
            DropdownMenuItem(value: 16.0 / 9.0, child: Text('16:9')),
            DropdownMenuItem(value: 21.0 / 9.0, child: Text('21:9')),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: const Text('Elevación'),
          value: _showElevation,
          onChanged: (value) => setState(() => _showElevation = value!),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: const Text('Borde'),
          value: _showBorder,
          onChanged: (value) => setState(() => _showBorder = value!),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }

  Widget _buildExampleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejemplo Principal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        Center(
          child: DSImage(
            src: 'https://picsum.photos/400/300',
            alt: 'Imagen de ejemplo principal',
            width: 300,
            ratio: _selectedRatio,
            fit: _selectedFit,
            config: DSImageConfig(
              src: 'https://picsum.photos/400/300',
              variant: _selectedVariant,
              state: _selectedState,
              elevation: _showElevation
                  ? const DSImageElevation(defaultElevation: 8.0)
                  : null,
              spacing: _showBorder
                  ? const DSImageSpacing(
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                    )
                  : null,
              colors: _showBorder
                  ? const DSImageColors(borderColor: DSColors.primary)
                  : null,
            ),
            placeholder: _buildPlaceholder('Principal', 300, 300 / _selectedRatio),
            onTap: () => _showSnackBar('¡Imagen principal tocada!'),
          ),
        ),
      ],
    );
  }

  Widget _buildAllStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Todos los Estados',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: DSSpacing.md,
          runSpacing: DSSpacing.md,
          children: DSImageState.values.map((state) {
            return Column(
              children: [
                DSImage(
                  src: 'https://picsum.photos/200/150?random=${state.index}',
                  alt: 'Imagen en estado ${state.displayName}',
                  width: 120,
                  height: 90,
                  config: DSImageConfig(
                    src: 'https://picsum.photos/200/150?random=${state.index}',
                    state: state,
                  ),
                  placeholder: _buildPlaceholder(state.displayName, 120, 90),
                ),
                const SizedBox(height: DSSpacing.xs),
                Text(
                  state.displayName,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAllVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Todas las Variantes',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        Row(
          children: DSImageVariant.values.map((variant) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: DSSpacing.sm),
                child: Column(
                  children: [
                    DSImage(
                      src: 'https://picsum.photos/300/200?random=${variant.index + 10}',
                      alt: 'Imagen ${variant.displayName}',
                      width: 150,
                      height: 100,
                      config: DSImageConfig(
                        src: 'https://picsum.photos/300/200?random=${variant.index + 10}',
                        variant: variant,
                      ),
                      placeholder: _buildPlaceholder(variant.displayName, 150, 100),
                    ),
                    const SizedBox(height: DSSpacing.xs),
                    Text(
                      variant.displayName,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      variant.description,
                      style: const TextStyle(fontSize: 11),
                      textAlign: TextAlign.center,
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

  Widget _buildDifferentSizesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Diferentes Tamaños',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSizeExample('Pequeño', 64, 64),
            _buildSizeExample('Mediano', 120, 120),
            _buildSizeExample('Grande', 200, 200),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeExample(String label, double width, double height) {
    return Column(
      children: [
        DSImage(
          src: 'https://picsum.photos/${width.toInt()}/${height.toInt()}?random=${label.hashCode}',
          alt: 'Imagen $label',
          width: width,
          height: height,
          config: const DSImageConfig(
            src: '',
            spacing: DSImageSpacing(borderRadius: 12.0),
          ),
          placeholder: _buildPlaceholder(label, width, height),
        ),
        const SizedBox(height: DSSpacing.xs),
        Text(label, style: const TextStyle(fontSize: 12)),
        Text('${width.toInt()}x${height.toInt()}', style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildInteractiveExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejemplos Interactivos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: DSSpacing.md,
          runSpacing: DSSpacing.md,
          children: [
            _buildInteractiveExample(
              'Tap',
              'https://picsum.photos/150/150?random=30',
              onTap: () => _showSnackBar('¡Tap!'),
            ),
            _buildInteractiveExample(
              'Long Press',
              'https://picsum.photos/150/150?random=31',
              onLongPress: () => _showSnackBar('¡Long Press!'),
            ),
            _buildInteractiveExample(
              'Hover & Focus',
              'https://picsum.photos/150/150?random=32',
              onTap: () => _showSnackBar('¡Hover & Focus!'),
              onHover: (hovering) => _showSnackBar(hovering ? 'Hover ON' : 'Hover OFF'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveExample(
    String label,
    String src, {
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
  }) {
    return Column(
      children: [
        DSImage(
          src: src,
          alt: 'Imagen $label',
          width: 120,
          height: 120,
          onTap: onTap,
          onLongPress: onLongPress,
          onHover: onHover,
          config: const DSImageConfig(
            src: '',
            spacing: DSImageSpacing(borderRadius: 8.0),
            elevation: DSImageElevation(
              defaultElevation: 2.0,
              hoveredElevation: 8.0,
            ),
          ),
          placeholder: _buildPlaceholder(label, 120, 120),
        ),
        const SizedBox(height: DSSpacing.xs),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildResponsiveExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejemplos Responsivos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        DSImage(
          src: 'https://picsum.photos/800/400?random=40',
          alt: 'Imagen responsiva',
          ratio: 2.0,
          config: const DSImageConfig(
            src: 'https://picsum.photos/800/400?random=40',
            variant: DSImageVariant.responsive,
            responsiveConfig: DSImageResponsiveConfig(
              mobile: DSImageBreakpointConfig(quality: 60),
              tablet: DSImageBreakpointConfig(quality: 80),
              desktop: DSImageBreakpointConfig(quality: 90),
            ),
          ),
          placeholder: Container(
            color: DSColors.gray100,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: 48, color: DSColors.gray400),
                  SizedBox(height: DSSpacing.xs),
                  Text('Imagen Responsiva', style: TextStyle(color: DSColors.gray600)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccessibilityExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejemplos de Accesibilidad',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DSSpacing.md),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  DSImage(
                    src: 'https://picsum.photos/200/150?random=50',
                    alt: 'Imagen con descripción completa para lectores de pantalla',
                    width: 150,
                    height: 112,
                    config: const DSImageConfig(
                      src: 'https://picsum.photos/200/150?random=50',
                      a11yConfig: DSImageA11yConfig(
                        semanticsLabel: 'Imagen de paisaje',
                        semanticsDescription: 'Una hermosa vista de montañas al atardecer',
                        semanticsHint: 'Toca dos veces para ver en pantalla completa',
                      ),
                    ),
                    placeholder: _buildPlaceholder('A11y', 150, 112),
                    onTap: () => _showSnackBar('Imagen accesible tocada'),
                  ),
                  const SizedBox(height: DSSpacing.xs),
                  const Text('Con A11y', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(width: DSSpacing.md),
            Expanded(
              child: Column(
                children: [
                  DSImage(
                    src: 'https://picsum.photos/200/150?random=51',
                    alt: '',
                    width: 150,
                    height: 112,
                    config: const DSImageConfig(
                      src: 'https://picsum.photos/200/150?random=51',
                      a11yConfig: DSImageA11yConfig(
                        isDecorative: true,
                      ),
                    ),
                    placeholder: _buildPlaceholder('Decorativa', 150, 112),
                  ),
                  const SizedBox(height: DSSpacing.xs),
                  const Text('Decorativa', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPlaceholder(String label, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: _isDarkMode ? DSColors.gray800 : DSColors.gray100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: width < 100 ? 24 : 48,
              color: _isDarkMode ? DSColors.gray300 : DSColors.gray400,
            ),
            if (width >= 100) ...[
              const SizedBox(height: DSSpacing.xs),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: _isDarkMode ? DSColors.gray300 : DSColors.gray600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/// Widget de ejemplo para mostrar una galería de imágenes
class DSImageGalleryExample extends StatelessWidget {
  const DSImageGalleryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería de Imágenes')),
      body: GridView.builder(
        padding: const EdgeInsets.all(DSSpacing.md),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: DSSpacing.md,
          mainAxisSpacing: DSSpacing.md,
          childAspectRatio: 1.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return DSImage(
            src: 'https://picsum.photos/300/300?random=$index',
            alt: 'Imagen de galería $index',
            config: const DSImageConfig(
              src: '',
              variant: DSImageVariant.lazy,
              spacing: DSImageSpacing(borderRadius: 12.0),
              elevation: DSImageElevation(
                defaultElevation: 2.0,
                hoveredElevation: 8.0,
              ),
              animation: DSImageAnimation(
                type: DSImageAnimationType.fade,
                enableFadeIn: true,
              ),
            ),
            onTap: () => _showImageDialog(context, index),
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: DSImage(
          src: 'https://picsum.photos/600/600?random=$index',
          alt: 'Imagen ampliada $index',
          config: const DSImageConfig(
            src: '',
            spacing: DSImageSpacing(borderRadius: 12.0),
          ),
        ),
      ),
    );
  }
}

/// Widget de ejemplo para mostrar el uso del DSImage en una lista
class DSImageListExample extends StatelessWidget {
  const DSImageListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista con Imágenes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(DSSpacing.sm),
        itemCount: 50,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: DSSpacing.xs),
            child: ListTile(
              leading: DSImage(
                src: 'https://picsum.photos/100/100?random=${index + 100}',
                alt: 'Avatar $index',
                width: 48,
                height: 48,
                config: const DSImageConfig(
                  src: '',
                  variant: DSImageVariant.lazy,
                  spacing: DSImageSpacing(borderRadius: 24.0),
                ),
              ),
              title: Text('Elemento $index'),
              subtitle: Text('Descripción del elemento $index'),
            ),
          );
        },
      ),
    );
  }
}