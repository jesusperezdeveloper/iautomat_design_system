import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_config.freezed.dart';

@freezed
class AppTimelineConfig with _$AppTimelineConfig {
  const AppTimelineConfig._();

  const factory AppTimelineConfig({
    @Default(AppTimelineVariant.activity) AppTimelineVariant variant,
    @Default(AppTimelineState.defaultState) AppTimelineState state,
    @Default(<AppTimelineEvent>[]) List<AppTimelineEvent> events,
    @Default(AppTimelineOrientation.vertical) AppTimelineOrientation orientation,
    @Default(AppTimelineConnectorStyle.solid) AppTimelineConnectorStyle connectorStyle,
    @Default(AppTimelineIndicatorStyle.dot) AppTimelineIndicatorStyle indicatorStyle,
    @Default(AppTimelineAlignment.start) AppTimelineAlignment alignment,
    @Default(AppTimelineSpacing.medium) AppTimelineSpacing spacing,
    Color? connectorColor,
    Color? indicatorColor,
    Color? backgroundColor,
    Color? foregroundColor,
    double? connectorWidth,
    double? indicatorSize,
    double? itemSpacing,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AppTimelineStyle? style,
    AppTimelineInteraction? interaction,
    AppTimelineAccessibility? accessibility,
    AppTimelineAnimation? animation,
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
  }) = _AppTimelineConfig;

  bool get isInteractive => onTap != null || onEventTap != null || interactive;
  bool get isHoverable => onHover != null || onEventHover != null;
  bool get isDisabled => !enabled || state == AppTimelineState.disabled;
  bool get isLoading => loading || state == AppTimelineState.loading;
  bool get isSkeleton => skeleton || state == AppTimelineState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract => isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasEvents => events.isNotEmpty;
  bool get isHorizontal => orientation == AppTimelineOrientation.horizontal;
  bool get isVertical => orientation == AppTimelineOrientation.vertical;
  bool get hasSelection => selectedIndex != null;
  bool get isReversed => reversed;

  double getEffectiveConnectorWidth() {
    if (connectorWidth != null) return connectorWidth!;
    return AppTimelineConstants.defaultConnectorWidth;
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
    return AppTimelineConstants.defaultMargin;
  }
}

@freezed
class AppTimelineEvent with _$AppTimelineEvent {
  const AppTimelineEvent._();

  const factory AppTimelineEvent({
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
    AppTimelineEventType? type,
    AppTimelineEventStatus? status,
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
  }) = _AppTimelineEvent;

  bool get hasTitle => title != null && title!.isNotEmpty;
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;
  bool get hasDescription => description != null && description!.isNotEmpty;
  bool get hasContent => content != null;
  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get hasIcon => icon != null;
  bool get hasTimestamp => timestamp != null;
  bool get isInteractive => onTap != null || onLongPress != null || onHover != null;
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

enum AppTimelineVariant {
  activity,
}

enum AppTimelineState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppTimelineOrientation {
  vertical,
  horizontal,
}

enum AppTimelineConnectorStyle {
  solid,
  dashed,
  dotted,
  none,
}

enum AppTimelineIndicatorStyle {
  dot,
  circle,
  square,
  diamond,
  icon,
  custom,
}

enum AppTimelineAlignment {
  start,
  center,
  end,
  alternate,
}

enum AppTimelineSpacing {
  compact,
  medium,
  comfortable,
}

enum AppTimelineEventType {
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

enum AppTimelineEventStatus {
  pending,
  inProgress,
  completed,
  cancelled,
  overdue,
}

extension AppTimelineVariantExtension on AppTimelineVariant {
  bool get isActivity => this == AppTimelineVariant.activity;
}

extension AppTimelineStateExtension on AppTimelineState {
  bool get isInteractiveState => this == AppTimelineState.hover ||
                                this == AppTimelineState.pressed ||
                                this == AppTimelineState.focus;

  bool get isDisabledState => this == AppTimelineState.disabled;
  bool get isLoadingState => this == AppTimelineState.loading;
  bool get isSkeletonState => this == AppTimelineState.skeleton;
  bool get isSelectedState => this == AppTimelineState.selected;
}

extension AppTimelineSpacingExtension on AppTimelineSpacing {
  double get itemSpacing {
    switch (this) {
      case AppTimelineSpacing.compact:
        return 12.0;
      case AppTimelineSpacing.medium:
        return 16.0;
      case AppTimelineSpacing.comfortable:
        return 24.0;
    }
  }

  double get indicatorSize {
    switch (this) {
      case AppTimelineSpacing.compact:
        return 12.0;
      case AppTimelineSpacing.medium:
        return 16.0;
      case AppTimelineSpacing.comfortable:
        return 20.0;
    }
  }

  double get connectorIndent {
    switch (this) {
      case AppTimelineSpacing.compact:
        return 24.0;
      case AppTimelineSpacing.medium:
        return 32.0;
      case AppTimelineSpacing.comfortable:
        return 40.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppTimelineSpacing.compact:
        return const EdgeInsets.all(8.0);
      case AppTimelineSpacing.medium:
        return const EdgeInsets.all(12.0);
      case AppTimelineSpacing.comfortable:
        return const EdgeInsets.all(16.0);
    }
  }

