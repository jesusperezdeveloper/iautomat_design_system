/// Theme barrel file - exports all theme-related components
///
/// Provides a single entry point for all theme utilities:
/// - Colors system with semantic color palette
/// - Typography system with responsive text styles
/// - Spacing system with consistent measurements
/// - App theme configuration for Material 3
/// - 100+ professional theme presets organized in 10 collections
/// - Corporate branding system for custom themes
library;

export 'colors.dart';
export 'typography.dart';
export 'spacing.dart';
export 'borders.dart';
export 'ds_theme.dart';
export 'presets/theme_preset.dart' hide ThemeCategory;
export 'presets/theme_presets.dart';
export 'presets/theme_collections.dart';
export 'custom/custom.dart' hide ContrastLevel, CorporatePaletteConfig, ValidationResult, $CorporatePaletteConfigCopyWith;
