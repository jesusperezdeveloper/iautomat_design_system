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
  ContrastLevel.aa: 'AA',
  ContrastLevel.aaa: 'AAA',
};

_$CorporatePaletteImpl _$$CorporatePaletteImplFromJson(
        Map<String, dynamic> json) =>
    _$CorporatePaletteImpl(
      primary: Color((json['primary'] as num).toInt()),
      secondary: Color((json['secondary'] as num).toInt()),
      accent: json['accent'] == null
          ? null
          : Color((json['accent'] as num).toInt()),
      neutral: json['neutral'] == null
          ? null
          : Color((json['neutral'] as num).toInt()),
      success: json['success'] == null
          ? null
          : Color((json['success'] as num).toInt()),
      warning: json['warning'] == null
          ? null
          : Color((json['warning'] as num).toInt()),
      error: json['error'] == null
          ? null
          : Color((json['error'] as num).toInt()),
      info: json['info'] == null
          ? null
          : Color((json['info'] as num).toInt()),
      config: json['config'] == null
          ? CorporatePaletteConfig()
          : CorporatePaletteConfig.fromJson(
              json['config'] as Map<String, dynamic>),
      generatedVariants: (json['generatedVariants'] as Map<String, dynamic>?)
          ?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(int.parse(k), Color((e as num).toInt())),
            )),
      ),
      contrastValidation: (json['contrastValidation'] as Map<String, dynamic>?)
          ?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
    );

Map<String, dynamic> _$$CorporatePaletteImplToJson(
        _$CorporatePaletteImpl instance) =>
    <String, dynamic>{
      'primary': instance.primary.toARGB32(),
      'secondary': instance.secondary.toARGB32(),
      'accent': instance.accent?.toARGB32(),
      'neutral': instance.neutral?.toARGB32(),
      'success': instance.success?.toARGB32(),
      'warning': instance.warning?.toARGB32(),
      'error': instance.error?.toARGB32(),
      'info': instance.info?.toARGB32(),
      'config': instance.config.toJson(),
      'generatedVariants': instance.generatedVariants?.map((k, e) =>
          MapEntry(k, e.map((k, e) => MapEntry(k.toString(), e.toARGB32())))),
      'contrastValidation': instance.contrastValidation,
    };

_$CorporateThemeResultImpl _$$CorporateThemeResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CorporateThemeResultImpl(
      lightTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color((json['seedColor'] as num?)?.toInt() ?? 0xFF2196F3),
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color((json['seedColor'] as num?)?.toInt() ?? 0xFF2196F3),
          brightness: Brightness.dark,
        ),
      ),
      palette: CorporatePalette.fromJson(json['palette'] as Map<String, dynamic>),
      warnings: (json['warnings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generationTime: (json['generationTime'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CorporateThemeResultImplToJson(
        _$CorporateThemeResultImpl instance) =>
    <String, dynamic>{
      'palette': instance.palette.toJson(),
      'warnings': instance.warnings,
      'generationTime': instance.generationTime,
      'metadata': instance.metadata,
    };