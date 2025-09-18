// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_config.freezed.dart';


/// Tipos de callback para eventos del calendario
typedef AppCalendarEventTapCallback = void Function(AppCalendarEvent event);
typedef AppCalendarDateTapCallback = void Function(DateTime date);
typedef AppCalendarDateRangeSelectCallback = void Function(DateTimeRange range);

/// Variantes del calendario
enum AppCalendarVariant {
  /// Vista de día - muestra un solo día con horarios
  day,

  /// Vista de semana - muestra una semana completa
  week,

  /// Vista de mes - muestra un mes completo en grid
  month,
}

/// Estados del calendario
enum AppCalendarState {
  /// Estado por defecto
  defaultState,

  /// Estado hover (web/desktop)
  hover,

  /// Estado presionado
  pressed,

  /// Estado con foco (navegación por teclado)
  focus,

  /// Estado seleccionado
  selected,

  /// Estado deshabilitado
  disabled,

  /// Estado de carga
  loading,

  /// Estado skeleton para carga inicial
  skeleton,
}

/// Tipo de evento en el calendario
enum AppCalendarEventType {
  /// Evento normal
  event,

  /// Reunión
  meeting,

  /// Tarea
  task,

  /// Recordatorio
  reminder,

  /// Evento de todo el día
  allDay,

  /// Evento bloqueado/ocupado
  busy,

  /// Evento tentativo
  tentative,
}

/// Prioridad del evento
enum AppCalendarEventPriority {
  /// Prioridad baja
  low,

  /// Prioridad normal
  normal,

  /// Prioridad alta
  high,

  /// Prioridad crítica
  critical,
}

/// Configuración de un evento del calendario
@freezed
class AppCalendarEvent with _$AppCalendarEvent {
  const factory AppCalendarEvent({
    /// ID único del evento
    required String id,

    /// Título del evento
    required String title,

    /// Descripción opcional del evento
    String? description,

    /// Fecha y hora de inicio
    required DateTime startTime,

    /// Fecha y hora de fin
    required DateTime endTime,

    /// Tipo de evento
    @Default(AppCalendarEventType.event) AppCalendarEventType type,

    /// Prioridad del evento
    @Default(AppCalendarEventPriority.normal) AppCalendarEventPriority priority,

    /// Color del evento (si no se especifica usa el del tipo)
    Color? color,

    /// Color del texto del evento
    Color? textColor,

    /// Color de fondo del evento
    Color? backgroundColor,

    /// Color del borde del evento
    Color? borderColor,

    /// Si el evento es de todo el día
    @Default(false) bool isAllDay,

    /// Si el evento se puede editar
    @Default(true) bool isEditable,

    /// Si el evento se puede eliminar
    @Default(true) bool isDeletable,

    /// Si el evento se puede mover
    @Default(true) bool isMovable,

    /// Si el evento se puede redimensionar
    @Default(true) bool isResizable,

    /// Ubicación del evento
    String? location,

    /// Asistentes del evento
    @Default(<String>[]) List<String> attendees,

    /// URL del evento
    String? url,

    /// Metadatos adicionales
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,

    /// ID del recurso al que pertenece el evento
    String? resourceId,

    /// Eventos recurrentes - ID del evento padre
    String? recurringEventId,

    /// Si es un evento recurrente
    @Default(false) bool isRecurring,

    /// Patrón de recurrencia
    String? recurrenceRule,

    /// Zona horaria del evento
    String? timeZone,
  }) = _AppCalendarEvent;

}

/// Configuración de un recurso del calendario (salas, personas, etc.)
@freezed
class AppCalendarResource with _$AppCalendarResource {
  const factory AppCalendarResource({
    /// ID único del recurso
    required String id,

    /// Nombre del recurso
    required String name,

    /// Descripción del recurso
    String? description,

    /// Color del recurso
    Color? color,

    /// Color del texto del recurso
    Color? textColor,

    /// Color de fondo del recurso
    Color? backgroundColor,

    /// Avatar/icono del recurso
    String? avatar,

    /// Icono del recurso
    IconData? icon,

    /// Email del recurso (si es una persona)
    String? email,

    /// Teléfono del recurso
    String? phone,

    /// Si el recurso está disponible
    @Default(true) bool isAvailable,

    /// Capacidad del recurso (para salas)
    int? capacity,

    /// Ubicación del recurso
    String? location,

    /// Metadatos adicionales
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,

    /// Horario de trabajo del recurso
    AppCalendarWorkingHours? workingHours,

    /// Días no laborables
    @Default(<DateTime>[]) List<DateTime> nonWorkingDays,
  }) = _AppCalendarResource;

}

