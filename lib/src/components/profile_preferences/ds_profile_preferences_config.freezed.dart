// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_profile_preferences_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSProfilePreferencesConfig {
  /// Variante de secciones del componente
  DSProfileVariant get variant => throw _privateConstructorUsedError;

  /// Lista de campos/secciones de preferencias
  List<DSProfileField> get fields => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSProfileState get state => throw _privateConstructorUsedError;

  /// Configuración de colores (solo design tokens)
  DSProfileColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado (solo design tokens)
  DSProfileSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de tipografía (solo design tokens)
  DSProfileTypography? get typography => throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSProfileAnimation? get animation => throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSProfileBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSProfileA11yConfig? get a11yConfig => throw _privateConstructorUsedError;

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfilePreferencesConfigCopyWith<DSProfilePreferencesConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfilePreferencesConfigCopyWith<$Res> {
  factory $DSProfilePreferencesConfigCopyWith(
    DSProfilePreferencesConfig value,
    $Res Function(DSProfilePreferencesConfig) then,
  ) =
      _$DSProfilePreferencesConfigCopyWithImpl<
        $Res,
        DSProfilePreferencesConfig
      >;
  @useResult
  $Res call({
    DSProfileVariant variant,
    List<DSProfileField> fields,
    DSProfileState state,
    DSProfileColors? colors,
    DSProfileSpacing? spacing,
    DSProfileTypography? typography,
    DSProfileAnimation? animation,
    DSProfileBehavior? behavior,
    DSProfileA11yConfig? a11yConfig,
  });

  $DSProfileColorsCopyWith<$Res>? get colors;
  $DSProfileSpacingCopyWith<$Res>? get spacing;
  $DSProfileTypographyCopyWith<$Res>? get typography;
  $DSProfileAnimationCopyWith<$Res>? get animation;
  $DSProfileBehaviorCopyWith<$Res>? get behavior;
  $DSProfileA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class _$DSProfilePreferencesConfigCopyWithImpl<
  $Res,
  $Val extends DSProfilePreferencesConfig
>
    implements $DSProfilePreferencesConfigCopyWith<$Res> {
  _$DSProfilePreferencesConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? fields = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? typography = freezed,
    Object? animation = freezed,
    Object? behavior = freezed,
    Object? a11yConfig = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSProfileVariant,
            fields: null == fields
                ? _value.fields
                : fields // ignore: cast_nullable_to_non_nullable
                      as List<DSProfileField>,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSProfileState,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSProfileColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSProfileSpacing?,
            typography: freezed == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as DSProfileTypography?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSProfileAnimation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSProfileBehavior?,
            a11yConfig: freezed == a11yConfig
                ? _value.a11yConfig
                : a11yConfig // ignore: cast_nullable_to_non_nullable
                      as DSProfileA11yConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSProfileColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSProfileSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileTypographyCopyWith<$Res>? get typography {
    if (_value.typography == null) {
      return null;
    }

    return $DSProfileTypographyCopyWith<$Res>(_value.typography!, (value) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSProfileAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSProfileBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileA11yConfigCopyWith<$Res>? get a11yConfig {
    if (_value.a11yConfig == null) {
      return null;
    }

    return $DSProfileA11yConfigCopyWith<$Res>(_value.a11yConfig!, (value) {
      return _then(_value.copyWith(a11yConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSProfilePreferencesConfigImplCopyWith<$Res>
    implements $DSProfilePreferencesConfigCopyWith<$Res> {
  factory _$$DSProfilePreferencesConfigImplCopyWith(
    _$DSProfilePreferencesConfigImpl value,
    $Res Function(_$DSProfilePreferencesConfigImpl) then,
  ) = __$$DSProfilePreferencesConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSProfileVariant variant,
    List<DSProfileField> fields,
    DSProfileState state,
    DSProfileColors? colors,
    DSProfileSpacing? spacing,
    DSProfileTypography? typography,
    DSProfileAnimation? animation,
    DSProfileBehavior? behavior,
    DSProfileA11yConfig? a11yConfig,
  });

  @override
  $DSProfileColorsCopyWith<$Res>? get colors;
  @override
  $DSProfileSpacingCopyWith<$Res>? get spacing;
  @override
  $DSProfileTypographyCopyWith<$Res>? get typography;
  @override
  $DSProfileAnimationCopyWith<$Res>? get animation;
  @override
  $DSProfileBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSProfileA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class __$$DSProfilePreferencesConfigImplCopyWithImpl<$Res>
    extends
        _$DSProfilePreferencesConfigCopyWithImpl<
          $Res,
          _$DSProfilePreferencesConfigImpl
        >
    implements _$$DSProfilePreferencesConfigImplCopyWith<$Res> {
  __$$DSProfilePreferencesConfigImplCopyWithImpl(
    _$DSProfilePreferencesConfigImpl _value,
    $Res Function(_$DSProfilePreferencesConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? fields = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? typography = freezed,
    Object? animation = freezed,
    Object? behavior = freezed,
    Object? a11yConfig = freezed,
  }) {
    return _then(
      _$DSProfilePreferencesConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSProfileVariant,
        fields: null == fields
            ? _value._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as List<DSProfileField>,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSProfileState,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSProfileColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSProfileSpacing?,
        typography: freezed == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as DSProfileTypography?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSProfileAnimation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSProfileBehavior?,
        a11yConfig: freezed == a11yConfig
            ? _value.a11yConfig
            : a11yConfig // ignore: cast_nullable_to_non_nullable
                  as DSProfileA11yConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfilePreferencesConfigImpl implements _DSProfilePreferencesConfig {
  const _$DSProfilePreferencesConfigImpl({
    this.variant = DSProfileVariant.sections,
    final List<DSProfileField> fields = const [],
    this.state = DSProfileState.defaultState,
    this.colors,
    this.spacing,
    this.typography,
    this.animation,
    this.behavior,
    this.a11yConfig,
  }) : _fields = fields;

  /// Variante de secciones del componente
  @override
  @JsonKey()
  final DSProfileVariant variant;

  /// Lista de campos/secciones de preferencias
  final List<DSProfileField> _fields;

  /// Lista de campos/secciones de preferencias
  @override
  @JsonKey()
  List<DSProfileField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSProfileState state;

  /// Configuración de colores (solo design tokens)
  @override
  final DSProfileColors? colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  final DSProfileSpacing? spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  final DSProfileTypography? typography;

  /// Configuración de animaciones
  @override
  final DSProfileAnimation? animation;

  /// Configuración de comportamiento
  @override
  final DSProfileBehavior? behavior;

  /// Configuración de accesibilidad
  @override
  final DSProfileA11yConfig? a11yConfig;

  @override
  String toString() {
    return 'DSProfilePreferencesConfig(variant: $variant, fields: $fields, state: $state, colors: $colors, spacing: $spacing, typography: $typography, animation: $animation, behavior: $behavior, a11yConfig: $a11yConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfilePreferencesConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.typography, typography) ||
                other.typography == typography) &&
            (identical(other.animation, animation) ||
                other.animation == animation) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.a11yConfig, a11yConfig) ||
                other.a11yConfig == a11yConfig));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    const DeepCollectionEquality().hash(_fields),
    state,
    colors,
    spacing,
    typography,
    animation,
    behavior,
    a11yConfig,
  );

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfilePreferencesConfigImplCopyWith<_$DSProfilePreferencesConfigImpl>
  get copyWith =>
      __$$DSProfilePreferencesConfigImplCopyWithImpl<
        _$DSProfilePreferencesConfigImpl
      >(this, _$identity);
}

abstract class _DSProfilePreferencesConfig
    implements DSProfilePreferencesConfig {
  const factory _DSProfilePreferencesConfig({
    final DSProfileVariant variant,
    final List<DSProfileField> fields,
    final DSProfileState state,
    final DSProfileColors? colors,
    final DSProfileSpacing? spacing,
    final DSProfileTypography? typography,
    final DSProfileAnimation? animation,
    final DSProfileBehavior? behavior,
    final DSProfileA11yConfig? a11yConfig,
  }) = _$DSProfilePreferencesConfigImpl;

  /// Variante de secciones del componente
  @override
  DSProfileVariant get variant;

  /// Lista de campos/secciones de preferencias
  @override
  List<DSProfileField> get fields;

  /// Estado actual del componente
  @override
  DSProfileState get state;

  /// Configuración de colores (solo design tokens)
  @override
  DSProfileColors? get colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  DSProfileSpacing? get spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  DSProfileTypography? get typography;

  /// Configuración de animaciones
  @override
  DSProfileAnimation? get animation;

  /// Configuración de comportamiento
  @override
  DSProfileBehavior? get behavior;

  /// Configuración de accesibilidad
  @override
  DSProfileA11yConfig? get a11yConfig;

  /// Create a copy of DSProfilePreferencesConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfilePreferencesConfigImplCopyWith<_$DSProfilePreferencesConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileField {
  /// ID único del campo
  String get id => throw _privateConstructorUsedError;

  /// Tipo de campo
  DSProfileFieldType get type => throw _privateConstructorUsedError;

  /// Etiqueta principal del campo
  String get label => throw _privateConstructorUsedError;

  /// Valor actual del campo
  Object? get value => throw _privateConstructorUsedError;

  /// Valor por defecto
  Object? get defaultValue => throw _privateConstructorUsedError;

  /// Descripción o ayuda del campo
  String? get description => throw _privateConstructorUsedError;

  /// Placeholder para campos de texto
  String? get placeholder => throw _privateConstructorUsedError;

  /// Opciones para campos de selección
  List<DSProfileFieldOption> get options => throw _privateConstructorUsedError;

  /// Validación del campo
  DSProfileFieldValidation? get validation =>
      throw _privateConstructorUsedError;

  /// Si el campo es requerido
  bool get required => throw _privateConstructorUsedError;

  /// Si el campo está habilitado
  bool get enabled => throw _privateConstructorUsedError;

  /// Si el campo es de solo lectura
  bool get readonly => throw _privateConstructorUsedError;

  /// Importancia del campo para accesibilidad
  DSProfileFieldImportance get importance => throw _privateConstructorUsedError;

  /// Icono del campo
  IconData? get icon => throw _privateConstructorUsedError;

  /// Acción personalizada del campo
  VoidCallback? get onTap => throw _privateConstructorUsedError;

  /// Callback de cambio de valor
  ValueChanged<Object?>? get onChanged => throw _privateConstructorUsedError;

  /// Configuraciones específicas del tipo de campo
  Map<String, dynamic>? get config => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileFieldCopyWith<DSProfileField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileFieldCopyWith<$Res> {
  factory $DSProfileFieldCopyWith(
    DSProfileField value,
    $Res Function(DSProfileField) then,
  ) = _$DSProfileFieldCopyWithImpl<$Res, DSProfileField>;
  @useResult
  $Res call({
    String id,
    DSProfileFieldType type,
    String label,
    Object? value,
    Object? defaultValue,
    String? description,
    String? placeholder,
    List<DSProfileFieldOption> options,
    DSProfileFieldValidation? validation,
    bool required,
    bool enabled,
    bool readonly,
    DSProfileFieldImportance importance,
    IconData? icon,
    VoidCallback? onTap,
    ValueChanged<Object?>? onChanged,
    Map<String, dynamic>? config,
  });

  $DSProfileFieldValidationCopyWith<$Res>? get validation;
}

/// @nodoc
class _$DSProfileFieldCopyWithImpl<$Res, $Val extends DSProfileField>
    implements $DSProfileFieldCopyWith<$Res> {
  _$DSProfileFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? label = null,
    Object? value = freezed,
    Object? defaultValue = freezed,
    Object? description = freezed,
    Object? placeholder = freezed,
    Object? options = null,
    Object? validation = freezed,
    Object? required = null,
    Object? enabled = null,
    Object? readonly = null,
    Object? importance = null,
    Object? icon = freezed,
    Object? onTap = freezed,
    Object? onChanged = freezed,
    Object? config = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSProfileFieldType,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: freezed == value ? _value.value : value,
            defaultValue: freezed == defaultValue
                ? _value.defaultValue
                : defaultValue,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            placeholder: freezed == placeholder
                ? _value.placeholder
                : placeholder // ignore: cast_nullable_to_non_nullable
                      as String?,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<DSProfileFieldOption>,
            validation: freezed == validation
                ? _value.validation
                : validation // ignore: cast_nullable_to_non_nullable
                      as DSProfileFieldValidation?,
            required: null == required
                ? _value.required
                : required // ignore: cast_nullable_to_non_nullable
                      as bool,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            readonly: null == readonly
                ? _value.readonly
                : readonly // ignore: cast_nullable_to_non_nullable
                      as bool,
            importance: null == importance
                ? _value.importance
                : importance // ignore: cast_nullable_to_non_nullable
                      as DSProfileFieldImportance,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onChanged: freezed == onChanged
                ? _value.onChanged
                : onChanged // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<Object?>?,
            config: freezed == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSProfileField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProfileFieldValidationCopyWith<$Res>? get validation {
    if (_value.validation == null) {
      return null;
    }

    return $DSProfileFieldValidationCopyWith<$Res>(_value.validation!, (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSProfileFieldImplCopyWith<$Res>
    implements $DSProfileFieldCopyWith<$Res> {
  factory _$$DSProfileFieldImplCopyWith(
    _$DSProfileFieldImpl value,
    $Res Function(_$DSProfileFieldImpl) then,
  ) = __$$DSProfileFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DSProfileFieldType type,
    String label,
    Object? value,
    Object? defaultValue,
    String? description,
    String? placeholder,
    List<DSProfileFieldOption> options,
    DSProfileFieldValidation? validation,
    bool required,
    bool enabled,
    bool readonly,
    DSProfileFieldImportance importance,
    IconData? icon,
    VoidCallback? onTap,
    ValueChanged<Object?>? onChanged,
    Map<String, dynamic>? config,
  });

  @override
  $DSProfileFieldValidationCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$DSProfileFieldImplCopyWithImpl<$Res>
    extends _$DSProfileFieldCopyWithImpl<$Res, _$DSProfileFieldImpl>
    implements _$$DSProfileFieldImplCopyWith<$Res> {
  __$$DSProfileFieldImplCopyWithImpl(
    _$DSProfileFieldImpl _value,
    $Res Function(_$DSProfileFieldImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? label = null,
    Object? value = freezed,
    Object? defaultValue = freezed,
    Object? description = freezed,
    Object? placeholder = freezed,
    Object? options = null,
    Object? validation = freezed,
    Object? required = null,
    Object? enabled = null,
    Object? readonly = null,
    Object? importance = null,
    Object? icon = freezed,
    Object? onTap = freezed,
    Object? onChanged = freezed,
    Object? config = freezed,
  }) {
    return _then(
      _$DSProfileFieldImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSProfileFieldType,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: freezed == value ? _value.value : value,
        defaultValue: freezed == defaultValue
            ? _value.defaultValue
            : defaultValue,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        placeholder: freezed == placeholder
            ? _value.placeholder
            : placeholder // ignore: cast_nullable_to_non_nullable
                  as String?,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<DSProfileFieldOption>,
        validation: freezed == validation
            ? _value.validation
            : validation // ignore: cast_nullable_to_non_nullable
                  as DSProfileFieldValidation?,
        required: null == required
            ? _value.required
            : required // ignore: cast_nullable_to_non_nullable
                  as bool,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        readonly: null == readonly
            ? _value.readonly
            : readonly // ignore: cast_nullable_to_non_nullable
                  as bool,
        importance: null == importance
            ? _value.importance
            : importance // ignore: cast_nullable_to_non_nullable
                  as DSProfileFieldImportance,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onChanged: freezed == onChanged
            ? _value.onChanged
            : onChanged // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<Object?>?,
        config: freezed == config
            ? _value._config
            : config // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileFieldImpl implements _DSProfileField {
  const _$DSProfileFieldImpl({
    required this.id,
    required this.type,
    required this.label,
    this.value,
    this.defaultValue,
    this.description,
    this.placeholder,
    final List<DSProfileFieldOption> options = const [],
    this.validation,
    this.required = false,
    this.enabled = true,
    this.readonly = false,
    this.importance = DSProfileFieldImportance.normal,
    this.icon,
    this.onTap,
    this.onChanged,
    final Map<String, dynamic>? config,
  }) : _options = options,
       _config = config;

  /// ID único del campo
  @override
  final String id;

  /// Tipo de campo
  @override
  final DSProfileFieldType type;

  /// Etiqueta principal del campo
  @override
  final String label;

  /// Valor actual del campo
  @override
  final Object? value;

  /// Valor por defecto
  @override
  final Object? defaultValue;

  /// Descripción o ayuda del campo
  @override
  final String? description;

  /// Placeholder para campos de texto
  @override
  final String? placeholder;

  /// Opciones para campos de selección
  final List<DSProfileFieldOption> _options;

  /// Opciones para campos de selección
  @override
  @JsonKey()
  List<DSProfileFieldOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Validación del campo
  @override
  final DSProfileFieldValidation? validation;

  /// Si el campo es requerido
  @override
  @JsonKey()
  final bool required;

  /// Si el campo está habilitado
  @override
  @JsonKey()
  final bool enabled;

  /// Si el campo es de solo lectura
  @override
  @JsonKey()
  final bool readonly;

  /// Importancia del campo para accesibilidad
  @override
  @JsonKey()
  final DSProfileFieldImportance importance;

  /// Icono del campo
  @override
  final IconData? icon;

  /// Acción personalizada del campo
  @override
  final VoidCallback? onTap;

  /// Callback de cambio de valor
  @override
  final ValueChanged<Object?>? onChanged;

  /// Configuraciones específicas del tipo de campo
  final Map<String, dynamic>? _config;

  /// Configuraciones específicas del tipo de campo
  @override
  Map<String, dynamic>? get config {
    final value = _config;
    if (value == null) return null;
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DSProfileField(id: $id, type: $type, label: $label, value: $value, defaultValue: $defaultValue, description: $description, placeholder: $placeholder, options: $options, validation: $validation, required: $required, enabled: $enabled, readonly: $readonly, importance: $importance, icon: $icon, onTap: $onTap, onChanged: $onChanged, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(
              other.defaultValue,
              defaultValue,
            ) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.readonly, readonly) ||
                other.readonly == readonly) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.onChanged, onChanged) ||
                other.onChanged == onChanged) &&
            const DeepCollectionEquality().equals(other._config, _config));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    label,
    const DeepCollectionEquality().hash(value),
    const DeepCollectionEquality().hash(defaultValue),
    description,
    placeholder,
    const DeepCollectionEquality().hash(_options),
    validation,
    required,
    enabled,
    readonly,
    importance,
    icon,
    onTap,
    onChanged,
    const DeepCollectionEquality().hash(_config),
  );

  /// Create a copy of DSProfileField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileFieldImplCopyWith<_$DSProfileFieldImpl> get copyWith =>
      __$$DSProfileFieldImplCopyWithImpl<_$DSProfileFieldImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileField implements DSProfileField {
  const factory _DSProfileField({
    required final String id,
    required final DSProfileFieldType type,
    required final String label,
    final Object? value,
    final Object? defaultValue,
    final String? description,
    final String? placeholder,
    final List<DSProfileFieldOption> options,
    final DSProfileFieldValidation? validation,
    final bool required,
    final bool enabled,
    final bool readonly,
    final DSProfileFieldImportance importance,
    final IconData? icon,
    final VoidCallback? onTap,
    final ValueChanged<Object?>? onChanged,
    final Map<String, dynamic>? config,
  }) = _$DSProfileFieldImpl;

  /// ID único del campo
  @override
  String get id;

  /// Tipo de campo
  @override
  DSProfileFieldType get type;

  /// Etiqueta principal del campo
  @override
  String get label;

  /// Valor actual del campo
  @override
  Object? get value;

  /// Valor por defecto
  @override
  Object? get defaultValue;

  /// Descripción o ayuda del campo
  @override
  String? get description;

  /// Placeholder para campos de texto
  @override
  String? get placeholder;

  /// Opciones para campos de selección
  @override
  List<DSProfileFieldOption> get options;

  /// Validación del campo
  @override
  DSProfileFieldValidation? get validation;

  /// Si el campo es requerido
  @override
  bool get required;

  /// Si el campo está habilitado
  @override
  bool get enabled;

  /// Si el campo es de solo lectura
  @override
  bool get readonly;

  /// Importancia del campo para accesibilidad
  @override
  DSProfileFieldImportance get importance;

  /// Icono del campo
  @override
  IconData? get icon;

  /// Acción personalizada del campo
  @override
  VoidCallback? get onTap;

  /// Callback de cambio de valor
  @override
  ValueChanged<Object?>? get onChanged;

  /// Configuraciones específicas del tipo de campo
  @override
  Map<String, dynamic>? get config;

  /// Create a copy of DSProfileField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileFieldImplCopyWith<_$DSProfileFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileFieldOption {
  /// Valor de la opción
  Object get value => throw _privateConstructorUsedError;

  /// Label de la opción
  String get label => throw _privateConstructorUsedError;

  /// Descripción de la opción
  String? get description => throw _privateConstructorUsedError;

  /// Icono de la opción
  IconData? get icon => throw _privateConstructorUsedError;

  /// Si la opción está habilitada
  bool get enabled => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileFieldOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileFieldOptionCopyWith<DSProfileFieldOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileFieldOptionCopyWith<$Res> {
  factory $DSProfileFieldOptionCopyWith(
    DSProfileFieldOption value,
    $Res Function(DSProfileFieldOption) then,
  ) = _$DSProfileFieldOptionCopyWithImpl<$Res, DSProfileFieldOption>;
  @useResult
  $Res call({
    Object value,
    String label,
    String? description,
    IconData? icon,
    bool enabled,
  });
}

/// @nodoc
class _$DSProfileFieldOptionCopyWithImpl<
  $Res,
  $Val extends DSProfileFieldOption
>
    implements $DSProfileFieldOptionCopyWith<$Res> {
  _$DSProfileFieldOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileFieldOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? enabled = null,
  }) {
    return _then(
      _value.copyWith(
            value: null == value ? _value.value : value,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileFieldOptionImplCopyWith<$Res>
    implements $DSProfileFieldOptionCopyWith<$Res> {
  factory _$$DSProfileFieldOptionImplCopyWith(
    _$DSProfileFieldOptionImpl value,
    $Res Function(_$DSProfileFieldOptionImpl) then,
  ) = __$$DSProfileFieldOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Object value,
    String label,
    String? description,
    IconData? icon,
    bool enabled,
  });
}

/// @nodoc
class __$$DSProfileFieldOptionImplCopyWithImpl<$Res>
    extends _$DSProfileFieldOptionCopyWithImpl<$Res, _$DSProfileFieldOptionImpl>
    implements _$$DSProfileFieldOptionImplCopyWith<$Res> {
  __$$DSProfileFieldOptionImplCopyWithImpl(
    _$DSProfileFieldOptionImpl _value,
    $Res Function(_$DSProfileFieldOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileFieldOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? enabled = null,
  }) {
    return _then(
      _$DSProfileFieldOptionImpl(
        value: null == value ? _value.value : value,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileFieldOptionImpl implements _DSProfileFieldOption {
  const _$DSProfileFieldOptionImpl({
    required this.value,
    required this.label,
    this.description,
    this.icon,
    this.enabled = true,
  });

  /// Valor de la opción
  @override
  final Object value;

  /// Label de la opción
  @override
  final String label;

  /// Descripción de la opción
  @override
  final String? description;

  /// Icono de la opción
  @override
  final IconData? icon;

  /// Si la opción está habilitada
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'DSProfileFieldOption(value: $value, label: $label, description: $description, icon: $icon, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileFieldOptionImpl &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(value),
    label,
    description,
    icon,
    enabled,
  );

  /// Create a copy of DSProfileFieldOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileFieldOptionImplCopyWith<_$DSProfileFieldOptionImpl>
  get copyWith =>
      __$$DSProfileFieldOptionImplCopyWithImpl<_$DSProfileFieldOptionImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileFieldOption implements DSProfileFieldOption {
  const factory _DSProfileFieldOption({
    required final Object value,
    required final String label,
    final String? description,
    final IconData? icon,
    final bool enabled,
  }) = _$DSProfileFieldOptionImpl;

  /// Valor de la opción
  @override
  Object get value;

  /// Label de la opción
  @override
  String get label;

  /// Descripción de la opción
  @override
  String? get description;

  /// Icono de la opción
  @override
  IconData? get icon;

  /// Si la opción está habilitada
  @override
  bool get enabled;

  /// Create a copy of DSProfileFieldOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileFieldOptionImplCopyWith<_$DSProfileFieldOptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileFieldValidation {
  /// Si el campo es requerido
  bool get required => throw _privateConstructorUsedError;

  /// Longitud mínima
  int? get minLength => throw _privateConstructorUsedError;

  /// Longitud máxima
  int? get maxLength => throw _privateConstructorUsedError;

  /// Valor mínimo (para números)
  num? get min => throw _privateConstructorUsedError;

  /// Valor máximo (para números)
  num? get max => throw _privateConstructorUsedError;

  /// Patrón regex
  String? get pattern => throw _privateConstructorUsedError;

  /// Función de validación personalizada
  String? Function(Object?)? get validator =>
      throw _privateConstructorUsedError;

  /// Mensaje de error personalizado
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileFieldValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileFieldValidationCopyWith<DSProfileFieldValidation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileFieldValidationCopyWith<$Res> {
  factory $DSProfileFieldValidationCopyWith(
    DSProfileFieldValidation value,
    $Res Function(DSProfileFieldValidation) then,
  ) = _$DSProfileFieldValidationCopyWithImpl<$Res, DSProfileFieldValidation>;
  @useResult
  $Res call({
    bool required,
    int? minLength,
    int? maxLength,
    num? min,
    num? max,
    String? pattern,
    String? Function(Object?)? validator,
    String? errorMessage,
  });
}

/// @nodoc
class _$DSProfileFieldValidationCopyWithImpl<
  $Res,
  $Val extends DSProfileFieldValidation
>
    implements $DSProfileFieldValidationCopyWith<$Res> {
  _$DSProfileFieldValidationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileFieldValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? required = null,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? pattern = freezed,
    Object? validator = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            required: null == required
                ? _value.required
                : required // ignore: cast_nullable_to_non_nullable
                      as bool,
            minLength: freezed == minLength
                ? _value.minLength
                : minLength // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxLength: freezed == maxLength
                ? _value.maxLength
                : maxLength // ignore: cast_nullable_to_non_nullable
                      as int?,
            min: freezed == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as num?,
            max: freezed == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as num?,
            pattern: freezed == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            validator: freezed == validator
                ? _value.validator
                : validator // ignore: cast_nullable_to_non_nullable
                      as String? Function(Object?)?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileFieldValidationImplCopyWith<$Res>
    implements $DSProfileFieldValidationCopyWith<$Res> {
  factory _$$DSProfileFieldValidationImplCopyWith(
    _$DSProfileFieldValidationImpl value,
    $Res Function(_$DSProfileFieldValidationImpl) then,
  ) = __$$DSProfileFieldValidationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool required,
    int? minLength,
    int? maxLength,
    num? min,
    num? max,
    String? pattern,
    String? Function(Object?)? validator,
    String? errorMessage,
  });
}

/// @nodoc
class __$$DSProfileFieldValidationImplCopyWithImpl<$Res>
    extends
        _$DSProfileFieldValidationCopyWithImpl<
          $Res,
          _$DSProfileFieldValidationImpl
        >
    implements _$$DSProfileFieldValidationImplCopyWith<$Res> {
  __$$DSProfileFieldValidationImplCopyWithImpl(
    _$DSProfileFieldValidationImpl _value,
    $Res Function(_$DSProfileFieldValidationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileFieldValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? required = null,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? pattern = freezed,
    Object? validator = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$DSProfileFieldValidationImpl(
        required: null == required
            ? _value.required
            : required // ignore: cast_nullable_to_non_nullable
                  as bool,
        minLength: freezed == minLength
            ? _value.minLength
            : minLength // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxLength: freezed == maxLength
            ? _value.maxLength
            : maxLength // ignore: cast_nullable_to_non_nullable
                  as int?,
        min: freezed == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as num?,
        max: freezed == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as num?,
        pattern: freezed == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        validator: freezed == validator
            ? _value.validator
            : validator // ignore: cast_nullable_to_non_nullable
                  as String? Function(Object?)?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileFieldValidationImpl implements _DSProfileFieldValidation {
  const _$DSProfileFieldValidationImpl({
    this.required = false,
    this.minLength,
    this.maxLength,
    this.min,
    this.max,
    this.pattern,
    this.validator,
    this.errorMessage,
  });

  /// Si el campo es requerido
  @override
  @JsonKey()
  final bool required;

  /// Longitud mínima
  @override
  final int? minLength;

  /// Longitud máxima
  @override
  final int? maxLength;

  /// Valor mínimo (para números)
  @override
  final num? min;

  /// Valor máximo (para números)
  @override
  final num? max;

  /// Patrón regex
  @override
  final String? pattern;

  /// Función de validación personalizada
  @override
  final String? Function(Object?)? validator;

  /// Mensaje de error personalizado
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DSProfileFieldValidation(required: $required, minLength: $minLength, maxLength: $maxLength, min: $min, max: $max, pattern: $pattern, validator: $validator, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileFieldValidationImpl &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    required,
    minLength,
    maxLength,
    min,
    max,
    pattern,
    validator,
    errorMessage,
  );

  /// Create a copy of DSProfileFieldValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileFieldValidationImplCopyWith<_$DSProfileFieldValidationImpl>
  get copyWith =>
      __$$DSProfileFieldValidationImplCopyWithImpl<
        _$DSProfileFieldValidationImpl
      >(this, _$identity);
}

abstract class _DSProfileFieldValidation implements DSProfileFieldValidation {
  const factory _DSProfileFieldValidation({
    final bool required,
    final int? minLength,
    final int? maxLength,
    final num? min,
    final num? max,
    final String? pattern,
    final String? Function(Object?)? validator,
    final String? errorMessage,
  }) = _$DSProfileFieldValidationImpl;

  /// Si el campo es requerido
  @override
  bool get required;

  /// Longitud mínima
  @override
  int? get minLength;

  /// Longitud máxima
  @override
  int? get maxLength;

  /// Valor mínimo (para números)
  @override
  num? get min;

  /// Valor máximo (para números)
  @override
  num? get max;

  /// Patrón regex
  @override
  String? get pattern;

  /// Función de validación personalizada
  @override
  String? Function(Object?)? get validator;

  /// Mensaje de error personalizado
  @override
  String? get errorMessage;

  /// Create a copy of DSProfileFieldValidation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileFieldValidationImplCopyWith<_$DSProfileFieldValidationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileColors {
  /// Color de fondo principal
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color de fondo de las secciones
  Color? get sectionBackgroundColor => throw _privateConstructorUsedError;

  /// Color de fondo de los campos
  Color? get fieldBackgroundColor => throw _privateConstructorUsedError;

  /// Color de bordes
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Color de bordes enfocados
  Color? get focusedBorderColor => throw _privateConstructorUsedError;

  /// Color de bordes de error
  Color? get errorBorderColor => throw _privateConstructorUsedError;

  /// Color de texto principal
  Color? get textColor => throw _privateConstructorUsedError;

  /// Color de texto secundario
  Color? get secondaryTextColor => throw _privateConstructorUsedError;

  /// Color de texto de placeholder
  Color? get placeholderTextColor => throw _privateConstructorUsedError;

  /// Color de texto de error
  Color? get errorTextColor => throw _privateConstructorUsedError;

  /// Color de texto de ayuda
  Color? get helperTextColor => throw _privateConstructorUsedError;

  /// Color de iconos
  Color? get iconColor => throw _privateConstructorUsedError;

  /// Color de iconos deshabilitados
  Color? get disabledIconColor => throw _privateConstructorUsedError;

  /// Color de botones primarios
  Color? get primaryButtonColor => throw _privateConstructorUsedError;

  /// Color de texto de botones primarios
  Color? get primaryButtonTextColor => throw _privateConstructorUsedError;

  /// Color de botones secundarios
  Color? get secondaryButtonColor => throw _privateConstructorUsedError;

  /// Color de texto de botones secundarios
  Color? get secondaryButtonTextColor => throw _privateConstructorUsedError;

  /// Color de botones deshabilitados
  Color? get disabledButtonColor => throw _privateConstructorUsedError;

  /// Color de texto de botones deshabilitados
  Color? get disabledButtonTextColor => throw _privateConstructorUsedError;

  /// Color de switches activos
  Color? get switchActiveColor => throw _privateConstructorUsedError;

  /// Color de switches inactivos
  Color? get switchInactiveColor => throw _privateConstructorUsedError;

  /// Color de sliders
  Color? get sliderActiveColor => throw _privateConstructorUsedError;

  /// Color de track de sliders
  Color? get sliderTrackColor => throw _privateConstructorUsedError;

  /// Color de separadores
  Color? get dividerColor => throw _privateConstructorUsedError;

  /// Color de skeleton loading
  Color? get skeletonBaseColor => throw _privateConstructorUsedError;

  /// Color de highlight de skeleton
  Color? get skeletonHighlightColor => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileColorsCopyWith<DSProfileColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileColorsCopyWith<$Res> {
  factory $DSProfileColorsCopyWith(
    DSProfileColors value,
    $Res Function(DSProfileColors) then,
  ) = _$DSProfileColorsCopyWithImpl<$Res, DSProfileColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? sectionBackgroundColor,
    Color? fieldBackgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? textColor,
    Color? secondaryTextColor,
    Color? placeholderTextColor,
    Color? errorTextColor,
    Color? helperTextColor,
    Color? iconColor,
    Color? disabledIconColor,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    Color? secondaryButtonColor,
    Color? secondaryButtonTextColor,
    Color? disabledButtonColor,
    Color? disabledButtonTextColor,
    Color? switchActiveColor,
    Color? switchInactiveColor,
    Color? sliderActiveColor,
    Color? sliderTrackColor,
    Color? dividerColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
  });
}

/// @nodoc
class _$DSProfileColorsCopyWithImpl<$Res, $Val extends DSProfileColors>
    implements $DSProfileColorsCopyWith<$Res> {
  _$DSProfileColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? sectionBackgroundColor = freezed,
    Object? fieldBackgroundColor = freezed,
    Object? borderColor = freezed,
    Object? focusedBorderColor = freezed,
    Object? errorBorderColor = freezed,
    Object? textColor = freezed,
    Object? secondaryTextColor = freezed,
    Object? placeholderTextColor = freezed,
    Object? errorTextColor = freezed,
    Object? helperTextColor = freezed,
    Object? iconColor = freezed,
    Object? disabledIconColor = freezed,
    Object? primaryButtonColor = freezed,
    Object? primaryButtonTextColor = freezed,
    Object? secondaryButtonColor = freezed,
    Object? secondaryButtonTextColor = freezed,
    Object? disabledButtonColor = freezed,
    Object? disabledButtonTextColor = freezed,
    Object? switchActiveColor = freezed,
    Object? switchInactiveColor = freezed,
    Object? sliderActiveColor = freezed,
    Object? sliderTrackColor = freezed,
    Object? dividerColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            sectionBackgroundColor: freezed == sectionBackgroundColor
                ? _value.sectionBackgroundColor
                : sectionBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            fieldBackgroundColor: freezed == fieldBackgroundColor
                ? _value.fieldBackgroundColor
                : fieldBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            focusedBorderColor: freezed == focusedBorderColor
                ? _value.focusedBorderColor
                : focusedBorderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorBorderColor: freezed == errorBorderColor
                ? _value.errorBorderColor
                : errorBorderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            textColor: freezed == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            secondaryTextColor: freezed == secondaryTextColor
                ? _value.secondaryTextColor
                : secondaryTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            placeholderTextColor: freezed == placeholderTextColor
                ? _value.placeholderTextColor
                : placeholderTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorTextColor: freezed == errorTextColor
                ? _value.errorTextColor
                : errorTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            helperTextColor: freezed == helperTextColor
                ? _value.helperTextColor
                : helperTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            iconColor: freezed == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledIconColor: freezed == disabledIconColor
                ? _value.disabledIconColor
                : disabledIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            primaryButtonColor: freezed == primaryButtonColor
                ? _value.primaryButtonColor
                : primaryButtonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            primaryButtonTextColor: freezed == primaryButtonTextColor
                ? _value.primaryButtonTextColor
                : primaryButtonTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            secondaryButtonColor: freezed == secondaryButtonColor
                ? _value.secondaryButtonColor
                : secondaryButtonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            secondaryButtonTextColor: freezed == secondaryButtonTextColor
                ? _value.secondaryButtonTextColor
                : secondaryButtonTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledButtonColor: freezed == disabledButtonColor
                ? _value.disabledButtonColor
                : disabledButtonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledButtonTextColor: freezed == disabledButtonTextColor
                ? _value.disabledButtonTextColor
                : disabledButtonTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            switchActiveColor: freezed == switchActiveColor
                ? _value.switchActiveColor
                : switchActiveColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            switchInactiveColor: freezed == switchInactiveColor
                ? _value.switchInactiveColor
                : switchInactiveColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            sliderActiveColor: freezed == sliderActiveColor
                ? _value.sliderActiveColor
                : sliderActiveColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            sliderTrackColor: freezed == sliderTrackColor
                ? _value.sliderTrackColor
                : sliderTrackColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            dividerColor: freezed == dividerColor
                ? _value.dividerColor
                : dividerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonBaseColor: freezed == skeletonBaseColor
                ? _value.skeletonBaseColor
                : skeletonBaseColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonHighlightColor: freezed == skeletonHighlightColor
                ? _value.skeletonHighlightColor
                : skeletonHighlightColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileColorsImplCopyWith<$Res>
    implements $DSProfileColorsCopyWith<$Res> {
  factory _$$DSProfileColorsImplCopyWith(
    _$DSProfileColorsImpl value,
    $Res Function(_$DSProfileColorsImpl) then,
  ) = __$$DSProfileColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? sectionBackgroundColor,
    Color? fieldBackgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? textColor,
    Color? secondaryTextColor,
    Color? placeholderTextColor,
    Color? errorTextColor,
    Color? helperTextColor,
    Color? iconColor,
    Color? disabledIconColor,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    Color? secondaryButtonColor,
    Color? secondaryButtonTextColor,
    Color? disabledButtonColor,
    Color? disabledButtonTextColor,
    Color? switchActiveColor,
    Color? switchInactiveColor,
    Color? sliderActiveColor,
    Color? sliderTrackColor,
    Color? dividerColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
  });
}

/// @nodoc
class __$$DSProfileColorsImplCopyWithImpl<$Res>
    extends _$DSProfileColorsCopyWithImpl<$Res, _$DSProfileColorsImpl>
    implements _$$DSProfileColorsImplCopyWith<$Res> {
  __$$DSProfileColorsImplCopyWithImpl(
    _$DSProfileColorsImpl _value,
    $Res Function(_$DSProfileColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? sectionBackgroundColor = freezed,
    Object? fieldBackgroundColor = freezed,
    Object? borderColor = freezed,
    Object? focusedBorderColor = freezed,
    Object? errorBorderColor = freezed,
    Object? textColor = freezed,
    Object? secondaryTextColor = freezed,
    Object? placeholderTextColor = freezed,
    Object? errorTextColor = freezed,
    Object? helperTextColor = freezed,
    Object? iconColor = freezed,
    Object? disabledIconColor = freezed,
    Object? primaryButtonColor = freezed,
    Object? primaryButtonTextColor = freezed,
    Object? secondaryButtonColor = freezed,
    Object? secondaryButtonTextColor = freezed,
    Object? disabledButtonColor = freezed,
    Object? disabledButtonTextColor = freezed,
    Object? switchActiveColor = freezed,
    Object? switchInactiveColor = freezed,
    Object? sliderActiveColor = freezed,
    Object? sliderTrackColor = freezed,
    Object? dividerColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
  }) {
    return _then(
      _$DSProfileColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        sectionBackgroundColor: freezed == sectionBackgroundColor
            ? _value.sectionBackgroundColor
            : sectionBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        fieldBackgroundColor: freezed == fieldBackgroundColor
            ? _value.fieldBackgroundColor
            : fieldBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        focusedBorderColor: freezed == focusedBorderColor
            ? _value.focusedBorderColor
            : focusedBorderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorBorderColor: freezed == errorBorderColor
            ? _value.errorBorderColor
            : errorBorderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textColor: freezed == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryTextColor: freezed == secondaryTextColor
            ? _value.secondaryTextColor
            : secondaryTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        placeholderTextColor: freezed == placeholderTextColor
            ? _value.placeholderTextColor
            : placeholderTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorTextColor: freezed == errorTextColor
            ? _value.errorTextColor
            : errorTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        helperTextColor: freezed == helperTextColor
            ? _value.helperTextColor
            : helperTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        iconColor: freezed == iconColor
            ? _value.iconColor
            : iconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledIconColor: freezed == disabledIconColor
            ? _value.disabledIconColor
            : disabledIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryButtonColor: freezed == primaryButtonColor
            ? _value.primaryButtonColor
            : primaryButtonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryButtonTextColor: freezed == primaryButtonTextColor
            ? _value.primaryButtonTextColor
            : primaryButtonTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryButtonColor: freezed == secondaryButtonColor
            ? _value.secondaryButtonColor
            : secondaryButtonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryButtonTextColor: freezed == secondaryButtonTextColor
            ? _value.secondaryButtonTextColor
            : secondaryButtonTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledButtonColor: freezed == disabledButtonColor
            ? _value.disabledButtonColor
            : disabledButtonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledButtonTextColor: freezed == disabledButtonTextColor
            ? _value.disabledButtonTextColor
            : disabledButtonTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        switchActiveColor: freezed == switchActiveColor
            ? _value.switchActiveColor
            : switchActiveColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        switchInactiveColor: freezed == switchInactiveColor
            ? _value.switchInactiveColor
            : switchInactiveColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        sliderActiveColor: freezed == sliderActiveColor
            ? _value.sliderActiveColor
            : sliderActiveColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        sliderTrackColor: freezed == sliderTrackColor
            ? _value.sliderTrackColor
            : sliderTrackColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        dividerColor: freezed == dividerColor
            ? _value.dividerColor
            : dividerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonBaseColor: freezed == skeletonBaseColor
            ? _value.skeletonBaseColor
            : skeletonBaseColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonHighlightColor: freezed == skeletonHighlightColor
            ? _value.skeletonHighlightColor
            : skeletonHighlightColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileColorsImpl implements _DSProfileColors {
  const _$DSProfileColorsImpl({
    this.backgroundColor,
    this.sectionBackgroundColor,
    this.fieldBackgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textColor,
    this.secondaryTextColor,
    this.placeholderTextColor,
    this.errorTextColor,
    this.helperTextColor,
    this.iconColor,
    this.disabledIconColor,
    this.primaryButtonColor,
    this.primaryButtonTextColor,
    this.secondaryButtonColor,
    this.secondaryButtonTextColor,
    this.disabledButtonColor,
    this.disabledButtonTextColor,
    this.switchActiveColor,
    this.switchInactiveColor,
    this.sliderActiveColor,
    this.sliderTrackColor,
    this.dividerColor,
    this.skeletonBaseColor,
    this.skeletonHighlightColor,
  });

  /// Color de fondo principal
  @override
  final Color? backgroundColor;

  /// Color de fondo de las secciones
  @override
  final Color? sectionBackgroundColor;

  /// Color de fondo de los campos
  @override
  final Color? fieldBackgroundColor;

  /// Color de bordes
  @override
  final Color? borderColor;

  /// Color de bordes enfocados
  @override
  final Color? focusedBorderColor;

  /// Color de bordes de error
  @override
  final Color? errorBorderColor;

  /// Color de texto principal
  @override
  final Color? textColor;

  /// Color de texto secundario
  @override
  final Color? secondaryTextColor;

  /// Color de texto de placeholder
  @override
  final Color? placeholderTextColor;

  /// Color de texto de error
  @override
  final Color? errorTextColor;

  /// Color de texto de ayuda
  @override
  final Color? helperTextColor;

  /// Color de iconos
  @override
  final Color? iconColor;

  /// Color de iconos deshabilitados
  @override
  final Color? disabledIconColor;

  /// Color de botones primarios
  @override
  final Color? primaryButtonColor;

  /// Color de texto de botones primarios
  @override
  final Color? primaryButtonTextColor;

  /// Color de botones secundarios
  @override
  final Color? secondaryButtonColor;

  /// Color de texto de botones secundarios
  @override
  final Color? secondaryButtonTextColor;

  /// Color de botones deshabilitados
  @override
  final Color? disabledButtonColor;

  /// Color de texto de botones deshabilitados
  @override
  final Color? disabledButtonTextColor;

  /// Color de switches activos
  @override
  final Color? switchActiveColor;

  /// Color de switches inactivos
  @override
  final Color? switchInactiveColor;

  /// Color de sliders
  @override
  final Color? sliderActiveColor;

  /// Color de track de sliders
  @override
  final Color? sliderTrackColor;

  /// Color de separadores
  @override
  final Color? dividerColor;

  /// Color de skeleton loading
  @override
  final Color? skeletonBaseColor;

  /// Color de highlight de skeleton
  @override
  final Color? skeletonHighlightColor;

  @override
  String toString() {
    return 'DSProfileColors(backgroundColor: $backgroundColor, sectionBackgroundColor: $sectionBackgroundColor, fieldBackgroundColor: $fieldBackgroundColor, borderColor: $borderColor, focusedBorderColor: $focusedBorderColor, errorBorderColor: $errorBorderColor, textColor: $textColor, secondaryTextColor: $secondaryTextColor, placeholderTextColor: $placeholderTextColor, errorTextColor: $errorTextColor, helperTextColor: $helperTextColor, iconColor: $iconColor, disabledIconColor: $disabledIconColor, primaryButtonColor: $primaryButtonColor, primaryButtonTextColor: $primaryButtonTextColor, secondaryButtonColor: $secondaryButtonColor, secondaryButtonTextColor: $secondaryButtonTextColor, disabledButtonColor: $disabledButtonColor, disabledButtonTextColor: $disabledButtonTextColor, switchActiveColor: $switchActiveColor, switchInactiveColor: $switchInactiveColor, sliderActiveColor: $sliderActiveColor, sliderTrackColor: $sliderTrackColor, dividerColor: $dividerColor, skeletonBaseColor: $skeletonBaseColor, skeletonHighlightColor: $skeletonHighlightColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.sectionBackgroundColor, sectionBackgroundColor) ||
                other.sectionBackgroundColor == sectionBackgroundColor) &&
            (identical(other.fieldBackgroundColor, fieldBackgroundColor) ||
                other.fieldBackgroundColor == fieldBackgroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.focusedBorderColor, focusedBorderColor) ||
                other.focusedBorderColor == focusedBorderColor) &&
            (identical(other.errorBorderColor, errorBorderColor) ||
                other.errorBorderColor == errorBorderColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.secondaryTextColor, secondaryTextColor) ||
                other.secondaryTextColor == secondaryTextColor) &&
            (identical(other.placeholderTextColor, placeholderTextColor) ||
                other.placeholderTextColor == placeholderTextColor) &&
            (identical(other.errorTextColor, errorTextColor) ||
                other.errorTextColor == errorTextColor) &&
            (identical(other.helperTextColor, helperTextColor) ||
                other.helperTextColor == helperTextColor) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.disabledIconColor, disabledIconColor) ||
                other.disabledIconColor == disabledIconColor) &&
            (identical(other.primaryButtonColor, primaryButtonColor) ||
                other.primaryButtonColor == primaryButtonColor) &&
            (identical(other.primaryButtonTextColor, primaryButtonTextColor) ||
                other.primaryButtonTextColor == primaryButtonTextColor) &&
            (identical(other.secondaryButtonColor, secondaryButtonColor) ||
                other.secondaryButtonColor == secondaryButtonColor) &&
            (identical(
                  other.secondaryButtonTextColor,
                  secondaryButtonTextColor,
                ) ||
                other.secondaryButtonTextColor == secondaryButtonTextColor) &&
            (identical(other.disabledButtonColor, disabledButtonColor) ||
                other.disabledButtonColor == disabledButtonColor) &&
            (identical(
                  other.disabledButtonTextColor,
                  disabledButtonTextColor,
                ) ||
                other.disabledButtonTextColor == disabledButtonTextColor) &&
            (identical(other.switchActiveColor, switchActiveColor) ||
                other.switchActiveColor == switchActiveColor) &&
            (identical(other.switchInactiveColor, switchInactiveColor) ||
                other.switchInactiveColor == switchInactiveColor) &&
            (identical(other.sliderActiveColor, sliderActiveColor) ||
                other.sliderActiveColor == sliderActiveColor) &&
            (identical(other.sliderTrackColor, sliderTrackColor) ||
                other.sliderTrackColor == sliderTrackColor) &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(other.skeletonBaseColor, skeletonBaseColor) ||
                other.skeletonBaseColor == skeletonBaseColor) &&
            (identical(other.skeletonHighlightColor, skeletonHighlightColor) ||
                other.skeletonHighlightColor == skeletonHighlightColor));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    backgroundColor,
    sectionBackgroundColor,
    fieldBackgroundColor,
    borderColor,
    focusedBorderColor,
    errorBorderColor,
    textColor,
    secondaryTextColor,
    placeholderTextColor,
    errorTextColor,
    helperTextColor,
    iconColor,
    disabledIconColor,
    primaryButtonColor,
    primaryButtonTextColor,
    secondaryButtonColor,
    secondaryButtonTextColor,
    disabledButtonColor,
    disabledButtonTextColor,
    switchActiveColor,
    switchInactiveColor,
    sliderActiveColor,
    sliderTrackColor,
    dividerColor,
    skeletonBaseColor,
    skeletonHighlightColor,
  ]);

  /// Create a copy of DSProfileColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileColorsImplCopyWith<_$DSProfileColorsImpl> get copyWith =>
      __$$DSProfileColorsImplCopyWithImpl<_$DSProfileColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileColors implements DSProfileColors {
  const factory _DSProfileColors({
    final Color? backgroundColor,
    final Color? sectionBackgroundColor,
    final Color? fieldBackgroundColor,
    final Color? borderColor,
    final Color? focusedBorderColor,
    final Color? errorBorderColor,
    final Color? textColor,
    final Color? secondaryTextColor,
    final Color? placeholderTextColor,
    final Color? errorTextColor,
    final Color? helperTextColor,
    final Color? iconColor,
    final Color? disabledIconColor,
    final Color? primaryButtonColor,
    final Color? primaryButtonTextColor,
    final Color? secondaryButtonColor,
    final Color? secondaryButtonTextColor,
    final Color? disabledButtonColor,
    final Color? disabledButtonTextColor,
    final Color? switchActiveColor,
    final Color? switchInactiveColor,
    final Color? sliderActiveColor,
    final Color? sliderTrackColor,
    final Color? dividerColor,
    final Color? skeletonBaseColor,
    final Color? skeletonHighlightColor,
  }) = _$DSProfileColorsImpl;

  /// Color de fondo principal
  @override
  Color? get backgroundColor;

  /// Color de fondo de las secciones
  @override
  Color? get sectionBackgroundColor;

  /// Color de fondo de los campos
  @override
  Color? get fieldBackgroundColor;

  /// Color de bordes
  @override
  Color? get borderColor;

  /// Color de bordes enfocados
  @override
  Color? get focusedBorderColor;

  /// Color de bordes de error
  @override
  Color? get errorBorderColor;

  /// Color de texto principal
  @override
  Color? get textColor;

  /// Color de texto secundario
  @override
  Color? get secondaryTextColor;

  /// Color de texto de placeholder
  @override
  Color? get placeholderTextColor;

  /// Color de texto de error
  @override
  Color? get errorTextColor;

  /// Color de texto de ayuda
  @override
  Color? get helperTextColor;

  /// Color de iconos
  @override
  Color? get iconColor;

  /// Color de iconos deshabilitados
  @override
  Color? get disabledIconColor;

  /// Color de botones primarios
  @override
  Color? get primaryButtonColor;

  /// Color de texto de botones primarios
  @override
  Color? get primaryButtonTextColor;

  /// Color de botones secundarios
  @override
  Color? get secondaryButtonColor;

  /// Color de texto de botones secundarios
  @override
  Color? get secondaryButtonTextColor;

  /// Color de botones deshabilitados
  @override
  Color? get disabledButtonColor;

  /// Color de texto de botones deshabilitados
  @override
  Color? get disabledButtonTextColor;

  /// Color de switches activos
  @override
  Color? get switchActiveColor;

  /// Color de switches inactivos
  @override
  Color? get switchInactiveColor;

  /// Color de sliders
  @override
  Color? get sliderActiveColor;

  /// Color de track de sliders
  @override
  Color? get sliderTrackColor;

  /// Color de separadores
  @override
  Color? get dividerColor;

  /// Color de skeleton loading
  @override
  Color? get skeletonBaseColor;

  /// Color de highlight de skeleton
  @override
  Color? get skeletonHighlightColor;

  /// Create a copy of DSProfileColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileColorsImplCopyWith<_$DSProfileColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileSpacing {
  /// Padding de la pantalla principal
  EdgeInsets get screenPadding => throw _privateConstructorUsedError;

  /// Padding de las secciones
  EdgeInsets get sectionPadding => throw _privateConstructorUsedError;

  /// Padding de los campos
  EdgeInsets get fieldPadding => throw _privateConstructorUsedError;

  /// Padding de los botones
  EdgeInsets get buttonPadding => throw _privateConstructorUsedError;

  /// Espacio entre secciones
  double get sectionSpacing => throw _privateConstructorUsedError;

  /// Espacio entre campos
  double get fieldSpacing => throw _privateConstructorUsedError;

  /// Espacio entre elementos pequeños
  double get smallSpacing => throw _privateConstructorUsedError;

  /// Radio de bordes de secciones
  double get sectionBorderRadius => throw _privateConstructorUsedError;

  /// Radio de bordes de campos
  double get fieldBorderRadius => throw _privateConstructorUsedError;

  /// Radio de bordes de botones
  double get buttonBorderRadius => throw _privateConstructorUsedError;

  /// Ancho de bordes
  double get borderWidth => throw _privateConstructorUsedError;

  /// Ancho de bordes enfocados
  double get focusedBorderWidth => throw _privateConstructorUsedError;

  /// Altura mínima de campos
  double get fieldMinHeight => throw _privateConstructorUsedError;

  /// Altura mínima de botones
  double get buttonMinHeight => throw _privateConstructorUsedError;

  /// Elevación de secciones
  double get sectionElevation => throw _privateConstructorUsedError;

  /// Elevación de campos enfocados
  double get focusedElevation => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileSpacingCopyWith<DSProfileSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileSpacingCopyWith<$Res> {
  factory $DSProfileSpacingCopyWith(
    DSProfileSpacing value,
    $Res Function(DSProfileSpacing) then,
  ) = _$DSProfileSpacingCopyWithImpl<$Res, DSProfileSpacing>;
  @useResult
  $Res call({
    EdgeInsets screenPadding,
    EdgeInsets sectionPadding,
    EdgeInsets fieldPadding,
    EdgeInsets buttonPadding,
    double sectionSpacing,
    double fieldSpacing,
    double smallSpacing,
    double sectionBorderRadius,
    double fieldBorderRadius,
    double buttonBorderRadius,
    double borderWidth,
    double focusedBorderWidth,
    double fieldMinHeight,
    double buttonMinHeight,
    double sectionElevation,
    double focusedElevation,
  });
}

/// @nodoc
class _$DSProfileSpacingCopyWithImpl<$Res, $Val extends DSProfileSpacing>
    implements $DSProfileSpacingCopyWith<$Res> {
  _$DSProfileSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenPadding = null,
    Object? sectionPadding = null,
    Object? fieldPadding = null,
    Object? buttonPadding = null,
    Object? sectionSpacing = null,
    Object? fieldSpacing = null,
    Object? smallSpacing = null,
    Object? sectionBorderRadius = null,
    Object? fieldBorderRadius = null,
    Object? buttonBorderRadius = null,
    Object? borderWidth = null,
    Object? focusedBorderWidth = null,
    Object? fieldMinHeight = null,
    Object? buttonMinHeight = null,
    Object? sectionElevation = null,
    Object? focusedElevation = null,
  }) {
    return _then(
      _value.copyWith(
            screenPadding: null == screenPadding
                ? _value.screenPadding
                : screenPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            sectionPadding: null == sectionPadding
                ? _value.sectionPadding
                : sectionPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            fieldPadding: null == fieldPadding
                ? _value.fieldPadding
                : fieldPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            buttonPadding: null == buttonPadding
                ? _value.buttonPadding
                : buttonPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            sectionSpacing: null == sectionSpacing
                ? _value.sectionSpacing
                : sectionSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            fieldSpacing: null == fieldSpacing
                ? _value.fieldSpacing
                : fieldSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            smallSpacing: null == smallSpacing
                ? _value.smallSpacing
                : smallSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            sectionBorderRadius: null == sectionBorderRadius
                ? _value.sectionBorderRadius
                : sectionBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            fieldBorderRadius: null == fieldBorderRadius
                ? _value.fieldBorderRadius
                : fieldBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            buttonBorderRadius: null == buttonBorderRadius
                ? _value.buttonBorderRadius
                : buttonBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            borderWidth: null == borderWidth
                ? _value.borderWidth
                : borderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            focusedBorderWidth: null == focusedBorderWidth
                ? _value.focusedBorderWidth
                : focusedBorderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            fieldMinHeight: null == fieldMinHeight
                ? _value.fieldMinHeight
                : fieldMinHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            buttonMinHeight: null == buttonMinHeight
                ? _value.buttonMinHeight
                : buttonMinHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            sectionElevation: null == sectionElevation
                ? _value.sectionElevation
                : sectionElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            focusedElevation: null == focusedElevation
                ? _value.focusedElevation
                : focusedElevation // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileSpacingImplCopyWith<$Res>
    implements $DSProfileSpacingCopyWith<$Res> {
  factory _$$DSProfileSpacingImplCopyWith(
    _$DSProfileSpacingImpl value,
    $Res Function(_$DSProfileSpacingImpl) then,
  ) = __$$DSProfileSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EdgeInsets screenPadding,
    EdgeInsets sectionPadding,
    EdgeInsets fieldPadding,
    EdgeInsets buttonPadding,
    double sectionSpacing,
    double fieldSpacing,
    double smallSpacing,
    double sectionBorderRadius,
    double fieldBorderRadius,
    double buttonBorderRadius,
    double borderWidth,
    double focusedBorderWidth,
    double fieldMinHeight,
    double buttonMinHeight,
    double sectionElevation,
    double focusedElevation,
  });
}

/// @nodoc
class __$$DSProfileSpacingImplCopyWithImpl<$Res>
    extends _$DSProfileSpacingCopyWithImpl<$Res, _$DSProfileSpacingImpl>
    implements _$$DSProfileSpacingImplCopyWith<$Res> {
  __$$DSProfileSpacingImplCopyWithImpl(
    _$DSProfileSpacingImpl _value,
    $Res Function(_$DSProfileSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenPadding = null,
    Object? sectionPadding = null,
    Object? fieldPadding = null,
    Object? buttonPadding = null,
    Object? sectionSpacing = null,
    Object? fieldSpacing = null,
    Object? smallSpacing = null,
    Object? sectionBorderRadius = null,
    Object? fieldBorderRadius = null,
    Object? buttonBorderRadius = null,
    Object? borderWidth = null,
    Object? focusedBorderWidth = null,
    Object? fieldMinHeight = null,
    Object? buttonMinHeight = null,
    Object? sectionElevation = null,
    Object? focusedElevation = null,
  }) {
    return _then(
      _$DSProfileSpacingImpl(
        screenPadding: null == screenPadding
            ? _value.screenPadding
            : screenPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        sectionPadding: null == sectionPadding
            ? _value.sectionPadding
            : sectionPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        fieldPadding: null == fieldPadding
            ? _value.fieldPadding
            : fieldPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        buttonPadding: null == buttonPadding
            ? _value.buttonPadding
            : buttonPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        sectionSpacing: null == sectionSpacing
            ? _value.sectionSpacing
            : sectionSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        fieldSpacing: null == fieldSpacing
            ? _value.fieldSpacing
            : fieldSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        smallSpacing: null == smallSpacing
            ? _value.smallSpacing
            : smallSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        sectionBorderRadius: null == sectionBorderRadius
            ? _value.sectionBorderRadius
            : sectionBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        fieldBorderRadius: null == fieldBorderRadius
            ? _value.fieldBorderRadius
            : fieldBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        buttonBorderRadius: null == buttonBorderRadius
            ? _value.buttonBorderRadius
            : buttonBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        borderWidth: null == borderWidth
            ? _value.borderWidth
            : borderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        focusedBorderWidth: null == focusedBorderWidth
            ? _value.focusedBorderWidth
            : focusedBorderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        fieldMinHeight: null == fieldMinHeight
            ? _value.fieldMinHeight
            : fieldMinHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        buttonMinHeight: null == buttonMinHeight
            ? _value.buttonMinHeight
            : buttonMinHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        sectionElevation: null == sectionElevation
            ? _value.sectionElevation
            : sectionElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        focusedElevation: null == focusedElevation
            ? _value.focusedElevation
            : focusedElevation // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileSpacingImpl implements _DSProfileSpacing {
  const _$DSProfileSpacingImpl({
    this.screenPadding = const EdgeInsets.all(16),
    this.sectionPadding = const EdgeInsets.all(16),
    this.fieldPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
    this.sectionSpacing = 24.0,
    this.fieldSpacing = 16.0,
    this.smallSpacing = 8.0,
    this.sectionBorderRadius = 12.0,
    this.fieldBorderRadius = 8.0,
    this.buttonBorderRadius = 8.0,
    this.borderWidth = 1.0,
    this.focusedBorderWidth = 2.0,
    this.fieldMinHeight = 48.0,
    this.buttonMinHeight = 44.0,
    this.sectionElevation = 1.0,
    this.focusedElevation = 2.0,
  });

  /// Padding de la pantalla principal
  @override
  @JsonKey()
  final EdgeInsets screenPadding;

  /// Padding de las secciones
  @override
  @JsonKey()
  final EdgeInsets sectionPadding;

  /// Padding de los campos
  @override
  @JsonKey()
  final EdgeInsets fieldPadding;

  /// Padding de los botones
  @override
  @JsonKey()
  final EdgeInsets buttonPadding;

  /// Espacio entre secciones
  @override
  @JsonKey()
  final double sectionSpacing;

  /// Espacio entre campos
  @override
  @JsonKey()
  final double fieldSpacing;

  /// Espacio entre elementos pequeños
  @override
  @JsonKey()
  final double smallSpacing;

  /// Radio de bordes de secciones
  @override
  @JsonKey()
  final double sectionBorderRadius;

  /// Radio de bordes de campos
  @override
  @JsonKey()
  final double fieldBorderRadius;

  /// Radio de bordes de botones
  @override
  @JsonKey()
  final double buttonBorderRadius;

  /// Ancho de bordes
  @override
  @JsonKey()
  final double borderWidth;

  /// Ancho de bordes enfocados
  @override
  @JsonKey()
  final double focusedBorderWidth;

  /// Altura mínima de campos
  @override
  @JsonKey()
  final double fieldMinHeight;

  /// Altura mínima de botones
  @override
  @JsonKey()
  final double buttonMinHeight;

  /// Elevación de secciones
  @override
  @JsonKey()
  final double sectionElevation;

  /// Elevación de campos enfocados
  @override
  @JsonKey()
  final double focusedElevation;

  @override
  String toString() {
    return 'DSProfileSpacing(screenPadding: $screenPadding, sectionPadding: $sectionPadding, fieldPadding: $fieldPadding, buttonPadding: $buttonPadding, sectionSpacing: $sectionSpacing, fieldSpacing: $fieldSpacing, smallSpacing: $smallSpacing, sectionBorderRadius: $sectionBorderRadius, fieldBorderRadius: $fieldBorderRadius, buttonBorderRadius: $buttonBorderRadius, borderWidth: $borderWidth, focusedBorderWidth: $focusedBorderWidth, fieldMinHeight: $fieldMinHeight, buttonMinHeight: $buttonMinHeight, sectionElevation: $sectionElevation, focusedElevation: $focusedElevation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileSpacingImpl &&
            (identical(other.screenPadding, screenPadding) ||
                other.screenPadding == screenPadding) &&
            (identical(other.sectionPadding, sectionPadding) ||
                other.sectionPadding == sectionPadding) &&
            (identical(other.fieldPadding, fieldPadding) ||
                other.fieldPadding == fieldPadding) &&
            (identical(other.buttonPadding, buttonPadding) ||
                other.buttonPadding == buttonPadding) &&
            (identical(other.sectionSpacing, sectionSpacing) ||
                other.sectionSpacing == sectionSpacing) &&
            (identical(other.fieldSpacing, fieldSpacing) ||
                other.fieldSpacing == fieldSpacing) &&
            (identical(other.smallSpacing, smallSpacing) ||
                other.smallSpacing == smallSpacing) &&
            (identical(other.sectionBorderRadius, sectionBorderRadius) ||
                other.sectionBorderRadius == sectionBorderRadius) &&
            (identical(other.fieldBorderRadius, fieldBorderRadius) ||
                other.fieldBorderRadius == fieldBorderRadius) &&
            (identical(other.buttonBorderRadius, buttonBorderRadius) ||
                other.buttonBorderRadius == buttonBorderRadius) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.focusedBorderWidth, focusedBorderWidth) ||
                other.focusedBorderWidth == focusedBorderWidth) &&
            (identical(other.fieldMinHeight, fieldMinHeight) ||
                other.fieldMinHeight == fieldMinHeight) &&
            (identical(other.buttonMinHeight, buttonMinHeight) ||
                other.buttonMinHeight == buttonMinHeight) &&
            (identical(other.sectionElevation, sectionElevation) ||
                other.sectionElevation == sectionElevation) &&
            (identical(other.focusedElevation, focusedElevation) ||
                other.focusedElevation == focusedElevation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    screenPadding,
    sectionPadding,
    fieldPadding,
    buttonPadding,
    sectionSpacing,
    fieldSpacing,
    smallSpacing,
    sectionBorderRadius,
    fieldBorderRadius,
    buttonBorderRadius,
    borderWidth,
    focusedBorderWidth,
    fieldMinHeight,
    buttonMinHeight,
    sectionElevation,
    focusedElevation,
  );

  /// Create a copy of DSProfileSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileSpacingImplCopyWith<_$DSProfileSpacingImpl> get copyWith =>
      __$$DSProfileSpacingImplCopyWithImpl<_$DSProfileSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileSpacing implements DSProfileSpacing {
  const factory _DSProfileSpacing({
    final EdgeInsets screenPadding,
    final EdgeInsets sectionPadding,
    final EdgeInsets fieldPadding,
    final EdgeInsets buttonPadding,
    final double sectionSpacing,
    final double fieldSpacing,
    final double smallSpacing,
    final double sectionBorderRadius,
    final double fieldBorderRadius,
    final double buttonBorderRadius,
    final double borderWidth,
    final double focusedBorderWidth,
    final double fieldMinHeight,
    final double buttonMinHeight,
    final double sectionElevation,
    final double focusedElevation,
  }) = _$DSProfileSpacingImpl;

  /// Padding de la pantalla principal
  @override
  EdgeInsets get screenPadding;

  /// Padding de las secciones
  @override
  EdgeInsets get sectionPadding;

  /// Padding de los campos
  @override
  EdgeInsets get fieldPadding;

  /// Padding de los botones
  @override
  EdgeInsets get buttonPadding;

  /// Espacio entre secciones
  @override
  double get sectionSpacing;

  /// Espacio entre campos
  @override
  double get fieldSpacing;

  /// Espacio entre elementos pequeños
  @override
  double get smallSpacing;

  /// Radio de bordes de secciones
  @override
  double get sectionBorderRadius;

  /// Radio de bordes de campos
  @override
  double get fieldBorderRadius;

  /// Radio de bordes de botones
  @override
  double get buttonBorderRadius;

  /// Ancho de bordes
  @override
  double get borderWidth;

  /// Ancho de bordes enfocados
  @override
  double get focusedBorderWidth;

  /// Altura mínima de campos
  @override
  double get fieldMinHeight;

  /// Altura mínima de botones
  @override
  double get buttonMinHeight;

  /// Elevación de secciones
  @override
  double get sectionElevation;

  /// Elevación de campos enfocados
  @override
  double get focusedElevation;

  /// Create a copy of DSProfileSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileSpacingImplCopyWith<_$DSProfileSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileTypography {
  /// Estilo para títulos de sección
  TextStyle? get sectionHeaderStyle => throw _privateConstructorUsedError;

  /// Estilo para labels de campos
  TextStyle? get fieldLabelStyle => throw _privateConstructorUsedError;

  /// Estilo para texto de campos
  TextStyle? get fieldTextStyle => throw _privateConstructorUsedError;

  /// Estilo para placeholder
  TextStyle? get placeholderStyle => throw _privateConstructorUsedError;

  /// Estilo para texto de ayuda
  TextStyle? get helperTextStyle => throw _privateConstructorUsedError;

  /// Estilo para texto de error
  TextStyle? get errorTextStyle => throw _privateConstructorUsedError;

  /// Estilo para texto de botones
  TextStyle? get buttonTextStyle => throw _privateConstructorUsedError;

  /// Estilo para texto de descripción
  TextStyle? get descriptionStyle => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileTypographyCopyWith<DSProfileTypography> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileTypographyCopyWith<$Res> {
  factory $DSProfileTypographyCopyWith(
    DSProfileTypography value,
    $Res Function(DSProfileTypography) then,
  ) = _$DSProfileTypographyCopyWithImpl<$Res, DSProfileTypography>;
  @useResult
  $Res call({
    TextStyle? sectionHeaderStyle,
    TextStyle? fieldLabelStyle,
    TextStyle? fieldTextStyle,
    TextStyle? placeholderStyle,
    TextStyle? helperTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? buttonTextStyle,
    TextStyle? descriptionStyle,
  });
}

/// @nodoc
class _$DSProfileTypographyCopyWithImpl<$Res, $Val extends DSProfileTypography>
    implements $DSProfileTypographyCopyWith<$Res> {
  _$DSProfileTypographyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionHeaderStyle = freezed,
    Object? fieldLabelStyle = freezed,
    Object? fieldTextStyle = freezed,
    Object? placeholderStyle = freezed,
    Object? helperTextStyle = freezed,
    Object? errorTextStyle = freezed,
    Object? buttonTextStyle = freezed,
    Object? descriptionStyle = freezed,
  }) {
    return _then(
      _value.copyWith(
            sectionHeaderStyle: freezed == sectionHeaderStyle
                ? _value.sectionHeaderStyle
                : sectionHeaderStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            fieldLabelStyle: freezed == fieldLabelStyle
                ? _value.fieldLabelStyle
                : fieldLabelStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            fieldTextStyle: freezed == fieldTextStyle
                ? _value.fieldTextStyle
                : fieldTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            placeholderStyle: freezed == placeholderStyle
                ? _value.placeholderStyle
                : placeholderStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            helperTextStyle: freezed == helperTextStyle
                ? _value.helperTextStyle
                : helperTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            errorTextStyle: freezed == errorTextStyle
                ? _value.errorTextStyle
                : errorTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            buttonTextStyle: freezed == buttonTextStyle
                ? _value.buttonTextStyle
                : buttonTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            descriptionStyle: freezed == descriptionStyle
                ? _value.descriptionStyle
                : descriptionStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileTypographyImplCopyWith<$Res>
    implements $DSProfileTypographyCopyWith<$Res> {
  factory _$$DSProfileTypographyImplCopyWith(
    _$DSProfileTypographyImpl value,
    $Res Function(_$DSProfileTypographyImpl) then,
  ) = __$$DSProfileTypographyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TextStyle? sectionHeaderStyle,
    TextStyle? fieldLabelStyle,
    TextStyle? fieldTextStyle,
    TextStyle? placeholderStyle,
    TextStyle? helperTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? buttonTextStyle,
    TextStyle? descriptionStyle,
  });
}

/// @nodoc
class __$$DSProfileTypographyImplCopyWithImpl<$Res>
    extends _$DSProfileTypographyCopyWithImpl<$Res, _$DSProfileTypographyImpl>
    implements _$$DSProfileTypographyImplCopyWith<$Res> {
  __$$DSProfileTypographyImplCopyWithImpl(
    _$DSProfileTypographyImpl _value,
    $Res Function(_$DSProfileTypographyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionHeaderStyle = freezed,
    Object? fieldLabelStyle = freezed,
    Object? fieldTextStyle = freezed,
    Object? placeholderStyle = freezed,
    Object? helperTextStyle = freezed,
    Object? errorTextStyle = freezed,
    Object? buttonTextStyle = freezed,
    Object? descriptionStyle = freezed,
  }) {
    return _then(
      _$DSProfileTypographyImpl(
        sectionHeaderStyle: freezed == sectionHeaderStyle
            ? _value.sectionHeaderStyle
            : sectionHeaderStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        fieldLabelStyle: freezed == fieldLabelStyle
            ? _value.fieldLabelStyle
            : fieldLabelStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        fieldTextStyle: freezed == fieldTextStyle
            ? _value.fieldTextStyle
            : fieldTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        placeholderStyle: freezed == placeholderStyle
            ? _value.placeholderStyle
            : placeholderStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        helperTextStyle: freezed == helperTextStyle
            ? _value.helperTextStyle
            : helperTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        errorTextStyle: freezed == errorTextStyle
            ? _value.errorTextStyle
            : errorTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        buttonTextStyle: freezed == buttonTextStyle
            ? _value.buttonTextStyle
            : buttonTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        descriptionStyle: freezed == descriptionStyle
            ? _value.descriptionStyle
            : descriptionStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileTypographyImpl implements _DSProfileTypography {
  const _$DSProfileTypographyImpl({
    this.sectionHeaderStyle,
    this.fieldLabelStyle,
    this.fieldTextStyle,
    this.placeholderStyle,
    this.helperTextStyle,
    this.errorTextStyle,
    this.buttonTextStyle,
    this.descriptionStyle,
  });

  /// Estilo para títulos de sección
  @override
  final TextStyle? sectionHeaderStyle;

  /// Estilo para labels de campos
  @override
  final TextStyle? fieldLabelStyle;

  /// Estilo para texto de campos
  @override
  final TextStyle? fieldTextStyle;

  /// Estilo para placeholder
  @override
  final TextStyle? placeholderStyle;

  /// Estilo para texto de ayuda
  @override
  final TextStyle? helperTextStyle;

  /// Estilo para texto de error
  @override
  final TextStyle? errorTextStyle;

  /// Estilo para texto de botones
  @override
  final TextStyle? buttonTextStyle;

  /// Estilo para texto de descripción
  @override
  final TextStyle? descriptionStyle;

  @override
  String toString() {
    return 'DSProfileTypography(sectionHeaderStyle: $sectionHeaderStyle, fieldLabelStyle: $fieldLabelStyle, fieldTextStyle: $fieldTextStyle, placeholderStyle: $placeholderStyle, helperTextStyle: $helperTextStyle, errorTextStyle: $errorTextStyle, buttonTextStyle: $buttonTextStyle, descriptionStyle: $descriptionStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileTypographyImpl &&
            (identical(other.sectionHeaderStyle, sectionHeaderStyle) ||
                other.sectionHeaderStyle == sectionHeaderStyle) &&
            (identical(other.fieldLabelStyle, fieldLabelStyle) ||
                other.fieldLabelStyle == fieldLabelStyle) &&
            (identical(other.fieldTextStyle, fieldTextStyle) ||
                other.fieldTextStyle == fieldTextStyle) &&
            (identical(other.placeholderStyle, placeholderStyle) ||
                other.placeholderStyle == placeholderStyle) &&
            (identical(other.helperTextStyle, helperTextStyle) ||
                other.helperTextStyle == helperTextStyle) &&
            (identical(other.errorTextStyle, errorTextStyle) ||
                other.errorTextStyle == errorTextStyle) &&
            (identical(other.buttonTextStyle, buttonTextStyle) ||
                other.buttonTextStyle == buttonTextStyle) &&
            (identical(other.descriptionStyle, descriptionStyle) ||
                other.descriptionStyle == descriptionStyle));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sectionHeaderStyle,
    fieldLabelStyle,
    fieldTextStyle,
    placeholderStyle,
    helperTextStyle,
    errorTextStyle,
    buttonTextStyle,
    descriptionStyle,
  );

  /// Create a copy of DSProfileTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileTypographyImplCopyWith<_$DSProfileTypographyImpl> get copyWith =>
      __$$DSProfileTypographyImplCopyWithImpl<_$DSProfileTypographyImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileTypography implements DSProfileTypography {
  const factory _DSProfileTypography({
    final TextStyle? sectionHeaderStyle,
    final TextStyle? fieldLabelStyle,
    final TextStyle? fieldTextStyle,
    final TextStyle? placeholderStyle,
    final TextStyle? helperTextStyle,
    final TextStyle? errorTextStyle,
    final TextStyle? buttonTextStyle,
    final TextStyle? descriptionStyle,
  }) = _$DSProfileTypographyImpl;

  /// Estilo para títulos de sección
  @override
  TextStyle? get sectionHeaderStyle;

  /// Estilo para labels de campos
  @override
  TextStyle? get fieldLabelStyle;

  /// Estilo para texto de campos
  @override
  TextStyle? get fieldTextStyle;

  /// Estilo para placeholder
  @override
  TextStyle? get placeholderStyle;

  /// Estilo para texto de ayuda
  @override
  TextStyle? get helperTextStyle;

  /// Estilo para texto de error
  @override
  TextStyle? get errorTextStyle;

  /// Estilo para texto de botones
  @override
  TextStyle? get buttonTextStyle;

  /// Estilo para texto de descripción
  @override
  TextStyle? get descriptionStyle;

  /// Create a copy of DSProfileTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileTypographyImplCopyWith<_$DSProfileTypographyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileAnimation {
  /// Duración de animaciones principales
  Duration get duration => throw _privateConstructorUsedError;

  /// Duración de animaciones de skeleton
  Duration get skeletonDuration => throw _privateConstructorUsedError;

  /// Curva de animación principal
  Curve get curve => throw _privateConstructorUsedError;

  /// Curva de animación de skeleton
  Curve get skeletonCurve => throw _privateConstructorUsedError;

  /// Si las animaciones están habilitadas
  bool get enabled => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileAnimationCopyWith<DSProfileAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileAnimationCopyWith<$Res> {
  factory $DSProfileAnimationCopyWith(
    DSProfileAnimation value,
    $Res Function(DSProfileAnimation) then,
  ) = _$DSProfileAnimationCopyWithImpl<$Res, DSProfileAnimation>;
  @useResult
  $Res call({
    Duration duration,
    Duration skeletonDuration,
    Curve curve,
    Curve skeletonCurve,
    bool enabled,
  });
}

/// @nodoc
class _$DSProfileAnimationCopyWithImpl<$Res, $Val extends DSProfileAnimation>
    implements $DSProfileAnimationCopyWith<$Res> {
  _$DSProfileAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? skeletonDuration = null,
    Object? curve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
  }) {
    return _then(
      _value.copyWith(
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            skeletonDuration: null == skeletonDuration
                ? _value.skeletonDuration
                : skeletonDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            curve: null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            skeletonCurve: null == skeletonCurve
                ? _value.skeletonCurve
                : skeletonCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileAnimationImplCopyWith<$Res>
    implements $DSProfileAnimationCopyWith<$Res> {
  factory _$$DSProfileAnimationImplCopyWith(
    _$DSProfileAnimationImpl value,
    $Res Function(_$DSProfileAnimationImpl) then,
  ) = __$$DSProfileAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Duration duration,
    Duration skeletonDuration,
    Curve curve,
    Curve skeletonCurve,
    bool enabled,
  });
}

/// @nodoc
class __$$DSProfileAnimationImplCopyWithImpl<$Res>
    extends _$DSProfileAnimationCopyWithImpl<$Res, _$DSProfileAnimationImpl>
    implements _$$DSProfileAnimationImplCopyWith<$Res> {
  __$$DSProfileAnimationImplCopyWithImpl(
    _$DSProfileAnimationImpl _value,
    $Res Function(_$DSProfileAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? skeletonDuration = null,
    Object? curve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
  }) {
    return _then(
      _$DSProfileAnimationImpl(
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        skeletonDuration: null == skeletonDuration
            ? _value.skeletonDuration
            : skeletonDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        curve: null == curve
            ? _value.curve
            : curve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        skeletonCurve: null == skeletonCurve
            ? _value.skeletonCurve
            : skeletonCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileAnimationImpl implements _DSProfileAnimation {
  const _$DSProfileAnimationImpl({
    this.duration = const Duration(milliseconds: 200),
    this.skeletonDuration = const Duration(milliseconds: 1200),
    this.curve = Curves.easeInOut,
    this.skeletonCurve = Curves.easeInOut,
    this.enabled = true,
  });

  /// Duración de animaciones principales
  @override
  @JsonKey()
  final Duration duration;

  /// Duración de animaciones de skeleton
  @override
  @JsonKey()
  final Duration skeletonDuration;

  /// Curva de animación principal
  @override
  @JsonKey()
  final Curve curve;

  /// Curva de animación de skeleton
  @override
  @JsonKey()
  final Curve skeletonCurve;

  /// Si las animaciones están habilitadas
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'DSProfileAnimation(duration: $duration, skeletonDuration: $skeletonDuration, curve: $curve, skeletonCurve: $skeletonCurve, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileAnimationImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.skeletonDuration, skeletonDuration) ||
                other.skeletonDuration == skeletonDuration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.skeletonCurve, skeletonCurve) ||
                other.skeletonCurve == skeletonCurve) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    skeletonDuration,
    curve,
    skeletonCurve,
    enabled,
  );

  /// Create a copy of DSProfileAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileAnimationImplCopyWith<_$DSProfileAnimationImpl> get copyWith =>
      __$$DSProfileAnimationImplCopyWithImpl<_$DSProfileAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileAnimation implements DSProfileAnimation {
  const factory _DSProfileAnimation({
    final Duration duration,
    final Duration skeletonDuration,
    final Curve curve,
    final Curve skeletonCurve,
    final bool enabled,
  }) = _$DSProfileAnimationImpl;

  /// Duración de animaciones principales
  @override
  Duration get duration;

  /// Duración de animaciones de skeleton
  @override
  Duration get skeletonDuration;

  /// Curva de animación principal
  @override
  Curve get curve;

  /// Curva de animación de skeleton
  @override
  Curve get skeletonCurve;

  /// Si las animaciones están habilitadas
  @override
  bool get enabled;

  /// Create a copy of DSProfileAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileAnimationImplCopyWith<_$DSProfileAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileBehavior {
  /// Auto-guardar cambios
  bool get autoSave => throw _privateConstructorUsedError;

  /// Retraso para auto-guardar (ms)
  int get autoSaveDelay => throw _privateConstructorUsedError;

  /// Confirmar antes de salir con cambios
  bool get confirmUnsavedChanges => throw _privateConstructorUsedError;

  /// Validar en tiempo real
  bool get realtimeValidation => throw _privateConstructorUsedError;

  /// Colapsar secciones por defecto
  bool get collapseSections => throw _privateConstructorUsedError;

  /// Permitir reordenar secciones
  bool get allowReorder => throw _privateConstructorUsedError;

  /// Comportamiento de scroll
  DSProfileScrollBehavior get scrollBehavior =>
      throw _privateConstructorUsedError;

  /// Comportamiento de teclado
  DSProfileKeyboardBehavior get keyboardBehavior =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSProfileBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileBehaviorCopyWith<DSProfileBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileBehaviorCopyWith<$Res> {
  factory $DSProfileBehaviorCopyWith(
    DSProfileBehavior value,
    $Res Function(DSProfileBehavior) then,
  ) = _$DSProfileBehaviorCopyWithImpl<$Res, DSProfileBehavior>;
  @useResult
  $Res call({
    bool autoSave,
    int autoSaveDelay,
    bool confirmUnsavedChanges,
    bool realtimeValidation,
    bool collapseSections,
    bool allowReorder,
    DSProfileScrollBehavior scrollBehavior,
    DSProfileKeyboardBehavior keyboardBehavior,
  });
}

/// @nodoc
class _$DSProfileBehaviorCopyWithImpl<$Res, $Val extends DSProfileBehavior>
    implements $DSProfileBehaviorCopyWith<$Res> {
  _$DSProfileBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoSave = null,
    Object? autoSaveDelay = null,
    Object? confirmUnsavedChanges = null,
    Object? realtimeValidation = null,
    Object? collapseSections = null,
    Object? allowReorder = null,
    Object? scrollBehavior = null,
    Object? keyboardBehavior = null,
  }) {
    return _then(
      _value.copyWith(
            autoSave: null == autoSave
                ? _value.autoSave
                : autoSave // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoSaveDelay: null == autoSaveDelay
                ? _value.autoSaveDelay
                : autoSaveDelay // ignore: cast_nullable_to_non_nullable
                      as int,
            confirmUnsavedChanges: null == confirmUnsavedChanges
                ? _value.confirmUnsavedChanges
                : confirmUnsavedChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            realtimeValidation: null == realtimeValidation
                ? _value.realtimeValidation
                : realtimeValidation // ignore: cast_nullable_to_non_nullable
                      as bool,
            collapseSections: null == collapseSections
                ? _value.collapseSections
                : collapseSections // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowReorder: null == allowReorder
                ? _value.allowReorder
                : allowReorder // ignore: cast_nullable_to_non_nullable
                      as bool,
            scrollBehavior: null == scrollBehavior
                ? _value.scrollBehavior
                : scrollBehavior // ignore: cast_nullable_to_non_nullable
                      as DSProfileScrollBehavior,
            keyboardBehavior: null == keyboardBehavior
                ? _value.keyboardBehavior
                : keyboardBehavior // ignore: cast_nullable_to_non_nullable
                      as DSProfileKeyboardBehavior,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileBehaviorImplCopyWith<$Res>
    implements $DSProfileBehaviorCopyWith<$Res> {
  factory _$$DSProfileBehaviorImplCopyWith(
    _$DSProfileBehaviorImpl value,
    $Res Function(_$DSProfileBehaviorImpl) then,
  ) = __$$DSProfileBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool autoSave,
    int autoSaveDelay,
    bool confirmUnsavedChanges,
    bool realtimeValidation,
    bool collapseSections,
    bool allowReorder,
    DSProfileScrollBehavior scrollBehavior,
    DSProfileKeyboardBehavior keyboardBehavior,
  });
}

/// @nodoc
class __$$DSProfileBehaviorImplCopyWithImpl<$Res>
    extends _$DSProfileBehaviorCopyWithImpl<$Res, _$DSProfileBehaviorImpl>
    implements _$$DSProfileBehaviorImplCopyWith<$Res> {
  __$$DSProfileBehaviorImplCopyWithImpl(
    _$DSProfileBehaviorImpl _value,
    $Res Function(_$DSProfileBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoSave = null,
    Object? autoSaveDelay = null,
    Object? confirmUnsavedChanges = null,
    Object? realtimeValidation = null,
    Object? collapseSections = null,
    Object? allowReorder = null,
    Object? scrollBehavior = null,
    Object? keyboardBehavior = null,
  }) {
    return _then(
      _$DSProfileBehaviorImpl(
        autoSave: null == autoSave
            ? _value.autoSave
            : autoSave // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoSaveDelay: null == autoSaveDelay
            ? _value.autoSaveDelay
            : autoSaveDelay // ignore: cast_nullable_to_non_nullable
                  as int,
        confirmUnsavedChanges: null == confirmUnsavedChanges
            ? _value.confirmUnsavedChanges
            : confirmUnsavedChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        realtimeValidation: null == realtimeValidation
            ? _value.realtimeValidation
            : realtimeValidation // ignore: cast_nullable_to_non_nullable
                  as bool,
        collapseSections: null == collapseSections
            ? _value.collapseSections
            : collapseSections // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowReorder: null == allowReorder
            ? _value.allowReorder
            : allowReorder // ignore: cast_nullable_to_non_nullable
                  as bool,
        scrollBehavior: null == scrollBehavior
            ? _value.scrollBehavior
            : scrollBehavior // ignore: cast_nullable_to_non_nullable
                  as DSProfileScrollBehavior,
        keyboardBehavior: null == keyboardBehavior
            ? _value.keyboardBehavior
            : keyboardBehavior // ignore: cast_nullable_to_non_nullable
                  as DSProfileKeyboardBehavior,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileBehaviorImpl implements _DSProfileBehavior {
  const _$DSProfileBehaviorImpl({
    this.autoSave = false,
    this.autoSaveDelay = 1000,
    this.confirmUnsavedChanges = true,
    this.realtimeValidation = true,
    this.collapseSections = false,
    this.allowReorder = false,
    this.scrollBehavior = DSProfileScrollBehavior.adaptive,
    this.keyboardBehavior = DSProfileKeyboardBehavior.adaptive,
  });

  /// Auto-guardar cambios
  @override
  @JsonKey()
  final bool autoSave;

  /// Retraso para auto-guardar (ms)
  @override
  @JsonKey()
  final int autoSaveDelay;

  /// Confirmar antes de salir con cambios
  @override
  @JsonKey()
  final bool confirmUnsavedChanges;

  /// Validar en tiempo real
  @override
  @JsonKey()
  final bool realtimeValidation;

  /// Colapsar secciones por defecto
  @override
  @JsonKey()
  final bool collapseSections;

  /// Permitir reordenar secciones
  @override
  @JsonKey()
  final bool allowReorder;

  /// Comportamiento de scroll
  @override
  @JsonKey()
  final DSProfileScrollBehavior scrollBehavior;

  /// Comportamiento de teclado
  @override
  @JsonKey()
  final DSProfileKeyboardBehavior keyboardBehavior;

  @override
  String toString() {
    return 'DSProfileBehavior(autoSave: $autoSave, autoSaveDelay: $autoSaveDelay, confirmUnsavedChanges: $confirmUnsavedChanges, realtimeValidation: $realtimeValidation, collapseSections: $collapseSections, allowReorder: $allowReorder, scrollBehavior: $scrollBehavior, keyboardBehavior: $keyboardBehavior)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileBehaviorImpl &&
            (identical(other.autoSave, autoSave) ||
                other.autoSave == autoSave) &&
            (identical(other.autoSaveDelay, autoSaveDelay) ||
                other.autoSaveDelay == autoSaveDelay) &&
            (identical(other.confirmUnsavedChanges, confirmUnsavedChanges) ||
                other.confirmUnsavedChanges == confirmUnsavedChanges) &&
            (identical(other.realtimeValidation, realtimeValidation) ||
                other.realtimeValidation == realtimeValidation) &&
            (identical(other.collapseSections, collapseSections) ||
                other.collapseSections == collapseSections) &&
            (identical(other.allowReorder, allowReorder) ||
                other.allowReorder == allowReorder) &&
            (identical(other.scrollBehavior, scrollBehavior) ||
                other.scrollBehavior == scrollBehavior) &&
            (identical(other.keyboardBehavior, keyboardBehavior) ||
                other.keyboardBehavior == keyboardBehavior));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    autoSave,
    autoSaveDelay,
    confirmUnsavedChanges,
    realtimeValidation,
    collapseSections,
    allowReorder,
    scrollBehavior,
    keyboardBehavior,
  );

  /// Create a copy of DSProfileBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileBehaviorImplCopyWith<_$DSProfileBehaviorImpl> get copyWith =>
      __$$DSProfileBehaviorImplCopyWithImpl<_$DSProfileBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileBehavior implements DSProfileBehavior {
  const factory _DSProfileBehavior({
    final bool autoSave,
    final int autoSaveDelay,
    final bool confirmUnsavedChanges,
    final bool realtimeValidation,
    final bool collapseSections,
    final bool allowReorder,
    final DSProfileScrollBehavior scrollBehavior,
    final DSProfileKeyboardBehavior keyboardBehavior,
  }) = _$DSProfileBehaviorImpl;

  /// Auto-guardar cambios
  @override
  bool get autoSave;

  /// Retraso para auto-guardar (ms)
  @override
  int get autoSaveDelay;

  /// Confirmar antes de salir con cambios
  @override
  bool get confirmUnsavedChanges;

  /// Validar en tiempo real
  @override
  bool get realtimeValidation;

  /// Colapsar secciones por defecto
  @override
  bool get collapseSections;

  /// Permitir reordenar secciones
  @override
  bool get allowReorder;

  /// Comportamiento de scroll
  @override
  DSProfileScrollBehavior get scrollBehavior;

  /// Comportamiento de teclado
  @override
  DSProfileKeyboardBehavior get keyboardBehavior;

  /// Create a copy of DSProfileBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileBehaviorImplCopyWith<_$DSProfileBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileA11yConfig {
  /// Si la accesibilidad está habilitada
  bool get enabled => throw _privateConstructorUsedError;

  /// Soporte para screen readers
  bool get supportScreenReader => throw _privateConstructorUsedError;

  /// Navegación por teclado habilitada
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Labels semánticos habilitados
  bool get enableSemanticLabels => throw _privateConstructorUsedError;

  /// Hints habilitados
  bool get enableHints => throw _privateConstructorUsedError;

  /// Live regions habilitadas
  bool get enableLiveRegions => throw _privateConstructorUsedError;

  /// Anunciar errores
  bool get announceErrors => throw _privateConstructorUsedError;

  /// Anunciar cambios exitosos
  bool get announceSuccess => throw _privateConstructorUsedError;

  /// Anunciar cambios de estado
  bool get announceStateChanges => throw _privateConstructorUsedError;

  /// Label semántico para campos requeridos
  String get requiredFieldSemanticLabel => throw _privateConstructorUsedError;

  /// Label semántico para sección principal
  String get mainSectionSemanticLabel => throw _privateConstructorUsedError;

  /// Label semántico para botón guardar
  String get saveButtonSemanticLabel => throw _privateConstructorUsedError;

  /// Label semántico para botón cancelar
  String get cancelButtonSemanticLabel => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileA11yConfigCopyWith<DSProfileA11yConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileA11yConfigCopyWith<$Res> {
  factory $DSProfileA11yConfigCopyWith(
    DSProfileA11yConfig value,
    $Res Function(DSProfileA11yConfig) then,
  ) = _$DSProfileA11yConfigCopyWithImpl<$Res, DSProfileA11yConfig>;
  @useResult
  $Res call({
    bool enabled,
    bool supportScreenReader,
    bool enableKeyboardNavigation,
    bool enableSemanticLabels,
    bool enableHints,
    bool enableLiveRegions,
    bool announceErrors,
    bool announceSuccess,
    bool announceStateChanges,
    String requiredFieldSemanticLabel,
    String mainSectionSemanticLabel,
    String saveButtonSemanticLabel,
    String cancelButtonSemanticLabel,
  });
}

/// @nodoc
class _$DSProfileA11yConfigCopyWithImpl<$Res, $Val extends DSProfileA11yConfig>
    implements $DSProfileA11yConfigCopyWith<$Res> {
  _$DSProfileA11yConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? supportScreenReader = null,
    Object? enableKeyboardNavigation = null,
    Object? enableSemanticLabels = null,
    Object? enableHints = null,
    Object? enableLiveRegions = null,
    Object? announceErrors = null,
    Object? announceSuccess = null,
    Object? announceStateChanges = null,
    Object? requiredFieldSemanticLabel = null,
    Object? mainSectionSemanticLabel = null,
    Object? saveButtonSemanticLabel = null,
    Object? cancelButtonSemanticLabel = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            supportScreenReader: null == supportScreenReader
                ? _value.supportScreenReader
                : supportScreenReader // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableSemanticLabels: null == enableSemanticLabels
                ? _value.enableSemanticLabels
                : enableSemanticLabels // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHints: null == enableHints
                ? _value.enableHints
                : enableHints // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableLiveRegions: null == enableLiveRegions
                ? _value.enableLiveRegions
                : enableLiveRegions // ignore: cast_nullable_to_non_nullable
                      as bool,
            announceErrors: null == announceErrors
                ? _value.announceErrors
                : announceErrors // ignore: cast_nullable_to_non_nullable
                      as bool,
            announceSuccess: null == announceSuccess
                ? _value.announceSuccess
                : announceSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            announceStateChanges: null == announceStateChanges
                ? _value.announceStateChanges
                : announceStateChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            requiredFieldSemanticLabel: null == requiredFieldSemanticLabel
                ? _value.requiredFieldSemanticLabel
                : requiredFieldSemanticLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            mainSectionSemanticLabel: null == mainSectionSemanticLabel
                ? _value.mainSectionSemanticLabel
                : mainSectionSemanticLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            saveButtonSemanticLabel: null == saveButtonSemanticLabel
                ? _value.saveButtonSemanticLabel
                : saveButtonSemanticLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            cancelButtonSemanticLabel: null == cancelButtonSemanticLabel
                ? _value.cancelButtonSemanticLabel
                : cancelButtonSemanticLabel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileA11yConfigImplCopyWith<$Res>
    implements $DSProfileA11yConfigCopyWith<$Res> {
  factory _$$DSProfileA11yConfigImplCopyWith(
    _$DSProfileA11yConfigImpl value,
    $Res Function(_$DSProfileA11yConfigImpl) then,
  ) = __$$DSProfileA11yConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    bool supportScreenReader,
    bool enableKeyboardNavigation,
    bool enableSemanticLabels,
    bool enableHints,
    bool enableLiveRegions,
    bool announceErrors,
    bool announceSuccess,
    bool announceStateChanges,
    String requiredFieldSemanticLabel,
    String mainSectionSemanticLabel,
    String saveButtonSemanticLabel,
    String cancelButtonSemanticLabel,
  });
}

/// @nodoc
class __$$DSProfileA11yConfigImplCopyWithImpl<$Res>
    extends _$DSProfileA11yConfigCopyWithImpl<$Res, _$DSProfileA11yConfigImpl>
    implements _$$DSProfileA11yConfigImplCopyWith<$Res> {
  __$$DSProfileA11yConfigImplCopyWithImpl(
    _$DSProfileA11yConfigImpl _value,
    $Res Function(_$DSProfileA11yConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? supportScreenReader = null,
    Object? enableKeyboardNavigation = null,
    Object? enableSemanticLabels = null,
    Object? enableHints = null,
    Object? enableLiveRegions = null,
    Object? announceErrors = null,
    Object? announceSuccess = null,
    Object? announceStateChanges = null,
    Object? requiredFieldSemanticLabel = null,
    Object? mainSectionSemanticLabel = null,
    Object? saveButtonSemanticLabel = null,
    Object? cancelButtonSemanticLabel = null,
  }) {
    return _then(
      _$DSProfileA11yConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        supportScreenReader: null == supportScreenReader
            ? _value.supportScreenReader
            : supportScreenReader // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableSemanticLabels: null == enableSemanticLabels
            ? _value.enableSemanticLabels
            : enableSemanticLabels // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHints: null == enableHints
            ? _value.enableHints
            : enableHints // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableLiveRegions: null == enableLiveRegions
            ? _value.enableLiveRegions
            : enableLiveRegions // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceErrors: null == announceErrors
            ? _value.announceErrors
            : announceErrors // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceSuccess: null == announceSuccess
            ? _value.announceSuccess
            : announceSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceStateChanges: null == announceStateChanges
            ? _value.announceStateChanges
            : announceStateChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        requiredFieldSemanticLabel: null == requiredFieldSemanticLabel
            ? _value.requiredFieldSemanticLabel
            : requiredFieldSemanticLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        mainSectionSemanticLabel: null == mainSectionSemanticLabel
            ? _value.mainSectionSemanticLabel
            : mainSectionSemanticLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        saveButtonSemanticLabel: null == saveButtonSemanticLabel
            ? _value.saveButtonSemanticLabel
            : saveButtonSemanticLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        cancelButtonSemanticLabel: null == cancelButtonSemanticLabel
            ? _value.cancelButtonSemanticLabel
            : cancelButtonSemanticLabel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileA11yConfigImpl implements _DSProfileA11yConfig {
  const _$DSProfileA11yConfigImpl({
    this.enabled = true,
    this.supportScreenReader = true,
    this.enableKeyboardNavigation = true,
    this.enableSemanticLabels = true,
    this.enableHints = true,
    this.enableLiveRegions = true,
    this.announceErrors = true,
    this.announceSuccess = true,
    this.announceStateChanges = false,
    this.requiredFieldSemanticLabel = 'requerido',
    this.mainSectionSemanticLabel = 'Preferencias de perfil',
    this.saveButtonSemanticLabel = 'Guardar cambios',
    this.cancelButtonSemanticLabel = 'Cancelar cambios',
  });

  /// Si la accesibilidad está habilitada
  @override
  @JsonKey()
  final bool enabled;

  /// Soporte para screen readers
  @override
  @JsonKey()
  final bool supportScreenReader;

  /// Navegación por teclado habilitada
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;

  /// Labels semánticos habilitados
  @override
  @JsonKey()
  final bool enableSemanticLabels;

  /// Hints habilitados
  @override
  @JsonKey()
  final bool enableHints;

  /// Live regions habilitadas
  @override
  @JsonKey()
  final bool enableLiveRegions;

  /// Anunciar errores
  @override
  @JsonKey()
  final bool announceErrors;

  /// Anunciar cambios exitosos
  @override
  @JsonKey()
  final bool announceSuccess;

  /// Anunciar cambios de estado
  @override
  @JsonKey()
  final bool announceStateChanges;

  /// Label semántico para campos requeridos
  @override
  @JsonKey()
  final String requiredFieldSemanticLabel;

  /// Label semántico para sección principal
  @override
  @JsonKey()
  final String mainSectionSemanticLabel;

  /// Label semántico para botón guardar
  @override
  @JsonKey()
  final String saveButtonSemanticLabel;

  /// Label semántico para botón cancelar
  @override
  @JsonKey()
  final String cancelButtonSemanticLabel;

  @override
  String toString() {
    return 'DSProfileA11yConfig(enabled: $enabled, supportScreenReader: $supportScreenReader, enableKeyboardNavigation: $enableKeyboardNavigation, enableSemanticLabels: $enableSemanticLabels, enableHints: $enableHints, enableLiveRegions: $enableLiveRegions, announceErrors: $announceErrors, announceSuccess: $announceSuccess, announceStateChanges: $announceStateChanges, requiredFieldSemanticLabel: $requiredFieldSemanticLabel, mainSectionSemanticLabel: $mainSectionSemanticLabel, saveButtonSemanticLabel: $saveButtonSemanticLabel, cancelButtonSemanticLabel: $cancelButtonSemanticLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileA11yConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.supportScreenReader, supportScreenReader) ||
                other.supportScreenReader == supportScreenReader) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation) &&
            (identical(other.enableSemanticLabels, enableSemanticLabels) ||
                other.enableSemanticLabels == enableSemanticLabels) &&
            (identical(other.enableHints, enableHints) ||
                other.enableHints == enableHints) &&
            (identical(other.enableLiveRegions, enableLiveRegions) ||
                other.enableLiveRegions == enableLiveRegions) &&
            (identical(other.announceErrors, announceErrors) ||
                other.announceErrors == announceErrors) &&
            (identical(other.announceSuccess, announceSuccess) ||
                other.announceSuccess == announceSuccess) &&
            (identical(other.announceStateChanges, announceStateChanges) ||
                other.announceStateChanges == announceStateChanges) &&
            (identical(
                  other.requiredFieldSemanticLabel,
                  requiredFieldSemanticLabel,
                ) ||
                other.requiredFieldSemanticLabel ==
                    requiredFieldSemanticLabel) &&
            (identical(
                  other.mainSectionSemanticLabel,
                  mainSectionSemanticLabel,
                ) ||
                other.mainSectionSemanticLabel == mainSectionSemanticLabel) &&
            (identical(
                  other.saveButtonSemanticLabel,
                  saveButtonSemanticLabel,
                ) ||
                other.saveButtonSemanticLabel == saveButtonSemanticLabel) &&
            (identical(
                  other.cancelButtonSemanticLabel,
                  cancelButtonSemanticLabel,
                ) ||
                other.cancelButtonSemanticLabel == cancelButtonSemanticLabel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    supportScreenReader,
    enableKeyboardNavigation,
    enableSemanticLabels,
    enableHints,
    enableLiveRegions,
    announceErrors,
    announceSuccess,
    announceStateChanges,
    requiredFieldSemanticLabel,
    mainSectionSemanticLabel,
    saveButtonSemanticLabel,
    cancelButtonSemanticLabel,
  );

  /// Create a copy of DSProfileA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileA11yConfigImplCopyWith<_$DSProfileA11yConfigImpl> get copyWith =>
      __$$DSProfileA11yConfigImplCopyWithImpl<_$DSProfileA11yConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileA11yConfig implements DSProfileA11yConfig {
  const factory _DSProfileA11yConfig({
    final bool enabled,
    final bool supportScreenReader,
    final bool enableKeyboardNavigation,
    final bool enableSemanticLabels,
    final bool enableHints,
    final bool enableLiveRegions,
    final bool announceErrors,
    final bool announceSuccess,
    final bool announceStateChanges,
    final String requiredFieldSemanticLabel,
    final String mainSectionSemanticLabel,
    final String saveButtonSemanticLabel,
    final String cancelButtonSemanticLabel,
  }) = _$DSProfileA11yConfigImpl;

  /// Si la accesibilidad está habilitada
  @override
  bool get enabled;

  /// Soporte para screen readers
  @override
  bool get supportScreenReader;

  /// Navegación por teclado habilitada
  @override
  bool get enableKeyboardNavigation;

  /// Labels semánticos habilitados
  @override
  bool get enableSemanticLabels;

  /// Hints habilitados
  @override
  bool get enableHints;

  /// Live regions habilitadas
  @override
  bool get enableLiveRegions;

  /// Anunciar errores
  @override
  bool get announceErrors;

  /// Anunciar cambios exitosos
  @override
  bool get announceSuccess;

  /// Anunciar cambios de estado
  @override
  bool get announceStateChanges;

  /// Label semántico para campos requeridos
  @override
  String get requiredFieldSemanticLabel;

  /// Label semántico para sección principal
  @override
  String get mainSectionSemanticLabel;

  /// Label semántico para botón guardar
  @override
  String get saveButtonSemanticLabel;

  /// Label semántico para botón cancelar
  @override
  String get cancelButtonSemanticLabel;

  /// Create a copy of DSProfileA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileA11yConfigImplCopyWith<_$DSProfileA11yConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileFormData {
  /// Valores de los campos
  Map<String, dynamic> get values => throw _privateConstructorUsedError;

  /// Validaciones de los campos
  Map<String, DSProfileFieldValidation> get validations =>
      throw _privateConstructorUsedError;

  /// Errores de validación
  Map<String, String> get errors => throw _privateConstructorUsedError;

  /// Si el formulario es válido
  bool get isValid => throw _privateConstructorUsedError;

  /// Si hay cambios sin guardar
  bool get hasUnsavedChanges => throw _privateConstructorUsedError;

  /// Timestamp del último cambio
  DateTime? get lastModified => throw _privateConstructorUsedError;

  /// Contador de intentos de guardado
  int get saveAttempts => throw _privateConstructorUsedError;

  /// Último intento de guardado
  DateTime? get lastSaveAttempt => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileFormData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileFormDataCopyWith<DSProfileFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileFormDataCopyWith<$Res> {
  factory $DSProfileFormDataCopyWith(
    DSProfileFormData value,
    $Res Function(DSProfileFormData) then,
  ) = _$DSProfileFormDataCopyWithImpl<$Res, DSProfileFormData>;
  @useResult
  $Res call({
    Map<String, dynamic> values,
    Map<String, DSProfileFieldValidation> validations,
    Map<String, String> errors,
    bool isValid,
    bool hasUnsavedChanges,
    DateTime? lastModified,
    int saveAttempts,
    DateTime? lastSaveAttempt,
  });
}

/// @nodoc
class _$DSProfileFormDataCopyWithImpl<$Res, $Val extends DSProfileFormData>
    implements $DSProfileFormDataCopyWith<$Res> {
  _$DSProfileFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileFormData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? validations = null,
    Object? errors = null,
    Object? isValid = null,
    Object? hasUnsavedChanges = null,
    Object? lastModified = freezed,
    Object? saveAttempts = null,
    Object? lastSaveAttempt = freezed,
  }) {
    return _then(
      _value.copyWith(
            values: null == values
                ? _value.values
                : values // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            validations: null == validations
                ? _value.validations
                : validations // ignore: cast_nullable_to_non_nullable
                      as Map<String, DSProfileFieldValidation>,
            errors: null == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasUnsavedChanges: null == hasUnsavedChanges
                ? _value.hasUnsavedChanges
                : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastModified: freezed == lastModified
                ? _value.lastModified
                : lastModified // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            saveAttempts: null == saveAttempts
                ? _value.saveAttempts
                : saveAttempts // ignore: cast_nullable_to_non_nullable
                      as int,
            lastSaveAttempt: freezed == lastSaveAttempt
                ? _value.lastSaveAttempt
                : lastSaveAttempt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileFormDataImplCopyWith<$Res>
    implements $DSProfileFormDataCopyWith<$Res> {
  factory _$$DSProfileFormDataImplCopyWith(
    _$DSProfileFormDataImpl value,
    $Res Function(_$DSProfileFormDataImpl) then,
  ) = __$$DSProfileFormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, dynamic> values,
    Map<String, DSProfileFieldValidation> validations,
    Map<String, String> errors,
    bool isValid,
    bool hasUnsavedChanges,
    DateTime? lastModified,
    int saveAttempts,
    DateTime? lastSaveAttempt,
  });
}

/// @nodoc
class __$$DSProfileFormDataImplCopyWithImpl<$Res>
    extends _$DSProfileFormDataCopyWithImpl<$Res, _$DSProfileFormDataImpl>
    implements _$$DSProfileFormDataImplCopyWith<$Res> {
  __$$DSProfileFormDataImplCopyWithImpl(
    _$DSProfileFormDataImpl _value,
    $Res Function(_$DSProfileFormDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileFormData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? validations = null,
    Object? errors = null,
    Object? isValid = null,
    Object? hasUnsavedChanges = null,
    Object? lastModified = freezed,
    Object? saveAttempts = null,
    Object? lastSaveAttempt = freezed,
  }) {
    return _then(
      _$DSProfileFormDataImpl(
        values: null == values
            ? _value._values
            : values // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        validations: null == validations
            ? _value._validations
            : validations // ignore: cast_nullable_to_non_nullable
                  as Map<String, DSProfileFieldValidation>,
        errors: null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasUnsavedChanges: null == hasUnsavedChanges
            ? _value.hasUnsavedChanges
            : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastModified: freezed == lastModified
            ? _value.lastModified
            : lastModified // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        saveAttempts: null == saveAttempts
            ? _value.saveAttempts
            : saveAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
        lastSaveAttempt: freezed == lastSaveAttempt
            ? _value.lastSaveAttempt
            : lastSaveAttempt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileFormDataImpl implements _DSProfileFormData {
  const _$DSProfileFormDataImpl({
    final Map<String, dynamic> values = const {},
    final Map<String, DSProfileFieldValidation> validations = const {},
    final Map<String, String> errors = const {},
    this.isValid = true,
    this.hasUnsavedChanges = false,
    this.lastModified,
    this.saveAttempts = 0,
    this.lastSaveAttempt,
  }) : _values = values,
       _validations = validations,
       _errors = errors;

  /// Valores de los campos
  final Map<String, dynamic> _values;

  /// Valores de los campos
  @override
  @JsonKey()
  Map<String, dynamic> get values {
    if (_values is EqualUnmodifiableMapView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_values);
  }

  /// Validaciones de los campos
  final Map<String, DSProfileFieldValidation> _validations;

  /// Validaciones de los campos
  @override
  @JsonKey()
  Map<String, DSProfileFieldValidation> get validations {
    if (_validations is EqualUnmodifiableMapView) return _validations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_validations);
  }

  /// Errores de validación
  final Map<String, String> _errors;

  /// Errores de validación
  @override
  @JsonKey()
  Map<String, String> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  /// Si el formulario es válido
  @override
  @JsonKey()
  final bool isValid;

  /// Si hay cambios sin guardar
  @override
  @JsonKey()
  final bool hasUnsavedChanges;

  /// Timestamp del último cambio
  @override
  final DateTime? lastModified;

  /// Contador de intentos de guardado
  @override
  @JsonKey()
  final int saveAttempts;

  /// Último intento de guardado
  @override
  final DateTime? lastSaveAttempt;

  @override
  String toString() {
    return 'DSProfileFormData(values: $values, validations: $validations, errors: $errors, isValid: $isValid, hasUnsavedChanges: $hasUnsavedChanges, lastModified: $lastModified, saveAttempts: $saveAttempts, lastSaveAttempt: $lastSaveAttempt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileFormDataImpl &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality().equals(
              other._validations,
              _validations,
            ) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.hasUnsavedChanges, hasUnsavedChanges) ||
                other.hasUnsavedChanges == hasUnsavedChanges) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.saveAttempts, saveAttempts) ||
                other.saveAttempts == saveAttempts) &&
            (identical(other.lastSaveAttempt, lastSaveAttempt) ||
                other.lastSaveAttempt == lastSaveAttempt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_values),
    const DeepCollectionEquality().hash(_validations),
    const DeepCollectionEquality().hash(_errors),
    isValid,
    hasUnsavedChanges,
    lastModified,
    saveAttempts,
    lastSaveAttempt,
  );

  /// Create a copy of DSProfileFormData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileFormDataImplCopyWith<_$DSProfileFormDataImpl> get copyWith =>
      __$$DSProfileFormDataImplCopyWithImpl<_$DSProfileFormDataImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProfileFormData implements DSProfileFormData {
  const factory _DSProfileFormData({
    final Map<String, dynamic> values,
    final Map<String, DSProfileFieldValidation> validations,
    final Map<String, String> errors,
    final bool isValid,
    final bool hasUnsavedChanges,
    final DateTime? lastModified,
    final int saveAttempts,
    final DateTime? lastSaveAttempt,
  }) = _$DSProfileFormDataImpl;

  /// Valores de los campos
  @override
  Map<String, dynamic> get values;

  /// Validaciones de los campos
  @override
  Map<String, DSProfileFieldValidation> get validations;

  /// Errores de validación
  @override
  Map<String, String> get errors;

  /// Si el formulario es válido
  @override
  bool get isValid;

  /// Si hay cambios sin guardar
  @override
  bool get hasUnsavedChanges;

  /// Timestamp del último cambio
  @override
  DateTime? get lastModified;

  /// Contador de intentos de guardado
  @override
  int get saveAttempts;

  /// Último intento de guardado
  @override
  DateTime? get lastSaveAttempt;

  /// Create a copy of DSProfileFormData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileFormDataImplCopyWith<_$DSProfileFormDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProfileFieldValidationResult {
  /// ID del campo
  String get fieldId => throw _privateConstructorUsedError;

  /// Si es válido
  bool get isValid => throw _privateConstructorUsedError;

  /// Mensaje de error
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Timestamp de la validación
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Create a copy of DSProfileFieldValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProfileFieldValidationResultCopyWith<DSProfileFieldValidationResult>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProfileFieldValidationResultCopyWith<$Res> {
  factory $DSProfileFieldValidationResultCopyWith(
    DSProfileFieldValidationResult value,
    $Res Function(DSProfileFieldValidationResult) then,
  ) =
      _$DSProfileFieldValidationResultCopyWithImpl<
        $Res,
        DSProfileFieldValidationResult
      >;
  @useResult
  $Res call({
    String fieldId,
    bool isValid,
    String? errorMessage,
    DateTime? timestamp,
  });
}

/// @nodoc
class _$DSProfileFieldValidationResultCopyWithImpl<
  $Res,
  $Val extends DSProfileFieldValidationResult
>
    implements $DSProfileFieldValidationResultCopyWith<$Res> {
  _$DSProfileFieldValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProfileFieldValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldId = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _value.copyWith(
            fieldId: null == fieldId
                ? _value.fieldId
                : fieldId // ignore: cast_nullable_to_non_nullable
                      as String,
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProfileFieldValidationResultImplCopyWith<$Res>
    implements $DSProfileFieldValidationResultCopyWith<$Res> {
  factory _$$DSProfileFieldValidationResultImplCopyWith(
    _$DSProfileFieldValidationResultImpl value,
    $Res Function(_$DSProfileFieldValidationResultImpl) then,
  ) = __$$DSProfileFieldValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String fieldId,
    bool isValid,
    String? errorMessage,
    DateTime? timestamp,
  });
}

/// @nodoc
class __$$DSProfileFieldValidationResultImplCopyWithImpl<$Res>
    extends
        _$DSProfileFieldValidationResultCopyWithImpl<
          $Res,
          _$DSProfileFieldValidationResultImpl
        >
    implements _$$DSProfileFieldValidationResultImplCopyWith<$Res> {
  __$$DSProfileFieldValidationResultImplCopyWithImpl(
    _$DSProfileFieldValidationResultImpl _value,
    $Res Function(_$DSProfileFieldValidationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProfileFieldValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldId = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _$DSProfileFieldValidationResultImpl(
        fieldId: null == fieldId
            ? _value.fieldId
            : fieldId // ignore: cast_nullable_to_non_nullable
                  as String,
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$DSProfileFieldValidationResultImpl
    implements _DSProfileFieldValidationResult {
  const _$DSProfileFieldValidationResultImpl({
    required this.fieldId,
    required this.isValid,
    this.errorMessage,
    this.timestamp,
  });

  /// ID del campo
  @override
  final String fieldId;

  /// Si es válido
  @override
  final bool isValid;

  /// Mensaje de error
  @override
  final String? errorMessage;

  /// Timestamp de la validación
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'DSProfileFieldValidationResult(fieldId: $fieldId, isValid: $isValid, errorMessage: $errorMessage, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProfileFieldValidationResultImpl &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fieldId, isValid, errorMessage, timestamp);

  /// Create a copy of DSProfileFieldValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProfileFieldValidationResultImplCopyWith<
    _$DSProfileFieldValidationResultImpl
  >
  get copyWith =>
      __$$DSProfileFieldValidationResultImplCopyWithImpl<
        _$DSProfileFieldValidationResultImpl
      >(this, _$identity);
}

abstract class _DSProfileFieldValidationResult
    implements DSProfileFieldValidationResult {
  const factory _DSProfileFieldValidationResult({
    required final String fieldId,
    required final bool isValid,
    final String? errorMessage,
    final DateTime? timestamp,
  }) = _$DSProfileFieldValidationResultImpl;

  /// ID del campo
  @override
  String get fieldId;

  /// Si es válido
  @override
  bool get isValid;

  /// Mensaje de error
  @override
  String? get errorMessage;

  /// Timestamp de la validación
  @override
  DateTime? get timestamp;

  /// Create a copy of DSProfileFieldValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProfileFieldValidationResultImplCopyWith<
    _$DSProfileFieldValidationResultImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
