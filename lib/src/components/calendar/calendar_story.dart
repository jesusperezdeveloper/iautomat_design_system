import 'package:flutter/material.dart';

import 'calendar_config.dart';
import 'ds_calendar.dart';

/// Story configurations para demostrar el componente DSCalendar
///
/// Incluye ejemplos básicos y avanzados de calendarios con:
/// - Configuraciones básicas para las tres variantes (day/week/month)
/// - Diferentes tipos de eventos
/// - Configuración de recursos
/// - Funcionalidad de navegación e interacción
/// - Estados y personalización visual
class CalendarStory {
  /// Historia básica con vista de mes
  static Widget monthView() {
    return DSCalendar(
      config: _monthViewConfig(),
    );
  }

  /// Historia con vista de semana
  static Widget weekView() {
    return DSCalendar(
      config: _weekViewConfig(),
    );
  }

  /// Historia con vista de día
  static Widget dayView() {
    return DSCalendar(
      config: _dayViewConfig(),
    );
  }

  /// Historia con múltiples eventos y tipos
  static Widget withEvents() {
    return DSCalendar(
      config: _eventsConfig(),
      onChanged: () => debugPrint('Calendar changed'),
    );
  }

  /// Historia con recursos (personas, salas, etc.)
  static Widget withResources() {
    return DSCalendar(
      config: _resourcesConfig(),
    );
  }

  /// Historia con estilo personalizado
  static Widget customStyled() {
    return DSCalendar(
      config: _customStyledConfig(),
    );
  }

  // Configuraciones privadas

  static DSCalendarConfig _monthViewConfig() {
    return DSCalendarConfig(
      variant: DSCalendarVariant.month,
      selectedDate: DateTime.now(),
      events: [
        DSCalendarEvent(
          id: 'event-1',
          title: 'Reunión de equipo',
          startTime: DateTime.now().add(const Duration(days: 1, hours: 9)),
          endTime: DateTime.now().add(const Duration(days: 1, hours: 10)),
          type: DSCalendarEventType.meeting,
        ),
        DSCalendarEvent(
          id: 'event-2',
          title: 'Presentación proyecto',
          startTime: DateTime.now().add(const Duration(days: 3, hours: 14)),
          endTime: DateTime.now().add(const Duration(days: 3, hours: 16)),
          type: DSCalendarEventType.task,
          priority: DSCalendarEventPriority.high,
        ),
        DSCalendarEvent(
          id: 'event-3',
          title: 'Almuerzo con cliente',
          startTime: DateTime.now().add(const Duration(days: 5, hours: 13)),
          endTime: DateTime.now().add(const Duration(days: 5, hours: 14)),
          type: DSCalendarEventType.event,
          priority: DSCalendarEventPriority.normal,
        ),
      ],
      onEventTap: (event) => debugPrint('Evento tocado: ${event.title}'),
      onDateTap: (date) => debugPrint('Fecha tocada: ${date.toString()}'),
    );
  }

  static DSCalendarConfig _weekViewConfig() {
    return DSCalendarConfig(
      variant: DSCalendarVariant.week,
      selectedDate: DateTime.now(),
      events: [
        DSCalendarEvent(
          id: 'week-1',
          title: 'Standup diario',
          startTime: DateTime.now().add(const Duration(hours: 9)),
          endTime: DateTime.now().add(const Duration(hours: 9, minutes: 30)),
          type: DSCalendarEventType.meeting,
          isRecurring: true,
        ),
        DSCalendarEvent(
          id: 'week-2',
          title: 'Desarrollo feature X',
          startTime: DateTime.now().add(const Duration(hours: 10)),
          endTime: DateTime.now().add(const Duration(hours: 12)),
          type: DSCalendarEventType.task,
          priority: DSCalendarEventPriority.high,
        ),
        DSCalendarEvent(
          id: 'week-3',
          title: 'Code review',
          startTime: DateTime.now().add(const Duration(days: 1, hours: 15)),
          endTime: DateTime.now().add(const Duration(days: 1, hours: 16)),
          type: DSCalendarEventType.task,
        ),
        DSCalendarEvent(
          id: 'week-4',
          title: 'Recordatorio importante',
          startTime: DateTime.now().add(const Duration(days: 2, hours: 8)),
          endTime: DateTime.now()
              .add(const Duration(days: 2, hours: 8, minutes: 15)),
          type: DSCalendarEventType.reminder,
          priority: DSCalendarEventPriority.critical,
        ),
      ],
      showWorkingHours: true,
      onEventTap: (event) => debugPrint('Evento semanal: ${event.title}'),
    );
  }

