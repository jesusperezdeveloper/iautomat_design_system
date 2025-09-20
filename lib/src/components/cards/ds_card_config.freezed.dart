// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_card_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSCardConfig {
  DSCardVariant get variant => throw _privateConstructorUsedError;
  DSCardState get state => throw _privateConstructorUsedError;
  bool get isAdaptive => throw _privateConstructorUsedError;
  bool get isRtl => throw _privateConstructorUsedError;
  bool get enableA11y => throw _privateConstructorUsedError;
  bool get enableKeyboardSupport => throw _privateConstructorUsedError;
  bool get isInteractive => throw _privateConstructorUsedError;
  DSCardColors? get colors => throw _privateConstructorUsedError;
  DSCardSpacing? get spacing => throw _privateConstructorUsedError;
  DSCardElevation? get elevation => throw _privateConstructorUsedError;
  DSCardBehavior? get behavior => throw _privateConstructorUsedError;
  DSCardAnimation? get animation => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;
  VoidCallback? get onDoubleTap => throw _privateConstructorUsedError;
  VoidCallback? get onLongPress => throw _privateConstructorUsedError;
  ValueChanged<bool>? get onHover => throw _privateConstructorUsedError;
  ValueChanged<bool>? get onFocusChange => throw _privateConstructorUsedError;

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCardConfigCopyWith<DSCardConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCardConfigCopyWith<$Res> {
  factory $DSCardConfigCopyWith(
    DSCardConfig value,
    $Res Function(DSCardConfig) then,
  ) = _$DSCardConfigCopyWithImpl<$Res, DSCardConfig>;
  @useResult
  $Res call({
    DSCardVariant variant,
    DSCardState state,
    bool isAdaptive,
    bool isRtl,
    bool enableA11y,
    bool enableKeyboardSupport,
    bool isInteractive,
    DSCardColors? colors,
    DSCardSpacing? spacing,
    DSCardElevation? elevation,
    DSCardBehavior? behavior,
    DSCardAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  });

  $DSCardColorsCopyWith<$Res>? get colors;
  $DSCardSpacingCopyWith<$Res>? get spacing;
  $DSCardElevationCopyWith<$Res>? get elevation;
  $DSCardBehaviorCopyWith<$Res>? get behavior;
  $DSCardAnimationCopyWith<$Res>? get animation;
}

/// @nodoc
class _$DSCardConfigCopyWithImpl<$Res, $Val extends DSCardConfig>
    implements $DSCardConfigCopyWith<$Res> {
  _$DSCardConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? isAdaptive = null,
    Object? isRtl = null,
    Object? enableA11y = null,
    Object? enableKeyboardSupport = null,
    Object? isInteractive = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
    Object? onTap = freezed,
    Object? onDoubleTap = freezed,
    Object? onLongPress = freezed,
    Object? onHover = freezed,
    Object? onFocusChange = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSCardVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSCardState,
            isAdaptive: null == isAdaptive
                ? _value.isAdaptive
                : isAdaptive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRtl: null == isRtl
                ? _value.isRtl
                : isRtl // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableA11y: null == enableA11y
                ? _value.enableA11y
                : enableA11y // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardSupport: null == enableKeyboardSupport
                ? _value.enableKeyboardSupport
                : enableKeyboardSupport // ignore: cast_nullable_to_non_nullable
                      as bool,
            isInteractive: null == isInteractive
                ? _value.isInteractive
                : isInteractive // ignore: cast_nullable_to_non_nullable
                      as bool,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSCardColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSCardSpacing?,
            elevation: freezed == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as DSCardElevation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSCardBehavior?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSCardAnimation?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            onDoubleTap: freezed == onDoubleTap
                ? _value.onDoubleTap
                : onDoubleTap // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCardColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSCardColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCardSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSCardSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCardElevationCopyWith<$Res>? get elevation {
    if (_value.elevation == null) {
      return null;
    }

    return $DSCardElevationCopyWith<$Res>(_value.elevation!, (value) {
      return _then(_value.copyWith(elevation: value) as $Val);
    });
  }

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCardBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSCardBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSCardAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSCardAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSCardConfigImplCopyWith<$Res>
    implements $DSCardConfigCopyWith<$Res> {
  factory _$$DSCardConfigImplCopyWith(
    _$DSCardConfigImpl value,
    $Res Function(_$DSCardConfigImpl) then,
  ) = __$$DSCardConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSCardVariant variant,
    DSCardState state,
    bool isAdaptive,
    bool isRtl,
    bool enableA11y,
    bool enableKeyboardSupport,
    bool isInteractive,
    DSCardColors? colors,
    DSCardSpacing? spacing,
    DSCardElevation? elevation,
    DSCardBehavior? behavior,
    DSCardAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  });

  @override
  $DSCardColorsCopyWith<$Res>? get colors;
  @override
  $DSCardSpacingCopyWith<$Res>? get spacing;
  @override
  $DSCardElevationCopyWith<$Res>? get elevation;
  @override
  $DSCardBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSCardAnimationCopyWith<$Res>? get animation;
}

