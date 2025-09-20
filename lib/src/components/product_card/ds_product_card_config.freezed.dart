// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_product_card_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSProductCardConfig {
  DSProductCardVariant get variant => throw _privateConstructorUsedError;
  DSProductCardState get state => throw _privateConstructorUsedError;
  DSProductCardColors? get colors => throw _privateConstructorUsedError;
  DSProductCardSpacing? get spacing => throw _privateConstructorUsedError;
  DSProductCardAnimation? get animation => throw _privateConstructorUsedError;
  DSProductCardBehavior? get behavior => throw _privateConstructorUsedError;
  DSProductCardA11yConfig? get a11yConfig => throw _privateConstructorUsedError;

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductCardConfigCopyWith<DSProductCardConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductCardConfigCopyWith<$Res> {
  factory $DSProductCardConfigCopyWith(
    DSProductCardConfig value,
    $Res Function(DSProductCardConfig) then,
  ) = _$DSProductCardConfigCopyWithImpl<$Res, DSProductCardConfig>;
  @useResult
  $Res call({
    DSProductCardVariant variant,
    DSProductCardState state,
    DSProductCardColors? colors,
    DSProductCardSpacing? spacing,
    DSProductCardAnimation? animation,
    DSProductCardBehavior? behavior,
    DSProductCardA11yConfig? a11yConfig,
  });

  $DSProductCardColorsCopyWith<$Res>? get colors;
  $DSProductCardSpacingCopyWith<$Res>? get spacing;
  $DSProductCardAnimationCopyWith<$Res>? get animation;
  $DSProductCardBehaviorCopyWith<$Res>? get behavior;
  $DSProductCardA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class _$DSProductCardConfigCopyWithImpl<$Res, $Val extends DSProductCardConfig>
    implements $DSProductCardConfigCopyWith<$Res> {
  _$DSProductCardConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
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
                      as DSProductCardVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSProductCardState,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSProductCardColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSProductCardSpacing?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSProductCardAnimation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSProductCardBehavior?,
            a11yConfig: freezed == a11yConfig
                ? _value.a11yConfig
                : a11yConfig // ignore: cast_nullable_to_non_nullable
                      as DSProductCardA11yConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProductCardColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSProductCardColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProductCardSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSProductCardSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProductCardAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSProductCardAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProductCardBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSProductCardBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSProductCardA11yConfigCopyWith<$Res>? get a11yConfig {
    if (_value.a11yConfig == null) {
      return null;
    }

    return $DSProductCardA11yConfigCopyWith<$Res>(_value.a11yConfig!, (value) {
      return _then(_value.copyWith(a11yConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSProductCardConfigImplCopyWith<$Res>
    implements $DSProductCardConfigCopyWith<$Res> {
  factory _$$DSProductCardConfigImplCopyWith(
    _$DSProductCardConfigImpl value,
    $Res Function(_$DSProductCardConfigImpl) then,
  ) = __$$DSProductCardConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSProductCardVariant variant,
    DSProductCardState state,
    DSProductCardColors? colors,
    DSProductCardSpacing? spacing,
    DSProductCardAnimation? animation,
    DSProductCardBehavior? behavior,
    DSProductCardA11yConfig? a11yConfig,
  });

  @override
  $DSProductCardColorsCopyWith<$Res>? get colors;
  @override
  $DSProductCardSpacingCopyWith<$Res>? get spacing;
  @override
  $DSProductCardAnimationCopyWith<$Res>? get animation;
  @override
  $DSProductCardBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSProductCardA11yConfigCopyWith<$Res>? get a11yConfig;
}

/// @nodoc
class __$$DSProductCardConfigImplCopyWithImpl<$Res>
    extends _$DSProductCardConfigCopyWithImpl<$Res, _$DSProductCardConfigImpl>
    implements _$$DSProductCardConfigImplCopyWith<$Res> {
  __$$DSProductCardConfigImplCopyWithImpl(
    _$DSProductCardConfigImpl _value,
    $Res Function(_$DSProductCardConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? animation = freezed,
    Object? behavior = freezed,
    Object? a11yConfig = freezed,
  }) {
    return _then(
      _$DSProductCardConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSProductCardVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSProductCardState,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSProductCardColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSProductCardSpacing?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSProductCardAnimation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSProductCardBehavior?,
        a11yConfig: freezed == a11yConfig
            ? _value.a11yConfig
            : a11yConfig // ignore: cast_nullable_to_non_nullable
                  as DSProductCardA11yConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSProductCardConfigImpl implements _DSProductCardConfig {
  const _$DSProductCardConfigImpl({
    this.variant = DSProductCardVariant.price,
    this.state = DSProductCardState.defaultState,
    this.colors,
    this.spacing,
    this.animation,
    this.behavior,
    this.a11yConfig,
  });

  @override
  @JsonKey()
  final DSProductCardVariant variant;
  @override
  @JsonKey()
  final DSProductCardState state;
  @override
  final DSProductCardColors? colors;
  @override
  final DSProductCardSpacing? spacing;
  @override
  final DSProductCardAnimation? animation;
  @override
  final DSProductCardBehavior? behavior;
  @override
  final DSProductCardA11yConfig? a11yConfig;

  @override
  String toString() {
    return 'DSProductCardConfig(variant: $variant, state: $state, colors: $colors, spacing: $spacing, animation: $animation, behavior: $behavior, a11yConfig: $a11yConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductCardConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
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
    colors,
    spacing,
    animation,
    behavior,
    a11yConfig,
  );

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductCardConfigImplCopyWith<_$DSProductCardConfigImpl> get copyWith =>
      __$$DSProductCardConfigImplCopyWithImpl<_$DSProductCardConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductCardConfig implements DSProductCardConfig {
  const factory _DSProductCardConfig({
    final DSProductCardVariant variant,
    final DSProductCardState state,
    final DSProductCardColors? colors,
    final DSProductCardSpacing? spacing,
    final DSProductCardAnimation? animation,
    final DSProductCardBehavior? behavior,
    final DSProductCardA11yConfig? a11yConfig,
  }) = _$DSProductCardConfigImpl;

  @override
  DSProductCardVariant get variant;
  @override
  DSProductCardState get state;
  @override
  DSProductCardColors? get colors;
  @override
  DSProductCardSpacing? get spacing;
  @override
  DSProductCardAnimation? get animation;
  @override
  DSProductCardBehavior? get behavior;
  @override
  DSProductCardA11yConfig? get a11yConfig;

  /// Create a copy of DSProductCardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductCardConfigImplCopyWith<_$DSProductCardConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDiscountChip {
  String get text => throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get textColor => throw _privateConstructorUsedError;
  IconData? get icon => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;
  DSDiscountChipPosition get position => throw _privateConstructorUsedError;

  /// Create a copy of DSDiscountChip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDiscountChipCopyWith<DSDiscountChip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDiscountChipCopyWith<$Res> {
  factory $DSDiscountChipCopyWith(
    DSDiscountChip value,
    $Res Function(DSDiscountChip) then,
  ) = _$DSDiscountChipCopyWithImpl<$Res, DSDiscountChip>;
  @useResult
  $Res call({
    String text,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    bool visible,
    DSDiscountChipPosition position,
  });
}

/// @nodoc
class _$DSDiscountChipCopyWithImpl<$Res, $Val extends DSDiscountChip>
    implements $DSDiscountChipCopyWith<$Res> {
  _$DSDiscountChipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDiscountChip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? icon = freezed,
    Object? visible = null,
    Object? position = null,
  }) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            textColor: freezed == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as DSDiscountChipPosition,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDiscountChipImplCopyWith<$Res>
    implements $DSDiscountChipCopyWith<$Res> {
  factory _$$DSDiscountChipImplCopyWith(
    _$DSDiscountChipImpl value,
    $Res Function(_$DSDiscountChipImpl) then,
  ) = __$$DSDiscountChipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String text,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    bool visible,
    DSDiscountChipPosition position,
  });
}

/// @nodoc
class __$$DSDiscountChipImplCopyWithImpl<$Res>
    extends _$DSDiscountChipCopyWithImpl<$Res, _$DSDiscountChipImpl>
    implements _$$DSDiscountChipImplCopyWith<$Res> {
  __$$DSDiscountChipImplCopyWithImpl(
    _$DSDiscountChipImpl _value,
    $Res Function(_$DSDiscountChipImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDiscountChip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? icon = freezed,
    Object? visible = null,
    Object? position = null,
  }) {
    return _then(
      _$DSDiscountChipImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textColor: freezed == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as DSDiscountChipPosition,
      ),
    );
  }
}

/// @nodoc

class _$DSDiscountChipImpl implements _DSDiscountChip {
  const _$DSDiscountChipImpl({
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.visible = true,
    this.position = DSDiscountChipPosition.topRight,
  });

  @override
  final String text;
  @override
  final Color? backgroundColor;
  @override
  final Color? textColor;
  @override
  final IconData? icon;
  @override
  @JsonKey()
  final bool visible;
  @override
  @JsonKey()
  final DSDiscountChipPosition position;

  @override
  String toString() {
    return 'DSDiscountChip(text: $text, backgroundColor: $backgroundColor, textColor: $textColor, icon: $icon, visible: $visible, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDiscountChipImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    text,
    backgroundColor,
    textColor,
    icon,
    visible,
    position,
  );

  /// Create a copy of DSDiscountChip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDiscountChipImplCopyWith<_$DSDiscountChipImpl> get copyWith =>
      __$$DSDiscountChipImplCopyWithImpl<_$DSDiscountChipImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDiscountChip implements DSDiscountChip {
  const factory _DSDiscountChip({
    required final String text,
    final Color? backgroundColor,
    final Color? textColor,
    final IconData? icon,
    final bool visible,
    final DSDiscountChipPosition position,
  }) = _$DSDiscountChipImpl;

  @override
  String get text;
  @override
  Color? get backgroundColor;
  @override
  Color? get textColor;
  @override
  IconData? get icon;
  @override
  bool get visible;
  @override
  DSDiscountChipPosition get position;

  /// Create a copy of DSDiscountChip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDiscountChipImplCopyWith<_$DSDiscountChipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductImage {
  String get url => throw _privateConstructorUsedError;
  String? get placeholder => throw _privateConstructorUsedError;
  BoxFit get fit => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  Widget? get errorWidget => throw _privateConstructorUsedError;

  /// Create a copy of DSProductImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductImageCopyWith<DSProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductImageCopyWith<$Res> {
  factory $DSProductImageCopyWith(
    DSProductImage value,
    $Res Function(DSProductImage) then,
  ) = _$DSProductImageCopyWithImpl<$Res, DSProductImage>;
  @useResult
  $Res call({
    String url,
    String? placeholder,
    BoxFit fit,
    double aspectRatio,
    Widget? errorWidget,
  });
}

/// @nodoc
class _$DSProductImageCopyWithImpl<$Res, $Val extends DSProductImage>
    implements $DSProductImageCopyWith<$Res> {
  _$DSProductImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? placeholder = freezed,
    Object? fit = null,
    Object? aspectRatio = null,
    Object? errorWidget = freezed,
  }) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            placeholder: freezed == placeholder
                ? _value.placeholder
                : placeholder // ignore: cast_nullable_to_non_nullable
                      as String?,
            fit: null == fit
                ? _value.fit
                : fit // ignore: cast_nullable_to_non_nullable
                      as BoxFit,
            aspectRatio: null == aspectRatio
                ? _value.aspectRatio
                : aspectRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            errorWidget: freezed == errorWidget
                ? _value.errorWidget
                : errorWidget // ignore: cast_nullable_to_non_nullable
                      as Widget?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProductImageImplCopyWith<$Res>
    implements $DSProductImageCopyWith<$Res> {
  factory _$$DSProductImageImplCopyWith(
    _$DSProductImageImpl value,
    $Res Function(_$DSProductImageImpl) then,
  ) = __$$DSProductImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String url,
    String? placeholder,
    BoxFit fit,
    double aspectRatio,
    Widget? errorWidget,
  });
}

/// @nodoc
class __$$DSProductImageImplCopyWithImpl<$Res>
    extends _$DSProductImageCopyWithImpl<$Res, _$DSProductImageImpl>
    implements _$$DSProductImageImplCopyWith<$Res> {
  __$$DSProductImageImplCopyWithImpl(
    _$DSProductImageImpl _value,
    $Res Function(_$DSProductImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? placeholder = freezed,
    Object? fit = null,
    Object? aspectRatio = null,
    Object? errorWidget = freezed,
  }) {
    return _then(
      _$DSProductImageImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        placeholder: freezed == placeholder
            ? _value.placeholder
            : placeholder // ignore: cast_nullable_to_non_nullable
                  as String?,
        fit: null == fit
            ? _value.fit
            : fit // ignore: cast_nullable_to_non_nullable
                  as BoxFit,
        aspectRatio: null == aspectRatio
            ? _value.aspectRatio
            : aspectRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        errorWidget: freezed == errorWidget
            ? _value.errorWidget
            : errorWidget // ignore: cast_nullable_to_non_nullable
                  as Widget?,
      ),
    );
  }
}

/// @nodoc

class _$DSProductImageImpl implements _DSProductImage {
  const _$DSProductImageImpl({
    required this.url,
    this.placeholder,
    this.fit = BoxFit.cover,
    this.aspectRatio = 1.0,
    this.errorWidget,
  });

  @override
  final String url;
  @override
  final String? placeholder;
  @override
  @JsonKey()
  final BoxFit fit;
  @override
  @JsonKey()
  final double aspectRatio;
  @override
  final Widget? errorWidget;

  @override
  String toString() {
    return 'DSProductImage(url: $url, placeholder: $placeholder, fit: $fit, aspectRatio: $aspectRatio, errorWidget: $errorWidget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductImageImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.errorWidget, errorWidget) ||
                other.errorWidget == errorWidget));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, url, placeholder, fit, aspectRatio, errorWidget);

  /// Create a copy of DSProductImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductImageImplCopyWith<_$DSProductImageImpl> get copyWith =>
      __$$DSProductImageImplCopyWithImpl<_$DSProductImageImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductImage implements DSProductImage {
  const factory _DSProductImage({
    required final String url,
    final String? placeholder,
    final BoxFit fit,
    final double aspectRatio,
    final Widget? errorWidget,
  }) = _$DSProductImageImpl;

  @override
  String get url;
  @override
  String? get placeholder;
  @override
  BoxFit get fit;
  @override
  double get aspectRatio;
  @override
  Widget? get errorWidget;

  /// Create a copy of DSProductImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductImageImplCopyWith<_$DSProductImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductPrice {
  double get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  DSPriceFormat get format => throw _privateConstructorUsedError;
  double? get originalPrice => throw _privateConstructorUsedError;
  bool get showCurrency => throw _privateConstructorUsedError;
  int get decimalPlaces => throw _privateConstructorUsedError;

  /// Create a copy of DSProductPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductPriceCopyWith<DSProductPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductPriceCopyWith<$Res> {
  factory $DSProductPriceCopyWith(
    DSProductPrice value,
    $Res Function(DSProductPrice) then,
  ) = _$DSProductPriceCopyWithImpl<$Res, DSProductPrice>;
  @useResult
  $Res call({
    double amount,
    String? currency,
    DSPriceFormat format,
    double? originalPrice,
    bool showCurrency,
    int decimalPlaces,
  });
}

/// @nodoc
class _$DSProductPriceCopyWithImpl<$Res, $Val extends DSProductPrice>
    implements $DSProductPriceCopyWith<$Res> {
  _$DSProductPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = freezed,
    Object? format = null,
    Object? originalPrice = freezed,
    Object? showCurrency = null,
    Object? decimalPlaces = null,
  }) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            format: null == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as DSPriceFormat,
            originalPrice: freezed == originalPrice
                ? _value.originalPrice
                : originalPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            showCurrency: null == showCurrency
                ? _value.showCurrency
                : showCurrency // ignore: cast_nullable_to_non_nullable
                      as bool,
            decimalPlaces: null == decimalPlaces
                ? _value.decimalPlaces
                : decimalPlaces // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProductPriceImplCopyWith<$Res>
    implements $DSProductPriceCopyWith<$Res> {
  factory _$$DSProductPriceImplCopyWith(
    _$DSProductPriceImpl value,
    $Res Function(_$DSProductPriceImpl) then,
  ) = __$$DSProductPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double amount,
    String? currency,
    DSPriceFormat format,
    double? originalPrice,
    bool showCurrency,
    int decimalPlaces,
  });
}

