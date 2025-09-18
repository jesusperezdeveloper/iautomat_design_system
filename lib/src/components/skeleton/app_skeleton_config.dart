import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_skeleton_config.freezed.dart';

enum AppSkeletonVariant { universal }

enum AppSkeletonShape {
  rectangle,
  circle,
  roundedRectangle,
  line,
  avatar,
  button,
  card,
  text,
}

enum AppSkeletonState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

@freezed
class AppSkeletonConfig with _$AppSkeletonConfig {
  const factory AppSkeletonConfig({
    @Default(AppSkeletonVariant.universal) AppSkeletonVariant variant,
    @Default(AppSkeletonState.skeleton) AppSkeletonState state,
    AppSkeletonColors? colors,
    AppSkeletonSpacing? spacing,
    AppSkeletonTypography? typography,
    AppSkeletonAnimations? animations,
    AppSkeletonAccessibility? accessibility,
    AppSkeletonBehavior? behavior,
  }) = _AppSkeletonConfig;

  const AppSkeletonConfig._();

  bool get isValid {
    if (spacing != null) {
      if (spacing!.width != null && spacing!.width! < 0) return false;
      if (spacing!.height != null && spacing!.height! < 0) return false;
      if (spacing!.borderRadius < 0) return false;
    }

    if (animations != null) {
      if (animations!.duration.inMilliseconds < 0) return false;
      if (animations!.shimmerSpeed < 0) return false;
    }

    return true;
  }
}

@freezed
class AppSkeletonColors with _$AppSkeletonColors {
  const factory AppSkeletonColors({
    Color? backgroundColor,
    Color? shimmerColor,
    Color? highlightColor,
    Color? borderColor,
    Color? shadowColor,
    @Default(0.8) double opacity,
    @Default(0.3) double shimmerOpacity,
  }) = _AppSkeletonColors;

  const AppSkeletonColors._();

  bool get isValid {
    return opacity >= 0.0 &&
        opacity <= 1.0 &&
        shimmerOpacity >= 0.0 &&
        shimmerOpacity <= 1.0;
  }
}

@freezed
class AppSkeletonSpacing with _$AppSkeletonSpacing {
  const factory AppSkeletonSpacing({
    double? width,
    double? height,
    @Default(8.0) double borderRadius,
    @Default(EdgeInsets.zero) EdgeInsets padding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(0.0) double elevation,
  }) = _AppSkeletonSpacing;

  const AppSkeletonSpacing._();

  bool get isValid {
    return borderRadius >= 0 &&
        elevation >= 0 &&
        (width == null || width! >= 0) &&
        (height == null || height! >= 0);
  }
}

@freezed
class AppSkeletonTypography with _$AppSkeletonTypography {
  const factory AppSkeletonTypography({
    TextStyle? textStyle,
    @Default(14.0) double fontSize,
    @Default(1.4) double lineHeight,
  }) = _AppSkeletonTypography;

  const AppSkeletonTypography._();

  bool get isValid {
    return fontSize > 0 && lineHeight > 0;
  }
}

@freezed
class AppSkeletonAnimations with _$AppSkeletonAnimations {
  const factory AppSkeletonAnimations({
    @Default(Duration(milliseconds: 1200)) Duration duration,
    @Default(Duration(milliseconds: 300)) Duration fadeInDuration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(1.5) double shimmerSpeed,
    @Default(true) bool enabled,
    @Default(true) bool shimmerEnabled,
    @Default(false) bool pulseEnabled,
  }) = _AppSkeletonAnimations;

  const AppSkeletonAnimations._();

  bool get isValid {
    return duration.inMilliseconds > 0 &&
        fadeInDuration.inMilliseconds >= 0 &&
        shimmerSpeed > 0;
  }
}

@freezed
class AppSkeletonAccessibility with _$AppSkeletonAccessibility {
  const factory AppSkeletonAccessibility({
    @Default(true) bool enabled,
    @Default(true) bool focusable,
    @Default('Cargando contenido') String loadingLabel,
    @Default('Contenido cargado') String loadedLabel,
    @Default('Contenido no disponible') String disabledLabel,
    String? customLabel,
    String? hint,
  }) = _AppSkeletonAccessibility;
}

@freezed
class AppSkeletonBehavior with _$AppSkeletonBehavior {
  const factory AppSkeletonBehavior({
    @Default(true) bool animateOnLoad,
    @Default(false) bool hideOnContent,
    @Default(true) bool maintainSize,
    @Default(false) bool showBorder,
    @Default(false) bool showShadow,
    @Default(Duration(seconds: 10)) Duration maxDuration,
  }) = _AppSkeletonBehavior;

  const AppSkeletonBehavior._();

  bool get isValid {
    return maxDuration.inMilliseconds > 0;
  }
}

class AppSkeletonDefaults {
  static const AppSkeletonColors colors = AppSkeletonColors();
  static const AppSkeletonSpacing spacing = AppSkeletonSpacing();
  static const AppSkeletonTypography typography = AppSkeletonTypography();
  static const AppSkeletonAnimations animations = AppSkeletonAnimations();
  static const AppSkeletonAccessibility accessibility =
      AppSkeletonAccessibility();
  static const AppSkeletonBehavior behavior = AppSkeletonBehavior();

  static AppSkeletonConfig get defaultConfig => const AppSkeletonConfig();

  static AppSkeletonConfig configForShape(AppSkeletonShape shape) {
    switch (shape) {
      case AppSkeletonShape.circle:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(width: 40, height: 40, borderRadius: 20),
        );

      case AppSkeletonShape.avatar:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(width: 48, height: 48, borderRadius: 24),
        );

      case AppSkeletonShape.button:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(width: 120, height: 36, borderRadius: 8),
        );

      case AppSkeletonShape.card:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(
            width: double.infinity,
            height: 200,
            borderRadius: 12,
          ),
        );

      case AppSkeletonShape.text:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(
            width: double.infinity,
            height: 16,
            borderRadius: 4,
          ),
        );

      case AppSkeletonShape.line:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(
            width: double.infinity,
            height: 1,
            borderRadius: 0,
          ),
        );

      case AppSkeletonShape.roundedRectangle:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(width: 120, height: 80, borderRadius: 16),
        );

      case AppSkeletonShape.rectangle:
        return const AppSkeletonConfig(
          spacing: AppSkeletonSpacing(width: 120, height: 80, borderRadius: 0),
        );
    }
  }

  static List<AppSkeletonConfig> textLines({
    int count = 3,
    double? lastLineWidthFactor,
  }) {
    return List.generate(count, (index) {
      final isLast = index == count - 1;
      final widthFactor = isLast && lastLineWidthFactor != null
          ? lastLineWidthFactor
          : 1.0;

      return AppSkeletonConfig(
        spacing: AppSkeletonSpacing(
          width: widthFactor == 1.0 ? double.infinity : null,
          height: 16,
          borderRadius: 4,
          margin: EdgeInsets.only(
            bottom: index < count - 1 ? 8 : 0,
            right: widthFactor != 1.0 ? (1.0 - widthFactor) * 200 : 0,
          ),
        ),
      );
    });
  }

  static AppSkeletonConfig get listItem => const AppSkeletonConfig(
    spacing: AppSkeletonSpacing(
      width: double.infinity,
      height: 60,
      borderRadius: 8,
      margin: EdgeInsets.only(bottom: 8),
    ),
  );

  static AppSkeletonConfig get image => const AppSkeletonConfig(
    spacing: AppSkeletonSpacing(
      width: double.infinity,
      height: 200,
      borderRadius: 8,
    ),
  );
}