  static DSCalendarConfig _dayViewConfig() {
    final today = DateTime.now();
    return DSCalendarConfig(
      variant: DSCalendarVariant.day,
      selectedDate: today,
      events: [
        DSCalendarEvent(
          id: 'day-1',
          title: 'Café de la mañana',
          startTime: today.copyWith(hour: 8, minute: 0),
          endTime: today.copyWith(hour: 8, minute: 30),
          type: DSCalendarEventType.event,
        ),
        DSCalendarEvent(
          id: 'day-2',
          title: 'Planificación sprint',
          startTime: today.copyWith(hour: 9, minute: 0),
          endTime: today.copyWith(hour: 10, minute: 30),
          type: DSCalendarEventType.meeting,
          priority: DSCalendarEventPriority.high,
        ),
        DSCalendarEvent(
          id: 'day-3',
          title: 'Trabajo concentrado',
          startTime: today.copyWith(hour: 11, minute: 0),
          endTime: today.copyWith(hour: 13, minute: 0),
          type: DSCalendarEventType.busy,
          priority: DSCalendarEventPriority.normal,
        ),
        DSCalendarEvent(
          id: 'day-4',
          title: 'Almuerzo',
          startTime: today.copyWith(hour: 13, minute: 0),
          endTime: today.copyWith(hour: 14, minute: 0),
          type: DSCalendarEventType.allDay,
          isAllDay: false,
        ),
        DSCalendarEvent(
          id: 'day-5',
          title: 'Revisión de código',
          startTime: today.copyWith(hour: 15, minute: 0),
          endTime: today.copyWith(hour: 16, minute: 0),
          type: DSCalendarEventType.task,
        ),
        DSCalendarEvent(
          id: 'day-6',
          title: 'Llamada con cliente',
          startTime: today.copyWith(hour: 17, minute: 0),
          endTime: today.copyWith(hour: 17, minute: 45),
          type: DSCalendarEventType.tentative,
          priority: DSCalendarEventPriority.normal,
        ),
      ],
      startHour: 7,
      endHour: 20,
      timeSlotHeight: 60.0,
      showCurrentTimeLine: true,
      onEventTap: (event) => debugPrint('Evento del día: ${event.title}'),
    );
  }

