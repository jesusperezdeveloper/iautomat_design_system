import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric_card_config.freezed.dart';

@freezed
class AppMetricCardConfig with _$AppMetricCardConfig {
  const AppMetricCardConfig._();

  const factory AppMetricCardConfig({
    @Default(AppMetricCardVariant.delta) AppMetricCardVariant variant,
    @Default(AppMetricCardState.defaultState) AppMetricCardState state,
    @Default(AppMetricCardSize.medium) AppMetricCardSize size,
    @Default(AppMetricCardLayout.vertical) AppMetricCardLayout layout,
    @Default(AppMetricCardAlignment.start) AppMetricCardAlignment alignment,
    @Default(AppMetricCardSpacing.normal) AppMetricCardSpacing spacing,
    required String title,
    required String value,
    String? subtitle,
    String? unit,
    AppMetricCardDelta? delta,
    List<AppMetricCardDataPoint>? trend,
    IconData? icon,
    Color? iconColor,
    Widget? prefix,
    Widget? suffix,
    Widget? customValueWidget,
    Widget? customDeltaWidget,
    Widget? customSparklineWidget,
    AppMetricCardStyle? style,
    AppMetricCardInteraction? interaction,
    AppMetricCardAccessibility? accessibility,
    AppMetricCardAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
  }) = _AppMetricCardConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == AppMetricCardState.disabled;
  bool get isLoading => loading || state == AppMetricCardState.loading;
  bool get isSkeleton => skeleton || state == AppMetricCardState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasDelta => delta != null;
  bool get hasTrend => trend != null && trend!.isNotEmpty;
  bool get hasIcon => icon != null;
  bool get hasPrefix => prefix != null;
  bool get hasSuffix => suffix != null;
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;
  bool get hasUnit => unit != null && unit!.isNotEmpty;
  bool get hasCustomValueWidget => customValueWidget != null;
  bool get hasCustomDeltaWidget => customDeltaWidget != null;
  bool get hasCustomSparklineWidget => customSparklineWidget != null;
}

@freezed
class AppMetricCardDelta with _$AppMetricCardDelta {
  const AppMetricCardDelta._();

  const factory AppMetricCardDelta({
    required double value,
    required AppMetricCardDeltaType type,
    String? label,
    String? unit,
    @Default(true) bool showIcon,
    @Default(true) bool showPercentage,
    @Default(AppMetricCardDeltaPeriod.day) AppMetricCardDeltaPeriod period,
    Color? color,
    IconData? icon,
    AppMetricCardDeltaStyle? style,
  }) = _AppMetricCardDelta;

  bool get isPositive => value > 0;
  bool get isNegative => value < 0;
  bool get isNeutral => value == 0;
  bool get hasLabel => label != null && label!.isNotEmpty;
  bool get hasUnit => unit != null && unit!.isNotEmpty;
  bool get hasCustomIcon => icon != null;
  bool get hasCustomColor => color != null;

  String get formattedValue {
    if (showPercentage) {
      return '${value >= 0 ? '+' : ''}${value.toStringAsFixed(1)}%';
    } else {
      return '${value >= 0 ? '+' : ''}${value.toStringAsFixed(hasUnit ? 1 : 0)}${hasUnit ? ' $unit' : ''}';
    }
  }

  IconData get defaultIcon {
    if (hasCustomIcon) return icon!;
    switch (type) {
      case AppMetricCardDeltaType.increase:
        return Icons.trending_up;
      case AppMetricCardDeltaType.decrease:
        return Icons.trending_down;
      case AppMetricCardDeltaType.neutral:
        return Icons.trending_flat;
    }
  }

  Color getDefaultColor(ColorScheme colorScheme) {
    if (hasCustomColor) return color!;
    switch (type) {
      case AppMetricCardDeltaType.increase:
        return Colors.green;
      case AppMetricCardDeltaType.decrease:
        return Colors.red;
      case AppMetricCardDeltaType.neutral:
        return colorScheme.onSurfaceVariant;
    }
  }
}