/// Configuración de horario de trabajo
@freezed
class AppCalendarWorkingHours with _$AppCalendarWorkingHours {
  const factory AppCalendarWorkingHours({
    /// Hora de inicio (formato 24h, ej: "09:00")
    @Default("09:00") String startTime,

    /// Hora de fin (formato 24h, ej: "17:00")
    @Default("17:00") String endTime,

    /// Días de la semana (1=lunes, 7=domingo)
    @Default(<int>[1, 2, 3, 4, 5]) List<int> workingDays,

    /// Zona horaria
    String? timeZone,
  }) = _AppCalendarWorkingHours;

}

/// Configuración de estilo para fechas especiales
@freezed
class AppCalendarDateStyle with _$AppCalendarDateStyle {
  const factory AppCalendarDateStyle({
    /// Color del texto
    Color? textColor,

    /// Color de fondo
    Color? backgroundColor,

    /// Color del borde
    Color? borderColor,

    /// Estilo del texto
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? textStyle,

    /// Decoración del contenedor
    @JsonKey(includeFromJson: false, includeToJson: false) BoxDecoration? decoration,

    /// Si está habilitado
    @Default(true) bool enabled,

    /// Si está seleccionado
    @Default(false) bool selected,

    /// Si está en el mes actual
    @Default(true) bool isCurrentMonth,

    /// Si es el día de hoy
    @Default(false) bool isToday,

    /// Si es fin de semana
    @Default(false) bool isWeekend,

    /// Si es día festivo
    @Default(false) bool isHoliday,
  }) = _AppCalendarDateStyle;

}

/// Configuración de localización
@freezed
class AppCalendarLocalization with _$AppCalendarLocalization {
  const factory AppCalendarLocalization({
    /// Idioma (es, en, etc.)
    @Default('es') String locale,

    /// Nombres de los meses
    @Default(<String>[
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
    ])
    List<String> monthNames,

    /// Nombres cortos de los meses
    @Default(<String>[
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ])
    List<String> monthNamesShort,

    /// Nombres de los días de la semana
    @Default(<String>[
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ])
    List<String> dayNames,

    /// Nombres cortos de los días
    @Default(<String>['L', 'M', 'X', 'J', 'V', 'S', 'D'])
    List<String> dayNamesShort,

    /// Primer día de la semana (1=lunes, 7=domingo)
    @Default(1) int firstDayOfWeek,

    /// Formato de hora (12h o 24h)
    @Default(24) int timeFormat,

    /// Textos de interfaz
    @Default(<String, String>{
      'today': 'Hoy',
      'week': 'Semana',
      'month': 'Mes',
      'day': 'Día',
      'events': 'Eventos',
      'noEvents': 'No hay eventos',
      'allDay': 'Todo el día',
      'more': 'más',
      'previous': 'Anterior',
      'next': 'Siguiente',
      'loading': 'Cargando...',
    })
    Map<String, String> labels,
  }) = _AppCalendarLocalization;

}

