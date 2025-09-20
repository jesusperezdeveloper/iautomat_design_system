// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_accordion_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSAccordionConfig {
  /// Variante del accordion
  DSAccordionVariant get variant => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSAccordionState get state => throw _privateConstructorUsedError;

  /// Configuración de colores (solo design tokens)
  DSAccordionColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado (solo design tokens)
  DSAccordionSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de tipografía (solo design tokens)
  DSAccordionTypography? get typography => throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSAccordionAnimations? get animations => throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSAccordionBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSAccordionAccessibilityConfig? get accessibility =>
      throw _privateConstructorUsedError;

  /// Si permite múltiples elementos expandidos simultáneamente
  bool get allowMultiple => throw _privateConstructorUsedError;

  /// Si muestra dividers entre elementos
  bool get showDividers => throw _privateConstructorUsedError;

  /// Si usa iconos Material para expandir/colapsar
  bool get useMaterialIcons => throw _privateConstructorUsedError;

  /// Radio de border radius personalizado
  double? get borderRadius => throw _privateConstructorUsedError;

  /// Elevación del accordion
  double get elevation => throw _privateConstructorUsedError;

  /// Mensaje cuando no hay items
  String get emptyMessage => throw _privateConstructorUsedError;

  /// Mensaje cuando está cargando
  String get loadingMessage => throw _privateConstructorUsedError;

  /// Mensaje de error personalizado
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionConfigCopyWith<DSAccordionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionConfigCopyWith<$Res> {
  factory $DSAccordionConfigCopyWith(
    DSAccordionConfig value,
    $Res Function(DSAccordionConfig) then,
  ) = _$DSAccordionConfigCopyWithImpl<$Res, DSAccordionConfig>;
  @useResult
  $Res call({
    DSAccordionVariant variant,
    DSAccordionState state,
    DSAccordionColors? colors,
    DSAccordionSpacing? spacing,
    DSAccordionTypography? typography,
    DSAccordionAnimations? animations,
    DSAccordionBehavior? behavior,
    DSAccordionAccessibilityConfig? accessibility,
    bool allowMultiple,
    bool showDividers,
    bool useMaterialIcons,
    double? borderRadius,
    double elevation,
    String emptyMessage,
    String loadingMessage,
    String? errorMessage,
  });

  $DSAccordionColorsCopyWith<$Res>? get colors;
  $DSAccordionSpacingCopyWith<$Res>? get spacing;
  $DSAccordionTypographyCopyWith<$Res>? get typography;
  $DSAccordionAnimationsCopyWith<$Res>? get animations;
  $DSAccordionBehaviorCopyWith<$Res>? get behavior;
  $DSAccordionAccessibilityConfigCopyWith<$Res>? get accessibility;
}

