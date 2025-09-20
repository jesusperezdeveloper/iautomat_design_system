// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_image_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSImageConfig {
  /// Variante del componente image
  DSImageVariant get variant => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSImageState get state => throw _privateConstructorUsedError;

  /// URL o path de la imagen
  String get src => throw _privateConstructorUsedError;

  /// Texto alternativo para accesibilidad
  String get alt => throw _privateConstructorUsedError;

  /// Cómo debe ajustarse la imagen al container
  BoxFit get fit => throw _privateConstructorUsedError;

  /// Ratio de aspecto de la imagen (ancho/alto)
  double? get ratio => throw _privateConstructorUsedError;

  /// Widget placeholder mientras carga la imagen
  Widget? get placeholder => throw _privateConstructorUsedError;

  /// Widget a mostrar en caso de error
  Widget? get errorWidget => throw _privateConstructorUsedError;

  /// Configuración de colores
  DSImageColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado y dimensiones
  DSImageSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de elevación y sombras
  DSImageElevation? get elevation => throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSImageBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSImageAnimation? get animation => throw _privateConstructorUsedError;

  /// Configuración de carga lazy
  DSImageLazyConfig? get lazyConfig => throw _privateConstructorUsedError;

  /// Configuración de responsividad
  DSImageResponsiveConfig? get responsiveConfig =>
      throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSImageA11yConfig? get a11yConfig => throw _privateConstructorUsedError;

  /// Callbacks de interacción
  VoidCallback? get onTap => throw _privateConstructorUsedError;
  VoidCallback? get onLongPress => throw _privateConstructorUsedError;
  ValueChanged<bool>? get onHover => throw _privateConstructorUsedError;
  ValueChanged<bool>? get onFocusChange => throw _privateConstructorUsedError;
  VoidCallback? get onLoad => throw _privateConstructorUsedError;
  VoidCallback? get onError => throw _privateConstructorUsedError;

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageConfigCopyWith<DSImageConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageConfigCopyWith<$Res> {
  factory $DSImageConfigCopyWith(
    DSImageConfig value,
    $Res Function(DSImageConfig) then,
  ) = _$DSImageConfigCopyWithImpl<$Res, DSImageConfig>;
  @useResult
  $Res call({
    DSImageVariant variant,
    DSImageState state,
    String src,
    String alt,
    BoxFit fit,
    double? ratio,
    Widget? placeholder,
    Widget? errorWidget,
    DSImageColors? colors,
    DSImageSpacing? spacing,
    DSImageElevation? elevation,
    DSImageBehavior? behavior,
    DSImageAnimation? animation,
    DSImageLazyConfig? lazyConfig,
    DSImageResponsiveConfig? responsiveConfig,
    DSImageA11yConfig? a11yConfig,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    VoidCallback? onLoad,
    VoidCallback? onError,
  });

  $DSImageColorsCopyWith<$Res>? get colors;
  $DSImageSpacingCopyWith<$Res>? get spacing;
  $DSImageElevationCopyWith<$Res>? get elevation;
  $DSImageBehaviorCopyWith<$Res>? get behavior;
  $DSImageAnimationCopyWith<$Res>? get animation;
  $DSImageLazyConfigCopyWith<$Res>? get lazyConfig;
  $DSImageResponsiveConfigCopyWith<$Res>? get responsiveConfig;
  $DSImageA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class _$DSImageConfigCopyWithImpl<$Res, $Val extends DSImageConfig>
    implements $DSImageConfigCopyWith<$Res> {
  _$DSImageConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? src = null,
    Object? alt = null,
    Object? fit = null,
    Object? ratio = freezed,
    Object? placeholder = freezed,
    Object? errorWidget = freezed,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
    Object? lazyConfig = freezed,
    Object? responsiveConfig = freezed,
    Object? a11yConfig = freezed,
    Object? onTap = freezed,
    Object? onLongPress = freezed,
    Object? onHover = freezed,
    Object? onFocusChange = freezed,
    Object? onLoad = freezed,
    Object? onError = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSImageVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSImageState,
            src: null == src
                ? _value.src
                : src // ignore: cast_nullable_to_non_nullable
                      as String,
            alt: null == alt
                ? _value.alt
                : alt // ignore: cast_nullable_to_non_nullable
                      as String,
            fit: null == fit
                ? _value.fit
                : fit // ignore: cast_nullable_to_non_nullable
                      as BoxFit,
            ratio: freezed == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as double?,
            placeholder: freezed == placeholder
                ? _value.placeholder
                : placeholder // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            errorWidget: freezed == errorWidget
                ? _value.errorWidget
                : errorWidget // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSImageColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSImageSpacing?,
            elevation: freezed == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as DSImageElevation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSImageBehavior?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSImageAnimation?,
            lazyConfig: freezed == lazyConfig
                ? _value.lazyConfig
                : lazyConfig // ignore: cast_nullable_to_non_nullable
                      as DSImageLazyConfig?,
            responsiveConfig: freezed == responsiveConfig
                ? _value.responsiveConfig
                : responsiveConfig // ignore: cast_nullable_to_non_nullable
                      as DSImageResponsiveConfig?,
            a11yConfig: freezed == a11yConfig
                ? _value.a11yConfig
                : a11yConfig // ignore: cast_nullable_to_non_nullable
                      as DSImageA11yConfig?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onLongPress: freezed == onLongPress
                ? _value.onLongPress
                : onLongPress // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onHover: freezed == onHover
                ? _value.onHover
                : onHover // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<bool>?,
            onFocusChange: freezed == onFocusChange
                ? _value.onFocusChange
                : onFocusChange // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<bool>?,
            onLoad: freezed == onLoad
                ? _value.onLoad
                : onLoad // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onError: freezed == onError
                ? _value.onError
                : onError // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSImageColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSImageSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageElevationCopyWith<$Res>? get elevation {
    if (_value.elevation == null) {
      return null;
    }

    return $DSImageElevationCopyWith<$Res>(_value.elevation!, (value) {
      return _then(_value.copyWith(elevation: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSImageBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSImageAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageLazyConfigCopyWith<$Res>? get lazyConfig {
    if (_value.lazyConfig == null) {
      return null;
    }

    return $DSImageLazyConfigCopyWith<$Res>(_value.lazyConfig!, (value) {
      return _then(_value.copyWith(lazyConfig: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageResponsiveConfigCopyWith<$Res>? get responsiveConfig {
    if (_value.responsiveConfig == null) {
      return null;
    }

    return $DSImageResponsiveConfigCopyWith<$Res>(_value.responsiveConfig!, (
      value,
    ) {
      return _then(_value.copyWith(responsiveConfig: value) as $Val);
    });
  }

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageA11yConfigCopyWith<$Res>? get a11yConfig {
    if (_value.a11yConfig == null) {
      return null;
    }

    return $DSImageA11yConfigCopyWith<$Res>(_value.a11yConfig!, (value) {
      return _then(_value.copyWith(a11yConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSImageConfigImplCopyWith<$Res>
    implements $DSImageConfigCopyWith<$Res> {
  factory _$$DSImageConfigImplCopyWith(
    _$DSImageConfigImpl value,
    $Res Function(_$DSImageConfigImpl) then,
  ) = __$$DSImageConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSImageVariant variant,
    DSImageState state,
    String src,
    String alt,
    BoxFit fit,
    double? ratio,
    Widget? placeholder,
    Widget? errorWidget,
    DSImageColors? colors,
    DSImageSpacing? spacing,
    DSImageElevation? elevation,
    DSImageBehavior? behavior,
    DSImageAnimation? animation,
    DSImageLazyConfig? lazyConfig,
    DSImageResponsiveConfig? responsiveConfig,
    DSImageA11yConfig? a11yConfig,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    VoidCallback? onLoad,
    VoidCallback? onError,
  });

  @override
  $DSImageColorsCopyWith<$Res>? get colors;
  @override
  $DSImageSpacingCopyWith<$Res>? get spacing;
  @override
  $DSImageElevationCopyWith<$Res>? get elevation;
  @override
  $DSImageBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSImageAnimationCopyWith<$Res>? get animation;
  @override
  $DSImageLazyConfigCopyWith<$Res>? get lazyConfig;
  @override
  $DSImageResponsiveConfigCopyWith<$Res>? get responsiveConfig;
  @override
  $DSImageA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class __$$DSImageConfigImplCopyWithImpl<$Res>
    extends _$DSImageConfigCopyWithImpl<$Res, _$DSImageConfigImpl>
    implements _$$DSImageConfigImplCopyWith<$Res> {
  __$$DSImageConfigImplCopyWithImpl(
    _$DSImageConfigImpl _value,
    $Res Function(_$DSImageConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? src = null,
    Object? alt = null,
    Object? fit = null,
    Object? ratio = freezed,
    Object? placeholder = freezed,
    Object? errorWidget = freezed,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
    Object? lazyConfig = freezed,
    Object? responsiveConfig = freezed,
    Object? a11yConfig = freezed,
    Object? onTap = freezed,
    Object? onLongPress = freezed,
    Object? onHover = freezed,
    Object? onFocusChange = freezed,
    Object? onLoad = freezed,
    Object? onError = freezed,
  }) {
    return _then(
      _$DSImageConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSImageVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSImageState,
        src: null == src
            ? _value.src
            : src // ignore: cast_nullable_to_non_nullable
                  as String,
        alt: null == alt
            ? _value.alt
            : alt // ignore: cast_nullable_to_non_nullable
                  as String,
        fit: null == fit
            ? _value.fit
            : fit // ignore: cast_nullable_to_non_nullable
                  as BoxFit,
        ratio: freezed == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as double?,
        placeholder: freezed == placeholder
            ? _value.placeholder
            : placeholder // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        errorWidget: freezed == errorWidget
            ? _value.errorWidget
            : errorWidget // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSImageColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSImageSpacing?,
        elevation: freezed == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as DSImageElevation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSImageBehavior?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSImageAnimation?,
        lazyConfig: freezed == lazyConfig
            ? _value.lazyConfig
            : lazyConfig // ignore: cast_nullable_to_non_nullable
                  as DSImageLazyConfig?,
        responsiveConfig: freezed == responsiveConfig
            ? _value.responsiveConfig
            : responsiveConfig // ignore: cast_nullable_to_non_nullable
                  as DSImageResponsiveConfig?,
        a11yConfig: freezed == a11yConfig
            ? _value.a11yConfig
            : a11yConfig // ignore: cast_nullable_to_non_nullable
                  as DSImageA11yConfig?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onLongPress: freezed == onLongPress
            ? _value.onLongPress
            : onLongPress // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onHover: freezed == onHover
            ? _value.onHover
            : onHover // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<bool>?,
        onFocusChange: freezed == onFocusChange
            ? _value.onFocusChange
            : onFocusChange // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<bool>?,
        onLoad: freezed == onLoad
            ? _value.onLoad
            : onLoad // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onError: freezed == onError
            ? _value.onError
            : onError // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSImageConfigImpl implements _DSImageConfig {
  const _$DSImageConfigImpl({
    this.variant = DSImageVariant.responsive,
    this.state = DSImageState.defaultState,
    required this.src,
    this.alt = '',
    this.fit = BoxFit.cover,
    this.ratio,
    this.placeholder,
    this.errorWidget,
    this.colors,
    this.spacing,
    this.elevation,
    this.behavior,
    this.animation,
    this.lazyConfig,
    this.responsiveConfig,
    this.a11yConfig,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.onLoad,
    this.onError,
  });

  /// Variante del componente image
  @override
  @JsonKey()
  final DSImageVariant variant;

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSImageState state;

  /// URL o path de la imagen
  @override
  final String src;

  /// Texto alternativo para accesibilidad
  @override
  @JsonKey()
  final String alt;

  /// Cómo debe ajustarse la imagen al container
  @override
  @JsonKey()
  final BoxFit fit;

  /// Ratio de aspecto de la imagen (ancho/alto)
  @override
  final double? ratio;

  /// Widget placeholder mientras carga la imagen
  @override
  final Widget? placeholder;

  /// Widget a mostrar en caso de error
  @override
  final Widget? errorWidget;

  /// Configuración de colores
  @override
  final DSImageColors? colors;

  /// Configuración de espaciado y dimensiones
  @override
  final DSImageSpacing? spacing;

  /// Configuración de elevación y sombras
  @override
  final DSImageElevation? elevation;

  /// Configuración de comportamiento
  @override
  final DSImageBehavior? behavior;

  /// Configuración de animaciones
  @override
  final DSImageAnimation? animation;

  /// Configuración de carga lazy
  @override
  final DSImageLazyConfig? lazyConfig;

  /// Configuración de responsividad
  @override
  final DSImageResponsiveConfig? responsiveConfig;

  /// Configuración de accesibilidad
  @override
  final DSImageA11yConfig? a11yConfig;

  /// Callbacks de interacción
  @override
  final VoidCallback? onTap;
  @override
  final VoidCallback? onLongPress;
  @override
  final ValueChanged<bool>? onHover;
  @override
  final ValueChanged<bool>? onFocusChange;
  @override
  final VoidCallback? onLoad;
  @override
  final VoidCallback? onError;

  @override
  String toString() {
    return 'DSImageConfig(variant: $variant, state: $state, src: $src, alt: $alt, fit: $fit, ratio: $ratio, placeholder: $placeholder, errorWidget: $errorWidget, colors: $colors, spacing: $spacing, elevation: $elevation, behavior: $behavior, animation: $animation, lazyConfig: $lazyConfig, responsiveConfig: $responsiveConfig, a11yConfig: $a11yConfig, onTap: $onTap, onLongPress: $onLongPress, onHover: $onHover, onFocusChange: $onFocusChange, onLoad: $onLoad, onError: $onError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.errorWidget, errorWidget) ||
                other.errorWidget == errorWidget) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.animation, animation) ||
                other.animation == animation) &&
            (identical(other.lazyConfig, lazyConfig) ||
                other.lazyConfig == lazyConfig) &&
            (identical(other.responsiveConfig, responsiveConfig) ||
                other.responsiveConfig == responsiveConfig) &&
            (identical(other.a11yConfig, a11yConfig) ||
                other.a11yConfig == a11yConfig) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.onLongPress, onLongPress) ||
                other.onLongPress == onLongPress) &&
            (identical(other.onHover, onHover) || other.onHover == onHover) &&
            (identical(other.onFocusChange, onFocusChange) ||
                other.onFocusChange == onFocusChange) &&
            (identical(other.onLoad, onLoad) || other.onLoad == onLoad) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    variant,
    state,
    src,
    alt,
    fit,
    ratio,
    placeholder,
    errorWidget,
    colors,
    spacing,
    elevation,
    behavior,
    animation,
    lazyConfig,
    responsiveConfig,
    a11yConfig,
    onTap,
    onLongPress,
    onHover,
    onFocusChange,
    onLoad,
    onError,
  ]);

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageConfigImplCopyWith<_$DSImageConfigImpl> get copyWith =>
      __$$DSImageConfigImplCopyWithImpl<_$DSImageConfigImpl>(this, _$identity);
}

abstract class _DSImageConfig implements DSImageConfig {
  const factory _DSImageConfig({
    final DSImageVariant variant,
    final DSImageState state,
    required final String src,
    final String alt,
    final BoxFit fit,
    final double? ratio,
    final Widget? placeholder,
    final Widget? errorWidget,
    final DSImageColors? colors,
    final DSImageSpacing? spacing,
    final DSImageElevation? elevation,
    final DSImageBehavior? behavior,
    final DSImageAnimation? animation,
    final DSImageLazyConfig? lazyConfig,
    final DSImageResponsiveConfig? responsiveConfig,
    final DSImageA11yConfig? a11yConfig,
    final VoidCallback? onTap,
    final VoidCallback? onLongPress,
    final ValueChanged<bool>? onHover,
    final ValueChanged<bool>? onFocusChange,
    final VoidCallback? onLoad,
    final VoidCallback? onError,
  }) = _$DSImageConfigImpl;

  /// Variante del componente image
  @override
  DSImageVariant get variant;

  /// Estado actual del componente
  @override
  DSImageState get state;

  /// URL o path de la imagen
  @override
  String get src;

  /// Texto alternativo para accesibilidad
  @override
  String get alt;

  /// Cómo debe ajustarse la imagen al container
  @override
  BoxFit get fit;

  /// Ratio de aspecto de la imagen (ancho/alto)
  @override
  double? get ratio;

  /// Widget placeholder mientras carga la imagen
  @override
  Widget? get placeholder;

  /// Widget a mostrar en caso de error
  @override
  Widget? get errorWidget;

  /// Configuración de colores
  @override
  DSImageColors? get colors;

  /// Configuración de espaciado y dimensiones
  @override
  DSImageSpacing? get spacing;

  /// Configuración de elevación y sombras
  @override
  DSImageElevation? get elevation;

  /// Configuración de comportamiento
  @override
  DSImageBehavior? get behavior;

  /// Configuración de animaciones
  @override
  DSImageAnimation? get animation;

  /// Configuración de carga lazy
  @override
  DSImageLazyConfig? get lazyConfig;

  /// Configuración de responsividad
  @override
  DSImageResponsiveConfig? get responsiveConfig;

  /// Configuración de accesibilidad
  @override
  DSImageA11yConfig? get a11yConfig;

  /// Callbacks de interacción
  @override
  VoidCallback? get onTap;
  @override
  VoidCallback? get onLongPress;
  @override
  ValueChanged<bool>? get onHover;
  @override
  ValueChanged<bool>? get onFocusChange;
  @override
  VoidCallback? get onLoad;
  @override
  VoidCallback? get onError;

  /// Create a copy of DSImageConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageConfigImplCopyWith<_$DSImageConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageColors {
  /// Color de fondo del container
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color del borde
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Color de la sombra
  Color? get shadowColor => throw _privateConstructorUsedError;

  /// Color del overlay en hover
  Color? get hoverOverlayColor => throw _privateConstructorUsedError;

  /// Color del overlay cuando está presionado
  Color? get pressedOverlayColor => throw _privateConstructorUsedError;

  /// Color del overlay cuando está seleccionado
  Color? get selectedOverlayColor => throw _privateConstructorUsedError;

  /// Color del overlay cuando está enfocado
  Color? get focusOverlayColor => throw _privateConstructorUsedError;

  /// Color del placeholder
  Color? get placeholderColor => throw _privateConstructorUsedError;

  /// Color del skeleton durante carga
  Color? get skeletonColor => throw _privateConstructorUsedError;

  /// Color de fondo cuando está deshabilitado
  Color? get disabledBackgroundColor => throw _privateConstructorUsedError;

  /// Color del filtro cuando está deshabilitado
  Color? get disabledFilterColor => throw _privateConstructorUsedError;

  /// Create a copy of DSImageColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageColorsCopyWith<DSImageColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageColorsCopyWith<$Res> {
  factory $DSImageColorsCopyWith(
    DSImageColors value,
    $Res Function(DSImageColors) then,
  ) = _$DSImageColorsCopyWithImpl<$Res, DSImageColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? hoverOverlayColor,
    Color? pressedOverlayColor,
    Color? selectedOverlayColor,
    Color? focusOverlayColor,
    Color? placeholderColor,
    Color? skeletonColor,
    Color? disabledBackgroundColor,
    Color? disabledFilterColor,
  });
}

/// @nodoc
class _$DSImageColorsCopyWithImpl<$Res, $Val extends DSImageColors>
    implements $DSImageColorsCopyWith<$Res> {
  _$DSImageColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? hoverOverlayColor = freezed,
    Object? pressedOverlayColor = freezed,
    Object? selectedOverlayColor = freezed,
    Object? focusOverlayColor = freezed,
    Object? placeholderColor = freezed,
    Object? skeletonColor = freezed,
    Object? disabledBackgroundColor = freezed,
    Object? disabledFilterColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            hoverOverlayColor: freezed == hoverOverlayColor
                ? _value.hoverOverlayColor
                : hoverOverlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            pressedOverlayColor: freezed == pressedOverlayColor
                ? _value.pressedOverlayColor
                : pressedOverlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedOverlayColor: freezed == selectedOverlayColor
                ? _value.selectedOverlayColor
                : selectedOverlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            focusOverlayColor: freezed == focusOverlayColor
                ? _value.focusOverlayColor
                : focusOverlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            placeholderColor: freezed == placeholderColor
                ? _value.placeholderColor
                : placeholderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonColor: freezed == skeletonColor
                ? _value.skeletonColor
                : skeletonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledBackgroundColor: freezed == disabledBackgroundColor
                ? _value.disabledBackgroundColor
                : disabledBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            disabledFilterColor: freezed == disabledFilterColor
                ? _value.disabledFilterColor
                : disabledFilterColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageColorsImplCopyWith<$Res>
    implements $DSImageColorsCopyWith<$Res> {
  factory _$$DSImageColorsImplCopyWith(
    _$DSImageColorsImpl value,
    $Res Function(_$DSImageColorsImpl) then,
  ) = __$$DSImageColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? hoverOverlayColor,
    Color? pressedOverlayColor,
    Color? selectedOverlayColor,
    Color? focusOverlayColor,
    Color? placeholderColor,
    Color? skeletonColor,
    Color? disabledBackgroundColor,
    Color? disabledFilterColor,
  });
}

/// @nodoc
class __$$DSImageColorsImplCopyWithImpl<$Res>
    extends _$DSImageColorsCopyWithImpl<$Res, _$DSImageColorsImpl>
    implements _$$DSImageColorsImplCopyWith<$Res> {
  __$$DSImageColorsImplCopyWithImpl(
    _$DSImageColorsImpl _value,
    $Res Function(_$DSImageColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? hoverOverlayColor = freezed,
    Object? pressedOverlayColor = freezed,
    Object? selectedOverlayColor = freezed,
    Object? focusOverlayColor = freezed,
    Object? placeholderColor = freezed,
    Object? skeletonColor = freezed,
    Object? disabledBackgroundColor = freezed,
    Object? disabledFilterColor = freezed,
  }) {
    return _then(
      _$DSImageColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        hoverOverlayColor: freezed == hoverOverlayColor
            ? _value.hoverOverlayColor
            : hoverOverlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        pressedOverlayColor: freezed == pressedOverlayColor
            ? _value.pressedOverlayColor
            : pressedOverlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedOverlayColor: freezed == selectedOverlayColor
            ? _value.selectedOverlayColor
            : selectedOverlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        focusOverlayColor: freezed == focusOverlayColor
            ? _value.focusOverlayColor
            : focusOverlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        placeholderColor: freezed == placeholderColor
            ? _value.placeholderColor
            : placeholderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonColor: freezed == skeletonColor
            ? _value.skeletonColor
            : skeletonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledBackgroundColor: freezed == disabledBackgroundColor
            ? _value.disabledBackgroundColor
            : disabledBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        disabledFilterColor: freezed == disabledFilterColor
            ? _value.disabledFilterColor
            : disabledFilterColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSImageColorsImpl implements _DSImageColors {
  const _$DSImageColorsImpl({
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.hoverOverlayColor,
    this.pressedOverlayColor,
    this.selectedOverlayColor,
    this.focusOverlayColor,
    this.placeholderColor,
    this.skeletonColor,
    this.disabledBackgroundColor,
    this.disabledFilterColor,
  });

  /// Color de fondo del container
  @override
  final Color? backgroundColor;

  /// Color del borde
  @override
  final Color? borderColor;

  /// Color de la sombra
  @override
  final Color? shadowColor;

  /// Color del overlay en hover
  @override
  final Color? hoverOverlayColor;

  /// Color del overlay cuando está presionado
  @override
  final Color? pressedOverlayColor;

  /// Color del overlay cuando está seleccionado
  @override
  final Color? selectedOverlayColor;

  /// Color del overlay cuando está enfocado
  @override
  final Color? focusOverlayColor;

  /// Color del placeholder
  @override
  final Color? placeholderColor;

  /// Color del skeleton durante carga
  @override
  final Color? skeletonColor;

  /// Color de fondo cuando está deshabilitado
  @override
  final Color? disabledBackgroundColor;

  /// Color del filtro cuando está deshabilitado
  @override
  final Color? disabledFilterColor;

  @override
  String toString() {
    return 'DSImageColors(backgroundColor: $backgroundColor, borderColor: $borderColor, shadowColor: $shadowColor, hoverOverlayColor: $hoverOverlayColor, pressedOverlayColor: $pressedOverlayColor, selectedOverlayColor: $selectedOverlayColor, focusOverlayColor: $focusOverlayColor, placeholderColor: $placeholderColor, skeletonColor: $skeletonColor, disabledBackgroundColor: $disabledBackgroundColor, disabledFilterColor: $disabledFilterColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.hoverOverlayColor, hoverOverlayColor) ||
                other.hoverOverlayColor == hoverOverlayColor) &&
            (identical(other.pressedOverlayColor, pressedOverlayColor) ||
                other.pressedOverlayColor == pressedOverlayColor) &&
            (identical(other.selectedOverlayColor, selectedOverlayColor) ||
                other.selectedOverlayColor == selectedOverlayColor) &&
            (identical(other.focusOverlayColor, focusOverlayColor) ||
                other.focusOverlayColor == focusOverlayColor) &&
            (identical(other.placeholderColor, placeholderColor) ||
                other.placeholderColor == placeholderColor) &&
            (identical(other.skeletonColor, skeletonColor) ||
                other.skeletonColor == skeletonColor) &&
            (identical(
                  other.disabledBackgroundColor,
                  disabledBackgroundColor,
                ) ||
                other.disabledBackgroundColor == disabledBackgroundColor) &&
            (identical(other.disabledFilterColor, disabledFilterColor) ||
                other.disabledFilterColor == disabledFilterColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    borderColor,
    shadowColor,
    hoverOverlayColor,
    pressedOverlayColor,
    selectedOverlayColor,
    focusOverlayColor,
    placeholderColor,
    skeletonColor,
    disabledBackgroundColor,
    disabledFilterColor,
  );

  /// Create a copy of DSImageColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageColorsImplCopyWith<_$DSImageColorsImpl> get copyWith =>
      __$$DSImageColorsImplCopyWithImpl<_$DSImageColorsImpl>(this, _$identity);
}

abstract class _DSImageColors implements DSImageColors {
  const factory _DSImageColors({
    final Color? backgroundColor,
    final Color? borderColor,
    final Color? shadowColor,
    final Color? hoverOverlayColor,
    final Color? pressedOverlayColor,
    final Color? selectedOverlayColor,
    final Color? focusOverlayColor,
    final Color? placeholderColor,
    final Color? skeletonColor,
    final Color? disabledBackgroundColor,
    final Color? disabledFilterColor,
  }) = _$DSImageColorsImpl;

  /// Color de fondo del container
  @override
  Color? get backgroundColor;

  /// Color del borde
  @override
  Color? get borderColor;

  /// Color de la sombra
  @override
  Color? get shadowColor;

  /// Color del overlay en hover
  @override
  Color? get hoverOverlayColor;

  /// Color del overlay cuando está presionado
  @override
  Color? get pressedOverlayColor;

  /// Color del overlay cuando está seleccionado
  @override
  Color? get selectedOverlayColor;

  /// Color del overlay cuando está enfocado
  @override
  Color? get focusOverlayColor;

  /// Color del placeholder
  @override
  Color? get placeholderColor;

  /// Color del skeleton durante carga
  @override
  Color? get skeletonColor;

  /// Color de fondo cuando está deshabilitado
  @override
  Color? get disabledBackgroundColor;

  /// Color del filtro cuando está deshabilitado
  @override
  Color? get disabledFilterColor;

  /// Create a copy of DSImageColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageColorsImplCopyWith<_$DSImageColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageSpacing {
  /// Ancho del componente
  double? get width => throw _privateConstructorUsedError;

  /// Alto del componente
  double? get height => throw _privateConstructorUsedError;

  /// Padding interno
  EdgeInsets get padding => throw _privateConstructorUsedError;

  /// Margin externo
  EdgeInsets get margin => throw _privateConstructorUsedError;

  /// Radio de borde
  double get borderRadius => throw _privateConstructorUsedError;

  /// Ancho del borde
  double get borderWidth => throw _privateConstructorUsedError;

  /// Ancho mínimo
  double? get minWidth => throw _privateConstructorUsedError;

  /// Alto mínimo
  double? get minHeight => throw _privateConstructorUsedError;

  /// Ancho máximo
  double? get maxWidth => throw _privateConstructorUsedError;

  /// Alto máximo
  double? get maxHeight => throw _privateConstructorUsedError;

  /// Si debe adaptarse al espacio disponible
  bool get expand => throw _privateConstructorUsedError;

  /// Create a copy of DSImageSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageSpacingCopyWith<DSImageSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageSpacingCopyWith<$Res> {
  factory $DSImageSpacingCopyWith(
    DSImageSpacing value,
    $Res Function(DSImageSpacing) then,
  ) = _$DSImageSpacingCopyWithImpl<$Res, DSImageSpacing>;
  @useResult
  $Res call({
    double? width,
    double? height,
    EdgeInsets padding,
    EdgeInsets margin,
    double borderRadius,
    double borderWidth,
    double? minWidth,
    double? minHeight,
    double? maxWidth,
    double? maxHeight,
    bool expand,
  });
}

/// @nodoc
class _$DSImageSpacingCopyWithImpl<$Res, $Val extends DSImageSpacing>
    implements $DSImageSpacingCopyWith<$Res> {
  _$DSImageSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? padding = null,
    Object? margin = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? minWidth = freezed,
    Object? minHeight = freezed,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
    Object? expand = null,
  }) {
    return _then(
      _value.copyWith(
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as double?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            padding: null == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            margin: null == margin
                ? _value.margin
                : margin // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            borderWidth: null == borderWidth
                ? _value.borderWidth
                : borderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            minWidth: freezed == minWidth
                ? _value.minWidth
                : minWidth // ignore: cast_nullable_to_non_nullable
                      as double?,
            minHeight: freezed == minHeight
                ? _value.minHeight
                : minHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxWidth: freezed == maxWidth
                ? _value.maxWidth
                : maxWidth // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxHeight: freezed == maxHeight
                ? _value.maxHeight
                : maxHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            expand: null == expand
                ? _value.expand
                : expand // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageSpacingImplCopyWith<$Res>
    implements $DSImageSpacingCopyWith<$Res> {
  factory _$$DSImageSpacingImplCopyWith(
    _$DSImageSpacingImpl value,
    $Res Function(_$DSImageSpacingImpl) then,
  ) = __$$DSImageSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? width,
    double? height,
    EdgeInsets padding,
    EdgeInsets margin,
    double borderRadius,
    double borderWidth,
    double? minWidth,
    double? minHeight,
    double? maxWidth,
    double? maxHeight,
    bool expand,
  });
}

/// @nodoc
class __$$DSImageSpacingImplCopyWithImpl<$Res>
    extends _$DSImageSpacingCopyWithImpl<$Res, _$DSImageSpacingImpl>
    implements _$$DSImageSpacingImplCopyWith<$Res> {
  __$$DSImageSpacingImplCopyWithImpl(
    _$DSImageSpacingImpl _value,
    $Res Function(_$DSImageSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? padding = null,
    Object? margin = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? minWidth = freezed,
    Object? minHeight = freezed,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
    Object? expand = null,
  }) {
    return _then(
      _$DSImageSpacingImpl(
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as double?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        padding: null == padding
            ? _value.padding
            : padding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        margin: null == margin
            ? _value.margin
            : margin // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        borderRadius: null == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        borderWidth: null == borderWidth
            ? _value.borderWidth
            : borderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        minWidth: freezed == minWidth
            ? _value.minWidth
            : minWidth // ignore: cast_nullable_to_non_nullable
                  as double?,
        minHeight: freezed == minHeight
            ? _value.minHeight
            : minHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxWidth: freezed == maxWidth
            ? _value.maxWidth
            : maxWidth // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxHeight: freezed == maxHeight
            ? _value.maxHeight
            : maxHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        expand: null == expand
            ? _value.expand
            : expand // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSImageSpacingImpl implements _DSImageSpacing {
  const _$DSImageSpacingImpl({
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 8.0,
    this.borderWidth = 0.0,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.expand = false,
  });

  /// Ancho del componente
  @override
  final double? width;

  /// Alto del componente
  @override
  final double? height;

  /// Padding interno
  @override
  @JsonKey()
  final EdgeInsets padding;

  /// Margin externo
  @override
  @JsonKey()
  final EdgeInsets margin;

  /// Radio de borde
  @override
  @JsonKey()
  final double borderRadius;

  /// Ancho del borde
  @override
  @JsonKey()
  final double borderWidth;

  /// Ancho mínimo
  @override
  final double? minWidth;

  /// Alto mínimo
  @override
  final double? minHeight;

  /// Ancho máximo
  @override
  final double? maxWidth;

  /// Alto máximo
  @override
  final double? maxHeight;

  /// Si debe adaptarse al espacio disponible
  @override
  @JsonKey()
  final bool expand;

  @override
  String toString() {
    return 'DSImageSpacing(width: $width, height: $height, padding: $padding, margin: $margin, borderRadius: $borderRadius, borderWidth: $borderWidth, minWidth: $minWidth, minHeight: $minHeight, maxWidth: $maxWidth, maxHeight: $maxHeight, expand: $expand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageSpacingImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight) &&
            (identical(other.expand, expand) || other.expand == expand));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    width,
    height,
    padding,
    margin,
    borderRadius,
    borderWidth,
    minWidth,
    minHeight,
    maxWidth,
    maxHeight,
    expand,
  );

  /// Create a copy of DSImageSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageSpacingImplCopyWith<_$DSImageSpacingImpl> get copyWith =>
      __$$DSImageSpacingImplCopyWithImpl<_$DSImageSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSImageSpacing implements DSImageSpacing {
  const factory _DSImageSpacing({
    final double? width,
    final double? height,
    final EdgeInsets padding,
    final EdgeInsets margin,
    final double borderRadius,
    final double borderWidth,
    final double? minWidth,
    final double? minHeight,
    final double? maxWidth,
    final double? maxHeight,
    final bool expand,
  }) = _$DSImageSpacingImpl;

  /// Ancho del componente
  @override
  double? get width;

  /// Alto del componente
  @override
  double? get height;

  /// Padding interno
  @override
  EdgeInsets get padding;

  /// Margin externo
  @override
  EdgeInsets get margin;

  /// Radio de borde
  @override
  double get borderRadius;

  /// Ancho del borde
  @override
  double get borderWidth;

  /// Ancho mínimo
  @override
  double? get minWidth;

  /// Alto mínimo
  @override
  double? get minHeight;

  /// Ancho máximo
  @override
  double? get maxWidth;

  /// Alto máximo
  @override
  double? get maxHeight;

  /// Si debe adaptarse al espacio disponible
  @override
  bool get expand;

  /// Create a copy of DSImageSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageSpacingImplCopyWith<_$DSImageSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageElevation {
  /// Elevación por defecto
  double get defaultElevation => throw _privateConstructorUsedError;

  /// Elevación en hover
  double get hoveredElevation => throw _privateConstructorUsedError;

  /// Elevación cuando presionado
  double get pressedElevation => throw _privateConstructorUsedError;

  /// Elevación cuando enfocado
  double get focusedElevation => throw _privateConstructorUsedError;

  /// Elevación cuando seleccionado
  double get selectedElevation => throw _privateConstructorUsedError;

  /// Elevación cuando deshabilitado
  double get disabledElevation => throw _privateConstructorUsedError;

  /// Color de la sombra
  Color? get shadowColor => throw _privateConstructorUsedError;

  /// Color de tinte de superficie
  Color? get surfaceTintColor => throw _privateConstructorUsedError;

  /// Create a copy of DSImageElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageElevationCopyWith<DSImageElevation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageElevationCopyWith<$Res> {
  factory $DSImageElevationCopyWith(
    DSImageElevation value,
    $Res Function(DSImageElevation) then,
  ) = _$DSImageElevationCopyWithImpl<$Res, DSImageElevation>;
  @useResult
  $Res call({
    double defaultElevation,
    double hoveredElevation,
    double pressedElevation,
    double focusedElevation,
    double selectedElevation,
    double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class _$DSImageElevationCopyWithImpl<$Res, $Val extends DSImageElevation>
    implements $DSImageElevationCopyWith<$Res> {
  _$DSImageElevationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageElevation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultElevation = null,
    Object? hoveredElevation = null,
    Object? pressedElevation = null,
    Object? focusedElevation = null,
    Object? selectedElevation = null,
    Object? disabledElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            defaultElevation: null == defaultElevation
                ? _value.defaultElevation
                : defaultElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            hoveredElevation: null == hoveredElevation
                ? _value.hoveredElevation
                : hoveredElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            pressedElevation: null == pressedElevation
                ? _value.pressedElevation
                : pressedElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            focusedElevation: null == focusedElevation
                ? _value.focusedElevation
                : focusedElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            selectedElevation: null == selectedElevation
                ? _value.selectedElevation
                : selectedElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            disabledElevation: null == disabledElevation
                ? _value.disabledElevation
                : disabledElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            surfaceTintColor: freezed == surfaceTintColor
                ? _value.surfaceTintColor
                : surfaceTintColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageElevationImplCopyWith<$Res>
    implements $DSImageElevationCopyWith<$Res> {
  factory _$$DSImageElevationImplCopyWith(
    _$DSImageElevationImpl value,
    $Res Function(_$DSImageElevationImpl) then,
  ) = __$$DSImageElevationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double defaultElevation,
    double hoveredElevation,
    double pressedElevation,
    double focusedElevation,
    double selectedElevation,
    double disabledElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class __$$DSImageElevationImplCopyWithImpl<$Res>
    extends _$DSImageElevationCopyWithImpl<$Res, _$DSImageElevationImpl>
    implements _$$DSImageElevationImplCopyWith<$Res> {
  __$$DSImageElevationImplCopyWithImpl(
    _$DSImageElevationImpl _value,
    $Res Function(_$DSImageElevationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageElevation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultElevation = null,
    Object? hoveredElevation = null,
    Object? pressedElevation = null,
    Object? focusedElevation = null,
    Object? selectedElevation = null,
    Object? disabledElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _$DSImageElevationImpl(
        defaultElevation: null == defaultElevation
            ? _value.defaultElevation
            : defaultElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        hoveredElevation: null == hoveredElevation
            ? _value.hoveredElevation
            : hoveredElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        pressedElevation: null == pressedElevation
            ? _value.pressedElevation
            : pressedElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        focusedElevation: null == focusedElevation
            ? _value.focusedElevation
            : focusedElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        selectedElevation: null == selectedElevation
            ? _value.selectedElevation
            : selectedElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        disabledElevation: null == disabledElevation
            ? _value.disabledElevation
            : disabledElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceTintColor: freezed == surfaceTintColor
            ? _value.surfaceTintColor
            : surfaceTintColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSImageElevationImpl implements _DSImageElevation {
  const _$DSImageElevationImpl({
    this.defaultElevation = 0.0,
    this.hoveredElevation = 2.0,
    this.pressedElevation = 1.0,
    this.focusedElevation = 3.0,
    this.selectedElevation = 4.0,
    this.disabledElevation = 0.0,
    this.shadowColor,
    this.surfaceTintColor,
  });

  /// Elevación por defecto
  @override
  @JsonKey()
  final double defaultElevation;

  /// Elevación en hover
  @override
  @JsonKey()
  final double hoveredElevation;

  /// Elevación cuando presionado
  @override
  @JsonKey()
  final double pressedElevation;

  /// Elevación cuando enfocado
  @override
  @JsonKey()
  final double focusedElevation;

  /// Elevación cuando seleccionado
  @override
  @JsonKey()
  final double selectedElevation;

  /// Elevación cuando deshabilitado
  @override
  @JsonKey()
  final double disabledElevation;

  /// Color de la sombra
  @override
  final Color? shadowColor;

  /// Color de tinte de superficie
  @override
  final Color? surfaceTintColor;

  @override
  String toString() {
    return 'DSImageElevation(defaultElevation: $defaultElevation, hoveredElevation: $hoveredElevation, pressedElevation: $pressedElevation, focusedElevation: $focusedElevation, selectedElevation: $selectedElevation, disabledElevation: $disabledElevation, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageElevationImpl &&
            (identical(other.defaultElevation, defaultElevation) ||
                other.defaultElevation == defaultElevation) &&
            (identical(other.hoveredElevation, hoveredElevation) ||
                other.hoveredElevation == hoveredElevation) &&
            (identical(other.pressedElevation, pressedElevation) ||
                other.pressedElevation == pressedElevation) &&
            (identical(other.focusedElevation, focusedElevation) ||
                other.focusedElevation == focusedElevation) &&
            (identical(other.selectedElevation, selectedElevation) ||
                other.selectedElevation == selectedElevation) &&
            (identical(other.disabledElevation, disabledElevation) ||
                other.disabledElevation == disabledElevation) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.surfaceTintColor, surfaceTintColor) ||
                other.surfaceTintColor == surfaceTintColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultElevation,
    hoveredElevation,
    pressedElevation,
    focusedElevation,
    selectedElevation,
    disabledElevation,
    shadowColor,
    surfaceTintColor,
  );

  /// Create a copy of DSImageElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageElevationImplCopyWith<_$DSImageElevationImpl> get copyWith =>
      __$$DSImageElevationImplCopyWithImpl<_$DSImageElevationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSImageElevation implements DSImageElevation {
  const factory _DSImageElevation({
    final double defaultElevation,
    final double hoveredElevation,
    final double pressedElevation,
    final double focusedElevation,
    final double selectedElevation,
    final double disabledElevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
  }) = _$DSImageElevationImpl;

  /// Elevación por defecto
  @override
  double get defaultElevation;

  /// Elevación en hover
  @override
  double get hoveredElevation;

  /// Elevación cuando presionado
  @override
  double get pressedElevation;

  /// Elevación cuando enfocado
  @override
  double get focusedElevation;

  /// Elevación cuando seleccionado
  @override
  double get selectedElevation;

  /// Elevación cuando deshabilitado
  @override
  double get disabledElevation;

  /// Color de la sombra
  @override
  Color? get shadowColor;

  /// Color de tinte de superficie
  @override
  Color? get surfaceTintColor;

  /// Create a copy of DSImageElevation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageElevationImplCopyWith<_$DSImageElevationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageBehavior {
  /// Habilitar feedback háptico
  bool get enableHapticFeedback => throw _privateConstructorUsedError;

  /// Habilitar efecto ripple
  bool get enableRipple => throw _privateConstructorUsedError;

  /// Habilitar efectos de hover
  bool get enableHover => throw _privateConstructorUsedError;

  /// Habilitar efectos de focus
  bool get enableFocus => throw _privateConstructorUsedError;

  /// Mantener estado entre rebuilds
  bool get maintainState => throw _privateConstructorUsedError;

  /// Comportamiento de recorte
  DSImageClipBehavior get clipBehavior => throw _privateConstructorUsedError;

  /// Duración de animaciones en milisegundos
  int get animationDuration => throw _privateConstructorUsedError;

  /// Mostrar indicador de carga
  bool get showLoadingIndicator => throw _privateConstructorUsedError;

  /// Mostrar animación skeleton
  bool get showSkeletonAnimation => throw _privateConstructorUsedError;

  /// Caché de imágenes
  bool get enableCache => throw _privateConstructorUsedError;

  /// Tamaño de caché en MB
  int get cacheSize => throw _privateConstructorUsedError;

  /// Tiempo de vida del caché en horas
  int get cacheLifetime => throw _privateConstructorUsedError;

  /// Habilitar precarga de imágenes
  bool get enablePrecaching => throw _privateConstructorUsedError;

  /// Habilitar compresión automática
  bool get enableCompression => throw _privateConstructorUsedError;

  /// Calidad de compresión (0-100)
  int get compressionQuality => throw _privateConstructorUsedError;

  /// Create a copy of DSImageBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageBehaviorCopyWith<DSImageBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageBehaviorCopyWith<$Res> {
  factory $DSImageBehaviorCopyWith(
    DSImageBehavior value,
    $Res Function(DSImageBehavior) then,
  ) = _$DSImageBehaviorCopyWithImpl<$Res, DSImageBehavior>;
  @useResult
  $Res call({
    bool enableHapticFeedback,
    bool enableRipple,
    bool enableHover,
    bool enableFocus,
    bool maintainState,
    DSImageClipBehavior clipBehavior,
    int animationDuration,
    bool showLoadingIndicator,
    bool showSkeletonAnimation,
    bool enableCache,
    int cacheSize,
    int cacheLifetime,
    bool enablePrecaching,
    bool enableCompression,
    int compressionQuality,
  });
}

/// @nodoc
class _$DSImageBehaviorCopyWithImpl<$Res, $Val extends DSImageBehavior>
    implements $DSImageBehaviorCopyWith<$Res> {
  _$DSImageBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableHapticFeedback = null,
    Object? enableRipple = null,
    Object? enableHover = null,
    Object? enableFocus = null,
    Object? maintainState = null,
    Object? clipBehavior = null,
    Object? animationDuration = null,
    Object? showLoadingIndicator = null,
    Object? showSkeletonAnimation = null,
    Object? enableCache = null,
    Object? cacheSize = null,
    Object? cacheLifetime = null,
    Object? enablePrecaching = null,
    Object? enableCompression = null,
    Object? compressionQuality = null,
  }) {
    return _then(
      _value.copyWith(
            enableHapticFeedback: null == enableHapticFeedback
                ? _value.enableHapticFeedback
                : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableRipple: null == enableRipple
                ? _value.enableRipple
                : enableRipple // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHover: null == enableHover
                ? _value.enableHover
                : enableHover // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableFocus: null == enableFocus
                ? _value.enableFocus
                : enableFocus // ignore: cast_nullable_to_non_nullable
                      as bool,
            maintainState: null == maintainState
                ? _value.maintainState
                : maintainState // ignore: cast_nullable_to_non_nullable
                      as bool,
            clipBehavior: null == clipBehavior
                ? _value.clipBehavior
                : clipBehavior // ignore: cast_nullable_to_non_nullable
                      as DSImageClipBehavior,
            animationDuration: null == animationDuration
                ? _value.animationDuration
                : animationDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            showLoadingIndicator: null == showLoadingIndicator
                ? _value.showLoadingIndicator
                : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
                      as bool,
            showSkeletonAnimation: null == showSkeletonAnimation
                ? _value.showSkeletonAnimation
                : showSkeletonAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableCache: null == enableCache
                ? _value.enableCache
                : enableCache // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheSize: null == cacheSize
                ? _value.cacheSize
                : cacheSize // ignore: cast_nullable_to_non_nullable
                      as int,
            cacheLifetime: null == cacheLifetime
                ? _value.cacheLifetime
                : cacheLifetime // ignore: cast_nullable_to_non_nullable
                      as int,
            enablePrecaching: null == enablePrecaching
                ? _value.enablePrecaching
                : enablePrecaching // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableCompression: null == enableCompression
                ? _value.enableCompression
                : enableCompression // ignore: cast_nullable_to_non_nullable
                      as bool,
            compressionQuality: null == compressionQuality
                ? _value.compressionQuality
                : compressionQuality // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageBehaviorImplCopyWith<$Res>
    implements $DSImageBehaviorCopyWith<$Res> {
  factory _$$DSImageBehaviorImplCopyWith(
    _$DSImageBehaviorImpl value,
    $Res Function(_$DSImageBehaviorImpl) then,
  ) = __$$DSImageBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enableHapticFeedback,
    bool enableRipple,
    bool enableHover,
    bool enableFocus,
    bool maintainState,
    DSImageClipBehavior clipBehavior,
    int animationDuration,
    bool showLoadingIndicator,
    bool showSkeletonAnimation,
    bool enableCache,
    int cacheSize,
    int cacheLifetime,
    bool enablePrecaching,
    bool enableCompression,
    int compressionQuality,
  });
}

/// @nodoc
class __$$DSImageBehaviorImplCopyWithImpl<$Res>
    extends _$DSImageBehaviorCopyWithImpl<$Res, _$DSImageBehaviorImpl>
    implements _$$DSImageBehaviorImplCopyWith<$Res> {
  __$$DSImageBehaviorImplCopyWithImpl(
    _$DSImageBehaviorImpl _value,
    $Res Function(_$DSImageBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableHapticFeedback = null,
    Object? enableRipple = null,
    Object? enableHover = null,
    Object? enableFocus = null,
    Object? maintainState = null,
    Object? clipBehavior = null,
    Object? animationDuration = null,
    Object? showLoadingIndicator = null,
    Object? showSkeletonAnimation = null,
    Object? enableCache = null,
    Object? cacheSize = null,
    Object? cacheLifetime = null,
    Object? enablePrecaching = null,
    Object? enableCompression = null,
    Object? compressionQuality = null,
  }) {
    return _then(
      _$DSImageBehaviorImpl(
        enableHapticFeedback: null == enableHapticFeedback
            ? _value.enableHapticFeedback
            : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableRipple: null == enableRipple
            ? _value.enableRipple
            : enableRipple // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHover: null == enableHover
            ? _value.enableHover
            : enableHover // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableFocus: null == enableFocus
            ? _value.enableFocus
            : enableFocus // ignore: cast_nullable_to_non_nullable
                  as bool,
        maintainState: null == maintainState
            ? _value.maintainState
            : maintainState // ignore: cast_nullable_to_non_nullable
                  as bool,
        clipBehavior: null == clipBehavior
            ? _value.clipBehavior
            : clipBehavior // ignore: cast_nullable_to_non_nullable
                  as DSImageClipBehavior,
        animationDuration: null == animationDuration
            ? _value.animationDuration
            : animationDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        showLoadingIndicator: null == showLoadingIndicator
            ? _value.showLoadingIndicator
            : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
                  as bool,
        showSkeletonAnimation: null == showSkeletonAnimation
            ? _value.showSkeletonAnimation
            : showSkeletonAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableCache: null == enableCache
            ? _value.enableCache
            : enableCache // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheSize: null == cacheSize
            ? _value.cacheSize
            : cacheSize // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheLifetime: null == cacheLifetime
            ? _value.cacheLifetime
            : cacheLifetime // ignore: cast_nullable_to_non_nullable
                  as int,
        enablePrecaching: null == enablePrecaching
            ? _value.enablePrecaching
            : enablePrecaching // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableCompression: null == enableCompression
            ? _value.enableCompression
            : enableCompression // ignore: cast_nullable_to_non_nullable
                  as bool,
        compressionQuality: null == compressionQuality
            ? _value.compressionQuality
            : compressionQuality // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSImageBehaviorImpl implements _DSImageBehavior {
  const _$DSImageBehaviorImpl({
    this.enableHapticFeedback = true,
    this.enableRipple = true,
    this.enableHover = true,
    this.enableFocus = true,
    this.maintainState = true,
    this.clipBehavior = DSImageClipBehavior.antiAlias,
    this.animationDuration = 300,
    this.showLoadingIndicator = true,
    this.showSkeletonAnimation = true,
    this.enableCache = true,
    this.cacheSize = 100,
    this.cacheLifetime = 24,
    this.enablePrecaching = false,
    this.enableCompression = true,
    this.compressionQuality = 85,
  });

  /// Habilitar feedback háptico
  @override
  @JsonKey()
  final bool enableHapticFeedback;

  /// Habilitar efecto ripple
  @override
  @JsonKey()
  final bool enableRipple;

  /// Habilitar efectos de hover
  @override
  @JsonKey()
  final bool enableHover;

  /// Habilitar efectos de focus
  @override
  @JsonKey()
  final bool enableFocus;

  /// Mantener estado entre rebuilds
  @override
  @JsonKey()
  final bool maintainState;

  /// Comportamiento de recorte
  @override
  @JsonKey()
  final DSImageClipBehavior clipBehavior;

  /// Duración de animaciones en milisegundos
  @override
  @JsonKey()
  final int animationDuration;

  /// Mostrar indicador de carga
  @override
  @JsonKey()
  final bool showLoadingIndicator;

  /// Mostrar animación skeleton
  @override
  @JsonKey()
  final bool showSkeletonAnimation;

  /// Caché de imágenes
  @override
  @JsonKey()
  final bool enableCache;

  /// Tamaño de caché en MB
  @override
  @JsonKey()
  final int cacheSize;

  /// Tiempo de vida del caché en horas
  @override
  @JsonKey()
  final int cacheLifetime;

  /// Habilitar precarga de imágenes
  @override
  @JsonKey()
  final bool enablePrecaching;

  /// Habilitar compresión automática
  @override
  @JsonKey()
  final bool enableCompression;

  /// Calidad de compresión (0-100)
  @override
  @JsonKey()
  final int compressionQuality;

  @override
  String toString() {
    return 'DSImageBehavior(enableHapticFeedback: $enableHapticFeedback, enableRipple: $enableRipple, enableHover: $enableHover, enableFocus: $enableFocus, maintainState: $maintainState, clipBehavior: $clipBehavior, animationDuration: $animationDuration, showLoadingIndicator: $showLoadingIndicator, showSkeletonAnimation: $showSkeletonAnimation, enableCache: $enableCache, cacheSize: $cacheSize, cacheLifetime: $cacheLifetime, enablePrecaching: $enablePrecaching, enableCompression: $enableCompression, compressionQuality: $compressionQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageBehaviorImpl &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(other.enableRipple, enableRipple) ||
                other.enableRipple == enableRipple) &&
            (identical(other.enableHover, enableHover) ||
                other.enableHover == enableHover) &&
            (identical(other.enableFocus, enableFocus) ||
                other.enableFocus == enableFocus) &&
            (identical(other.maintainState, maintainState) ||
                other.maintainState == maintainState) &&
            (identical(other.clipBehavior, clipBehavior) ||
                other.clipBehavior == clipBehavior) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration) &&
            (identical(other.showLoadingIndicator, showLoadingIndicator) ||
                other.showLoadingIndicator == showLoadingIndicator) &&
            (identical(other.showSkeletonAnimation, showSkeletonAnimation) ||
                other.showSkeletonAnimation == showSkeletonAnimation) &&
            (identical(other.enableCache, enableCache) ||
                other.enableCache == enableCache) &&
            (identical(other.cacheSize, cacheSize) ||
                other.cacheSize == cacheSize) &&
            (identical(other.cacheLifetime, cacheLifetime) ||
                other.cacheLifetime == cacheLifetime) &&
            (identical(other.enablePrecaching, enablePrecaching) ||
                other.enablePrecaching == enablePrecaching) &&
            (identical(other.enableCompression, enableCompression) ||
                other.enableCompression == enableCompression) &&
            (identical(other.compressionQuality, compressionQuality) ||
                other.compressionQuality == compressionQuality));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enableHapticFeedback,
    enableRipple,
    enableHover,
    enableFocus,
    maintainState,
    clipBehavior,
    animationDuration,
    showLoadingIndicator,
    showSkeletonAnimation,
    enableCache,
    cacheSize,
    cacheLifetime,
    enablePrecaching,
    enableCompression,
    compressionQuality,
  );

  /// Create a copy of DSImageBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageBehaviorImplCopyWith<_$DSImageBehaviorImpl> get copyWith =>
      __$$DSImageBehaviorImplCopyWithImpl<_$DSImageBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSImageBehavior implements DSImageBehavior {
  const factory _DSImageBehavior({
    final bool enableHapticFeedback,
    final bool enableRipple,
    final bool enableHover,
    final bool enableFocus,
    final bool maintainState,
    final DSImageClipBehavior clipBehavior,
    final int animationDuration,
    final bool showLoadingIndicator,
    final bool showSkeletonAnimation,
    final bool enableCache,
    final int cacheSize,
    final int cacheLifetime,
    final bool enablePrecaching,
    final bool enableCompression,
    final int compressionQuality,
  }) = _$DSImageBehaviorImpl;

  /// Habilitar feedback háptico
  @override
  bool get enableHapticFeedback;

  /// Habilitar efecto ripple
  @override
  bool get enableRipple;

  /// Habilitar efectos de hover
  @override
  bool get enableHover;

  /// Habilitar efectos de focus
  @override
  bool get enableFocus;

  /// Mantener estado entre rebuilds
  @override
  bool get maintainState;

  /// Comportamiento de recorte
  @override
  DSImageClipBehavior get clipBehavior;

  /// Duración de animaciones en milisegundos
  @override
  int get animationDuration;

  /// Mostrar indicador de carga
  @override
  bool get showLoadingIndicator;

  /// Mostrar animación skeleton
  @override
  bool get showSkeletonAnimation;

  /// Caché de imágenes
  @override
  bool get enableCache;

  /// Tamaño de caché en MB
  @override
  int get cacheSize;

  /// Tiempo de vida del caché en horas
  @override
  int get cacheLifetime;

  /// Habilitar precarga de imágenes
  @override
  bool get enablePrecaching;

  /// Habilitar compresión automática
  @override
  bool get enableCompression;

  /// Calidad de compresión (0-100)
  @override
  int get compressionQuality;

  /// Create a copy of DSImageBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageBehaviorImplCopyWith<_$DSImageBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageAnimation {
  /// Tipo de animación
  DSImageAnimationType get type => throw _privateConstructorUsedError;

  /// Duración de la animación en milisegundos
  int get duration => throw _privateConstructorUsedError;

  /// Curva de animación
  Curve get curve => throw _privateConstructorUsedError;

  /// Habilitar transiciones de estado
  bool get enableStateTransitions => throw _privateConstructorUsedError;

  /// Habilitar animación de hover
  bool get enableHoverAnimation => throw _privateConstructorUsedError;

  /// Habilitar animación de press
  bool get enablePressAnimation => throw _privateConstructorUsedError;

  /// Habilitar animación de carga
  bool get enableLoadingAnimation => throw _privateConstructorUsedError;

  /// Habilitar animación de aparición
  bool get enableFadeIn => throw _privateConstructorUsedError;

  /// Duración del fade in en milisegundos
  int get fadeInDuration => throw _privateConstructorUsedError;

  /// Create a copy of DSImageAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageAnimationCopyWith<DSImageAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageAnimationCopyWith<$Res> {
  factory $DSImageAnimationCopyWith(
    DSImageAnimation value,
    $Res Function(DSImageAnimation) then,
  ) = _$DSImageAnimationCopyWithImpl<$Res, DSImageAnimation>;
  @useResult
  $Res call({
    DSImageAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableHoverAnimation,
    bool enablePressAnimation,
    bool enableLoadingAnimation,
    bool enableFadeIn,
    int fadeInDuration,
  });
}

/// @nodoc
class _$DSImageAnimationCopyWithImpl<$Res, $Val extends DSImageAnimation>
    implements $DSImageAnimationCopyWith<$Res> {
  _$DSImageAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? duration = null,
    Object? curve = null,
    Object? enableStateTransitions = null,
    Object? enableHoverAnimation = null,
    Object? enablePressAnimation = null,
    Object? enableLoadingAnimation = null,
    Object? enableFadeIn = null,
    Object? fadeInDuration = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSImageAnimationType,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            curve: null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enableStateTransitions: null == enableStateTransitions
                ? _value.enableStateTransitions
                : enableStateTransitions // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHoverAnimation: null == enableHoverAnimation
                ? _value.enableHoverAnimation
                : enableHoverAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enablePressAnimation: null == enablePressAnimation
                ? _value.enablePressAnimation
                : enablePressAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableLoadingAnimation: null == enableLoadingAnimation
                ? _value.enableLoadingAnimation
                : enableLoadingAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableFadeIn: null == enableFadeIn
                ? _value.enableFadeIn
                : enableFadeIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            fadeInDuration: null == fadeInDuration
                ? _value.fadeInDuration
                : fadeInDuration // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageAnimationImplCopyWith<$Res>
    implements $DSImageAnimationCopyWith<$Res> {
  factory _$$DSImageAnimationImplCopyWith(
    _$DSImageAnimationImpl value,
    $Res Function(_$DSImageAnimationImpl) then,
  ) = __$$DSImageAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSImageAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableHoverAnimation,
    bool enablePressAnimation,
    bool enableLoadingAnimation,
    bool enableFadeIn,
    int fadeInDuration,
  });
}

/// @nodoc
class __$$DSImageAnimationImplCopyWithImpl<$Res>
    extends _$DSImageAnimationCopyWithImpl<$Res, _$DSImageAnimationImpl>
    implements _$$DSImageAnimationImplCopyWith<$Res> {
  __$$DSImageAnimationImplCopyWithImpl(
    _$DSImageAnimationImpl _value,
    $Res Function(_$DSImageAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? duration = null,
    Object? curve = null,
    Object? enableStateTransitions = null,
    Object? enableHoverAnimation = null,
    Object? enablePressAnimation = null,
    Object? enableLoadingAnimation = null,
    Object? enableFadeIn = null,
    Object? fadeInDuration = null,
  }) {
    return _then(
      _$DSImageAnimationImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSImageAnimationType,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        curve: null == curve
            ? _value.curve
            : curve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enableStateTransitions: null == enableStateTransitions
            ? _value.enableStateTransitions
            : enableStateTransitions // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHoverAnimation: null == enableHoverAnimation
            ? _value.enableHoverAnimation
            : enableHoverAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enablePressAnimation: null == enablePressAnimation
            ? _value.enablePressAnimation
            : enablePressAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableLoadingAnimation: null == enableLoadingAnimation
            ? _value.enableLoadingAnimation
            : enableLoadingAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableFadeIn: null == enableFadeIn
            ? _value.enableFadeIn
            : enableFadeIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        fadeInDuration: null == fadeInDuration
            ? _value.fadeInDuration
            : fadeInDuration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSImageAnimationImpl implements _DSImageAnimation {
  const _$DSImageAnimationImpl({
    this.type = DSImageAnimationType.fade,
    this.duration = 300,
    this.curve = Curves.easeInOut,
    this.enableStateTransitions = true,
    this.enableHoverAnimation = true,
    this.enablePressAnimation = true,
    this.enableLoadingAnimation = true,
    this.enableFadeIn = true,
    this.fadeInDuration = 500,
  });

  /// Tipo de animación
  @override
  @JsonKey()
  final DSImageAnimationType type;

  /// Duración de la animación en milisegundos
  @override
  @JsonKey()
  final int duration;

  /// Curva de animación
  @override
  @JsonKey()
  final Curve curve;

  /// Habilitar transiciones de estado
  @override
  @JsonKey()
  final bool enableStateTransitions;

  /// Habilitar animación de hover
  @override
  @JsonKey()
  final bool enableHoverAnimation;

  /// Habilitar animación de press
  @override
  @JsonKey()
  final bool enablePressAnimation;

  /// Habilitar animación de carga
  @override
  @JsonKey()
  final bool enableLoadingAnimation;

  /// Habilitar animación de aparición
  @override
  @JsonKey()
  final bool enableFadeIn;

  /// Duración del fade in en milisegundos
  @override
  @JsonKey()
  final int fadeInDuration;

  @override
  String toString() {
    return 'DSImageAnimation(type: $type, duration: $duration, curve: $curve, enableStateTransitions: $enableStateTransitions, enableHoverAnimation: $enableHoverAnimation, enablePressAnimation: $enablePressAnimation, enableLoadingAnimation: $enableLoadingAnimation, enableFadeIn: $enableFadeIn, fadeInDuration: $fadeInDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageAnimationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.enableStateTransitions, enableStateTransitions) ||
                other.enableStateTransitions == enableStateTransitions) &&
            (identical(other.enableHoverAnimation, enableHoverAnimation) ||
                other.enableHoverAnimation == enableHoverAnimation) &&
            (identical(other.enablePressAnimation, enablePressAnimation) ||
                other.enablePressAnimation == enablePressAnimation) &&
            (identical(other.enableLoadingAnimation, enableLoadingAnimation) ||
                other.enableLoadingAnimation == enableLoadingAnimation) &&
            (identical(other.enableFadeIn, enableFadeIn) ||
                other.enableFadeIn == enableFadeIn) &&
            (identical(other.fadeInDuration, fadeInDuration) ||
                other.fadeInDuration == fadeInDuration));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    duration,
    curve,
    enableStateTransitions,
    enableHoverAnimation,
    enablePressAnimation,
    enableLoadingAnimation,
    enableFadeIn,
    fadeInDuration,
  );

  /// Create a copy of DSImageAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageAnimationImplCopyWith<_$DSImageAnimationImpl> get copyWith =>
      __$$DSImageAnimationImplCopyWithImpl<_$DSImageAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSImageAnimation implements DSImageAnimation {
  const factory _DSImageAnimation({
    final DSImageAnimationType type,
    final int duration,
    final Curve curve,
    final bool enableStateTransitions,
    final bool enableHoverAnimation,
    final bool enablePressAnimation,
    final bool enableLoadingAnimation,
    final bool enableFadeIn,
    final int fadeInDuration,
  }) = _$DSImageAnimationImpl;

  /// Tipo de animación
  @override
  DSImageAnimationType get type;

  /// Duración de la animación en milisegundos
  @override
  int get duration;

  /// Curva de animación
  @override
  Curve get curve;

  /// Habilitar transiciones de estado
  @override
  bool get enableStateTransitions;

  /// Habilitar animación de hover
  @override
  bool get enableHoverAnimation;

  /// Habilitar animación de press
  @override
  bool get enablePressAnimation;

  /// Habilitar animación de carga
  @override
  bool get enableLoadingAnimation;

  /// Habilitar animación de aparición
  @override
  bool get enableFadeIn;

  /// Duración del fade in en milisegundos
  @override
  int get fadeInDuration;

  /// Create a copy of DSImageAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageAnimationImplCopyWith<_$DSImageAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageLazyConfig {
  /// Habilitar carga lazy
  bool get enabled => throw _privateConstructorUsedError;

  /// Distancia en píxeles para empezar a cargar
  double get threshold => throw _privateConstructorUsedError;

  /// Mostrar placeholder hasta que esté en viewport
  bool get showPlaceholder => throw _privateConstructorUsedError;

  /// Tamaño del placeholder por defecto
  Size get placeholderSize => throw _privateConstructorUsedError;

  /// Color del placeholder por defecto
  Color? get placeholderColor => throw _privateConstructorUsedError;

  /// Usar skeleton durante carga lazy
  bool get useSkeleton => throw _privateConstructorUsedError;

  /// Create a copy of DSImageLazyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageLazyConfigCopyWith<DSImageLazyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageLazyConfigCopyWith<$Res> {
  factory $DSImageLazyConfigCopyWith(
    DSImageLazyConfig value,
    $Res Function(DSImageLazyConfig) then,
  ) = _$DSImageLazyConfigCopyWithImpl<$Res, DSImageLazyConfig>;
  @useResult
  $Res call({
    bool enabled,
    double threshold,
    bool showPlaceholder,
    Size placeholderSize,
    Color? placeholderColor,
    bool useSkeleton,
  });
}

/// @nodoc
class _$DSImageLazyConfigCopyWithImpl<$Res, $Val extends DSImageLazyConfig>
    implements $DSImageLazyConfigCopyWith<$Res> {
  _$DSImageLazyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageLazyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? threshold = null,
    Object? showPlaceholder = null,
    Object? placeholderSize = null,
    Object? placeholderColor = freezed,
    Object? useSkeleton = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            threshold: null == threshold
                ? _value.threshold
                : threshold // ignore: cast_nullable_to_non_nullable
                      as double,
            showPlaceholder: null == showPlaceholder
                ? _value.showPlaceholder
                : showPlaceholder // ignore: cast_nullable_to_non_nullable
                      as bool,
            placeholderSize: null == placeholderSize
                ? _value.placeholderSize
                : placeholderSize // ignore: cast_nullable_to_non_nullable
                      as Size,
            placeholderColor: freezed == placeholderColor
                ? _value.placeholderColor
                : placeholderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            useSkeleton: null == useSkeleton
                ? _value.useSkeleton
                : useSkeleton // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageLazyConfigImplCopyWith<$Res>
    implements $DSImageLazyConfigCopyWith<$Res> {
  factory _$$DSImageLazyConfigImplCopyWith(
    _$DSImageLazyConfigImpl value,
    $Res Function(_$DSImageLazyConfigImpl) then,
  ) = __$$DSImageLazyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    double threshold,
    bool showPlaceholder,
    Size placeholderSize,
    Color? placeholderColor,
    bool useSkeleton,
  });
}

/// @nodoc
class __$$DSImageLazyConfigImplCopyWithImpl<$Res>
    extends _$DSImageLazyConfigCopyWithImpl<$Res, _$DSImageLazyConfigImpl>
    implements _$$DSImageLazyConfigImplCopyWith<$Res> {
  __$$DSImageLazyConfigImplCopyWithImpl(
    _$DSImageLazyConfigImpl _value,
    $Res Function(_$DSImageLazyConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageLazyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? threshold = null,
    Object? showPlaceholder = null,
    Object? placeholderSize = null,
    Object? placeholderColor = freezed,
    Object? useSkeleton = null,
  }) {
    return _then(
      _$DSImageLazyConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        threshold: null == threshold
            ? _value.threshold
            : threshold // ignore: cast_nullable_to_non_nullable
                  as double,
        showPlaceholder: null == showPlaceholder
            ? _value.showPlaceholder
            : showPlaceholder // ignore: cast_nullable_to_non_nullable
                  as bool,
        placeholderSize: null == placeholderSize
            ? _value.placeholderSize
            : placeholderSize // ignore: cast_nullable_to_non_nullable
                  as Size,
        placeholderColor: freezed == placeholderColor
            ? _value.placeholderColor
            : placeholderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        useSkeleton: null == useSkeleton
            ? _value.useSkeleton
            : useSkeleton // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSImageLazyConfigImpl implements _DSImageLazyConfig {
  const _$DSImageLazyConfigImpl({
    this.enabled = true,
    this.threshold = 200.0,
    this.showPlaceholder = true,
    this.placeholderSize = const Size(200, 200),
    this.placeholderColor,
    this.useSkeleton = true,
  });

  /// Habilitar carga lazy
  @override
  @JsonKey()
  final bool enabled;

  /// Distancia en píxeles para empezar a cargar
  @override
  @JsonKey()
  final double threshold;

  /// Mostrar placeholder hasta que esté en viewport
  @override
  @JsonKey()
  final bool showPlaceholder;

  /// Tamaño del placeholder por defecto
  @override
  @JsonKey()
  final Size placeholderSize;

  /// Color del placeholder por defecto
  @override
  final Color? placeholderColor;

  /// Usar skeleton durante carga lazy
  @override
  @JsonKey()
  final bool useSkeleton;

  @override
  String toString() {
    return 'DSImageLazyConfig(enabled: $enabled, threshold: $threshold, showPlaceholder: $showPlaceholder, placeholderSize: $placeholderSize, placeholderColor: $placeholderColor, useSkeleton: $useSkeleton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageLazyConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.showPlaceholder, showPlaceholder) ||
                other.showPlaceholder == showPlaceholder) &&
            (identical(other.placeholderSize, placeholderSize) ||
                other.placeholderSize == placeholderSize) &&
            (identical(other.placeholderColor, placeholderColor) ||
                other.placeholderColor == placeholderColor) &&
            (identical(other.useSkeleton, useSkeleton) ||
                other.useSkeleton == useSkeleton));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    threshold,
    showPlaceholder,
    placeholderSize,
    placeholderColor,
    useSkeleton,
  );

  /// Create a copy of DSImageLazyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageLazyConfigImplCopyWith<_$DSImageLazyConfigImpl> get copyWith =>
      __$$DSImageLazyConfigImplCopyWithImpl<_$DSImageLazyConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSImageLazyConfig implements DSImageLazyConfig {
  const factory _DSImageLazyConfig({
    final bool enabled,
    final double threshold,
    final bool showPlaceholder,
    final Size placeholderSize,
    final Color? placeholderColor,
    final bool useSkeleton,
  }) = _$DSImageLazyConfigImpl;

  /// Habilitar carga lazy
  @override
  bool get enabled;

  /// Distancia en píxeles para empezar a cargar
  @override
  double get threshold;

  /// Mostrar placeholder hasta que esté en viewport
  @override
  bool get showPlaceholder;

  /// Tamaño del placeholder por defecto
  @override
  Size get placeholderSize;

  /// Color del placeholder por defecto
  @override
  Color? get placeholderColor;

  /// Usar skeleton durante carga lazy
  @override
  bool get useSkeleton;

  /// Create a copy of DSImageLazyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageLazyConfigImplCopyWith<_$DSImageLazyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageResponsiveConfig {
  /// Habilitar comportamiento responsivo
  bool get enabled => throw _privateConstructorUsedError;

  /// Configuración para mobile
  DSImageBreakpointConfig? get mobile => throw _privateConstructorUsedError;

  /// Configuración para tablet
  DSImageBreakpointConfig? get tablet => throw _privateConstructorUsedError;

  /// Configuración para desktop
  DSImageBreakpointConfig? get desktop => throw _privateConstructorUsedError;

  /// Usar diferentes resoluciones según dispositivo
  bool get useAdaptiveResolution => throw _privateConstructorUsedError;

  /// Factor de escala para imágenes en diferentes densidades
  bool get scaleByDevicePixelRatio => throw _privateConstructorUsedError;

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageResponsiveConfigCopyWith<DSImageResponsiveConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageResponsiveConfigCopyWith<$Res> {
  factory $DSImageResponsiveConfigCopyWith(
    DSImageResponsiveConfig value,
    $Res Function(DSImageResponsiveConfig) then,
  ) = _$DSImageResponsiveConfigCopyWithImpl<$Res, DSImageResponsiveConfig>;
  @useResult
  $Res call({
    bool enabled,
    DSImageBreakpointConfig? mobile,
    DSImageBreakpointConfig? tablet,
    DSImageBreakpointConfig? desktop,
    bool useAdaptiveResolution,
    bool scaleByDevicePixelRatio,
  });

  $DSImageBreakpointConfigCopyWith<$Res>? get mobile;
  $DSImageBreakpointConfigCopyWith<$Res>? get tablet;
  $DSImageBreakpointConfigCopyWith<$Res>? get desktop;
}

/// @nodoc
class _$DSImageResponsiveConfigCopyWithImpl<
  $Res,
  $Val extends DSImageResponsiveConfig
>
    implements $DSImageResponsiveConfigCopyWith<$Res> {
  _$DSImageResponsiveConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? mobile = freezed,
    Object? tablet = freezed,
    Object? desktop = freezed,
    Object? useAdaptiveResolution = null,
    Object? scaleByDevicePixelRatio = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            mobile: freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                      as DSImageBreakpointConfig?,
            tablet: freezed == tablet
                ? _value.tablet
                : tablet // ignore: cast_nullable_to_non_nullable
                      as DSImageBreakpointConfig?,
            desktop: freezed == desktop
                ? _value.desktop
                : desktop // ignore: cast_nullable_to_non_nullable
                      as DSImageBreakpointConfig?,
            useAdaptiveResolution: null == useAdaptiveResolution
                ? _value.useAdaptiveResolution
                : useAdaptiveResolution // ignore: cast_nullable_to_non_nullable
                      as bool,
            scaleByDevicePixelRatio: null == scaleByDevicePixelRatio
                ? _value.scaleByDevicePixelRatio
                : scaleByDevicePixelRatio // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageBreakpointConfigCopyWith<$Res>? get mobile {
    if (_value.mobile == null) {
      return null;
    }

    return $DSImageBreakpointConfigCopyWith<$Res>(_value.mobile!, (value) {
      return _then(_value.copyWith(mobile: value) as $Val);
    });
  }

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageBreakpointConfigCopyWith<$Res>? get tablet {
    if (_value.tablet == null) {
      return null;
    }

    return $DSImageBreakpointConfigCopyWith<$Res>(_value.tablet!, (value) {
      return _then(_value.copyWith(tablet: value) as $Val);
    });
  }

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSImageBreakpointConfigCopyWith<$Res>? get desktop {
    if (_value.desktop == null) {
      return null;
    }

    return $DSImageBreakpointConfigCopyWith<$Res>(_value.desktop!, (value) {
      return _then(_value.copyWith(desktop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSImageResponsiveConfigImplCopyWith<$Res>
    implements $DSImageResponsiveConfigCopyWith<$Res> {
  factory _$$DSImageResponsiveConfigImplCopyWith(
    _$DSImageResponsiveConfigImpl value,
    $Res Function(_$DSImageResponsiveConfigImpl) then,
  ) = __$$DSImageResponsiveConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    DSImageBreakpointConfig? mobile,
    DSImageBreakpointConfig? tablet,
    DSImageBreakpointConfig? desktop,
    bool useAdaptiveResolution,
    bool scaleByDevicePixelRatio,
  });

  @override
  $DSImageBreakpointConfigCopyWith<$Res>? get mobile;
  @override
  $DSImageBreakpointConfigCopyWith<$Res>? get tablet;
  @override
  $DSImageBreakpointConfigCopyWith<$Res>? get desktop;
}

/// @nodoc
class __$$DSImageResponsiveConfigImplCopyWithImpl<$Res>
    extends
        _$DSImageResponsiveConfigCopyWithImpl<
          $Res,
          _$DSImageResponsiveConfigImpl
        >
    implements _$$DSImageResponsiveConfigImplCopyWith<$Res> {
  __$$DSImageResponsiveConfigImplCopyWithImpl(
    _$DSImageResponsiveConfigImpl _value,
    $Res Function(_$DSImageResponsiveConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? mobile = freezed,
    Object? tablet = freezed,
    Object? desktop = freezed,
    Object? useAdaptiveResolution = null,
    Object? scaleByDevicePixelRatio = null,
  }) {
    return _then(
      _$DSImageResponsiveConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        mobile: freezed == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as DSImageBreakpointConfig?,
        tablet: freezed == tablet
            ? _value.tablet
            : tablet // ignore: cast_nullable_to_non_nullable
                  as DSImageBreakpointConfig?,
        desktop: freezed == desktop
            ? _value.desktop
            : desktop // ignore: cast_nullable_to_non_nullable
                  as DSImageBreakpointConfig?,
        useAdaptiveResolution: null == useAdaptiveResolution
            ? _value.useAdaptiveResolution
            : useAdaptiveResolution // ignore: cast_nullable_to_non_nullable
                  as bool,
        scaleByDevicePixelRatio: null == scaleByDevicePixelRatio
            ? _value.scaleByDevicePixelRatio
            : scaleByDevicePixelRatio // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSImageResponsiveConfigImpl implements _DSImageResponsiveConfig {
  const _$DSImageResponsiveConfigImpl({
    this.enabled = true,
    this.mobile,
    this.tablet,
    this.desktop,
    this.useAdaptiveResolution = true,
    this.scaleByDevicePixelRatio = true,
  });

  /// Habilitar comportamiento responsivo
  @override
  @JsonKey()
  final bool enabled;

  /// Configuración para mobile
  @override
  final DSImageBreakpointConfig? mobile;

  /// Configuración para tablet
  @override
  final DSImageBreakpointConfig? tablet;

  /// Configuración para desktop
  @override
  final DSImageBreakpointConfig? desktop;

  /// Usar diferentes resoluciones según dispositivo
  @override
  @JsonKey()
  final bool useAdaptiveResolution;

  /// Factor de escala para imágenes en diferentes densidades
  @override
  @JsonKey()
  final bool scaleByDevicePixelRatio;

  @override
  String toString() {
    return 'DSImageResponsiveConfig(enabled: $enabled, mobile: $mobile, tablet: $tablet, desktop: $desktop, useAdaptiveResolution: $useAdaptiveResolution, scaleByDevicePixelRatio: $scaleByDevicePixelRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageResponsiveConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.tablet, tablet) || other.tablet == tablet) &&
            (identical(other.desktop, desktop) || other.desktop == desktop) &&
            (identical(other.useAdaptiveResolution, useAdaptiveResolution) ||
                other.useAdaptiveResolution == useAdaptiveResolution) &&
            (identical(
                  other.scaleByDevicePixelRatio,
                  scaleByDevicePixelRatio,
                ) ||
                other.scaleByDevicePixelRatio == scaleByDevicePixelRatio));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    mobile,
    tablet,
    desktop,
    useAdaptiveResolution,
    scaleByDevicePixelRatio,
  );

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageResponsiveConfigImplCopyWith<_$DSImageResponsiveConfigImpl>
  get copyWith =>
      __$$DSImageResponsiveConfigImplCopyWithImpl<
        _$DSImageResponsiveConfigImpl
      >(this, _$identity);
}

abstract class _DSImageResponsiveConfig implements DSImageResponsiveConfig {
  const factory _DSImageResponsiveConfig({
    final bool enabled,
    final DSImageBreakpointConfig? mobile,
    final DSImageBreakpointConfig? tablet,
    final DSImageBreakpointConfig? desktop,
    final bool useAdaptiveResolution,
    final bool scaleByDevicePixelRatio,
  }) = _$DSImageResponsiveConfigImpl;

  /// Habilitar comportamiento responsivo
  @override
  bool get enabled;

  /// Configuración para mobile
  @override
  DSImageBreakpointConfig? get mobile;

  /// Configuración para tablet
  @override
  DSImageBreakpointConfig? get tablet;

  /// Configuración para desktop
  @override
  DSImageBreakpointConfig? get desktop;

  /// Usar diferentes resoluciones según dispositivo
  @override
  bool get useAdaptiveResolution;

  /// Factor de escala para imágenes en diferentes densidades
  @override
  bool get scaleByDevicePixelRatio;

  /// Create a copy of DSImageResponsiveConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageResponsiveConfigImplCopyWith<_$DSImageResponsiveConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageBreakpointConfig {
  /// Ancho para este breakpoint
  double? get width => throw _privateConstructorUsedError;

  /// Alto para este breakpoint
  double? get height => throw _privateConstructorUsedError;

  /// Fit para este breakpoint
  BoxFit? get fit => throw _privateConstructorUsedError;

  /// Ratio para este breakpoint
  double? get ratio => throw _privateConstructorUsedError;

  /// Calidad de imagen para este breakpoint
  int? get quality => throw _privateConstructorUsedError;

  /// Create a copy of DSImageBreakpointConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageBreakpointConfigCopyWith<DSImageBreakpointConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageBreakpointConfigCopyWith<$Res> {
  factory $DSImageBreakpointConfigCopyWith(
    DSImageBreakpointConfig value,
    $Res Function(DSImageBreakpointConfig) then,
  ) = _$DSImageBreakpointConfigCopyWithImpl<$Res, DSImageBreakpointConfig>;
  @useResult
  $Res call({
    double? width,
    double? height,
    BoxFit? fit,
    double? ratio,
    int? quality,
  });
}

/// @nodoc
class _$DSImageBreakpointConfigCopyWithImpl<
  $Res,
  $Val extends DSImageBreakpointConfig
>
    implements $DSImageBreakpointConfigCopyWith<$Res> {
  _$DSImageBreakpointConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageBreakpointConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? fit = freezed,
    Object? ratio = freezed,
    Object? quality = freezed,
  }) {
    return _then(
      _value.copyWith(
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as double?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            fit: freezed == fit
                ? _value.fit
                : fit // ignore: cast_nullable_to_non_nullable
                      as BoxFit?,
            ratio: freezed == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as double?,
            quality: freezed == quality
                ? _value.quality
                : quality // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageBreakpointConfigImplCopyWith<$Res>
    implements $DSImageBreakpointConfigCopyWith<$Res> {
  factory _$$DSImageBreakpointConfigImplCopyWith(
    _$DSImageBreakpointConfigImpl value,
    $Res Function(_$DSImageBreakpointConfigImpl) then,
  ) = __$$DSImageBreakpointConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? width,
    double? height,
    BoxFit? fit,
    double? ratio,
    int? quality,
  });
}

/// @nodoc
class __$$DSImageBreakpointConfigImplCopyWithImpl<$Res>
    extends
        _$DSImageBreakpointConfigCopyWithImpl<
          $Res,
          _$DSImageBreakpointConfigImpl
        >
    implements _$$DSImageBreakpointConfigImplCopyWith<$Res> {
  __$$DSImageBreakpointConfigImplCopyWithImpl(
    _$DSImageBreakpointConfigImpl _value,
    $Res Function(_$DSImageBreakpointConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageBreakpointConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? fit = freezed,
    Object? ratio = freezed,
    Object? quality = freezed,
  }) {
    return _then(
      _$DSImageBreakpointConfigImpl(
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as double?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        fit: freezed == fit
            ? _value.fit
            : fit // ignore: cast_nullable_to_non_nullable
                  as BoxFit?,
        ratio: freezed == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as double?,
        quality: freezed == quality
            ? _value.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$DSImageBreakpointConfigImpl implements _DSImageBreakpointConfig {
  const _$DSImageBreakpointConfigImpl({
    this.width,
    this.height,
    this.fit,
    this.ratio,
    this.quality,
  });

  /// Ancho para este breakpoint
  @override
  final double? width;

  /// Alto para este breakpoint
  @override
  final double? height;

  /// Fit para este breakpoint
  @override
  final BoxFit? fit;

  /// Ratio para este breakpoint
  @override
  final double? ratio;

  /// Calidad de imagen para este breakpoint
  @override
  final int? quality;

  @override
  String toString() {
    return 'DSImageBreakpointConfig(width: $width, height: $height, fit: $fit, ratio: $ratio, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageBreakpointConfigImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, width, height, fit, ratio, quality);

  /// Create a copy of DSImageBreakpointConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageBreakpointConfigImplCopyWith<_$DSImageBreakpointConfigImpl>
  get copyWith =>
      __$$DSImageBreakpointConfigImplCopyWithImpl<
        _$DSImageBreakpointConfigImpl
      >(this, _$identity);
}

abstract class _DSImageBreakpointConfig implements DSImageBreakpointConfig {
  const factory _DSImageBreakpointConfig({
    final double? width,
    final double? height,
    final BoxFit? fit,
    final double? ratio,
    final int? quality,
  }) = _$DSImageBreakpointConfigImpl;

  /// Ancho para este breakpoint
  @override
  double? get width;

  /// Alto para este breakpoint
  @override
  double? get height;

  /// Fit para este breakpoint
  @override
  BoxFit? get fit;

  /// Ratio para este breakpoint
  @override
  double? get ratio;

  /// Calidad de imagen para este breakpoint
  @override
  int? get quality;

  /// Create a copy of DSImageBreakpointConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageBreakpointConfigImplCopyWith<_$DSImageBreakpointConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSImageA11yConfig {
  /// Habilitar funciones de accesibilidad
  bool get enabled => throw _privateConstructorUsedError;

  /// Texto de semántica personalizado
  String? get semanticsLabel => throw _privateConstructorUsedError;

  /// Descripción detallada para lectores de pantalla
  String? get semanticsDescription => throw _privateConstructorUsedError;

  /// Hints para interacción
  String? get semanticsHint => throw _privateConstructorUsedError;

  /// Si la imagen es decorativa (sin semántica)
  bool get isDecorative => throw _privateConstructorUsedError;

  /// Habilitar navegación por teclado
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Texto alternativo expandido
  String? get expandedAltText => throw _privateConstructorUsedError;

  /// Rol semántico personalizado
  String? get semanticsRole => throw _privateConstructorUsedError;

  /// Create a copy of DSImageA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSImageA11yConfigCopyWith<DSImageA11yConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSImageA11yConfigCopyWith<$Res> {
  factory $DSImageA11yConfigCopyWith(
    DSImageA11yConfig value,
    $Res Function(DSImageA11yConfig) then,
  ) = _$DSImageA11yConfigCopyWithImpl<$Res, DSImageA11yConfig>;
  @useResult
  $Res call({
    bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    bool isDecorative,
    bool enableKeyboardNavigation,
    String? expandedAltText,
    String? semanticsRole,
  });
}

/// @nodoc
class _$DSImageA11yConfigCopyWithImpl<$Res, $Val extends DSImageA11yConfig>
    implements $DSImageA11yConfigCopyWith<$Res> {
  _$DSImageA11yConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSImageA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticsLabel = freezed,
    Object? semanticsDescription = freezed,
    Object? semanticsHint = freezed,
    Object? isDecorative = null,
    Object? enableKeyboardNavigation = null,
    Object? expandedAltText = freezed,
    Object? semanticsRole = freezed,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            semanticsLabel: freezed == semanticsLabel
                ? _value.semanticsLabel
                : semanticsLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            semanticsDescription: freezed == semanticsDescription
                ? _value.semanticsDescription
                : semanticsDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            semanticsHint: freezed == semanticsHint
                ? _value.semanticsHint
                : semanticsHint // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDecorative: null == isDecorative
                ? _value.isDecorative
                : isDecorative // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
            expandedAltText: freezed == expandedAltText
                ? _value.expandedAltText
                : expandedAltText // ignore: cast_nullable_to_non_nullable
                      as String?,
            semanticsRole: freezed == semanticsRole
                ? _value.semanticsRole
                : semanticsRole // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSImageA11yConfigImplCopyWith<$Res>
    implements $DSImageA11yConfigCopyWith<$Res> {
  factory _$$DSImageA11yConfigImplCopyWith(
    _$DSImageA11yConfigImpl value,
    $Res Function(_$DSImageA11yConfigImpl) then,
  ) = __$$DSImageA11yConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    bool isDecorative,
    bool enableKeyboardNavigation,
    String? expandedAltText,
    String? semanticsRole,
  });
}

/// @nodoc
class __$$DSImageA11yConfigImplCopyWithImpl<$Res>
    extends _$DSImageA11yConfigCopyWithImpl<$Res, _$DSImageA11yConfigImpl>
    implements _$$DSImageA11yConfigImplCopyWith<$Res> {
  __$$DSImageA11yConfigImplCopyWithImpl(
    _$DSImageA11yConfigImpl _value,
    $Res Function(_$DSImageA11yConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSImageA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticsLabel = freezed,
    Object? semanticsDescription = freezed,
    Object? semanticsHint = freezed,
    Object? isDecorative = null,
    Object? enableKeyboardNavigation = null,
    Object? expandedAltText = freezed,
    Object? semanticsRole = freezed,
  }) {
    return _then(
      _$DSImageA11yConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        semanticsLabel: freezed == semanticsLabel
            ? _value.semanticsLabel
            : semanticsLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        semanticsDescription: freezed == semanticsDescription
            ? _value.semanticsDescription
            : semanticsDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        semanticsHint: freezed == semanticsHint
            ? _value.semanticsHint
            : semanticsHint // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDecorative: null == isDecorative
            ? _value.isDecorative
            : isDecorative // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
        expandedAltText: freezed == expandedAltText
            ? _value.expandedAltText
            : expandedAltText // ignore: cast_nullable_to_non_nullable
                  as String?,
        semanticsRole: freezed == semanticsRole
            ? _value.semanticsRole
            : semanticsRole // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSImageA11yConfigImpl implements _DSImageA11yConfig {
  const _$DSImageA11yConfigImpl({
    this.enabled = true,
    this.semanticsLabel,
    this.semanticsDescription,
    this.semanticsHint,
    this.isDecorative = false,
    this.enableKeyboardNavigation = true,
    this.expandedAltText,
    this.semanticsRole,
  });

  /// Habilitar funciones de accesibilidad
  @override
  @JsonKey()
  final bool enabled;

  /// Texto de semántica personalizado
  @override
  final String? semanticsLabel;

  /// Descripción detallada para lectores de pantalla
  @override
  final String? semanticsDescription;

  /// Hints para interacción
  @override
  final String? semanticsHint;

  /// Si la imagen es decorativa (sin semántica)
  @override
  @JsonKey()
  final bool isDecorative;

  /// Habilitar navegación por teclado
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;

  /// Texto alternativo expandido
  @override
  final String? expandedAltText;

  /// Rol semántico personalizado
  @override
  final String? semanticsRole;

  @override
  String toString() {
    return 'DSImageA11yConfig(enabled: $enabled, semanticsLabel: $semanticsLabel, semanticsDescription: $semanticsDescription, semanticsHint: $semanticsHint, isDecorative: $isDecorative, enableKeyboardNavigation: $enableKeyboardNavigation, expandedAltText: $expandedAltText, semanticsRole: $semanticsRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSImageA11yConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.semanticsLabel, semanticsLabel) ||
                other.semanticsLabel == semanticsLabel) &&
            (identical(other.semanticsDescription, semanticsDescription) ||
                other.semanticsDescription == semanticsDescription) &&
            (identical(other.semanticsHint, semanticsHint) ||
                other.semanticsHint == semanticsHint) &&
            (identical(other.isDecorative, isDecorative) ||
                other.isDecorative == isDecorative) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation) &&
            (identical(other.expandedAltText, expandedAltText) ||
                other.expandedAltText == expandedAltText) &&
            (identical(other.semanticsRole, semanticsRole) ||
                other.semanticsRole == semanticsRole));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    semanticsLabel,
    semanticsDescription,
    semanticsHint,
    isDecorative,
    enableKeyboardNavigation,
    expandedAltText,
    semanticsRole,
  );

  /// Create a copy of DSImageA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSImageA11yConfigImplCopyWith<_$DSImageA11yConfigImpl> get copyWith =>
      __$$DSImageA11yConfigImplCopyWithImpl<_$DSImageA11yConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSImageA11yConfig implements DSImageA11yConfig {
  const factory _DSImageA11yConfig({
    final bool enabled,
    final String? semanticsLabel,
    final String? semanticsDescription,
    final String? semanticsHint,
    final bool isDecorative,
    final bool enableKeyboardNavigation,
    final String? expandedAltText,
    final String? semanticsRole,
  }) = _$DSImageA11yConfigImpl;

  /// Habilitar funciones de accesibilidad
  @override
  bool get enabled;

  /// Texto de semántica personalizado
  @override
  String? get semanticsLabel;

  /// Descripción detallada para lectores de pantalla
  @override
  String? get semanticsDescription;

  /// Hints para interacción
  @override
  String? get semanticsHint;

  /// Si la imagen es decorativa (sin semántica)
  @override
  bool get isDecorative;

  /// Habilitar navegación por teclado
  @override
  bool get enableKeyboardNavigation;

  /// Texto alternativo expandido
  @override
  String? get expandedAltText;

  /// Rol semántico personalizado
  @override
  String? get semanticsRole;

  /// Create a copy of DSImageA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSImageA11yConfigImplCopyWith<_$DSImageA11yConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
