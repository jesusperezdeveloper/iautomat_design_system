import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'date_picker_config.freezed.dart';

@freezed
class AppDatePickerConfig with _$AppDatePickerConfig {
  const factory AppDatePickerConfig({
    @Default(Duration(milliseconds: 200)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(EdgeInsets.all(16.0)) EdgeInsets contentPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0))
    EdgeInsets inputPadding,
    @Default(12.0) double borderRadius,
    @Default(2.0) double borderWidth,
    @Default(2.0) double focusBorderWidth,
    @Default(48.0) double minimumHeight,
    @Default(16.0) double iconSize,
    @Default(8.0) double iconSpacing,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool showClearButton,
    @Default(true) bool showCalendarIcon,
    @Default(true) bool allowManualInput,
    @Default(false) bool use24HourFormat,
    @Default(DatePickerMode.day) DatePickerMode initialDatePickerMode,
    @Default(TimePickerEntryMode.dial)
    TimePickerEntryMode initialTimePickerMode,
    @Default(true) bool enableKeyboardNavigation,
    @Default(true) bool showHelperText,
    @Default(8.0) double helperSpacing,
    @Default(4.0) double labelSpacing,
    @Default(true) bool enableFloatingLabel,
    @Default(Duration(milliseconds: 300)) Duration dialogAnimationDuration,
    @Default(true) bool showDialogTitle,
    @Default(true) bool showTodayButton,
    @Default(8.0) double skeletonShimmerSpeed,
    @Default(1.5) double skeletonOpacityRange,
    @Default(300.0) double maxDialogWidth,
    @Default(400.0) double maxDialogHeight,
    @Default(true) bool adaptiveDialog,
    @Default(true) bool confirmDateSelection,
    @Default(true) bool autoValidate,
    @Default(DateFormat.yMd) DateFormat dateFormat,
    @Default(TimeFormat.h12) TimeFormat timeFormat,
    @Default(true) bool showWeekNumbers,
    @Default(1) int firstDayOfWeek,
    @Default(true) bool highlightToday,
    @Default(true) bool allowPastDates,
    @Default(true) bool allowFutureDates,
    // Additional properties needed by AppDatePicker
    @Default(0.95) double pressedScale,
    @Default(48.0) double minHeight,
    double? maxHeight,
    @Default(20.0) double loadingIndicatorSize,
    @Default(true) bool enableShadow,
    @Default(4.0) double shadowBlurRadius,
    @Default(Offset(0, 2)) Offset shadowOffset,
    @Default(0.0) double shadowSpreadRadius,
    AppDatePickerColors? colors,
  }) = _AppDatePickerConfig;

  const AppDatePickerConfig._();
}

@freezed
class AppDatePickerColors with _$AppDatePickerColors {
  const factory AppDatePickerColors({
    required Color inputFillColor,
    required Color inputBorderColor,
    required Color inputFocusedBorderColor,
    required Color inputErrorBorderColor,
    required Color inputDisabledBorderColor,
    required Color inputTextColor,
    required Color inputDisabledTextColor,
    required Color inputHintColor,
    required Color inputDisabledHintColor,
    required Color labelColor,
    required Color focusedLabelColor,
    required Color errorLabelColor,
    required Color disabledLabelColor,
    required Color helperTextColor,
    required Color errorTextColor,
    required Color iconColor,
    required Color disabledIconColor,
    required Color cursorColor,
    required Color selectionColor,
    required Color overlayColor,
    required Color hoverOverlayColor,
    required Color focusOverlayColor,
    required Color pressedOverlayColor,
    required Color calendarBackgroundColor,
    required Color calendarHeaderColor,
    required Color calendarHeaderTextColor,
    required Color calendarWeekdayColor,
    required Color calendarTodayColor,
    required Color calendarSelectedColor,
    required Color calendarSelectedTextColor,
    required Color calendarInRangeColor,
    required Color calendarDisabledColor,
    required Color calendarDisabledTextColor,
    required Color calendarOutOfRangeColor,
    required Color dialBackgroundColor,
    required Color dialHandColor,
    required Color dialCenterColor,
    required Color dialNumberColor,
    required Color dialSelectedNumberColor,
    required Color skeletonBaseColor,
    required Color skeletonHighlightColor,
    required Color loadingIndicatorColor,
    required Color clearButtonColor,
    required Color clearButtonHoverColor,
    required Color dialogBarrierColor,
    required Color dialogShadowColor,
  }) = _AppDatePickerColors;

