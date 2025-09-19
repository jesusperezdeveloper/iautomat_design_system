import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric_card_config.freezed.dart';

@freezed
class DSMetricCardConfig with _$DSMetricCardConfig {
  const DSMetricCardConfig._();

  const factory DSMetricCardConfig({
    @Default(DSMetricCardVariant.delta) DSMetricCardVariant variant,
    @Default(DSMetricCardState.defaultState) DSMetricCardState state,
    @Default(DSMetricCardSize.medium) DSMetricCardSize size,
    @Default(DSMetricCardLayout.vertical) DSMetricCardLayout layout,
    @Default(DSMetricCardAlignment.start) DSMetricCardAlignment alignment,
    @Default(DSMetricCardSpacing.normal) DSMetricCardSpacing spacing,
    required String title,
    required String value,
    String? subtitle,
    String? unit,
    DSMetricCardDelta? delta,
    List<DSMetricCardDataPoint>? trend,
    IconData? icon,
    Color? iconColor,
    Widget? prefix,
    Widget? suffix,
    Widget? customValueWidget,
    Widget? customDeltaWidget,
    Widget? customSparklineWidget,
    DSMetricCardStyle? style,
    DSMetricCardInteraction? interaction,
    DSMetricCardAccessibility? accessibility,
    DSMetricCardAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
  }) = _DSMetricCardConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == DSMetricCardState.disabled;
  bool get isLoading => loading || state == DSMetricCardState.loading;
  bool get isSkeleton => skeleton || state == DSMetricCardState.skeleton;
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
class DSMetricCardDelta with _$DSMetricCardDelta {
  const DSMetricCardDelta._();

  const factory DSMetricCardDelta({
    required double value,
    required DSMetricCardDeltaType type,
    String? label,
    String? unit,
    @Default(true) bool showIcon,
    @Default(true) bool showPercentage,
    @Default(DSMetricCardDeltaPeriod.day) DSMetricCardDeltaPeriod period,
    Color? color,
    IconData? icon,
    DSMetricCardDeltaStyle? style,
  }) = _DSMetricCardDelta;

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
      case DSMetricCardDeltaType.increase:
        return Icons.trending_up;
      case DSMetricCardDeltaType.decrease:
        return Icons.trending_down;
      case DSMetricCardDeltaType.neutral:
        return Icons.trending_flat;
    }
  }

  Color getDefaultColor(ColorScheme colorScheme) {
    if (hasCustomColor) return color!;
    switch (type) {
      case DSMetricCardDeltaType.increase:
        return Colors.green;
      case DSMetricCardDeltaType.decrease:
        return Colors.red;
      case DSMetricCardDeltaType.neutral:
        return colorScheme.onSurfaceVariant;
    }
  }
}

@freezed
class DSMetricCardDataPoint with _$DSMetricCardDataPoint {
  const factory DSMetricCardDataPoint({
    required double value,
    required DateTime timestamp,
    String? label,
    Color? color,
  }) = _DSMetricCardDataPoint;
}

enum DSMetricCardVariant {
  delta,
  sparkline,
}

enum DSMetricCardState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSMetricCardSize {
  small,
  medium,
  large,
}

enum DSMetricCardLayout {
  vertical,
  horizontal,
  compact,
}

enum DSMetricCardAlignment {
  start,
  center,
  end,
}

enum DSMetricCardSpacing {
  tight,
  normal,
  relaxed,
}

enum DSMetricCardDeltaType {
  increase,
  decrease,
  neutral,
}

enum DSMetricCardDeltaPeriod {
  hour,
  day,
  week,
  month,
  quarter,
  year,
}

@freezed
class DSMetricCardStyle with _$DSMetricCardStyle {
  const DSMetricCardStyle._();

  const factory DSMetricCardStyle({
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
    DSMetricCardDeltaStyle? deltaStyle,
    DSMetricCardSparklineStyle? sparklineStyle,
    double? iconSize,
    Color? iconColor,
    double? spacing,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
  }) = _DSMetricCardStyle;

  DSMetricCardStyle copyWithState(DSMetricCardState state) {
    switch (state) {
      case DSMetricCardState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 2,
        );
      case DSMetricCardState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 1,
        );
      case DSMetricCardState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSMetricCardState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSMetricCardState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          iconColor: iconColor?.withValues(alpha: 0.38),
        );
      case DSMetricCardState.loading:
      case DSMetricCardState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSMetricCardDeltaStyle with _$DSMetricCardDeltaStyle {
  const factory DSMetricCardDeltaStyle({
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
  }) = _DSMetricCardDeltaStyle;
}

