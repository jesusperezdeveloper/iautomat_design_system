import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_tabs_config.freezed.dart';

@freezed
class DSTabsConfig with _$DSTabsConfig {
  const factory DSTabsConfig({
    @Default(DSTabsVariant.fixed) DSTabsVariant variant,
    @Default(DSTabsState.defaultState) DSTabsState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default([]) List<DSTabItem> tabs,
    @Default(0) int initialIndex,
    ValueChanged<int>? onChanged,
    @Default([]) List<DSTabBadge> badges,
    DSTabsColors? colors,
    DSTabsTypography? typography,
    DSTabsSpacing? spacing,
    DSTabsElevation? elevation,
    DSTabsBehavior? behavior,
    DSTabsAnimation? animation,
  }) = _DSTabsConfig;
}

@freezed
class DSTabItem with _$DSTabItem {
  const factory DSTabItem({
    required String id,
    required String text,
    Widget? icon,
    Widget? child,
    String? tooltip,
    @Default(false) bool disabled,
    @Default(DSTabType.text) DSTabType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    String? semanticLabel,
  }) = _AppTabItem;
}

@freezed
class DSTabBadge with _$DSTabBadge {
  const factory DSTabBadge({
    required String tabId,
    String? text,
    @Default(0) int count,
    @Default(DSTabBadgeType.count) DSTabBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    @Default(true) bool isVisible,
    @Default(99) int maxCount,
    @Default(DSTabBadgePosition.topRight) DSTabBadgePosition position,
  }) = _AppTabBadge;
}

