// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSCalendarEvent {
  /// ID único del evento
  String get id => throw _privateConstructorUsedError;

  /// Título del evento
  String get title => throw _privateConstructorUsedError;

  /// Descripción opcional del evento
  String? get description => throw _privateConstructorUsedError;

  /// Fecha y hora de inicio
  DateTime get startTime => throw _privateConstructorUsedError;

  /// Fecha y hora de fin
  DateTime get endTime => throw _privateConstructorUsedError;

  /// Tipo de evento
  DSCalendarEventType get type => throw _privateConstructorUsedError;

  /// Prioridad del evento
  DSCalendarEventPriority get priority => throw _privateConstructorUsedError;

  /// Color del evento (si no se especifica usa el del tipo)
  Color? get color => throw _privateConstructorUsedError;

  /// Color del texto del evento
  Color? get textColor => throw _privateConstructorUsedError;

  /// Color de fondo del evento
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color del borde del evento
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Si el evento es de todo el día
  bool get isAllDay => throw _privateConstructorUsedError;

  /// Si el evento se puede editar
  bool get isEditable => throw _privateConstructorUsedError;

  /// Si el evento se puede eliminar
  bool get isDeletable => throw _privateConstructorUsedError;

  /// Si el evento se puede mover
  bool get isMovable => throw _privateConstructorUsedError;

  /// Si el evento se puede redimensionar
  bool get isResizable => throw _privateConstructorUsedError;

  /// Ubicación del evento
  String? get location => throw _privateConstructorUsedError;

  /// Asistentes del evento
  List<String> get attendees => throw _privateConstructorUsedError;

  /// URL del evento
  String? get url => throw _privateConstructorUsedError;

  /// Metadatos adicionales
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// ID del recurso al que pertenece el evento
  String? get resourceId => throw _privateConstructorUsedError;

  /// Eventos recurrentes - ID del evento padre
  String? get recurringEventId => throw _privateConstructorUsedError;

  /// Si es un evento recurrente
  bool get isRecurring => throw _privateConstructorUsedError;

  /// Patrón de recurrencia
  String? get recurrenceRule => throw _privateConstructorUsedError;

  /// Zona horaria del evento
  String? get timeZone => throw _privateConstructorUsedError;

  /// Create a copy of DSCalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCalendarEventCopyWith<DSCalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCalendarEventCopyWith<$Res> {
  factory $DSCalendarEventCopyWith(
    DSCalendarEvent value,
    $Res Function(DSCalendarEvent) then,
  ) = _$DSCalendarEventCopyWithImpl<$Res, DSCalendarEvent>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    DateTime startTime,
    DateTime endTime,
    DSCalendarEventType type,
    DSCalendarEventPriority priority,
    Color? color,
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    bool isAllDay,
    bool isEditable,
    bool isDeletable,
    bool isMovable,
    bool isResizable,
    String? location,
    List<String> attendees,
    String? url,
    Map<String, dynamic> metadata,
    String? resourceId,
    String? recurringEventId,
    bool isRecurring,
    String? recurrenceRule,
    String? timeZone,
  });
}

/// @nodoc
class _$DSCalendarEventCopyWithImpl<$Res, $Val extends DSCalendarEvent>
    implements $DSCalendarEventCopyWith<$Res> {
  _$DSCalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? priority = null,
    Object? color = freezed,
    Object? textColor = freezed,
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? isAllDay = null,
    Object? isEditable = null,
    Object? isDeletable = null,
    Object? isMovable = null,
    Object? isResizable = null,
    Object? location = freezed,
    Object? attendees = null,
    Object? url = freezed,
    Object? metadata = null,
    Object? resourceId = freezed,
    Object? recurringEventId = freezed,
    Object? isRecurring = null,
    Object? recurrenceRule = freezed,
    Object? timeZone = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSCalendarEventType,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as DSCalendarEventPriority,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            textColor: freezed == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            isAllDay: null == isAllDay
                ? _value.isAllDay
                : isAllDay // ignore: cast_nullable_to_non_nullable
                      as bool,
            isEditable: null == isEditable
                ? _value.isEditable
                : isEditable // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDeletable: null == isDeletable
                ? _value.isDeletable
                : isDeletable // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMovable: null == isMovable
                ? _value.isMovable
                : isMovable // ignore: cast_nullable_to_non_nullable
                      as bool,
            isResizable: null == isResizable
                ? _value.isResizable
                : isResizable // ignore: cast_nullable_to_non_nullable
                      as bool,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            attendees: null == attendees
                ? _value.attendees
                : attendees // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            resourceId: freezed == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            recurringEventId: freezed == recurringEventId
                ? _value.recurringEventId
                : recurringEventId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
            recurrenceRule: freezed == recurrenceRule
                ? _value.recurrenceRule
                : recurrenceRule // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeZone: freezed == timeZone
                ? _value.timeZone
                : timeZone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCalendarEventImplCopyWith<$Res>
    implements $DSCalendarEventCopyWith<$Res> {
  factory _$$DSCalendarEventImplCopyWith(
    _$DSCalendarEventImpl value,
    $Res Function(_$DSCalendarEventImpl) then,
  ) = __$$DSCalendarEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    DateTime startTime,
    DateTime endTime,
    DSCalendarEventType type,
    DSCalendarEventPriority priority,
    Color? color,
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    bool isAllDay,
    bool isEditable,
    bool isDeletable,
    bool isMovable,
    bool isResizable,
    String? location,
    List<String> attendees,
    String? url,
    Map<String, dynamic> metadata,
    String? resourceId,
    String? recurringEventId,
    bool isRecurring,
    String? recurrenceRule,
    String? timeZone,
  });
}

/// @nodoc
class __$$DSCalendarEventImplCopyWithImpl<$Res>
    extends _$DSCalendarEventCopyWithImpl<$Res, _$DSCalendarEventImpl>
    implements _$$DSCalendarEventImplCopyWith<$Res> {
  __$$DSCalendarEventImplCopyWithImpl(
    _$DSCalendarEventImpl _value,
    $Res Function(_$DSCalendarEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? priority = null,
    Object? color = freezed,
    Object? textColor = freezed,
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? isAllDay = null,
    Object? isEditable = null,
    Object? isDeletable = null,
    Object? isMovable = null,
    Object? isResizable = null,
    Object? location = freezed,
    Object? attendees = null,
    Object? url = freezed,
    Object? metadata = null,
    Object? resourceId = freezed,
    Object? recurringEventId = freezed,
    Object? isRecurring = null,
    Object? recurrenceRule = freezed,
    Object? timeZone = freezed,
  }) {
    return _then(
      _$DSCalendarEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSCalendarEventType,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as DSCalendarEventPriority,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textColor: freezed == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        isAllDay: null == isAllDay
            ? _value.isAllDay
            : isAllDay // ignore: cast_nullable_to_non_nullable
                  as bool,
        isEditable: null == isEditable
            ? _value.isEditable
            : isEditable // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDeletable: null == isDeletable
            ? _value.isDeletable
            : isDeletable // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMovable: null == isMovable
            ? _value.isMovable
            : isMovable // ignore: cast_nullable_to_non_nullable
                  as bool,
        isResizable: null == isResizable
            ? _value.isResizable
            : isResizable // ignore: cast_nullable_to_non_nullable
                  as bool,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        attendees: null == attendees
            ? _value._attendees
            : attendees // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        resourceId: freezed == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        recurringEventId: freezed == recurringEventId
            ? _value.recurringEventId
            : recurringEventId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
        recurrenceRule: freezed == recurrenceRule
            ? _value.recurrenceRule
            : recurrenceRule // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeZone: freezed == timeZone
            ? _value.timeZone
            : timeZone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSCalendarEventImpl implements _DSCalendarEvent {
  const _$DSCalendarEventImpl({
    required this.id,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    this.type = DSCalendarEventType.event,
    this.priority = DSCalendarEventPriority.normal,
    this.color,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.isAllDay = false,
    this.isEditable = true,
    this.isDeletable = true,
    this.isMovable = true,
    this.isResizable = true,
    this.location,
    final List<String> attendees = const <String>[],
    this.url,
    final Map<String, dynamic> metadata = const <String, dynamic>{},
    this.resourceId,
    this.recurringEventId,
    this.isRecurring = false,
    this.recurrenceRule,
    this.timeZone,
  }) : _attendees = attendees,
       _metadata = metadata;

  /// ID único del evento
  @override
  final String id;

  /// Título del evento
  @override
  final String title;

  /// Descripción opcional del evento
  @override
  final String? description;

  /// Fecha y hora de inicio
  @override
  final DateTime startTime;

  /// Fecha y hora de fin
  @override
  final DateTime endTime;

  /// Tipo de evento
  @override
  @JsonKey()
  final DSCalendarEventType type;

  /// Prioridad del evento
  @override
  @JsonKey()
  final DSCalendarEventPriority priority;

  /// Color del evento (si no se especifica usa el del tipo)
  @override
  final Color? color;

  /// Color del texto del evento
  @override
  final Color? textColor;

  /// Color de fondo del evento
  @override
  final Color? backgroundColor;

  /// Color del borde del evento
  @override
  final Color? borderColor;

  /// Si el evento es de todo el día
  @override
  @JsonKey()
  final bool isAllDay;

  /// Si el evento se puede editar
  @override
  @JsonKey()
  final bool isEditable;

  /// Si el evento se puede eliminar
  @override
  @JsonKey()
  final bool isDeletable;

  /// Si el evento se puede mover
  @override
  @JsonKey()
  final bool isMovable;

  /// Si el evento se puede redimensionar
  @override
  @JsonKey()
  final bool isResizable;

  /// Ubicación del evento
  @override
  final String? location;

  /// Asistentes del evento
  final List<String> _attendees;

  /// Asistentes del evento
  @override
  @JsonKey()
  List<String> get attendees {
    if (_attendees is EqualUnmodifiableListView) return _attendees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendees);
  }

  /// URL del evento
  @override
  final String? url;

  /// Metadatos adicionales
  final Map<String, dynamic> _metadata;

  /// Metadatos adicionales
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  /// ID del recurso al que pertenece el evento
  @override
  final String? resourceId;

  /// Eventos recurrentes - ID del evento padre
  @override
  final String? recurringEventId;

  /// Si es un evento recurrente
  @override
  @JsonKey()
  final bool isRecurring;

  /// Patrón de recurrencia
  @override
  final String? recurrenceRule;

  /// Zona horaria del evento
  @override
  final String? timeZone;

  @override
  String toString() {
    return 'DSCalendarEvent(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, type: $type, priority: $priority, color: $color, textColor: $textColor, backgroundColor: $backgroundColor, borderColor: $borderColor, isAllDay: $isAllDay, isEditable: $isEditable, isDeletable: $isDeletable, isMovable: $isMovable, isResizable: $isResizable, location: $location, attendees: $attendees, url: $url, metadata: $metadata, resourceId: $resourceId, recurringEventId: $recurringEventId, isRecurring: $isRecurring, recurrenceRule: $recurrenceRule, timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCalendarEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.isDeletable, isDeletable) ||
                other.isDeletable == isDeletable) &&
            (identical(other.isMovable, isMovable) ||
                other.isMovable == isMovable) &&
            (identical(other.isResizable, isResizable) ||
                other.isResizable == isResizable) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(
              other._attendees,
              _attendees,
            ) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.recurringEventId, recurringEventId) ||
                other.recurringEventId == recurringEventId) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurrenceRule, recurrenceRule) ||
                other.recurrenceRule == recurrenceRule) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    description,
    startTime,
    endTime,
    type,
    priority,
    color,
    textColor,
    backgroundColor,
    borderColor,
    isAllDay,
    isEditable,
    isDeletable,
    isMovable,
    isResizable,
    location,
    const DeepCollectionEquality().hash(_attendees),
    url,
    const DeepCollectionEquality().hash(_metadata),
    resourceId,
    recurringEventId,
    isRecurring,
    recurrenceRule,
    timeZone,
  ]);

  /// Create a copy of DSCalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCalendarEventImplCopyWith<_$DSCalendarEventImpl> get copyWith =>
      __$$DSCalendarEventImplCopyWithImpl<_$DSCalendarEventImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCalendarEvent implements DSCalendarEvent {
  const factory _DSCalendarEvent({
    required final String id,
    required final String title,
    final String? description,
    required final DateTime startTime,
    required final DateTime endTime,
    final DSCalendarEventType type,
    final DSCalendarEventPriority priority,
    final Color? color,
    final Color? textColor,
    final Color? backgroundColor,
    final Color? borderColor,
    final bool isAllDay,
    final bool isEditable,
    final bool isDeletable,
    final bool isMovable,
    final bool isResizable,
    final String? location,
    final List<String> attendees,
    final String? url,
    final Map<String, dynamic> metadata,
    final String? resourceId,
    final String? recurringEventId,
    final bool isRecurring,
    final String? recurrenceRule,
    final String? timeZone,
  }) = _$DSCalendarEventImpl;

  /// ID único del evento
  @override
  String get id;

  /// Título del evento
  @override
  String get title;

  /// Descripción opcional del evento
  @override
  String? get description;

  /// Fecha y hora de inicio
  @override
  DateTime get startTime;

  /// Fecha y hora de fin
  @override
  DateTime get endTime;

  /// Tipo de evento
  @override
  DSCalendarEventType get type;

  /// Prioridad del evento
  @override
  DSCalendarEventPriority get priority;

  /// Color del evento (si no se especifica usa el del tipo)
  @override
  Color? get color;

  /// Color del texto del evento
  @override
  Color? get textColor;

  /// Color de fondo del evento
  @override
  Color? get backgroundColor;

  /// Color del borde del evento
  @override
  Color? get borderColor;

  /// Si el evento es de todo el día
  @override
  bool get isAllDay;

  /// Si el evento se puede editar
  @override
  bool get isEditable;

  /// Si el evento se puede eliminar
  @override
  bool get isDeletable;

  /// Si el evento se puede mover
  @override
  bool get isMovable;

  /// Si el evento se puede redimensionar
  @override
  bool get isResizable;

  /// Ubicación del evento
  @override
  String? get location;

  /// Asistentes del evento
  @override
  List<String> get attendees;

  /// URL del evento
  @override
  String? get url;

  /// Metadatos adicionales
  @override
  Map<String, dynamic> get metadata;

  /// ID del recurso al que pertenece el evento
  @override
  String? get resourceId;

  /// Eventos recurrentes - ID del evento padre
  @override
  String? get recurringEventId;

  /// Si es un evento recurrente
  @override
  bool get isRecurring;

  /// Patrón de recurrencia
  @override
  String? get recurrenceRule;

  /// Zona horaria del evento
  @override
  String? get timeZone;

  /// Create a copy of DSCalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCalendarEventImplCopyWith<_$DSCalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCalendarResource {
  /// ID único del recurso
  String get id => throw _privateConstructorUsedError;

  /// Nombre del recurso
  String get name => throw _privateConstructorUsedError;

  /// Descripción del recurso
  String? get description => throw _privateConstructorUsedError;

  /// Color del recurso
  Color? get color => throw _privateConstructorUsedError;

  /// Color del texto del recurso
  Color? get textColor => throw _privateConstructorUsedError;

  /// Color de fondo del recurso
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Avatar/icono del recurso
  String? get avatar => throw _privateConstructorUsedError;

  /// Icono del recurso
  IconData? get icon => throw _privateConstructorUsedError;

  /// Email del recurso (si es una persona)
  String? get email => throw _privateConstructorUsedError;

  /// Teléfono del recurso
  String? get phone => throw _privateConstructorUsedError;

  /// Si el recurso está disponible
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Capacidad del recurso (para salas)
  int? get capacity => throw _privateConstructorUsedError;

  /// Ubicación del recurso
  String? get location => throw _privateConstructorUsedError;

  /// Metadatos adicionales
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Horario de trabajo del recurso
  DSCalendarWorkingHours? get workingHours =>
      throw _privateConstructorUsedError;

  /// Días no laborables
  List<DateTime> get nonWorkingDays => throw _privateConstructorUsedError;

  /// Create a copy of DSCalendarResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCalendarResourceCopyWith<DSCalendarResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCalendarResourceCopyWith<$Res> {
  factory $DSCalendarResourceCopyWith(
    DSCalendarResource value,
    $Res Function(DSCalendarResource) then,
  ) = _$DSCalendarResourceCopyWithImpl<$Res, DSCalendarResource>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    Color? color,
    Color? textColor,
    Color? backgroundColor,
    String? avatar,
    IconData? icon,
    String? email,
    String? phone,
    bool isAvailable,
    int? capacity,
    String? location,
    Map<String, dynamic> metadata,
    DSCalendarWorkingHours? workingHours,
    List<DateTime> nonWorkingDays,
  });

  $DSCalendarWorkingHoursCopyWith<$Res>? get workingHours;
}

