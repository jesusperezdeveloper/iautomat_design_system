import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_back_to_top_config.freezed.dart';

enum AppBackToTopVariant {
  webOnly,
}

enum AppBackToTopState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppBackToTopPosition {
  bottomRight,
  bottomLeft,
  bottomCenter,
  topRight,
  topLeft,
  topCenter,
  centerRight,
  centerLeft,
}

enum AppBackToTopScrollBehavior {
  smooth,
  instant,
  easeIn,
  easeOut,
  easeInOut,
}

@freezed
class AppBackToTopConfig with _$AppBackToTopConfig {
  const factory AppBackToTopConfig({
    @Default(AppBackToTopVariant.webOnly) AppBackToTopVariant variant,
    @Default(AppBackToTopState.defaultState) AppBackToTopState state,
    AppBackToTopColors? colors,
    AppBackToTopSpacing? spacing,
    AppBackToTopTypography? typography,
    AppBackToTopAnimations? animations,
    AppBackToTopAccessibility? accessibility,
    AppBackToTopBehavior? behavior,
  }) = _AppBackToTopConfig;

  const AppBackToTopConfig._();

  bool get isValid {
    if (spacing != null) {
      if (spacing!.size < 0) return false;
      if (spacing!.iconSize < 0) return false;
      if (spacing!.borderRadius < 0) return false;
      if (spacing!.elevation < 0) return false;
    }

    if (animations != null) {
      if (animations!.duration.inMilliseconds < 0) return false;
      if (animations!.scrollDuration.inMilliseconds < 0) return false;
    }

    if (behavior != null) {
      if (behavior!.showAfterPixels < 0) return false;
      if (behavior!.hideAfterPixels < 0) return false;
    }

    return true;
  }
}

@freezed
class AppBackToTopColors with _$AppBackToTopColors {
  const factory AppBackToTopColors({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? focusColor,
    Color? hoverColor,
    Color? pressedColor,
    Color? disabledColor,
    @Default(1.0) double opacity,
    @Default(0.12) double hoverOpacity,
    @Default(0.16) double pressedOpacity,
    @Default(0.38) double disabledOpacity,
  }) = _AppBackToTopColors;

  const AppBackToTopColors._();

  bool get isValid {
    return opacity >= 0.0 &&
           opacity <= 1.0 &&
           hoverOpacity >= 0.0 &&
           hoverOpacity <= 1.0 &&
           pressedOpacity >= 0.0 &&
           pressedOpacity <= 1.0 &&
           disabledOpacity >= 0.0 &&
           disabledOpacity <= 1.0;
  }
}

@freezed
class AppBackToTopSpacing with _$AppBackToTopSpacing {
  const factory AppBackToTopSpacing({
    @Default(56.0) double size,
    @Default(24.0) double iconSize,
    @Default(28.0) double borderRadius,
    @Default(EdgeInsets.all(16.0)) EdgeInsets margin,
    @Default(EdgeInsets.zero) EdgeInsets padding,
    @Default(8.0) double elevation,
    @Default(AppBackToTopPosition.bottomRight) AppBackToTopPosition position,
  }) = _AppBackToTopSpacing;

  const AppBackToTopSpacing._();

  bool get isValid {
    return size > 0 &&
           iconSize > 0 &&
           borderRadius >= 0 &&
           elevation >= 0;
  }
}

@freezed
class AppBackToTopTypography with _$AppBackToTopTypography {
  const factory AppBackToTopTypography({
    TextStyle? textStyle,
    @Default(14.0) double fontSize,
    @Default(FontWeight.w500) FontWeight fontWeight,
    String? tooltip,
  }) = _AppBackToTopTypography;

  const AppBackToTopTypography._();

  bool get isValid {
    return fontSize > 0;
  }
}

@freezed
class AppBackToTopAnimations with _$AppBackToTopAnimations {
  const factory AppBackToTopAnimations({
    @Default(Duration(milliseconds: 300)) Duration duration,
    @Default(Duration(milliseconds: 800)) Duration scrollDuration,
    @Default(Duration(milliseconds: 150)) Duration fadeInDuration,
    @Default(Duration(milliseconds: 150)) Duration fadeOutDuration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Curves.easeOut) Curve scrollCurve,
    @Default(true) bool enabled,
    @Default(true) bool fadeEnabled,
    @Default(true) bool scaleEnabled,
    @Default(AppBackToTopScrollBehavior.smooth) AppBackToTopScrollBehavior scrollBehavior,
  }) = _AppBackToTopAnimations;

  const AppBackToTopAnimations._();

  bool get isValid {
    return duration.inMilliseconds > 0 &&
           scrollDuration.inMilliseconds > 0 &&
           fadeInDuration.inMilliseconds >= 0 &&
           fadeOutDuration.inMilliseconds >= 0;
  }
}

@freezed
class AppBackToTopAccessibility with _$AppBackToTopAccessibility {
  const factory AppBackToTopAccessibility({
    @Default(true) bool enabled,
    @Default(true) bool focusable,
    @Default('Volver al inicio') String label,
    @Default('Hacer clic para desplazarse al inicio de la página') String hint,
    @Default('Botón no disponible') String disabledLabel,
    @Default('Desplazándose al inicio') String loadingLabel,
    String? customLabel,
    String? customHint,
  }) = _AppBackToTopAccessibility;
}

@freezed
class AppBackToTopBehavior with _$AppBackToTopBehavior {
  const factory AppBackToTopBehavior({
    @Default(200.0) double showAfterPixels,
    @Default(0.0) double hideAfterPixels,
    @Default(true) bool autoHide,
    @Default(true) bool showOnScrollUp,
    @Default(false) bool hideOnScrollDown,
    @Default(true) bool smoothScrolling,
    @Default(true) bool hapticFeedback,
    @Default(true) bool showTooltip,
    @Default(Duration(seconds: 30)) Duration autoHideDelay,
  }) = _AppBackToTopBehavior;

