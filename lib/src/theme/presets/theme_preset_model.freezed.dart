// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_preset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSThemeTokens {
  double get baseSpacing => throw _privateConstructorUsedError;
  double get typographyScale => throw _privateConstructorUsedError;
  double get defaultBorderRadius => throw _privateConstructorUsedError;
  bool get isCompact => throw _privateConstructorUsedError;
  bool get isExpressive => throw _privateConstructorUsedError;

  /// Create a copy of DSThemeTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSThemeTokensCopyWith<DSThemeTokens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSThemeTokensCopyWith<$Res> {
  factory $DSThemeTokensCopyWith(
    DSThemeTokens value,
    $Res Function(DSThemeTokens) then,
  ) = _$DSThemeTokensCopyWithImpl<$Res, DSThemeTokens>;
  @useResult
  $Res call({
    double baseSpacing,
    double typographyScale,
    double defaultBorderRadius,
    bool isCompact,
    bool isExpressive,
  });
}

/// @nodoc
class _$DSThemeTokensCopyWithImpl<$Res, $Val extends DSThemeTokens>
    implements $DSThemeTokensCopyWith<$Res> {
  _$DSThemeTokensCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSThemeTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseSpacing = null,
    Object? typographyScale = null,
    Object? defaultBorderRadius = null,
    Object? isCompact = null,
    Object? isExpressive = null,
  }) {
    return _then(
      _value.copyWith(
            baseSpacing: null == baseSpacing
                ? _value.baseSpacing
                : baseSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            typographyScale: null == typographyScale
                ? _value.typographyScale
                : typographyScale // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultBorderRadius: null == defaultBorderRadius
                ? _value.defaultBorderRadius
                : defaultBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            isCompact: null == isCompact
                ? _value.isCompact
                : isCompact // ignore: cast_nullable_to_non_nullable
                      as bool,
            isExpressive: null == isExpressive
                ? _value.isExpressive
                : isExpressive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSThemeTokensImplCopyWith<$Res>
    implements $DSThemeTokensCopyWith<$Res> {
  factory _$$DSThemeTokensImplCopyWith(
    _$DSThemeTokensImpl value,
    $Res Function(_$DSThemeTokensImpl) then,
  ) = __$$DSThemeTokensImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double baseSpacing,
    double typographyScale,
    double defaultBorderRadius,
    bool isCompact,
    bool isExpressive,
  });
}

/// @nodoc
class __$$DSThemeTokensImplCopyWithImpl<$Res>
    extends _$DSThemeTokensCopyWithImpl<$Res, _$DSThemeTokensImpl>
    implements _$$DSThemeTokensImplCopyWith<$Res> {
  __$$DSThemeTokensImplCopyWithImpl(
    _$DSThemeTokensImpl _value,
    $Res Function(_$DSThemeTokensImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSThemeTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseSpacing = null,
    Object? typographyScale = null,
    Object? defaultBorderRadius = null,
    Object? isCompact = null,
    Object? isExpressive = null,
  }) {
    return _then(
      _$DSThemeTokensImpl(
        baseSpacing: null == baseSpacing
            ? _value.baseSpacing
            : baseSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        typographyScale: null == typographyScale
            ? _value.typographyScale
            : typographyScale // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultBorderRadius: null == defaultBorderRadius
            ? _value.defaultBorderRadius
            : defaultBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        isCompact: null == isCompact
            ? _value.isCompact
            : isCompact // ignore: cast_nullable_to_non_nullable
                  as bool,
        isExpressive: null == isExpressive
            ? _value.isExpressive
            : isExpressive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSThemeTokensImpl implements _DSThemeTokens {
  const _$DSThemeTokensImpl({
    this.baseSpacing = 8.0,
    this.typographyScale = 1.0,
    this.defaultBorderRadius = 12.0,
    this.isCompact = false,
    this.isExpressive = false,
  });

  @override
  @JsonKey()
  final double baseSpacing;
  @override
  @JsonKey()
  final double typographyScale;
  @override
  @JsonKey()
  final double defaultBorderRadius;
  @override
  @JsonKey()
  final bool isCompact;
  @override
  @JsonKey()
  final bool isExpressive;

  @override
  String toString() {
    return 'DSThemeTokens(baseSpacing: $baseSpacing, typographyScale: $typographyScale, defaultBorderRadius: $defaultBorderRadius, isCompact: $isCompact, isExpressive: $isExpressive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSThemeTokensImpl &&
            (identical(other.baseSpacing, baseSpacing) ||
                other.baseSpacing == baseSpacing) &&
            (identical(other.typographyScale, typographyScale) ||
                other.typographyScale == typographyScale) &&
            (identical(other.defaultBorderRadius, defaultBorderRadius) ||
                other.defaultBorderRadius == defaultBorderRadius) &&
            (identical(other.isCompact, isCompact) ||
                other.isCompact == isCompact) &&
            (identical(other.isExpressive, isExpressive) ||
                other.isExpressive == isExpressive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    baseSpacing,
    typographyScale,
    defaultBorderRadius,
    isCompact,
    isExpressive,
  );

  /// Create a copy of DSThemeTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSThemeTokensImplCopyWith<_$DSThemeTokensImpl> get copyWith =>
      __$$DSThemeTokensImplCopyWithImpl<_$DSThemeTokensImpl>(this, _$identity);
}

abstract class _DSThemeTokens implements DSThemeTokens {
  const factory _DSThemeTokens({
    final double baseSpacing,
    final double typographyScale,
    final double defaultBorderRadius,
    final bool isCompact,
    final bool isExpressive,
  }) = _$DSThemeTokensImpl;

  @override
  double get baseSpacing;
  @override
  double get typographyScale;
  @override
  double get defaultBorderRadius;
  @override
  bool get isCompact;
  @override
  bool get isExpressive;

  /// Create a copy of DSThemeTokens
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSThemeTokensImplCopyWith<_$DSThemeTokensImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSThemePreview {
  Color get primaryColor => throw _privateConstructorUsedError;
  Color get secondaryColor => throw _privateConstructorUsedError;
  Color get backgroundColor => throw _privateConstructorUsedError;
  Color get surfaceColor => throw _privateConstructorUsedError;
  Color get textColor => throw _privateConstructorUsedError;
  String? get gradientPreview => throw _privateConstructorUsedError;

  /// Create a copy of DSThemePreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSThemePreviewCopyWith<DSThemePreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSThemePreviewCopyWith<$Res> {
  factory $DSThemePreviewCopyWith(
    DSThemePreview value,
    $Res Function(DSThemePreview) then,
  ) = _$DSThemePreviewCopyWithImpl<$Res, DSThemePreview>;
  @useResult
  $Res call({
    Color primaryColor,
    Color secondaryColor,
    Color backgroundColor,
    Color surfaceColor,
    Color textColor,
    String? gradientPreview,
  });
}

/// @nodoc
class _$DSThemePreviewCopyWithImpl<$Res, $Val extends DSThemePreview>
    implements $DSThemePreviewCopyWith<$Res> {
  _$DSThemePreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSThemePreview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = null,
    Object? secondaryColor = null,
    Object? backgroundColor = null,
    Object? surfaceColor = null,
    Object? textColor = null,
    Object? gradientPreview = freezed,
  }) {
    return _then(
      _value.copyWith(
            primaryColor: null == primaryColor
                ? _value.primaryColor
                : primaryColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            secondaryColor: null == secondaryColor
                ? _value.secondaryColor
                : secondaryColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            backgroundColor: null == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            surfaceColor: null == surfaceColor
                ? _value.surfaceColor
                : surfaceColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            textColor: null == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            gradientPreview: freezed == gradientPreview
                ? _value.gradientPreview
                : gradientPreview // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSThemePreviewImplCopyWith<$Res>
    implements $DSThemePreviewCopyWith<$Res> {
  factory _$$DSThemePreviewImplCopyWith(
    _$DSThemePreviewImpl value,
    $Res Function(_$DSThemePreviewImpl) then,
  ) = __$$DSThemePreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color primaryColor,
    Color secondaryColor,
    Color backgroundColor,
    Color surfaceColor,
    Color textColor,
    String? gradientPreview,
  });
}

/// @nodoc
class __$$DSThemePreviewImplCopyWithImpl<$Res>
    extends _$DSThemePreviewCopyWithImpl<$Res, _$DSThemePreviewImpl>
    implements _$$DSThemePreviewImplCopyWith<$Res> {
  __$$DSThemePreviewImplCopyWithImpl(
    _$DSThemePreviewImpl _value,
    $Res Function(_$DSThemePreviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSThemePreview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = null,
    Object? secondaryColor = null,
    Object? backgroundColor = null,
    Object? surfaceColor = null,
    Object? textColor = null,
    Object? gradientPreview = freezed,
  }) {
    return _then(
      _$DSThemePreviewImpl(
        primaryColor: null == primaryColor
            ? _value.primaryColor
            : primaryColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        secondaryColor: null == secondaryColor
            ? _value.secondaryColor
            : secondaryColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        backgroundColor: null == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        surfaceColor: null == surfaceColor
            ? _value.surfaceColor
            : surfaceColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        textColor: null == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        gradientPreview: freezed == gradientPreview
            ? _value.gradientPreview
            : gradientPreview // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSThemePreviewImpl implements _DSThemePreview {
  const _$DSThemePreviewImpl({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.textColor,
    this.gradientPreview,
  });

  @override
  final Color primaryColor;
  @override
  final Color secondaryColor;
  @override
  final Color backgroundColor;
  @override
  final Color surfaceColor;
  @override
  final Color textColor;
  @override
  final String? gradientPreview;

  @override
  String toString() {
    return 'DSThemePreview(primaryColor: $primaryColor, secondaryColor: $secondaryColor, backgroundColor: $backgroundColor, surfaceColor: $surfaceColor, textColor: $textColor, gradientPreview: $gradientPreview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSThemePreviewImpl &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.secondaryColor, secondaryColor) ||
                other.secondaryColor == secondaryColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.surfaceColor, surfaceColor) ||
                other.surfaceColor == surfaceColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.gradientPreview, gradientPreview) ||
                other.gradientPreview == gradientPreview));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primaryColor,
    secondaryColor,
    backgroundColor,
    surfaceColor,
    textColor,
    gradientPreview,
  );

  /// Create a copy of DSThemePreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSThemePreviewImplCopyWith<_$DSThemePreviewImpl> get copyWith =>
      __$$DSThemePreviewImplCopyWithImpl<_$DSThemePreviewImpl>(
        this,
        _$identity,
      );
}

abstract class _DSThemePreview implements DSThemePreview {
  const factory _DSThemePreview({
    required final Color primaryColor,
    required final Color secondaryColor,
    required final Color backgroundColor,
    required final Color surfaceColor,
    required final Color textColor,
    final String? gradientPreview,
  }) = _$DSThemePreviewImpl;

  @override
  Color get primaryColor;
  @override
  Color get secondaryColor;
  @override
  Color get backgroundColor;
  @override
  Color get surfaceColor;
  @override
  Color get textColor;
  @override
  String? get gradientPreview;

  /// Create a copy of DSThemePreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSThemePreviewImplCopyWith<_$DSThemePreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSThemePreset {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ThemeCategory get category => throw _privateConstructorUsedError;
  List<String> get industries => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;
  ColorScheme get lightColorScheme => throw _privateConstructorUsedError;
  ColorScheme get darkColorScheme => throw _privateConstructorUsedError;
  DSThemeTokens get tokens => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  bool get isAccessible => throw _privateConstructorUsedError;
  DSThemePreview? get preview => throw _privateConstructorUsedError;
  String get designSystem => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSThemePresetCopyWith<DSThemePreset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSThemePresetCopyWith<$Res> {
  factory $DSThemePresetCopyWith(
    DSThemePreset value,
    $Res Function(DSThemePreset) then,
  ) = _$DSThemePresetCopyWithImpl<$Res, DSThemePreset>;
  @useResult
  $Res call({
    String id,
    String displayName,
    String description,
    ThemeCategory category,
    List<String> industries,
    List<String> keywords,
    ColorScheme lightColorScheme,
    ColorScheme darkColorScheme,
    DSThemeTokens tokens,
    bool isPremium,
    bool isAccessible,
    DSThemePreview? preview,
    String designSystem,
    String year,
  });

  $DSThemeTokensCopyWith<$Res> get tokens;
  $DSThemePreviewCopyWith<$Res>? get preview;
}

/// @nodoc
class _$DSThemePresetCopyWithImpl<$Res, $Val extends DSThemePreset>
    implements $DSThemePresetCopyWith<$Res> {
  _$DSThemePresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? description = null,
    Object? category = null,
    Object? industries = null,
    Object? keywords = null,
    Object? lightColorScheme = null,
    Object? darkColorScheme = null,
    Object? tokens = null,
    Object? isPremium = null,
    Object? isAccessible = null,
    Object? preview = freezed,
    Object? designSystem = null,
    Object? year = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ThemeCategory,
            industries: null == industries
                ? _value.industries
                : industries // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            keywords: null == keywords
                ? _value.keywords
                : keywords // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lightColorScheme: null == lightColorScheme
                ? _value.lightColorScheme
                : lightColorScheme // ignore: cast_nullable_to_non_nullable
                      as ColorScheme,
            darkColorScheme: null == darkColorScheme
                ? _value.darkColorScheme
                : darkColorScheme // ignore: cast_nullable_to_non_nullable
                      as ColorScheme,
            tokens: null == tokens
                ? _value.tokens
                : tokens // ignore: cast_nullable_to_non_nullable
                      as DSThemeTokens,
            isPremium: null == isPremium
                ? _value.isPremium
                : isPremium // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAccessible: null == isAccessible
                ? _value.isAccessible
                : isAccessible // ignore: cast_nullable_to_non_nullable
                      as bool,
            preview: freezed == preview
                ? _value.preview
                : preview // ignore: cast_nullable_to_non_nullable
                      as DSThemePreview?,
            designSystem: null == designSystem
                ? _value.designSystem
                : designSystem // ignore: cast_nullable_to_non_nullable
                      as String,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSThemeTokensCopyWith<$Res> get tokens {
    return $DSThemeTokensCopyWith<$Res>(_value.tokens, (value) {
      return _then(_value.copyWith(tokens: value) as $Val);
    });
  }

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSThemePreviewCopyWith<$Res>? get preview {
    if (_value.preview == null) {
      return null;
    }

    return $DSThemePreviewCopyWith<$Res>(_value.preview!, (value) {
      return _then(_value.copyWith(preview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSThemePresetImplCopyWith<$Res>
    implements $DSThemePresetCopyWith<$Res> {
  factory _$$DSThemePresetImplCopyWith(
    _$DSThemePresetImpl value,
    $Res Function(_$DSThemePresetImpl) then,
  ) = __$$DSThemePresetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String displayName,
    String description,
    ThemeCategory category,
    List<String> industries,
    List<String> keywords,
    ColorScheme lightColorScheme,
    ColorScheme darkColorScheme,
    DSThemeTokens tokens,
    bool isPremium,
    bool isAccessible,
    DSThemePreview? preview,
    String designSystem,
    String year,
  });

  @override
  $DSThemeTokensCopyWith<$Res> get tokens;
  @override
  $DSThemePreviewCopyWith<$Res>? get preview;
}

/// @nodoc
class __$$DSThemePresetImplCopyWithImpl<$Res>
    extends _$DSThemePresetCopyWithImpl<$Res, _$DSThemePresetImpl>
    implements _$$DSThemePresetImplCopyWith<$Res> {
  __$$DSThemePresetImplCopyWithImpl(
    _$DSThemePresetImpl _value,
    $Res Function(_$DSThemePresetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? description = null,
    Object? category = null,
    Object? industries = null,
    Object? keywords = null,
    Object? lightColorScheme = null,
    Object? darkColorScheme = null,
    Object? tokens = null,
    Object? isPremium = null,
    Object? isAccessible = null,
    Object? preview = freezed,
    Object? designSystem = null,
    Object? year = null,
  }) {
    return _then(
      _$DSThemePresetImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ThemeCategory,
        industries: null == industries
            ? _value._industries
            : industries // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        keywords: null == keywords
            ? _value._keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lightColorScheme: null == lightColorScheme
            ? _value.lightColorScheme
            : lightColorScheme // ignore: cast_nullable_to_non_nullable
                  as ColorScheme,
        darkColorScheme: null == darkColorScheme
            ? _value.darkColorScheme
            : darkColorScheme // ignore: cast_nullable_to_non_nullable
                  as ColorScheme,
        tokens: null == tokens
            ? _value.tokens
            : tokens // ignore: cast_nullable_to_non_nullable
                  as DSThemeTokens,
        isPremium: null == isPremium
            ? _value.isPremium
            : isPremium // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAccessible: null == isAccessible
            ? _value.isAccessible
            : isAccessible // ignore: cast_nullable_to_non_nullable
                  as bool,
        preview: freezed == preview
            ? _value.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as DSThemePreview?,
        designSystem: null == designSystem
            ? _value.designSystem
            : designSystem // ignore: cast_nullable_to_non_nullable
                  as String,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DSThemePresetImpl extends _DSThemePreset {
  const _$DSThemePresetImpl({
    required this.id,
    required this.displayName,
    required this.description,
    required this.category,
    required final List<String> industries,
    required final List<String> keywords,
    required this.lightColorScheme,
    required this.darkColorScheme,
    required this.tokens,
    this.isPremium = false,
    this.isAccessible = true,
    this.preview,
    this.designSystem = 'Material Design 3',
    this.year = '2025',
  }) : _industries = industries,
       _keywords = keywords,
       super._();

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String description;
  @override
  final ThemeCategory category;
  final List<String> _industries;
  @override
  List<String> get industries {
    if (_industries is EqualUnmodifiableListView) return _industries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_industries);
  }

  final List<String> _keywords;
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  final ColorScheme lightColorScheme;
  @override
  final ColorScheme darkColorScheme;
  @override
  final DSThemeTokens tokens;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  @JsonKey()
  final bool isAccessible;
  @override
  final DSThemePreview? preview;
  @override
  @JsonKey()
  final String designSystem;
  @override
  @JsonKey()
  final String year;

  @override
  String toString() {
    return 'DSThemePreset(id: $id, displayName: $displayName, description: $description, category: $category, industries: $industries, keywords: $keywords, lightColorScheme: $lightColorScheme, darkColorScheme: $darkColorScheme, tokens: $tokens, isPremium: $isPremium, isAccessible: $isAccessible, preview: $preview, designSystem: $designSystem, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSThemePresetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(
              other._industries,
              _industries,
            ) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.lightColorScheme, lightColorScheme) ||
                other.lightColorScheme == lightColorScheme) &&
            (identical(other.darkColorScheme, darkColorScheme) ||
                other.darkColorScheme == darkColorScheme) &&
            (identical(other.tokens, tokens) || other.tokens == tokens) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isAccessible, isAccessible) ||
                other.isAccessible == isAccessible) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.designSystem, designSystem) ||
                other.designSystem == designSystem) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    displayName,
    description,
    category,
    const DeepCollectionEquality().hash(_industries),
    const DeepCollectionEquality().hash(_keywords),
    lightColorScheme,
    darkColorScheme,
    tokens,
    isPremium,
    isAccessible,
    preview,
    designSystem,
    year,
  );

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSThemePresetImplCopyWith<_$DSThemePresetImpl> get copyWith =>
      __$$DSThemePresetImplCopyWithImpl<_$DSThemePresetImpl>(this, _$identity);
}

abstract class _DSThemePreset extends DSThemePreset {
  const factory _DSThemePreset({
    required final String id,
    required final String displayName,
    required final String description,
    required final ThemeCategory category,
    required final List<String> industries,
    required final List<String> keywords,
    required final ColorScheme lightColorScheme,
    required final ColorScheme darkColorScheme,
    required final DSThemeTokens tokens,
    final bool isPremium,
    final bool isAccessible,
    final DSThemePreview? preview,
    final String designSystem,
    final String year,
  }) = _$DSThemePresetImpl;
  const _DSThemePreset._() : super._();

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get description;
  @override
  ThemeCategory get category;
  @override
  List<String> get industries;
  @override
  List<String> get keywords;
  @override
  ColorScheme get lightColorScheme;
  @override
  ColorScheme get darkColorScheme;
  @override
  DSThemeTokens get tokens;
  @override
  bool get isPremium;
  @override
  bool get isAccessible;
  @override
  DSThemePreview? get preview;
  @override
  String get designSystem;
  @override
  String get year;

  /// Create a copy of DSThemePreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSThemePresetImplCopyWith<_$DSThemePresetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValidationResult {
  String get property => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  double get contrastRatio => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get suggestion => throw _privateConstructorUsedError;

  /// Create a copy of ValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationResultCopyWith<ValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationResultCopyWith<$Res> {
  factory $ValidationResultCopyWith(
    ValidationResult value,
    $Res Function(ValidationResult) then,
  ) = _$ValidationResultCopyWithImpl<$Res, ValidationResult>;
  @useResult
  $Res call({
    String property,
    bool isValid,
    double contrastRatio,
    String message,
    String? suggestion,
  });
}

/// @nodoc
class _$ValidationResultCopyWithImpl<$Res, $Val extends ValidationResult>
    implements $ValidationResultCopyWith<$Res> {
  _$ValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
    Object? isValid = null,
    Object? contrastRatio = null,
    Object? message = null,
    Object? suggestion = freezed,
  }) {
    return _then(
      _value.copyWith(
            property: null == property
                ? _value.property
                : property // ignore: cast_nullable_to_non_nullable
                      as String,
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            contrastRatio: null == contrastRatio
                ? _value.contrastRatio
                : contrastRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            suggestion: freezed == suggestion
                ? _value.suggestion
                : suggestion // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ValidationResultImplCopyWith<$Res>
    implements $ValidationResultCopyWith<$Res> {
  factory _$$ValidationResultImplCopyWith(
    _$ValidationResultImpl value,
    $Res Function(_$ValidationResultImpl) then,
  ) = __$$ValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String property,
    bool isValid,
    double contrastRatio,
    String message,
    String? suggestion,
  });
}

/// @nodoc
class __$$ValidationResultImplCopyWithImpl<$Res>
    extends _$ValidationResultCopyWithImpl<$Res, _$ValidationResultImpl>
    implements _$$ValidationResultImplCopyWith<$Res> {
  __$$ValidationResultImplCopyWithImpl(
    _$ValidationResultImpl _value,
    $Res Function(_$ValidationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
    Object? isValid = null,
    Object? contrastRatio = null,
    Object? message = null,
    Object? suggestion = freezed,
  }) {
    return _then(
      _$ValidationResultImpl(
        property: null == property
            ? _value.property
            : property // ignore: cast_nullable_to_non_nullable
                  as String,
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        contrastRatio: null == contrastRatio
            ? _value.contrastRatio
            : contrastRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        suggestion: freezed == suggestion
            ? _value.suggestion
            : suggestion // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationResultImpl implements _ValidationResult {
  const _$ValidationResultImpl({
    required this.property,
    required this.isValid,
    required this.contrastRatio,
    required this.message,
    this.suggestion,
  });

  @override
  final String property;
  @override
  final bool isValid;
  @override
  final double contrastRatio;
  @override
  final String message;
  @override
  final String? suggestion;

  @override
  String toString() {
    return 'ValidationResult(property: $property, isValid: $isValid, contrastRatio: $contrastRatio, message: $message, suggestion: $suggestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationResultImpl &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.contrastRatio, contrastRatio) ||
                other.contrastRatio == contrastRatio) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    property,
    isValid,
    contrastRatio,
    message,
    suggestion,
  );

  /// Create a copy of ValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationResultImplCopyWith<_$ValidationResultImpl> get copyWith =>
      __$$ValidationResultImplCopyWithImpl<_$ValidationResultImpl>(
        this,
        _$identity,
      );
}

abstract class _ValidationResult implements ValidationResult {
  const factory _ValidationResult({
    required final String property,
    required final bool isValid,
    required final double contrastRatio,
    required final String message,
    final String? suggestion,
  }) = _$ValidationResultImpl;

  @override
  String get property;
  @override
  bool get isValid;
  @override
  double get contrastRatio;
  @override
  String get message;
  @override
  String? get suggestion;

  /// Create a copy of ValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationResultImplCopyWith<_$ValidationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CorporatePaletteConfig {
  ContrastLevel get contrastLevel => throw _privateConstructorUsedError;
  bool get generateVariants => throw _privateConstructorUsedError;
  bool get optimizeForDarkMode => throw _privateConstructorUsedError;
  bool get allowBoldColors => throw _privateConstructorUsedError;

  /// Create a copy of CorporatePaletteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CorporatePaletteConfigCopyWith<CorporatePaletteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorporatePaletteConfigCopyWith<$Res> {
  factory $CorporatePaletteConfigCopyWith(
    CorporatePaletteConfig value,
    $Res Function(CorporatePaletteConfig) then,
  ) = _$CorporatePaletteConfigCopyWithImpl<$Res, CorporatePaletteConfig>;
  @useResult
  $Res call({
    ContrastLevel contrastLevel,
    bool generateVariants,
    bool optimizeForDarkMode,
    bool allowBoldColors,
  });
}

/// @nodoc
class _$CorporatePaletteConfigCopyWithImpl<
  $Res,
  $Val extends CorporatePaletteConfig
>
    implements $CorporatePaletteConfigCopyWith<$Res> {
  _$CorporatePaletteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CorporatePaletteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contrastLevel = null,
    Object? generateVariants = null,
    Object? optimizeForDarkMode = null,
    Object? allowBoldColors = null,
  }) {
    return _then(
      _value.copyWith(
            contrastLevel: null == contrastLevel
                ? _value.contrastLevel
                : contrastLevel // ignore: cast_nullable_to_non_nullable
                      as ContrastLevel,
            generateVariants: null == generateVariants
                ? _value.generateVariants
                : generateVariants // ignore: cast_nullable_to_non_nullable
                      as bool,
            optimizeForDarkMode: null == optimizeForDarkMode
                ? _value.optimizeForDarkMode
                : optimizeForDarkMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowBoldColors: null == allowBoldColors
                ? _value.allowBoldColors
                : allowBoldColors // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CorporatePaletteConfigImplCopyWith<$Res>
    implements $CorporatePaletteConfigCopyWith<$Res> {
  factory _$$CorporatePaletteConfigImplCopyWith(
    _$CorporatePaletteConfigImpl value,
    $Res Function(_$CorporatePaletteConfigImpl) then,
  ) = __$$CorporatePaletteConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ContrastLevel contrastLevel,
    bool generateVariants,
    bool optimizeForDarkMode,
    bool allowBoldColors,
  });
}

/// @nodoc
class __$$CorporatePaletteConfigImplCopyWithImpl<$Res>
    extends
        _$CorporatePaletteConfigCopyWithImpl<$Res, _$CorporatePaletteConfigImpl>
    implements _$$CorporatePaletteConfigImplCopyWith<$Res> {
  __$$CorporatePaletteConfigImplCopyWithImpl(
    _$CorporatePaletteConfigImpl _value,
    $Res Function(_$CorporatePaletteConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CorporatePaletteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contrastLevel = null,
    Object? generateVariants = null,
    Object? optimizeForDarkMode = null,
    Object? allowBoldColors = null,
  }) {
    return _then(
      _$CorporatePaletteConfigImpl(
        contrastLevel: null == contrastLevel
            ? _value.contrastLevel
            : contrastLevel // ignore: cast_nullable_to_non_nullable
                  as ContrastLevel,
        generateVariants: null == generateVariants
            ? _value.generateVariants
            : generateVariants // ignore: cast_nullable_to_non_nullable
                  as bool,
        optimizeForDarkMode: null == optimizeForDarkMode
            ? _value.optimizeForDarkMode
            : optimizeForDarkMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowBoldColors: null == allowBoldColors
            ? _value.allowBoldColors
            : allowBoldColors // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CorporatePaletteConfigImpl implements _CorporatePaletteConfig {
  const _$CorporatePaletteConfigImpl({
    this.contrastLevel = ContrastLevel.aa,
    this.generateVariants = true,
    this.optimizeForDarkMode = true,
    this.allowBoldColors = false,
  });

  @override
  @JsonKey()
  final ContrastLevel contrastLevel;
  @override
  @JsonKey()
  final bool generateVariants;
  @override
  @JsonKey()
  final bool optimizeForDarkMode;
  @override
  @JsonKey()
  final bool allowBoldColors;

  @override
  String toString() {
    return 'CorporatePaletteConfig(contrastLevel: $contrastLevel, generateVariants: $generateVariants, optimizeForDarkMode: $optimizeForDarkMode, allowBoldColors: $allowBoldColors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorporatePaletteConfigImpl &&
            (identical(other.contrastLevel, contrastLevel) ||
                other.contrastLevel == contrastLevel) &&
            (identical(other.generateVariants, generateVariants) ||
                other.generateVariants == generateVariants) &&
            (identical(other.optimizeForDarkMode, optimizeForDarkMode) ||
                other.optimizeForDarkMode == optimizeForDarkMode) &&
            (identical(other.allowBoldColors, allowBoldColors) ||
                other.allowBoldColors == allowBoldColors));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    contrastLevel,
    generateVariants,
    optimizeForDarkMode,
    allowBoldColors,
  );

  /// Create a copy of CorporatePaletteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CorporatePaletteConfigImplCopyWith<_$CorporatePaletteConfigImpl>
  get copyWith =>
      __$$CorporatePaletteConfigImplCopyWithImpl<_$CorporatePaletteConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _CorporatePaletteConfig implements CorporatePaletteConfig {
  const factory _CorporatePaletteConfig({
    final ContrastLevel contrastLevel,
    final bool generateVariants,
    final bool optimizeForDarkMode,
    final bool allowBoldColors,
  }) = _$CorporatePaletteConfigImpl;

  @override
  ContrastLevel get contrastLevel;
  @override
  bool get generateVariants;
  @override
  bool get optimizeForDarkMode;
  @override
  bool get allowBoldColors;

  /// Create a copy of CorporatePaletteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorporatePaletteConfigImplCopyWith<_$CorporatePaletteConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
