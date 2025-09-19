import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chip_config.freezed.dart';

/// Enums and types for DSChip

/// Chip variants based on Material Design specifications
enum DSChipVariant {
  /// Input chips represent complex pieces of information in compact form
  input,

  /// Filter chips use tags or descriptive words to filter content
  filter,

  /// Choice chips allow selection of a single option from a set of options
  choice,

  /// Assist chips help users take action or access information
  assist,
}

/// Chip states
enum DSChipState {
  /// Default state
  defaultState,

  /// Hover state (Web/Desktop)
  hover,

  /// Pressed state
  pressed,

  /// Focus state
  focus,

  /// Selected state
  selected,

  /// Disabled state
  disabled,

  /// Loading state
  loading,

  /// Skeleton loading state
  skeleton,
}

/// Chip size variants
enum DSChipSize {
  /// Small chip
  small,

  /// Medium chip (default)
  medium,

  /// Large chip
  large,
}

/// Chip shape variants
enum DSChipShape {
  /// Rounded rectangle
  rounded,

  /// Stadium (fully rounded)
  stadium,

  /// Circular (for icon-only chips)
  circular,
}

/// Configuration model for DSChip
@freezed
class DSChipConfig with _$DSChipConfig {
  const factory DSChipConfig({
    // Animation configuration
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,

    // Size configuration
    @Default(DSChipSize.medium) DSChipSize size,
    @Default(DSChipShape.rounded) DSChipShape shape,

    // Spacing configuration
    @Default(EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0))
    EdgeInsets padding,
    @Default(EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0))
    EdgeInsets labelPadding,
    @Default(4.0) double spacing,
    @Default(8.0) double avatarSpacing,
    @Default(4.0) double iconSpacing,

    // Border configuration
    @Default(BorderRadius.all(Radius.circular(8.0))) BorderRadius borderRadius,
    @Default(1.0) double borderWidth,
    @Default(2.0) double focusBorderWidth,

    // Color configuration
    DSChipColors? colors,

    // Typography configuration
    DSChipTypography? typography,

    // Icons configuration
    DSChipIcons? icons,

    // Size configuration
    DSChipSizes? sizes,

    // Avatar configuration
    @Default(Size(24, 24)) Size avatarSize,
    @Default(Size(18, 18)) Size iconSize,
    @Default(Size(18, 18)) Size deleteIconSize,

    // Elevation configuration
    @Default(0.0) double elevation,
    @Default(2.0) double hoverElevation,
    @Default(4.0) double pressedElevation,
    @Default(1.0) double disabledElevation,

    // Interactive configuration
    @Default(true) bool enableFeedback,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableSoundEffects,

    // Accessibility configuration
    @Default('Chip') String accessibilityLabel,
    @Default('Delete') String deleteButtonLabel,

    // Platform-specific configuration
    @Default(true) bool adaptToPlatform,

    // Loading configuration
    @Default(true) bool showLoadingIndicator,
    @Default(Size(14, 14)) Size loadingIndicatorSize,

    // RTL configuration
    @Default(true) bool supportRTL,

    // Selection configuration
    @Default(true) bool showCheckmark,
    @Default(Size(18, 18)) Size checkmarkSize,

    // Deletion configuration
    @Default(true) bool showDeleteIcon,
    @Default(Duration(milliseconds: 300)) Duration deleteAnimationDuration,
  }) = _DSChipConfig;

  const DSChipConfig._();

  /// Create configuration from theme
  factory DSChipConfig.fromTheme(ThemeData theme) {
    return DSChipConfig(
      colors: DSChipColors.fromTheme(theme),
      typography: DSChipTypography.fromTheme(theme),
      icons: const DSChipIcons(),
      sizes: const DSChipSizes(),
    );
  }
}

