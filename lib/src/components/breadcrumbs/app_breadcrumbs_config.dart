import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_breadcrumbs_config.freezed.dart';

@freezed
class AppBreadcrumbsConfig with _$AppBreadcrumbsConfig {
  const factory AppBreadcrumbsConfig({
    @Default(AppBreadcrumbsVariant.defaultVariant) AppBreadcrumbsVariant variant,
    @Default(AppBreadcrumbsState.defaultState) AppBreadcrumbsState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default([]) List<AppBreadcrumbItem> items,
    ValueChanged<AppBreadcrumbItem>? onTap,
    AppBreadcrumbSeparator? separator,
    @Default(3) int maxVisibleItems,
    @Default(true) bool showHome,
    AppBreadcrumbsColors? colors,
    AppBreadcrumbsTypography? typography,
    AppBreadcrumbsSpacing? spacing,
    AppBreadcrumbsElevation? elevation,
    AppBreadcrumbsBehavior? behavior,
    AppBreadcrumbsAnimation? animation,
  }) = _AppBreadcrumbsConfig;
}

@freezed
class AppBreadcrumbItem with _$AppBreadcrumbItem {
  const factory AppBreadcrumbItem({
    required String id,
    required String title,
    String? subtitle,
    Widget? icon,
    String? route,
    String? tooltip,
    @Default(false) bool disabled,
    @Default(AppBreadcrumbType.text) AppBreadcrumbType type,
    VoidCallback? onTap,
    Map<String, dynamic>? metadata,
  }) = _AppBreadcrumbItem;
}

@freezed
class AppBreadcrumbSeparator with _$AppBreadcrumbSeparator {
  const factory AppBreadcrumbSeparator({
    @Default(AppBreadcrumbSeparatorType.chevron) AppBreadcrumbSeparatorType type,
    Widget? custom,
    String? text,
    IconData? icon,
    Color? color,
    @Default(16.0) double size,
  }) = _AppBreadcrumbSeparator;
}

@freezed
class AppBreadcrumbsColors with _$AppBreadcrumbsColors {
  const factory AppBreadcrumbsColors({
    Color? backgroundColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? disabledTextColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? focusColor,
    Color? separatorColor,
    Color? iconColor,
    Color? borderColor,
    Color? shadowColor,
  }) = _AppBreadcrumbsColors;
}

@freezed
class AppBreadcrumbsTypography with _$AppBreadcrumbsTypography {
  const factory AppBreadcrumbsTypography({
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
    TextStyle? disabledTextStyle,
    TextStyle? subtitleStyle,
    @Default(1.0) double textScale,
    @Default(true) bool responsive,
    @Default(TextOverflow.ellipsis) TextOverflow overflow,
    @Default(1) int maxLines,
  }) = _AppBreadcrumbsTypography;
}

@freezed
class AppBreadcrumbsSpacing with _$AppBreadcrumbsSpacing {
  const factory AppBreadcrumbsSpacing({
    @Default(8.0) double itemPadding,
    @Default(4.0) double separatorSpacing,
    @Default(16.0) double containerPadding,
    @Default(4.0) double iconSpacing,
    @Default(2.0) double verticalSpacing,
    @Default(48.0) double minHeight,
    @Default(true) bool adaptive,
  }) = _AppBreadcrumbsSpacing;
}

@freezed
class AppBreadcrumbsElevation with _$AppBreadcrumbsElevation {
  const factory AppBreadcrumbsElevation({
    @Default(0.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(4.0) double pressedElevation,
    @Default(1.0) double focusedElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppBreadcrumbsElevation;
}

@freezed
class AppBreadcrumbsBehavior with _$AppBreadcrumbsBehavior {
  const factory AppBreadcrumbsBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool showTooltips,
    @Default(true) bool allowNavigation,
    @Default(AppBreadcrumbsCollapseMode.ellipsis) AppBreadcrumbsCollapseMode collapseMode,
    @Default(true) bool showCurrentAsText,
    @Default(true) bool enableKeyboardNavigation,
    @Default(300) int animationDuration,
  }) = _AppBreadcrumbsBehavior;
}

@freezed
class AppBreadcrumbsAnimation with _$AppBreadcrumbsAnimation {
  const factory AppBreadcrumbsAnimation({
    @Default(AppBreadcrumbsAnimationType.fade) AppBreadcrumbsAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableCollapseAnimation,
  }) = _AppBreadcrumbsAnimation;
}

enum AppBreadcrumbsVariant {
  defaultVariant,
  collapsing,
}

enum AppBreadcrumbsState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppBreadcrumbType {
  text,
  icon,
  textWithIcon,
  custom,
}

enum AppBreadcrumbSeparatorType {
  chevron,
  slash,
  arrow,
  dot,
  custom,
}

enum AppBreadcrumbsCollapseMode {
  ellipsis,
  dropdown,
  hidden,
}

enum AppBreadcrumbsAnimationType {
  none,
  fade,
  slide,
  scale,
}

extension AppBreadcrumbsVariantExtension on AppBreadcrumbsVariant {
  String get displayName {
    switch (this) {
      case AppBreadcrumbsVariant.defaultVariant:
        return 'Default';
      case AppBreadcrumbsVariant.collapsing:
        return 'Collapsing';
    }
  }

  String get description {
    switch (this) {
      case AppBreadcrumbsVariant.defaultVariant:
        return 'Navegación de rutas completa y visible';
      case AppBreadcrumbsVariant.collapsing:
        return 'Navegación que colapsa elementos intermedios';
    }
  }

