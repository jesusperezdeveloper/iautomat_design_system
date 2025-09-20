// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_map_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSMapConfig {
  DSMapVariant get variant => throw _privateConstructorUsedError;
  DSMapState get state => throw _privateConstructorUsedError;
  DSMapTheme get theme => throw _privateConstructorUsedError;
  DSMapColors? get colors => throw _privateConstructorUsedError;
  DSMapSpacing? get spacing => throw _privateConstructorUsedError;
  DSMapAnimation? get animation => throw _privateConstructorUsedError;
  DSMapBehavior? get behavior => throw _privateConstructorUsedError;
  DSMapA11yConfig? get a11yConfig => throw _privateConstructorUsedError;

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapConfigCopyWith<DSMapConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapConfigCopyWith<$Res> {
  factory $DSMapConfigCopyWith(
    DSMapConfig value,
    $Res Function(DSMapConfig) then,
  ) = _$DSMapConfigCopyWithImpl<$Res, DSMapConfig>;
  @useResult
  $Res call({
    DSMapVariant variant,
    DSMapState state,
    DSMapTheme theme,
    DSMapColors? colors,
    DSMapSpacing? spacing,
    DSMapAnimation? animation,
    DSMapBehavior? behavior,
    DSMapA11yConfig? a11yConfig,
  });

  $DSMapColorsCopyWith<$Res>? get colors;
  $DSMapSpacingCopyWith<$Res>? get spacing;
  $DSMapAnimationCopyWith<$Res>? get animation;
  $DSMapBehaviorCopyWith<$Res>? get behavior;
  $DSMapA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class _$DSMapConfigCopyWithImpl<$Res, $Val extends DSMapConfig>
    implements $DSMapConfigCopyWith<$Res> {
  _$DSMapConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? theme = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? animation = freezed,
    Object? behavior = freezed,
    Object? a11yConfig = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSMapVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSMapState,
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as DSMapTheme,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSMapColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSMapSpacing?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSMapAnimation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSMapBehavior?,
            a11yConfig: freezed == a11yConfig
                ? _value.a11yConfig
                : a11yConfig // ignore: cast_nullable_to_non_nullable
                      as DSMapA11yConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMapColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSMapColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMapSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSMapSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMapAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSMapAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMapBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSMapBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSMapA11yConfigCopyWith<$Res>? get a11yConfig {
    if (_value.a11yConfig == null) {
      return null;
    }

    return $DSMapA11yConfigCopyWith<$Res>(_value.a11yConfig!, (value) {
      return _then(_value.copyWith(a11yConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSMapConfigImplCopyWith<$Res>
    implements $DSMapConfigCopyWith<$Res> {
  factory _$$DSMapConfigImplCopyWith(
    _$DSMapConfigImpl value,
    $Res Function(_$DSMapConfigImpl) then,
  ) = __$$DSMapConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSMapVariant variant,
    DSMapState state,
    DSMapTheme theme,
    DSMapColors? colors,
    DSMapSpacing? spacing,
    DSMapAnimation? animation,
    DSMapBehavior? behavior,
    DSMapA11yConfig? a11yConfig,
  });

  @override
  $DSMapColorsCopyWith<$Res>? get colors;
  @override
  $DSMapSpacingCopyWith<$Res>? get spacing;
  @override
  $DSMapAnimationCopyWith<$Res>? get animation;
  @override
  $DSMapBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSMapA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class __$$DSMapConfigImplCopyWithImpl<$Res>
    extends _$DSMapConfigCopyWithImpl<$Res, _$DSMapConfigImpl>
    implements _$$DSMapConfigImplCopyWith<$Res> {
  __$$DSMapConfigImplCopyWithImpl(
    _$DSMapConfigImpl _value,
    $Res Function(_$DSMapConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? theme = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? animation = freezed,
    Object? behavior = freezed,
    Object? a11yConfig = freezed,
  }) {
    return _then(
      _$DSMapConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSMapVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSMapState,
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as DSMapTheme,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSMapColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSMapSpacing?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSMapAnimation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSMapBehavior?,
        a11yConfig: freezed == a11yConfig
            ? _value.a11yConfig
            : a11yConfig // ignore: cast_nullable_to_non_nullable
                  as DSMapA11yConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSMapConfigImpl implements _DSMapConfig {
  const _$DSMapConfigImpl({
    this.variant = DSMapVariant.markers,
    this.state = DSMapState.defaultState,
    this.theme = DSMapTheme.light,
    this.colors,
    this.spacing,
    this.animation,
    this.behavior,
    this.a11yConfig,
  });

  @override
  @JsonKey()
  final DSMapVariant variant;
  @override
  @JsonKey()
  final DSMapState state;
  @override
  @JsonKey()
  final DSMapTheme theme;
  @override
  final DSMapColors? colors;
  @override
  final DSMapSpacing? spacing;
  @override
  final DSMapAnimation? animation;
  @override
  final DSMapBehavior? behavior;
  @override
  final DSMapA11yConfig? a11yConfig;

  @override
  String toString() {
    return 'DSMapConfig(variant: $variant, state: $state, theme: $theme, colors: $colors, spacing: $spacing, animation: $animation, behavior: $behavior, a11yConfig: $a11yConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
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
    state,
    theme,
    colors,
    spacing,
    animation,
    behavior,
    a11yConfig,
  );

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapConfigImplCopyWith<_$DSMapConfigImpl> get copyWith =>
      __$$DSMapConfigImplCopyWithImpl<_$DSMapConfigImpl>(this, _$identity);
}

abstract class _DSMapConfig implements DSMapConfig {
  const factory _DSMapConfig({
    final DSMapVariant variant,
    final DSMapState state,
    final DSMapTheme theme,
    final DSMapColors? colors,
    final DSMapSpacing? spacing,
    final DSMapAnimation? animation,
    final DSMapBehavior? behavior,
    final DSMapA11yConfig? a11yConfig,
  }) = _$DSMapConfigImpl;

  @override
  DSMapVariant get variant;
  @override
  DSMapState get state;
  @override
  DSMapTheme get theme;
  @override
  DSMapColors? get colors;
  @override
  DSMapSpacing? get spacing;
  @override
  DSMapAnimation? get animation;
  @override
  DSMapBehavior? get behavior;
  @override
  DSMapA11yConfig? get a11yConfig;

  /// Create a copy of DSMapConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapConfigImplCopyWith<_$DSMapConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapColors {
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get borderColor => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get overlayColor => throw _privateConstructorUsedError;
  Color? get markerColor => throw _privateConstructorUsedError;
  Color? get markerSelectedColor => throw _privateConstructorUsedError;
  Color? get clusterColor => throw _privateConstructorUsedError;
  Color? get clusterTextColor => throw _privateConstructorUsedError;
  Color? get shapeStrokeColor => throw _privateConstructorUsedError;
  Color? get shapeFillColor => throw _privateConstructorUsedError;
  Color? get loadingColor => throw _privateConstructorUsedError;
  Color? get skeletonColor => throw _privateConstructorUsedError;

  /// Create a copy of DSMapColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapColorsCopyWith<DSMapColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapColorsCopyWith<$Res> {
  factory $DSMapColorsCopyWith(
    DSMapColors value,
    $Res Function(DSMapColors) then,
  ) = _$DSMapColorsCopyWithImpl<$Res, DSMapColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? markerColor,
    Color? markerSelectedColor,
    Color? clusterColor,
    Color? clusterTextColor,
    Color? shapeStrokeColor,
    Color? shapeFillColor,
    Color? loadingColor,
    Color? skeletonColor,
  });
}

/// @nodoc
class _$DSMapColorsCopyWithImpl<$Res, $Val extends DSMapColors>
    implements $DSMapColorsCopyWith<$Res> {
  _$DSMapColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? overlayColor = freezed,
    Object? markerColor = freezed,
    Object? markerSelectedColor = freezed,
    Object? clusterColor = freezed,
    Object? clusterTextColor = freezed,
    Object? shapeStrokeColor = freezed,
    Object? shapeFillColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonColor = freezed,
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
            overlayColor: freezed == overlayColor
                ? _value.overlayColor
                : overlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            markerColor: freezed == markerColor
                ? _value.markerColor
                : markerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            markerSelectedColor: freezed == markerSelectedColor
                ? _value.markerSelectedColor
                : markerSelectedColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            clusterColor: freezed == clusterColor
                ? _value.clusterColor
                : clusterColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            clusterTextColor: freezed == clusterTextColor
                ? _value.clusterTextColor
                : clusterTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            shapeStrokeColor: freezed == shapeStrokeColor
                ? _value.shapeStrokeColor
                : shapeStrokeColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            shapeFillColor: freezed == shapeFillColor
                ? _value.shapeFillColor
                : shapeFillColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            loadingColor: freezed == loadingColor
                ? _value.loadingColor
                : loadingColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            skeletonColor: freezed == skeletonColor
                ? _value.skeletonColor
                : skeletonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMapColorsImplCopyWith<$Res>
    implements $DSMapColorsCopyWith<$Res> {
  factory _$$DSMapColorsImplCopyWith(
    _$DSMapColorsImpl value,
    $Res Function(_$DSMapColorsImpl) then,
  ) = __$$DSMapColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? markerColor,
    Color? markerSelectedColor,
    Color? clusterColor,
    Color? clusterTextColor,
    Color? shapeStrokeColor,
    Color? shapeFillColor,
    Color? loadingColor,
    Color? skeletonColor,
  });
}

/// @nodoc
class __$$DSMapColorsImplCopyWithImpl<$Res>
    extends _$DSMapColorsCopyWithImpl<$Res, _$DSMapColorsImpl>
    implements _$$DSMapColorsImplCopyWith<$Res> {
  __$$DSMapColorsImplCopyWithImpl(
    _$DSMapColorsImpl _value,
    $Res Function(_$DSMapColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? overlayColor = freezed,
    Object? markerColor = freezed,
    Object? markerSelectedColor = freezed,
    Object? clusterColor = freezed,
    Object? clusterTextColor = freezed,
    Object? shapeStrokeColor = freezed,
    Object? shapeFillColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonColor = freezed,
  }) {
    return _then(
      _$DSMapColorsImpl(
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
        overlayColor: freezed == overlayColor
            ? _value.overlayColor
            : overlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        markerColor: freezed == markerColor
            ? _value.markerColor
            : markerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        markerSelectedColor: freezed == markerSelectedColor
            ? _value.markerSelectedColor
            : markerSelectedColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clusterColor: freezed == clusterColor
            ? _value.clusterColor
            : clusterColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clusterTextColor: freezed == clusterTextColor
            ? _value.clusterTextColor
            : clusterTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shapeStrokeColor: freezed == shapeStrokeColor
            ? _value.shapeStrokeColor
            : shapeStrokeColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shapeFillColor: freezed == shapeFillColor
            ? _value.shapeFillColor
            : shapeFillColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        loadingColor: freezed == loadingColor
            ? _value.loadingColor
            : loadingColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        skeletonColor: freezed == skeletonColor
            ? _value.skeletonColor
            : skeletonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSMapColorsImpl implements _DSMapColors {
  const _$DSMapColorsImpl({
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.overlayColor,
    this.markerColor,
    this.markerSelectedColor,
    this.clusterColor,
    this.clusterTextColor,
    this.shapeStrokeColor,
    this.shapeFillColor,
    this.loadingColor,
    this.skeletonColor,
  });

  @override
  final Color? backgroundColor;
  @override
  final Color? borderColor;
  @override
  final Color? shadowColor;
  @override
  final Color? overlayColor;
  @override
  final Color? markerColor;
  @override
  final Color? markerSelectedColor;
  @override
  final Color? clusterColor;
  @override
  final Color? clusterTextColor;
  @override
  final Color? shapeStrokeColor;
  @override
  final Color? shapeFillColor;
  @override
  final Color? loadingColor;
  @override
  final Color? skeletonColor;

  @override
  String toString() {
    return 'DSMapColors(backgroundColor: $backgroundColor, borderColor: $borderColor, shadowColor: $shadowColor, overlayColor: $overlayColor, markerColor: $markerColor, markerSelectedColor: $markerSelectedColor, clusterColor: $clusterColor, clusterTextColor: $clusterTextColor, shapeStrokeColor: $shapeStrokeColor, shapeFillColor: $shapeFillColor, loadingColor: $loadingColor, skeletonColor: $skeletonColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.overlayColor, overlayColor) ||
                other.overlayColor == overlayColor) &&
            (identical(other.markerColor, markerColor) ||
                other.markerColor == markerColor) &&
            (identical(other.markerSelectedColor, markerSelectedColor) ||
                other.markerSelectedColor == markerSelectedColor) &&
            (identical(other.clusterColor, clusterColor) ||
                other.clusterColor == clusterColor) &&
            (identical(other.clusterTextColor, clusterTextColor) ||
                other.clusterTextColor == clusterTextColor) &&
            (identical(other.shapeStrokeColor, shapeStrokeColor) ||
                other.shapeStrokeColor == shapeStrokeColor) &&
            (identical(other.shapeFillColor, shapeFillColor) ||
                other.shapeFillColor == shapeFillColor) &&
            (identical(other.loadingColor, loadingColor) ||
                other.loadingColor == loadingColor) &&
            (identical(other.skeletonColor, skeletonColor) ||
                other.skeletonColor == skeletonColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    borderColor,
    shadowColor,
    overlayColor,
    markerColor,
    markerSelectedColor,
    clusterColor,
    clusterTextColor,
    shapeStrokeColor,
    shapeFillColor,
    loadingColor,
    skeletonColor,
  );

  /// Create a copy of DSMapColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapColorsImplCopyWith<_$DSMapColorsImpl> get copyWith =>
      __$$DSMapColorsImplCopyWithImpl<_$DSMapColorsImpl>(this, _$identity);
}

abstract class _DSMapColors implements DSMapColors {
  const factory _DSMapColors({
    final Color? backgroundColor,
    final Color? borderColor,
    final Color? shadowColor,
    final Color? overlayColor,
    final Color? markerColor,
    final Color? markerSelectedColor,
    final Color? clusterColor,
    final Color? clusterTextColor,
    final Color? shapeStrokeColor,
    final Color? shapeFillColor,
    final Color? loadingColor,
    final Color? skeletonColor,
  }) = _$DSMapColorsImpl;

  @override
  Color? get backgroundColor;
  @override
  Color? get borderColor;
  @override
  Color? get shadowColor;
  @override
  Color? get overlayColor;
  @override
  Color? get markerColor;
  @override
  Color? get markerSelectedColor;
  @override
  Color? get clusterColor;
  @override
  Color? get clusterTextColor;
  @override
  Color? get shapeStrokeColor;
  @override
  Color? get shapeFillColor;
  @override
  Color? get loadingColor;
  @override
  Color? get skeletonColor;

  /// Create a copy of DSMapColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapColorsImplCopyWith<_$DSMapColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapSpacing {
  EdgeInsets get padding => throw _privateConstructorUsedError;
  EdgeInsets get margin => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  double get borderWidth => throw _privateConstructorUsedError;
  double get elevation => throw _privateConstructorUsedError;
  double get minHeight => throw _privateConstructorUsedError;
  double get minWidth => throw _privateConstructorUsedError;
  double get markerSize => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;

  /// Create a copy of DSMapSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapSpacingCopyWith<DSMapSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapSpacingCopyWith<$Res> {
  factory $DSMapSpacingCopyWith(
    DSMapSpacing value,
    $Res Function(DSMapSpacing) then,
  ) = _$DSMapSpacingCopyWithImpl<$Res, DSMapSpacing>;
  @useResult
  $Res call({
    EdgeInsets padding,
    EdgeInsets margin,
    double borderRadius,
    double borderWidth,
    double elevation,
    double minHeight,
    double minWidth,
    double markerSize,
    double strokeWidth,
  });
}

/// @nodoc
class _$DSMapSpacingCopyWithImpl<$Res, $Val extends DSMapSpacing>
    implements $DSMapSpacingCopyWith<$Res> {
  _$DSMapSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? margin = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? elevation = null,
    Object? minHeight = null,
    Object? minWidth = null,
    Object? markerSize = null,
    Object? strokeWidth = null,
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
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            borderWidth: null == borderWidth
                ? _value.borderWidth
                : borderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            elevation: null == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as double,
            minHeight: null == minHeight
                ? _value.minHeight
                : minHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            minWidth: null == minWidth
                ? _value.minWidth
                : minWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            markerSize: null == markerSize
                ? _value.markerSize
                : markerSize // ignore: cast_nullable_to_non_nullable
                      as double,
            strokeWidth: null == strokeWidth
                ? _value.strokeWidth
                : strokeWidth // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMapSpacingImplCopyWith<$Res>
    implements $DSMapSpacingCopyWith<$Res> {
  factory _$$DSMapSpacingImplCopyWith(
    _$DSMapSpacingImpl value,
    $Res Function(_$DSMapSpacingImpl) then,
  ) = __$$DSMapSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EdgeInsets padding,
    EdgeInsets margin,
    double borderRadius,
    double borderWidth,
    double elevation,
    double minHeight,
    double minWidth,
    double markerSize,
    double strokeWidth,
  });
}

/// @nodoc
class __$$DSMapSpacingImplCopyWithImpl<$Res>
    extends _$DSMapSpacingCopyWithImpl<$Res, _$DSMapSpacingImpl>
    implements _$$DSMapSpacingImplCopyWith<$Res> {
  __$$DSMapSpacingImplCopyWithImpl(
    _$DSMapSpacingImpl _value,
    $Res Function(_$DSMapSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? margin = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? elevation = null,
    Object? minHeight = null,
    Object? minWidth = null,
    Object? markerSize = null,
    Object? strokeWidth = null,
  }) {
    return _then(
      _$DSMapSpacingImpl(
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
        elevation: null == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as double,
        minHeight: null == minHeight
            ? _value.minHeight
            : minHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        minWidth: null == minWidth
            ? _value.minWidth
            : minWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        markerSize: null == markerSize
            ? _value.markerSize
            : markerSize // ignore: cast_nullable_to_non_nullable
                  as double,
        strokeWidth: null == strokeWidth
            ? _value.strokeWidth
            : strokeWidth // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSMapSpacingImpl implements _DSMapSpacing {
  const _$DSMapSpacingImpl({
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.elevation = 4.0,
    this.minHeight = 200.0,
    this.minWidth = 200.0,
    this.markerSize = 16.0,
    this.strokeWidth = 2.0,
  });

  @override
  @JsonKey()
  final EdgeInsets padding;
  @override
  @JsonKey()
  final EdgeInsets margin;
  @override
  @JsonKey()
  final double borderRadius;
  @override
  @JsonKey()
  final double borderWidth;
  @override
  @JsonKey()
  final double elevation;
  @override
  @JsonKey()
  final double minHeight;
  @override
  @JsonKey()
  final double minWidth;
  @override
  @JsonKey()
  final double markerSize;
  @override
  @JsonKey()
  final double strokeWidth;

  @override
  String toString() {
    return 'DSMapSpacing(padding: $padding, margin: $margin, borderRadius: $borderRadius, borderWidth: $borderWidth, elevation: $elevation, minHeight: $minHeight, minWidth: $minWidth, markerSize: $markerSize, strokeWidth: $strokeWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapSpacingImpl &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth) &&
            (identical(other.markerSize, markerSize) ||
                other.markerSize == markerSize) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    padding,
    margin,
    borderRadius,
    borderWidth,
    elevation,
    minHeight,
    minWidth,
    markerSize,
    strokeWidth,
  );

  /// Create a copy of DSMapSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapSpacingImplCopyWith<_$DSMapSpacingImpl> get copyWith =>
      __$$DSMapSpacingImplCopyWithImpl<_$DSMapSpacingImpl>(this, _$identity);
}

abstract class _DSMapSpacing implements DSMapSpacing {
  const factory _DSMapSpacing({
    final EdgeInsets padding,
    final EdgeInsets margin,
    final double borderRadius,
    final double borderWidth,
    final double elevation,
    final double minHeight,
    final double minWidth,
    final double markerSize,
    final double strokeWidth,
  }) = _$DSMapSpacingImpl;

  @override
  EdgeInsets get padding;
  @override
  EdgeInsets get margin;
  @override
  double get borderRadius;
  @override
  double get borderWidth;
  @override
  double get elevation;
  @override
  double get minHeight;
  @override
  double get minWidth;
  @override
  double get markerSize;
  @override
  double get strokeWidth;

  /// Create a copy of DSMapSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapSpacingImplCopyWith<_$DSMapSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapAnimation {
  bool get enabled => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  Duration get movementDuration => throw _privateConstructorUsedError;
  Curve get movementCurve => throw _privateConstructorUsedError;
  bool get enableMarkerAnimation => throw _privateConstructorUsedError;
  bool get enableZoomAnimation => throw _privateConstructorUsedError;

  /// Create a copy of DSMapAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapAnimationCopyWith<DSMapAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapAnimationCopyWith<$Res> {
  factory $DSMapAnimationCopyWith(
    DSMapAnimation value,
    $Res Function(DSMapAnimation) then,
  ) = _$DSMapAnimationCopyWithImpl<$Res, DSMapAnimation>;
  @useResult
  $Res call({
    bool enabled,
    Duration duration,
    Curve curve,
    Duration movementDuration,
    Curve movementCurve,
    bool enableMarkerAnimation,
    bool enableZoomAnimation,
  });
}

/// @nodoc
class _$DSMapAnimationCopyWithImpl<$Res, $Val extends DSMapAnimation>
    implements $DSMapAnimationCopyWith<$Res> {
  _$DSMapAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? duration = null,
    Object? curve = null,
    Object? movementDuration = null,
    Object? movementCurve = null,
    Object? enableMarkerAnimation = null,
    Object? enableZoomAnimation = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            curve: null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            movementDuration: null == movementDuration
                ? _value.movementDuration
                : movementDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            movementCurve: null == movementCurve
                ? _value.movementCurve
                : movementCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enableMarkerAnimation: null == enableMarkerAnimation
                ? _value.enableMarkerAnimation
                : enableMarkerAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableZoomAnimation: null == enableZoomAnimation
                ? _value.enableZoomAnimation
                : enableZoomAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMapAnimationImplCopyWith<$Res>
    implements $DSMapAnimationCopyWith<$Res> {
  factory _$$DSMapAnimationImplCopyWith(
    _$DSMapAnimationImpl value,
    $Res Function(_$DSMapAnimationImpl) then,
  ) = __$$DSMapAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    Duration duration,
    Curve curve,
    Duration movementDuration,
    Curve movementCurve,
    bool enableMarkerAnimation,
    bool enableZoomAnimation,
  });
}

/// @nodoc
class __$$DSMapAnimationImplCopyWithImpl<$Res>
    extends _$DSMapAnimationCopyWithImpl<$Res, _$DSMapAnimationImpl>
    implements _$$DSMapAnimationImplCopyWith<$Res> {
  __$$DSMapAnimationImplCopyWithImpl(
    _$DSMapAnimationImpl _value,
    $Res Function(_$DSMapAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? duration = null,
    Object? curve = null,
    Object? movementDuration = null,
    Object? movementCurve = null,
    Object? enableMarkerAnimation = null,
    Object? enableZoomAnimation = null,
  }) {
    return _then(
      _$DSMapAnimationImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        curve: null == curve
            ? _value.curve
            : curve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        movementDuration: null == movementDuration
            ? _value.movementDuration
            : movementDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        movementCurve: null == movementCurve
            ? _value.movementCurve
            : movementCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enableMarkerAnimation: null == enableMarkerAnimation
            ? _value.enableMarkerAnimation
            : enableMarkerAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableZoomAnimation: null == enableZoomAnimation
            ? _value.enableZoomAnimation
            : enableZoomAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSMapAnimationImpl implements _DSMapAnimation {
  const _$DSMapAnimationImpl({
    this.enabled = true,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.movementDuration = const Duration(milliseconds: 300),
    this.movementCurve = Curves.easeOut,
    this.enableMarkerAnimation = true,
    this.enableZoomAnimation = true,
  });

  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final Curve curve;
  @override
  @JsonKey()
  final Duration movementDuration;
  @override
  @JsonKey()
  final Curve movementCurve;
  @override
  @JsonKey()
  final bool enableMarkerAnimation;
  @override
  @JsonKey()
  final bool enableZoomAnimation;

  @override
  String toString() {
    return 'DSMapAnimation(enabled: $enabled, duration: $duration, curve: $curve, movementDuration: $movementDuration, movementCurve: $movementCurve, enableMarkerAnimation: $enableMarkerAnimation, enableZoomAnimation: $enableZoomAnimation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapAnimationImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.movementDuration, movementDuration) ||
                other.movementDuration == movementDuration) &&
            (identical(other.movementCurve, movementCurve) ||
                other.movementCurve == movementCurve) &&
            (identical(other.enableMarkerAnimation, enableMarkerAnimation) ||
                other.enableMarkerAnimation == enableMarkerAnimation) &&
            (identical(other.enableZoomAnimation, enableZoomAnimation) ||
                other.enableZoomAnimation == enableZoomAnimation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    duration,
    curve,
    movementDuration,
    movementCurve,
    enableMarkerAnimation,
    enableZoomAnimation,
  );

  /// Create a copy of DSMapAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapAnimationImplCopyWith<_$DSMapAnimationImpl> get copyWith =>
      __$$DSMapAnimationImplCopyWithImpl<_$DSMapAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMapAnimation implements DSMapAnimation {
  const factory _DSMapAnimation({
    final bool enabled,
    final Duration duration,
    final Curve curve,
    final Duration movementDuration,
    final Curve movementCurve,
    final bool enableMarkerAnimation,
    final bool enableZoomAnimation,
  }) = _$DSMapAnimationImpl;

  @override
  bool get enabled;
  @override
  Duration get duration;
  @override
  Curve get curve;
  @override
  Duration get movementDuration;
  @override
  Curve get movementCurve;
  @override
  bool get enableMarkerAnimation;
  @override
  bool get enableZoomAnimation;

  /// Create a copy of DSMapAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapAnimationImplCopyWith<_$DSMapAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapBehavior {
  bool get enableInteraction => throw _privateConstructorUsedError;
  bool get enableZoom => throw _privateConstructorUsedError;
  bool get enablePan => throw _privateConstructorUsedError;
  bool get enableRotation => throw _privateConstructorUsedError;
  bool get enableTilt => throw _privateConstructorUsedError;
  bool get enableMarkerInteraction => throw _privateConstructorUsedError;
  bool get enableClustering => throw _privateConstructorUsedError;
  int get clusterMaxZoom => throw _privateConstructorUsedError;
  int get clusterRadius => throw _privateConstructorUsedError;
  double get minZoom => throw _privateConstructorUsedError;
  double get maxZoom => throw _privateConstructorUsedError;
  Duration get debounceTime => throw _privateConstructorUsedError;

  /// Create a copy of DSMapBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapBehaviorCopyWith<DSMapBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapBehaviorCopyWith<$Res> {
  factory $DSMapBehaviorCopyWith(
    DSMapBehavior value,
    $Res Function(DSMapBehavior) then,
  ) = _$DSMapBehaviorCopyWithImpl<$Res, DSMapBehavior>;
  @useResult
  $Res call({
    bool enableInteraction,
    bool enableZoom,
    bool enablePan,
    bool enableRotation,
    bool enableTilt,
    bool enableMarkerInteraction,
    bool enableClustering,
    int clusterMaxZoom,
    int clusterRadius,
    double minZoom,
    double maxZoom,
    Duration debounceTime,
  });
}

/// @nodoc
class _$DSMapBehaviorCopyWithImpl<$Res, $Val extends DSMapBehavior>
    implements $DSMapBehaviorCopyWith<$Res> {
  _$DSMapBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableInteraction = null,
    Object? enableZoom = null,
    Object? enablePan = null,
    Object? enableRotation = null,
    Object? enableTilt = null,
    Object? enableMarkerInteraction = null,
    Object? enableClustering = null,
    Object? clusterMaxZoom = null,
    Object? clusterRadius = null,
    Object? minZoom = null,
    Object? maxZoom = null,
    Object? debounceTime = null,
  }) {
    return _then(
      _value.copyWith(
            enableInteraction: null == enableInteraction
                ? _value.enableInteraction
                : enableInteraction // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableZoom: null == enableZoom
                ? _value.enableZoom
                : enableZoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            enablePan: null == enablePan
                ? _value.enablePan
                : enablePan // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableRotation: null == enableRotation
                ? _value.enableRotation
                : enableRotation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableTilt: null == enableTilt
                ? _value.enableTilt
                : enableTilt // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableMarkerInteraction: null == enableMarkerInteraction
                ? _value.enableMarkerInteraction
                : enableMarkerInteraction // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableClustering: null == enableClustering
                ? _value.enableClustering
                : enableClustering // ignore: cast_nullable_to_non_nullable
                      as bool,
            clusterMaxZoom: null == clusterMaxZoom
                ? _value.clusterMaxZoom
                : clusterMaxZoom // ignore: cast_nullable_to_non_nullable
                      as int,
            clusterRadius: null == clusterRadius
                ? _value.clusterRadius
                : clusterRadius // ignore: cast_nullable_to_non_nullable
                      as int,
            minZoom: null == minZoom
                ? _value.minZoom
                : minZoom // ignore: cast_nullable_to_non_nullable
                      as double,
            maxZoom: null == maxZoom
                ? _value.maxZoom
                : maxZoom // ignore: cast_nullable_to_non_nullable
                      as double,
            debounceTime: null == debounceTime
                ? _value.debounceTime
                : debounceTime // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMapBehaviorImplCopyWith<$Res>
    implements $DSMapBehaviorCopyWith<$Res> {
  factory _$$DSMapBehaviorImplCopyWith(
    _$DSMapBehaviorImpl value,
    $Res Function(_$DSMapBehaviorImpl) then,
  ) = __$$DSMapBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enableInteraction,
    bool enableZoom,
    bool enablePan,
    bool enableRotation,
    bool enableTilt,
    bool enableMarkerInteraction,
    bool enableClustering,
    int clusterMaxZoom,
    int clusterRadius,
    double minZoom,
    double maxZoom,
    Duration debounceTime,
  });
}

/// @nodoc
class __$$DSMapBehaviorImplCopyWithImpl<$Res>
    extends _$DSMapBehaviorCopyWithImpl<$Res, _$DSMapBehaviorImpl>
    implements _$$DSMapBehaviorImplCopyWith<$Res> {
  __$$DSMapBehaviorImplCopyWithImpl(
    _$DSMapBehaviorImpl _value,
    $Res Function(_$DSMapBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableInteraction = null,
    Object? enableZoom = null,
    Object? enablePan = null,
    Object? enableRotation = null,
    Object? enableTilt = null,
    Object? enableMarkerInteraction = null,
    Object? enableClustering = null,
    Object? clusterMaxZoom = null,
    Object? clusterRadius = null,
    Object? minZoom = null,
    Object? maxZoom = null,
    Object? debounceTime = null,
  }) {
    return _then(
      _$DSMapBehaviorImpl(
        enableInteraction: null == enableInteraction
            ? _value.enableInteraction
            : enableInteraction // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableZoom: null == enableZoom
            ? _value.enableZoom
            : enableZoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        enablePan: null == enablePan
            ? _value.enablePan
            : enablePan // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableRotation: null == enableRotation
            ? _value.enableRotation
            : enableRotation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableTilt: null == enableTilt
            ? _value.enableTilt
            : enableTilt // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableMarkerInteraction: null == enableMarkerInteraction
            ? _value.enableMarkerInteraction
            : enableMarkerInteraction // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableClustering: null == enableClustering
            ? _value.enableClustering
            : enableClustering // ignore: cast_nullable_to_non_nullable
                  as bool,
        clusterMaxZoom: null == clusterMaxZoom
            ? _value.clusterMaxZoom
            : clusterMaxZoom // ignore: cast_nullable_to_non_nullable
                  as int,
        clusterRadius: null == clusterRadius
            ? _value.clusterRadius
            : clusterRadius // ignore: cast_nullable_to_non_nullable
                  as int,
        minZoom: null == minZoom
            ? _value.minZoom
            : minZoom // ignore: cast_nullable_to_non_nullable
                  as double,
        maxZoom: null == maxZoom
            ? _value.maxZoom
            : maxZoom // ignore: cast_nullable_to_non_nullable
                  as double,
        debounceTime: null == debounceTime
            ? _value.debounceTime
            : debounceTime // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$DSMapBehaviorImpl implements _DSMapBehavior {
  const _$DSMapBehaviorImpl({
    this.enableInteraction = true,
    this.enableZoom = true,
    this.enablePan = true,
    this.enableRotation = true,
    this.enableTilt = true,
    this.enableMarkerInteraction = true,
    this.enableClustering = false,
    this.clusterMaxZoom = 100,
    this.clusterRadius = 50,
    this.minZoom = 1.0,
    this.maxZoom = 20.0,
    this.debounceTime = const Duration(milliseconds: 500),
  });

  @override
  @JsonKey()
  final bool enableInteraction;
  @override
  @JsonKey()
  final bool enableZoom;
  @override
  @JsonKey()
  final bool enablePan;
  @override
  @JsonKey()
  final bool enableRotation;
  @override
  @JsonKey()
  final bool enableTilt;
  @override
  @JsonKey()
  final bool enableMarkerInteraction;
  @override
  @JsonKey()
  final bool enableClustering;
  @override
  @JsonKey()
  final int clusterMaxZoom;
  @override
  @JsonKey()
  final int clusterRadius;
  @override
  @JsonKey()
  final double minZoom;
  @override
  @JsonKey()
  final double maxZoom;
  @override
  @JsonKey()
  final Duration debounceTime;

  @override
  String toString() {
    return 'DSMapBehavior(enableInteraction: $enableInteraction, enableZoom: $enableZoom, enablePan: $enablePan, enableRotation: $enableRotation, enableTilt: $enableTilt, enableMarkerInteraction: $enableMarkerInteraction, enableClustering: $enableClustering, clusterMaxZoom: $clusterMaxZoom, clusterRadius: $clusterRadius, minZoom: $minZoom, maxZoom: $maxZoom, debounceTime: $debounceTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapBehaviorImpl &&
            (identical(other.enableInteraction, enableInteraction) ||
                other.enableInteraction == enableInteraction) &&
            (identical(other.enableZoom, enableZoom) ||
                other.enableZoom == enableZoom) &&
            (identical(other.enablePan, enablePan) ||
                other.enablePan == enablePan) &&
            (identical(other.enableRotation, enableRotation) ||
                other.enableRotation == enableRotation) &&
            (identical(other.enableTilt, enableTilt) ||
                other.enableTilt == enableTilt) &&
            (identical(
                  other.enableMarkerInteraction,
                  enableMarkerInteraction,
                ) ||
                other.enableMarkerInteraction == enableMarkerInteraction) &&
            (identical(other.enableClustering, enableClustering) ||
                other.enableClustering == enableClustering) &&
            (identical(other.clusterMaxZoom, clusterMaxZoom) ||
                other.clusterMaxZoom == clusterMaxZoom) &&
            (identical(other.clusterRadius, clusterRadius) ||
                other.clusterRadius == clusterRadius) &&
            (identical(other.minZoom, minZoom) || other.minZoom == minZoom) &&
            (identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom) &&
            (identical(other.debounceTime, debounceTime) ||
                other.debounceTime == debounceTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enableInteraction,
    enableZoom,
    enablePan,
    enableRotation,
    enableTilt,
    enableMarkerInteraction,
    enableClustering,
    clusterMaxZoom,
    clusterRadius,
    minZoom,
    maxZoom,
    debounceTime,
  );

  /// Create a copy of DSMapBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapBehaviorImplCopyWith<_$DSMapBehaviorImpl> get copyWith =>
      __$$DSMapBehaviorImplCopyWithImpl<_$DSMapBehaviorImpl>(this, _$identity);
}

abstract class _DSMapBehavior implements DSMapBehavior {
  const factory _DSMapBehavior({
    final bool enableInteraction,
    final bool enableZoom,
    final bool enablePan,
    final bool enableRotation,
    final bool enableTilt,
    final bool enableMarkerInteraction,
    final bool enableClustering,
    final int clusterMaxZoom,
    final int clusterRadius,
    final double minZoom,
    final double maxZoom,
    final Duration debounceTime,
  }) = _$DSMapBehaviorImpl;

  @override
  bool get enableInteraction;
  @override
  bool get enableZoom;
  @override
  bool get enablePan;
  @override
  bool get enableRotation;
  @override
  bool get enableTilt;
  @override
  bool get enableMarkerInteraction;
  @override
  bool get enableClustering;
  @override
  int get clusterMaxZoom;
  @override
  int get clusterRadius;
  @override
  double get minZoom;
  @override
  double get maxZoom;
  @override
  Duration get debounceTime;

  /// Create a copy of DSMapBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapBehaviorImplCopyWith<_$DSMapBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapA11yConfig {
  bool get enabled => throw _privateConstructorUsedError;
  String? get semanticsLabel => throw _privateConstructorUsedError;
  String? get semanticsDescription => throw _privateConstructorUsedError;
  String? get semanticsHint => throw _privateConstructorUsedError;
  bool get announceStateChanges => throw _privateConstructorUsedError;
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;
  String get mapLabel => throw _privateConstructorUsedError;
  String get markerLabel => throw _privateConstructorUsedError;
  String get clusterLabel => throw _privateConstructorUsedError;
  String get shapeLabel => throw _privateConstructorUsedError;

  /// Create a copy of DSMapA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapA11yConfigCopyWith<DSMapA11yConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapA11yConfigCopyWith<$Res> {
  factory $DSMapA11yConfigCopyWith(
    DSMapA11yConfig value,
    $Res Function(DSMapA11yConfig) then,
  ) = _$DSMapA11yConfigCopyWithImpl<$Res, DSMapA11yConfig>;
  @useResult
  $Res call({
    bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    bool announceStateChanges,
    bool enableKeyboardNavigation,
    String mapLabel,
    String markerLabel,
    String clusterLabel,
    String shapeLabel,
  });
}

/// @nodoc
class _$DSMapA11yConfigCopyWithImpl<$Res, $Val extends DSMapA11yConfig>
    implements $DSMapA11yConfigCopyWith<$Res> {
  _$DSMapA11yConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticsLabel = freezed,
    Object? semanticsDescription = freezed,
    Object? semanticsHint = freezed,
    Object? announceStateChanges = null,
    Object? enableKeyboardNavigation = null,
    Object? mapLabel = null,
    Object? markerLabel = null,
    Object? clusterLabel = null,
    Object? shapeLabel = null,
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
            announceStateChanges: null == announceStateChanges
                ? _value.announceStateChanges
                : announceStateChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
            mapLabel: null == mapLabel
                ? _value.mapLabel
                : mapLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            markerLabel: null == markerLabel
                ? _value.markerLabel
                : markerLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            clusterLabel: null == clusterLabel
                ? _value.clusterLabel
                : clusterLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            shapeLabel: null == shapeLabel
                ? _value.shapeLabel
                : shapeLabel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMapA11yConfigImplCopyWith<$Res>
    implements $DSMapA11yConfigCopyWith<$Res> {
  factory _$$DSMapA11yConfigImplCopyWith(
    _$DSMapA11yConfigImpl value,
    $Res Function(_$DSMapA11yConfigImpl) then,
  ) = __$$DSMapA11yConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    String? semanticsLabel,
    String? semanticsDescription,
    String? semanticsHint,
    bool announceStateChanges,
    bool enableKeyboardNavigation,
    String mapLabel,
    String markerLabel,
    String clusterLabel,
    String shapeLabel,
  });
}

/// @nodoc
class __$$DSMapA11yConfigImplCopyWithImpl<$Res>
    extends _$DSMapA11yConfigCopyWithImpl<$Res, _$DSMapA11yConfigImpl>
    implements _$$DSMapA11yConfigImplCopyWith<$Res> {
  __$$DSMapA11yConfigImplCopyWithImpl(
    _$DSMapA11yConfigImpl _value,
    $Res Function(_$DSMapA11yConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticsLabel = freezed,
    Object? semanticsDescription = freezed,
    Object? semanticsHint = freezed,
    Object? announceStateChanges = null,
    Object? enableKeyboardNavigation = null,
    Object? mapLabel = null,
    Object? markerLabel = null,
    Object? clusterLabel = null,
    Object? shapeLabel = null,
  }) {
    return _then(
      _$DSMapA11yConfigImpl(
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
        announceStateChanges: null == announceStateChanges
            ? _value.announceStateChanges
            : announceStateChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
        mapLabel: null == mapLabel
            ? _value.mapLabel
            : mapLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        markerLabel: null == markerLabel
            ? _value.markerLabel
            : markerLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        clusterLabel: null == clusterLabel
            ? _value.clusterLabel
            : clusterLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        shapeLabel: null == shapeLabel
            ? _value.shapeLabel
            : shapeLabel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DSMapA11yConfigImpl implements _DSMapA11yConfig {
  const _$DSMapA11yConfigImpl({
    this.enabled = true,
    this.semanticsLabel,
    this.semanticsDescription,
    this.semanticsHint,
    this.announceStateChanges = true,
    this.enableKeyboardNavigation = true,
    this.mapLabel = 'Mapa interactivo',
    this.markerLabel = 'Marcador en el mapa',
    this.clusterLabel = 'Grupo de marcadores',
    this.shapeLabel = 'Forma en el mapa',
  });

  @override
  @JsonKey()
  final bool enabled;
  @override
  final String? semanticsLabel;
  @override
  final String? semanticsDescription;
  @override
  final String? semanticsHint;
  @override
  @JsonKey()
  final bool announceStateChanges;
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;
  @override
  @JsonKey()
  final String mapLabel;
  @override
  @JsonKey()
  final String markerLabel;
  @override
  @JsonKey()
  final String clusterLabel;
  @override
  @JsonKey()
  final String shapeLabel;

  @override
  String toString() {
    return 'DSMapA11yConfig(enabled: $enabled, semanticsLabel: $semanticsLabel, semanticsDescription: $semanticsDescription, semanticsHint: $semanticsHint, announceStateChanges: $announceStateChanges, enableKeyboardNavigation: $enableKeyboardNavigation, mapLabel: $mapLabel, markerLabel: $markerLabel, clusterLabel: $clusterLabel, shapeLabel: $shapeLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapA11yConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.semanticsLabel, semanticsLabel) ||
                other.semanticsLabel == semanticsLabel) &&
            (identical(other.semanticsDescription, semanticsDescription) ||
                other.semanticsDescription == semanticsDescription) &&
            (identical(other.semanticsHint, semanticsHint) ||
                other.semanticsHint == semanticsHint) &&
            (identical(other.announceStateChanges, announceStateChanges) ||
                other.announceStateChanges == announceStateChanges) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation) &&
            (identical(other.mapLabel, mapLabel) ||
                other.mapLabel == mapLabel) &&
            (identical(other.markerLabel, markerLabel) ||
                other.markerLabel == markerLabel) &&
            (identical(other.clusterLabel, clusterLabel) ||
                other.clusterLabel == clusterLabel) &&
            (identical(other.shapeLabel, shapeLabel) ||
                other.shapeLabel == shapeLabel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    semanticsLabel,
    semanticsDescription,
    semanticsHint,
    announceStateChanges,
    enableKeyboardNavigation,
    mapLabel,
    markerLabel,
    clusterLabel,
    shapeLabel,
  );

  /// Create a copy of DSMapA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapA11yConfigImplCopyWith<_$DSMapA11yConfigImpl> get copyWith =>
      __$$DSMapA11yConfigImplCopyWithImpl<_$DSMapA11yConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSMapA11yConfig implements DSMapA11yConfig {
  const factory _DSMapA11yConfig({
    final bool enabled,
    final String? semanticsLabel,
    final String? semanticsDescription,
    final String? semanticsHint,
    final bool announceStateChanges,
    final bool enableKeyboardNavigation,
    final String mapLabel,
    final String markerLabel,
    final String clusterLabel,
    final String shapeLabel,
  }) = _$DSMapA11yConfigImpl;

  @override
  bool get enabled;
  @override
  String? get semanticsLabel;
  @override
  String? get semanticsDescription;
  @override
  String? get semanticsHint;
  @override
  bool get announceStateChanges;
  @override
  bool get enableKeyboardNavigation;
  @override
  String get mapLabel;
  @override
  String get markerLabel;
  @override
  String get clusterLabel;
  @override
  String get shapeLabel;

  /// Create a copy of DSMapA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapA11yConfigImplCopyWith<_$DSMapA11yConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSLatLng {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Create a copy of DSLatLng
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSLatLngCopyWith<DSLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSLatLngCopyWith<$Res> {
  factory $DSLatLngCopyWith(DSLatLng value, $Res Function(DSLatLng) then) =
      _$DSLatLngCopyWithImpl<$Res, DSLatLng>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$DSLatLngCopyWithImpl<$Res, $Val extends DSLatLng>
    implements $DSLatLngCopyWith<$Res> {
  _$DSLatLngCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSLatLng
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _value.copyWith(
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSLatLngImplCopyWith<$Res>
    implements $DSLatLngCopyWith<$Res> {
  factory _$$DSLatLngImplCopyWith(
    _$DSLatLngImpl value,
    $Res Function(_$DSLatLngImpl) then,
  ) = __$$DSLatLngImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$DSLatLngImplCopyWithImpl<$Res>
    extends _$DSLatLngCopyWithImpl<$Res, _$DSLatLngImpl>
    implements _$$DSLatLngImplCopyWith<$Res> {
  __$$DSLatLngImplCopyWithImpl(
    _$DSLatLngImpl _value,
    $Res Function(_$DSLatLngImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSLatLng
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _$DSLatLngImpl(
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSLatLngImpl implements _DSLatLng {
  const _$DSLatLngImpl({required this.latitude, required this.longitude});

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'DSLatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSLatLngImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of DSLatLng
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSLatLngImplCopyWith<_$DSLatLngImpl> get copyWith =>
      __$$DSLatLngImplCopyWithImpl<_$DSLatLngImpl>(this, _$identity);
}

abstract class _DSLatLng implements DSLatLng {
  const factory _DSLatLng({
    required final double latitude,
    required final double longitude,
  }) = _$DSLatLngImpl;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of DSLatLng
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSLatLngImplCopyWith<_$DSLatLngImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapMarker {
  String get id => throw _privateConstructorUsedError;
  DSLatLng get position => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Widget? get icon => throw _privateConstructorUsedError;
  IconData? get iconData => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  DSMapMarkerType get type => throw _privateConstructorUsedError;
  bool get draggable => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;

  /// Create a copy of DSMapMarker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapMarkerCopyWith<DSMapMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapMarkerCopyWith<$Res> {
  factory $DSMapMarkerCopyWith(
    DSMapMarker value,
    $Res Function(DSMapMarker) then,
  ) = _$DSMapMarkerCopyWithImpl<$Res, DSMapMarker>;
  @useResult
  $Res call({
    String id,
    DSLatLng position,
    String? title,
    String? description,
    Widget? icon,
    IconData? iconData,
    Color? color,
    DSMapMarkerType type,
    bool draggable,
    bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  });

  $DSLatLngCopyWith<$Res> get position;
}

/// @nodoc
class _$DSMapMarkerCopyWithImpl<$Res, $Val extends DSMapMarker>
    implements $DSMapMarkerCopyWith<$Res> {
  _$DSMapMarkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapMarker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? iconData = freezed,
    Object? color = freezed,
    Object? type = null,
    Object? draggable = null,
    Object? visible = null,
    Object? metadata = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as DSLatLng,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            iconData: freezed == iconData
                ? _value.iconData
                : iconData // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSMapMarkerType,
            draggable: null == draggable
                ? _value.draggable
                : draggable // ignore: cast_nullable_to_non_nullable
                      as bool,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSMapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSLatLngCopyWith<$Res> get position {
    return $DSLatLngCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSMapMarkerImplCopyWith<$Res>
    implements $DSMapMarkerCopyWith<$Res> {
  factory _$$DSMapMarkerImplCopyWith(
    _$DSMapMarkerImpl value,
    $Res Function(_$DSMapMarkerImpl) then,
  ) = __$$DSMapMarkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DSLatLng position,
    String? title,
    String? description,
    Widget? icon,
    IconData? iconData,
    Color? color,
    DSMapMarkerType type,
    bool draggable,
    bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  });

  @override
  $DSLatLngCopyWith<$Res> get position;
}

/// @nodoc
class __$$DSMapMarkerImplCopyWithImpl<$Res>
    extends _$DSMapMarkerCopyWithImpl<$Res, _$DSMapMarkerImpl>
    implements _$$DSMapMarkerImplCopyWith<$Res> {
  __$$DSMapMarkerImplCopyWithImpl(
    _$DSMapMarkerImpl _value,
    $Res Function(_$DSMapMarkerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapMarker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? iconData = freezed,
    Object? color = freezed,
    Object? type = null,
    Object? draggable = null,
    Object? visible = null,
    Object? metadata = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _$DSMapMarkerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as DSLatLng,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        iconData: freezed == iconData
            ? _value.iconData
            : iconData // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSMapMarkerType,
        draggable: null == draggable
            ? _value.draggable
            : draggable // ignore: cast_nullable_to_non_nullable
                  as bool,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSMapMarkerImpl implements _DSMapMarker {
  const _$DSMapMarkerImpl({
    required this.id,
    required this.position,
    this.title,
    this.description,
    this.icon,
    this.iconData,
    this.color,
    this.type = DSMapMarkerType.standard,
    this.draggable = true,
    this.visible = true,
    final Map<String, dynamic>? metadata,
    this.onTap,
  }) : _metadata = metadata;

  @override
  final String id;
  @override
  final DSLatLng position;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final Widget? icon;
  @override
  final IconData? iconData;
  @override
  final Color? color;
  @override
  @JsonKey()
  final DSMapMarkerType type;
  @override
  @JsonKey()
  final bool draggable;
  @override
  @JsonKey()
  final bool visible;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final VoidCallback? onTap;

  @override
  String toString() {
    return 'DSMapMarker(id: $id, position: $position, title: $title, description: $description, icon: $icon, iconData: $iconData, color: $color, type: $type, draggable: $draggable, visible: $visible, metadata: $metadata, onTap: $onTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapMarkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.draggable, draggable) ||
                other.draggable == draggable) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    position,
    title,
    description,
    icon,
    iconData,
    color,
    type,
    draggable,
    visible,
    const DeepCollectionEquality().hash(_metadata),
    onTap,
  );

  /// Create a copy of DSMapMarker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapMarkerImplCopyWith<_$DSMapMarkerImpl> get copyWith =>
      __$$DSMapMarkerImplCopyWithImpl<_$DSMapMarkerImpl>(this, _$identity);
}

abstract class _DSMapMarker implements DSMapMarker {
  const factory _DSMapMarker({
    required final String id,
    required final DSLatLng position,
    final String? title,
    final String? description,
    final Widget? icon,
    final IconData? iconData,
    final Color? color,
    final DSMapMarkerType type,
    final bool draggable,
    final bool visible,
    final Map<String, dynamic>? metadata,
    final VoidCallback? onTap,
  }) = _$DSMapMarkerImpl;

  @override
  String get id;
  @override
  DSLatLng get position;
  @override
  String? get title;
  @override
  String? get description;
  @override
  Widget? get icon;
  @override
  IconData? get iconData;
  @override
  Color? get color;
  @override
  DSMapMarkerType get type;
  @override
  bool get draggable;
  @override
  bool get visible;
  @override
  Map<String, dynamic>? get metadata;
  @override
  VoidCallback? get onTap;

  /// Create a copy of DSMapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapMarkerImplCopyWith<_$DSMapMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSMapShape {
  String get id => throw _privateConstructorUsedError;
  DSMapShapeType get type => throw _privateConstructorUsedError;
  List<DSLatLng> get points => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Color? get strokeColor => throw _privateConstructorUsedError;
  Color? get fillColor => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;

  /// Create a copy of DSMapShape
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSMapShapeCopyWith<DSMapShape> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSMapShapeCopyWith<$Res> {
  factory $DSMapShapeCopyWith(
    DSMapShape value,
    $Res Function(DSMapShape) then,
  ) = _$DSMapShapeCopyWithImpl<$Res, DSMapShape>;
  @useResult
  $Res call({
    String id,
    DSMapShapeType type,
    List<DSLatLng> points,
    String? title,
    String? description,
    Color? strokeColor,
    Color? fillColor,
    double strokeWidth,
    bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  });
}

/// @nodoc
class _$DSMapShapeCopyWithImpl<$Res, $Val extends DSMapShape>
    implements $DSMapShapeCopyWith<$Res> {
  _$DSMapShapeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSMapShape
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? points = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? strokeColor = freezed,
    Object? fillColor = freezed,
    Object? strokeWidth = null,
    Object? visible = null,
    Object? metadata = freezed,
    Object? onTap = freezed,
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
                      as DSMapShapeType,
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as List<DSLatLng>,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            strokeColor: freezed == strokeColor
                ? _value.strokeColor
                : strokeColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            fillColor: freezed == fillColor
                ? _value.fillColor
                : fillColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            strokeWidth: null == strokeWidth
                ? _value.strokeWidth
                : strokeWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSMapShapeImplCopyWith<$Res>
    implements $DSMapShapeCopyWith<$Res> {
  factory _$$DSMapShapeImplCopyWith(
    _$DSMapShapeImpl value,
    $Res Function(_$DSMapShapeImpl) then,
  ) = __$$DSMapShapeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DSMapShapeType type,
    List<DSLatLng> points,
    String? title,
    String? description,
    Color? strokeColor,
    Color? fillColor,
    double strokeWidth,
    bool visible,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
  });
}

/// @nodoc
class __$$DSMapShapeImplCopyWithImpl<$Res>
    extends _$DSMapShapeCopyWithImpl<$Res, _$DSMapShapeImpl>
    implements _$$DSMapShapeImplCopyWith<$Res> {
  __$$DSMapShapeImplCopyWithImpl(
    _$DSMapShapeImpl _value,
    $Res Function(_$DSMapShapeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSMapShape
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? points = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? strokeColor = freezed,
    Object? fillColor = freezed,
    Object? strokeWidth = null,
    Object? visible = null,
    Object? metadata = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _$DSMapShapeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSMapShapeType,
        points: null == points
            ? _value._points
            : points // ignore: cast_nullable_to_non_nullable
                  as List<DSLatLng>,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        strokeColor: freezed == strokeColor
            ? _value.strokeColor
            : strokeColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        fillColor: freezed == fillColor
            ? _value.fillColor
            : fillColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        strokeWidth: null == strokeWidth
            ? _value.strokeWidth
            : strokeWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSMapShapeImpl implements _DSMapShape {
  const _$DSMapShapeImpl({
    required this.id,
    required this.type,
    required final List<DSLatLng> points,
    this.title,
    this.description,
    this.strokeColor,
    this.fillColor,
    this.strokeWidth = 2.0,
    this.visible = true,
    final Map<String, dynamic>? metadata,
    this.onTap,
  }) : _points = points,
       _metadata = metadata;

  @override
  final String id;
  @override
  final DSMapShapeType type;
  final List<DSLatLng> _points;
  @override
  List<DSLatLng> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final String? title;
  @override
  final String? description;
  @override
  final Color? strokeColor;
  @override
  final Color? fillColor;
  @override
  @JsonKey()
  final double strokeWidth;
  @override
  @JsonKey()
  final bool visible;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final VoidCallback? onTap;

  @override
  String toString() {
    return 'DSMapShape(id: $id, type: $type, points: $points, title: $title, description: $description, strokeColor: $strokeColor, fillColor: $fillColor, strokeWidth: $strokeWidth, visible: $visible, metadata: $metadata, onTap: $onTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSMapShapeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.strokeColor, strokeColor) ||
                other.strokeColor == strokeColor) &&
            (identical(other.fillColor, fillColor) ||
                other.fillColor == fillColor) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    const DeepCollectionEquality().hash(_points),
    title,
    description,
    strokeColor,
    fillColor,
    strokeWidth,
    visible,
    const DeepCollectionEquality().hash(_metadata),
    onTap,
  );

  /// Create a copy of DSMapShape
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSMapShapeImplCopyWith<_$DSMapShapeImpl> get copyWith =>
      __$$DSMapShapeImplCopyWithImpl<_$DSMapShapeImpl>(this, _$identity);
}

abstract class _DSMapShape implements DSMapShape {
  const factory _DSMapShape({
    required final String id,
    required final DSMapShapeType type,
    required final List<DSLatLng> points,
    final String? title,
    final String? description,
    final Color? strokeColor,
    final Color? fillColor,
    final double strokeWidth,
    final bool visible,
    final Map<String, dynamic>? metadata,
    final VoidCallback? onTap,
  }) = _$DSMapShapeImpl;

  @override
  String get id;
  @override
  DSMapShapeType get type;
  @override
  List<DSLatLng> get points;
  @override
  String? get title;
  @override
  String? get description;
  @override
  Color? get strokeColor;
  @override
  Color? get fillColor;
  @override
  double get strokeWidth;
  @override
  bool get visible;
  @override
  Map<String, dynamic>? get metadata;
  @override
  VoidCallback? get onTap;

  /// Create a copy of DSMapShape
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSMapShapeImplCopyWith<_$DSMapShapeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