/// Color configuration for DSChip
@freezed
class DSChipColors with _$DSChipColors {
  const factory DSChipColors({
    // Background colors
    @Default(Color(0xFFF5F5F5)) Color backgroundColor,
    @Default(Color(0xFFE3F2FD)) Color hoverBackgroundColor,
    @Default(Color(0xFFBBDEFB)) Color pressedBackgroundColor,
    @Default(Color(0xFFE3F2FD)) Color focusBackgroundColor,
    @Default(Color(0xFF2196F3)) Color selectedBackgroundColor,
    @Default(Color(0xFFE0E0E0)) Color disabledBackgroundColor,
    @Default(Color(0xFFF5F5F5)) Color loadingBackgroundColor,

    // Border colors
    @Default(Color(0xFFE0E0E0)) Color borderColor,
    @Default(Color(0xFF1976D2)) Color hoverBorderColor,
    @Default(Color(0xFF1565C0)) Color pressedBorderColor,
    @Default(Color(0xFF1976D2)) Color focusBorderColor,
    @Default(Color(0xFF1976D2)) Color selectedBorderColor,
    @Default(Color(0xFFBDBDBD)) Color disabledBorderColor,
    @Default(Color(0xFFE0E0E0)) Color loadingBorderColor,

    // Text colors
    @Default(Color(0xFF212121)) Color textColor,
    @Default(Color(0xFF1976D2)) Color hoverTextColor,
    @Default(Color(0xFF1565C0)) Color pressedTextColor,
    @Default(Color(0xFF1976D2)) Color focusTextColor,
    @Default(Color(0xFFFFFFFF)) Color selectedTextColor,
    @Default(Color(0xFF9E9E9E)) Color disabledTextColor,
    @Default(Color(0xFF757575)) Color loadingTextColor,

    // Icon colors
    @Default(Color(0xFF757575)) Color iconColor,
    @Default(Color(0xFF1976D2)) Color hoverIconColor,
    @Default(Color(0xFF1565C0)) Color pressedIconColor,
    @Default(Color(0xFF1976D2)) Color focusIconColor,
    @Default(Color(0xFFFFFFFF)) Color selectedIconColor,
    @Default(Color(0xFFBDBDBD)) Color disabledIconColor,
    @Default(Color(0xFF757575)) Color loadingIconColor,

    // Delete icon colors
    @Default(Color(0xFF757575)) Color deleteIconColor,
    @Default(Color(0xFFF44336)) Color deleteIconHoverColor,
    @Default(Color(0xFFD32F2F)) Color deleteIconPressedColor,
    @Default(Color(0xFFBDBDBD)) Color deleteIconDisabledColor,

    // Checkmark colors
    @Default(Color(0xFF4CAF50)) Color checkmarkColor,
    @Default(Color(0xFFFFFFFF)) Color selectedCheckmarkColor,

    // Avatar colors
    @Default(Color(0xFF2196F3)) Color avatarBackgroundColor,
    @Default(Color(0xFFFFFFFF)) Color avatarTextColor,

    // Shadow colors
    @Default(Color(0x1F000000)) Color shadowColor,
    @Default(Color(0x24000000)) Color hoverShadowColor,
    @Default(Color(0x3D000000)) Color pressedShadowColor,

    // Skeleton colors
    @Default(Color(0xFFE0E0E0)) Color skeletonBaseColor,
    @Default(Color(0xFFF5F5F5)) Color skeletonHighlightColor,

    // Loading colors
    @Default(Color(0xFF1976D2)) Color loadingIndicatorColor,

    // Surface colors for variants
    @Default(Color(0xFFF5F5F5)) Color inputSurfaceColor,
    @Default(Color(0xFFE8F5E8)) Color filterSurfaceColor,
    @Default(Color(0xFFE3F2FD)) Color choiceSurfaceColor,
    @Default(Color(0xFFFFF3E0)) Color assistSurfaceColor,
  }) = _AppChipColors;

  const DSChipColors._();