/// @nodoc
class _$DSCalendarResourceCopyWithImpl<$Res, $Val extends DSCalendarResource>
    implements $DSCalendarResourceCopyWith<$Res> {
  _$DSCalendarResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCalendarResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? color = freezed,
    Object? textColor = freezed,
    Object? backgroundColor = freezed,
    Object? avatar = freezed,
    Object? icon = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isAvailable = null,
    Object? capacity = freezed,
    Object? location = freezed,
    Object? metadata = null,
    Object? workingHours = freezed,
    Object? nonWorkingDays = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            textColor: freezed == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            capacity: freezed == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            workingHours: freezed == workingHours
                ? _value.workingHours
                : workingHours // ignore: cast_nullable_to_non_nullable
                      as DSCalendarWorkingHours?,
            nonWorkingDays: null == nonWorkingDays
                ? _value.nonWorkingDays
                : nonWorkingDays // ignore: cast_nullable_to_non_nullable
                      as List<DateTime>,
          )
          as $Val,
    );
  }

  /// Create a copy of DSCalendarResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCalendarWorkingHoursCopyWith<$Res>? get workingHours {
    if (_value.workingHours == null) {
      return null;
    }

    return $DSCalendarWorkingHoursCopyWith<$Res>(_value.workingHours!, (value) {
      return _then(_value.copyWith(workingHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSCalendarResourceImplCopyWith<$Res>
    implements $DSCalendarResourceCopyWith<$Res> {
  factory _$$DSCalendarResourceImplCopyWith(
    _$DSCalendarResourceImpl value,
    $Res Function(_$DSCalendarResourceImpl) then,
  ) = __$$DSCalendarResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    Color? color,
    Color? textColor,
    Color? backgroundColor,
    String? avatar,
    IconData? icon,
    String? email,
    String? phone,
    bool isAvailable,
    int? capacity,
    String? location,
    Map<String, dynamic> metadata,
    DSCalendarWorkingHours? workingHours,
    List<DateTime> nonWorkingDays,
  });

  @override
  $DSCalendarWorkingHoursCopyWith<$Res>? get workingHours;
}

/// @nodoc
class __$$DSCalendarResourceImplCopyWithImpl<$Res>
    extends _$DSCalendarResourceCopyWithImpl<$Res, _$DSCalendarResourceImpl>
    implements _$$DSCalendarResourceImplCopyWith<$Res> {
  __$$DSCalendarResourceImplCopyWithImpl(
    _$DSCalendarResourceImpl _value,
    $Res Function(_$DSCalendarResourceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCalendarResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? color = freezed,
    Object? textColor = freezed,
    Object? backgroundColor = freezed,
    Object? avatar = freezed,
    Object? icon = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isAvailable = null,
    Object? capacity = freezed,
    Object? location = freezed,
    Object? metadata = null,
    Object? workingHours = freezed,
    Object? nonWorkingDays = null,
  }) {
    return _then(
      _$DSCalendarResourceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textColor: freezed == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        capacity: freezed == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        workingHours: freezed == workingHours
            ? _value.workingHours
            : workingHours // ignore: cast_nullable_to_non_nullable
                  as DSCalendarWorkingHours?,
        nonWorkingDays: null == nonWorkingDays
            ? _value._nonWorkingDays
            : nonWorkingDays // ignore: cast_nullable_to_non_nullable
                  as List<DateTime>,
      ),
    );
  }
}

/// @nodoc

class _$DSCalendarResourceImpl implements _DSCalendarResource {
  const _$DSCalendarResourceImpl({
    required this.id,
    required this.name,
    this.description,
    this.color,
    this.textColor,
    this.backgroundColor,
    this.avatar,
    this.icon,
    this.email,
    this.phone,
    this.isAvailable = true,
    this.capacity,
    this.location,
    final Map<String, dynamic> metadata = const <String, dynamic>{},
    this.workingHours,
    final List<DateTime> nonWorkingDays = const <DateTime>[],
  }) : _metadata = metadata,
       _nonWorkingDays = nonWorkingDays;

  /// ID único del recurso
  @override
  final String id;

  /// Nombre del recurso
  @override
  final String name;

  /// Descripción del recurso
  @override
  final String? description;

  /// Color del recurso
  @override
  final Color? color;

  /// Color del texto del recurso
  @override
  final Color? textColor;

  /// Color de fondo del recurso
  @override
  final Color? backgroundColor;

  /// Avatar/icono del recurso
  @override
  final String? avatar;

  /// Icono del recurso
  @override
  final IconData? icon;

  /// Email del recurso (si es una persona)
  @override
  final String? email;

  /// Teléfono del recurso
  @override
  final String? phone;

  /// Si el recurso está disponible
  @override
  @JsonKey()
  final bool isAvailable;

  /// Capacidad del recurso (para salas)
  @override
  final int? capacity;

  /// Ubicación del recurso
  @override
  final String? location;

  /// Metadatos adicionales
  final Map<String, dynamic> _metadata;

  /// Metadatos adicionales
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  /// Horario de trabajo del recurso
  @override
  final DSCalendarWorkingHours? workingHours;

  /// Días no laborables
  final List<DateTime> _nonWorkingDays;

  /// Días no laborables
  @override
  @JsonKey()
  List<DateTime> get nonWorkingDays {
    if (_nonWorkingDays is EqualUnmodifiableListView) return _nonWorkingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nonWorkingDays);
  }

  @override
  String toString() {
    return 'DSCalendarResource(id: $id, name: $name, description: $description, color: $color, textColor: $textColor, backgroundColor: $backgroundColor, avatar: $avatar, icon: $icon, email: $email, phone: $phone, isAvailable: $isAvailable, capacity: $capacity, location: $location, metadata: $metadata, workingHours: $workingHours, nonWorkingDays: $nonWorkingDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCalendarResourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.workingHours, workingHours) ||
                other.workingHours == workingHours) &&
            const DeepCollectionEquality().equals(
              other._nonWorkingDays,
              _nonWorkingDays,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    color,
    textColor,
    backgroundColor,
    avatar,
    icon,
    email,
    phone,
    isAvailable,
    capacity,
    location,
    const DeepCollectionEquality().hash(_metadata),
    workingHours,
    const DeepCollectionEquality().hash(_nonWorkingDays),
  );

  /// Create a copy of DSCalendarResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCalendarResourceImplCopyWith<_$DSCalendarResourceImpl> get copyWith =>
      __$$DSCalendarResourceImplCopyWithImpl<_$DSCalendarResourceImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCalendarResource implements DSCalendarResource {
  const factory _DSCalendarResource({
    required final String id,
    required final String name,
    final String? description,
    final Color? color,
    final Color? textColor,
    final Color? backgroundColor,
    final String? avatar,
    final IconData? icon,
    final String? email,
    final String? phone,
    final bool isAvailable,
    final int? capacity,
    final String? location,
    final Map<String, dynamic> metadata,
    final DSCalendarWorkingHours? workingHours,
    final List<DateTime> nonWorkingDays,
  }) = _$DSCalendarResourceImpl;

  /// ID único del recurso
  @override
  String get id;

  /// Nombre del recurso
  @override
  String get name;

  /// Descripción del recurso
  @override
  String? get description;

  /// Color del recurso
  @override
  Color? get color;

  /// Color del texto del recurso
  @override
  Color? get textColor;

  /// Color de fondo del recurso
  @override
  Color? get backgroundColor;

  /// Avatar/icono del recurso
  @override
  String? get avatar;

  /// Icono del recurso
  @override
  IconData? get icon;

  /// Email del recurso (si es una persona)
  @override
  String? get email;

  /// Teléfono del recurso
  @override
  String? get phone;

  /// Si el recurso está disponible
  @override
  bool get isAvailable;

  /// Capacidad del recurso (para salas)
  @override
  int? get capacity;

  /// Ubicación del recurso
  @override
  String? get location;

  /// Metadatos adicionales
  @override
  Map<String, dynamic> get metadata;

  /// Horario de trabajo del recurso
  @override
  DSCalendarWorkingHours? get workingHours;

  /// Días no laborables
  @override
  List<DateTime> get nonWorkingDays;

  /// Create a copy of DSCalendarResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCalendarResourceImplCopyWith<_$DSCalendarResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCalendarWorkingHours {
  /// Hora de inicio (formato 24h, ej: "09:00")
  String get startTime => throw _privateConstructorUsedError;

  /// Hora de fin (formato 24h, ej: "17:00")
  String get endTime => throw _privateConstructorUsedError;

  /// Días de la semana (1=lunes, 7=domingo)
  List<int> get workingDays => throw _privateConstructorUsedError;

  /// Zona horaria
  String? get timeZone => throw _privateConstructorUsedError;

  /// Create a copy of DSCalendarWorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCalendarWorkingHoursCopyWith<DSCalendarWorkingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCalendarWorkingHoursCopyWith<$Res> {
  factory $DSCalendarWorkingHoursCopyWith(
    DSCalendarWorkingHours value,
    $Res Function(DSCalendarWorkingHours) then,
  ) = _$DSCalendarWorkingHoursCopyWithImpl<$Res, DSCalendarWorkingHours>;
  @useResult
  $Res call({
    String startTime,
    String endTime,
    List<int> workingDays,
    String? timeZone,
  });
}

/// @nodoc
class _$DSCalendarWorkingHoursCopyWithImpl<
  $Res,
  $Val extends DSCalendarWorkingHours
>
    implements $DSCalendarWorkingHoursCopyWith<$Res> {
  _$DSCalendarWorkingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCalendarWorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? workingDays = null,
    Object? timeZone = freezed,
  }) {
    return _then(
      _value.copyWith(
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            workingDays: null == workingDays
                ? _value.workingDays
                : workingDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            timeZone: freezed == timeZone
                ? _value.timeZone
                : timeZone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCalendarWorkingHoursImplCopyWith<$Res>
    implements $DSCalendarWorkingHoursCopyWith<$Res> {
  factory _$$DSCalendarWorkingHoursImplCopyWith(
    _$DSCalendarWorkingHoursImpl value,
    $Res Function(_$DSCalendarWorkingHoursImpl) then,
  ) = __$$DSCalendarWorkingHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String startTime,
    String endTime,
    List<int> workingDays,
    String? timeZone,
  });
}

/// @nodoc
class __$$DSCalendarWorkingHoursImplCopyWithImpl<$Res>
    extends
        _$DSCalendarWorkingHoursCopyWithImpl<$Res, _$DSCalendarWorkingHoursImpl>
    implements _$$DSCalendarWorkingHoursImplCopyWith<$Res> {
  __$$DSCalendarWorkingHoursImplCopyWithImpl(
    _$DSCalendarWorkingHoursImpl _value,
    $Res Function(_$DSCalendarWorkingHoursImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCalendarWorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? workingDays = null,
    Object? timeZone = freezed,
  }) {
    return _then(
      _$DSCalendarWorkingHoursImpl(
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        workingDays: null == workingDays
            ? _value._workingDays
            : workingDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        timeZone: freezed == timeZone
            ? _value.timeZone
            : timeZone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSCalendarWorkingHoursImpl implements _DSCalendarWorkingHours {
  const _$DSCalendarWorkingHoursImpl({
    this.startTime = "09:00",
    this.endTime = "17:00",
    final List<int> workingDays = const <int>[1, 2, 3, 4, 5],
    this.timeZone,
  }) : _workingDays = workingDays;

  /// Hora de inicio (formato 24h, ej: "09:00")
  @override
  @JsonKey()
  final String startTime;

  /// Hora de fin (formato 24h, ej: "17:00")
  @override
  @JsonKey()
  final String endTime;

  /// Días de la semana (1=lunes, 7=domingo)
  final List<int> _workingDays;

  /// Días de la semana (1=lunes, 7=domingo)
  @override
  @JsonKey()
  List<int> get workingDays {
    if (_workingDays is EqualUnmodifiableListView) return _workingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workingDays);
  }

  /// Zona horaria
  @override
  final String? timeZone;

  @override
  String toString() {
    return 'DSCalendarWorkingHours(startTime: $startTime, endTime: $endTime, workingDays: $workingDays, timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCalendarWorkingHoursImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(
              other._workingDays,
              _workingDays,
            ) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    startTime,
    endTime,
    const DeepCollectionEquality().hash(_workingDays),
    timeZone,
  );

  /// Create a copy of DSCalendarWorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCalendarWorkingHoursImplCopyWith<_$DSCalendarWorkingHoursImpl>
  get copyWith =>
      __$$DSCalendarWorkingHoursImplCopyWithImpl<_$DSCalendarWorkingHoursImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCalendarWorkingHours implements DSCalendarWorkingHours {
  const factory _DSCalendarWorkingHours({
    final String startTime,
    final String endTime,
    final List<int> workingDays,
    final String? timeZone,
  }) = _$DSCalendarWorkingHoursImpl;

  /// Hora de inicio (formato 24h, ej: "09:00")
  @override
  String get startTime;

  /// Hora de fin (formato 24h, ej: "17:00")
  @override
  String get endTime;

  /// Días de la semana (1=lunes, 7=domingo)
  @override
  List<int> get workingDays;

  /// Zona horaria
  @override
  String? get timeZone;

  /// Create a copy of DSCalendarWorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCalendarWorkingHoursImplCopyWith<_$DSCalendarWorkingHoursImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCalendarDateStyle {
  /// Color del texto
  Color? get textColor => throw _privateConstructorUsedError;

  /// Color de fondo
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color del borde
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Estilo del texto
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get textStyle => throw _privateConstructorUsedError;

  /// Decoración del contenedor
  @JsonKey(includeFromJson: false, includeToJson: false)
  BoxDecoration? get decoration => throw _privateConstructorUsedError;

  /// Si está habilitado
  bool get enabled => throw _privateConstructorUsedError;

  /// Si está seleccionado
  bool get selected => throw _privateConstructorUsedError;

  /// Si está en el mes actual
  bool get isCurrentMonth => throw _privateConstructorUsedError;

  /// Si es el día de hoy
  bool get isToday => throw _privateConstructorUsedError;

  /// Si es fin de semana
  bool get isWeekend => throw _privateConstructorUsedError;

  /// Si es día festivo
  bool get isHoliday => throw _privateConstructorUsedError;

  /// Create a copy of DSCalendarDateStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCalendarDateStyleCopyWith<DSCalendarDateStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCalendarDateStyleCopyWith<$Res> {
  factory $DSCalendarDateStyleCopyWith(
    DSCalendarDateStyle value,
    $Res Function(DSCalendarDateStyle) then,
  ) = _$DSCalendarDateStyleCopyWithImpl<$Res, DSCalendarDateStyle>;
  @useResult
  $Res call({
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? textStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    BoxDecoration? decoration,
    bool enabled,
    bool selected,
    bool isCurrentMonth,
    bool isToday,
    bool isWeekend,
    bool isHoliday,
  });
}

/// @nodoc
class _$DSCalendarDateStyleCopyWithImpl<$Res, $Val extends DSCalendarDateStyle>
    implements $DSCalendarDateStyleCopyWith<$Res> {
  _$DSCalendarDateStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCalendarDateStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textColor = freezed,
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? textStyle = freezed,
    Object? decoration = freezed,
    Object? enabled = null,
    Object? selected = null,
    Object? isCurrentMonth = null,
    Object? isToday = null,
    Object? isWeekend = null,
    Object? isHoliday = null,
  }) {
    return _then(
      _value.copyWith(
            textColor: freezed == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            textStyle: freezed == textStyle
                ? _value.textStyle
                : textStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            decoration: freezed == decoration
                ? _value.decoration
                : decoration // ignore: cast_nullable_to_non_nullable
                      as BoxDecoration?,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            selected: null == selected
                ? _value.selected
                : selected // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCurrentMonth: null == isCurrentMonth
                ? _value.isCurrentMonth
                : isCurrentMonth // ignore: cast_nullable_to_non_nullable
                      as bool,
            isToday: null == isToday
                ? _value.isToday
                : isToday // ignore: cast_nullable_to_non_nullable
                      as bool,
            isWeekend: null == isWeekend
                ? _value.isWeekend
                : isWeekend // ignore: cast_nullable_to_non_nullable
                      as bool,
            isHoliday: null == isHoliday
                ? _value.isHoliday
                : isHoliday // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCalendarDateStyleImplCopyWith<$Res>
    implements $DSCalendarDateStyleCopyWith<$Res> {
  factory _$$DSCalendarDateStyleImplCopyWith(
    _$DSCalendarDateStyleImpl value,
    $Res Function(_$DSCalendarDateStyleImpl) then,
  ) = __$$DSCalendarDateStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    @JsonKey(includeFromJson: false, includeToJson: false) TextStyle? textStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    BoxDecoration? decoration,
    bool enabled,
    bool selected,
    bool isCurrentMonth,
    bool isToday,
    bool isWeekend,
    bool isHoliday,
  });
}

/// @nodoc
class __$$DSCalendarDateStyleImplCopyWithImpl<$Res>
    extends _$DSCalendarDateStyleCopyWithImpl<$Res, _$DSCalendarDateStyleImpl>
    implements _$$DSCalendarDateStyleImplCopyWith<$Res> {
  __$$DSCalendarDateStyleImplCopyWithImpl(
    _$DSCalendarDateStyleImpl _value,
    $Res Function(_$DSCalendarDateStyleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCalendarDateStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textColor = freezed,
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? textStyle = freezed,
    Object? decoration = freezed,
    Object? enabled = null,
    Object? selected = null,
    Object? isCurrentMonth = null,
    Object? isToday = null,
    Object? isWeekend = null,
    Object? isHoliday = null,
  }) {
    return _then(
      _$DSCalendarDateStyleImpl(
        textColor: freezed == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textStyle: freezed == textStyle
            ? _value.textStyle
            : textStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        decoration: freezed == decoration
            ? _value.decoration
            : decoration // ignore: cast_nullable_to_non_nullable
                  as BoxDecoration?,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        selected: null == selected
            ? _value.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCurrentMonth: null == isCurrentMonth
            ? _value.isCurrentMonth
            : isCurrentMonth // ignore: cast_nullable_to_non_nullable
                  as bool,
        isToday: null == isToday
            ? _value.isToday
            : isToday // ignore: cast_nullable_to_non_nullable
                  as bool,
        isWeekend: null == isWeekend
            ? _value.isWeekend
            : isWeekend // ignore: cast_nullable_to_non_nullable
                  as bool,
        isHoliday: null == isHoliday
            ? _value.isHoliday
            : isHoliday // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSCalendarDateStyleImpl implements _DSCalendarDateStyle {
  const _$DSCalendarDateStyleImpl({
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    @JsonKey(includeFromJson: false, includeToJson: false) this.textStyle,
    @JsonKey(includeFromJson: false, includeToJson: false) this.decoration,
    this.enabled = true,
    this.selected = false,
    this.isCurrentMonth = true,
    this.isToday = false,
    this.isWeekend = false,
    this.isHoliday = false,
  });

  /// Color del texto
  @override
  final Color? textColor;

  /// Color de fondo
  @override
  final Color? backgroundColor;

  /// Color del borde
  @override
  final Color? borderColor;

  /// Estilo del texto
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextStyle? textStyle;

  /// Decoración del contenedor
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final BoxDecoration? decoration;

  /// Si está habilitado
  @override
  @JsonKey()
  final bool enabled;

  /// Si está seleccionado
  @override
  @JsonKey()
  final bool selected;

  /// Si está en el mes actual
  @override
  @JsonKey()
  final bool isCurrentMonth;

  /// Si es el día de hoy
  @override
  @JsonKey()
  final bool isToday;

  /// Si es fin de semana
  @override
  @JsonKey()
  final bool isWeekend;

  /// Si es día festivo
  @override
  @JsonKey()
  final bool isHoliday;

  @override
  String toString() {
    return 'DSCalendarDateStyle(textColor: $textColor, backgroundColor: $backgroundColor, borderColor: $borderColor, textStyle: $textStyle, decoration: $decoration, enabled: $enabled, selected: $selected, isCurrentMonth: $isCurrentMonth, isToday: $isToday, isWeekend: $isWeekend, isHoliday: $isHoliday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCalendarDateStyleImpl &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle) &&
            (identical(other.decoration, decoration) ||
                other.decoration == decoration) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.isCurrentMonth, isCurrentMonth) ||
                other.isCurrentMonth == isCurrentMonth) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.isWeekend, isWeekend) ||
                other.isWeekend == isWeekend) &&
            (identical(other.isHoliday, isHoliday) ||
                other.isHoliday == isHoliday));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    textColor,
    backgroundColor,
    borderColor,
    textStyle,
    decoration,
    enabled,
    selected,
    isCurrentMonth,
    isToday,
    isWeekend,
    isHoliday,
  );

  /// Create a copy of DSCalendarDateStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCalendarDateStyleImplCopyWith<_$DSCalendarDateStyleImpl> get copyWith =>
      __$$DSCalendarDateStyleImplCopyWithImpl<_$DSCalendarDateStyleImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCalendarDateStyle implements DSCalendarDateStyle {
  const factory _DSCalendarDateStyle({
    final Color? textColor,
    final Color? backgroundColor,
    final Color? borderColor,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextStyle? textStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final BoxDecoration? decoration,
    final bool enabled,
    final bool selected,
    final bool isCurrentMonth,
    final bool isToday,
    final bool isWeekend,
    final bool isHoliday,
  }) = _$DSCalendarDateStyleImpl;

  /// Color del texto
  @override
  Color? get textColor;

  /// Color de fondo
  @override
  Color? get backgroundColor;

  /// Color del borde
  @override
  Color? get borderColor;

  /// Estilo del texto
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get textStyle;

  /// Decoración del contenedor
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  BoxDecoration? get decoration;

  /// Si está habilitado
  @override
  bool get enabled;

  /// Si está seleccionado
  @override
  bool get selected;

  /// Si está en el mes actual
  @override
  bool get isCurrentMonth;

  /// Si es el día de hoy
  @override
  bool get isToday;

  /// Si es fin de semana
  @override
  bool get isWeekend;

  /// Si es día festivo
  @override
  bool get isHoliday;

  /// Create a copy of DSCalendarDateStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCalendarDateStyleImplCopyWith<_$DSCalendarDateStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCalendarLocalization {
  /// Idioma (es, en, etc.)
  String get locale => throw _privateConstructorUsedError;

  /// Nombres de los meses
  List<String> get monthNames => throw _privateConstructorUsedError;

  /// Nombres cortos de los meses
  List<String> get monthNamesShort => throw _privateConstructorUsedError;

  /// Nombres de los días de la semana
  List<String> get dayNames => throw _privateConstructorUsedError;

  /// Nombres cortos de los días
  List<String> get dayNamesShort => throw _privateConstructorUsedError;

  /// Primer día de la semana (1=lunes, 7=domingo)
  int get firstDayOfWeek => throw _privateConstructorUsedError;

  /// Formato de hora (12h o 24h)
  int get timeFormat => throw _privateConstructorUsedError;

  /// Textos de interfaz
  Map<String, String> get labels => throw _privateConstructorUsedError;

  /// Create a copy of DSCalendarLocalization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCalendarLocalizationCopyWith<DSCalendarLocalization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCalendarLocalizationCopyWith<$Res> {
  factory $DSCalendarLocalizationCopyWith(
    DSCalendarLocalization value,
    $Res Function(DSCalendarLocalization) then,
  ) = _$DSCalendarLocalizationCopyWithImpl<$Res, DSCalendarLocalization>;
  @useResult
  $Res call({
    String locale,
    List<String> monthNames,
    List<String> monthNamesShort,
    List<String> dayNames,
    List<String> dayNamesShort,
    int firstDayOfWeek,
    int timeFormat,
    Map<String, String> labels,
  });
}

/// @nodoc
class _$DSCalendarLocalizationCopyWithImpl<
  $Res,
  $Val extends DSCalendarLocalization
>
    implements $DSCalendarLocalizationCopyWith<$Res> {
  _$DSCalendarLocalizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCalendarLocalization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? monthNames = null,
    Object? monthNamesShort = null,
    Object? dayNames = null,
    Object? dayNamesShort = null,
    Object? firstDayOfWeek = null,
    Object? timeFormat = null,
    Object? labels = null,
  }) {
    return _then(
      _value.copyWith(
            locale: null == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                      as String,
            monthNames: null == monthNames
                ? _value.monthNames
                : monthNames // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            monthNamesShort: null == monthNamesShort
                ? _value.monthNamesShort
                : monthNamesShort // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            dayNames: null == dayNames
                ? _value.dayNames
                : dayNames // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            dayNamesShort: null == dayNamesShort
                ? _value.dayNamesShort
                : dayNamesShort // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            firstDayOfWeek: null == firstDayOfWeek
                ? _value.firstDayOfWeek
                : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            timeFormat: null == timeFormat
                ? _value.timeFormat
                : timeFormat // ignore: cast_nullable_to_non_nullable
                      as int,
            labels: null == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCalendarLocalizationImplCopyWith<$Res>
    implements $DSCalendarLocalizationCopyWith<$Res> {
  factory _$$DSCalendarLocalizationImplCopyWith(
    _$DSCalendarLocalizationImpl value,
    $Res Function(_$DSCalendarLocalizationImpl) then,
  ) = __$$DSCalendarLocalizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String locale,
    List<String> monthNames,
    List<String> monthNamesShort,
    List<String> dayNames,
    List<String> dayNamesShort,
    int firstDayOfWeek,
    int timeFormat,
    Map<String, String> labels,
  });
}

/// @nodoc
class __$$DSCalendarLocalizationImplCopyWithImpl<$Res>
    extends
        _$DSCalendarLocalizationCopyWithImpl<$Res, _$DSCalendarLocalizationImpl>
    implements _$$DSCalendarLocalizationImplCopyWith<$Res> {
  __$$DSCalendarLocalizationImplCopyWithImpl(
    _$DSCalendarLocalizationImpl _value,
    $Res Function(_$DSCalendarLocalizationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCalendarLocalization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? monthNames = null,
    Object? monthNamesShort = null,
    Object? dayNames = null,
    Object? dayNamesShort = null,
    Object? firstDayOfWeek = null,
    Object? timeFormat = null,
    Object? labels = null,
  }) {
    return _then(
      _$DSCalendarLocalizationImpl(
        locale: null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String,
        monthNames: null == monthNames
            ? _value._monthNames
            : monthNames // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        monthNamesShort: null == monthNamesShort
            ? _value._monthNamesShort
            : monthNamesShort // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        dayNames: null == dayNames
            ? _value._dayNames
            : dayNames // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        dayNamesShort: null == dayNamesShort
            ? _value._dayNamesShort
            : dayNamesShort // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        firstDayOfWeek: null == firstDayOfWeek
            ? _value.firstDayOfWeek
            : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        timeFormat: null == timeFormat
            ? _value.timeFormat
            : timeFormat // ignore: cast_nullable_to_non_nullable
                  as int,
        labels: null == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$DSCalendarLocalizationImpl implements _DSCalendarLocalization {
  const _$DSCalendarLocalizationImpl({
    this.locale = 'es',
    final List<String> monthNames = const <String>[
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
      'Diciembre',
    ],
    final List<String> monthNamesShort = const <String>[
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
      'Dic',
    ],
    final List<String> dayNames = const <String>[
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo',
    ],
    final List<String> dayNamesShort = const <String>[
      'L',
      'M',
      'X',
      'J',
      'V',
      'S',
      'D',
    ],
    this.firstDayOfWeek = 1,
    this.timeFormat = 24,
    final Map<String, String> labels = const <String, String>{
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
  }) : _monthNames = monthNames,
       _monthNamesShort = monthNamesShort,
       _dayNames = dayNames,
       _dayNamesShort = dayNamesShort,
       _labels = labels;

  /// Idioma (es, en, etc.)
  @override
  @JsonKey()
  final String locale;

  /// Nombres de los meses
  final List<String> _monthNames;

  /// Nombres de los meses
  @override
  @JsonKey()
  List<String> get monthNames {
    if (_monthNames is EqualUnmodifiableListView) return _monthNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthNames);
  }

  /// Nombres cortos de los meses
  final List<String> _monthNamesShort;

  /// Nombres cortos de los meses
  @override
  @JsonKey()
  List<String> get monthNamesShort {
    if (_monthNamesShort is EqualUnmodifiableListView) return _monthNamesShort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthNamesShort);
  }

  /// Nombres de los días de la semana
  final List<String> _dayNames;

  /// Nombres de los días de la semana
  @override
  @JsonKey()
  List<String> get dayNames {
    if (_dayNames is EqualUnmodifiableListView) return _dayNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayNames);
  }

  /// Nombres cortos de los días
  final List<String> _dayNamesShort;

  /// Nombres cortos de los días
  @override
  @JsonKey()
  List<String> get dayNamesShort {
    if (_dayNamesShort is EqualUnmodifiableListView) return _dayNamesShort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayNamesShort);
  }

  /// Primer día de la semana (1=lunes, 7=domingo)
  @override
  @JsonKey()
  final int firstDayOfWeek;

  /// Formato de hora (12h o 24h)
  @override
  @JsonKey()
  final int timeFormat;

  /// Textos de interfaz
  final Map<String, String> _labels;

  /// Textos de interfaz
  @override
  @JsonKey()
  Map<String, String> get labels {
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labels);
  }

  @override
  String toString() {
    return 'DSCalendarLocalization(locale: $locale, monthNames: $monthNames, monthNamesShort: $monthNamesShort, dayNames: $dayNames, dayNamesShort: $dayNamesShort, firstDayOfWeek: $firstDayOfWeek, timeFormat: $timeFormat, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCalendarLocalizationImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality().equals(
              other._monthNames,
              _monthNames,
            ) &&
            const DeepCollectionEquality().equals(
              other._monthNamesShort,
              _monthNamesShort,
            ) &&
            const DeepCollectionEquality().equals(other._dayNames, _dayNames) &&
            const DeepCollectionEquality().equals(
              other._dayNamesShort,
              _dayNamesShort,
            ) &&
            (identical(other.firstDayOfWeek, firstDayOfWeek) ||
                other.firstDayOfWeek == firstDayOfWeek) &&
            (identical(other.timeFormat, timeFormat) ||
                other.timeFormat == timeFormat) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    locale,
    const DeepCollectionEquality().hash(_monthNames),
    const DeepCollectionEquality().hash(_monthNamesShort),
    const DeepCollectionEquality().hash(_dayNames),
    const DeepCollectionEquality().hash(_dayNamesShort),
    firstDayOfWeek,
    timeFormat,
    const DeepCollectionEquality().hash(_labels),
  );

  /// Create a copy of DSCalendarLocalization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCalendarLocalizationImplCopyWith<_$DSCalendarLocalizationImpl>
  get copyWith =>
      __$$DSCalendarLocalizationImplCopyWithImpl<_$DSCalendarLocalizationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCalendarLocalization implements DSCalendarLocalization {
  const factory _DSCalendarLocalization({
    final String locale,
    final List<String> monthNames,
    final List<String> monthNamesShort,
    final List<String> dayNames,
    final List<String> dayNamesShort,
    final int firstDayOfWeek,
    final int timeFormat,
    final Map<String, String> labels,
  }) = _$DSCalendarLocalizationImpl;

  /// Idioma (es, en, etc.)
  @override
  String get locale;

  /// Nombres de los meses
  @override
  List<String> get monthNames;

  /// Nombres cortos de los meses
  @override
  List<String> get monthNamesShort;

  /// Nombres de los días de la semana
  @override
  List<String> get dayNames;

  /// Nombres cortos de los días
  @override
  List<String> get dayNamesShort;

  /// Primer día de la semana (1=lunes, 7=domingo)
  @override
  int get firstDayOfWeek;

  /// Formato de hora (12h o 24h)
  @override
  int get timeFormat;

  /// Textos de interfaz
  @override
  Map<String, String> get labels;

  /// Create a copy of DSCalendarLocalization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCalendarLocalizationImplCopyWith<_$DSCalendarLocalizationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCalendarConfig {
  /// Variante del calendario
  DSCalendarVariant get variant => throw _privateConstructorUsedError;

  /// Lista de eventos
  List<DSCalendarEvent> get events => throw _privateConstructorUsedError;

  /// Lista de recursos
  List<DSCalendarResource> get resources => throw _privateConstructorUsedError;

  /// Fecha inicial seleccionada
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  /// Rango de fechas seleccionado
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTimeRange<DateTime>? get selectedRange =>
      throw _privateConstructorUsedError;

  /// Fecha mínima seleccionable
  DateTime? get minDate => throw _privateConstructorUsedError;

  /// Fecha máxima seleccionable
  DateTime? get maxDate => throw _privateConstructorUsedError;

  /// Estado del calendario
  DSCalendarState get state => throw _privateConstructorUsedError;

  /// Si permite selección múltiple
  bool get allowMultiSelect => throw _privateConstructorUsedError;

  /// Si permite selección de rango
  bool get allowRangeSelect => throw _privateConstructorUsedError;

  /// Si muestra números de semana
  bool get showWeekNumbers => throw _privateConstructorUsedError;

  /// Si muestra eventos en vista de mes
  bool get showEventsInMonth => throw _privateConstructorUsedError;

  /// Máximo número de eventos a mostrar por día en vista de mes
  int get maxEventsPerDay => throw _privateConstructorUsedError;

  /// Si muestra header de navegación
  bool get showHeader => throw _privateConstructorUsedError;

  /// Si muestra controles de navegación
  bool get showNavigationControls => throw _privateConstructorUsedError;

  /// Si muestra selector de vista
  bool get showViewSelector => throw _privateConstructorUsedError;

  /// Si muestra botón "hoy"
  bool get showTodayButton => throw _privateConstructorUsedError;

  /// Hora de inicio para vistas de día/semana
  int get startHour => throw _privateConstructorUsedError;

  /// Hora de fin para vistas de día/semana
  int get endHour => throw _privateConstructorUsedError;

  /// Intervalo de tiempo en minutos
  int get timeSlotDuration => throw _privateConstructorUsedError;

  /// Altura de cada slot de tiempo
  double get timeSlotHeight => throw _privateConstructorUsedError;

  /// Si muestra línea de tiempo actual
  bool get showCurrentTimeLine => throw _privateConstructorUsedError;

  /// Si muestra horarios de trabajo
  bool get showWorkingHours => throw _privateConstructorUsedError;

  /// Configuración de localización
  DSCalendarLocalization? get localization =>
      throw _privateConstructorUsedError;

  /// Callback cuando se toca un evento
  @JsonKey(includeFromJson: false, includeToJson: false)
  DSCalendarEventTapCallback? get onEventTap =>
      throw _privateConstructorUsedError;

  /// Callback cuando se toca una fecha
  @JsonKey(includeFromJson: false, includeToJson: false)
  DSCalendarDateTapCallback? get onDateTap =>
      throw _privateConstructorUsedError;

  /// Callback cuando se selecciona un rango
  @JsonKey(includeFromJson: false, includeToJson: false)
  DSCalendarDateRangeSelectCallback? get onRangeSelect =>
      throw _privateConstructorUsedError;

  /// Callback cuando cambia la vista
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DSCalendarVariant)? get onViewChange =>
      throw _privateConstructorUsedError;

  /// Callback cuando cambia la fecha
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DateTime)? get onDateChange =>
      throw _privateConstructorUsedError;

  /// Callback cuando se crea un evento
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DateTime, DateTime)? get onEventCreate =>
      throw _privateConstructorUsedError;

  /// Callback cuando se mueve un evento
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DSCalendarEvent, DateTime)? get onEventMove =>
      throw _privateConstructorUsedError;

  /// Callback cuando se redimensiona un evento
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DSCalendarEvent, DateTime, DateTime)? get onEventResize =>
      throw _privateConstructorUsedError; // Propiedades de estilo usando design tokens
  /// Padding del calendario
  @JsonKey(includeFromJson: false, includeToJson: false)
  EdgeInsets? get padding => throw _privateConstructorUsedError;

  /// Margin del calendario
  @JsonKey(includeFromJson: false, includeToJson: false)
  EdgeInsets? get margin => throw _privateConstructorUsedError;

  /// Color de fondo del calendario
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color de fondo del header
  Color? get headerBackgroundColor => throw _privateConstructorUsedError;

  /// Color del texto del header
  Color? get headerTextColor => throw _privateConstructorUsedError;

  /// Color de fondo de las celdas
  Color? get cellBackgroundColor => throw _privateConstructorUsedError;

  /// Color del borde de las celdas
  Color? get cellBorderColor => throw _privateConstructorUsedError;

  /// Color de fondo del día actual
  Color? get todayBackgroundColor => throw _privateConstructorUsedError;

  /// Color del texto del día actual
  Color? get todayTextColor => throw _privateConstructorUsedError;

  /// Color de fondo del día seleccionado
  Color? get selectedBackgroundColor => throw _privateConstructorUsedError;

  /// Color del texto del día seleccionado
  Color? get selectedTextColor => throw _privateConstructorUsedError;

  /// Color de fondo de días deshabilitados
  Color? get disabledBackgroundColor => throw _privateConstructorUsedError;

  /// Color del texto de días deshabilitados
  Color? get disabledTextColor => throw _privateConstructorUsedError;

  /// Color de fondo de fin de semana
  Color? get weekendBackgroundColor => throw _privateConstructorUsedError;

  /// Color del texto de fin de semana
  Color? get weekendTextColor => throw _privateConstructorUsedError;

  /// Color de la línea de tiempo actual
  Color? get currentTimeLineColor => throw _privateConstructorUsedError;

  /// Color de fondo de horario de trabajo
  Color? get workingHoursBackgroundColor => throw _privateConstructorUsedError;

  /// Color de fondo de horario no laboral
  Color? get nonWorkingHoursBackgroundColor =>
      throw _privateConstructorUsedError;

  /// Radio de borde de las celdas
  @JsonKey(includeFromJson: false, includeToJson: false)
  BorderRadius? get cellBorderRadius => throw _privateConstructorUsedError;

  /// Radio de borde del calendario
  @JsonKey(includeFromJson: false, includeToJson: false)
  BorderRadius? get borderRadius => throw _privateConstructorUsedError;

  /// Sombra del calendario
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<BoxShadow>? get boxShadow => throw _privateConstructorUsedError;

  /// Estilo del texto del header
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get headerTextStyle => throw _privateConstructorUsedError;

  /// Estilo del texto de las fechas
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get dateTextStyle => throw _privateConstructorUsedError;

  /// Estilo del texto de los eventos
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get eventTextStyle => throw _privateConstructorUsedError;

  /// Estilo del texto de las horas
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get timeTextStyle => throw _privateConstructorUsedError;

  /// Altura del header
  double get headerHeight => throw _privateConstructorUsedError;

  /// Altura de las celdas de fecha
  double get cellHeight => throw _privateConstructorUsedError;

  /// Ancho mínimo de las celdas
  double get cellMinWidth => throw _privateConstructorUsedError;

  /// Espaciado entre eventos
  double get eventSpacing => throw _privateConstructorUsedError;

  /// Altura de los eventos en vista de mes
  double get eventHeight => throw _privateConstructorUsedError;

  /// Radio de borde de los eventos
  double get eventBorderRadius => throw _privateConstructorUsedError;

  /// Animaciones habilitadas
  bool get animationsEnabled => throw _privateConstructorUsedError;

  /// Duración de las animaciones
  Duration get animationDuration => throw _privateConstructorUsedError;

  /// Soporte para navegación por teclado
  bool get keyboardNavigationEnabled => throw _privateConstructorUsedError;

  /// Soporte para gestos táctiles
  bool get gesturesEnabled => throw _privateConstructorUsedError;

  /// Soporte para zoom en vista de semana/día
  bool get zoomEnabled => throw _privateConstructorUsedError;

  /// Factor de zoom mínimo
  double get minZoomFactor => throw _privateConstructorUsedError;

  /// Factor de zoom máximo
  double get maxZoomFactor => throw _privateConstructorUsedError;

  /// Create a copy of DSCalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCalendarConfigCopyWith<DSCalendarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCalendarConfigCopyWith<$Res> {
  factory $DSCalendarConfigCopyWith(
    DSCalendarConfig value,
    $Res Function(DSCalendarConfig) then,
  ) = _$DSCalendarConfigCopyWithImpl<$Res, DSCalendarConfig>;
  @useResult
  $Res call({
    DSCalendarVariant variant,
    List<DSCalendarEvent> events,
    List<DSCalendarResource> resources,
    DateTime? selectedDate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DateTimeRange<DateTime>? selectedRange,
    DateTime? minDate,
    DateTime? maxDate,
    DSCalendarState state,
    bool allowMultiSelect,
    bool allowRangeSelect,
    bool showWeekNumbers,
    bool showEventsInMonth,
    int maxEventsPerDay,
    bool showHeader,
    bool showNavigationControls,
    bool showViewSelector,
    bool showTodayButton,
    int startHour,
    int endHour,
    int timeSlotDuration,
    double timeSlotHeight,
    bool showCurrentTimeLine,
    bool showWorkingHours,
    DSCalendarLocalization? localization,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DSCalendarEventTapCallback? onEventTap,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DSCalendarDateTapCallback? onDateTap,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DSCalendarDateRangeSelectCallback? onRangeSelect,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DSCalendarVariant)? onViewChange,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DateTime)? onDateChange,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DateTime, DateTime)? onEventCreate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DSCalendarEvent, DateTime)? onEventMove,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DSCalendarEvent, DateTime, DateTime)? onEventResize,
    @JsonKey(includeFromJson: false, includeToJson: false) EdgeInsets? padding,
    @JsonKey(includeFromJson: false, includeToJson: false) EdgeInsets? margin,
    Color? backgroundColor,
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? cellBackgroundColor,
    Color? cellBorderColor,
    Color? todayBackgroundColor,
    Color? todayTextColor,
    Color? selectedBackgroundColor,
    Color? selectedTextColor,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
    Color? weekendBackgroundColor,
    Color? weekendTextColor,
    Color? currentTimeLineColor,
    Color? workingHoursBackgroundColor,
    Color? nonWorkingHoursBackgroundColor,
    @JsonKey(includeFromJson: false, includeToJson: false)
    BorderRadius? cellBorderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    BorderRadius? borderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<BoxShadow>? boxShadow,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? headerTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? dateTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? eventTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? timeTextStyle,
    double headerHeight,
    double cellHeight,
    double cellMinWidth,
    double eventSpacing,
    double eventHeight,
    double eventBorderRadius,
    bool animationsEnabled,
    Duration animationDuration,
    bool keyboardNavigationEnabled,
    bool gesturesEnabled,
    bool zoomEnabled,
    double minZoomFactor,
    double maxZoomFactor,
  });

  $DSCalendarLocalizationCopyWith<$Res>? get localization;
}

