// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_divider_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSDividerConfig {
  /// Variante del divider
  DSDividerVariant get variant => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSDividerState get state => throw _privateConstructorUsedError;

  /// Grosor del divider (design token)
  double? get thickness => throw _privateConstructorUsedError;

  /// Color del divider (design token)
  Color? get color => throw _privateConstructorUsedError;

  /// Configuración de colores (solo design tokens)
  DSDividerColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado (solo design tokens)
  DSDividerSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSDividerAnimations? get animations => throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSDividerBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSDividerAccessibilityConfig? get accessibility =>
      throw _privateConstructorUsedError;

  /// Orientación del divider
  DSDividerOrientation get orientation => throw _privateConstructorUsedError;

  /// Si el divider es interactivo (clickeable)
  bool get interactive => throw _privateConstructorUsedError;

  /// Altura del divider cuando es horizontal
  double? get height => throw _privateConstructorUsedError;

  /// Ancho del divider cuando es vertical
  double? get width => throw _privateConstructorUsedError;

  /// Indentación desde el borde izquierdo (para variant inset)
  double? get indent => throw _privateConstructorUsedError;

  /// Indentación desde el borde derecho (para variant inset)
  double? get endIndent => throw _privateConstructorUsedError;

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDividerConfigCopyWith<DSDividerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDividerConfigCopyWith<$Res> {
  factory $DSDividerConfigCopyWith(
    DSDividerConfig value,
    $Res Function(DSDividerConfig) then,
  ) = _$DSDividerConfigCopyWithImpl<$Res, DSDividerConfig>;
  @useResult
  $Res call({
    DSDividerVariant variant,
    DSDividerState state,
    double? thickness,
    Color? color,
    DSDividerColors? colors,
    DSDividerSpacing? spacing,
    DSDividerAnimations? animations,
    DSDividerBehavior? behavior,
    DSDividerAccessibilityConfig? accessibility,
    DSDividerOrientation orientation,
    bool interactive,
    double? height,
    double? width,
    double? indent,
    double? endIndent,
  });

  $DSDividerColorsCopyWith<$Res>? get colors;
  $DSDividerSpacingCopyWith<$Res>? get spacing;
  $DSDividerAnimationsCopyWith<$Res>? get animations;
  $DSDividerBehaviorCopyWith<$Res>? get behavior;
  $DSDividerAccessibilityConfigCopyWith<$Res>? get accessibility;
}

