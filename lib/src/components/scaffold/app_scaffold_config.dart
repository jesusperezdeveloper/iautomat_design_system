import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_scaffold_config.freezed.dart';

@freezed
class AppScaffoldConfig with _$AppScaffoldConfig {
  const factory AppScaffoldConfig({
    @Default(AppScaffoldVariant.appShell) AppScaffoldVariant variant,
    @Default(AppScaffoldState.defaultState) AppScaffoldState state,
    @Default(true) bool isResponsive,
    @Default(false) bool hasGutters,
    @Default(false) bool isRtl,
    @Default(true) bool enableKeyboardPadding,
    @Default(true) bool enableA11y,
    AppNavigationConfig? navigation,
    AppBarConfig? appBar,
    BodyConfig? body,
    BottomBarConfig? bottomBar,
    SidePanelConfig? sidePanel,
    FloatingActionConfig? floatingAction,
  }) = _AppScaffoldConfig;
}

@freezed
class AppNavigationConfig with _$AppNavigationConfig {
  const factory AppNavigationConfig({
    @Default(NavigationType.drawer) NavigationType type,
    @Default(true) bool persistent,
    @Default(320.0) double width,
    Widget? header,
    required List<NavigationItem> items,
  }) = _AppNavigationConfig;
}

@freezed
class AppBarConfig with _$AppBarConfig {
  const factory AppBarConfig({
    @Default(true) bool pinned,
    @Default(true) bool floating,
    @Default(true) bool snap,
    @Default(56.0) double height,
    Widget? title,
    List<Widget>? actions,
    Widget? leading,
    PreferredSizeWidget? bottom,
  }) = _AppBarConfig;
}

@freezed
class BodyConfig with _$BodyConfig {
  const factory BodyConfig({
    @Default(true) bool safeArea,
    @Default(true) bool resizeToAvoidBottomInset,
    EdgeInsetsGeometry? padding,
    Widget? child,
  }) = _BodyConfig;
}

@freezed
class BottomBarConfig with _$BottomBarConfig {
  const factory BottomBarConfig({
    @Default(BottomBarType.navigation) BottomBarType type,
    @Default(80.0) double height,
    required List<BottomBarItem> items,
    int? selectedIndex,
    ValueChanged<int>? onTap,
  }) = _BottomBarConfig;
}

@freezed
class SidePanelConfig with _$SidePanelConfig {
  const factory SidePanelConfig({
    @Default(SidePanelType.rail) SidePanelType type,
    @Default(NavigationRailLabelType.none) NavigationRailLabelType labelType,
    @Default(72.0) double width,
    @Default(256.0) double expandedWidth,
    @Default(false) bool extended,
    required List<NavigationRailDestination> destinations,
    int? selectedIndex,
    ValueChanged<int>? onDestinationSelected,
  }) = _SidePanelConfig;
}

@freezed
class FloatingActionConfig with _$FloatingActionConfig {
  const factory FloatingActionConfig({
    @Default(FloatingActionButtonLocation.endFloat)
    FloatingActionButtonLocation location,
    @Default(true) bool mini,
    Widget? child,
    VoidCallback? onPressed,
    String? tooltip,
    String? heroTag,
  }) = _FloatingActionConfig;
}

@freezed
class NavigationItem with _$NavigationItem {
  const factory NavigationItem({
    required String label,
    required IconData icon,
    IconData? selectedIcon,
    String? route,
    VoidCallback? onTap,
    @Default(false) bool isSelected,
    @Default(false) bool disabled,
  }) = _NavigationItem;
}

@freezed
class BottomBarItem with _$BottomBarItem {
  const factory BottomBarItem({
    required String label,
    required IconData icon,
    IconData? activeIcon,
    String? tooltip,
    @Default(false) bool disabled,
  }) = _BottomBarItem;
}

enum AppScaffoldVariant {
  appShell,
  gutters,
  responsive,
}

enum AppScaffoldState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum NavigationType {
  drawer,
  rail,
  permanent,
}

enum BottomBarType {
  navigation,
  appBar,
  actionBar,
}

enum SidePanelType {
  rail,
  drawer,
  permanent,
}
