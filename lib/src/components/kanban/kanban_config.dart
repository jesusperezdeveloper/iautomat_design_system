import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanban_config.freezed.dart';

@freezed
class DSKanbanConfig with _$DSKanbanConfig {
  const DSKanbanConfig._();

  const factory DSKanbanConfig({
    @Default(DSKanbanVariant.dragDrop) DSKanbanVariant variant,
    @Default(DSKanbanState.defaultState) DSKanbanState state,
    @Default(<DSKanbanColumn>[]) List<DSKanbanColumn> columns,
    @Default(<DSKanbanCard>[]) List<DSKanbanCard> cards,
    required DSKanbanMoveCallback? onMove,
    @Default(DSKanbanDirection.horizontal) DSKanbanDirection direction,
    @Default(DSKanbanSpacing.medium) DSKanbanSpacing spacing,
    @Default(DSKanbanCardSize.medium) DSKanbanCardSize cardSize,
    @Default(DSKanbanColumnStyle.elevated) DSKanbanColumnStyle columnStyle,
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
    DSKanbanStyle? style,
    DSKanbanInteraction? interaction,
    DSKanbanAccessibility? accessibility,
    DSKanbanAnimation? animation,
    DSKanbanDropCallback? onDrop,
    DSKanbanDragStartCallback? onDragStart,
    DSKanbanDragEndCallback? onDragEnd,
    DSKanbanColumnCallback? onColumnTap,
    DSKanbanCardCallback? onCardTap,
    DSKanbanCardCallback? onCardLongPress,
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
  }) = _DSKanbanConfig;

  bool get isInteractive =>
      onMove != null || onCardTap != null || onColumnTap != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == DSKanbanState.disabled;
  bool get isLoading => loading || state == DSKanbanState.loading;
  bool get isSkeleton => skeleton || state == DSKanbanState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasColumns => columns.isNotEmpty;
  bool get hasCards => cards.isNotEmpty;
  bool get canDrag => draggable && canInteract;
  bool get canDrop => droppable && canInteract;
  bool get isHorizontal => direction == DSKanbanDirection.horizontal;
  bool get isVertical => direction == DSKanbanDirection.vertical;
  bool get hasSelection => selectedCardId != null || selectedColumnId != null;

  double getEffectiveColumnWidth() {
    if (columnWidth != null) return columnWidth!;
    return DSKanbanConstants.defaultColumnWidth;
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
    return DSKanbanConstants.defaultMargin;
  }

  List<DSKanbanCard> getCardsForColumn(String columnId) {
    return cards.where((card) => card.columnId == columnId).toList();
  }

  DSKanbanColumn? getColumn(String columnId) {
    try {
      return columns.firstWhere((column) => column.id == columnId);
    } catch (e) {
      return null;
    }
  }

