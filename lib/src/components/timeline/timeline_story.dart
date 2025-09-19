import 'package:flutter/material.dart';
import 'ds_timeline.dart';
import 'timeline_config.dart';

class TimelineStoryExample extends StatefulWidget {
  const TimelineStoryExample({super.key});

  @override
  State<TimelineStoryExample> createState() => _TimelineStoryExampleState();
}

class _TimelineStoryExampleState extends State<TimelineStoryExample> {
  DSTimelineOrientation _orientation = DSTimelineOrientation.vertical;
  DSTimelineConnectorStyle _connectorStyle = DSTimelineConnectorStyle.solid;
  DSTimelineIndicatorStyle _indicatorStyle = DSTimelineIndicatorStyle.dot;
  DSTimelineSpacing _spacing = DSTimelineSpacing.medium;
  bool _showAnimation = true;
  bool _staggered = false;
  bool _scrollable = false;
  bool _reversed = false;
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline Examples'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _selectedIndex = null;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Controls
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Timeline Controls',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    _buildOrientationControl(),
                    _buildConnectorStyleControl(),
                    _buildIndicatorStyleControl(),
                    _buildSpacingControl(),
                    _buildAnimationControls(),
                    _buildOptionsControls(),
                  ],
                ),
              ],
            ),
          ),

          // Timeline Examples
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBasicExample(),
                  const SizedBox(height: 32),
                  _buildActivityExample(),
                  const SizedBox(height: 32),
                  _buildProjectExample(),
                  const SizedBox(height: 32),
                  _buildWorkflowExample(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrientationControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Orientación'),
        DropdownButton<DSTimelineOrientation>(
          value: _orientation,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _orientation = value;
              });
            }
          },
          items: DSTimelineOrientation.values.map((orientation) {
            return DropdownMenuItem(
              value: orientation,
              child: Text(orientation.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConnectorStyleControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estilo de Conector'),
        DropdownButton<DSTimelineConnectorStyle>(
          value: _connectorStyle,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _connectorStyle = value;
              });
            }
          },
          items: DSTimelineConnectorStyle.values.map((style) {
            return DropdownMenuItem(
              value: style,
              child: Text(style.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildIndicatorStyleControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estilo de Indicador'),
        DropdownButton<DSTimelineIndicatorStyle>(
          value: _indicatorStyle,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _indicatorStyle = value;
              });
            }
          },
          items: DSTimelineIndicatorStyle.values.map((style) {
            return DropdownMenuItem(
              value: style,
              child: Text(style.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSpacingControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Espaciado'),
        DropdownButton<DSTimelineSpacing>(
          value: _spacing,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _spacing = value;
              });
            }
          },
          items: DSTimelineSpacing.values.map((spacing) {
            return DropdownMenuItem(
              value: spacing,
              child: Text(spacing.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAnimationControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Animaciones'),
        Row(
          children: [
            Checkbox(
              value: _showAnimation,
              onChanged: (value) {
                setState(() {
                  _showAnimation = value ?? false;
                });
              },
            ),
            const Text('Animado'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _staggered,
              onChanged: (value) {
                setState(() {
                  _staggered = value ?? false;
                });
              },
            ),
            const Text('Escalonado'),
          ],
        ),
      ],
    );
  }

  Widget _buildOptionsControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Opciones'),
        Row(
          children: [
            Checkbox(
              value: _scrollable,
              onChanged: (value) {
                setState(() {
                  _scrollable = value ?? false;
                });
              },
            ),
            const Text('Scrollable'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _reversed,
              onChanged: (value) {
                setState(() {
                  _reversed = value ?? false;
                });
              },
            ),
            const Text('Reverso'),
          ],
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ejemplo Básico',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: _orientation == DSTimelineOrientation.vertical ? 400 : 200,
          child: DSTimeline.activity(
            events: _getBasicEvents(),
            orientation: _orientation,
            connectorStyle: _connectorStyle,
            indicatorStyle: _indicatorStyle,
            spacing: _spacing,
            scrollable: _scrollable,
            reversed: _reversed,
            selectedIndex: _selectedIndex,
            animation: _showAnimation
                ? DSTimelineAnimation(
                    enabled: true,
                    staggered: _staggered,
                    type: DSTimelineAnimationType.fade,
                  )
                : null,
            onEventTap: (index) {
              setState(() {
                _selectedIndex = _selectedIndex == index ? null : index;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActivityExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Timeline de Actividad',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 500,
          child: DSTimeline.activity(
            events: _getActivityEvents(),
            orientation: DSTimelineOrientation.vertical,
            indicatorStyle: DSTimelineIndicatorStyle.icon,
            spacing: DSTimelineSpacing.comfortable,
            animation: DSTimelineAnimation(
              enabled: true,
              staggered: true,
              type: DSTimelineAnimationType.slideUp,
            ),
            onEventTap: (index) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Evento ${index + 1} seleccionado'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProjectExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Timeline de Proyecto',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: DSTimeline.activity(
            events: _getProjectEvents(),
            orientation: DSTimelineOrientation.vertical,
            indicatorStyle: DSTimelineIndicatorStyle.dot,
            connectorStyle: DSTimelineConnectorStyle.dashed,
            spacing: DSTimelineSpacing.medium,
            animation: DSTimelineAnimation(
              enabled: true,
              type: DSTimelineAnimationType.slideLeft,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWorkflowExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Timeline de Workflow',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: DSTimeline.activity(
            events: _getWorkflowEvents(),
            orientation: DSTimelineOrientation.horizontal,
            indicatorStyle: DSTimelineIndicatorStyle.square,
            connectorStyle: DSTimelineConnectorStyle.solid,
            spacing: DSTimelineSpacing.comfortable,
          ),
        ),
      ],
    );
  }

  List<DSTimelineEvent> _getBasicEvents() {
    return [
      DSTimelineEvent(
        id: '1',
        title: 'Inicio del Proyecto',
        subtitle: 'Reunión de kickoff',
        timestamp: DateTime.now().subtract(const Duration(days: 30)),
        type: DSTimelineEventType.milestone,
        status: DSTimelineEventStatus.completed,
      ),
      DSTimelineEvent(
        id: '2',
        title: 'Fase de Diseño',
        subtitle: 'Creación de mockups y wireframes',
        timestamp: DateTime.now().subtract(const Duration(days: 25)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.completed,
      ),
      DSTimelineEvent(
        id: '3',
        title: 'Desarrollo',
        subtitle: 'Implementación de funcionalidades',
        timestamp: DateTime.now().subtract(const Duration(days: 15)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.inProgress,
      ),
      DSTimelineEvent(
        id: '4',
        title: 'Testing',
        subtitle: 'Pruebas de calidad',
        timestamp: DateTime.now().subtract(const Duration(days: 5)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.pending,
      ),
      DSTimelineEvent(
        id: '5',
        title: 'Deployment',
        subtitle: 'Lanzamiento en producción',
        timestamp: DateTime.now().add(const Duration(days: 5)),
        type: DSTimelineEventType.milestone,
        status: DSTimelineEventStatus.pending,
      ),
    ];
  }

  List<DSTimelineEvent> _getActivityEvents() {
    return [
      DSTimelineEvent(
        id: '1',
        title: 'Usuario registrado',
        subtitle: 'juan.perez@ejemplo.com',
        description: 'Nuevo usuario se registró en la plataforma',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: DSTimelineEventType.success,
        status: DSTimelineEventStatus.completed,
        trailing: Chip(
          label: const Text('Nuevo'),
          backgroundColor: Colors.green.withValues(alpha: 0.1),
        ),
      ),
      DSTimelineEvent(
        id: '2',
        title: 'Reunión programada',
        subtitle: 'Revisión de Sprint',
        description:
            'Reunión de revisión del sprint actual programada para mañana',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        type: DSTimelineEventType.meeting,
        status: DSTimelineEventStatus.pending,
      ),
      DSTimelineEvent(
        id: '3',
        title: 'Tarea completada',
        subtitle: 'Feature: Sistema de autenticación',
        description:
            'Se completó la implementación del sistema de autenticación con OAuth2',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.completed,
        content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Row(
            children: [
              Icon(Icons.code, size: 16),
              SizedBox(width: 8),
              Text('auth_service.dart'),
            ],
          ),
        ),
      ),
      DSTimelineEvent(
        id: '4',
        title: 'Error reportado',
        subtitle: 'Bug en el login',
        description:
            'Usuario reporta error al intentar iniciar sesión con credenciales válidas',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        type: DSTimelineEventType.error,
        status: DSTimelineEventStatus.inProgress,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Alta prioridad',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
      DSTimelineEvent(
        id: '5',
        title: 'Deployment exitoso',
        subtitle: 'Versión 2.1.0',
        description: 'Nueva versión desplegada exitosamente en producción',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: DSTimelineEventType.milestone,
        status: DSTimelineEventStatus.completed,
      ),
    ];
  }

  List<DSTimelineEvent> _getProjectEvents() {
    return [
      DSTimelineEvent(
        id: '1',
        title: 'Planificación',
        subtitle: 'Definición de requerimientos',
        timestamp: DateTime.now().subtract(const Duration(days: 60)),
        type: DSTimelineEventType.milestone,
        status: DSTimelineEventStatus.completed,
      ),
      DSTimelineEvent(
        id: '2',
        title: 'Análisis',
        subtitle: 'Estudio de viabilidad técnica',
        timestamp: DateTime.now().subtract(const Duration(days: 50)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.completed,
      ),
      DSTimelineEvent(
        id: '3',
        title: 'Diseño UX/UI',
        subtitle: 'Creación de prototipos',
        timestamp: DateTime.now().subtract(const Duration(days: 35)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.completed,
      ),
      DSTimelineEvent(
        id: '4',
        title: 'Desarrollo Backend',
        subtitle: 'APIs y base de datos',
        timestamp: DateTime.now().subtract(const Duration(days: 20)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.inProgress,
      ),
      DSTimelineEvent(
        id: '5',
        title: 'Desarrollo Frontend',
        subtitle: 'Interfaz de usuario',
        timestamp: DateTime.now().subtract(const Duration(days: 10)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.pending,
      ),
      DSTimelineEvent(
        id: '6',
        title: 'Testing QA',
        subtitle: 'Pruebas de calidad',
        timestamp: DateTime.now().add(const Duration(days: 5)),
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.pending,
      ),
      DSTimelineEvent(
        id: '7',
        title: 'Lanzamiento',
        subtitle: 'Release en producción',
        timestamp: DateTime.now().add(const Duration(days: 15)),
        type: DSTimelineEventType.milestone,
        status: DSTimelineEventStatus.pending,
      ),
    ];
  }

  List<DSTimelineEvent> _getWorkflowEvents() {
    return [
      DSTimelineEvent(
        id: '1',
        title: 'Solicitud',
        subtitle: 'Creada',
        type: DSTimelineEventType.info,
        status: DSTimelineEventStatus.completed,
      ),
      DSTimelineEvent(
        id: '2',
        title: 'Revisión',
        subtitle: 'En proceso',
        type: DSTimelineEventType.task,
        status: DSTimelineEventStatus.inProgress,
      ),
      DSTimelineEvent(
        id: '3',
        title: 'Aprobación',
        subtitle: 'Pendiente',
        type: DSTimelineEventType.warning,
        status: DSTimelineEventStatus.pending,
      ),
      DSTimelineEvent(
        id: '4',
        title: 'Completado',
        subtitle: 'Finalizado',
        type: DSTimelineEventType.success,
        status: DSTimelineEventStatus.pending,
      ),
    ];
  }
}

class TimelineStoryBasic extends StatelessWidget {
  const TimelineStoryBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline Básico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DSTimeline.activity(
          events: [
            DSTimelineEvent(
              id: '1',
              title: 'Evento 1',
              subtitle: 'Descripción del primer evento',
              timestamp: DateTime.now().subtract(const Duration(hours: 2)),
              type: DSTimelineEventType.milestone,
              status: DSTimelineEventStatus.completed,
            ),
            DSTimelineEvent(
              id: '2',
              title: 'Evento 2',
              subtitle: 'Descripción del segundo evento',
              timestamp: DateTime.now().subtract(const Duration(hours: 1)),
              type: DSTimelineEventType.task,
              status: DSTimelineEventStatus.inProgress,
            ),
            DSTimelineEvent(
              id: '3',
              title: 'Evento 3',
              subtitle: 'Descripción del tercer evento',
              timestamp: DateTime.now(),
              type: DSTimelineEventType.note,
              status: DSTimelineEventStatus.pending,
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineStoryPlayground extends StatefulWidget {
  const TimelineStoryPlayground({super.key});

  @override
  State<TimelineStoryPlayground> createState() =>
      _TimelineStoryPlaygroundState();
}

class _TimelineStoryPlaygroundState extends State<TimelineStoryPlayground> {
  final List<DSTimelineEvent> _events = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  DSTimelineEventType _selectedType = DSTimelineEventType.task;
  DSTimelineEventStatus _selectedStatus = DSTimelineEventStatus.pending;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline Playground'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: _clearEvents,
          ),
        ],
      ),
      body: Column(
        children: [
          // Add Event Panel
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agregar Evento',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: _subtitleController,
                        decoration: const InputDecoration(
                          labelText: 'Subtítulo',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<DSTimelineEventType>(
                        initialValue: _selectedType,
                        decoration: const InputDecoration(
                          labelText: 'Tipo',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedType = value;
                            });
                          }
                        },
                        items: DSTimelineEventType.values.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Row(
                              children: [
                                Icon(type.defaultIcon, size: 16),
                                const SizedBox(width: 8),
                                Text(type.label),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<DSTimelineEventStatus>(
                        initialValue: _selectedStatus,
                        decoration: const InputDecoration(
                          labelText: 'Estado',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedStatus = value;
                            });
                          }
                        },
                        items: DSTimelineEventStatus.values.map((status) {
                          return DropdownMenuItem(
                            value: status,
                            child: Row(
                              children: [
                                Icon(status.icon, size: 16),
                                const SizedBox(width: 8),
                                Text(status.label),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _addEvent,
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Timeline
          Expanded(
            child: _events.isEmpty
                ? const Center(
                    child: Text('Agrega eventos para ver el timeline'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: DSTimeline.activity(
                      events: _events,
                      orientation: DSTimelineOrientation.vertical,
                      indicatorStyle: DSTimelineIndicatorStyle.icon,
                      spacing: DSTimelineSpacing.medium,
                      animation: DSTimelineAnimation(
                        enabled: true,
                        staggered: true,
                        type: DSTimelineAnimationType.slideUp,
                      ),
                      onEventTap: _removeEvent,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _addEvent() {
    if (_titleController.text.isNotEmpty) {
      setState(() {
        _events.add(
          DSTimelineEvent(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: _titleController.text,
            subtitle: _subtitleController.text.isNotEmpty
                ? _subtitleController.text
                : null,
            timestamp: DateTime.now(),
            type: _selectedType,
            status: _selectedStatus,
          ),
        );
      });

      _titleController.clear();
      _subtitleController.clear();
    }
  }

  void _removeEvent(int index) {
    if (index >= 0 && index < _events.length) {
      setState(() {
        _events.removeAt(index);
      });
    }
  }

  void _clearEvents() {
    setState(() {
      _events.clear();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }
}
