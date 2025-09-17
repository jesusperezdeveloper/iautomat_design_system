import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanban_config.freezed.dart';

@freezed
class AppKanbanConfig with _$AppKanbanConfig {
  const AppKanbanConfig._();

  const factory AppKanbanConfig({
    @Default(AppKanbanVariant.dragDrop) AppKanbanVariant variant,
    @Default(AppKanbanState.defaultState) AppKanbanState state,
    @Default(<AppKanbanColumn>[]) List<AppKanbanColumn> columns,
    @Default(<AppKanbanCard>[]) List<AppKanbanCard> cards,
    required AppKanbanMoveCallback? onMove,
    @Default(AppKanbanDirection.horizontal) AppKanbanDirection direction,
    @Default(AppKanbanSpacing.medium) AppKanbanSpacing spacing,
    @Default(AppKanbanCardSize.medium) AppKanbanCardSize cardSize,
    @Default(AppKanbanColumnStyle.elevated) AppKanbanColumnStyle columnStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? dragColor,
    Color? dropColor,
    Color? highlightColor,
    double? columnWidth,
    double? cardHeight,
    double? itemSpacing,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AppKanbanStyle? style,
    AppKanbanInteraction? interaction,
    AppKanbanAccessibility? accessibility,
    AppKanbanAnimation? animation,
    AppKanbanDropCallback? onDrop,
    AppKanbanDragStartCallback? onDragStart,
    AppKanbanDragEndCallback? onDragEnd,
    AppKanbanColumnCallback? onColumnTap,
    AppKanbanCardCallback? onCardTap,
    AppKanbanCardCallback? onCardLongPress,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
    @Default(true) bool draggable,
    @Default(true) bool droppable,
    @Default(false) bool scrollable,
    @Default(false) bool shrinkWrap,
    @Default(false) bool physics,
    String? selectedCardId,
    String? selectedColumnId,
    ScrollController? scrollController,
    Map<String, dynamic>? metadata,
  }) = _AppKanbanConfig;

  bool get isInteractive => onMove != null || onCardTap != null || onColumnTap != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == AppKanbanState.disabled;
  bool get isLoading => loading || state == AppKanbanState.loading;
  bool get isSkeleton => skeleton || state == AppKanbanState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract => isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasColumns => columns.isNotEmpty;
  bool get hasCards => cards.isNotEmpty;
  bool get canDrag => draggable && canInteract;
  bool get canDrop => droppable && canInteract;
  bool get isHorizontal => direction == AppKanbanDirection.horizontal;
  bool get isVertical => direction == AppKanbanDirection.vertical;
  bool get hasSelection => selectedCardId != null || selectedColumnId != null;

  double getEffectiveColumnWidth() {
    if (columnWidth != null) return columnWidth!;
    return AppKanbanConstants.defaultColumnWidth;
  }

  double getEffectiveCardHeight() {
    if (cardHeight != null) return cardHeight!;
    return cardSize.height;
  }

  double getEffectiveSpacing() {
    if (itemSpacing != null) return itemSpacing!;
    return spacing.value;
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;
    return colorScheme.surface;
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;
    return colorScheme.onSurface;
  }

  Color getEffectiveDragColor(ColorScheme colorScheme) {
    if (dragColor != null) return dragColor!;
    return colorScheme.primary.withValues(alpha: 0.1);
  }

  Color getEffectiveDropColor(ColorScheme colorScheme) {
    if (dropColor != null) return dropColor!;
    return colorScheme.secondary.withValues(alpha: 0.2);
  }

  Color getEffectiveHighlightColor(ColorScheme colorScheme) {
    if (highlightColor != null) return highlightColor!;
    return colorScheme.primary.withValues(alpha: 0.08);
  }

  EdgeInsetsGeometry getEffectivePadding() {
    if (padding != null) return padding!;
    return spacing.padding;
  }