/// @nodoc
class _$DSDividerConfigCopyWithImpl<$Res, $Val extends DSDividerConfig>
    implements $DSDividerConfigCopyWith<$Res> {
  _$DSDividerConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? thickness = freezed,
    Object? color = freezed,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? animations = freezed,
    Object? behavior = freezed,
    Object? accessibility = freezed,
    Object? orientation = null,
    Object? interactive = null,
    Object? height = freezed,
    Object? width = freezed,
    Object? indent = freezed,
    Object? endIndent = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSDividerVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSDividerState,
            thickness: freezed == thickness
                ? _value.thickness
                : thickness // ignore: cast_nullable_to_non_nullable
                      as double?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSDividerColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSDividerSpacing?,
            animations: freezed == animations
                ? _value.animations
                : animations // ignore: cast_nullable_to_non_nullable
                      as DSDividerAnimations?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSDividerBehavior?,
            accessibility: freezed == accessibility
                ? _value.accessibility
                : accessibility // ignore: cast_nullable_to_non_nullable
                      as DSDividerAccessibilityConfig?,
            orientation: null == orientation
                ? _value.orientation
                : orientation // ignore: cast_nullable_to_non_nullable
                      as DSDividerOrientation,
            interactive: null == interactive
                ? _value.interactive
                : interactive // ignore: cast_nullable_to_non_nullable
                      as bool,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as double?,
            indent: freezed == indent
                ? _value.indent
                : indent // ignore: cast_nullable_to_non_nullable
                      as double?,
            endIndent: freezed == endIndent
                ? _value.endIndent
                : endIndent // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDividerColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSDividerColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDividerSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSDividerSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDividerAnimationsCopyWith<$Res>? get animations {
    if (_value.animations == null) {
      return null;
    }

    return $DSDividerAnimationsCopyWith<$Res>(_value.animations!, (value) {
      return _then(_value.copyWith(animations: value) as $Val);
    });
  }

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDividerBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSDividerBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDividerAccessibilityConfigCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $DSDividerAccessibilityConfigCopyWith<$Res>(_value.accessibility!, (
      value,
    ) {
      return _then(_value.copyWith(accessibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSDividerConfigImplCopyWith<$Res>
    implements $DSDividerConfigCopyWith<$Res> {
  factory _$$DSDividerConfigImplCopyWith(
    _$DSDividerConfigImpl value,
    $Res Function(_$DSDividerConfigImpl) then,
  ) = __$$DSDividerConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSDividerVariant variant,
    DSDividerState state,
    double? thickness,
    Color? color,
    DSDividerColors? colors,
    DSDividerSpacing? spacing,
    DSDividerAnimations? animations,
    DSDividerBehavior? behavior,
    DSDividerAccessibilityConfig? accessibility,
    DSDividerOrientation orientation,
    bool interactive,
    double? height,
    double? width,
    double? indent,
    double? endIndent,
  });

  @override
  $DSDividerColorsCopyWith<$Res>? get colors;
  @override
  $DSDividerSpacingCopyWith<$Res>? get spacing;
  @override
  $DSDividerAnimationsCopyWith<$Res>? get animations;
  @override
  $DSDividerBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSDividerAccessibilityConfigCopyWith<$Res>? get accessibility;
}

/// @nodoc
class __$$DSDividerConfigImplCopyWithImpl<$Res>
    extends _$DSDividerConfigCopyWithImpl<$Res, _$DSDividerConfigImpl>
    implements _$$DSDividerConfigImplCopyWith<$Res> {
  __$$DSDividerConfigImplCopyWithImpl(
    _$DSDividerConfigImpl _value,
    $Res Function(_$DSDividerConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? thickness = freezed,
    Object? color = freezed,
    Object? colors = freezed,
    Object? spacing = freezed,
    Object? animations = freezed,
    Object? behavior = freezed,
    Object? accessibility = freezed,
    Object? orientation = null,
    Object? interactive = null,
    Object? height = freezed,
    Object? width = freezed,
    Object? indent = freezed,
    Object? endIndent = freezed,
  }) {
    return _then(
      _$DSDividerConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSDividerVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSDividerState,
        thickness: freezed == thickness
            ? _value.thickness
            : thickness // ignore: cast_nullable_to_non_nullable
                  as double?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSDividerColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSDividerSpacing?,
        animations: freezed == animations
            ? _value.animations
            : animations // ignore: cast_nullable_to_non_nullable
                  as DSDividerAnimations?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSDividerBehavior?,
        accessibility: freezed == accessibility
            ? _value.accessibility
            : accessibility // ignore: cast_nullable_to_non_nullable
                  as DSDividerAccessibilityConfig?,
        orientation: null == orientation
            ? _value.orientation
            : orientation // ignore: cast_nullable_to_non_nullable
                  as DSDividerOrientation,
        interactive: null == interactive
            ? _value.interactive
            : interactive // ignore: cast_nullable_to_non_nullable
                  as bool,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as double?,
        indent: freezed == indent
            ? _value.indent
            : indent // ignore: cast_nullable_to_non_nullable
                  as double?,
        endIndent: freezed == endIndent
            ? _value.endIndent
            : endIndent // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$DSDividerConfigImpl implements _DSDividerConfig {
  const _$DSDividerConfigImpl({
    this.variant = DSDividerVariant.full,
    this.state = DSDividerState.defaultState,
    this.thickness,
    this.color,
    this.colors,
    this.spacing,
    this.animations,
    this.behavior,
    this.accessibility,
    this.orientation = DSDividerOrientation.horizontal,
    this.interactive = false,
    this.height,
    this.width,
    this.indent,
    this.endIndent,
  });

  /// Variante del divider
  @override
  @JsonKey()
  final DSDividerVariant variant;

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSDividerState state;

  /// Grosor del divider (design token)
  @override
  final double? thickness;

  /// Color del divider (design token)
  @override
  final Color? color;

  /// Configuración de colores (solo design tokens)
  @override
  final DSDividerColors? colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  final DSDividerSpacing? spacing;

  /// Configuración de animaciones
  @override
  final DSDividerAnimations? animations;

  /// Configuración de comportamiento
  @override
  final DSDividerBehavior? behavior;

  /// Configuración de accesibilidad
  @override
  final DSDividerAccessibilityConfig? accessibility;

  /// Orientación del divider
  @override
  @JsonKey()
  final DSDividerOrientation orientation;

  /// Si el divider es interactivo (clickeable)
  @override
  @JsonKey()
  final bool interactive;

  /// Altura del divider cuando es horizontal
  @override
  final double? height;

  /// Ancho del divider cuando es vertical
  @override
  final double? width;

  /// Indentación desde el borde izquierdo (para variant inset)
  @override
  final double? indent;

  /// Indentación desde el borde derecho (para variant inset)
  @override
  final double? endIndent;

  @override
  String toString() {
    return 'DSDividerConfig(variant: $variant, state: $state, thickness: $thickness, color: $color, colors: $colors, spacing: $spacing, animations: $animations, behavior: $behavior, accessibility: $accessibility, orientation: $orientation, interactive: $interactive, height: $height, width: $width, indent: $indent, endIndent: $endIndent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDividerConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.thickness, thickness) ||
                other.thickness == thickness) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.animations, animations) ||
                other.animations == animations) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.interactive, interactive) ||
                other.interactive == interactive) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.indent, indent) || other.indent == indent) &&
            (identical(other.endIndent, endIndent) ||
                other.endIndent == endIndent));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    state,
    thickness,
    color,
    colors,
    spacing,
    animations,
    behavior,
    accessibility,
    orientation,
    interactive,
    height,
    width,
    indent,
    endIndent,
  );

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDividerConfigImplCopyWith<_$DSDividerConfigImpl> get copyWith =>
      __$$DSDividerConfigImplCopyWithImpl<_$DSDividerConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDividerConfig implements DSDividerConfig {
  const factory _DSDividerConfig({
    final DSDividerVariant variant,
    final DSDividerState state,
    final double? thickness,
    final Color? color,
    final DSDividerColors? colors,
    final DSDividerSpacing? spacing,
    final DSDividerAnimations? animations,
    final DSDividerBehavior? behavior,
    final DSDividerAccessibilityConfig? accessibility,
    final DSDividerOrientation orientation,
    final bool interactive,
    final double? height,
    final double? width,
    final double? indent,
    final double? endIndent,
  }) = _$DSDividerConfigImpl;

  /// Variante del divider
  @override
  DSDividerVariant get variant;

  /// Estado actual del componente
  @override
  DSDividerState get state;

  /// Grosor del divider (design token)
  @override
  double? get thickness;

  /// Color del divider (design token)
  @override
  Color? get color;

  /// Configuración de colores (solo design tokens)
  @override
  DSDividerColors? get colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  DSDividerSpacing? get spacing;

  /// Configuración de animaciones
  @override
  DSDividerAnimations? get animations;

  /// Configuración de comportamiento
  @override
  DSDividerBehavior? get behavior;

  /// Configuración de accesibilidad
  @override
  DSDividerAccessibilityConfig? get accessibility;

  /// Orientación del divider
  @override
  DSDividerOrientation get orientation;

  /// Si el divider es interactivo (clickeable)
  @override
  bool get interactive;

  /// Altura del divider cuando es horizontal
  @override
  double? get height;

  /// Ancho del divider cuando es vertical
  @override
  double? get width;

  /// Indentación desde el borde izquierdo (para variant inset)
  @override
  double? get indent;

  /// Indentación desde el borde derecho (para variant inset)
  @override
  double? get endIndent;

  /// Create a copy of DSDividerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDividerConfigImplCopyWith<_$DSDividerConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDividerColors {
  /// Color por defecto del divider
  Color? get defaultColor => throw _privateConstructorUsedError;

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

  /// Create a copy of DSDividerColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDividerColorsCopyWith<DSDividerColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDividerColorsCopyWith<$Res> {
  factory $DSDividerColorsCopyWith(
    DSDividerColors value,
    $Res Function(DSDividerColors) then,
  ) = _$DSDividerColorsCopyWithImpl<$Res, DSDividerColors>;
  @useResult
  $Res call({
    Color? defaultColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
  });
}

