import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';
import 'kanban_config.dart';

/// Widget principal para crear tableros Kanban con funcionalidad drag & drop
class AppKanban extends StatefulWidget {
  /// Configuración del kanban
  final AppKanbanConfig config;

  /// Callback cuando cambia el estado del kanban
  final VoidCallback? onChanged;

  /// Callback cuando ocurre un error
  final void Function(String error)? onError;

  const AppKanban({
    super.key,
    required this.config,
    this.onChanged,
    this.onError,
  });

  @override
  State<AppKanban> createState() => _AppKanbanState();
}

class _AppKanbanState extends State<AppKanban> {
  late List<AppKanbanColumn> _columns;
  late List<AppKanbanCard> _cards;
  String? _dragTargetColumnId;
  int? _dragTargetIndex;

  @override
  void initState() {
    super.initState();
    _columns = List.from(widget.config.columns);
    _cards = List.from(widget.config.cards);
  }

  @override
  void didUpdateWidget(AppKanban oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config) {
      _columns = List.from(widget.config.columns);
      _cards = List.from(widget.config.cards);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: widget.config.padding ?? AppSpacing.cardPadding,
      margin: widget.config.margin,
      decoration: BoxDecoration(
        color: widget.config.backgroundColor ?? colorScheme.surface,
        borderRadius: AppBorders.medium,
      ),
      child: _buildKanbanContent(context),
    );
  }

  Widget _buildKanbanContent(BuildContext context) {
    switch (widget.config.variant) {
      case AppKanbanVariant.dragDrop:
        return _buildDragDropKanban(context);
    }
  }

  Widget _buildDragDropKanban(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _columns.map((column) {
        return Expanded(
          flex: 1,
          child: _buildDragDropColumn(context, column),
        );
      }).toList(),
    );
  }

  Widget _buildDragDropColumn(BuildContext context, AppKanbanColumn column) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final columnCards = _getCardsForColumn(column.id);
    final isDragTarget = _dragTargetColumnId == column.id;

    return Container(
      margin: AppSpacing.columnSpacing,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header de la columna
          _buildColumnHeader(context, column),

          // Contenido de la columna con drag target
          Expanded(
            child: DragTarget<String>(
              onWillAcceptWithDetails: (details) {
                final cardId = details.data;
                final card = _getCardById(cardId);
                return card != null && _canDropCardInColumn(card, column);
              },
              onAcceptWithDetails: (details) {
                _moveCardToColumn(details.data, column.id, columnCards.length);
              },
              onMove: (details) {
                setState(() {
                  _dragTargetColumnId = column.id;
                  _dragTargetIndex = _calculateDropIndex(
                    details.offset,
                    columnCards,
                  );
                });
              },
              onLeave: (data) {
                if (_dragTargetColumnId == column.id) {
                  setState(() {
                    _dragTargetColumnId = null;
                    _dragTargetIndex = null;
                  });
                }
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  decoration: BoxDecoration(
                    color: column.backgroundColor ?? colorScheme.surface,
                    borderRadius: AppBorders.medium,
                    border: isDragTarget
                        ? Border.all(
                            color: colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  child: _buildColumnContent(context, column, columnCards),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnHeader(BuildContext context, AppKanbanColumn column) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Container(
      padding: AppSpacing.cardPadding,
      child: Row(
        children: [
          // Icono de la columna
          if (column.icon != null) ...[
            Icon(
              column.icon,
              color: colorScheme.onSurface,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.xs),
          ],

          // Título de la columna
          Expanded(
            child: Text(
              column.title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Contador de tarjetas
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xs,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${_getCardsForColumn(column.id).length}',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnContent(
    BuildContext context,
    AppKanbanColumn column,
    List<AppKanbanCard> cards,
  ) {
    if (cards.isEmpty) {
      return _buildEmptyColumn(context, column);
    }

    return ListView.builder(
      padding: AppSpacing.cardPadding,
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        final isDragTarget =
            _dragTargetColumnId == column.id && _dragTargetIndex == index;

        return Column(
          children: [
            if (isDragTarget) _buildDropIndicator(context),
            _buildKanbanCard(context, card),
            if (index < cards.length - 1) const SizedBox(height: AppSpacing.sm),
          ],
        );
      },
    );
  }

  Widget _buildEmptyColumn(BuildContext context, AppKanbanColumn column) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Center(
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 48,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'No hay tarjetas',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropIndicator(BuildContext context) {
    return Container(
      height: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildKanbanCard(BuildContext context, AppKanbanCard card) {
    if (widget.config.variant == AppKanbanVariant.dragDrop) {
      return _buildDraggableCard(context, card);
    }
    return _buildStaticCard(context, card);
  }

  Widget _buildDraggableCard(BuildContext context, AppKanbanCard card) {
    return Draggable<String>(
      data: card.id,
      feedback: Material(
        elevation: 8,
        borderRadius: AppBorders.medium,
        child: SizedBox(
          width: 280,
          child: _buildCardContent(context, card, isDragging: true),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: _buildCardContent(context, card),
      ),
      onDragStarted: () {
        HapticFeedback.lightImpact();
      },
      onDragEnd: (details) {
        setState(() {
          _dragTargetColumnId = null;
          _dragTargetIndex = null;
        });
      },
      child: _buildCardContent(context, card),
    );
  }

  Widget _buildStaticCard(BuildContext context, AppKanbanCard card) {
    return _buildCardContent(context, card);
  }

  Widget _buildCardContent(
    BuildContext context,
    AppKanbanCard card, {
    bool isDragging = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: card.backgroundColor ?? colorScheme.surfaceContainerHighest,
        borderRadius: AppBorders.medium,
        boxShadow: isDragging
            ? [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          _buildCardTitle(context, card),
          if (card.description?.isNotEmpty == true) ...[
            const SizedBox(height: AppSpacing.xs),
            _buildCardDescription(context, card),
          ],

          // Tags
          if (card.tags?.isNotEmpty == true) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildCardTags(context, card),
          ],

          // Footer básico
          if (card.dueDate != null) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildCardFooter(context, card),
          ],
        ],
      ),
    );
  }

  Widget _buildCardTitle(BuildContext context, AppKanbanCard card) {
    return Text(
      card.title ?? '',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCardDescription(BuildContext context, AppKanbanCard card) {
    return Text(
      card.description ?? '',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCardTags(BuildContext context, AppKanbanCard card) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: card.tags?.map((tag) => _buildTag(context, tag)).toList() ?? [],
    );
  }

  Widget _buildTag(BuildContext context, dynamic tag) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag?.toString() ?? '',
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCardFooter(BuildContext context, AppKanbanCard card) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        // Fecha de vencimiento
        if (card.dueDate != null) ...[
          Icon(
            Icons.schedule_outlined,
            size: 14,
            color: _getDueDateColor(card.dueDate!, colorScheme),
          ),
          const SizedBox(width: 2),
          Text(
            _formatDate(card.dueDate!),
            style: theme.textTheme.labelSmall?.copyWith(
              color: _getDueDateColor(card.dueDate!, colorScheme),
            ),
          ),
        ],
      ],
    );
  }

  // Métodos auxiliares
  List<AppKanbanCard> _getCardsForColumn(String columnId) {
    return _cards.where((card) => card.columnId == columnId).toList();
  }

  AppKanbanCard? _getCardById(String cardId) {
    try {
      return _cards.firstWhere((card) => card.id == cardId);
    } catch (e) {
      return null;
    }
  }

  bool _canDropCardInColumn(AppKanbanCard card, AppKanbanColumn column) {
    return true; // Simplificado por ahora
  }

  void _moveCardToColumn(String cardId, String columnId, int index) {
    final cardIndex = _cards.indexWhere((card) => card.id == cardId);
    if (cardIndex == -1) return;

    final card = _cards[cardIndex];
    final fromColumnId = card.columnId;

    // Actualizar la tarjeta
    final updatedCard = card.copyWith(columnId: columnId);
    _cards[cardIndex] = updatedCard;

    // Llamar al callback
    widget.config.onMove?.call(cardId, fromColumnId, columnId, index);
    widget.onChanged?.call();

    setState(() {});
  }

  int _calculateDropIndex(Offset offset, List<AppKanbanCard> cards) {
    // Simplificado: retorna la posición al final
    return cards.length;
  }

  Color _getDueDateColor(DateTime dueDate, ColorScheme colorScheme) {
    final now = DateTime.now();
    final diff = dueDate.difference(now).inDays;

    if (diff < 0) return colorScheme.error; // Vencida
    if (diff == 0) return Colors.orange; // Hoy
    if (diff <= 3) return Colors.orange; // Próxima
    return colorScheme.onSurface.withValues(alpha: 0.6); // Normal
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = date.difference(now).inDays;

    if (diff == 0) return 'Hoy';
    if (diff == 1) return 'Mañana';
    if (diff == -1) return 'Ayer';
    if (diff < -1) return '${-diff}d vencida';
    if (diff <= 7) return '${diff}d';

    return '${date.day}/${date.month}';
  }
}