  const AppBackToTopBehavior._();

  bool get isValid {
    return showAfterPixels >= 0 &&
           hideAfterPixels >= 0 &&
           autoHideDelay.inMilliseconds > 0;
  }
}

class AppBackToTopDefaults {
  static const AppBackToTopColors colors = AppBackToTopColors();
  static const AppBackToTopSpacing spacing = AppBackToTopSpacing();
  static const AppBackToTopTypography typography = AppBackToTopTypography();
  static const AppBackToTopAnimations animations = AppBackToTopAnimations();
  static const AppBackToTopAccessibility accessibility = AppBackToTopAccessibility();
  static const AppBackToTopBehavior behavior = AppBackToTopBehavior();

  static AppBackToTopConfig get defaultConfig => const AppBackToTopConfig();

  static AppBackToTopConfig get webOptimized => const AppBackToTopConfig(
    variant: AppBackToTopVariant.webOnly,
    spacing: AppBackToTopSpacing(
      size: 48,
      iconSize: 20,
      position: AppBackToTopPosition.bottomRight,
      margin: EdgeInsets.all(24),
    ),
    animations: AppBackToTopAnimations(
      duration: Duration(milliseconds: 250),
      scrollDuration: Duration(milliseconds: 600),
      scrollBehavior: AppBackToTopScrollBehavior.smooth,
    ),
    behavior: AppBackToTopBehavior(
      showAfterPixels: 300,
      autoHide: true,
      showOnScrollUp: true,
      smoothScrolling: true,
    ),
  );

  static AppBackToTopConfig get mobileOptimized => const AppBackToTopConfig(
    variant: AppBackToTopVariant.webOnly,
    spacing: AppBackToTopSpacing(
      size: 56,
      iconSize: 24,
      position: AppBackToTopPosition.bottomRight,
      margin: EdgeInsets.all(16),
    ),
    animations: AppBackToTopAnimations(
      duration: Duration(milliseconds: 300),
      scrollDuration: Duration(milliseconds: 500),
      scrollBehavior: AppBackToTopScrollBehavior.easeOut,
    ),
    behavior: AppBackToTopBehavior(
      showAfterPixels: 200,
      autoHide: false,
      showOnScrollUp: false,
      smoothScrolling: true,
      hapticFeedback: true,
    ),
  );

  static AppBackToTopConfig configForPosition(AppBackToTopPosition position) {
    EdgeInsets margin;

    switch (position) {
      case AppBackToTopPosition.bottomRight:
        margin = const EdgeInsets.only(right: 16, bottom: 16);
        break;
      case AppBackToTopPosition.bottomLeft:
        margin = const EdgeInsets.only(left: 16, bottom: 16);
        break;
      case AppBackToTopPosition.bottomCenter:
        margin = const EdgeInsets.only(bottom: 16);
        break;
      case AppBackToTopPosition.topRight:
        margin = const EdgeInsets.only(right: 16, top: 16);
        break;
      case AppBackToTopPosition.topLeft:
        margin = const EdgeInsets.only(left: 16, top: 16);
        break;
      case AppBackToTopPosition.topCenter:
        margin = const EdgeInsets.only(top: 16);
        break;
      case AppBackToTopPosition.centerRight:
        margin = const EdgeInsets.only(right: 16);
        break;
      case AppBackToTopPosition.centerLeft:
        margin = const EdgeInsets.only(left: 16);
        break;
    }

    return AppBackToTopConfig(
      spacing: AppBackToTopSpacing(
        position: position,
        margin: margin,
      ),
    );
  }

  static Alignment getAlignmentForPosition(AppBackToTopPosition position) {
    switch (position) {
      case AppBackToTopPosition.bottomRight:
        return Alignment.bottomRight;
      case AppBackToTopPosition.bottomLeft:
        return Alignment.bottomLeft;
      case AppBackToTopPosition.bottomCenter:
        return Alignment.bottomCenter;
      case AppBackToTopPosition.topRight:
        return Alignment.topRight;
      case AppBackToTopPosition.topLeft:
        return Alignment.topLeft;
      case AppBackToTopPosition.topCenter:
        return Alignment.topCenter;
      case AppBackToTopPosition.centerRight:
        return Alignment.centerRight;
      case AppBackToTopPosition.centerLeft:
        return Alignment.centerLeft;
    }
  }

  static IconData getDefaultIcon() => Icons.keyboard_arrow_up;

  static AppBackToTopConfig get minimalConfig => const AppBackToTopConfig(
    spacing: AppBackToTopSpacing(
      size: 40,
      iconSize: 18,
      elevation: 2,
    ),
    animations: AppBackToTopAnimations(
      duration: Duration(milliseconds: 200),
      scrollDuration: Duration(milliseconds: 400),
    ),
    behavior: AppBackToTopBehavior(
      showAfterPixels: 100,
      autoHide: true,
      showTooltip: false,
    ),
  );

  static AppBackToTopConfig get prominentConfig => const AppBackToTopConfig(
    spacing: AppBackToTopSpacing(
      size: 64,
      iconSize: 28,
      elevation: 12,
      borderRadius: 32,
    ),
    animations: AppBackToTopAnimations(
      duration: Duration(milliseconds: 400),
      scrollDuration: Duration(milliseconds: 1000),
      scaleEnabled: true,
    ),
    behavior: AppBackToTopBehavior(
      showAfterPixels: 400,
      showTooltip: true,
    ),
  );
}