  const AppDatePickerColors._();

  factory AppDatePickerColors.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return AppDatePickerColors(
      inputFillColor: colorScheme.surfaceContainerLowest,
      inputBorderColor: colorScheme.outline,
      inputFocusedBorderColor: colorScheme.primary,
      inputErrorBorderColor: colorScheme.error,
      inputDisabledBorderColor: colorScheme.onSurface.withValues(alpha: 0.12),
      inputTextColor: colorScheme.onSurface,
      inputDisabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      inputHintColor: colorScheme.onSurfaceVariant,
      inputDisabledHintColor: colorScheme.onSurface.withValues(alpha: 0.38),
      labelColor: colorScheme.onSurfaceVariant,
      focusedLabelColor: colorScheme.primary,
      errorLabelColor: colorScheme.error,
      disabledLabelColor: colorScheme.onSurface.withValues(alpha: 0.38),
      helperTextColor: colorScheme.onSurfaceVariant,
      errorTextColor: colorScheme.error,
      iconColor: colorScheme.onSurfaceVariant,
      disabledIconColor: colorScheme.onSurface.withValues(alpha: 0.38),
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withValues(alpha: 0.12),
      overlayColor: colorScheme.primary.withValues(alpha: 0.12),
      hoverOverlayColor: colorScheme.onSurface.withValues(alpha: 0.08),
      focusOverlayColor: colorScheme.onSurface.withValues(alpha: 0.12),
      pressedOverlayColor: colorScheme.onSurface.withValues(alpha: 0.12),
      calendarBackgroundColor: colorScheme.surface,
      calendarHeaderColor: colorScheme.primary,
      calendarHeaderTextColor: colorScheme.onPrimary,
      calendarWeekdayColor: colorScheme.onSurfaceVariant,
      calendarTodayColor: colorScheme.primary.withValues(alpha: 0.12),
      calendarSelectedColor: colorScheme.primary,
      calendarSelectedTextColor: colorScheme.onPrimary,
      calendarInRangeColor: colorScheme.primary.withValues(alpha: 0.12),
      calendarDisabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
      calendarDisabledTextColor: colorScheme.onSurface.withValues(alpha: 0.38),
      calendarOutOfRangeColor: colorScheme.outline.withValues(alpha: 0.12),
      dialBackgroundColor: colorScheme.surfaceContainerHigh,
      dialHandColor: colorScheme.primary,
      dialCenterColor: colorScheme.primary,
      dialNumberColor: colorScheme.onSurface,
      dialSelectedNumberColor: colorScheme.onPrimary,
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surfaceContainerLowest,
      loadingIndicatorColor: colorScheme.primary,
      clearButtonColor: colorScheme.onSurfaceVariant,
      clearButtonHoverColor: colorScheme.onSurface,
      dialogBarrierColor: colorScheme.scrim.withValues(alpha: 0.32),
      dialogShadowColor: colorScheme.shadow.withValues(alpha: 0.15),
    );
  }
}

enum AppDatePickerState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppDatePickerVariant {
  date,
  time,
  range,
}

enum DateFormat {
  yMd, // 1/2/2023
  yMMMd, // Jan 2, 2023
  yMMMMd, // January 2, 2023
  dMy, // 2/1/2023
  dMMM, // 2 Jan
  dMMMy, // 2 Jan 2023
  custom,
}

enum TimeFormat {
  h12, // 12-hour with AM/PM
  h24, // 24-hour
}

@freezed
class AppDateRange with _$AppDateRange {
  const factory AppDateRange({
    DateTime? start,
    DateTime? end,
  }) = _AppDateRange;

  const AppDateRange._();

  bool get isValid =>
      start != null && end != null && start!.isBefore(end!) || (start == end);
  bool get isEmpty => start == null && end == null;
  bool get isPartial =>
      (start != null && end == null) || (start == null && end != null);

