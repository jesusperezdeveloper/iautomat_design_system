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

// Note: _$$CorporatePaletteConfigImplToJson removed as it's not used

const _$ContrastLevelEnumMap = {
  ContrastLevel.aa: 'aa',
  ContrastLevel.aaa: 'aaa',
};

// Note: CorporatePalette and CorporateThemeResult serialization disabled
// due to Color and ThemeData fields which are not JSON serializable

// Note: CorporatePalette and CorporateThemeResult serialization methods
// removed as they are not used and contain non-serializable Color/ThemeData fields