import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_breadcrumbs_config.freezed.dart';

@freezed
class DSBreadcrumbsConfig with _$DSBreadcrumbsConfig {
  const factory DSBreadcrumbsConfig({
    @Default(DSBreadcrumbsVariant.defaultVariant)
    DSBreadcrumbsVariant variant,
    @Default(DSBreadcrumbsState.defaultState) DSBreadcrumbsState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default([]) List<DSBreadcrumbItem> items,
    ValueChanged<DSBreadcrumbItem>? onTap,
    DSBreadcrumbSeparator? separator,
    @Default(3) int maxVisibleItems,
    @Default(true) bool showHome,
    DSBreadcrumbsColors? colors,
    DSBreadcrumbsTypography? typography,
    DSBreadcrumbsSpacing? spacing,
    DSBreadcrumbsElevation? elevation,
    DSBreadcrumbsBehavior? behavior,
    DSBreadcrumbsAnimation? animation,
  }) = _DSBreadcrumbsConfig;
}

@freezed
class DSBreadcrumbItem with _$DSBreadcrumbItem {
  const factory DSBreadcrumbItem({
    required String id,
    required String title,
    String? subtitle,
    Widget? icon,
    String? route,
    String? tooltip,
    @Default(false) bool disabled,
    @Default(DSBreadcrumbType.text) DSBreadcrumbType type,
    VoidCallback? onTap,
    Map<String, dynamic>? metadata,
  }) = _AppBreadcrumbItem;
}

@freezed
class DSBreadcrumbSeparator with _$DSBreadcrumbSeparator {
  const factory DSBreadcrumbSeparator({
    @Default(DSBreadcrumbSeparatorType.chevron)
    DSBreadcrumbSeparatorType type,
    Widget? custom,
    String? text,
    IconData? icon,
    Color? color,
    @Default(16.0) double size,
  }) = _AppBreadcrumbSeparator;
}