/// @nodoc
class __$$DSCardConfigImplCopyWithImpl<$Res>
    extends _$DSCardConfigCopyWithImpl<$Res, _$DSCardConfigImpl>
    implements _$$DSCardConfigImplCopyWith<$Res> {
  __$$DSCardConfigImplCopyWithImpl(
    _$DSCardConfigImpl _value,
    $Res Function(_$DSCardConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? isAdaptive = null,
    Object? isRtl = null,
    Object? enableA11y = null,
    Object? enableKeyboardSupport = null,
    Object? isInteractive = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
    Object? onTap = freezed,
    Object? onDoubleTap = freezed,
    Object? onLongPress = freezed,
    Object? onHover = freezed,
    Object? onFocusChange = freezed,
  }) {
    return _then(
      _$DSCardConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSCardVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSCardState,
        isAdaptive: null == isAdaptive
            ? _value.isAdaptive
            : isAdaptive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRtl: null == isRtl
            ? _value.isRtl
            : isRtl // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableA11y: null == enableA11y
            ? _value.enableA11y
            : enableA11y // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardSupport: null == enableKeyboardSupport
            ? _value.enableKeyboardSupport
            : enableKeyboardSupport // ignore: cast_nullable_to_non_nullable
                  as bool,
        isInteractive: null == isInteractive
            ? _value.isInteractive
            : isInteractive // ignore: cast_nullable_to_non_nullable
                  as bool,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSCardColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSCardSpacing?,
        elevation: freezed == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as DSCardElevation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSCardBehavior?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSCardAnimation?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        onDoubleTap: freezed == onDoubleTap
            ? _value.onDoubleTap
            : onDoubleTap // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc

class _$DSCardConfigImpl implements _DSCardConfig {
  const _$DSCardConfigImpl({
    this.variant = DSCardVariant.elevated,
    this.state = DSCardState.defaultState,
    this.isAdaptive = true,
    this.isRtl = false,
    this.enableA11y = true,
    this.enableKeyboardSupport = true,
    this.isInteractive = true,
    this.colors,
    this.spacing,
    this.elevation,
    this.behavior,
    this.animation,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
  });

  @override
  @JsonKey()
  final DSCardVariant variant;
  @override
  @JsonKey()
  final DSCardState state;
  @override
  @JsonKey()
  final bool isAdaptive;
  @override
  @JsonKey()
  final bool isRtl;
  @override
  @JsonKey()
  final bool enableA11y;
  @override
  @JsonKey()
  final bool enableKeyboardSupport;
  @override
  @JsonKey()
  final bool isInteractive;
  @override
  final DSCardColors? colors;
  @override
  final DSCardSpacing? spacing;
  @override
  final DSCardElevation? elevation;
  @override
  final DSCardBehavior? behavior;
  @override
  final DSCardAnimation? animation;
  @override
  final VoidCallback? onTap;
  @override
  final VoidCallback? onDoubleTap;
  @override
  final VoidCallback? onLongPress;
  @override
  final ValueChanged<bool>? onHover;
  @override
  final ValueChanged<bool>? onFocusChange;

  @override
  String toString() {
    return 'DSCardConfig(variant: $variant, state: $state, isAdaptive: $isAdaptive, isRtl: $isRtl, enableA11y: $enableA11y, enableKeyboardSupport: $enableKeyboardSupport, isInteractive: $isInteractive, colors: $colors, spacing: $spacing, elevation: $elevation, behavior: $behavior, animation: $animation, onTap: $onTap, onDoubleTap: $onDoubleTap, onLongPress: $onLongPress, onHover: $onHover, onFocusChange: $onFocusChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCardConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isAdaptive, isAdaptive) ||
                other.isAdaptive == isAdaptive) &&
            (identical(other.isRtl, isRtl) || other.isRtl == isRtl) &&
            (identical(other.enableA11y, enableA11y) ||
                other.enableA11y == enableA11y) &&
            (identical(other.enableKeyboardSupport, enableKeyboardSupport) ||
                other.enableKeyboardSupport == enableKeyboardSupport) &&
            (identical(other.isInteractive, isInteractive) ||
                other.isInteractive == isInteractive) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.animation, animation) ||
                other.animation == animation) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.onDoubleTap, onDoubleTap) ||
                other.onDoubleTap == onDoubleTap) &&
            (identical(other.onLongPress, onLongPress) ||
                other.onLongPress == onLongPress) &&
            (identical(other.onHover, onHover) || other.onHover == onHover) &&
            (identical(other.onFocusChange, onFocusChange) ||
                other.onFocusChange == onFocusChange));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    state,
    isAdaptive,
    isRtl,
    enableA11y,
    enableKeyboardSupport,
    isInteractive,
    colors,
    spacing,
    elevation,
    behavior,
    animation,
    onTap,
    onDoubleTap,
    onLongPress,
    onHover,
    onFocusChange,
  );

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCardConfigImplCopyWith<_$DSCardConfigImpl> get copyWith =>
      __$$DSCardConfigImplCopyWithImpl<_$DSCardConfigImpl>(this, _$identity);
}

