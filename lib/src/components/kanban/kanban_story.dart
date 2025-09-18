import 'package:flutter/material.dart';

import 'kanban_config.dart';
import 'app_kanban.dart';

/// Story configurations para demostrar el componente AppKanban
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
    return AppKanban(
      config: _basicConfig(),
    );
  }

  /// Historia con múltiples columnas y tarjetas
  static Widget complete() {
    return AppKanban(
      config: _completeConfig(),
      onChanged: () => debugPrint('Kanban changed'),
    );
  }

  /// Historia con tarjetas personalizadas
  static Widget customCards() {
    return AppKanban(
      config: _customCardsConfig(),
    );
  }

  /// Historia con estilo personalizado
  static Widget styled() {
    return AppKanban(
      config: _styledConfig(),
    );
  }

  // Configuraciones privadas

  static AppKanbanConfig _basicConfig() {
    return AppKanbanConfig(
      variant: AppKanbanVariant.dragDrop,
      columns: [
        AppKanbanColumn(
          id: 'todo',
          title: 'Por Hacer',
          icon: Icons.assignment_outlined,
        ),
        AppKanbanColumn(
          id: 'inprogress',
          title: 'En Progreso',
          icon: Icons.play_circle_outline,
        ),
        AppKanbanColumn(
          id: 'done',
          title: 'Completado',
          icon: Icons.check_circle_outline,
        ),
      ],
      cards: [
        AppKanbanCard(
          id: 'card-1',
          title: 'Diseñar interfaz de usuario',
          columnId: 'todo',
        ),
        AppKanbanCard(
          id: 'card-2',
          title: 'Implementar API REST',
          columnId: 'inprogress',
        ),
        AppKanbanCard(
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

  static AppKanbanConfig _completeConfig() {
    return AppKanbanConfig(
      variant: AppKanbanVariant.dragDrop,
      columns: [
        AppKanbanColumn(
          id: 'backlog',
          title: 'Backlog',
          icon: Icons.inventory_2_outlined,
          backgroundColor: Colors.blue.shade50,
        ),
        AppKanbanColumn(
          id: 'todo',
          title: 'Por Hacer',
          icon: Icons.assignment_outlined,
          backgroundColor: Colors.orange.shade50,
        ),
        AppKanbanColumn(
          id: 'inprogress',
          title: 'En Progreso',
          icon: Icons.play_circle_outline,
          backgroundColor: Colors.yellow.shade50,
        ),
        AppKanbanColumn(
          id: 'review',
          title: 'En Revisión',
          icon: Icons.rate_review_outlined,
          backgroundColor: Colors.purple.shade50,
        ),
        AppKanbanColumn(
          id: 'done',
          title: 'Completado',
          icon: Icons.check_circle_outline,
          backgroundColor: Colors.green.shade50,
        ),
      ],
      cards: [
        AppKanbanCard(
          id: 'card-1',
          title: 'Implementar autenticación de usuarios',
          description: 'Crear sistema de login/registro con JWT',
          columnId: 'backlog',
          type: AppKanbanCardType.feature,
          priority: AppKanbanCardPriority.high,
          tags: ['backend', 'seguridad'],
          dueDate: DateTime.now().add(const Duration(days: 7)),
        ),
        AppKanbanCard(
          id: 'card-2',
          title: 'Diseñar dashboard principal',
          description: 'Crear mockups y prototipos de la página principal',
          columnId: 'todo',
          type: AppKanbanCardType.task,
          priority: AppKanbanCardPriority.medium,
          tags: ['frontend', 'ui'],
          dueDate: DateTime.now().add(const Duration(days: 3)),
        ),
        AppKanbanCard(
          id: 'card-3',
          title: 'Configurar pipeline CI/CD',
          description: 'Automatizar deploy a staging y producción',
          columnId: 'inprogress',
          type: AppKanbanCardType.task,
          priority: AppKanbanCardPriority.high,
          tags: ['devops', 'automatización'],
          dueDate: DateTime.now().add(const Duration(days: 1)),
        ),
        AppKanbanCard(
          id: 'card-4',
          title: 'Corregir bug en validación de formularios',
          description: 'Los campos no se validan correctamente en Chrome',
          columnId: 'review',
          type: AppKanbanCardType.bug,
          priority: AppKanbanCardPriority.critical,
          tags: ['bug', 'frontend'],
          dueDate: DateTime.now().subtract(const Duration(days: 1)),
        ),
        AppKanbanCard(
          id: 'card-5',
          title: 'Documentar API endpoints',
          description: 'Actualizar documentación con Swagger',
          columnId: 'done',
          type: AppKanbanCardType.task,
          priority: AppKanbanCardPriority.low,
          tags: ['documentación', 'api'],
          dueDate: DateTime.now().subtract(const Duration(days: 3)),
        ),
      ],
      onMove: (cardId, fromColumn, toColumn, index) {
        debugPrint('Task $cardId moved from $fromColumn to $toColumn');
      },
    );
  }

  static AppKanbanConfig _customCardsConfig() {
    return AppKanbanConfig(
      variant: AppKanbanVariant.dragDrop,
      columns: [
        AppKanbanColumn(
          id: 'new',
          title: 'Nuevas Ideas',
          icon: Icons.lightbulb_outline,
        ),
        AppKanbanColumn(
          id: 'development',
          title: 'Desarrollo',
          icon: Icons.code,
        ),
        AppKanbanColumn(
          id: 'testing',
          title: 'Testing',
          icon: Icons.bug_report_outlined,
        ),
        AppKanbanColumn(
          id: 'released',
          title: 'Publicado',
          icon: Icons.rocket_launch_outlined,
        ),
      ],
      cards: [
        AppKanbanCard(
          id: 'epic-1',
          title: 'Rediseño completo de la aplicación',
          description:
              'Modernizar la interfaz y mejorar la experiencia de usuario',
          columnId: 'new',
          type: AppKanbanCardType.epic,
          priority: AppKanbanCardPriority.high,
          tags: ['epic', 'ui/ux', 'frontend'],
          backgroundColor: Colors.purple.shade100,
        ),
        AppKanbanCard(
          id: 'feature-1',
          title: 'Sistema de notificaciones push',
          description: 'Implementar notificaciones en tiempo real',
          columnId: 'development',
          type: AppKanbanCardType.feature,
          priority: AppKanbanCardPriority.medium,
          tags: ['feature', 'realtime'],
          backgroundColor: Colors.blue.shade100,
        ),
        AppKanbanCard(
          id: 'bug-1',
          title: 'Optimizar performance en mobile',
          description: 'La app es lenta en dispositivos Android antiguos',
          columnId: 'testing',
          type: AppKanbanCardType.bug,
          priority: AppKanbanCardPriority.critical,
          tags: ['performance', 'mobile'],
          backgroundColor: Colors.red.shade100,
        ),
        AppKanbanCard(
          id: 'story-1',
          title: 'Como usuario quiero exportar datos',
          description: 'Permitir export en formato CSV y PDF',
          columnId: 'released',
          type: AppKanbanCardType.story,
          priority: AppKanbanCardPriority.low,
          tags: ['export', 'csv', 'pdf'],
          backgroundColor: Colors.green.shade100,
        ),
      ],
      onMove: (cardId, fromColumn, toColumn, index) {
        debugPrint('Card $cardId moved to $toColumn');
      },
    );
  }

  static AppKanbanConfig _styledConfig() {
    return AppKanbanConfig(
      variant: AppKanbanVariant.dragDrop,
      padding: const EdgeInsets.all(24),
      backgroundColor: Colors.grey.shade100,
      columns: [
        AppKanbanColumn(
          id: 'ideas',
          title: 'Ideas',
          icon: Icons.lightbulb,
          backgroundColor: Colors.yellow.shade100,
        ),
        AppKanbanColumn(
          id: 'working',
          title: 'Trabajando',
          icon: Icons.work,
          backgroundColor: Colors.blue.shade100,
        ),
        AppKanbanColumn(
          id: 'finished',
          title: 'Finalizado',
          icon: Icons.done_all,
          backgroundColor: Colors.green.shade100,
        ),
      ],
      cards: [
        AppKanbanCard(
          id: 'styled-1',
          title: 'Tarjeta con estilo personalizado',
          description: 'Esta tarjeta tiene un diseño único',
          columnId: 'ideas',
          backgroundColor: Colors.white,
        ),
        AppKanbanCard(
          id: 'styled-2',
          title: 'Otra tarjeta estilizada',
          description: 'Con diferentes colores y sombras',
          columnId: 'working',
          backgroundColor: Colors.blue.shade50,
        ),
        AppKanbanCard(
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
