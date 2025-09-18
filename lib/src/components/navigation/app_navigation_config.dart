import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_navigation_config.freezed.dart';

@freezed
class AppNavigationComponentConfig with _$AppNavigationComponentConfig {
  const factory AppNavigationComponentConfig({
    @Default(AppNavigationVariant.bottomBar) AppNavigationVariant variant,
    @Default(AppNavigationState.defaultState) AppNavigationState state,
    @Default(true) bool isAdaptive,
    @Default(false) bool isRtl,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default([]) List<AppNavigationDestination> destinations,
    @Default(0) int currentIndex,
    ValueChanged<int>? onTap,
    @Default([]) List<AppNavigationBadge> badges,
    AppNavigationColors? colors,
    AppNavigationTypography? typography,
    AppNavigationSpacing? spacing,
    AppNavigationElevation? elevation,
    AppNavigationBehavior? behavior,
  }) = _AppNavigationComponentConfig;
}

@freezed
class AppNavigationDestination with _$AppNavigationDestination {
  const factory AppNavigationDestination({
    required String id,
    required String label,
    required Widget icon,
    Widget? selectedIcon,
    String? tooltip,
    @Default(false) bool disabled,
    @Default(AppNavigationDestinationType.standard)
    AppNavigationDestinationType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
  }) = _AppNavigationDestination;
}

@freezed
class AppNavigationBadge with _$AppNavigationBadge {
  const factory AppNavigationBadge({
    required String destinationId,
    String? text,
    @Default(0) int count,
    @Default(AppNavigationBadgeType.count) AppNavigationBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    @Default(true) bool isVisible,
    @Default(99) int maxCount,
  }) = _AppNavigationBadge;
}

@freezed
class AppNavigationColors with _$AppNavigationColors {
  const factory AppNavigationColors({
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
  }) = _AppNavigationColors;
}

@freezed
class AppNavigationTypography with _$AppNavigationTypography {
  const factory AppNavigationTypography({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    @Default(1.0) double labelScale,
    @Default(true) bool responsive,
  }) = _AppNavigationTypography;
}

@freezed
class AppNavigationSpacing with _$AppNavigationSpacing {
  const factory AppNavigationSpacing({
    @Default(8.0) double iconSize,
    @Default(12.0) double labelSpacing,
    @Default(16.0) double itemPadding,
    @Default(24.0) double itemSpacing,
    @Default(72.0) double railWidth,
    @Default(256.0) double drawerWidth,
    @Default(80.0) double bottomBarHeight,
    @Default(true) bool adaptive,
  }) = _AppNavigationSpacing;
}

@freezed
class AppNavigationElevation with _$AppNavigationElevation {
  const factory AppNavigationElevation({
    @Default(8.0) double defaultElevation,
    @Default(0.0) double railElevation,
    @Default(16.0) double drawerElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) = _AppNavigationElevation;
}

@freezed
class AppNavigationBehavior with _$AppNavigationBehavior {
  const factory AppNavigationBehavior({
    @Default(AppNavigationLabelBehavior.alwaysShow)
    AppNavigationLabelBehavior labelBehavior,
    @Default(false) bool showTooltips,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool allowTabSwitching,
    @Default(false) bool persistentDrawer,
    @Default(true) bool enableSwipeGestures,
    @Default(AppNavigationAnimationType.slide)
    AppNavigationAnimationType animationType,
    @Default(300) int animationDuration,
  }) = _AppNavigationBehavior;
}

enum AppNavigationVariant {
  bottomBar,
  rail,
  drawer,
  permanentDrawer,
}

enum AppNavigationState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppNavigationDestinationType {
  standard,
  floating,
  badge,
  divider,
}

enum AppNavigationBadgeType {
  dot,
  count,
  text,
}

enum AppNavigationLabelBehavior {
  alwaysShow,
  alwaysHide,
  showSelected,
  auto,
}

enum AppNavigationAnimationType {
  none,
  fade,
  slide,
  scale,
}

extension AppNavigationVariantExtension on AppNavigationVariant {
  String get displayName {
    switch (this) {
      case AppNavigationVariant.bottomBar:
        return 'Bottom Bar';
      case AppNavigationVariant.rail:
        return 'Navigation Rail';
      case AppNavigationVariant.drawer:
        return 'Drawer';
      case AppNavigationVariant.permanentDrawer:
        return 'Permanent Drawer';
    }
  }

