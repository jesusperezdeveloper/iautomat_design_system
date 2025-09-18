import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_tabs_config.freezed.dart';

@freezed
class AppTabsConfig with _$AppTabsConfig {
  const factory AppTabsConfig({
    @Default(AppTabsVariant.fixed) AppTabsVariant variant,
    @Default(AppTabsState.defaultState) AppTabsState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default([]) List<AppTabItem> tabs,
    @Default(0) int initialIndex,
    ValueChanged<int>? onChanged,
    @Default([]) List<AppTabBadge> badges,
    AppTabsColors? colors,
    AppTabsTypography? typography,
    AppTabsSpacing? spacing,
    AppTabsElevation? elevation,
    AppTabsBehavior? behavior,
    AppTabsAnimation? animation,
  }) = _AppTabsConfig;
}

@freezed
class AppTabItem with _$AppTabItem {
  const factory AppTabItem({
    required String id,
    required String text,
    Widget? icon,
    Widget? child,
    String? tooltip,
    @Default(false) bool disabled,
    @Default(AppTabType.text) AppTabType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    String? semanticLabel,
  }) = _AppTabItem;
}

@freezed
class AppTabBadge with _$AppTabBadge {
  const factory AppTabBadge({
    required String tabId,
    String? text,
    @Default(0) int count,
    @Default(AppTabBadgeType.count) AppTabBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    @Default(true) bool isVisible,
    @Default(99) int maxCount,
    @Default(AppTabBadgePosition.topRight) AppTabBadgePosition position,
  }) = _AppTabBadge;
}

@freezed
class AppTabsColors with _$AppTabsColors {
  const factory AppTabsColors({
    Color? backgroundColor,
    Color? indicatorColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? surfaceTintColor,
    Color? borderColor,
  }) = _AppTabsColors;
}

@freezed
class AppTabsTypography with _$AppTabsTypography {
  const factory AppTabsTypography({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    @Default(1.0) double labelScale,
    @Default(true) bool responsive,
    @Default(TextAlign.center) TextAlign textAlign,
  }) = _AppTabsTypography;
}

@freezed
class AppTabsSpacing with _$AppTabsSpacing {
  const factory AppTabsSpacing({
    @Default(16.0) double iconSize,
    @Default(8.0) double labelPadding,
    @Default(12.0) double tabPadding,
    @Default(4.0) double tabSpacing,
    @Default(4.0) double indicatorWeight,
    @Default(8.0) double indicatorPadding,
    @Default(48.0) double minTabHeight,
    @Default(72.0) double maxTabHeight,
    @Default(90.0) double minTabWidth,
    @Default(true) bool adaptive,
  }) = _AppTabsSpacing;
}