  DSKanbanCard? getCard(String cardId) {
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
class DSKanbanColumn with _$DSKanbanColumn {
  const DSKanbanColumn._();

  const factory DSKanbanColumn({
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
    DSKanbanColumnStatus? status,
    DSKanbanColumnType? type,
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
  bool get isInteractive =>
      onTap != null || onLongPress != null || onHover != null;
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
    return DSKanbanConstants.defaultColumnWidth;
  }
}

@freezed
class DSKanbanCard with _$DSKanbanCard {
  const DSKanbanCard._();

  const factory DSKanbanCard({
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
    DSKanbanCardPriority? priority,
    DSKanbanCardStatus? status,
    DSKanbanCardType? type,
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
  bool get isInteractive =>
      onTap != null || onLongPress != null || onHover != null;
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
    return DSKanbanConstants.defaultCardHeight;
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
enum DSKanbanVariant {
  dragDrop,
}

enum DSKanbanState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSKanbanDirection {
  horizontal,
  vertical,
}

enum DSKanbanSpacing {
  compact,
  medium,
  comfortable,
}

enum DSKanbanCardSize {
  small,
  medium,
  large,
}

enum DSKanbanColumnStyle {
  flat,
  elevated,
  outlined,
}

enum DSKanbanColumnStatus {
  active,
  inactive,
  pending,
  completed,
  blocked,
}

enum DSKanbanColumnType {
  backlog,
  todo,
  inProgress,
  review,
  done,
  archived,
}

enum DSKanbanCardPriority {
  low,
  medium,
  high,
  critical,
}

enum DSKanbanCardStatus {
  draft,
  pending,
  inProgress,
  review,
  completed,
  cancelled,
}

enum DSKanbanCardType {
  task,
  bug,
  feature,
  epic,
  story,
  subtask,
}

// Type definitions
typedef DSKanbanMoveCallback = void Function(
    String cardId, String fromColumnId, String toColumnId, int newIndex);
typedef DSKanbanDropCallback = void Function(
    String cardId, String columnId, int index);
typedef DSKanbanDragStartCallback = void Function(String cardId);
typedef DSKanbanDragEndCallback = void Function(String cardId, bool success);
typedef DSKanbanColumnCallback = void Function(String columnId);
typedef DSKanbanCardCallback = void Function(String cardId);

// Extensions
extension DSKanbanVariantExtension on DSKanbanVariant {
  bool get isDragDrop => this == DSKanbanVariant.dragDrop;
}

extension DSKanbanStateExtension on DSKanbanState {
  bool get isInteractiveState =>
      this == DSKanbanState.hover ||
      this == DSKanbanState.pressed ||
      this == DSKanbanState.focus;

  bool get isDisabledState => this == DSKanbanState.disabled;
  bool get isLoadingState => this == DSKanbanState.loading;
  bool get isSkeletonState => this == DSKanbanState.skeleton;
  bool get isSelectedState => this == DSKanbanState.selected;
}

extension DSKanbanSpacingExtension on DSKanbanSpacing {
  double get value {
    switch (this) {
      case DSKanbanSpacing.compact:
        return 8.0;
      case DSKanbanSpacing.medium:
        return 16.0;
      case DSKanbanSpacing.comfortable:
        return 24.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSKanbanSpacing.compact:
        return const EdgeInsets.all(8.0);
      case DSKanbanSpacing.medium:
        return const EdgeInsets.all(16.0);
      case DSKanbanSpacing.comfortable:
        return const EdgeInsets.all(24.0);
    }
  }

  EdgeInsetsGeometry get cardPadding {
    switch (this) {
      case DSKanbanSpacing.compact:
        return const EdgeInsets.all(8.0);
      case DSKanbanSpacing.medium:
        return const EdgeInsets.all(12.0);
      case DSKanbanSpacing.comfortable:
        return const EdgeInsets.all(16.0);
    }
  }

  double get cardSpacing {
    switch (this) {
      case DSKanbanSpacing.compact:
        return 4.0;
      case DSKanbanSpacing.medium:
        return 8.0;
      case DSKanbanSpacing.comfortable:
        return 12.0;
    }
  }
}

extension DSKanbanCardSizeExtension on DSKanbanCardSize {
  double get height {
    switch (this) {
      case DSKanbanCardSize.small:
        return 80.0;
      case DSKanbanCardSize.medium:
        return 120.0;
      case DSKanbanCardSize.large:
        return 160.0;
    }
  }

  double get minHeight {
    switch (this) {
      case DSKanbanCardSize.small:
        return 60.0;
      case DSKanbanCardSize.medium:
        return 80.0;
      case DSKanbanCardSize.large:
        return 120.0;
    }
  }
}

extension DSKanbanColumnStatusExtension on DSKanbanColumnStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSKanbanColumnStatus.active:
        return colorScheme.primary;
      case DSKanbanColumnStatus.inactive:
        return colorScheme.outline;
      case DSKanbanColumnStatus.pending:
        return Colors.orange;
      case DSKanbanColumnStatus.completed:
        return Colors.green;
      case DSKanbanColumnStatus.blocked:
        return colorScheme.error;
    }
  }

  String get label {
    switch (this) {
      case DSKanbanColumnStatus.active:
        return 'Activo';
      case DSKanbanColumnStatus.inactive:
        return 'Inactivo';
      case DSKanbanColumnStatus.pending:
        return 'Pendiente';
      case DSKanbanColumnStatus.completed:
        return 'Completado';
      case DSKanbanColumnStatus.blocked:
        return 'Bloqueado';
    }
  }
}

extension DSKanbanColumnTypeExtension on DSKanbanColumnType {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSKanbanColumnType.backlog:
        return colorScheme.outline;
      case DSKanbanColumnType.todo:
        return Colors.blue;
      case DSKanbanColumnType.inProgress:
        return Colors.orange;
      case DSKanbanColumnType.review:
        return Colors.purple;
      case DSKanbanColumnType.done:
        return Colors.green;
      case DSKanbanColumnType.archived:
        return colorScheme.outline.withValues(alpha: 0.5);
    }
  }

  String get label {
    switch (this) {
      case DSKanbanColumnType.backlog:
        return 'Backlog';
      case DSKanbanColumnType.todo:
        return 'Por hacer';
      case DSKanbanColumnType.inProgress:
        return 'En progreso';
      case DSKanbanColumnType.review:
        return 'Revisión';
      case DSKanbanColumnType.done:
        return 'Completado';
      case DSKanbanColumnType.archived:
        return 'Archivado';
    }
  }

  IconData get icon {
    switch (this) {
      case DSKanbanColumnType.backlog:
        return Icons.inbox;
      case DSKanbanColumnType.todo:
        return Icons.assignment;
      case DSKanbanColumnType.inProgress:
        return Icons.build;
      case DSKanbanColumnType.review:
        return Icons.rate_review;
      case DSKanbanColumnType.done:
        return Icons.check_circle;
      case DSKanbanColumnType.archived:
        return Icons.archive;
    }
  }
}

extension DSKanbanCardPriorityExtension on DSKanbanCardPriority {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSKanbanCardPriority.low:
        return Colors.blue;
      case DSKanbanCardPriority.medium:
        return Colors.orange;
      case DSKanbanCardPriority.high:
        return Colors.red;
      case DSKanbanCardPriority.critical:
        return Colors.red.shade800;
    }
  }

  String get label {
    switch (this) {
      case DSKanbanCardPriority.low:
        return 'Baja';
      case DSKanbanCardPriority.medium:
        return 'Media';
      case DSKanbanCardPriority.high:
        return 'Alta';
      case DSKanbanCardPriority.critical:
        return 'Crítica';
    }
  }

  IconData get icon {
    switch (this) {
      case DSKanbanCardPriority.low:
        return Icons.keyboard_arrow_down;
      case DSKanbanCardPriority.medium:
        return Icons.remove;
      case DSKanbanCardPriority.high:
        return Icons.keyboard_arrow_up;
      case DSKanbanCardPriority.critical:
        return Icons.priority_high;
    }
  }
}

