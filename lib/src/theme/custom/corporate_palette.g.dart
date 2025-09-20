// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_palette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CorporatePaletteConfigImpl _$$CorporatePaletteConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$CorporatePaletteConfigImpl(
      brandName: json['brandName'] as String?,
      generateDarkMode: json['generateDarkMode'] as bool? ?? true,
      contrastLevel:
          $enumDecodeNullable(_$ContrastLevelEnumMap, json['contrastLevel']) ??
              ContrastLevel.aa,
      autoGenerateVariants: json['autoGenerateVariants'] as bool? ?? true,
      validateContrast: json['validateContrast'] as bool? ?? true,
      smartDarkMode: json['smartDarkMode'] as bool? ?? true,
      variantFactor: (json['variantFactor'] as num?)?.toDouble() ?? 0.15,
      preserveSaturation: json['preserveSaturation'] as bool? ?? true,
    );

Map<String, dynamic> _$$CorporatePaletteConfigImplToJson(
        _$CorporatePaletteConfigImpl instance) =>
    <String, dynamic>{
      'brandName': instance.brandName,
      'generateDarkMode': instance.generateDarkMode,
      'contrastLevel': _$ContrastLevelEnumMap[instance.contrastLevel]!,
      'autoGenerateVariants': instance.autoGenerateVariants,
      'validateContrast': instance.validateContrast,
      'smartDarkMode': instance.smartDarkMode,
      'variantFactor': instance.variantFactor,
      'preserveSaturation': instance.preserveSaturation,
    };

const _$ContrastLevelEnumMap = {
  ContrastLevel.aa: 'aa',
  ContrastLevel.aaa: 'aaa',
};

// Note: CorporatePalette and CorporateThemeResult serialization disabled
// due to Color and ThemeData fields which are not JSON serializable

_$CorporatePaletteImpl _$$CorporatePaletteImplFromJson(
        Map<String, dynamic> json) =>
    throw UnsupportedError(
        'CorporatePalette fromJson not supported - contains Color fields');

Map<String, dynamic> _$$CorporatePaletteImplToJson(
        _$CorporatePaletteImpl instance) =>
    throw UnsupportedError(
        'CorporatePalette toJson not supported - contains Color fields');

_$CorporateThemeResultImpl _$$CorporateThemeResultImplFromJson(
        Map<String, dynamic> json) =>
    throw UnsupportedError(
        'CorporateThemeResult fromJson not supported - contains ThemeData fields');

Map<String, dynamic> _$$CorporateThemeResultImplToJson(
        _$CorporateThemeResultImpl instance) =>
    throw UnsupportedError(
        'CorporateThemeResult toJson not supported - contains ThemeData fields');