/// @nodoc
class _$DSCalendarConfigCopyWithImpl<$Res, $Val extends DSCalendarConfig>
    implements $DSCalendarConfigCopyWith<$Res> {
  _$DSCalendarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? events = null,
    Object? resources = null,
    Object? selectedDate = freezed,
    Object? selectedRange = freezed,
    Object? minDate = freezed,
    Object? maxDate = freezed,
    Object? state = null,
    Object? allowMultiSelect = null,
    Object? allowRangeSelect = null,
    Object? showWeekNumbers = null,
    Object? showEventsInMonth = null,
    Object? maxEventsPerDay = null,
    Object? showHeader = null,
    Object? showNavigationControls = null,
    Object? showViewSelector = null,
    Object? showTodayButton = null,
    Object? startHour = null,
    Object? endHour = null,
    Object? timeSlotDuration = null,
    Object? timeSlotHeight = null,
    Object? showCurrentTimeLine = null,
    Object? showWorkingHours = null,
    Object? localization = freezed,
    Object? onEventTap = freezed,
    Object? onDateTap = freezed,
    Object? onRangeSelect = freezed,
    Object? onViewChange = freezed,
    Object? onDateChange = freezed,
    Object? onEventCreate = freezed,
    Object? onEventMove = freezed,
    Object? onEventResize = freezed,
    Object? padding = freezed,
    Object? margin = freezed,
    Object? backgroundColor = freezed,
    Object? headerBackgroundColor = freezed,
    Object? headerTextColor = freezed,
    Object? cellBackgroundColor = freezed,
    Object? cellBorderColor = freezed,
    Object? todayBackgroundColor = freezed,
    Object? todayTextColor = freezed,
    Object? selectedBackgroundColor = freezed,
    Object? selectedTextColor = freezed,
    Object? disabledBackgroundColor = freezed,
    Object? disabledTextColor = freezed,
    Object? weekendBackgroundColor = freezed,
    Object? weekendTextColor = freezed,
    Object? currentTimeLineColor = freezed,
    Object? workingHoursBackgroundColor = freezed,
    Object? nonWorkingHoursBackgroundColor = freezed,
    Object? cellBorderRadius = freezed,
    Object? borderRadius = freezed,
    Object? boxShadow = freezed,
    Object? headerTextStyle = freezed,
    Object? dateTextStyle = freezed,
    Object? eventTextStyle = freezed,
    Object? timeTextStyle = freezed,
    Object? headerHeight = null,
    Object? cellHeight = null,
    Object? cellMinWidth = null,
    Object? eventSpacing = null,
    Object? eventHeight = null,
    Object? eventBorderRadius = null,
    Object? animationsEnabled = null,
    Object? animationDuration = null,
    Object? keyboardNavigationEnabled = null,
    Object? gesturesEnabled = null,
    Object? zoomEnabled = null,
    Object? minZoomFactor = null,
    Object? maxZoomFactor = null,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSCalendarVariant,
            events: null == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as List<DSCalendarEvent>,
            resources: null == resources
                ? _value.resources
                : resources // ignore: cast_nullable_to_non_nullable
                      as List<DSCalendarResource>,
            selectedDate: freezed == selectedDate
                ? _value.selectedDate
                : selectedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            selectedRange: freezed == selectedRange
                ? _value.selectedRange
                : selectedRange // ignore: cast_nullable_to_non_nullable
                      as DateTimeRange<DateTime>?,
            minDate: freezed == minDate
                ? _value.minDate
                : minDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            maxDate: freezed == maxDate
                ? _value.maxDate
                : maxDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSCalendarState,
            allowMultiSelect: null == allowMultiSelect
                ? _value.allowMultiSelect
                : allowMultiSelect // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowRangeSelect: null == allowRangeSelect
                ? _value.allowRangeSelect
                : allowRangeSelect // ignore: cast_nullable_to_non_nullable
                      as bool,
            showWeekNumbers: null == showWeekNumbers
                ? _value.showWeekNumbers
                : showWeekNumbers // ignore: cast_nullable_to_non_nullable
                      as bool,
            showEventsInMonth: null == showEventsInMonth
                ? _value.showEventsInMonth
                : showEventsInMonth // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxEventsPerDay: null == maxEventsPerDay
                ? _value.maxEventsPerDay
                : maxEventsPerDay // ignore: cast_nullable_to_non_nullable
                      as int,
            showHeader: null == showHeader
                ? _value.showHeader
                : showHeader // ignore: cast_nullable_to_non_nullable
                      as bool,
            showNavigationControls: null == showNavigationControls
                ? _value.showNavigationControls
                : showNavigationControls // ignore: cast_nullable_to_non_nullable
                      as bool,
            showViewSelector: null == showViewSelector
                ? _value.showViewSelector
                : showViewSelector // ignore: cast_nullable_to_non_nullable
                      as bool,
            showTodayButton: null == showTodayButton
                ? _value.showTodayButton
                : showTodayButton // ignore: cast_nullable_to_non_nullable
                      as bool,
            startHour: null == startHour
                ? _value.startHour
                : startHour // ignore: cast_nullable_to_non_nullable
                      as int,
            endHour: null == endHour
                ? _value.endHour
                : endHour // ignore: cast_nullable_to_non_nullable
                      as int,
            timeSlotDuration: null == timeSlotDuration
                ? _value.timeSlotDuration
                : timeSlotDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            timeSlotHeight: null == timeSlotHeight
                ? _value.timeSlotHeight
                : timeSlotHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            showCurrentTimeLine: null == showCurrentTimeLine
                ? _value.showCurrentTimeLine
                : showCurrentTimeLine // ignore: cast_nullable_to_non_nullable
                      as bool,
            showWorkingHours: null == showWorkingHours
                ? _value.showWorkingHours
                : showWorkingHours // ignore: cast_nullable_to_non_nullable
                      as bool,
            localization: freezed == localization
                ? _value.localization
                : localization // ignore: cast_nullable_to_non_nullable
                      as DSCalendarLocalization?,
            onEventTap: freezed == onEventTap
                ? _value.onEventTap
                : onEventTap // ignore: cast_nullable_to_non_nullable
                      as DSCalendarEventTapCallback?,
            onDateTap: freezed == onDateTap
                ? _value.onDateTap
                : onDateTap // ignore: cast_nullable_to_non_nullable
                      as DSCalendarDateTapCallback?,
            onRangeSelect: freezed == onRangeSelect
                ? _value.onRangeSelect
                : onRangeSelect // ignore: cast_nullable_to_non_nullable
                      as DSCalendarDateRangeSelectCallback?,
            onViewChange: freezed == onViewChange
                ? _value.onViewChange
                : onViewChange // ignore: cast_nullable_to_non_nullable
                      as void Function(DSCalendarVariant)?,
            onDateChange: freezed == onDateChange
                ? _value.onDateChange
                : onDateChange // ignore: cast_nullable_to_non_nullable
                      as void Function(DateTime)?,
            onEventCreate: freezed == onEventCreate
                ? _value.onEventCreate
                : onEventCreate // ignore: cast_nullable_to_non_nullable
                      as void Function(DateTime, DateTime)?,
            onEventMove: freezed == onEventMove
                ? _value.onEventMove
                : onEventMove // ignore: cast_nullable_to_non_nullable
                      as void Function(DSCalendarEvent, DateTime)?,
            onEventResize: freezed == onEventResize
                ? _value.onEventResize
                : onEventResize // ignore: cast_nullable_to_non_nullable
                      as void Function(DSCalendarEvent, DateTime, DateTime)?,
            padding: freezed == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets?,
            margin: freezed == margin
                ? _value.margin
                : margin // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets?,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            headerBackgroundColor: freezed == headerBackgroundColor
                ? _value.headerBackgroundColor
                : headerBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            headerTextColor: freezed == headerTextColor
                ? _value.headerTextColor
                : headerTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            cellBackgroundColor: freezed == cellBackgroundColor
                ? _value.cellBackgroundColor
                : cellBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            cellBorderColor: freezed == cellBorderColor
                ? _value.cellBorderColor
                : cellBorderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            todayBackgroundColor: freezed == todayBackgroundColor
                ? _value.todayBackgroundColor
                : todayBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            todayTextColor: freezed == todayTextColor
                ? _value.todayTextColor
                : todayTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedBackgroundColor: freezed == selectedBackgroundColor
                ? _value.selectedBackgroundColor
                : selectedBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedTextColor: freezed == selectedTextColor
                ? _value.selectedTextColor
                : selectedTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledBackgroundColor: freezed == disabledBackgroundColor
                ? _value.disabledBackgroundColor
                : disabledBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledTextColor: freezed == disabledTextColor
                ? _value.disabledTextColor
                : disabledTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            weekendBackgroundColor: freezed == weekendBackgroundColor
                ? _value.weekendBackgroundColor
                : weekendBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            weekendTextColor: freezed == weekendTextColor
                ? _value.weekendTextColor
                : weekendTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            currentTimeLineColor: freezed == currentTimeLineColor
                ? _value.currentTimeLineColor
                : currentTimeLineColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            workingHoursBackgroundColor: freezed == workingHoursBackgroundColor
                ? _value.workingHoursBackgroundColor
                : workingHoursBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            nonWorkingHoursBackgroundColor:
                freezed == nonWorkingHoursBackgroundColor
                ? _value.nonWorkingHoursBackgroundColor
                : nonWorkingHoursBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            cellBorderRadius: freezed == cellBorderRadius
                ? _value.cellBorderRadius
                : cellBorderRadius // ignore: cast_nullable_to_non_nullable
                      as BorderRadius?,
            borderRadius: freezed == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as BorderRadius?,
            boxShadow: freezed == boxShadow
                ? _value.boxShadow
                : boxShadow // ignore: cast_nullable_to_non_nullable
                      as List<BoxShadow>?,
            headerTextStyle: freezed == headerTextStyle
                ? _value.headerTextStyle
                : headerTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            dateTextStyle: freezed == dateTextStyle
                ? _value.dateTextStyle
                : dateTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            eventTextStyle: freezed == eventTextStyle
                ? _value.eventTextStyle
                : eventTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            timeTextStyle: freezed == timeTextStyle
                ? _value.timeTextStyle
                : timeTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            headerHeight: null == headerHeight
                ? _value.headerHeight
                : headerHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            cellHeight: null == cellHeight
                ? _value.cellHeight
                : cellHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            cellMinWidth: null == cellMinWidth
                ? _value.cellMinWidth
                : cellMinWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            eventSpacing: null == eventSpacing
                ? _value.eventSpacing
                : eventSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            eventHeight: null == eventHeight
                ? _value.eventHeight
                : eventHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            eventBorderRadius: null == eventBorderRadius
                ? _value.eventBorderRadius
                : eventBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            animationsEnabled: null == animationsEnabled
                ? _value.animationsEnabled
                : animationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            animationDuration: null == animationDuration
                ? _value.animationDuration
                : animationDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            keyboardNavigationEnabled: null == keyboardNavigationEnabled
                ? _value.keyboardNavigationEnabled
                : keyboardNavigationEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            gesturesEnabled: null == gesturesEnabled
                ? _value.gesturesEnabled
                : gesturesEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            zoomEnabled: null == zoomEnabled
                ? _value.zoomEnabled
                : zoomEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            minZoomFactor: null == minZoomFactor
                ? _value.minZoomFactor
                : minZoomFactor // ignore: cast_nullable_to_non_nullable
                      as double,
            maxZoomFactor: null == maxZoomFactor
                ? _value.maxZoomFactor
                : maxZoomFactor // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }

  /// Create a copy of DSCalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCalendarLocalizationCopyWith<$Res>? get localization {
    if (_value.localization == null) {
      return null;
    }

    return $DSCalendarLocalizationCopyWith<$Res>(_value.localization!, (value) {
      return _then(_value.copyWith(localization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSCalendarConfigImplCopyWith<$Res>
    implements $DSCalendarConfigCopyWith<$Res> {
  factory _$$DSCalendarConfigImplCopyWith(
    _$DSCalendarConfigImpl value,
    $Res Function(_$DSCalendarConfigImpl) then,
  ) = __$$DSCalendarConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSCalendarVariant variant,
    List<DSCalendarEvent> events,
    List<DSCalendarResource> resources,
    DateTime? selectedDate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DateTimeRange<DateTime>? selectedRange,
    DateTime? minDate,
    DateTime? maxDate,
    DSCalendarState state,
    bool allowMultiSelect,
    bool allowRangeSelect,
    bool showWeekNumbers,
    bool showEventsInMonth,
    int maxEventsPerDay,
    bool showHeader,
    bool showNavigationControls,
    bool showViewSelector,
    bool showTodayButton,
    int startHour,
    int endHour,
    int timeSlotDuration,
    double timeSlotHeight,
    bool showCurrentTimeLine,
    bool showWorkingHours,
    DSCalendarLocalization? localization,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DSCalendarEventTapCallback? onEventTap,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DSCalendarDateTapCallback? onDateTap,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DSCalendarDateRangeSelectCallback? onRangeSelect,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DSCalendarVariant)? onViewChange,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DateTime)? onDateChange,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DateTime, DateTime)? onEventCreate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DSCalendarEvent, DateTime)? onEventMove,
    @JsonKey(includeFromJson: false, includeToJson: false)
    void Function(DSCalendarEvent, DateTime, DateTime)? onEventResize,
    @JsonKey(includeFromJson: false, includeToJson: false) EdgeInsets? padding,
    @JsonKey(includeFromJson: false, includeToJson: false) EdgeInsets? margin,
    Color? backgroundColor,
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? cellBackgroundColor,
    Color? cellBorderColor,
    Color? todayBackgroundColor,
    Color? todayTextColor,
    Color? selectedBackgroundColor,
    Color? selectedTextColor,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
    Color? weekendBackgroundColor,
    Color? weekendTextColor,
    Color? currentTimeLineColor,
    Color? workingHoursBackgroundColor,
    Color? nonWorkingHoursBackgroundColor,
    @JsonKey(includeFromJson: false, includeToJson: false)
    BorderRadius? cellBorderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    BorderRadius? borderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<BoxShadow>? boxShadow,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? headerTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? dateTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? eventTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextStyle? timeTextStyle,
    double headerHeight,
    double cellHeight,
    double cellMinWidth,
    double eventSpacing,
    double eventHeight,
    double eventBorderRadius,
    bool animationsEnabled,
    Duration animationDuration,
    bool keyboardNavigationEnabled,
    bool gesturesEnabled,
    bool zoomEnabled,
    double minZoomFactor,
    double maxZoomFactor,
  });

  @override
  $DSCalendarLocalizationCopyWith<$Res>? get localization;
}