/// @nodoc
class __$$DSProductPriceImplCopyWithImpl<$Res>
    extends _$DSProductPriceCopyWithImpl<$Res, _$DSProductPriceImpl>
    implements _$$DSProductPriceImplCopyWith<$Res> {
  __$$DSProductPriceImplCopyWithImpl(
    _$DSProductPriceImpl _value,
    $Res Function(_$DSProductPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = freezed,
    Object? format = null,
    Object? originalPrice = freezed,
    Object? showCurrency = null,
    Object? decimalPlaces = null,
  }) {
    return _then(
      _$DSProductPriceImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as DSPriceFormat,
        originalPrice: freezed == originalPrice
            ? _value.originalPrice
            : originalPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        showCurrency: null == showCurrency
            ? _value.showCurrency
            : showCurrency // ignore: cast_nullable_to_non_nullable
                  as bool,
        decimalPlaces: null == decimalPlaces
            ? _value.decimalPlaces
            : decimalPlaces // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSProductPriceImpl implements _DSProductPrice {
  const _$DSProductPriceImpl({
    required this.amount,
    this.currency,
    this.format = DSPriceFormat.standard,
    this.originalPrice,
    this.showCurrency = true,
    this.decimalPlaces = 2,
  });

  @override
  final double amount;
  @override
  final String? currency;
  @override
  @JsonKey()
  final DSPriceFormat format;
  @override
  final double? originalPrice;
  @override
  @JsonKey()
  final bool showCurrency;
  @override
  @JsonKey()
  final int decimalPlaces;

  @override
  String toString() {
    return 'DSProductPrice(amount: $amount, currency: $currency, format: $format, originalPrice: $originalPrice, showCurrency: $showCurrency, decimalPlaces: $decimalPlaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.showCurrency, showCurrency) ||
                other.showCurrency == showCurrency) &&
            (identical(other.decimalPlaces, decimalPlaces) ||
                other.decimalPlaces == decimalPlaces));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    amount,
    currency,
    format,
    originalPrice,
    showCurrency,
    decimalPlaces,
  );

  /// Create a copy of DSProductPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductPriceImplCopyWith<_$DSProductPriceImpl> get copyWith =>
      __$$DSProductPriceImplCopyWithImpl<_$DSProductPriceImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductPrice implements DSProductPrice {
  const factory _DSProductPrice({
    required final double amount,
    final String? currency,
    final DSPriceFormat format,
    final double? originalPrice,
    final bool showCurrency,
    final int decimalPlaces,
  }) = _$DSProductPriceImpl;

  @override
  double get amount;
  @override
  String? get currency;
  @override
  DSPriceFormat get format;
  @override
  double? get originalPrice;
  @override
  bool get showCurrency;
  @override
  int get decimalPlaces;

  /// Create a copy of DSProductPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductPriceImplCopyWith<_$DSProductPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductCardColors {
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get borderColor => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get titleColor => throw _privateConstructorUsedError;
  Color? get priceColor => throw _privateConstructorUsedError;
  Color? get originalPriceColor => throw _privateConstructorUsedError;
  Color? get discountBackgroundColor => throw _privateConstructorUsedError;
  Color? get discountTextColor => throw _privateConstructorUsedError;
  Color? get overlayColor => throw _privateConstructorUsedError;
  Color? get focusColor => throw _privateConstructorUsedError;
  Color? get selectedColor => throw _privateConstructorUsedError;
  Color? get skeletonColor => throw _privateConstructorUsedError;

  /// Create a copy of DSProductCardColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductCardColorsCopyWith<DSProductCardColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductCardColorsCopyWith<$Res> {
  factory $DSProductCardColorsCopyWith(
    DSProductCardColors value,
    $Res Function(DSProductCardColors) then,
  ) = _$DSProductCardColorsCopyWithImpl<$Res, DSProductCardColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? titleColor,
    Color? priceColor,
    Color? originalPriceColor,
    Color? discountBackgroundColor,
    Color? discountTextColor,
    Color? overlayColor,
    Color? focusColor,
    Color? selectedColor,
    Color? skeletonColor,
  });
}

