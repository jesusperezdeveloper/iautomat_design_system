// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corporate_palette.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CorporatePaletteConfig _$CorporatePaletteConfigFromJson(
  Map<String, dynamic> json,
) {
  return _CorporatePaletteConfig.fromJson(json);
}

/// @nodoc
mixin _$CorporatePaletteConfig {
  /// Nombre de la marca/empresa
  String? get brandName => throw _privateConstructorUsedError;

  /// Generar automáticamente tema dark mode
  bool get generateDarkMode => throw _privateConstructorUsedError;

  /// Nivel de contraste WCAG requerido
  ContrastLevel get contrastLevel => throw _privateConstructorUsedError;

  /// Generar variantes automáticamente (50, 100, 200...900)
  bool get autoGenerateVariants => throw _privateConstructorUsedError;

  /// Validar contraste WCAG automáticamente
  bool get validateContrast => throw _privateConstructorUsedError;

  /// Usar algoritmo inteligente para dark mode
  bool get smartDarkMode => throw _privateConstructorUsedError;

  /// Factor de ajuste para generación de variantes (0.1 - 1.0)
  double get variantFactor => throw _privateConstructorUsedError;

  /// Preservar saturación en variantes
  bool get preserveSaturation => throw _privateConstructorUsedError;

  /// Serializes this CorporatePaletteConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
    String? brandName,
    bool generateDarkMode,
    ContrastLevel contrastLevel,
    bool autoGenerateVariants,
    bool validateContrast,
    bool smartDarkMode,
    double variantFactor,
    bool preserveSaturation,
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
    Object? brandName = freezed,
    Object? generateDarkMode = null,
    Object? contrastLevel = null,
    Object? autoGenerateVariants = null,
    Object? validateContrast = null,
    Object? smartDarkMode = null,
    Object? variantFactor = null,
    Object? preserveSaturation = null,
  }) {
    return _then(
      _value.copyWith(
            brandName: freezed == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                      as String?,
            generateDarkMode: null == generateDarkMode
                ? _value.generateDarkMode
                : generateDarkMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            contrastLevel: null == contrastLevel
                ? _value.contrastLevel
                : contrastLevel // ignore: cast_nullable_to_non_nullable
                      as ContrastLevel,
            autoGenerateVariants: null == autoGenerateVariants
                ? _value.autoGenerateVariants
                : autoGenerateVariants // ignore: cast_nullable_to_non_nullable
                      as bool,
            validateContrast: null == validateContrast
                ? _value.validateContrast
                : validateContrast // ignore: cast_nullable_to_non_nullable
                      as bool,
            smartDarkMode: null == smartDarkMode
                ? _value.smartDarkMode
                : smartDarkMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            variantFactor: null == variantFactor
                ? _value.variantFactor
                : variantFactor // ignore: cast_nullable_to_non_nullable
                      as double,
            preserveSaturation: null == preserveSaturation
                ? _value.preserveSaturation
                : preserveSaturation // ignore: cast_nullable_to_non_nullable
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
    String? brandName,
    bool generateDarkMode,
    ContrastLevel contrastLevel,
    bool autoGenerateVariants,
    bool validateContrast,
    bool smartDarkMode,
    double variantFactor,
    bool preserveSaturation,
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
    Object? brandName = freezed,
    Object? generateDarkMode = null,
    Object? contrastLevel = null,
    Object? autoGenerateVariants = null,
    Object? validateContrast = null,
    Object? smartDarkMode = null,
    Object? variantFactor = null,
    Object? preserveSaturation = null,
  }) {
    return _then(
      _$CorporatePaletteConfigImpl(
        brandName: freezed == brandName
            ? _value.brandName
            : brandName // ignore: cast_nullable_to_non_nullable
                  as String?,
        generateDarkMode: null == generateDarkMode
            ? _value.generateDarkMode
            : generateDarkMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        contrastLevel: null == contrastLevel
            ? _value.contrastLevel
            : contrastLevel // ignore: cast_nullable_to_non_nullable
                  as ContrastLevel,
        autoGenerateVariants: null == autoGenerateVariants
            ? _value.autoGenerateVariants
            : autoGenerateVariants // ignore: cast_nullable_to_non_nullable
                  as bool,
        validateContrast: null == validateContrast
            ? _value.validateContrast
            : validateContrast // ignore: cast_nullable_to_non_nullable
                  as bool,
        smartDarkMode: null == smartDarkMode
            ? _value.smartDarkMode
            : smartDarkMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        variantFactor: null == variantFactor
            ? _value.variantFactor
            : variantFactor // ignore: cast_nullable_to_non_nullable
                  as double,
        preserveSaturation: null == preserveSaturation
            ? _value.preserveSaturation
            : preserveSaturation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CorporatePaletteConfigImpl implements _CorporatePaletteConfig {
  const _$CorporatePaletteConfigImpl({
    this.brandName,
    this.generateDarkMode = true,
    this.contrastLevel = ContrastLevel.aa,
    this.autoGenerateVariants = true,
    this.validateContrast = true,
    this.smartDarkMode = true,
    this.variantFactor = 0.15,
    this.preserveSaturation = true,
  });

  factory _$CorporatePaletteConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$CorporatePaletteConfigImplFromJson(json);

  /// Nombre de la marca/empresa
  @override
  final String? brandName;

  /// Generar automáticamente tema dark mode
  @override
  @JsonKey()
  final bool generateDarkMode;

  /// Nivel de contraste WCAG requerido
  @override
  @JsonKey()
  final ContrastLevel contrastLevel;

  /// Generar variantes automáticamente (50, 100, 200...900)
  @override
  @JsonKey()
  final bool autoGenerateVariants;

  /// Validar contraste WCAG automáticamente
  @override
  @JsonKey()
  final bool validateContrast;

  /// Usar algoritmo inteligente para dark mode
  @override
  @JsonKey()
  final bool smartDarkMode;

  /// Factor de ajuste para generación de variantes (0.1 - 1.0)
  @override
  @JsonKey()
  final double variantFactor;

  /// Preservar saturación en variantes
  @override
  @JsonKey()
  final bool preserveSaturation;

  @override
  String toString() {
    return 'CorporatePaletteConfig(brandName: $brandName, generateDarkMode: $generateDarkMode, contrastLevel: $contrastLevel, autoGenerateVariants: $autoGenerateVariants, validateContrast: $validateContrast, smartDarkMode: $smartDarkMode, variantFactor: $variantFactor, preserveSaturation: $preserveSaturation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorporatePaletteConfigImpl &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.generateDarkMode, generateDarkMode) ||
                other.generateDarkMode == generateDarkMode) &&
            (identical(other.contrastLevel, contrastLevel) ||
                other.contrastLevel == contrastLevel) &&
            (identical(other.autoGenerateVariants, autoGenerateVariants) ||
                other.autoGenerateVariants == autoGenerateVariants) &&
            (identical(other.validateContrast, validateContrast) ||
                other.validateContrast == validateContrast) &&
            (identical(other.smartDarkMode, smartDarkMode) ||
                other.smartDarkMode == smartDarkMode) &&
            (identical(other.variantFactor, variantFactor) ||
                other.variantFactor == variantFactor) &&
            (identical(other.preserveSaturation, preserveSaturation) ||
                other.preserveSaturation == preserveSaturation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    brandName,
    generateDarkMode,
    contrastLevel,
    autoGenerateVariants,
    validateContrast,
    smartDarkMode,
    variantFactor,
    preserveSaturation,
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

  @override
  Map<String, dynamic> toJson() {
    return _$$CorporatePaletteConfigImplToJson(this);
  }
}

abstract class _CorporatePaletteConfig implements CorporatePaletteConfig {
  const factory _CorporatePaletteConfig({
    final String? brandName,
    final bool generateDarkMode,
    final ContrastLevel contrastLevel,
    final bool autoGenerateVariants,
    final bool validateContrast,
    final bool smartDarkMode,
    final double variantFactor,
    final bool preserveSaturation,
  }) = _$CorporatePaletteConfigImpl;

  factory _CorporatePaletteConfig.fromJson(Map<String, dynamic> json) =
      _$CorporatePaletteConfigImpl.fromJson;

  /// Nombre de la marca/empresa
  @override
  String? get brandName;

  /// Generar automáticamente tema dark mode
  @override
  bool get generateDarkMode;

  /// Nivel de contraste WCAG requerido
  @override
  ContrastLevel get contrastLevel;

  /// Generar variantes automáticamente (50, 100, 200...900)
  @override
  bool get autoGenerateVariants;

  /// Validar contraste WCAG automáticamente
  @override
  bool get validateContrast;

  /// Usar algoritmo inteligente para dark mode
  @override
  bool get smartDarkMode;

  /// Factor de ajuste para generación de variantes (0.1 - 1.0)
  @override
  double get variantFactor;

  /// Preservar saturación en variantes
  @override
  bool get preserveSaturation;

  /// Create a copy of CorporatePaletteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorporatePaletteConfigImplCopyWith<_$CorporatePaletteConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CorporatePalette _$CorporatePaletteFromJson(Map<String, dynamic> json) {
  return _CorporatePalette.fromJson(json);
}

/// @nodoc
mixin _$CorporatePalette {
  /// Color primario de la marca (requerido)
  Color get primary => throw _privateConstructorUsedError;

  /// Color secundario de la marca (requerido)
  Color get secondary => throw _privateConstructorUsedError;

  /// Color de acento (opcional)
  Color? get accent => throw _privateConstructorUsedError;

  /// Color neutro base (opcional)
  Color? get neutral => throw _privateConstructorUsedError;

  /// Color de éxito (opcional)
  Color? get success => throw _privateConstructorUsedError;

  /// Color de advertencia (opcional)
  Color? get warning => throw _privateConstructorUsedError;

  /// Color de error (opcional)
  Color? get error => throw _privateConstructorUsedError;

  /// Color de información (opcional)
  Color? get info => throw _privateConstructorUsedError;

  /// Configuración de la paleta
  CorporatePaletteConfig get config => throw _privateConstructorUsedError;

  /// Variantes generadas automáticamente
  Map<String, Map<int, Color>>? get generatedVariants =>
      throw _privateConstructorUsedError;

  /// Resultados de validación WCAG
  Map<String, bool>? get contrastValidation =>
      throw _privateConstructorUsedError;

  /// Serializes this CorporatePalette to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CorporatePalette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CorporatePaletteCopyWith<CorporatePalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorporatePaletteCopyWith<$Res> {
  factory $CorporatePaletteCopyWith(
    CorporatePalette value,
    $Res Function(CorporatePalette) then,
  ) = _$CorporatePaletteCopyWithImpl<$Res, CorporatePalette>;
  @useResult
  $Res call({
    Color primary,
    Color secondary,
    Color? accent,
    Color? neutral,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    CorporatePaletteConfig config,
    Map<String, Map<int, Color>>? generatedVariants,
    Map<String, bool>? contrastValidation,
  });

  $CorporatePaletteConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$CorporatePaletteCopyWithImpl<$Res, $Val extends CorporatePalette>
    implements $CorporatePaletteCopyWith<$Res> {
  _$CorporatePaletteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CorporatePalette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? secondary = null,
    Object? accent = freezed,
    Object? neutral = freezed,
    Object? success = freezed,
    Object? warning = freezed,
    Object? error = freezed,
    Object? info = freezed,
    Object? config = null,
    Object? generatedVariants = freezed,
    Object? contrastValidation = freezed,
  }) {
    return _then(
      _value.copyWith(
            primary: null == primary
                ? _value.primary
                : primary // ignore: cast_nullable_to_non_nullable
                      as Color,
            secondary: null == secondary
                ? _value.secondary
                : secondary // ignore: cast_nullable_to_non_nullable
                      as Color,
            accent: freezed == accent
                ? _value.accent
                : accent // ignore: cast_nullable_to_non_nullable
                      as Color?,
            neutral: freezed == neutral
                ? _value.neutral
                : neutral // ignore: cast_nullable_to_non_nullable
                      as Color?,
            success: freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as Color?,
            warning: freezed == warning
                ? _value.warning
                : warning // ignore: cast_nullable_to_non_nullable
                      as Color?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Color?,
            info: freezed == info
                ? _value.info
                : info // ignore: cast_nullable_to_non_nullable
                      as Color?,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as CorporatePaletteConfig,
            generatedVariants: freezed == generatedVariants
                ? _value.generatedVariants
                : generatedVariants // ignore: cast_nullable_to_non_nullable
                      as Map<String, Map<int, Color>>?,
            contrastValidation: freezed == contrastValidation
                ? _value.contrastValidation
                : contrastValidation // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>?,
          )
          as $Val,
    );
  }

  /// Create a copy of CorporatePalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CorporatePaletteConfigCopyWith<$Res> get config {
    return $CorporatePaletteConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CorporatePaletteImplCopyWith<$Res>
    implements $CorporatePaletteCopyWith<$Res> {
  factory _$$CorporatePaletteImplCopyWith(
    _$CorporatePaletteImpl value,
    $Res Function(_$CorporatePaletteImpl) then,
  ) = __$$CorporatePaletteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color primary,
    Color secondary,
    Color? accent,
    Color? neutral,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    CorporatePaletteConfig config,
    Map<String, Map<int, Color>>? generatedVariants,
    Map<String, bool>? contrastValidation,
  });

  @override
  $CorporatePaletteConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$CorporatePaletteImplCopyWithImpl<$Res>
    extends _$CorporatePaletteCopyWithImpl<$Res, _$CorporatePaletteImpl>
    implements _$$CorporatePaletteImplCopyWith<$Res> {
  __$$CorporatePaletteImplCopyWithImpl(
    _$CorporatePaletteImpl _value,
    $Res Function(_$CorporatePaletteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CorporatePalette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? secondary = null,
    Object? accent = freezed,
    Object? neutral = freezed,
    Object? success = freezed,
    Object? warning = freezed,
    Object? error = freezed,
    Object? info = freezed,
    Object? config = null,
    Object? generatedVariants = freezed,
    Object? contrastValidation = freezed,
  }) {
    return _then(
      _$CorporatePaletteImpl(
        primary: null == primary
            ? _value.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as Color,
        secondary: null == secondary
            ? _value.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as Color,
        accent: freezed == accent
            ? _value.accent
            : accent // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutral: freezed == neutral
            ? _value.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as Color?,
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as Color?,
        warning: freezed == warning
            ? _value.warning
            : warning // ignore: cast_nullable_to_non_nullable
                  as Color?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Color?,
        info: freezed == info
            ? _value.info
            : info // ignore: cast_nullable_to_non_nullable
                  as Color?,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as CorporatePaletteConfig,
        generatedVariants: freezed == generatedVariants
            ? _value._generatedVariants
            : generatedVariants // ignore: cast_nullable_to_non_nullable
                  as Map<String, Map<int, Color>>?,
        contrastValidation: freezed == contrastValidation
            ? _value._contrastValidation
            : contrastValidation // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CorporatePaletteImpl extends _CorporatePalette {
  const _$CorporatePaletteImpl({
    required this.primary,
    required this.secondary,
    this.accent,
    this.neutral,
    this.success,
    this.warning,
    this.error,
    this.info,
    this.config = const CorporatePaletteConfig(),
    final Map<String, Map<int, Color>>? generatedVariants,
    final Map<String, bool>? contrastValidation,
  }) : _generatedVariants = generatedVariants,
       _contrastValidation = contrastValidation,
       super._();

  factory _$CorporatePaletteImpl.fromJson(Map<String, dynamic> json) =>
      _$$CorporatePaletteImplFromJson(json);

  /// Color primario de la marca (requerido)
  @override
  final Color primary;

  /// Color secundario de la marca (requerido)
  @override
  final Color secondary;

  /// Color de acento (opcional)
  @override
  final Color? accent;

  /// Color neutro base (opcional)
  @override
  final Color? neutral;

  /// Color de éxito (opcional)
  @override
  final Color? success;

  /// Color de advertencia (opcional)
  @override
  final Color? warning;

  /// Color de error (opcional)
  @override
  final Color? error;

  /// Color de información (opcional)
  @override
  final Color? info;

  /// Configuración de la paleta
  @override
  @JsonKey()
  final CorporatePaletteConfig config;

  /// Variantes generadas automáticamente
  final Map<String, Map<int, Color>>? _generatedVariants;

  /// Variantes generadas automáticamente
  @override
  Map<String, Map<int, Color>>? get generatedVariants {
    final value = _generatedVariants;
    if (value == null) return null;
    if (_generatedVariants is EqualUnmodifiableMapView)
      return _generatedVariants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Resultados de validación WCAG
  final Map<String, bool>? _contrastValidation;

  /// Resultados de validación WCAG
  @override
  Map<String, bool>? get contrastValidation {
    final value = _contrastValidation;
    if (value == null) return null;
    if (_contrastValidation is EqualUnmodifiableMapView)
      return _contrastValidation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CorporatePalette(primary: $primary, secondary: $secondary, accent: $accent, neutral: $neutral, success: $success, warning: $warning, error: $error, info: $info, config: $config, generatedVariants: $generatedVariants, contrastValidation: $contrastValidation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorporatePaletteImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.accent, accent) || other.accent == accent) &&
            (identical(other.neutral, neutral) || other.neutral == neutral) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.warning, warning) || other.warning == warning) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(
              other._generatedVariants,
              _generatedVariants,
            ) &&
            const DeepCollectionEquality().equals(
              other._contrastValidation,
              _contrastValidation,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    secondary,
    accent,
    neutral,
    success,
    warning,
    error,
    info,
    config,
    const DeepCollectionEquality().hash(_generatedVariants),
    const DeepCollectionEquality().hash(_contrastValidation),
  );

  /// Create a copy of CorporatePalette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CorporatePaletteImplCopyWith<_$CorporatePaletteImpl> get copyWith =>
      __$$CorporatePaletteImplCopyWithImpl<_$CorporatePaletteImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CorporatePaletteImplToJson(this);
  }
}

abstract class _CorporatePalette extends CorporatePalette {
  const factory _CorporatePalette({
    required final Color primary,
    required final Color secondary,
    final Color? accent,
    final Color? neutral,
    final Color? success,
    final Color? warning,
    final Color? error,
    final Color? info,
    final CorporatePaletteConfig config,
    final Map<String, Map<int, Color>>? generatedVariants,
    final Map<String, bool>? contrastValidation,
  }) = _$CorporatePaletteImpl;
  const _CorporatePalette._() : super._();

  factory _CorporatePalette.fromJson(Map<String, dynamic> json) =
      _$CorporatePaletteImpl.fromJson;

  /// Color primario de la marca (requerido)
  @override
  Color get primary;

  /// Color secundario de la marca (requerido)
  @override
  Color get secondary;

  /// Color de acento (opcional)
  @override
  Color? get accent;

  /// Color neutro base (opcional)
  @override
  Color? get neutral;

  /// Color de éxito (opcional)
  @override
  Color? get success;

  /// Color de advertencia (opcional)
  @override
  Color? get warning;

  /// Color de error (opcional)
  @override
  Color? get error;

  /// Color de información (opcional)
  @override
  Color? get info;

  /// Configuración de la paleta
  @override
  CorporatePaletteConfig get config;

  /// Variantes generadas automáticamente
  @override
  Map<String, Map<int, Color>>? get generatedVariants;

  /// Resultados de validación WCAG
  @override
  Map<String, bool>? get contrastValidation;

  /// Create a copy of CorporatePalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorporatePaletteImplCopyWith<_$CorporatePaletteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CorporateThemeResult _$CorporateThemeResultFromJson(Map<String, dynamic> json) {
  return _CorporateThemeResult.fromJson(json);
}

/// @nodoc
mixin _$CorporateThemeResult {
  /// Tema light generado
  ThemeData get lightTheme => throw _privateConstructorUsedError;

  /// Tema dark generado
  ThemeData get darkTheme => throw _privateConstructorUsedError;

  /// Paleta procesada con variantes
  CorporatePalette get palette => throw _privateConstructorUsedError;

  /// Advertencias de accesibilidad
  List<String> get warnings => throw _privateConstructorUsedError;

  /// Tiempo de generación en ms
  int? get generationTime => throw _privateConstructorUsedError;

  /// Metadata adicional
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CorporateThemeResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CorporateThemeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CorporateThemeResultCopyWith<CorporateThemeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorporateThemeResultCopyWith<$Res> {
  factory $CorporateThemeResultCopyWith(
    CorporateThemeResult value,
    $Res Function(CorporateThemeResult) then,
  ) = _$CorporateThemeResultCopyWithImpl<$Res, CorporateThemeResult>;
  @useResult
  $Res call({
    ThemeData lightTheme,
    ThemeData darkTheme,
    CorporatePalette palette,
    List<String> warnings,
    int? generationTime,
    Map<String, dynamic>? metadata,
  });

  $CorporatePaletteCopyWith<$Res> get palette;
}

/// @nodoc
class _$CorporateThemeResultCopyWithImpl<
  $Res,
  $Val extends CorporateThemeResult
>
    implements $CorporateThemeResultCopyWith<$Res> {
  _$CorporateThemeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CorporateThemeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightTheme = null,
    Object? darkTheme = null,
    Object? palette = null,
    Object? warnings = null,
    Object? generationTime = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            lightTheme: null == lightTheme
                ? _value.lightTheme
                : lightTheme // ignore: cast_nullable_to_non_nullable
                      as ThemeData,
            darkTheme: null == darkTheme
                ? _value.darkTheme
                : darkTheme // ignore: cast_nullable_to_non_nullable
                      as ThemeData,
            palette: null == palette
                ? _value.palette
                : palette // ignore: cast_nullable_to_non_nullable
                      as CorporatePalette,
            warnings: null == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            generationTime: freezed == generationTime
                ? _value.generationTime
                : generationTime // ignore: cast_nullable_to_non_nullable
                      as int?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of CorporateThemeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CorporatePaletteCopyWith<$Res> get palette {
    return $CorporatePaletteCopyWith<$Res>(_value.palette, (value) {
      return _then(_value.copyWith(palette: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CorporateThemeResultImplCopyWith<$Res>
    implements $CorporateThemeResultCopyWith<$Res> {
  factory _$$CorporateThemeResultImplCopyWith(
    _$CorporateThemeResultImpl value,
    $Res Function(_$CorporateThemeResultImpl) then,
  ) = __$$CorporateThemeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ThemeData lightTheme,
    ThemeData darkTheme,
    CorporatePalette palette,
    List<String> warnings,
    int? generationTime,
    Map<String, dynamic>? metadata,
  });

  @override
  $CorporatePaletteCopyWith<$Res> get palette;
}

/// @nodoc
class __$$CorporateThemeResultImplCopyWithImpl<$Res>
    extends _$CorporateThemeResultCopyWithImpl<$Res, _$CorporateThemeResultImpl>
    implements _$$CorporateThemeResultImplCopyWith<$Res> {
  __$$CorporateThemeResultImplCopyWithImpl(
    _$CorporateThemeResultImpl _value,
    $Res Function(_$CorporateThemeResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CorporateThemeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightTheme = null,
    Object? darkTheme = null,
    Object? palette = null,
    Object? warnings = null,
    Object? generationTime = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$CorporateThemeResultImpl(
        lightTheme: null == lightTheme
            ? _value.lightTheme
            : lightTheme // ignore: cast_nullable_to_non_nullable
                  as ThemeData,
        darkTheme: null == darkTheme
            ? _value.darkTheme
            : darkTheme // ignore: cast_nullable_to_non_nullable
                  as ThemeData,
        palette: null == palette
            ? _value.palette
            : palette // ignore: cast_nullable_to_non_nullable
                  as CorporatePalette,
        warnings: null == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        generationTime: freezed == generationTime
            ? _value.generationTime
            : generationTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CorporateThemeResultImpl implements _CorporateThemeResult {
  const _$CorporateThemeResultImpl({
    required this.lightTheme,
    required this.darkTheme,
    required this.palette,
    final List<String> warnings = const [],
    this.generationTime,
    final Map<String, dynamic>? metadata,
  }) : _warnings = warnings,
       _metadata = metadata;

  factory _$CorporateThemeResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CorporateThemeResultImplFromJson(json);

  /// Tema light generado
  @override
  final ThemeData lightTheme;

  /// Tema dark generado
  @override
  final ThemeData darkTheme;

  /// Paleta procesada con variantes
  @override
  final CorporatePalette palette;

  /// Advertencias de accesibilidad
  final List<String> _warnings;

  /// Advertencias de accesibilidad
  @override
  @JsonKey()
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  /// Tiempo de generación en ms
  @override
  final int? generationTime;

  /// Metadata adicional
  final Map<String, dynamic>? _metadata;

  /// Metadata adicional
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
    return 'CorporateThemeResult(lightTheme: $lightTheme, darkTheme: $darkTheme, palette: $palette, warnings: $warnings, generationTime: $generationTime, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorporateThemeResultImpl &&
            (identical(other.lightTheme, lightTheme) ||
                other.lightTheme == lightTheme) &&
            (identical(other.darkTheme, darkTheme) ||
                other.darkTheme == darkTheme) &&
            (identical(other.palette, palette) || other.palette == palette) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            (identical(other.generationTime, generationTime) ||
                other.generationTime == generationTime) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lightTheme,
    darkTheme,
    palette,
    const DeepCollectionEquality().hash(_warnings),
    generationTime,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of CorporateThemeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CorporateThemeResultImplCopyWith<_$CorporateThemeResultImpl>
  get copyWith =>
      __$$CorporateThemeResultImplCopyWithImpl<_$CorporateThemeResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CorporateThemeResultImplToJson(this);
  }
}

abstract class _CorporateThemeResult implements CorporateThemeResult {
  const factory _CorporateThemeResult({
    required final ThemeData lightTheme,
    required final ThemeData darkTheme,
    required final CorporatePalette palette,
    final List<String> warnings,
    final int? generationTime,
    final Map<String, dynamic>? metadata,
  }) = _$CorporateThemeResultImpl;

  factory _CorporateThemeResult.fromJson(Map<String, dynamic> json) =
      _$CorporateThemeResultImpl.fromJson;

  /// Tema light generado
  @override
  ThemeData get lightTheme;

  /// Tema dark generado
  @override
  ThemeData get darkTheme;

  /// Paleta procesada con variantes
  @override
  CorporatePalette get palette;

  /// Advertencias de accesibilidad
  @override
  List<String> get warnings;

  /// Tiempo de generación en ms
  @override
  int? get generationTime;

  /// Metadata adicional
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CorporateThemeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorporateThemeResultImplCopyWith<_$CorporateThemeResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}