  EdgeInsetsGeometry get itemPadding {
    switch (this) {
      case AppTimelineSpacing.compact:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case AppTimelineSpacing.medium:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case AppTimelineSpacing.comfortable:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
  }
}

extension AppTimelineEventTypeExtension on AppTimelineEventType {
  IconData get defaultIcon {
    switch (this) {
      case AppTimelineEventType.milestone:
        return Icons.flag;
      case AppTimelineEventType.task:
        return Icons.task_alt;
      case AppTimelineEventType.meeting:
        return Icons.meeting_room;
      case AppTimelineEventType.deadline:
        return Icons.schedule;
      case AppTimelineEventType.note:
        return Icons.note;
      case AppTimelineEventType.success:
        return Icons.check_circle;
      case AppTimelineEventType.warning:
        return Icons.warning;
      case AppTimelineEventType.error:
        return Icons.error;
      case AppTimelineEventType.info:
        return Icons.info;
    }
  }

  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppTimelineEventType.milestone:
        return colorScheme.primary;
      case AppTimelineEventType.task:
        return colorScheme.secondary;
      case AppTimelineEventType.meeting:
        return Colors.blue;
      case AppTimelineEventType.deadline:
        return Colors.orange;
      case AppTimelineEventType.note:
        return colorScheme.outline;
      case AppTimelineEventType.success:
        return Colors.green;
      case AppTimelineEventType.warning:
        return Colors.orange;
      case AppTimelineEventType.error:
        return colorScheme.error;
      case AppTimelineEventType.info:
        return Colors.blue;
    }
  }

  String get label {
    switch (this) {
      case AppTimelineEventType.milestone:
        return 'Hito';
      case AppTimelineEventType.task:
        return 'Tarea';
      case AppTimelineEventType.meeting:
        return 'Reunión';
      case AppTimelineEventType.deadline:
        return 'Fecha límite';
      case AppTimelineEventType.note:
        return 'Nota';
      case AppTimelineEventType.success:
        return 'Éxito';
      case AppTimelineEventType.warning:
        return 'Advertencia';
      case AppTimelineEventType.error:
        return 'Error';
      case AppTimelineEventType.info:
        return 'Información';
    }
  }
}

extension AppTimelineEventStatusExtension on AppTimelineEventStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppTimelineEventStatus.pending:
        return colorScheme.outline;
      case AppTimelineEventStatus.inProgress:
        return Colors.blue;
      case AppTimelineEventStatus.completed:
        return Colors.green;
      case AppTimelineEventStatus.cancelled:
        return colorScheme.error;
      case AppTimelineEventStatus.overdue:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case AppTimelineEventStatus.pending:
        return Icons.pending;
      case AppTimelineEventStatus.inProgress:
        return Icons.play_circle;
      case AppTimelineEventStatus.completed:
        return Icons.check_circle;
      case AppTimelineEventStatus.cancelled:
        return Icons.cancel;
      case AppTimelineEventStatus.overdue:
        return Icons.warning;
    }
  }

  String get label {
    switch (this) {
      case AppTimelineEventStatus.pending:
        return 'Pendiente';
      case AppTimelineEventStatus.inProgress:
        return 'En progreso';
      case AppTimelineEventStatus.completed:
        return 'Completado';
      case AppTimelineEventStatus.cancelled:
        return 'Cancelado';
      case AppTimelineEventStatus.overdue:
        return 'Vencido';
    }
  }
}

@freezed
class AppTimelineStyle with _$AppTimelineStyle {
  const AppTimelineStyle._();

  const factory AppTimelineStyle({
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
  }) = _AppTimelineStyle;

  AppTimelineStyle copyWithState(AppTimelineState state) {
    switch (state) {
      case AppTimelineState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case AppTimelineState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case AppTimelineState.focus:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
        );
      case AppTimelineState.selected:
        return copyWith(
          elevation: (elevation ?? 0) + 2,
        );
      case AppTimelineState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppTimelineState.loading:
      case AppTimelineState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppTimelineInteraction with _$AppTimelineInteraction {
  const factory AppTimelineInteraction({
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
  }) = _AppTimelineInteraction;
}

@freezed
class AppTimelineAccessibility with _$AppTimelineAccessibility {
  const factory AppTimelineAccessibility({
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
  }) = _AppTimelineAccessibility;
}

@freezed
class AppTimelineAnimation with _$AppTimelineAnimation {
  const factory AppTimelineAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppTimelineAnimationType.fade) AppTimelineAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool staggered,
    @Default(Duration(milliseconds: 100)) Duration staggerDelay,
    @Default(false) bool autoPlay,
  }) = _AppTimelineAnimation;
}

enum AppTimelineAnimationType {
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

class AppTimelineConstants {
  static const double defaultConnectorWidth = 2.0;
  static const double defaultIndicatorSize = 16.0;
  static const double defaultItemSpacing = 16.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration defaultStaggerDelay = Duration(milliseconds: 100);

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(12.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;
  static const EdgeInsetsGeometry defaultItemPadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: double.infinity,
  );

  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 0.0;
  static const double selectedElevation = 2.0;
}