  EdgeInsetsGeometry getEffectiveMargin() {
    if (margin != null) return margin!;
    return AppKanbanConstants.defaultMargin;
  }

  List<AppKanbanCard> getCardsForColumn(String columnId) {
    return cards.where((card) => card.columnId == columnId).toList();
  }

  AppKanbanColumn? getColumn(String columnId) {
    try {
      return columns.firstWhere((column) => column.id == columnId);
    } catch (e) {
      return null;
    }
  }

  AppKanbanCard? getCard(String cardId) {
    try {
      return cards.firstWhere((card) => card.id == cardId);
    } catch (e) {
      return null;
    }
  }

  bool isCardSelected(String cardId) {
    return selectedCardId == cardId;
  }

  bool isColumnSelected(String columnId) {
    return selectedColumnId == columnId;
  }
}

@freezed
class AppKanbanColumn with _$AppKanbanColumn {
  const AppKanbanColumn._();

  const factory AppKanbanColumn({
    required String id,
    required String title,
    String? subtitle,
    String? description,
    IconData? icon,
    Color? color,
    Color? backgroundColor,
    Color? foregroundColor,
    Widget? header,
    Widget? footer,
    Widget? leading,
    Widget? trailing,
    String? semanticLabel,
    AppKanbanColumnStatus? status,
    AppKanbanColumnType? type,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    @Default(true) bool enabled,
    @Default(true) bool visible,
    @Default(false) bool selected,
    @Default(false) bool highlighted,
    @Default(true) bool droppable,
    @Default(false) bool collapsed,
    int? maxCards,
    double? width,
    double? minHeight,
    double? maxHeight,
  }) = _AppKanbanColumn;

  bool get hasTitle => title.isNotEmpty;
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;
  bool get hasDescription => description != null && description!.isNotEmpty;
  bool get hasIcon => icon != null;
  bool get hasHeader => header != null;
  bool get hasFooter => footer != null;
  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get isInteractive => onTap != null || onLongPress != null || onHover != null;
  bool get isEnabled => enabled;
  bool get isVisible => visible;
  bool get isSelected => selected;
  bool get isHighlighted => highlighted;
  bool get canDropCards => droppable && enabled;
  bool get isCollapsed => collapsed;
  bool get hasMaxCards => maxCards != null;
  bool get hasFixedWidth => width != null;

  String get displayTitle => title;
  String get displaySubtitle => subtitle ?? '';
  String get displayDescription => description ?? '';

  Color getEffectiveColor(ColorScheme colorScheme) {
    if (color != null) return color!;
    if (status != null) return status!.getColor(colorScheme);
    if (type != null) return type!.getColor(colorScheme);
    return colorScheme.primary;
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;
    if (isSelected) return colorScheme.primaryContainer;
    if (isHighlighted) return colorScheme.secondaryContainer;
    return colorScheme.surfaceContainerHighest;
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;
    return colorScheme.onSurface;
  }

  double getEffectiveWidth() {
    if (width != null) return width!;
    return AppKanbanConstants.defaultColumnWidth;
  }
}

@freezed
class AppKanbanCard with _$AppKanbanCard {
  const AppKanbanCard._();

  const factory AppKanbanCard({
    required String id,
    required String columnId,
    String? title,
    String? subtitle,
    String? description,
    Widget? content,
    Widget? leading,
    Widget? trailing,
    Widget? header,
    Widget? footer,
    List<Widget>? actions,
    IconData? icon,
    String? imageUrl,
    Color? color,
    Color? backgroundColor,
    Color? foregroundColor,
    String? semanticLabel,
    AppKanbanCardPriority? priority,
    AppKanbanCardStatus? status,
    AppKanbanCardType? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? dueDate,
    String? assignedTo,
    List<String>? tags,
    Map<String, dynamic>? metadata,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    VoidCallback? onEdit,
    VoidCallback? onDelete,
    @Default(true) bool enabled,
    @Default(true) bool visible,
    @Default(false) bool selected,
    @Default(false) bool highlighted,
    @Default(true) bool draggable,
    @Default(false) bool pinned,
    @Default(false) bool archived,
    double? height,
    int? order,
  }) = _AppKanbanCard;