  Duration? get duration {
    if (start == null || end == null) return null;
    return end!.difference(start!);
  }

  int? get days {
    final dur = duration;
    return dur?.inDays;
  }

  bool contains(DateTime date) {
    if (start == null || end == null) return false;
    return date.isAfter(start!) && date.isBefore(end!) ||
        date.isAtSameMomentAs(start!) ||
        date.isAtSameMomentAs(end!);
  }

  AppDateRange copyWithStart(DateTime? newStart) {
    return AppDateRange(start: newStart, end: end);
  }

  AppDateRange copyWithEnd(DateTime? newEnd) {
    return AppDateRange(start: start, end: newEnd);
  }

  AppDateRange clear() {
    return const AppDateRange(start: null, end: null);
  }
}

@freezed
class AppTimeValue with _$AppTimeValue {
  const factory AppTimeValue({
    required int hour,
    required int minute,
    int? second,
  }) = _AppTimeValue;

  const AppTimeValue._();

  factory AppTimeValue.now() {
    final now = DateTime.now();
    return AppTimeValue(
      hour: now.hour,
      minute: now.minute,
      second: now.second,
    );
  }

  factory AppTimeValue.fromTimeOfDay(TimeOfDay timeOfDay) {
    return AppTimeValue(
      hour: timeOfDay.hour,
      minute: timeOfDay.minute,
    );
  }

  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }

  DateTime toDateTime({DateTime? date}) {
    final baseDate = date ?? DateTime.now();
    return DateTime(
      baseDate.year,
      baseDate.month,
      baseDate.day,
      hour,
      minute,
      second ?? 0,
    );
  }

  String format({required bool use24Hour, bool showSeconds = false}) {
    if (use24Hour) {
      final h = hour.toString().padLeft(2, '0');
      final m = minute.toString().padLeft(2, '0');
      if (showSeconds && second != null) {
        final s = second!.toString().padLeft(2, '0');
        return '$h:$m:$s';
      }
      return '$h:$m';
    } else {
      final h = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
      final m = minute.toString().padLeft(2, '0');
      final period = hour < 12 ? 'AM' : 'PM';
      if (showSeconds && second != null) {
        final s = second!.toString().padLeft(2, '0');
        return '$h:$m:$s $period';
      }
      return '$h:$m $period';
    }
  }

  bool isValid() {
    return hour >= 0 &&
        hour <= 23 &&
        minute >= 0 &&
        minute <= 59 &&
        (second == null || (second! >= 0 && second! <= 59));
  }
}

class AppDatePickerValidator {
  static String? required(DateTime? value) {
    if (value == null) {
      return 'La fecha es requerida';
    }
    return null;
  }

  static String? Function(DateTime?) dateRange(
      DateTime? minDate, DateTime? maxDate) {
    return (DateTime? value) {
      if (value == null) return null;

      if (minDate != null && value.isBefore(minDate)) {
        return 'La fecha debe ser posterior a ${_formatDate(minDate)}';
      }

      if (maxDate != null && value.isAfter(maxDate)) {
        return 'La fecha debe ser anterior a ${_formatDate(maxDate)}';
      }

      return null;
    };
  }

  static String? Function(DateTime?) minimumDate(DateTime minDate) {
    return (DateTime? value) {
      if (value == null) return null;
      if (value.isBefore(minDate)) {
        return 'La fecha debe ser posterior a ${_formatDate(minDate)}';
      }
      return null;
    };
  }

  static String? Function(DateTime?) maximumDate(DateTime maxDate) {
    return (DateTime? value) {
      if (value == null) return null;
      if (value.isAfter(maxDate)) {
        return 'La fecha debe ser anterior a ${_formatDate(maxDate)}';
      }
      return null;
    };
  }

  static String? Function(DateTime?) weekdaysOnly() {
    return (DateTime? value) {
      if (value == null) return null;
      if (value.weekday == DateTime.saturday ||
          value.weekday == DateTime.sunday) {
        return 'Solo se permiten días de semana';
      }
      return null;
    };
  }