extension DSKanbanCardStatusExtension on DSKanbanCardStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSKanbanCardStatus.draft:
        return colorScheme.outline;
      case DSKanbanCardStatus.pending:
        return Colors.orange;
      case DSKanbanCardStatus.inProgress:
        return Colors.blue;
      case DSKanbanCardStatus.review:
        return Colors.purple;
      case DSKanbanCardStatus.completed:
        return Colors.green;
      case DSKanbanCardStatus.cancelled:
        return colorScheme.error;
    }
  }

  String get label {
    switch (this) {
      case DSKanbanCardStatus.draft:
        return 'Borrador';
      case DSKanbanCardStatus.pending:
        return 'Pendiente';
      case DSKanbanCardStatus.inProgress:
        return 'En progreso';
      case DSKanbanCardStatus.review:
        return 'Revisión';
      case DSKanbanCardStatus.completed:
        return 'Completado';
      case DSKanbanCardStatus.cancelled:
        return 'Cancelado';
    }
  }
}

extension DSKanbanCardTypeExtension on DSKanbanCardType {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSKanbanCardType.task:
        return colorScheme.primary;
      case DSKanbanCardType.bug:
        return colorScheme.error;
      case DSKanbanCardType.feature:
        return Colors.green;
      case DSKanbanCardType.epic:
        return Colors.purple;
      case DSKanbanCardType.story:
        return Colors.blue;
      case DSKanbanCardType.subtask:
        return colorScheme.secondary;
    }
  }

  String get label {
    switch (this) {
      case DSKanbanCardType.task:
        return 'Tarea';
      case DSKanbanCardType.bug:
        return 'Error';
      case DSKanbanCardType.feature:
        return 'Funcionalidad';
      case DSKanbanCardType.epic:
        return 'Épica';
      case DSKanbanCardType.story:
        return 'Historia';
      case DSKanbanCardType.subtask:
        return 'Subtarea';
    }
  }

  IconData get icon {
    switch (this) {
      case DSKanbanCardType.task:
        return Icons.task_alt;
      case DSKanbanCardType.bug:
        return Icons.bug_report;
      case DSKanbanCardType.feature:
        return Icons.star;
      case DSKanbanCardType.epic:
        return Icons.layers;
      case DSKanbanCardType.story:
        return Icons.book;
      case DSKanbanCardType.subtask:
        return Icons.subdirectory_arrow_right;
    }
  }
}

@freezed
class DSKanbanStyle with _$DSKanbanStyle {
  const DSKanbanStyle._();

  const factory DSKanbanStyle({
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

  DSKanbanStyle copyWithState(DSKanbanState state) {
    switch (state) {
      case DSKanbanState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case DSKanbanState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case DSKanbanState.focus:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
        );
      case DSKanbanState.selected:
        return copyWith(
          elevation: (elevation ?? 0) + 2,
        );
      case DSKanbanState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSKanbanState.loading:
      case DSKanbanState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSKanbanInteraction with _$DSKanbanInteraction {
  const factory DSKanbanInteraction({
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
    DSKanbanMoveCallback? onMove,
    DSKanbanDropCallback? onDrop,
    DSKanbanDragStartCallback? onDragStart,
    DSKanbanDragEndCallback? onDragEnd,
    DSKanbanColumnCallback? onColumnTap,
    DSKanbanCardCallback? onCardTap,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _AppKanbanInteraction;
}

@freezed
class DSKanbanAccessibility with _$DSKanbanAccessibility {
  const factory DSKanbanAccessibility({
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
class DSKanbanAnimation with _$DSKanbanAnimation {
  const factory DSKanbanAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSKanbanAnimationType.fade) DSKanbanAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool staggered,
    @Default(Duration(milliseconds: 100)) Duration staggerDelay,
    @Default(false) bool autoPlay,
    @Default(Duration(milliseconds: 300)) Duration dragDuration,
    @Default(Curves.elasticOut) Curve dragCurve,
  }) = _AppKanbanAnimation;
}

enum DSKanbanAnimationType {
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

class DSKanbanConstants {
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