@freezed
class DSTabsColors with _$DSTabsColors {
  const factory DSTabsColors({
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
class DSTabsTypography with _$DSTabsTypography {
  const factory DSTabsTypography({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    @Default(1.0) double labelScale,
    @Default(true) bool responsive,
    @Default(TextAlign.center) TextAlign textAlign,
  }) = _AppTabsTypography;
}

@freezed
class DSTabsSpacing with _$DSTabsSpacing {
  const factory DSTabsSpacing({
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
class DSTabsElevation with _$DSTabsElevation {
  const factory DSTabsElevation({
    @Default(0.0) double defaultElevation,
    @Default(2.0) double hoveredElevation,
    @Default(4.0) double pressedElevation,
    @Default(6.0) double focusedElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppTabsElevation;
}

@freezed
class DSTabsBehavior with _$DSTabsBehavior {
  const factory DSTabsBehavior({
    @Default(true) bool isScrollable,
    @Default(true) bool showTooltips,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool allowTabSwitching,
    @Default(false) bool automaticIndicatorColorAdjustment,
    @Default(DSTabsIndicatorSize.tab) DSTabsIndicatorSize indicatorSize,
    @Default(DSTabsLabelBehavior.alwaysShow)
    DSTabsLabelBehavior labelBehavior,
    @Default(TabAlignment.start) TabAlignment tabAlignment,
    @Default(300) int animationDuration,
  }) = _AppTabsBehavior;
}

@freezed
class DSTabsAnimation with _$DSTabsAnimation {
  const factory DSTabsAnimation({
    @Default(DSTabsAnimationType.slide) DSTabsAnimationType type,
    @Default(300) int duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(true) bool enableStateTransitions,
    @Default(true) bool enableIndicatorAnimation,
  }) = _AppTabsAnimation;
}

enum DSTabsVariant {
  fixed,
  scrollable,
  withBadges,
}

enum DSTabsState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSTabType {
  text,
  icon,
  textWithIcon,
  custom,
}

enum DSTabBadgeType {
  dot,
  count,
  text,
}

enum DSTabBadgePosition {
  topRight,
  topLeft,
  bottomRight,
  bottomLeft,
}

enum DSTabsIndicatorSize {
  label,
  tab,
}

enum DSTabsLabelBehavior {
  alwaysShow,
  alwaysHide,
  showSelected,
  auto,
}

enum DSTabsAnimationType {
  none,
  fade,
  slide,
  scale,
}

extension DSTabsVariantExtension on DSTabsVariant {
  String get displayName {
    switch (this) {
      case DSTabsVariant.fixed:
        return 'Fixed';
      case DSTabsVariant.scrollable:
        return 'Scrollable';
      case DSTabsVariant.withBadges:
        return 'With Badges';
    }
  }

  String get description {
    switch (this) {
      case DSTabsVariant.fixed:
        return 'Pestañas de ancho fijo distribuidas uniformemente';
      case DSTabsVariant.scrollable:
        return 'Pestañas desplazables horizontalmente';
      case DSTabsVariant.withBadges:
        return 'Pestañas con notificaciones y badges';
    }
  }

  bool get isScrollable {
    switch (this) {
      case DSTabsVariant.fixed:
        return false;
      case DSTabsVariant.scrollable:
      case DSTabsVariant.withBadges:
        return true;
    }
  }

  bool get supportsBadges {
    switch (this) {
      case DSTabsVariant.fixed:
      case DSTabsVariant.scrollable:
        return false;
      case DSTabsVariant.withBadges:
        return true;
    }
  }

  TabAlignment get defaultAlignment {
    switch (this) {
      case DSTabsVariant.fixed:
        return TabAlignment.fill;
      case DSTabsVariant.scrollable:
      case DSTabsVariant.withBadges:
        return TabAlignment.start;
    }
  }
}

extension DSTabsStateExtension on DSTabsState {
  String get displayName {
    switch (this) {
      case DSTabsState.defaultState:
        return 'Default';
      case DSTabsState.hover:
        return 'Hover';
      case DSTabsState.pressed:
        return 'Pressed';
      case DSTabsState.focus:
        return 'Focus';
      case DSTabsState.selected:
        return 'Selected';
      case DSTabsState.disabled:
        return 'Disabled';
      case DSTabsState.loading:
        return 'Loading';
      case DSTabsState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSTabsState.defaultState:
      case DSTabsState.hover:
      case DSTabsState.pressed:
      case DSTabsState.focus:
      case DSTabsState.selected:
        return true;
      case DSTabsState.disabled:
      case DSTabsState.loading:
      case DSTabsState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSTabsState.defaultState:
      case DSTabsState.hover:
      case DSTabsState.pressed:
      case DSTabsState.focus:
      case DSTabsState.selected:
        return 1.0;
      case DSTabsState.disabled:
        return 0.6;
      case DSTabsState.loading:
        return 0.8;
      case DSTabsState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSTabsState.loading;
  }

  bool get showsSkeleton {
    return this == DSTabsState.skeleton;
  }
}

extension DSTabTypeExtension on DSTabType {
  String get displayName {
    switch (this) {
      case DSTabType.text:
        return 'Text Only';
      case DSTabType.icon:
        return 'Icon Only';
      case DSTabType.textWithIcon:
        return 'Text with Icon';
      case DSTabType.custom:
        return 'Custom';
    }
  }

  bool get hasText {
    switch (this) {
      case DSTabType.text:
      case DSTabType.textWithIcon:
        return true;
      case DSTabType.icon:
      case DSTabType.custom:
        return false;
    }
  }

  bool get hasIcon {
    switch (this) {
      case DSTabType.icon:
      case DSTabType.textWithIcon:
        return true;
      case DSTabType.text:
      case DSTabType.custom:
        return false;
    }
  }

  bool get isCustom {
    return this == DSTabType.custom;
  }
}

extension DSTabBadgeTypeExtension on DSTabBadgeType {
  String get displayName {
    switch (this) {
      case DSTabBadgeType.dot:
        return 'Dot';
      case DSTabBadgeType.count:
        return 'Count';
      case DSTabBadgeType.text:
        return 'Text';
    }
  }

  bool get showsText {
    switch (this) {
      case DSTabBadgeType.dot:
        return false;
      case DSTabBadgeType.count:
      case DSTabBadgeType.text:
        return true;
    }
  }

  bool get isNumeric {
    return this == DSTabBadgeType.count;
  }
}

extension DSTabBadgePositionExtension on DSTabBadgePosition {
  String get displayName {
    switch (this) {
      case DSTabBadgePosition.topRight:
        return 'Top Right';
      case DSTabBadgePosition.topLeft:
        return 'Top Left';
      case DSTabBadgePosition.bottomRight:
        return 'Bottom Right';
      case DSTabBadgePosition.bottomLeft:
        return 'Bottom Left';
    }
  }

  Alignment get alignment {
    switch (this) {
      case DSTabBadgePosition.topRight:
        return Alignment.topRight;
      case DSTabBadgePosition.topLeft:
        return Alignment.topLeft;
      case DSTabBadgePosition.bottomRight:
        return Alignment.bottomRight;
      case DSTabBadgePosition.bottomLeft:
        return Alignment.bottomLeft;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case DSTabBadgePosition.topRight:
        return const EdgeInsets.only(top: 2, right: 2);
      case DSTabBadgePosition.topLeft:
        return const EdgeInsets.only(top: 2, left: 2);
      case DSTabBadgePosition.bottomRight:
        return const EdgeInsets.only(bottom: 2, right: 2);
      case DSTabBadgePosition.bottomLeft:
        return const EdgeInsets.only(bottom: 2, left: 2);
    }
  }
}