  bool get hasTitle => title != null && title!.isNotEmpty;
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;
  bool get hasDescription => description != null && description!.isNotEmpty;
  bool get hasContent => content != null;
  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get hasHeader => header != null;
  bool get hasFooter => footer != null;
  bool get hasActions => actions != null && actions!.isNotEmpty;
  bool get hasIcon => icon != null;
  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;
  bool get hasDueDate => dueDate != null;
  bool get hasTags => tags != null && tags!.isNotEmpty;
  bool get isInteractive => onTap != null || onLongPress != null || onHover != null;
  bool get isEnabled => enabled;
  bool get isVisible => visible;
  bool get isSelected => selected;
  bool get isHighlighted => highlighted;
  bool get canDrag => draggable && enabled && !pinned;
  bool get isPinned => pinned;
  bool get isArchived => archived;
  bool get hasFixedHeight => height != null;
  bool get isOverdue => dueDate != null && DateTime.now().isAfter(dueDate!);

  String get displayTitle => title ?? '';
  String get displaySubtitle => subtitle ?? '';
  String get displayDescription => description ?? '';

  Color getEffectiveColor(ColorScheme colorScheme) {
    if (color != null) return color!;
    if (priority != null) return priority!.getColor(colorScheme);
    if (status != null) return status!.getColor(colorScheme);
    if (type != null) return type!.getColor(colorScheme);
    return colorScheme.primary;
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;
    if (isSelected) return colorScheme.primaryContainer;
    if (isHighlighted) return colorScheme.secondaryContainer;
    if (isOverdue) return colorScheme.errorContainer;
    return colorScheme.surface;
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;
    return colorScheme.onSurface;
  }

  double getEffectiveHeight() {
    if (height != null) return height!;
    return AppKanbanConstants.defaultCardHeight;
  }

  String formatDueDate() {
    if (dueDate == null) return '';

    final now = DateTime.now();
    final difference = dueDate!.difference(now);

    if (difference.inDays > 0) {
      return 'Vence en ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inDays < 0) {
      return 'Venció hace ${-difference.inDays} día${-difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return 'Vence en ${difference.inHours} hora${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inHours < 0) {
      return 'Venció hace ${-difference.inHours} hora${-difference.inHours > 1 ? 's' : ''}';
    } else {
      return 'Vence hoy';
    }
  }
}

// Enums
enum AppKanbanVariant {
  dragDrop,
}

enum AppKanbanState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppKanbanDirection {
  horizontal,
  vertical,
}

enum AppKanbanSpacing {
  compact,
  medium,
  comfortable,
}

enum AppKanbanCardSize {
  small,
  medium,
  large,
}

enum AppKanbanColumnStyle {
  flat,
  elevated,
  outlined,
}

enum AppKanbanColumnStatus {
  active,
  inactive,
  pending,
  completed,
  blocked,
}

enum AppKanbanColumnType {
  backlog,
  todo,
  inProgress,
  review,
  done,
  archived,
}

enum AppKanbanCardPriority {
  low,
  medium,
  high,
  critical,
}

enum AppKanbanCardStatus {
  draft,
  pending,
  inProgress,
  review,
  completed,
  cancelled,
}

enum AppKanbanCardType {
  task,
  bug,
  feature,
  epic,
  story,
  subtask,
}

// Type definitions
typedef AppKanbanMoveCallback = void Function(String cardId, String fromColumnId, String toColumnId, int newIndex);
typedef AppKanbanDropCallback = void Function(String cardId, String columnId, int index);
typedef AppKanbanDragStartCallback = void Function(String cardId);
typedef AppKanbanDragEndCallback = void Function(String cardId, bool success);
typedef AppKanbanColumnCallback = void Function(String columnId);
typedef AppKanbanCardCallback = void Function(String cardId);

// Extensions
extension AppKanbanVariantExtension on AppKanbanVariant {
  bool get isDragDrop => this == AppKanbanVariant.dragDrop;
}

extension AppKanbanStateExtension on AppKanbanState {
  bool get isInteractiveState => this == AppKanbanState.hover ||
                                this == AppKanbanState.pressed ||
                                this == AppKanbanState.focus;