  factory DSChipColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return DSChipColors(
      backgroundColor: colorScheme.surface,
      hoverBackgroundColor: colorScheme.primary.withValues(alpha: 0.08),
      pressedBackgroundColor: colorScheme.primary.withValues(alpha: 0.12),
      focusBackgroundColor: colorScheme.primary.withValues(alpha: 0.08),
      selectedBackgroundColor: colorScheme.primary,
      disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
      loadingBackgroundColor: colorScheme.surface,
      borderColor: colorScheme.outline,
      hoverBorderColor: colorScheme.primary,
      pressedBorderColor: colorScheme.primary,
      focusBorderColor: colorScheme.primary,
      selectedBorderColor: colorScheme.primary,
      disabledBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      loadingBorderColor: colorScheme.outline,
      textColor: colorScheme.onSurface,
      hoverTextColor: colorScheme.primary,
      pressedTextColor: colorScheme.primary,
      focusTextColor: colorScheme.primary,
      selectedTextColor: colorScheme.onPrimary,
      disabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      loadingTextColor: colorScheme.onSurfaceVariant,
      iconColor: colorScheme.onSurfaceVariant,
      hoverIconColor: colorScheme.primary,
      pressedIconColor: colorScheme.primary,
      focusIconColor: colorScheme.primary,
      selectedIconColor: colorScheme.onPrimary,
      disabledIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      loadingIconColor: colorScheme.onSurfaceVariant,
      deleteIconColor: colorScheme.onSurfaceVariant,
      deleteIconHoverColor: colorScheme.error,
      deleteIconPressedColor: colorScheme.error,
      deleteIconDisabledColor: colorScheme.onSurface.withValues(alpha: 0.38),
      checkmarkColor: colorScheme.primary,
      selectedCheckmarkColor: colorScheme.onPrimary,
      avatarBackgroundColor: colorScheme.primary,
      avatarTextColor: colorScheme.onPrimary,
      shadowColor: colorScheme.shadow,
      hoverShadowColor: colorScheme.shadow,
      pressedShadowColor: colorScheme.shadow,
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surface,
      loadingIndicatorColor: colorScheme.primary,
      inputSurfaceColor: colorScheme.surface,
      filterSurfaceColor: colorScheme.secondaryContainer,
      choiceSurfaceColor: colorScheme.primaryContainer,
      assistSurfaceColor: colorScheme.tertiaryContainer,
    );
  }
}

/// Typography configuration for DSChip
@freezed
class DSChipTypography with _$DSChipTypography {
  const factory DSChipTypography({
    // Label styles
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
    TextStyle labelStyle,
    @Default(TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
    TextStyle smallLabelStyle,
    @Default(TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
    TextStyle largeLabelStyle,

    // Avatar text styles
    @Default(TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
    TextStyle avatarTextStyle,
    @Default(TextStyle(fontSize: 10, fontWeight: FontWeight.w600))
    TextStyle smallAvatarTextStyle,
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
    TextStyle largeAvatarTextStyle,

    // Loading text styles
    @Default(TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
    TextStyle loadingStyle,
  }) = _AppChipTypography;

  const DSChipTypography._();

  factory DSChipTypography.fromTheme(ThemeData theme) {
    final textTheme = theme.textTheme;

    return DSChipTypography(
      labelStyle: textTheme.labelLarge ?? const TextStyle(),
      smallLabelStyle: textTheme.labelMedium ?? const TextStyle(),
      largeLabelStyle: textTheme.titleSmall ?? const TextStyle(),
      avatarTextStyle: textTheme.labelMedium ?? const TextStyle(),
      smallAvatarTextStyle: textTheme.labelSmall ?? const TextStyle(),
      largeAvatarTextStyle: textTheme.labelLarge ?? const TextStyle(),
      loadingStyle: textTheme.bodyMedium ?? const TextStyle(),
    );
  }
}

/// Icon configuration for DSChip
@freezed
class DSChipIcons with _$DSChipIcons {
  const factory DSChipIcons({
    // Default icons for variants
    @Default(Icons.add) IconData inputIcon,
    @Default(Icons.filter_list) IconData filterIcon,
    @Default(Icons.radio_button_unchecked) IconData choiceIcon,
    @Default(Icons.assistant) IconData assistIcon,

    // Delete icon
    @Default(Icons.close) IconData deleteIcon,
    @Default(Icons.cancel) IconData cancelIcon,

    // Checkmark icons
    @Default(Icons.check) IconData checkIcon,
    @Default(Icons.check_circle) IconData checkCircleIcon,
    @Default(Icons.done) IconData doneIcon,

    // Loading icon
    @Default(Icons.hourglass_empty) IconData loadingIcon,

    // State icons
    @Default(Icons.radio_button_checked) IconData selectedIcon,
    @Default(Icons.radio_button_unchecked) IconData unselectedIcon,

    // Avatar fallback icon
    @Default(Icons.person) IconData avatarIcon,

    // Action icons
    @Default(Icons.edit) IconData editIcon,
    @Default(Icons.more_horiz) IconData moreIcon,
  }) = _AppChipIcons;
}

/// Size configuration for DSChip
@freezed
class DSChipSizes with _$DSChipSizes {
  const factory DSChipSizes({
    // Height configurations
    @Default(32.0) double smallHeight,
    @Default(40.0) double mediumHeight,
    @Default(48.0) double largeHeight,

    // Minimum width configurations
    @Default(64.0) double smallMinWidth,
    @Default(80.0) double mediumMinWidth,
    @Default(96.0) double largeMinWidth,

    // Icon sizes
    @Default(Size(16, 16)) Size smallIconSize,
    @Default(Size(18, 18)) Size mediumIconSize,
    @Default(Size(20, 20)) Size largeIconSize,

    // Avatar sizes
    @Default(Size(20, 20)) Size smallAvatarSize,
    @Default(Size(24, 24)) Size mediumAvatarSize,
    @Default(Size(28, 28)) Size largeAvatarSize,

    // Delete icon sizes
    @Default(Size(16, 16)) Size smallDeleteIconSize,
    @Default(Size(18, 18)) Size mediumDeleteIconSize,
    @Default(Size(20, 20)) Size largeDeleteIconSize,

    // Checkmark sizes
    @Default(Size(16, 16)) Size smallCheckmarkSize,
    @Default(Size(18, 18)) Size mediumCheckmarkSize,
    @Default(Size(20, 20)) Size largeCheckmarkSize,

    // Padding configurations
    @Default(EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0))
    EdgeInsets smallPadding,
    @Default(EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0))
    EdgeInsets mediumPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0))
    EdgeInsets largePadding,

    // Border radius configurations
    @Default(BorderRadius.all(Radius.circular(6.0)))
    BorderRadius smallBorderRadius,
    @Default(BorderRadius.all(Radius.circular(8.0)))
    BorderRadius mediumBorderRadius,
    @Default(BorderRadius.all(Radius.circular(10.0)))
    BorderRadius largeBorderRadius,
  }) = _AppChipSizes;
}