/// Configuración principal del calendario
@freezed
class AppCalendarConfig with _$AppCalendarConfig {
  const factory AppCalendarConfig({
    /// Variante del calendario
    @Default(AppCalendarVariant.month) AppCalendarVariant variant,

    /// Lista de eventos
    @Default(<AppCalendarEvent>[]) List<AppCalendarEvent> events,

    /// Lista de recursos
    @Default(<AppCalendarResource>[]) List<AppCalendarResource> resources,

    /// Fecha inicial seleccionada
    DateTime? selectedDate,

    /// Rango de fechas seleccionado
    @JsonKey(includeFromJson: false, includeToJson: false) DateTimeRange? selectedRange,

    /// Fecha mínima seleccionable
    DateTime? minDate,

    /// Fecha máxima seleccionable
    DateTime? maxDate,

    /// Estado del calendario
    @Default(AppCalendarState.defaultState) AppCalendarState state,

    /// Si permite selección múltiple
    @Default(false) bool allowMultiSelect,

    /// Si permite selección de rango
    @Default(false) bool allowRangeSelect,

    /// Si muestra números de semana
    @Default(false) bool showWeekNumbers,

    /// Si muestra eventos en vista de mes
    @Default(true) bool showEventsInMonth,

    /// Máximo número de eventos a mostrar por día en vista de mes
    @Default(3) int maxEventsPerDay,

    /// Si muestra header de navegación
    @Default(true) bool showHeader,

    /// Si muestra controles de navegación
    @Default(true) bool showNavigationControls,

    /// Si muestra selector de vista
    @Default(true) bool showViewSelector,

    /// Si muestra botón "hoy"
    @Default(true) bool showTodayButton,

    /// Hora de inicio para vistas de día/semana
    @Default(0) int startHour,

    /// Hora de fin para vistas de día/semana
    @Default(24) int endHour,

    /// Intervalo de tiempo en minutos
    @Default(30) int timeSlotDuration,

    /// Altura de cada slot de tiempo
    @Default(60.0) double timeSlotHeight,

    /// Si muestra línea de tiempo actual
    @Default(true) bool showCurrentTimeLine,

    /// Si muestra horarios de trabajo
    @Default(true) bool showWorkingHours,

    /// Configuración de localización
    AppCalendarLocalization? localization,

    /// Callback cuando se toca un evento
    @JsonKey(includeFromJson: false, includeToJson: false) AppCalendarEventTapCallback? onEventTap,

    /// Callback cuando se toca una fecha
    @JsonKey(includeFromJson: false, includeToJson: false) AppCalendarDateTapCallback? onDateTap,

    /// Callback cuando se selecciona un rango
    @JsonKey(includeFromJson: false, includeToJson: false) AppCalendarDateRangeSelectCallback? onRangeSelect,

    /// Callback cuando cambia la vista
    @JsonKey(includeFromJson: false, includeToJson: false) void Function(AppCalendarVariant variant)? onViewChange,

    /// Callback cuando cambia la fecha
    @JsonKey(includeFromJson: false, includeToJson: false) void Function(DateTime date)? onDateChange,

    /// Callback cuando se crea un evento
    @JsonKey(includeFromJson: false, includeToJson: false) void Function(DateTime start, DateTime end)? onEventCreate,

    /// Callback cuando se mueve un evento
    @JsonKey(includeFromJson: false, includeToJson: false) void Function(AppCalendarEvent event, DateTime newStart)? onEventMove,

    /// Callback cuando se redimensiona un evento
    @JsonKey(includeFromJson: false, includeToJson: false) void Function(AppCalendarEvent event, DateTime newStart, DateTime newEnd)?
        onEventResize,

    // Propiedades de estilo usando design tokens

    /// Padding del calendario
    @JsonKey(includeFromJson: false, includeToJson: false) EdgeInsets? padding,

    /// Margin del calendario
    @JsonKey(includeFromJson: false, includeToJson: false) EdgeInsets? margin,

    /// Color de fondo del calendario
    Color? backgroundColor,

    /// Color de fondo del header
    Color? headerBackgroundColor,

    /// Color del texto del header
    Color? headerTextColor,

    /// Color de fondo de las celdas
    Color? cellBackgroundColor,

    /// Color del borde de las celdas
    Color? cellBorderColor,

    /// Color de fondo del día actual
    Color? todayBackgroundColor,

    /// Color del texto del día actual
    Color? todayTextColor,

    /// Color de fondo del día seleccionado
    Color? selectedBackgroundColor,

    /// Color del texto del día seleccionado
    Color? selectedTextColor,

    /// Color de fondo de días deshabilitados
    Color? disabledBackgroundColor,

    /// Color del texto de días deshabilitados
    Color? disabledTextColor,

    /// Color de fondo de fin de semana
    Color? weekendBackgroundColor,

    /// Color del texto de fin de semana
    Color? weekendTextColor,

    /// Color de la línea de tiempo actual
    Color? currentTimeLineColor,

    /// Color de fondo de horario de trabajo
    Color? workingHoursBackgroundColor,

    /// Color de fondo de horario no laboral
    Color? nonWorkingHoursBackgroundColor,

    /// Radio de borde de las celdas
    @JsonKey(includeFromJson: false, includeToJson: false) BorderRadius? cellBorderRadius,

    /// Radio de borde del calendario
    @JsonKey(includeFromJson: false, includeToJson: false) BorderRadius? borderRadius,

    /// Sombra del calendario
    @JsonKey(includeFromJson: false, includeToJson: false) List<BoxShadow>? boxShadow,

    /// Estilo del texto del header
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? headerTextStyle,

    /// Estilo del texto de las fechas
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? dateTextStyle,

    /// Estilo del texto de los eventos
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? eventTextStyle,

    /// Estilo del texto de las horas
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? timeTextStyle,

    /// Altura del header
    @Default(56.0) double headerHeight,

    /// Altura de las celdas de fecha
    @Default(48.0) double cellHeight,

    /// Ancho mínimo de las celdas
    @Default(48.0) double cellMinWidth,

    /// Espaciado entre eventos
    @Default(2.0) double eventSpacing,

    /// Altura de los eventos en vista de mes
    @Default(20.0) double eventHeight,

    /// Radio de borde de los eventos
    @Default(4.0) double eventBorderRadius,

    /// Animaciones habilitadas
    @Default(true) bool animationsEnabled,

    /// Duración de las animaciones
    @Default(Duration(milliseconds: 300)) Duration animationDuration,

    /// Soporte para navegación por teclado
    @Default(true) bool keyboardNavigationEnabled,

    /// Soporte para gestos táctiles
    @Default(true) bool gesturesEnabled,

    /// Soporte para zoom en vista de semana/día
    @Default(true) bool zoomEnabled,

    /// Factor de zoom mínimo
    @Default(0.5) double minZoomFactor,

    /// Factor de zoom máximo
    @Default(2.0) double maxZoomFactor,
  }) = _AppCalendarConfig;

}