  static DSCalendarConfig _eventsConfig() {
    final now = DateTime.now();
    return DSCalendarConfig(
      variant: DSCalendarVariant.month,
      selectedDate: now,
      events: [
        // Eventos de diferentes tipos
        DSCalendarEvent(
          id: 'meeting-1',
          title: 'Reunión de planificación Q1',
          description:
              'Revisión de objetivos y estrategia para el primer trimestre',
          startTime: now.add(const Duration(days: 1, hours: 9)),
          endTime: now.add(const Duration(days: 1, hours: 11)),
          type: DSCalendarEventType.meeting,
          priority: DSCalendarEventPriority.high,
        ),
        DSCalendarEvent(
          id: 'task-1',
          title: 'Implementar nueva funcionalidad',
          description: 'Desarrollo del módulo de autenticación avanzada',
          startTime: now.add(const Duration(days: 2, hours: 10)),
          endTime: now.add(const Duration(days: 2, hours: 16)),
          type: DSCalendarEventType.task,
          priority: DSCalendarEventPriority.normal,
        ),
        DSCalendarEvent(
          id: 'reminder-1',
          title: 'Recordatorio: Backup de datos',
          description: 'Ejecutar backup semanal de la base de datos',
          startTime: now.add(const Duration(days: 3, hours: 22)),
          endTime: now.add(const Duration(days: 3, hours: 22, minutes: 30)),
          type: DSCalendarEventType.reminder,
          priority: DSCalendarEventPriority.critical,
        ),
        DSCalendarEvent(
          id: 'allday-1',
          title: 'Conferencia de desarrolladores',
          description: 'Asistencia a conferencia anual de tecnología',
          startTime: now.add(const Duration(days: 7)),
          endTime: now.add(const Duration(days: 9)),
          type: DSCalendarEventType.allDay,
          isAllDay: true,
          priority: DSCalendarEventPriority.normal,
        ),
        DSCalendarEvent(
          id: 'busy-1',
          title: 'Tiempo bloqueado - Deep Work',
          description: 'Sesión de trabajo concentrado sin interrupciones',
          startTime: now.add(const Duration(days: 4, hours: 14)),
          endTime: now.add(const Duration(days: 4, hours: 17)),
          type: DSCalendarEventType.busy,
          priority: DSCalendarEventPriority.high,
        ),
        DSCalendarEvent(
          id: 'tentative-1',
          title: 'Posible reunión con cliente',
          description: 'Pendiente de confirmar disponibilidad del cliente',
          startTime: now.add(const Duration(days: 6, hours: 15)),
          endTime: now.add(const Duration(days: 6, hours: 16)),
          type: DSCalendarEventType.tentative,
          priority: DSCalendarEventPriority.normal,
        ),
      ],
      onEventTap: (event) => debugPrint('Evento complejo: ${event.title}'),
      onDateTap: (date) => debugPrint('Crear evento en: ${date.toString()}'),
    );
  }

  static DSCalendarConfig _resourcesConfig() {
    return DSCalendarConfig(
      variant: DSCalendarVariant.week,
      selectedDate: DateTime.now(),
      resources: [
        DSCalendarResource(
          id: 'dev-1',
          name: 'María García',
          description: 'Desarrolladora Senior',
          email: 'maria.garcia@iautomat.com',
          color: Colors.blue.shade300,
          icon: Icons.person,
        ),
        DSCalendarResource(
          id: 'dev-2',
          name: 'Carlos López',
          description: 'Desarrollador Frontend',
          email: 'carlos.lopez@iautomat.com',
          color: Colors.green.shade300,
          icon: Icons.person,
        ),
        DSCalendarResource(
          id: 'room-1',
          name: 'Sala de Reuniones A',
          description: 'Capacidad para 8 personas, TV 4K',
          color: Colors.purple.shade300,
          icon: Icons.meeting_room,
        ),
        DSCalendarResource(
          id: 'room-2',
          name: 'Sala de Conferencias',
          description: 'Capacidad para 20 personas, videoconferencia',
          color: Colors.orange.shade300,
          icon: Icons.video_call,
        ),
      ],
      events: [
        DSCalendarEvent(
          id: 'resource-1',
          title: 'Standup del equipo',
          startTime: DateTime.now().add(const Duration(hours: 9)),
          endTime: DateTime.now().add(const Duration(hours: 9, minutes: 30)),
          type: DSCalendarEventType.meeting,
        ),
        DSCalendarEvent(
          id: 'resource-2',
          title: 'Sesión de pair programming',
          startTime: DateTime.now().add(const Duration(days: 1, hours: 14)),
          endTime: DateTime.now().add(const Duration(days: 1, hours: 17)),
          type: DSCalendarEventType.task,
        ),
        DSCalendarEvent(
          id: 'resource-3',
          title: 'Presentación a stakeholders',
          startTime: DateTime.now().add(const Duration(days: 2, hours: 16)),
          endTime: DateTime.now()
              .add(const Duration(days: 2, hours: 17, minutes: 30)),
          type: DSCalendarEventType.meeting,
          priority: DSCalendarEventPriority.high,
        ),
      ],
      onEventTap: (event) => debugPrint('Evento con recursos: ${event.title}'),
    );
  }

