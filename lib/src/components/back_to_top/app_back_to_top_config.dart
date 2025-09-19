import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_back_to_top_config.freezed.dart';

enum DSBackToTopVariant {
  webOnly,
}

enum DSBackToTopState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSBackToTopPosition {
  bottomRight,
  bottomLeft,
  bottomCenter,
  topRight,
  topLeft,
  topCenter,
  centerRight,
  centerLeft,
}

enum DSBackToTopScrollBehavior {
  smooth,
  instant,
  easeIn,
  easeOut,
  easeInOut,
}

@freezed
class DSBackToTopConfig with _$DSBackToTopConfig {
  const factory DSBackToTopConfig({
    @Default(DSBackToTopVariant.webOnly) DSBackToTopVariant variant,
    @Default(DSBackToTopState.defaultState) DSBackToTopState state,
    DSBackToTopColors? colors,
    DSBackToTopSpacing? spacing,
    DSBackToTopTypography? typography,
    DSBackToTopAnimations? animations,
    DSBackToTopAccessibility? accessibility,
    DSBackToTopBehavior? behavior,
  }) = _DSBackToTopConfig;

  const DSBackToTopConfig._();

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
class DSBackToTopColors with _$DSBackToTopColors {
  const factory DSBackToTopColors({
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

  const DSBackToTopColors._();

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
class DSBackToTopSpacing with _$DSBackToTopSpacing {
  const factory DSBackToTopSpacing({
    @Default(56.0) double size,
    @Default(24.0) double iconSize,
    @Default(28.0) double borderRadius,
    @Default(EdgeInsets.all(16.0)) EdgeInsets margin,
    @Default(EdgeInsets.zero) EdgeInsets padding,
    @Default(8.0) double elevation,
    @Default(DSBackToTopPosition.bottomRight) DSBackToTopPosition position,
  }) = _AppBackToTopSpacing;

  const DSBackToTopSpacing._();

  bool get isValid {
    return size > 0 &&
           iconSize > 0 &&
           borderRadius >= 0 &&
           elevation >= 0;
  }
}

@freezed
class DSBackToTopTypography with _$DSBackToTopTypography {
  const factory DSBackToTopTypography({
    TextStyle? textStyle,
    @Default(14.0) double fontSize,
    @Default(FontWeight.w500) FontWeight fontWeight,
    String? tooltip,
  }) = _AppBackToTopTypography;

  const DSBackToTopTypography._();

  bool get isValid {
    return fontSize > 0;
  }
}

@freezed
class DSBackToTopAnimations with _$DSBackToTopAnimations {
  const factory DSBackToTopAnimations({
    @Default(Duration(milliseconds: 300)) Duration duration,
    @Default(Duration(milliseconds: 800)) Duration scrollDuration,
    @Default(Duration(milliseconds: 150)) Duration fadeInDuration,
    @Default(Duration(milliseconds: 150)) Duration fadeOutDuration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(Curves.easeOut) Curve scrollCurve,
    @Default(true) bool enabled,
    @Default(true) bool fadeEnabled,
    @Default(true) bool scaleEnabled,
    @Default(DSBackToTopScrollBehavior.smooth) DSBackToTopScrollBehavior scrollBehavior,
  }) = _AppBackToTopAnimations;

  const DSBackToTopAnimations._();

  bool get isValid {
    return duration.inMilliseconds > 0 &&
           scrollDuration.inMilliseconds > 0 &&
           fadeInDuration.inMilliseconds >= 0 &&
           fadeOutDuration.inMilliseconds >= 0;
  }
}

@freezed
class DSBackToTopAccessibility with _$DSBackToTopAccessibility {
  const factory DSBackToTopAccessibility({
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
class DSBackToTopBehavior with _$DSBackToTopBehavior {
  const factory DSBackToTopBehavior({
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

  const DSBackToTopBehavior._();

  bool get isValid {
    return showAfterPixels >= 0 &&
           hideAfterPixels >= 0 &&
           autoHideDelay.inMilliseconds > 0;
  }
}

class DSBackToTopDefaults {
  static const DSBackToTopColors colors = DSBackToTopColors();
  static const DSBackToTopSpacing spacing = DSBackToTopSpacing();
  static const DSBackToTopTypography typography = DSBackToTopTypography();
  static const DSBackToTopAnimations animations = DSBackToTopAnimations();
  static const DSBackToTopAccessibility accessibility = DSBackToTopAccessibility();
  static const DSBackToTopBehavior behavior = DSBackToTopBehavior();

  static DSBackToTopConfig get defaultConfig => const DSBackToTopConfig();

  static DSBackToTopConfig get webOptimized => const DSBackToTopConfig(
    variant: DSBackToTopVariant.webOnly,
    spacing: DSBackToTopSpacing(
      size: 48,
      iconSize: 20,
      position: DSBackToTopPosition.bottomRight,
      margin: EdgeInsets.all(24),
    ),
    animations: DSBackToTopAnimations(
      duration: Duration(milliseconds: 250),
      scrollDuration: Duration(milliseconds: 600),
      scrollBehavior: DSBackToTopScrollBehavior.smooth,
    ),
    behavior: DSBackToTopBehavior(
      showAfterPixels: 300,
      autoHide: true,
      showOnScrollUp: true,
      smoothScrolling: true,
    ),
  );

  static DSBackToTopConfig get mobileOptimized => const DSBackToTopConfig(
    variant: DSBackToTopVariant.webOnly,
    spacing: DSBackToTopSpacing(
      size: 56,
      iconSize: 24,
      position: DSBackToTopPosition.bottomRight,
      margin: EdgeInsets.all(16),
    ),
    animations: DSBackToTopAnimations(
      duration: Duration(milliseconds: 300),
      scrollDuration: Duration(milliseconds: 500),
      scrollBehavior: DSBackToTopScrollBehavior.easeOut,
    ),
    behavior: DSBackToTopBehavior(
      showAfterPixels: 200,
      autoHide: false,
      showOnScrollUp: false,
      smoothScrolling: true,
      hapticFeedback: true,
    ),
  );

  static DSBackToTopConfig configForPosition(DSBackToTopPosition position) {
    EdgeInsets margin;

    switch (position) {
      case DSBackToTopPosition.bottomRight:
        margin = const EdgeInsets.only(right: 16, bottom: 16);
        break;
      case DSBackToTopPosition.bottomLeft:
        margin = const EdgeInsets.only(left: 16, bottom: 16);
        break;
      case DSBackToTopPosition.bottomCenter:
        margin = const EdgeInsets.only(bottom: 16);
        break;
      case DSBackToTopPosition.topRight:
        margin = const EdgeInsets.only(right: 16, top: 16);
        break;
      case DSBackToTopPosition.topLeft:
        margin = const EdgeInsets.only(left: 16, top: 16);
        break;
      case DSBackToTopPosition.topCenter:
        margin = const EdgeInsets.only(top: 16);
        break;
      case DSBackToTopPosition.centerRight:
        margin = const EdgeInsets.only(right: 16);
        break;
      case DSBackToTopPosition.centerLeft:
        margin = const EdgeInsets.only(left: 16);
        break;
    }

    return DSBackToTopConfig(
      spacing: DSBackToTopSpacing(
        position: position,
        margin: margin,
      ),
    );
  }

  static Alignment getAlignmentForPosition(DSBackToTopPosition position) {
    switch (position) {
      case DSBackToTopPosition.bottomRight:
        return Alignment.bottomRight;
      case DSBackToTopPosition.bottomLeft:
        return Alignment.bottomLeft;
      case DSBackToTopPosition.bottomCenter:
        return Alignment.bottomCenter;
      case DSBackToTopPosition.topRight:
        return Alignment.topRight;
      case DSBackToTopPosition.topLeft:
        return Alignment.topLeft;
      case DSBackToTopPosition.topCenter:
        return Alignment.topCenter;
      case DSBackToTopPosition.centerRight:
        return Alignment.centerRight;
      case DSBackToTopPosition.centerLeft:
        return Alignment.centerLeft;
    }
  }

  static IconData getDefaultIcon() => Icons.keyboard_arrow_up;

  static DSBackToTopConfig get minimalConfig => const DSBackToTopConfig(
    spacing: DSBackToTopSpacing(
      size: 40,
      iconSize: 18,
      elevation: 2,
    ),
    animations: DSBackToTopAnimations(
      duration: Duration(milliseconds: 200),
      scrollDuration: Duration(milliseconds: 400),
    ),
    behavior: DSBackToTopBehavior(
      showAfterPixels: 100,
      autoHide: true,
      showTooltip: false,
    ),
  );

  static DSBackToTopConfig get prominentConfig => const DSBackToTopConfig(
    spacing: DSBackToTopSpacing(
      size: 64,
      iconSize: 28,
      elevation: 12,
      borderRadius: 32,
    ),
    animations: DSBackToTopAnimations(
      duration: Duration(milliseconds: 400),
      scrollDuration: Duration(milliseconds: 1000),
      scaleEnabled: true,
    ),
    behavior: DSBackToTopBehavior(
      showAfterPixels: 400,
      showTooltip: true,
    ),
  );
}