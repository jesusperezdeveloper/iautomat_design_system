// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_media_viewer_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSMediaViewerConfig {
  /// Variante del componente media viewer
  DSMediaViewerVariant get variant => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSMediaViewerState get state => throw _privateConstructorUsedError;

  /// Lista de elementos de media para mostrar
  List<DSMediaItem> get items => throw _privateConstructorUsedError;

  /// Índice inicial del elemento a mostrar
  int get initialIndex => throw _privateConstructorUsedError;

  /// Si mostrar captions/subtítulos
  bool get showCaptions => throw _privateConstructorUsedError;

  /// Si mostrar controles de navegación
  bool get showControls => throw _privateConstructorUsedError;

  /// Si mostrar indicadores de página/posición
  bool get showIndicators => throw _privateConstructorUsedError;

  /// Si permitir zoom en imágenes
  bool get allowZoom => throw _privateConstructorUsedError;

  /// Si permitir pantalla completa
  bool get allowFullscreen => throw _privateConstructorUsedError;

  /// Si reproducir automáticamente videos/audio
  bool get autoPlay => throw _privateConstructorUsedError;

  /// Si hacer loop en videos/audio
  bool get loop => throw _privateConstructorUsedError;

  /// Si silenciar por defecto
  bool get muted => throw _privateConstructorUsedError;

  /// Configuración de colores
  DSMediaViewerColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado y dimensiones
  DSMediaViewerSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de elevación y sombras
  DSMediaViewerElevation? get elevation => throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSMediaViewerBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSMediaViewerAnimation? get animation => throw _privateConstructorUsedError;

  /// Configuración de controles
  DSMediaViewerControls? get controls => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSMediaViewerA11yConfig? get a11yConfig => throw _privateConstructorUsedError;

  /// Callbacks de interacción
  ValueChanged<int>? get onPageChanged => throw _privateConstructorUsedError;
  ValueChanged<DSMediaItem>? get onItemTap =>
      throw _privateConstructorUsedError;
  VoidCallback? get onFullscreenToggle => throw _privateConstructorUsedError;
  ValueChanged<bool>? get onPlayPause => throw _privateConstructorUsedError;
  ValueChanged<double>? get onSeek => throw _privateConstructorUsedError;
  ValueChanged<double>? get onVolumeChange =>
      throw _privateConstructorUsedError;
  VoidCallback? get onClose => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerConfigCopyWith<DSMediaViewerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerConfigCopyWith<$Res> {
  factory $DSMediaViewerConfigCopyWith(
    DSMediaViewerConfig value,
    $Res Function(DSMediaViewerConfig) then,
  ) = _$DSMediaViewerConfigCopyWithImpl<$Res, DSMediaViewerConfig>;
  @useResult
  $Res call({
    DSMediaViewerVariant variant,
    DSMediaViewerState state,
    List<DSMediaItem> items,
    int initialIndex,
    bool showCaptions,
    bool showControls,
    bool showIndicators,
    bool allowZoom,
    bool allowFullscreen,
    bool autoPlay,
    bool loop,
    bool muted,
    DSMediaViewerColors? colors,
    DSMediaViewerSpacing? spacing,
    DSMediaViewerElevation? elevation,
    DSMediaViewerBehavior? behavior,
    DSMediaViewerAnimation? animation,
    DSMediaViewerControls? controls,
    DSMediaViewerA11yConfig? a11yConfig,
    ValueChanged<int>? onPageChanged,
    ValueChanged<DSMediaItem>? onItemTap,
    VoidCallback? onFullscreenToggle,
    ValueChanged<bool>? onPlayPause,
    ValueChanged<double>? onSeek,
    ValueChanged<double>? onVolumeChange,
    VoidCallback? onClose,
  });

  $DSMediaViewerColorsCopyWith<$Res>? get colors;
  $DSMediaViewerSpacingCopyWith<$Res>? get spacing;
  $DSMediaViewerElevationCopyWith<$Res>? get elevation;
  $DSMediaViewerBehaviorCopyWith<$Res>? get behavior;
  $DSMediaViewerAnimationCopyWith<$Res>? get animation;
  $DSMediaViewerControlsCopyWith<$Res>? get controls;
  $DSMediaViewerA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class _$DSMediaViewerConfigCopyWithImpl<$Res, $Val extends DSMediaViewerConfig>
    implements $DSMediaViewerConfigCopyWith<$Res> {
  _$DSMediaViewerConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? items = null,
    Object? initialIndex = null,
    Object? showCaptions = null,
    Object? showControls = null,
    Object? showIndicators = null,
    Object? allowZoom = null,
    Object? allowFullscreen = null,
    Object? autoPlay = null,
    Object? loop = null,
    Object? muted = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
    Object? controls = freezed,
    Object? a11yConfig = freezed,
    Object? onPageChanged = freezed,
    Object? onItemTap = freezed,
    Object? onFullscreenToggle = freezed,
    Object? onPlayPause = freezed,
    Object? onSeek = freezed,
    Object? onVolumeChange = freezed,
    Object? onClose = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerState,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<DSMediaItem>,
            initialIndex: null == initialIndex
                ? _value.initialIndex
                : initialIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            showCaptions: null == showCaptions
                ? _value.showCaptions
                : showCaptions // ignore: cast_nullable_to_non_nullable
                      as bool,
            showControls: null == showControls
                ? _value.showControls
                : showControls // ignore: cast_nullable_to_non_nullable
                      as bool,
            showIndicators: null == showIndicators
                ? _value.showIndicators
                : showIndicators // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowZoom: null == allowZoom
                ? _value.allowZoom
                : allowZoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowFullscreen: null == allowFullscreen
                ? _value.allowFullscreen
                : allowFullscreen // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoPlay: null == autoPlay
                ? _value.autoPlay
                : autoPlay // ignore: cast_nullable_to_non_nullable
                      as bool,
            loop: null == loop
                ? _value.loop
                : loop // ignore: cast_nullable_to_non_nullable
                      as bool,
            muted: null == muted
                ? _value.muted
                : muted // ignore: cast_nullable_to_non_nullable
                      as bool,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerSpacing?,
            elevation: freezed == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerElevation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerBehavior?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerAnimation?,
            controls: freezed == controls
                ? _value.controls
                : controls // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerControls?,
            a11yConfig: freezed == a11yConfig
                ? _value.a11yConfig
                : a11yConfig // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerA11yConfig?,
            onPageChanged: freezed == onPageChanged
                ? _value.onPageChanged
                : onPageChanged // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<int>?,
            onItemTap: freezed == onItemTap
                ? _value.onItemTap
                : onItemTap // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<DSMediaItem>?,
            onFullscreenToggle: freezed == onFullscreenToggle
                ? _value.onFullscreenToggle
                : onFullscreenToggle // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onPlayPause: freezed == onPlayPause
                ? _value.onPlayPause
                : onPlayPause // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<bool>?,
            onSeek: freezed == onSeek
                ? _value.onSeek
                : onSeek // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<double>?,
            onVolumeChange: freezed == onVolumeChange
                ? _value.onVolumeChange
                : onVolumeChange // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<double>?,
            onClose: freezed == onClose
                ? _value.onClose
                : onClose // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSMediaViewerColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSMediaViewerSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerElevationCopyWith<$Res>? get elevation {
    if (_value.elevation == null) {
      return null;
    }

    return $DSMediaViewerElevationCopyWith<$Res>(_value.elevation!, (value) {
      return _then(_value.copyWith(elevation: value) as $Val);
    });
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSMediaViewerBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSMediaViewerAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerControlsCopyWith<$Res>? get controls {
    if (_value.controls == null) {
      return null;
    }

    return $DSMediaViewerControlsCopyWith<$Res>(_value.controls!, (value) {
      return _then(_value.copyWith(controls: value) as $Val);
    });
  }

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMediaViewerA11yConfigCopyWith<$Res>? get a11yConfig {
    if (_value.a11yConfig == null) {
      return null;
    }

    return $DSMediaViewerA11yConfigCopyWith<$Res>(_value.a11yConfig!, (value) {
      return _then(_value.copyWith(a11yConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSMediaViewerConfigImplCopyWith<$Res>
    implements $DSMediaViewerConfigCopyWith<$Res> {
  factory _$$DSMediaViewerConfigImplCopyWith(
    _$DSMediaViewerConfigImpl value,
    $Res Function(_$DSMediaViewerConfigImpl) then,
  ) = __$$DSMediaViewerConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSMediaViewerVariant variant,
    DSMediaViewerState state,
    List<DSMediaItem> items,
    int initialIndex,
    bool showCaptions,
    bool showControls,
    bool showIndicators,
    bool allowZoom,
    bool allowFullscreen,
    bool autoPlay,
    bool loop,
    bool muted,
    DSMediaViewerColors? colors,
    DSMediaViewerSpacing? spacing,
    DSMediaViewerElevation? elevation,
    DSMediaViewerBehavior? behavior,
    DSMediaViewerAnimation? animation,
    DSMediaViewerControls? controls,
    DSMediaViewerA11yConfig? a11yConfig,
    ValueChanged<int>? onPageChanged,
    ValueChanged<DSMediaItem>? onItemTap,
    VoidCallback? onFullscreenToggle,
    ValueChanged<bool>? onPlayPause,
    ValueChanged<double>? onSeek,
    ValueChanged<double>? onVolumeChange,
    VoidCallback? onClose,
  });

  @override
  $DSMediaViewerColorsCopyWith<$Res>? get colors;
  @override
  $DSMediaViewerSpacingCopyWith<$Res>? get spacing;
  @override
  $DSMediaViewerElevationCopyWith<$Res>? get elevation;
  @override
  $DSMediaViewerBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSMediaViewerAnimationCopyWith<$Res>? get animation;
  @override
  $DSMediaViewerControlsCopyWith<$Res>? get controls;
  @override
  $DSMediaViewerA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class __$$DSMediaViewerConfigImplCopyWithImpl<$Res>
    extends _$DSMediaViewerConfigCopyWithImpl<$Res, _$DSMediaViewerConfigImpl>
    implements _$$DSMediaViewerConfigImplCopyWith<$Res> {
  __$$DSMediaViewerConfigImplCopyWithImpl(
    _$DSMediaViewerConfigImpl _value,
    $Res Function(_$DSMediaViewerConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? items = null,
    Object? initialIndex = null,
    Object? showCaptions = null,
    Object? showControls = null,
    Object? showIndicators = null,
    Object? allowZoom = null,
    Object? allowFullscreen = null,
    Object? autoPlay = null,
    Object? loop = null,
    Object? muted = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
    Object? controls = freezed,
    Object? a11yConfig = freezed,
    Object? onPageChanged = freezed,
    Object? onItemTap = freezed,
    Object? onFullscreenToggle = freezed,
    Object? onPlayPause = freezed,
    Object? onSeek = freezed,
    Object? onVolumeChange = freezed,
    Object? onClose = freezed,
  }) {
    return _then(
      _$DSMediaViewerConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerState,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<DSMediaItem>,
        initialIndex: null == initialIndex
            ? _value.initialIndex
            : initialIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        showCaptions: null == showCaptions
            ? _value.showCaptions
            : showCaptions // ignore: cast_nullable_to_non_nullable
                  as bool,
        showControls: null == showControls
            ? _value.showControls
            : showControls // ignore: cast_nullable_to_non_nullable
                  as bool,
        showIndicators: null == showIndicators
            ? _value.showIndicators
            : showIndicators // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowZoom: null == allowZoom
            ? _value.allowZoom
            : allowZoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowFullscreen: null == allowFullscreen
            ? _value.allowFullscreen
            : allowFullscreen // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoPlay: null == autoPlay
            ? _value.autoPlay
            : autoPlay // ignore: cast_nullable_to_non_nullable
                  as bool,
        loop: null == loop
            ? _value.loop
            : loop // ignore: cast_nullable_to_non_nullable
                  as bool,
        muted: null == muted
            ? _value.muted
            : muted // ignore: cast_nullable_to_non_nullable
                  as bool,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerSpacing?,
        elevation: freezed == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerElevation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerBehavior?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerAnimation?,
        controls: freezed == controls
            ? _value.controls
            : controls // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerControls?,
        a11yConfig: freezed == a11yConfig
            ? _value.a11yConfig
            : a11yConfig // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerA11yConfig?,
        onPageChanged: freezed == onPageChanged
            ? _value.onPageChanged
            : onPageChanged // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<int>?,
        onItemTap: freezed == onItemTap
            ? _value.onItemTap
            : onItemTap // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<DSMediaItem>?,
        onFullscreenToggle: freezed == onFullscreenToggle
            ? _value.onFullscreenToggle
            : onFullscreenToggle // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onPlayPause: freezed == onPlayPause
            ? _value.onPlayPause
            : onPlayPause // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<bool>?,
        onSeek: freezed == onSeek
            ? _value.onSeek
            : onSeek // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<double>?,
        onVolumeChange: freezed == onVolumeChange
            ? _value.onVolumeChange
            : onVolumeChange // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<double>?,
        onClose: freezed == onClose
            ? _value.onClose
            : onClose // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerConfigImpl implements _DSMediaViewerConfig {
  const _$DSMediaViewerConfigImpl({
    this.variant = DSMediaViewerVariant.image,
    this.state = DSMediaViewerState.defaultState,
    final List<DSMediaItem> items = const [],
    this.initialIndex = 0,
    this.showCaptions = true,
    this.showControls = true,
    this.showIndicators = true,
    this.allowZoom = true,
    this.allowFullscreen = true,
    this.autoPlay = false,
    this.loop = false,
    this.muted = false,
    this.colors,
    this.spacing,
    this.elevation,
    this.behavior,
    this.animation,
    this.controls,
    this.a11yConfig,
    this.onPageChanged,
    this.onItemTap,
    this.onFullscreenToggle,
    this.onPlayPause,
    this.onSeek,
    this.onVolumeChange,
    this.onClose,
  }) : _items = items;

  /// Variante del componente media viewer
  @override
  @JsonKey()
  final DSMediaViewerVariant variant;

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSMediaViewerState state;

  /// Lista de elementos de media para mostrar
  final List<DSMediaItem> _items;

  /// Lista de elementos de media para mostrar
  @override
  @JsonKey()
  List<DSMediaItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Índice inicial del elemento a mostrar
  @override
  @JsonKey()
  final int initialIndex;

  /// Si mostrar captions/subtítulos
  @override
  @JsonKey()
  final bool showCaptions;

  /// Si mostrar controles de navegación
  @override
  @JsonKey()
  final bool showControls;

  /// Si mostrar indicadores de página/posición
  @override
  @JsonKey()
  final bool showIndicators;

  /// Si permitir zoom en imágenes
  @override
  @JsonKey()
  final bool allowZoom;

  /// Si permitir pantalla completa
  @override
  @JsonKey()
  final bool allowFullscreen;

  /// Si reproducir automáticamente videos/audio
  @override
  @JsonKey()
  final bool autoPlay;

  /// Si hacer loop en videos/audio
  @override
  @JsonKey()
  final bool loop;

  /// Si silenciar por defecto
  @override
  @JsonKey()
  final bool muted;

  /// Configuración de colores
  @override
  final DSMediaViewerColors? colors;

  /// Configuración de espaciado y dimensiones
  @override
  final DSMediaViewerSpacing? spacing;

  /// Configuración de elevación y sombras
  @override
  final DSMediaViewerElevation? elevation;

  /// Configuración de comportamiento
  @override
  final DSMediaViewerBehavior? behavior;

  /// Configuración de animaciones
  @override
  final DSMediaViewerAnimation? animation;

  /// Configuración de controles
  @override
  final DSMediaViewerControls? controls;

  /// Configuración de accesibilidad
  @override
  final DSMediaViewerA11yConfig? a11yConfig;

  /// Callbacks de interacción
  @override
  final ValueChanged<int>? onPageChanged;
  @override
  final ValueChanged<DSMediaItem>? onItemTap;
  @override
  final VoidCallback? onFullscreenToggle;
  @override
  final ValueChanged<bool>? onPlayPause;
  @override
  final ValueChanged<double>? onSeek;
  @override
  final ValueChanged<double>? onVolumeChange;
  @override
  final VoidCallback? onClose;

  @override
  String toString() {
    return 'DSMediaViewerConfig(variant: $variant, state: $state, items: $items, initialIndex: $initialIndex, showCaptions: $showCaptions, showControls: $showControls, showIndicators: $showIndicators, allowZoom: $allowZoom, allowFullscreen: $allowFullscreen, autoPlay: $autoPlay, loop: $loop, muted: $muted, colors: $colors, spacing: $spacing, elevation: $elevation, behavior: $behavior, animation: $animation, controls: $controls, a11yConfig: $a11yConfig, onPageChanged: $onPageChanged, onItemTap: $onItemTap, onFullscreenToggle: $onFullscreenToggle, onPlayPause: $onPlayPause, onSeek: $onSeek, onVolumeChange: $onVolumeChange, onClose: $onClose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.initialIndex, initialIndex) ||
                other.initialIndex == initialIndex) &&
            (identical(other.showCaptions, showCaptions) ||
                other.showCaptions == showCaptions) &&
            (identical(other.showControls, showControls) ||
                other.showControls == showControls) &&
            (identical(other.showIndicators, showIndicators) ||
                other.showIndicators == showIndicators) &&
            (identical(other.allowZoom, allowZoom) ||
                other.allowZoom == allowZoom) &&
            (identical(other.allowFullscreen, allowFullscreen) ||
                other.allowFullscreen == allowFullscreen) &&
            (identical(other.autoPlay, autoPlay) ||
                other.autoPlay == autoPlay) &&
            (identical(other.loop, loop) || other.loop == loop) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.animation, animation) ||
                other.animation == animation) &&
            (identical(other.controls, controls) ||
                other.controls == controls) &&
            (identical(other.a11yConfig, a11yConfig) ||
                other.a11yConfig == a11yConfig) &&
            (identical(other.onPageChanged, onPageChanged) ||
                other.onPageChanged == onPageChanged) &&
            (identical(other.onItemTap, onItemTap) ||
                other.onItemTap == onItemTap) &&
            (identical(other.onFullscreenToggle, onFullscreenToggle) ||
                other.onFullscreenToggle == onFullscreenToggle) &&
            (identical(other.onPlayPause, onPlayPause) ||
                other.onPlayPause == onPlayPause) &&
            (identical(other.onSeek, onSeek) || other.onSeek == onSeek) &&
            (identical(other.onVolumeChange, onVolumeChange) ||
                other.onVolumeChange == onVolumeChange) &&
            (identical(other.onClose, onClose) || other.onClose == onClose));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    variant,
    state,
    const DeepCollectionEquality().hash(_items),
    initialIndex,
    showCaptions,
    showControls,
    showIndicators,
    allowZoom,
    allowFullscreen,
    autoPlay,
    loop,
    muted,
    colors,
    spacing,
    elevation,
    behavior,
    animation,
    controls,
    a11yConfig,
    onPageChanged,
    onItemTap,
    onFullscreenToggle,
    onPlayPause,
    onSeek,
    onVolumeChange,
    onClose,
  ]);

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerConfigImplCopyWith<_$DSMediaViewerConfigImpl> get copyWith =>
      __$$DSMediaViewerConfigImplCopyWithImpl<_$DSMediaViewerConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerConfig implements DSMediaViewerConfig {
  const factory _DSMediaViewerConfig({
    final DSMediaViewerVariant variant,
    final DSMediaViewerState state,
    final List<DSMediaItem> items,
    final int initialIndex,
    final bool showCaptions,
    final bool showControls,
    final bool showIndicators,
    final bool allowZoom,
    final bool allowFullscreen,
    final bool autoPlay,
    final bool loop,
    final bool muted,
    final DSMediaViewerColors? colors,
    final DSMediaViewerSpacing? spacing,
    final DSMediaViewerElevation? elevation,
    final DSMediaViewerBehavior? behavior,
    final DSMediaViewerAnimation? animation,
    final DSMediaViewerControls? controls,
    final DSMediaViewerA11yConfig? a11yConfig,
    final ValueChanged<int>? onPageChanged,
    final ValueChanged<DSMediaItem>? onItemTap,
    final VoidCallback? onFullscreenToggle,
    final ValueChanged<bool>? onPlayPause,
    final ValueChanged<double>? onSeek,
    final ValueChanged<double>? onVolumeChange,
    final VoidCallback? onClose,
  }) = _$DSMediaViewerConfigImpl;

  /// Variante del componente media viewer
  @override
  DSMediaViewerVariant get variant;

  /// Estado actual del componente
  @override
  DSMediaViewerState get state;

  /// Lista de elementos de media para mostrar
  @override
  List<DSMediaItem> get items;

  /// Índice inicial del elemento a mostrar
  @override
  int get initialIndex;

  /// Si mostrar captions/subtítulos
  @override
  bool get showCaptions;

  /// Si mostrar controles de navegación
  @override
  bool get showControls;

  /// Si mostrar indicadores de página/posición
  @override
  bool get showIndicators;

  /// Si permitir zoom en imágenes
  @override
  bool get allowZoom;

  /// Si permitir pantalla completa
  @override
  bool get allowFullscreen;

  /// Si reproducir automáticamente videos/audio
  @override
  bool get autoPlay;

  /// Si hacer loop en videos/audio
  @override
  bool get loop;

  /// Si silenciar por defecto
  @override
  bool get muted;

  /// Configuración de colores
  @override
  DSMediaViewerColors? get colors;

  /// Configuración de espaciado y dimensiones
  @override
  DSMediaViewerSpacing? get spacing;

  /// Configuración de elevación y sombras
  @override
  DSMediaViewerElevation? get elevation;

  /// Configuración de comportamiento
  @override
  DSMediaViewerBehavior? get behavior;

  /// Configuración de animaciones
  @override
  DSMediaViewerAnimation? get animation;

  /// Configuración de controles
  @override
  DSMediaViewerControls? get controls;

  /// Configuración de accesibilidad
  @override
  DSMediaViewerA11yConfig? get a11yConfig;

  /// Callbacks de interacción
  @override
  ValueChanged<int>? get onPageChanged;
  @override
  ValueChanged<DSMediaItem>? get onItemTap;
  @override
  VoidCallback? get onFullscreenToggle;
  @override
  ValueChanged<bool>? get onPlayPause;
  @override
  ValueChanged<double>? get onSeek;
  @override
  ValueChanged<double>? get onVolumeChange;
  @override
  VoidCallback? get onClose;

  /// Create a copy of DSMediaViewerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerConfigImplCopyWith<_$DSMediaViewerConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaItem {
  /// Tipo de media
  DSMediaType get type => throw _privateConstructorUsedError;

  /// URL o path del archivo
  String get src => throw _privateConstructorUsedError;

  /// URL de thumbnail/preview
  String? get thumbnail => throw _privateConstructorUsedError;

  /// Caption/subtítulo
  String? get caption => throw _privateConstructorUsedError;

  /// Texto alternativo para accesibilidad
  String? get alt => throw _privateConstructorUsedError;

  /// Duración en segundos (para video/audio)
  double? get duration => throw _privateConstructorUsedError;

  /// Dimensiones originales
  Size? get dimensions => throw _privateConstructorUsedError;

  /// Metadatos adicionales
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaItemCopyWith<DSMediaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaItemCopyWith<$Res> {
  factory $DSMediaItemCopyWith(
    DSMediaItem value,
    $Res Function(DSMediaItem) then,
  ) = _$DSMediaItemCopyWithImpl<$Res, DSMediaItem>;
  @useResult
  $Res call({
    DSMediaType type,
    String src,
    String? thumbnail,
    String? caption,
    String? alt,
    double? duration,
    Size? dimensions,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$DSMediaItemCopyWithImpl<$Res, $Val extends DSMediaItem>
    implements $DSMediaItemCopyWith<$Res> {
  _$DSMediaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? src = null,
    Object? thumbnail = freezed,
    Object? caption = freezed,
    Object? alt = freezed,
    Object? duration = freezed,
    Object? dimensions = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSMediaType,
            src: null == src
                ? _value.src
                : src // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnail: freezed == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String?,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            alt: freezed == alt
                ? _value.alt
                : alt // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as double?,
            dimensions: freezed == dimensions
                ? _value.dimensions
                : dimensions // ignore: cast_nullable_to_non_nullable
                      as Size?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMediaItemImplCopyWith<$Res>
    implements $DSMediaItemCopyWith<$Res> {
  factory _$$DSMediaItemImplCopyWith(
    _$DSMediaItemImpl value,
    $Res Function(_$DSMediaItemImpl) then,
  ) = __$$DSMediaItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSMediaType type,
    String src,
    String? thumbnail,
    String? caption,
    String? alt,
    double? duration,
    Size? dimensions,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$DSMediaItemImplCopyWithImpl<$Res>
    extends _$DSMediaItemCopyWithImpl<$Res, _$DSMediaItemImpl>
    implements _$$DSMediaItemImplCopyWith<$Res> {
  __$$DSMediaItemImplCopyWithImpl(
    _$DSMediaItemImpl _value,
    $Res Function(_$DSMediaItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? src = null,
    Object? thumbnail = freezed,
    Object? caption = freezed,
    Object? alt = freezed,
    Object? duration = freezed,
    Object? dimensions = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$DSMediaItemImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSMediaType,
        src: null == src
            ? _value.src
            : src // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: freezed == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String?,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        alt: freezed == alt
            ? _value.alt
            : alt // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as double?,
        dimensions: freezed == dimensions
            ? _value.dimensions
            : dimensions // ignore: cast_nullable_to_non_nullable
                  as Size?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaItemImpl implements _DSMediaItem {
  const _$DSMediaItemImpl({
    required this.type,
    required this.src,
    this.thumbnail,
    this.caption,
    this.alt,
    this.duration,
    this.dimensions,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  /// Tipo de media
  @override
  final DSMediaType type;

  /// URL o path del archivo
  @override
  final String src;

  /// URL de thumbnail/preview
  @override
  final String? thumbnail;

  /// Caption/subtítulo
  @override
  final String? caption;

  /// Texto alternativo para accesibilidad
  @override
  final String? alt;

  /// Duración en segundos (para video/audio)
  @override
  final double? duration;

  /// Dimensiones originales
  @override
  final Size? dimensions;

  /// Metadatos adicionales
  final Map<String, dynamic>? _metadata;

  /// Metadatos adicionales
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
    return 'DSMediaItem(type: $type, src: $src, thumbnail: $thumbnail, caption: $caption, alt: $alt, duration: $duration, dimensions: $dimensions, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    src,
    thumbnail,
    caption,
    alt,
    duration,
    dimensions,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of DSMediaItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaItemImplCopyWith<_$DSMediaItemImpl> get copyWith =>
      __$$DSMediaItemImplCopyWithImpl<_$DSMediaItemImpl>(this, _$identity);
}

abstract class _DSMediaItem implements DSMediaItem {
  const factory _DSMediaItem({
    required final DSMediaType type,
    required final String src,
    final String? thumbnail,
    final String? caption,
    final String? alt,
    final double? duration,
    final Size? dimensions,
    final Map<String, dynamic>? metadata,
  }) = _$DSMediaItemImpl;

  /// Tipo de media
  @override
  DSMediaType get type;

  /// URL o path del archivo
  @override
  String get src;

  /// URL de thumbnail/preview
  @override
  String? get thumbnail;

  /// Caption/subtítulo
  @override
  String? get caption;

  /// Texto alternativo para accesibilidad
  @override
  String? get alt;

  /// Duración en segundos (para video/audio)
  @override
  double? get duration;

  /// Dimensiones originales
  @override
  Size? get dimensions;

  /// Metadatos adicionales
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of DSMediaItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaItemImplCopyWith<_$DSMediaItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerColors {
  /// Color de fondo del viewer
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color de fondo de los controles
  Color? get controlsBackgroundColor => throw _privateConstructorUsedError;

  /// Color de los iconos de control
  Color? get controlsIconColor => throw _privateConstructorUsedError;

  /// Color del texto de los controles
  Color? get controlsTextColor => throw _privateConstructorUsedError;

  /// Color de fondo del overlay
  Color? get overlayBackgroundColor => throw _privateConstructorUsedError;

  /// Color de los indicadores activos
  Color? get activeIndicatorColor => throw _privateConstructorUsedError;

  /// Color de los indicadores inactivos
  Color? get inactiveIndicatorColor => throw _privateConstructorUsedError;

  /// Color del borde
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Color de la sombra
  Color? get shadowColor => throw _privateConstructorUsedError;

  /// Color en hover
  Color? get hoverColor => throw _privateConstructorUsedError;

  /// Color cuando presionado
  Color? get pressedColor => throw _privateConstructorUsedError;

  /// Color cuando enfocado
  Color? get focusColor => throw _privateConstructorUsedError;

  /// Color cuando seleccionado
  Color? get selectedColor => throw _privateConstructorUsedError;

  /// Color cuando deshabilitado
  Color? get disabledColor => throw _privateConstructorUsedError;

  /// Color de loading
  Color? get loadingColor => throw _privateConstructorUsedError;

  /// Color del skeleton
  Color? get skeletonColor => throw _privateConstructorUsedError;

  /// Color del caption/subtítulo
  Color? get captionTextColor => throw _privateConstructorUsedError;

  /// Color de fondo del caption
  Color? get captionBackgroundColor => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerColorsCopyWith<DSMediaViewerColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerColorsCopyWith<$Res> {
  factory $DSMediaViewerColorsCopyWith(
    DSMediaViewerColors value,
    $Res Function(DSMediaViewerColors) then,
  ) = _$DSMediaViewerColorsCopyWithImpl<$Res, DSMediaViewerColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? controlsBackgroundColor,
    Color? controlsIconColor,
    Color? controlsTextColor,
    Color? overlayBackgroundColor,
    Color? activeIndicatorColor,
    Color? inactiveIndicatorColor,
    Color? borderColor,
    Color? shadowColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? captionTextColor,
    Color? captionBackgroundColor,
  });
}

/// @nodoc
class _$DSMediaViewerColorsCopyWithImpl<$Res, $Val extends DSMediaViewerColors>
    implements $DSMediaViewerColorsCopyWith<$Res> {
  _$DSMediaViewerColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? controlsBackgroundColor = freezed,
    Object? controlsIconColor = freezed,
    Object? controlsTextColor = freezed,
    Object? overlayBackgroundColor = freezed,
    Object? activeIndicatorColor = freezed,
    Object? inactiveIndicatorColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonColor = freezed,
    Object? captionTextColor = freezed,
    Object? captionBackgroundColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            controlsBackgroundColor: freezed == controlsBackgroundColor
                ? _value.controlsBackgroundColor
                : controlsBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            controlsIconColor: freezed == controlsIconColor
                ? _value.controlsIconColor
                : controlsIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            controlsTextColor: freezed == controlsTextColor
                ? _value.controlsTextColor
                : controlsTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            overlayBackgroundColor: freezed == overlayBackgroundColor
                ? _value.overlayBackgroundColor
                : overlayBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            activeIndicatorColor: freezed == activeIndicatorColor
                ? _value.activeIndicatorColor
                : activeIndicatorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            inactiveIndicatorColor: freezed == inactiveIndicatorColor
                ? _value.inactiveIndicatorColor
                : inactiveIndicatorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
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
            skeletonColor: freezed == skeletonColor
                ? _value.skeletonColor
                : skeletonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            captionTextColor: freezed == captionTextColor
                ? _value.captionTextColor
                : captionTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            captionBackgroundColor: freezed == captionBackgroundColor
                ? _value.captionBackgroundColor
                : captionBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMediaViewerColorsImplCopyWith<$Res>
    implements $DSMediaViewerColorsCopyWith<$Res> {
  factory _$$DSMediaViewerColorsImplCopyWith(
    _$DSMediaViewerColorsImpl value,
    $Res Function(_$DSMediaViewerColorsImpl) then,
  ) = __$$DSMediaViewerColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? controlsBackgroundColor,
    Color? controlsIconColor,
    Color? controlsTextColor,
    Color? overlayBackgroundColor,
    Color? activeIndicatorColor,
    Color? inactiveIndicatorColor,
    Color? borderColor,
    Color? shadowColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? captionTextColor,
    Color? captionBackgroundColor,
  });
}

/// @nodoc
class __$$DSMediaViewerColorsImplCopyWithImpl<$Res>
    extends _$DSMediaViewerColorsCopyWithImpl<$Res, _$DSMediaViewerColorsImpl>
    implements _$$DSMediaViewerColorsImplCopyWith<$Res> {
  __$$DSMediaViewerColorsImplCopyWithImpl(
    _$DSMediaViewerColorsImpl _value,
    $Res Function(_$DSMediaViewerColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? controlsBackgroundColor = freezed,
    Object? controlsIconColor = freezed,
    Object? controlsTextColor = freezed,
    Object? overlayBackgroundColor = freezed,
    Object? activeIndicatorColor = freezed,
    Object? inactiveIndicatorColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonColor = freezed,
    Object? captionTextColor = freezed,
    Object? captionBackgroundColor = freezed,
  }) {
    return _then(
      _$DSMediaViewerColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlsBackgroundColor: freezed == controlsBackgroundColor
            ? _value.controlsBackgroundColor
            : controlsBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlsIconColor: freezed == controlsIconColor
            ? _value.controlsIconColor
            : controlsIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlsTextColor: freezed == controlsTextColor
            ? _value.controlsTextColor
            : controlsTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        overlayBackgroundColor: freezed == overlayBackgroundColor
            ? _value.overlayBackgroundColor
            : overlayBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        activeIndicatorColor: freezed == activeIndicatorColor
            ? _value.activeIndicatorColor
            : activeIndicatorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inactiveIndicatorColor: freezed == inactiveIndicatorColor
            ? _value.inactiveIndicatorColor
            : inactiveIndicatorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
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
        skeletonColor: freezed == skeletonColor
            ? _value.skeletonColor
            : skeletonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        captionTextColor: freezed == captionTextColor
            ? _value.captionTextColor
            : captionTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        captionBackgroundColor: freezed == captionBackgroundColor
            ? _value.captionBackgroundColor
            : captionBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerColorsImpl implements _DSMediaViewerColors {
  const _$DSMediaViewerColorsImpl({
    this.backgroundColor,
    this.controlsBackgroundColor,
    this.controlsIconColor,
    this.controlsTextColor,
    this.overlayBackgroundColor,
    this.activeIndicatorColor,
    this.inactiveIndicatorColor,
    this.borderColor,
    this.shadowColor,
    this.hoverColor,
    this.pressedColor,
    this.focusColor,
    this.selectedColor,
    this.disabledColor,
    this.loadingColor,
    this.skeletonColor,
    this.captionTextColor,
    this.captionBackgroundColor,
  });

  /// Color de fondo del viewer
  @override
  final Color? backgroundColor;

  /// Color de fondo de los controles
  @override
  final Color? controlsBackgroundColor;

  /// Color de los iconos de control
  @override
  final Color? controlsIconColor;

  /// Color del texto de los controles
  @override
  final Color? controlsTextColor;

  /// Color de fondo del overlay
  @override
  final Color? overlayBackgroundColor;

  /// Color de los indicadores activos
  @override
  final Color? activeIndicatorColor;

  /// Color de los indicadores inactivos
  @override
  final Color? inactiveIndicatorColor;

  /// Color del borde
  @override
  final Color? borderColor;

  /// Color de la sombra
  @override
  final Color? shadowColor;

  /// Color en hover
  @override
  final Color? hoverColor;

  /// Color cuando presionado
  @override
  final Color? pressedColor;

  /// Color cuando enfocado
  @override
  final Color? focusColor;

  /// Color cuando seleccionado
  @override
  final Color? selectedColor;

  /// Color cuando deshabilitado
  @override
  final Color? disabledColor;

  /// Color de loading
  @override
  final Color? loadingColor;

  /// Color del skeleton
  @override
  final Color? skeletonColor;

  /// Color del caption/subtítulo
  @override
  final Color? captionTextColor;

  /// Color de fondo del caption
  @override
  final Color? captionBackgroundColor;

  @override
  String toString() {
    return 'DSMediaViewerColors(backgroundColor: $backgroundColor, controlsBackgroundColor: $controlsBackgroundColor, controlsIconColor: $controlsIconColor, controlsTextColor: $controlsTextColor, overlayBackgroundColor: $overlayBackgroundColor, activeIndicatorColor: $activeIndicatorColor, inactiveIndicatorColor: $inactiveIndicatorColor, borderColor: $borderColor, shadowColor: $shadowColor, hoverColor: $hoverColor, pressedColor: $pressedColor, focusColor: $focusColor, selectedColor: $selectedColor, disabledColor: $disabledColor, loadingColor: $loadingColor, skeletonColor: $skeletonColor, captionTextColor: $captionTextColor, captionBackgroundColor: $captionBackgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(
                  other.controlsBackgroundColor,
                  controlsBackgroundColor,
                ) ||
                other.controlsBackgroundColor == controlsBackgroundColor) &&
            (identical(other.controlsIconColor, controlsIconColor) ||
                other.controlsIconColor == controlsIconColor) &&
            (identical(other.controlsTextColor, controlsTextColor) ||
                other.controlsTextColor == controlsTextColor) &&
            (identical(other.overlayBackgroundColor, overlayBackgroundColor) ||
                other.overlayBackgroundColor == overlayBackgroundColor) &&
            (identical(other.activeIndicatorColor, activeIndicatorColor) ||
                other.activeIndicatorColor == activeIndicatorColor) &&
            (identical(other.inactiveIndicatorColor, inactiveIndicatorColor) ||
                other.inactiveIndicatorColor == inactiveIndicatorColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
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
            (identical(other.skeletonColor, skeletonColor) ||
                other.skeletonColor == skeletonColor) &&
            (identical(other.captionTextColor, captionTextColor) ||
                other.captionTextColor == captionTextColor) &&
            (identical(other.captionBackgroundColor, captionBackgroundColor) ||
                other.captionBackgroundColor == captionBackgroundColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    controlsBackgroundColor,
    controlsIconColor,
    controlsTextColor,
    overlayBackgroundColor,
    activeIndicatorColor,
    inactiveIndicatorColor,
    borderColor,
    shadowColor,
    hoverColor,
    pressedColor,
    focusColor,
    selectedColor,
    disabledColor,
    loadingColor,
    skeletonColor,
    captionTextColor,
    captionBackgroundColor,
  );

  /// Create a copy of DSMediaViewerColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerColorsImplCopyWith<_$DSMediaViewerColorsImpl> get copyWith =>
      __$$DSMediaViewerColorsImplCopyWithImpl<_$DSMediaViewerColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerColors implements DSMediaViewerColors {
  const factory _DSMediaViewerColors({
    final Color? backgroundColor,
    final Color? controlsBackgroundColor,
    final Color? controlsIconColor,
    final Color? controlsTextColor,
    final Color? overlayBackgroundColor,
    final Color? activeIndicatorColor,
    final Color? inactiveIndicatorColor,
    final Color? borderColor,
    final Color? shadowColor,
    final Color? hoverColor,
    final Color? pressedColor,
    final Color? focusColor,
    final Color? selectedColor,
    final Color? disabledColor,
    final Color? loadingColor,
    final Color? skeletonColor,
    final Color? captionTextColor,
    final Color? captionBackgroundColor,
  }) = _$DSMediaViewerColorsImpl;

  /// Color de fondo del viewer
  @override
  Color? get backgroundColor;

  /// Color de fondo de los controles
  @override
  Color? get controlsBackgroundColor;

  /// Color de los iconos de control
  @override
  Color? get controlsIconColor;

  /// Color del texto de los controles
  @override
  Color? get controlsTextColor;

  /// Color de fondo del overlay
  @override
  Color? get overlayBackgroundColor;

  /// Color de los indicadores activos
  @override
  Color? get activeIndicatorColor;

  /// Color de los indicadores inactivos
  @override
  Color? get inactiveIndicatorColor;

  /// Color del borde
  @override
  Color? get borderColor;

  /// Color de la sombra
  @override
  Color? get shadowColor;

  /// Color en hover
  @override
  Color? get hoverColor;

  /// Color cuando presionado
  @override
  Color? get pressedColor;

  /// Color cuando enfocado
  @override
  Color? get focusColor;

  /// Color cuando seleccionado
  @override
  Color? get selectedColor;

  /// Color cuando deshabilitado
  @override
  Color? get disabledColor;

  /// Color de loading
  @override
  Color? get loadingColor;

  /// Color del skeleton
  @override
  Color? get skeletonColor;

  /// Color del caption/subtítulo
  @override
  Color? get captionTextColor;

  /// Color de fondo del caption
  @override
  Color? get captionBackgroundColor;

  /// Create a copy of DSMediaViewerColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerColorsImplCopyWith<_$DSMediaViewerColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerSpacing {
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

  /// Espaciado entre controles
  double get controlsSpacing => throw _privateConstructorUsedError;

  /// Tamaño de los iconos de control
  double get controlsIconSize => throw _privateConstructorUsedError;

  /// Altura de la barra de controles
  double get controlsBarHeight => throw _privateConstructorUsedError;

  /// Tamaño de los indicadores
  double get indicatorSize => throw _privateConstructorUsedError;

  /// Espaciado entre indicadores
  double get indicatorSpacing => throw _privateConstructorUsedError;

  /// Padding del caption
  EdgeInsets get captionPadding => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerSpacingCopyWith<DSMediaViewerSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerSpacingCopyWith<$Res> {
  factory $DSMediaViewerSpacingCopyWith(
    DSMediaViewerSpacing value,
    $Res Function(DSMediaViewerSpacing) then,
  ) = _$DSMediaViewerSpacingCopyWithImpl<$Res, DSMediaViewerSpacing>;
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
    double controlsSpacing,
    double controlsIconSize,
    double controlsBarHeight,
    double indicatorSize,
    double indicatorSpacing,
    EdgeInsets captionPadding,
  });
}

/// @nodoc
class _$DSMediaViewerSpacingCopyWithImpl<
  $Res,
  $Val extends DSMediaViewerSpacing
>
    implements $DSMediaViewerSpacingCopyWith<$Res> {
  _$DSMediaViewerSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerSpacing
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
    Object? controlsSpacing = null,
    Object? controlsIconSize = null,
    Object? controlsBarHeight = null,
    Object? indicatorSize = null,
    Object? indicatorSpacing = null,
    Object? captionPadding = null,
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
            controlsSpacing: null == controlsSpacing
                ? _value.controlsSpacing
                : controlsSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            controlsIconSize: null == controlsIconSize
                ? _value.controlsIconSize
                : controlsIconSize // ignore: cast_nullable_to_non_nullable
                      as double,
            controlsBarHeight: null == controlsBarHeight
                ? _value.controlsBarHeight
                : controlsBarHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            indicatorSize: null == indicatorSize
                ? _value.indicatorSize
                : indicatorSize // ignore: cast_nullable_to_non_nullable
                      as double,
            indicatorSpacing: null == indicatorSpacing
                ? _value.indicatorSpacing
                : indicatorSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            captionPadding: null == captionPadding
                ? _value.captionPadding
                : captionPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMediaViewerSpacingImplCopyWith<$Res>
    implements $DSMediaViewerSpacingCopyWith<$Res> {
  factory _$$DSMediaViewerSpacingImplCopyWith(
    _$DSMediaViewerSpacingImpl value,
    $Res Function(_$DSMediaViewerSpacingImpl) then,
  ) = __$$DSMediaViewerSpacingImplCopyWithImpl<$Res>;
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
    double controlsSpacing,
    double controlsIconSize,
    double controlsBarHeight,
    double indicatorSize,
    double indicatorSpacing,
    EdgeInsets captionPadding,
  });
}

/// @nodoc
class __$$DSMediaViewerSpacingImplCopyWithImpl<$Res>
    extends _$DSMediaViewerSpacingCopyWithImpl<$Res, _$DSMediaViewerSpacingImpl>
    implements _$$DSMediaViewerSpacingImplCopyWith<$Res> {
  __$$DSMediaViewerSpacingImplCopyWithImpl(
    _$DSMediaViewerSpacingImpl _value,
    $Res Function(_$DSMediaViewerSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerSpacing
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
    Object? controlsSpacing = null,
    Object? controlsIconSize = null,
    Object? controlsBarHeight = null,
    Object? indicatorSize = null,
    Object? indicatorSpacing = null,
    Object? captionPadding = null,
  }) {
    return _then(
      _$DSMediaViewerSpacingImpl(
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
        controlsSpacing: null == controlsSpacing
            ? _value.controlsSpacing
            : controlsSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        controlsIconSize: null == controlsIconSize
            ? _value.controlsIconSize
            : controlsIconSize // ignore: cast_nullable_to_non_nullable
                  as double,
        controlsBarHeight: null == controlsBarHeight
            ? _value.controlsBarHeight
            : controlsBarHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        indicatorSize: null == indicatorSize
            ? _value.indicatorSize
            : indicatorSize // ignore: cast_nullable_to_non_nullable
                  as double,
        indicatorSpacing: null == indicatorSpacing
            ? _value.indicatorSpacing
            : indicatorSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        captionPadding: null == captionPadding
            ? _value.captionPadding
            : captionPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerSpacingImpl implements _DSMediaViewerSpacing {
  const _$DSMediaViewerSpacingImpl({
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 12.0,
    this.borderWidth = 0.0,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.controlsSpacing = 16.0,
    this.controlsIconSize = 24.0,
    this.controlsBarHeight = 56.0,
    this.indicatorSize = 8.0,
    this.indicatorSpacing = 8.0,
    this.captionPadding = const EdgeInsets.all(16.0),
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

  /// Espaciado entre controles
  @override
  @JsonKey()
  final double controlsSpacing;

  /// Tamaño de los iconos de control
  @override
  @JsonKey()
  final double controlsIconSize;

  /// Altura de la barra de controles
  @override
  @JsonKey()
  final double controlsBarHeight;

  /// Tamaño de los indicadores
  @override
  @JsonKey()
  final double indicatorSize;

  /// Espaciado entre indicadores
  @override
  @JsonKey()
  final double indicatorSpacing;

  /// Padding del caption
  @override
  @JsonKey()
  final EdgeInsets captionPadding;

  @override
  String toString() {
    return 'DSMediaViewerSpacing(width: $width, height: $height, padding: $padding, margin: $margin, borderRadius: $borderRadius, borderWidth: $borderWidth, minWidth: $minWidth, minHeight: $minHeight, maxWidth: $maxWidth, maxHeight: $maxHeight, controlsSpacing: $controlsSpacing, controlsIconSize: $controlsIconSize, controlsBarHeight: $controlsBarHeight, indicatorSize: $indicatorSize, indicatorSpacing: $indicatorSpacing, captionPadding: $captionPadding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerSpacingImpl &&
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
            (identical(other.controlsSpacing, controlsSpacing) ||
                other.controlsSpacing == controlsSpacing) &&
            (identical(other.controlsIconSize, controlsIconSize) ||
                other.controlsIconSize == controlsIconSize) &&
            (identical(other.controlsBarHeight, controlsBarHeight) ||
                other.controlsBarHeight == controlsBarHeight) &&
            (identical(other.indicatorSize, indicatorSize) ||
                other.indicatorSize == indicatorSize) &&
            (identical(other.indicatorSpacing, indicatorSpacing) ||
                other.indicatorSpacing == indicatorSpacing) &&
            (identical(other.captionPadding, captionPadding) ||
                other.captionPadding == captionPadding));
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
    controlsSpacing,
    controlsIconSize,
    controlsBarHeight,
    indicatorSize,
    indicatorSpacing,
    captionPadding,
  );

  /// Create a copy of DSMediaViewerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerSpacingImplCopyWith<_$DSMediaViewerSpacingImpl>
  get copyWith =>
      __$$DSMediaViewerSpacingImplCopyWithImpl<_$DSMediaViewerSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerSpacing implements DSMediaViewerSpacing {
  const factory _DSMediaViewerSpacing({
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
    final double controlsSpacing,
    final double controlsIconSize,
    final double controlsBarHeight,
    final double indicatorSize,
    final double indicatorSpacing,
    final EdgeInsets captionPadding,
  }) = _$DSMediaViewerSpacingImpl;

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

  /// Espaciado entre controles
  @override
  double get controlsSpacing;

  /// Tamaño de los iconos de control
  @override
  double get controlsIconSize;

  /// Altura de la barra de controles
  @override
  double get controlsBarHeight;

  /// Tamaño de los indicadores
  @override
  double get indicatorSize;

  /// Espaciado entre indicadores
  @override
  double get indicatorSpacing;

  /// Padding del caption
  @override
  EdgeInsets get captionPadding;

  /// Create a copy of DSMediaViewerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerSpacingImplCopyWith<_$DSMediaViewerSpacingImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerElevation {
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

  /// Elevación de los controles
  double get controlsElevation => throw _privateConstructorUsedError;

  /// Color de la sombra
  Color? get shadowColor => throw _privateConstructorUsedError;

  /// Color de tinte de superficie
  Color? get surfaceTintColor => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerElevationCopyWith<DSMediaViewerElevation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerElevationCopyWith<$Res> {
  factory $DSMediaViewerElevationCopyWith(
    DSMediaViewerElevation value,
    $Res Function(DSMediaViewerElevation) then,
  ) = _$DSMediaViewerElevationCopyWithImpl<$Res, DSMediaViewerElevation>;
  @useResult
  $Res call({
    double defaultElevation,
    double hoveredElevation,
    double pressedElevation,
    double focusedElevation,
    double selectedElevation,
    double disabledElevation,
    double controlsElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class _$DSMediaViewerElevationCopyWithImpl<
  $Res,
  $Val extends DSMediaViewerElevation
>
    implements $DSMediaViewerElevationCopyWith<$Res> {
  _$DSMediaViewerElevationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerElevation
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
    Object? controlsElevation = null,
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
            controlsElevation: null == controlsElevation
                ? _value.controlsElevation
                : controlsElevation // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSMediaViewerElevationImplCopyWith<$Res>
    implements $DSMediaViewerElevationCopyWith<$Res> {
  factory _$$DSMediaViewerElevationImplCopyWith(
    _$DSMediaViewerElevationImpl value,
    $Res Function(_$DSMediaViewerElevationImpl) then,
  ) = __$$DSMediaViewerElevationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double defaultElevation,
    double hoveredElevation,
    double pressedElevation,
    double focusedElevation,
    double selectedElevation,
    double disabledElevation,
    double controlsElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class __$$DSMediaViewerElevationImplCopyWithImpl<$Res>
    extends
        _$DSMediaViewerElevationCopyWithImpl<$Res, _$DSMediaViewerElevationImpl>
    implements _$$DSMediaViewerElevationImplCopyWith<$Res> {
  __$$DSMediaViewerElevationImplCopyWithImpl(
    _$DSMediaViewerElevationImpl _value,
    $Res Function(_$DSMediaViewerElevationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerElevation
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
    Object? controlsElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _$DSMediaViewerElevationImpl(
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
        controlsElevation: null == controlsElevation
            ? _value.controlsElevation
            : controlsElevation // ignore: cast_nullable_to_non_nullable
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

class _$DSMediaViewerElevationImpl implements _DSMediaViewerElevation {
  const _$DSMediaViewerElevationImpl({
    this.defaultElevation = 0.0,
    this.hoveredElevation = 2.0,
    this.pressedElevation = 1.0,
    this.focusedElevation = 3.0,
    this.selectedElevation = 4.0,
    this.disabledElevation = 0.0,
    this.controlsElevation = 8.0,
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

  /// Elevación de los controles
  @override
  @JsonKey()
  final double controlsElevation;

  /// Color de la sombra
  @override
  final Color? shadowColor;

  /// Color de tinte de superficie
  @override
  final Color? surfaceTintColor;

  @override
  String toString() {
    return 'DSMediaViewerElevation(defaultElevation: $defaultElevation, hoveredElevation: $hoveredElevation, pressedElevation: $pressedElevation, focusedElevation: $focusedElevation, selectedElevation: $selectedElevation, disabledElevation: $disabledElevation, controlsElevation: $controlsElevation, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerElevationImpl &&
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
            (identical(other.controlsElevation, controlsElevation) ||
                other.controlsElevation == controlsElevation) &&
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
    controlsElevation,
    shadowColor,
    surfaceTintColor,
  );

  /// Create a copy of DSMediaViewerElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerElevationImplCopyWith<_$DSMediaViewerElevationImpl>
  get copyWith =>
      __$$DSMediaViewerElevationImplCopyWithImpl<_$DSMediaViewerElevationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerElevation implements DSMediaViewerElevation {
  const factory _DSMediaViewerElevation({
    final double defaultElevation,
    final double hoveredElevation,
    final double pressedElevation,
    final double focusedElevation,
    final double selectedElevation,
    final double disabledElevation,
    final double controlsElevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
  }) = _$DSMediaViewerElevationImpl;

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

  /// Elevación de los controles
  @override
  double get controlsElevation;

  /// Color de la sombra
  @override
  Color? get shadowColor;

  /// Color de tinte de superficie
  @override
  Color? get surfaceTintColor;

  /// Create a copy of DSMediaViewerElevation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerElevationImplCopyWith<_$DSMediaViewerElevationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerBehavior {
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
  DSMediaViewerClipBehavior get clipBehavior =>
      throw _privateConstructorUsedError;

  /// Duración de animaciones en milisegundos
  int get animationDuration => throw _privateConstructorUsedError;

  /// Mostrar indicador de carga
  bool get showLoadingIndicator => throw _privateConstructorUsedError;

  /// Mostrar animación skeleton
  bool get showSkeletonAnimation => throw _privateConstructorUsedError;

  /// Ocultar controles automáticamente
  bool get autoHideControls => throw _privateConstructorUsedError;

  /// Tiempo para ocultar controles (segundos)
  int get autoHideControlsDelay => throw _privateConstructorUsedError;

  /// Permitir gestos de swipe
  bool get enableSwipeGestures => throw _privateConstructorUsedError;

  /// Permitir doble tap para zoom
  bool get enableDoubleTapZoom => throw _privateConstructorUsedError;

  /// Permitir pinch to zoom
  bool get enablePinchZoom => throw _privateConstructorUsedError;

  /// Zoom mínimo
  double get minZoom => throw _privateConstructorUsedError;

  /// Zoom máximo
  double get maxZoom => throw _privateConstructorUsedError;

  /// Velocidad de scroll para cambiar página
  double get pageChangeThreshold => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerBehaviorCopyWith<DSMediaViewerBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerBehaviorCopyWith<$Res> {
  factory $DSMediaViewerBehaviorCopyWith(
    DSMediaViewerBehavior value,
    $Res Function(DSMediaViewerBehavior) then,
  ) = _$DSMediaViewerBehaviorCopyWithImpl<$Res, DSMediaViewerBehavior>;
  @useResult
  $Res call({
    bool enableHapticFeedback,
    bool enableRipple,
    bool enableHover,
    bool enableFocus,
    bool maintainState,
    DSMediaViewerClipBehavior clipBehavior,
    int animationDuration,
    bool showLoadingIndicator,
    bool showSkeletonAnimation,
    bool autoHideControls,
    int autoHideControlsDelay,
    bool enableSwipeGestures,
    bool enableDoubleTapZoom,
    bool enablePinchZoom,
    double minZoom,
    double maxZoom,
    double pageChangeThreshold,
  });
}

/// @nodoc
class _$DSMediaViewerBehaviorCopyWithImpl<
  $Res,
  $Val extends DSMediaViewerBehavior
>
    implements $DSMediaViewerBehaviorCopyWith<$Res> {
  _$DSMediaViewerBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerBehavior
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
    Object? autoHideControls = null,
    Object? autoHideControlsDelay = null,
    Object? enableSwipeGestures = null,
    Object? enableDoubleTapZoom = null,
    Object? enablePinchZoom = null,
    Object? minZoom = null,
    Object? maxZoom = null,
    Object? pageChangeThreshold = null,
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
                      as DSMediaViewerClipBehavior,
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
            autoHideControls: null == autoHideControls
                ? _value.autoHideControls
                : autoHideControls // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoHideControlsDelay: null == autoHideControlsDelay
                ? _value.autoHideControlsDelay
                : autoHideControlsDelay // ignore: cast_nullable_to_non_nullable
                      as int,
            enableSwipeGestures: null == enableSwipeGestures
                ? _value.enableSwipeGestures
                : enableSwipeGestures // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableDoubleTapZoom: null == enableDoubleTapZoom
                ? _value.enableDoubleTapZoom
                : enableDoubleTapZoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            enablePinchZoom: null == enablePinchZoom
                ? _value.enablePinchZoom
                : enablePinchZoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            minZoom: null == minZoom
                ? _value.minZoom
                : minZoom // ignore: cast_nullable_to_non_nullable
                      as double,
            maxZoom: null == maxZoom
                ? _value.maxZoom
                : maxZoom // ignore: cast_nullable_to_non_nullable
                      as double,
            pageChangeThreshold: null == pageChangeThreshold
                ? _value.pageChangeThreshold
                : pageChangeThreshold // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMediaViewerBehaviorImplCopyWith<$Res>
    implements $DSMediaViewerBehaviorCopyWith<$Res> {
  factory _$$DSMediaViewerBehaviorImplCopyWith(
    _$DSMediaViewerBehaviorImpl value,
    $Res Function(_$DSMediaViewerBehaviorImpl) then,
  ) = __$$DSMediaViewerBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enableHapticFeedback,
    bool enableRipple,
    bool enableHover,
    bool enableFocus,
    bool maintainState,
    DSMediaViewerClipBehavior clipBehavior,
    int animationDuration,
    bool showLoadingIndicator,
    bool showSkeletonAnimation,
    bool autoHideControls,
    int autoHideControlsDelay,
    bool enableSwipeGestures,
    bool enableDoubleTapZoom,
    bool enablePinchZoom,
    double minZoom,
    double maxZoom,
    double pageChangeThreshold,
  });
}

/// @nodoc
class __$$DSMediaViewerBehaviorImplCopyWithImpl<$Res>
    extends
        _$DSMediaViewerBehaviorCopyWithImpl<$Res, _$DSMediaViewerBehaviorImpl>
    implements _$$DSMediaViewerBehaviorImplCopyWith<$Res> {
  __$$DSMediaViewerBehaviorImplCopyWithImpl(
    _$DSMediaViewerBehaviorImpl _value,
    $Res Function(_$DSMediaViewerBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerBehavior
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
    Object? autoHideControls = null,
    Object? autoHideControlsDelay = null,
    Object? enableSwipeGestures = null,
    Object? enableDoubleTapZoom = null,
    Object? enablePinchZoom = null,
    Object? minZoom = null,
    Object? maxZoom = null,
    Object? pageChangeThreshold = null,
  }) {
    return _then(
      _$DSMediaViewerBehaviorImpl(
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
                  as DSMediaViewerClipBehavior,
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
        autoHideControls: null == autoHideControls
            ? _value.autoHideControls
            : autoHideControls // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoHideControlsDelay: null == autoHideControlsDelay
            ? _value.autoHideControlsDelay
            : autoHideControlsDelay // ignore: cast_nullable_to_non_nullable
                  as int,
        enableSwipeGestures: null == enableSwipeGestures
            ? _value.enableSwipeGestures
            : enableSwipeGestures // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableDoubleTapZoom: null == enableDoubleTapZoom
            ? _value.enableDoubleTapZoom
            : enableDoubleTapZoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        enablePinchZoom: null == enablePinchZoom
            ? _value.enablePinchZoom
            : enablePinchZoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        minZoom: null == minZoom
            ? _value.minZoom
            : minZoom // ignore: cast_nullable_to_non_nullable
                  as double,
        maxZoom: null == maxZoom
            ? _value.maxZoom
            : maxZoom // ignore: cast_nullable_to_non_nullable
                  as double,
        pageChangeThreshold: null == pageChangeThreshold
            ? _value.pageChangeThreshold
            : pageChangeThreshold // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerBehaviorImpl implements _DSMediaViewerBehavior {
  const _$DSMediaViewerBehaviorImpl({
    this.enableHapticFeedback = true,
    this.enableRipple = true,
    this.enableHover = true,
    this.enableFocus = true,
    this.maintainState = true,
    this.clipBehavior = DSMediaViewerClipBehavior.antiAlias,
    this.animationDuration = 300,
    this.showLoadingIndicator = true,
    this.showSkeletonAnimation = true,
    this.autoHideControls = true,
    this.autoHideControlsDelay = 3,
    this.enableSwipeGestures = true,
    this.enableDoubleTapZoom = true,
    this.enablePinchZoom = true,
    this.minZoom = 0.5,
    this.maxZoom = 3.0,
    this.pageChangeThreshold = 0.8,
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
  final DSMediaViewerClipBehavior clipBehavior;

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

  /// Ocultar controles automáticamente
  @override
  @JsonKey()
  final bool autoHideControls;

  /// Tiempo para ocultar controles (segundos)
  @override
  @JsonKey()
  final int autoHideControlsDelay;

  /// Permitir gestos de swipe
  @override
  @JsonKey()
  final bool enableSwipeGestures;

  /// Permitir doble tap para zoom
  @override
  @JsonKey()
  final bool enableDoubleTapZoom;

  /// Permitir pinch to zoom
  @override
  @JsonKey()
  final bool enablePinchZoom;

  /// Zoom mínimo
  @override
  @JsonKey()
  final double minZoom;

  /// Zoom máximo
  @override
  @JsonKey()
  final double maxZoom;

  /// Velocidad de scroll para cambiar página
  @override
  @JsonKey()
  final double pageChangeThreshold;

  @override
  String toString() {
    return 'DSMediaViewerBehavior(enableHapticFeedback: $enableHapticFeedback, enableRipple: $enableRipple, enableHover: $enableHover, enableFocus: $enableFocus, maintainState: $maintainState, clipBehavior: $clipBehavior, animationDuration: $animationDuration, showLoadingIndicator: $showLoadingIndicator, showSkeletonAnimation: $showSkeletonAnimation, autoHideControls: $autoHideControls, autoHideControlsDelay: $autoHideControlsDelay, enableSwipeGestures: $enableSwipeGestures, enableDoubleTapZoom: $enableDoubleTapZoom, enablePinchZoom: $enablePinchZoom, minZoom: $minZoom, maxZoom: $maxZoom, pageChangeThreshold: $pageChangeThreshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerBehaviorImpl &&
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
            (identical(other.autoHideControls, autoHideControls) ||
                other.autoHideControls == autoHideControls) &&
            (identical(other.autoHideControlsDelay, autoHideControlsDelay) ||
                other.autoHideControlsDelay == autoHideControlsDelay) &&
            (identical(other.enableSwipeGestures, enableSwipeGestures) ||
                other.enableSwipeGestures == enableSwipeGestures) &&
            (identical(other.enableDoubleTapZoom, enableDoubleTapZoom) ||
                other.enableDoubleTapZoom == enableDoubleTapZoom) &&
            (identical(other.enablePinchZoom, enablePinchZoom) ||
                other.enablePinchZoom == enablePinchZoom) &&
            (identical(other.minZoom, minZoom) || other.minZoom == minZoom) &&
            (identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom) &&
            (identical(other.pageChangeThreshold, pageChangeThreshold) ||
                other.pageChangeThreshold == pageChangeThreshold));
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
    autoHideControls,
    autoHideControlsDelay,
    enableSwipeGestures,
    enableDoubleTapZoom,
    enablePinchZoom,
    minZoom,
    maxZoom,
    pageChangeThreshold,
  );

  /// Create a copy of DSMediaViewerBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerBehaviorImplCopyWith<_$DSMediaViewerBehaviorImpl>
  get copyWith =>
      __$$DSMediaViewerBehaviorImplCopyWithImpl<_$DSMediaViewerBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerBehavior implements DSMediaViewerBehavior {
  const factory _DSMediaViewerBehavior({
    final bool enableHapticFeedback,
    final bool enableRipple,
    final bool enableHover,
    final bool enableFocus,
    final bool maintainState,
    final DSMediaViewerClipBehavior clipBehavior,
    final int animationDuration,
    final bool showLoadingIndicator,
    final bool showSkeletonAnimation,
    final bool autoHideControls,
    final int autoHideControlsDelay,
    final bool enableSwipeGestures,
    final bool enableDoubleTapZoom,
    final bool enablePinchZoom,
    final double minZoom,
    final double maxZoom,
    final double pageChangeThreshold,
  }) = _$DSMediaViewerBehaviorImpl;

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
  DSMediaViewerClipBehavior get clipBehavior;

  /// Duración de animaciones en milisegundos
  @override
  int get animationDuration;

  /// Mostrar indicador de carga
  @override
  bool get showLoadingIndicator;

  /// Mostrar animación skeleton
  @override
  bool get showSkeletonAnimation;

  /// Ocultar controles automáticamente
  @override
  bool get autoHideControls;

  /// Tiempo para ocultar controles (segundos)
  @override
  int get autoHideControlsDelay;

  /// Permitir gestos de swipe
  @override
  bool get enableSwipeGestures;

  /// Permitir doble tap para zoom
  @override
  bool get enableDoubleTapZoom;

  /// Permitir pinch to zoom
  @override
  bool get enablePinchZoom;

  /// Zoom mínimo
  @override
  double get minZoom;

  /// Zoom máximo
  @override
  double get maxZoom;

  /// Velocidad de scroll para cambiar página
  @override
  double get pageChangeThreshold;

  /// Create a copy of DSMediaViewerBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerBehaviorImplCopyWith<_$DSMediaViewerBehaviorImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerAnimation {
  /// Tipo de animación para transiciones
  DSMediaViewerAnimationType get type => throw _privateConstructorUsedError;

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

  /// Habilitar animación de controles
  bool get enableControlsAnimation => throw _privateConstructorUsedError;

  /// Duración del fade in de controles
  int get controlsFadeInDuration => throw _privateConstructorUsedError;

  /// Duración del fade out de controles
  int get controlsFadeOutDuration => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerAnimationCopyWith<DSMediaViewerAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerAnimationCopyWith<$Res> {
  factory $DSMediaViewerAnimationCopyWith(
    DSMediaViewerAnimation value,
    $Res Function(DSMediaViewerAnimation) then,
  ) = _$DSMediaViewerAnimationCopyWithImpl<$Res, DSMediaViewerAnimation>;
  @useResult
  $Res call({
    DSMediaViewerAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableHoverAnimation,
    bool enablePressAnimation,
    bool enableLoadingAnimation,
    bool enableControlsAnimation,
    int controlsFadeInDuration,
    int controlsFadeOutDuration,
  });
}

/// @nodoc
class _$DSMediaViewerAnimationCopyWithImpl<
  $Res,
  $Val extends DSMediaViewerAnimation
>
    implements $DSMediaViewerAnimationCopyWith<$Res> {
  _$DSMediaViewerAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerAnimation
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
    Object? enableControlsAnimation = null,
    Object? controlsFadeInDuration = null,
    Object? controlsFadeOutDuration = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerAnimationType,
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
            enableControlsAnimation: null == enableControlsAnimation
                ? _value.enableControlsAnimation
                : enableControlsAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            controlsFadeInDuration: null == controlsFadeInDuration
                ? _value.controlsFadeInDuration
                : controlsFadeInDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            controlsFadeOutDuration: null == controlsFadeOutDuration
                ? _value.controlsFadeOutDuration
                : controlsFadeOutDuration // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMediaViewerAnimationImplCopyWith<$Res>
    implements $DSMediaViewerAnimationCopyWith<$Res> {
  factory _$$DSMediaViewerAnimationImplCopyWith(
    _$DSMediaViewerAnimationImpl value,
    $Res Function(_$DSMediaViewerAnimationImpl) then,
  ) = __$$DSMediaViewerAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSMediaViewerAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableHoverAnimation,
    bool enablePressAnimation,
    bool enableLoadingAnimation,
    bool enableControlsAnimation,
    int controlsFadeInDuration,
    int controlsFadeOutDuration,
  });
}

/// @nodoc
class __$$DSMediaViewerAnimationImplCopyWithImpl<$Res>
    extends
        _$DSMediaViewerAnimationCopyWithImpl<$Res, _$DSMediaViewerAnimationImpl>
    implements _$$DSMediaViewerAnimationImplCopyWith<$Res> {
  __$$DSMediaViewerAnimationImplCopyWithImpl(
    _$DSMediaViewerAnimationImpl _value,
    $Res Function(_$DSMediaViewerAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerAnimation
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
    Object? enableControlsAnimation = null,
    Object? controlsFadeInDuration = null,
    Object? controlsFadeOutDuration = null,
  }) {
    return _then(
      _$DSMediaViewerAnimationImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerAnimationType,
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
        enableControlsAnimation: null == enableControlsAnimation
            ? _value.enableControlsAnimation
            : enableControlsAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        controlsFadeInDuration: null == controlsFadeInDuration
            ? _value.controlsFadeInDuration
            : controlsFadeInDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        controlsFadeOutDuration: null == controlsFadeOutDuration
            ? _value.controlsFadeOutDuration
            : controlsFadeOutDuration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerAnimationImpl implements _DSMediaViewerAnimation {
  const _$DSMediaViewerAnimationImpl({
    this.type = DSMediaViewerAnimationType.slide,
    this.duration = 300,
    this.curve = Curves.easeInOut,
    this.enableStateTransitions = true,
    this.enableHoverAnimation = true,
    this.enablePressAnimation = true,
    this.enableLoadingAnimation = true,
    this.enableControlsAnimation = true,
    this.controlsFadeInDuration = 200,
    this.controlsFadeOutDuration = 500,
  });

  /// Tipo de animación para transiciones
  @override
  @JsonKey()
  final DSMediaViewerAnimationType type;

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

  /// Habilitar animación de controles
  @override
  @JsonKey()
  final bool enableControlsAnimation;

  /// Duración del fade in de controles
  @override
  @JsonKey()
  final int controlsFadeInDuration;

  /// Duración del fade out de controles
  @override
  @JsonKey()
  final int controlsFadeOutDuration;

  @override
  String toString() {
    return 'DSMediaViewerAnimation(type: $type, duration: $duration, curve: $curve, enableStateTransitions: $enableStateTransitions, enableHoverAnimation: $enableHoverAnimation, enablePressAnimation: $enablePressAnimation, enableLoadingAnimation: $enableLoadingAnimation, enableControlsAnimation: $enableControlsAnimation, controlsFadeInDuration: $controlsFadeInDuration, controlsFadeOutDuration: $controlsFadeOutDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerAnimationImpl &&
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
            (identical(
                  other.enableControlsAnimation,
                  enableControlsAnimation,
                ) ||
                other.enableControlsAnimation == enableControlsAnimation) &&
            (identical(other.controlsFadeInDuration, controlsFadeInDuration) ||
                other.controlsFadeInDuration == controlsFadeInDuration) &&
            (identical(
                  other.controlsFadeOutDuration,
                  controlsFadeOutDuration,
                ) ||
                other.controlsFadeOutDuration == controlsFadeOutDuration));
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
    enableControlsAnimation,
    controlsFadeInDuration,
    controlsFadeOutDuration,
  );

  /// Create a copy of DSMediaViewerAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerAnimationImplCopyWith<_$DSMediaViewerAnimationImpl>
  get copyWith =>
      __$$DSMediaViewerAnimationImplCopyWithImpl<_$DSMediaViewerAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerAnimation implements DSMediaViewerAnimation {
  const factory _DSMediaViewerAnimation({
    final DSMediaViewerAnimationType type,
    final int duration,
    final Curve curve,
    final bool enableStateTransitions,
    final bool enableHoverAnimation,
    final bool enablePressAnimation,
    final bool enableLoadingAnimation,
    final bool enableControlsAnimation,
    final int controlsFadeInDuration,
    final int controlsFadeOutDuration,
  }) = _$DSMediaViewerAnimationImpl;

  /// Tipo de animación para transiciones
  @override
  DSMediaViewerAnimationType get type;

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

  /// Habilitar animación de controles
  @override
  bool get enableControlsAnimation;

  /// Duración del fade in de controles
  @override
  int get controlsFadeInDuration;

  /// Duración del fade out de controles
  @override
  int get controlsFadeOutDuration;

  /// Create a copy of DSMediaViewerAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerAnimationImplCopyWith<_$DSMediaViewerAnimationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerControls {
  /// Mostrar botón de play/pause
  bool get showPlayPause => throw _privateConstructorUsedError;

  /// Mostrar controles de volumen
  bool get showVolumeControls => throw _privateConstructorUsedError;

  /// Mostrar seek bar
  bool get showSeekBar => throw _privateConstructorUsedError;

  /// Mostrar tiempo actual/total
  bool get showTimeDisplay => throw _privateConstructorUsedError;

  /// Mostrar botón de pantalla completa
  bool get showFullscreenButton => throw _privateConstructorUsedError;

  /// Mostrar botones de navegación
  bool get showNavigationButtons => throw _privateConstructorUsedError;

  /// Mostrar botón de cerrar
  bool get showCloseButton => throw _privateConstructorUsedError;

  /// Mostrar botón de compartir
  bool get showShareButton => throw _privateConstructorUsedError;

  /// Mostrar botón de descarga
  bool get showDownloadButton => throw _privateConstructorUsedError;

  /// Mostrar información del archivo
  bool get showFileInfo => throw _privateConstructorUsedError;

  /// Posición de los controles
  DSMediaViewerControlsPosition get position =>
      throw _privateConstructorUsedError;

  /// Comportamiento de overlay
  DSMediaViewerOverlayBehavior get overlayBehavior =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerControls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerControlsCopyWith<DSMediaViewerControls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerControlsCopyWith<$Res> {
  factory $DSMediaViewerControlsCopyWith(
    DSMediaViewerControls value,
    $Res Function(DSMediaViewerControls) then,
  ) = _$DSMediaViewerControlsCopyWithImpl<$Res, DSMediaViewerControls>;
  @useResult
  $Res call({
    bool showPlayPause,
    bool showVolumeControls,
    bool showSeekBar,
    bool showTimeDisplay,
    bool showFullscreenButton,
    bool showNavigationButtons,
    bool showCloseButton,
    bool showShareButton,
    bool showDownloadButton,
    bool showFileInfo,
    DSMediaViewerControlsPosition position,
    DSMediaViewerOverlayBehavior overlayBehavior,
  });
}

/// @nodoc
class _$DSMediaViewerControlsCopyWithImpl<
  $Res,
  $Val extends DSMediaViewerControls
>
    implements $DSMediaViewerControlsCopyWith<$Res> {
  _$DSMediaViewerControlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerControls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showPlayPause = null,
    Object? showVolumeControls = null,
    Object? showSeekBar = null,
    Object? showTimeDisplay = null,
    Object? showFullscreenButton = null,
    Object? showNavigationButtons = null,
    Object? showCloseButton = null,
    Object? showShareButton = null,
    Object? showDownloadButton = null,
    Object? showFileInfo = null,
    Object? position = null,
    Object? overlayBehavior = null,
  }) {
    return _then(
      _value.copyWith(
            showPlayPause: null == showPlayPause
                ? _value.showPlayPause
                : showPlayPause // ignore: cast_nullable_to_non_nullable
                      as bool,
            showVolumeControls: null == showVolumeControls
                ? _value.showVolumeControls
                : showVolumeControls // ignore: cast_nullable_to_non_nullable
                      as bool,
            showSeekBar: null == showSeekBar
                ? _value.showSeekBar
                : showSeekBar // ignore: cast_nullable_to_non_nullable
                      as bool,
            showTimeDisplay: null == showTimeDisplay
                ? _value.showTimeDisplay
                : showTimeDisplay // ignore: cast_nullable_to_non_nullable
                      as bool,
            showFullscreenButton: null == showFullscreenButton
                ? _value.showFullscreenButton
                : showFullscreenButton // ignore: cast_nullable_to_non_nullable
                      as bool,
            showNavigationButtons: null == showNavigationButtons
                ? _value.showNavigationButtons
                : showNavigationButtons // ignore: cast_nullable_to_non_nullable
                      as bool,
            showCloseButton: null == showCloseButton
                ? _value.showCloseButton
                : showCloseButton // ignore: cast_nullable_to_non_nullable
                      as bool,
            showShareButton: null == showShareButton
                ? _value.showShareButton
                : showShareButton // ignore: cast_nullable_to_non_nullable
                      as bool,
            showDownloadButton: null == showDownloadButton
                ? _value.showDownloadButton
                : showDownloadButton // ignore: cast_nullable_to_non_nullable
                      as bool,
            showFileInfo: null == showFileInfo
                ? _value.showFileInfo
                : showFileInfo // ignore: cast_nullable_to_non_nullable
                      as bool,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerControlsPosition,
            overlayBehavior: null == overlayBehavior
                ? _value.overlayBehavior
                : overlayBehavior // ignore: cast_nullable_to_non_nullable
                      as DSMediaViewerOverlayBehavior,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMediaViewerControlsImplCopyWith<$Res>
    implements $DSMediaViewerControlsCopyWith<$Res> {
  factory _$$DSMediaViewerControlsImplCopyWith(
    _$DSMediaViewerControlsImpl value,
    $Res Function(_$DSMediaViewerControlsImpl) then,
  ) = __$$DSMediaViewerControlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool showPlayPause,
    bool showVolumeControls,
    bool showSeekBar,
    bool showTimeDisplay,
    bool showFullscreenButton,
    bool showNavigationButtons,
    bool showCloseButton,
    bool showShareButton,
    bool showDownloadButton,
    bool showFileInfo,
    DSMediaViewerControlsPosition position,
    DSMediaViewerOverlayBehavior overlayBehavior,
  });
}

/// @nodoc
class __$$DSMediaViewerControlsImplCopyWithImpl<$Res>
    extends
        _$DSMediaViewerControlsCopyWithImpl<$Res, _$DSMediaViewerControlsImpl>
    implements _$$DSMediaViewerControlsImplCopyWith<$Res> {
  __$$DSMediaViewerControlsImplCopyWithImpl(
    _$DSMediaViewerControlsImpl _value,
    $Res Function(_$DSMediaViewerControlsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerControls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showPlayPause = null,
    Object? showVolumeControls = null,
    Object? showSeekBar = null,
    Object? showTimeDisplay = null,
    Object? showFullscreenButton = null,
    Object? showNavigationButtons = null,
    Object? showCloseButton = null,
    Object? showShareButton = null,
    Object? showDownloadButton = null,
    Object? showFileInfo = null,
    Object? position = null,
    Object? overlayBehavior = null,
  }) {
    return _then(
      _$DSMediaViewerControlsImpl(
        showPlayPause: null == showPlayPause
            ? _value.showPlayPause
            : showPlayPause // ignore: cast_nullable_to_non_nullable
                  as bool,
        showVolumeControls: null == showVolumeControls
            ? _value.showVolumeControls
            : showVolumeControls // ignore: cast_nullable_to_non_nullable
                  as bool,
        showSeekBar: null == showSeekBar
            ? _value.showSeekBar
            : showSeekBar // ignore: cast_nullable_to_non_nullable
                  as bool,
        showTimeDisplay: null == showTimeDisplay
            ? _value.showTimeDisplay
            : showTimeDisplay // ignore: cast_nullable_to_non_nullable
                  as bool,
        showFullscreenButton: null == showFullscreenButton
            ? _value.showFullscreenButton
            : showFullscreenButton // ignore: cast_nullable_to_non_nullable
                  as bool,
        showNavigationButtons: null == showNavigationButtons
            ? _value.showNavigationButtons
            : showNavigationButtons // ignore: cast_nullable_to_non_nullable
                  as bool,
        showCloseButton: null == showCloseButton
            ? _value.showCloseButton
            : showCloseButton // ignore: cast_nullable_to_non_nullable
                  as bool,
        showShareButton: null == showShareButton
            ? _value.showShareButton
            : showShareButton // ignore: cast_nullable_to_non_nullable
                  as bool,
        showDownloadButton: null == showDownloadButton
            ? _value.showDownloadButton
            : showDownloadButton // ignore: cast_nullable_to_non_nullable
                  as bool,
        showFileInfo: null == showFileInfo
            ? _value.showFileInfo
            : showFileInfo // ignore: cast_nullable_to_non_nullable
                  as bool,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerControlsPosition,
        overlayBehavior: null == overlayBehavior
            ? _value.overlayBehavior
            : overlayBehavior // ignore: cast_nullable_to_non_nullable
                  as DSMediaViewerOverlayBehavior,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerControlsImpl implements _DSMediaViewerControls {
  const _$DSMediaViewerControlsImpl({
    this.showPlayPause = true,
    this.showVolumeControls = true,
    this.showSeekBar = true,
    this.showTimeDisplay = true,
    this.showFullscreenButton = true,
    this.showNavigationButtons = true,
    this.showCloseButton = true,
    this.showShareButton = false,
    this.showDownloadButton = false,
    this.showFileInfo = false,
    this.position = DSMediaViewerControlsPosition.bottom,
    this.overlayBehavior = DSMediaViewerOverlayBehavior.auto,
  });

  /// Mostrar botón de play/pause
  @override
  @JsonKey()
  final bool showPlayPause;

  /// Mostrar controles de volumen
  @override
  @JsonKey()
  final bool showVolumeControls;

  /// Mostrar seek bar
  @override
  @JsonKey()
  final bool showSeekBar;

  /// Mostrar tiempo actual/total
  @override
  @JsonKey()
  final bool showTimeDisplay;

  /// Mostrar botón de pantalla completa
  @override
  @JsonKey()
  final bool showFullscreenButton;

  /// Mostrar botones de navegación
  @override
  @JsonKey()
  final bool showNavigationButtons;

  /// Mostrar botón de cerrar
  @override
  @JsonKey()
  final bool showCloseButton;

  /// Mostrar botón de compartir
  @override
  @JsonKey()
  final bool showShareButton;

  /// Mostrar botón de descarga
  @override
  @JsonKey()
  final bool showDownloadButton;

  /// Mostrar información del archivo
  @override
  @JsonKey()
  final bool showFileInfo;

  /// Posición de los controles
  @override
  @JsonKey()
  final DSMediaViewerControlsPosition position;

  /// Comportamiento de overlay
  @override
  @JsonKey()
  final DSMediaViewerOverlayBehavior overlayBehavior;

  @override
  String toString() {
    return 'DSMediaViewerControls(showPlayPause: $showPlayPause, showVolumeControls: $showVolumeControls, showSeekBar: $showSeekBar, showTimeDisplay: $showTimeDisplay, showFullscreenButton: $showFullscreenButton, showNavigationButtons: $showNavigationButtons, showCloseButton: $showCloseButton, showShareButton: $showShareButton, showDownloadButton: $showDownloadButton, showFileInfo: $showFileInfo, position: $position, overlayBehavior: $overlayBehavior)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerControlsImpl &&
            (identical(other.showPlayPause, showPlayPause) ||
                other.showPlayPause == showPlayPause) &&
            (identical(other.showVolumeControls, showVolumeControls) ||
                other.showVolumeControls == showVolumeControls) &&
            (identical(other.showSeekBar, showSeekBar) ||
                other.showSeekBar == showSeekBar) &&
            (identical(other.showTimeDisplay, showTimeDisplay) ||
                other.showTimeDisplay == showTimeDisplay) &&
            (identical(other.showFullscreenButton, showFullscreenButton) ||
                other.showFullscreenButton == showFullscreenButton) &&
            (identical(other.showNavigationButtons, showNavigationButtons) ||
                other.showNavigationButtons == showNavigationButtons) &&
            (identical(other.showCloseButton, showCloseButton) ||
                other.showCloseButton == showCloseButton) &&
            (identical(other.showShareButton, showShareButton) ||
                other.showShareButton == showShareButton) &&
            (identical(other.showDownloadButton, showDownloadButton) ||
                other.showDownloadButton == showDownloadButton) &&
            (identical(other.showFileInfo, showFileInfo) ||
                other.showFileInfo == showFileInfo) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.overlayBehavior, overlayBehavior) ||
                other.overlayBehavior == overlayBehavior));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    showPlayPause,
    showVolumeControls,
    showSeekBar,
    showTimeDisplay,
    showFullscreenButton,
    showNavigationButtons,
    showCloseButton,
    showShareButton,
    showDownloadButton,
    showFileInfo,
    position,
    overlayBehavior,
  );

  /// Create a copy of DSMediaViewerControls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerControlsImplCopyWith<_$DSMediaViewerControlsImpl>
  get copyWith =>
      __$$DSMediaViewerControlsImplCopyWithImpl<_$DSMediaViewerControlsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMediaViewerControls implements DSMediaViewerControls {
  const factory _DSMediaViewerControls({
    final bool showPlayPause,
    final bool showVolumeControls,
    final bool showSeekBar,
    final bool showTimeDisplay,
    final bool showFullscreenButton,
    final bool showNavigationButtons,
    final bool showCloseButton,
    final bool showShareButton,
    final bool showDownloadButton,
    final bool showFileInfo,
    final DSMediaViewerControlsPosition position,
    final DSMediaViewerOverlayBehavior overlayBehavior,
  }) = _$DSMediaViewerControlsImpl;

  /// Mostrar botón de play/pause
  @override
  bool get showPlayPause;

  /// Mostrar controles de volumen
  @override
  bool get showVolumeControls;

  /// Mostrar seek bar
  @override
  bool get showSeekBar;

  /// Mostrar tiempo actual/total
  @override
  bool get showTimeDisplay;

  /// Mostrar botón de pantalla completa
  @override
  bool get showFullscreenButton;

  /// Mostrar botones de navegación
  @override
  bool get showNavigationButtons;

  /// Mostrar botón de cerrar
  @override
  bool get showCloseButton;

  /// Mostrar botón de compartir
  @override
  bool get showShareButton;

  /// Mostrar botón de descarga
  @override
  bool get showDownloadButton;

  /// Mostrar información del archivo
  @override
  bool get showFileInfo;

  /// Posición de los controles
  @override
  DSMediaViewerControlsPosition get position;

  /// Comportamiento de overlay
  @override
  DSMediaViewerOverlayBehavior get overlayBehavior;

  /// Create a copy of DSMediaViewerControls
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerControlsImplCopyWith<_$DSMediaViewerControlsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMediaViewerA11yConfig {
  /// Habilitar funciones de accesibilidad
  bool get enabled => throw _privateConstructorUsedError;

  /// Texto de semántica personalizado
  String? get semanticsLabel => throw _privateConstructorUsedError;

  /// Descripción detallada para lectores de pantalla
  String? get semanticsDescription => throw _privateConstructorUsedError;

  /// Hints para interacción
  String? get semanticsHint => throw _privateConstructorUsedError;

  /// Habilitar navegación por teclado
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Habilitar anuncios de estado
  bool get enableStateAnnouncements => throw _privateConstructorUsedError;

  /// Texto para el botón de play
  String get playButtonLabel => throw _privateConstructorUsedError;

  /// Texto para el botón de pause
  String get pauseButtonLabel => throw _privateConstructorUsedError;

  /// Texto para el botón anterior
  String get previousButtonLabel => throw _privateConstructorUsedError;

  /// Texto para el botón siguiente
  String get nextButtonLabel => throw _privateConstructorUsedError;

  /// Texto para el botón de pantalla completa
  String get fullscreenButtonLabel => throw _privateConstructorUsedError;

  /// Texto para el botón de cerrar
  String get closeButtonLabel => throw _privateConstructorUsedError;

  /// Rol semántico personalizado
  String? get semanticsRole => throw _privateConstructorUsedError;

  /// Create a copy of DSMediaViewerA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMediaViewerA11yConfigCopyWith<DSMediaViewerA11yConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMediaViewerA11yConfigCopyWith<$Res> {
  factory $DSMediaViewerA11yConfigCopyWith(
    DSMediaViewerA11yConfig value,
    $Res Function(DSMediaViewerA11yConfig) then,
  ) = _$DSMediaViewerA11yConfigCopyWithImpl<$Res, DSMediaViewerA11yConfig>;
  @useResult
  $Res call({
    bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    bool enableKeyboardNavigation,
    bool enableStateAnnouncements,
    String playButtonLabel,
    String pauseButtonLabel,
    String previousButtonLabel,
    String nextButtonLabel,
    String fullscreenButtonLabel,
    String closeButtonLabel,
    String? semanticsRole,
  });
}

/// @nodoc
class _$DSMediaViewerA11yConfigCopyWithImpl<
  $Res,
  $Val extends DSMediaViewerA11yConfig
>
    implements $DSMediaViewerA11yConfigCopyWith<$Res> {
  _$DSMediaViewerA11yConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMediaViewerA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticsLabel = freezed,
    Object? semanticsDescription = freezed,
    Object? semanticsHint = freezed,
    Object? enableKeyboardNavigation = null,
    Object? enableStateAnnouncements = null,
    Object? playButtonLabel = null,
    Object? pauseButtonLabel = null,
    Object? previousButtonLabel = null,
    Object? nextButtonLabel = null,
    Object? fullscreenButtonLabel = null,
    Object? closeButtonLabel = null,
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
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableStateAnnouncements: null == enableStateAnnouncements
                ? _value.enableStateAnnouncements
                : enableStateAnnouncements // ignore: cast_nullable_to_non_nullable
                      as bool,
            playButtonLabel: null == playButtonLabel
                ? _value.playButtonLabel
                : playButtonLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            pauseButtonLabel: null == pauseButtonLabel
                ? _value.pauseButtonLabel
                : pauseButtonLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            previousButtonLabel: null == previousButtonLabel
                ? _value.previousButtonLabel
                : previousButtonLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            nextButtonLabel: null == nextButtonLabel
                ? _value.nextButtonLabel
                : nextButtonLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            fullscreenButtonLabel: null == fullscreenButtonLabel
                ? _value.fullscreenButtonLabel
                : fullscreenButtonLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            closeButtonLabel: null == closeButtonLabel
                ? _value.closeButtonLabel
                : closeButtonLabel // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$DSMediaViewerA11yConfigImplCopyWith<$Res>
    implements $DSMediaViewerA11yConfigCopyWith<$Res> {
  factory _$$DSMediaViewerA11yConfigImplCopyWith(
    _$DSMediaViewerA11yConfigImpl value,
    $Res Function(_$DSMediaViewerA11yConfigImpl) then,
  ) = __$$DSMediaViewerA11yConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    bool enableKeyboardNavigation,
    bool enableStateAnnouncements,
    String playButtonLabel,
    String pauseButtonLabel,
    String previousButtonLabel,
    String nextButtonLabel,
    String fullscreenButtonLabel,
    String closeButtonLabel,
    String? semanticsRole,
  });
}

/// @nodoc
class __$$DSMediaViewerA11yConfigImplCopyWithImpl<$Res>
    extends
        _$DSMediaViewerA11yConfigCopyWithImpl<
          $Res,
          _$DSMediaViewerA11yConfigImpl
        >
    implements _$$DSMediaViewerA11yConfigImplCopyWith<$Res> {
  __$$DSMediaViewerA11yConfigImplCopyWithImpl(
    _$DSMediaViewerA11yConfigImpl _value,
    $Res Function(_$DSMediaViewerA11yConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMediaViewerA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticsLabel = freezed,
    Object? semanticsDescription = freezed,
    Object? semanticsHint = freezed,
    Object? enableKeyboardNavigation = null,
    Object? enableStateAnnouncements = null,
    Object? playButtonLabel = null,
    Object? pauseButtonLabel = null,
    Object? previousButtonLabel = null,
    Object? nextButtonLabel = null,
    Object? fullscreenButtonLabel = null,
    Object? closeButtonLabel = null,
    Object? semanticsRole = freezed,
  }) {
    return _then(
      _$DSMediaViewerA11yConfigImpl(
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
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableStateAnnouncements: null == enableStateAnnouncements
            ? _value.enableStateAnnouncements
            : enableStateAnnouncements // ignore: cast_nullable_to_non_nullable
                  as bool,
        playButtonLabel: null == playButtonLabel
            ? _value.playButtonLabel
            : playButtonLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        pauseButtonLabel: null == pauseButtonLabel
            ? _value.pauseButtonLabel
            : pauseButtonLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        previousButtonLabel: null == previousButtonLabel
            ? _value.previousButtonLabel
            : previousButtonLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        nextButtonLabel: null == nextButtonLabel
            ? _value.nextButtonLabel
            : nextButtonLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        fullscreenButtonLabel: null == fullscreenButtonLabel
            ? _value.fullscreenButtonLabel
            : fullscreenButtonLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        closeButtonLabel: null == closeButtonLabel
            ? _value.closeButtonLabel
            : closeButtonLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        semanticsRole: freezed == semanticsRole
            ? _value.semanticsRole
            : semanticsRole // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSMediaViewerA11yConfigImpl implements _DSMediaViewerA11yConfig {
  const _$DSMediaViewerA11yConfigImpl({
    this.enabled = true,
    this.semanticsLabel,
    this.semanticsDescription,
    this.semanticsHint,
    this.enableKeyboardNavigation = true,
    this.enableStateAnnouncements = true,
    this.playButtonLabel = 'Reproducir',
    this.pauseButtonLabel = 'Pausar',
    this.previousButtonLabel = 'Anterior',
    this.nextButtonLabel = 'Siguiente',
    this.fullscreenButtonLabel = 'Pantalla completa',
    this.closeButtonLabel = 'Cerrar',
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

  /// Habilitar navegación por teclado
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;

  /// Habilitar anuncios de estado
  @override
  @JsonKey()
  final bool enableStateAnnouncements;

  /// Texto para el botón de play
  @override
  @JsonKey()
  final String playButtonLabel;

  /// Texto para el botón de pause
  @override
  @JsonKey()
  final String pauseButtonLabel;

  /// Texto para el botón anterior
  @override
  @JsonKey()
  final String previousButtonLabel;

  /// Texto para el botón siguiente
  @override
  @JsonKey()
  final String nextButtonLabel;

  /// Texto para el botón de pantalla completa
  @override
  @JsonKey()
  final String fullscreenButtonLabel;

  /// Texto para el botón de cerrar
  @override
  @JsonKey()
  final String closeButtonLabel;

  /// Rol semántico personalizado
  @override
  final String? semanticsRole;

  @override
  String toString() {
    return 'DSMediaViewerA11yConfig(enabled: $enabled, semanticsLabel: $semanticsLabel, semanticsDescription: $semanticsDescription, semanticsHint: $semanticsHint, enableKeyboardNavigation: $enableKeyboardNavigation, enableStateAnnouncements: $enableStateAnnouncements, playButtonLabel: $playButtonLabel, pauseButtonLabel: $pauseButtonLabel, previousButtonLabel: $previousButtonLabel, nextButtonLabel: $nextButtonLabel, fullscreenButtonLabel: $fullscreenButtonLabel, closeButtonLabel: $closeButtonLabel, semanticsRole: $semanticsRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMediaViewerA11yConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.semanticsLabel, semanticsLabel) ||
                other.semanticsLabel == semanticsLabel) &&
            (identical(other.semanticsDescription, semanticsDescription) ||
                other.semanticsDescription == semanticsDescription) &&
            (identical(other.semanticsHint, semanticsHint) ||
                other.semanticsHint == semanticsHint) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation) &&
            (identical(
                  other.enableStateAnnouncements,
                  enableStateAnnouncements,
                ) ||
                other.enableStateAnnouncements == enableStateAnnouncements) &&
            (identical(other.playButtonLabel, playButtonLabel) ||
                other.playButtonLabel == playButtonLabel) &&
            (identical(other.pauseButtonLabel, pauseButtonLabel) ||
                other.pauseButtonLabel == pauseButtonLabel) &&
            (identical(other.previousButtonLabel, previousButtonLabel) ||
                other.previousButtonLabel == previousButtonLabel) &&
            (identical(other.nextButtonLabel, nextButtonLabel) ||
                other.nextButtonLabel == nextButtonLabel) &&
            (identical(other.fullscreenButtonLabel, fullscreenButtonLabel) ||
                other.fullscreenButtonLabel == fullscreenButtonLabel) &&
            (identical(other.closeButtonLabel, closeButtonLabel) ||
                other.closeButtonLabel == closeButtonLabel) &&
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
    enableKeyboardNavigation,
    enableStateAnnouncements,
    playButtonLabel,
    pauseButtonLabel,
    previousButtonLabel,
    nextButtonLabel,
    fullscreenButtonLabel,
    closeButtonLabel,
    semanticsRole,
  );

  /// Create a copy of DSMediaViewerA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMediaViewerA11yConfigImplCopyWith<_$DSMediaViewerA11yConfigImpl>
  get copyWith =>
      __$$DSMediaViewerA11yConfigImplCopyWithImpl<
        _$DSMediaViewerA11yConfigImpl
      >(this, _$identity);
}

abstract class _DSMediaViewerA11yConfig implements DSMediaViewerA11yConfig {
  const factory _DSMediaViewerA11yConfig({
    final bool enabled,
    final String? semanticsLabel,
    final String? semanticsDescription,
    final String? semanticsHint,
    final bool enableKeyboardNavigation,
    final bool enableStateAnnouncements,
    final String playButtonLabel,
    final String pauseButtonLabel,
    final String previousButtonLabel,
    final String nextButtonLabel,
    final String fullscreenButtonLabel,
    final String closeButtonLabel,
    final String? semanticsRole,
  }) = _$DSMediaViewerA11yConfigImpl;

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

  /// Habilitar navegación por teclado
  @override
  bool get enableKeyboardNavigation;

  /// Habilitar anuncios de estado
  @override
  bool get enableStateAnnouncements;

  /// Texto para el botón de play
  @override
  String get playButtonLabel;

  /// Texto para el botón de pause
  @override
  String get pauseButtonLabel;

  /// Texto para el botón anterior
  @override
  String get previousButtonLabel;

  /// Texto para el botón siguiente
  @override
  String get nextButtonLabel;

  /// Texto para el botón de pantalla completa
  @override
  String get fullscreenButtonLabel;

  /// Texto para el botón de cerrar
  @override
  String get closeButtonLabel;

  /// Rol semántico personalizado
  @override
  String? get semanticsRole;

  /// Create a copy of DSMediaViewerA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMediaViewerA11yConfigImplCopyWith<_$DSMediaViewerA11yConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