@freezed
class AppMetricCardDataPoint with _$AppMetricCardDataPoint {
  const factory AppMetricCardDataPoint({
    required double value,
    required DateTime timestamp,
    String? label,
    Color? color,
  }) = _AppMetricCardDataPoint;
}

enum AppMetricCardVariant {
  delta,
  sparkline,
}

enum AppMetricCardState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppMetricCardSize {
  small,
  medium,
  large,
}

enum AppMetricCardLayout {
  vertical,
  horizontal,
  compact,
}

enum AppMetricCardAlignment {
  start,
  center,
  end,
}

enum AppMetricCardSpacing {
  tight,
  normal,
  relaxed,
}

enum AppMetricCardDeltaType {
  increase,
  decrease,
  neutral,
}

enum AppMetricCardDeltaPeriod {
  hour,
  day,
  week,
  month,
  quarter,
  year,
}

@freezed
class AppMetricCardStyle with _$AppMetricCardStyle {
  const AppMetricCardStyle._();

  const factory AppMetricCardStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    double? borderWidth,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    TextStyle? titleTextStyle,
    TextStyle? valueTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? unitTextStyle,
    AppMetricCardDeltaStyle? deltaStyle,
    AppMetricCardSparklineStyle? sparklineStyle,
    double? iconSize,
    Color? iconColor,
    double? spacing,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
  }) = _AppMetricCardStyle;

  AppMetricCardStyle copyWithState(AppMetricCardState state) {
    switch (state) {
      case AppMetricCardState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 2,
        );
      case AppMetricCardState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 1,
        );
      case AppMetricCardState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppMetricCardState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppMetricCardState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          iconColor: iconColor?.withValues(alpha: 0.38),
        );
      case AppMetricCardState.loading:
      case AppMetricCardState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppMetricCardDeltaStyle with _$AppMetricCardDeltaStyle {
  const factory AppMetricCardDeltaStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? positiveColor,
    Color? negativeColor,
    Color? neutralColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    double? iconSize,
    double? spacing,
  }) = _AppMetricCardDeltaStyle;
}

@freezed
class AppMetricCardSparklineStyle with _$AppMetricCardSparklineStyle {
  const factory AppMetricCardSparklineStyle({
    Color? lineColor,
    Color? fillColor,
    Color? gridColor,
    double? lineWidth,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    @Default(false) bool showGrid,
    @Default(false) bool showFill,
    @Default(true) bool showLine,
    @Default(false) bool showPoints,
    double? pointRadius,
    Color? pointColor,
  }) = _AppMetricCardSparklineStyle;
}

@freezed
class AppMetricCardInteraction with _$AppMetricCardInteraction {
  const factory AppMetricCardInteraction({
    @Default(true) bool enabled,
    @Default(true) bool focusable,
    @Default(true) bool hoverable,
    @Default(false) bool autofocus,
    @Default(false) bool excludeFromSemantics,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    GestureTapCallback? onSecondaryTap,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _AppMetricCardInteraction;
}

@freezed
class AppMetricCardAccessibility with _$AppMetricCardAccessibility {
  const factory AppMetricCardAccessibility({
    String? semanticLabel,
    String? tooltip,
    bool? excludeSemantics,
    bool? obscureText,
    String? onTapHint,
    String? onLongPressHint,
    @Default(false) bool sortKey,
    @Default(false) bool liveRegion,
    @Default(false) bool focusable,
    @Default(false) bool button,
    @Default(false) bool link,
    @Default(false) bool header,
    @Default(false) bool readOnly,
  }) = _AppMetricCardAccessibility;
}

@freezed
class AppMetricCardAnimation with _$AppMetricCardAnimation {
  const factory AppMetricCardAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppMetricCardAnimationType.fade) AppMetricCardAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
  }) = _AppMetricCardAnimation;
}

enum AppMetricCardAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
}

extension AppMetricCardStateExtension on AppMetricCardState {
  bool get isInteractiveState =>
      this == AppMetricCardState.hover ||
      this == AppMetricCardState.pressed ||
      this == AppMetricCardState.focus;

