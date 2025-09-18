import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';
import 'calendar_config.dart';

/// Widget principal para mostrar calendarios con diferentes vistas
class AppCalendar extends StatefulWidget {
  /// Configuración del calendario
  final AppCalendarConfig config;

  /// Callback cuando cambia el estado del calendario
  final VoidCallback? onChanged;

  /// Callback cuando ocurre un error
  final void Function(String error)? onError;

  const AppCalendar({
    super.key,
    required this.config,
    this.onChanged,
    this.onError,
  });

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar>
    with TickerProviderStateMixin {
  late DateTime _currentDate;
  late AppCalendarVariant _currentVariant;
  late AppCalendarState _currentState;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Focus nodes para navegación por teclado
  late FocusNode _calendarFocusNode;
  DateTime? _focusedDate;

  // Scroll controllers para vistas de día/semana
  late ScrollController _timeScrollController;
  late ScrollController _horizontalScrollController;

  @override
  void initState() {
    super.initState();
    _currentDate = widget.config.selectedDate ?? DateTime.now();
    _currentVariant = widget.config.variant;
    _currentState = widget.config.state;

    // Inicializar controladores de animación
    _animationController = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Inicializar focus nodes
    _calendarFocusNode = FocusNode();
    _focusedDate = _currentDate;

    // Inicializar scroll controllers
    _timeScrollController = ScrollController();
    _horizontalScrollController = ScrollController();

    // Iniciar animación
    if (widget.config.animationsEnabled) {
      _animationController.forward();
    } else {
      _animationController.value = 1.0;
    }

    // Auto-scroll a la hora actual en vistas de día/semana
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentTime();
    });
  }

  @override
  void didUpdateWidget(AppCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config.selectedDate != oldWidget.config.selectedDate) {
      _currentDate = widget.config.selectedDate ?? _currentDate;
    }
    if (widget.config.variant != oldWidget.config.variant) {
      _currentVariant = widget.config.variant;
      _scrollToCurrentTime();
    }
    if (widget.config.state != oldWidget.config.state) {
      _currentState = widget.config.state;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarFocusNode.dispose();
    _timeScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final localization = widget.config.localization ?? AppCalendarDefaults.spanish();

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: _buildCalendarContent(context, theme, colorScheme, localization),
        );
      },
    );
  }

  Widget _buildCalendarContent(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    AppCalendarLocalization localization,
  ) {
    if (_currentState == AppCalendarState.loading) {
      return _buildLoadingState(context, theme);
    }

    if (_currentState == AppCalendarState.skeleton) {
      return _buildSkeletonState(context, theme);
    }

    return Container(
      padding: widget.config.padding ?? AppSpacing.cardPadding,
      margin: widget.config.margin,
      decoration: BoxDecoration(
        color: widget.config.backgroundColor ?? colorScheme.surface,
        borderRadius: widget.config.borderRadius ?? AppBorders.medium,
        boxShadow: widget.config.boxShadow,
      ),
      child: Column(
        children: [
          // Header del calendario
          if (widget.config.showHeader) _buildHeader(context, theme, localization),

          // Contenido principal del calendario
          Expanded(
            child: _buildCalendarView(context, theme, localization),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    final colorScheme = theme.colorScheme;

    return Container(
      height: widget.config.headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
        color: widget.config.headerBackgroundColor ?? colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        children: [
          // Controles de navegación
          if (widget.config.showNavigationControls) ...[
            _buildNavigationButton(
              icon: Icons.chevron_left,
              tooltip: localization.labels['previous'] ?? 'Anterior',
              onPressed: _goToPrevious,
            ),
            const SizedBox(width: AppSpacing.xs),
          ],

          // Título del período actual
          Expanded(
            child: _buildHeaderTitle(context, theme, localization),
          ),

          // Controles de navegación
          if (widget.config.showNavigationControls) ...[
            const SizedBox(width: AppSpacing.xs),
            _buildNavigationButton(
              icon: Icons.chevron_right,
              tooltip: localization.labels['next'] ?? 'Siguiente',
              onPressed: _goToNext,
            ),
          ],

          // Botón "Hoy"
          if (widget.config.showTodayButton) ...[
            const SizedBox(width: AppSpacing.sm),
            _buildTodayButton(context, theme, localization),
          ],

          // Selector de vista
          if (widget.config.showViewSelector) ...[
            const SizedBox(width: AppSpacing.sm),
            _buildViewSelector(context, theme, localization),
          ],
        ],
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        iconSize: 20,
      ),
    );
  }

  Widget _buildHeaderTitle(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    String title;
    switch (_currentVariant) {
      case AppCalendarVariant.month:
        title = '${localization.monthNames[_currentDate.month - 1]} ${_currentDate.year}';
        break;
      case AppCalendarVariant.week:
        final startOfWeek = _getStartOfWeek(_currentDate);
        final endOfWeek = startOfWeek.add(const Duration(days: 6));
        title = '${_formatDate(startOfWeek)} - ${_formatDate(endOfWeek)}';
        break;
      case AppCalendarVariant.day:
        title = _formatDate(_currentDate);
        break;
    }

    return Text(
      title,
      style: widget.config.headerTextStyle ??
          theme.textTheme.titleLarge?.copyWith(
            color: widget.config.headerTextColor ?? theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTodayButton(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    return TextButton(
      onPressed: _goToToday,
      child: Text(
        localization.labels['today'] ?? 'Hoy',
        style: theme.textTheme.labelMedium,
      ),
    );
  }

  Widget _buildViewSelector(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    return SegmentedButton<AppCalendarVariant>(
      segments: [
        ButtonSegment(
          value: AppCalendarVariant.month,
          label: Text(localization.labels['month'] ?? 'Mes'),
        ),
        ButtonSegment(
          value: AppCalendarVariant.week,
          label: Text(localization.labels['week'] ?? 'Semana'),
        ),
        ButtonSegment(
          value: AppCalendarVariant.day,
          label: Text(localization.labels['day'] ?? 'Día'),
        ),
      ],
      selected: {_currentVariant},
      onSelectionChanged: (Set<AppCalendarVariant> selection) {
        if (selection.isNotEmpty) {
          _changeView(selection.first);
        }
      },
    );
  }

  Widget _buildCalendarView(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    return Focus(
      focusNode: _calendarFocusNode,
      onKeyEvent: widget.config.keyboardNavigationEnabled ? _handleKeyEvent : null,
      child: Builder(
        builder: (context) {
          switch (_currentVariant) {
            case AppCalendarVariant.month:
              return _buildMonthView(context, theme, localization);
            case AppCalendarVariant.week:
              return _buildWeekView(context, theme, localization);
            case AppCalendarVariant.day:
              return _buildDayView(context, theme, localization);
          }
        },
      ),
    );
  }

  Widget _buildMonthView(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    final startOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final endOfMonth = DateTime(_currentDate.year, _currentDate.month + 1, 0);
    final startOfWeek = _getStartOfWeek(startOfMonth);
    final totalDays = endOfMonth.difference(startOfWeek).inDays + 1;
    final weeksCount = (totalDays / 7).ceil();

    return Column(
      children: [
        // Header con días de la semana
        _buildWeekHeader(context, theme, localization),

        // Grid de días
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.2,
            ),
            itemCount: weeksCount * 7,
            itemBuilder: (context, index) {
              final date = startOfWeek.add(Duration(days: index));
              return _buildDayCell(
                context,
                theme,
                localization,
                date,
                isCurrentMonth: date.month == _currentDate.month,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekView(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    final startOfWeek = _getStartOfWeek(_currentDate);

    return Row(
      children: [
        // Columna de horas
        _buildTimeColumn(context, theme),

        // Columnas de días
        Expanded(
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(7, (index) {
                final date = startOfWeek.add(Duration(days: index));
                return SizedBox(
                  width: 120,
                  child: _buildDayColumn(context, theme, localization, date),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayView(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    return Row(
      children: [
        // Columna de horas
        _buildTimeColumn(context, theme),

        // Columna del día
        Expanded(
          child: _buildDayColumn(context, theme, localization, _currentDate),
        ),
      ],
    );
  }

  Widget _buildWeekHeader(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
  ) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Row(
        children: List.generate(7, (index) {
          final dayIndex = (localization.firstDayOfWeek - 1 + index) % 7;
          return Expanded(
            child: Center(
              child: Text(
                localization.dayNamesShort[dayIndex],
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDayCell(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
    DateTime date, {
    bool isCurrentMonth = true,
  }) {
    final colorScheme = theme.colorScheme;
    final isToday = _isSameDay(date, DateTime.now());
    final isSelected = _isSameDay(date, _currentDate);
    final isFocused = _focusedDate != null && _isSameDay(date, _focusedDate!);
    final events = _getEventsForDate(date);

    Color? backgroundColor;
    Color? textColor;

    if (isSelected) {
      backgroundColor = widget.config.selectedBackgroundColor ?? colorScheme.primary;
      textColor = widget.config.selectedTextColor ?? colorScheme.onPrimary;
    } else if (isToday) {
      backgroundColor = widget.config.todayBackgroundColor ?? colorScheme.primaryContainer;
      textColor = widget.config.todayTextColor ?? colorScheme.onPrimaryContainer;
    } else if (!isCurrentMonth) {
      backgroundColor = widget.config.disabledBackgroundColor;
      textColor = widget.config.disabledTextColor ?? colorScheme.onSurface.withValues(alpha: 0.4);
    } else if (_isWeekend(date)) {
      backgroundColor = widget.config.weekendBackgroundColor;
      textColor = widget.config.weekendTextColor ?? colorScheme.onSurface;
    } else {
      backgroundColor = widget.config.cellBackgroundColor;
      textColor = colorScheme.onSurface;
    }

    return GestureDetector(
      onTap: () => _onDateTap(date),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: widget.config.cellBorderRadius ?? BorderRadius.circular(4),
          border: isFocused
              ? Border.all(color: colorScheme.primary, width: 2)
              : Border.all(
                  color: widget.config.cellBorderColor ?? colorScheme.outline.withValues(alpha: 0.2),
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Número del día
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                '${date.day}',
                style: widget.config.dateTextStyle?.copyWith(color: textColor) ??
                    theme.textTheme.bodyMedium?.copyWith(
                      color: textColor,
                      fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
                    ),
              ),
            ),

            // Eventos (vista simplificada en mes)
            if (widget.config.showEventsInMonth && events.isNotEmpty)
              Expanded(
                child: _buildMonthEvents(context, theme, events),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthEvents(
    BuildContext context,
    ThemeData theme,
    List<AppCalendarEvent> events,
  ) {
    final maxEvents = widget.config.maxEventsPerDay;
    final visibleEvents = events.take(maxEvents).toList();
    final remainingCount = events.length - maxEvents;

    return Column(
      children: [
        ...visibleEvents.map((event) => _buildMonthEventIndicator(context, theme, event)),
        if (remainingCount > 0)
          Container(
            width: double.infinity,
            height: widget.config.eventHeight,
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
            decoration: BoxDecoration(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(widget.config.eventBorderRadius),
            ),
            child: Center(
              child: Text(
                '+$remainingCount',
                style: theme.textTheme.labelSmall,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMonthEventIndicator(
    BuildContext context,
    ThemeData theme,
    AppCalendarEvent event,
  ) {
    return GestureDetector(
      onTap: () => _onEventTap(event),
      child: Container(
        width: double.infinity,
        height: widget.config.eventHeight,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        decoration: BoxDecoration(
          color: _getEventColor(event),
          borderRadius: BorderRadius.circular(widget.config.eventBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            event.title,
            style: widget.config.eventTextStyle ??
                theme.textTheme.labelSmall?.copyWith(
                  color: _getEventTextColor(event),
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeColumn(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: 60,
      child: ListView.builder(
        controller: _timeScrollController,
        itemCount: widget.config.endHour - widget.config.startHour,
        itemBuilder: (context, index) {
          final hour = widget.config.startHour + index;
          return Container(
            height: widget.config.timeSlotHeight,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _formatHour(hour),
              style: widget.config.timeTextStyle ??
                  theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDayColumn(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
    DateTime date,
  ) {
    final events = _getEventsForDate(date);
    final isToday = _isSameDay(date, DateTime.now());

    return Column(
      children: [
        // Header del día
        _buildDayHeader(context, theme, localization, date),

        // Contenido del día
        Expanded(
          child: Stack(
            children: [
              // Grid de horas
              _buildTimeGrid(context, theme),

              // Eventos
              ...events.map((event) => _buildTimeEvent(context, theme, event, date)),

              // Línea de tiempo actual
              if (widget.config.showCurrentTimeLine && isToday)
                _buildCurrentTimeLine(context, theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayHeader(
    BuildContext context,
    ThemeData theme,
    AppCalendarLocalization localization,
    DateTime date,
  ) {
    final isToday = _isSameDay(date, DateTime.now());
    final dayName = localization.dayNamesShort[date.weekday - 1];

    return Container(
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            dayName,
            style: theme.textTheme.labelMedium,
          ),
          Text(
            '${date.day}',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
              color: isToday ? theme.colorScheme.primary : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeGrid(BuildContext context, ThemeData theme) {
    return ListView.builder(
      controller: _timeScrollController,
      itemCount: widget.config.endHour - widget.config.startHour,
      itemBuilder: (context, index) {
        final hour = widget.config.startHour + index;
        final isWorkingHour = _isWorkingHour(hour);

        return Container(
          height: widget.config.timeSlotHeight,
          decoration: BoxDecoration(
            color: isWorkingHour
                ? widget.config.workingHoursBackgroundColor
                : widget.config.nonWorkingHoursBackgroundColor,
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.1),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeEvent(
    BuildContext context,
    ThemeData theme,
    AppCalendarEvent event,
    DateTime date,
  ) {
    final startHour = widget.config.startHour.toDouble();
    final slotHeight = widget.config.timeSlotHeight;

    // Calcular posición y altura del evento
    final eventStart = event.startTime.hour + event.startTime.minute / 60.0;
    final eventEnd = event.endTime.hour + event.endTime.minute / 60.0;
    final topOffset = (eventStart - startHour) * slotHeight;
    final eventHeight = (eventEnd - eventStart) * slotHeight;

    return Positioned(
      top: topOffset,
      left: 4,
      right: 4,
      height: eventHeight.clamp(20.0, double.infinity),
      child: GestureDetector(
        onTap: () => _onEventTap(event),
        child: Container(
          decoration: BoxDecoration(
            color: _getEventColor(event),
            borderRadius: BorderRadius.circular(widget.config.eventBorderRadius),
            border: Border.all(
              color: _getEventColor(event).withValues(alpha: 0.8),
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: widget.config.eventTextStyle ??
                    theme.textTheme.labelSmall?.copyWith(
                      color: _getEventTextColor(event),
                      fontWeight: FontWeight.w600,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              if (event.description != null && eventHeight > 40)
                Text(
                  event.description!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: _getEventTextColor(event).withValues(alpha: 0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentTimeLine(BuildContext context, ThemeData theme) {
    final now = DateTime.now();
    final currentHour = now.hour + now.minute / 60.0;
    final startHour = widget.config.startHour.toDouble();
    final slotHeight = widget.config.timeSlotHeight;
    final topOffset = (currentHour - startHour) * slotHeight;

    return Positioned(
      top: topOffset,
      left: 0,
      right: 0,
      child: Container(
        height: 2,
        color: widget.config.currentTimeLineColor ?? theme.colorScheme.error,
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context, ThemeData theme) {
    return Container(
      padding: AppSpacing.cardPadding,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: AppSpacing.md),
            Text(
              widget.config.localization?.labels['loading'] ?? 'Cargando...',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context, ThemeData theme) {
    return Container(
      padding: AppSpacing.cardPadding,
      child: Column(
        children: [
          // Header skeleton
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Content skeleton
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.2,
              ),
              itemCount: 35,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outline.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Métodos de navegación y eventos

  void _goToPrevious() {
    setState(() {
      switch (_currentVariant) {
        case AppCalendarVariant.month:
          _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
          break;
        case AppCalendarVariant.week:
          _currentDate = _currentDate.subtract(const Duration(days: 7));
          break;
        case AppCalendarVariant.day:
          _currentDate = _currentDate.subtract(const Duration(days: 1));
          break;
      }
    });
    widget.config.onDateChange?.call(_currentDate);
    widget.onChanged?.call();
  }

  void _goToNext() {
    setState(() {
      switch (_currentVariant) {
        case AppCalendarVariant.month:
          _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
          break;
        case AppCalendarVariant.week:
          _currentDate = _currentDate.add(const Duration(days: 7));
          break;
        case AppCalendarVariant.day:
          _currentDate = _currentDate.add(const Duration(days: 1));
          break;
      }
    });
    widget.config.onDateChange?.call(_currentDate);
    widget.onChanged?.call();
  }

  void _goToToday() {
    setState(() {
      _currentDate = DateTime.now();
    });
    widget.config.onDateChange?.call(_currentDate);
    widget.onChanged?.call();
  }

  void _changeView(AppCalendarVariant variant) {
    setState(() {
      _currentVariant = variant;
    });
    widget.config.onViewChange?.call(variant);
    widget.onChanged?.call();
    _scrollToCurrentTime();
  }

  void _onDateTap(DateTime date) {
    setState(() {
      _currentDate = date;
      _focusedDate = date;
    });
    widget.config.onDateTap?.call(date);
    widget.onChanged?.call();
  }

  void _onEventTap(AppCalendarEvent event) {
    widget.config.onEventTap?.call(event);
  }

  // Métodos de utilidad

  DateTime _getStartOfWeek(DateTime date) {
    final localization = widget.config.localization ?? AppCalendarDefaults.spanish();
    final firstDayOfWeek = localization.firstDayOfWeek;
    final daysFromFirstDay = (date.weekday - firstDayOfWeek) % 7;
    return date.subtract(Duration(days: daysFromFirstDay));
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  bool _isWorkingHour(int hour) {
    // Simplificado: 9-17 son horas de trabajo
    return hour >= 9 && hour < 17;
  }

  List<AppCalendarEvent> _getEventsForDate(DateTime date) {
    return widget.config.events.where((event) {
      return _isSameDay(event.startTime, date) ||
          (event.startTime.isBefore(date) && event.endTime.isAfter(date));
    }).toList();
  }

  Color _getEventColor(AppCalendarEvent event) {
    if (event.color != null) return event.color!;

    final theme = Theme.of(context);
    switch (event.type) {
      case AppCalendarEventType.meeting:
        return theme.colorScheme.primary;
      case AppCalendarEventType.task:
        return theme.colorScheme.secondary;
      case AppCalendarEventType.reminder:
        return theme.colorScheme.tertiary;
      case AppCalendarEventType.allDay:
        return theme.colorScheme.primaryContainer;
      case AppCalendarEventType.busy:
        return theme.colorScheme.error;
      case AppCalendarEventType.tentative:
        return theme.colorScheme.outline;
      default:
        return theme.colorScheme.primary;
    }
  }

  Color _getEventTextColor(AppCalendarEvent event) {
    if (event.textColor != null) return event.textColor!;

    final eventColor = _getEventColor(event);
    // Determinar si usar texto claro u oscuro basado en el color de fondo
    return eventColor.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;
  }

  String _formatDate(DateTime date) {
    final localization = widget.config.localization ?? AppCalendarDefaults.spanish();
    final monthName = localization.monthNamesShort[date.month - 1];
    return '$monthName ${date.day}';
  }

  String _formatHour(int hour) {
    final localization = widget.config.localization ?? AppCalendarDefaults.spanish();
    if (localization.timeFormat == 12) {
      final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
      final amPm = hour < 12 ? 'AM' : 'PM';
      return '$displayHour $amPm';
    } else {
      return '${hour.toString().padLeft(2, '0')}:00';
    }
  }

  void _scrollToCurrentTime() {
    if (_currentVariant == AppCalendarVariant.month) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final now = DateTime.now();
      final currentHour = now.hour.toDouble();
      final startHour = widget.config.startHour.toDouble();
      final slotHeight = widget.config.timeSlotHeight;
      final targetOffset = (currentHour - startHour) * slotHeight;

      if (_timeScrollController.hasClients) {
        _timeScrollController.animateTo(
          targetOffset.clamp(0.0, _timeScrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // Navegación por teclado
  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    DateTime? newFocusedDate;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        newFocusedDate = (_focusedDate ?? _currentDate).subtract(const Duration(days: 1));
        break;
      case LogicalKeyboardKey.arrowRight:
        newFocusedDate = (_focusedDate ?? _currentDate).add(const Duration(days: 1));
        break;
      case LogicalKeyboardKey.arrowUp:
        newFocusedDate = (_focusedDate ?? _currentDate).subtract(const Duration(days: 7));
        break;
      case LogicalKeyboardKey.arrowDown:
        newFocusedDate = (_focusedDate ?? _currentDate).add(const Duration(days: 7));
        break;
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        _onDateTap(_focusedDate ?? _currentDate);
        return KeyEventResult.handled;
      case LogicalKeyboardKey.home:
        newFocusedDate = DateTime.now();
        break;
      default:
        return KeyEventResult.ignored;
    }

    if (newFocusedDate case final DateTime focusedDate) {
      setState(() {
        _focusedDate = focusedDate;
        // Cambiar el mes/semana/día si es necesario
        if (_currentVariant == AppCalendarVariant.month &&
            focusedDate.month != _currentDate.month) {
          _currentDate = DateTime(focusedDate.year, focusedDate.month, 1);
        } else if (_currentVariant != AppCalendarVariant.month) {
          _currentDate = focusedDate;
        }
      });
      return KeyEventResult.handled;
    }
    // ignore: dead_code
    return KeyEventResult.ignored;
  }
}