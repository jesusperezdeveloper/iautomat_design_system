import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_navigation_config.freezed.dart';

@freezed
class DSNavigationComponentConfig with _$DSNavigationComponentConfig {
  const factory DSNavigationComponentConfig({
    @Default(DSNavigationVariant.bottomBar) DSNavigationVariant variant,
    @Default(DSNavigationState.defaultState) DSNavigationState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default([]) List<DSNavigationDestination> destinations,
    @Default(0) int currentIndex,
    ValueChanged<int>? onTap,
    @Default([]) List<DSNavigationBadge> badges,
    DSNavigationColors? colors,
    DSNavigationTypography? typography,
    DSNavigationSpacing? spacing,
    DSNavigationElevation? elevation,
    DSNavigationBehavior? behavior,
  }) = _DSNavigationComponentConfig;
}

@freezed
class DSNavigationDestination with _$DSNavigationDestination {
  const factory DSNavigationDestination({
    required String id,
    required String label,
    required Widget icon,
    Widget? selectedIcon,
    String? tooltip,
    @Default(false) bool disabled,
    @Default(DSNavigationDestinationType.standard)
    DSNavigationDestinationType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
  }) = _DSNavigationDestination;
}

@freezed
class DSNavigationBadge with _$DSNavigationBadge {
  const factory DSNavigationBadge({
    required String destinationId,
    String? text,
    @Default(0) int count,
    @Default(DSNavigationBadgeType.count) DSNavigationBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    @Default(true) bool isVisible,
    @Default(99) int maxCount,
  }) = _DSNavigationBadge;
}

@freezed
class DSNavigationColors with _$DSNavigationColors {
  const factory DSNavigationColors({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    Color? indicatorColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _DSNavigationColors;
}

@freezed
class DSNavigationTypography with _$DSNavigationTypography {
  const factory DSNavigationTypography({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    @Default(1.0) double labelScale,
    @Default(true) bool responsive,
  }) = _DSNavigationTypography;
}

@freezed
class DSNavigationSpacing with _$DSNavigationSpacing {
  const factory DSNavigationSpacing({
    @Default(8.0) double iconSize,
    @Default(12.0) double labelSpacing,
    @Default(16.0) double itemPadding,
    @Default(24.0) double itemSpacing,
    @Default(72.0) double railWidth,
    @Default(256.0) double drawerWidth,
    @Default(80.0) double bottomBarHeight,
    @Default(true) bool adaptive,
  }) = _DSNavigationSpacing;
}

@freezed
class DSNavigationElevation with _$DSNavigationElevation {
  const factory DSNavigationElevation({
    @Default(8.0) double defaultElevation,
    @Default(0.0) double railElevation,
    @Default(16.0) double drawerElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _DSNavigationElevation;
}

@freezed
class DSNavigationBehavior with _$DSNavigationBehavior {
  const factory DSNavigationBehavior({
    @Default(DSNavigationLabelBehavior.alwaysShow)
    DSNavigationLabelBehavior labelBehavior,
    @Default(false) bool showTooltips,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool allowTabSwitching,
    @Default(false) bool persistentDrawer,
    @Default(true) bool enableSwipeGestures,
    @Default(DSNavigationAnimationType.slide)
    DSNavigationAnimationType animationType,
    @Default(300) int animationDuration,
  }) = _DSNavigationBehavior;
}

enum DSNavigationVariant {
  bottomBar,
  rail,
  drawer,
  permanentDrawer,
}

enum DSNavigationState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSNavigationDestinationType {
  standard,
  floating,
  badge,
  divider,
}

enum DSNavigationBadgeType {
  dot,
  count,
  text,
}

enum DSNavigationLabelBehavior {
  alwaysShow,
  alwaysHide,
  showSelected,
  auto,
}

enum DSNavigationAnimationType {
  none,
  fade,
  slide,
  scale,
}

extension DSNavigationVariantExtension on DSNavigationVariant {
  String get displayName {
    switch (this) {
      case DSNavigationVariant.bottomBar:
        return 'Bottom Bar';
      case DSNavigationVariant.rail:
        return 'Navigation Rail';
      case DSNavigationVariant.drawer:
        return 'Drawer';
      case DSNavigationVariant.permanentDrawer:
        return 'Permanent Drawer';
    }
  }

  String get description {
    switch (this) {
      case DSNavigationVariant.bottomBar:
        return 'Navegación inferior para pantallas móviles';
      case DSNavigationVariant.rail:
        return 'Barra lateral compacta para tablet/desktop';
      case DSNavigationVariant.drawer:
        return 'Cajón de navegación modal';
      case DSNavigationVariant.permanentDrawer:
        return 'Cajón de navegación permanente';
    }
  }

  bool get isHorizontal {
    switch (this) {
      case DSNavigationVariant.bottomBar:
        return true;
      case DSNavigationVariant.rail:
      case DSNavigationVariant.drawer:
      case DSNavigationVariant.permanentDrawer:
        return false;
    }
  }

  bool get isModal {
    switch (this) {
      case DSNavigationVariant.bottomBar:
      case DSNavigationVariant.rail:
      case DSNavigationVariant.permanentDrawer:
        return false;
      case DSNavigationVariant.drawer:
        return true;
    }
  }

  bool get supportsBadges {
    return true; // Todas las variantes soportan badges
  }

  double get defaultWidth {
    switch (this) {
      case DSNavigationVariant.bottomBar:
        return double.infinity;
      case DSNavigationVariant.rail:
        return 72.0;
      case DSNavigationVariant.drawer:
      case DSNavigationVariant.permanentDrawer:
        return 256.0;
    }
  }
}

extension DSNavigationStateExtension on DSNavigationState {
  String get displayName {
    switch (this) {
      case DSNavigationState.defaultState:
        return 'Default';
      case DSNavigationState.hover:
        return 'Hover';
      case DSNavigationState.pressed:
        return 'Pressed';
      case DSNavigationState.focus:
        return 'Focus';
      case DSNavigationState.selected:
        return 'Selected';
      case DSNavigationState.disabled:
        return 'Disabled';
      case DSNavigationState.loading:
        return 'Loading';
      case DSNavigationState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case DSNavigationState.defaultState:
      case DSNavigationState.hover:
      case DSNavigationState.pressed:
      case DSNavigationState.focus:
      case DSNavigationState.selected:
        return true;
      case DSNavigationState.disabled:
      case DSNavigationState.loading:
      case DSNavigationState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case DSNavigationState.defaultState:
      case DSNavigationState.hover:
      case DSNavigationState.pressed:
      case DSNavigationState.focus:
      case DSNavigationState.selected:
        return 1.0;
      case DSNavigationState.disabled:
        return 0.6;
      case DSNavigationState.loading:
        return 0.8;
      case DSNavigationState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == DSNavigationState.loading;
  }

  bool get showsSkeleton {
    return this == DSNavigationState.skeleton;
  }
}

extension DSNavigationBadgeTypeExtension on DSNavigationBadgeType {
  String get displayName {
    switch (this) {
      case DSNavigationBadgeType.dot:
        return 'Dot';
      case DSNavigationBadgeType.count:
        return 'Count';
      case DSNavigationBadgeType.text:
        return 'Text';
    }
  }

  bool get showsText {
    switch (this) {
      case DSNavigationBadgeType.dot:
        return false;
      case DSNavigationBadgeType.count:
      case DSNavigationBadgeType.text:
        return true;
    }
  }

  bool get isNumeric {
    return this == DSNavigationBadgeType.count;
  }
}
