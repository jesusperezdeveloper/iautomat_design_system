import 'package:flutter/material.dart';

import 'kanban_config.dart';
import 'ds_kanban.dart';

/// Story configurations para demostrar el componente DSKanban
///
/// Incluye ejemplos básicos y avanzados de tableros Kanban con:
/// - Configuraciones básicas y complejas
/// - Diferentes tipos de tarjetas
/// - Funcionalidad drag & drop
/// - Estados y prioridades
/// - Personalización visual
class KanbanStory {
  /// Historia básica con configuración simple
  static Widget basic() {
    return DSKanban(
      config: _basicConfig(),
    );
  }

  /// Historia con múltiples columnas y tarjetas
  static Widget complete() {
    return DSKanban(
      config: _completeConfig(),
      onChanged: () => debugPrint('Kanban changed'),
    );
  }

  /// Historia con tarjetas personalizadas
  static Widget customCards() {
    return DSKanban(
      config: _customCardsConfig(),
    );
  }

  /// Historia con estilo personalizado
  static Widget styled() {
    return DSKanban(
      config: _styledConfig(),
    );
  }

  // Configuraciones privadas

  static DSKanbanConfig _basicConfig() {
    return DSKanbanConfig(
      variant: DSKanbanVariant.dragDrop,
      columns: [
        DSKanbanColumn(
          id: 'todo',
          title: 'Por Hacer',
          icon: Icons.assignment_outlined,
        ),
        DSKanbanColumn(
          id: 'inprogress',
          title: 'En Progreso',
          icon: Icons.play_circle_outline,
        ),
        DSKanbanColumn(
          id: 'done',
          title: 'Completado',
          icon: Icons.check_circle_outline,
        ),
      ],
      cards: [
        DSKanbanCard(
          id: 'card-1',
          title: 'Diseñar interfaz de usuario',
          columnId: 'todo',
        ),
        DSKanbanCard(
          id: 'card-2',
          title: 'Implementar API REST',
          columnId: 'inprogress',
        ),
        DSKanbanCard(
          id: 'card-3',
          title: 'Configurar base de datos',
          columnId: 'done',
        ),
      ],
      onMove: (cardId, fromColumn, toColumn, index) {
        debugPrint('Moved $cardId from $fromColumn to $toColumn at $index');
      },
    );
  }

  static DSKanbanConfig _completeConfig() {
    return DSKanbanConfig(
      variant: DSKanbanVariant.dragDrop,
      columns: [
        DSKanbanColumn(
          id: 'backlog',
          title: 'Backlog',
          icon: Icons.inventory_2_outlined,
          backgroundColor: Colors.blue.shade50,
        ),
        DSKanbanColumn(
          id: 'todo',
          title: 'Por Hacer',
          icon: Icons.assignment_outlined,
          backgroundColor: Colors.orange.shade50,
        ),
        DSKanbanColumn(
          id: 'inprogress',
          title: 'En Progreso',
          icon: Icons.play_circle_outline,
          backgroundColor: Colors.yellow.shade50,
        ),
        DSKanbanColumn(
          id: 'review',
          title: 'En Revisión',
          icon: Icons.rate_review_outlined,
          backgroundColor: Colors.purple.shade50,
        ),
        DSKanbanColumn(
          id: 'done',
          title: 'Completado',
          icon: Icons.check_circle_outline,
          backgroundColor: Colors.green.shade50,
        ),
      ],
      cards: [
        DSKanbanCard(
          id: 'card-1',
          title: 'Implementar autenticación de usuarios',
          description: 'Crear sistema de login/registro con JWT',
          columnId: 'backlog',
          type: DSKanbanCardType.feature,
          priority: DSKanbanCardPriority.high,
          tags: ['backend', 'seguridad'],
          dueDate: DateTime.now().add(const Duration(days: 7)),
        ),
        DSKanbanCard(
          id: 'card-2',
          title: 'Diseñar dashboard principal',
          description: 'Crear mockups y prototipos de la página principal',
          columnId: 'todo',
          type: DSKanbanCardType.task,
          priority: DSKanbanCardPriority.medium,
          tags: ['frontend', 'ui'],
          dueDate: DateTime.now().add(const Duration(days: 3)),
        ),
        DSKanbanCard(
          id: 'card-3',
          title: 'Configurar pipeline CI/CD',
          description: 'Automatizar deploy a staging y producción',
          columnId: 'inprogress',
          type: DSKanbanCardType.task,
          priority: DSKanbanCardPriority.high,
          tags: ['devops', 'automatización'],
          dueDate: DateTime.now().add(const Duration(days: 1)),
        ),
        DSKanbanCard(
          id: 'card-4',
          title: 'Corregir bug en validación de formularios',
          description: 'Los campos no se validan correctamente en Chrome',
          columnId: 'review',
          type: DSKanbanCardType.bug,
          priority: DSKanbanCardPriority.critical,
          tags: ['bug', 'frontend'],
          dueDate: DateTime.now().subtract(const Duration(days: 1)),
        ),
        DSKanbanCard(
          id: 'card-5',
          title: 'Documentar API endpoints',
          description: 'Actualizar documentación con Swagger',
          columnId: 'done',
          type: DSKanbanCardType.task,
          priority: DSKanbanCardPriority.low,
          tags: ['documentación', 'api'],
          dueDate: DateTime.now().subtract(const Duration(days: 3)),
        ),
      ],
      onMove: (cardId, fromColumn, toColumn, index) {
        debugPrint('Task $cardId moved from $fromColumn to $toColumn');
      },
    );
  }

