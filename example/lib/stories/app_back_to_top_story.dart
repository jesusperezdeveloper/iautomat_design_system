import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppBackToTopStory extends StatefulWidget {
  const AppBackToTopStory({super.key});

  @override
  State<AppBackToTopStory> createState() => _AppBackToTopStoryState();
}

class _AppBackToTopStoryState extends State<AppBackToTopStory> {
  late ScrollController _scrollController;
  AppBackToTopState _selectedState = AppBackToTopState.defaultState;
  AppBackToTopPosition _selectedPosition = AppBackToTopPosition.bottomRight;
  AppBackToTopScrollBehavior _selectedScrollBehavior = AppBackToTopScrollBehavior.smooth;
  double _size = 56;
  double _iconSize = 24;
  double _borderRadius = 28;
  double _elevation = 8;
  double _showAfterPixels = 300;
  bool _autoHide = true;
  bool _showOnScrollUp = true;
  bool _hapticFeedback = true;
  bool _showTooltip = true;
  bool _smoothScrolling = true;
  bool _animationsEnabled = true;
  bool _fadeEnabled = true;
  bool _scaleEnabled = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBackToTop Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: _buildConfigurationPanel(),
              ),
              SliverToBoxAdapter(
                child: _buildBasicExamples(),
              ),
              SliverToBoxAdapter(
                child: _buildPositionExamples(),
              ),
              SliverToBoxAdapter(
                child: _buildStateExamples(),
              ),
              SliverToBoxAdapter(
                child: _buildBehaviorExamples(),
              ),
              SliverToBoxAdapter(
                child: _buildRealWorldExamples(),
              ),
              // Add lots of content to enable scrolling
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Contenido de prueba ${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ],
          ),
          AppBackToTop(
            scrollController: _scrollController,
            config: AppBackToTopConfig(
              state: _selectedState,
              spacing: AppBackToTopSpacing(
                size: _size,
                iconSize: _iconSize,
                borderRadius: _borderRadius,
                elevation: _elevation,
                position: _selectedPosition,
              ),
              animations: AppBackToTopAnimations(
                enabled: _animationsEnabled,
                fadeEnabled: _fadeEnabled,
                scaleEnabled: _scaleEnabled,
                scrollBehavior: _selectedScrollBehavior,
              ),
              behavior: AppBackToTopBehavior(
                showAfterPixels: _showAfterPixels,
                autoHide: _autoHide,
                showOnScrollUp: _showOnScrollUp,
                hapticFeedback: _hapticFeedback,
                showTooltip: _showTooltip,
                smoothScrolling: _smoothScrolling,
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Botón Back to Top presionado!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildConfigurationPanel() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Configuración Interactiva',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Haz scroll hacia abajo para ver el botón en acción',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildStateSelector(),
                  _buildPositionSelector(),
                  _buildScrollBehaviorSelector(),
                  _buildSizeControls(),
                  _buildBehaviorControls(),
                  _buildAnimationControls(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estado'),
        const SizedBox(height: 8),
        DropdownButton<AppBackToTopState>(
          value: _selectedState,
          onChanged: (value) {
            setState(() {
              _selectedState = value!;
            });
          },
          items: AppBackToTopState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPositionSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Posición'),
        const SizedBox(height: 8),
        DropdownButton<AppBackToTopPosition>(
          value: _selectedPosition,
          onChanged: (value) {
            setState(() {
              _selectedPosition = value!;
            });
          },
          items: AppBackToTopPosition.values.map((position) {
            return DropdownMenuItem(
              value: position,
              child: Text(position.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildScrollBehaviorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Comportamiento de Scroll'),
        const SizedBox(height: 8),
        DropdownButton<AppBackToTopScrollBehavior>(
          value: _selectedScrollBehavior,
          onChanged: (value) {
            setState(() {
              _selectedScrollBehavior = value!;
            });
          },
          items: AppBackToTopScrollBehavior.values.map((behavior) {
            return DropdownMenuItem(
              value: behavior,
              child: Text(behavior.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tamaño y Apariencia'),
        const SizedBox(height: 8),
        SizedBox(
          width: 250,
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Tamaño: '),
                  Expanded(
                    child: Slider(
                      value: _size,
                      min: 40,
                      max: 80,
                      divisions: 8,
                      label: _size.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _size = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Ícono: '),
                  Expanded(
                    child: Slider(
                      value: _iconSize,
                      min: 16,
                      max: 32,
                      divisions: 8,
                      label: _iconSize.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _iconSize = value;
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
                      max: 40,
                      divisions: 8,
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
              Row(
                children: [
                  const Text('Elevación: '),
                  Expanded(
                    child: Slider(
                      value: _elevation,
                      min: 0,
                      max: 16,
                      divisions: 8,
                      label: _elevation.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _elevation = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Mostrar después: '),
                  Expanded(
                    child: Slider(
                      value: _showAfterPixels,
                      min: 100,
                      max: 1000,
                      divisions: 9,
                      label: _showAfterPixels.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _showAfterPixels = value;
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

  Widget _buildBehaviorControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Comportamiento'),
        const SizedBox(height: 8),
        Column(
          children: [
            CheckboxListTile(
              title: const Text('Auto-ocultar'),
              value: _autoHide,
              onChanged: (value) {
                setState(() {
                  _autoHide = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Mostrar al hacer scroll hacia arriba'),
              value: _showOnScrollUp,
              onChanged: (value) {
                setState(() {
                  _showOnScrollUp = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Retroalimentación háptica'),
              value: _hapticFeedback,
              onChanged: (value) {
                setState(() {
                  _hapticFeedback = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Mostrar tooltip'),
              value: _showTooltip,
              onChanged: (value) {
                setState(() {
                  _showTooltip = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Scroll suave'),
              value: _smoothScrolling,
              onChanged: (value) {
                setState(() {
                  _smoothScrolling = value!;
                });
              },
            ),
          ],
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
              title: const Text('Animaciones habilitadas'),
              value: _animationsEnabled,
              onChanged: (value) {
                setState(() {
                  _animationsEnabled = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Animación de desvanecimiento'),
              value: _fadeEnabled,
              onChanged: (value) {
                setState(() {
                  _fadeEnabled = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Animación de escala'),
              value: _scaleEnabled,
              onChanged: (value) {
                setState(() {
                  _scaleEnabled = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBasicExamples() {
    return Card(
      margin: const EdgeInsets.all(16),
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
            const Text(
              'Configuración por defecto optimizada para web:',
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'El botón aparece en la esquina inferior derecha\ncuando haces scroll hacia abajo.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionExamples() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos de Posicionamiento',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: AppBackToTopPosition.values.map((position) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      position.name,
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExamples() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos de Estados',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: AppBackToTopState.values.map((state) {
                return Column(
                  children: [
                    Text(
                      state.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: state == AppBackToTopState.disabled
                              ? Colors.grey
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
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

  Widget _buildBehaviorExamples() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplos de Comportamiento',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comportamientos de Scroll:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      ...AppBackToTopScrollBehavior.values.map((behavior) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_upward, size: 16),
                              const SizedBox(width: 8),
                              Text(behavior.name),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRealWorldExamples() {
    return Card(
      margin: const EdgeInsets.all(16),
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
              'Configuración para Blog/Artículo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Posición: inferior derecha'),
                  Text('• Aparece después de 400px'),
                  Text('• Auto-ocultar después de 10 segundos'),
                  Text('• Scroll suave con curva easeOut'),
                  Text('• Tooltip habilitado'),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Configuración para E-commerce',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Posición: inferior centro'),
                  Text('• Aparece después de 300px'),
                  Text('• Visible solo al hacer scroll hacia arriba'),
                  Text('• Scroll instantáneo para navegación rápida'),
                  Text('• Sin auto-ocultar para facilitar compras'),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Configuración para Dashboard',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Posición: superior derecha'),
                  Text('• Aparece después de 200px'),
                  Text('• Tamaño más pequeño (40px)'),
                  Text('• Scroll con easeInOut para suavidad'),
                  Text('• Tooltip con instrucciones específicas'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}