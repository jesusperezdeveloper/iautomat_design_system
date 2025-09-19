import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_config.freezed.dart';

@freezed
class DSTimelineConfig with _$DSTimelineConfig {
  const DSTimelineConfig._();

  const factory DSTimelineConfig({
    @Default(DSTimelineVariant.activity) DSTimelineVariant variant,
    @Default(DSTimelineState.defaultState) DSTimelineState state,
    @Default(<DSTimelineEvent>[]) List<DSTimelineEvent> events,
    @Default(DSTimelineOrientation.vertical)
    DSTimelineOrientation orientation,
    @Default(DSTimelineConnectorStyle.solid)
    DSTimelineConnectorStyle connectorStyle,
    @Default(DSTimelineIndicatorStyle.dot)
    DSTimelineIndicatorStyle indicatorStyle,
    @Default(DSTimelineAlignment.start) DSTimelineAlignment alignment,
    @Default(DSTimelineSpacing.medium) DSTimelineSpacing spacing,
    Color? connectorColor,
    Color? indicatorColor,
    Color? backgroundColor,
    Color? foregroundColor,
    double? connectorWidth,
    double? indicatorSize,
    double? itemSpacing,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    DSTimelineStyle? style,
    DSTimelineInteraction? interaction,
    DSTimelineAccessibility? accessibility,
    DSTimelineAnimation? animation,
    ValueChanged<int>? onEventTap,
    ValueChanged<int>? onEventLongPress,
    ValueChanged<int>? onEventHover,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
    @Default(false) bool interactive,
    @Default(false) bool scrollable,
    @Default(false) bool reversed,
    @Default(false) bool shrinkWrap,
    int? selectedIndex,
    ScrollController? scrollController,
  }) = _DSTimelineConfig;

  bool get isInteractive => onTap != null || onEventTap != null || interactive;
  bool get isHoverable => onHover != null || onEventHover != null;
  bool get isDisabled => !enabled || state == DSTimelineState.disabled;
  bool get isLoading => loading || state == DSTimelineState.loading;
  bool get isSkeleton => skeleton || state == DSTimelineState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasEvents => events.isNotEmpty;
  bool get isHorizontal => orientation == DSTimelineOrientation.horizontal;
  bool get isVertical => orientation == DSTimelineOrientation.vertical;
  bool get hasSelection => selectedIndex != null;
  bool get isReversed => reversed;

  double getEffectiveConnectorWidth() {
    if (connectorWidth != null) return connectorWidth!;
    return DSTimelineConstants.defaultConnectorWidth;
  }

  double getEffectiveIndicatorSize() {
    if (indicatorSize != null) return indicatorSize!;
    return spacing.indicatorSize;
  }

  double getEffectiveItemSpacing() {
    if (itemSpacing != null) return itemSpacing!;
    return spacing.itemSpacing;
  }

  Color getEffectiveConnectorColor(ColorScheme colorScheme) {
    if (connectorColor != null) return connectorColor!;
    return colorScheme.outline.withValues(alpha: 0.5);
  }

  Color getEffectiveIndicatorColor(ColorScheme colorScheme) {
    if (indicatorColor != null) return indicatorColor!;
    return colorScheme.primary;
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;
    return colorScheme.surface;
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;
    return colorScheme.onSurface;
  }

  EdgeInsetsGeometry getEffectivePadding() {
    if (padding != null) return padding!;
    return spacing.padding;
  }

  EdgeInsetsGeometry getEffectiveMargin() {
    if (margin != null) return margin!;
    return DSTimelineConstants.defaultMargin;
  }
}

@freezed
class DSTimelineEvent with _$DSTimelineEvent {
  const DSTimelineEvent._();

  const factory DSTimelineEvent({
    required String id,
    String? title,
    String? subtitle,
    String? description,
    DateTime? timestamp,
    Widget? content,
    Widget? leading,
    Widget? trailing,
    IconData? icon,
    Color? iconColor,
    Color? backgroundColor,
    Color? borderColor,
    String? semanticLabel,
    DSTimelineEventType? type,
    DSTimelineEventStatus? status,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    @Default(true) bool enabled,
    @Default(true) bool visible,
    @Default(false) bool selected,
    @Default(false) bool highlighted,
    @Default(false) bool isStart,
    @Default(false) bool isEnd,
  }) = _DSTimelineEvent;