  static DSKanbanConfig _customCardsConfig() {
    return DSKanbanConfig(
      variant: DSKanbanVariant.dragDrop,
      columns: [
        DSKanbanColumn(
          id: 'new',
          title: 'Nuevas Ideas',
          icon: Icons.lightbulb_outline,
        ),
        DSKanbanColumn(
          id: 'development',
          title: 'Desarrollo',
          icon: Icons.code,
        ),
        DSKanbanColumn(
          id: 'testing',
          title: 'Testing',
          icon: Icons.bug_report_outlined,
        ),
        DSKanbanColumn(
          id: 'released',
          title: 'Publicado',
          icon: Icons.rocket_launch_outlined,
        ),
      ],
      cards: [
        DSKanbanCard(
          id: 'epic-1',
          title: 'Rediseño completo de la aplicación',
          description:
              'Modernizar la interfaz y mejorar la experiencia de usuario',
          columnId: 'new',
          type: DSKanbanCardType.epic,
          priority: DSKanbanCardPriority.high,
          tags: ['epic', 'ui/ux', 'frontend'],
          backgroundColor: Colors.purple.shade100,
        ),
        DSKanbanCard(
          id: 'feature-1',
          title: 'Sistema de notificaciones push',
          description: 'Implementar notificaciones en tiempo real',
          columnId: 'development',
          type: DSKanbanCardType.feature,
          priority: DSKanbanCardPriority.medium,
          tags: ['feature', 'realtime'],
          backgroundColor: Colors.blue.shade100,
        ),
        DSKanbanCard(
          id: 'bug-1',
          title: 'Optimizar performance en mobile',
          description: 'La app es lenta en dispositivos Android antiguos',
          columnId: 'testing',
          type: DSKanbanCardType.bug,
          priority: DSKanbanCardPriority.critical,
          tags: ['performance', 'mobile'],
          backgroundColor: Colors.red.shade100,
        ),
        DSKanbanCard(
          id: 'story-1',
          title: 'Como usuario quiero exportar datos',
          description: 'Permitir export en formato CSV y PDF',
          columnId: 'released',
          type: DSKanbanCardType.story,
          priority: DSKanbanCardPriority.low,
          tags: ['export', 'csv', 'pdf'],
          backgroundColor: Colors.green.shade100,
        ),
      ],
      onMove: (cardId, fromColumn, toColumn, index) {
        debugPrint('Card $cardId moved to $toColumn');
      },
    );
  }

  static DSKanbanConfig _styledConfig() {
    return DSKanbanConfig(
      variant: DSKanbanVariant.dragDrop,
      padding: const EdgeInsets.all(24),
      backgroundColor: Colors.grey.shade100,
      columns: [
        DSKanbanColumn(
          id: 'ideas',
          title: 'Ideas',
          icon: Icons.lightbulb,
          backgroundColor: Colors.yellow.shade100,
        ),
        DSKanbanColumn(
          id: 'working',
          title: 'Trabajando',
          icon: Icons.work,
          backgroundColor: Colors.blue.shade100,
        ),
        DSKanbanColumn(
          id: 'finished',
          title: 'Finalizado',
          icon: Icons.done_all,
          backgroundColor: Colors.green.shade100,
        ),
      ],
      cards: [
        DSKanbanCard(
          id: 'styled-1',
          title: 'Tarjeta con estilo personalizado',
          description: 'Esta tarjeta tiene un diseño único',
          columnId: 'ideas',
          backgroundColor: Colors.white,
        ),
        DSKanbanCard(
          id: 'styled-2',
          title: 'Otra tarjeta estilizada',
          description: 'Con diferentes colores y sombras',
          columnId: 'working',
          backgroundColor: Colors.blue.shade50,
        ),
        DSKanbanCard(
          id: 'styled-3',
          title: 'Tarjeta terminada',
          description: 'Con estilo de completado',
          columnId: 'finished',
          backgroundColor: Colors.green.shade50,
        ),
      ],
      onMove: (cardId, fromColumn, toColumn, index) {
        debugPrint('Styled card $cardId moved to $toColumn');
      },
    );
  }
}

/// Widget de ejemplo que muestra diferentes configuraciones del Kanban
class KanbanStoryExample extends StatefulWidget {
  const KanbanStoryExample({super.key});

  @override
  State<KanbanStoryExample> createState() => _KanbanStoryExampleState();
}

class _KanbanStoryExampleState extends State<KanbanStoryExample> {
  int _selectedStory = 0;

  final List<({String name, Widget Function() builder})> _stories = [
    (name: 'Básico', builder: KanbanStory.basic),
    (name: 'Completo', builder: KanbanStory.complete),
    (name: 'Tarjetas Personalizadas', builder: KanbanStory.customCards),
    (name: 'Estilizado', builder: KanbanStory.styled),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Stories'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          // Selector de historias
          Container(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              children: _stories.asMap().entries.map((entry) {
                final index = entry.key;
                final story = entry.value;
                return ChoiceChip(
                  label: Text(story.name),
                  selected: _selectedStory == index,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedStory = index);
                    }
                  },
                );
              }).toList(),
            ),
          ),
          const Divider(),
          // Contenido del kanban
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _stories[_selectedStory].builder(),
            ),
          ),
        ],
      ),
    );
  }
}