/// @nodoc
class _$DSProductCardColorsCopyWithImpl<$Res, $Val extends DSProductCardColors>
    implements $DSProductCardColorsCopyWith<$Res> {
  _$DSProductCardColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductCardColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? titleColor = freezed,
    Object? priceColor = freezed,
    Object? originalPriceColor = freezed,
    Object? discountBackgroundColor = freezed,
    Object? discountTextColor = freezed,
    Object? overlayColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
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
            titleColor: freezed == titleColor
                ? _value.titleColor
                : titleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            priceColor: freezed == priceColor
                ? _value.priceColor
                : priceColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            originalPriceColor: freezed == originalPriceColor
                ? _value.originalPriceColor
                : originalPriceColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            discountBackgroundColor: freezed == discountBackgroundColor
                ? _value.discountBackgroundColor
                : discountBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            discountTextColor: freezed == discountTextColor
                ? _value.discountTextColor
                : discountTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            overlayColor: freezed == overlayColor
                ? _value.overlayColor
                : overlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            focusColor: freezed == focusColor
                ? _value.focusColor
                : focusColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedColor: freezed == selectedColor
                ? _value.selectedColor
                : selectedColor // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSProductCardColorsImplCopyWith<$Res>
    implements $DSProductCardColorsCopyWith<$Res> {
  factory _$$DSProductCardColorsImplCopyWith(
    _$DSProductCardColorsImpl value,
    $Res Function(_$DSProductCardColorsImpl) then,
  ) = __$$DSProductCardColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? titleColor,
    Color? priceColor,
    Color? originalPriceColor,
    Color? discountBackgroundColor,
    Color? discountTextColor,
    Color? overlayColor,
    Color? focusColor,
    Color? selectedColor,
    Color? skeletonColor,
  });
}