/// @nodoc
class _$DSAccordionConfigCopyWithImpl<$Res, $Val extends DSAccordionConfig>
    implements $DSAccordionConfigCopyWith<$Res> {
  _$DSAccordionConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? typography = freezed,
    Object? animations = freezed,
    Object? behavior = freezed,
    Object? accessibility = freezed,
    Object? allowMultiple = null,
    Object? showDividers = null,
    Object? useMaterialIcons = null,
    Object? borderRadius = freezed,
    Object? elevation = null,
    Object? emptyMessage = null,
    Object? loadingMessage = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSAccordionVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSAccordionState,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSAccordionColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSAccordionSpacing?,
            typography: freezed == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as DSAccordionTypography?,
            animations: freezed == animations
                ? _value.animations
                : animations // ignore: cast_nullable_to_non_nullable
                      as DSAccordionAnimations?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSAccordionBehavior?,
            accessibility: freezed == accessibility
                ? _value.accessibility
                : accessibility // ignore: cast_nullable_to_non_nullable
                      as DSAccordionAccessibilityConfig?,
            allowMultiple: null == allowMultiple
                ? _value.allowMultiple
                : allowMultiple // ignore: cast_nullable_to_non_nullable
                      as bool,
            showDividers: null == showDividers
                ? _value.showDividers
                : showDividers // ignore: cast_nullable_to_non_nullable
                      as bool,
            useMaterialIcons: null == useMaterialIcons
                ? _value.useMaterialIcons
                : useMaterialIcons // ignore: cast_nullable_to_non_nullable
                      as bool,
            borderRadius: freezed == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double?,
            elevation: null == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as double,
            emptyMessage: null == emptyMessage
                ? _value.emptyMessage
                : emptyMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            loadingMessage: null == loadingMessage
                ? _value.loadingMessage
                : loadingMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSAccordionColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSAccordionSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionTypographyCopyWith<$Res>? get typography {
    if (_value.typography == null) {
      return null;
    }

    return $DSAccordionTypographyCopyWith<$Res>(_value.typography!, (value) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionAnimationsCopyWith<$Res>? get animations {
    if (_value.animations == null) {
      return null;
    }

    return $DSAccordionAnimationsCopyWith<$Res>(_value.animations!, (value) {
      return _then(_value.copyWith(animations: value) as $Val);
    });
  }

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSAccordionBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionAccessibilityConfigCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $DSAccordionAccessibilityConfigCopyWith<$Res>(
      _value.accessibility!,
      (value) {
        return _then(_value.copyWith(accessibility: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionConfigImplCopyWith<$Res>
    implements $DSAccordionConfigCopyWith<$Res> {
  factory _$$DSAccordionConfigImplCopyWith(
    _$DSAccordionConfigImpl value,
    $Res Function(_$DSAccordionConfigImpl) then,
  ) = __$$DSAccordionConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSAccordionVariant variant,
    DSAccordionState state,
    DSAccordionColors? colors,
    DSAccordionSpacing? spacing,
    DSAccordionTypography? typography,
    DSAccordionAnimations? animations,
    DSAccordionBehavior? behavior,
    DSAccordionAccessibilityConfig? accessibility,
    bool allowMultiple,
    bool showDividers,
    bool useMaterialIcons,
    double? borderRadius,
    double elevation,
    String emptyMessage,
    String loadingMessage,
    String? errorMessage,
  });

  @override
  $DSAccordionColorsCopyWith<$Res>? get colors;
  @override
  $DSAccordionSpacingCopyWith<$Res>? get spacing;
  @override
  $DSAccordionTypographyCopyWith<$Res>? get typography;
  @override
  $DSAccordionAnimationsCopyWith<$Res>? get animations;
  @override
  $DSAccordionBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSAccordionAccessibilityConfigCopyWith<$Res>? get accessibility;
}

/// @nodoc
class __$$DSAccordionConfigImplCopyWithImpl<$Res>
    extends _$DSAccordionConfigCopyWithImpl<$Res, _$DSAccordionConfigImpl>
    implements _$$DSAccordionConfigImplCopyWith<$Res> {
  __$$DSAccordionConfigImplCopyWithImpl(
    _$DSAccordionConfigImpl _value,
    $Res Function(_$DSAccordionConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? typography = freezed,
    Object? animations = freezed,
    Object? behavior = freezed,
    Object? accessibility = freezed,
    Object? allowMultiple = null,
    Object? showDividers = null,
    Object? useMaterialIcons = null,
    Object? borderRadius = freezed,
    Object? elevation = null,
    Object? emptyMessage = null,
    Object? loadingMessage = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$DSAccordionConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSAccordionVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSAccordionState,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSAccordionColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSAccordionSpacing?,
        typography: freezed == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as DSAccordionTypography?,
        animations: freezed == animations
            ? _value.animations
            : animations // ignore: cast_nullable_to_non_nullable
                  as DSAccordionAnimations?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSAccordionBehavior?,
        accessibility: freezed == accessibility
            ? _value.accessibility
            : accessibility // ignore: cast_nullable_to_non_nullable
                  as DSAccordionAccessibilityConfig?,
        allowMultiple: null == allowMultiple
            ? _value.allowMultiple
            : allowMultiple // ignore: cast_nullable_to_non_nullable
                  as bool,
        showDividers: null == showDividers
            ? _value.showDividers
            : showDividers // ignore: cast_nullable_to_non_nullable
                  as bool,
        useMaterialIcons: null == useMaterialIcons
            ? _value.useMaterialIcons
            : useMaterialIcons // ignore: cast_nullable_to_non_nullable
                  as bool,
        borderRadius: freezed == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double?,
        elevation: null == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as double,
        emptyMessage: null == emptyMessage
            ? _value.emptyMessage
            : emptyMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        loadingMessage: null == loadingMessage
            ? _value.loadingMessage
            : loadingMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionConfigImpl implements _DSAccordionConfig {
  const _$DSAccordionConfigImpl({
    this.variant = DSAccordionVariant.single,
    this.state = DSAccordionState.defaultState,
    this.colors,
    this.spacing,
    this.typography,
    this.animations,
    this.behavior,
    this.accessibility,
    this.allowMultiple = false,
    this.showDividers = true,
    this.useMaterialIcons = true,
    this.borderRadius,
    this.elevation = 0.0,
    this.emptyMessage = 'No hay elementos disponibles',
    this.loadingMessage = 'Cargando elementos...',
    this.errorMessage,
  });

  /// Variante del accordion
  @override
  @JsonKey()
  final DSAccordionVariant variant;

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSAccordionState state;

  /// Configuración de colores (solo design tokens)
  @override
  final DSAccordionColors? colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  final DSAccordionSpacing? spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  final DSAccordionTypography? typography;

  /// Configuración de animaciones
  @override
  final DSAccordionAnimations? animations;

  /// Configuración de comportamiento
  @override
  final DSAccordionBehavior? behavior;

  /// Configuración de accesibilidad
  @override
  final DSAccordionAccessibilityConfig? accessibility;

  /// Si permite múltiples elementos expandidos simultáneamente
  @override
  @JsonKey()
  final bool allowMultiple;

  /// Si muestra dividers entre elementos
  @override
  @JsonKey()
  final bool showDividers;

  /// Si usa iconos Material para expandir/colapsar
  @override
  @JsonKey()
  final bool useMaterialIcons;

  /// Radio de border radius personalizado
  @override
  final double? borderRadius;

  /// Elevación del accordion
  @override
  @JsonKey()
  final double elevation;

  /// Mensaje cuando no hay items
  @override
  @JsonKey()
  final String emptyMessage;

  /// Mensaje cuando está cargando
  @override
  @JsonKey()
  final String loadingMessage;

  /// Mensaje de error personalizado
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DSAccordionConfig(variant: $variant, state: $state, colors: $colors, spacing: $spacing, typography: $typography, animations: $animations, behavior: $behavior, accessibility: $accessibility, allowMultiple: $allowMultiple, showDividers: $showDividers, useMaterialIcons: $useMaterialIcons, borderRadius: $borderRadius, elevation: $elevation, emptyMessage: $emptyMessage, loadingMessage: $loadingMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
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
            (identical(other.allowMultiple, allowMultiple) ||
                other.allowMultiple == allowMultiple) &&
            (identical(other.showDividers, showDividers) ||
                other.showDividers == showDividers) &&
            (identical(other.useMaterialIcons, useMaterialIcons) ||
                other.useMaterialIcons == useMaterialIcons) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.emptyMessage, emptyMessage) ||
                other.emptyMessage == emptyMessage) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    state,
    colors,
    spacing,
    typography,
    animations,
    behavior,
    accessibility,
    allowMultiple,
    showDividers,
    useMaterialIcons,
    borderRadius,
    elevation,
    emptyMessage,
    loadingMessage,
    errorMessage,
  );

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionConfigImplCopyWith<_$DSAccordionConfigImpl> get copyWith =>
      __$$DSAccordionConfigImplCopyWithImpl<_$DSAccordionConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionConfig implements DSAccordionConfig {
  const factory _DSAccordionConfig({
    final DSAccordionVariant variant,
    final DSAccordionState state,
    final DSAccordionColors? colors,
    final DSAccordionSpacing? spacing,
    final DSAccordionTypography? typography,
    final DSAccordionAnimations? animations,
    final DSAccordionBehavior? behavior,
    final DSAccordionAccessibilityConfig? accessibility,
    final bool allowMultiple,
    final bool showDividers,
    final bool useMaterialIcons,
    final double? borderRadius,
    final double elevation,
    final String emptyMessage,
    final String loadingMessage,
    final String? errorMessage,
  }) = _$DSAccordionConfigImpl;

  /// Variante del accordion
  @override
  DSAccordionVariant get variant;

  /// Estado actual del componente
  @override
  DSAccordionState get state;

  /// Configuración de colores (solo design tokens)
  @override
  DSAccordionColors? get colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  DSAccordionSpacing? get spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  DSAccordionTypography? get typography;

  /// Configuración de animaciones
  @override
  DSAccordionAnimations? get animations;

  /// Configuración de comportamiento
  @override
  DSAccordionBehavior? get behavior;

  /// Configuración de accesibilidad
  @override
  DSAccordionAccessibilityConfig? get accessibility;

  /// Si permite múltiples elementos expandidos simultáneamente
  @override
  bool get allowMultiple;

  /// Si muestra dividers entre elementos
  @override
  bool get showDividers;

  /// Si usa iconos Material para expandir/colapsar
  @override
  bool get useMaterialIcons;

  /// Radio de border radius personalizado
  @override
  double? get borderRadius;

  /// Elevación del accordion
  @override
  double get elevation;

  /// Mensaje cuando no hay items
  @override
  String get emptyMessage;

  /// Mensaje cuando está cargando
  @override
  String get loadingMessage;

  /// Mensaje de error personalizado
  @override
  String? get errorMessage;

  /// Create a copy of DSAccordionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionConfigImplCopyWith<_$DSAccordionConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionItem {
  /// Identificador único del elemento
  String get key => throw _privateConstructorUsedError;

  /// Título del elemento
  String get title => throw _privateConstructorUsedError;

  /// Contenido del elemento
  Widget get content => throw _privateConstructorUsedError;

  /// Subtítulo opcional
  String? get subtitle => throw _privateConstructorUsedError;

  /// Icono opcional para el header
  Widget? get icon => throw _privateConstructorUsedError;

  /// Widget trailing personalizado
  Widget? get trailing => throw _privateConstructorUsedError;

  /// Si este elemento está deshabilitado
  bool get disabled => throw _privateConstructorUsedError;

  /// Si este elemento está en estado de carga
  bool get loading => throw _privateConstructorUsedError;

  /// Callback cuando se presiona el elemento
  VoidCallback? get onTap => throw _privateConstructorUsedError;

  /// Callback cuando cambia el estado de expansión
  DSAccordionItemCallback? get onExpansionChanged =>
      throw _privateConstructorUsedError;

  /// Configuración de colores específica para este elemento
  DSAccordionItemColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad específica
  DSAccordionItemAccessibility? get accessibility =>
      throw _privateConstructorUsedError;

  /// Datos adicionales asociados al elemento
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionItemCopyWith<DSAccordionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionItemCopyWith<$Res> {
  factory $DSAccordionItemCopyWith(
    DSAccordionItem value,
    $Res Function(DSAccordionItem) then,
  ) = _$DSAccordionItemCopyWithImpl<$Res, DSAccordionItem>;
  @useResult
  $Res call({
    String key,
    String title,
    Widget content,
    String? subtitle,
    Widget? icon,
    Widget? trailing,
    bool disabled,
    bool loading,
    VoidCallback? onTap,
    DSAccordionItemCallback? onExpansionChanged,
    DSAccordionItemColors? colors,
    DSAccordionItemAccessibility? accessibility,
    Map<String, dynamic>? metadata,
  });

  $DSAccordionItemColorsCopyWith<$Res>? get colors;
  $DSAccordionItemAccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class _$DSAccordionItemCopyWithImpl<$Res, $Val extends DSAccordionItem>
    implements $DSAccordionItemCopyWith<$Res> {
  _$DSAccordionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? content = null,
    Object? subtitle = freezed,
    Object? icon = freezed,
    Object? trailing = freezed,
    Object? disabled = null,
    Object? loading = null,
    Object? onTap = freezed,
    Object? onExpansionChanged = freezed,
    Object? colors = freezed,
    Object? accessibility = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as Widget,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            trailing: freezed == trailing
                ? _value.trailing
                : trailing // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            disabled: null == disabled
                ? _value.disabled
                : disabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            loading: null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                      as bool,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onExpansionChanged: freezed == onExpansionChanged
                ? _value.onExpansionChanged
                : onExpansionChanged // ignore: cast_nullable_to_non_nullable
                      as DSAccordionItemCallback?,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSAccordionItemColors?,
            accessibility: freezed == accessibility
                ? _value.accessibility
                : accessibility // ignore: cast_nullable_to_non_nullable
                      as DSAccordionItemAccessibility?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionItemColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSAccordionItemColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSAccordionItemAccessibilityCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $DSAccordionItemAccessibilityCopyWith<$Res>(_value.accessibility!, (
      value,
    ) {
      return _then(_value.copyWith(accessibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSAccordionItemImplCopyWith<$Res>
    implements $DSAccordionItemCopyWith<$Res> {
  factory _$$DSAccordionItemImplCopyWith(
    _$DSAccordionItemImpl value,
    $Res Function(_$DSAccordionItemImpl) then,
  ) = __$$DSAccordionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String key,
    String title,
    Widget content,
    String? subtitle,
    Widget? icon,
    Widget? trailing,
    bool disabled,
    bool loading,
    VoidCallback? onTap,
    DSAccordionItemCallback? onExpansionChanged,
    DSAccordionItemColors? colors,
    DSAccordionItemAccessibility? accessibility,
    Map<String, dynamic>? metadata,
  });

  @override
  $DSAccordionItemColorsCopyWith<$Res>? get colors;
  @override
  $DSAccordionItemAccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class __$$DSAccordionItemImplCopyWithImpl<$Res>
    extends _$DSAccordionItemCopyWithImpl<$Res, _$DSAccordionItemImpl>
    implements _$$DSAccordionItemImplCopyWith<$Res> {
  __$$DSAccordionItemImplCopyWithImpl(
    _$DSAccordionItemImpl _value,
    $Res Function(_$DSAccordionItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? content = null,
    Object? subtitle = freezed,
    Object? icon = freezed,
    Object? trailing = freezed,
    Object? disabled = null,
    Object? loading = null,
    Object? onTap = freezed,
    Object? onExpansionChanged = freezed,
    Object? colors = freezed,
    Object? accessibility = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$DSAccordionItemImpl(
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as Widget,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        trailing: freezed == trailing
            ? _value.trailing
            : trailing // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        disabled: null == disabled
            ? _value.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onExpansionChanged: freezed == onExpansionChanged
            ? _value.onExpansionChanged
            : onExpansionChanged // ignore: cast_nullable_to_non_nullable
                  as DSAccordionItemCallback?,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSAccordionItemColors?,
        accessibility: freezed == accessibility
            ? _value.accessibility
            : accessibility // ignore: cast_nullable_to_non_nullable
                  as DSAccordionItemAccessibility?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionItemImpl implements _DSAccordionItem {
  const _$DSAccordionItemImpl({
    required this.key,
    required this.title,
    required this.content,
    this.subtitle,
    this.icon,
    this.trailing,
    this.disabled = false,
    this.loading = false,
    this.onTap,
    this.onExpansionChanged,
    this.colors,
    this.accessibility,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  /// Identificador único del elemento
  @override
  final String key;

  /// Título del elemento
  @override
  final String title;

  /// Contenido del elemento
  @override
  final Widget content;

  /// Subtítulo opcional
  @override
  final String? subtitle;

  /// Icono opcional para el header
  @override
  final Widget? icon;

  /// Widget trailing personalizado
  @override
  final Widget? trailing;

  /// Si este elemento está deshabilitado
  @override
  @JsonKey()
  final bool disabled;

  /// Si este elemento está en estado de carga
  @override
  @JsonKey()
  final bool loading;

  /// Callback cuando se presiona el elemento
  @override
  final VoidCallback? onTap;

  /// Callback cuando cambia el estado de expansión
  @override
  final DSAccordionItemCallback? onExpansionChanged;

  /// Configuración de colores específica para este elemento
  @override
  final DSAccordionItemColors? colors;

  /// Configuración de accesibilidad específica
  @override
  final DSAccordionItemAccessibility? accessibility;

  /// Datos adicionales asociados al elemento
  final Map<String, dynamic>? _metadata;

  /// Datos adicionales asociados al elemento
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DSAccordionItem(key: $key, title: $title, content: $content, subtitle: $subtitle, icon: $icon, trailing: $trailing, disabled: $disabled, loading: $loading, onTap: $onTap, onExpansionChanged: $onExpansionChanged, colors: $colors, accessibility: $accessibility, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionItemImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.trailing, trailing) ||
                other.trailing == trailing) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.onExpansionChanged, onExpansionChanged) ||
                other.onExpansionChanged == onExpansionChanged) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    key,
    title,
    content,
    subtitle,
    icon,
    trailing,
    disabled,
    loading,
    onTap,
    onExpansionChanged,
    colors,
    accessibility,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionItemImplCopyWith<_$DSAccordionItemImpl> get copyWith =>
      __$$DSAccordionItemImplCopyWithImpl<_$DSAccordionItemImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionItem implements DSAccordionItem {
  const factory _DSAccordionItem({
    required final String key,
    required final String title,
    required final Widget content,
    final String? subtitle,
    final Widget? icon,
    final Widget? trailing,
    final bool disabled,
    final bool loading,
    final VoidCallback? onTap,
    final DSAccordionItemCallback? onExpansionChanged,
    final DSAccordionItemColors? colors,
    final DSAccordionItemAccessibility? accessibility,
    final Map<String, dynamic>? metadata,
  }) = _$DSAccordionItemImpl;

  /// Identificador único del elemento
  @override
  String get key;

  /// Título del elemento
  @override
  String get title;

  /// Contenido del elemento
  @override
  Widget get content;

  /// Subtítulo opcional
  @override
  String? get subtitle;

  /// Icono opcional para el header
  @override
  Widget? get icon;

  /// Widget trailing personalizado
  @override
  Widget? get trailing;

  /// Si este elemento está deshabilitado
  @override
  bool get disabled;

  /// Si este elemento está en estado de carga
  @override
  bool get loading;

  /// Callback cuando se presiona el elemento
  @override
  VoidCallback? get onTap;

  /// Callback cuando cambia el estado de expansión
  @override
  DSAccordionItemCallback? get onExpansionChanged;

  /// Configuración de colores específica para este elemento
  @override
  DSAccordionItemColors? get colors;

  /// Configuración de accesibilidad específica
  @override
  DSAccordionItemAccessibility? get accessibility;

  /// Datos adicionales asociados al elemento
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of DSAccordionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionItemImplCopyWith<_$DSAccordionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionColors {
  /// Color de fondo del accordion
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color de superficie para elementos
  Color? get surfaceColor => throw _privateConstructorUsedError;

  /// Color del header
  Color? get headerColor => throw _privateConstructorUsedError;

  /// Color del header cuando está expandido
  Color? get headerExpandedColor => throw _privateConstructorUsedError;

  /// Color del contenido
  Color? get contentColor => throw _privateConstructorUsedError;

  /// Color de los bordes
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Color del divider
  Color? get dividerColor => throw _privateConstructorUsedError;

  /// Color del texto del título
  Color? get titleColor => throw _privateConstructorUsedError;

  /// Color del texto del subtítulo
  Color? get subtitleColor => throw _privateConstructorUsedError;

  /// Color del texto del contenido
  Color? get contentTextColor => throw _privateConstructorUsedError;

  /// Color del icono de expansión
  Color? get expansionIconColor => throw _privateConstructorUsedError;

  /// Color en estado hover
  Color? get hoverColor => throw _privateConstructorUsedError;

  /// Color en estado pressed
  Color? get pressedColor => throw _privateConstructorUsedError;

  /// Color en estado focus
  Color? get focusColor => throw _privateConstructorUsedError;

  /// Color en estado selected
  Color? get selectedColor => throw _privateConstructorUsedError;

  /// Color en estado disabled
  Color? get disabledColor => throw _privateConstructorUsedError;

  /// Color de loading
  Color? get loadingColor => throw _privateConstructorUsedError;

  /// Color base del skeleton
  Color? get skeletonBaseColor => throw _privateConstructorUsedError;

  /// Color de highlight del skeleton
  Color? get skeletonHighlightColor => throw _privateConstructorUsedError;

  /// Color de shadow/elevación
  Color? get shadowColor => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionColorsCopyWith<DSAccordionColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionColorsCopyWith<$Res> {
  factory $DSAccordionColorsCopyWith(
    DSAccordionColors value,
    $Res Function(DSAccordionColors) then,
  ) = _$DSAccordionColorsCopyWithImpl<$Res, DSAccordionColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? surfaceColor,
    Color? headerColor,
    Color? headerExpandedColor,
    Color? contentColor,
    Color? borderColor,
    Color? dividerColor,
    Color? titleColor,
    Color? subtitleColor,
    Color? contentTextColor,
    Color? expansionIconColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
    Color? shadowColor,
  });
}

/// @nodoc
class _$DSAccordionColorsCopyWithImpl<$Res, $Val extends DSAccordionColors>
    implements $DSAccordionColorsCopyWith<$Res> {
  _$DSAccordionColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? surfaceColor = freezed,
    Object? headerColor = freezed,
    Object? headerExpandedColor = freezed,
    Object? contentColor = freezed,
    Object? borderColor = freezed,
    Object? dividerColor = freezed,
    Object? titleColor = freezed,
    Object? subtitleColor = freezed,
    Object? contentTextColor = freezed,
    Object? expansionIconColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
    Object? shadowColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            surfaceColor: freezed == surfaceColor
                ? _value.surfaceColor
                : surfaceColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            headerColor: freezed == headerColor
                ? _value.headerColor
                : headerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            headerExpandedColor: freezed == headerExpandedColor
                ? _value.headerExpandedColor
                : headerExpandedColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            contentColor: freezed == contentColor
                ? _value.contentColor
                : contentColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            dividerColor: freezed == dividerColor
                ? _value.dividerColor
                : dividerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            titleColor: freezed == titleColor
                ? _value.titleColor
                : titleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            subtitleColor: freezed == subtitleColor
                ? _value.subtitleColor
                : subtitleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            contentTextColor: freezed == contentTextColor
                ? _value.contentTextColor
                : contentTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            expansionIconColor: freezed == expansionIconColor
                ? _value.expansionIconColor
                : expansionIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            hoverColor: freezed == hoverColor
                ? _value.hoverColor
                : hoverColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            pressedColor: freezed == pressedColor
                ? _value.pressedColor
                : pressedColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            focusColor: freezed == focusColor
                ? _value.focusColor
                : focusColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedColor: freezed == selectedColor
                ? _value.selectedColor
                : selectedColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledColor: freezed == disabledColor
                ? _value.disabledColor
                : disabledColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            loadingColor: freezed == loadingColor
                ? _value.loadingColor
                : loadingColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonBaseColor: freezed == skeletonBaseColor
                ? _value.skeletonBaseColor
                : skeletonBaseColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonHighlightColor: freezed == skeletonHighlightColor
                ? _value.skeletonHighlightColor
                : skeletonHighlightColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionColorsImplCopyWith<$Res>
    implements $DSAccordionColorsCopyWith<$Res> {
  factory _$$DSAccordionColorsImplCopyWith(
    _$DSAccordionColorsImpl value,
    $Res Function(_$DSAccordionColorsImpl) then,
  ) = __$$DSAccordionColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? surfaceColor,
    Color? headerColor,
    Color? headerExpandedColor,
    Color? contentColor,
    Color? borderColor,
    Color? dividerColor,
    Color? titleColor,
    Color? subtitleColor,
    Color? contentTextColor,
    Color? expansionIconColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
    Color? shadowColor,
  });
}

/// @nodoc
class __$$DSAccordionColorsImplCopyWithImpl<$Res>
    extends _$DSAccordionColorsCopyWithImpl<$Res, _$DSAccordionColorsImpl>
    implements _$$DSAccordionColorsImplCopyWith<$Res> {
  __$$DSAccordionColorsImplCopyWithImpl(
    _$DSAccordionColorsImpl _value,
    $Res Function(_$DSAccordionColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? surfaceColor = freezed,
    Object? headerColor = freezed,
    Object? headerExpandedColor = freezed,
    Object? contentColor = freezed,
    Object? borderColor = freezed,
    Object? dividerColor = freezed,
    Object? titleColor = freezed,
    Object? subtitleColor = freezed,
    Object? contentTextColor = freezed,
    Object? expansionIconColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
    Object? shadowColor = freezed,
  }) {
    return _then(
      _$DSAccordionColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceColor: freezed == surfaceColor
            ? _value.surfaceColor
            : surfaceColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        headerColor: freezed == headerColor
            ? _value.headerColor
            : headerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        headerExpandedColor: freezed == headerExpandedColor
            ? _value.headerExpandedColor
            : headerExpandedColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        contentColor: freezed == contentColor
            ? _value.contentColor
            : contentColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        dividerColor: freezed == dividerColor
            ? _value.dividerColor
            : dividerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        titleColor: freezed == titleColor
            ? _value.titleColor
            : titleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        subtitleColor: freezed == subtitleColor
            ? _value.subtitleColor
            : subtitleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        contentTextColor: freezed == contentTextColor
            ? _value.contentTextColor
            : contentTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        expansionIconColor: freezed == expansionIconColor
            ? _value.expansionIconColor
            : expansionIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        hoverColor: freezed == hoverColor
            ? _value.hoverColor
            : hoverColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        pressedColor: freezed == pressedColor
            ? _value.pressedColor
            : pressedColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        focusColor: freezed == focusColor
            ? _value.focusColor
            : focusColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedColor: freezed == selectedColor
            ? _value.selectedColor
            : selectedColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledColor: freezed == disabledColor
            ? _value.disabledColor
            : disabledColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        loadingColor: freezed == loadingColor
            ? _value.loadingColor
            : loadingColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonBaseColor: freezed == skeletonBaseColor
            ? _value.skeletonBaseColor
            : skeletonBaseColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonHighlightColor: freezed == skeletonHighlightColor
            ? _value.skeletonHighlightColor
            : skeletonHighlightColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionColorsImpl implements _DSAccordionColors {
  const _$DSAccordionColorsImpl({
    this.backgroundColor,
    this.surfaceColor,
    this.headerColor,
    this.headerExpandedColor,
    this.contentColor,
    this.borderColor,
    this.dividerColor,
    this.titleColor,
    this.subtitleColor,
    this.contentTextColor,
    this.expansionIconColor,
    this.hoverColor,
    this.pressedColor,
    this.focusColor,
    this.selectedColor,
    this.disabledColor,
    this.loadingColor,
    this.skeletonBaseColor,
    this.skeletonHighlightColor,
    this.shadowColor,
  });

  /// Color de fondo del accordion
  @override
  final Color? backgroundColor;

  /// Color de superficie para elementos
  @override
  final Color? surfaceColor;

  /// Color del header
  @override
  final Color? headerColor;

  /// Color del header cuando está expandido
  @override
  final Color? headerExpandedColor;

  /// Color del contenido
  @override
  final Color? contentColor;

  /// Color de los bordes
  @override
  final Color? borderColor;

  /// Color del divider
  @override
  final Color? dividerColor;

  /// Color del texto del título
  @override
  final Color? titleColor;

  /// Color del texto del subtítulo
  @override
  final Color? subtitleColor;

  /// Color del texto del contenido
  @override
  final Color? contentTextColor;

  /// Color del icono de expansión
  @override
  final Color? expansionIconColor;

  /// Color en estado hover
  @override
  final Color? hoverColor;

  /// Color en estado pressed
  @override
  final Color? pressedColor;

  /// Color en estado focus
  @override
  final Color? focusColor;

  /// Color en estado selected
  @override
  final Color? selectedColor;

  /// Color en estado disabled
  @override
  final Color? disabledColor;

  /// Color de loading
  @override
  final Color? loadingColor;

  /// Color base del skeleton
  @override
  final Color? skeletonBaseColor;

  /// Color de highlight del skeleton
  @override
  final Color? skeletonHighlightColor;

  /// Color de shadow/elevación
  @override
  final Color? shadowColor;

  @override
  String toString() {
    return 'DSAccordionColors(backgroundColor: $backgroundColor, surfaceColor: $surfaceColor, headerColor: $headerColor, headerExpandedColor: $headerExpandedColor, contentColor: $contentColor, borderColor: $borderColor, dividerColor: $dividerColor, titleColor: $titleColor, subtitleColor: $subtitleColor, contentTextColor: $contentTextColor, expansionIconColor: $expansionIconColor, hoverColor: $hoverColor, pressedColor: $pressedColor, focusColor: $focusColor, selectedColor: $selectedColor, disabledColor: $disabledColor, loadingColor: $loadingColor, skeletonBaseColor: $skeletonBaseColor, skeletonHighlightColor: $skeletonHighlightColor, shadowColor: $shadowColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.surfaceColor, surfaceColor) ||
                other.surfaceColor == surfaceColor) &&
            (identical(other.headerColor, headerColor) ||
                other.headerColor == headerColor) &&
            (identical(other.headerExpandedColor, headerExpandedColor) ||
                other.headerExpandedColor == headerExpandedColor) &&
            (identical(other.contentColor, contentColor) ||
                other.contentColor == contentColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.subtitleColor, subtitleColor) ||
                other.subtitleColor == subtitleColor) &&
            (identical(other.contentTextColor, contentTextColor) ||
                other.contentTextColor == contentTextColor) &&
            (identical(other.expansionIconColor, expansionIconColor) ||
                other.expansionIconColor == expansionIconColor) &&
            (identical(other.hoverColor, hoverColor) ||
                other.hoverColor == hoverColor) &&
            (identical(other.pressedColor, pressedColor) ||
                other.pressedColor == pressedColor) &&
            (identical(other.focusColor, focusColor) ||
                other.focusColor == focusColor) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.disabledColor, disabledColor) ||
                other.disabledColor == disabledColor) &&
            (identical(other.loadingColor, loadingColor) ||
                other.loadingColor == loadingColor) &&
            (identical(other.skeletonBaseColor, skeletonBaseColor) ||
                other.skeletonBaseColor == skeletonBaseColor) &&
            (identical(other.skeletonHighlightColor, skeletonHighlightColor) ||
                other.skeletonHighlightColor == skeletonHighlightColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    backgroundColor,
    surfaceColor,
    headerColor,
    headerExpandedColor,
    contentColor,
    borderColor,
    dividerColor,
    titleColor,
    subtitleColor,
    contentTextColor,
    expansionIconColor,
    hoverColor,
    pressedColor,
    focusColor,
    selectedColor,
    disabledColor,
    loadingColor,
    skeletonBaseColor,
    skeletonHighlightColor,
    shadowColor,
  ]);

  /// Create a copy of DSAccordionColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionColorsImplCopyWith<_$DSAccordionColorsImpl> get copyWith =>
      __$$DSAccordionColorsImplCopyWithImpl<_$DSAccordionColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionColors implements DSAccordionColors {
  const factory _DSAccordionColors({
    final Color? backgroundColor,
    final Color? surfaceColor,
    final Color? headerColor,
    final Color? headerExpandedColor,
    final Color? contentColor,
    final Color? borderColor,
    final Color? dividerColor,
    final Color? titleColor,
    final Color? subtitleColor,
    final Color? contentTextColor,
    final Color? expansionIconColor,
    final Color? hoverColor,
    final Color? pressedColor,
    final Color? focusColor,
    final Color? selectedColor,
    final Color? disabledColor,
    final Color? loadingColor,
    final Color? skeletonBaseColor,
    final Color? skeletonHighlightColor,
    final Color? shadowColor,
  }) = _$DSAccordionColorsImpl;

  /// Color de fondo del accordion
  @override
  Color? get backgroundColor;

  /// Color de superficie para elementos
  @override
  Color? get surfaceColor;

  /// Color del header
  @override
  Color? get headerColor;

  /// Color del header cuando está expandido
  @override
  Color? get headerExpandedColor;

  /// Color del contenido
  @override
  Color? get contentColor;

  /// Color de los bordes
  @override
  Color? get borderColor;

  /// Color del divider
  @override
  Color? get dividerColor;

  /// Color del texto del título
  @override
  Color? get titleColor;

  /// Color del texto del subtítulo
  @override
  Color? get subtitleColor;

  /// Color del texto del contenido
  @override
  Color? get contentTextColor;

  /// Color del icono de expansión
  @override
  Color? get expansionIconColor;

  /// Color en estado hover
  @override
  Color? get hoverColor;

  /// Color en estado pressed
  @override
  Color? get pressedColor;

  /// Color en estado focus
  @override
  Color? get focusColor;

  /// Color en estado selected
  @override
  Color? get selectedColor;

  /// Color en estado disabled
  @override
  Color? get disabledColor;

  /// Color de loading
  @override
  Color? get loadingColor;

  /// Color base del skeleton
  @override
  Color? get skeletonBaseColor;

  /// Color de highlight del skeleton
  @override
  Color? get skeletonHighlightColor;

  /// Color de shadow/elevación
  @override
  Color? get shadowColor;

  /// Create a copy of DSAccordionColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionColorsImplCopyWith<_$DSAccordionColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionSpacing {
  /// Padding interno del accordion
  EdgeInsets get padding => throw _privateConstructorUsedError;

  /// Margin externo del accordion
  EdgeInsets get margin => throw _privateConstructorUsedError;

  /// Padding del header
  EdgeInsets get headerPadding => throw _privateConstructorUsedError;

  /// Padding del contenido
  EdgeInsets get contentPadding => throw _privateConstructorUsedError;

  /// Espaciado entre título y subtítulo
  double get titleSubtitleSpacing => throw _privateConstructorUsedError;

  /// Espaciado entre icono y texto
  double get iconTextSpacing => throw _privateConstructorUsedError;

  /// Altura mínima del header
  double get minHeaderHeight => throw _privateConstructorUsedError;

  /// Altura mínima interactiva (para touch targets)
  double get minInteractiveSize => throw _privateConstructorUsedError;

  /// Espaciado entre elementos del accordion
  double get itemSpacing => throw _privateConstructorUsedError;

  /// Grosor del divider
  double get dividerThickness => throw _privateConstructorUsedError;

  /// Espaciado del focus indicator
  double get focusIndicatorSpacing => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionSpacingCopyWith<DSAccordionSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionSpacingCopyWith<$Res> {
  factory $DSAccordionSpacingCopyWith(
    DSAccordionSpacing value,
    $Res Function(DSAccordionSpacing) then,
  ) = _$DSAccordionSpacingCopyWithImpl<$Res, DSAccordionSpacing>;
  @useResult
  $Res call({
    EdgeInsets padding,
    EdgeInsets margin,
    EdgeInsets headerPadding,
    EdgeInsets contentPadding,
    double titleSubtitleSpacing,
    double iconTextSpacing,
    double minHeaderHeight,
    double minInteractiveSize,
    double itemSpacing,
    double dividerThickness,
    double focusIndicatorSpacing,
  });
}

/// @nodoc
class _$DSAccordionSpacingCopyWithImpl<$Res, $Val extends DSAccordionSpacing>
    implements $DSAccordionSpacingCopyWith<$Res> {
  _$DSAccordionSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? margin = null,
    Object? headerPadding = null,
    Object? contentPadding = null,
    Object? titleSubtitleSpacing = null,
    Object? iconTextSpacing = null,
    Object? minHeaderHeight = null,
    Object? minInteractiveSize = null,
    Object? itemSpacing = null,
    Object? dividerThickness = null,
    Object? focusIndicatorSpacing = null,
  }) {
    return _then(
      _value.copyWith(
            padding: null == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            margin: null == margin
                ? _value.margin
                : margin // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            headerPadding: null == headerPadding
                ? _value.headerPadding
                : headerPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            contentPadding: null == contentPadding
                ? _value.contentPadding
                : contentPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            titleSubtitleSpacing: null == titleSubtitleSpacing
                ? _value.titleSubtitleSpacing
                : titleSubtitleSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            iconTextSpacing: null == iconTextSpacing
                ? _value.iconTextSpacing
                : iconTextSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            minHeaderHeight: null == minHeaderHeight
                ? _value.minHeaderHeight
                : minHeaderHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            minInteractiveSize: null == minInteractiveSize
                ? _value.minInteractiveSize
                : minInteractiveSize // ignore: cast_nullable_to_non_nullable
                      as double,
            itemSpacing: null == itemSpacing
                ? _value.itemSpacing
                : itemSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            dividerThickness: null == dividerThickness
                ? _value.dividerThickness
                : dividerThickness // ignore: cast_nullable_to_non_nullable
                      as double,
            focusIndicatorSpacing: null == focusIndicatorSpacing
                ? _value.focusIndicatorSpacing
                : focusIndicatorSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionSpacingImplCopyWith<$Res>
    implements $DSAccordionSpacingCopyWith<$Res> {
  factory _$$DSAccordionSpacingImplCopyWith(
    _$DSAccordionSpacingImpl value,
    $Res Function(_$DSAccordionSpacingImpl) then,
  ) = __$$DSAccordionSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EdgeInsets padding,
    EdgeInsets margin,
    EdgeInsets headerPadding,
    EdgeInsets contentPadding,
    double titleSubtitleSpacing,
    double iconTextSpacing,
    double minHeaderHeight,
    double minInteractiveSize,
    double itemSpacing,
    double dividerThickness,
    double focusIndicatorSpacing,
  });
}

/// @nodoc
class __$$DSAccordionSpacingImplCopyWithImpl<$Res>
    extends _$DSAccordionSpacingCopyWithImpl<$Res, _$DSAccordionSpacingImpl>
    implements _$$DSAccordionSpacingImplCopyWith<$Res> {
  __$$DSAccordionSpacingImplCopyWithImpl(
    _$DSAccordionSpacingImpl _value,
    $Res Function(_$DSAccordionSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? margin = null,
    Object? headerPadding = null,
    Object? contentPadding = null,
    Object? titleSubtitleSpacing = null,
    Object? iconTextSpacing = null,
    Object? minHeaderHeight = null,
    Object? minInteractiveSize = null,
    Object? itemSpacing = null,
    Object? dividerThickness = null,
    Object? focusIndicatorSpacing = null,
  }) {
    return _then(
      _$DSAccordionSpacingImpl(
        padding: null == padding
            ? _value.padding
            : padding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        margin: null == margin
            ? _value.margin
            : margin // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        headerPadding: null == headerPadding
            ? _value.headerPadding
            : headerPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        contentPadding: null == contentPadding
            ? _value.contentPadding
            : contentPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        titleSubtitleSpacing: null == titleSubtitleSpacing
            ? _value.titleSubtitleSpacing
            : titleSubtitleSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        iconTextSpacing: null == iconTextSpacing
            ? _value.iconTextSpacing
            : iconTextSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        minHeaderHeight: null == minHeaderHeight
            ? _value.minHeaderHeight
            : minHeaderHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        minInteractiveSize: null == minInteractiveSize
            ? _value.minInteractiveSize
            : minInteractiveSize // ignore: cast_nullable_to_non_nullable
                  as double,
        itemSpacing: null == itemSpacing
            ? _value.itemSpacing
            : itemSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        dividerThickness: null == dividerThickness
            ? _value.dividerThickness
            : dividerThickness // ignore: cast_nullable_to_non_nullable
                  as double,
        focusIndicatorSpacing: null == focusIndicatorSpacing
            ? _value.focusIndicatorSpacing
            : focusIndicatorSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionSpacingImpl implements _DSAccordionSpacing {
  const _$DSAccordionSpacingImpl({
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    this.contentPadding = const EdgeInsets.all(16.0),
    this.titleSubtitleSpacing = 4.0,
    this.iconTextSpacing = 12.0,
    this.minHeaderHeight = 56.0,
    this.minInteractiveSize = 44.0,
    this.itemSpacing = 1.0,
    this.dividerThickness = 1.0,
    this.focusIndicatorSpacing = 2.0,
  });

  /// Padding interno del accordion
  @override
  @JsonKey()
  final EdgeInsets padding;

  /// Margin externo del accordion
  @override
  @JsonKey()
  final EdgeInsets margin;

  /// Padding del header
  @override
  @JsonKey()
  final EdgeInsets headerPadding;

  /// Padding del contenido
  @override
  @JsonKey()
  final EdgeInsets contentPadding;

  /// Espaciado entre título y subtítulo
  @override
  @JsonKey()
  final double titleSubtitleSpacing;

  /// Espaciado entre icono y texto
  @override
  @JsonKey()
  final double iconTextSpacing;

  /// Altura mínima del header
  @override
  @JsonKey()
  final double minHeaderHeight;

  /// Altura mínima interactiva (para touch targets)
  @override
  @JsonKey()
  final double minInteractiveSize;

  /// Espaciado entre elementos del accordion
  @override
  @JsonKey()
  final double itemSpacing;

  /// Grosor del divider
  @override
  @JsonKey()
  final double dividerThickness;

  /// Espaciado del focus indicator
  @override
  @JsonKey()
  final double focusIndicatorSpacing;

  @override
  String toString() {
    return 'DSAccordionSpacing(padding: $padding, margin: $margin, headerPadding: $headerPadding, contentPadding: $contentPadding, titleSubtitleSpacing: $titleSubtitleSpacing, iconTextSpacing: $iconTextSpacing, minHeaderHeight: $minHeaderHeight, minInteractiveSize: $minInteractiveSize, itemSpacing: $itemSpacing, dividerThickness: $dividerThickness, focusIndicatorSpacing: $focusIndicatorSpacing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionSpacingImpl &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.headerPadding, headerPadding) ||
                other.headerPadding == headerPadding) &&
            (identical(other.contentPadding, contentPadding) ||
                other.contentPadding == contentPadding) &&
            (identical(other.titleSubtitleSpacing, titleSubtitleSpacing) ||
                other.titleSubtitleSpacing == titleSubtitleSpacing) &&
            (identical(other.iconTextSpacing, iconTextSpacing) ||
                other.iconTextSpacing == iconTextSpacing) &&
            (identical(other.minHeaderHeight, minHeaderHeight) ||
                other.minHeaderHeight == minHeaderHeight) &&
            (identical(other.minInteractiveSize, minInteractiveSize) ||
                other.minInteractiveSize == minInteractiveSize) &&
            (identical(other.itemSpacing, itemSpacing) ||
                other.itemSpacing == itemSpacing) &&
            (identical(other.dividerThickness, dividerThickness) ||
                other.dividerThickness == dividerThickness) &&
            (identical(other.focusIndicatorSpacing, focusIndicatorSpacing) ||
                other.focusIndicatorSpacing == focusIndicatorSpacing));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    padding,
    margin,
    headerPadding,
    contentPadding,
    titleSubtitleSpacing,
    iconTextSpacing,
    minHeaderHeight,
    minInteractiveSize,
    itemSpacing,
    dividerThickness,
    focusIndicatorSpacing,
  );

  /// Create a copy of DSAccordionSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionSpacingImplCopyWith<_$DSAccordionSpacingImpl> get copyWith =>
      __$$DSAccordionSpacingImplCopyWithImpl<_$DSAccordionSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionSpacing implements DSAccordionSpacing {
  const factory _DSAccordionSpacing({
    final EdgeInsets padding,
    final EdgeInsets margin,
    final EdgeInsets headerPadding,
    final EdgeInsets contentPadding,
    final double titleSubtitleSpacing,
    final double iconTextSpacing,
    final double minHeaderHeight,
    final double minInteractiveSize,
    final double itemSpacing,
    final double dividerThickness,
    final double focusIndicatorSpacing,
  }) = _$DSAccordionSpacingImpl;

  /// Padding interno del accordion
  @override
  EdgeInsets get padding;

  /// Margin externo del accordion
  @override
  EdgeInsets get margin;

  /// Padding del header
  @override
  EdgeInsets get headerPadding;

  /// Padding del contenido
  @override
  EdgeInsets get contentPadding;

  /// Espaciado entre título y subtítulo
  @override
  double get titleSubtitleSpacing;

  /// Espaciado entre icono y texto
  @override
  double get iconTextSpacing;

  /// Altura mínima del header
  @override
  double get minHeaderHeight;

  /// Altura mínima interactiva (para touch targets)
  @override
  double get minInteractiveSize;

  /// Espaciado entre elementos del accordion
  @override
  double get itemSpacing;

  /// Grosor del divider
  @override
  double get dividerThickness;

  /// Espaciado del focus indicator
  @override
  double get focusIndicatorSpacing;

  /// Create a copy of DSAccordionSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionSpacingImplCopyWith<_$DSAccordionSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionTypography {
  /// Estilo del título
  TextStyle? get titleStyle => throw _privateConstructorUsedError;

  /// Estilo del subtítulo
  TextStyle? get subtitleStyle => throw _privateConstructorUsedError;

  /// Estilo del contenido
  TextStyle? get contentStyle => throw _privateConstructorUsedError;

  /// Estilo del texto de loading
  TextStyle? get loadingStyle => throw _privateConstructorUsedError;

  /// Estilo del texto de error
  TextStyle? get errorStyle => throw _privateConstructorUsedError;

  /// Estilo del texto de empty state
  TextStyle? get emptyStyle => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionTypographyCopyWith<DSAccordionTypography> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionTypographyCopyWith<$Res> {
  factory $DSAccordionTypographyCopyWith(
    DSAccordionTypography value,
    $Res Function(DSAccordionTypography) then,
  ) = _$DSAccordionTypographyCopyWithImpl<$Res, DSAccordionTypography>;
  @useResult
  $Res call({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? contentStyle,
    TextStyle? loadingStyle,
    TextStyle? errorStyle,
    TextStyle? emptyStyle,
  });
}

/// @nodoc
class _$DSAccordionTypographyCopyWithImpl<
  $Res,
  $Val extends DSAccordionTypography
>
    implements $DSAccordionTypographyCopyWith<$Res> {
  _$DSAccordionTypographyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleStyle = freezed,
    Object? subtitleStyle = freezed,
    Object? contentStyle = freezed,
    Object? loadingStyle = freezed,
    Object? errorStyle = freezed,
    Object? emptyStyle = freezed,
  }) {
    return _then(
      _value.copyWith(
            titleStyle: freezed == titleStyle
                ? _value.titleStyle
                : titleStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            subtitleStyle: freezed == subtitleStyle
                ? _value.subtitleStyle
                : subtitleStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            contentStyle: freezed == contentStyle
                ? _value.contentStyle
                : contentStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            loadingStyle: freezed == loadingStyle
                ? _value.loadingStyle
                : loadingStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            errorStyle: freezed == errorStyle
                ? _value.errorStyle
                : errorStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            emptyStyle: freezed == emptyStyle
                ? _value.emptyStyle
                : emptyStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionTypographyImplCopyWith<$Res>
    implements $DSAccordionTypographyCopyWith<$Res> {
  factory _$$DSAccordionTypographyImplCopyWith(
    _$DSAccordionTypographyImpl value,
    $Res Function(_$DSAccordionTypographyImpl) then,
  ) = __$$DSAccordionTypographyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? contentStyle,
    TextStyle? loadingStyle,
    TextStyle? errorStyle,
    TextStyle? emptyStyle,
  });
}

/// @nodoc
class __$$DSAccordionTypographyImplCopyWithImpl<$Res>
    extends
        _$DSAccordionTypographyCopyWithImpl<$Res, _$DSAccordionTypographyImpl>
    implements _$$DSAccordionTypographyImplCopyWith<$Res> {
  __$$DSAccordionTypographyImplCopyWithImpl(
    _$DSAccordionTypographyImpl _value,
    $Res Function(_$DSAccordionTypographyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleStyle = freezed,
    Object? subtitleStyle = freezed,
    Object? contentStyle = freezed,
    Object? loadingStyle = freezed,
    Object? errorStyle = freezed,
    Object? emptyStyle = freezed,
  }) {
    return _then(
      _$DSAccordionTypographyImpl(
        titleStyle: freezed == titleStyle
            ? _value.titleStyle
            : titleStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        subtitleStyle: freezed == subtitleStyle
            ? _value.subtitleStyle
            : subtitleStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        contentStyle: freezed == contentStyle
            ? _value.contentStyle
            : contentStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        loadingStyle: freezed == loadingStyle
            ? _value.loadingStyle
            : loadingStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        errorStyle: freezed == errorStyle
            ? _value.errorStyle
            : errorStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        emptyStyle: freezed == emptyStyle
            ? _value.emptyStyle
            : emptyStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionTypographyImpl implements _DSAccordionTypography {
  const _$DSAccordionTypographyImpl({
    this.titleStyle,
    this.subtitleStyle,
    this.contentStyle,
    this.loadingStyle,
    this.errorStyle,
    this.emptyStyle,
  });

  /// Estilo del título
  @override
  final TextStyle? titleStyle;

  /// Estilo del subtítulo
  @override
  final TextStyle? subtitleStyle;

  /// Estilo del contenido
  @override
  final TextStyle? contentStyle;

  /// Estilo del texto de loading
  @override
  final TextStyle? loadingStyle;

  /// Estilo del texto de error
  @override
  final TextStyle? errorStyle;

  /// Estilo del texto de empty state
  @override
  final TextStyle? emptyStyle;

  @override
  String toString() {
    return 'DSAccordionTypography(titleStyle: $titleStyle, subtitleStyle: $subtitleStyle, contentStyle: $contentStyle, loadingStyle: $loadingStyle, errorStyle: $errorStyle, emptyStyle: $emptyStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionTypographyImpl &&
            (identical(other.titleStyle, titleStyle) ||
                other.titleStyle == titleStyle) &&
            (identical(other.subtitleStyle, subtitleStyle) ||
                other.subtitleStyle == subtitleStyle) &&
            (identical(other.contentStyle, contentStyle) ||
                other.contentStyle == contentStyle) &&
            (identical(other.loadingStyle, loadingStyle) ||
                other.loadingStyle == loadingStyle) &&
            (identical(other.errorStyle, errorStyle) ||
                other.errorStyle == errorStyle) &&
            (identical(other.emptyStyle, emptyStyle) ||
                other.emptyStyle == emptyStyle));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    titleStyle,
    subtitleStyle,
    contentStyle,
    loadingStyle,
    errorStyle,
    emptyStyle,
  );

  /// Create a copy of DSAccordionTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionTypographyImplCopyWith<_$DSAccordionTypographyImpl>
  get copyWith =>
      __$$DSAccordionTypographyImplCopyWithImpl<_$DSAccordionTypographyImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionTypography implements DSAccordionTypography {
  const factory _DSAccordionTypography({
    final TextStyle? titleStyle,
    final TextStyle? subtitleStyle,
    final TextStyle? contentStyle,
    final TextStyle? loadingStyle,
    final TextStyle? errorStyle,
    final TextStyle? emptyStyle,
  }) = _$DSAccordionTypographyImpl;

  /// Estilo del título
  @override
  TextStyle? get titleStyle;

  /// Estilo del subtítulo
  @override
  TextStyle? get subtitleStyle;

  /// Estilo del contenido
  @override
  TextStyle? get contentStyle;

  /// Estilo del texto de loading
  @override
  TextStyle? get loadingStyle;

  /// Estilo del texto de error
  @override
  TextStyle? get errorStyle;

  /// Estilo del texto de empty state
  @override
  TextStyle? get emptyStyle;

  /// Create a copy of DSAccordionTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionTypographyImplCopyWith<_$DSAccordionTypographyImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionAnimations {
  /// Duración de la animación de expansión
  Duration get expansionDuration => throw _privateConstructorUsedError;

  /// Duración de animaciones de estado
  Duration get stateDuration => throw _privateConstructorUsedError;

  /// Duración de animaciones de skeleton
  Duration get skeletonDuration => throw _privateConstructorUsedError;

  /// Curva de animación de expansión
  Curve get expansionCurve => throw _privateConstructorUsedError;

  /// Curva de animación de estado
  Curve get stateCurve => throw _privateConstructorUsedError;

  /// Curva de animación de skeleton
  Curve get skeletonCurve => throw _privateConstructorUsedError;

  /// Si las animaciones están habilitadas
  bool get enabled => throw _privateConstructorUsedError;

  /// Si debe respetar la configuración de reduced motion
  bool get respectReducedMotion => throw _privateConstructorUsedError;

  /// Offset de animación de entrada
  Offset get enterOffset => throw _privateConstructorUsedError;

  /// Offset de animación de salida
  Offset get exitOffset => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionAnimationsCopyWith<DSAccordionAnimations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionAnimationsCopyWith<$Res> {
  factory $DSAccordionAnimationsCopyWith(
    DSAccordionAnimations value,
    $Res Function(DSAccordionAnimations) then,
  ) = _$DSAccordionAnimationsCopyWithImpl<$Res, DSAccordionAnimations>;
  @useResult
  $Res call({
    Duration expansionDuration,
    Duration stateDuration,
    Duration skeletonDuration,
    Curve expansionCurve,
    Curve stateCurve,
    Curve skeletonCurve,
    bool enabled,
    bool respectReducedMotion,
    Offset enterOffset,
    Offset exitOffset,
  });
}

/// @nodoc
class _$DSAccordionAnimationsCopyWithImpl<
  $Res,
  $Val extends DSAccordionAnimations
>
    implements $DSAccordionAnimationsCopyWith<$Res> {
  _$DSAccordionAnimationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expansionDuration = null,
    Object? stateDuration = null,
    Object? skeletonDuration = null,
    Object? expansionCurve = null,
    Object? stateCurve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
    Object? respectReducedMotion = null,
    Object? enterOffset = null,
    Object? exitOffset = null,
  }) {
    return _then(
      _value.copyWith(
            expansionDuration: null == expansionDuration
                ? _value.expansionDuration
                : expansionDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            stateDuration: null == stateDuration
                ? _value.stateDuration
                : stateDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            skeletonDuration: null == skeletonDuration
                ? _value.skeletonDuration
                : skeletonDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            expansionCurve: null == expansionCurve
                ? _value.expansionCurve
                : expansionCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            stateCurve: null == stateCurve
                ? _value.stateCurve
                : stateCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            skeletonCurve: null == skeletonCurve
                ? _value.skeletonCurve
                : skeletonCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            respectReducedMotion: null == respectReducedMotion
                ? _value.respectReducedMotion
                : respectReducedMotion // ignore: cast_nullable_to_non_nullable
                      as bool,
            enterOffset: null == enterOffset
                ? _value.enterOffset
                : enterOffset // ignore: cast_nullable_to_non_nullable
                      as Offset,
            exitOffset: null == exitOffset
                ? _value.exitOffset
                : exitOffset // ignore: cast_nullable_to_non_nullable
                      as Offset,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionAnimationsImplCopyWith<$Res>
    implements $DSAccordionAnimationsCopyWith<$Res> {
  factory _$$DSAccordionAnimationsImplCopyWith(
    _$DSAccordionAnimationsImpl value,
    $Res Function(_$DSAccordionAnimationsImpl) then,
  ) = __$$DSAccordionAnimationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Duration expansionDuration,
    Duration stateDuration,
    Duration skeletonDuration,
    Curve expansionCurve,
    Curve stateCurve,
    Curve skeletonCurve,
    bool enabled,
    bool respectReducedMotion,
    Offset enterOffset,
    Offset exitOffset,
  });
}

/// @nodoc
class __$$DSAccordionAnimationsImplCopyWithImpl<$Res>
    extends
        _$DSAccordionAnimationsCopyWithImpl<$Res, _$DSAccordionAnimationsImpl>
    implements _$$DSAccordionAnimationsImplCopyWith<$Res> {
  __$$DSAccordionAnimationsImplCopyWithImpl(
    _$DSAccordionAnimationsImpl _value,
    $Res Function(_$DSAccordionAnimationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expansionDuration = null,
    Object? stateDuration = null,
    Object? skeletonDuration = null,
    Object? expansionCurve = null,
    Object? stateCurve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
    Object? respectReducedMotion = null,
    Object? enterOffset = null,
    Object? exitOffset = null,
  }) {
    return _then(
      _$DSAccordionAnimationsImpl(
        expansionDuration: null == expansionDuration
            ? _value.expansionDuration
            : expansionDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        stateDuration: null == stateDuration
            ? _value.stateDuration
            : stateDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        skeletonDuration: null == skeletonDuration
            ? _value.skeletonDuration
            : skeletonDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        expansionCurve: null == expansionCurve
            ? _value.expansionCurve
            : expansionCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        stateCurve: null == stateCurve
            ? _value.stateCurve
            : stateCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        skeletonCurve: null == skeletonCurve
            ? _value.skeletonCurve
            : skeletonCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        respectReducedMotion: null == respectReducedMotion
            ? _value.respectReducedMotion
            : respectReducedMotion // ignore: cast_nullable_to_non_nullable
                  as bool,
        enterOffset: null == enterOffset
            ? _value.enterOffset
            : enterOffset // ignore: cast_nullable_to_non_nullable
                  as Offset,
        exitOffset: null == exitOffset
            ? _value.exitOffset
            : exitOffset // ignore: cast_nullable_to_non_nullable
                  as Offset,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionAnimationsImpl implements _DSAccordionAnimations {
  const _$DSAccordionAnimationsImpl({
    this.expansionDuration = const Duration(milliseconds: 300),
    this.stateDuration = const Duration(milliseconds: 200),
    this.skeletonDuration = const Duration(milliseconds: 1200),
    this.expansionCurve = Curves.easeInOut,
    this.stateCurve = Curves.easeInOut,
    this.skeletonCurve = Curves.easeInOut,
    this.enabled = true,
    this.respectReducedMotion = true,
    this.enterOffset = const Offset(0, 10),
    this.exitOffset = const Offset(0, -10),
  });

  /// Duración de la animación de expansión
  @override
  @JsonKey()
  final Duration expansionDuration;

  /// Duración de animaciones de estado
  @override
  @JsonKey()
  final Duration stateDuration;

  /// Duración de animaciones de skeleton
  @override
  @JsonKey()
  final Duration skeletonDuration;

  /// Curva de animación de expansión
  @override
  @JsonKey()
  final Curve expansionCurve;

  /// Curva de animación de estado
  @override
  @JsonKey()
  final Curve stateCurve;

  /// Curva de animación de skeleton
  @override
  @JsonKey()
  final Curve skeletonCurve;

  /// Si las animaciones están habilitadas
  @override
  @JsonKey()
  final bool enabled;

  /// Si debe respetar la configuración de reduced motion
  @override
  @JsonKey()
  final bool respectReducedMotion;

  /// Offset de animación de entrada
  @override
  @JsonKey()
  final Offset enterOffset;

  /// Offset de animación de salida
  @override
  @JsonKey()
  final Offset exitOffset;

  @override
  String toString() {
    return 'DSAccordionAnimations(expansionDuration: $expansionDuration, stateDuration: $stateDuration, skeletonDuration: $skeletonDuration, expansionCurve: $expansionCurve, stateCurve: $stateCurve, skeletonCurve: $skeletonCurve, enabled: $enabled, respectReducedMotion: $respectReducedMotion, enterOffset: $enterOffset, exitOffset: $exitOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionAnimationsImpl &&
            (identical(other.expansionDuration, expansionDuration) ||
                other.expansionDuration == expansionDuration) &&
            (identical(other.stateDuration, stateDuration) ||
                other.stateDuration == stateDuration) &&
            (identical(other.skeletonDuration, skeletonDuration) ||
                other.skeletonDuration == skeletonDuration) &&
            (identical(other.expansionCurve, expansionCurve) ||
                other.expansionCurve == expansionCurve) &&
            (identical(other.stateCurve, stateCurve) ||
                other.stateCurve == stateCurve) &&
            (identical(other.skeletonCurve, skeletonCurve) ||
                other.skeletonCurve == skeletonCurve) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.respectReducedMotion, respectReducedMotion) ||
                other.respectReducedMotion == respectReducedMotion) &&
            (identical(other.enterOffset, enterOffset) ||
                other.enterOffset == enterOffset) &&
            (identical(other.exitOffset, exitOffset) ||
                other.exitOffset == exitOffset));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    expansionDuration,
    stateDuration,
    skeletonDuration,
    expansionCurve,
    stateCurve,
    skeletonCurve,
    enabled,
    respectReducedMotion,
    enterOffset,
    exitOffset,
  );

  /// Create a copy of DSAccordionAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionAnimationsImplCopyWith<_$DSAccordionAnimationsImpl>
  get copyWith =>
      __$$DSAccordionAnimationsImplCopyWithImpl<_$DSAccordionAnimationsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionAnimations implements DSAccordionAnimations {
  const factory _DSAccordionAnimations({
    final Duration expansionDuration,
    final Duration stateDuration,
    final Duration skeletonDuration,
    final Curve expansionCurve,
    final Curve stateCurve,
    final Curve skeletonCurve,
    final bool enabled,
    final bool respectReducedMotion,
    final Offset enterOffset,
    final Offset exitOffset,
  }) = _$DSAccordionAnimationsImpl;

  /// Duración de la animación de expansión
  @override
  Duration get expansionDuration;

  /// Duración de animaciones de estado
  @override
  Duration get stateDuration;

  /// Duración de animaciones de skeleton
  @override
  Duration get skeletonDuration;

  /// Curva de animación de expansión
  @override
  Curve get expansionCurve;

  /// Curva de animación de estado
  @override
  Curve get stateCurve;

  /// Curva de animación de skeleton
  @override
  Curve get skeletonCurve;

  /// Si las animaciones están habilitadas
  @override
  bool get enabled;

  /// Si debe respetar la configuración de reduced motion
  @override
  bool get respectReducedMotion;

  /// Offset de animación de entrada
  @override
  Offset get enterOffset;

  /// Offset de animación de salida
  @override
  Offset get exitOffset;

  /// Create a copy of DSAccordionAnimations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionAnimationsImplCopyWith<_$DSAccordionAnimationsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionBehavior {
  /// Si debe mostrar información de debugging en desarrollo
  bool get showDebugInfo => throw _privateConstructorUsedError;

  /// Si debe usar efectos de hover en web/desktop
  bool get enableHoverEffects => throw _privateConstructorUsedError;

  /// Si debe mostrar estados de focus
  bool get showFocusIndicator => throw _privateConstructorUsedError;

  /// Si debe usar haptic feedback en móvil
  bool get enableHapticFeedback => throw _privateConstructorUsedError;

  /// Si debe cachear las configuraciones de estilo
  bool get cacheStyles => throw _privateConstructorUsedError;

  /// Si debe adaptar automáticamente según la plataforma
  bool get platformAdaptive => throw _privateConstructorUsedError;

  /// Si permite navegación por teclado
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Si debe mantener un elemento expandido siempre
  bool get maintainState => throw _privateConstructorUsedError;

  /// Si permite scroll automático al expandir
  bool get autoScroll => throw _privateConstructorUsedError;

  /// Duración del scroll automático
  Duration get autoScrollDuration => throw _privateConstructorUsedError;

  /// Si debe colapsar otros elementos al expandir uno nuevo (solo single)
  bool get collapseOthers => throw _privateConstructorUsedError;

  /// Si debe animar el icono de expansión
  bool get animateExpansionIcon => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionBehaviorCopyWith<DSAccordionBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionBehaviorCopyWith<$Res> {
  factory $DSAccordionBehaviorCopyWith(
    DSAccordionBehavior value,
    $Res Function(DSAccordionBehavior) then,
  ) = _$DSAccordionBehaviorCopyWithImpl<$Res, DSAccordionBehavior>;
  @useResult
  $Res call({
    bool showDebugInfo,
    bool enableHoverEffects,
    bool showFocusIndicator,
    bool enableHapticFeedback,
    bool cacheStyles,
    bool platformAdaptive,
    bool enableKeyboardNavigation,
    bool maintainState,
    bool autoScroll,
    Duration autoScrollDuration,
    bool collapseOthers,
    bool animateExpansionIcon,
  });
}

/// @nodoc
class _$DSAccordionBehaviorCopyWithImpl<$Res, $Val extends DSAccordionBehavior>
    implements $DSAccordionBehaviorCopyWith<$Res> {
  _$DSAccordionBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showDebugInfo = null,
    Object? enableHoverEffects = null,
    Object? showFocusIndicator = null,
    Object? enableHapticFeedback = null,
    Object? cacheStyles = null,
    Object? platformAdaptive = null,
    Object? enableKeyboardNavigation = null,
    Object? maintainState = null,
    Object? autoScroll = null,
    Object? autoScrollDuration = null,
    Object? collapseOthers = null,
    Object? animateExpansionIcon = null,
  }) {
    return _then(
      _value.copyWith(
            showDebugInfo: null == showDebugInfo
                ? _value.showDebugInfo
                : showDebugInfo // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHoverEffects: null == enableHoverEffects
                ? _value.enableHoverEffects
                : enableHoverEffects // ignore: cast_nullable_to_non_nullable
                      as bool,
            showFocusIndicator: null == showFocusIndicator
                ? _value.showFocusIndicator
                : showFocusIndicator // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHapticFeedback: null == enableHapticFeedback
                ? _value.enableHapticFeedback
                : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheStyles: null == cacheStyles
                ? _value.cacheStyles
                : cacheStyles // ignore: cast_nullable_to_non_nullable
                      as bool,
            platformAdaptive: null == platformAdaptive
                ? _value.platformAdaptive
                : platformAdaptive // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
            maintainState: null == maintainState
                ? _value.maintainState
                : maintainState // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoScroll: null == autoScroll
                ? _value.autoScroll
                : autoScroll // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoScrollDuration: null == autoScrollDuration
                ? _value.autoScrollDuration
                : autoScrollDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            collapseOthers: null == collapseOthers
                ? _value.collapseOthers
                : collapseOthers // ignore: cast_nullable_to_non_nullable
                      as bool,
            animateExpansionIcon: null == animateExpansionIcon
                ? _value.animateExpansionIcon
                : animateExpansionIcon // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionBehaviorImplCopyWith<$Res>
    implements $DSAccordionBehaviorCopyWith<$Res> {
  factory _$$DSAccordionBehaviorImplCopyWith(
    _$DSAccordionBehaviorImpl value,
    $Res Function(_$DSAccordionBehaviorImpl) then,
  ) = __$$DSAccordionBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool showDebugInfo,
    bool enableHoverEffects,
    bool showFocusIndicator,
    bool enableHapticFeedback,
    bool cacheStyles,
    bool platformAdaptive,
    bool enableKeyboardNavigation,
    bool maintainState,
    bool autoScroll,
    Duration autoScrollDuration,
    bool collapseOthers,
    bool animateExpansionIcon,
  });
}

/// @nodoc
class __$$DSAccordionBehaviorImplCopyWithImpl<$Res>
    extends _$DSAccordionBehaviorCopyWithImpl<$Res, _$DSAccordionBehaviorImpl>
    implements _$$DSAccordionBehaviorImplCopyWith<$Res> {
  __$$DSAccordionBehaviorImplCopyWithImpl(
    _$DSAccordionBehaviorImpl _value,
    $Res Function(_$DSAccordionBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showDebugInfo = null,
    Object? enableHoverEffects = null,
    Object? showFocusIndicator = null,
    Object? enableHapticFeedback = null,
    Object? cacheStyles = null,
    Object? platformAdaptive = null,
    Object? enableKeyboardNavigation = null,
    Object? maintainState = null,
    Object? autoScroll = null,
    Object? autoScrollDuration = null,
    Object? collapseOthers = null,
    Object? animateExpansionIcon = null,
  }) {
    return _then(
      _$DSAccordionBehaviorImpl(
        showDebugInfo: null == showDebugInfo
            ? _value.showDebugInfo
            : showDebugInfo // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHoverEffects: null == enableHoverEffects
            ? _value.enableHoverEffects
            : enableHoverEffects // ignore: cast_nullable_to_non_nullable
                  as bool,
        showFocusIndicator: null == showFocusIndicator
            ? _value.showFocusIndicator
            : showFocusIndicator // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHapticFeedback: null == enableHapticFeedback
            ? _value.enableHapticFeedback
            : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheStyles: null == cacheStyles
            ? _value.cacheStyles
            : cacheStyles // ignore: cast_nullable_to_non_nullable
                  as bool,
        platformAdaptive: null == platformAdaptive
            ? _value.platformAdaptive
            : platformAdaptive // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
        maintainState: null == maintainState
            ? _value.maintainState
            : maintainState // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoScroll: null == autoScroll
            ? _value.autoScroll
            : autoScroll // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoScrollDuration: null == autoScrollDuration
            ? _value.autoScrollDuration
            : autoScrollDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        collapseOthers: null == collapseOthers
            ? _value.collapseOthers
            : collapseOthers // ignore: cast_nullable_to_non_nullable
                  as bool,
        animateExpansionIcon: null == animateExpansionIcon
            ? _value.animateExpansionIcon
            : animateExpansionIcon // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionBehaviorImpl implements _DSAccordionBehavior {
  const _$DSAccordionBehaviorImpl({
    this.showDebugInfo = false,
    this.enableHoverEffects = true,
    this.showFocusIndicator = true,
    this.enableHapticFeedback = true,
    this.cacheStyles = true,
    this.platformAdaptive = true,
    this.enableKeyboardNavigation = true,
    this.maintainState = false,
    this.autoScroll = true,
    this.autoScrollDuration = const Duration(milliseconds: 500),
    this.collapseOthers = true,
    this.animateExpansionIcon = true,
  });

  /// Si debe mostrar información de debugging en desarrollo
  @override
  @JsonKey()
  final bool showDebugInfo;

  /// Si debe usar efectos de hover en web/desktop
  @override
  @JsonKey()
  final bool enableHoverEffects;

  /// Si debe mostrar estados de focus
  @override
  @JsonKey()
  final bool showFocusIndicator;

  /// Si debe usar haptic feedback en móvil
  @override
  @JsonKey()
  final bool enableHapticFeedback;

  /// Si debe cachear las configuraciones de estilo
  @override
  @JsonKey()
  final bool cacheStyles;

  /// Si debe adaptar automáticamente según la plataforma
  @override
  @JsonKey()
  final bool platformAdaptive;

  /// Si permite navegación por teclado
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;

  /// Si debe mantener un elemento expandido siempre
  @override
  @JsonKey()
  final bool maintainState;

  /// Si permite scroll automático al expandir
  @override
  @JsonKey()
  final bool autoScroll;

  /// Duración del scroll automático
  @override
  @JsonKey()
  final Duration autoScrollDuration;

  /// Si debe colapsar otros elementos al expandir uno nuevo (solo single)
  @override
  @JsonKey()
  final bool collapseOthers;

  /// Si debe animar el icono de expansión
  @override
  @JsonKey()
  final bool animateExpansionIcon;

  @override
  String toString() {
    return 'DSAccordionBehavior(showDebugInfo: $showDebugInfo, enableHoverEffects: $enableHoverEffects, showFocusIndicator: $showFocusIndicator, enableHapticFeedback: $enableHapticFeedback, cacheStyles: $cacheStyles, platformAdaptive: $platformAdaptive, enableKeyboardNavigation: $enableKeyboardNavigation, maintainState: $maintainState, autoScroll: $autoScroll, autoScrollDuration: $autoScrollDuration, collapseOthers: $collapseOthers, animateExpansionIcon: $animateExpansionIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionBehaviorImpl &&
            (identical(other.showDebugInfo, showDebugInfo) ||
                other.showDebugInfo == showDebugInfo) &&
            (identical(other.enableHoverEffects, enableHoverEffects) ||
                other.enableHoverEffects == enableHoverEffects) &&
            (identical(other.showFocusIndicator, showFocusIndicator) ||
                other.showFocusIndicator == showFocusIndicator) &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(other.cacheStyles, cacheStyles) ||
                other.cacheStyles == cacheStyles) &&
            (identical(other.platformAdaptive, platformAdaptive) ||
                other.platformAdaptive == platformAdaptive) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation) &&
            (identical(other.maintainState, maintainState) ||
                other.maintainState == maintainState) &&
            (identical(other.autoScroll, autoScroll) ||
                other.autoScroll == autoScroll) &&
            (identical(other.autoScrollDuration, autoScrollDuration) ||
                other.autoScrollDuration == autoScrollDuration) &&
            (identical(other.collapseOthers, collapseOthers) ||
                other.collapseOthers == collapseOthers) &&
            (identical(other.animateExpansionIcon, animateExpansionIcon) ||
                other.animateExpansionIcon == animateExpansionIcon));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    showDebugInfo,
    enableHoverEffects,
    showFocusIndicator,
    enableHapticFeedback,
    cacheStyles,
    platformAdaptive,
    enableKeyboardNavigation,
    maintainState,
    autoScroll,
    autoScrollDuration,
    collapseOthers,
    animateExpansionIcon,
  );

  /// Create a copy of DSAccordionBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionBehaviorImplCopyWith<_$DSAccordionBehaviorImpl> get copyWith =>
      __$$DSAccordionBehaviorImplCopyWithImpl<_$DSAccordionBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionBehavior implements DSAccordionBehavior {
  const factory _DSAccordionBehavior({
    final bool showDebugInfo,
    final bool enableHoverEffects,
    final bool showFocusIndicator,
    final bool enableHapticFeedback,
    final bool cacheStyles,
    final bool platformAdaptive,
    final bool enableKeyboardNavigation,
    final bool maintainState,
    final bool autoScroll,
    final Duration autoScrollDuration,
    final bool collapseOthers,
    final bool animateExpansionIcon,
  }) = _$DSAccordionBehaviorImpl;

  /// Si debe mostrar información de debugging en desarrollo
  @override
  bool get showDebugInfo;

  /// Si debe usar efectos de hover en web/desktop
  @override
  bool get enableHoverEffects;

  /// Si debe mostrar estados de focus
  @override
  bool get showFocusIndicator;

  /// Si debe usar haptic feedback en móvil
  @override
  bool get enableHapticFeedback;

  /// Si debe cachear las configuraciones de estilo
  @override
  bool get cacheStyles;

  /// Si debe adaptar automáticamente según la plataforma
  @override
  bool get platformAdaptive;

  /// Si permite navegación por teclado
  @override
  bool get enableKeyboardNavigation;

  /// Si debe mantener un elemento expandido siempre
  @override
  bool get maintainState;

  /// Si permite scroll automático al expandir
  @override
  bool get autoScroll;

  /// Duración del scroll automático
  @override
  Duration get autoScrollDuration;

  /// Si debe colapsar otros elementos al expandir uno nuevo (solo single)
  @override
  bool get collapseOthers;

  /// Si debe animar el icono de expansión
  @override
  bool get animateExpansionIcon;

  /// Create a copy of DSAccordionBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionBehaviorImplCopyWith<_$DSAccordionBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionAccessibilityConfig {
  /// Si la accesibilidad está habilitada
  bool get enabled => throw _privateConstructorUsedError;

  /// Rol semántico del accordion
  String get semanticRole => throw _privateConstructorUsedError;

  /// Label para screen readers
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Descripción para screen readers
  String? get semanticDescription => throw _privateConstructorUsedError;

  /// Si debe ser enfocable por teclado
  bool get focusable => throw _privateConstructorUsedError;

  /// Si debe excluirse de la navegación semántica
  bool get excludeSemantics => throw _privateConstructorUsedError;

  /// Label para estado expandido
  String get expandedLabel => throw _privateConstructorUsedError;

  /// Label para estado colapsado
  String get collapsedLabel => throw _privateConstructorUsedError;

  /// Label para acción de expandir
  String get expandHint => throw _privateConstructorUsedError;

  /// Label para acción de colapsar
  String get collapseHint => throw _privateConstructorUsedError;

  /// Label para estado de loading
  String get loadingLabel => throw _privateConstructorUsedError;

  /// Label para estado disabled
  String get disabledLabel => throw _privateConstructorUsedError;

  /// Si debe anunciar cambios de estado
  bool get announceStateChanges => throw _privateConstructorUsedError;

  /// Si debe usar hints para navegación por teclado
  bool get useKeyboardHints => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionAccessibilityConfigCopyWith<DSAccordionAccessibilityConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionAccessibilityConfigCopyWith<$Res> {
  factory $DSAccordionAccessibilityConfigCopyWith(
    DSAccordionAccessibilityConfig value,
    $Res Function(DSAccordionAccessibilityConfig) then,
  ) =
      _$DSAccordionAccessibilityConfigCopyWithImpl<
        $Res,
        DSAccordionAccessibilityConfig
      >;
  @useResult
  $Res call({
    bool enabled,
    String semanticRole,
    String? semanticLabel,
    String? semanticDescription,
    bool focusable,
    bool excludeSemantics,
    String expandedLabel,
    String collapsedLabel,
    String expandHint,
    String collapseHint,
    String loadingLabel,
    String disabledLabel,
    bool announceStateChanges,
    bool useKeyboardHints,
  });
}

/// @nodoc
class _$DSAccordionAccessibilityConfigCopyWithImpl<
  $Res,
  $Val extends DSAccordionAccessibilityConfig
>
    implements $DSAccordionAccessibilityConfigCopyWith<$Res> {
  _$DSAccordionAccessibilityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticRole = null,
    Object? semanticLabel = freezed,
    Object? semanticDescription = freezed,
    Object? focusable = null,
    Object? excludeSemantics = null,
    Object? expandedLabel = null,
    Object? collapsedLabel = null,
    Object? expandHint = null,
    Object? collapseHint = null,
    Object? loadingLabel = null,
    Object? disabledLabel = null,
    Object? announceStateChanges = null,
    Object? useKeyboardHints = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            semanticRole: null == semanticRole
                ? _value.semanticRole
                : semanticRole // ignore: cast_nullable_to_non_nullable
                      as String,
            semanticLabel: freezed == semanticLabel
                ? _value.semanticLabel
                : semanticLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            semanticDescription: freezed == semanticDescription
                ? _value.semanticDescription
                : semanticDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            focusable: null == focusable
                ? _value.focusable
                : focusable // ignore: cast_nullable_to_non_nullable
                      as bool,
            excludeSemantics: null == excludeSemantics
                ? _value.excludeSemantics
                : excludeSemantics // ignore: cast_nullable_to_non_nullable
                      as bool,
            expandedLabel: null == expandedLabel
                ? _value.expandedLabel
                : expandedLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            collapsedLabel: null == collapsedLabel
                ? _value.collapsedLabel
                : collapsedLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            expandHint: null == expandHint
                ? _value.expandHint
                : expandHint // ignore: cast_nullable_to_non_nullable
                      as String,
            collapseHint: null == collapseHint
                ? _value.collapseHint
                : collapseHint // ignore: cast_nullable_to_non_nullable
                      as String,
            loadingLabel: null == loadingLabel
                ? _value.loadingLabel
                : loadingLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            disabledLabel: null == disabledLabel
                ? _value.disabledLabel
                : disabledLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            announceStateChanges: null == announceStateChanges
                ? _value.announceStateChanges
                : announceStateChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            useKeyboardHints: null == useKeyboardHints
                ? _value.useKeyboardHints
                : useKeyboardHints // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionAccessibilityConfigImplCopyWith<$Res>
    implements $DSAccordionAccessibilityConfigCopyWith<$Res> {
  factory _$$DSAccordionAccessibilityConfigImplCopyWith(
    _$DSAccordionAccessibilityConfigImpl value,
    $Res Function(_$DSAccordionAccessibilityConfigImpl) then,
  ) = __$$DSAccordionAccessibilityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    String semanticRole,
    String? semanticLabel,
    String? semanticDescription,
    bool focusable,
    bool excludeSemantics,
    String expandedLabel,
    String collapsedLabel,
    String expandHint,
    String collapseHint,
    String loadingLabel,
    String disabledLabel,
    bool announceStateChanges,
    bool useKeyboardHints,
  });
}

/// @nodoc
class __$$DSAccordionAccessibilityConfigImplCopyWithImpl<$Res>
    extends
        _$DSAccordionAccessibilityConfigCopyWithImpl<
          $Res,
          _$DSAccordionAccessibilityConfigImpl
        >
    implements _$$DSAccordionAccessibilityConfigImplCopyWith<$Res> {
  __$$DSAccordionAccessibilityConfigImplCopyWithImpl(
    _$DSAccordionAccessibilityConfigImpl _value,
    $Res Function(_$DSAccordionAccessibilityConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticRole = null,
    Object? semanticLabel = freezed,
    Object? semanticDescription = freezed,
    Object? focusable = null,
    Object? excludeSemantics = null,
    Object? expandedLabel = null,
    Object? collapsedLabel = null,
    Object? expandHint = null,
    Object? collapseHint = null,
    Object? loadingLabel = null,
    Object? disabledLabel = null,
    Object? announceStateChanges = null,
    Object? useKeyboardHints = null,
  }) {
    return _then(
      _$DSAccordionAccessibilityConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        semanticRole: null == semanticRole
            ? _value.semanticRole
            : semanticRole // ignore: cast_nullable_to_non_nullable
                  as String,
        semanticLabel: freezed == semanticLabel
            ? _value.semanticLabel
            : semanticLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        semanticDescription: freezed == semanticDescription
            ? _value.semanticDescription
            : semanticDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        focusable: null == focusable
            ? _value.focusable
            : focusable // ignore: cast_nullable_to_non_nullable
                  as bool,
        excludeSemantics: null == excludeSemantics
            ? _value.excludeSemantics
            : excludeSemantics // ignore: cast_nullable_to_non_nullable
                  as bool,
        expandedLabel: null == expandedLabel
            ? _value.expandedLabel
            : expandedLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        collapsedLabel: null == collapsedLabel
            ? _value.collapsedLabel
            : collapsedLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        expandHint: null == expandHint
            ? _value.expandHint
            : expandHint // ignore: cast_nullable_to_non_nullable
                  as String,
        collapseHint: null == collapseHint
            ? _value.collapseHint
            : collapseHint // ignore: cast_nullable_to_non_nullable
                  as String,
        loadingLabel: null == loadingLabel
            ? _value.loadingLabel
            : loadingLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        disabledLabel: null == disabledLabel
            ? _value.disabledLabel
            : disabledLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        announceStateChanges: null == announceStateChanges
            ? _value.announceStateChanges
            : announceStateChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        useKeyboardHints: null == useKeyboardHints
            ? _value.useKeyboardHints
            : useKeyboardHints // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionAccessibilityConfigImpl
    implements _DSAccordionAccessibilityConfig {
  const _$DSAccordionAccessibilityConfigImpl({
    this.enabled = true,
    this.semanticRole = 'tree',
    this.semanticLabel,
    this.semanticDescription,
    this.focusable = true,
    this.excludeSemantics = false,
    this.expandedLabel = 'Expandido',
    this.collapsedLabel = 'Colapsado',
    this.expandHint = 'Presiona para expandir',
    this.collapseHint = 'Presiona para colapsar',
    this.loadingLabel = 'Cargando',
    this.disabledLabel = 'No disponible',
    this.announceStateChanges = true,
    this.useKeyboardHints = true,
  });

  /// Si la accesibilidad está habilitada
  @override
  @JsonKey()
  final bool enabled;

  /// Rol semántico del accordion
  @override
  @JsonKey()
  final String semanticRole;

  /// Label para screen readers
  @override
  final String? semanticLabel;

  /// Descripción para screen readers
  @override
  final String? semanticDescription;

  /// Si debe ser enfocable por teclado
  @override
  @JsonKey()
  final bool focusable;

  /// Si debe excluirse de la navegación semántica
  @override
  @JsonKey()
  final bool excludeSemantics;

  /// Label para estado expandido
  @override
  @JsonKey()
  final String expandedLabel;

  /// Label para estado colapsado
  @override
  @JsonKey()
  final String collapsedLabel;

  /// Label para acción de expandir
  @override
  @JsonKey()
  final String expandHint;

  /// Label para acción de colapsar
  @override
  @JsonKey()
  final String collapseHint;

  /// Label para estado de loading
  @override
  @JsonKey()
  final String loadingLabel;

  /// Label para estado disabled
  @override
  @JsonKey()
  final String disabledLabel;

  /// Si debe anunciar cambios de estado
  @override
  @JsonKey()
  final bool announceStateChanges;

  /// Si debe usar hints para navegación por teclado
  @override
  @JsonKey()
  final bool useKeyboardHints;

  @override
  String toString() {
    return 'DSAccordionAccessibilityConfig(enabled: $enabled, semanticRole: $semanticRole, semanticLabel: $semanticLabel, semanticDescription: $semanticDescription, focusable: $focusable, excludeSemantics: $excludeSemantics, expandedLabel: $expandedLabel, collapsedLabel: $collapsedLabel, expandHint: $expandHint, collapseHint: $collapseHint, loadingLabel: $loadingLabel, disabledLabel: $disabledLabel, announceStateChanges: $announceStateChanges, useKeyboardHints: $useKeyboardHints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionAccessibilityConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.semanticRole, semanticRole) ||
                other.semanticRole == semanticRole) &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel) &&
            (identical(other.semanticDescription, semanticDescription) ||
                other.semanticDescription == semanticDescription) &&
            (identical(other.focusable, focusable) ||
                other.focusable == focusable) &&
            (identical(other.excludeSemantics, excludeSemantics) ||
                other.excludeSemantics == excludeSemantics) &&
            (identical(other.expandedLabel, expandedLabel) ||
                other.expandedLabel == expandedLabel) &&
            (identical(other.collapsedLabel, collapsedLabel) ||
                other.collapsedLabel == collapsedLabel) &&
            (identical(other.expandHint, expandHint) ||
                other.expandHint == expandHint) &&
            (identical(other.collapseHint, collapseHint) ||
                other.collapseHint == collapseHint) &&
            (identical(other.loadingLabel, loadingLabel) ||
                other.loadingLabel == loadingLabel) &&
            (identical(other.disabledLabel, disabledLabel) ||
                other.disabledLabel == disabledLabel) &&
            (identical(other.announceStateChanges, announceStateChanges) ||
                other.announceStateChanges == announceStateChanges) &&
            (identical(other.useKeyboardHints, useKeyboardHints) ||
                other.useKeyboardHints == useKeyboardHints));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    semanticRole,
    semanticLabel,
    semanticDescription,
    focusable,
    excludeSemantics,
    expandedLabel,
    collapsedLabel,
    expandHint,
    collapseHint,
    loadingLabel,
    disabledLabel,
    announceStateChanges,
    useKeyboardHints,
  );

  /// Create a copy of DSAccordionAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionAccessibilityConfigImplCopyWith<
    _$DSAccordionAccessibilityConfigImpl
  >
  get copyWith =>
      __$$DSAccordionAccessibilityConfigImplCopyWithImpl<
        _$DSAccordionAccessibilityConfigImpl
      >(this, _$identity);
}

abstract class _DSAccordionAccessibilityConfig
    implements DSAccordionAccessibilityConfig {
  const factory _DSAccordionAccessibilityConfig({
    final bool enabled,
    final String semanticRole,
    final String? semanticLabel,
    final String? semanticDescription,
    final bool focusable,
    final bool excludeSemantics,
    final String expandedLabel,
    final String collapsedLabel,
    final String expandHint,
    final String collapseHint,
    final String loadingLabel,
    final String disabledLabel,
    final bool announceStateChanges,
    final bool useKeyboardHints,
  }) = _$DSAccordionAccessibilityConfigImpl;

  /// Si la accesibilidad está habilitada
  @override
  bool get enabled;

  /// Rol semántico del accordion
  @override
  String get semanticRole;

  /// Label para screen readers
  @override
  String? get semanticLabel;

  /// Descripción para screen readers
  @override
  String? get semanticDescription;

  /// Si debe ser enfocable por teclado
  @override
  bool get focusable;

  /// Si debe excluirse de la navegación semántica
  @override
  bool get excludeSemantics;

  /// Label para estado expandido
  @override
  String get expandedLabel;

  /// Label para estado colapsado
  @override
  String get collapsedLabel;

  /// Label para acción de expandir
  @override
  String get expandHint;

  /// Label para acción de colapsar
  @override
  String get collapseHint;

  /// Label para estado de loading
  @override
  String get loadingLabel;

  /// Label para estado disabled
  @override
  String get disabledLabel;

  /// Si debe anunciar cambios de estado
  @override
  bool get announceStateChanges;

  /// Si debe usar hints para navegación por teclado
  @override
  bool get useKeyboardHints;

  /// Create a copy of DSAccordionAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionAccessibilityConfigImplCopyWith<
    _$DSAccordionAccessibilityConfigImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionItemColors {
  /// Color de fondo del elemento
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color del header del elemento
  Color? get headerColor => throw _privateConstructorUsedError;

  /// Color del contenido del elemento
  Color? get contentColor => throw _privateConstructorUsedError;

  /// Color del texto del título
  Color? get titleColor => throw _privateConstructorUsedError;

  /// Color del texto del subtítulo
  Color? get subtitleColor => throw _privateConstructorUsedError;

  /// Color del icono
  Color? get iconColor => throw _privateConstructorUsedError;

  /// Color del border
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionItemColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionItemColorsCopyWith<DSAccordionItemColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionItemColorsCopyWith<$Res> {
  factory $DSAccordionItemColorsCopyWith(
    DSAccordionItemColors value,
    $Res Function(DSAccordionItemColors) then,
  ) = _$DSAccordionItemColorsCopyWithImpl<$Res, DSAccordionItemColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? headerColor,
    Color? contentColor,
    Color? titleColor,
    Color? subtitleColor,
    Color? iconColor,
    Color? borderColor,
  });
}

/// @nodoc
class _$DSAccordionItemColorsCopyWithImpl<
  $Res,
  $Val extends DSAccordionItemColors
>
    implements $DSAccordionItemColorsCopyWith<$Res> {
  _$DSAccordionItemColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionItemColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? headerColor = freezed,
    Object? contentColor = freezed,
    Object? titleColor = freezed,
    Object? subtitleColor = freezed,
    Object? iconColor = freezed,
    Object? borderColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            headerColor: freezed == headerColor
                ? _value.headerColor
                : headerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            contentColor: freezed == contentColor
                ? _value.contentColor
                : contentColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            titleColor: freezed == titleColor
                ? _value.titleColor
                : titleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            subtitleColor: freezed == subtitleColor
                ? _value.subtitleColor
                : subtitleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            iconColor: freezed == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionItemColorsImplCopyWith<$Res>
    implements $DSAccordionItemColorsCopyWith<$Res> {
  factory _$$DSAccordionItemColorsImplCopyWith(
    _$DSAccordionItemColorsImpl value,
    $Res Function(_$DSAccordionItemColorsImpl) then,
  ) = __$$DSAccordionItemColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? headerColor,
    Color? contentColor,
    Color? titleColor,
    Color? subtitleColor,
    Color? iconColor,
    Color? borderColor,
  });
}

/// @nodoc
class __$$DSAccordionItemColorsImplCopyWithImpl<$Res>
    extends
        _$DSAccordionItemColorsCopyWithImpl<$Res, _$DSAccordionItemColorsImpl>
    implements _$$DSAccordionItemColorsImplCopyWith<$Res> {
  __$$DSAccordionItemColorsImplCopyWithImpl(
    _$DSAccordionItemColorsImpl _value,
    $Res Function(_$DSAccordionItemColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionItemColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? headerColor = freezed,
    Object? contentColor = freezed,
    Object? titleColor = freezed,
    Object? subtitleColor = freezed,
    Object? iconColor = freezed,
    Object? borderColor = freezed,
  }) {
    return _then(
      _$DSAccordionItemColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        headerColor: freezed == headerColor
            ? _value.headerColor
            : headerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        contentColor: freezed == contentColor
            ? _value.contentColor
            : contentColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        titleColor: freezed == titleColor
            ? _value.titleColor
            : titleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        subtitleColor: freezed == subtitleColor
            ? _value.subtitleColor
            : subtitleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        iconColor: freezed == iconColor
            ? _value.iconColor
            : iconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionItemColorsImpl implements _DSAccordionItemColors {
  const _$DSAccordionItemColorsImpl({
    this.backgroundColor,
    this.headerColor,
    this.contentColor,
    this.titleColor,
    this.subtitleColor,
    this.iconColor,
    this.borderColor,
  });

  /// Color de fondo del elemento
  @override
  final Color? backgroundColor;

  /// Color del header del elemento
  @override
  final Color? headerColor;

  /// Color del contenido del elemento
  @override
  final Color? contentColor;

  /// Color del texto del título
  @override
  final Color? titleColor;

  /// Color del texto del subtítulo
  @override
  final Color? subtitleColor;

  /// Color del icono
  @override
  final Color? iconColor;

  /// Color del border
  @override
  final Color? borderColor;

  @override
  String toString() {
    return 'DSAccordionItemColors(backgroundColor: $backgroundColor, headerColor: $headerColor, contentColor: $contentColor, titleColor: $titleColor, subtitleColor: $subtitleColor, iconColor: $iconColor, borderColor: $borderColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionItemColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.headerColor, headerColor) ||
                other.headerColor == headerColor) &&
            (identical(other.contentColor, contentColor) ||
                other.contentColor == contentColor) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.subtitleColor, subtitleColor) ||
                other.subtitleColor == subtitleColor) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    headerColor,
    contentColor,
    titleColor,
    subtitleColor,
    iconColor,
    borderColor,
  );

  /// Create a copy of DSAccordionItemColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionItemColorsImplCopyWith<_$DSAccordionItemColorsImpl>
  get copyWith =>
      __$$DSAccordionItemColorsImplCopyWithImpl<_$DSAccordionItemColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSAccordionItemColors implements DSAccordionItemColors {
  const factory _DSAccordionItemColors({
    final Color? backgroundColor,
    final Color? headerColor,
    final Color? contentColor,
    final Color? titleColor,
    final Color? subtitleColor,
    final Color? iconColor,
    final Color? borderColor,
  }) = _$DSAccordionItemColorsImpl;

  /// Color de fondo del elemento
  @override
  Color? get backgroundColor;

  /// Color del header del elemento
  @override
  Color? get headerColor;

  /// Color del contenido del elemento
  @override
  Color? get contentColor;

  /// Color del texto del título
  @override
  Color? get titleColor;

  /// Color del texto del subtítulo
  @override
  Color? get subtitleColor;

  /// Color del icono
  @override
  Color? get iconColor;

  /// Color del border
  @override
  Color? get borderColor;

  /// Create a copy of DSAccordionItemColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionItemColorsImplCopyWith<_$DSAccordionItemColorsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionItemAccessibility {
  /// Label semántico del elemento
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Descripción semántica del elemento
  String? get semanticDescription => throw _privateConstructorUsedError;

  /// Hint semántico del elemento
  String? get semanticHint => throw _privateConstructorUsedError;

  /// Si debe excluirse de la navegación semántica
  bool get excludeSemantics => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionItemAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionItemAccessibilityCopyWith<DSAccordionItemAccessibility>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionItemAccessibilityCopyWith<$Res> {
  factory $DSAccordionItemAccessibilityCopyWith(
    DSAccordionItemAccessibility value,
    $Res Function(DSAccordionItemAccessibility) then,
  ) =
      _$DSAccordionItemAccessibilityCopyWithImpl<
        $Res,
        DSAccordionItemAccessibility
      >;
  @useResult
  $Res call({
    String? semanticLabel,
    String? semanticDescription,
    String? semanticHint,
    bool excludeSemantics,
  });
}

/// @nodoc
class _$DSAccordionItemAccessibilityCopyWithImpl<
  $Res,
  $Val extends DSAccordionItemAccessibility
>
    implements $DSAccordionItemAccessibilityCopyWith<$Res> {
  _$DSAccordionItemAccessibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionItemAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? semanticLabel = freezed,
    Object? semanticDescription = freezed,
    Object? semanticHint = freezed,
    Object? excludeSemantics = null,
  }) {
    return _then(
      _value.copyWith(
            semanticLabel: freezed == semanticLabel
                ? _value.semanticLabel
                : semanticLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            semanticDescription: freezed == semanticDescription
                ? _value.semanticDescription
                : semanticDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            semanticHint: freezed == semanticHint
                ? _value.semanticHint
                : semanticHint // ignore: cast_nullable_to_non_nullable
                      as String?,
            excludeSemantics: null == excludeSemantics
                ? _value.excludeSemantics
                : excludeSemantics // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionItemAccessibilityImplCopyWith<$Res>
    implements $DSAccordionItemAccessibilityCopyWith<$Res> {
  factory _$$DSAccordionItemAccessibilityImplCopyWith(
    _$DSAccordionItemAccessibilityImpl value,
    $Res Function(_$DSAccordionItemAccessibilityImpl) then,
  ) = __$$DSAccordionItemAccessibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? semanticLabel,
    String? semanticDescription,
    String? semanticHint,
    bool excludeSemantics,
  });
}

/// @nodoc
class __$$DSAccordionItemAccessibilityImplCopyWithImpl<$Res>
    extends
        _$DSAccordionItemAccessibilityCopyWithImpl<
          $Res,
          _$DSAccordionItemAccessibilityImpl
        >
    implements _$$DSAccordionItemAccessibilityImplCopyWith<$Res> {
  __$$DSAccordionItemAccessibilityImplCopyWithImpl(
    _$DSAccordionItemAccessibilityImpl _value,
    $Res Function(_$DSAccordionItemAccessibilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionItemAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? semanticLabel = freezed,
    Object? semanticDescription = freezed,
    Object? semanticHint = freezed,
    Object? excludeSemantics = null,
  }) {
    return _then(
      _$DSAccordionItemAccessibilityImpl(
        semanticLabel: freezed == semanticLabel
            ? _value.semanticLabel
            : semanticLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        semanticDescription: freezed == semanticDescription
            ? _value.semanticDescription
            : semanticDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        semanticHint: freezed == semanticHint
            ? _value.semanticHint
            : semanticHint // ignore: cast_nullable_to_non_nullable
                  as String?,
        excludeSemantics: null == excludeSemantics
            ? _value.excludeSemantics
            : excludeSemantics // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionItemAccessibilityImpl
    implements _DSAccordionItemAccessibility {
  const _$DSAccordionItemAccessibilityImpl({
    this.semanticLabel,
    this.semanticDescription,
    this.semanticHint,
    this.excludeSemantics = false,
  });

  /// Label semántico del elemento
  @override
  final String? semanticLabel;

  /// Descripción semántica del elemento
  @override
  final String? semanticDescription;

  /// Hint semántico del elemento
  @override
  final String? semanticHint;

  /// Si debe excluirse de la navegación semántica
  @override
  @JsonKey()
  final bool excludeSemantics;

  @override
  String toString() {
    return 'DSAccordionItemAccessibility(semanticLabel: $semanticLabel, semanticDescription: $semanticDescription, semanticHint: $semanticHint, excludeSemantics: $excludeSemantics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionItemAccessibilityImpl &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel) &&
            (identical(other.semanticDescription, semanticDescription) ||
                other.semanticDescription == semanticDescription) &&
            (identical(other.semanticHint, semanticHint) ||
                other.semanticHint == semanticHint) &&
            (identical(other.excludeSemantics, excludeSemantics) ||
                other.excludeSemantics == excludeSemantics));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    semanticLabel,
    semanticDescription,
    semanticHint,
    excludeSemantics,
  );

  /// Create a copy of DSAccordionItemAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionItemAccessibilityImplCopyWith<
    _$DSAccordionItemAccessibilityImpl
  >
  get copyWith =>
      __$$DSAccordionItemAccessibilityImplCopyWithImpl<
        _$DSAccordionItemAccessibilityImpl
      >(this, _$identity);
}

abstract class _DSAccordionItemAccessibility
    implements DSAccordionItemAccessibility {
  const factory _DSAccordionItemAccessibility({
    final String? semanticLabel,
    final String? semanticDescription,
    final String? semanticHint,
    final bool excludeSemantics,
  }) = _$DSAccordionItemAccessibilityImpl;

  /// Label semántico del elemento
  @override
  String? get semanticLabel;

  /// Descripción semántica del elemento
  @override
  String? get semanticDescription;

  /// Hint semántico del elemento
  @override
  String? get semanticHint;

  /// Si debe excluirse de la navegación semántica
  @override
  bool get excludeSemantics;

  /// Create a copy of DSAccordionItemAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionItemAccessibilityImplCopyWith<
    _$DSAccordionItemAccessibilityImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSAccordionValidationError {
  DSAccordionErrorType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<DSAccordionItem>? get items => throw _privateConstructorUsedError;
  List<String>? get expandedKeys => throw _privateConstructorUsedError;
  String? get itemKey => throw _privateConstructorUsedError;

  /// Create a copy of DSAccordionValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSAccordionValidationErrorCopyWith<DSAccordionValidationError>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSAccordionValidationErrorCopyWith<$Res> {
  factory $DSAccordionValidationErrorCopyWith(
    DSAccordionValidationError value,
    $Res Function(DSAccordionValidationError) then,
  ) =
      _$DSAccordionValidationErrorCopyWithImpl<
        $Res,
        DSAccordionValidationError
      >;
  @useResult
  $Res call({
    DSAccordionErrorType type,
    String message,
    List<DSAccordionItem>? items,
    List<String>? expandedKeys,
    String? itemKey,
  });
}

/// @nodoc
class _$DSAccordionValidationErrorCopyWithImpl<
  $Res,
  $Val extends DSAccordionValidationError
>
    implements $DSAccordionValidationErrorCopyWith<$Res> {
  _$DSAccordionValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSAccordionValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? items = freezed,
    Object? expandedKeys = freezed,
    Object? itemKey = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSAccordionErrorType,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            items: freezed == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<DSAccordionItem>?,
            expandedKeys: freezed == expandedKeys
                ? _value.expandedKeys
                : expandedKeys // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            itemKey: freezed == itemKey
                ? _value.itemKey
                : itemKey // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSAccordionValidationErrorImplCopyWith<$Res>
    implements $DSAccordionValidationErrorCopyWith<$Res> {
  factory _$$DSAccordionValidationErrorImplCopyWith(
    _$DSAccordionValidationErrorImpl value,
    $Res Function(_$DSAccordionValidationErrorImpl) then,
  ) = __$$DSAccordionValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSAccordionErrorType type,
    String message,
    List<DSAccordionItem>? items,
    List<String>? expandedKeys,
    String? itemKey,
  });
}

/// @nodoc
class __$$DSAccordionValidationErrorImplCopyWithImpl<$Res>
    extends
        _$DSAccordionValidationErrorCopyWithImpl<
          $Res,
          _$DSAccordionValidationErrorImpl
        >
    implements _$$DSAccordionValidationErrorImplCopyWith<$Res> {
  __$$DSAccordionValidationErrorImplCopyWithImpl(
    _$DSAccordionValidationErrorImpl _value,
    $Res Function(_$DSAccordionValidationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSAccordionValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? items = freezed,
    Object? expandedKeys = freezed,
    Object? itemKey = freezed,
  }) {
    return _then(
      _$DSAccordionValidationErrorImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSAccordionErrorType,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        items: freezed == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<DSAccordionItem>?,
        expandedKeys: freezed == expandedKeys
            ? _value._expandedKeys
            : expandedKeys // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        itemKey: freezed == itemKey
            ? _value.itemKey
            : itemKey // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSAccordionValidationErrorImpl implements _DSAccordionValidationError {
  const _$DSAccordionValidationErrorImpl({
    required this.type,
    required this.message,
    final List<DSAccordionItem>? items,
    final List<String>? expandedKeys,
    this.itemKey,
  }) : _items = items,
       _expandedKeys = expandedKeys;

  @override
  final DSAccordionErrorType type;
  @override
  final String message;
  final List<DSAccordionItem>? _items;
  @override
  List<DSAccordionItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _expandedKeys;
  @override
  List<String>? get expandedKeys {
    final value = _expandedKeys;
    if (value == null) return null;
    if (_expandedKeys is EqualUnmodifiableListView) return _expandedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? itemKey;

  @override
  String toString() {
    return 'DSAccordionValidationError(type: $type, message: $message, items: $items, expandedKeys: $expandedKeys, itemKey: $itemKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSAccordionValidationErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._expandedKeys,
              _expandedKeys,
            ) &&
            (identical(other.itemKey, itemKey) || other.itemKey == itemKey));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    message,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_expandedKeys),
    itemKey,
  );

  /// Create a copy of DSAccordionValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSAccordionValidationErrorImplCopyWith<_$DSAccordionValidationErrorImpl>
  get copyWith =>
      __$$DSAccordionValidationErrorImplCopyWithImpl<
        _$DSAccordionValidationErrorImpl
      >(this, _$identity);
}

abstract class _DSAccordionValidationError
    implements DSAccordionValidationError {
  const factory _DSAccordionValidationError({
    required final DSAccordionErrorType type,
    required final String message,
    final List<DSAccordionItem>? items,
    final List<String>? expandedKeys,
    final String? itemKey,
  }) = _$DSAccordionValidationErrorImpl;

  @override
  DSAccordionErrorType get type;
  @override
  String get message;
  @override
  List<DSAccordionItem>? get items;
  @override
  List<String>? get expandedKeys;
  @override
  String? get itemKey;

  /// Create a copy of DSAccordionValidationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSAccordionValidationErrorImplCopyWith<_$DSAccordionValidationErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