  static String? Function(DateTime?) excludeWeekends() {
    return (DateTime? value) {
      if (value == null) return null;
      if (value.weekday == DateTime.saturday ||
          value.weekday == DateTime.sunday) {
        return 'Los fines de semana no están permitidos';
      }
      return null;
    };
  }

  static String? Function(AppDateRange?) rangeRequired() {
    return (AppDateRange? value) {
      if (value == null || value.isEmpty) {
        return 'El rango de fechas es requerido';
      }
      if (value.isPartial) {
        return 'Debe seleccionar fecha de inicio y fin';
      }
      if (!value.isValid) {
        return 'La fecha de inicio debe ser anterior a la fecha de fin';
      }
      return null;
    };
  }

  static String? Function(AppDateRange?) minimumRangeDuration(
      Duration minDuration) {
    return (AppDateRange? value) {
      if (value == null || value.isEmpty || value.isPartial) return null;
      final duration = value.duration;
      if (duration != null && duration < minDuration) {
        return 'El rango debe ser de al menos ${minDuration.inDays} días';
      }
      return null;
    };
  }

  static String? Function(AppDateRange?) maximumRangeDuration(
      Duration maxDuration) {
    return (AppDateRange? value) {
      if (value == null || value.isEmpty || value.isPartial) return null;
      final duration = value.duration;
      if (duration != null && duration > maxDuration) {
        return 'El rango no puede exceder ${maxDuration.inDays} días';
      }
      return null;
    };
  }

  static String? Function(AppTimeValue?) timeRequired() {
    return (AppTimeValue? value) {
      if (value == null) {
        return 'La hora es requerida';
      }
      if (!value.isValid()) {
        return 'Hora inválida';
      }
      return null;
    };
  }

  static String? Function(AppTimeValue?) timeRange(
      AppTimeValue? minTime, AppTimeValue? maxTime) {
    return (AppTimeValue? value) {
      if (value == null) return null;

      if (minTime != null) {
        final minMinutes = minTime.hour * 60 + minTime.minute;
        final valueMinutes = value.hour * 60 + value.minute;
        if (valueMinutes < minMinutes) {
          return 'La hora debe ser posterior a ${minTime.format(use24Hour: true)}';
        }
      }

      if (maxTime != null) {
        final maxMinutes = maxTime.hour * 60 + maxTime.minute;
        final valueMinutes = value.hour * 60 + value.minute;
        if (valueMinutes > maxMinutes) {
          return 'La hora debe ser anterior a ${maxTime.format(use24Hour: true)}';
        }
      }

      return null;
    };
  }

  static String? Function(dynamic) combine(
      List<String? Function(dynamic)> validators) {
    return (dynamic value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

extension AppDatePickerHelpers on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  DateTime get startOfWeek {
    final daysFromMonday = weekday - 1;
    return subtract(Duration(days: daysFromMonday)).startOfDay;
  }

  DateTime get endOfWeek {
    final daysToSunday = 7 - weekday;
    return add(Duration(days: daysToSunday)).endOfDay;
  }

  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0).endOfDay;
  }

  DateTime get startOfYear {
    return DateTime(year, 1, 1);
  }

  DateTime get endOfYear {
    return DateTime(year, 12, 31).endOfDay;
  }

  bool get isToday {
    final now = DateTime.now();
    return isSameDay(now);
  }

  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  bool get isWeekday {
    return !isWeekend;
  }

  String formatLocale({
    required DateFormat format,
    String? locale,
  }) {
    // This would typically use intl package for proper formatting
    // For now, providing basic formatting
    switch (format) {
      case DateFormat.yMd:
        return '$month/$day/$year';
      case DateFormat.yMMMd:
        return '${_getMonthAbbrev(month)} $day, $year';
      case DateFormat.yMMMMd:
        return '${_getMonthName(month)} $day, $year';
      case DateFormat.dMy:
        return '$day/$month/$year';
      case DateFormat.dMMM:
        return '$day ${_getMonthAbbrev(month)}';
      case DateFormat.dMMMy:
        return '$day ${_getMonthAbbrev(month)} $year';
      case DateFormat.custom:
        return toString();
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  String _getMonthAbbrev(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