/// @nodoc
class __$$DSProductCardColorsImplCopyWithImpl<$Res>
    extends _$DSProductCardColorsCopyWithImpl<$Res, _$DSProductCardColorsImpl>
    implements _$$DSProductCardColorsImplCopyWith<$Res> {
  __$$DSProductCardColorsImplCopyWithImpl(
    _$DSProductCardColorsImpl _value,
    $Res Function(_$DSProductCardColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductCardColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? borderColor = freezed,
    Object? shadowColor = freezed,
    Object? titleColor = freezed,
    Object? priceColor = freezed,
    Object? originalPriceColor = freezed,
    Object? discountBackgroundColor = freezed,
    Object? discountTextColor = freezed,
    Object? overlayColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? skeletonColor = freezed,
  }) {
    return _then(
      _$DSProductCardColorsImpl(
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
        titleColor: freezed == titleColor
            ? _value.titleColor
            : titleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        priceColor: freezed == priceColor
            ? _value.priceColor
            : priceColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        originalPriceColor: freezed == originalPriceColor
            ? _value.originalPriceColor
            : originalPriceColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        discountBackgroundColor: freezed == discountBackgroundColor
            ? _value.discountBackgroundColor
            : discountBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        discountTextColor: freezed == discountTextColor
            ? _value.discountTextColor
            : discountTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        overlayColor: freezed == overlayColor
            ? _value.overlayColor
            : overlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        focusColor: freezed == focusColor
            ? _value.focusColor
            : focusColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedColor: freezed == selectedColor
            ? _value.selectedColor
            : selectedColor // ignore: cast_nullable_to_non_nullable
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

class _$DSProductCardColorsImpl implements _DSProductCardColors {
  const _$DSProductCardColorsImpl({
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.titleColor,
    this.priceColor,
    this.originalPriceColor,
    this.discountBackgroundColor,
    this.discountTextColor,
    this.overlayColor,
    this.focusColor,
    this.selectedColor,
    this.skeletonColor,
  });

  @override
  final Color? backgroundColor;
  @override
  final Color? borderColor;
  @override
  final Color? shadowColor;
  @override
  final Color? titleColor;
  @override
  final Color? priceColor;
  @override
  final Color? originalPriceColor;
  @override
  final Color? discountBackgroundColor;
  @override
  final Color? discountTextColor;
  @override
  final Color? overlayColor;
  @override
  final Color? focusColor;
  @override
  final Color? selectedColor;
  @override
  final Color? skeletonColor;

  @override
  String toString() {
    return 'DSProductCardColors(backgroundColor: $backgroundColor, borderColor: $borderColor, shadowColor: $shadowColor, titleColor: $titleColor, priceColor: $priceColor, originalPriceColor: $originalPriceColor, discountBackgroundColor: $discountBackgroundColor, discountTextColor: $discountTextColor, overlayColor: $overlayColor, focusColor: $focusColor, selectedColor: $selectedColor, skeletonColor: $skeletonColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductCardColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.priceColor, priceColor) ||
                other.priceColor == priceColor) &&
            (identical(other.originalPriceColor, originalPriceColor) ||
                other.originalPriceColor == originalPriceColor) &&
            (identical(
                  other.discountBackgroundColor,
                  discountBackgroundColor,
                ) ||
                other.discountBackgroundColor == discountBackgroundColor) &&
            (identical(other.discountTextColor, discountTextColor) ||
                other.discountTextColor == discountTextColor) &&
            (identical(other.overlayColor, overlayColor) ||
                other.overlayColor == overlayColor) &&
            (identical(other.focusColor, focusColor) ||
                other.focusColor == focusColor) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.skeletonColor, skeletonColor) ||
                other.skeletonColor == skeletonColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    borderColor,
    shadowColor,
    titleColor,
    priceColor,
    originalPriceColor,
    discountBackgroundColor,
    discountTextColor,
    overlayColor,
    focusColor,
    selectedColor,
    skeletonColor,
  );

  /// Create a copy of DSProductCardColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductCardColorsImplCopyWith<_$DSProductCardColorsImpl> get copyWith =>
      __$$DSProductCardColorsImplCopyWithImpl<_$DSProductCardColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductCardColors implements DSProductCardColors {
  const factory _DSProductCardColors({
    final Color? backgroundColor,
    final Color? borderColor,
    final Color? shadowColor,
    final Color? titleColor,
    final Color? priceColor,
    final Color? originalPriceColor,
    final Color? discountBackgroundColor,
    final Color? discountTextColor,
    final Color? overlayColor,
    final Color? focusColor,
    final Color? selectedColor,
    final Color? skeletonColor,
  }) = _$DSProductCardColorsImpl;

  @override
  Color? get backgroundColor;
  @override
  Color? get borderColor;
  @override
  Color? get shadowColor;
  @override
  Color? get titleColor;
  @override
  Color? get priceColor;
  @override
  Color? get originalPriceColor;
  @override
  Color? get discountBackgroundColor;
  @override
  Color? get discountTextColor;
  @override
  Color? get overlayColor;
  @override
  Color? get focusColor;
  @override
  Color? get selectedColor;
  @override
  Color? get skeletonColor;

  /// Create a copy of DSProductCardColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductCardColorsImplCopyWith<_$DSProductCardColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductCardSpacing {
  EdgeInsets get padding => throw _privateConstructorUsedError;
  EdgeInsets get margin => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  double get borderWidth => throw _privateConstructorUsedError;
  double get elevation => throw _privateConstructorUsedError;
  double get contentGap => throw _privateConstructorUsedError;
  double get minWidth => throw _privateConstructorUsedError;
  double get minHeight => throw _privateConstructorUsedError;
  double get imageAspectRatio => throw _privateConstructorUsedError;

  /// Create a copy of DSProductCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductCardSpacingCopyWith<DSProductCardSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductCardSpacingCopyWith<$Res> {
  factory $DSProductCardSpacingCopyWith(
    DSProductCardSpacing value,
    $Res Function(DSProductCardSpacing) then,
  ) = _$DSProductCardSpacingCopyWithImpl<$Res, DSProductCardSpacing>;
  @useResult
  $Res call({
    EdgeInsets padding,
    EdgeInsets margin,
    double borderRadius,
    double borderWidth,
    double elevation,
    double contentGap,
    double minWidth,
    double minHeight,
    double imageAspectRatio,
  });
}

/// @nodoc
class _$DSProductCardSpacingCopyWithImpl<
  $Res,
  $Val extends DSProductCardSpacing
>
    implements $DSProductCardSpacingCopyWith<$Res> {
  _$DSProductCardSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? margin = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? elevation = null,
    Object? contentGap = null,
    Object? minWidth = null,
    Object? minHeight = null,
    Object? imageAspectRatio = null,
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
            contentGap: null == contentGap
                ? _value.contentGap
                : contentGap // ignore: cast_nullable_to_non_nullable
                      as double,
            minWidth: null == minWidth
                ? _value.minWidth
                : minWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            minHeight: null == minHeight
                ? _value.minHeight
                : minHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            imageAspectRatio: null == imageAspectRatio
                ? _value.imageAspectRatio
                : imageAspectRatio // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProductCardSpacingImplCopyWith<$Res>
    implements $DSProductCardSpacingCopyWith<$Res> {
  factory _$$DSProductCardSpacingImplCopyWith(
    _$DSProductCardSpacingImpl value,
    $Res Function(_$DSProductCardSpacingImpl) then,
  ) = __$$DSProductCardSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EdgeInsets padding,
    EdgeInsets margin,
    double borderRadius,
    double borderWidth,
    double elevation,
    double contentGap,
    double minWidth,
    double minHeight,
    double imageAspectRatio,
  });
}

/// @nodoc
class __$$DSProductCardSpacingImplCopyWithImpl<$Res>
    extends _$DSProductCardSpacingCopyWithImpl<$Res, _$DSProductCardSpacingImpl>
    implements _$$DSProductCardSpacingImplCopyWith<$Res> {
  __$$DSProductCardSpacingImplCopyWithImpl(
    _$DSProductCardSpacingImpl _value,
    $Res Function(_$DSProductCardSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? padding = null,
    Object? margin = null,
    Object? borderRadius = null,
    Object? borderWidth = null,
    Object? elevation = null,
    Object? contentGap = null,
    Object? minWidth = null,
    Object? minHeight = null,
    Object? imageAspectRatio = null,
  }) {
    return _then(
      _$DSProductCardSpacingImpl(
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
        contentGap: null == contentGap
            ? _value.contentGap
            : contentGap // ignore: cast_nullable_to_non_nullable
                  as double,
        minWidth: null == minWidth
            ? _value.minWidth
            : minWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        minHeight: null == minHeight
            ? _value.minHeight
            : minHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        imageAspectRatio: null == imageAspectRatio
            ? _value.imageAspectRatio
            : imageAspectRatio // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSProductCardSpacingImpl implements _DSProductCardSpacing {
  const _$DSProductCardSpacingImpl({
    this.padding = const EdgeInsets.all(12),
    this.margin = EdgeInsets.zero,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.elevation = 4.0,
    this.contentGap = 8.0,
    this.minWidth = 150.0,
    this.minHeight = 200.0,
    this.imageAspectRatio = 1.5,
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
  final double contentGap;
  @override
  @JsonKey()
  final double minWidth;
  @override
  @JsonKey()
  final double minHeight;
  @override
  @JsonKey()
  final double imageAspectRatio;

  @override
  String toString() {
    return 'DSProductCardSpacing(padding: $padding, margin: $margin, borderRadius: $borderRadius, borderWidth: $borderWidth, elevation: $elevation, contentGap: $contentGap, minWidth: $minWidth, minHeight: $minHeight, imageAspectRatio: $imageAspectRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductCardSpacingImpl &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.contentGap, contentGap) ||
                other.contentGap == contentGap) &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.imageAspectRatio, imageAspectRatio) ||
                other.imageAspectRatio == imageAspectRatio));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    padding,
    margin,
    borderRadius,
    borderWidth,
    elevation,
    contentGap,
    minWidth,
    minHeight,
    imageAspectRatio,
  );

  /// Create a copy of DSProductCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductCardSpacingImplCopyWith<_$DSProductCardSpacingImpl>
  get copyWith =>
      __$$DSProductCardSpacingImplCopyWithImpl<_$DSProductCardSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductCardSpacing implements DSProductCardSpacing {
  const factory _DSProductCardSpacing({
    final EdgeInsets padding,
    final EdgeInsets margin,
    final double borderRadius,
    final double borderWidth,
    final double elevation,
    final double contentGap,
    final double minWidth,
    final double minHeight,
    final double imageAspectRatio,
  }) = _$DSProductCardSpacingImpl;

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
  double get contentGap;
  @override
  double get minWidth;
  @override
  double get minHeight;
  @override
  double get imageAspectRatio;

  /// Create a copy of DSProductCardSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductCardSpacingImplCopyWith<_$DSProductCardSpacingImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductCardAnimation {
  bool get enabled => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  Duration get hoverDuration => throw _privateConstructorUsedError;
  Curve get hoverCurve => throw _privateConstructorUsedError;
  bool get enableScaleAnimation => throw _privateConstructorUsedError;
  double get hoverScale => throw _privateConstructorUsedError;
  double get pressScale => throw _privateConstructorUsedError;

  /// Create a copy of DSProductCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductCardAnimationCopyWith<DSProductCardAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductCardAnimationCopyWith<$Res> {
  factory $DSProductCardAnimationCopyWith(
    DSProductCardAnimation value,
    $Res Function(DSProductCardAnimation) then,
  ) = _$DSProductCardAnimationCopyWithImpl<$Res, DSProductCardAnimation>;
  @useResult
  $Res call({
    bool enabled,
    Duration duration,
    Curve curve,
    Duration hoverDuration,
    Curve hoverCurve,
    bool enableScaleAnimation,
    double hoverScale,
    double pressScale,
  });
}

/// @nodoc
class _$DSProductCardAnimationCopyWithImpl<
  $Res,
  $Val extends DSProductCardAnimation
>
    implements $DSProductCardAnimationCopyWith<$Res> {
  _$DSProductCardAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? duration = null,
    Object? curve = null,
    Object? hoverDuration = null,
    Object? hoverCurve = null,
    Object? enableScaleAnimation = null,
    Object? hoverScale = null,
    Object? pressScale = null,
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
            hoverDuration: null == hoverDuration
                ? _value.hoverDuration
                : hoverDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            hoverCurve: null == hoverCurve
                ? _value.hoverCurve
                : hoverCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enableScaleAnimation: null == enableScaleAnimation
                ? _value.enableScaleAnimation
                : enableScaleAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
            hoverScale: null == hoverScale
                ? _value.hoverScale
                : hoverScale // ignore: cast_nullable_to_non_nullable
                      as double,
            pressScale: null == pressScale
                ? _value.pressScale
                : pressScale // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProductCardAnimationImplCopyWith<$Res>
    implements $DSProductCardAnimationCopyWith<$Res> {
  factory _$$DSProductCardAnimationImplCopyWith(
    _$DSProductCardAnimationImpl value,
    $Res Function(_$DSProductCardAnimationImpl) then,
  ) = __$$DSProductCardAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    Duration duration,
    Curve curve,
    Duration hoverDuration,
    Curve hoverCurve,
    bool enableScaleAnimation,
    double hoverScale,
    double pressScale,
  });
}

/// @nodoc
class __$$DSProductCardAnimationImplCopyWithImpl<$Res>
    extends
        _$DSProductCardAnimationCopyWithImpl<$Res, _$DSProductCardAnimationImpl>
    implements _$$DSProductCardAnimationImplCopyWith<$Res> {
  __$$DSProductCardAnimationImplCopyWithImpl(
    _$DSProductCardAnimationImpl _value,
    $Res Function(_$DSProductCardAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? duration = null,
    Object? curve = null,
    Object? hoverDuration = null,
    Object? hoverCurve = null,
    Object? enableScaleAnimation = null,
    Object? hoverScale = null,
    Object? pressScale = null,
  }) {
    return _then(
      _$DSProductCardAnimationImpl(
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
        hoverDuration: null == hoverDuration
            ? _value.hoverDuration
            : hoverDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        hoverCurve: null == hoverCurve
            ? _value.hoverCurve
            : hoverCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enableScaleAnimation: null == enableScaleAnimation
            ? _value.enableScaleAnimation
            : enableScaleAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
        hoverScale: null == hoverScale
            ? _value.hoverScale
            : hoverScale // ignore: cast_nullable_to_non_nullable
                  as double,
        pressScale: null == pressScale
            ? _value.pressScale
            : pressScale // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSProductCardAnimationImpl implements _DSProductCardAnimation {
  const _$DSProductCardAnimationImpl({
    this.enabled = true,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.hoverDuration = const Duration(milliseconds: 150),
    this.hoverCurve = Curves.easeOut,
    this.enableScaleAnimation = true,
    this.hoverScale = 1.02,
    this.pressScale = 0.98,
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
  final Duration hoverDuration;
  @override
  @JsonKey()
  final Curve hoverCurve;
  @override
  @JsonKey()
  final bool enableScaleAnimation;
  @override
  @JsonKey()
  final double hoverScale;
  @override
  @JsonKey()
  final double pressScale;

  @override
  String toString() {
    return 'DSProductCardAnimation(enabled: $enabled, duration: $duration, curve: $curve, hoverDuration: $hoverDuration, hoverCurve: $hoverCurve, enableScaleAnimation: $enableScaleAnimation, hoverScale: $hoverScale, pressScale: $pressScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductCardAnimationImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.hoverDuration, hoverDuration) ||
                other.hoverDuration == hoverDuration) &&
            (identical(other.hoverCurve, hoverCurve) ||
                other.hoverCurve == hoverCurve) &&
            (identical(other.enableScaleAnimation, enableScaleAnimation) ||
                other.enableScaleAnimation == enableScaleAnimation) &&
            (identical(other.hoverScale, hoverScale) ||
                other.hoverScale == hoverScale) &&
            (identical(other.pressScale, pressScale) ||
                other.pressScale == pressScale));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    duration,
    curve,
    hoverDuration,
    hoverCurve,
    enableScaleAnimation,
    hoverScale,
    pressScale,
  );

  /// Create a copy of DSProductCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductCardAnimationImplCopyWith<_$DSProductCardAnimationImpl>
  get copyWith =>
      __$$DSProductCardAnimationImplCopyWithImpl<_$DSProductCardAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductCardAnimation implements DSProductCardAnimation {
  const factory _DSProductCardAnimation({
    final bool enabled,
    final Duration duration,
    final Curve curve,
    final Duration hoverDuration,
    final Curve hoverCurve,
    final bool enableScaleAnimation,
    final double hoverScale,
    final double pressScale,
  }) = _$DSProductCardAnimationImpl;

  @override
  bool get enabled;
  @override
  Duration get duration;
  @override
  Curve get curve;
  @override
  Duration get hoverDuration;
  @override
  Curve get hoverCurve;
  @override
  bool get enableScaleAnimation;
  @override
  double get hoverScale;
  @override
  double get pressScale;

  /// Create a copy of DSProductCardAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductCardAnimationImplCopyWith<_$DSProductCardAnimationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductCardBehavior {
  bool get clickable => throw _privateConstructorUsedError;
  bool get selectable => throw _privateConstructorUsedError;
  bool get multiSelect => throw _privateConstructorUsedError;
  bool get showTooltip => throw _privateConstructorUsedError;
  bool get lazyLoadImage => throw _privateConstructorUsedError;
  bool get cacheImage => throw _privateConstructorUsedError;
  DSProductCardLayout get layout => throw _privateConstructorUsedError;

  /// Create a copy of DSProductCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductCardBehaviorCopyWith<DSProductCardBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductCardBehaviorCopyWith<$Res> {
  factory $DSProductCardBehaviorCopyWith(
    DSProductCardBehavior value,
    $Res Function(DSProductCardBehavior) then,
  ) = _$DSProductCardBehaviorCopyWithImpl<$Res, DSProductCardBehavior>;
  @useResult
  $Res call({
    bool clickable,
    bool selectable,
    bool multiSelect,
    bool showTooltip,
    bool lazyLoadImage,
    bool cacheImage,
    DSProductCardLayout layout,
  });
}

/// @nodoc
class _$DSProductCardBehaviorCopyWithImpl<
  $Res,
  $Val extends DSProductCardBehavior
>
    implements $DSProductCardBehaviorCopyWith<$Res> {
  _$DSProductCardBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickable = null,
    Object? selectable = null,
    Object? multiSelect = null,
    Object? showTooltip = null,
    Object? lazyLoadImage = null,
    Object? cacheImage = null,
    Object? layout = null,
  }) {
    return _then(
      _value.copyWith(
            clickable: null == clickable
                ? _value.clickable
                : clickable // ignore: cast_nullable_to_non_nullable
                      as bool,
            selectable: null == selectable
                ? _value.selectable
                : selectable // ignore: cast_nullable_to_non_nullable
                      as bool,
            multiSelect: null == multiSelect
                ? _value.multiSelect
                : multiSelect // ignore: cast_nullable_to_non_nullable
                      as bool,
            showTooltip: null == showTooltip
                ? _value.showTooltip
                : showTooltip // ignore: cast_nullable_to_non_nullable
                      as bool,
            lazyLoadImage: null == lazyLoadImage
                ? _value.lazyLoadImage
                : lazyLoadImage // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheImage: null == cacheImage
                ? _value.cacheImage
                : cacheImage // ignore: cast_nullable_to_non_nullable
                      as bool,
            layout: null == layout
                ? _value.layout
                : layout // ignore: cast_nullable_to_non_nullable
                      as DSProductCardLayout,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProductCardBehaviorImplCopyWith<$Res>
    implements $DSProductCardBehaviorCopyWith<$Res> {
  factory _$$DSProductCardBehaviorImplCopyWith(
    _$DSProductCardBehaviorImpl value,
    $Res Function(_$DSProductCardBehaviorImpl) then,
  ) = __$$DSProductCardBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool clickable,
    bool selectable,
    bool multiSelect,
    bool showTooltip,
    bool lazyLoadImage,
    bool cacheImage,
    DSProductCardLayout layout,
  });
}

/// @nodoc
class __$$DSProductCardBehaviorImplCopyWithImpl<$Res>
    extends
        _$DSProductCardBehaviorCopyWithImpl<$Res, _$DSProductCardBehaviorImpl>
    implements _$$DSProductCardBehaviorImplCopyWith<$Res> {
  __$$DSProductCardBehaviorImplCopyWithImpl(
    _$DSProductCardBehaviorImpl _value,
    $Res Function(_$DSProductCardBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickable = null,
    Object? selectable = null,
    Object? multiSelect = null,
    Object? showTooltip = null,
    Object? lazyLoadImage = null,
    Object? cacheImage = null,
    Object? layout = null,
  }) {
    return _then(
      _$DSProductCardBehaviorImpl(
        clickable: null == clickable
            ? _value.clickable
            : clickable // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectable: null == selectable
            ? _value.selectable
            : selectable // ignore: cast_nullable_to_non_nullable
                  as bool,
        multiSelect: null == multiSelect
            ? _value.multiSelect
            : multiSelect // ignore: cast_nullable_to_non_nullable
                  as bool,
        showTooltip: null == showTooltip
            ? _value.showTooltip
            : showTooltip // ignore: cast_nullable_to_non_nullable
                  as bool,
        lazyLoadImage: null == lazyLoadImage
            ? _value.lazyLoadImage
            : lazyLoadImage // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheImage: null == cacheImage
            ? _value.cacheImage
            : cacheImage // ignore: cast_nullable_to_non_nullable
                  as bool,
        layout: null == layout
            ? _value.layout
            : layout // ignore: cast_nullable_to_non_nullable
                  as DSProductCardLayout,
      ),
    );
  }
}

/// @nodoc

class _$DSProductCardBehaviorImpl implements _DSProductCardBehavior {
  const _$DSProductCardBehaviorImpl({
    this.clickable = true,
    this.selectable = true,
    this.multiSelect = false,
    this.showTooltip = true,
    this.lazyLoadImage = true,
    this.cacheImage = true,
    this.layout = DSProductCardLayout.vertical,
  });

  @override
  @JsonKey()
  final bool clickable;
  @override
  @JsonKey()
  final bool selectable;
  @override
  @JsonKey()
  final bool multiSelect;
  @override
  @JsonKey()
  final bool showTooltip;
  @override
  @JsonKey()
  final bool lazyLoadImage;
  @override
  @JsonKey()
  final bool cacheImage;
  @override
  @JsonKey()
  final DSProductCardLayout layout;

  @override
  String toString() {
    return 'DSProductCardBehavior(clickable: $clickable, selectable: $selectable, multiSelect: $multiSelect, showTooltip: $showTooltip, lazyLoadImage: $lazyLoadImage, cacheImage: $cacheImage, layout: $layout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductCardBehaviorImpl &&
            (identical(other.clickable, clickable) ||
                other.clickable == clickable) &&
            (identical(other.selectable, selectable) ||
                other.selectable == selectable) &&
            (identical(other.multiSelect, multiSelect) ||
                other.multiSelect == multiSelect) &&
            (identical(other.showTooltip, showTooltip) ||
                other.showTooltip == showTooltip) &&
            (identical(other.lazyLoadImage, lazyLoadImage) ||
                other.lazyLoadImage == lazyLoadImage) &&
            (identical(other.cacheImage, cacheImage) ||
                other.cacheImage == cacheImage) &&
            (identical(other.layout, layout) || other.layout == layout));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    clickable,
    selectable,
    multiSelect,
    showTooltip,
    lazyLoadImage,
    cacheImage,
    layout,
  );

  /// Create a copy of DSProductCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductCardBehaviorImplCopyWith<_$DSProductCardBehaviorImpl>
  get copyWith =>
      __$$DSProductCardBehaviorImplCopyWithImpl<_$DSProductCardBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSProductCardBehavior implements DSProductCardBehavior {
  const factory _DSProductCardBehavior({
    final bool clickable,
    final bool selectable,
    final bool multiSelect,
    final bool showTooltip,
    final bool lazyLoadImage,
    final bool cacheImage,
    final DSProductCardLayout layout,
  }) = _$DSProductCardBehaviorImpl;

  @override
  bool get clickable;
  @override
  bool get selectable;
  @override
  bool get multiSelect;
  @override
  bool get showTooltip;
  @override
  bool get lazyLoadImage;
  @override
  bool get cacheImage;
  @override
  DSProductCardLayout get layout;

  /// Create a copy of DSProductCardBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductCardBehaviorImplCopyWith<_$DSProductCardBehaviorImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSProductCardA11yConfig {
  String? get productLabel => throw _privateConstructorUsedError;
  String? get priceLabel => throw _privateConstructorUsedError;
  String? get discountLabel => throw _privateConstructorUsedError;
  String? get imageDescription => throw _privateConstructorUsedError;
  bool get announceSelection => throw _privateConstructorUsedError;
  bool get announcePrice => throw _privateConstructorUsedError;
  bool get announceDiscount => throw _privateConstructorUsedError;
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Create a copy of DSProductCardA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSProductCardA11yConfigCopyWith<DSProductCardA11yConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSProductCardA11yConfigCopyWith<$Res> {
  factory $DSProductCardA11yConfigCopyWith(
    DSProductCardA11yConfig value,
    $Res Function(DSProductCardA11yConfig) then,
  ) = _$DSProductCardA11yConfigCopyWithImpl<$Res, DSProductCardA11yConfig>;
  @useResult
  $Res call({
    String? productLabel,
    String? priceLabel,
    String? discountLabel,
    String? imageDescription,
    bool announceSelection,
    bool announcePrice,
    bool announceDiscount,
    bool enableKeyboardNavigation,
  });
}

/// @nodoc
class _$DSProductCardA11yConfigCopyWithImpl<
  $Res,
  $Val extends DSProductCardA11yConfig
>
    implements $DSProductCardA11yConfigCopyWith<$Res> {
  _$DSProductCardA11yConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSProductCardA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productLabel = freezed,
    Object? priceLabel = freezed,
    Object? discountLabel = freezed,
    Object? imageDescription = freezed,
    Object? announceSelection = null,
    Object? announcePrice = null,
    Object? announceDiscount = null,
    Object? enableKeyboardNavigation = null,
  }) {
    return _then(
      _value.copyWith(
            productLabel: freezed == productLabel
                ? _value.productLabel
                : productLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            priceLabel: freezed == priceLabel
                ? _value.priceLabel
                : priceLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountLabel: freezed == discountLabel
                ? _value.discountLabel
                : discountLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageDescription: freezed == imageDescription
                ? _value.imageDescription
                : imageDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            announceSelection: null == announceSelection
                ? _value.announceSelection
                : announceSelection // ignore: cast_nullable_to_non_nullable
                      as bool,
            announcePrice: null == announcePrice
                ? _value.announcePrice
                : announcePrice // ignore: cast_nullable_to_non_nullable
                      as bool,
            announceDiscount: null == announceDiscount
                ? _value.announceDiscount
                : announceDiscount // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSProductCardA11yConfigImplCopyWith<$Res>
    implements $DSProductCardA11yConfigCopyWith<$Res> {
  factory _$$DSProductCardA11yConfigImplCopyWith(
    _$DSProductCardA11yConfigImpl value,
    $Res Function(_$DSProductCardA11yConfigImpl) then,
  ) = __$$DSProductCardA11yConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? productLabel,
    String? priceLabel,
    String? discountLabel,
    String? imageDescription,
    bool announceSelection,
    bool announcePrice,
    bool announceDiscount,
    bool enableKeyboardNavigation,
  });
}

/// @nodoc
class __$$DSProductCardA11yConfigImplCopyWithImpl<$Res>
    extends
        _$DSProductCardA11yConfigCopyWithImpl<
          $Res,
          _$DSProductCardA11yConfigImpl
        >
    implements _$$DSProductCardA11yConfigImplCopyWith<$Res> {
  __$$DSProductCardA11yConfigImplCopyWithImpl(
    _$DSProductCardA11yConfigImpl _value,
    $Res Function(_$DSProductCardA11yConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSProductCardA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productLabel = freezed,
    Object? priceLabel = freezed,
    Object? discountLabel = freezed,
    Object? imageDescription = freezed,
    Object? announceSelection = null,
    Object? announcePrice = null,
    Object? announceDiscount = null,
    Object? enableKeyboardNavigation = null,
  }) {
    return _then(
      _$DSProductCardA11yConfigImpl(
        productLabel: freezed == productLabel
            ? _value.productLabel
            : productLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        priceLabel: freezed == priceLabel
            ? _value.priceLabel
            : priceLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountLabel: freezed == discountLabel
            ? _value.discountLabel
            : discountLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageDescription: freezed == imageDescription
            ? _value.imageDescription
            : imageDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        announceSelection: null == announceSelection
            ? _value.announceSelection
            : announceSelection // ignore: cast_nullable_to_non_nullable
                  as bool,
        announcePrice: null == announcePrice
            ? _value.announcePrice
            : announcePrice // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceDiscount: null == announceDiscount
            ? _value.announceDiscount
            : announceDiscount // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSProductCardA11yConfigImpl implements _DSProductCardA11yConfig {
  const _$DSProductCardA11yConfigImpl({
    this.productLabel,
    this.priceLabel,
    this.discountLabel,
    this.imageDescription,
    this.announceSelection = true,
    this.announcePrice = true,
    this.announceDiscount = true,
    this.enableKeyboardNavigation = true,
  });

  @override
  final String? productLabel;
  @override
  final String? priceLabel;
  @override
  final String? discountLabel;
  @override
  final String? imageDescription;
  @override
  @JsonKey()
  final bool announceSelection;
  @override
  @JsonKey()
  final bool announcePrice;
  @override
  @JsonKey()
  final bool announceDiscount;
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;

  @override
  String toString() {
    return 'DSProductCardA11yConfig(productLabel: $productLabel, priceLabel: $priceLabel, discountLabel: $discountLabel, imageDescription: $imageDescription, announceSelection: $announceSelection, announcePrice: $announcePrice, announceDiscount: $announceDiscount, enableKeyboardNavigation: $enableKeyboardNavigation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSProductCardA11yConfigImpl &&
            (identical(other.productLabel, productLabel) ||
                other.productLabel == productLabel) &&
            (identical(other.priceLabel, priceLabel) ||
                other.priceLabel == priceLabel) &&
            (identical(other.discountLabel, discountLabel) ||
                other.discountLabel == discountLabel) &&
            (identical(other.imageDescription, imageDescription) ||
                other.imageDescription == imageDescription) &&
            (identical(other.announceSelection, announceSelection) ||
                other.announceSelection == announceSelection) &&
            (identical(other.announcePrice, announcePrice) ||
                other.announcePrice == announcePrice) &&
            (identical(other.announceDiscount, announceDiscount) ||
                other.announceDiscount == announceDiscount) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    productLabel,
    priceLabel,
    discountLabel,
    imageDescription,
    announceSelection,
    announcePrice,
    announceDiscount,
    enableKeyboardNavigation,
  );

  /// Create a copy of DSProductCardA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSProductCardA11yConfigImplCopyWith<_$DSProductCardA11yConfigImpl>
  get copyWith =>
      __$$DSProductCardA11yConfigImplCopyWithImpl<
        _$DSProductCardA11yConfigImpl
      >(this, _$identity);
}

abstract class _DSProductCardA11yConfig implements DSProductCardA11yConfig {
  const factory _DSProductCardA11yConfig({
    final String? productLabel,
    final String? priceLabel,
    final String? discountLabel,
    final String? imageDescription,
    final bool announceSelection,
    final bool announcePrice,
    final bool announceDiscount,
    final bool enableKeyboardNavigation,
  }) = _$DSProductCardA11yConfigImpl;

  @override
  String? get productLabel;
  @override
  String? get priceLabel;
  @override
  String? get discountLabel;
  @override
  String? get imageDescription;
  @override
  bool get announceSelection;
  @override
  bool get announcePrice;
  @override
  bool get announceDiscount;
  @override
  bool get enableKeyboardNavigation;

  /// Create a copy of DSProductCardA11yConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSProductCardA11yConfigImplCopyWith<_$DSProductCardA11yConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