/// Helpers para crear configuraciones predefinidas
class AppCalendarDefaults {
  /// Configuración por defecto para vista de mes
  static AppCalendarConfig month({
    List<AppCalendarEvent>? events,
    DateTime? selectedDate,
    AppCalendarEventTapCallback? onEventTap,
    AppCalendarDateTapCallback? onDateTap,
  }) {
    return AppCalendarConfig(
      variant: AppCalendarVariant.month,
      events: events ?? [],
      selectedDate: selectedDate ?? DateTime.now(),
      onEventTap: onEventTap,
      onDateTap: onDateTap,
      showEventsInMonth: true,
      maxEventsPerDay: 3,
    );
  }

  /// Configuración por defecto para vista de semana
  static AppCalendarConfig week({
    List<AppCalendarEvent>? events,
    List<AppCalendarResource>? resources,
    DateTime? selectedDate,
    AppCalendarEventTapCallback? onEventTap,
    AppCalendarDateTapCallback? onDateTap,
  }) {
    return AppCalendarConfig(
      variant: AppCalendarVariant.week,
      events: events ?? [],
      resources: resources ?? [],
      selectedDate: selectedDate ?? DateTime.now(),
      onEventTap: onEventTap,
      onDateTap: onDateTap,
      startHour: 8,
      endHour: 18,
      timeSlotDuration: 30,
      showCurrentTimeLine: true,
      showWorkingHours: true,
    );
  }

  /// Configuración por defecto para vista de día
  static AppCalendarConfig day({
    List<AppCalendarEvent>? events,
    List<AppCalendarResource>? resources,
    DateTime? selectedDate,
    AppCalendarEventTapCallback? onEventTap,
    AppCalendarDateTapCallback? onDateTap,
  }) {
    return AppCalendarConfig(
      variant: AppCalendarVariant.day,
      events: events ?? [],
      resources: resources ?? [],
      selectedDate: selectedDate ?? DateTime.now(),
      onEventTap: onEventTap,
      onDateTap: onDateTap,
      startHour: 6,
      endHour: 22,
      timeSlotDuration: 15,
      showCurrentTimeLine: true,
      showWorkingHours: true,
      timeSlotHeight: 80.0,
    );
  }

  /// Localización en español
  static AppCalendarLocalization spanish() {
    return const AppCalendarLocalization(
      locale: 'es',
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
      monthNamesShort: [
        'Ene',
        'Feb',
        'Mar',
        'Abr',
        'May',
        'Jun',
        'Jul',
        'Ago',
        'Sep',
        'Oct',
        'Nov',
        'Dic'
      ],
      dayNames: [
        'Lunes',
        'Martes',
        'Miércoles',
        'Jueves',
        'Viernes',
        'Sábado',
        'Domingo'
      ],
      dayNamesShort: ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
      firstDayOfWeek: 1,
      timeFormat: 24,
      labels: {
        'today': 'Hoy',
        'week': 'Semana',
        'month': 'Mes',
        'day': 'Día',
        'events': 'Eventos',
        'noEvents': 'No hay eventos',
        'allDay': 'Todo el día',
        'more': 'más',
        'previous': 'Anterior',
        'next': 'Siguiente',
        'loading': 'Cargando...',
      },
    );
  }

  /// Localización en inglés
  static AppCalendarLocalization english() {
    return const AppCalendarLocalization(
      locale: 'en',
      monthNames: [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ],
      monthNamesShort: [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ],
      dayNames: [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ],
      dayNamesShort: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
      firstDayOfWeek: 1,
      timeFormat: 12,
      labels: {
        'today': 'Today',
        'week': 'Week',
        'month': 'Month',
        'day': 'Day',
        'events': 'Events',
        'noEvents': 'No events',
        'allDay': 'All day',
        'more': 'more',
        'previous': 'Previous',
        'next': 'Next',
        'loading': 'Loading...',
      },
    );
  }
}