@freezed
class AppTabsElevation with _$AppTabsElevation {
  const factory AppTabsElevation({
    @Default(0.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(4.0) double pressedElevation,
    @Default(6.0) double focusedElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppTabsElevation;
}

@freezed
class AppTabsBehavior with _$AppTabsBehavior {
  const factory AppTabsBehavior({
    @Default(true) bool isScrollable,
    @Default(true) bool showTooltips,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool allowTabSwitching,
    @Default(false) bool automaticIndicatorColorAdjustment,
    @Default(AppTabsIndicatorSize.tab) AppTabsIndicatorSize indicatorSize,
    @Default(AppTabsLabelBehavior.alwaysShow)
    AppTabsLabelBehavior labelBehavior,
    @Default(TabAlignment.start) TabAlignment tabAlignment,
    @Default(300) int animationDuration,
  }) = _AppTabsBehavior;
}

@freezed
class AppTabsAnimation with _$AppTabsAnimation {
  const factory AppTabsAnimation({
    @Default(AppTabsAnimationType.slide) AppTabsAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableIndicatorAnimation,
  }) = _AppTabsAnimation;
}

enum AppTabsVariant {
  fixed,
  scrollable,
  withBadges,
}

enum AppTabsState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppTabType {
  text,
  icon,
  textWithIcon,
  custom,
}

enum AppTabBadgeType {
  dot,
  count,
  text,
}

enum AppTabBadgePosition {
  topRight,
  topLeft,
  bottomRight,
  bottomLeft,
}

enum AppTabsIndicatorSize {
  label,
  tab,
}

enum AppTabsLabelBehavior {
  alwaysShow,
  alwaysHide,
  showSelected,
  auto,
}

enum AppTabsAnimationType {
  none,
  fade,
  slide,
  scale,
}

extension AppTabsVariantExtension on AppTabsVariant {
  String get displayName {
    switch (this) {
      case AppTabsVariant.fixed:
        return 'Fixed';
      case AppTabsVariant.scrollable:
        return 'Scrollable';
      case AppTabsVariant.withBadges:
        return 'With Badges';
    }
  }

  String get description {
    switch (this) {
      case AppTabsVariant.fixed:
        return 'Pestañas de ancho fijo distribuidas uniformemente';
      case AppTabsVariant.scrollable:
        return 'Pestañas desplazables horizontalmente';
      case AppTabsVariant.withBadges:
        return 'Pestañas con notificaciones y badges';
    }
  }

  bool get isScrollable {
    switch (this) {
      case AppTabsVariant.fixed:
        return false;
      case AppTabsVariant.scrollable:
      case AppTabsVariant.withBadges:
        return true;
    }
  }

  bool get supportsBadges {
    switch (this) {
      case AppTabsVariant.fixed:
      case AppTabsVariant.scrollable:
        return false;
      case AppTabsVariant.withBadges:
        return true;
    }
  }

  TabAlignment get defaultAlignment {
    switch (this) {
      case AppTabsVariant.fixed:
        return TabAlignment.fill;
      case AppTabsVariant.scrollable:
      case AppTabsVariant.withBadges:
        return TabAlignment.start;
    }
  }
}

extension AppTabsStateExtension on AppTabsState {
  String get displayName {
    switch (this) {
      case AppTabsState.defaultState:
        return 'Default';
      case AppTabsState.hover:
        return 'Hover';
      case AppTabsState.pressed:
        return 'Pressed';
      case AppTabsState.focus:
        return 'Focus';
      case AppTabsState.selected:
        return 'Selected';
      case AppTabsState.disabled:
        return 'Disabled';
      case AppTabsState.loading:
        return 'Loading';
      case AppTabsState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppTabsState.defaultState:
      case AppTabsState.hover:
      case AppTabsState.pressed:
      case AppTabsState.focus:
      case AppTabsState.selected:
        return true;
      case AppTabsState.disabled:
      case AppTabsState.loading:
      case AppTabsState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppTabsState.defaultState:
      case AppTabsState.hover:
      case AppTabsState.pressed:
      case AppTabsState.focus:
      case AppTabsState.selected:
        return 1.0;
      case AppTabsState.disabled:
        return 0.6;
      case AppTabsState.loading:
        return 0.8;
      case AppTabsState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppTabsState.loading;
  }

  bool get showsSkeleton {
    return this == AppTabsState.skeleton;
  }
}

extension AppTabTypeExtension on AppTabType {
  String get displayName {
    switch (this) {
      case AppTabType.text:
        return 'Text Only';
      case AppTabType.icon:
        return 'Icon Only';
      case AppTabType.textWithIcon:
        return 'Text with Icon';
      case AppTabType.custom:
        return 'Custom';
    }
  }

  bool get hasText {
    switch (this) {
      case AppTabType.text:
      case AppTabType.textWithIcon:
        return true;
      case AppTabType.icon:
      case AppTabType.custom:
        return false;
    }
  }

  bool get hasIcon {
    switch (this) {
      case AppTabType.icon:
      case AppTabType.textWithIcon:
        return true;
      case AppTabType.text:
      case AppTabType.custom:
        return false;
    }
  }

  bool get isCustom {
    return this == AppTabType.custom;
  }
}

extension AppTabBadgeTypeExtension on AppTabBadgeType {
  String get displayName {
    switch (this) {
      case AppTabBadgeType.dot:
        return 'Dot';
      case AppTabBadgeType.count:
        return 'Count';
      case AppTabBadgeType.text:
        return 'Text';
    }
  }

  bool get showsText {
    switch (this) {
      case AppTabBadgeType.dot:
        return false;
      case AppTabBadgeType.count:
      case AppTabBadgeType.text:
        return true;
    }
  }

  bool get isNumeric {
    return this == AppTabBadgeType.count;
  }
}

extension AppTabBadgePositionExtension on AppTabBadgePosition {
  String get displayName {
    switch (this) {
      case AppTabBadgePosition.topRight:
        return 'Top Right';
      case AppTabBadgePosition.topLeft:
        return 'Top Left';
      case AppTabBadgePosition.bottomRight:
        return 'Bottom Right';
      case AppTabBadgePosition.bottomLeft:
        return 'Bottom Left';
    }
  }

  Alignment get alignment {
    switch (this) {
      case AppTabBadgePosition.topRight:
        return Alignment.topRight;
      case AppTabBadgePosition.topLeft:
        return Alignment.topLeft;
      case AppTabBadgePosition.bottomRight:
        return Alignment.bottomRight;
      case AppTabBadgePosition.bottomLeft:
        return Alignment.bottomLeft;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case AppTabBadgePosition.topRight:
        return const EdgeInsets.only(top: 2, right: 2);
      case AppTabBadgePosition.topLeft:
        return const EdgeInsets.only(top: 2, left: 2);
      case AppTabBadgePosition.bottomRight:
        return const EdgeInsets.only(bottom: 2, right: 2);
      case AppTabBadgePosition.bottomLeft:
        return const EdgeInsets.only(bottom: 2, left: 2);
    }
  }
}