/// @nodoc
class _$DSDividerColorsCopyWithImpl<$Res, $Val extends DSDividerColors>
    implements $DSDividerColorsCopyWith<$Res> {
  _$DSDividerColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDividerColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            defaultColor: freezed == defaultColor
                ? _value.defaultColor
                : defaultColor // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDividerColorsImplCopyWith<$Res>
    implements $DSDividerColorsCopyWith<$Res> {
  factory _$$DSDividerColorsImplCopyWith(
    _$DSDividerColorsImpl value,
    $Res Function(_$DSDividerColorsImpl) then,
  ) = __$$DSDividerColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? defaultColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? loadingColor,
    Color? skeletonBaseColor,
    Color? skeletonHighlightColor,
  });
}

/// @nodoc
class __$$DSDividerColorsImplCopyWithImpl<$Res>
    extends _$DSDividerColorsCopyWithImpl<$Res, _$DSDividerColorsImpl>
    implements _$$DSDividerColorsImplCopyWith<$Res> {
  __$$DSDividerColorsImplCopyWithImpl(
    _$DSDividerColorsImpl _value,
    $Res Function(_$DSDividerColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDividerColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultColor = freezed,
    Object? hoverColor = freezed,
    Object? pressedColor = freezed,
    Object? focusColor = freezed,
    Object? selectedColor = freezed,
    Object? disabledColor = freezed,
    Object? loadingColor = freezed,
    Object? skeletonBaseColor = freezed,
    Object? skeletonHighlightColor = freezed,
  }) {
    return _then(
      _$DSDividerColorsImpl(
        defaultColor: freezed == defaultColor
            ? _value.defaultColor
            : defaultColor // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc

class _$DSDividerColorsImpl implements _DSDividerColors {
  const _$DSDividerColorsImpl({
    this.defaultColor,
    this.hoverColor,
    this.pressedColor,
    this.focusColor,
    this.selectedColor,
    this.disabledColor,
    this.loadingColor,
    this.skeletonBaseColor,
    this.skeletonHighlightColor,
  });

  /// Color por defecto del divider
  @override
  final Color? defaultColor;

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

  @override
  String toString() {
    return 'DSDividerColors(defaultColor: $defaultColor, hoverColor: $hoverColor, pressedColor: $pressedColor, focusColor: $focusColor, selectedColor: $selectedColor, disabledColor: $disabledColor, loadingColor: $loadingColor, skeletonBaseColor: $skeletonBaseColor, skeletonHighlightColor: $skeletonHighlightColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDividerColorsImpl &&
            (identical(other.defaultColor, defaultColor) ||
                other.defaultColor == defaultColor) &&
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
                other.skeletonHighlightColor == skeletonHighlightColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultColor,
    hoverColor,
    pressedColor,
    focusColor,
    selectedColor,
    disabledColor,
    loadingColor,
    skeletonBaseColor,
    skeletonHighlightColor,
  );

  /// Create a copy of DSDividerColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDividerColorsImplCopyWith<_$DSDividerColorsImpl> get copyWith =>
      __$$DSDividerColorsImplCopyWithImpl<_$DSDividerColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDividerColors implements DSDividerColors {
  const factory _DSDividerColors({
    final Color? defaultColor,
    final Color? hoverColor,
    final Color? pressedColor,
    final Color? focusColor,
    final Color? selectedColor,
    final Color? disabledColor,
    final Color? loadingColor,
    final Color? skeletonBaseColor,
    final Color? skeletonHighlightColor,
  }) = _$DSDividerColorsImpl;

  /// Color por defecto del divider
  @override
  Color? get defaultColor;

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

  /// Create a copy of DSDividerColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDividerColorsImplCopyWith<_$DSDividerColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDividerSpacing {
  /// Indentación por defecto para variant inset
  double get defaultIndent => throw _privateConstructorUsedError;

  /// Indentación al final para variant inset
  double get defaultEndIndent => throw _privateConstructorUsedError;

  /// Grosor por defecto del divider
  double get defaultThickness => throw _privateConstructorUsedError;

  /// Altura por defecto para dividers horizontales
  double get defaultHeight => throw _privateConstructorUsedError;

  /// Ancho por defecto para dividers verticales
  double get defaultWidth => throw _privateConstructorUsedError;

  /// Espaciado mínimo interactivo (para touch targets)
  double get minInteractiveSize => throw _privateConstructorUsedError;

  /// Padding para dividers interactivos
  EdgeInsets get interactivePadding => throw _privateConstructorUsedError;

  /// Create a copy of DSDividerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDividerSpacingCopyWith<DSDividerSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDividerSpacingCopyWith<$Res> {
  factory $DSDividerSpacingCopyWith(
    DSDividerSpacing value,
    $Res Function(DSDividerSpacing) then,
  ) = _$DSDividerSpacingCopyWithImpl<$Res, DSDividerSpacing>;
  @useResult
  $Res call({
    double defaultIndent,
    double defaultEndIndent,
    double defaultThickness,
    double defaultHeight,
    double defaultWidth,
    double minInteractiveSize,
    EdgeInsets interactivePadding,
  });
}

/// @nodoc
class _$DSDividerSpacingCopyWithImpl<$Res, $Val extends DSDividerSpacing>
    implements $DSDividerSpacingCopyWith<$Res> {
  _$DSDividerSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDividerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultIndent = null,
    Object? defaultEndIndent = null,
    Object? defaultThickness = null,
    Object? defaultHeight = null,
    Object? defaultWidth = null,
    Object? minInteractiveSize = null,
    Object? interactivePadding = null,
  }) {
    return _then(
      _value.copyWith(
            defaultIndent: null == defaultIndent
                ? _value.defaultIndent
                : defaultIndent // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultEndIndent: null == defaultEndIndent
                ? _value.defaultEndIndent
                : defaultEndIndent // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultThickness: null == defaultThickness
                ? _value.defaultThickness
                : defaultThickness // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultHeight: null == defaultHeight
                ? _value.defaultHeight
                : defaultHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultWidth: null == defaultWidth
                ? _value.defaultWidth
                : defaultWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            minInteractiveSize: null == minInteractiveSize
                ? _value.minInteractiveSize
                : minInteractiveSize // ignore: cast_nullable_to_non_nullable
                      as double,
            interactivePadding: null == interactivePadding
                ? _value.interactivePadding
                : interactivePadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDividerSpacingImplCopyWith<$Res>
    implements $DSDividerSpacingCopyWith<$Res> {
  factory _$$DSDividerSpacingImplCopyWith(
    _$DSDividerSpacingImpl value,
    $Res Function(_$DSDividerSpacingImpl) then,
  ) = __$$DSDividerSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double defaultIndent,
    double defaultEndIndent,
    double defaultThickness,
    double defaultHeight,
    double defaultWidth,
    double minInteractiveSize,
    EdgeInsets interactivePadding,
  });
}

/// @nodoc
class __$$DSDividerSpacingImplCopyWithImpl<$Res>
    extends _$DSDividerSpacingCopyWithImpl<$Res, _$DSDividerSpacingImpl>
    implements _$$DSDividerSpacingImplCopyWith<$Res> {
  __$$DSDividerSpacingImplCopyWithImpl(
    _$DSDividerSpacingImpl _value,
    $Res Function(_$DSDividerSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDividerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultIndent = null,
    Object? defaultEndIndent = null,
    Object? defaultThickness = null,
    Object? defaultHeight = null,
    Object? defaultWidth = null,
    Object? minInteractiveSize = null,
    Object? interactivePadding = null,
  }) {
    return _then(
      _$DSDividerSpacingImpl(
        defaultIndent: null == defaultIndent
            ? _value.defaultIndent
            : defaultIndent // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultEndIndent: null == defaultEndIndent
            ? _value.defaultEndIndent
            : defaultEndIndent // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultThickness: null == defaultThickness
            ? _value.defaultThickness
            : defaultThickness // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultHeight: null == defaultHeight
            ? _value.defaultHeight
            : defaultHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultWidth: null == defaultWidth
            ? _value.defaultWidth
            : defaultWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        minInteractiveSize: null == minInteractiveSize
            ? _value.minInteractiveSize
            : minInteractiveSize // ignore: cast_nullable_to_non_nullable
                  as double,
        interactivePadding: null == interactivePadding
            ? _value.interactivePadding
            : interactivePadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
      ),
    );
  }
}

/// @nodoc

class _$DSDividerSpacingImpl implements _DSDividerSpacing {
  const _$DSDividerSpacingImpl({
    this.defaultIndent = 16.0,
    this.defaultEndIndent = 16.0,
    this.defaultThickness = 1.0,
    this.defaultHeight = 1.0,
    this.defaultWidth = 1.0,
    this.minInteractiveSize = 44.0,
    this.interactivePadding = const EdgeInsets.all(8.0),
  });

  /// Indentación por defecto para variant inset
  @override
  @JsonKey()
  final double defaultIndent;

  /// Indentación al final para variant inset
  @override
  @JsonKey()
  final double defaultEndIndent;

  /// Grosor por defecto del divider
  @override
  @JsonKey()
  final double defaultThickness;

  /// Altura por defecto para dividers horizontales
  @override
  @JsonKey()
  final double defaultHeight;

  /// Ancho por defecto para dividers verticales
  @override
  @JsonKey()
  final double defaultWidth;

  /// Espaciado mínimo interactivo (para touch targets)
  @override
  @JsonKey()
  final double minInteractiveSize;

  /// Padding para dividers interactivos
  @override
  @JsonKey()
  final EdgeInsets interactivePadding;

  @override
  String toString() {
    return 'DSDividerSpacing(defaultIndent: $defaultIndent, defaultEndIndent: $defaultEndIndent, defaultThickness: $defaultThickness, defaultHeight: $defaultHeight, defaultWidth: $defaultWidth, minInteractiveSize: $minInteractiveSize, interactivePadding: $interactivePadding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDividerSpacingImpl &&
            (identical(other.defaultIndent, defaultIndent) ||
                other.defaultIndent == defaultIndent) &&
            (identical(other.defaultEndIndent, defaultEndIndent) ||
                other.defaultEndIndent == defaultEndIndent) &&
            (identical(other.defaultThickness, defaultThickness) ||
                other.defaultThickness == defaultThickness) &&
            (identical(other.defaultHeight, defaultHeight) ||
                other.defaultHeight == defaultHeight) &&
            (identical(other.defaultWidth, defaultWidth) ||
                other.defaultWidth == defaultWidth) &&
            (identical(other.minInteractiveSize, minInteractiveSize) ||
                other.minInteractiveSize == minInteractiveSize) &&
            (identical(other.interactivePadding, interactivePadding) ||
                other.interactivePadding == interactivePadding));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultIndent,
    defaultEndIndent,
    defaultThickness,
    defaultHeight,
    defaultWidth,
    minInteractiveSize,
    interactivePadding,
  );

  /// Create a copy of DSDividerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDividerSpacingImplCopyWith<_$DSDividerSpacingImpl> get copyWith =>
      __$$DSDividerSpacingImplCopyWithImpl<_$DSDividerSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDividerSpacing implements DSDividerSpacing {
  const factory _DSDividerSpacing({
    final double defaultIndent,
    final double defaultEndIndent,
    final double defaultThickness,
    final double defaultHeight,
    final double defaultWidth,
    final double minInteractiveSize,
    final EdgeInsets interactivePadding,
  }) = _$DSDividerSpacingImpl;

  /// Indentación por defecto para variant inset
  @override
  double get defaultIndent;

  /// Indentación al final para variant inset
  @override
  double get defaultEndIndent;

  /// Grosor por defecto del divider
  @override
  double get defaultThickness;

  /// Altura por defecto para dividers horizontales
  @override
  double get defaultHeight;

  /// Ancho por defecto para dividers verticales
  @override
  double get defaultWidth;

  /// Espaciado mínimo interactivo (para touch targets)
  @override
  double get minInteractiveSize;

  /// Padding para dividers interactivos
  @override
  EdgeInsets get interactivePadding;

  /// Create a copy of DSDividerSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDividerSpacingImplCopyWith<_$DSDividerSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDividerAnimations {
  /// Duración de animaciones de estado
  Duration get stateDuration => throw _privateConstructorUsedError;

  /// Duración de animaciones de skeleton
  Duration get skeletonDuration => throw _privateConstructorUsedError;

  /// Curva de animación de estado
  Curve get stateCurve => throw _privateConstructorUsedError;

  /// Curva de animación de skeleton
  Curve get skeletonCurve => throw _privateConstructorUsedError;

  /// Si las animaciones están habilitadas
  bool get enabled => throw _privateConstructorUsedError;

  /// Si debe respetar la configuración de reduced motion
  bool get respectReducedMotion => throw _privateConstructorUsedError;

  /// Create a copy of DSDividerAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDividerAnimationsCopyWith<DSDividerAnimations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDividerAnimationsCopyWith<$Res> {
  factory $DSDividerAnimationsCopyWith(
    DSDividerAnimations value,
    $Res Function(DSDividerAnimations) then,
  ) = _$DSDividerAnimationsCopyWithImpl<$Res, DSDividerAnimations>;
  @useResult
  $Res call({
    Duration stateDuration,
    Duration skeletonDuration,
    Curve stateCurve,
    Curve skeletonCurve,
    bool enabled,
    bool respectReducedMotion,
  });
}

/// @nodoc
class _$DSDividerAnimationsCopyWithImpl<$Res, $Val extends DSDividerAnimations>
    implements $DSDividerAnimationsCopyWith<$Res> {
  _$DSDividerAnimationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDividerAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDuration = null,
    Object? skeletonDuration = null,
    Object? stateCurve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
    Object? respectReducedMotion = null,
  }) {
    return _then(
      _value.copyWith(
            stateDuration: null == stateDuration
                ? _value.stateDuration
                : stateDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            skeletonDuration: null == skeletonDuration
                ? _value.skeletonDuration
                : skeletonDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDividerAnimationsImplCopyWith<$Res>
    implements $DSDividerAnimationsCopyWith<$Res> {
  factory _$$DSDividerAnimationsImplCopyWith(
    _$DSDividerAnimationsImpl value,
    $Res Function(_$DSDividerAnimationsImpl) then,
  ) = __$$DSDividerAnimationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Duration stateDuration,
    Duration skeletonDuration,
    Curve stateCurve,
    Curve skeletonCurve,
    bool enabled,
    bool respectReducedMotion,
  });
}

/// @nodoc
class __$$DSDividerAnimationsImplCopyWithImpl<$Res>
    extends _$DSDividerAnimationsCopyWithImpl<$Res, _$DSDividerAnimationsImpl>
    implements _$$DSDividerAnimationsImplCopyWith<$Res> {
  __$$DSDividerAnimationsImplCopyWithImpl(
    _$DSDividerAnimationsImpl _value,
    $Res Function(_$DSDividerAnimationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDividerAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDuration = null,
    Object? skeletonDuration = null,
    Object? stateCurve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
    Object? respectReducedMotion = null,
  }) {
    return _then(
      _$DSDividerAnimationsImpl(
        stateDuration: null == stateDuration
            ? _value.stateDuration
            : stateDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        skeletonDuration: null == skeletonDuration
            ? _value.skeletonDuration
            : skeletonDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
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
      ),
    );
  }
}

/// @nodoc

class _$DSDividerAnimationsImpl implements _DSDividerAnimations {
  const _$DSDividerAnimationsImpl({
    this.stateDuration = const Duration(milliseconds: 200),
    this.skeletonDuration = const Duration(milliseconds: 1200),
    this.stateCurve = Curves.easeInOut,
    this.skeletonCurve = Curves.easeInOut,
    this.enabled = true,
    this.respectReducedMotion = true,
  });

  /// Duración de animaciones de estado
  @override
  @JsonKey()
  final Duration stateDuration;

  /// Duración de animaciones de skeleton
  @override
  @JsonKey()
  final Duration skeletonDuration;

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

  @override
  String toString() {
    return 'DSDividerAnimations(stateDuration: $stateDuration, skeletonDuration: $skeletonDuration, stateCurve: $stateCurve, skeletonCurve: $skeletonCurve, enabled: $enabled, respectReducedMotion: $respectReducedMotion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDividerAnimationsImpl &&
            (identical(other.stateDuration, stateDuration) ||
                other.stateDuration == stateDuration) &&
            (identical(other.skeletonDuration, skeletonDuration) ||
                other.skeletonDuration == skeletonDuration) &&
            (identical(other.stateCurve, stateCurve) ||
                other.stateCurve == stateCurve) &&
            (identical(other.skeletonCurve, skeletonCurve) ||
                other.skeletonCurve == skeletonCurve) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.respectReducedMotion, respectReducedMotion) ||
                other.respectReducedMotion == respectReducedMotion));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stateDuration,
    skeletonDuration,
    stateCurve,
    skeletonCurve,
    enabled,
    respectReducedMotion,
  );

  /// Create a copy of DSDividerAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDividerAnimationsImplCopyWith<_$DSDividerAnimationsImpl> get copyWith =>
      __$$DSDividerAnimationsImplCopyWithImpl<_$DSDividerAnimationsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDividerAnimations implements DSDividerAnimations {
  const factory _DSDividerAnimations({
    final Duration stateDuration,
    final Duration skeletonDuration,
    final Curve stateCurve,
    final Curve skeletonCurve,
    final bool enabled,
    final bool respectReducedMotion,
  }) = _$DSDividerAnimationsImpl;

  /// Duración de animaciones de estado
  @override
  Duration get stateDuration;

  /// Duración de animaciones de skeleton
  @override
  Duration get skeletonDuration;

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

  /// Create a copy of DSDividerAnimations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDividerAnimationsImplCopyWith<_$DSDividerAnimationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDividerBehavior {
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

  /// Create a copy of DSDividerBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDividerBehaviorCopyWith<DSDividerBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDividerBehaviorCopyWith<$Res> {
  factory $DSDividerBehaviorCopyWith(
    DSDividerBehavior value,
    $Res Function(DSDividerBehavior) then,
  ) = _$DSDividerBehaviorCopyWithImpl<$Res, DSDividerBehavior>;
  @useResult
  $Res call({
    bool showDebugInfo,
    bool enableHoverEffects,
    bool showFocusIndicator,
    bool enableHapticFeedback,
    bool cacheStyles,
    bool platformAdaptive,
  });
}

/// @nodoc
class _$DSDividerBehaviorCopyWithImpl<$Res, $Val extends DSDividerBehavior>
    implements $DSDividerBehaviorCopyWith<$Res> {
  _$DSDividerBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDividerBehavior
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDividerBehaviorImplCopyWith<$Res>
    implements $DSDividerBehaviorCopyWith<$Res> {
  factory _$$DSDividerBehaviorImplCopyWith(
    _$DSDividerBehaviorImpl value,
    $Res Function(_$DSDividerBehaviorImpl) then,
  ) = __$$DSDividerBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool showDebugInfo,
    bool enableHoverEffects,
    bool showFocusIndicator,
    bool enableHapticFeedback,
    bool cacheStyles,
    bool platformAdaptive,
  });
}

/// @nodoc
class __$$DSDividerBehaviorImplCopyWithImpl<$Res>
    extends _$DSDividerBehaviorCopyWithImpl<$Res, _$DSDividerBehaviorImpl>
    implements _$$DSDividerBehaviorImplCopyWith<$Res> {
  __$$DSDividerBehaviorImplCopyWithImpl(
    _$DSDividerBehaviorImpl _value,
    $Res Function(_$DSDividerBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDividerBehavior
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
  }) {
    return _then(
      _$DSDividerBehaviorImpl(
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
      ),
    );
  }
}

/// @nodoc

class _$DSDividerBehaviorImpl implements _DSDividerBehavior {
  const _$DSDividerBehaviorImpl({
    this.showDebugInfo = false,
    this.enableHoverEffects = true,
    this.showFocusIndicator = true,
    this.enableHapticFeedback = true,
    this.cacheStyles = true,
    this.platformAdaptive = true,
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

  @override
  String toString() {
    return 'DSDividerBehavior(showDebugInfo: $showDebugInfo, enableHoverEffects: $enableHoverEffects, showFocusIndicator: $showFocusIndicator, enableHapticFeedback: $enableHapticFeedback, cacheStyles: $cacheStyles, platformAdaptive: $platformAdaptive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDividerBehaviorImpl &&
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
                other.platformAdaptive == platformAdaptive));
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
  );

  /// Create a copy of DSDividerBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDividerBehaviorImplCopyWith<_$DSDividerBehaviorImpl> get copyWith =>
      __$$DSDividerBehaviorImplCopyWithImpl<_$DSDividerBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDividerBehavior implements DSDividerBehavior {
  const factory _DSDividerBehavior({
    final bool showDebugInfo,
    final bool enableHoverEffects,
    final bool showFocusIndicator,
    final bool enableHapticFeedback,
    final bool cacheStyles,
    final bool platformAdaptive,
  }) = _$DSDividerBehaviorImpl;

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

  /// Create a copy of DSDividerBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDividerBehaviorImplCopyWith<_$DSDividerBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDividerAccessibilityConfig {
  /// Si la accesibilidad está habilitada
  bool get enabled => throw _privateConstructorUsedError;

  /// Rol semántico del divider
  String get semanticRole => throw _privateConstructorUsedError;

  /// Label para screen readers
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Descripción para screen readers
  String? get semanticDescription => throw _privateConstructorUsedError;

  /// Si debe ser enfocable por teclado (para dividers interactivos)
  bool get focusable => throw _privateConstructorUsedError;

  /// Si debe excluirse de la navegación semántica
  bool get excludeSemantics => throw _privateConstructorUsedError;

  /// Label para estado de loading
  String get loadingLabel => throw _privateConstructorUsedError;

  /// Label para estado disabled
  String get disabledLabel => throw _privateConstructorUsedError;

  /// Create a copy of DSDividerAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDividerAccessibilityConfigCopyWith<DSDividerAccessibilityConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDividerAccessibilityConfigCopyWith<$Res> {
  factory $DSDividerAccessibilityConfigCopyWith(
    DSDividerAccessibilityConfig value,
    $Res Function(DSDividerAccessibilityConfig) then,
  ) =
      _$DSDividerAccessibilityConfigCopyWithImpl<
        $Res,
        DSDividerAccessibilityConfig
      >;
  @useResult
  $Res call({
    bool enabled,
    String semanticRole,
    String? semanticLabel,
    String? semanticDescription,
    bool focusable,
    bool excludeSemantics,
    String loadingLabel,
    String disabledLabel,
  });
}

/// @nodoc
class _$DSDividerAccessibilityConfigCopyWithImpl<
  $Res,
  $Val extends DSDividerAccessibilityConfig
>
    implements $DSDividerAccessibilityConfigCopyWith<$Res> {
  _$DSDividerAccessibilityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDividerAccessibilityConfig
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
    Object? loadingLabel = null,
    Object? disabledLabel = null,
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
            loadingLabel: null == loadingLabel
                ? _value.loadingLabel
                : loadingLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            disabledLabel: null == disabledLabel
                ? _value.disabledLabel
                : disabledLabel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDividerAccessibilityConfigImplCopyWith<$Res>
    implements $DSDividerAccessibilityConfigCopyWith<$Res> {
  factory _$$DSDividerAccessibilityConfigImplCopyWith(
    _$DSDividerAccessibilityConfigImpl value,
    $Res Function(_$DSDividerAccessibilityConfigImpl) then,
  ) = __$$DSDividerAccessibilityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    String semanticRole,
    String? semanticLabel,
    String? semanticDescription,
    bool focusable,
    bool excludeSemantics,
    String loadingLabel,
    String disabledLabel,
  });
}

/// @nodoc
class __$$DSDividerAccessibilityConfigImplCopyWithImpl<$Res>
    extends
        _$DSDividerAccessibilityConfigCopyWithImpl<
          $Res,
          _$DSDividerAccessibilityConfigImpl
        >
    implements _$$DSDividerAccessibilityConfigImplCopyWith<$Res> {
  __$$DSDividerAccessibilityConfigImplCopyWithImpl(
    _$DSDividerAccessibilityConfigImpl _value,
    $Res Function(_$DSDividerAccessibilityConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDividerAccessibilityConfig
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
    Object? loadingLabel = null,
    Object? disabledLabel = null,
  }) {
    return _then(
      _$DSDividerAccessibilityConfigImpl(
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
        loadingLabel: null == loadingLabel
            ? _value.loadingLabel
            : loadingLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        disabledLabel: null == disabledLabel
            ? _value.disabledLabel
            : disabledLabel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DSDividerAccessibilityConfigImpl
    implements _DSDividerAccessibilityConfig {
  const _$DSDividerAccessibilityConfigImpl({
    this.enabled = true,
    this.semanticRole = 'separator',
    this.semanticLabel,
    this.semanticDescription,
    this.focusable = false,
    this.excludeSemantics = false,
    this.loadingLabel = 'Loading',
    this.disabledLabel = 'Disabled',
  });

  /// Si la accesibilidad está habilitada
  @override
  @JsonKey()
  final bool enabled;

  /// Rol semántico del divider
  @override
  @JsonKey()
  final String semanticRole;

  /// Label para screen readers
  @override
  final String? semanticLabel;

  /// Descripción para screen readers
  @override
  final String? semanticDescription;

  /// Si debe ser enfocable por teclado (para dividers interactivos)
  @override
  @JsonKey()
  final bool focusable;

  /// Si debe excluirse de la navegación semántica
  @override
  @JsonKey()
  final bool excludeSemantics;

  /// Label para estado de loading
  @override
  @JsonKey()
  final String loadingLabel;

  /// Label para estado disabled
  @override
  @JsonKey()
  final String disabledLabel;

  @override
  String toString() {
    return 'DSDividerAccessibilityConfig(enabled: $enabled, semanticRole: $semanticRole, semanticLabel: $semanticLabel, semanticDescription: $semanticDescription, focusable: $focusable, excludeSemantics: $excludeSemantics, loadingLabel: $loadingLabel, disabledLabel: $disabledLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDividerAccessibilityConfigImpl &&
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
            (identical(other.loadingLabel, loadingLabel) ||
                other.loadingLabel == loadingLabel) &&
            (identical(other.disabledLabel, disabledLabel) ||
                other.disabledLabel == disabledLabel));
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
    loadingLabel,
    disabledLabel,
  );

  /// Create a copy of DSDividerAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDividerAccessibilityConfigImplCopyWith<
    _$DSDividerAccessibilityConfigImpl
  >
  get copyWith =>
      __$$DSDividerAccessibilityConfigImplCopyWithImpl<
        _$DSDividerAccessibilityConfigImpl
      >(this, _$identity);
}

abstract class _DSDividerAccessibilityConfig
    implements DSDividerAccessibilityConfig {
  const factory _DSDividerAccessibilityConfig({
    final bool enabled,
    final String semanticRole,
    final String? semanticLabel,
    final String? semanticDescription,
    final bool focusable,
    final bool excludeSemantics,
    final String loadingLabel,
    final String disabledLabel,
  }) = _$DSDividerAccessibilityConfigImpl;

  /// Si la accesibilidad está habilitada
  @override
  bool get enabled;

  /// Rol semántico del divider
  @override
  String get semanticRole;

  /// Label para screen readers
  @override
  String? get semanticLabel;

  /// Descripción para screen readers
  @override
  String? get semanticDescription;

  /// Si debe ser enfocable por teclado (para dividers interactivos)
  @override
  bool get focusable;

  /// Si debe excluirse de la navegación semántica
  @override
  bool get excludeSemantics;

  /// Label para estado de loading
  @override
  String get loadingLabel;

  /// Label para estado disabled
  @override
  String get disabledLabel;

  /// Create a copy of DSDividerAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDividerAccessibilityConfigImplCopyWith<
    _$DSDividerAccessibilityConfigImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
