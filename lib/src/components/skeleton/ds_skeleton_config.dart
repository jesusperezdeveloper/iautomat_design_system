import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_skeleton_config.freezed.dart';

enum DSSkeletonVariant { universal }

enum DSSkeletonShape {
  rectangle,
  circle,
  roundedRectangle,
  line,
  avatar,
  button,
  card,
  text,
}

enum DSSkeletonState {
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
class DSSkeletonConfig with _$DSSkeletonConfig {
  const factory DSSkeletonConfig({
    @Default(DSSkeletonVariant.universal) DSSkeletonVariant variant,
    @Default(DSSkeletonState.skeleton) DSSkeletonState state,
    DSSkeletonColors? colors,
    DSSkeletonSpacing? spacing,
    DSSkeletonTypography? typography,
    DSSkeletonAnimations? animations,
    DSSkeletonAccessibility? accessibility,
    DSSkeletonBehavior? behavior,
  }) = _DSSkeletonConfig;

  const DSSkeletonConfig._();

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
class DSSkeletonColors with _$DSSkeletonColors {
  const factory DSSkeletonColors({
    Color? backgroundColor,
    Color? shimmerColor,
    Color? highlightColor,
    Color? borderColor,
    Color? shadowColor,
    @Default(0.8) double opacity,
    @Default(0.3) double shimmerOpacity,
  }) = _DSSkeletonColors;

  const DSSkeletonColors._();

  bool get isValid {
    return opacity >= 0.0 &&
        opacity <= 1.0 &&
        shimmerOpacity >= 0.0 &&
        shimmerOpacity <= 1.0;
  }
}

@freezed
class DSSkeletonSpacing with _$DSSkeletonSpacing {
  const factory DSSkeletonSpacing({
    double? width,
    double? height,
    @Default(8.0) double borderRadius,
    @Default(EdgeInsets.zero) EdgeInsets padding,
    @Default(EdgeInsets.zero) EdgeInsets margin,
    @Default(0.0) double elevation,
  }) = _DSSkeletonSpacing;

  const DSSkeletonSpacing._();

  bool get isValid {
    return borderRadius >= 0 &&
        elevation >= 0 &&
        (width == null || width! >= 0) &&
        (height == null || height! >= 0);
  }
}

@freezed
class DSSkeletonTypography with _$DSSkeletonTypography {
  const factory DSSkeletonTypography({
    TextStyle? textStyle,
    @Default(14.0) double fontSize,
    @Default(1.4) double lineHeight,
  }) = _DSSkeletonTypography;

  const DSSkeletonTypography._();

  bool get isValid {
    return fontSize > 0 && lineHeight > 0;
  }
}

@freezed
class DSSkeletonAnimations with _$DSSkeletonAnimations {
  const factory DSSkeletonAnimations({
    @Default(Duration(milliseconds: 1200)) Duration duration,
    @Default(Duration(milliseconds: 300)) Duration fadeInDuration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(1.5) double shimmerSpeed,
    @Default(true) bool enabled,
    @Default(true) bool shimmerEnabled,
    @Default(false) bool pulseEnabled,
  }) = _DSSkeletonAnimations;

  const DSSkeletonAnimations._();

  bool get isValid {
    return duration.inMilliseconds > 0 &&
        fadeInDuration.inMilliseconds >= 0 &&
        shimmerSpeed > 0;
  }
}

@freezed
class DSSkeletonAccessibility with _$DSSkeletonAccessibility {
  const factory DSSkeletonAccessibility({
    @Default(true) bool enabled,
    @Default(true) bool focusable,
    @Default('Cargando contenido') String loadingLabel,
    @Default('Contenido cargado') String loadedLabel,
    @Default('Contenido no disponible') String disabledLabel,
    String? customLabel,
    String? hint,
  }) = _DSSkeletonAccessibility;
}

@freezed
class DSSkeletonBehavior with _$DSSkeletonBehavior {
  const factory DSSkeletonBehavior({
    @Default(true) bool animateOnLoad,
    @Default(false) bool hideOnContent,
    @Default(true) bool maintainSize,
    @Default(false) bool showBorder,
    @Default(false) bool showShadow,
    @Default(Duration(seconds: 10)) Duration maxDuration,
  }) = _DSSkeletonBehavior;

  const DSSkeletonBehavior._();

  bool get isValid {
    return maxDuration.inMilliseconds > 0;
  }
}

class DSSkeletonDefaults {
  static const DSSkeletonColors colors = DSSkeletonColors();
  static const DSSkeletonSpacing spacing = DSSkeletonSpacing();
  static const DSSkeletonTypography typography = DSSkeletonTypography();
  static const DSSkeletonAnimations animations = DSSkeletonAnimations();
  static const DSSkeletonAccessibility accessibility =
      DSSkeletonAccessibility();
  static const DSSkeletonBehavior behavior = DSSkeletonBehavior();

  static DSSkeletonConfig get defaultConfig => const DSSkeletonConfig();

  static DSSkeletonConfig configForShape(DSSkeletonShape shape) {
    switch (shape) {
      case DSSkeletonShape.circle:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(width: 40, height: 40, borderRadius: 20),
        );

      case DSSkeletonShape.avatar:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(width: 48, height: 48, borderRadius: 24),
        );

      case DSSkeletonShape.button:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(width: 120, height: 36, borderRadius: 8),
        );

      case DSSkeletonShape.card:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(
            width: double.infinity,
            height: 200,
            borderRadius: 12,
          ),
        );

      case DSSkeletonShape.text:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(
            width: double.infinity,
            height: 16,
            borderRadius: 4,
          ),
        );

      case DSSkeletonShape.line:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(
            width: double.infinity,
            height: 1,
            borderRadius: 0,
          ),
        );

      case DSSkeletonShape.roundedRectangle:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(width: 120, height: 80, borderRadius: 16),
        );

      case DSSkeletonShape.rectangle:
        return const DSSkeletonConfig(
          spacing: DSSkeletonSpacing(width: 120, height: 80, borderRadius: 0),
        );
    }
  }

  static List<DSSkeletonConfig> textLines({
    int count = 3,
    double? lastLineWidthFactor,
  }) {
    return List.generate(count, (index) {
      final isLast = index == count - 1;
      final widthFactor = isLast && lastLineWidthFactor != null
          ? lastLineWidthFactor
          : 1.0;

      return DSSkeletonConfig(
        spacing: DSSkeletonSpacing(
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

  static DSSkeletonConfig get listItem => const DSSkeletonConfig(
    spacing: DSSkeletonSpacing(
      width: double.infinity,
      height: 60,
      borderRadius: 8,
      margin: EdgeInsets.only(bottom: 8),
    ),
  );

  static DSSkeletonConfig get image => const DSSkeletonConfig(
    spacing: DSSkeletonSpacing(
      width: double.infinity,
      height: 200,
      borderRadius: 8,
    ),
  );
}