  static DSCalendarConfig _customStyledConfig() {
    return DSCalendarConfig(
      variant: DSCalendarVariant.month,
      selectedDate: DateTime.now(),
      backgroundColor: Colors.grey.shade50,
      headerBackgroundColor: Colors.indigo.shade100,
      headerTextColor: Colors.indigo.shade800,
      cellBackgroundColor: Colors.white,
      cellBorderColor: Colors.grey.shade300,
      todayBackgroundColor: Colors.indigo.shade50,
      todayTextColor: Colors.indigo.shade700,
      selectedBackgroundColor: Colors.indigo.shade100,
      selectedTextColor: Colors.indigo.shade900,
      weekendBackgroundColor: Colors.amber.shade50,
      weekendTextColor: Colors.amber.shade800,
      currentTimeLineColor: Colors.red,
      workingHoursBackgroundColor: Colors.green.shade50,
      nonWorkingHoursBackgroundColor: Colors.grey.shade100,
      headerHeight: 64.0,
      cellHeight: 50.0,
      eventBorderRadius: 8.0,
      events: [
        DSCalendarEvent(
          id: 'styled-1',
          title: 'Evento personalizado 1',
          startTime: DateTime.now().add(const Duration(days: 1, hours: 10)),
          endTime: DateTime.now().add(const Duration(days: 1, hours: 11)),
          backgroundColor: Colors.purple.shade100,
          textColor: Colors.purple.shade800,
          borderColor: Colors.purple.shade300,
        ),
        DSCalendarEvent(
          id: 'styled-2',
          title: 'Evento personalizado 2',
          startTime: DateTime.now().add(const Duration(days: 3, hours: 14)),
          endTime: DateTime.now().add(const Duration(days: 3, hours: 15)),
          backgroundColor: Colors.teal.shade100,
          textColor: Colors.teal.shade800,
          borderColor: Colors.teal.shade300,
        ),
        DSCalendarEvent(
          id: 'styled-3',
          title: 'Evento personalizado 3',
          startTime: DateTime.now().add(const Duration(days: 5, hours: 16)),
          endTime: DateTime.now().add(const Duration(days: 5, hours: 17)),
          backgroundColor: Colors.pink.shade100,
          textColor: Colors.pink.shade800,
          borderColor: Colors.pink.shade300,
        ),
      ],
      localization: DSCalendarLocalization(
        monthNames: [
          'Enero',
          'Febrero',
          'Marzo',
          'Abril',
          'Mayo',
          'Junio',
          'Julio',
          'Agosto',
          'Septiembre',
          'Octubre',
          'Noviembre',
          'Diciembre'
        ],
        dayNames: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
        timeFormat: 24,
      ),
      onEventTap: (event) => debugPrint('Evento estilizado: ${event.title}'),
    );
  }
}

/// Widget de ejemplo que muestra diferentes configuraciones del Calendar
class CalendarStoryExample extends StatefulWidget {
  const CalendarStoryExample({super.key});

  @override
  State<CalendarStoryExample> createState() => _CalendarStoryExampleState();
}

class _CalendarStoryExampleState extends State<CalendarStoryExample> {
  int _selectedStory = 0;

  final List<({String name, Widget Function() builder})> _stories = [
    (name: 'Vista Mes', builder: CalendarStory.monthView),
    (name: 'Vista Semana', builder: CalendarStory.weekView),
    (name: 'Vista Día', builder: CalendarStory.dayView),
    (name: 'Con Eventos', builder: CalendarStory.withEvents),
    (name: 'Con Recursos', builder: CalendarStory.withResources),
    (name: 'Estilizado', builder: CalendarStory.customStyled),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Stories'),
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
          // Contenido del calendar
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
