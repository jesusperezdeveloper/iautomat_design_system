// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_role_visibility_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSRoleVisibilityConfig {
  /// Variante del componente
  DSRoleVariant get variant => throw _privateConstructorUsedError;

  /// Lista de roles permitidos para mostrar el contenido
  List<DSRole> get roles => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSRoleState get state => throw _privateConstructorUsedError;

  /// Configuración de colores (solo design tokens)
  DSRoleVisibilityColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado (solo design tokens)
  DSRoleSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de tipografía (solo design tokens)
  DSRoleTypography? get typography => throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSRoleVisibilityAnimations? get animations =>
      throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSRoleVisibilityBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSRoleAccessibilityConfig? get accessibility =>
      throw _privateConstructorUsedError;

  /// Modo de evaluación de roles
  DSRoleEvaluationMode get evaluationMode => throw _privateConstructorUsedError;

  /// Lista de permisos requeridos
  List<String> get permissions => throw _privateConstructorUsedError;

  /// Configuración de jerarquía
  DSRoleHierarchyConfig? get hierarchyConfig =>
      throw _privateConstructorUsedError;

  /// Evaluador personalizado
  DSRoleCustomEvaluator? get customEvaluator =>
      throw _privateConstructorUsedError;

  /// Mensaje cuando se niega el acceso
  String? get accessDeniedMessage => throw _privateConstructorUsedError;

  /// Si debe mostrar helpers de depuración
  bool get showDebugHelpers => throw _privateConstructorUsedError;

  /// Si debe usar animaciones de fade
  bool get useFadeAnimation => throw _privateConstructorUsedError;

  /// Si debe mostrar placeholders cuando no hay permisos
  bool get showPlaceholder => throw _privateConstructorUsedError;

  /// Placeholder personalizado cuando no hay permisos
  Widget? get customPlaceholder => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityConfigCopyWith<DSRoleVisibilityConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityConfigCopyWith<$Res> {
  factory $DSRoleVisibilityConfigCopyWith(
    DSRoleVisibilityConfig value,
    $Res Function(DSRoleVisibilityConfig) then,
  ) = _$DSRoleVisibilityConfigCopyWithImpl<$Res, DSRoleVisibilityConfig>;
  @useResult
  $Res call({
    DSRoleVariant variant,
    List<DSRole> roles,
    DSRoleState state,
    DSRoleVisibilityColors? colors,
    DSRoleSpacing? spacing,
    DSRoleTypography? typography,
    DSRoleVisibilityAnimations? animations,
    DSRoleVisibilityBehavior? behavior,
    DSRoleAccessibilityConfig? accessibility,
    DSRoleEvaluationMode evaluationMode,
    List<String> permissions,
    DSRoleHierarchyConfig? hierarchyConfig,
    DSRoleCustomEvaluator? customEvaluator,
    String? accessDeniedMessage,
    bool showDebugHelpers,
    bool useFadeAnimation,
    bool showPlaceholder,
    Widget? customPlaceholder,
  });

  $DSRoleVisibilityColorsCopyWith<$Res>? get colors;
  $DSRoleSpacingCopyWith<$Res>? get spacing;
  $DSRoleTypographyCopyWith<$Res>? get typography;
  $DSRoleVisibilityAnimationsCopyWith<$Res>? get animations;
  $DSRoleVisibilityBehaviorCopyWith<$Res>? get behavior;
  $DSRoleAccessibilityConfigCopyWith<$Res>? get accessibility;
  $DSRoleHierarchyConfigCopyWith<$Res>? get hierarchyConfig;
}