  bool get isDisabledState => this == AppKanbanState.disabled;
  bool get isLoadingState => this == AppKanbanState.loading;
  bool get isSkeletonState => this == AppKanbanState.skeleton;
  bool get isSelectedState => this == AppKanbanState.selected;
}

extension AppKanbanSpacingExtension on AppKanbanSpacing {
  double get value {
    switch (this) {
      case AppKanbanSpacing.compact:
        return 8.0;
      case AppKanbanSpacing.medium:
        return 16.0;
      case AppKanbanSpacing.comfortable:
        return 24.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppKanbanSpacing.compact:
        return const EdgeInsets.all(8.0);
      case AppKanbanSpacing.medium:
        return const EdgeInsets.all(16.0);
      case AppKanbanSpacing.comfortable:
        return const EdgeInsets.all(24.0);
    }
  }

  EdgeInsetsGeometry get cardPadding {
    switch (this) {
      case AppKanbanSpacing.compact:
        return const EdgeInsets.all(8.0);
      case AppKanbanSpacing.medium:
        return const EdgeInsets.all(12.0);
      case AppKanbanSpacing.comfortable:
        return const EdgeInsets.all(16.0);
    }
  }

  double get cardSpacing {
    switch (this) {
      case AppKanbanSpacing.compact:
        return 4.0;
      case AppKanbanSpacing.medium:
        return 8.0;
      case AppKanbanSpacing.comfortable:
        return 12.0;
    }
  }
}

extension AppKanbanCardSizeExtension on AppKanbanCardSize {
  double get height {
    switch (this) {
      case AppKanbanCardSize.small:
        return 80.0;
      case AppKanbanCardSize.medium:
        return 120.0;
      case AppKanbanCardSize.large:
        return 160.0;
    }
  }

  double get minHeight {
    switch (this) {
      case AppKanbanCardSize.small:
        return 60.0;
      case AppKanbanCardSize.medium:
        return 80.0;
      case AppKanbanCardSize.large:
        return 120.0;
    }
  }
}

extension AppKanbanColumnStatusExtension on AppKanbanColumnStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppKanbanColumnStatus.active:
        return colorScheme.primary;
      case AppKanbanColumnStatus.inactive:
        return colorScheme.outline;
      case AppKanbanColumnStatus.pending:
        return Colors.orange;
      case AppKanbanColumnStatus.completed:
        return Colors.green;
      case AppKanbanColumnStatus.blocked:
        return colorScheme.error;
    }
  }

  String get label {
    switch (this) {
      case AppKanbanColumnStatus.active:
        return 'Activo';
      case AppKanbanColumnStatus.inactive:
        return 'Inactivo';
      case AppKanbanColumnStatus.pending:
        return 'Pendiente';
      case AppKanbanColumnStatus.completed:
        return 'Completado';
      case AppKanbanColumnStatus.blocked:
        return 'Bloqueado';
    }
  }
}