@freezed
class DSMetricCardSparklineStyle with _$DSMetricCardSparklineStyle {
  const factory DSMetricCardSparklineStyle({
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
  }) = _DSMetricCardSparklineStyle;
}

@freezed
class DSMetricCardInteraction with _$DSMetricCardInteraction {
  const factory DSMetricCardInteraction({
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
  }) = _DSMetricCardInteraction;
}

@freezed
class DSMetricCardAccessibility with _$DSMetricCardAccessibility {
  const factory DSMetricCardAccessibility({
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
  }) = _DSMetricCardAccessibility;
}

@freezed
class DSMetricCardAnimation with _$DSMetricCardAnimation {
  const factory DSMetricCardAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSMetricCardAnimationType.fade) DSMetricCardAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
  }) = _DSMetricCardAnimation;
}

enum DSMetricCardAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
}

extension DSMetricCardStateExtension on DSMetricCardState {
  bool get isInteractiveState =>
      this == DSMetricCardState.hover ||
      this == DSMetricCardState.pressed ||
      this == DSMetricCardState.focus;

  bool get isDisabledState => this == DSMetricCardState.disabled;
  bool get isLoadingState => this == DSMetricCardState.loading;
  bool get isSkeletonState => this == DSMetricCardState.skeleton;
  bool get isSelectedState => this == DSMetricCardState.selected;
}

extension DSMetricCardVariantExtension on DSMetricCardVariant {
  bool get isDelta => this == DSMetricCardVariant.delta;
  bool get isSparkline => this == DSMetricCardVariant.sparkline;
}

extension DSMetricCardSizeExtension on DSMetricCardSize {
  double get height {
    switch (this) {
      case DSMetricCardSize.small:
        return 80.0;
      case DSMetricCardSize.medium:
        return 120.0;
      case DSMetricCardSize.large:
        return 160.0;
    }
  }

  double get iconSize {
    switch (this) {
      case DSMetricCardSize.small:
        return 20.0;
      case DSMetricCardSize.medium:
        return 24.0;
      case DSMetricCardSize.large:
        return 28.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSMetricCardSize.small:
        return const EdgeInsets.all(12.0);
      case DSMetricCardSize.medium:
        return const EdgeInsets.all(16.0);
      case DSMetricCardSize.large:
        return const EdgeInsets.all(20.0);
    }
  }
}

extension DSMetricCardLayoutExtension on DSMetricCardLayout {
  bool get isVertical => this == DSMetricCardLayout.vertical;
  bool get isHorizontal => this == DSMetricCardLayout.horizontal;
  bool get isCompact => this == DSMetricCardLayout.compact;
}

extension DSMetricCardSpacingExtension on DSMetricCardSpacing {
  double get value {
    switch (this) {
      case DSMetricCardSpacing.tight:
        return 8.0;
      case DSMetricCardSpacing.normal:
        return 12.0;
      case DSMetricCardSpacing.relaxed:
        return 16.0;
    }
  }
}

extension DSMetricCardDeltaPeriodExtension on DSMetricCardDeltaPeriod {
  String get label {
    switch (this) {
      case DSMetricCardDeltaPeriod.hour:
        return 'vs última hora';
      case DSMetricCardDeltaPeriod.day:
        return 'vs ayer';
      case DSMetricCardDeltaPeriod.week:
        return 'vs semana pasada';
      case DSMetricCardDeltaPeriod.month:
        return 'vs mes pasado';
      case DSMetricCardDeltaPeriod.quarter:
        return 'vs trimestre pasado';
      case DSMetricCardDeltaPeriod.year:
        return 'vs año pasado';
    }
  }

  String get shortLabel {
    switch (this) {
      case DSMetricCardDeltaPeriod.hour:
        return '1h';
      case DSMetricCardDeltaPeriod.day:
        return '1d';
      case DSMetricCardDeltaPeriod.week:
        return '1w';
      case DSMetricCardDeltaPeriod.month:
        return '1m';
      case DSMetricCardDeltaPeriod.quarter:
        return '1q';
      case DSMetricCardDeltaPeriod.year:
        return '1y';
    }
  }
}

class DSMetricCardConstants {
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