  String get description {
    switch (this) {
      case AppNavigationVariant.bottomBar:
        return 'Navegación inferior para pantallas móviles';
      case AppNavigationVariant.rail:
        return 'Barra lateral compacta para tablet/desktop';
      case AppNavigationVariant.drawer:
        return 'Cajón de navegación modal';
      case AppNavigationVariant.permanentDrawer:
        return 'Cajón de navegación permanente';
    }
  }

  bool get isHorizontal {
    switch (this) {
      case AppNavigationVariant.bottomBar:
        return true;
      case AppNavigationVariant.rail:
      case AppNavigationVariant.drawer:
      case AppNavigationVariant.permanentDrawer:
        return false;
    }
  }

  bool get isModal {
    switch (this) {
      case AppNavigationVariant.bottomBar:
      case AppNavigationVariant.rail:
      case AppNavigationVariant.permanentDrawer:
        return false;
      case AppNavigationVariant.drawer:
        return true;
    }
  }

  bool get supportsBadges {
    return true; // Todas las variantes soportan badges
  }

  double get defaultWidth {
    switch (this) {
      case AppNavigationVariant.bottomBar:
        return double.infinity;
      case AppNavigationVariant.rail:
        return 72.0;
      case AppNavigationVariant.drawer:
      case AppNavigationVariant.permanentDrawer:
        return 256.0;
    }
  }
}

extension AppNavigationStateExtension on AppNavigationState {
  String get displayName {
    switch (this) {
      case AppNavigationState.defaultState:
        return 'Default';
      case AppNavigationState.hover:
        return 'Hover';
      case AppNavigationState.pressed:
        return 'Pressed';
      case AppNavigationState.focus:
        return 'Focus';
      case AppNavigationState.selected:
        return 'Selected';
      case AppNavigationState.disabled:
        return 'Disabled';
      case AppNavigationState.loading:
        return 'Loading';
      case AppNavigationState.skeleton:
        return 'Skeleton';
    }
  }

  bool get isInteractive {
    switch (this) {
      case AppNavigationState.defaultState:
      case AppNavigationState.hover:
      case AppNavigationState.pressed:
      case AppNavigationState.focus:
      case AppNavigationState.selected:
        return true;
      case AppNavigationState.disabled:
      case AppNavigationState.loading:
      case AppNavigationState.skeleton:
        return false;
    }
  }

  double get opacity {
    switch (this) {
      case AppNavigationState.defaultState:
      case AppNavigationState.hover:
      case AppNavigationState.pressed:
      case AppNavigationState.focus:
      case AppNavigationState.selected:
        return 1.0;
      case AppNavigationState.disabled:
        return 0.6;
      case AppNavigationState.loading:
        return 0.8;
      case AppNavigationState.skeleton:
        return 0.3;
    }
  }

  bool get showsLoader {
    return this == AppNavigationState.loading;
  }

  bool get showsSkeleton {
    return this == AppNavigationState.skeleton;
  }
}

extension AppNavigationBadgeTypeExtension on AppNavigationBadgeType {
  String get displayName {
    switch (this) {
      case AppNavigationBadgeType.dot:
        return 'Dot';
      case AppNavigationBadgeType.count:
        return 'Count';
      case AppNavigationBadgeType.text:
        return 'Text';
    }
  }

  bool get showsText {
    switch (this) {
      case AppNavigationBadgeType.dot:
        return false;
      case AppNavigationBadgeType.count:
      case AppNavigationBadgeType.text:
        return true;
    }
  }

  bool get isNumeric {
    return this == AppNavigationBadgeType.count;
  }
}