extension AppKanbanColumnTypeExtension on AppKanbanColumnType {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppKanbanColumnType.backlog:
        return colorScheme.outline;
      case AppKanbanColumnType.todo:
        return Colors.blue;
      case AppKanbanColumnType.inProgress:
        return Colors.orange;
      case AppKanbanColumnType.review:
        return Colors.purple;
      case AppKanbanColumnType.done:
        return Colors.green;
      case AppKanbanColumnType.archived:
        return colorScheme.outline.withValues(alpha: 0.5);
    }
  }

  String get label {
    switch (this) {
      case AppKanbanColumnType.backlog:
        return 'Backlog';
      case AppKanbanColumnType.todo:
        return 'Por hacer';
      case AppKanbanColumnType.inProgress:
        return 'En progreso';
      case AppKanbanColumnType.review:
        return 'Revisión';
      case AppKanbanColumnType.done:
        return 'Completado';
      case AppKanbanColumnType.archived:
        return 'Archivado';
    }
  }

  IconData get icon {
    switch (this) {
      case AppKanbanColumnType.backlog:
        return Icons.inbox;
      case AppKanbanColumnType.todo:
        return Icons.assignment;
      case AppKanbanColumnType.inProgress:
        return Icons.build;
      case AppKanbanColumnType.review:
        return Icons.rate_review;
      case AppKanbanColumnType.done:
        return Icons.check_circle;
      case AppKanbanColumnType.archived:
        return Icons.archive;
    }
  }
}

extension AppKanbanCardPriorityExtension on AppKanbanCardPriority {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppKanbanCardPriority.low:
        return Colors.blue;
      case AppKanbanCardPriority.medium:
        return Colors.orange;
      case AppKanbanCardPriority.high:
        return Colors.red;
      case AppKanbanCardPriority.critical:
        return Colors.red.shade800;
    }
  }

  String get label {
    switch (this) {
      case AppKanbanCardPriority.low:
        return 'Baja';
      case AppKanbanCardPriority.medium:
        return 'Media';
      case AppKanbanCardPriority.high:
        return 'Alta';
      case AppKanbanCardPriority.critical:
        return 'Crítica';
    }
  }

  IconData get icon {
    switch (this) {
      case AppKanbanCardPriority.low:
        return Icons.keyboard_arrow_down;
      case AppKanbanCardPriority.medium:
        return Icons.remove;
      case AppKanbanCardPriority.high:
        return Icons.keyboard_arrow_up;
      case AppKanbanCardPriority.critical:
        return Icons.priority_high;
    }
  }
}

extension AppKanbanCardStatusExtension on AppKanbanCardStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppKanbanCardStatus.draft:
        return colorScheme.outline;
      case AppKanbanCardStatus.pending:
        return Colors.orange;
      case AppKanbanCardStatus.inProgress:
        return Colors.blue;
      case AppKanbanCardStatus.review:
        return Colors.purple;
      case AppKanbanCardStatus.completed:
        return Colors.green;
      case AppKanbanCardStatus.cancelled:
        return colorScheme.error;
    }
  }

  String get label {
    switch (this) {
      case AppKanbanCardStatus.draft:
        return 'Borrador';
      case AppKanbanCardStatus.pending:
        return 'Pendiente';
      case AppKanbanCardStatus.inProgress:
        return 'En progreso';
      case AppKanbanCardStatus.review:
        return 'Revisión';
      case AppKanbanCardStatus.completed:
        return 'Completado';
      case AppKanbanCardStatus.cancelled:
        return 'Cancelado';
    }
  }
}

extension AppKanbanCardTypeExtension on AppKanbanCardType {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppKanbanCardType.task:
        return colorScheme.primary;
      case AppKanbanCardType.bug:
        return colorScheme.error;
      case AppKanbanCardType.feature:
        return Colors.green;
      case AppKanbanCardType.epic:
        return Colors.purple;
      case AppKanbanCardType.story:
        return Colors.blue;
      case AppKanbanCardType.subtask:
        return colorScheme.secondary;
    }
  }

  String get label {
    switch (this) {
      case AppKanbanCardType.task:
        return 'Tarea';
      case AppKanbanCardType.bug:
        return 'Error';
      case AppKanbanCardType.feature:
        return 'Funcionalidad';
      case AppKanbanCardType.epic:
        return 'Épica';
      case AppKanbanCardType.story:
        return 'Historia';
      case AppKanbanCardType.subtask:
        return 'Subtarea';
    }
  }

  IconData get icon {
    switch (this) {
      case AppKanbanCardType.task:
        return Icons.task_alt;
      case AppKanbanCardType.bug:
        return Icons.bug_report;
      case AppKanbanCardType.feature:
        return Icons.star;
      case AppKanbanCardType.epic:
        return Icons.layers;
      case AppKanbanCardType.story:
        return Icons.book;
      case AppKanbanCardType.subtask:
        return Icons.subdirectory_arrow_right;
    }
  }
}

