import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class CardsDemoScreen extends StatefulWidget {
  const CardsDemoScreen({super.key});

  @override
  State<CardsDemoScreen> createState() => _CardsDemoScreenState();
}

class _CardsDemoScreenState extends State<CardsDemoScreen> {
  bool _isExpanded = false;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Cards Demo'),
        backRoute: '/components',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cards y Contenedores', style: DSTypography.h2),
            const SizedBox(height: 24),

            // Basic Cards Section
            _buildSection(
              'Cards Básicas',
              'Diferentes tipos de cards simples',
              _buildBasicCards(),
            ),

            // Media Cards Section
            _buildSection(
              'Cards con Media',
              'Cards con imágenes y contenido multimedia',
              _buildMediaCards(),
            ),

            // Interactive Cards Section
            _buildSection(
              'Cards Interactivas',
              'Cards con estados y acciones',
              _buildInteractiveCards(),
            ),

            // Specialized Cards Section
            _buildSection(
              'Cards Especializadas',
              'Cards para casos específicos',
              _buildSpecializedCards(),
            ),

            // Layout Cards Section
            _buildSection(
              'Layouts de Cards',
              'Diferentes disposiciones y tamaños',
              _buildLayoutCards(),
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
        content,
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildBasicCards() {
    return Column(
      children: [
        // Card básica
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Básica', style: DSTypography.h5),
                const SizedBox(height: 8),
                Text('Esta es una card básica con contenido simple.', style: DSTypography.bodyMedium),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Card elevada
        Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Elevada', style: DSTypography.h5),
                const SizedBox(height: 8),
                Text('Card con mayor elevación para destacar.', style: DSTypography.bodyMedium),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Card outlined
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Outlined', style: DSTypography.h5),
                const SizedBox(height: 8),
                Text('Card sin elevación con borde.', style: DSTypography.bodyMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaCards() {
    return Column(
      children: [
        // Card con imagen
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 64,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card con Imagen', style: DSTypography.h5),
                    const SizedBox(height: 8),
                    Text('Ejemplo de card con imagen de cabecera.', style: DSTypography.bodyMedium),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => _showResult('Acción secundaria'),
                          child: const Text('CANCELAR'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => _showResult('Acción principal'),
                          child: const Text('ACEPTAR'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Card horizontal
        Card(
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Icon(
                  Icons.music_note,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Card Horizontal', style: DSTypography.h6),
                      const SizedBox(height: 4),
                      Text('Subtítulo', style: DSTypography.bodySmall),
                      const SizedBox(height: 8),
                      Text('Contenido distribuido horizontalmente.', style: DSTypography.bodyMedium),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _showResult('Más opciones'),
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveCards() {
    return Column(
      children: [
        // Card seleccionable
        Card(
          color: _isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
          child: InkWell(
            onTap: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    _isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: _isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Seleccionable', style: DSTypography.h6),
                        const SizedBox(height: 4),
                        Text('Toca para seleccionar/deseleccionar', style: DSTypography.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Card expandible
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text('Card Expandible', style: DSTypography.h6),
                subtitle: const Text('Toca para expandir/contraer'),
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Text('Contenido expandido', style: DSTypography.h6),
                      const SizedBox(height: 8),
                      const Text('Este contenido se muestra cuando la card está expandida. Puede contener información adicional, formularios, o cualquier otro widget.'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Chip(label: const Text('Etiqueta 1')),
                          const SizedBox(width: 8),
                          Chip(label: const Text('Etiqueta 2')),
                        ],
                      ),
                    ],
                  ),
                ),
                crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Card con acciones
        Card(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimary),
                ),
                title: Text('Juan Pérez', style: DSTypography.h6),
                subtitle: const Text('Desarrollador Flutter'),
                trailing: IconButton(
                  onPressed: () => _showResult('Favorito'),
                  icon: const Icon(Icons.favorite_border),
                ),
              ),
              const Divider(),
              OverflowBar(
                children: [
                  TextButton.icon(
                    onPressed: () => _showResult('Llamar'),
                    icon: const Icon(Icons.call),
                    label: const Text('LLAMAR'),
                  ),
                  TextButton.icon(
                    onPressed: () => _showResult('Mensaje'),
                    icon: const Icon(Icons.message),
                    label: const Text('MENSAJE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecializedCards() {
    return Column(
      children: [
        // Card de estadísticas
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.trending_up, color: Colors.green),
                    const SizedBox(width: 8),
                    Text('Estadísticas', style: DSTypography.h6),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('1,234', style: DSTypography.h4.copyWith(color: Colors.green)),
                          Text('Ventas', style: DSTypography.bodySmall),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('567', style: DSTypography.h4.copyWith(color: Colors.blue)),
                          Text('Usuarios', style: DSTypography.bodySmall),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('89%', style: DSTypography.h4.copyWith(color: Colors.orange)),
                          Text('Satisfacción', style: DSTypography.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Card de notificación
        Card(
          color: Colors.amber.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.warning, color: Colors.amber.shade700),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Advertencia', style: DSTypography.h6.copyWith(color: Colors.amber.shade700)),
                      const SizedBox(height: 4),
                      const Text('Este es un mensaje de advertencia importante.'),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => _showResult('Cerrar advertencia'),
                  icon: Icon(Icons.close, color: Colors.amber.shade700),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Card de progreso
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Progreso del Proyecto', style: DSTypography.h6),
                    Text('75%', style: DSTypography.h6.copyWith(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: 0.75),
                const SizedBox(height: 8),
                Text('3 de 4 tareas completadas', style: DSTypography.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLayoutCards() {
    return Column(
      children: [
        // Grid de cards pequeñas
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download, size: 32, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 8),
                    Text('Downloads', style: DSTypography.bodyMedium, textAlign: TextAlign.center),
                    Text('1,234', style: DSTypography.h6),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, size: 32, color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(height: 8),
                    Text('Uploads', style: DSTypography.bodyMedium, textAlign: TextAlign.center),
                    Text('567', style: DSTypography.h6),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.storage, size: 32, color: Colors.green),
                    const SizedBox(height: 8),
                    Text('Storage', style: DSTypography.bodyMedium, textAlign: TextAlign.center),
                    Text('89 GB', style: DSTypography.h6),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.speed, size: 32, color: Colors.orange),
                    const SizedBox(height: 8),
                    Text('Speed', style: DSTypography.bodyMedium, textAlign: TextAlign.center),
                    Text('125 MB/s', style: DSTypography.h6),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Card con lista
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Lista de Elementos', style: DSTypography.h5),
              ),
              const Divider(),
              ...List.generate(3, (index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('Elemento ${index + 1}'),
                  subtitle: Text('Descripción del elemento ${index + 1}'),
                  trailing: IconButton(
                    onPressed: () => _showResult('Acción ${index + 1}'),
                    icon: const Icon(Icons.more_vert),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}