  bool get hasTitle => title != null && title!.isNotEmpty;
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;
  bool get hasDescription => description != null && description!.isNotEmpty;
  bool get hasContent => content != null;
  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get hasIcon => icon != null;
  bool get hasTimestamp => timestamp != null;
  bool get isInteractive =>
      onTap != null || onLongPress != null || onHover != null;
  bool get isDisabled => !enabled;
  bool get isVisible => visible;
  bool get isSelected => selected;
  bool get isHighlighted => highlighted;
  bool get isStartEvent => isStart;
  bool get isEndEvent => isEnd;

  String get displayTitle => title ?? '';
  String get displaySubtitle => subtitle ?? '';
  String get displayDescription => description ?? '';

  Color getEffectiveIconColor(ColorScheme colorScheme) {
    if (iconColor != null) return iconColor!;
    if (status != null) return status!.getColor(colorScheme);
    return colorScheme.primary;
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;
    if (isSelected) return colorScheme.primaryContainer;
    if (isHighlighted) return colorScheme.secondaryContainer;
    return colorScheme.surface;
  }

  Color getEffectiveBorderColor(ColorScheme colorScheme) {
    if (borderColor != null) return borderColor!;
    if (isSelected) return colorScheme.primary;
    return colorScheme.outline.withValues(alpha: 0.2);
  }
}

enum DSTimelineVariant {
  activity,
}

enum DSTimelineState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSTimelineOrientation {
  vertical,
  horizontal,
}

enum DSTimelineConnectorStyle {
  solid,
  dashed,
  dotted,
  none,
}

enum DSTimelineIndicatorStyle {
  dot,
  circle,
  square,
  diamond,
  icon,
  custom,
}

enum DSTimelineAlignment {
  start,
  center,
  end,
  alternate,
}

enum DSTimelineSpacing {
  compact,
  medium,
  comfortable,
}

enum DSTimelineEventType {
  milestone,
  task,
  meeting,
  deadline,
  note,
  success,
  warning,
  error,
  info,
}

enum DSTimelineEventStatus {
  pending,
  inProgress,
  completed,
  cancelled,
  overdue,
}

extension DSTimelineVariantExtension on DSTimelineVariant {
  bool get isActivity => this == DSTimelineVariant.activity;
}

extension DSTimelineStateExtension on DSTimelineState {
  bool get isInteractiveState =>
      this == DSTimelineState.hover ||
      this == DSTimelineState.pressed ||
      this == DSTimelineState.focus;

  bool get isDisabledState => this == DSTimelineState.disabled;
  bool get isLoadingState => this == DSTimelineState.loading;
  bool get isSkeletonState => this == DSTimelineState.skeleton;
  bool get isSelectedState => this == DSTimelineState.selected;
}

extension DSTimelineSpacingExtension on DSTimelineSpacing {
  double get itemSpacing {
    switch (this) {
      case DSTimelineSpacing.compact:
        return 12.0;
      case DSTimelineSpacing.medium:
        return 16.0;
      case DSTimelineSpacing.comfortable:
        return 24.0;
    }
  }

  double get indicatorSize {
    switch (this) {
      case DSTimelineSpacing.compact:
        return 12.0;
      case DSTimelineSpacing.medium:
        return 16.0;
      case DSTimelineSpacing.comfortable:
        return 20.0;
    }
  }

  double get connectorIndent {
    switch (this) {
      case DSTimelineSpacing.compact:
        return 24.0;
      case DSTimelineSpacing.medium:
        return 32.0;
      case DSTimelineSpacing.comfortable:
        return 40.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSTimelineSpacing.compact:
        return const EdgeInsets.all(8.0);
      case DSTimelineSpacing.medium:
        return const EdgeInsets.all(12.0);
      case DSTimelineSpacing.comfortable:
        return const EdgeInsets.all(16.0);
    }
  }