@freezed
class DSBreadcrumbsColors with _$DSBreadcrumbsColors {
  const factory DSBreadcrumbsColors({
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
class DSBreadcrumbsTypography with _$DSBreadcrumbsTypography {
  const factory DSBreadcrumbsTypography({
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
class DSBreadcrumbsSpacing with _$DSBreadcrumbsSpacing {
  const factory DSBreadcrumbsSpacing({
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
class DSBreadcrumbsElevation with _$DSBreadcrumbsElevation {
  const factory DSBreadcrumbsElevation({
    @Default(0.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(4.0) double pressedElevation,
    @Default(1.0) double focusedElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppBreadcrumbsElevation;
}

@freezed
class DSBreadcrumbsBehavior with _$DSBreadcrumbsBehavior {
  const factory DSBreadcrumbsBehavior({
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool showTooltips,
    @Default(true) bool allowNavigation,
    @Default(DSBreadcrumbsCollapseMode.ellipsis)
    DSBreadcrumbsCollapseMode collapseMode,
    @Default(true) bool showCurrentAsText,
    @Default(true) bool enableKeyboardNavigation,
    @Default(300) int animationDuration,
  }) = _AppBreadcrumbsBehavior;
}

@freezed
class DSBreadcrumbsAnimation with _$DSBreadcrumbsAnimation {
  const factory DSBreadcrumbsAnimation({
    @Default(DSBreadcrumbsAnimationType.fade) DSBreadcrumbsAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableCollapseAnimation,
  }) = _AppBreadcrumbsAnimation;
}

enum DSBreadcrumbsVariant {
  defaultVariant,
  collapsing,
}

enum DSBreadcrumbsState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSBreadcrumbType {
  text,
  icon,
  textWithIcon,
  custom,
}

enum DSBreadcrumbSeparatorType {
  chevron,
  slash,
  arrow,
  dot,
  custom,
}

enum DSBreadcrumbsCollapseMode {
  ellipsis,
  dropdown,
  hidden,
}

enum DSBreadcrumbsAnimationType {
  none,
  fade,
  slide,
  scale,
}

extension DSBreadcrumbsVariantExtension on DSBreadcrumbsVariant {
  String get displayName {
    switch (this) {
      case DSBreadcrumbsVariant.defaultVariant:
        return 'Default';
      case DSBreadcrumbsVariant.collapsing:
        return 'Collapsing';
    }
  }

  String get description {
    switch (this) {
      case DSBreadcrumbsVariant.defaultVariant:
        return 'Navegación de rutas completa y visible';
      case DSBreadcrumbsVariant.collapsing:
        return 'Navegación que colapsa elementos intermedios';
    }
  }

  bool get isCollapsible {
    switch (this) {
      case DSBreadcrumbsVariant.defaultVariant:
        return false;
      case DSBreadcrumbsVariant.collapsing:
        return true;
    }
  }

  int get defaultMaxItems {
    switch (this) {
      case DSBreadcrumbsVariant.defaultVariant:
        return 10;
      case DSBreadcrumbsVariant.collapsing:
        return 3;
    }
  }
}

extension DSBreadcrumbsStateExtension on DSBreadcrumbsState {
  String get displayName {
    switch (this) {
      case DSBreadcrumbsState.defaultState:
        return 'Default';
      case DSBreadcrumbsState.hover:
        return 'Hover';
      case DSBreadcrumbsState.pressed:
        return 'Pressed';
      case DSBreadcrumbsState.focus:
        return 'Focus';
      case DSBreadcrumbsState.selected:
        return 'Selected';
      case DSBreadcrumbsState.disabled:
        return 'Disabled';
      case DSBreadcrumbsState.loading:
        return 'Loading';
      case DSBreadcrumbsState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSBreadcrumbsState.defaultState:
      case DSBreadcrumbsState.hover:
      case DSBreadcrumbsState.pressed:
      case DSBreadcrumbsState.focus:
      case DSBreadcrumbsState.selected:
        return true;
      case DSBreadcrumbsState.disabled:
      case DSBreadcrumbsState.loading:
      case DSBreadcrumbsState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSBreadcrumbsState.defaultState:
      case DSBreadcrumbsState.hover:
      case DSBreadcrumbsState.pressed:
      case DSBreadcrumbsState.focus:
      case DSBreadcrumbsState.selected:
        return 1.0;
      case DSBreadcrumbsState.disabled:
        return 0.6;
      case DSBreadcrumbsState.loading:
        return 0.8;
      case DSBreadcrumbsState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSBreadcrumbsState.loading;
  }

  bool get showsSkeleton {
    return this == DSBreadcrumbsState.skeleton;
  }
}

extension DSBreadcrumbTypeExtension on DSBreadcrumbType {
  String get displayName {
    switch (this) {
      case DSBreadcrumbType.text:
        return 'Text Only';
      case DSBreadcrumbType.icon:
        return 'Icon Only';
      case DSBreadcrumbType.textWithIcon:
        return 'Text with Icon';
      case DSBreadcrumbType.custom:
        return 'Custom';
    }
  }

  bool get hasText {
    switch (this) {
      case DSBreadcrumbType.text:
      case DSBreadcrumbType.textWithIcon:
        return true;
      case DSBreadcrumbType.icon:
      case DSBreadcrumbType.custom:
        return false;
    }
  }

  bool get hasIcon {
    switch (this) {
      case DSBreadcrumbType.icon:
      case DSBreadcrumbType.textWithIcon:
        return true;
      case DSBreadcrumbType.text:
      case DSBreadcrumbType.custom:
        return false;
    }
  }

  bool get isCustom {
    return this == DSBreadcrumbType.custom;
  }
}

extension DSBreadcrumbSeparatorTypeExtension on DSBreadcrumbSeparatorType {
  String get displayName {
    switch (this) {
      case DSBreadcrumbSeparatorType.chevron:
        return 'Chevron';
      case DSBreadcrumbSeparatorType.slash:
        return 'Slash';
      case DSBreadcrumbSeparatorType.arrow:
        return 'Arrow';
      case DSBreadcrumbSeparatorType.dot:
        return 'Dot';
      case DSBreadcrumbSeparatorType.custom:
        return 'Custom';
    }
  }

  IconData get defaultIcon {
    switch (this) {
      case DSBreadcrumbSeparatorType.chevron:
        return Icons.chevron_right;
      case DSBreadcrumbSeparatorType.slash:
        return Icons.keyboard_arrow_right;
      case DSBreadcrumbSeparatorType.arrow:
        return Icons.arrow_forward_ios;
      case DSBreadcrumbSeparatorType.dot:
        return Icons.circle;
      case DSBreadcrumbSeparatorType.custom:
        return Icons.more_horiz;
    }
  }

  String get defaultText {
    switch (this) {
      case DSBreadcrumbSeparatorType.chevron:
        return '>';
      case DSBreadcrumbSeparatorType.slash:
        return '/';
      case DSBreadcrumbSeparatorType.arrow:
        return '→';
      case DSBreadcrumbSeparatorType.dot:
        return '•';
      case DSBreadcrumbSeparatorType.custom:
        return '';
    }
  }
}

extension DSBreadcrumbsCollapseModeExtension on DSBreadcrumbsCollapseMode {
  String get displayName {
    switch (this) {
      case DSBreadcrumbsCollapseMode.ellipsis:
        return 'Ellipsis';
      case DSBreadcrumbsCollapseMode.dropdown:
        return 'Dropdown';
      case DSBreadcrumbsCollapseMode.hidden:
        return 'Hidden';
    }
  }

  String get description {
    switch (this) {
      case DSBreadcrumbsCollapseMode.ellipsis:
        return 'Mostrar "..." para elementos ocultos';
      case DSBreadcrumbsCollapseMode.dropdown:
        return 'Mostrar dropdown con elementos ocultos';
      case DSBreadcrumbsCollapseMode.hidden:
        return 'Ocultar elementos intermedios completamente';
    }
  }

  bool get showsCollapsedIndicator {
    switch (this) {
      case DSBreadcrumbsCollapseMode.ellipsis:
      case DSBreadcrumbsCollapseMode.dropdown:
        return true;
      case DSBreadcrumbsCollapseMode.hidden:
        return false;
    }
  }

  bool get isInteractive {
    return this == DSBreadcrumbsCollapseMode.dropdown;
  }
}
