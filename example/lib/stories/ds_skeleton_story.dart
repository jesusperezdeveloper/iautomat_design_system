import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSSkeletonStory extends StatefulWidget {
  const DSSkeletonStory({super.key});

  @override
  State<DSSkeletonStory> createState() => _DSSkeletonStoryState();
}

class _DSSkeletonStoryState extends State<DSSkeletonStory> {
  DSSkeletonShape _selectedShape = DSSkeletonShape.rectangle;
  DSSkeletonState _selectedState = DSSkeletonState.skeleton;
  final DSSkeletonVariant _selectedVariant = DSSkeletonVariant.universal;
  double _width = 120;
  double _height = 80;
  bool _interactive = false;
  bool _showBorder = false;
  bool _showShadow = false;
  bool _shimmerEnabled = true;
  bool _pulseEnabled = false;
  bool _animationsEnabled = true;
  double _opacity = 0.8;
  double _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSSkeleton Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildConfigurationPanel(),
            const SizedBox(height: 24),
            _buildBasicExamples(),
            const SizedBox(height: 24),
            _buildShapeExamples(),
            const SizedBox(height: 24),
            _buildStateExamples(),
            const SizedBox(height: 24),
            _buildCompositeExamples(),
            const SizedBox(height: 24),
            _buildRealWorldExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigurationPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración Interactive',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildShapeSelector(),
                _buildStateSelector(),
                _buildDimensionControls(),
                _buildAnimationControls(),
                _buildBehaviorControls(),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Vista Previa',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Center(
              child: DSSkeleton(
                shape: _selectedShape,
                width: _width,
                height: _height,
                interactive: _interactive,
                config: DSSkeletonConfig(
                  variant: _selectedVariant,
                  state: _selectedState,
                  colors: DSSkeletonColors(
                    opacity: _opacity,
                  ),
                  spacing: DSSkeletonSpacing(
                    borderRadius: _borderRadius,
                  ),
                  animations: DSSkeletonAnimations(
                    enabled: _animationsEnabled,
                    shimmerEnabled: _shimmerEnabled,
                    pulseEnabled: _pulseEnabled,
                  ),
                  behavior: DSSkeletonBehavior(
                    showBorder: _showBorder,
                    showShadow: _showShadow,
                  ),
                ),
                onStateChanged: (state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Estado cambiado a: $state'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Forma'),
        const SizedBox(height: 8),
        DropdownButton<DSSkeletonShape>(
          value: _selectedShape,
          onChanged: (value) {
            setState(() {
              _selectedShape = value!;
              // Ajustar dimensiones automáticamente según la forma
              switch (value) {
                case DSSkeletonShape.circle:
                case DSSkeletonShape.avatar:
                  _width = 48;
                  _height = 48;
                  _borderRadius = 24;
                  break;
                case DSSkeletonShape.button:
                  _width = 120;
                  _height = 36;
                  _borderRadius = 8;
                  break;
                case DSSkeletonShape.card:
                  _width = 300;
                  _height = 200;
                  _borderRadius = 12;
                  break;
                case DSSkeletonShape.text:
                  _width = 200;
                  _height = 16;
                  _borderRadius = 4;
                  break;
                case DSSkeletonShape.line:
                  _width = 300;
                  _height = 1;
                  _borderRadius = 0;
                  break;
                default:
                  _width = 120;
                  _height = 80;
                  _borderRadius = 8;
              }
            });
          },
          items: DSSkeletonShape.values.map((shape) {
            return DropdownMenuItem(
              value: shape,
              child: Text(shape.name),
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
        const Text('Estado'),
        const SizedBox(height: 8),
        DropdownButton<DSSkeletonState>(
          value: _selectedState,
          onChanged: (value) {
            setState(() {
              _selectedState = value!;
            });
          },
          items: DSSkeletonState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDimensionControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dimensiones'),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Ancho: '),
                  Expanded(
                    child: Slider(
                      value: _width,
                      min: 20,
                      max: 400,
                      divisions: 38,
                      label: _width.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _width = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Alto: '),
                  Expanded(
                    child: Slider(
                      value: _height,
                      min: 1,
                      max: 300,
                      divisions: 299,
                      label: _height.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _height = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Radio: '),
                  Expanded(
                    child: Slider(
                      value: _borderRadius,
                      min: 0,
                      max: 50,
                      divisions: 50,
                      label: _borderRadius.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _borderRadius = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimationControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Animaciones'),
        const SizedBox(height: 8),
        Column(
          children: [
            CheckboxListTile(
              title: const Text('Animaciones'),
              value: _animationsEnabled,
              onChanged: (value) {
                setState(() {
                  _animationsEnabled = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Shimmer'),
              value: _shimmerEnabled,
              onChanged: (value) {
                setState(() {
                  _shimmerEnabled = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Pulso'),
              value: _pulseEnabled,
              onChanged: (value) {
                setState(() {
                  _pulseEnabled = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBehaviorControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Comportamiento'),
        const SizedBox(height: 8),
        Column(
          children: [
            CheckboxListTile(
              title: const Text('Interactivo'),
              value: _interactive,
              onChanged: (value) {
                setState(() {
                  _interactive = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Mostrar borde'),
              value: _showBorder,
              onChanged: (value) {
                setState(() {
                  _showBorder = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Mostrar sombra'),
              value: _showShadow,
              onChanged: (value) {
                setState(() {
                  _showShadow = value!;
                });
              },
            ),
            Row(
              children: [
                const Text('Opacidad: '),
                Expanded(
                  child: Slider(
                    value: _opacity,
                    min: 0.1,
                    max: 1.0,
                    divisions: 9,
                    label: _opacity.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _opacity = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBasicExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos Básicos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Text('Skeleton básico con configuración por defecto:'),
            const SizedBox(height: 8),
            const DSSkeleton(),
            const SizedBox(height: 16),
            const Text('Skeleton con dimensiones personalizadas:'),
            const SizedBox(height: 8),
            const DSSkeleton(
              width: 200,
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text('Skeleton con configuración personalizada:'),
            const SizedBox(height: 8),
            DSSkeleton(
              width: 150,
              height: 60,
              config: DSSkeletonConfig(
                colors: DSSkeletonColors(
                  backgroundColor: Colors.blue.shade100,
                  shimmerColor: Colors.blue.shade300,
                  opacity: 0.6,
                ),
                spacing: const DSSkeletonSpacing(
                  borderRadius: 16,
                ),
                behavior: const DSSkeletonBehavior(
                  showBorder: true,
                  showShadow: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos por Forma',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildShapeExample('Rectangle', const DSSkeleton.rectangle()),
                _buildShapeExample('Circle', const DSSkeleton.circle()),
                _buildShapeExample('Avatar', const DSSkeleton.avatar()),
                _buildShapeExample('Button', const DSSkeleton.button()),
                _buildShapeExample('Card', const DSSkeleton.card(width: 200, height: 120)),
                _buildShapeExample('Text', const DSSkeleton.text(width: 150)),
                _buildShapeExample('Line', const DSSkeleton.line(width: 200)),
                _buildShapeExample('Rounded Rectangle', const DSSkeleton.roundedRectangle()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeExample(String title, Widget skeleton) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 8),
        skeleton,
      ],
    );
  }

  Widget _buildStateExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos por Estado',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: DSSkeletonState.values.map((state) {
                return Column(
                  children: [
                    Text(state.name, style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 8),
                    DSSkeleton(
                      width: 100,
                      height: 60,
                      interactive: state == DSSkeletonState.hover ||
                                 state == DSSkeletonState.pressed ||
                                 state == DSSkeletonState.focus,
                      config: DSSkeletonConfig(state: state),
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

  Widget _buildCompositeExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos Compuestos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            const Text('Grupo de skeletons:'),
            const SizedBox(height: 8),
            const DSSkeletonGroup(
              children: [
                DSSkeleton.circle(width: 40, height: 40),
                DSSkeleton.text(width: 200, height: 16),
                DSSkeleton.text(width: 150, height: 12),
              ],
            ),

            const SizedBox(height: 16),
            const Text('Texto multilínea:'),
            const SizedBox(height: 8),
            const DSSkeletonText(
              lines: 4,
              lastLineWidthFactor: 0.7,
            ),

            const SizedBox(height: 16),
            const Text('Lista de elementos:'),
            const SizedBox(height: 8),
            const DSSkeletonList(
              itemCount: 3,
              itemHeight: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRealWorldExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos del Mundo Real',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            Text(
              'Perfil de Usuario',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  DSSkeleton.avatar(),
                  SizedBox(width: 16),
                  Expanded(
                    child: DSSkeletonGroup(
                      children: [
                        DSSkeleton.text(height: 20, width: 150),
                        DSSkeleton.text(height: 14, width: 100),
                        DSSkeleton.text(height: 12, width: 200),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Tarjeta de Producto',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              width: 250,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const DSSkeletonGroup(
                children: [
                  DSSkeleton.rectangle(width: double.infinity, height: 150),
                  DSSkeleton.text(height: 18, width: double.infinity),
                  DSSkeleton.text(height: 14, width: 180),
                  DSSkeleton.button(width: double.infinity),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Feed de Noticias',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(2, (index) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const DSSkeletonGroup(
                    children: [
                      DSSkeleton.circle(width: 32, height: 32),
                      DSSkeleton.text(height: 14, width: 120),
                      DSSkeleton.text(height: 12, width: 80),
                      DSSkeleton.text(height: 16, width: double.infinity),
                      DSSkeleton.text(height: 16, width: double.infinity),
                      DSSkeleton.text(height: 16, width: 200),
                      DSSkeleton.rectangle(width: double.infinity, height: 120),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}