  EdgeInsetsGeometry get itemPadding {
    switch (this) {
      case DSTimelineSpacing.compact:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case DSTimelineSpacing.medium:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case DSTimelineSpacing.comfortable:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
  }
}

extension DSTimelineEventTypeExtension on DSTimelineEventType {
  IconData get defaultIcon {
    switch (this) {
      case DSTimelineEventType.milestone:
        return Icons.flag;
      case DSTimelineEventType.task:
        return Icons.task_alt;
      case DSTimelineEventType.meeting:
        return Icons.meeting_room;
      case DSTimelineEventType.deadline:
        return Icons.schedule;
      case DSTimelineEventType.note:
        return Icons.note;
      case DSTimelineEventType.success:
        return Icons.check_circle;
      case DSTimelineEventType.warning:
        return Icons.warning;
      case DSTimelineEventType.error:
        return Icons.error;
      case DSTimelineEventType.info:
        return Icons.info;
    }
  }

  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSTimelineEventType.milestone:
        return colorScheme.primary;
      case DSTimelineEventType.task:
        return colorScheme.secondary;
      case DSTimelineEventType.meeting:
        return Colors.blue;
      case DSTimelineEventType.deadline:
        return Colors.orange;
      case DSTimelineEventType.note:
        return colorScheme.outline;
      case DSTimelineEventType.success:
        return Colors.green;
      case DSTimelineEventType.warning:
        return Colors.orange;
      case DSTimelineEventType.error:
        return colorScheme.error;
      case DSTimelineEventType.info:
        return Colors.blue;
    }
  }

  String get label {
    switch (this) {
      case DSTimelineEventType.milestone:
        return 'Hito';
      case DSTimelineEventType.task:
        return 'Tarea';
      case DSTimelineEventType.meeting:
        return 'Reunión';
      case DSTimelineEventType.deadline:
        return 'Fecha límite';
      case DSTimelineEventType.note:
        return 'Nota';
      case DSTimelineEventType.success:
        return 'Éxito';
      case DSTimelineEventType.warning:
        return 'Advertencia';
      case DSTimelineEventType.error:
        return 'Error';
      case DSTimelineEventType.info:
        return 'Información';
    }
  }
}

extension DSTimelineEventStatusExtension on DSTimelineEventStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSTimelineEventStatus.pending:
        return colorScheme.outline;
      case DSTimelineEventStatus.inProgress:
        return Colors.blue;
      case DSTimelineEventStatus.completed:
        return Colors.green;
      case DSTimelineEventStatus.cancelled:
        return colorScheme.error;
      case DSTimelineEventStatus.overdue:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case DSTimelineEventStatus.pending:
        return Icons.pending;
      case DSTimelineEventStatus.inProgress:
        return Icons.play_circle;
      case DSTimelineEventStatus.completed:
        return Icons.check_circle;
      case DSTimelineEventStatus.cancelled:
        return Icons.cancel;
      case DSTimelineEventStatus.overdue:
        return Icons.warning;
    }
  }

  String get label {
    switch (this) {
      case DSTimelineEventStatus.pending:
        return 'Pendiente';
      case DSTimelineEventStatus.inProgress:
        return 'En progreso';
      case DSTimelineEventStatus.completed:
        return 'Completado';
      case DSTimelineEventStatus.cancelled:
        return 'Cancelado';
      case DSTimelineEventStatus.overdue:
        return 'Vencido';
    }
  }
}

@freezed
class DSTimelineStyle with _$DSTimelineStyle {
  const DSTimelineStyle._();

  const factory DSTimelineStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? connectorColor,
    Color? indicatorColor,
    Color? shadowColor,
    Color? overlayColor,
    double? connectorWidth,
    double? indicatorSize,
    double? itemSpacing,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? descriptionStyle,
    TextStyle? timestampStyle,
    Offset? offset,
  }) = _DSTimelineStyle;

  DSTimelineStyle copyWithState(DSTimelineState state) {
    switch (state) {
      case DSTimelineState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case DSTimelineState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case DSTimelineState.focus:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
        );
      case DSTimelineState.selected:
        return copyWith(
          elevation: (elevation ?? 0) + 2,
        );
      case DSTimelineState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSTimelineState.loading:
      case DSTimelineState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSTimelineInteraction with _$DSTimelineInteraction {
  const factory DSTimelineInteraction({
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
    ValueChanged<int>? onEventTap,
    ValueChanged<int>? onEventLongPress,
    ValueChanged<int>? onEventHover,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _DSTimelineInteraction;
}

@freezed
class DSTimelineAccessibility with _$DSTimelineAccessibility {
  const factory DSTimelineAccessibility({
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
    @Default(false) bool list,
    @Default(false) bool readOnly,
  }) = _DSTimelineAccessibility;
}

@freezed
class DSTimelineAnimation with _$DSTimelineAnimation {
  const factory DSTimelineAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSTimelineAnimationType.fade) DSTimelineAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool staggered,
    @Default(Duration(milliseconds: 100)) Duration staggerDelay,
    @Default(false) bool autoPlay,
  }) = _DSTimelineAnimation;
}

enum DSTimelineAnimationType {
  none,
  fade,
  slide,
  scale,
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
  stagger,
}

class DSTimelineConstants {
  static const double defaultConnectorWidth = 2.0;
  static const double defaultIndicatorSize = 16.0;
  static const double defaultItemSpacing = 16.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration defaultStaggerDelay = Duration(milliseconds: 100);

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(12.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;
  static const EdgeInsetsGeometry defaultItemPadding =
      EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: double.infinity,
  );

  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 0.0;
  static const double selectedElevation = 2.0;
}