@freezed
class AppKanbanStyle with _$AppKanbanStyle {
  const AppKanbanStyle._();

  const factory AppKanbanStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? dragColor,
    Color? dropColor,
    Color? highlightColor,
    Color? shadowColor,
    Color? overlayColor,
    double? columnWidth,
    double? cardHeight,
    double? spacing,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? descriptionStyle,
    Offset? offset,
  }) = _AppKanbanStyle;

  AppKanbanStyle copyWithState(AppKanbanState state) {
    switch (state) {
      case AppKanbanState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case AppKanbanState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case AppKanbanState.focus:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
        );
      case AppKanbanState.selected:
        return copyWith(
          elevation: (elevation ?? 0) + 2,
        );
      case AppKanbanState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppKanbanState.loading:
      case AppKanbanState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppKanbanInteraction with _$AppKanbanInteraction {
  const factory AppKanbanInteraction({
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
    AppKanbanMoveCallback? onMove,
    AppKanbanDropCallback? onDrop,
    AppKanbanDragStartCallback? onDragStart,
    AppKanbanDragEndCallback? onDragEnd,
    AppKanbanColumnCallback? onColumnTap,
    AppKanbanCardCallback? onCardTap,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _AppKanbanInteraction;
}

@freezed
class AppKanbanAccessibility with _$AppKanbanAccessibility {
  const factory AppKanbanAccessibility({
    String? semanticLabel,
    String? tooltip,
    bool? excludeSemantics,
    bool? obscureText,
    String? onTapHint,
    String? onLongPressHint,
    String? onDropHint,
    String? onDragHint,
    @Default(false) bool sortKey,
    @Default(false) bool liveRegion,
    @Default(false) bool focusable,
    @Default(false) bool button,
    @Default(false) bool list,
    @Default(false) bool readOnly,
  }) = _AppKanbanAccessibility;
}

@freezed
class AppKanbanAnimation with _$AppKanbanAnimation {
  const factory AppKanbanAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppKanbanAnimationType.fade) AppKanbanAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool staggered,
    @Default(Duration(milliseconds: 100)) Duration staggerDelay,
    @Default(false) bool autoPlay,
    @Default(Duration(milliseconds: 300)) Duration dragDuration,
    @Default(Curves.elasticOut) Curve dragCurve,
  }) = _AppKanbanAnimation;
}

enum AppKanbanAnimationType {
  none,
  fade,
  slide,
  scale,
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
  bounce,
  elastic,
}

class AppKanbanConstants {
  static const double defaultColumnWidth = 280.0;
  static const double defaultCardHeight = 120.0;
  static const double defaultSpacing = 16.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration defaultDragDuration = Duration(milliseconds: 300);
  static const Curve defaultDragCurve = Curves.elasticOut;
  static const Duration defaultStaggerDelay = Duration(milliseconds: 100);

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;
  static const EdgeInsetsGeometry defaultCardPadding = EdgeInsets.all(12.0);
  static const EdgeInsetsGeometry defaultColumnPadding = EdgeInsets.all(16.0);

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: 200.0,
    maxWidth: 400.0,
  );

  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 2.0;
  static const double dragElevation = 8.0;
  static const double selectedElevation = 4.0;

  // Drag and drop constants
  static const double dragThreshold = 10.0;
  static const double dropTargetMargin = 8.0;
  static const double dragOpacity = 0.8;
  static const double dropIndicatorHeight = 4.0;
}