/// @nodoc
class _$DSRoleVisibilityConfigCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityConfig
>
    implements $DSRoleVisibilityConfigCopyWith<$Res> {
  _$DSRoleVisibilityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? roles = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? typography = freezed,
    Object? animations = freezed,
    Object? behavior = freezed,
    Object? accessibility = freezed,
    Object? evaluationMode = null,
    Object? permissions = null,
    Object? hierarchyConfig = freezed,
    Object? customEvaluator = freezed,
    Object? accessDeniedMessage = freezed,
    Object? showDebugHelpers = null,
    Object? useFadeAnimation = null,
    Object? showPlaceholder = null,
    Object? customPlaceholder = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSRoleVariant,
            roles: null == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<DSRole>,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSRoleState,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSRoleVisibilityColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSRoleSpacing?,
            typography: freezed == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as DSRoleTypography?,
            animations: freezed == animations
                ? _value.animations
                : animations // ignore: cast_nullable_to_non_nullable
                      as DSRoleVisibilityAnimations?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSRoleVisibilityBehavior?,
            accessibility: freezed == accessibility
                ? _value.accessibility
                : accessibility // ignore: cast_nullable_to_non_nullable
                      as DSRoleAccessibilityConfig?,
            evaluationMode: null == evaluationMode
                ? _value.evaluationMode
                : evaluationMode // ignore: cast_nullable_to_non_nullable
                      as DSRoleEvaluationMode,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hierarchyConfig: freezed == hierarchyConfig
                ? _value.hierarchyConfig
                : hierarchyConfig // ignore: cast_nullable_to_non_nullable
                      as DSRoleHierarchyConfig?,
            customEvaluator: freezed == customEvaluator
                ? _value.customEvaluator
                : customEvaluator // ignore: cast_nullable_to_non_nullable
                      as DSRoleCustomEvaluator?,
            accessDeniedMessage: freezed == accessDeniedMessage
                ? _value.accessDeniedMessage
                : accessDeniedMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            showDebugHelpers: null == showDebugHelpers
                ? _value.showDebugHelpers
                : showDebugHelpers // ignore: cast_nullable_to_non_nullable
                      as bool,
            useFadeAnimation: null == useFadeAnimation
                ? _value.useFadeAnimation
                : useFadeAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            showPlaceholder: null == showPlaceholder
                ? _value.showPlaceholder
                : showPlaceholder // ignore: cast_nullable_to_non_nullable
                      as bool,
            customPlaceholder: freezed == customPlaceholder
                ? _value.customPlaceholder
                : customPlaceholder // ignore: cast_nullable_to_non_nullable
                      as Widget?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleVisibilityColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSRoleVisibilityColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSRoleSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleTypographyCopyWith<$Res>? get typography {
    if (_value.typography == null) {
      return null;
    }

    return $DSRoleTypographyCopyWith<$Res>(_value.typography!, (value) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleVisibilityAnimationsCopyWith<$Res>? get animations {
    if (_value.animations == null) {
      return null;
    }

    return $DSRoleVisibilityAnimationsCopyWith<$Res>(_value.animations!, (
      value,
    ) {
      return _then(_value.copyWith(animations: value) as $Val);
    });
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleVisibilityBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSRoleVisibilityBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleAccessibilityConfigCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $DSRoleAccessibilityConfigCopyWith<$Res>(_value.accessibility!, (
      value,
    ) {
      return _then(_value.copyWith(accessibility: value) as $Val);
    });
  }

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleHierarchyConfigCopyWith<$Res>? get hierarchyConfig {
    if (_value.hierarchyConfig == null) {
      return null;
    }

    return $DSRoleHierarchyConfigCopyWith<$Res>(_value.hierarchyConfig!, (
      value,
    ) {
      return _then(_value.copyWith(hierarchyConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityConfigImplCopyWith<$Res>
    implements $DSRoleVisibilityConfigCopyWith<$Res> {
  factory _$$DSRoleVisibilityConfigImplCopyWith(
    _$DSRoleVisibilityConfigImpl value,
    $Res Function(_$DSRoleVisibilityConfigImpl) then,
  ) = __$$DSRoleVisibilityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSRoleVariant variant,
    List<DSRole> roles,
    DSRoleState state,
    DSRoleVisibilityColors? colors,
    DSRoleSpacing? spacing,
    DSRoleTypography? typography,
    DSRoleVisibilityAnimations? animations,
    DSRoleVisibilityBehavior? behavior,
    DSRoleAccessibilityConfig? accessibility,
    DSRoleEvaluationMode evaluationMode,
    List<String> permissions,
    DSRoleHierarchyConfig? hierarchyConfig,
    DSRoleCustomEvaluator? customEvaluator,
    String? accessDeniedMessage,
    bool showDebugHelpers,
    bool useFadeAnimation,
    bool showPlaceholder,
    Widget? customPlaceholder,
  });

  @override
  $DSRoleVisibilityColorsCopyWith<$Res>? get colors;
  @override
  $DSRoleSpacingCopyWith<$Res>? get spacing;
  @override
  $DSRoleTypographyCopyWith<$Res>? get typography;
  @override
  $DSRoleVisibilityAnimationsCopyWith<$Res>? get animations;
  @override
  $DSRoleVisibilityBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSRoleAccessibilityConfigCopyWith<$Res>? get accessibility;
  @override
  $DSRoleHierarchyConfigCopyWith<$Res>? get hierarchyConfig;
}

/// @nodoc
class __$$DSRoleVisibilityConfigImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityConfigCopyWithImpl<$Res, _$DSRoleVisibilityConfigImpl>
    implements _$$DSRoleVisibilityConfigImplCopyWith<$Res> {
  __$$DSRoleVisibilityConfigImplCopyWithImpl(
    _$DSRoleVisibilityConfigImpl _value,
    $Res Function(_$DSRoleVisibilityConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? roles = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? typography = freezed,
    Object? animations = freezed,
    Object? behavior = freezed,
    Object? accessibility = freezed,
    Object? evaluationMode = null,
    Object? permissions = null,
    Object? hierarchyConfig = freezed,
    Object? customEvaluator = freezed,
    Object? accessDeniedMessage = freezed,
    Object? showDebugHelpers = null,
    Object? useFadeAnimation = null,
    Object? showPlaceholder = null,
    Object? customPlaceholder = freezed,
  }) {
    return _then(
      _$DSRoleVisibilityConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSRoleVariant,
        roles: null == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<DSRole>,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSRoleState,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSRoleVisibilityColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSRoleSpacing?,
        typography: freezed == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as DSRoleTypography?,
        animations: freezed == animations
            ? _value.animations
            : animations // ignore: cast_nullable_to_non_nullable
                  as DSRoleVisibilityAnimations?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSRoleVisibilityBehavior?,
        accessibility: freezed == accessibility
            ? _value.accessibility
            : accessibility // ignore: cast_nullable_to_non_nullable
                  as DSRoleAccessibilityConfig?,
        evaluationMode: null == evaluationMode
            ? _value.evaluationMode
            : evaluationMode // ignore: cast_nullable_to_non_nullable
                  as DSRoleEvaluationMode,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hierarchyConfig: freezed == hierarchyConfig
            ? _value.hierarchyConfig
            : hierarchyConfig // ignore: cast_nullable_to_non_nullable
                  as DSRoleHierarchyConfig?,
        customEvaluator: freezed == customEvaluator
            ? _value.customEvaluator
            : customEvaluator // ignore: cast_nullable_to_non_nullable
                  as DSRoleCustomEvaluator?,
        accessDeniedMessage: freezed == accessDeniedMessage
            ? _value.accessDeniedMessage
            : accessDeniedMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        showDebugHelpers: null == showDebugHelpers
            ? _value.showDebugHelpers
            : showDebugHelpers // ignore: cast_nullable_to_non_nullable
                  as bool,
        useFadeAnimation: null == useFadeAnimation
            ? _value.useFadeAnimation
            : useFadeAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        showPlaceholder: null == showPlaceholder
            ? _value.showPlaceholder
            : showPlaceholder // ignore: cast_nullable_to_non_nullable
                  as bool,
        customPlaceholder: freezed == customPlaceholder
            ? _value.customPlaceholder
            : customPlaceholder // ignore: cast_nullable_to_non_nullable
                  as Widget?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityConfigImpl implements _DSRoleVisibilityConfig {
  const _$DSRoleVisibilityConfigImpl({
    this.variant = DSRoleVariant.helpers,
    final List<DSRole> roles = const [],
    this.state = DSRoleState.defaultState,
    this.colors,
    this.spacing,
    this.typography,
    this.animations,
    this.behavior,
    this.accessibility,
    this.evaluationMode = DSRoleEvaluationMode.any,
    final List<String> permissions = const [],
    this.hierarchyConfig,
    this.customEvaluator,
    this.accessDeniedMessage,
    this.showDebugHelpers = false,
    this.useFadeAnimation = true,
    this.showPlaceholder = false,
    this.customPlaceholder,
  }) : _roles = roles,
       _permissions = permissions;

  /// Variante del componente
  @override
  @JsonKey()
  final DSRoleVariant variant;

  /// Lista de roles permitidos para mostrar el contenido
  final List<DSRole> _roles;

  /// Lista de roles permitidos para mostrar el contenido
  @override
  @JsonKey()
  List<DSRole> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSRoleState state;

  /// Configuración de colores (solo design tokens)
  @override
  final DSRoleVisibilityColors? colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  final DSRoleSpacing? spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  final DSRoleTypography? typography;

  /// Configuración de animaciones
  @override
  final DSRoleVisibilityAnimations? animations;

  /// Configuración de comportamiento
  @override
  final DSRoleVisibilityBehavior? behavior;

  /// Configuración de accesibilidad
  @override
  final DSRoleAccessibilityConfig? accessibility;

  /// Modo de evaluación de roles
  @override
  @JsonKey()
  final DSRoleEvaluationMode evaluationMode;

  /// Lista de permisos requeridos
  final List<String> _permissions;

  /// Lista de permisos requeridos
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  /// Configuración de jerarquía
  @override
  final DSRoleHierarchyConfig? hierarchyConfig;

  /// Evaluador personalizado
  @override
  final DSRoleCustomEvaluator? customEvaluator;

  /// Mensaje cuando se niega el acceso
  @override
  final String? accessDeniedMessage;

  /// Si debe mostrar helpers de depuración
  @override
  @JsonKey()
  final bool showDebugHelpers;

  /// Si debe usar animaciones de fade
  @override
  @JsonKey()
  final bool useFadeAnimation;

  /// Si debe mostrar placeholders cuando no hay permisos
  @override
  @JsonKey()
  final bool showPlaceholder;

  /// Placeholder personalizado cuando no hay permisos
  @override
  final Widget? customPlaceholder;

  @override
  String toString() {
    return 'DSRoleVisibilityConfig(variant: $variant, roles: $roles, state: $state, colors: $colors, spacing: $spacing, typography: $typography, animations: $animations, behavior: $behavior, accessibility: $accessibility, evaluationMode: $evaluationMode, permissions: $permissions, hierarchyConfig: $hierarchyConfig, customEvaluator: $customEvaluator, accessDeniedMessage: $accessDeniedMessage, showDebugHelpers: $showDebugHelpers, useFadeAnimation: $useFadeAnimation, showPlaceholder: $showPlaceholder, customPlaceholder: $customPlaceholder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.typography, typography) ||
                other.typography == typography) &&
            (identical(other.animations, animations) ||
                other.animations == animations) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility) &&
            (identical(other.evaluationMode, evaluationMode) ||
                other.evaluationMode == evaluationMode) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.hierarchyConfig, hierarchyConfig) ||
                other.hierarchyConfig == hierarchyConfig) &&
            (identical(other.customEvaluator, customEvaluator) ||
                other.customEvaluator == customEvaluator) &&
            (identical(other.accessDeniedMessage, accessDeniedMessage) ||
                other.accessDeniedMessage == accessDeniedMessage) &&
            (identical(other.showDebugHelpers, showDebugHelpers) ||
                other.showDebugHelpers == showDebugHelpers) &&
            (identical(other.useFadeAnimation, useFadeAnimation) ||
                other.useFadeAnimation == useFadeAnimation) &&
            (identical(other.showPlaceholder, showPlaceholder) ||
                other.showPlaceholder == showPlaceholder) &&
            (identical(other.customPlaceholder, customPlaceholder) ||
                other.customPlaceholder == customPlaceholder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    const DeepCollectionEquality().hash(_roles),
    state,
    colors,
    spacing,
    typography,
    animations,
    behavior,
    accessibility,
    evaluationMode,
    const DeepCollectionEquality().hash(_permissions),
    hierarchyConfig,
    customEvaluator,
    accessDeniedMessage,
    showDebugHelpers,
    useFadeAnimation,
    showPlaceholder,
    customPlaceholder,
  );

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityConfigImplCopyWith<_$DSRoleVisibilityConfigImpl>
  get copyWith =>
      __$$DSRoleVisibilityConfigImplCopyWithImpl<_$DSRoleVisibilityConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleVisibilityConfig implements DSRoleVisibilityConfig {
  const factory _DSRoleVisibilityConfig({
    final DSRoleVariant variant,
    final List<DSRole> roles,
    final DSRoleState state,
    final DSRoleVisibilityColors? colors,
    final DSRoleSpacing? spacing,
    final DSRoleTypography? typography,
    final DSRoleVisibilityAnimations? animations,
    final DSRoleVisibilityBehavior? behavior,
    final DSRoleAccessibilityConfig? accessibility,
    final DSRoleEvaluationMode evaluationMode,
    final List<String> permissions,
    final DSRoleHierarchyConfig? hierarchyConfig,
    final DSRoleCustomEvaluator? customEvaluator,
    final String? accessDeniedMessage,
    final bool showDebugHelpers,
    final bool useFadeAnimation,
    final bool showPlaceholder,
    final Widget? customPlaceholder,
  }) = _$DSRoleVisibilityConfigImpl;

  /// Variante del componente
  @override
  DSRoleVariant get variant;

  /// Lista de roles permitidos para mostrar el contenido
  @override
  List<DSRole> get roles;

  /// Estado actual del componente
  @override
  DSRoleState get state;

  /// Configuración de colores (solo design tokens)
  @override
  DSRoleVisibilityColors? get colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  DSRoleSpacing? get spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  DSRoleTypography? get typography;

  /// Configuración de animaciones
  @override
  DSRoleVisibilityAnimations? get animations;

  /// Configuración de comportamiento
  @override
  DSRoleVisibilityBehavior? get behavior;

  /// Configuración de accesibilidad
  @override
  DSRoleAccessibilityConfig? get accessibility;

  /// Modo de evaluación de roles
  @override
  DSRoleEvaluationMode get evaluationMode;

  /// Lista de permisos requeridos
  @override
  List<String> get permissions;

  /// Configuración de jerarquía
  @override
  DSRoleHierarchyConfig? get hierarchyConfig;

  /// Evaluador personalizado
  @override
  DSRoleCustomEvaluator? get customEvaluator;

  /// Mensaje cuando se niega el acceso
  @override
  String? get accessDeniedMessage;

  /// Si debe mostrar helpers de depuración
  @override
  bool get showDebugHelpers;

  /// Si debe usar animaciones de fade
  @override
  bool get useFadeAnimation;

  /// Si debe mostrar placeholders cuando no hay permisos
  @override
  bool get showPlaceholder;

  /// Placeholder personalizado cuando no hay permisos
  @override
  Widget? get customPlaceholder;

  /// Create a copy of DSRoleVisibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityConfigImplCopyWith<_$DSRoleVisibilityConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRole {
  /// ID único del rol
  String get id => throw _privateConstructorUsedError;

  /// Tipo de rol
  DSRoleType get type => throw _privateConstructorUsedError;

  /// Nombre del rol para mostrar
  String get name => throw _privateConstructorUsedError;

  /// Nombre para mostrar (opcional, usa name si no se especifica)
  String? get displayName => throw _privateConstructorUsedError;

  /// Descripción del rol
  String? get description => throw _privateConstructorUsedError;

  /// Permisos asociados al rol
  List<String> get permissions => throw _privateConstructorUsedError;

  /// Prioridad del rol
  DSRolePriority get priority => throw _privateConstructorUsedError;

  /// Importancia del rol
  DSRoleImportance? get importance => throw _privateConstructorUsedError;

  /// Nivel del rol (para jerarquías)
  int? get level => throw _privateConstructorUsedError;

  /// Si el rol está activo
  bool get isActive => throw _privateConstructorUsedError;

  /// Si el rol está habilitado
  bool get enabled => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSRoleAccessibility? get accessibility => throw _privateConstructorUsedError;

  /// Metadatos adicionales del rol
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Roles padre de los que hereda permisos
  List<String> get inheritsFrom => throw _privateConstructorUsedError;

  /// Fecha de expiración del rol (opcional)
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Create a copy of DSRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleCopyWith<DSRole> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleCopyWith<$Res> {
  factory $DSRoleCopyWith(DSRole value, $Res Function(DSRole) then) =
      _$DSRoleCopyWithImpl<$Res, DSRole>;
  @useResult
  $Res call({
    String id,
    DSRoleType type,
    String name,
    String? displayName,
    String? description,
    List<String> permissions,
    DSRolePriority priority,
    DSRoleImportance? importance,
    int? level,
    bool isActive,
    bool enabled,
    DSRoleAccessibility? accessibility,
    Map<String, dynamic> metadata,
    List<String> inheritsFrom,
    DateTime? expiresAt,
  });

  $DSRoleAccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class _$DSRoleCopyWithImpl<$Res, $Val extends DSRole>
    implements $DSRoleCopyWith<$Res> {
  _$DSRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? permissions = null,
    Object? priority = null,
    Object? importance = freezed,
    Object? level = freezed,
    Object? isActive = null,
    Object? enabled = null,
    Object? accessibility = freezed,
    Object? metadata = null,
    Object? inheritsFrom = null,
    Object? expiresAt = freezed,
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
                      as DSRoleType,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as DSRolePriority,
            importance: freezed == importance
                ? _value.importance
                : importance // ignore: cast_nullable_to_non_nullable
                      as DSRoleImportance?,
            level: freezed == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            accessibility: freezed == accessibility
                ? _value.accessibility
                : accessibility // ignore: cast_nullable_to_non_nullable
                      as DSRoleAccessibility?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            inheritsFrom: null == inheritsFrom
                ? _value.inheritsFrom
                : inheritsFrom // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleAccessibilityCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $DSRoleAccessibilityCopyWith<$Res>(_value.accessibility!, (value) {
      return _then(_value.copyWith(accessibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSRoleImplCopyWith<$Res> implements $DSRoleCopyWith<$Res> {
  factory _$$DSRoleImplCopyWith(
    _$DSRoleImpl value,
    $Res Function(_$DSRoleImpl) then,
  ) = __$$DSRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DSRoleType type,
    String name,
    String? displayName,
    String? description,
    List<String> permissions,
    DSRolePriority priority,
    DSRoleImportance? importance,
    int? level,
    bool isActive,
    bool enabled,
    DSRoleAccessibility? accessibility,
    Map<String, dynamic> metadata,
    List<String> inheritsFrom,
    DateTime? expiresAt,
  });

  @override
  $DSRoleAccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class __$$DSRoleImplCopyWithImpl<$Res>
    extends _$DSRoleCopyWithImpl<$Res, _$DSRoleImpl>
    implements _$$DSRoleImplCopyWith<$Res> {
  __$$DSRoleImplCopyWithImpl(
    _$DSRoleImpl _value,
    $Res Function(_$DSRoleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? permissions = null,
    Object? priority = null,
    Object? importance = freezed,
    Object? level = freezed,
    Object? isActive = null,
    Object? enabled = null,
    Object? accessibility = freezed,
    Object? metadata = null,
    Object? inheritsFrom = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$DSRoleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSRoleType,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as DSRolePriority,
        importance: freezed == importance
            ? _value.importance
            : importance // ignore: cast_nullable_to_non_nullable
                  as DSRoleImportance?,
        level: freezed == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        accessibility: freezed == accessibility
            ? _value.accessibility
            : accessibility // ignore: cast_nullable_to_non_nullable
                  as DSRoleAccessibility?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        inheritsFrom: null == inheritsFrom
            ? _value._inheritsFrom
            : inheritsFrom // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleImpl implements _DSRole {
  const _$DSRoleImpl({
    required this.id,
    required this.type,
    required this.name,
    this.displayName,
    this.description,
    final List<String> permissions = const [],
    this.priority = DSRolePriority.normal,
    this.importance,
    this.level,
    this.isActive = true,
    this.enabled = true,
    this.accessibility,
    final Map<String, dynamic> metadata = const {},
    final List<String> inheritsFrom = const [],
    this.expiresAt,
  }) : _permissions = permissions,
       _metadata = metadata,
       _inheritsFrom = inheritsFrom;

  /// ID único del rol
  @override
  final String id;

  /// Tipo de rol
  @override
  final DSRoleType type;

  /// Nombre del rol para mostrar
  @override
  final String name;

  /// Nombre para mostrar (opcional, usa name si no se especifica)
  @override
  final String? displayName;

  /// Descripción del rol
  @override
  final String? description;

  /// Permisos asociados al rol
  final List<String> _permissions;

  /// Permisos asociados al rol
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  /// Prioridad del rol
  @override
  @JsonKey()
  final DSRolePriority priority;

  /// Importancia del rol
  @override
  final DSRoleImportance? importance;

  /// Nivel del rol (para jerarquías)
  @override
  final int? level;

  /// Si el rol está activo
  @override
  @JsonKey()
  final bool isActive;

  /// Si el rol está habilitado
  @override
  @JsonKey()
  final bool enabled;

  /// Configuración de accesibilidad
  @override
  final DSRoleAccessibility? accessibility;

  /// Metadatos adicionales del rol
  final Map<String, dynamic> _metadata;

  /// Metadatos adicionales del rol
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  /// Roles padre de los que hereda permisos
  final List<String> _inheritsFrom;

  /// Roles padre de los que hereda permisos
  @override
  @JsonKey()
  List<String> get inheritsFrom {
    if (_inheritsFrom is EqualUnmodifiableListView) return _inheritsFrom;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inheritsFrom);
  }

  /// Fecha de expiración del rol (opcional)
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'DSRole(id: $id, type: $type, name: $name, displayName: $displayName, description: $description, permissions: $permissions, priority: $priority, importance: $importance, level: $level, isActive: $isActive, enabled: $enabled, accessibility: $accessibility, metadata: $metadata, inheritsFrom: $inheritsFrom, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(
              other._inheritsFrom,
              _inheritsFrom,
            ) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    name,
    displayName,
    description,
    const DeepCollectionEquality().hash(_permissions),
    priority,
    importance,
    level,
    isActive,
    enabled,
    accessibility,
    const DeepCollectionEquality().hash(_metadata),
    const DeepCollectionEquality().hash(_inheritsFrom),
    expiresAt,
  );

  /// Create a copy of DSRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleImplCopyWith<_$DSRoleImpl> get copyWith =>
      __$$DSRoleImplCopyWithImpl<_$DSRoleImpl>(this, _$identity);
}

abstract class _DSRole implements DSRole {
  const factory _DSRole({
    required final String id,
    required final DSRoleType type,
    required final String name,
    final String? displayName,
    final String? description,
    final List<String> permissions,
    final DSRolePriority priority,
    final DSRoleImportance? importance,
    final int? level,
    final bool isActive,
    final bool enabled,
    final DSRoleAccessibility? accessibility,
    final Map<String, dynamic> metadata,
    final List<String> inheritsFrom,
    final DateTime? expiresAt,
  }) = _$DSRoleImpl;

  /// ID único del rol
  @override
  String get id;

  /// Tipo de rol
  @override
  DSRoleType get type;

  /// Nombre del rol para mostrar
  @override
  String get name;

  /// Nombre para mostrar (opcional, usa name si no se especifica)
  @override
  String? get displayName;

  /// Descripción del rol
  @override
  String? get description;

  /// Permisos asociados al rol
  @override
  List<String> get permissions;

  /// Prioridad del rol
  @override
  DSRolePriority get priority;

  /// Importancia del rol
  @override
  DSRoleImportance? get importance;

  /// Nivel del rol (para jerarquías)
  @override
  int? get level;

  /// Si el rol está activo
  @override
  bool get isActive;

  /// Si el rol está habilitado
  @override
  bool get enabled;

  /// Configuración de accesibilidad
  @override
  DSRoleAccessibility? get accessibility;

  /// Metadatos adicionales del rol
  @override
  Map<String, dynamic> get metadata;

  /// Roles padre de los que hereda permisos
  @override
  List<String> get inheritsFrom;

  /// Fecha de expiración del rol (opcional)
  @override
  DateTime? get expiresAt;

  /// Create a copy of DSRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleImplCopyWith<_$DSRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleColors {
  /// Color de fondo del componente
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color de fondo del placeholder
  Color? get placeholderBackgroundColor => throw _privateConstructorUsedError;

  /// Color de texto del placeholder
  Color? get placeholderTextColor => throw _privateConstructorUsedError;

  /// Color de bordes
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Color de bordes enfocados
  Color? get focusedBorderColor => throw _privateConstructorUsedError;

  /// Color de bordes cuando está deshabilitado
  Color? get disabledBorderColor => throw _privateConstructorUsedError;

  /// Color de texto para helpers de debug
  Color? get debugTextColor => throw _privateConstructorUsedError;

  /// Color de fondo para helpers de debug
  Color? get debugBackgroundColor => throw _privateConstructorUsedError;

  /// Color de iconos
  Color? get iconColor => throw _privateConstructorUsedError;

  /// Color de iconos deshabilitados
  Color? get disabledIconColor => throw _privateConstructorUsedError;

  /// Color de overlay de loading
  Color? get loadingOverlayColor => throw _privateConstructorUsedError;

  /// Color de skeleton loading
  Color? get skeletonBaseColor => throw _privateConstructorUsedError;

  /// Color de highlight de skeleton
  Color? get skeletonHighlightColor => throw _privateConstructorUsedError;

  /// Color de error para roles no válidos
  Color? get errorColor => throw _privateConstructorUsedError;

  /// Color de warning para roles en conflicto
  Color? get warningColor => throw _privateConstructorUsedError;

  /// Color de éxito para roles válidos
  Color? get successColor => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleColorsCopyWith<DSRoleColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleColorsCopyWith<$Res> {
  factory $DSRoleColorsCopyWith(
    DSRoleColors value,
    $Res Function(DSRoleColors) then,
  ) = _$DSRoleColorsCopyWithImpl<$Res, DSRoleColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? placeholderBackgroundColor,
    Color? placeholderTextColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? disabledBorderColor,
    Color? debugTextColor,
    Color? debugBackgroundColor,
    Color? iconColor,
    Color? disabledIconColor,
    Color? loadingOverlayColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
    Color? errorColor,
    Color? warningColor,
    Color? successColor,
  });
}

/// @nodoc
class _$DSRoleColorsCopyWithImpl<$Res, $Val extends DSRoleColors>
    implements $DSRoleColorsCopyWith<$Res> {
  _$DSRoleColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? placeholderBackgroundColor = freezed,
    Object? placeholderTextColor = freezed,
    Object? borderColor = freezed,
    Object? focusedBorderColor = freezed,
    Object? disabledBorderColor = freezed,
    Object? debugTextColor = freezed,
    Object? debugBackgroundColor = freezed,
    Object? iconColor = freezed,
    Object? disabledIconColor = freezed,
    Object? loadingOverlayColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
    Object? errorColor = freezed,
    Object? warningColor = freezed,
    Object? successColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            placeholderBackgroundColor: freezed == placeholderBackgroundColor
                ? _value.placeholderBackgroundColor
                : placeholderBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            placeholderTextColor: freezed == placeholderTextColor
                ? _value.placeholderTextColor
                : placeholderTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            focusedBorderColor: freezed == focusedBorderColor
                ? _value.focusedBorderColor
                : focusedBorderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledBorderColor: freezed == disabledBorderColor
                ? _value.disabledBorderColor
                : disabledBorderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            debugTextColor: freezed == debugTextColor
                ? _value.debugTextColor
                : debugTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            debugBackgroundColor: freezed == debugBackgroundColor
                ? _value.debugBackgroundColor
                : debugBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            iconColor: freezed == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledIconColor: freezed == disabledIconColor
                ? _value.disabledIconColor
                : disabledIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            loadingOverlayColor: freezed == loadingOverlayColor
                ? _value.loadingOverlayColor
                : loadingOverlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonBaseColor: freezed == skeletonBaseColor
                ? _value.skeletonBaseColor
                : skeletonBaseColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonHighlightColor: freezed == skeletonHighlightColor
                ? _value.skeletonHighlightColor
                : skeletonHighlightColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorColor: freezed == errorColor
                ? _value.errorColor
                : errorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            warningColor: freezed == warningColor
                ? _value.warningColor
                : warningColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            successColor: freezed == successColor
                ? _value.successColor
                : successColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleColorsImplCopyWith<$Res>
    implements $DSRoleColorsCopyWith<$Res> {
  factory _$$DSRoleColorsImplCopyWith(
    _$DSRoleColorsImpl value,
    $Res Function(_$DSRoleColorsImpl) then,
  ) = __$$DSRoleColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? placeholderBackgroundColor,
    Color? placeholderTextColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? disabledBorderColor,
    Color? debugTextColor,
    Color? debugBackgroundColor,
    Color? iconColor,
    Color? disabledIconColor,
    Color? loadingOverlayColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
    Color? errorColor,
    Color? warningColor,
    Color? successColor,
  });
}

/// @nodoc
class __$$DSRoleColorsImplCopyWithImpl<$Res>
    extends _$DSRoleColorsCopyWithImpl<$Res, _$DSRoleColorsImpl>
    implements _$$DSRoleColorsImplCopyWith<$Res> {
  __$$DSRoleColorsImplCopyWithImpl(
    _$DSRoleColorsImpl _value,
    $Res Function(_$DSRoleColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? placeholderBackgroundColor = freezed,
    Object? placeholderTextColor = freezed,
    Object? borderColor = freezed,
    Object? focusedBorderColor = freezed,
    Object? disabledBorderColor = freezed,
    Object? debugTextColor = freezed,
    Object? debugBackgroundColor = freezed,
    Object? iconColor = freezed,
    Object? disabledIconColor = freezed,
    Object? loadingOverlayColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
    Object? errorColor = freezed,
    Object? warningColor = freezed,
    Object? successColor = freezed,
  }) {
    return _then(
      _$DSRoleColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        placeholderBackgroundColor: freezed == placeholderBackgroundColor
            ? _value.placeholderBackgroundColor
            : placeholderBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        placeholderTextColor: freezed == placeholderTextColor
            ? _value.placeholderTextColor
            : placeholderTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        focusedBorderColor: freezed == focusedBorderColor
            ? _value.focusedBorderColor
            : focusedBorderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledBorderColor: freezed == disabledBorderColor
            ? _value.disabledBorderColor
            : disabledBorderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        debugTextColor: freezed == debugTextColor
            ? _value.debugTextColor
            : debugTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        debugBackgroundColor: freezed == debugBackgroundColor
            ? _value.debugBackgroundColor
            : debugBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        iconColor: freezed == iconColor
            ? _value.iconColor
            : iconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledIconColor: freezed == disabledIconColor
            ? _value.disabledIconColor
            : disabledIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        loadingOverlayColor: freezed == loadingOverlayColor
            ? _value.loadingOverlayColor
            : loadingOverlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonBaseColor: freezed == skeletonBaseColor
            ? _value.skeletonBaseColor
            : skeletonBaseColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonHighlightColor: freezed == skeletonHighlightColor
            ? _value.skeletonHighlightColor
            : skeletonHighlightColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorColor: freezed == errorColor
            ? _value.errorColor
            : errorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        warningColor: freezed == warningColor
            ? _value.warningColor
            : warningColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        successColor: freezed == successColor
            ? _value.successColor
            : successColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleColorsImpl implements _DSRoleColors {
  const _$DSRoleColorsImpl({
    this.backgroundColor,
    this.placeholderBackgroundColor,
    this.placeholderTextColor,
    this.borderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.debugTextColor,
    this.debugBackgroundColor,
    this.iconColor,
    this.disabledIconColor,
    this.loadingOverlayColor,
    this.skeletonBaseColor,
    this.skeletonHighlightColor,
    this.errorColor,
    this.warningColor,
    this.successColor,
  });

  /// Color de fondo del componente
  @override
  final Color? backgroundColor;

  /// Color de fondo del placeholder
  @override
  final Color? placeholderBackgroundColor;

  /// Color de texto del placeholder
  @override
  final Color? placeholderTextColor;

  /// Color de bordes
  @override
  final Color? borderColor;

  /// Color de bordes enfocados
  @override
  final Color? focusedBorderColor;

  /// Color de bordes cuando está deshabilitado
  @override
  final Color? disabledBorderColor;

  /// Color de texto para helpers de debug
  @override
  final Color? debugTextColor;

  /// Color de fondo para helpers de debug
  @override
  final Color? debugBackgroundColor;

  /// Color de iconos
  @override
  final Color? iconColor;

  /// Color de iconos deshabilitados
  @override
  final Color? disabledIconColor;

  /// Color de overlay de loading
  @override
  final Color? loadingOverlayColor;

  /// Color de skeleton loading
  @override
  final Color? skeletonBaseColor;

  /// Color de highlight de skeleton
  @override
  final Color? skeletonHighlightColor;

  /// Color de error para roles no válidos
  @override
  final Color? errorColor;

  /// Color de warning para roles en conflicto
  @override
  final Color? warningColor;

  /// Color de éxito para roles válidos
  @override
  final Color? successColor;

  @override
  String toString() {
    return 'DSRoleColors(backgroundColor: $backgroundColor, placeholderBackgroundColor: $placeholderBackgroundColor, placeholderTextColor: $placeholderTextColor, borderColor: $borderColor, focusedBorderColor: $focusedBorderColor, disabledBorderColor: $disabledBorderColor, debugTextColor: $debugTextColor, debugBackgroundColor: $debugBackgroundColor, iconColor: $iconColor, disabledIconColor: $disabledIconColor, loadingOverlayColor: $loadingOverlayColor, skeletonBaseColor: $skeletonBaseColor, skeletonHighlightColor: $skeletonHighlightColor, errorColor: $errorColor, warningColor: $warningColor, successColor: $successColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(
                  other.placeholderBackgroundColor,
                  placeholderBackgroundColor,
                ) ||
                other.placeholderBackgroundColor ==
                    placeholderBackgroundColor) &&
            (identical(other.placeholderTextColor, placeholderTextColor) ||
                other.placeholderTextColor == placeholderTextColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.focusedBorderColor, focusedBorderColor) ||
                other.focusedBorderColor == focusedBorderColor) &&
            (identical(other.disabledBorderColor, disabledBorderColor) ||
                other.disabledBorderColor == disabledBorderColor) &&
            (identical(other.debugTextColor, debugTextColor) ||
                other.debugTextColor == debugTextColor) &&
            (identical(other.debugBackgroundColor, debugBackgroundColor) ||
                other.debugBackgroundColor == debugBackgroundColor) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.disabledIconColor, disabledIconColor) ||
                other.disabledIconColor == disabledIconColor) &&
            (identical(other.loadingOverlayColor, loadingOverlayColor) ||
                other.loadingOverlayColor == loadingOverlayColor) &&
            (identical(other.skeletonBaseColor, skeletonBaseColor) ||
                other.skeletonBaseColor == skeletonBaseColor) &&
            (identical(other.skeletonHighlightColor, skeletonHighlightColor) ||
                other.skeletonHighlightColor == skeletonHighlightColor) &&
            (identical(other.errorColor, errorColor) ||
                other.errorColor == errorColor) &&
            (identical(other.warningColor, warningColor) ||
                other.warningColor == warningColor) &&
            (identical(other.successColor, successColor) ||
                other.successColor == successColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    placeholderBackgroundColor,
    placeholderTextColor,
    borderColor,
    focusedBorderColor,
    disabledBorderColor,
    debugTextColor,
    debugBackgroundColor,
    iconColor,
    disabledIconColor,
    loadingOverlayColor,
    skeletonBaseColor,
    skeletonHighlightColor,
    errorColor,
    warningColor,
    successColor,
  );

  /// Create a copy of DSRoleColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleColorsImplCopyWith<_$DSRoleColorsImpl> get copyWith =>
      __$$DSRoleColorsImplCopyWithImpl<_$DSRoleColorsImpl>(this, _$identity);
}

abstract class _DSRoleColors implements DSRoleColors {
  const factory _DSRoleColors({
    final Color? backgroundColor,
    final Color? placeholderBackgroundColor,
    final Color? placeholderTextColor,
    final Color? borderColor,
    final Color? focusedBorderColor,
    final Color? disabledBorderColor,
    final Color? debugTextColor,
    final Color? debugBackgroundColor,
    final Color? iconColor,
    final Color? disabledIconColor,
    final Color? loadingOverlayColor,
    final Color? skeletonBaseColor,
    final Color? skeletonHighlightColor,
    final Color? errorColor,
    final Color? warningColor,
    final Color? successColor,
  }) = _$DSRoleColorsImpl;

  /// Color de fondo del componente
  @override
  Color? get backgroundColor;

  /// Color de fondo del placeholder
  @override
  Color? get placeholderBackgroundColor;

  /// Color de texto del placeholder
  @override
  Color? get placeholderTextColor;

  /// Color de bordes
  @override
  Color? get borderColor;

  /// Color de bordes enfocados
  @override
  Color? get focusedBorderColor;

  /// Color de bordes cuando está deshabilitado
  @override
  Color? get disabledBorderColor;

  /// Color de texto para helpers de debug
  @override
  Color? get debugTextColor;

  /// Color de fondo para helpers de debug
  @override
  Color? get debugBackgroundColor;

  /// Color de iconos
  @override
  Color? get iconColor;

  /// Color de iconos deshabilitados
  @override
  Color? get disabledIconColor;

  /// Color de overlay de loading
  @override
  Color? get loadingOverlayColor;

  /// Color de skeleton loading
  @override
  Color? get skeletonBaseColor;

  /// Color de highlight de skeleton
  @override
  Color? get skeletonHighlightColor;

  /// Color de error para roles no válidos
  @override
  Color? get errorColor;

  /// Color de warning para roles en conflicto
  @override
  Color? get warningColor;

  /// Color de éxito para roles válidos
  @override
  Color? get successColor;

  /// Create a copy of DSRoleColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleColorsImplCopyWith<_$DSRoleColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleSpacing {
  /// Padding del componente principal
  EdgeInsets get componentPadding => throw _privateConstructorUsedError;

  /// Padding del placeholder
  EdgeInsets get placeholderPadding => throw _privateConstructorUsedError;

  /// Padding de los helpers de debug
  EdgeInsets get debugHelperPadding => throw _privateConstructorUsedError;

  /// Margen entre elementos
  double get elementSpacing => throw _privateConstructorUsedError;

  /// Radio de bordes del componente
  double get borderRadius => throw _privateConstructorUsedError;

  /// Radio de bordes del placeholder
  double get placeholderBorderRadius => throw _privateConstructorUsedError;

  /// Ancho de bordes
  double get borderWidth => throw _privateConstructorUsedError;

  /// Ancho de bordes enfocados
  double get focusedBorderWidth => throw _privateConstructorUsedError;

  /// Altura mínima del placeholder
  double get placeholderMinHeight => throw _privateConstructorUsedError;

  /// Elevación del componente
  double get elevation => throw _privateConstructorUsedError;

  /// Elevación del placeholder
  double get placeholderElevation => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleSpacingCopyWith<DSRoleSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleSpacingCopyWith<$Res> {
  factory $DSRoleSpacingCopyWith(
    DSRoleSpacing value,
    $Res Function(DSRoleSpacing) then,
  ) = _$DSRoleSpacingCopyWithImpl<$Res, DSRoleSpacing>;
  @useResult
  $Res call({
    EdgeInsets componentPadding,
    EdgeInsets placeholderPadding,
    EdgeInsets debugHelperPadding,
    double elementSpacing,
    double borderRadius,
    double placeholderBorderRadius,
    double borderWidth,
    double focusedBorderWidth,
    double placeholderMinHeight,
    double elevation,
    double placeholderElevation,
  });
}

/// @nodoc
class _$DSRoleSpacingCopyWithImpl<$Res, $Val extends DSRoleSpacing>
    implements $DSRoleSpacingCopyWith<$Res> {
  _$DSRoleSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentPadding = null,
    Object? placeholderPadding = null,
    Object? debugHelperPadding = null,
    Object? elementSpacing = null,
    Object? borderRadius = null,
    Object? placeholderBorderRadius = null,
    Object? borderWidth = null,
    Object? focusedBorderWidth = null,
    Object? placeholderMinHeight = null,
    Object? elevation = null,
    Object? placeholderElevation = null,
  }) {
    return _then(
      _value.copyWith(
            componentPadding: null == componentPadding
                ? _value.componentPadding
                : componentPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            placeholderPadding: null == placeholderPadding
                ? _value.placeholderPadding
                : placeholderPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            debugHelperPadding: null == debugHelperPadding
                ? _value.debugHelperPadding
                : debugHelperPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            elementSpacing: null == elementSpacing
                ? _value.elementSpacing
                : elementSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            placeholderBorderRadius: null == placeholderBorderRadius
                ? _value.placeholderBorderRadius
                : placeholderBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            borderWidth: null == borderWidth
                ? _value.borderWidth
                : borderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            focusedBorderWidth: null == focusedBorderWidth
                ? _value.focusedBorderWidth
                : focusedBorderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            placeholderMinHeight: null == placeholderMinHeight
                ? _value.placeholderMinHeight
                : placeholderMinHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            elevation: null == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as double,
            placeholderElevation: null == placeholderElevation
                ? _value.placeholderElevation
                : placeholderElevation // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleSpacingImplCopyWith<$Res>
    implements $DSRoleSpacingCopyWith<$Res> {
  factory _$$DSRoleSpacingImplCopyWith(
    _$DSRoleSpacingImpl value,
    $Res Function(_$DSRoleSpacingImpl) then,
  ) = __$$DSRoleSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EdgeInsets componentPadding,
    EdgeInsets placeholderPadding,
    EdgeInsets debugHelperPadding,
    double elementSpacing,
    double borderRadius,
    double placeholderBorderRadius,
    double borderWidth,
    double focusedBorderWidth,
    double placeholderMinHeight,
    double elevation,
    double placeholderElevation,
  });
}

/// @nodoc
class __$$DSRoleSpacingImplCopyWithImpl<$Res>
    extends _$DSRoleSpacingCopyWithImpl<$Res, _$DSRoleSpacingImpl>
    implements _$$DSRoleSpacingImplCopyWith<$Res> {
  __$$DSRoleSpacingImplCopyWithImpl(
    _$DSRoleSpacingImpl _value,
    $Res Function(_$DSRoleSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentPadding = null,
    Object? placeholderPadding = null,
    Object? debugHelperPadding = null,
    Object? elementSpacing = null,
    Object? borderRadius = null,
    Object? placeholderBorderRadius = null,
    Object? borderWidth = null,
    Object? focusedBorderWidth = null,
    Object? placeholderMinHeight = null,
    Object? elevation = null,
    Object? placeholderElevation = null,
  }) {
    return _then(
      _$DSRoleSpacingImpl(
        componentPadding: null == componentPadding
            ? _value.componentPadding
            : componentPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        placeholderPadding: null == placeholderPadding
            ? _value.placeholderPadding
            : placeholderPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        debugHelperPadding: null == debugHelperPadding
            ? _value.debugHelperPadding
            : debugHelperPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        elementSpacing: null == elementSpacing
            ? _value.elementSpacing
            : elementSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        borderRadius: null == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        placeholderBorderRadius: null == placeholderBorderRadius
            ? _value.placeholderBorderRadius
            : placeholderBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        borderWidth: null == borderWidth
            ? _value.borderWidth
            : borderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        focusedBorderWidth: null == focusedBorderWidth
            ? _value.focusedBorderWidth
            : focusedBorderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        placeholderMinHeight: null == placeholderMinHeight
            ? _value.placeholderMinHeight
            : placeholderMinHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        elevation: null == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as double,
        placeholderElevation: null == placeholderElevation
            ? _value.placeholderElevation
            : placeholderElevation // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleSpacingImpl implements _DSRoleSpacing {
  const _$DSRoleSpacingImpl({
    this.componentPadding = EdgeInsets.zero,
    this.placeholderPadding = const EdgeInsets.all(16),
    this.debugHelperPadding = const EdgeInsets.all(8),
    this.elementSpacing = 8.0,
    this.borderRadius = 4.0,
    this.placeholderBorderRadius = 8.0,
    this.borderWidth = 1.0,
    this.focusedBorderWidth = 2.0,
    this.placeholderMinHeight = 48.0,
    this.elevation = 0.0,
    this.placeholderElevation = 1.0,
  });

  /// Padding del componente principal
  @override
  @JsonKey()
  final EdgeInsets componentPadding;

  /// Padding del placeholder
  @override
  @JsonKey()
  final EdgeInsets placeholderPadding;

  /// Padding de los helpers de debug
  @override
  @JsonKey()
  final EdgeInsets debugHelperPadding;

  /// Margen entre elementos
  @override
  @JsonKey()
  final double elementSpacing;

  /// Radio de bordes del componente
  @override
  @JsonKey()
  final double borderRadius;

  /// Radio de bordes del placeholder
  @override
  @JsonKey()
  final double placeholderBorderRadius;

  /// Ancho de bordes
  @override
  @JsonKey()
  final double borderWidth;

  /// Ancho de bordes enfocados
  @override
  @JsonKey()
  final double focusedBorderWidth;

  /// Altura mínima del placeholder
  @override
  @JsonKey()
  final double placeholderMinHeight;

  /// Elevación del componente
  @override
  @JsonKey()
  final double elevation;

  /// Elevación del placeholder
  @override
  @JsonKey()
  final double placeholderElevation;

  @override
  String toString() {
    return 'DSRoleSpacing(componentPadding: $componentPadding, placeholderPadding: $placeholderPadding, debugHelperPadding: $debugHelperPadding, elementSpacing: $elementSpacing, borderRadius: $borderRadius, placeholderBorderRadius: $placeholderBorderRadius, borderWidth: $borderWidth, focusedBorderWidth: $focusedBorderWidth, placeholderMinHeight: $placeholderMinHeight, elevation: $elevation, placeholderElevation: $placeholderElevation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleSpacingImpl &&
            (identical(other.componentPadding, componentPadding) ||
                other.componentPadding == componentPadding) &&
            (identical(other.placeholderPadding, placeholderPadding) ||
                other.placeholderPadding == placeholderPadding) &&
            (identical(other.debugHelperPadding, debugHelperPadding) ||
                other.debugHelperPadding == debugHelperPadding) &&
            (identical(other.elementSpacing, elementSpacing) ||
                other.elementSpacing == elementSpacing) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(
                  other.placeholderBorderRadius,
                  placeholderBorderRadius,
                ) ||
                other.placeholderBorderRadius == placeholderBorderRadius) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.focusedBorderWidth, focusedBorderWidth) ||
                other.focusedBorderWidth == focusedBorderWidth) &&
            (identical(other.placeholderMinHeight, placeholderMinHeight) ||
                other.placeholderMinHeight == placeholderMinHeight) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.placeholderElevation, placeholderElevation) ||
                other.placeholderElevation == placeholderElevation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    componentPadding,
    placeholderPadding,
    debugHelperPadding,
    elementSpacing,
    borderRadius,
    placeholderBorderRadius,
    borderWidth,
    focusedBorderWidth,
    placeholderMinHeight,
    elevation,
    placeholderElevation,
  );

  /// Create a copy of DSRoleSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleSpacingImplCopyWith<_$DSRoleSpacingImpl> get copyWith =>
      __$$DSRoleSpacingImplCopyWithImpl<_$DSRoleSpacingImpl>(this, _$identity);
}

abstract class _DSRoleSpacing implements DSRoleSpacing {
  const factory _DSRoleSpacing({
    final EdgeInsets componentPadding,
    final EdgeInsets placeholderPadding,
    final EdgeInsets debugHelperPadding,
    final double elementSpacing,
    final double borderRadius,
    final double placeholderBorderRadius,
    final double borderWidth,
    final double focusedBorderWidth,
    final double placeholderMinHeight,
    final double elevation,
    final double placeholderElevation,
  }) = _$DSRoleSpacingImpl;

  /// Padding del componente principal
  @override
  EdgeInsets get componentPadding;

  /// Padding del placeholder
  @override
  EdgeInsets get placeholderPadding;

  /// Padding de los helpers de debug
  @override
  EdgeInsets get debugHelperPadding;

  /// Margen entre elementos
  @override
  double get elementSpacing;

  /// Radio de bordes del componente
  @override
  double get borderRadius;

  /// Radio de bordes del placeholder
  @override
  double get placeholderBorderRadius;

  /// Ancho de bordes
  @override
  double get borderWidth;

  /// Ancho de bordes enfocados
  @override
  double get focusedBorderWidth;

  /// Altura mínima del placeholder
  @override
  double get placeholderMinHeight;

  /// Elevación del componente
  @override
  double get elevation;

  /// Elevación del placeholder
  @override
  double get placeholderElevation;

  /// Create a copy of DSRoleSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleSpacingImplCopyWith<_$DSRoleSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleTypography {
  /// Estilo para texto del placeholder
  TextStyle? get placeholderTextStyle => throw _privateConstructorUsedError;

  /// Estilo para texto de helpers de debug
  TextStyle? get debugTextStyle => throw _privateConstructorUsedError;

  /// Estilo para mensajes de error
  TextStyle? get errorTextStyle => throw _privateConstructorUsedError;

  /// Estilo para mensajes de warning
  TextStyle? get warningTextStyle => throw _privateConstructorUsedError;

  /// Estilo para mensajes de éxito
  TextStyle? get successTextStyle => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleTypographyCopyWith<DSRoleTypography> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleTypographyCopyWith<$Res> {
  factory $DSRoleTypographyCopyWith(
    DSRoleTypography value,
    $Res Function(DSRoleTypography) then,
  ) = _$DSRoleTypographyCopyWithImpl<$Res, DSRoleTypography>;
  @useResult
  $Res call({
    TextStyle? placeholderTextStyle,
    TextStyle? debugTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? warningTextStyle,
    TextStyle? successTextStyle,
  });
}

/// @nodoc
class _$DSRoleTypographyCopyWithImpl<$Res, $Val extends DSRoleTypography>
    implements $DSRoleTypographyCopyWith<$Res> {
  _$DSRoleTypographyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeholderTextStyle = freezed,
    Object? debugTextStyle = freezed,
    Object? errorTextStyle = freezed,
    Object? warningTextStyle = freezed,
    Object? successTextStyle = freezed,
  }) {
    return _then(
      _value.copyWith(
            placeholderTextStyle: freezed == placeholderTextStyle
                ? _value.placeholderTextStyle
                : placeholderTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            debugTextStyle: freezed == debugTextStyle
                ? _value.debugTextStyle
                : debugTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            errorTextStyle: freezed == errorTextStyle
                ? _value.errorTextStyle
                : errorTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            warningTextStyle: freezed == warningTextStyle
                ? _value.warningTextStyle
                : warningTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            successTextStyle: freezed == successTextStyle
                ? _value.successTextStyle
                : successTextStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleTypographyImplCopyWith<$Res>
    implements $DSRoleTypographyCopyWith<$Res> {
  factory _$$DSRoleTypographyImplCopyWith(
    _$DSRoleTypographyImpl value,
    $Res Function(_$DSRoleTypographyImpl) then,
  ) = __$$DSRoleTypographyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TextStyle? placeholderTextStyle,
    TextStyle? debugTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? warningTextStyle,
    TextStyle? successTextStyle,
  });
}

/// @nodoc
class __$$DSRoleTypographyImplCopyWithImpl<$Res>
    extends _$DSRoleTypographyCopyWithImpl<$Res, _$DSRoleTypographyImpl>
    implements _$$DSRoleTypographyImplCopyWith<$Res> {
  __$$DSRoleTypographyImplCopyWithImpl(
    _$DSRoleTypographyImpl _value,
    $Res Function(_$DSRoleTypographyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeholderTextStyle = freezed,
    Object? debugTextStyle = freezed,
    Object? errorTextStyle = freezed,
    Object? warningTextStyle = freezed,
    Object? successTextStyle = freezed,
  }) {
    return _then(
      _$DSRoleTypographyImpl(
        placeholderTextStyle: freezed == placeholderTextStyle
            ? _value.placeholderTextStyle
            : placeholderTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        debugTextStyle: freezed == debugTextStyle
            ? _value.debugTextStyle
            : debugTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        errorTextStyle: freezed == errorTextStyle
            ? _value.errorTextStyle
            : errorTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        warningTextStyle: freezed == warningTextStyle
            ? _value.warningTextStyle
            : warningTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        successTextStyle: freezed == successTextStyle
            ? _value.successTextStyle
            : successTextStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleTypographyImpl implements _DSRoleTypography {
  const _$DSRoleTypographyImpl({
    this.placeholderTextStyle,
    this.debugTextStyle,
    this.errorTextStyle,
    this.warningTextStyle,
    this.successTextStyle,
  });

  /// Estilo para texto del placeholder
  @override
  final TextStyle? placeholderTextStyle;

  /// Estilo para texto de helpers de debug
  @override
  final TextStyle? debugTextStyle;

  /// Estilo para mensajes de error
  @override
  final TextStyle? errorTextStyle;

  /// Estilo para mensajes de warning
  @override
  final TextStyle? warningTextStyle;

  /// Estilo para mensajes de éxito
  @override
  final TextStyle? successTextStyle;

  @override
  String toString() {
    return 'DSRoleTypography(placeholderTextStyle: $placeholderTextStyle, debugTextStyle: $debugTextStyle, errorTextStyle: $errorTextStyle, warningTextStyle: $warningTextStyle, successTextStyle: $successTextStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleTypographyImpl &&
            (identical(other.placeholderTextStyle, placeholderTextStyle) ||
                other.placeholderTextStyle == placeholderTextStyle) &&
            (identical(other.debugTextStyle, debugTextStyle) ||
                other.debugTextStyle == debugTextStyle) &&
            (identical(other.errorTextStyle, errorTextStyle) ||
                other.errorTextStyle == errorTextStyle) &&
            (identical(other.warningTextStyle, warningTextStyle) ||
                other.warningTextStyle == warningTextStyle) &&
            (identical(other.successTextStyle, successTextStyle) ||
                other.successTextStyle == successTextStyle));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    placeholderTextStyle,
    debugTextStyle,
    errorTextStyle,
    warningTextStyle,
    successTextStyle,
  );

  /// Create a copy of DSRoleTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleTypographyImplCopyWith<_$DSRoleTypographyImpl> get copyWith =>
      __$$DSRoleTypographyImplCopyWithImpl<_$DSRoleTypographyImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleTypography implements DSRoleTypography {
  const factory _DSRoleTypography({
    final TextStyle? placeholderTextStyle,
    final TextStyle? debugTextStyle,
    final TextStyle? errorTextStyle,
    final TextStyle? warningTextStyle,
    final TextStyle? successTextStyle,
  }) = _$DSRoleTypographyImpl;

  /// Estilo para texto del placeholder
  @override
  TextStyle? get placeholderTextStyle;

  /// Estilo para texto de helpers de debug
  @override
  TextStyle? get debugTextStyle;

  /// Estilo para mensajes de error
  @override
  TextStyle? get errorTextStyle;

  /// Estilo para mensajes de warning
  @override
  TextStyle? get warningTextStyle;

  /// Estilo para mensajes de éxito
  @override
  TextStyle? get successTextStyle;

  /// Create a copy of DSRoleTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleTypographyImplCopyWith<_$DSRoleTypographyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleAnimation {
  /// Duración de animaciones principales
  Duration get duration => throw _privateConstructorUsedError;

  /// Duración de animaciones de skeleton
  Duration get skeletonDuration => throw _privateConstructorUsedError;

  /// Duración de fade in/out
  Duration get fadeDuration => throw _privateConstructorUsedError;

  /// Curva de animación principal
  Curve get curve => throw _privateConstructorUsedError;

  /// Curva de animación de skeleton
  Curve get skeletonCurve => throw _privateConstructorUsedError;

  /// Curva de animación de fade
  Curve get fadeCurve => throw _privateConstructorUsedError;

  /// Si las animaciones están habilitadas
  bool get enabled => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleAnimationCopyWith<DSRoleAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleAnimationCopyWith<$Res> {
  factory $DSRoleAnimationCopyWith(
    DSRoleAnimation value,
    $Res Function(DSRoleAnimation) then,
  ) = _$DSRoleAnimationCopyWithImpl<$Res, DSRoleAnimation>;
  @useResult
  $Res call({
    Duration duration,
    Duration skeletonDuration,
    Duration fadeDuration,
    Curve curve,
    Curve skeletonCurve,
    Curve fadeCurve,
    bool enabled,
  });
}

/// @nodoc
class _$DSRoleAnimationCopyWithImpl<$Res, $Val extends DSRoleAnimation>
    implements $DSRoleAnimationCopyWith<$Res> {
  _$DSRoleAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? skeletonDuration = null,
    Object? fadeDuration = null,
    Object? curve = null,
    Object? skeletonCurve = null,
    Object? fadeCurve = null,
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
            fadeDuration: null == fadeDuration
                ? _value.fadeDuration
                : fadeDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            curve: null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            skeletonCurve: null == skeletonCurve
                ? _value.skeletonCurve
                : skeletonCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            fadeCurve: null == fadeCurve
                ? _value.fadeCurve
                : fadeCurve // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSRoleAnimationImplCopyWith<$Res>
    implements $DSRoleAnimationCopyWith<$Res> {
  factory _$$DSRoleAnimationImplCopyWith(
    _$DSRoleAnimationImpl value,
    $Res Function(_$DSRoleAnimationImpl) then,
  ) = __$$DSRoleAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Duration duration,
    Duration skeletonDuration,
    Duration fadeDuration,
    Curve curve,
    Curve skeletonCurve,
    Curve fadeCurve,
    bool enabled,
  });
}

/// @nodoc
class __$$DSRoleAnimationImplCopyWithImpl<$Res>
    extends _$DSRoleAnimationCopyWithImpl<$Res, _$DSRoleAnimationImpl>
    implements _$$DSRoleAnimationImplCopyWith<$Res> {
  __$$DSRoleAnimationImplCopyWithImpl(
    _$DSRoleAnimationImpl _value,
    $Res Function(_$DSRoleAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? skeletonDuration = null,
    Object? fadeDuration = null,
    Object? curve = null,
    Object? skeletonCurve = null,
    Object? fadeCurve = null,
    Object? enabled = null,
  }) {
    return _then(
      _$DSRoleAnimationImpl(
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        skeletonDuration: null == skeletonDuration
            ? _value.skeletonDuration
            : skeletonDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        fadeDuration: null == fadeDuration
            ? _value.fadeDuration
            : fadeDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        curve: null == curve
            ? _value.curve
            : curve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        skeletonCurve: null == skeletonCurve
            ? _value.skeletonCurve
            : skeletonCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        fadeCurve: null == fadeCurve
            ? _value.fadeCurve
            : fadeCurve // ignore: cast_nullable_to_non_nullable
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

class _$DSRoleAnimationImpl implements _DSRoleAnimation {
  const _$DSRoleAnimationImpl({
    this.duration = const Duration(milliseconds: 300),
    this.skeletonDuration = const Duration(milliseconds: 1200),
    this.fadeDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.skeletonCurve = Curves.easeInOut,
    this.fadeCurve = Curves.easeOut,
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

  /// Duración de fade in/out
  @override
  @JsonKey()
  final Duration fadeDuration;

  /// Curva de animación principal
  @override
  @JsonKey()
  final Curve curve;

  /// Curva de animación de skeleton
  @override
  @JsonKey()
  final Curve skeletonCurve;

  /// Curva de animación de fade
  @override
  @JsonKey()
  final Curve fadeCurve;

  /// Si las animaciones están habilitadas
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'DSRoleAnimation(duration: $duration, skeletonDuration: $skeletonDuration, fadeDuration: $fadeDuration, curve: $curve, skeletonCurve: $skeletonCurve, fadeCurve: $fadeCurve, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleAnimationImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.skeletonDuration, skeletonDuration) ||
                other.skeletonDuration == skeletonDuration) &&
            (identical(other.fadeDuration, fadeDuration) ||
                other.fadeDuration == fadeDuration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.skeletonCurve, skeletonCurve) ||
                other.skeletonCurve == skeletonCurve) &&
            (identical(other.fadeCurve, fadeCurve) ||
                other.fadeCurve == fadeCurve) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    skeletonDuration,
    fadeDuration,
    curve,
    skeletonCurve,
    fadeCurve,
    enabled,
  );

  /// Create a copy of DSRoleAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleAnimationImplCopyWith<_$DSRoleAnimationImpl> get copyWith =>
      __$$DSRoleAnimationImplCopyWithImpl<_$DSRoleAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleAnimation implements DSRoleAnimation {
  const factory _DSRoleAnimation({
    final Duration duration,
    final Duration skeletonDuration,
    final Duration fadeDuration,
    final Curve curve,
    final Curve skeletonCurve,
    final Curve fadeCurve,
    final bool enabled,
  }) = _$DSRoleAnimationImpl;

  /// Duración de animaciones principales
  @override
  Duration get duration;

  /// Duración de animaciones de skeleton
  @override
  Duration get skeletonDuration;

  /// Duración de fade in/out
  @override
  Duration get fadeDuration;

  /// Curva de animación principal
  @override
  Curve get curve;

  /// Curva de animación de skeleton
  @override
  Curve get skeletonCurve;

  /// Curva de animación de fade
  @override
  Curve get fadeCurve;

  /// Si las animaciones están habilitadas
  @override
  bool get enabled;

  /// Create a copy of DSRoleAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleAnimationImplCopyWith<_$DSRoleAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleBehavior {
  /// Modo de evaluación de roles
  DSRoleEvaluationMode get evaluationMode => throw _privateConstructorUsedError;

  /// Si debe cachear resultados de evaluación
  bool get cacheResults => throw _privateConstructorUsedError;

  /// Tiempo de cache en milisegundos
  int get cacheTimeMs => throw _privateConstructorUsedError;

  /// Si debe mostrar información de debugging en desarrollo
  bool get showDebugInfo => throw _privateConstructorUsedError;

  /// Si debe registrar accesos para auditoría
  bool get logAccess => throw _privateConstructorUsedError;

  /// Si debe validar roles de forma asíncrona
  bool get asyncValidation => throw _privateConstructorUsedError;

  /// Comportamiento cuando falla la validación
  DSRoleFailureBehavior get onFailure => throw _privateConstructorUsedError;

  /// Si debe mostrar loading durante validación asíncrona
  bool get showLoadingDuringValidation => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleBehaviorCopyWith<DSRoleBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleBehaviorCopyWith<$Res> {
  factory $DSRoleBehaviorCopyWith(
    DSRoleBehavior value,
    $Res Function(DSRoleBehavior) then,
  ) = _$DSRoleBehaviorCopyWithImpl<$Res, DSRoleBehavior>;
  @useResult
  $Res call({
    DSRoleEvaluationMode evaluationMode,
    bool cacheResults,
    int cacheTimeMs,
    bool showDebugInfo,
    bool logAccess,
    bool asyncValidation,
    DSRoleFailureBehavior onFailure,
    bool showLoadingDuringValidation,
  });
}

/// @nodoc
class _$DSRoleBehaviorCopyWithImpl<$Res, $Val extends DSRoleBehavior>
    implements $DSRoleBehaviorCopyWith<$Res> {
  _$DSRoleBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evaluationMode = null,
    Object? cacheResults = null,
    Object? cacheTimeMs = null,
    Object? showDebugInfo = null,
    Object? logAccess = null,
    Object? asyncValidation = null,
    Object? onFailure = null,
    Object? showLoadingDuringValidation = null,
  }) {
    return _then(
      _value.copyWith(
            evaluationMode: null == evaluationMode
                ? _value.evaluationMode
                : evaluationMode // ignore: cast_nullable_to_non_nullable
                      as DSRoleEvaluationMode,
            cacheResults: null == cacheResults
                ? _value.cacheResults
                : cacheResults // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheTimeMs: null == cacheTimeMs
                ? _value.cacheTimeMs
                : cacheTimeMs // ignore: cast_nullable_to_non_nullable
                      as int,
            showDebugInfo: null == showDebugInfo
                ? _value.showDebugInfo
                : showDebugInfo // ignore: cast_nullable_to_non_nullable
                      as bool,
            logAccess: null == logAccess
                ? _value.logAccess
                : logAccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            asyncValidation: null == asyncValidation
                ? _value.asyncValidation
                : asyncValidation // ignore: cast_nullable_to_non_nullable
                      as bool,
            onFailure: null == onFailure
                ? _value.onFailure
                : onFailure // ignore: cast_nullable_to_non_nullable
                      as DSRoleFailureBehavior,
            showLoadingDuringValidation: null == showLoadingDuringValidation
                ? _value.showLoadingDuringValidation
                : showLoadingDuringValidation // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleBehaviorImplCopyWith<$Res>
    implements $DSRoleBehaviorCopyWith<$Res> {
  factory _$$DSRoleBehaviorImplCopyWith(
    _$DSRoleBehaviorImpl value,
    $Res Function(_$DSRoleBehaviorImpl) then,
  ) = __$$DSRoleBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSRoleEvaluationMode evaluationMode,
    bool cacheResults,
    int cacheTimeMs,
    bool showDebugInfo,
    bool logAccess,
    bool asyncValidation,
    DSRoleFailureBehavior onFailure,
    bool showLoadingDuringValidation,
  });
}

/// @nodoc
class __$$DSRoleBehaviorImplCopyWithImpl<$Res>
    extends _$DSRoleBehaviorCopyWithImpl<$Res, _$DSRoleBehaviorImpl>
    implements _$$DSRoleBehaviorImplCopyWith<$Res> {
  __$$DSRoleBehaviorImplCopyWithImpl(
    _$DSRoleBehaviorImpl _value,
    $Res Function(_$DSRoleBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evaluationMode = null,
    Object? cacheResults = null,
    Object? cacheTimeMs = null,
    Object? showDebugInfo = null,
    Object? logAccess = null,
    Object? asyncValidation = null,
    Object? onFailure = null,
    Object? showLoadingDuringValidation = null,
  }) {
    return _then(
      _$DSRoleBehaviorImpl(
        evaluationMode: null == evaluationMode
            ? _value.evaluationMode
            : evaluationMode // ignore: cast_nullable_to_non_nullable
                  as DSRoleEvaluationMode,
        cacheResults: null == cacheResults
            ? _value.cacheResults
            : cacheResults // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheTimeMs: null == cacheTimeMs
            ? _value.cacheTimeMs
            : cacheTimeMs // ignore: cast_nullable_to_non_nullable
                  as int,
        showDebugInfo: null == showDebugInfo
            ? _value.showDebugInfo
            : showDebugInfo // ignore: cast_nullable_to_non_nullable
                  as bool,
        logAccess: null == logAccess
            ? _value.logAccess
            : logAccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        asyncValidation: null == asyncValidation
            ? _value.asyncValidation
            : asyncValidation // ignore: cast_nullable_to_non_nullable
                  as bool,
        onFailure: null == onFailure
            ? _value.onFailure
            : onFailure // ignore: cast_nullable_to_non_nullable
                  as DSRoleFailureBehavior,
        showLoadingDuringValidation: null == showLoadingDuringValidation
            ? _value.showLoadingDuringValidation
            : showLoadingDuringValidation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleBehaviorImpl implements _DSRoleBehavior {
  const _$DSRoleBehaviorImpl({
    this.evaluationMode = DSRoleEvaluationMode.any,
    this.cacheResults = true,
    this.cacheTimeMs = 30000,
    this.showDebugInfo = false,
    this.logAccess = false,
    this.asyncValidation = false,
    this.onFailure = DSRoleFailureBehavior.hide,
    this.showLoadingDuringValidation = true,
  });

  /// Modo de evaluación de roles
  @override
  @JsonKey()
  final DSRoleEvaluationMode evaluationMode;

  /// Si debe cachear resultados de evaluación
  @override
  @JsonKey()
  final bool cacheResults;

  /// Tiempo de cache en milisegundos
  @override
  @JsonKey()
  final int cacheTimeMs;

  /// Si debe mostrar información de debugging en desarrollo
  @override
  @JsonKey()
  final bool showDebugInfo;

  /// Si debe registrar accesos para auditoría
  @override
  @JsonKey()
  final bool logAccess;

  /// Si debe validar roles de forma asíncrona
  @override
  @JsonKey()
  final bool asyncValidation;

  /// Comportamiento cuando falla la validación
  @override
  @JsonKey()
  final DSRoleFailureBehavior onFailure;

  /// Si debe mostrar loading durante validación asíncrona
  @override
  @JsonKey()
  final bool showLoadingDuringValidation;

  @override
  String toString() {
    return 'DSRoleBehavior(evaluationMode: $evaluationMode, cacheResults: $cacheResults, cacheTimeMs: $cacheTimeMs, showDebugInfo: $showDebugInfo, logAccess: $logAccess, asyncValidation: $asyncValidation, onFailure: $onFailure, showLoadingDuringValidation: $showLoadingDuringValidation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleBehaviorImpl &&
            (identical(other.evaluationMode, evaluationMode) ||
                other.evaluationMode == evaluationMode) &&
            (identical(other.cacheResults, cacheResults) ||
                other.cacheResults == cacheResults) &&
            (identical(other.cacheTimeMs, cacheTimeMs) ||
                other.cacheTimeMs == cacheTimeMs) &&
            (identical(other.showDebugInfo, showDebugInfo) ||
                other.showDebugInfo == showDebugInfo) &&
            (identical(other.logAccess, logAccess) ||
                other.logAccess == logAccess) &&
            (identical(other.asyncValidation, asyncValidation) ||
                other.asyncValidation == asyncValidation) &&
            (identical(other.onFailure, onFailure) ||
                other.onFailure == onFailure) &&
            (identical(
                  other.showLoadingDuringValidation,
                  showLoadingDuringValidation,
                ) ||
                other.showLoadingDuringValidation ==
                    showLoadingDuringValidation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    evaluationMode,
    cacheResults,
    cacheTimeMs,
    showDebugInfo,
    logAccess,
    asyncValidation,
    onFailure,
    showLoadingDuringValidation,
  );

  /// Create a copy of DSRoleBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleBehaviorImplCopyWith<_$DSRoleBehaviorImpl> get copyWith =>
      __$$DSRoleBehaviorImplCopyWithImpl<_$DSRoleBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleBehavior implements DSRoleBehavior {
  const factory _DSRoleBehavior({
    final DSRoleEvaluationMode evaluationMode,
    final bool cacheResults,
    final int cacheTimeMs,
    final bool showDebugInfo,
    final bool logAccess,
    final bool asyncValidation,
    final DSRoleFailureBehavior onFailure,
    final bool showLoadingDuringValidation,
  }) = _$DSRoleBehaviorImpl;

  /// Modo de evaluación de roles
  @override
  DSRoleEvaluationMode get evaluationMode;

  /// Si debe cachear resultados de evaluación
  @override
  bool get cacheResults;

  /// Tiempo de cache en milisegundos
  @override
  int get cacheTimeMs;

  /// Si debe mostrar información de debugging en desarrollo
  @override
  bool get showDebugInfo;

  /// Si debe registrar accesos para auditoría
  @override
  bool get logAccess;

  /// Si debe validar roles de forma asíncrona
  @override
  bool get asyncValidation;

  /// Comportamiento cuando falla la validación
  @override
  DSRoleFailureBehavior get onFailure;

  /// Si debe mostrar loading durante validación asíncrona
  @override
  bool get showLoadingDuringValidation;

  /// Create a copy of DSRoleBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleBehaviorImplCopyWith<_$DSRoleBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleA11yConfig {
  /// Si la accesibilidad está habilitada
  bool get enabled => throw _privateConstructorUsedError;

  /// Soporte para screen readers
  bool get supportScreenReader => throw _privateConstructorUsedError;

  /// Si debe anunciar cambios de visibilidad
  bool get announceVisibilityChanges => throw _privateConstructorUsedError;

  /// Si debe anunciar información de roles en debug
  bool get announceDebugInfo => throw _privateConstructorUsedError;

  /// Labels semánticos habilitados
  bool get enableSemanticLabels => throw _privateConstructorUsedError;

  /// Hints habilitados
  bool get enableHints => throw _privateConstructorUsedError;

  /// Label semántico para contenido oculto por roles
  String get hiddenContentLabel => throw _privateConstructorUsedError;

  /// Label semántico para contenido en carga
  String get loadingContentLabel => throw _privateConstructorUsedError;

  /// Label semántico para placeholder
  String get placeholderLabel => throw _privateConstructorUsedError;

  /// Hint para explicar por qué el contenido está oculto
  String get permissionDeniedHint => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleA11yConfigCopyWith<DSRoleA11yConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleA11yConfigCopyWith<$Res> {
  factory $DSRoleA11yConfigCopyWith(
    DSRoleA11yConfig value,
    $Res Function(DSRoleA11yConfig) then,
  ) = _$DSRoleA11yConfigCopyWithImpl<$Res, DSRoleA11yConfig>;
  @useResult
  $Res call({
    bool enabled,
    bool supportScreenReader,
    bool announceVisibilityChanges,
    bool announceDebugInfo,
    bool enableSemanticLabels,
    bool enableHints,
    String hiddenContentLabel,
    String loadingContentLabel,
    String placeholderLabel,
    String permissionDeniedHint,
  });
}

/// @nodoc
class _$DSRoleA11yConfigCopyWithImpl<$Res, $Val extends DSRoleA11yConfig>
    implements $DSRoleA11yConfigCopyWith<$Res> {
  _$DSRoleA11yConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? supportScreenReader = null,
    Object? announceVisibilityChanges = null,
    Object? announceDebugInfo = null,
    Object? enableSemanticLabels = null,
    Object? enableHints = null,
    Object? hiddenContentLabel = null,
    Object? loadingContentLabel = null,
    Object? placeholderLabel = null,
    Object? permissionDeniedHint = null,
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
            announceVisibilityChanges: null == announceVisibilityChanges
                ? _value.announceVisibilityChanges
                : announceVisibilityChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            announceDebugInfo: null == announceDebugInfo
                ? _value.announceDebugInfo
                : announceDebugInfo // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableSemanticLabels: null == enableSemanticLabels
                ? _value.enableSemanticLabels
                : enableSemanticLabels // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHints: null == enableHints
                ? _value.enableHints
                : enableHints // ignore: cast_nullable_to_non_nullable
                      as bool,
            hiddenContentLabel: null == hiddenContentLabel
                ? _value.hiddenContentLabel
                : hiddenContentLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            loadingContentLabel: null == loadingContentLabel
                ? _value.loadingContentLabel
                : loadingContentLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            placeholderLabel: null == placeholderLabel
                ? _value.placeholderLabel
                : placeholderLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            permissionDeniedHint: null == permissionDeniedHint
                ? _value.permissionDeniedHint
                : permissionDeniedHint // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleA11yConfigImplCopyWith<$Res>
    implements $DSRoleA11yConfigCopyWith<$Res> {
  factory _$$DSRoleA11yConfigImplCopyWith(
    _$DSRoleA11yConfigImpl value,
    $Res Function(_$DSRoleA11yConfigImpl) then,
  ) = __$$DSRoleA11yConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    bool supportScreenReader,
    bool announceVisibilityChanges,
    bool announceDebugInfo,
    bool enableSemanticLabels,
    bool enableHints,
    String hiddenContentLabel,
    String loadingContentLabel,
    String placeholderLabel,
    String permissionDeniedHint,
  });
}

/// @nodoc
class __$$DSRoleA11yConfigImplCopyWithImpl<$Res>
    extends _$DSRoleA11yConfigCopyWithImpl<$Res, _$DSRoleA11yConfigImpl>
    implements _$$DSRoleA11yConfigImplCopyWith<$Res> {
  __$$DSRoleA11yConfigImplCopyWithImpl(
    _$DSRoleA11yConfigImpl _value,
    $Res Function(_$DSRoleA11yConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? supportScreenReader = null,
    Object? announceVisibilityChanges = null,
    Object? announceDebugInfo = null,
    Object? enableSemanticLabels = null,
    Object? enableHints = null,
    Object? hiddenContentLabel = null,
    Object? loadingContentLabel = null,
    Object? placeholderLabel = null,
    Object? permissionDeniedHint = null,
  }) {
    return _then(
      _$DSRoleA11yConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        supportScreenReader: null == supportScreenReader
            ? _value.supportScreenReader
            : supportScreenReader // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceVisibilityChanges: null == announceVisibilityChanges
            ? _value.announceVisibilityChanges
            : announceVisibilityChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceDebugInfo: null == announceDebugInfo
            ? _value.announceDebugInfo
            : announceDebugInfo // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableSemanticLabels: null == enableSemanticLabels
            ? _value.enableSemanticLabels
            : enableSemanticLabels // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHints: null == enableHints
            ? _value.enableHints
            : enableHints // ignore: cast_nullable_to_non_nullable
                  as bool,
        hiddenContentLabel: null == hiddenContentLabel
            ? _value.hiddenContentLabel
            : hiddenContentLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        loadingContentLabel: null == loadingContentLabel
            ? _value.loadingContentLabel
            : loadingContentLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        placeholderLabel: null == placeholderLabel
            ? _value.placeholderLabel
            : placeholderLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        permissionDeniedHint: null == permissionDeniedHint
            ? _value.permissionDeniedHint
            : permissionDeniedHint // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleA11yConfigImpl implements _DSRoleA11yConfig {
  const _$DSRoleA11yConfigImpl({
    this.enabled = true,
    this.supportScreenReader = true,
    this.announceVisibilityChanges = false,
    this.announceDebugInfo = false,
    this.enableSemanticLabels = true,
    this.enableHints = true,
    this.hiddenContentLabel = 'Contenido no disponible para su rol',
    this.loadingContentLabel = 'Verificando permisos',
    this.placeholderLabel = 'Contenido restringido',
    this.permissionDeniedHint =
        'No tiene los permisos necesarios para ver este contenido',
  });

  /// Si la accesibilidad está habilitada
  @override
  @JsonKey()
  final bool enabled;

  /// Soporte para screen readers
  @override
  @JsonKey()
  final bool supportScreenReader;

  /// Si debe anunciar cambios de visibilidad
  @override
  @JsonKey()
  final bool announceVisibilityChanges;

  /// Si debe anunciar información de roles en debug
  @override
  @JsonKey()
  final bool announceDebugInfo;

  /// Labels semánticos habilitados
  @override
  @JsonKey()
  final bool enableSemanticLabels;

  /// Hints habilitados
  @override
  @JsonKey()
  final bool enableHints;

  /// Label semántico para contenido oculto por roles
  @override
  @JsonKey()
  final String hiddenContentLabel;

  /// Label semántico para contenido en carga
  @override
  @JsonKey()
  final String loadingContentLabel;

  /// Label semántico para placeholder
  @override
  @JsonKey()
  final String placeholderLabel;

  /// Hint para explicar por qué el contenido está oculto
  @override
  @JsonKey()
  final String permissionDeniedHint;

  @override
  String toString() {
    return 'DSRoleA11yConfig(enabled: $enabled, supportScreenReader: $supportScreenReader, announceVisibilityChanges: $announceVisibilityChanges, announceDebugInfo: $announceDebugInfo, enableSemanticLabels: $enableSemanticLabels, enableHints: $enableHints, hiddenContentLabel: $hiddenContentLabel, loadingContentLabel: $loadingContentLabel, placeholderLabel: $placeholderLabel, permissionDeniedHint: $permissionDeniedHint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleA11yConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.supportScreenReader, supportScreenReader) ||
                other.supportScreenReader == supportScreenReader) &&
            (identical(
                  other.announceVisibilityChanges,
                  announceVisibilityChanges,
                ) ||
                other.announceVisibilityChanges == announceVisibilityChanges) &&
            (identical(other.announceDebugInfo, announceDebugInfo) ||
                other.announceDebugInfo == announceDebugInfo) &&
            (identical(other.enableSemanticLabels, enableSemanticLabels) ||
                other.enableSemanticLabels == enableSemanticLabels) &&
            (identical(other.enableHints, enableHints) ||
                other.enableHints == enableHints) &&
            (identical(other.hiddenContentLabel, hiddenContentLabel) ||
                other.hiddenContentLabel == hiddenContentLabel) &&
            (identical(other.loadingContentLabel, loadingContentLabel) ||
                other.loadingContentLabel == loadingContentLabel) &&
            (identical(other.placeholderLabel, placeholderLabel) ||
                other.placeholderLabel == placeholderLabel) &&
            (identical(other.permissionDeniedHint, permissionDeniedHint) ||
                other.permissionDeniedHint == permissionDeniedHint));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    supportScreenReader,
    announceVisibilityChanges,
    announceDebugInfo,
    enableSemanticLabels,
    enableHints,
    hiddenContentLabel,
    loadingContentLabel,
    placeholderLabel,
    permissionDeniedHint,
  );

  /// Create a copy of DSRoleA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleA11yConfigImplCopyWith<_$DSRoleA11yConfigImpl> get copyWith =>
      __$$DSRoleA11yConfigImplCopyWithImpl<_$DSRoleA11yConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleA11yConfig implements DSRoleA11yConfig {
  const factory _DSRoleA11yConfig({
    final bool enabled,
    final bool supportScreenReader,
    final bool announceVisibilityChanges,
    final bool announceDebugInfo,
    final bool enableSemanticLabels,
    final bool enableHints,
    final String hiddenContentLabel,
    final String loadingContentLabel,
    final String placeholderLabel,
    final String permissionDeniedHint,
  }) = _$DSRoleA11yConfigImpl;

  /// Si la accesibilidad está habilitada
  @override
  bool get enabled;

  /// Soporte para screen readers
  @override
  bool get supportScreenReader;

  /// Si debe anunciar cambios de visibilidad
  @override
  bool get announceVisibilityChanges;

  /// Si debe anunciar información de roles en debug
  @override
  bool get announceDebugInfo;

  /// Labels semánticos habilitados
  @override
  bool get enableSemanticLabels;

  /// Hints habilitados
  @override
  bool get enableHints;

  /// Label semántico para contenido oculto por roles
  @override
  String get hiddenContentLabel;

  /// Label semántico para contenido en carga
  @override
  String get loadingContentLabel;

  /// Label semántico para placeholder
  @override
  String get placeholderLabel;

  /// Hint para explicar por qué el contenido está oculto
  @override
  String get permissionDeniedHint;

  /// Create a copy of DSRoleA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleA11yConfigImplCopyWith<_$DSRoleA11yConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleContext {
  /// Usuario actual
  String get userId => throw _privateConstructorUsedError;

  /// Roles del usuario actual
  List<DSRole> get userRoles => throw _privateConstructorUsedError;

  /// Permisos adicionales del usuario
  List<String> get userPermissions => throw _privateConstructorUsedError;

  /// Contexto de la aplicación
  Map<String, dynamic> get appContext => throw _privateConstructorUsedError;

  /// Timestamp de la evaluación
  DateTime? get evaluatedAt => throw _privateConstructorUsedError;

  /// Si la evaluación fue exitosa
  bool get isValid => throw _privateConstructorUsedError;

  /// Información adicional de debugging
  Map<String, dynamic> get debugInfo => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleContextCopyWith<DSRoleContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleContextCopyWith<$Res> {
  factory $DSRoleContextCopyWith(
    DSRoleContext value,
    $Res Function(DSRoleContext) then,
  ) = _$DSRoleContextCopyWithImpl<$Res, DSRoleContext>;
  @useResult
  $Res call({
    String userId,
    List<DSRole> userRoles,
    List<String> userPermissions,
    Map<String, dynamic> appContext,
    DateTime? evaluatedAt,
    bool isValid,
    Map<String, dynamic> debugInfo,
  });
}

/// @nodoc
class _$DSRoleContextCopyWithImpl<$Res, $Val extends DSRoleContext>
    implements $DSRoleContextCopyWith<$Res> {
  _$DSRoleContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userRoles = null,
    Object? userPermissions = null,
    Object? appContext = null,
    Object? evaluatedAt = freezed,
    Object? isValid = null,
    Object? debugInfo = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            userRoles: null == userRoles
                ? _value.userRoles
                : userRoles // ignore: cast_nullable_to_non_nullable
                      as List<DSRole>,
            userPermissions: null == userPermissions
                ? _value.userPermissions
                : userPermissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            appContext: null == appContext
                ? _value.appContext
                : appContext // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            evaluatedAt: freezed == evaluatedAt
                ? _value.evaluatedAt
                : evaluatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            debugInfo: null == debugInfo
                ? _value.debugInfo
                : debugInfo // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleContextImplCopyWith<$Res>
    implements $DSRoleContextCopyWith<$Res> {
  factory _$$DSRoleContextImplCopyWith(
    _$DSRoleContextImpl value,
    $Res Function(_$DSRoleContextImpl) then,
  ) = __$$DSRoleContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    List<DSRole> userRoles,
    List<String> userPermissions,
    Map<String, dynamic> appContext,
    DateTime? evaluatedAt,
    bool isValid,
    Map<String, dynamic> debugInfo,
  });
}

/// @nodoc
class __$$DSRoleContextImplCopyWithImpl<$Res>
    extends _$DSRoleContextCopyWithImpl<$Res, _$DSRoleContextImpl>
    implements _$$DSRoleContextImplCopyWith<$Res> {
  __$$DSRoleContextImplCopyWithImpl(
    _$DSRoleContextImpl _value,
    $Res Function(_$DSRoleContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userRoles = null,
    Object? userPermissions = null,
    Object? appContext = null,
    Object? evaluatedAt = freezed,
    Object? isValid = null,
    Object? debugInfo = null,
  }) {
    return _then(
      _$DSRoleContextImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        userRoles: null == userRoles
            ? _value._userRoles
            : userRoles // ignore: cast_nullable_to_non_nullable
                  as List<DSRole>,
        userPermissions: null == userPermissions
            ? _value._userPermissions
            : userPermissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        appContext: null == appContext
            ? _value._appContext
            : appContext // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        evaluatedAt: freezed == evaluatedAt
            ? _value.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        debugInfo: null == debugInfo
            ? _value._debugInfo
            : debugInfo // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleContextImpl implements _DSRoleContext {
  const _$DSRoleContextImpl({
    required this.userId,
    final List<DSRole> userRoles = const [],
    final List<String> userPermissions = const [],
    final Map<String, dynamic> appContext = const {},
    this.evaluatedAt,
    this.isValid = false,
    final Map<String, dynamic> debugInfo = const {},
  }) : _userRoles = userRoles,
       _userPermissions = userPermissions,
       _appContext = appContext,
       _debugInfo = debugInfo;

  /// Usuario actual
  @override
  final String userId;

  /// Roles del usuario actual
  final List<DSRole> _userRoles;

  /// Roles del usuario actual
  @override
  @JsonKey()
  List<DSRole> get userRoles {
    if (_userRoles is EqualUnmodifiableListView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userRoles);
  }

  /// Permisos adicionales del usuario
  final List<String> _userPermissions;

  /// Permisos adicionales del usuario
  @override
  @JsonKey()
  List<String> get userPermissions {
    if (_userPermissions is EqualUnmodifiableListView) return _userPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPermissions);
  }

  /// Contexto de la aplicación
  final Map<String, dynamic> _appContext;

  /// Contexto de la aplicación
  @override
  @JsonKey()
  Map<String, dynamic> get appContext {
    if (_appContext is EqualUnmodifiableMapView) return _appContext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_appContext);
  }

  /// Timestamp de la evaluación
  @override
  final DateTime? evaluatedAt;

  /// Si la evaluación fue exitosa
  @override
  @JsonKey()
  final bool isValid;

  /// Información adicional de debugging
  final Map<String, dynamic> _debugInfo;

  /// Información adicional de debugging
  @override
  @JsonKey()
  Map<String, dynamic> get debugInfo {
    if (_debugInfo is EqualUnmodifiableMapView) return _debugInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_debugInfo);
  }

  @override
  String toString() {
    return 'DSRoleContext(userId: $userId, userRoles: $userRoles, userPermissions: $userPermissions, appContext: $appContext, evaluatedAt: $evaluatedAt, isValid: $isValid, debugInfo: $debugInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleContextImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._userRoles,
              _userRoles,
            ) &&
            const DeepCollectionEquality().equals(
              other._userPermissions,
              _userPermissions,
            ) &&
            const DeepCollectionEquality().equals(
              other._appContext,
              _appContext,
            ) &&
            (identical(other.evaluatedAt, evaluatedAt) ||
                other.evaluatedAt == evaluatedAt) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality().equals(
              other._debugInfo,
              _debugInfo,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    const DeepCollectionEquality().hash(_userRoles),
    const DeepCollectionEquality().hash(_userPermissions),
    const DeepCollectionEquality().hash(_appContext),
    evaluatedAt,
    isValid,
    const DeepCollectionEquality().hash(_debugInfo),
  );

  /// Create a copy of DSRoleContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleContextImplCopyWith<_$DSRoleContextImpl> get copyWith =>
      __$$DSRoleContextImplCopyWithImpl<_$DSRoleContextImpl>(this, _$identity);
}

abstract class _DSRoleContext implements DSRoleContext {
  const factory _DSRoleContext({
    required final String userId,
    final List<DSRole> userRoles,
    final List<String> userPermissions,
    final Map<String, dynamic> appContext,
    final DateTime? evaluatedAt,
    final bool isValid,
    final Map<String, dynamic> debugInfo,
  }) = _$DSRoleContextImpl;

  /// Usuario actual
  @override
  String get userId;

  /// Roles del usuario actual
  @override
  List<DSRole> get userRoles;

  /// Permisos adicionales del usuario
  @override
  List<String> get userPermissions;

  /// Contexto de la aplicación
  @override
  Map<String, dynamic> get appContext;

  /// Timestamp de la evaluación
  @override
  DateTime? get evaluatedAt;

  /// Si la evaluación fue exitosa
  @override
  bool get isValid;

  /// Información adicional de debugging
  @override
  Map<String, dynamic> get debugInfo;

  /// Create a copy of DSRoleContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleContextImplCopyWith<_$DSRoleContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleEvaluationResult {
  /// Si el usuario tiene acceso
  bool get hasAccess => throw _privateConstructorUsedError;

  /// Alias para hasAccess (compatibilidad)
  bool? get isVisible => throw _privateConstructorUsedError;

  /// Error de validación si aplica
  DSRoleValidationError? get error => throw _privateConstructorUsedError;

  /// Roles que coincidieron
  List<DSRole> get matchedRoles => throw _privateConstructorUsedError;

  /// Roles que no coincidieron
  List<DSRole> get unmatchedRoles => throw _privateConstructorUsedError;

  /// Permisos que coincidieron
  List<String> get matchedPermissions => throw _privateConstructorUsedError;

  /// Razón por la que se negó el acceso (si aplica)
  String? get denialReason => throw _privateConstructorUsedError;

  /// Información de debugging
  Map<String, dynamic> get debugInfo => throw _privateConstructorUsedError;

  /// Timestamp de la evaluación
  DateTime? get evaluatedAt => throw _privateConstructorUsedError;

  /// Tiempo que tomó la evaluación en milisegundos
  int? get evaluationTimeMs => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleEvaluationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleEvaluationResultCopyWith<DSRoleEvaluationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleEvaluationResultCopyWith<$Res> {
  factory $DSRoleEvaluationResultCopyWith(
    DSRoleEvaluationResult value,
    $Res Function(DSRoleEvaluationResult) then,
  ) = _$DSRoleEvaluationResultCopyWithImpl<$Res, DSRoleEvaluationResult>;
  @useResult
  $Res call({
    bool hasAccess,
    bool? isVisible,
    DSRoleValidationError? error,
    List<DSRole> matchedRoles,
    List<DSRole> unmatchedRoles,
    List<String> matchedPermissions,
    String? denialReason,
    Map<String, dynamic> debugInfo,
    DateTime? evaluatedAt,
    int? evaluationTimeMs,
  });

  $DSRoleValidationErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$DSRoleEvaluationResultCopyWithImpl<
  $Res,
  $Val extends DSRoleEvaluationResult
>
    implements $DSRoleEvaluationResultCopyWith<$Res> {
  _$DSRoleEvaluationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleEvaluationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasAccess = null,
    Object? isVisible = freezed,
    Object? error = freezed,
    Object? matchedRoles = null,
    Object? unmatchedRoles = null,
    Object? matchedPermissions = null,
    Object? denialReason = freezed,
    Object? debugInfo = null,
    Object? evaluatedAt = freezed,
    Object? evaluationTimeMs = freezed,
  }) {
    return _then(
      _value.copyWith(
            hasAccess: null == hasAccess
                ? _value.hasAccess
                : hasAccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVisible: freezed == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as DSRoleValidationError?,
            matchedRoles: null == matchedRoles
                ? _value.matchedRoles
                : matchedRoles // ignore: cast_nullable_to_non_nullable
                      as List<DSRole>,
            unmatchedRoles: null == unmatchedRoles
                ? _value.unmatchedRoles
                : unmatchedRoles // ignore: cast_nullable_to_non_nullable
                      as List<DSRole>,
            matchedPermissions: null == matchedPermissions
                ? _value.matchedPermissions
                : matchedPermissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            denialReason: freezed == denialReason
                ? _value.denialReason
                : denialReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            debugInfo: null == debugInfo
                ? _value.debugInfo
                : debugInfo // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            evaluatedAt: freezed == evaluatedAt
                ? _value.evaluatedAt
                : evaluatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            evaluationTimeMs: freezed == evaluationTimeMs
                ? _value.evaluationTimeMs
                : evaluationTimeMs // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSRoleEvaluationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleValidationErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $DSRoleValidationErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSRoleEvaluationResultImplCopyWith<$Res>
    implements $DSRoleEvaluationResultCopyWith<$Res> {
  factory _$$DSRoleEvaluationResultImplCopyWith(
    _$DSRoleEvaluationResultImpl value,
    $Res Function(_$DSRoleEvaluationResultImpl) then,
  ) = __$$DSRoleEvaluationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool hasAccess,
    bool? isVisible,
    DSRoleValidationError? error,
    List<DSRole> matchedRoles,
    List<DSRole> unmatchedRoles,
    List<String> matchedPermissions,
    String? denialReason,
    Map<String, dynamic> debugInfo,
    DateTime? evaluatedAt,
    int? evaluationTimeMs,
  });

  @override
  $DSRoleValidationErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$DSRoleEvaluationResultImplCopyWithImpl<$Res>
    extends
        _$DSRoleEvaluationResultCopyWithImpl<$Res, _$DSRoleEvaluationResultImpl>
    implements _$$DSRoleEvaluationResultImplCopyWith<$Res> {
  __$$DSRoleEvaluationResultImplCopyWithImpl(
    _$DSRoleEvaluationResultImpl _value,
    $Res Function(_$DSRoleEvaluationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleEvaluationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasAccess = null,
    Object? isVisible = freezed,
    Object? error = freezed,
    Object? matchedRoles = null,
    Object? unmatchedRoles = null,
    Object? matchedPermissions = null,
    Object? denialReason = freezed,
    Object? debugInfo = null,
    Object? evaluatedAt = freezed,
    Object? evaluationTimeMs = freezed,
  }) {
    return _then(
      _$DSRoleEvaluationResultImpl(
        hasAccess: null == hasAccess
            ? _value.hasAccess
            : hasAccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVisible: freezed == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as DSRoleValidationError?,
        matchedRoles: null == matchedRoles
            ? _value._matchedRoles
            : matchedRoles // ignore: cast_nullable_to_non_nullable
                  as List<DSRole>,
        unmatchedRoles: null == unmatchedRoles
            ? _value._unmatchedRoles
            : unmatchedRoles // ignore: cast_nullable_to_non_nullable
                  as List<DSRole>,
        matchedPermissions: null == matchedPermissions
            ? _value._matchedPermissions
            : matchedPermissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        denialReason: freezed == denialReason
            ? _value.denialReason
            : denialReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        debugInfo: null == debugInfo
            ? _value._debugInfo
            : debugInfo // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        evaluatedAt: freezed == evaluatedAt
            ? _value.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        evaluationTimeMs: freezed == evaluationTimeMs
            ? _value.evaluationTimeMs
            : evaluationTimeMs // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleEvaluationResultImpl implements _DSRoleEvaluationResult {
  const _$DSRoleEvaluationResultImpl({
    required this.hasAccess,
    this.isVisible,
    this.error,
    final List<DSRole> matchedRoles = const [],
    final List<DSRole> unmatchedRoles = const [],
    final List<String> matchedPermissions = const [],
    this.denialReason,
    final Map<String, dynamic> debugInfo = const {},
    this.evaluatedAt,
    this.evaluationTimeMs,
  }) : _matchedRoles = matchedRoles,
       _unmatchedRoles = unmatchedRoles,
       _matchedPermissions = matchedPermissions,
       _debugInfo = debugInfo;

  /// Si el usuario tiene acceso
  @override
  final bool hasAccess;

  /// Alias para hasAccess (compatibilidad)
  @override
  final bool? isVisible;

  /// Error de validación si aplica
  @override
  final DSRoleValidationError? error;

  /// Roles que coincidieron
  final List<DSRole> _matchedRoles;

  /// Roles que coincidieron
  @override
  @JsonKey()
  List<DSRole> get matchedRoles {
    if (_matchedRoles is EqualUnmodifiableListView) return _matchedRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedRoles);
  }

  /// Roles que no coincidieron
  final List<DSRole> _unmatchedRoles;

  /// Roles que no coincidieron
  @override
  @JsonKey()
  List<DSRole> get unmatchedRoles {
    if (_unmatchedRoles is EqualUnmodifiableListView) return _unmatchedRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unmatchedRoles);
  }

  /// Permisos que coincidieron
  final List<String> _matchedPermissions;

  /// Permisos que coincidieron
  @override
  @JsonKey()
  List<String> get matchedPermissions {
    if (_matchedPermissions is EqualUnmodifiableListView)
      return _matchedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedPermissions);
  }

  /// Razón por la que se negó el acceso (si aplica)
  @override
  final String? denialReason;

  /// Información de debugging
  final Map<String, dynamic> _debugInfo;

  /// Información de debugging
  @override
  @JsonKey()
  Map<String, dynamic> get debugInfo {
    if (_debugInfo is EqualUnmodifiableMapView) return _debugInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_debugInfo);
  }

  /// Timestamp de la evaluación
  @override
  final DateTime? evaluatedAt;

  /// Tiempo que tomó la evaluación en milisegundos
  @override
  final int? evaluationTimeMs;

  @override
  String toString() {
    return 'DSRoleEvaluationResult(hasAccess: $hasAccess, isVisible: $isVisible, error: $error, matchedRoles: $matchedRoles, unmatchedRoles: $unmatchedRoles, matchedPermissions: $matchedPermissions, denialReason: $denialReason, debugInfo: $debugInfo, evaluatedAt: $evaluatedAt, evaluationTimeMs: $evaluationTimeMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleEvaluationResultImpl &&
            (identical(other.hasAccess, hasAccess) ||
                other.hasAccess == hasAccess) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(
              other._matchedRoles,
              _matchedRoles,
            ) &&
            const DeepCollectionEquality().equals(
              other._unmatchedRoles,
              _unmatchedRoles,
            ) &&
            const DeepCollectionEquality().equals(
              other._matchedPermissions,
              _matchedPermissions,
            ) &&
            (identical(other.denialReason, denialReason) ||
                other.denialReason == denialReason) &&
            const DeepCollectionEquality().equals(
              other._debugInfo,
              _debugInfo,
            ) &&
            (identical(other.evaluatedAt, evaluatedAt) ||
                other.evaluatedAt == evaluatedAt) &&
            (identical(other.evaluationTimeMs, evaluationTimeMs) ||
                other.evaluationTimeMs == evaluationTimeMs));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasAccess,
    isVisible,
    error,
    const DeepCollectionEquality().hash(_matchedRoles),
    const DeepCollectionEquality().hash(_unmatchedRoles),
    const DeepCollectionEquality().hash(_matchedPermissions),
    denialReason,
    const DeepCollectionEquality().hash(_debugInfo),
    evaluatedAt,
    evaluationTimeMs,
  );

  /// Create a copy of DSRoleEvaluationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleEvaluationResultImplCopyWith<_$DSRoleEvaluationResultImpl>
  get copyWith =>
      __$$DSRoleEvaluationResultImplCopyWithImpl<_$DSRoleEvaluationResultImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleEvaluationResult implements DSRoleEvaluationResult {
  const factory _DSRoleEvaluationResult({
    required final bool hasAccess,
    final bool? isVisible,
    final DSRoleValidationError? error,
    final List<DSRole> matchedRoles,
    final List<DSRole> unmatchedRoles,
    final List<String> matchedPermissions,
    final String? denialReason,
    final Map<String, dynamic> debugInfo,
    final DateTime? evaluatedAt,
    final int? evaluationTimeMs,
  }) = _$DSRoleEvaluationResultImpl;

  /// Si el usuario tiene acceso
  @override
  bool get hasAccess;

  /// Alias para hasAccess (compatibilidad)
  @override
  bool? get isVisible;

  /// Error de validación si aplica
  @override
  DSRoleValidationError? get error;

  /// Roles que coincidieron
  @override
  List<DSRole> get matchedRoles;

  /// Roles que no coincidieron
  @override
  List<DSRole> get unmatchedRoles;

  /// Permisos que coincidieron
  @override
  List<String> get matchedPermissions;

  /// Razón por la que se negó el acceso (si aplica)
  @override
  String? get denialReason;

  /// Información de debugging
  @override
  Map<String, dynamic> get debugInfo;

  /// Timestamp de la evaluación
  @override
  DateTime? get evaluatedAt;

  /// Tiempo que tomó la evaluación en milisegundos
  @override
  int? get evaluationTimeMs;

  /// Create a copy of DSRoleEvaluationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleEvaluationResultImplCopyWith<_$DSRoleEvaluationResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleValidationError {
  DSRoleErrorType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<DSRole>? get requiredRoles => throw _privateConstructorUsedError;
  List<DSRole>? get userRoles => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleValidationErrorCopyWith<DSRoleValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleValidationErrorCopyWith<$Res> {
  factory $DSRoleValidationErrorCopyWith(
    DSRoleValidationError value,
    $Res Function(DSRoleValidationError) then,
  ) = _$DSRoleValidationErrorCopyWithImpl<$Res, DSRoleValidationError>;
  @useResult
  $Res call({
    DSRoleErrorType type,
    String message,
    List<DSRole>? requiredRoles,
    List<DSRole>? userRoles,
    String? code,
    Map<String, dynamic>? details,
  });
}

/// @nodoc
class _$DSRoleValidationErrorCopyWithImpl<
  $Res,
  $Val extends DSRoleValidationError
>
    implements $DSRoleValidationErrorCopyWith<$Res> {
  _$DSRoleValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? requiredRoles = freezed,
    Object? userRoles = freezed,
    Object? code = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSRoleErrorType,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            requiredRoles: freezed == requiredRoles
                ? _value.requiredRoles
                : requiredRoles // ignore: cast_nullable_to_non_nullable
                      as List<DSRole>?,
            userRoles: freezed == userRoles
                ? _value.userRoles
                : userRoles // ignore: cast_nullable_to_non_nullable
                      as List<DSRole>?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleValidationErrorImplCopyWith<$Res>
    implements $DSRoleValidationErrorCopyWith<$Res> {
  factory _$$DSRoleValidationErrorImplCopyWith(
    _$DSRoleValidationErrorImpl value,
    $Res Function(_$DSRoleValidationErrorImpl) then,
  ) = __$$DSRoleValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSRoleErrorType type,
    String message,
    List<DSRole>? requiredRoles,
    List<DSRole>? userRoles,
    String? code,
    Map<String, dynamic>? details,
  });
}

/// @nodoc
class __$$DSRoleValidationErrorImplCopyWithImpl<$Res>
    extends
        _$DSRoleValidationErrorCopyWithImpl<$Res, _$DSRoleValidationErrorImpl>
    implements _$$DSRoleValidationErrorImplCopyWith<$Res> {
  __$$DSRoleValidationErrorImplCopyWithImpl(
    _$DSRoleValidationErrorImpl _value,
    $Res Function(_$DSRoleValidationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? requiredRoles = freezed,
    Object? userRoles = freezed,
    Object? code = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _$DSRoleValidationErrorImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSRoleErrorType,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        requiredRoles: freezed == requiredRoles
            ? _value._requiredRoles
            : requiredRoles // ignore: cast_nullable_to_non_nullable
                  as List<DSRole>?,
        userRoles: freezed == userRoles
            ? _value._userRoles
            : userRoles // ignore: cast_nullable_to_non_nullable
                  as List<DSRole>?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        details: freezed == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleValidationErrorImpl implements _DSRoleValidationError {
  const _$DSRoleValidationErrorImpl({
    required this.type,
    required this.message,
    final List<DSRole>? requiredRoles,
    final List<DSRole>? userRoles,
    this.code,
    final Map<String, dynamic>? details,
  }) : _requiredRoles = requiredRoles,
       _userRoles = userRoles,
       _details = details;

  @override
  final DSRoleErrorType type;
  @override
  final String message;
  final List<DSRole>? _requiredRoles;
  @override
  List<DSRole>? get requiredRoles {
    final value = _requiredRoles;
    if (value == null) return null;
    if (_requiredRoles is EqualUnmodifiableListView) return _requiredRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DSRole>? _userRoles;
  @override
  List<DSRole>? get userRoles {
    final value = _userRoles;
    if (value == null) return null;
    if (_userRoles is EqualUnmodifiableListView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? code;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DSRoleValidationError(type: $type, message: $message, requiredRoles: $requiredRoles, userRoles: $userRoles, code: $code, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleValidationErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._requiredRoles,
              _requiredRoles,
            ) &&
            const DeepCollectionEquality().equals(
              other._userRoles,
              _userRoles,
            ) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    message,
    const DeepCollectionEquality().hash(_requiredRoles),
    const DeepCollectionEquality().hash(_userRoles),
    code,
    const DeepCollectionEquality().hash(_details),
  );

  /// Create a copy of DSRoleValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleValidationErrorImplCopyWith<_$DSRoleValidationErrorImpl>
  get copyWith =>
      __$$DSRoleValidationErrorImplCopyWithImpl<_$DSRoleValidationErrorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleValidationError implements DSRoleValidationError {
  const factory _DSRoleValidationError({
    required final DSRoleErrorType type,
    required final String message,
    final List<DSRole>? requiredRoles,
    final List<DSRole>? userRoles,
    final String? code,
    final Map<String, dynamic>? details,
  }) = _$DSRoleValidationErrorImpl;

  @override
  DSRoleErrorType get type;
  @override
  String get message;
  @override
  List<DSRole>? get requiredRoles;
  @override
  List<DSRole>? get userRoles;
  @override
  String? get code;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of DSRoleValidationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleValidationErrorImplCopyWith<_$DSRoleValidationErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityColors {
  Color? get primaryColor => throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get foregroundColor => throw _privateConstructorUsedError;
  Color? get borderColor => throw _privateConstructorUsedError;
  Color? get focusColor => throw _privateConstructorUsedError;
  Color? get hoverColor => throw _privateConstructorUsedError;
  Color? get loadingColor => throw _privateConstructorUsedError;
  Color? get errorColor => throw _privateConstructorUsedError;
  Color? get errorBackgroundColor => throw _privateConstructorUsedError;
  Color? get errorBorderColor => throw _privateConstructorUsedError;
  Color? get errorTextColor => throw _privateConstructorUsedError;
  Color? get errorIconColor => throw _privateConstructorUsedError;
  Color? get disabledColor => throw _privateConstructorUsedError;
  Color? get disabledBackgroundColor => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityColorsCopyWith<DSRoleVisibilityColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityColorsCopyWith<$Res> {
  factory $DSRoleVisibilityColorsCopyWith(
    DSRoleVisibilityColors value,
    $Res Function(DSRoleVisibilityColors) then,
  ) = _$DSRoleVisibilityColorsCopyWithImpl<$Res, DSRoleVisibilityColors>;
  @useResult
  $Res call({
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? focusColor,
    Color? hoverColor,
    Color? loadingColor,
    Color? errorColor,
    Color? errorBackgroundColor,
    Color? errorBorderColor,
    Color? errorTextColor,
    Color? errorIconColor,
    Color? disabledColor,
    Color? disabledBackgroundColor,
  });
}

/// @nodoc
class _$DSRoleVisibilityColorsCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityColors
>
    implements $DSRoleVisibilityColorsCopyWith<$Res> {
  _$DSRoleVisibilityColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = freezed,
    Object? backgroundColor = freezed,
    Object? foregroundColor = freezed,
    Object? borderColor = freezed,
    Object? focusColor = freezed,
    Object? hoverColor = freezed,
    Object? loadingColor = freezed,
    Object? errorColor = freezed,
    Object? errorBackgroundColor = freezed,
    Object? errorBorderColor = freezed,
    Object? errorTextColor = freezed,
    Object? errorIconColor = freezed,
    Object? disabledColor = freezed,
    Object? disabledBackgroundColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            primaryColor: freezed == primaryColor
                ? _value.primaryColor
                : primaryColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            foregroundColor: freezed == foregroundColor
                ? _value.foregroundColor
                : foregroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            focusColor: freezed == focusColor
                ? _value.focusColor
                : focusColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            hoverColor: freezed == hoverColor
                ? _value.hoverColor
                : hoverColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            loadingColor: freezed == loadingColor
                ? _value.loadingColor
                : loadingColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorColor: freezed == errorColor
                ? _value.errorColor
                : errorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorBackgroundColor: freezed == errorBackgroundColor
                ? _value.errorBackgroundColor
                : errorBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorBorderColor: freezed == errorBorderColor
                ? _value.errorBorderColor
                : errorBorderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorTextColor: freezed == errorTextColor
                ? _value.errorTextColor
                : errorTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorIconColor: freezed == errorIconColor
                ? _value.errorIconColor
                : errorIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledColor: freezed == disabledColor
                ? _value.disabledColor
                : disabledColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledBackgroundColor: freezed == disabledBackgroundColor
                ? _value.disabledBackgroundColor
                : disabledBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityColorsImplCopyWith<$Res>
    implements $DSRoleVisibilityColorsCopyWith<$Res> {
  factory _$$DSRoleVisibilityColorsImplCopyWith(
    _$DSRoleVisibilityColorsImpl value,
    $Res Function(_$DSRoleVisibilityColorsImpl) then,
  ) = __$$DSRoleVisibilityColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? focusColor,
    Color? hoverColor,
    Color? loadingColor,
    Color? errorColor,
    Color? errorBackgroundColor,
    Color? errorBorderColor,
    Color? errorTextColor,
    Color? errorIconColor,
    Color? disabledColor,
    Color? disabledBackgroundColor,
  });
}

/// @nodoc
class __$$DSRoleVisibilityColorsImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityColorsCopyWithImpl<$Res, _$DSRoleVisibilityColorsImpl>
    implements _$$DSRoleVisibilityColorsImplCopyWith<$Res> {
  __$$DSRoleVisibilityColorsImplCopyWithImpl(
    _$DSRoleVisibilityColorsImpl _value,
    $Res Function(_$DSRoleVisibilityColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = freezed,
    Object? backgroundColor = freezed,
    Object? foregroundColor = freezed,
    Object? borderColor = freezed,
    Object? focusColor = freezed,
    Object? hoverColor = freezed,
    Object? loadingColor = freezed,
    Object? errorColor = freezed,
    Object? errorBackgroundColor = freezed,
    Object? errorBorderColor = freezed,
    Object? errorTextColor = freezed,
    Object? errorIconColor = freezed,
    Object? disabledColor = freezed,
    Object? disabledBackgroundColor = freezed,
  }) {
    return _then(
      _$DSRoleVisibilityColorsImpl(
        primaryColor: freezed == primaryColor
            ? _value.primaryColor
            : primaryColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        foregroundColor: freezed == foregroundColor
            ? _value.foregroundColor
            : foregroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        focusColor: freezed == focusColor
            ? _value.focusColor
            : focusColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        hoverColor: freezed == hoverColor
            ? _value.hoverColor
            : hoverColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        loadingColor: freezed == loadingColor
            ? _value.loadingColor
            : loadingColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorColor: freezed == errorColor
            ? _value.errorColor
            : errorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorBackgroundColor: freezed == errorBackgroundColor
            ? _value.errorBackgroundColor
            : errorBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorBorderColor: freezed == errorBorderColor
            ? _value.errorBorderColor
            : errorBorderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorTextColor: freezed == errorTextColor
            ? _value.errorTextColor
            : errorTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorIconColor: freezed == errorIconColor
            ? _value.errorIconColor
            : errorIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledColor: freezed == disabledColor
            ? _value.disabledColor
            : disabledColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledBackgroundColor: freezed == disabledBackgroundColor
            ? _value.disabledBackgroundColor
            : disabledBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityColorsImpl implements _DSRoleVisibilityColors {
  const _$DSRoleVisibilityColorsImpl({
    this.primaryColor,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.focusColor,
    this.hoverColor,
    this.loadingColor,
    this.errorColor,
    this.errorBackgroundColor,
    this.errorBorderColor,
    this.errorTextColor,
    this.errorIconColor,
    this.disabledColor,
    this.disabledBackgroundColor,
  });

  @override
  final Color? primaryColor;
  @override
  final Color? backgroundColor;
  @override
  final Color? foregroundColor;
  @override
  final Color? borderColor;
  @override
  final Color? focusColor;
  @override
  final Color? hoverColor;
  @override
  final Color? loadingColor;
  @override
  final Color? errorColor;
  @override
  final Color? errorBackgroundColor;
  @override
  final Color? errorBorderColor;
  @override
  final Color? errorTextColor;
  @override
  final Color? errorIconColor;
  @override
  final Color? disabledColor;
  @override
  final Color? disabledBackgroundColor;

  @override
  String toString() {
    return 'DSRoleVisibilityColors(primaryColor: $primaryColor, backgroundColor: $backgroundColor, foregroundColor: $foregroundColor, borderColor: $borderColor, focusColor: $focusColor, hoverColor: $hoverColor, loadingColor: $loadingColor, errorColor: $errorColor, errorBackgroundColor: $errorBackgroundColor, errorBorderColor: $errorBorderColor, errorTextColor: $errorTextColor, errorIconColor: $errorIconColor, disabledColor: $disabledColor, disabledBackgroundColor: $disabledBackgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityColorsImpl &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.focusColor, focusColor) ||
                other.focusColor == focusColor) &&
            (identical(other.hoverColor, hoverColor) ||
                other.hoverColor == hoverColor) &&
            (identical(other.loadingColor, loadingColor) ||
                other.loadingColor == loadingColor) &&
            (identical(other.errorColor, errorColor) ||
                other.errorColor == errorColor) &&
            (identical(other.errorBackgroundColor, errorBackgroundColor) ||
                other.errorBackgroundColor == errorBackgroundColor) &&
            (identical(other.errorBorderColor, errorBorderColor) ||
                other.errorBorderColor == errorBorderColor) &&
            (identical(other.errorTextColor, errorTextColor) ||
                other.errorTextColor == errorTextColor) &&
            (identical(other.errorIconColor, errorIconColor) ||
                other.errorIconColor == errorIconColor) &&
            (identical(other.disabledColor, disabledColor) ||
                other.disabledColor == disabledColor) &&
            (identical(
                  other.disabledBackgroundColor,
                  disabledBackgroundColor,
                ) ||
                other.disabledBackgroundColor == disabledBackgroundColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primaryColor,
    backgroundColor,
    foregroundColor,
    borderColor,
    focusColor,
    hoverColor,
    loadingColor,
    errorColor,
    errorBackgroundColor,
    errorBorderColor,
    errorTextColor,
    errorIconColor,
    disabledColor,
    disabledBackgroundColor,
  );

  /// Create a copy of DSRoleVisibilityColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityColorsImplCopyWith<_$DSRoleVisibilityColorsImpl>
  get copyWith =>
      __$$DSRoleVisibilityColorsImplCopyWithImpl<_$DSRoleVisibilityColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleVisibilityColors implements DSRoleVisibilityColors {
  const factory _DSRoleVisibilityColors({
    final Color? primaryColor,
    final Color? backgroundColor,
    final Color? foregroundColor,
    final Color? borderColor,
    final Color? focusColor,
    final Color? hoverColor,
    final Color? loadingColor,
    final Color? errorColor,
    final Color? errorBackgroundColor,
    final Color? errorBorderColor,
    final Color? errorTextColor,
    final Color? errorIconColor,
    final Color? disabledColor,
    final Color? disabledBackgroundColor,
  }) = _$DSRoleVisibilityColorsImpl;

  @override
  Color? get primaryColor;
  @override
  Color? get backgroundColor;
  @override
  Color? get foregroundColor;
  @override
  Color? get borderColor;
  @override
  Color? get focusColor;
  @override
  Color? get hoverColor;
  @override
  Color? get loadingColor;
  @override
  Color? get errorColor;
  @override
  Color? get errorBackgroundColor;
  @override
  Color? get errorBorderColor;
  @override
  Color? get errorTextColor;
  @override
  Color? get errorIconColor;
  @override
  Color? get disabledColor;
  @override
  Color? get disabledBackgroundColor;

  /// Create a copy of DSRoleVisibilityColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityColorsImplCopyWith<_$DSRoleVisibilityColorsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityAnimations {
  Duration get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  bool get enableAnimations => throw _privateConstructorUsedError;
  bool get respectReducedMotion => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityAnimationsCopyWith<DSRoleVisibilityAnimations>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityAnimationsCopyWith<$Res> {
  factory $DSRoleVisibilityAnimationsCopyWith(
    DSRoleVisibilityAnimations value,
    $Res Function(DSRoleVisibilityAnimations) then,
  ) =
      _$DSRoleVisibilityAnimationsCopyWithImpl<
        $Res,
        DSRoleVisibilityAnimations
      >;
  @useResult
  $Res call({
    Duration duration,
    Curve curve,
    bool enableAnimations,
    bool respectReducedMotion,
  });
}

/// @nodoc
class _$DSRoleVisibilityAnimationsCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityAnimations
>
    implements $DSRoleVisibilityAnimationsCopyWith<$Res> {
  _$DSRoleVisibilityAnimationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? curve = null,
    Object? enableAnimations = null,
    Object? respectReducedMotion = null,
  }) {
    return _then(
      _value.copyWith(
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            curve: null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enableAnimations: null == enableAnimations
                ? _value.enableAnimations
                : enableAnimations // ignore: cast_nullable_to_non_nullable
                      as bool,
            respectReducedMotion: null == respectReducedMotion
                ? _value.respectReducedMotion
                : respectReducedMotion // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityAnimationsImplCopyWith<$Res>
    implements $DSRoleVisibilityAnimationsCopyWith<$Res> {
  factory _$$DSRoleVisibilityAnimationsImplCopyWith(
    _$DSRoleVisibilityAnimationsImpl value,
    $Res Function(_$DSRoleVisibilityAnimationsImpl) then,
  ) = __$$DSRoleVisibilityAnimationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Duration duration,
    Curve curve,
    bool enableAnimations,
    bool respectReducedMotion,
  });
}

/// @nodoc
class __$$DSRoleVisibilityAnimationsImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityAnimationsCopyWithImpl<
          $Res,
          _$DSRoleVisibilityAnimationsImpl
        >
    implements _$$DSRoleVisibilityAnimationsImplCopyWith<$Res> {
  __$$DSRoleVisibilityAnimationsImplCopyWithImpl(
    _$DSRoleVisibilityAnimationsImpl _value,
    $Res Function(_$DSRoleVisibilityAnimationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? curve = null,
    Object? enableAnimations = null,
    Object? respectReducedMotion = null,
  }) {
    return _then(
      _$DSRoleVisibilityAnimationsImpl(
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        curve: null == curve
            ? _value.curve
            : curve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enableAnimations: null == enableAnimations
            ? _value.enableAnimations
            : enableAnimations // ignore: cast_nullable_to_non_nullable
                  as bool,
        respectReducedMotion: null == respectReducedMotion
            ? _value.respectReducedMotion
            : respectReducedMotion // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityAnimationsImpl implements _DSRoleVisibilityAnimations {
  const _$DSRoleVisibilityAnimationsImpl({
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.enableAnimations = true,
    this.respectReducedMotion = true,
  });

  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final Curve curve;
  @override
  @JsonKey()
  final bool enableAnimations;
  @override
  @JsonKey()
  final bool respectReducedMotion;

  @override
  String toString() {
    return 'DSRoleVisibilityAnimations(duration: $duration, curve: $curve, enableAnimations: $enableAnimations, respectReducedMotion: $respectReducedMotion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityAnimationsImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.enableAnimations, enableAnimations) ||
                other.enableAnimations == enableAnimations) &&
            (identical(other.respectReducedMotion, respectReducedMotion) ||
                other.respectReducedMotion == respectReducedMotion));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    curve,
    enableAnimations,
    respectReducedMotion,
  );

  /// Create a copy of DSRoleVisibilityAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityAnimationsImplCopyWith<_$DSRoleVisibilityAnimationsImpl>
  get copyWith =>
      __$$DSRoleVisibilityAnimationsImplCopyWithImpl<
        _$DSRoleVisibilityAnimationsImpl
      >(this, _$identity);
}

abstract class _DSRoleVisibilityAnimations
    implements DSRoleVisibilityAnimations {
  const factory _DSRoleVisibilityAnimations({
    final Duration duration,
    final Curve curve,
    final bool enableAnimations,
    final bool respectReducedMotion,
  }) = _$DSRoleVisibilityAnimationsImpl;

  @override
  Duration get duration;
  @override
  Curve get curve;
  @override
  bool get enableAnimations;
  @override
  bool get respectReducedMotion;

  /// Create a copy of DSRoleVisibilityAnimations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityAnimationsImplCopyWith<_$DSRoleVisibilityAnimationsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityBehavior {
  bool get preserveSpaceWhenHidden => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get enableDebugMode => throw _privateConstructorUsedError;
  bool get cacheResults => throw _privateConstructorUsedError;
  Duration get cacheDuration => throw _privateConstructorUsedError;
  bool get enableLogging => throw _privateConstructorUsedError;
  bool get automaticRefresh => throw _privateConstructorUsedError;
  Duration get refreshInterval => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityBehaviorCopyWith<DSRoleVisibilityBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityBehaviorCopyWith<$Res> {
  factory $DSRoleVisibilityBehaviorCopyWith(
    DSRoleVisibilityBehavior value,
    $Res Function(DSRoleVisibilityBehavior) then,
  ) = _$DSRoleVisibilityBehaviorCopyWithImpl<$Res, DSRoleVisibilityBehavior>;
  @useResult
  $Res call({
    bool preserveSpaceWhenHidden,
    bool showErrorMessages,
    bool enableDebugMode,
    bool cacheResults,
    Duration cacheDuration,
    bool enableLogging,
    bool automaticRefresh,
    Duration refreshInterval,
  });
}

/// @nodoc
class _$DSRoleVisibilityBehaviorCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityBehavior
>
    implements $DSRoleVisibilityBehaviorCopyWith<$Res> {
  _$DSRoleVisibilityBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preserveSpaceWhenHidden = null,
    Object? showErrorMessages = null,
    Object? enableDebugMode = null,
    Object? cacheResults = null,
    Object? cacheDuration = null,
    Object? enableLogging = null,
    Object? automaticRefresh = null,
    Object? refreshInterval = null,
  }) {
    return _then(
      _value.copyWith(
            preserveSpaceWhenHidden: null == preserveSpaceWhenHidden
                ? _value.preserveSpaceWhenHidden
                : preserveSpaceWhenHidden // ignore: cast_nullable_to_non_nullable
                      as bool,
            showErrorMessages: null == showErrorMessages
                ? _value.showErrorMessages
                : showErrorMessages // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableDebugMode: null == enableDebugMode
                ? _value.enableDebugMode
                : enableDebugMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheResults: null == cacheResults
                ? _value.cacheResults
                : cacheResults // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheDuration: null == cacheDuration
                ? _value.cacheDuration
                : cacheDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            enableLogging: null == enableLogging
                ? _value.enableLogging
                : enableLogging // ignore: cast_nullable_to_non_nullable
                      as bool,
            automaticRefresh: null == automaticRefresh
                ? _value.automaticRefresh
                : automaticRefresh // ignore: cast_nullable_to_non_nullable
                      as bool,
            refreshInterval: null == refreshInterval
                ? _value.refreshInterval
                : refreshInterval // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityBehaviorImplCopyWith<$Res>
    implements $DSRoleVisibilityBehaviorCopyWith<$Res> {
  factory _$$DSRoleVisibilityBehaviorImplCopyWith(
    _$DSRoleVisibilityBehaviorImpl value,
    $Res Function(_$DSRoleVisibilityBehaviorImpl) then,
  ) = __$$DSRoleVisibilityBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool preserveSpaceWhenHidden,
    bool showErrorMessages,
    bool enableDebugMode,
    bool cacheResults,
    Duration cacheDuration,
    bool enableLogging,
    bool automaticRefresh,
    Duration refreshInterval,
  });
}

/// @nodoc
class __$$DSRoleVisibilityBehaviorImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityBehaviorCopyWithImpl<
          $Res,
          _$DSRoleVisibilityBehaviorImpl
        >
    implements _$$DSRoleVisibilityBehaviorImplCopyWith<$Res> {
  __$$DSRoleVisibilityBehaviorImplCopyWithImpl(
    _$DSRoleVisibilityBehaviorImpl _value,
    $Res Function(_$DSRoleVisibilityBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preserveSpaceWhenHidden = null,
    Object? showErrorMessages = null,
    Object? enableDebugMode = null,
    Object? cacheResults = null,
    Object? cacheDuration = null,
    Object? enableLogging = null,
    Object? automaticRefresh = null,
    Object? refreshInterval = null,
  }) {
    return _then(
      _$DSRoleVisibilityBehaviorImpl(
        preserveSpaceWhenHidden: null == preserveSpaceWhenHidden
            ? _value.preserveSpaceWhenHidden
            : preserveSpaceWhenHidden // ignore: cast_nullable_to_non_nullable
                  as bool,
        showErrorMessages: null == showErrorMessages
            ? _value.showErrorMessages
            : showErrorMessages // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableDebugMode: null == enableDebugMode
            ? _value.enableDebugMode
            : enableDebugMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheResults: null == cacheResults
            ? _value.cacheResults
            : cacheResults // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheDuration: null == cacheDuration
            ? _value.cacheDuration
            : cacheDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        enableLogging: null == enableLogging
            ? _value.enableLogging
            : enableLogging // ignore: cast_nullable_to_non_nullable
                  as bool,
        automaticRefresh: null == automaticRefresh
            ? _value.automaticRefresh
            : automaticRefresh // ignore: cast_nullable_to_non_nullable
                  as bool,
        refreshInterval: null == refreshInterval
            ? _value.refreshInterval
            : refreshInterval // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityBehaviorImpl implements _DSRoleVisibilityBehavior {
  const _$DSRoleVisibilityBehaviorImpl({
    this.preserveSpaceWhenHidden = false,
    this.showErrorMessages = true,
    this.enableDebugMode = false,
    this.cacheResults = true,
    this.cacheDuration = const Duration(minutes: 5),
    this.enableLogging = false,
    this.automaticRefresh = false,
    this.refreshInterval = const Duration(minutes: 10),
  });

  @override
  @JsonKey()
  final bool preserveSpaceWhenHidden;
  @override
  @JsonKey()
  final bool showErrorMessages;
  @override
  @JsonKey()
  final bool enableDebugMode;
  @override
  @JsonKey()
  final bool cacheResults;
  @override
  @JsonKey()
  final Duration cacheDuration;
  @override
  @JsonKey()
  final bool enableLogging;
  @override
  @JsonKey()
  final bool automaticRefresh;
  @override
  @JsonKey()
  final Duration refreshInterval;

  @override
  String toString() {
    return 'DSRoleVisibilityBehavior(preserveSpaceWhenHidden: $preserveSpaceWhenHidden, showErrorMessages: $showErrorMessages, enableDebugMode: $enableDebugMode, cacheResults: $cacheResults, cacheDuration: $cacheDuration, enableLogging: $enableLogging, automaticRefresh: $automaticRefresh, refreshInterval: $refreshInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityBehaviorImpl &&
            (identical(
                  other.preserveSpaceWhenHidden,
                  preserveSpaceWhenHidden,
                ) ||
                other.preserveSpaceWhenHidden == preserveSpaceWhenHidden) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.enableDebugMode, enableDebugMode) ||
                other.enableDebugMode == enableDebugMode) &&
            (identical(other.cacheResults, cacheResults) ||
                other.cacheResults == cacheResults) &&
            (identical(other.cacheDuration, cacheDuration) ||
                other.cacheDuration == cacheDuration) &&
            (identical(other.enableLogging, enableLogging) ||
                other.enableLogging == enableLogging) &&
            (identical(other.automaticRefresh, automaticRefresh) ||
                other.automaticRefresh == automaticRefresh) &&
            (identical(other.refreshInterval, refreshInterval) ||
                other.refreshInterval == refreshInterval));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    preserveSpaceWhenHidden,
    showErrorMessages,
    enableDebugMode,
    cacheResults,
    cacheDuration,
    enableLogging,
    automaticRefresh,
    refreshInterval,
  );

  /// Create a copy of DSRoleVisibilityBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityBehaviorImplCopyWith<_$DSRoleVisibilityBehaviorImpl>
  get copyWith =>
      __$$DSRoleVisibilityBehaviorImplCopyWithImpl<
        _$DSRoleVisibilityBehaviorImpl
      >(this, _$identity);
}

abstract class _DSRoleVisibilityBehavior implements DSRoleVisibilityBehavior {
  const factory _DSRoleVisibilityBehavior({
    final bool preserveSpaceWhenHidden,
    final bool showErrorMessages,
    final bool enableDebugMode,
    final bool cacheResults,
    final Duration cacheDuration,
    final bool enableLogging,
    final bool automaticRefresh,
    final Duration refreshInterval,
  }) = _$DSRoleVisibilityBehaviorImpl;

  @override
  bool get preserveSpaceWhenHidden;
  @override
  bool get showErrorMessages;
  @override
  bool get enableDebugMode;
  @override
  bool get cacheResults;
  @override
  Duration get cacheDuration;
  @override
  bool get enableLogging;
  @override
  bool get automaticRefresh;
  @override
  Duration get refreshInterval;

  /// Create a copy of DSRoleVisibilityBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityBehaviorImplCopyWith<_$DSRoleVisibilityBehaviorImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleAccessibilityConfig {
  bool get enableA11yAnnouncements => throw _privateConstructorUsedError;
  String? get accessGrantedMessage => throw _privateConstructorUsedError;
  String? get accessDeniedMessage => throw _privateConstructorUsedError;
  String? get roleChangeMessage => throw _privateConstructorUsedError;
  String? get errorAnnouncementMessage => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleAccessibilityConfigCopyWith<DSRoleAccessibilityConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleAccessibilityConfigCopyWith<$Res> {
  factory $DSRoleAccessibilityConfigCopyWith(
    DSRoleAccessibilityConfig value,
    $Res Function(DSRoleAccessibilityConfig) then,
  ) = _$DSRoleAccessibilityConfigCopyWithImpl<$Res, DSRoleAccessibilityConfig>;
  @useResult
  $Res call({
    bool enableA11yAnnouncements,
    String? accessGrantedMessage,
    String? accessDeniedMessage,
    String? roleChangeMessage,
    String? errorAnnouncementMessage,
  });
}

/// @nodoc
class _$DSRoleAccessibilityConfigCopyWithImpl<
  $Res,
  $Val extends DSRoleAccessibilityConfig
>
    implements $DSRoleAccessibilityConfigCopyWith<$Res> {
  _$DSRoleAccessibilityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableA11yAnnouncements = null,
    Object? accessGrantedMessage = freezed,
    Object? accessDeniedMessage = freezed,
    Object? roleChangeMessage = freezed,
    Object? errorAnnouncementMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            enableA11yAnnouncements: null == enableA11yAnnouncements
                ? _value.enableA11yAnnouncements
                : enableA11yAnnouncements // ignore: cast_nullable_to_non_nullable
                      as bool,
            accessGrantedMessage: freezed == accessGrantedMessage
                ? _value.accessGrantedMessage
                : accessGrantedMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            accessDeniedMessage: freezed == accessDeniedMessage
                ? _value.accessDeniedMessage
                : accessDeniedMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            roleChangeMessage: freezed == roleChangeMessage
                ? _value.roleChangeMessage
                : roleChangeMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorAnnouncementMessage: freezed == errorAnnouncementMessage
                ? _value.errorAnnouncementMessage
                : errorAnnouncementMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleAccessibilityConfigImplCopyWith<$Res>
    implements $DSRoleAccessibilityConfigCopyWith<$Res> {
  factory _$$DSRoleAccessibilityConfigImplCopyWith(
    _$DSRoleAccessibilityConfigImpl value,
    $Res Function(_$DSRoleAccessibilityConfigImpl) then,
  ) = __$$DSRoleAccessibilityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enableA11yAnnouncements,
    String? accessGrantedMessage,
    String? accessDeniedMessage,
    String? roleChangeMessage,
    String? errorAnnouncementMessage,
  });
}

/// @nodoc
class __$$DSRoleAccessibilityConfigImplCopyWithImpl<$Res>
    extends
        _$DSRoleAccessibilityConfigCopyWithImpl<
          $Res,
          _$DSRoleAccessibilityConfigImpl
        >
    implements _$$DSRoleAccessibilityConfigImplCopyWith<$Res> {
  __$$DSRoleAccessibilityConfigImplCopyWithImpl(
    _$DSRoleAccessibilityConfigImpl _value,
    $Res Function(_$DSRoleAccessibilityConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableA11yAnnouncements = null,
    Object? accessGrantedMessage = freezed,
    Object? accessDeniedMessage = freezed,
    Object? roleChangeMessage = freezed,
    Object? errorAnnouncementMessage = freezed,
  }) {
    return _then(
      _$DSRoleAccessibilityConfigImpl(
        enableA11yAnnouncements: null == enableA11yAnnouncements
            ? _value.enableA11yAnnouncements
            : enableA11yAnnouncements // ignore: cast_nullable_to_non_nullable
                  as bool,
        accessGrantedMessage: freezed == accessGrantedMessage
            ? _value.accessGrantedMessage
            : accessGrantedMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        accessDeniedMessage: freezed == accessDeniedMessage
            ? _value.accessDeniedMessage
            : accessDeniedMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        roleChangeMessage: freezed == roleChangeMessage
            ? _value.roleChangeMessage
            : roleChangeMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorAnnouncementMessage: freezed == errorAnnouncementMessage
            ? _value.errorAnnouncementMessage
            : errorAnnouncementMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleAccessibilityConfigImpl implements _DSRoleAccessibilityConfig {
  const _$DSRoleAccessibilityConfigImpl({
    this.enableA11yAnnouncements = true,
    this.accessGrantedMessage,
    this.accessDeniedMessage,
    this.roleChangeMessage,
    this.errorAnnouncementMessage,
  });

  @override
  @JsonKey()
  final bool enableA11yAnnouncements;
  @override
  final String? accessGrantedMessage;
  @override
  final String? accessDeniedMessage;
  @override
  final String? roleChangeMessage;
  @override
  final String? errorAnnouncementMessage;

  @override
  String toString() {
    return 'DSRoleAccessibilityConfig(enableA11yAnnouncements: $enableA11yAnnouncements, accessGrantedMessage: $accessGrantedMessage, accessDeniedMessage: $accessDeniedMessage, roleChangeMessage: $roleChangeMessage, errorAnnouncementMessage: $errorAnnouncementMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleAccessibilityConfigImpl &&
            (identical(
                  other.enableA11yAnnouncements,
                  enableA11yAnnouncements,
                ) ||
                other.enableA11yAnnouncements == enableA11yAnnouncements) &&
            (identical(other.accessGrantedMessage, accessGrantedMessage) ||
                other.accessGrantedMessage == accessGrantedMessage) &&
            (identical(other.accessDeniedMessage, accessDeniedMessage) ||
                other.accessDeniedMessage == accessDeniedMessage) &&
            (identical(other.roleChangeMessage, roleChangeMessage) ||
                other.roleChangeMessage == roleChangeMessage) &&
            (identical(
                  other.errorAnnouncementMessage,
                  errorAnnouncementMessage,
                ) ||
                other.errorAnnouncementMessage == errorAnnouncementMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enableA11yAnnouncements,
    accessGrantedMessage,
    accessDeniedMessage,
    roleChangeMessage,
    errorAnnouncementMessage,
  );

  /// Create a copy of DSRoleAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleAccessibilityConfigImplCopyWith<_$DSRoleAccessibilityConfigImpl>
  get copyWith =>
      __$$DSRoleAccessibilityConfigImplCopyWithImpl<
        _$DSRoleAccessibilityConfigImpl
      >(this, _$identity);
}

abstract class _DSRoleAccessibilityConfig implements DSRoleAccessibilityConfig {
  const factory _DSRoleAccessibilityConfig({
    final bool enableA11yAnnouncements,
    final String? accessGrantedMessage,
    final String? accessDeniedMessage,
    final String? roleChangeMessage,
    final String? errorAnnouncementMessage,
  }) = _$DSRoleAccessibilityConfigImpl;

  @override
  bool get enableA11yAnnouncements;
  @override
  String? get accessGrantedMessage;
  @override
  String? get accessDeniedMessage;
  @override
  String? get roleChangeMessage;
  @override
  String? get errorAnnouncementMessage;

  /// Create a copy of DSRoleAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleAccessibilityConfigImplCopyWith<_$DSRoleAccessibilityConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleAccessibility {
  String? get label => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  bool get focusable => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleAccessibilityCopyWith<DSRoleAccessibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleAccessibilityCopyWith<$Res> {
  factory $DSRoleAccessibilityCopyWith(
    DSRoleAccessibility value,
    $Res Function(DSRoleAccessibility) then,
  ) = _$DSRoleAccessibilityCopyWithImpl<$Res, DSRoleAccessibility>;
  @useResult
  $Res call({String? label, String? hint, String? value, bool focusable});
}

/// @nodoc
class _$DSRoleAccessibilityCopyWithImpl<$Res, $Val extends DSRoleAccessibility>
    implements $DSRoleAccessibilityCopyWith<$Res> {
  _$DSRoleAccessibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? hint = freezed,
    Object? value = freezed,
    Object? focusable = null,
  }) {
    return _then(
      _value.copyWith(
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            hint: freezed == hint
                ? _value.hint
                : hint // ignore: cast_nullable_to_non_nullable
                      as String?,
            value: freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String?,
            focusable: null == focusable
                ? _value.focusable
                : focusable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleAccessibilityImplCopyWith<$Res>
    implements $DSRoleAccessibilityCopyWith<$Res> {
  factory _$$DSRoleAccessibilityImplCopyWith(
    _$DSRoleAccessibilityImpl value,
    $Res Function(_$DSRoleAccessibilityImpl) then,
  ) = __$$DSRoleAccessibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? hint, String? value, bool focusable});
}

/// @nodoc
class __$$DSRoleAccessibilityImplCopyWithImpl<$Res>
    extends _$DSRoleAccessibilityCopyWithImpl<$Res, _$DSRoleAccessibilityImpl>
    implements _$$DSRoleAccessibilityImplCopyWith<$Res> {
  __$$DSRoleAccessibilityImplCopyWithImpl(
    _$DSRoleAccessibilityImpl _value,
    $Res Function(_$DSRoleAccessibilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? hint = freezed,
    Object? value = freezed,
    Object? focusable = null,
  }) {
    return _then(
      _$DSRoleAccessibilityImpl(
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
        value: freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String?,
        focusable: null == focusable
            ? _value.focusable
            : focusable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleAccessibilityImpl implements _DSRoleAccessibility {
  const _$DSRoleAccessibilityImpl({
    this.label,
    this.hint,
    this.value,
    this.focusable = true,
  });

  @override
  final String? label;
  @override
  final String? hint;
  @override
  final String? value;
  @override
  @JsonKey()
  final bool focusable;

  @override
  String toString() {
    return 'DSRoleAccessibility(label: $label, hint: $hint, value: $value, focusable: $focusable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleAccessibilityImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.focusable, focusable) ||
                other.focusable == focusable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, hint, value, focusable);

  /// Create a copy of DSRoleAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleAccessibilityImplCopyWith<_$DSRoleAccessibilityImpl> get copyWith =>
      __$$DSRoleAccessibilityImplCopyWithImpl<_$DSRoleAccessibilityImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleAccessibility implements DSRoleAccessibility {
  const factory _DSRoleAccessibility({
    final String? label,
    final String? hint,
    final String? value,
    final bool focusable,
  }) = _$DSRoleAccessibilityImpl;

  @override
  String? get label;
  @override
  String? get hint;
  @override
  String? get value;
  @override
  bool get focusable;

  /// Create a copy of DSRoleAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleAccessibilityImplCopyWith<_$DSRoleAccessibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleHierarchyConfig {
  int get minimumLevel => throw _privateConstructorUsedError;
  bool get strictMode => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleHierarchyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleHierarchyConfigCopyWith<DSRoleHierarchyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleHierarchyConfigCopyWith<$Res> {
  factory $DSRoleHierarchyConfigCopyWith(
    DSRoleHierarchyConfig value,
    $Res Function(DSRoleHierarchyConfig) then,
  ) = _$DSRoleHierarchyConfigCopyWithImpl<$Res, DSRoleHierarchyConfig>;
  @useResult
  $Res call({int minimumLevel, bool strictMode});
}

/// @nodoc
class _$DSRoleHierarchyConfigCopyWithImpl<
  $Res,
  $Val extends DSRoleHierarchyConfig
>
    implements $DSRoleHierarchyConfigCopyWith<$Res> {
  _$DSRoleHierarchyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleHierarchyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? minimumLevel = null, Object? strictMode = null}) {
    return _then(
      _value.copyWith(
            minimumLevel: null == minimumLevel
                ? _value.minimumLevel
                : minimumLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            strictMode: null == strictMode
                ? _value.strictMode
                : strictMode // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleHierarchyConfigImplCopyWith<$Res>
    implements $DSRoleHierarchyConfigCopyWith<$Res> {
  factory _$$DSRoleHierarchyConfigImplCopyWith(
    _$DSRoleHierarchyConfigImpl value,
    $Res Function(_$DSRoleHierarchyConfigImpl) then,
  ) = __$$DSRoleHierarchyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minimumLevel, bool strictMode});
}

/// @nodoc
class __$$DSRoleHierarchyConfigImplCopyWithImpl<$Res>
    extends
        _$DSRoleHierarchyConfigCopyWithImpl<$Res, _$DSRoleHierarchyConfigImpl>
    implements _$$DSRoleHierarchyConfigImplCopyWith<$Res> {
  __$$DSRoleHierarchyConfigImplCopyWithImpl(
    _$DSRoleHierarchyConfigImpl _value,
    $Res Function(_$DSRoleHierarchyConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleHierarchyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? minimumLevel = null, Object? strictMode = null}) {
    return _then(
      _$DSRoleHierarchyConfigImpl(
        minimumLevel: null == minimumLevel
            ? _value.minimumLevel
            : minimumLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        strictMode: null == strictMode
            ? _value.strictMode
            : strictMode // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleHierarchyConfigImpl implements _DSRoleHierarchyConfig {
  const _$DSRoleHierarchyConfigImpl({
    this.minimumLevel = 0,
    this.strictMode = false,
  });

  @override
  @JsonKey()
  final int minimumLevel;
  @override
  @JsonKey()
  final bool strictMode;

  @override
  String toString() {
    return 'DSRoleHierarchyConfig(minimumLevel: $minimumLevel, strictMode: $strictMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleHierarchyConfigImpl &&
            (identical(other.minimumLevel, minimumLevel) ||
                other.minimumLevel == minimumLevel) &&
            (identical(other.strictMode, strictMode) ||
                other.strictMode == strictMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minimumLevel, strictMode);

  /// Create a copy of DSRoleHierarchyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleHierarchyConfigImplCopyWith<_$DSRoleHierarchyConfigImpl>
  get copyWith =>
      __$$DSRoleHierarchyConfigImplCopyWithImpl<_$DSRoleHierarchyConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleHierarchyConfig implements DSRoleHierarchyConfig {
  const factory _DSRoleHierarchyConfig({
    final int minimumLevel,
    final bool strictMode,
  }) = _$DSRoleHierarchyConfigImpl;

  @override
  int get minimumLevel;
  @override
  bool get strictMode;

  /// Create a copy of DSRoleHierarchyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleHierarchyConfigImplCopyWith<_$DSRoleHierarchyConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityPadding {
  double get horizontal => throw _privateConstructorUsedError;
  double get vertical => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityPadding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityPaddingCopyWith<DSRoleVisibilityPadding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityPaddingCopyWith<$Res> {
  factory $DSRoleVisibilityPaddingCopyWith(
    DSRoleVisibilityPadding value,
    $Res Function(DSRoleVisibilityPadding) then,
  ) = _$DSRoleVisibilityPaddingCopyWithImpl<$Res, DSRoleVisibilityPadding>;
  @useResult
  $Res call({double horizontal, double vertical});
}

/// @nodoc
class _$DSRoleVisibilityPaddingCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityPadding
>
    implements $DSRoleVisibilityPaddingCopyWith<$Res> {
  _$DSRoleVisibilityPaddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityPadding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? horizontal = null, Object? vertical = null}) {
    return _then(
      _value.copyWith(
            horizontal: null == horizontal
                ? _value.horizontal
                : horizontal // ignore: cast_nullable_to_non_nullable
                      as double,
            vertical: null == vertical
                ? _value.vertical
                : vertical // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityPaddingImplCopyWith<$Res>
    implements $DSRoleVisibilityPaddingCopyWith<$Res> {
  factory _$$DSRoleVisibilityPaddingImplCopyWith(
    _$DSRoleVisibilityPaddingImpl value,
    $Res Function(_$DSRoleVisibilityPaddingImpl) then,
  ) = __$$DSRoleVisibilityPaddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double horizontal, double vertical});
}

/// @nodoc
class __$$DSRoleVisibilityPaddingImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityPaddingCopyWithImpl<
          $Res,
          _$DSRoleVisibilityPaddingImpl
        >
    implements _$$DSRoleVisibilityPaddingImplCopyWith<$Res> {
  __$$DSRoleVisibilityPaddingImplCopyWithImpl(
    _$DSRoleVisibilityPaddingImpl _value,
    $Res Function(_$DSRoleVisibilityPaddingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityPadding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? horizontal = null, Object? vertical = null}) {
    return _then(
      _$DSRoleVisibilityPaddingImpl(
        horizontal: null == horizontal
            ? _value.horizontal
            : horizontal // ignore: cast_nullable_to_non_nullable
                  as double,
        vertical: null == vertical
            ? _value.vertical
            : vertical // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityPaddingImpl implements _DSRoleVisibilityPadding {
  const _$DSRoleVisibilityPaddingImpl({
    this.horizontal = 16.0,
    this.vertical = 8.0,
  });

  @override
  @JsonKey()
  final double horizontal;
  @override
  @JsonKey()
  final double vertical;

  @override
  String toString() {
    return 'DSRoleVisibilityPadding(horizontal: $horizontal, vertical: $vertical)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityPaddingImpl &&
            (identical(other.horizontal, horizontal) ||
                other.horizontal == horizontal) &&
            (identical(other.vertical, vertical) ||
                other.vertical == vertical));
  }

  @override
  int get hashCode => Object.hash(runtimeType, horizontal, vertical);

  /// Create a copy of DSRoleVisibilityPadding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityPaddingImplCopyWith<_$DSRoleVisibilityPaddingImpl>
  get copyWith =>
      __$$DSRoleVisibilityPaddingImplCopyWithImpl<
        _$DSRoleVisibilityPaddingImpl
      >(this, _$identity);
}

abstract class _DSRoleVisibilityPadding implements DSRoleVisibilityPadding {
  const factory _DSRoleVisibilityPadding({
    final double horizontal,
    final double vertical,
  }) = _$DSRoleVisibilityPaddingImpl;

  @override
  double get horizontal;
  @override
  double get vertical;

  /// Create a copy of DSRoleVisibilityPadding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityPaddingImplCopyWith<_$DSRoleVisibilityPaddingImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityBorderRadius {
  double get radius => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityBorderRadiusCopyWith<DSRoleVisibilityBorderRadius>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityBorderRadiusCopyWith<$Res> {
  factory $DSRoleVisibilityBorderRadiusCopyWith(
    DSRoleVisibilityBorderRadius value,
    $Res Function(DSRoleVisibilityBorderRadius) then,
  ) =
      _$DSRoleVisibilityBorderRadiusCopyWithImpl<
        $Res,
        DSRoleVisibilityBorderRadius
      >;
  @useResult
  $Res call({double radius});
}

/// @nodoc
class _$DSRoleVisibilityBorderRadiusCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityBorderRadius
>
    implements $DSRoleVisibilityBorderRadiusCopyWith<$Res> {
  _$DSRoleVisibilityBorderRadiusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? radius = null}) {
    return _then(
      _value.copyWith(
            radius: null == radius
                ? _value.radius
                : radius // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityBorderRadiusImplCopyWith<$Res>
    implements $DSRoleVisibilityBorderRadiusCopyWith<$Res> {
  factory _$$DSRoleVisibilityBorderRadiusImplCopyWith(
    _$DSRoleVisibilityBorderRadiusImpl value,
    $Res Function(_$DSRoleVisibilityBorderRadiusImpl) then,
  ) = __$$DSRoleVisibilityBorderRadiusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double radius});
}

/// @nodoc
class __$$DSRoleVisibilityBorderRadiusImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityBorderRadiusCopyWithImpl<
          $Res,
          _$DSRoleVisibilityBorderRadiusImpl
        >
    implements _$$DSRoleVisibilityBorderRadiusImplCopyWith<$Res> {
  __$$DSRoleVisibilityBorderRadiusImplCopyWithImpl(
    _$DSRoleVisibilityBorderRadiusImpl _value,
    $Res Function(_$DSRoleVisibilityBorderRadiusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? radius = null}) {
    return _then(
      _$DSRoleVisibilityBorderRadiusImpl(
        radius: null == radius
            ? _value.radius
            : radius // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityBorderRadiusImpl
    implements _DSRoleVisibilityBorderRadius {
  const _$DSRoleVisibilityBorderRadiusImpl({this.radius = 8.0});

  @override
  @JsonKey()
  final double radius;

  @override
  String toString() {
    return 'DSRoleVisibilityBorderRadius(radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityBorderRadiusImpl &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radius);

  /// Create a copy of DSRoleVisibilityBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityBorderRadiusImplCopyWith<
    _$DSRoleVisibilityBorderRadiusImpl
  >
  get copyWith =>
      __$$DSRoleVisibilityBorderRadiusImplCopyWithImpl<
        _$DSRoleVisibilityBorderRadiusImpl
      >(this, _$identity);
}

abstract class _DSRoleVisibilityBorderRadius
    implements DSRoleVisibilityBorderRadius {
  const factory _DSRoleVisibilityBorderRadius({final double radius}) =
      _$DSRoleVisibilityBorderRadiusImpl;

  @override
  double get radius;

  /// Create a copy of DSRoleVisibilityBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityBorderRadiusImplCopyWith<
    _$DSRoleVisibilityBorderRadiusImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityTextStyle {
  double? get fontSize => throw _privateConstructorUsedError;
  FontWeight? get fontWeight => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  double? get letterSpacing => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityTextStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityTextStyleCopyWith<DSRoleVisibilityTextStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityTextStyleCopyWith<$Res> {
  factory $DSRoleVisibilityTextStyleCopyWith(
    DSRoleVisibilityTextStyle value,
    $Res Function(DSRoleVisibilityTextStyle) then,
  ) = _$DSRoleVisibilityTextStyleCopyWithImpl<$Res, DSRoleVisibilityTextStyle>;
  @useResult
  $Res call({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  });
}

/// @nodoc
class _$DSRoleVisibilityTextStyleCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityTextStyle
>
    implements $DSRoleVisibilityTextStyleCopyWith<$Res> {
  _$DSRoleVisibilityTextStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityTextStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = freezed,
    Object? fontWeight = freezed,
    Object? color = freezed,
    Object? letterSpacing = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _value.copyWith(
            fontSize: freezed == fontSize
                ? _value.fontSize
                : fontSize // ignore: cast_nullable_to_non_nullable
                      as double?,
            fontWeight: freezed == fontWeight
                ? _value.fontWeight
                : fontWeight // ignore: cast_nullable_to_non_nullable
                      as FontWeight?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            letterSpacing: freezed == letterSpacing
                ? _value.letterSpacing
                : letterSpacing // ignore: cast_nullable_to_non_nullable
                      as double?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityTextStyleImplCopyWith<$Res>
    implements $DSRoleVisibilityTextStyleCopyWith<$Res> {
  factory _$$DSRoleVisibilityTextStyleImplCopyWith(
    _$DSRoleVisibilityTextStyleImpl value,
    $Res Function(_$DSRoleVisibilityTextStyleImpl) then,
  ) = __$$DSRoleVisibilityTextStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  });
}

/// @nodoc
class __$$DSRoleVisibilityTextStyleImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityTextStyleCopyWithImpl<
          $Res,
          _$DSRoleVisibilityTextStyleImpl
        >
    implements _$$DSRoleVisibilityTextStyleImplCopyWith<$Res> {
  __$$DSRoleVisibilityTextStyleImplCopyWithImpl(
    _$DSRoleVisibilityTextStyleImpl _value,
    $Res Function(_$DSRoleVisibilityTextStyleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityTextStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontSize = freezed,
    Object? fontWeight = freezed,
    Object? color = freezed,
    Object? letterSpacing = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _$DSRoleVisibilityTextStyleImpl(
        fontSize: freezed == fontSize
            ? _value.fontSize
            : fontSize // ignore: cast_nullable_to_non_nullable
                  as double?,
        fontWeight: freezed == fontWeight
            ? _value.fontWeight
            : fontWeight // ignore: cast_nullable_to_non_nullable
                  as FontWeight?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        letterSpacing: freezed == letterSpacing
            ? _value.letterSpacing
            : letterSpacing // ignore: cast_nullable_to_non_nullable
                  as double?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityTextStyleImpl implements _DSRoleVisibilityTextStyle {
  const _$DSRoleVisibilityTextStyleImpl({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.height,
  });

  @override
  final double? fontSize;
  @override
  final FontWeight? fontWeight;
  @override
  final Color? color;
  @override
  final double? letterSpacing;
  @override
  final double? height;

  @override
  String toString() {
    return 'DSRoleVisibilityTextStyle(fontSize: $fontSize, fontWeight: $fontWeight, color: $color, letterSpacing: $letterSpacing, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityTextStyleImpl &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.fontWeight, fontWeight) ||
                other.fontWeight == fontWeight) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.letterSpacing, letterSpacing) ||
                other.letterSpacing == letterSpacing) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    fontSize,
    fontWeight,
    color,
    letterSpacing,
    height,
  );

  /// Create a copy of DSRoleVisibilityTextStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityTextStyleImplCopyWith<_$DSRoleVisibilityTextStyleImpl>
  get copyWith =>
      __$$DSRoleVisibilityTextStyleImplCopyWithImpl<
        _$DSRoleVisibilityTextStyleImpl
      >(this, _$identity);
}

abstract class _DSRoleVisibilityTextStyle implements DSRoleVisibilityTextStyle {
  const factory _DSRoleVisibilityTextStyle({
    final double? fontSize,
    final FontWeight? fontWeight,
    final Color? color,
    final double? letterSpacing,
    final double? height,
  }) = _$DSRoleVisibilityTextStyleImpl;

  @override
  double? get fontSize;
  @override
  FontWeight? get fontWeight;
  @override
  Color? get color;
  @override
  double? get letterSpacing;
  @override
  double? get height;

  /// Create a copy of DSRoleVisibilityTextStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityTextStyleImplCopyWith<_$DSRoleVisibilityTextStyleImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityShadow {
  Color get color => throw _privateConstructorUsedError;
  double get opacity => throw _privateConstructorUsedError;
  double get blurRadius => throw _privateConstructorUsedError;
  Offset get offset => throw _privateConstructorUsedError;
  double get spreadRadius => throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityShadow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityShadowCopyWith<DSRoleVisibilityShadow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityShadowCopyWith<$Res> {
  factory $DSRoleVisibilityShadowCopyWith(
    DSRoleVisibilityShadow value,
    $Res Function(DSRoleVisibilityShadow) then,
  ) = _$DSRoleVisibilityShadowCopyWithImpl<$Res, DSRoleVisibilityShadow>;
  @useResult
  $Res call({
    Color color,
    double opacity,
    double blurRadius,
    Offset offset,
    double spreadRadius,
  });
}

/// @nodoc
class _$DSRoleVisibilityShadowCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityShadow
>
    implements $DSRoleVisibilityShadowCopyWith<$Res> {
  _$DSRoleVisibilityShadowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityShadow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? opacity = null,
    Object? blurRadius = null,
    Object? offset = null,
    Object? spreadRadius = null,
  }) {
    return _then(
      _value.copyWith(
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color,
            opacity: null == opacity
                ? _value.opacity
                : opacity // ignore: cast_nullable_to_non_nullable
                      as double,
            blurRadius: null == blurRadius
                ? _value.blurRadius
                : blurRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            offset: null == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as Offset,
            spreadRadius: null == spreadRadius
                ? _value.spreadRadius
                : spreadRadius // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityShadowImplCopyWith<$Res>
    implements $DSRoleVisibilityShadowCopyWith<$Res> {
  factory _$$DSRoleVisibilityShadowImplCopyWith(
    _$DSRoleVisibilityShadowImpl value,
    $Res Function(_$DSRoleVisibilityShadowImpl) then,
  ) = __$$DSRoleVisibilityShadowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color color,
    double opacity,
    double blurRadius,
    Offset offset,
    double spreadRadius,
  });
}

/// @nodoc
class __$$DSRoleVisibilityShadowImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityShadowCopyWithImpl<$Res, _$DSRoleVisibilityShadowImpl>
    implements _$$DSRoleVisibilityShadowImplCopyWith<$Res> {
  __$$DSRoleVisibilityShadowImplCopyWithImpl(
    _$DSRoleVisibilityShadowImpl _value,
    $Res Function(_$DSRoleVisibilityShadowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityShadow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? opacity = null,
    Object? blurRadius = null,
    Object? offset = null,
    Object? spreadRadius = null,
  }) {
    return _then(
      _$DSRoleVisibilityShadowImpl(
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color,
        opacity: null == opacity
            ? _value.opacity
            : opacity // ignore: cast_nullable_to_non_nullable
                  as double,
        blurRadius: null == blurRadius
            ? _value.blurRadius
            : blurRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as Offset,
        spreadRadius: null == spreadRadius
            ? _value.spreadRadius
            : spreadRadius // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityShadowImpl implements _DSRoleVisibilityShadow {
  const _$DSRoleVisibilityShadowImpl({
    this.color = Colors.black26,
    this.opacity = 0.3,
    this.blurRadius = 4.0,
    this.offset = Offset.zero,
    this.spreadRadius = 1.0,
  });

  @override
  @JsonKey()
  final Color color;
  @override
  @JsonKey()
  final double opacity;
  @override
  @JsonKey()
  final double blurRadius;
  @override
  @JsonKey()
  final Offset offset;
  @override
  @JsonKey()
  final double spreadRadius;

  @override
  String toString() {
    return 'DSRoleVisibilityShadow(color: $color, opacity: $opacity, blurRadius: $blurRadius, offset: $offset, spreadRadius: $spreadRadius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityShadowImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.opacity, opacity) || other.opacity == opacity) &&
            (identical(other.blurRadius, blurRadius) ||
                other.blurRadius == blurRadius) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.spreadRadius, spreadRadius) ||
                other.spreadRadius == spreadRadius));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    color,
    opacity,
    blurRadius,
    offset,
    spreadRadius,
  );

  /// Create a copy of DSRoleVisibilityShadow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityShadowImplCopyWith<_$DSRoleVisibilityShadowImpl>
  get copyWith =>
      __$$DSRoleVisibilityShadowImplCopyWithImpl<_$DSRoleVisibilityShadowImpl>(
        this,
        _$identity,
      );
}

abstract class _DSRoleVisibilityShadow implements DSRoleVisibilityShadow {
  const factory _DSRoleVisibilityShadow({
    final Color color,
    final double opacity,
    final double blurRadius,
    final Offset offset,
    final double spreadRadius,
  }) = _$DSRoleVisibilityShadowImpl;

  @override
  Color get color;
  @override
  double get opacity;
  @override
  double get blurRadius;
  @override
  Offset get offset;
  @override
  double get spreadRadius;

  /// Create a copy of DSRoleVisibilityShadow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityShadowImplCopyWith<_$DSRoleVisibilityShadowImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSRoleVisibilityInputDecoration {
  String? get labelText => throw _privateConstructorUsedError;
  String? get hintText => throw _privateConstructorUsedError;
  String? get helperText => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  Widget? get prefixIcon => throw _privateConstructorUsedError;
  Widget? get suffixIcon => throw _privateConstructorUsedError;
  bool get filled => throw _privateConstructorUsedError;
  Color? get fillColor => throw _privateConstructorUsedError;
  InputBorder? get border => throw _privateConstructorUsedError;
  InputBorder? get enabledBorder => throw _privateConstructorUsedError;
  InputBorder? get focusedBorder => throw _privateConstructorUsedError;
  InputBorder? get errorBorder => throw _privateConstructorUsedError;
  InputBorder? get disabledBorder => throw _privateConstructorUsedError;
  DSRoleVisibilityPadding get contentPadding =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSRoleVisibilityInputDecoration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSRoleVisibilityInputDecorationCopyWith<DSRoleVisibilityInputDecoration>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSRoleVisibilityInputDecorationCopyWith<$Res> {
  factory $DSRoleVisibilityInputDecorationCopyWith(
    DSRoleVisibilityInputDecoration value,
    $Res Function(DSRoleVisibilityInputDecoration) then,
  ) =
      _$DSRoleVisibilityInputDecorationCopyWithImpl<
        $Res,
        DSRoleVisibilityInputDecoration
      >;
  @useResult
  $Res call({
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool filled,
    Color? fillColor,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    DSRoleVisibilityPadding contentPadding,
  });

  $DSRoleVisibilityPaddingCopyWith<$Res> get contentPadding;
}

/// @nodoc
class _$DSRoleVisibilityInputDecorationCopyWithImpl<
  $Res,
  $Val extends DSRoleVisibilityInputDecoration
>
    implements $DSRoleVisibilityInputDecorationCopyWith<$Res> {
  _$DSRoleVisibilityInputDecorationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSRoleVisibilityInputDecoration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? labelText = freezed,
    Object? hintText = freezed,
    Object? helperText = freezed,
    Object? errorText = freezed,
    Object? prefixIcon = freezed,
    Object? suffixIcon = freezed,
    Object? filled = null,
    Object? fillColor = freezed,
    Object? border = freezed,
    Object? enabledBorder = freezed,
    Object? focusedBorder = freezed,
    Object? errorBorder = freezed,
    Object? disabledBorder = freezed,
    Object? contentPadding = null,
  }) {
    return _then(
      _value.copyWith(
            labelText: freezed == labelText
                ? _value.labelText
                : labelText // ignore: cast_nullable_to_non_nullable
                      as String?,
            hintText: freezed == hintText
                ? _value.hintText
                : hintText // ignore: cast_nullable_to_non_nullable
                      as String?,
            helperText: freezed == helperText
                ? _value.helperText
                : helperText // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorText: freezed == errorText
                ? _value.errorText
                : errorText // ignore: cast_nullable_to_non_nullable
                      as String?,
            prefixIcon: freezed == prefixIcon
                ? _value.prefixIcon
                : prefixIcon // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            suffixIcon: freezed == suffixIcon
                ? _value.suffixIcon
                : suffixIcon // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            filled: null == filled
                ? _value.filled
                : filled // ignore: cast_nullable_to_non_nullable
                      as bool,
            fillColor: freezed == fillColor
                ? _value.fillColor
                : fillColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            border: freezed == border
                ? _value.border
                : border // ignore: cast_nullable_to_non_nullable
                      as InputBorder?,
            enabledBorder: freezed == enabledBorder
                ? _value.enabledBorder
                : enabledBorder // ignore: cast_nullable_to_non_nullable
                      as InputBorder?,
            focusedBorder: freezed == focusedBorder
                ? _value.focusedBorder
                : focusedBorder // ignore: cast_nullable_to_non_nullable
                      as InputBorder?,
            errorBorder: freezed == errorBorder
                ? _value.errorBorder
                : errorBorder // ignore: cast_nullable_to_non_nullable
                      as InputBorder?,
            disabledBorder: freezed == disabledBorder
                ? _value.disabledBorder
                : disabledBorder // ignore: cast_nullable_to_non_nullable
                      as InputBorder?,
            contentPadding: null == contentPadding
                ? _value.contentPadding
                : contentPadding // ignore: cast_nullable_to_non_nullable
                      as DSRoleVisibilityPadding,
          )
          as $Val,
    );
  }

  /// Create a copy of DSRoleVisibilityInputDecoration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSRoleVisibilityPaddingCopyWith<$Res> get contentPadding {
    return $DSRoleVisibilityPaddingCopyWith<$Res>(_value.contentPadding, (
      value,
    ) {
      return _then(_value.copyWith(contentPadding: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSRoleVisibilityInputDecorationImplCopyWith<$Res>
    implements $DSRoleVisibilityInputDecorationCopyWith<$Res> {
  factory _$$DSRoleVisibilityInputDecorationImplCopyWith(
    _$DSRoleVisibilityInputDecorationImpl value,
    $Res Function(_$DSRoleVisibilityInputDecorationImpl) then,
  ) = __$$DSRoleVisibilityInputDecorationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool filled,
    Color? fillColor,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    DSRoleVisibilityPadding contentPadding,
  });

  @override
  $DSRoleVisibilityPaddingCopyWith<$Res> get contentPadding;
}

/// @nodoc
class __$$DSRoleVisibilityInputDecorationImplCopyWithImpl<$Res>
    extends
        _$DSRoleVisibilityInputDecorationCopyWithImpl<
          $Res,
          _$DSRoleVisibilityInputDecorationImpl
        >
    implements _$$DSRoleVisibilityInputDecorationImplCopyWith<$Res> {
  __$$DSRoleVisibilityInputDecorationImplCopyWithImpl(
    _$DSRoleVisibilityInputDecorationImpl _value,
    $Res Function(_$DSRoleVisibilityInputDecorationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSRoleVisibilityInputDecoration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? labelText = freezed,
    Object? hintText = freezed,
    Object? helperText = freezed,
    Object? errorText = freezed,
    Object? prefixIcon = freezed,
    Object? suffixIcon = freezed,
    Object? filled = null,
    Object? fillColor = freezed,
    Object? border = freezed,
    Object? enabledBorder = freezed,
    Object? focusedBorder = freezed,
    Object? errorBorder = freezed,
    Object? disabledBorder = freezed,
    Object? contentPadding = null,
  }) {
    return _then(
      _$DSRoleVisibilityInputDecorationImpl(
        labelText: freezed == labelText
            ? _value.labelText
            : labelText // ignore: cast_nullable_to_non_nullable
                  as String?,
        hintText: freezed == hintText
            ? _value.hintText
            : hintText // ignore: cast_nullable_to_non_nullable
                  as String?,
        helperText: freezed == helperText
            ? _value.helperText
            : helperText // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorText: freezed == errorText
            ? _value.errorText
            : errorText // ignore: cast_nullable_to_non_nullable
                  as String?,
        prefixIcon: freezed == prefixIcon
            ? _value.prefixIcon
            : prefixIcon // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        suffixIcon: freezed == suffixIcon
            ? _value.suffixIcon
            : suffixIcon // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        filled: null == filled
            ? _value.filled
            : filled // ignore: cast_nullable_to_non_nullable
                  as bool,
        fillColor: freezed == fillColor
            ? _value.fillColor
            : fillColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        border: freezed == border
            ? _value.border
            : border // ignore: cast_nullable_to_non_nullable
                  as InputBorder?,
        enabledBorder: freezed == enabledBorder
            ? _value.enabledBorder
            : enabledBorder // ignore: cast_nullable_to_non_nullable
                  as InputBorder?,
        focusedBorder: freezed == focusedBorder
            ? _value.focusedBorder
            : focusedBorder // ignore: cast_nullable_to_non_nullable
                  as InputBorder?,
        errorBorder: freezed == errorBorder
            ? _value.errorBorder
            : errorBorder // ignore: cast_nullable_to_non_nullable
                  as InputBorder?,
        disabledBorder: freezed == disabledBorder
            ? _value.disabledBorder
            : disabledBorder // ignore: cast_nullable_to_non_nullable
                  as InputBorder?,
        contentPadding: null == contentPadding
            ? _value.contentPadding
            : contentPadding // ignore: cast_nullable_to_non_nullable
                  as DSRoleVisibilityPadding,
      ),
    );
  }
}

/// @nodoc

class _$DSRoleVisibilityInputDecorationImpl
    implements _DSRoleVisibilityInputDecoration {
  const _$DSRoleVisibilityInputDecorationImpl({
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.filled = true,
    this.fillColor,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.contentPadding = const DSRoleVisibilityPadding(),
  });

  @override
  final String? labelText;
  @override
  final String? hintText;
  @override
  final String? helperText;
  @override
  final String? errorText;
  @override
  final Widget? prefixIcon;
  @override
  final Widget? suffixIcon;
  @override
  @JsonKey()
  final bool filled;
  @override
  final Color? fillColor;
  @override
  final InputBorder? border;
  @override
  final InputBorder? enabledBorder;
  @override
  final InputBorder? focusedBorder;
  @override
  final InputBorder? errorBorder;
  @override
  final InputBorder? disabledBorder;
  @override
  @JsonKey()
  final DSRoleVisibilityPadding contentPadding;

  @override
  String toString() {
    return 'DSRoleVisibilityInputDecoration(labelText: $labelText, hintText: $hintText, helperText: $helperText, errorText: $errorText, prefixIcon: $prefixIcon, suffixIcon: $suffixIcon, filled: $filled, fillColor: $fillColor, border: $border, enabledBorder: $enabledBorder, focusedBorder: $focusedBorder, errorBorder: $errorBorder, disabledBorder: $disabledBorder, contentPadding: $contentPadding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSRoleVisibilityInputDecorationImpl &&
            (identical(other.labelText, labelText) ||
                other.labelText == labelText) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText) &&
            (identical(other.helperText, helperText) ||
                other.helperText == helperText) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.prefixIcon, prefixIcon) ||
                other.prefixIcon == prefixIcon) &&
            (identical(other.suffixIcon, suffixIcon) ||
                other.suffixIcon == suffixIcon) &&
            (identical(other.filled, filled) || other.filled == filled) &&
            (identical(other.fillColor, fillColor) ||
                other.fillColor == fillColor) &&
            (identical(other.border, border) || other.border == border) &&
            (identical(other.enabledBorder, enabledBorder) ||
                other.enabledBorder == enabledBorder) &&
            (identical(other.focusedBorder, focusedBorder) ||
                other.focusedBorder == focusedBorder) &&
            (identical(other.errorBorder, errorBorder) ||
                other.errorBorder == errorBorder) &&
            (identical(other.disabledBorder, disabledBorder) ||
                other.disabledBorder == disabledBorder) &&
            (identical(other.contentPadding, contentPadding) ||
                other.contentPadding == contentPadding));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    labelText,
    hintText,
    helperText,
    errorText,
    prefixIcon,
    suffixIcon,
    filled,
    fillColor,
    border,
    enabledBorder,
    focusedBorder,
    errorBorder,
    disabledBorder,
    contentPadding,
  );

  /// Create a copy of DSRoleVisibilityInputDecoration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSRoleVisibilityInputDecorationImplCopyWith<
    _$DSRoleVisibilityInputDecorationImpl
  >
  get copyWith =>
      __$$DSRoleVisibilityInputDecorationImplCopyWithImpl<
        _$DSRoleVisibilityInputDecorationImpl
      >(this, _$identity);
}

abstract class _DSRoleVisibilityInputDecoration
    implements DSRoleVisibilityInputDecoration {
  const factory _DSRoleVisibilityInputDecoration({
    final String? labelText,
    final String? hintText,
    final String? helperText,
    final String? errorText,
    final Widget? prefixIcon,
    final Widget? suffixIcon,
    final bool filled,
    final Color? fillColor,
    final InputBorder? border,
    final InputBorder? enabledBorder,
    final InputBorder? focusedBorder,
    final InputBorder? errorBorder,
    final InputBorder? disabledBorder,
    final DSRoleVisibilityPadding contentPadding,
  }) = _$DSRoleVisibilityInputDecorationImpl;

  @override
  String? get labelText;
  @override
  String? get hintText;
  @override
  String? get helperText;
  @override
  String? get errorText;
  @override
  Widget? get prefixIcon;
  @override
  Widget? get suffixIcon;
  @override
  bool get filled;
  @override
  Color? get fillColor;
  @override
  InputBorder? get border;
  @override
  InputBorder? get enabledBorder;
  @override
  InputBorder? get focusedBorder;
  @override
  InputBorder? get errorBorder;
  @override
  InputBorder? get disabledBorder;
  @override
  DSRoleVisibilityPadding get contentPadding;

  /// Create a copy of DSRoleVisibilityInputDecoration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSRoleVisibilityInputDecorationImplCopyWith<
    _$DSRoleVisibilityInputDecorationImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