/// @nodoc
class __$$DSCalendarConfigImplCopyWithImpl<$Res>
    extends _$DSCalendarConfigCopyWithImpl<$Res, _$DSCalendarConfigImpl>
    implements _$$DSCalendarConfigImplCopyWith<$Res> {
  __$$DSCalendarConfigImplCopyWithImpl(
    _$DSCalendarConfigImpl _value,
    $Res Function(_$DSCalendarConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? events = null,
    Object? resources = null,
    Object? selectedDate = freezed,
    Object? selectedRange = freezed,
    Object? minDate = freezed,
    Object? maxDate = freezed,
    Object? state = null,
    Object? allowMultiSelect = null,
    Object? allowRangeSelect = null,
    Object? showWeekNumbers = null,
    Object? showEventsInMonth = null,
    Object? maxEventsPerDay = null,
    Object? showHeader = null,
    Object? showNavigationControls = null,
    Object? showViewSelector = null,
    Object? showTodayButton = null,
    Object? startHour = null,
    Object? endHour = null,
    Object? timeSlotDuration = null,
    Object? timeSlotHeight = null,
    Object? showCurrentTimeLine = null,
    Object? showWorkingHours = null,
    Object? localization = freezed,
    Object? onEventTap = freezed,
    Object? onDateTap = freezed,
    Object? onRangeSelect = freezed,
    Object? onViewChange = freezed,
    Object? onDateChange = freezed,
    Object? onEventCreate = freezed,
    Object? onEventMove = freezed,
    Object? onEventResize = freezed,
    Object? padding = freezed,
    Object? margin = freezed,
    Object? backgroundColor = freezed,
    Object? headerBackgroundColor = freezed,
    Object? headerTextColor = freezed,
    Object? cellBackgroundColor = freezed,
    Object? cellBorderColor = freezed,
    Object? todayBackgroundColor = freezed,
    Object? todayTextColor = freezed,
    Object? selectedBackgroundColor = freezed,
    Object? selectedTextColor = freezed,
    Object? disabledBackgroundColor = freezed,
    Object? disabledTextColor = freezed,
    Object? weekendBackgroundColor = freezed,
    Object? weekendTextColor = freezed,
    Object? currentTimeLineColor = freezed,
    Object? workingHoursBackgroundColor = freezed,
    Object? nonWorkingHoursBackgroundColor = freezed,
    Object? cellBorderRadius = freezed,
    Object? borderRadius = freezed,
    Object? boxShadow = freezed,
    Object? headerTextStyle = freezed,
    Object? dateTextStyle = freezed,
    Object? eventTextStyle = freezed,
    Object? timeTextStyle = freezed,
    Object? headerHeight = null,
    Object? cellHeight = null,
    Object? cellMinWidth = null,
    Object? eventSpacing = null,
    Object? eventHeight = null,
    Object? eventBorderRadius = null,
    Object? animationsEnabled = null,
    Object? animationDuration = null,
    Object? keyboardNavigationEnabled = null,
    Object? gesturesEnabled = null,
    Object? zoomEnabled = null,
    Object? minZoomFactor = null,
    Object? maxZoomFactor = null,
  }) {
    return _then(
      _$DSCalendarConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSCalendarVariant,
        events: null == events
            ? _value._events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<DSCalendarEvent>,
        resources: null == resources
            ? _value._resources
            : resources // ignore: cast_nullable_to_non_nullable
                  as List<DSCalendarResource>,
        selectedDate: freezed == selectedDate
            ? _value.selectedDate
            : selectedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        selectedRange: freezed == selectedRange
            ? _value.selectedRange
            : selectedRange // ignore: cast_nullable_to_non_nullable
                  as DateTimeRange<DateTime>?,
        minDate: freezed == minDate
            ? _value.minDate
            : minDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        maxDate: freezed == maxDate
            ? _value.maxDate
            : maxDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSCalendarState,
        allowMultiSelect: null == allowMultiSelect
            ? _value.allowMultiSelect
            : allowMultiSelect // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowRangeSelect: null == allowRangeSelect
            ? _value.allowRangeSelect
            : allowRangeSelect // ignore: cast_nullable_to_non_nullable
                  as bool,
        showWeekNumbers: null == showWeekNumbers
            ? _value.showWeekNumbers
            : showWeekNumbers // ignore: cast_nullable_to_non_nullable
                  as bool,
        showEventsInMonth: null == showEventsInMonth
            ? _value.showEventsInMonth
            : showEventsInMonth // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxEventsPerDay: null == maxEventsPerDay
            ? _value.maxEventsPerDay
            : maxEventsPerDay // ignore: cast_nullable_to_non_nullable
                  as int,
        showHeader: null == showHeader
            ? _value.showHeader
            : showHeader // ignore: cast_nullable_to_non_nullable
                  as bool,
        showNavigationControls: null == showNavigationControls
            ? _value.showNavigationControls
            : showNavigationControls // ignore: cast_nullable_to_non_nullable
                  as bool,
        showViewSelector: null == showViewSelector
            ? _value.showViewSelector
            : showViewSelector // ignore: cast_nullable_to_non_nullable
                  as bool,
        showTodayButton: null == showTodayButton
            ? _value.showTodayButton
            : showTodayButton // ignore: cast_nullable_to_non_nullable
                  as bool,
        startHour: null == startHour
            ? _value.startHour
            : startHour // ignore: cast_nullable_to_non_nullable
                  as int,
        endHour: null == endHour
            ? _value.endHour
            : endHour // ignore: cast_nullable_to_non_nullable
                  as int,
        timeSlotDuration: null == timeSlotDuration
            ? _value.timeSlotDuration
            : timeSlotDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        timeSlotHeight: null == timeSlotHeight
            ? _value.timeSlotHeight
            : timeSlotHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        showCurrentTimeLine: null == showCurrentTimeLine
            ? _value.showCurrentTimeLine
            : showCurrentTimeLine // ignore: cast_nullable_to_non_nullable
                  as bool,
        showWorkingHours: null == showWorkingHours
            ? _value.showWorkingHours
            : showWorkingHours // ignore: cast_nullable_to_non_nullable
                  as bool,
        localization: freezed == localization
            ? _value.localization
            : localization // ignore: cast_nullable_to_non_nullable
                  as DSCalendarLocalization?,
        onEventTap: freezed == onEventTap
            ? _value.onEventTap
            : onEventTap // ignore: cast_nullable_to_non_nullable
                  as DSCalendarEventTapCallback?,
        onDateTap: freezed == onDateTap
            ? _value.onDateTap
            : onDateTap // ignore: cast_nullable_to_non_nullable
                  as DSCalendarDateTapCallback?,
        onRangeSelect: freezed == onRangeSelect
            ? _value.onRangeSelect
            : onRangeSelect // ignore: cast_nullable_to_non_nullable
                  as DSCalendarDateRangeSelectCallback?,
        onViewChange: freezed == onViewChange
            ? _value.onViewChange
            : onViewChange // ignore: cast_nullable_to_non_nullable
                  as void Function(DSCalendarVariant)?,
        onDateChange: freezed == onDateChange
            ? _value.onDateChange
            : onDateChange // ignore: cast_nullable_to_non_nullable
                  as void Function(DateTime)?,
        onEventCreate: freezed == onEventCreate
            ? _value.onEventCreate
            : onEventCreate // ignore: cast_nullable_to_non_nullable
                  as void Function(DateTime, DateTime)?,
        onEventMove: freezed == onEventMove
            ? _value.onEventMove
            : onEventMove // ignore: cast_nullable_to_non_nullable
                  as void Function(DSCalendarEvent, DateTime)?,
        onEventResize: freezed == onEventResize
            ? _value.onEventResize
            : onEventResize // ignore: cast_nullable_to_non_nullable
                  as void Function(DSCalendarEvent, DateTime, DateTime)?,
        padding: freezed == padding
            ? _value.padding
            : padding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets?,
        margin: freezed == margin
            ? _value.margin
            : margin // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets?,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        headerBackgroundColor: freezed == headerBackgroundColor
            ? _value.headerBackgroundColor
            : headerBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        headerTextColor: freezed == headerTextColor
            ? _value.headerTextColor
            : headerTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        cellBackgroundColor: freezed == cellBackgroundColor
            ? _value.cellBackgroundColor
            : cellBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        cellBorderColor: freezed == cellBorderColor
            ? _value.cellBorderColor
            : cellBorderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        todayBackgroundColor: freezed == todayBackgroundColor
            ? _value.todayBackgroundColor
            : todayBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        todayTextColor: freezed == todayTextColor
            ? _value.todayTextColor
            : todayTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedBackgroundColor: freezed == selectedBackgroundColor
            ? _value.selectedBackgroundColor
            : selectedBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedTextColor: freezed == selectedTextColor
            ? _value.selectedTextColor
            : selectedTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledBackgroundColor: freezed == disabledBackgroundColor
            ? _value.disabledBackgroundColor
            : disabledBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledTextColor: freezed == disabledTextColor
            ? _value.disabledTextColor
            : disabledTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        weekendBackgroundColor: freezed == weekendBackgroundColor
            ? _value.weekendBackgroundColor
            : weekendBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        weekendTextColor: freezed == weekendTextColor
            ? _value.weekendTextColor
            : weekendTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        currentTimeLineColor: freezed == currentTimeLineColor
            ? _value.currentTimeLineColor
            : currentTimeLineColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        workingHoursBackgroundColor: freezed == workingHoursBackgroundColor
            ? _value.workingHoursBackgroundColor
            : workingHoursBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        nonWorkingHoursBackgroundColor:
            freezed == nonWorkingHoursBackgroundColor
            ? _value.nonWorkingHoursBackgroundColor
            : nonWorkingHoursBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        cellBorderRadius: freezed == cellBorderRadius
            ? _value.cellBorderRadius
            : cellBorderRadius // ignore: cast_nullable_to_non_nullable
                  as BorderRadius?,
        borderRadius: freezed == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as BorderRadius?,
        boxShadow: freezed == boxShadow
            ? _value._boxShadow
            : boxShadow // ignore: cast_nullable_to_non_nullable
                  as List<BoxShadow>?,
        headerTextStyle: freezed == headerTextStyle
            ? _value.headerTextStyle
            : headerTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        dateTextStyle: freezed == dateTextStyle
            ? _value.dateTextStyle
            : dateTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        eventTextStyle: freezed == eventTextStyle
            ? _value.eventTextStyle
            : eventTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        timeTextStyle: freezed == timeTextStyle
            ? _value.timeTextStyle
            : timeTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        headerHeight: null == headerHeight
            ? _value.headerHeight
            : headerHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        cellHeight: null == cellHeight
            ? _value.cellHeight
            : cellHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        cellMinWidth: null == cellMinWidth
            ? _value.cellMinWidth
            : cellMinWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        eventSpacing: null == eventSpacing
            ? _value.eventSpacing
            : eventSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        eventHeight: null == eventHeight
            ? _value.eventHeight
            : eventHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        eventBorderRadius: null == eventBorderRadius
            ? _value.eventBorderRadius
            : eventBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        animationsEnabled: null == animationsEnabled
            ? _value.animationsEnabled
            : animationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        animationDuration: null == animationDuration
            ? _value.animationDuration
            : animationDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        keyboardNavigationEnabled: null == keyboardNavigationEnabled
            ? _value.keyboardNavigationEnabled
            : keyboardNavigationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        gesturesEnabled: null == gesturesEnabled
            ? _value.gesturesEnabled
            : gesturesEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        zoomEnabled: null == zoomEnabled
            ? _value.zoomEnabled
            : zoomEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        minZoomFactor: null == minZoomFactor
            ? _value.minZoomFactor
            : minZoomFactor // ignore: cast_nullable_to_non_nullable
                  as double,
        maxZoomFactor: null == maxZoomFactor
            ? _value.maxZoomFactor
            : maxZoomFactor // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSCalendarConfigImpl implements _DSCalendarConfig {
  const _$DSCalendarConfigImpl({
    this.variant = DSCalendarVariant.month,
    final List<DSCalendarEvent> events = const <DSCalendarEvent>[],
    final List<DSCalendarResource> resources = const <DSCalendarResource>[],
    this.selectedDate,
    @JsonKey(includeFromJson: false, includeToJson: false) this.selectedRange,
    this.minDate,
    this.maxDate,
    this.state = DSCalendarState.defaultState,
    this.allowMultiSelect = false,
    this.allowRangeSelect = false,
    this.showWeekNumbers = false,
    this.showEventsInMonth = true,
    this.maxEventsPerDay = 3,
    this.showHeader = true,
    this.showNavigationControls = true,
    this.showViewSelector = true,
    this.showTodayButton = true,
    this.startHour = 0,
    this.endHour = 24,
    this.timeSlotDuration = 30,
    this.timeSlotHeight = 60.0,
    this.showCurrentTimeLine = true,
    this.showWorkingHours = true,
    this.localization,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onEventTap,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onDateTap,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onRangeSelect,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onViewChange,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onDateChange,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onEventCreate,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onEventMove,
    @JsonKey(includeFromJson: false, includeToJson: false) this.onEventResize,
    @JsonKey(includeFromJson: false, includeToJson: false) this.padding,
    @JsonKey(includeFromJson: false, includeToJson: false) this.margin,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.headerTextColor,
    this.cellBackgroundColor,
    this.cellBorderColor,
    this.todayBackgroundColor,
    this.todayTextColor,
    this.selectedBackgroundColor,
    this.selectedTextColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.weekendBackgroundColor,
    this.weekendTextColor,
    this.currentTimeLineColor,
    this.workingHoursBackgroundColor,
    this.nonWorkingHoursBackgroundColor,
    @JsonKey(includeFromJson: false, includeToJson: false)
    this.cellBorderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false) this.borderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<BoxShadow>? boxShadow,
    @JsonKey(includeFromJson: false, includeToJson: false) this.headerTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false) this.dateTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false) this.eventTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false) this.timeTextStyle,
    this.headerHeight = 56.0,
    this.cellHeight = 48.0,
    this.cellMinWidth = 48.0,
    this.eventSpacing = 2.0,
    this.eventHeight = 20.0,
    this.eventBorderRadius = 4.0,
    this.animationsEnabled = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.keyboardNavigationEnabled = true,
    this.gesturesEnabled = true,
    this.zoomEnabled = true,
    this.minZoomFactor = 0.5,
    this.maxZoomFactor = 2.0,
  }) : _events = events,
       _resources = resources,
       _boxShadow = boxShadow;

  /// Variante del calendario
  @override
  @JsonKey()
  final DSCalendarVariant variant;

  /// Lista de eventos
  final List<DSCalendarEvent> _events;

  /// Lista de eventos
  @override
  @JsonKey()
  List<DSCalendarEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  /// Lista de recursos
  final List<DSCalendarResource> _resources;

  /// Lista de recursos
  @override
  @JsonKey()
  List<DSCalendarResource> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  /// Fecha inicial seleccionada
  @override
  final DateTime? selectedDate;

  /// Rango de fechas seleccionado
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DateTimeRange<DateTime>? selectedRange;

  /// Fecha mínima seleccionable
  @override
  final DateTime? minDate;

  /// Fecha máxima seleccionable
  @override
  final DateTime? maxDate;

  /// Estado del calendario
  @override
  @JsonKey()
  final DSCalendarState state;

  /// Si permite selección múltiple
  @override
  @JsonKey()
  final bool allowMultiSelect;

  /// Si permite selección de rango
  @override
  @JsonKey()
  final bool allowRangeSelect;

  /// Si muestra números de semana
  @override
  @JsonKey()
  final bool showWeekNumbers;

  /// Si muestra eventos en vista de mes
  @override
  @JsonKey()
  final bool showEventsInMonth;

  /// Máximo número de eventos a mostrar por día en vista de mes
  @override
  @JsonKey()
  final int maxEventsPerDay;

  /// Si muestra header de navegación
  @override
  @JsonKey()
  final bool showHeader;

  /// Si muestra controles de navegación
  @override
  @JsonKey()
  final bool showNavigationControls;

  /// Si muestra selector de vista
  @override
  @JsonKey()
  final bool showViewSelector;

  /// Si muestra botón "hoy"
  @override
  @JsonKey()
  final bool showTodayButton;

  /// Hora de inicio para vistas de día/semana
  @override
  @JsonKey()
  final int startHour;

  /// Hora de fin para vistas de día/semana
  @override
  @JsonKey()
  final int endHour;

  /// Intervalo de tiempo en minutos
  @override
  @JsonKey()
  final int timeSlotDuration;

  /// Altura de cada slot de tiempo
  @override
  @JsonKey()
  final double timeSlotHeight;

  /// Si muestra línea de tiempo actual
  @override
  @JsonKey()
  final bool showCurrentTimeLine;

  /// Si muestra horarios de trabajo
  @override
  @JsonKey()
  final bool showWorkingHours;

  /// Configuración de localización
  @override
  final DSCalendarLocalization? localization;

  /// Callback cuando se toca un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DSCalendarEventTapCallback? onEventTap;

  /// Callback cuando se toca una fecha
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DSCalendarDateTapCallback? onDateTap;

  /// Callback cuando se selecciona un rango
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DSCalendarDateRangeSelectCallback? onRangeSelect;

  /// Callback cuando cambia la vista
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final void Function(DSCalendarVariant)? onViewChange;

  /// Callback cuando cambia la fecha
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final void Function(DateTime)? onDateChange;

  /// Callback cuando se crea un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final void Function(DateTime, DateTime)? onEventCreate;

  /// Callback cuando se mueve un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final void Function(DSCalendarEvent, DateTime)? onEventMove;

  /// Callback cuando se redimensiona un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final void Function(DSCalendarEvent, DateTime, DateTime)? onEventResize;
  // Propiedades de estilo usando design tokens
  /// Padding del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final EdgeInsets? padding;

  /// Margin del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final EdgeInsets? margin;

  /// Color de fondo del calendario
  @override
  final Color? backgroundColor;

  /// Color de fondo del header
  @override
  final Color? headerBackgroundColor;

  /// Color del texto del header
  @override
  final Color? headerTextColor;

  /// Color de fondo de las celdas
  @override
  final Color? cellBackgroundColor;

  /// Color del borde de las celdas
  @override
  final Color? cellBorderColor;

  /// Color de fondo del día actual
  @override
  final Color? todayBackgroundColor;

  /// Color del texto del día actual
  @override
  final Color? todayTextColor;

  /// Color de fondo del día seleccionado
  @override
  final Color? selectedBackgroundColor;

  /// Color del texto del día seleccionado
  @override
  final Color? selectedTextColor;

  /// Color de fondo de días deshabilitados
  @override
  final Color? disabledBackgroundColor;

  /// Color del texto de días deshabilitados
  @override
  final Color? disabledTextColor;

  /// Color de fondo de fin de semana
  @override
  final Color? weekendBackgroundColor;

  /// Color del texto de fin de semana
  @override
  final Color? weekendTextColor;

  /// Color de la línea de tiempo actual
  @override
  final Color? currentTimeLineColor;

  /// Color de fondo de horario de trabajo
  @override
  final Color? workingHoursBackgroundColor;

  /// Color de fondo de horario no laboral
  @override
  final Color? nonWorkingHoursBackgroundColor;

  /// Radio de borde de las celdas
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final BorderRadius? cellBorderRadius;

  /// Radio de borde del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final BorderRadius? borderRadius;

  /// Sombra del calendario
  final List<BoxShadow>? _boxShadow;

  /// Sombra del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<BoxShadow>? get boxShadow {
    final value = _boxShadow;
    if (value == null) return null;
    if (_boxShadow is EqualUnmodifiableListView) return _boxShadow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Estilo del texto del header
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextStyle? headerTextStyle;

  /// Estilo del texto de las fechas
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextStyle? dateTextStyle;

  /// Estilo del texto de los eventos
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextStyle? eventTextStyle;

  /// Estilo del texto de las horas
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextStyle? timeTextStyle;

  /// Altura del header
  @override
  @JsonKey()
  final double headerHeight;

  /// Altura de las celdas de fecha
  @override
  @JsonKey()
  final double cellHeight;

  /// Ancho mínimo de las celdas
  @override
  @JsonKey()
  final double cellMinWidth;

  /// Espaciado entre eventos
  @override
  @JsonKey()
  final double eventSpacing;

  /// Altura de los eventos en vista de mes
  @override
  @JsonKey()
  final double eventHeight;

  /// Radio de borde de los eventos
  @override
  @JsonKey()
  final double eventBorderRadius;

  /// Animaciones habilitadas
  @override
  @JsonKey()
  final bool animationsEnabled;

  /// Duración de las animaciones
  @override
  @JsonKey()
  final Duration animationDuration;

  /// Soporte para navegación por teclado
  @override
  @JsonKey()
  final bool keyboardNavigationEnabled;

  /// Soporte para gestos táctiles
  @override
  @JsonKey()
  final bool gesturesEnabled;

  /// Soporte para zoom en vista de semana/día
  @override
  @JsonKey()
  final bool zoomEnabled;

  /// Factor de zoom mínimo
  @override
  @JsonKey()
  final double minZoomFactor;

  /// Factor de zoom máximo
  @override
  @JsonKey()
  final double maxZoomFactor;

  @override
  String toString() {
    return 'DSCalendarConfig(variant: $variant, events: $events, resources: $resources, selectedDate: $selectedDate, selectedRange: $selectedRange, minDate: $minDate, maxDate: $maxDate, state: $state, allowMultiSelect: $allowMultiSelect, allowRangeSelect: $allowRangeSelect, showWeekNumbers: $showWeekNumbers, showEventsInMonth: $showEventsInMonth, maxEventsPerDay: $maxEventsPerDay, showHeader: $showHeader, showNavigationControls: $showNavigationControls, showViewSelector: $showViewSelector, showTodayButton: $showTodayButton, startHour: $startHour, endHour: $endHour, timeSlotDuration: $timeSlotDuration, timeSlotHeight: $timeSlotHeight, showCurrentTimeLine: $showCurrentTimeLine, showWorkingHours: $showWorkingHours, localization: $localization, onEventTap: $onEventTap, onDateTap: $onDateTap, onRangeSelect: $onRangeSelect, onViewChange: $onViewChange, onDateChange: $onDateChange, onEventCreate: $onEventCreate, onEventMove: $onEventMove, onEventResize: $onEventResize, padding: $padding, margin: $margin, backgroundColor: $backgroundColor, headerBackgroundColor: $headerBackgroundColor, headerTextColor: $headerTextColor, cellBackgroundColor: $cellBackgroundColor, cellBorderColor: $cellBorderColor, todayBackgroundColor: $todayBackgroundColor, todayTextColor: $todayTextColor, selectedBackgroundColor: $selectedBackgroundColor, selectedTextColor: $selectedTextColor, disabledBackgroundColor: $disabledBackgroundColor, disabledTextColor: $disabledTextColor, weekendBackgroundColor: $weekendBackgroundColor, weekendTextColor: $weekendTextColor, currentTimeLineColor: $currentTimeLineColor, workingHoursBackgroundColor: $workingHoursBackgroundColor, nonWorkingHoursBackgroundColor: $nonWorkingHoursBackgroundColor, cellBorderRadius: $cellBorderRadius, borderRadius: $borderRadius, boxShadow: $boxShadow, headerTextStyle: $headerTextStyle, dateTextStyle: $dateTextStyle, eventTextStyle: $eventTextStyle, timeTextStyle: $timeTextStyle, headerHeight: $headerHeight, cellHeight: $cellHeight, cellMinWidth: $cellMinWidth, eventSpacing: $eventSpacing, eventHeight: $eventHeight, eventBorderRadius: $eventBorderRadius, animationsEnabled: $animationsEnabled, animationDuration: $animationDuration, keyboardNavigationEnabled: $keyboardNavigationEnabled, gesturesEnabled: $gesturesEnabled, zoomEnabled: $zoomEnabled, minZoomFactor: $minZoomFactor, maxZoomFactor: $maxZoomFactor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCalendarConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(
              other._resources,
              _resources,
            ) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.minDate, minDate) || other.minDate == minDate) &&
            (identical(other.maxDate, maxDate) || other.maxDate == maxDate) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.allowMultiSelect, allowMultiSelect) ||
                other.allowMultiSelect == allowMultiSelect) &&
            (identical(other.allowRangeSelect, allowRangeSelect) ||
                other.allowRangeSelect == allowRangeSelect) &&
            (identical(other.showWeekNumbers, showWeekNumbers) ||
                other.showWeekNumbers == showWeekNumbers) &&
            (identical(other.showEventsInMonth, showEventsInMonth) ||
                other.showEventsInMonth == showEventsInMonth) &&
            (identical(other.maxEventsPerDay, maxEventsPerDay) ||
                other.maxEventsPerDay == maxEventsPerDay) &&
            (identical(other.showHeader, showHeader) ||
                other.showHeader == showHeader) &&
            (identical(other.showNavigationControls, showNavigationControls) ||
                other.showNavigationControls == showNavigationControls) &&
            (identical(other.showViewSelector, showViewSelector) ||
                other.showViewSelector == showViewSelector) &&
            (identical(other.showTodayButton, showTodayButton) ||
                other.showTodayButton == showTodayButton) &&
            (identical(other.startHour, startHour) ||
                other.startHour == startHour) &&
            (identical(other.endHour, endHour) || other.endHour == endHour) &&
            (identical(other.timeSlotDuration, timeSlotDuration) ||
                other.timeSlotDuration == timeSlotDuration) &&
            (identical(other.timeSlotHeight, timeSlotHeight) ||
                other.timeSlotHeight == timeSlotHeight) &&
            (identical(other.showCurrentTimeLine, showCurrentTimeLine) ||
                other.showCurrentTimeLine == showCurrentTimeLine) &&
            (identical(other.showWorkingHours, showWorkingHours) ||
                other.showWorkingHours == showWorkingHours) &&
            (identical(other.localization, localization) ||
                other.localization == localization) &&
            (identical(other.onEventTap, onEventTap) ||
                other.onEventTap == onEventTap) &&
            (identical(other.onDateTap, onDateTap) ||
                other.onDateTap == onDateTap) &&
            (identical(other.onRangeSelect, onRangeSelect) ||
                other.onRangeSelect == onRangeSelect) &&
            (identical(other.onViewChange, onViewChange) ||
                other.onViewChange == onViewChange) &&
            (identical(other.onDateChange, onDateChange) ||
                other.onDateChange == onDateChange) &&
            (identical(other.onEventCreate, onEventCreate) ||
                other.onEventCreate == onEventCreate) &&
            (identical(other.onEventMove, onEventMove) ||
                other.onEventMove == onEventMove) &&
            (identical(other.onEventResize, onEventResize) ||
                other.onEventResize == onEventResize) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.headerBackgroundColor, headerBackgroundColor) ||
                other.headerBackgroundColor == headerBackgroundColor) &&
            (identical(other.headerTextColor, headerTextColor) ||
                other.headerTextColor == headerTextColor) &&
            (identical(other.cellBackgroundColor, cellBackgroundColor) ||
                other.cellBackgroundColor == cellBackgroundColor) &&
            (identical(other.cellBorderColor, cellBorderColor) ||
                other.cellBorderColor == cellBorderColor) &&
            (identical(other.todayBackgroundColor, todayBackgroundColor) ||
                other.todayBackgroundColor == todayBackgroundColor) &&
            (identical(other.todayTextColor, todayTextColor) ||
                other.todayTextColor == todayTextColor) &&
            (identical(
                  other.selectedBackgroundColor,
                  selectedBackgroundColor,
                ) ||
                other.selectedBackgroundColor == selectedBackgroundColor) &&
            (identical(other.selectedTextColor, selectedTextColor) ||
                other.selectedTextColor == selectedTextColor) &&
            (identical(
                  other.disabledBackgroundColor,
                  disabledBackgroundColor,
                ) ||
                other.disabledBackgroundColor == disabledBackgroundColor) &&
            (identical(other.disabledTextColor, disabledTextColor) ||
                other.disabledTextColor == disabledTextColor) &&
            (identical(other.weekendBackgroundColor, weekendBackgroundColor) ||
                other.weekendBackgroundColor == weekendBackgroundColor) &&
            (identical(other.weekendTextColor, weekendTextColor) ||
                other.weekendTextColor == weekendTextColor) &&
            (identical(other.currentTimeLineColor, currentTimeLineColor) ||
                other.currentTimeLineColor == currentTimeLineColor) &&
            (identical(
                  other.workingHoursBackgroundColor,
                  workingHoursBackgroundColor,
                ) ||
                other.workingHoursBackgroundColor ==
                    workingHoursBackgroundColor) &&
            (identical(
                  other.nonWorkingHoursBackgroundColor,
                  nonWorkingHoursBackgroundColor,
                ) ||
                other.nonWorkingHoursBackgroundColor ==
                    nonWorkingHoursBackgroundColor) &&
            (identical(other.cellBorderRadius, cellBorderRadius) ||
                other.cellBorderRadius == cellBorderRadius) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            const DeepCollectionEquality().equals(
              other._boxShadow,
              _boxShadow,
            ) &&
            (identical(other.headerTextStyle, headerTextStyle) ||
                other.headerTextStyle == headerTextStyle) &&
            (identical(other.dateTextStyle, dateTextStyle) ||
                other.dateTextStyle == dateTextStyle) &&
            (identical(other.eventTextStyle, eventTextStyle) ||
                other.eventTextStyle == eventTextStyle) &&
            (identical(other.timeTextStyle, timeTextStyle) ||
                other.timeTextStyle == timeTextStyle) &&
            (identical(other.headerHeight, headerHeight) ||
                other.headerHeight == headerHeight) &&
            (identical(other.cellHeight, cellHeight) ||
                other.cellHeight == cellHeight) &&
            (identical(other.cellMinWidth, cellMinWidth) ||
                other.cellMinWidth == cellMinWidth) &&
            (identical(other.eventSpacing, eventSpacing) ||
                other.eventSpacing == eventSpacing) &&
            (identical(other.eventHeight, eventHeight) ||
                other.eventHeight == eventHeight) &&
            (identical(other.eventBorderRadius, eventBorderRadius) ||
                other.eventBorderRadius == eventBorderRadius) &&
            (identical(other.animationsEnabled, animationsEnabled) ||
                other.animationsEnabled == animationsEnabled) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration) &&
            (identical(
                  other.keyboardNavigationEnabled,
                  keyboardNavigationEnabled,
                ) ||
                other.keyboardNavigationEnabled == keyboardNavigationEnabled) &&
            (identical(other.gesturesEnabled, gesturesEnabled) ||
                other.gesturesEnabled == gesturesEnabled) &&
            (identical(other.zoomEnabled, zoomEnabled) ||
                other.zoomEnabled == zoomEnabled) &&
            (identical(other.minZoomFactor, minZoomFactor) ||
                other.minZoomFactor == minZoomFactor) &&
            (identical(other.maxZoomFactor, maxZoomFactor) ||
                other.maxZoomFactor == maxZoomFactor));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    variant,
    const DeepCollectionEquality().hash(_events),
    const DeepCollectionEquality().hash(_resources),
    selectedDate,
    selectedRange,
    minDate,
    maxDate,
    state,
    allowMultiSelect,
    allowRangeSelect,
    showWeekNumbers,
    showEventsInMonth,
    maxEventsPerDay,
    showHeader,
    showNavigationControls,
    showViewSelector,
    showTodayButton,
    startHour,
    endHour,
    timeSlotDuration,
    timeSlotHeight,
    showCurrentTimeLine,
    showWorkingHours,
    localization,
    onEventTap,
    onDateTap,
    onRangeSelect,
    onViewChange,
    onDateChange,
    onEventCreate,
    onEventMove,
    onEventResize,
    padding,
    margin,
    backgroundColor,
    headerBackgroundColor,
    headerTextColor,
    cellBackgroundColor,
    cellBorderColor,
    todayBackgroundColor,
    todayTextColor,
    selectedBackgroundColor,
    selectedTextColor,
    disabledBackgroundColor,
    disabledTextColor,
    weekendBackgroundColor,
    weekendTextColor,
    currentTimeLineColor,
    workingHoursBackgroundColor,
    nonWorkingHoursBackgroundColor,
    cellBorderRadius,
    borderRadius,
    const DeepCollectionEquality().hash(_boxShadow),
    headerTextStyle,
    dateTextStyle,
    eventTextStyle,
    timeTextStyle,
    headerHeight,
    cellHeight,
    cellMinWidth,
    eventSpacing,
    eventHeight,
    eventBorderRadius,
    animationsEnabled,
    animationDuration,
    keyboardNavigationEnabled,
    gesturesEnabled,
    zoomEnabled,
    minZoomFactor,
    maxZoomFactor,
  ]);

  /// Create a copy of DSCalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCalendarConfigImplCopyWith<_$DSCalendarConfigImpl> get copyWith =>
      __$$DSCalendarConfigImplCopyWithImpl<_$DSCalendarConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCalendarConfig implements DSCalendarConfig {
  const factory _DSCalendarConfig({
    final DSCalendarVariant variant,
    final List<DSCalendarEvent> events,
    final List<DSCalendarResource> resources,
    final DateTime? selectedDate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final DateTimeRange<DateTime>? selectedRange,
    final DateTime? minDate,
    final DateTime? maxDate,
    final DSCalendarState state,
    final bool allowMultiSelect,
    final bool allowRangeSelect,
    final bool showWeekNumbers,
    final bool showEventsInMonth,
    final int maxEventsPerDay,
    final bool showHeader,
    final bool showNavigationControls,
    final bool showViewSelector,
    final bool showTodayButton,
    final int startHour,
    final int endHour,
    final int timeSlotDuration,
    final double timeSlotHeight,
    final bool showCurrentTimeLine,
    final bool showWorkingHours,
    final DSCalendarLocalization? localization,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final DSCalendarEventTapCallback? onEventTap,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final DSCalendarDateTapCallback? onDateTap,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final DSCalendarDateRangeSelectCallback? onRangeSelect,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final void Function(DSCalendarVariant)? onViewChange,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final void Function(DateTime)? onDateChange,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final void Function(DateTime, DateTime)? onEventCreate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final void Function(DSCalendarEvent, DateTime)? onEventMove,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final void Function(DSCalendarEvent, DateTime, DateTime)? onEventResize,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final EdgeInsets? padding,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final EdgeInsets? margin,
    final Color? backgroundColor,
    final Color? headerBackgroundColor,
    final Color? headerTextColor,
    final Color? cellBackgroundColor,
    final Color? cellBorderColor,
    final Color? todayBackgroundColor,
    final Color? todayTextColor,
    final Color? selectedBackgroundColor,
    final Color? selectedTextColor,
    final Color? disabledBackgroundColor,
    final Color? disabledTextColor,
    final Color? weekendBackgroundColor,
    final Color? weekendTextColor,
    final Color? currentTimeLineColor,
    final Color? workingHoursBackgroundColor,
    final Color? nonWorkingHoursBackgroundColor,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final BorderRadius? cellBorderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final BorderRadius? borderRadius,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<BoxShadow>? boxShadow,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextStyle? headerTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextStyle? dateTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextStyle? eventTextStyle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextStyle? timeTextStyle,
    final double headerHeight,
    final double cellHeight,
    final double cellMinWidth,
    final double eventSpacing,
    final double eventHeight,
    final double eventBorderRadius,
    final bool animationsEnabled,
    final Duration animationDuration,
    final bool keyboardNavigationEnabled,
    final bool gesturesEnabled,
    final bool zoomEnabled,
    final double minZoomFactor,
    final double maxZoomFactor,
  }) = _$DSCalendarConfigImpl;

  /// Variante del calendario
  @override
  DSCalendarVariant get variant;

  /// Lista de eventos
  @override
  List<DSCalendarEvent> get events;

  /// Lista de recursos
  @override
  List<DSCalendarResource> get resources;

  /// Fecha inicial seleccionada
  @override
  DateTime? get selectedDate;

  /// Rango de fechas seleccionado
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTimeRange<DateTime>? get selectedRange;

  /// Fecha mínima seleccionable
  @override
  DateTime? get minDate;

  /// Fecha máxima seleccionable
  @override
  DateTime? get maxDate;

  /// Estado del calendario
  @override
  DSCalendarState get state;

  /// Si permite selección múltiple
  @override
  bool get allowMultiSelect;

  /// Si permite selección de rango
  @override
  bool get allowRangeSelect;

  /// Si muestra números de semana
  @override
  bool get showWeekNumbers;

  /// Si muestra eventos en vista de mes
  @override
  bool get showEventsInMonth;

  /// Máximo número de eventos a mostrar por día en vista de mes
  @override
  int get maxEventsPerDay;

  /// Si muestra header de navegación
  @override
  bool get showHeader;

  /// Si muestra controles de navegación
  @override
  bool get showNavigationControls;

  /// Si muestra selector de vista
  @override
  bool get showViewSelector;

  /// Si muestra botón "hoy"
  @override
  bool get showTodayButton;

  /// Hora de inicio para vistas de día/semana
  @override
  int get startHour;

  /// Hora de fin para vistas de día/semana
  @override
  int get endHour;

  /// Intervalo de tiempo en minutos
  @override
  int get timeSlotDuration;

  /// Altura de cada slot de tiempo
  @override
  double get timeSlotHeight;

  /// Si muestra línea de tiempo actual
  @override
  bool get showCurrentTimeLine;

  /// Si muestra horarios de trabajo
  @override
  bool get showWorkingHours;

  /// Configuración de localización
  @override
  DSCalendarLocalization? get localization;

  /// Callback cuando se toca un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DSCalendarEventTapCallback? get onEventTap;

  /// Callback cuando se toca una fecha
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DSCalendarDateTapCallback? get onDateTap;

  /// Callback cuando se selecciona un rango
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DSCalendarDateRangeSelectCallback? get onRangeSelect;

  /// Callback cuando cambia la vista
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DSCalendarVariant)? get onViewChange;

  /// Callback cuando cambia la fecha
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DateTime)? get onDateChange;

  /// Callback cuando se crea un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DateTime, DateTime)? get onEventCreate;

  /// Callback cuando se mueve un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DSCalendarEvent, DateTime)? get onEventMove;

  /// Callback cuando se redimensiona un evento
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  void Function(DSCalendarEvent, DateTime, DateTime)? get onEventResize; // Propiedades de estilo usando design tokens
  /// Padding del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  EdgeInsets? get padding;

  /// Margin del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  EdgeInsets? get margin;

  /// Color de fondo del calendario
  @override
  Color? get backgroundColor;

  /// Color de fondo del header
  @override
  Color? get headerBackgroundColor;

  /// Color del texto del header
  @override
  Color? get headerTextColor;

  /// Color de fondo de las celdas
  @override
  Color? get cellBackgroundColor;

  /// Color del borde de las celdas
  @override
  Color? get cellBorderColor;

  /// Color de fondo del día actual
  @override
  Color? get todayBackgroundColor;

  /// Color del texto del día actual
  @override
  Color? get todayTextColor;

  /// Color de fondo del día seleccionado
  @override
  Color? get selectedBackgroundColor;

  /// Color del texto del día seleccionado
  @override
  Color? get selectedTextColor;

  /// Color de fondo de días deshabilitados
  @override
  Color? get disabledBackgroundColor;

  /// Color del texto de días deshabilitados
  @override
  Color? get disabledTextColor;

  /// Color de fondo de fin de semana
  @override
  Color? get weekendBackgroundColor;

  /// Color del texto de fin de semana
  @override
  Color? get weekendTextColor;

  /// Color de la línea de tiempo actual
  @override
  Color? get currentTimeLineColor;

  /// Color de fondo de horario de trabajo
  @override
  Color? get workingHoursBackgroundColor;

  /// Color de fondo de horario no laboral
  @override
  Color? get nonWorkingHoursBackgroundColor;

  /// Radio de borde de las celdas
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  BorderRadius? get cellBorderRadius;

  /// Radio de borde del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  BorderRadius? get borderRadius;

  /// Sombra del calendario
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<BoxShadow>? get boxShadow;

  /// Estilo del texto del header
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get headerTextStyle;

  /// Estilo del texto de las fechas
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get dateTextStyle;

  /// Estilo del texto de los eventos
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get eventTextStyle;

  /// Estilo del texto de las horas
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyle? get timeTextStyle;

  /// Altura del header
  @override
  double get headerHeight;

  /// Altura de las celdas de fecha
  @override
  double get cellHeight;

  /// Ancho mínimo de las celdas
  @override
  double get cellMinWidth;

  /// Espaciado entre eventos
  @override
  double get eventSpacing;

  /// Altura de los eventos en vista de mes
  @override
  double get eventHeight;

  /// Radio de borde de los eventos
  @override
  double get eventBorderRadius;

  /// Animaciones habilitadas
  @override
  bool get animationsEnabled;

  /// Duración de las animaciones
  @override
  Duration get animationDuration;

  /// Soporte para navegación por teclado
  @override
  bool get keyboardNavigationEnabled;

  /// Soporte para gestos táctiles
  @override
  bool get gesturesEnabled;

  /// Soporte para zoom en vista de semana/día
  @override
  bool get zoomEnabled;

  /// Factor de zoom mínimo
  @override
  double get minZoomFactor;

  /// Factor de zoom máximo
  @override
  double get maxZoomFactor;

  /// Create a copy of DSCalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCalendarConfigImplCopyWith<_$DSCalendarConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