  bool get isDisabledState => this == AppMetricCardState.disabled;
  bool get isLoadingState => this == AppMetricCardState.loading;
  bool get isSkeletonState => this == AppMetricCardState.skeleton;
  bool get isSelectedState => this == AppMetricCardState.selected;
}

extension AppMetricCardVariantExtension on AppMetricCardVariant {
  bool get isDelta => this == AppMetricCardVariant.delta;
  bool get isSparkline => this == AppMetricCardVariant.sparkline;
}

extension AppMetricCardSizeExtension on AppMetricCardSize {
  double get height {
    switch (this) {
      case AppMetricCardSize.small:
        return 80.0;
      case AppMetricCardSize.medium:
        return 120.0;
      case AppMetricCardSize.large:
        return 160.0;
    }
  }

  double get iconSize {
    switch (this) {
      case AppMetricCardSize.small:
        return 20.0;
      case AppMetricCardSize.medium:
        return 24.0;
      case AppMetricCardSize.large:
        return 28.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppMetricCardSize.small:
        return const EdgeInsets.all(12.0);
      case AppMetricCardSize.medium:
        return const EdgeInsets.all(16.0);
      case AppMetricCardSize.large:
        return const EdgeInsets.all(20.0);
    }
  }
}

extension AppMetricCardLayoutExtension on AppMetricCardLayout {
  bool get isVertical => this == AppMetricCardLayout.vertical;
  bool get isHorizontal => this == AppMetricCardLayout.horizontal;
  bool get isCompact => this == AppMetricCardLayout.compact;
}

extension AppMetricCardSpacingExtension on AppMetricCardSpacing {
  double get value {
    switch (this) {
      case AppMetricCardSpacing.tight:
        return 8.0;
      case AppMetricCardSpacing.normal:
        return 12.0;
      case AppMetricCardSpacing.relaxed:
        return 16.0;
    }
  }
}

extension AppMetricCardDeltaPeriodExtension on AppMetricCardDeltaPeriod {
  String get label {
    switch (this) {
      case AppMetricCardDeltaPeriod.hour:
        return 'vs última hora';
      case AppMetricCardDeltaPeriod.day:
        return 'vs ayer';
      case AppMetricCardDeltaPeriod.week:
        return 'vs semana pasada';
      case AppMetricCardDeltaPeriod.month:
        return 'vs mes pasado';
      case AppMetricCardDeltaPeriod.quarter:
        return 'vs trimestre pasado';
      case AppMetricCardDeltaPeriod.year:
        return 'vs año pasado';
    }
  }

  String get shortLabel {
    switch (this) {
      case AppMetricCardDeltaPeriod.hour:
        return '1h';
      case AppMetricCardDeltaPeriod.day:
        return '1d';
      case AppMetricCardDeltaPeriod.week:
        return '1w';
      case AppMetricCardDeltaPeriod.month:
        return '1m';
      case AppMetricCardDeltaPeriod.quarter:
        return '1q';
      case AppMetricCardDeltaPeriod.year:
        return '1y';
    }
  }
}

class AppMetricCardConstants {
  static const double defaultBorderRadius = 12.0;
  static const double defaultElevation = 2.0;
  static const double defaultBorderWidth = 1.0;
  static const double defaultIconSize = 24.0;
  static const double defaultSparklineHeight = 40.0;
  static const double defaultSparklineLineWidth = 2.0;
  static const double defaultDeltaIconSize = 16.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;
  static const EdgeInsetsGeometry defaultDeltaPadding =
      EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: 0.0,
    maxWidth: double.infinity,
    minHeight: 80.0,
    maxHeight: double.infinity,
  );

  static const BoxConstraints smallConstraints = BoxConstraints(
    minWidth: 0.0,
    maxWidth: double.infinity,
    minHeight: 80.0,
    maxHeight: 80.0,
  );

  static const BoxConstraints mediumConstraints = BoxConstraints(
    minWidth: 0.0,
    maxWidth: double.infinity,
    minHeight: 120.0,
    maxHeight: 120.0,
  );

  static const BoxConstraints largeConstraints = BoxConstraints(
    minWidth: 0.0,
    maxWidth: double.infinity,
    minHeight: 160.0,
    maxHeight: 160.0,
  );
}
