// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_clipboard_share_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSClipboardShareConfig {
  /// Variante del componente
  DSClipboardShareVariant get variant => throw _privateConstructorUsedError;

  /// Estado actual del componente
  DSClipboardShareState get state => throw _privateConstructorUsedError;

  /// Configuración de colores (solo design tokens)
  DSClipboardShareColors? get colors => throw _privateConstructorUsedError;

  /// Configuración de espaciado (solo design tokens)
  DSClipboardShareSpacing? get spacing => throw _privateConstructorUsedError;

  /// Configuración de tipografía (solo design tokens)
  DSClipboardShareTypography? get typography =>
      throw _privateConstructorUsedError;

  /// Configuración de animaciones
  DSClipboardShareAnimations? get animations =>
      throw _privateConstructorUsedError;

  /// Configuración de comportamiento
  DSClipboardShareBehavior? get behavior => throw _privateConstructorUsedError;

  /// Configuración de accesibilidad
  DSClipboardShareAccessibility? get accessibility =>
      throw _privateConstructorUsedError;

  /// Si muestra preview del contenido antes de compartir
  bool get showPreview => throw _privateConstructorUsedError;

  /// Si permite editar el contenido antes de compartir
  bool get allowEdit => throw _privateConstructorUsedError;

  /// Si muestra confirmación después de copiar/compartir
  bool get showConfirmation => throw _privateConstructorUsedError;

  /// Si agrupa las opciones de compartir por tipo
  bool get groupShareOptions => throw _privateConstructorUsedError;

  /// Si muestra apps recientes para compartir
  bool get showRecentApps => throw _privateConstructorUsedError;

  /// Tamaño máximo de archivo en bytes (por defecto 25MB)
  int get maxFileSize => throw _privateConstructorUsedError;

  /// Tipos de archivo permitidos
  List<String> get allowedFileTypes => throw _privateConstructorUsedError;

  /// Si permite múltiples archivos
  bool get allowMultipleFiles => throw _privateConstructorUsedError;

  /// Si comprime imágenes automáticamente
  bool get compressImages => throw _privateConstructorUsedError;

  /// Calidad de compresión de imagen (0-100)
  int get imageQuality => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareConfigCopyWith<DSClipboardShareConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareConfigCopyWith<$Res> {
  factory $DSClipboardShareConfigCopyWith(
    DSClipboardShareConfig value,
    $Res Function(DSClipboardShareConfig) then,
  ) = _$DSClipboardShareConfigCopyWithImpl<$Res, DSClipboardShareConfig>;
  @useResult
  $Res call({
    DSClipboardShareVariant variant,
    DSClipboardShareState state,
    DSClipboardShareColors? colors,
    DSClipboardShareSpacing? spacing,
    DSClipboardShareTypography? typography,
    DSClipboardShareAnimations? animations,
    DSClipboardShareBehavior? behavior,
    DSClipboardShareAccessibility? accessibility,
    bool showPreview,
    bool allowEdit,
    bool showConfirmation,
    bool groupShareOptions,
    bool showRecentApps,
    int maxFileSize,
    List<String> allowedFileTypes,
    bool allowMultipleFiles,
    bool compressImages,
    int imageQuality,
  });

  $DSClipboardShareColorsCopyWith<$Res>? get colors;
  $DSClipboardShareSpacingCopyWith<$Res>? get spacing;
  $DSClipboardShareTypographyCopyWith<$Res>? get typography;
  $DSClipboardShareAnimationsCopyWith<$Res>? get animations;
  $DSClipboardShareBehaviorCopyWith<$Res>? get behavior;
  $DSClipboardShareAccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class _$DSClipboardShareConfigCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareConfig
>
    implements $DSClipboardShareConfigCopyWith<$Res> {
  _$DSClipboardShareConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareConfig
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
    Object? showPreview = null,
    Object? allowEdit = null,
    Object? showConfirmation = null,
    Object? groupShareOptions = null,
    Object? showRecentApps = null,
    Object? maxFileSize = null,
    Object? allowedFileTypes = null,
    Object? allowMultipleFiles = null,
    Object? compressImages = null,
    Object? imageQuality = null,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareState,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareColors?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareSpacing?,
            typography: freezed == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareTypography?,
            animations: freezed == animations
                ? _value.animations
                : animations // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareAnimations?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareBehavior?,
            accessibility: freezed == accessibility
                ? _value.accessibility
                : accessibility // ignore: cast_nullable_to_non_nullable
                      as DSClipboardShareAccessibility?,
            showPreview: null == showPreview
                ? _value.showPreview
                : showPreview // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowEdit: null == allowEdit
                ? _value.allowEdit
                : allowEdit // ignore: cast_nullable_to_non_nullable
                      as bool,
            showConfirmation: null == showConfirmation
                ? _value.showConfirmation
                : showConfirmation // ignore: cast_nullable_to_non_nullable
                      as bool,
            groupShareOptions: null == groupShareOptions
                ? _value.groupShareOptions
                : groupShareOptions // ignore: cast_nullable_to_non_nullable
                      as bool,
            showRecentApps: null == showRecentApps
                ? _value.showRecentApps
                : showRecentApps // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxFileSize: null == maxFileSize
                ? _value.maxFileSize
                : maxFileSize // ignore: cast_nullable_to_non_nullable
                      as int,
            allowedFileTypes: null == allowedFileTypes
                ? _value.allowedFileTypes
                : allowedFileTypes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            allowMultipleFiles: null == allowMultipleFiles
                ? _value.allowMultipleFiles
                : allowMultipleFiles // ignore: cast_nullable_to_non_nullable
                      as bool,
            compressImages: null == compressImages
                ? _value.compressImages
                : compressImages // ignore: cast_nullable_to_non_nullable
                      as bool,
            imageQuality: null == imageQuality
                ? _value.imageQuality
                : imageQuality // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSClipboardShareColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSClipboardShareColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSClipboardShareSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSClipboardShareSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSClipboardShareTypographyCopyWith<$Res>? get typography {
    if (_value.typography == null) {
      return null;
    }

    return $DSClipboardShareTypographyCopyWith<$Res>(_value.typography!, (
      value,
    ) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSClipboardShareAnimationsCopyWith<$Res>? get animations {
    if (_value.animations == null) {
      return null;
    }

    return $DSClipboardShareAnimationsCopyWith<$Res>(_value.animations!, (
      value,
    ) {
      return _then(_value.copyWith(animations: value) as $Val);
    });
  }

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSClipboardShareBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSClipboardShareBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSClipboardShareAccessibilityCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $DSClipboardShareAccessibilityCopyWith<$Res>(_value.accessibility!, (
      value,
    ) {
      return _then(_value.copyWith(accessibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSClipboardShareConfigImplCopyWith<$Res>
    implements $DSClipboardShareConfigCopyWith<$Res> {
  factory _$$DSClipboardShareConfigImplCopyWith(
    _$DSClipboardShareConfigImpl value,
    $Res Function(_$DSClipboardShareConfigImpl) then,
  ) = __$$DSClipboardShareConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSClipboardShareVariant variant,
    DSClipboardShareState state,
    DSClipboardShareColors? colors,
    DSClipboardShareSpacing? spacing,
    DSClipboardShareTypography? typography,
    DSClipboardShareAnimations? animations,
    DSClipboardShareBehavior? behavior,
    DSClipboardShareAccessibility? accessibility,
    bool showPreview,
    bool allowEdit,
    bool showConfirmation,
    bool groupShareOptions,
    bool showRecentApps,
    int maxFileSize,
    List<String> allowedFileTypes,
    bool allowMultipleFiles,
    bool compressImages,
    int imageQuality,
  });

  @override
  $DSClipboardShareColorsCopyWith<$Res>? get colors;
  @override
  $DSClipboardShareSpacingCopyWith<$Res>? get spacing;
  @override
  $DSClipboardShareTypographyCopyWith<$Res>? get typography;
  @override
  $DSClipboardShareAnimationsCopyWith<$Res>? get animations;
  @override
  $DSClipboardShareBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSClipboardShareAccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class __$$DSClipboardShareConfigImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareConfigCopyWithImpl<$Res, _$DSClipboardShareConfigImpl>
    implements _$$DSClipboardShareConfigImplCopyWith<$Res> {
  __$$DSClipboardShareConfigImplCopyWithImpl(
    _$DSClipboardShareConfigImpl _value,
    $Res Function(_$DSClipboardShareConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareConfig
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
    Object? showPreview = null,
    Object? allowEdit = null,
    Object? showConfirmation = null,
    Object? groupShareOptions = null,
    Object? showRecentApps = null,
    Object? maxFileSize = null,
    Object? allowedFileTypes = null,
    Object? allowMultipleFiles = null,
    Object? compressImages = null,
    Object? imageQuality = null,
  }) {
    return _then(
      _$DSClipboardShareConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareState,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareColors?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareSpacing?,
        typography: freezed == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareTypography?,
        animations: freezed == animations
            ? _value.animations
            : animations // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareAnimations?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareBehavior?,
        accessibility: freezed == accessibility
            ? _value.accessibility
            : accessibility // ignore: cast_nullable_to_non_nullable
                  as DSClipboardShareAccessibility?,
        showPreview: null == showPreview
            ? _value.showPreview
            : showPreview // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowEdit: null == allowEdit
            ? _value.allowEdit
            : allowEdit // ignore: cast_nullable_to_non_nullable
                  as bool,
        showConfirmation: null == showConfirmation
            ? _value.showConfirmation
            : showConfirmation // ignore: cast_nullable_to_non_nullable
                  as bool,
        groupShareOptions: null == groupShareOptions
            ? _value.groupShareOptions
            : groupShareOptions // ignore: cast_nullable_to_non_nullable
                  as bool,
        showRecentApps: null == showRecentApps
            ? _value.showRecentApps
            : showRecentApps // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxFileSize: null == maxFileSize
            ? _value.maxFileSize
            : maxFileSize // ignore: cast_nullable_to_non_nullable
                  as int,
        allowedFileTypes: null == allowedFileTypes
            ? _value._allowedFileTypes
            : allowedFileTypes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        allowMultipleFiles: null == allowMultipleFiles
            ? _value.allowMultipleFiles
            : allowMultipleFiles // ignore: cast_nullable_to_non_nullable
                  as bool,
        compressImages: null == compressImages
            ? _value.compressImages
            : compressImages // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageQuality: null == imageQuality
            ? _value.imageQuality
            : imageQuality // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSClipboardShareConfigImpl extends _DSClipboardShareConfig {
  const _$DSClipboardShareConfigImpl({
    this.variant = DSClipboardShareVariant.shareSheet,
    this.state = DSClipboardShareState.defaultState,
    this.colors,
    this.spacing,
    this.typography,
    this.animations,
    this.behavior,
    this.accessibility,
    this.showPreview = true,
    this.allowEdit = false,
    this.showConfirmation = true,
    this.groupShareOptions = true,
    this.showRecentApps = true,
    this.maxFileSize = 26214400,
    final List<String> allowedFileTypes = const ['*/*'],
    this.allowMultipleFiles = true,
    this.compressImages = true,
    this.imageQuality = 85,
  }) : _allowedFileTypes = allowedFileTypes,
       super._();

  /// Variante del componente
  @override
  @JsonKey()
  final DSClipboardShareVariant variant;

  /// Estado actual del componente
  @override
  @JsonKey()
  final DSClipboardShareState state;

  /// Configuración de colores (solo design tokens)
  @override
  final DSClipboardShareColors? colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  final DSClipboardShareSpacing? spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  final DSClipboardShareTypography? typography;

  /// Configuración de animaciones
  @override
  final DSClipboardShareAnimations? animations;

  /// Configuración de comportamiento
  @override
  final DSClipboardShareBehavior? behavior;

  /// Configuración de accesibilidad
  @override
  final DSClipboardShareAccessibility? accessibility;

  /// Si muestra preview del contenido antes de compartir
  @override
  @JsonKey()
  final bool showPreview;

  /// Si permite editar el contenido antes de compartir
  @override
  @JsonKey()
  final bool allowEdit;

  /// Si muestra confirmación después de copiar/compartir
  @override
  @JsonKey()
  final bool showConfirmation;

  /// Si agrupa las opciones de compartir por tipo
  @override
  @JsonKey()
  final bool groupShareOptions;

  /// Si muestra apps recientes para compartir
  @override
  @JsonKey()
  final bool showRecentApps;

  /// Tamaño máximo de archivo en bytes (por defecto 25MB)
  @override
  @JsonKey()
  final int maxFileSize;

  /// Tipos de archivo permitidos
  final List<String> _allowedFileTypes;

  /// Tipos de archivo permitidos
  @override
  @JsonKey()
  List<String> get allowedFileTypes {
    if (_allowedFileTypes is EqualUnmodifiableListView)
      return _allowedFileTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedFileTypes);
  }

  /// Si permite múltiples archivos
  @override
  @JsonKey()
  final bool allowMultipleFiles;

  /// Si comprime imágenes automáticamente
  @override
  @JsonKey()
  final bool compressImages;

  /// Calidad de compresión de imagen (0-100)
  @override
  @JsonKey()
  final int imageQuality;

  @override
  String toString() {
    return 'DSClipboardShareConfig(variant: $variant, state: $state, colors: $colors, spacing: $spacing, typography: $typography, animations: $animations, behavior: $behavior, accessibility: $accessibility, showPreview: $showPreview, allowEdit: $allowEdit, showConfirmation: $showConfirmation, groupShareOptions: $groupShareOptions, showRecentApps: $showRecentApps, maxFileSize: $maxFileSize, allowedFileTypes: $allowedFileTypes, allowMultipleFiles: $allowMultipleFiles, compressImages: $compressImages, imageQuality: $imageQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareConfigImpl &&
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
            (identical(other.showPreview, showPreview) ||
                other.showPreview == showPreview) &&
            (identical(other.allowEdit, allowEdit) ||
                other.allowEdit == allowEdit) &&
            (identical(other.showConfirmation, showConfirmation) ||
                other.showConfirmation == showConfirmation) &&
            (identical(other.groupShareOptions, groupShareOptions) ||
                other.groupShareOptions == groupShareOptions) &&
            (identical(other.showRecentApps, showRecentApps) ||
                other.showRecentApps == showRecentApps) &&
            (identical(other.maxFileSize, maxFileSize) ||
                other.maxFileSize == maxFileSize) &&
            const DeepCollectionEquality().equals(
              other._allowedFileTypes,
              _allowedFileTypes,
            ) &&
            (identical(other.allowMultipleFiles, allowMultipleFiles) ||
                other.allowMultipleFiles == allowMultipleFiles) &&
            (identical(other.compressImages, compressImages) ||
                other.compressImages == compressImages) &&
            (identical(other.imageQuality, imageQuality) ||
                other.imageQuality == imageQuality));
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
    showPreview,
    allowEdit,
    showConfirmation,
    groupShareOptions,
    showRecentApps,
    maxFileSize,
    const DeepCollectionEquality().hash(_allowedFileTypes),
    allowMultipleFiles,
    compressImages,
    imageQuality,
  );

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareConfigImplCopyWith<_$DSClipboardShareConfigImpl>
  get copyWith =>
      __$$DSClipboardShareConfigImplCopyWithImpl<_$DSClipboardShareConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSClipboardShareConfig extends DSClipboardShareConfig {
  const factory _DSClipboardShareConfig({
    final DSClipboardShareVariant variant,
    final DSClipboardShareState state,
    final DSClipboardShareColors? colors,
    final DSClipboardShareSpacing? spacing,
    final DSClipboardShareTypography? typography,
    final DSClipboardShareAnimations? animations,
    final DSClipboardShareBehavior? behavior,
    final DSClipboardShareAccessibility? accessibility,
    final bool showPreview,
    final bool allowEdit,
    final bool showConfirmation,
    final bool groupShareOptions,
    final bool showRecentApps,
    final int maxFileSize,
    final List<String> allowedFileTypes,
    final bool allowMultipleFiles,
    final bool compressImages,
    final int imageQuality,
  }) = _$DSClipboardShareConfigImpl;
  const _DSClipboardShareConfig._() : super._();

  /// Variante del componente
  @override
  DSClipboardShareVariant get variant;

  /// Estado actual del componente
  @override
  DSClipboardShareState get state;

  /// Configuración de colores (solo design tokens)
  @override
  DSClipboardShareColors? get colors;

  /// Configuración de espaciado (solo design tokens)
  @override
  DSClipboardShareSpacing? get spacing;

  /// Configuración de tipografía (solo design tokens)
  @override
  DSClipboardShareTypography? get typography;

  /// Configuración de animaciones
  @override
  DSClipboardShareAnimations? get animations;

  /// Configuración de comportamiento
  @override
  DSClipboardShareBehavior? get behavior;

  /// Configuración de accesibilidad
  @override
  DSClipboardShareAccessibility? get accessibility;

  /// Si muestra preview del contenido antes de compartir
  @override
  bool get showPreview;

  /// Si permite editar el contenido antes de compartir
  @override
  bool get allowEdit;

  /// Si muestra confirmación después de copiar/compartir
  @override
  bool get showConfirmation;

  /// Si agrupa las opciones de compartir por tipo
  @override
  bool get groupShareOptions;

  /// Si muestra apps recientes para compartir
  @override
  bool get showRecentApps;

  /// Tamaño máximo de archivo en bytes (por defecto 25MB)
  @override
  int get maxFileSize;

  /// Tipos de archivo permitidos
  @override
  List<String> get allowedFileTypes;

  /// Si permite múltiples archivos
  @override
  bool get allowMultipleFiles;

  /// Si comprime imágenes automáticamente
  @override
  bool get compressImages;

  /// Calidad de compresión de imagen (0-100)
  @override
  int get imageQuality;

  /// Create a copy of DSClipboardShareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareConfigImplCopyWith<_$DSClipboardShareConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSShareData {
  /// Texto principal para compartir
  String? get text => throw _privateConstructorUsedError;

  /// Asunto/título del contenido
  String? get subject => throw _privateConstructorUsedError;

  /// Lista de archivos para compartir
  List<DSShareFile> get files => throw _privateConstructorUsedError;

  /// URL para compartir
  String? get url => throw _privateConstructorUsedError;

  /// Metadata adicional
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Tipo MIME del contenido
  String get mimeType => throw _privateConstructorUsedError;

  /// Si el contenido es sensible
  bool get isSensitive => throw _privateConstructorUsedError;

  /// Create a copy of DSShareData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSShareDataCopyWith<DSShareData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSShareDataCopyWith<$Res> {
  factory $DSShareDataCopyWith(
    DSShareData value,
    $Res Function(DSShareData) then,
  ) = _$DSShareDataCopyWithImpl<$Res, DSShareData>;
  @useResult
  $Res call({
    String? text,
    String? subject,
    List<DSShareFile> files,
    String? url,
    Map<String, dynamic>? metadata,
    String mimeType,
    bool isSensitive,
  });
}

/// @nodoc
class _$DSShareDataCopyWithImpl<$Res, $Val extends DSShareData>
    implements $DSShareDataCopyWith<$Res> {
  _$DSShareDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSShareData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? subject = freezed,
    Object? files = null,
    Object? url = freezed,
    Object? metadata = freezed,
    Object? mimeType = null,
    Object? isSensitive = null,
  }) {
    return _then(
      _value.copyWith(
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            files: null == files
                ? _value.files
                : files // ignore: cast_nullable_to_non_nullable
                      as List<DSShareFile>,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            mimeType: null == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String,
            isSensitive: null == isSensitive
                ? _value.isSensitive
                : isSensitive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSShareDataImplCopyWith<$Res>
    implements $DSShareDataCopyWith<$Res> {
  factory _$$DSShareDataImplCopyWith(
    _$DSShareDataImpl value,
    $Res Function(_$DSShareDataImpl) then,
  ) = __$$DSShareDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? text,
    String? subject,
    List<DSShareFile> files,
    String? url,
    Map<String, dynamic>? metadata,
    String mimeType,
    bool isSensitive,
  });
}

/// @nodoc
class __$$DSShareDataImplCopyWithImpl<$Res>
    extends _$DSShareDataCopyWithImpl<$Res, _$DSShareDataImpl>
    implements _$$DSShareDataImplCopyWith<$Res> {
  __$$DSShareDataImplCopyWithImpl(
    _$DSShareDataImpl _value,
    $Res Function(_$DSShareDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSShareData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? subject = freezed,
    Object? files = null,
    Object? url = freezed,
    Object? metadata = freezed,
    Object? mimeType = null,
    Object? isSensitive = null,
  }) {
    return _then(
      _$DSShareDataImpl(
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        files: null == files
            ? _value._files
            : files // ignore: cast_nullable_to_non_nullable
                  as List<DSShareFile>,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        mimeType: null == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String,
        isSensitive: null == isSensitive
            ? _value.isSensitive
            : isSensitive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSShareDataImpl extends _DSShareData {
  const _$DSShareDataImpl({
    this.text,
    this.subject,
    final List<DSShareFile> files = const [],
    this.url,
    final Map<String, dynamic>? metadata,
    this.mimeType = 'text/plain',
    this.isSensitive = false,
  }) : _files = files,
       _metadata = metadata,
       super._();

  /// Texto principal para compartir
  @override
  final String? text;

  /// Asunto/título del contenido
  @override
  final String? subject;

  /// Lista de archivos para compartir
  final List<DSShareFile> _files;

  /// Lista de archivos para compartir
  @override
  @JsonKey()
  List<DSShareFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  /// URL para compartir
  @override
  final String? url;

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

  /// Tipo MIME del contenido
  @override
  @JsonKey()
  final String mimeType;

  /// Si el contenido es sensible
  @override
  @JsonKey()
  final bool isSensitive;

  @override
  String toString() {
    return 'DSShareData(text: $text, subject: $subject, files: $files, url: $url, metadata: $metadata, mimeType: $mimeType, isSensitive: $isSensitive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSShareDataImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.isSensitive, isSensitive) ||
                other.isSensitive == isSensitive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    text,
    subject,
    const DeepCollectionEquality().hash(_files),
    url,
    const DeepCollectionEquality().hash(_metadata),
    mimeType,
    isSensitive,
  );

  /// Create a copy of DSShareData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSShareDataImplCopyWith<_$DSShareDataImpl> get copyWith =>
      __$$DSShareDataImplCopyWithImpl<_$DSShareDataImpl>(this, _$identity);
}

abstract class _DSShareData extends DSShareData {
  const factory _DSShareData({
    final String? text,
    final String? subject,
    final List<DSShareFile> files,
    final String? url,
    final Map<String, dynamic>? metadata,
    final String mimeType,
    final bool isSensitive,
  }) = _$DSShareDataImpl;
  const _DSShareData._() : super._();

  /// Texto principal para compartir
  @override
  String? get text;

  /// Asunto/título del contenido
  @override
  String? get subject;

  /// Lista de archivos para compartir
  @override
  List<DSShareFile> get files;

  /// URL para compartir
  @override
  String? get url;

  /// Metadata adicional
  @override
  Map<String, dynamic>? get metadata;

  /// Tipo MIME del contenido
  @override
  String get mimeType;

  /// Si el contenido es sensible
  @override
  bool get isSensitive;

  /// Create a copy of DSShareData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSShareDataImplCopyWith<_$DSShareDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSShareFile {
  /// Nombre del archivo
  String get name => throw _privateConstructorUsedError;

  /// Ruta del archivo (local o URL)
  String? get path => throw _privateConstructorUsedError;

  /// Bytes del archivo (si está en memoria)
  Uint8List? get bytes => throw _privateConstructorUsedError;

  /// Tipo MIME del archivo
  String get mimeType => throw _privateConstructorUsedError;

  /// Tamaño del archivo en bytes
  int? get size => throw _privateConstructorUsedError;

  /// Thumbnail del archivo (para imágenes/videos)
  Uint8List? get thumbnail => throw _privateConstructorUsedError;

  /// Create a copy of DSShareFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSShareFileCopyWith<DSShareFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSShareFileCopyWith<$Res> {
  factory $DSShareFileCopyWith(
    DSShareFile value,
    $Res Function(DSShareFile) then,
  ) = _$DSShareFileCopyWithImpl<$Res, DSShareFile>;
  @useResult
  $Res call({
    String name,
    String? path,
    Uint8List? bytes,
    String mimeType,
    int? size,
    Uint8List? thumbnail,
  });
}

/// @nodoc
class _$DSShareFileCopyWithImpl<$Res, $Val extends DSShareFile>
    implements $DSShareFileCopyWith<$Res> {
  _$DSShareFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSShareFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = freezed,
    Object? bytes = freezed,
    Object? mimeType = null,
    Object? size = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            path: freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String?,
            bytes: freezed == bytes
                ? _value.bytes
                : bytes // ignore: cast_nullable_to_non_nullable
                      as Uint8List?,
            mimeType: null == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            thumbnail: freezed == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as Uint8List?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSShareFileImplCopyWith<$Res>
    implements $DSShareFileCopyWith<$Res> {
  factory _$$DSShareFileImplCopyWith(
    _$DSShareFileImpl value,
    $Res Function(_$DSShareFileImpl) then,
  ) = __$$DSShareFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? path,
    Uint8List? bytes,
    String mimeType,
    int? size,
    Uint8List? thumbnail,
  });
}

/// @nodoc
class __$$DSShareFileImplCopyWithImpl<$Res>
    extends _$DSShareFileCopyWithImpl<$Res, _$DSShareFileImpl>
    implements _$$DSShareFileImplCopyWith<$Res> {
  __$$DSShareFileImplCopyWithImpl(
    _$DSShareFileImpl _value,
    $Res Function(_$DSShareFileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSShareFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = freezed,
    Object? bytes = freezed,
    Object? mimeType = null,
    Object? size = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(
      _$DSShareFileImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        path: freezed == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String?,
        bytes: freezed == bytes
            ? _value.bytes
            : bytes // ignore: cast_nullable_to_non_nullable
                  as Uint8List?,
        mimeType: null == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        thumbnail: freezed == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as Uint8List?,
      ),
    );
  }
}

/// @nodoc

class _$DSShareFileImpl extends _DSShareFile {
  const _$DSShareFileImpl({
    required this.name,
    this.path,
    this.bytes,
    this.mimeType = 'application/octet-stream',
    this.size,
    this.thumbnail,
  }) : super._();

  /// Nombre del archivo
  @override
  final String name;

  /// Ruta del archivo (local o URL)
  @override
  final String? path;

  /// Bytes del archivo (si está en memoria)
  @override
  final Uint8List? bytes;

  /// Tipo MIME del archivo
  @override
  @JsonKey()
  final String mimeType;

  /// Tamaño del archivo en bytes
  @override
  final int? size;

  /// Thumbnail del archivo (para imágenes/videos)
  @override
  final Uint8List? thumbnail;

  @override
  String toString() {
    return 'DSShareFile(name: $name, path: $path, bytes: $bytes, mimeType: $mimeType, size: $size, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSShareFileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    path,
    const DeepCollectionEquality().hash(bytes),
    mimeType,
    size,
    const DeepCollectionEquality().hash(thumbnail),
  );

  /// Create a copy of DSShareFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSShareFileImplCopyWith<_$DSShareFileImpl> get copyWith =>
      __$$DSShareFileImplCopyWithImpl<_$DSShareFileImpl>(this, _$identity);
}

abstract class _DSShareFile extends DSShareFile {
  const factory _DSShareFile({
    required final String name,
    final String? path,
    final Uint8List? bytes,
    final String mimeType,
    final int? size,
    final Uint8List? thumbnail,
  }) = _$DSShareFileImpl;
  const _DSShareFile._() : super._();

  /// Nombre del archivo
  @override
  String get name;

  /// Ruta del archivo (local o URL)
  @override
  String? get path;

  /// Bytes del archivo (si está en memoria)
  @override
  Uint8List? get bytes;

  /// Tipo MIME del archivo
  @override
  String get mimeType;

  /// Tamaño del archivo en bytes
  @override
  int? get size;

  /// Thumbnail del archivo (para imágenes/videos)
  @override
  Uint8List? get thumbnail;

  /// Create a copy of DSShareFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSShareFileImplCopyWith<_$DSShareFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSClipboardShareColors {
  /// Color de fondo
  Color? get backgroundColor => throw _privateConstructorUsedError;

  /// Color del botón principal
  Color? get primaryButtonColor => throw _privateConstructorUsedError;

  /// Color del botón secundario
  Color? get secondaryButtonColor => throw _privateConstructorUsedError;

  /// Color del texto principal
  Color? get primaryTextColor => throw _privateConstructorUsedError;

  /// Color del texto secundario
  Color? get secondaryTextColor => throw _privateConstructorUsedError;

  /// Color del icono
  Color? get iconColor => throw _privateConstructorUsedError;

  /// Color del borde
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Color de overlay
  Color? get overlayColor => throw _privateConstructorUsedError;

  /// Color de éxito
  Color? get successColor => throw _privateConstructorUsedError;

  /// Color de error
  Color? get errorColor => throw _privateConstructorUsedError;

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

  /// Color en estado loading
  Color? get loadingColor => throw _privateConstructorUsedError;

  /// Color base del skeleton
  Color? get skeletonBaseColor => throw _privateConstructorUsedError;

  /// Color highlight del skeleton
  Color? get skeletonHighlightColor => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareColorsCopyWith<DSClipboardShareColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareColorsCopyWith<$Res> {
  factory $DSClipboardShareColorsCopyWith(
    DSClipboardShareColors value,
    $Res Function(DSClipboardShareColors) then,
  ) = _$DSClipboardShareColorsCopyWithImpl<$Res, DSClipboardShareColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? primaryButtonColor,
    Color? secondaryButtonColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? iconColor,
    Color? borderColor,
    Color? overlayColor,
    Color? successColor,
    Color? errorColor,
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
class _$DSClipboardShareColorsCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareColors
>
    implements $DSClipboardShareColorsCopyWith<$Res> {
  _$DSClipboardShareColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? primaryButtonColor = freezed,
    Object? secondaryButtonColor = freezed,
    Object? primaryTextColor = freezed,
    Object? secondaryTextColor = freezed,
    Object? iconColor = freezed,
    Object? borderColor = freezed,
    Object? overlayColor = freezed,
    Object? successColor = freezed,
    Object? errorColor = freezed,
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
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            primaryButtonColor: freezed == primaryButtonColor
                ? _value.primaryButtonColor
                : primaryButtonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            secondaryButtonColor: freezed == secondaryButtonColor
                ? _value.secondaryButtonColor
                : secondaryButtonColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            primaryTextColor: freezed == primaryTextColor
                ? _value.primaryTextColor
                : primaryTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            secondaryTextColor: freezed == secondaryTextColor
                ? _value.secondaryTextColor
                : secondaryTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            iconColor: freezed == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            overlayColor: freezed == overlayColor
                ? _value.overlayColor
                : overlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            successColor: freezed == successColor
                ? _value.successColor
                : successColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            errorColor: freezed == errorColor
                ? _value.errorColor
                : errorColor // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSClipboardShareColorsImplCopyWith<$Res>
    implements $DSClipboardShareColorsCopyWith<$Res> {
  factory _$$DSClipboardShareColorsImplCopyWith(
    _$DSClipboardShareColorsImpl value,
    $Res Function(_$DSClipboardShareColorsImpl) then,
  ) = __$$DSClipboardShareColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? primaryButtonColor,
    Color? secondaryButtonColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? iconColor,
    Color? borderColor,
    Color? overlayColor,
    Color? successColor,
    Color? errorColor,
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
class __$$DSClipboardShareColorsImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareColorsCopyWithImpl<$Res, _$DSClipboardShareColorsImpl>
    implements _$$DSClipboardShareColorsImplCopyWith<$Res> {
  __$$DSClipboardShareColorsImplCopyWithImpl(
    _$DSClipboardShareColorsImpl _value,
    $Res Function(_$DSClipboardShareColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? primaryButtonColor = freezed,
    Object? secondaryButtonColor = freezed,
    Object? primaryTextColor = freezed,
    Object? secondaryTextColor = freezed,
    Object? iconColor = freezed,
    Object? borderColor = freezed,
    Object? overlayColor = freezed,
    Object? successColor = freezed,
    Object? errorColor = freezed,
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
      _$DSClipboardShareColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryButtonColor: freezed == primaryButtonColor
            ? _value.primaryButtonColor
            : primaryButtonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryButtonColor: freezed == secondaryButtonColor
            ? _value.secondaryButtonColor
            : secondaryButtonColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryTextColor: freezed == primaryTextColor
            ? _value.primaryTextColor
            : primaryTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryTextColor: freezed == secondaryTextColor
            ? _value.secondaryTextColor
            : secondaryTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        iconColor: freezed == iconColor
            ? _value.iconColor
            : iconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        overlayColor: freezed == overlayColor
            ? _value.overlayColor
            : overlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        successColor: freezed == successColor
            ? _value.successColor
            : successColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorColor: freezed == errorColor
            ? _value.errorColor
            : errorColor // ignore: cast_nullable_to_non_nullable
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

class _$DSClipboardShareColorsImpl implements _DSClipboardShareColors {
  const _$DSClipboardShareColorsImpl({
    this.backgroundColor,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.primaryTextColor,
    this.secondaryTextColor,
    this.iconColor,
    this.borderColor,
    this.overlayColor,
    this.successColor,
    this.errorColor,
    this.hoverColor,
    this.pressedColor,
    this.focusColor,
    this.selectedColor,
    this.disabledColor,
    this.loadingColor,
    this.skeletonBaseColor,
    this.skeletonHighlightColor,
  });

  /// Color de fondo
  @override
  final Color? backgroundColor;

  /// Color del botón principal
  @override
  final Color? primaryButtonColor;

  /// Color del botón secundario
  @override
  final Color? secondaryButtonColor;

  /// Color del texto principal
  @override
  final Color? primaryTextColor;

  /// Color del texto secundario
  @override
  final Color? secondaryTextColor;

  /// Color del icono
  @override
  final Color? iconColor;

  /// Color del borde
  @override
  final Color? borderColor;

  /// Color de overlay
  @override
  final Color? overlayColor;

  /// Color de éxito
  @override
  final Color? successColor;

  /// Color de error
  @override
  final Color? errorColor;

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

  /// Color en estado loading
  @override
  final Color? loadingColor;

  /// Color base del skeleton
  @override
  final Color? skeletonBaseColor;

  /// Color highlight del skeleton
  @override
  final Color? skeletonHighlightColor;

  @override
  String toString() {
    return 'DSClipboardShareColors(backgroundColor: $backgroundColor, primaryButtonColor: $primaryButtonColor, secondaryButtonColor: $secondaryButtonColor, primaryTextColor: $primaryTextColor, secondaryTextColor: $secondaryTextColor, iconColor: $iconColor, borderColor: $borderColor, overlayColor: $overlayColor, successColor: $successColor, errorColor: $errorColor, hoverColor: $hoverColor, pressedColor: $pressedColor, focusColor: $focusColor, selectedColor: $selectedColor, disabledColor: $disabledColor, loadingColor: $loadingColor, skeletonBaseColor: $skeletonBaseColor, skeletonHighlightColor: $skeletonHighlightColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.primaryButtonColor, primaryButtonColor) ||
                other.primaryButtonColor == primaryButtonColor) &&
            (identical(other.secondaryButtonColor, secondaryButtonColor) ||
                other.secondaryButtonColor == secondaryButtonColor) &&
            (identical(other.primaryTextColor, primaryTextColor) ||
                other.primaryTextColor == primaryTextColor) &&
            (identical(other.secondaryTextColor, secondaryTextColor) ||
                other.secondaryTextColor == secondaryTextColor) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.overlayColor, overlayColor) ||
                other.overlayColor == overlayColor) &&
            (identical(other.successColor, successColor) ||
                other.successColor == successColor) &&
            (identical(other.errorColor, errorColor) ||
                other.errorColor == errorColor) &&
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
    backgroundColor,
    primaryButtonColor,
    secondaryButtonColor,
    primaryTextColor,
    secondaryTextColor,
    iconColor,
    borderColor,
    overlayColor,
    successColor,
    errorColor,
    hoverColor,
    pressedColor,
    focusColor,
    selectedColor,
    disabledColor,
    loadingColor,
    skeletonBaseColor,
    skeletonHighlightColor,
  );

  /// Create a copy of DSClipboardShareColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareColorsImplCopyWith<_$DSClipboardShareColorsImpl>
  get copyWith =>
      __$$DSClipboardShareColorsImplCopyWithImpl<_$DSClipboardShareColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSClipboardShareColors implements DSClipboardShareColors {
  const factory _DSClipboardShareColors({
    final Color? backgroundColor,
    final Color? primaryButtonColor,
    final Color? secondaryButtonColor,
    final Color? primaryTextColor,
    final Color? secondaryTextColor,
    final Color? iconColor,
    final Color? borderColor,
    final Color? overlayColor,
    final Color? successColor,
    final Color? errorColor,
    final Color? hoverColor,
    final Color? pressedColor,
    final Color? focusColor,
    final Color? selectedColor,
    final Color? disabledColor,
    final Color? loadingColor,
    final Color? skeletonBaseColor,
    final Color? skeletonHighlightColor,
  }) = _$DSClipboardShareColorsImpl;

  /// Color de fondo
  @override
  Color? get backgroundColor;

  /// Color del botón principal
  @override
  Color? get primaryButtonColor;

  /// Color del botón secundario
  @override
  Color? get secondaryButtonColor;

  /// Color del texto principal
  @override
  Color? get primaryTextColor;

  /// Color del texto secundario
  @override
  Color? get secondaryTextColor;

  /// Color del icono
  @override
  Color? get iconColor;

  /// Color del borde
  @override
  Color? get borderColor;

  /// Color de overlay
  @override
  Color? get overlayColor;

  /// Color de éxito
  @override
  Color? get successColor;

  /// Color de error
  @override
  Color? get errorColor;

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

  /// Color en estado loading
  @override
  Color? get loadingColor;

  /// Color base del skeleton
  @override
  Color? get skeletonBaseColor;

  /// Color highlight del skeleton
  @override
  Color? get skeletonHighlightColor;

  /// Create a copy of DSClipboardShareColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareColorsImplCopyWith<_$DSClipboardShareColorsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSClipboardShareSpacing {
  /// Padding del contenedor principal
  EdgeInsets get containerPadding => throw _privateConstructorUsedError;

  /// Padding del botón
  EdgeInsets get buttonPadding => throw _privateConstructorUsedError;

  /// Padding del modal
  EdgeInsets get modalPadding => throw _privateConstructorUsedError;

  /// Padding del preview
  EdgeInsets get previewPadding => throw _privateConstructorUsedError;

  /// Espaciado entre elementos
  double get itemSpacing => throw _privateConstructorUsedError;

  /// Espaciado entre iconos
  double get iconSpacing => throw _privateConstructorUsedError;

  /// Radio del borde
  double get borderRadius => throw _privateConstructorUsedError;

  /// Radio del borde del botón
  double get buttonBorderRadius => throw _privateConstructorUsedError;

  /// Altura del modal
  double? get modalHeight => throw _privateConstructorUsedError;

  /// Ancho máximo del modal
  double get modalMaxWidth => throw _privateConstructorUsedError;

  /// Tamaño del icono
  double get iconSize => throw _privateConstructorUsedError;

  /// Tamaño del icono grande
  double get largeIconSize => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareSpacingCopyWith<DSClipboardShareSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareSpacingCopyWith<$Res> {
  factory $DSClipboardShareSpacingCopyWith(
    DSClipboardShareSpacing value,
    $Res Function(DSClipboardShareSpacing) then,
  ) = _$DSClipboardShareSpacingCopyWithImpl<$Res, DSClipboardShareSpacing>;
  @useResult
  $Res call({
    EdgeInsets containerPadding,
    EdgeInsets buttonPadding,
    EdgeInsets modalPadding,
    EdgeInsets previewPadding,
    double itemSpacing,
    double iconSpacing,
    double borderRadius,
    double buttonBorderRadius,
    double? modalHeight,
    double modalMaxWidth,
    double iconSize,
    double largeIconSize,
  });
}

/// @nodoc
class _$DSClipboardShareSpacingCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareSpacing
>
    implements $DSClipboardShareSpacingCopyWith<$Res> {
  _$DSClipboardShareSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? containerPadding = null,
    Object? buttonPadding = null,
    Object? modalPadding = null,
    Object? previewPadding = null,
    Object? itemSpacing = null,
    Object? iconSpacing = null,
    Object? borderRadius = null,
    Object? buttonBorderRadius = null,
    Object? modalHeight = freezed,
    Object? modalMaxWidth = null,
    Object? iconSize = null,
    Object? largeIconSize = null,
  }) {
    return _then(
      _value.copyWith(
            containerPadding: null == containerPadding
                ? _value.containerPadding
                : containerPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            buttonPadding: null == buttonPadding
                ? _value.buttonPadding
                : buttonPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            modalPadding: null == modalPadding
                ? _value.modalPadding
                : modalPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            previewPadding: null == previewPadding
                ? _value.previewPadding
                : previewPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            itemSpacing: null == itemSpacing
                ? _value.itemSpacing
                : itemSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            iconSpacing: null == iconSpacing
                ? _value.iconSpacing
                : iconSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            buttonBorderRadius: null == buttonBorderRadius
                ? _value.buttonBorderRadius
                : buttonBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            modalHeight: freezed == modalHeight
                ? _value.modalHeight
                : modalHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            modalMaxWidth: null == modalMaxWidth
                ? _value.modalMaxWidth
                : modalMaxWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            iconSize: null == iconSize
                ? _value.iconSize
                : iconSize // ignore: cast_nullable_to_non_nullable
                      as double,
            largeIconSize: null == largeIconSize
                ? _value.largeIconSize
                : largeIconSize // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSClipboardShareSpacingImplCopyWith<$Res>
    implements $DSClipboardShareSpacingCopyWith<$Res> {
  factory _$$DSClipboardShareSpacingImplCopyWith(
    _$DSClipboardShareSpacingImpl value,
    $Res Function(_$DSClipboardShareSpacingImpl) then,
  ) = __$$DSClipboardShareSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EdgeInsets containerPadding,
    EdgeInsets buttonPadding,
    EdgeInsets modalPadding,
    EdgeInsets previewPadding,
    double itemSpacing,
    double iconSpacing,
    double borderRadius,
    double buttonBorderRadius,
    double? modalHeight,
    double modalMaxWidth,
    double iconSize,
    double largeIconSize,
  });
}

/// @nodoc
class __$$DSClipboardShareSpacingImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareSpacingCopyWithImpl<
          $Res,
          _$DSClipboardShareSpacingImpl
        >
    implements _$$DSClipboardShareSpacingImplCopyWith<$Res> {
  __$$DSClipboardShareSpacingImplCopyWithImpl(
    _$DSClipboardShareSpacingImpl _value,
    $Res Function(_$DSClipboardShareSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? containerPadding = null,
    Object? buttonPadding = null,
    Object? modalPadding = null,
    Object? previewPadding = null,
    Object? itemSpacing = null,
    Object? iconSpacing = null,
    Object? borderRadius = null,
    Object? buttonBorderRadius = null,
    Object? modalHeight = freezed,
    Object? modalMaxWidth = null,
    Object? iconSize = null,
    Object? largeIconSize = null,
  }) {
    return _then(
      _$DSClipboardShareSpacingImpl(
        containerPadding: null == containerPadding
            ? _value.containerPadding
            : containerPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        buttonPadding: null == buttonPadding
            ? _value.buttonPadding
            : buttonPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        modalPadding: null == modalPadding
            ? _value.modalPadding
            : modalPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        previewPadding: null == previewPadding
            ? _value.previewPadding
            : previewPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        itemSpacing: null == itemSpacing
            ? _value.itemSpacing
            : itemSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        iconSpacing: null == iconSpacing
            ? _value.iconSpacing
            : iconSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        borderRadius: null == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        buttonBorderRadius: null == buttonBorderRadius
            ? _value.buttonBorderRadius
            : buttonBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        modalHeight: freezed == modalHeight
            ? _value.modalHeight
            : modalHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        modalMaxWidth: null == modalMaxWidth
            ? _value.modalMaxWidth
            : modalMaxWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        iconSize: null == iconSize
            ? _value.iconSize
            : iconSize // ignore: cast_nullable_to_non_nullable
                  as double,
        largeIconSize: null == largeIconSize
            ? _value.largeIconSize
            : largeIconSize // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSClipboardShareSpacingImpl implements _DSClipboardShareSpacing {
  const _$DSClipboardShareSpacingImpl({
    this.containerPadding = const EdgeInsets.all(16.0),
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    this.modalPadding = const EdgeInsets.all(24.0),
    this.previewPadding = const EdgeInsets.all(12.0),
    this.itemSpacing = 16.0,
    this.iconSpacing = 8.0,
    this.borderRadius = 12.0,
    this.buttonBorderRadius = 8.0,
    this.modalHeight,
    this.modalMaxWidth = 400.0,
    this.iconSize = 24.0,
    this.largeIconSize = 48.0,
  });

  /// Padding del contenedor principal
  @override
  @JsonKey()
  final EdgeInsets containerPadding;

  /// Padding del botón
  @override
  @JsonKey()
  final EdgeInsets buttonPadding;

  /// Padding del modal
  @override
  @JsonKey()
  final EdgeInsets modalPadding;

  /// Padding del preview
  @override
  @JsonKey()
  final EdgeInsets previewPadding;

  /// Espaciado entre elementos
  @override
  @JsonKey()
  final double itemSpacing;

  /// Espaciado entre iconos
  @override
  @JsonKey()
  final double iconSpacing;

  /// Radio del borde
  @override
  @JsonKey()
  final double borderRadius;

  /// Radio del borde del botón
  @override
  @JsonKey()
  final double buttonBorderRadius;

  /// Altura del modal
  @override
  final double? modalHeight;

  /// Ancho máximo del modal
  @override
  @JsonKey()
  final double modalMaxWidth;

  /// Tamaño del icono
  @override
  @JsonKey()
  final double iconSize;

  /// Tamaño del icono grande
  @override
  @JsonKey()
  final double largeIconSize;

  @override
  String toString() {
    return 'DSClipboardShareSpacing(containerPadding: $containerPadding, buttonPadding: $buttonPadding, modalPadding: $modalPadding, previewPadding: $previewPadding, itemSpacing: $itemSpacing, iconSpacing: $iconSpacing, borderRadius: $borderRadius, buttonBorderRadius: $buttonBorderRadius, modalHeight: $modalHeight, modalMaxWidth: $modalMaxWidth, iconSize: $iconSize, largeIconSize: $largeIconSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareSpacingImpl &&
            (identical(other.containerPadding, containerPadding) ||
                other.containerPadding == containerPadding) &&
            (identical(other.buttonPadding, buttonPadding) ||
                other.buttonPadding == buttonPadding) &&
            (identical(other.modalPadding, modalPadding) ||
                other.modalPadding == modalPadding) &&
            (identical(other.previewPadding, previewPadding) ||
                other.previewPadding == previewPadding) &&
            (identical(other.itemSpacing, itemSpacing) ||
                other.itemSpacing == itemSpacing) &&
            (identical(other.iconSpacing, iconSpacing) ||
                other.iconSpacing == iconSpacing) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.buttonBorderRadius, buttonBorderRadius) ||
                other.buttonBorderRadius == buttonBorderRadius) &&
            (identical(other.modalHeight, modalHeight) ||
                other.modalHeight == modalHeight) &&
            (identical(other.modalMaxWidth, modalMaxWidth) ||
                other.modalMaxWidth == modalMaxWidth) &&
            (identical(other.iconSize, iconSize) ||
                other.iconSize == iconSize) &&
            (identical(other.largeIconSize, largeIconSize) ||
                other.largeIconSize == largeIconSize));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    containerPadding,
    buttonPadding,
    modalPadding,
    previewPadding,
    itemSpacing,
    iconSpacing,
    borderRadius,
    buttonBorderRadius,
    modalHeight,
    modalMaxWidth,
    iconSize,
    largeIconSize,
  );

  /// Create a copy of DSClipboardShareSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareSpacingImplCopyWith<_$DSClipboardShareSpacingImpl>
  get copyWith =>
      __$$DSClipboardShareSpacingImplCopyWithImpl<
        _$DSClipboardShareSpacingImpl
      >(this, _$identity);
}

abstract class _DSClipboardShareSpacing implements DSClipboardShareSpacing {
  const factory _DSClipboardShareSpacing({
    final EdgeInsets containerPadding,
    final EdgeInsets buttonPadding,
    final EdgeInsets modalPadding,
    final EdgeInsets previewPadding,
    final double itemSpacing,
    final double iconSpacing,
    final double borderRadius,
    final double buttonBorderRadius,
    final double? modalHeight,
    final double modalMaxWidth,
    final double iconSize,
    final double largeIconSize,
  }) = _$DSClipboardShareSpacingImpl;

  /// Padding del contenedor principal
  @override
  EdgeInsets get containerPadding;

  /// Padding del botón
  @override
  EdgeInsets get buttonPadding;

  /// Padding del modal
  @override
  EdgeInsets get modalPadding;

  /// Padding del preview
  @override
  EdgeInsets get previewPadding;

  /// Espaciado entre elementos
  @override
  double get itemSpacing;

  /// Espaciado entre iconos
  @override
  double get iconSpacing;

  /// Radio del borde
  @override
  double get borderRadius;

  /// Radio del borde del botón
  @override
  double get buttonBorderRadius;

  /// Altura del modal
  @override
  double? get modalHeight;

  /// Ancho máximo del modal
  @override
  double get modalMaxWidth;

  /// Tamaño del icono
  @override
  double get iconSize;

  /// Tamaño del icono grande
  @override
  double get largeIconSize;

  /// Create a copy of DSClipboardShareSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareSpacingImplCopyWith<_$DSClipboardShareSpacingImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSClipboardShareTypography {
  /// Estilo del título
  TextStyle? get titleStyle => throw _privateConstructorUsedError;

  /// Estilo del subtítulo
  TextStyle? get subtitleStyle => throw _privateConstructorUsedError;

  /// Estilo del cuerpo
  TextStyle? get bodyStyle => throw _privateConstructorUsedError;

  /// Estilo del botón
  TextStyle? get buttonStyle => throw _privateConstructorUsedError;

  /// Estilo del label
  TextStyle? get labelStyle => throw _privateConstructorUsedError;

  /// Estilo del caption
  TextStyle? get captionStyle => throw _privateConstructorUsedError;

  /// Estilo del error
  TextStyle? get errorStyle => throw _privateConstructorUsedError;

  /// Estilo del preview
  TextStyle? get previewStyle => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareTypographyCopyWith<DSClipboardShareTypography>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareTypographyCopyWith<$Res> {
  factory $DSClipboardShareTypographyCopyWith(
    DSClipboardShareTypography value,
    $Res Function(DSClipboardShareTypography) then,
  ) =
      _$DSClipboardShareTypographyCopyWithImpl<
        $Res,
        DSClipboardShareTypography
      >;
  @useResult
  $Res call({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? bodyStyle,
    TextStyle? buttonStyle,
    TextStyle? labelStyle,
    TextStyle? captionStyle,
    TextStyle? errorStyle,
    TextStyle? previewStyle,
  });
}

/// @nodoc
class _$DSClipboardShareTypographyCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareTypography
>
    implements $DSClipboardShareTypographyCopyWith<$Res> {
  _$DSClipboardShareTypographyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleStyle = freezed,
    Object? subtitleStyle = freezed,
    Object? bodyStyle = freezed,
    Object? buttonStyle = freezed,
    Object? labelStyle = freezed,
    Object? captionStyle = freezed,
    Object? errorStyle = freezed,
    Object? previewStyle = freezed,
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
            bodyStyle: freezed == bodyStyle
                ? _value.bodyStyle
                : bodyStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            buttonStyle: freezed == buttonStyle
                ? _value.buttonStyle
                : buttonStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            labelStyle: freezed == labelStyle
                ? _value.labelStyle
                : labelStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            captionStyle: freezed == captionStyle
                ? _value.captionStyle
                : captionStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            errorStyle: freezed == errorStyle
                ? _value.errorStyle
                : errorStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            previewStyle: freezed == previewStyle
                ? _value.previewStyle
                : previewStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSClipboardShareTypographyImplCopyWith<$Res>
    implements $DSClipboardShareTypographyCopyWith<$Res> {
  factory _$$DSClipboardShareTypographyImplCopyWith(
    _$DSClipboardShareTypographyImpl value,
    $Res Function(_$DSClipboardShareTypographyImpl) then,
  ) = __$$DSClipboardShareTypographyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? bodyStyle,
    TextStyle? buttonStyle,
    TextStyle? labelStyle,
    TextStyle? captionStyle,
    TextStyle? errorStyle,
    TextStyle? previewStyle,
  });
}

/// @nodoc
class __$$DSClipboardShareTypographyImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareTypographyCopyWithImpl<
          $Res,
          _$DSClipboardShareTypographyImpl
        >
    implements _$$DSClipboardShareTypographyImplCopyWith<$Res> {
  __$$DSClipboardShareTypographyImplCopyWithImpl(
    _$DSClipboardShareTypographyImpl _value,
    $Res Function(_$DSClipboardShareTypographyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleStyle = freezed,
    Object? subtitleStyle = freezed,
    Object? bodyStyle = freezed,
    Object? buttonStyle = freezed,
    Object? labelStyle = freezed,
    Object? captionStyle = freezed,
    Object? errorStyle = freezed,
    Object? previewStyle = freezed,
  }) {
    return _then(
      _$DSClipboardShareTypographyImpl(
        titleStyle: freezed == titleStyle
            ? _value.titleStyle
            : titleStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        subtitleStyle: freezed == subtitleStyle
            ? _value.subtitleStyle
            : subtitleStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        bodyStyle: freezed == bodyStyle
            ? _value.bodyStyle
            : bodyStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        buttonStyle: freezed == buttonStyle
            ? _value.buttonStyle
            : buttonStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        labelStyle: freezed == labelStyle
            ? _value.labelStyle
            : labelStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        captionStyle: freezed == captionStyle
            ? _value.captionStyle
            : captionStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        errorStyle: freezed == errorStyle
            ? _value.errorStyle
            : errorStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        previewStyle: freezed == previewStyle
            ? _value.previewStyle
            : previewStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
      ),
    );
  }
}

/// @nodoc

class _$DSClipboardShareTypographyImpl implements _DSClipboardShareTypography {
  const _$DSClipboardShareTypographyImpl({
    this.titleStyle,
    this.subtitleStyle,
    this.bodyStyle,
    this.buttonStyle,
    this.labelStyle,
    this.captionStyle,
    this.errorStyle,
    this.previewStyle,
  });

  /// Estilo del título
  @override
  final TextStyle? titleStyle;

  /// Estilo del subtítulo
  @override
  final TextStyle? subtitleStyle;

  /// Estilo del cuerpo
  @override
  final TextStyle? bodyStyle;

  /// Estilo del botón
  @override
  final TextStyle? buttonStyle;

  /// Estilo del label
  @override
  final TextStyle? labelStyle;

  /// Estilo del caption
  @override
  final TextStyle? captionStyle;

  /// Estilo del error
  @override
  final TextStyle? errorStyle;

  /// Estilo del preview
  @override
  final TextStyle? previewStyle;

  @override
  String toString() {
    return 'DSClipboardShareTypography(titleStyle: $titleStyle, subtitleStyle: $subtitleStyle, bodyStyle: $bodyStyle, buttonStyle: $buttonStyle, labelStyle: $labelStyle, captionStyle: $captionStyle, errorStyle: $errorStyle, previewStyle: $previewStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareTypographyImpl &&
            (identical(other.titleStyle, titleStyle) ||
                other.titleStyle == titleStyle) &&
            (identical(other.subtitleStyle, subtitleStyle) ||
                other.subtitleStyle == subtitleStyle) &&
            (identical(other.bodyStyle, bodyStyle) ||
                other.bodyStyle == bodyStyle) &&
            (identical(other.buttonStyle, buttonStyle) ||
                other.buttonStyle == buttonStyle) &&
            (identical(other.labelStyle, labelStyle) ||
                other.labelStyle == labelStyle) &&
            (identical(other.captionStyle, captionStyle) ||
                other.captionStyle == captionStyle) &&
            (identical(other.errorStyle, errorStyle) ||
                other.errorStyle == errorStyle) &&
            (identical(other.previewStyle, previewStyle) ||
                other.previewStyle == previewStyle));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    titleStyle,
    subtitleStyle,
    bodyStyle,
    buttonStyle,
    labelStyle,
    captionStyle,
    errorStyle,
    previewStyle,
  );

  /// Create a copy of DSClipboardShareTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareTypographyImplCopyWith<_$DSClipboardShareTypographyImpl>
  get copyWith =>
      __$$DSClipboardShareTypographyImplCopyWithImpl<
        _$DSClipboardShareTypographyImpl
      >(this, _$identity);
}

abstract class _DSClipboardShareTypography
    implements DSClipboardShareTypography {
  const factory _DSClipboardShareTypography({
    final TextStyle? titleStyle,
    final TextStyle? subtitleStyle,
    final TextStyle? bodyStyle,
    final TextStyle? buttonStyle,
    final TextStyle? labelStyle,
    final TextStyle? captionStyle,
    final TextStyle? errorStyle,
    final TextStyle? previewStyle,
  }) = _$DSClipboardShareTypographyImpl;

  /// Estilo del título
  @override
  TextStyle? get titleStyle;

  /// Estilo del subtítulo
  @override
  TextStyle? get subtitleStyle;

  /// Estilo del cuerpo
  @override
  TextStyle? get bodyStyle;

  /// Estilo del botón
  @override
  TextStyle? get buttonStyle;

  /// Estilo del label
  @override
  TextStyle? get labelStyle;

  /// Estilo del caption
  @override
  TextStyle? get captionStyle;

  /// Estilo del error
  @override
  TextStyle? get errorStyle;

  /// Estilo del preview
  @override
  TextStyle? get previewStyle;

  /// Create a copy of DSClipboardShareTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareTypographyImplCopyWith<_$DSClipboardShareTypographyImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSClipboardShareAnimations {
  /// Duración de la animación de estado
  Duration get stateDuration => throw _privateConstructorUsedError;

  /// Duración de la animación del modal
  Duration get modalDuration => throw _privateConstructorUsedError;

  /// Duración de la animación de confirmación
  Duration get confirmationDuration => throw _privateConstructorUsedError;

  /// Duración del skeleton
  Duration get skeletonDuration => throw _privateConstructorUsedError;

  /// Curva de animación de estado
  Curve get stateCurve => throw _privateConstructorUsedError;

  /// Curva de animación del modal
  Curve get modalCurve => throw _privateConstructorUsedError;

  /// Curva del skeleton
  Curve get skeletonCurve => throw _privateConstructorUsedError;

  /// Si las animaciones están habilitadas
  bool get enabled => throw _privateConstructorUsedError;

  /// Si respeta reduced motion
  bool get respectReducedMotion => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareAnimationsCopyWith<DSClipboardShareAnimations>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareAnimationsCopyWith<$Res> {
  factory $DSClipboardShareAnimationsCopyWith(
    DSClipboardShareAnimations value,
    $Res Function(DSClipboardShareAnimations) then,
  ) =
      _$DSClipboardShareAnimationsCopyWithImpl<
        $Res,
        DSClipboardShareAnimations
      >;
  @useResult
  $Res call({
    Duration stateDuration,
    Duration modalDuration,
    Duration confirmationDuration,
    Duration skeletonDuration,
    Curve stateCurve,
    Curve modalCurve,
    Curve skeletonCurve,
    bool enabled,
    bool respectReducedMotion,
  });
}

/// @nodoc
class _$DSClipboardShareAnimationsCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareAnimations
>
    implements $DSClipboardShareAnimationsCopyWith<$Res> {
  _$DSClipboardShareAnimationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDuration = null,
    Object? modalDuration = null,
    Object? confirmationDuration = null,
    Object? skeletonDuration = null,
    Object? stateCurve = null,
    Object? modalCurve = null,
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
            modalDuration: null == modalDuration
                ? _value.modalDuration
                : modalDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            confirmationDuration: null == confirmationDuration
                ? _value.confirmationDuration
                : confirmationDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            skeletonDuration: null == skeletonDuration
                ? _value.skeletonDuration
                : skeletonDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            stateCurve: null == stateCurve
                ? _value.stateCurve
                : stateCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            modalCurve: null == modalCurve
                ? _value.modalCurve
                : modalCurve // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSClipboardShareAnimationsImplCopyWith<$Res>
    implements $DSClipboardShareAnimationsCopyWith<$Res> {
  factory _$$DSClipboardShareAnimationsImplCopyWith(
    _$DSClipboardShareAnimationsImpl value,
    $Res Function(_$DSClipboardShareAnimationsImpl) then,
  ) = __$$DSClipboardShareAnimationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Duration stateDuration,
    Duration modalDuration,
    Duration confirmationDuration,
    Duration skeletonDuration,
    Curve stateCurve,
    Curve modalCurve,
    Curve skeletonCurve,
    bool enabled,
    bool respectReducedMotion,
  });
}

/// @nodoc
class __$$DSClipboardShareAnimationsImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareAnimationsCopyWithImpl<
          $Res,
          _$DSClipboardShareAnimationsImpl
        >
    implements _$$DSClipboardShareAnimationsImplCopyWith<$Res> {
  __$$DSClipboardShareAnimationsImplCopyWithImpl(
    _$DSClipboardShareAnimationsImpl _value,
    $Res Function(_$DSClipboardShareAnimationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareAnimations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateDuration = null,
    Object? modalDuration = null,
    Object? confirmationDuration = null,
    Object? skeletonDuration = null,
    Object? stateCurve = null,
    Object? modalCurve = null,
    Object? skeletonCurve = null,
    Object? enabled = null,
    Object? respectReducedMotion = null,
  }) {
    return _then(
      _$DSClipboardShareAnimationsImpl(
        stateDuration: null == stateDuration
            ? _value.stateDuration
            : stateDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        modalDuration: null == modalDuration
            ? _value.modalDuration
            : modalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        confirmationDuration: null == confirmationDuration
            ? _value.confirmationDuration
            : confirmationDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        skeletonDuration: null == skeletonDuration
            ? _value.skeletonDuration
            : skeletonDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        stateCurve: null == stateCurve
            ? _value.stateCurve
            : stateCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        modalCurve: null == modalCurve
            ? _value.modalCurve
            : modalCurve // ignore: cast_nullable_to_non_nullable
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

class _$DSClipboardShareAnimationsImpl implements _DSClipboardShareAnimations {
  const _$DSClipboardShareAnimationsImpl({
    this.stateDuration = const Duration(milliseconds: 200),
    this.modalDuration = const Duration(milliseconds: 300),
    this.confirmationDuration = const Duration(milliseconds: 2000),
    this.skeletonDuration = const Duration(milliseconds: 1200),
    this.stateCurve = Curves.easeInOut,
    this.modalCurve = Curves.easeOutCubic,
    this.skeletonCurve = Curves.easeInOut,
    this.enabled = true,
    this.respectReducedMotion = true,
  });

  /// Duración de la animación de estado
  @override
  @JsonKey()
  final Duration stateDuration;

  /// Duración de la animación del modal
  @override
  @JsonKey()
  final Duration modalDuration;

  /// Duración de la animación de confirmación
  @override
  @JsonKey()
  final Duration confirmationDuration;

  /// Duración del skeleton
  @override
  @JsonKey()
  final Duration skeletonDuration;

  /// Curva de animación de estado
  @override
  @JsonKey()
  final Curve stateCurve;

  /// Curva de animación del modal
  @override
  @JsonKey()
  final Curve modalCurve;

  /// Curva del skeleton
  @override
  @JsonKey()
  final Curve skeletonCurve;

  /// Si las animaciones están habilitadas
  @override
  @JsonKey()
  final bool enabled;

  /// Si respeta reduced motion
  @override
  @JsonKey()
  final bool respectReducedMotion;

  @override
  String toString() {
    return 'DSClipboardShareAnimations(stateDuration: $stateDuration, modalDuration: $modalDuration, confirmationDuration: $confirmationDuration, skeletonDuration: $skeletonDuration, stateCurve: $stateCurve, modalCurve: $modalCurve, skeletonCurve: $skeletonCurve, enabled: $enabled, respectReducedMotion: $respectReducedMotion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareAnimationsImpl &&
            (identical(other.stateDuration, stateDuration) ||
                other.stateDuration == stateDuration) &&
            (identical(other.modalDuration, modalDuration) ||
                other.modalDuration == modalDuration) &&
            (identical(other.confirmationDuration, confirmationDuration) ||
                other.confirmationDuration == confirmationDuration) &&
            (identical(other.skeletonDuration, skeletonDuration) ||
                other.skeletonDuration == skeletonDuration) &&
            (identical(other.stateCurve, stateCurve) ||
                other.stateCurve == stateCurve) &&
            (identical(other.modalCurve, modalCurve) ||
                other.modalCurve == modalCurve) &&
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
    modalDuration,
    confirmationDuration,
    skeletonDuration,
    stateCurve,
    modalCurve,
    skeletonCurve,
    enabled,
    respectReducedMotion,
  );

  /// Create a copy of DSClipboardShareAnimations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareAnimationsImplCopyWith<_$DSClipboardShareAnimationsImpl>
  get copyWith =>
      __$$DSClipboardShareAnimationsImplCopyWithImpl<
        _$DSClipboardShareAnimationsImpl
      >(this, _$identity);
}

abstract class _DSClipboardShareAnimations
    implements DSClipboardShareAnimations {
  const factory _DSClipboardShareAnimations({
    final Duration stateDuration,
    final Duration modalDuration,
    final Duration confirmationDuration,
    final Duration skeletonDuration,
    final Curve stateCurve,
    final Curve modalCurve,
    final Curve skeletonCurve,
    final bool enabled,
    final bool respectReducedMotion,
  }) = _$DSClipboardShareAnimationsImpl;

  /// Duración de la animación de estado
  @override
  Duration get stateDuration;

  /// Duración de la animación del modal
  @override
  Duration get modalDuration;

  /// Duración de la animación de confirmación
  @override
  Duration get confirmationDuration;

  /// Duración del skeleton
  @override
  Duration get skeletonDuration;

  /// Curva de animación de estado
  @override
  Curve get stateCurve;

  /// Curva de animación del modal
  @override
  Curve get modalCurve;

  /// Curva del skeleton
  @override
  Curve get skeletonCurve;

  /// Si las animaciones están habilitadas
  @override
  bool get enabled;

  /// Si respeta reduced motion
  @override
  bool get respectReducedMotion;

  /// Create a copy of DSClipboardShareAnimations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareAnimationsImplCopyWith<_$DSClipboardShareAnimationsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSClipboardShareBehavior {
  /// Si muestra información de debug
  bool get showDebugInfo => throw _privateConstructorUsedError;

  /// Si habilita efectos hover
  bool get enableHoverEffects => throw _privateConstructorUsedError;

  /// Si muestra indicador de focus
  bool get showFocusIndicator => throw _privateConstructorUsedError;

  /// Si habilita haptic feedback
  bool get enableHapticFeedback => throw _privateConstructorUsedError;

  /// Si cachea los estilos
  bool get cacheStyles => throw _privateConstructorUsedError;

  /// Si es adaptativo a la plataforma
  bool get platformAdaptive => throw _privateConstructorUsedError;

  /// Si auto-cierra el modal después de compartir
  bool get autoCloseAfterShare => throw _privateConstructorUsedError;

  /// Si muestra historial de compartidos
  bool get showShareHistory => throw _privateConstructorUsedError;

  /// Si permite arrastrar y soltar archivos
  bool get enableDragAndDrop => throw _privateConstructorUsedError;

  /// Si valida URLs automáticamente
  bool get validateUrls => throw _privateConstructorUsedError;

  /// Si sanitiza el contenido HTML
  bool get sanitizeHtml => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareBehaviorCopyWith<DSClipboardShareBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareBehaviorCopyWith<$Res> {
  factory $DSClipboardShareBehaviorCopyWith(
    DSClipboardShareBehavior value,
    $Res Function(DSClipboardShareBehavior) then,
  ) = _$DSClipboardShareBehaviorCopyWithImpl<$Res, DSClipboardShareBehavior>;
  @useResult
  $Res call({
    bool showDebugInfo,
    bool enableHoverEffects,
    bool showFocusIndicator,
    bool enableHapticFeedback,
    bool cacheStyles,
    bool platformAdaptive,
    bool autoCloseAfterShare,
    bool showShareHistory,
    bool enableDragAndDrop,
    bool validateUrls,
    bool sanitizeHtml,
  });
}

/// @nodoc
class _$DSClipboardShareBehaviorCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareBehavior
>
    implements $DSClipboardShareBehaviorCopyWith<$Res> {
  _$DSClipboardShareBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareBehavior
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
    Object? autoCloseAfterShare = null,
    Object? showShareHistory = null,
    Object? enableDragAndDrop = null,
    Object? validateUrls = null,
    Object? sanitizeHtml = null,
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
            autoCloseAfterShare: null == autoCloseAfterShare
                ? _value.autoCloseAfterShare
                : autoCloseAfterShare // ignore: cast_nullable_to_non_nullable
                      as bool,
            showShareHistory: null == showShareHistory
                ? _value.showShareHistory
                : showShareHistory // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableDragAndDrop: null == enableDragAndDrop
                ? _value.enableDragAndDrop
                : enableDragAndDrop // ignore: cast_nullable_to_non_nullable
                      as bool,
            validateUrls: null == validateUrls
                ? _value.validateUrls
                : validateUrls // ignore: cast_nullable_to_non_nullable
                      as bool,
            sanitizeHtml: null == sanitizeHtml
                ? _value.sanitizeHtml
                : sanitizeHtml // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSClipboardShareBehaviorImplCopyWith<$Res>
    implements $DSClipboardShareBehaviorCopyWith<$Res> {
  factory _$$DSClipboardShareBehaviorImplCopyWith(
    _$DSClipboardShareBehaviorImpl value,
    $Res Function(_$DSClipboardShareBehaviorImpl) then,
  ) = __$$DSClipboardShareBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool showDebugInfo,
    bool enableHoverEffects,
    bool showFocusIndicator,
    bool enableHapticFeedback,
    bool cacheStyles,
    bool platformAdaptive,
    bool autoCloseAfterShare,
    bool showShareHistory,
    bool enableDragAndDrop,
    bool validateUrls,
    bool sanitizeHtml,
  });
}

/// @nodoc
class __$$DSClipboardShareBehaviorImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareBehaviorCopyWithImpl<
          $Res,
          _$DSClipboardShareBehaviorImpl
        >
    implements _$$DSClipboardShareBehaviorImplCopyWith<$Res> {
  __$$DSClipboardShareBehaviorImplCopyWithImpl(
    _$DSClipboardShareBehaviorImpl _value,
    $Res Function(_$DSClipboardShareBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareBehavior
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
    Object? autoCloseAfterShare = null,
    Object? showShareHistory = null,
    Object? enableDragAndDrop = null,
    Object? validateUrls = null,
    Object? sanitizeHtml = null,
  }) {
    return _then(
      _$DSClipboardShareBehaviorImpl(
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
        autoCloseAfterShare: null == autoCloseAfterShare
            ? _value.autoCloseAfterShare
            : autoCloseAfterShare // ignore: cast_nullable_to_non_nullable
                  as bool,
        showShareHistory: null == showShareHistory
            ? _value.showShareHistory
            : showShareHistory // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableDragAndDrop: null == enableDragAndDrop
            ? _value.enableDragAndDrop
            : enableDragAndDrop // ignore: cast_nullable_to_non_nullable
                  as bool,
        validateUrls: null == validateUrls
            ? _value.validateUrls
            : validateUrls // ignore: cast_nullable_to_non_nullable
                  as bool,
        sanitizeHtml: null == sanitizeHtml
            ? _value.sanitizeHtml
            : sanitizeHtml // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSClipboardShareBehaviorImpl implements _DSClipboardShareBehavior {
  const _$DSClipboardShareBehaviorImpl({
    this.showDebugInfo = false,
    this.enableHoverEffects = true,
    this.showFocusIndicator = true,
    this.enableHapticFeedback = true,
    this.cacheStyles = true,
    this.platformAdaptive = true,
    this.autoCloseAfterShare = true,
    this.showShareHistory = false,
    this.enableDragAndDrop = true,
    this.validateUrls = true,
    this.sanitizeHtml = true,
  });

  /// Si muestra información de debug
  @override
  @JsonKey()
  final bool showDebugInfo;

  /// Si habilita efectos hover
  @override
  @JsonKey()
  final bool enableHoverEffects;

  /// Si muestra indicador de focus
  @override
  @JsonKey()
  final bool showFocusIndicator;

  /// Si habilita haptic feedback
  @override
  @JsonKey()
  final bool enableHapticFeedback;

  /// Si cachea los estilos
  @override
  @JsonKey()
  final bool cacheStyles;

  /// Si es adaptativo a la plataforma
  @override
  @JsonKey()
  final bool platformAdaptive;

  /// Si auto-cierra el modal después de compartir
  @override
  @JsonKey()
  final bool autoCloseAfterShare;

  /// Si muestra historial de compartidos
  @override
  @JsonKey()
  final bool showShareHistory;

  /// Si permite arrastrar y soltar archivos
  @override
  @JsonKey()
  final bool enableDragAndDrop;

  /// Si valida URLs automáticamente
  @override
  @JsonKey()
  final bool validateUrls;

  /// Si sanitiza el contenido HTML
  @override
  @JsonKey()
  final bool sanitizeHtml;

  @override
  String toString() {
    return 'DSClipboardShareBehavior(showDebugInfo: $showDebugInfo, enableHoverEffects: $enableHoverEffects, showFocusIndicator: $showFocusIndicator, enableHapticFeedback: $enableHapticFeedback, cacheStyles: $cacheStyles, platformAdaptive: $platformAdaptive, autoCloseAfterShare: $autoCloseAfterShare, showShareHistory: $showShareHistory, enableDragAndDrop: $enableDragAndDrop, validateUrls: $validateUrls, sanitizeHtml: $sanitizeHtml)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareBehaviorImpl &&
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
            (identical(other.autoCloseAfterShare, autoCloseAfterShare) ||
                other.autoCloseAfterShare == autoCloseAfterShare) &&
            (identical(other.showShareHistory, showShareHistory) ||
                other.showShareHistory == showShareHistory) &&
            (identical(other.enableDragAndDrop, enableDragAndDrop) ||
                other.enableDragAndDrop == enableDragAndDrop) &&
            (identical(other.validateUrls, validateUrls) ||
                other.validateUrls == validateUrls) &&
            (identical(other.sanitizeHtml, sanitizeHtml) ||
                other.sanitizeHtml == sanitizeHtml));
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
    autoCloseAfterShare,
    showShareHistory,
    enableDragAndDrop,
    validateUrls,
    sanitizeHtml,
  );

  /// Create a copy of DSClipboardShareBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareBehaviorImplCopyWith<_$DSClipboardShareBehaviorImpl>
  get copyWith =>
      __$$DSClipboardShareBehaviorImplCopyWithImpl<
        _$DSClipboardShareBehaviorImpl
      >(this, _$identity);
}

abstract class _DSClipboardShareBehavior implements DSClipboardShareBehavior {
  const factory _DSClipboardShareBehavior({
    final bool showDebugInfo,
    final bool enableHoverEffects,
    final bool showFocusIndicator,
    final bool enableHapticFeedback,
    final bool cacheStyles,
    final bool platformAdaptive,
    final bool autoCloseAfterShare,
    final bool showShareHistory,
    final bool enableDragAndDrop,
    final bool validateUrls,
    final bool sanitizeHtml,
  }) = _$DSClipboardShareBehaviorImpl;

  /// Si muestra información de debug
  @override
  bool get showDebugInfo;

  /// Si habilita efectos hover
  @override
  bool get enableHoverEffects;

  /// Si muestra indicador de focus
  @override
  bool get showFocusIndicator;

  /// Si habilita haptic feedback
  @override
  bool get enableHapticFeedback;

  /// Si cachea los estilos
  @override
  bool get cacheStyles;

  /// Si es adaptativo a la plataforma
  @override
  bool get platformAdaptive;

  /// Si auto-cierra el modal después de compartir
  @override
  bool get autoCloseAfterShare;

  /// Si muestra historial de compartidos
  @override
  bool get showShareHistory;

  /// Si permite arrastrar y soltar archivos
  @override
  bool get enableDragAndDrop;

  /// Si valida URLs automáticamente
  @override
  bool get validateUrls;

  /// Si sanitiza el contenido HTML
  @override
  bool get sanitizeHtml;

  /// Create a copy of DSClipboardShareBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareBehaviorImplCopyWith<_$DSClipboardShareBehaviorImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSClipboardShareAccessibility {
  /// Si la accesibilidad está habilitada
  bool get enabled => throw _privateConstructorUsedError;

  /// Rol semántico del componente
  String get semanticRole => throw _privateConstructorUsedError;

  /// Si es focusable
  bool get focusable => throw _privateConstructorUsedError;

  /// Si excluye de la semántica
  bool get excludeSemantics => throw _privateConstructorUsedError;

  /// Label para compartir
  String get shareLabel => throw _privateConstructorUsedError;

  /// Label para copiar
  String get copyLabel => throw _privateConstructorUsedError;

  /// Label para estado loading
  String get loadingLabel => throw _privateConstructorUsedError;

  /// Label para estado disabled
  String get disabledLabel => throw _privateConstructorUsedError;

  /// Label para éxito
  String get successLabel => throw _privateConstructorUsedError;

  /// Label para error
  String get errorLabel => throw _privateConstructorUsedError;

  /// Hint para compartir
  String get shareHint => throw _privateConstructorUsedError;

  /// Hint para copiar
  String get copyHint => throw _privateConstructorUsedError;

  /// Create a copy of DSClipboardShareAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSClipboardShareAccessibilityCopyWith<DSClipboardShareAccessibility>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSClipboardShareAccessibilityCopyWith<$Res> {
  factory $DSClipboardShareAccessibilityCopyWith(
    DSClipboardShareAccessibility value,
    $Res Function(DSClipboardShareAccessibility) then,
  ) =
      _$DSClipboardShareAccessibilityCopyWithImpl<
        $Res,
        DSClipboardShareAccessibility
      >;
  @useResult
  $Res call({
    bool enabled,
    String semanticRole,
    bool focusable,
    bool excludeSemantics,
    String shareLabel,
    String copyLabel,
    String loadingLabel,
    String disabledLabel,
    String successLabel,
    String errorLabel,
    String shareHint,
    String copyHint,
  });
}

/// @nodoc
class _$DSClipboardShareAccessibilityCopyWithImpl<
  $Res,
  $Val extends DSClipboardShareAccessibility
>
    implements $DSClipboardShareAccessibilityCopyWith<$Res> {
  _$DSClipboardShareAccessibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSClipboardShareAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticRole = null,
    Object? focusable = null,
    Object? excludeSemantics = null,
    Object? shareLabel = null,
    Object? copyLabel = null,
    Object? loadingLabel = null,
    Object? disabledLabel = null,
    Object? successLabel = null,
    Object? errorLabel = null,
    Object? shareHint = null,
    Object? copyHint = null,
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
            focusable: null == focusable
                ? _value.focusable
                : focusable // ignore: cast_nullable_to_non_nullable
                      as bool,
            excludeSemantics: null == excludeSemantics
                ? _value.excludeSemantics
                : excludeSemantics // ignore: cast_nullable_to_non_nullable
                      as bool,
            shareLabel: null == shareLabel
                ? _value.shareLabel
                : shareLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            copyLabel: null == copyLabel
                ? _value.copyLabel
                : copyLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            loadingLabel: null == loadingLabel
                ? _value.loadingLabel
                : loadingLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            disabledLabel: null == disabledLabel
                ? _value.disabledLabel
                : disabledLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            successLabel: null == successLabel
                ? _value.successLabel
                : successLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            errorLabel: null == errorLabel
                ? _value.errorLabel
                : errorLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            shareHint: null == shareHint
                ? _value.shareHint
                : shareHint // ignore: cast_nullable_to_non_nullable
                      as String,
            copyHint: null == copyHint
                ? _value.copyHint
                : copyHint // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSClipboardShareAccessibilityImplCopyWith<$Res>
    implements $DSClipboardShareAccessibilityCopyWith<$Res> {
  factory _$$DSClipboardShareAccessibilityImplCopyWith(
    _$DSClipboardShareAccessibilityImpl value,
    $Res Function(_$DSClipboardShareAccessibilityImpl) then,
  ) = __$$DSClipboardShareAccessibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    String semanticRole,
    bool focusable,
    bool excludeSemantics,
    String shareLabel,
    String copyLabel,
    String loadingLabel,
    String disabledLabel,
    String successLabel,
    String errorLabel,
    String shareHint,
    String copyHint,
  });
}

/// @nodoc
class __$$DSClipboardShareAccessibilityImplCopyWithImpl<$Res>
    extends
        _$DSClipboardShareAccessibilityCopyWithImpl<
          $Res,
          _$DSClipboardShareAccessibilityImpl
        >
    implements _$$DSClipboardShareAccessibilityImplCopyWith<$Res> {
  __$$DSClipboardShareAccessibilityImplCopyWithImpl(
    _$DSClipboardShareAccessibilityImpl _value,
    $Res Function(_$DSClipboardShareAccessibilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSClipboardShareAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? semanticRole = null,
    Object? focusable = null,
    Object? excludeSemantics = null,
    Object? shareLabel = null,
    Object? copyLabel = null,
    Object? loadingLabel = null,
    Object? disabledLabel = null,
    Object? successLabel = null,
    Object? errorLabel = null,
    Object? shareHint = null,
    Object? copyHint = null,
  }) {
    return _then(
      _$DSClipboardShareAccessibilityImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        semanticRole: null == semanticRole
            ? _value.semanticRole
            : semanticRole // ignore: cast_nullable_to_non_nullable
                  as String,
        focusable: null == focusable
            ? _value.focusable
            : focusable // ignore: cast_nullable_to_non_nullable
                  as bool,
        excludeSemantics: null == excludeSemantics
            ? _value.excludeSemantics
            : excludeSemantics // ignore: cast_nullable_to_non_nullable
                  as bool,
        shareLabel: null == shareLabel
            ? _value.shareLabel
            : shareLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        copyLabel: null == copyLabel
            ? _value.copyLabel
            : copyLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        loadingLabel: null == loadingLabel
            ? _value.loadingLabel
            : loadingLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        disabledLabel: null == disabledLabel
            ? _value.disabledLabel
            : disabledLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        successLabel: null == successLabel
            ? _value.successLabel
            : successLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        errorLabel: null == errorLabel
            ? _value.errorLabel
            : errorLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        shareHint: null == shareHint
            ? _value.shareHint
            : shareHint // ignore: cast_nullable_to_non_nullable
                  as String,
        copyHint: null == copyHint
            ? _value.copyHint
            : copyHint // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DSClipboardShareAccessibilityImpl
    implements _DSClipboardShareAccessibility {
  const _$DSClipboardShareAccessibilityImpl({
    this.enabled = true,
    this.semanticRole = 'button',
    this.focusable = true,
    this.excludeSemantics = false,
    this.shareLabel = 'Compartir contenido',
    this.copyLabel = 'Copiar al portapapeles',
    this.loadingLabel = 'Procesando',
    this.disabledLabel = 'No disponible',
    this.successLabel = 'Compartido exitosamente',
    this.errorLabel = 'Error al compartir',
    this.shareHint = 'Presiona para compartir',
    this.copyHint = 'Presiona para copiar',
  });

  /// Si la accesibilidad está habilitada
  @override
  @JsonKey()
  final bool enabled;

  /// Rol semántico del componente
  @override
  @JsonKey()
  final String semanticRole;

  /// Si es focusable
  @override
  @JsonKey()
  final bool focusable;

  /// Si excluye de la semántica
  @override
  @JsonKey()
  final bool excludeSemantics;

  /// Label para compartir
  @override
  @JsonKey()
  final String shareLabel;

  /// Label para copiar
  @override
  @JsonKey()
  final String copyLabel;

  /// Label para estado loading
  @override
  @JsonKey()
  final String loadingLabel;

  /// Label para estado disabled
  @override
  @JsonKey()
  final String disabledLabel;

  /// Label para éxito
  @override
  @JsonKey()
  final String successLabel;

  /// Label para error
  @override
  @JsonKey()
  final String errorLabel;

  /// Hint para compartir
  @override
  @JsonKey()
  final String shareHint;

  /// Hint para copiar
  @override
  @JsonKey()
  final String copyHint;

  @override
  String toString() {
    return 'DSClipboardShareAccessibility(enabled: $enabled, semanticRole: $semanticRole, focusable: $focusable, excludeSemantics: $excludeSemantics, shareLabel: $shareLabel, copyLabel: $copyLabel, loadingLabel: $loadingLabel, disabledLabel: $disabledLabel, successLabel: $successLabel, errorLabel: $errorLabel, shareHint: $shareHint, copyHint: $copyHint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSClipboardShareAccessibilityImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.semanticRole, semanticRole) ||
                other.semanticRole == semanticRole) &&
            (identical(other.focusable, focusable) ||
                other.focusable == focusable) &&
            (identical(other.excludeSemantics, excludeSemantics) ||
                other.excludeSemantics == excludeSemantics) &&
            (identical(other.shareLabel, shareLabel) ||
                other.shareLabel == shareLabel) &&
            (identical(other.copyLabel, copyLabel) ||
                other.copyLabel == copyLabel) &&
            (identical(other.loadingLabel, loadingLabel) ||
                other.loadingLabel == loadingLabel) &&
            (identical(other.disabledLabel, disabledLabel) ||
                other.disabledLabel == disabledLabel) &&
            (identical(other.successLabel, successLabel) ||
                other.successLabel == successLabel) &&
            (identical(other.errorLabel, errorLabel) ||
                other.errorLabel == errorLabel) &&
            (identical(other.shareHint, shareHint) ||
                other.shareHint == shareHint) &&
            (identical(other.copyHint, copyHint) ||
                other.copyHint == copyHint));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    semanticRole,
    focusable,
    excludeSemantics,
    shareLabel,
    copyLabel,
    loadingLabel,
    disabledLabel,
    successLabel,
    errorLabel,
    shareHint,
    copyHint,
  );

  /// Create a copy of DSClipboardShareAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSClipboardShareAccessibilityImplCopyWith<
    _$DSClipboardShareAccessibilityImpl
  >
  get copyWith =>
      __$$DSClipboardShareAccessibilityImplCopyWithImpl<
        _$DSClipboardShareAccessibilityImpl
      >(this, _$identity);
}

abstract class _DSClipboardShareAccessibility
    implements DSClipboardShareAccessibility {
  const factory _DSClipboardShareAccessibility({
    final bool enabled,
    final String semanticRole,
    final bool focusable,
    final bool excludeSemantics,
    final String shareLabel,
    final String copyLabel,
    final String loadingLabel,
    final String disabledLabel,
    final String successLabel,
    final String errorLabel,
    final String shareHint,
    final String copyHint,
  }) = _$DSClipboardShareAccessibilityImpl;

  /// Si la accesibilidad está habilitada
  @override
  bool get enabled;

  /// Rol semántico del componente
  @override
  String get semanticRole;

  /// Si es focusable
  @override
  bool get focusable;

  /// Si excluye de la semántica
  @override
  bool get excludeSemantics;

  /// Label para compartir
  @override
  String get shareLabel;

  /// Label para copiar
  @override
  String get copyLabel;

  /// Label para estado loading
  @override
  String get loadingLabel;

  /// Label para estado disabled
  @override
  String get disabledLabel;

  /// Label para éxito
  @override
  String get successLabel;

  /// Label para error
  @override
  String get errorLabel;

  /// Hint para compartir
  @override
  String get shareHint;

  /// Hint para copiar
  @override
  String get copyHint;

  /// Create a copy of DSClipboardShareAccessibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSClipboardShareAccessibilityImplCopyWith<
    _$DSClipboardShareAccessibilityImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