/// Chip data model for complex chip configurations
@freezed
class DSChipData with _$DSChipData {
  const factory DSChipData({
    required String label,
    String? id,
    Object? value,
    String? tooltip,
    String? avatarText,
    String? avatarUrl,
    IconData? icon,
    Color? color,
    bool? selected,
    bool? deletable,
    bool? enabled,
    Map<String, dynamic>? metadata,
  }) = _AppChipData;

  const DSChipData._();

  /// Get display text for avatar
  String get avatarDisplayText {
    if (avatarText != null && avatarText!.isNotEmpty) {
      return avatarText!;
    }
    return label.isNotEmpty ? label[0].toUpperCase() : '';
  }

  /// Check if chip has avatar
  bool get hasAvatar => avatarText != null || avatarUrl != null;

  /// Check if chip has icon
  bool get hasIcon => icon != null;

  /// Check if chip is deletable
  bool get isDeletable => deletable ?? false;

  /// Check if chip is enabled
  bool get isEnabled => enabled ?? true;

  /// Check if chip is selected
  bool get isSelected => selected ?? false;
}

/// Chip utilities and helpers
class DSChipUtils {
  /// Generate chip data from a list of strings
  static List<DSChipData> fromStringList(List<String> labels) {
    return labels
        .map((label) => DSChipData(
              label: label,
              id: label.toLowerCase().replaceAll(' ', '_'),
            ))
        .toList();
  }

  /// Generate chip data with avatars from a list of strings
  static List<DSChipData> withAvatars(List<String> labels) {
    return labels
        .map((label) => DSChipData(
              label: label,
              id: label.toLowerCase().replaceAll(' ', '_'),
              avatarText: label.isNotEmpty ? label[0].toUpperCase() : '',
            ))
        .toList();
  }

  /// Generate chip data with icons from a map
  static List<DSChipData> withIcons(Map<String, IconData> labelIconMap) {
    return labelIconMap.entries
        .map((entry) => DSChipData(
              label: entry.key,
              id: entry.key.toLowerCase().replaceAll(' ', '_'),
              icon: entry.value,
            ))
        .toList();
  }