abstract class _DSCardConfig implements DSCardConfig {
  const factory _DSCardConfig({
    final DSCardVariant variant,
    final DSCardState state,
    final bool isAdaptive,
    final bool isRtl,
    final bool enableA11y,
    final bool enableKeyboardSupport,
    final bool isInteractive,
    final DSCardColors? colors,
    final DSCardSpacing? spacing,
    final DSCardElevation? elevation,
    final DSCardBehavior? behavior,
    final DSCardAnimation? animation,
    final VoidCallback? onTap,
    final VoidCallback? onDoubleTap,
    final VoidCallback? onLongPress,
    final ValueChanged<bool>? onHover,
    final ValueChanged<bool>? onFocusChange,
  }) = _$DSCardConfigImpl;

  @override
  DSCardVariant get variant;
  @override
  DSCardState get state;
  @override
  bool get isAdaptive;
  @override
  bool get isRtl;
  @override
  bool get enableA11y;
  @override
  bool get enableKeyboardSupport;
  @override
  bool get isInteractive;
  @override
  DSCardColors? get colors;
  @override
  DSCardSpacing? get spacing;
  @override
  DSCardElevation? get elevation;
  @override
  DSCardBehavior? get behavior;
  @override
  DSCardAnimation? get animation;
  @override
  VoidCallback? get onTap;
  @override
  VoidCallback? get onDoubleTap;
  @override
  VoidCallback? get onLongPress;
  @override
  ValueChanged<bool>? get onHover;
  @override
  ValueChanged<bool>? get onFocusChange;

  /// Create a copy of DSCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCardConfigImplCopyWith<_$DSCardConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCardColors {
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get surfaceColor => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get borderColor => throw _privateConstructorUsedError;
  Color? get hoverColor => throw _privateConstructorUsedError;
  Color? get pressedColor => throw _privateConstructorUsedError;
  Color? get focusColor => throw _privateConstructorUsedError;
  Color? get selectedColor => throw _privateConstructorUsedError;
  Color? get disabledColor => throw _privateConstructorUsedError;
  Color? get loadingColor => throw _privateConstructorUsedError;
  Color? get skeletonColor => throw _privateConstructorUsedError;
  Color? get headerTextColor => throw _privateConstructorUsedError;
  Color? get bodyTextColor => throw _privateConstructorUsedError;
  Color? get footerTextColor => throw _privateConstructorUsedError;

  /// Create a copy of DSCardColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCardColorsCopyWith<DSCardColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCardColorsCopyWith<$Res> {
  factory $DSCardColorsCopyWith(
    DSCardColors value,
    $Res Function(DSCardColors) then,
  ) = _$DSCardColorsCopyWithImpl<$Res, DSCardColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? borderColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? headerTextColor,
    Color? bodyTextColor,
    Color? footerTextColor,
  });
}

/// @nodoc
class _$DSCardColorsCopyWithImpl<$Res, $Val extends DSCardColors>
    implements $DSCardColorsCopyWith<$Res> {
  _$DSCardColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCardColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? surfaceColor = freezed,
    Object? shadowColor = freezed,
    Object? borderColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonColor = freezed,
    Object? headerTextColor = freezed,
    Object? bodyTextColor = freezed,
    Object? footerTextColor = freezed,
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
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
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
            headerTextColor: freezed == headerTextColor
                ? _value.headerTextColor
                : headerTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            bodyTextColor: freezed == bodyTextColor
                ? _value.bodyTextColor
                : bodyTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            footerTextColor: freezed == footerTextColor
                ? _value.footerTextColor
                : footerTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCardColorsImplCopyWith<$Res>
    implements $DSCardColorsCopyWith<$Res> {
  factory _$$DSCardColorsImplCopyWith(
    _$DSCardColorsImpl value,
    $Res Function(_$DSCardColorsImpl) then,
  ) = __$$DSCardColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? borderColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonColor,
    Color? headerTextColor,
    Color? bodyTextColor,
    Color? footerTextColor,
  });
}