  bool get isCollapsible {
    switch (this) {
      case AppBreadcrumbsVariant.defaultVariant:
        return false;
      case AppBreadcrumbsVariant.collapsing:
        return true;
    }
  }

  int get defaultMaxItems {
    switch (this) {
      case AppBreadcrumbsVariant.defaultVariant:
        return 10;
      case AppBreadcrumbsVariant.collapsing:
        return 3;
    }
  }
}

extension AppBreadcrumbsStateExtension on AppBreadcrumbsState {
  String get displayName {
    switch (this) {
      case AppBreadcrumbsState.defaultState:
        return 'Default';
      case AppBreadcrumbsState.hover:
        return 'Hover';
      case AppBreadcrumbsState.pressed:
        return 'Pressed';
      case AppBreadcrumbsState.focus:
        return 'Focus';
      case AppBreadcrumbsState.selected:
        return 'Selected';
      case AppBreadcrumbsState.disabled:
        return 'Disabled';
      case AppBreadcrumbsState.loading:
        return 'Loading';
      case AppBreadcrumbsState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppBreadcrumbsState.defaultState:
      case AppBreadcrumbsState.hover:
      case AppBreadcrumbsState.pressed:
      case AppBreadcrumbsState.focus:
      case AppBreadcrumbsState.selected:
        return true;
      case AppBreadcrumbsState.disabled:
      case AppBreadcrumbsState.loading:
      case AppBreadcrumbsState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppBreadcrumbsState.defaultState:
      case AppBreadcrumbsState.hover:
      case AppBreadcrumbsState.pressed:
      case AppBreadcrumbsState.focus:
      case AppBreadcrumbsState.selected:
        return 1.0;
      case AppBreadcrumbsState.disabled:
        return 0.6;
      case AppBreadcrumbsState.loading:
        return 0.8;
      case AppBreadcrumbsState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppBreadcrumbsState.loading;
  }

  bool get showsSkeleton {
    return this == AppBreadcrumbsState.skeleton;
  }
}

extension AppBreadcrumbTypeExtension on AppBreadcrumbType {
  String get displayName {
    switch (this) {
      case AppBreadcrumbType.text:
        return 'Text Only';
      case AppBreadcrumbType.icon:
        return 'Icon Only';
      case AppBreadcrumbType.textWithIcon:
        return 'Text with Icon';
      case AppBreadcrumbType.custom:
        return 'Custom';
    }
  }

  bool get hasText {
    switch (this) {
      case AppBreadcrumbType.text:
      case AppBreadcrumbType.textWithIcon:
        return true;
      case AppBreadcrumbType.icon:
      case AppBreadcrumbType.custom:
        return false;
    }
  }

  bool get hasIcon {
    switch (this) {
      case AppBreadcrumbType.icon:
      case AppBreadcrumbType.textWithIcon:
        return true;
      case AppBreadcrumbType.text:
      case AppBreadcrumbType.custom:
        return false;
    }
  }

  bool get isCustom {
    return this == AppBreadcrumbType.custom;
  }
}

extension AppBreadcrumbSeparatorTypeExtension on AppBreadcrumbSeparatorType {
  String get displayName {
    switch (this) {
      case AppBreadcrumbSeparatorType.chevron:
        return 'Chevron';
      case AppBreadcrumbSeparatorType.slash:
        return 'Slash';
      case AppBreadcrumbSeparatorType.arrow:
        return 'Arrow';
      case AppBreadcrumbSeparatorType.dot:
        return 'Dot';
      case AppBreadcrumbSeparatorType.custom:
        return 'Custom';
    }
  }

  IconData get defaultIcon {
    switch (this) {
      case AppBreadcrumbSeparatorType.chevron:
        return Icons.chevron_right;
      case AppBreadcrumbSeparatorType.slash:
        return Icons.keyboard_arrow_right;
      case AppBreadcrumbSeparatorType.arrow:
        return Icons.arrow_forward_ios;
      case AppBreadcrumbSeparatorType.dot:
        return Icons.circle;
      case AppBreadcrumbSeparatorType.custom:
        return Icons.more_horiz;
    }
  }

  String get defaultText {
    switch (this) {
      case AppBreadcrumbSeparatorType.chevron:
        return '>';
      case AppBreadcrumbSeparatorType.slash:
        return '/';
      case AppBreadcrumbSeparatorType.arrow:
        return '→';
      case AppBreadcrumbSeparatorType.dot:
        return '•';
      case AppBreadcrumbSeparatorType.custom:
        return '';
    }
  }
}

extension AppBreadcrumbsCollapseModeExtension on AppBreadcrumbsCollapseMode {
  String get displayName {
    switch (this) {
      case AppBreadcrumbsCollapseMode.ellipsis:
        return 'Ellipsis';
      case AppBreadcrumbsCollapseMode.dropdown:
        return 'Dropdown';
      case AppBreadcrumbsCollapseMode.hidden:
        return 'Hidden';
    }
  }

  String get description {
    switch (this) {
      case AppBreadcrumbsCollapseMode.ellipsis:
        return 'Mostrar "..." para elementos ocultos';
      case AppBreadcrumbsCollapseMode.dropdown:
        return 'Mostrar dropdown con elementos ocultos';
      case AppBreadcrumbsCollapseMode.hidden:
        return 'Ocultar elementos intermedios completamente';
    }
  }

  bool get showsCollapsedIndicator {
    switch (this) {
      case AppBreadcrumbsCollapseMode.ellipsis:
      case AppBreadcrumbsCollapseMode.dropdown:
        return true;
      case AppBreadcrumbsCollapseMode.hidden:
        return false;
    }
  }

  bool get isInteractive {
    return this == AppBreadcrumbsCollapseMode.dropdown;
  }
}