  /// Generate deletable chips from a list of strings
  static List<DSChipData> deletable(List<String> labels) {
    return labels
        .map((label) => DSChipData(
              label: label,
              id: label.toLowerCase().replaceAll(' ', '_'),
              deletable: true,
            ))
        .toList();
  }

  /// Get appropriate colors for chip variant
  static DSChipColors getVariantColors(
    DSChipVariant variant,
    DSChipColors baseColors,
  ) {
    switch (variant) {
      case DSChipVariant.input:
        return baseColors.copyWith(
          backgroundColor: baseColors.inputSurfaceColor,
        );
      case DSChipVariant.filter:
        return baseColors.copyWith(
          backgroundColor: baseColors.filterSurfaceColor,
        );
      case DSChipVariant.choice:
        return baseColors.copyWith(
          backgroundColor: baseColors.choiceSurfaceColor,
        );
      case DSChipVariant.assist:
        return baseColors.copyWith(
          backgroundColor: baseColors.assistSurfaceColor,
        );
    }
  }

  /// Get size configuration based on chip size
  static double getHeight(DSChipSize size, DSChipSizes sizes) {
    switch (size) {
      case DSChipSize.small:
        return sizes.smallHeight;
      case DSChipSize.medium:
        return sizes.mediumHeight;
      case DSChipSize.large:
        return sizes.largeHeight;
    }
  }

  /// Get padding configuration based on chip size
  static EdgeInsets getPadding(DSChipSize size, DSChipSizes sizes) {
    switch (size) {
      case DSChipSize.small:
        return sizes.smallPadding;
      case DSChipSize.medium:
        return sizes.mediumPadding;
      case DSChipSize.large:
        return sizes.largePadding;
    }
  }

  /// Get border radius based on chip size and shape
  static BorderRadius getBorderRadius(
    DSChipSize size,
    DSChipShape shape,
    DSChipSizes sizes,
  ) {
    switch (shape) {
      case DSChipShape.rounded:
        switch (size) {
          case DSChipSize.small:
            return sizes.smallBorderRadius;
          case DSChipSize.medium:
            return sizes.mediumBorderRadius;
          case DSChipSize.large:
            return sizes.largeBorderRadius;
        }
      case DSChipShape.stadium:
        final height = getHeight(size, sizes);
        return BorderRadius.circular(height / 2);
      case DSChipShape.circular:
        final height = getHeight(size, sizes);
        return BorderRadius.circular(height / 2);
    }
  }

  /// Get icon size based on chip size
  static Size getIconSize(DSChipSize size, DSChipSizes sizes) {
    switch (size) {
      case DSChipSize.small:
        return sizes.smallIconSize;
      case DSChipSize.medium:
        return sizes.mediumIconSize;
      case DSChipSize.large:
        return sizes.largeIconSize;
    }
  }

  /// Get avatar size based on chip size
  static Size getAvatarSize(DSChipSize size, DSChipSizes sizes) {
    switch (size) {
      case DSChipSize.small:
        return sizes.smallAvatarSize;
      case DSChipSize.medium:
        return sizes.mediumAvatarSize;
      case DSChipSize.large:
        return sizes.largeAvatarSize;
    }
  }

  /// Get text style based on chip size
  static TextStyle getTextStyle(
      DSChipSize size, DSChipTypography typography) {
    switch (size) {
      case DSChipSize.small:
        return typography.smallLabelStyle;
      case DSChipSize.medium:
        return typography.labelStyle;
      case DSChipSize.large:
        return typography.largeLabelStyle;
    }
  }

  /// Get avatar text style based on chip size
  static TextStyle getAvatarTextStyle(
      DSChipSize size, DSChipTypography typography) {
    switch (size) {
      case DSChipSize.small:
        return typography.smallAvatarTextStyle;
      case DSChipSize.medium:
        return typography.avatarTextStyle;
      case DSChipSize.large:
        return typography.largeAvatarTextStyle;
    }
  }

  /// Check if platform supports advanced interactions
  static bool get supportsAdvancedInteractions {
    return !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
  }

  /// Check if platform supports hover interactions
  static bool get supportsHover {
    return kIsWeb ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux;
  }
}