/// @nodoc
class __$$DSCardColorsImplCopyWithImpl<$Res>
    extends _$DSCardColorsCopyWithImpl<$Res, _$DSCardColorsImpl>
    implements _$$DSCardColorsImplCopyWith<$Res> {
  __$$DSCardColorsImplCopyWithImpl(
    _$DSCardColorsImpl _value,
    $Res Function(_$DSCardColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCardColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? surfaceColor = freezed,
    Object? shadowColor = freezed,
    Object? borderColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonColor = freezed,
    Object? headerTextColor = freezed,
    Object? bodyTextColor = freezed,
    Object? footerTextColor = freezed,
  }) {
    return _then(
      _$DSCardColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceColor: freezed == surfaceColor
            ? _value.surfaceColor
            : surfaceColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
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
        headerTextColor: freezed == headerTextColor
            ? _value.headerTextColor
            : headerTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        bodyTextColor: freezed == bodyTextColor
            ? _value.bodyTextColor
            : bodyTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        footerTextColor: freezed == footerTextColor
            ? _value.footerTextColor
            : footerTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSCardColorsImpl implements _DSCardColors {
  const _$DSCardColorsImpl({
    this.backgroundColor,
    this.surfaceColor,
    this.shadowColor,
    this.borderColor,
    this.hoverColor,
    this.pressedColor,
    this.focusColor,
    this.selectedColor,
    this.disabledColor,
    this.loadingColor,
    this.skeletonColor,
    this.headerTextColor,
    this.bodyTextColor,
    this.footerTextColor,
  });

  @override
  final Color? backgroundColor;
  @override
  final Color? surfaceColor;
  @override
  final Color? shadowColor;
  @override
  final Color? borderColor;
  @override
  final Color? hoverColor;
  @override
  final Color? pressedColor;
  @override
  final Color? focusColor;
  @override
  final Color? selectedColor;
  @override
  final Color? disabledColor;
  @override
  final Color? loadingColor;
  @override
  final Color? skeletonColor;
  @override
  final Color? headerTextColor;
  @override
  final Color? bodyTextColor;
  @override
  final Color? footerTextColor;

  @override
  String toString() {
    return 'DSCardColors(backgroundColor: $backgroundColor, surfaceColor: $surfaceColor, shadowColor: $shadowColor, borderColor: $borderColor, hoverColor: $hoverColor, pressedColor: $pressedColor, focusColor: $focusColor, selectedColor: $selectedColor, disabledColor: $disabledColor, loadingColor: $loadingColor, skeletonColor: $skeletonColor, headerTextColor: $headerTextColor, bodyTextColor: $bodyTextColor, footerTextColor: $footerTextColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCardColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.surfaceColor, surfaceColor) ||
                other.surfaceColor == surfaceColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
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
            (identical(other.headerTextColor, headerTextColor) ||
                other.headerTextColor == headerTextColor) &&
            (identical(other.bodyTextColor, bodyTextColor) ||
                other.bodyTextColor == bodyTextColor) &&
            (identical(other.footerTextColor, footerTextColor) ||
                other.footerTextColor == footerTextColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    surfaceColor,
    shadowColor,
    borderColor,
    hoverColor,
    pressedColor,
    focusColor,
    selectedColor,
    disabledColor,
    loadingColor,
    skeletonColor,
    headerTextColor,
    bodyTextColor,
    footerTextColor,
  );

  /// Create a copy of DSCardColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCardColorsImplCopyWith<_$DSCardColorsImpl> get copyWith =>
      __$$DSCardColorsImplCopyWithImpl<_$DSCardColorsImpl>(this, _$identity);
}

abstract class _DSCardColors implements DSCardColors {
  const factory _DSCardColors({
    final Color? backgroundColor,
    final Color? surfaceColor,
    final Color? shadowColor,
    final Color? borderColor,
    final Color? hoverColor,
    final Color? pressedColor,
    final Color? focusColor,
    final Color? selectedColor,
    final Color? disabledColor,
    final Color? loadingColor,
    final Color? skeletonColor,
    final Color? headerTextColor,
    final Color? bodyTextColor,
    final Color? footerTextColor,
  }) = _$DSCardColorsImpl;

  @override
  Color? get backgroundColor;
  @override
  Color? get surfaceColor;
  @override
  Color? get shadowColor;
  @override
  Color? get borderColor;
  @override
  Color? get hoverColor;
  @override
  Color? get pressedColor;
  @override
  Color? get focusColor;
  @override
  Color? get selectedColor;
  @override
  Color? get disabledColor;
  @override
  Color? get loadingColor;
  @override
  Color? get skeletonColor;
  @override
  Color? get headerTextColor;
  @override
  Color? get bodyTextColor;
  @override
  Color? get footerTextColor;

  /// Create a copy of DSCardColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCardColorsImplCopyWith<_$DSCardColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCardSpacing {
  double get padding => throw _privateConstructorUsedError;
  double get headerPadding => throw _privateConstructorUsedError;
  double get bodyPadding => throw _privateConstructorUsedError;
  double get footerPadding => throw _privateConstructorUsedError;
  double get spacing => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  double get borderWidth => throw _privateConstructorUsedError;
  double get minHeight => throw _privateConstructorUsedError;
  bool get adaptive => throw _privateConstructorUsedError;

  /// Create a copy of DSCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCardSpacingCopyWith<DSCardSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCardSpacingCopyWith<$Res> {
  factory $DSCardSpacingCopyWith(
    DSCardSpacing value,
    $Res Function(DSCardSpacing) then,
  ) = _$DSCardSpacingCopyWithImpl<$Res, DSCardSpacing>;
  @useResult
  $Res call({
    double padding,
    double headerPadding,
    double bodyPadding,
    double footerPadding,
    double spacing,
    double borderRadius,
    double borderWidth,
    double minHeight,
    bool adaptive,
  });
}

/// @nodoc
class _$DSCardSpacingCopyWithImpl<$Res, $Val extends DSCardSpacing>
    implements $DSCardSpacingCopyWith<$Res> {
  _$DSCardSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? headerPadding = null,
    Object? bodyPadding = null,
    Object? footerPadding = null,
    Object? spacing = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? minHeight = null,
    Object? adaptive = null,
  }) {
    return _then(
      _value.copyWith(
            padding: null == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                      as double,
            headerPadding: null == headerPadding
                ? _value.headerPadding
                : headerPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            bodyPadding: null == bodyPadding
                ? _value.bodyPadding
                : bodyPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            footerPadding: null == footerPadding
                ? _value.footerPadding
                : footerPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            spacing: null == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as double,
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            borderWidth: null == borderWidth
                ? _value.borderWidth
                : borderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            minHeight: null == minHeight
                ? _value.minHeight
                : minHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            adaptive: null == adaptive
                ? _value.adaptive
                : adaptive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCardSpacingImplCopyWith<$Res>
    implements $DSCardSpacingCopyWith<$Res> {
  factory _$$DSCardSpacingImplCopyWith(
    _$DSCardSpacingImpl value,
    $Res Function(_$DSCardSpacingImpl) then,
  ) = __$$DSCardSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double padding,
    double headerPadding,
    double bodyPadding,
    double footerPadding,
    double spacing,
    double borderRadius,
    double borderWidth,
    double minHeight,
    bool adaptive,
  });
}

/// @nodoc
class __$$DSCardSpacingImplCopyWithImpl<$Res>
    extends _$DSCardSpacingCopyWithImpl<$Res, _$DSCardSpacingImpl>
    implements _$$DSCardSpacingImplCopyWith<$Res> {
  __$$DSCardSpacingImplCopyWithImpl(
    _$DSCardSpacingImpl _value,
    $Res Function(_$DSCardSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? headerPadding = null,
    Object? bodyPadding = null,
    Object? footerPadding = null,
    Object? spacing = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? minHeight = null,
    Object? adaptive = null,
  }) {
    return _then(
      _$DSCardSpacingImpl(
        padding: null == padding
            ? _value.padding
            : padding // ignore: cast_nullable_to_non_nullable
                  as double,
        headerPadding: null == headerPadding
            ? _value.headerPadding
            : headerPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        bodyPadding: null == bodyPadding
            ? _value.bodyPadding
            : bodyPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        footerPadding: null == footerPadding
            ? _value.footerPadding
            : footerPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        spacing: null == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as double,
        borderRadius: null == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        borderWidth: null == borderWidth
            ? _value.borderWidth
            : borderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        minHeight: null == minHeight
            ? _value.minHeight
            : minHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        adaptive: null == adaptive
            ? _value.adaptive
            : adaptive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSCardSpacingImpl implements _DSCardSpacing {
  const _$DSCardSpacingImpl({
    this.padding = 16.0,
    this.headerPadding = 12.0,
    this.bodyPadding = 16.0,
    this.footerPadding = 12.0,
    this.spacing = 8.0,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.minHeight = 48.0,
    this.adaptive = true,
  });

  @override
  @JsonKey()
  final double padding;
  @override
  @JsonKey()
  final double headerPadding;
  @override
  @JsonKey()
  final double bodyPadding;
  @override
  @JsonKey()
  final double footerPadding;
  @override
  @JsonKey()
  final double spacing;
  @override
  @JsonKey()
  final double borderRadius;
  @override
  @JsonKey()
  final double borderWidth;
  @override
  @JsonKey()
  final double minHeight;
  @override
  @JsonKey()
  final bool adaptive;

  @override
  String toString() {
    return 'DSCardSpacing(padding: $padding, headerPadding: $headerPadding, bodyPadding: $bodyPadding, footerPadding: $footerPadding, spacing: $spacing, borderRadius: $borderRadius, borderWidth: $borderWidth, minHeight: $minHeight, adaptive: $adaptive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCardSpacingImpl &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.headerPadding, headerPadding) ||
                other.headerPadding == headerPadding) &&
            (identical(other.bodyPadding, bodyPadding) ||
                other.bodyPadding == bodyPadding) &&
            (identical(other.footerPadding, footerPadding) ||
                other.footerPadding == footerPadding) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.adaptive, adaptive) ||
                other.adaptive == adaptive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    padding,
    headerPadding,
    bodyPadding,
    footerPadding,
    spacing,
    borderRadius,
    borderWidth,
    minHeight,
    adaptive,
  );

  /// Create a copy of DSCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCardSpacingImplCopyWith<_$DSCardSpacingImpl> get copyWith =>
      __$$DSCardSpacingImplCopyWithImpl<_$DSCardSpacingImpl>(this, _$identity);
}

abstract class _DSCardSpacing implements DSCardSpacing {
  const factory _DSCardSpacing({
    final double padding,
    final double headerPadding,
    final double bodyPadding,
    final double footerPadding,
    final double spacing,
    final double borderRadius,
    final double borderWidth,
    final double minHeight,
    final bool adaptive,
  }) = _$DSCardSpacingImpl;

  @override
  double get padding;
  @override
  double get headerPadding;
  @override
  double get bodyPadding;
  @override
  double get footerPadding;
  @override
  double get spacing;
  @override
  double get borderRadius;
  @override
  double get borderWidth;
  @override
  double get minHeight;
  @override
  bool get adaptive;

  /// Create a copy of DSCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCardSpacingImplCopyWith<_$DSCardSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCardElevation {
  double get defaultElevation => throw _privateConstructorUsedError;
  double get hoveredElevation => throw _privateConstructorUsedError;
  double get pressedElevation => throw _privateConstructorUsedError;
  double get focusedElevation => throw _privateConstructorUsedError;
  double get selectedElevation => throw _privateConstructorUsedError;
  double get disabledElevation => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get surfaceTintColor => throw _privateConstructorUsedError;

  /// Create a copy of DSCardElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCardElevationCopyWith<DSCardElevation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCardElevationCopyWith<$Res> {
  factory $DSCardElevationCopyWith(
    DSCardElevation value,
    $Res Function(DSCardElevation) then,
  ) = _$DSCardElevationCopyWithImpl<$Res, DSCardElevation>;
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
class _$DSCardElevationCopyWithImpl<$Res, $Val extends DSCardElevation>
    implements $DSCardElevationCopyWith<$Res> {
  _$DSCardElevationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCardElevation
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
abstract class _$$DSCardElevationImplCopyWith<$Res>
    implements $DSCardElevationCopyWith<$Res> {
  factory _$$DSCardElevationImplCopyWith(
    _$DSCardElevationImpl value,
    $Res Function(_$DSCardElevationImpl) then,
  ) = __$$DSCardElevationImplCopyWithImpl<$Res>;
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
class __$$DSCardElevationImplCopyWithImpl<$Res>
    extends _$DSCardElevationCopyWithImpl<$Res, _$DSCardElevationImpl>
    implements _$$DSCardElevationImplCopyWith<$Res> {
  __$$DSCardElevationImplCopyWithImpl(
    _$DSCardElevationImpl _value,
    $Res Function(_$DSCardElevationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCardElevation
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
      _$DSCardElevationImpl(
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

class _$DSCardElevationImpl implements _DSCardElevation {
  const _$DSCardElevationImpl({
    this.defaultElevation = 1.0,
    this.hoveredElevation = 4.0,
    this.pressedElevation = 8.0,
    this.focusedElevation = 2.0,
    this.selectedElevation = 6.0,
    this.disabledElevation = 0.0,
    this.shadowColor,
    this.surfaceTintColor,
  });

  @override
  @JsonKey()
  final double defaultElevation;
  @override
  @JsonKey()
  final double hoveredElevation;
  @override
  @JsonKey()
  final double pressedElevation;
  @override
  @JsonKey()
  final double focusedElevation;
  @override
  @JsonKey()
  final double selectedElevation;
  @override
  @JsonKey()
  final double disabledElevation;
  @override
  final Color? shadowColor;
  @override
  final Color? surfaceTintColor;

  @override
  String toString() {
    return 'DSCardElevation(defaultElevation: $defaultElevation, hoveredElevation: $hoveredElevation, pressedElevation: $pressedElevation, focusedElevation: $focusedElevation, selectedElevation: $selectedElevation, disabledElevation: $disabledElevation, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCardElevationImpl &&
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

  /// Create a copy of DSCardElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCardElevationImplCopyWith<_$DSCardElevationImpl> get copyWith =>
      __$$DSCardElevationImplCopyWithImpl<_$DSCardElevationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCardElevation implements DSCardElevation {
  const factory _DSCardElevation({
    final double defaultElevation,
    final double hoveredElevation,
    final double pressedElevation,
    final double focusedElevation,
    final double selectedElevation,
    final double disabledElevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
  }) = _$DSCardElevationImpl;

  @override
  double get defaultElevation;
  @override
  double get hoveredElevation;
  @override
  double get pressedElevation;
  @override
  double get focusedElevation;
  @override
  double get selectedElevation;
  @override
  double get disabledElevation;
  @override
  Color? get shadowColor;
  @override
  Color? get surfaceTintColor;

  /// Create a copy of DSCardElevation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCardElevationImplCopyWith<_$DSCardElevationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCardBehavior {
  bool get enableHapticFeedback => throw _privateConstructorUsedError;
  bool get enableRipple => throw _privateConstructorUsedError;
  bool get enableHover => throw _privateConstructorUsedError;
  bool get enableFocus => throw _privateConstructorUsedError;
  bool get maintainState => throw _privateConstructorUsedError;
  DSCardClipBehavior get clipBehavior => throw _privateConstructorUsedError;
  int get animationDuration => throw _privateConstructorUsedError;
  bool get showLoadingIndicator => throw _privateConstructorUsedError;
  bool get showSkeletonAnimation => throw _privateConstructorUsedError;

  /// Create a copy of DSCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCardBehaviorCopyWith<DSCardBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCardBehaviorCopyWith<$Res> {
  factory $DSCardBehaviorCopyWith(
    DSCardBehavior value,
    $Res Function(DSCardBehavior) then,
  ) = _$DSCardBehaviorCopyWithImpl<$Res, DSCardBehavior>;
  @useResult
  $Res call({
    bool enableHapticFeedback,
    bool enableRipple,
    bool enableHover,
    bool enableFocus,
    bool maintainState,
    DSCardClipBehavior clipBehavior,
    int animationDuration,
    bool showLoadingIndicator,
    bool showSkeletonAnimation,
  });
}

/// @nodoc
class _$DSCardBehaviorCopyWithImpl<$Res, $Val extends DSCardBehavior>
    implements $DSCardBehaviorCopyWith<$Res> {
  _$DSCardBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCardBehavior
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
                      as DSCardClipBehavior,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCardBehaviorImplCopyWith<$Res>
    implements $DSCardBehaviorCopyWith<$Res> {
  factory _$$DSCardBehaviorImplCopyWith(
    _$DSCardBehaviorImpl value,
    $Res Function(_$DSCardBehaviorImpl) then,
  ) = __$$DSCardBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enableHapticFeedback,
    bool enableRipple,
    bool enableHover,
    bool enableFocus,
    bool maintainState,
    DSCardClipBehavior clipBehavior,
    int animationDuration,
    bool showLoadingIndicator,
    bool showSkeletonAnimation,
  });
}

/// @nodoc
class __$$DSCardBehaviorImplCopyWithImpl<$Res>
    extends _$DSCardBehaviorCopyWithImpl<$Res, _$DSCardBehaviorImpl>
    implements _$$DSCardBehaviorImplCopyWith<$Res> {
  __$$DSCardBehaviorImplCopyWithImpl(
    _$DSCardBehaviorImpl _value,
    $Res Function(_$DSCardBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCardBehavior
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
  }) {
    return _then(
      _$DSCardBehaviorImpl(
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
                  as DSCardClipBehavior,
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
      ),
    );
  }
}

/// @nodoc

class _$DSCardBehaviorImpl implements _DSCardBehavior {
  const _$DSCardBehaviorImpl({
    this.enableHapticFeedback = true,
    this.enableRipple = true,
    this.enableHover = true,
    this.enableFocus = true,
    this.maintainState = true,
    this.clipBehavior = DSCardClipBehavior.antiAlias,
    this.animationDuration = 300,
    this.showLoadingIndicator = true,
    this.showSkeletonAnimation = true,
  });

  @override
  @JsonKey()
  final bool enableHapticFeedback;
  @override
  @JsonKey()
  final bool enableRipple;
  @override
  @JsonKey()
  final bool enableHover;
  @override
  @JsonKey()
  final bool enableFocus;
  @override
  @JsonKey()
  final bool maintainState;
  @override
  @JsonKey()
  final DSCardClipBehavior clipBehavior;
  @override
  @JsonKey()
  final int animationDuration;
  @override
  @JsonKey()
  final bool showLoadingIndicator;
  @override
  @JsonKey()
  final bool showSkeletonAnimation;

  @override
  String toString() {
    return 'DSCardBehavior(enableHapticFeedback: $enableHapticFeedback, enableRipple: $enableRipple, enableHover: $enableHover, enableFocus: $enableFocus, maintainState: $maintainState, clipBehavior: $clipBehavior, animationDuration: $animationDuration, showLoadingIndicator: $showLoadingIndicator, showSkeletonAnimation: $showSkeletonAnimation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCardBehaviorImpl &&
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
                other.showSkeletonAnimation == showSkeletonAnimation));
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
  );

  /// Create a copy of DSCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCardBehaviorImplCopyWith<_$DSCardBehaviorImpl> get copyWith =>
      __$$DSCardBehaviorImplCopyWithImpl<_$DSCardBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCardBehavior implements DSCardBehavior {
  const factory _DSCardBehavior({
    final bool enableHapticFeedback,
    final bool enableRipple,
    final bool enableHover,
    final bool enableFocus,
    final bool maintainState,
    final DSCardClipBehavior clipBehavior,
    final int animationDuration,
    final bool showLoadingIndicator,
    final bool showSkeletonAnimation,
  }) = _$DSCardBehaviorImpl;

  @override
  bool get enableHapticFeedback;
  @override
  bool get enableRipple;
  @override
  bool get enableHover;
  @override
  bool get enableFocus;
  @override
  bool get maintainState;
  @override
  DSCardClipBehavior get clipBehavior;
  @override
  int get animationDuration;
  @override
  bool get showLoadingIndicator;
  @override
  bool get showSkeletonAnimation;

  /// Create a copy of DSCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCardBehaviorImplCopyWith<_$DSCardBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSCardAnimation {
  DSCardAnimationType get type => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  bool get enableStateTransitions => throw _privateConstructorUsedError;
  bool get enableHoverAnimation => throw _privateConstructorUsedError;
  bool get enablePressAnimation => throw _privateConstructorUsedError;

  /// Create a copy of DSCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSCardAnimationCopyWith<DSCardAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSCardAnimationCopyWith<$Res> {
  factory $DSCardAnimationCopyWith(
    DSCardAnimation value,
    $Res Function(DSCardAnimation) then,
  ) = _$DSCardAnimationCopyWithImpl<$Res, DSCardAnimation>;
  @useResult
  $Res call({
    DSCardAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableHoverAnimation,
    bool enablePressAnimation,
  });
}

/// @nodoc
class _$DSCardAnimationCopyWithImpl<$Res, $Val extends DSCardAnimation>
    implements $DSCardAnimationCopyWith<$Res> {
  _$DSCardAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSCardAnimation
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
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSCardAnimationType,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSCardAnimationImplCopyWith<$Res>
    implements $DSCardAnimationCopyWith<$Res> {
  factory _$$DSCardAnimationImplCopyWith(
    _$DSCardAnimationImpl value,
    $Res Function(_$DSCardAnimationImpl) then,
  ) = __$$DSCardAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSCardAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableHoverAnimation,
    bool enablePressAnimation,
  });
}

/// @nodoc
class __$$DSCardAnimationImplCopyWithImpl<$Res>
    extends _$DSCardAnimationCopyWithImpl<$Res, _$DSCardAnimationImpl>
    implements _$$DSCardAnimationImplCopyWith<$Res> {
  __$$DSCardAnimationImplCopyWithImpl(
    _$DSCardAnimationImpl _value,
    $Res Function(_$DSCardAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSCardAnimation
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
  }) {
    return _then(
      _$DSCardAnimationImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSCardAnimationType,
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
      ),
    );
  }
}

/// @nodoc

class _$DSCardAnimationImpl implements _DSCardAnimation {
  const _$DSCardAnimationImpl({
    this.type = DSCardAnimationType.scale,
    this.duration = 300,
    this.curve = Curves.easeInOut,
    this.enableStateTransitions = true,
    this.enableHoverAnimation = true,
    this.enablePressAnimation = true,
  });

  @override
  @JsonKey()
  final DSCardAnimationType type;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final Curve curve;
  @override
  @JsonKey()
  final bool enableStateTransitions;
  @override
  @JsonKey()
  final bool enableHoverAnimation;
  @override
  @JsonKey()
  final bool enablePressAnimation;

  @override
  String toString() {
    return 'DSCardAnimation(type: $type, duration: $duration, curve: $curve, enableStateTransitions: $enableStateTransitions, enableHoverAnimation: $enableHoverAnimation, enablePressAnimation: $enablePressAnimation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSCardAnimationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.enableStateTransitions, enableStateTransitions) ||
                other.enableStateTransitions == enableStateTransitions) &&
            (identical(other.enableHoverAnimation, enableHoverAnimation) ||
                other.enableHoverAnimation == enableHoverAnimation) &&
            (identical(other.enablePressAnimation, enablePressAnimation) ||
                other.enablePressAnimation == enablePressAnimation));
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
  );

  /// Create a copy of DSCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSCardAnimationImplCopyWith<_$DSCardAnimationImpl> get copyWith =>
      __$$DSCardAnimationImplCopyWithImpl<_$DSCardAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSCardAnimation implements DSCardAnimation {
  const factory _DSCardAnimation({
    final DSCardAnimationType type,
    final int duration,
    final Curve curve,
    final bool enableStateTransitions,
    final bool enableHoverAnimation,
    final bool enablePressAnimation,
  }) = _$DSCardAnimationImpl;

  @override
  DSCardAnimationType get type;
  @override
  int get duration;
  @override
  Curve get curve;
  @override
  bool get enableStateTransitions;
  @override
  bool get enableHoverAnimation;
  @override
  bool get enablePressAnimation;

  /// Create a copy of DSCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSCardAnimationImplCopyWith<_$DSCardAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
