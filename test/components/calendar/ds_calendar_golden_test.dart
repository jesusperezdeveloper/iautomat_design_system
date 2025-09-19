import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSCalendar Golden Tests', () {
    testWidgets('basic month view calendar', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        selectedDate: DateTime(2024, 1, 15),
        events: [
          DSCalendarEvent(
            id: 'event-1',
            title: 'Team Meeting',
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            type: DSCalendarEventType.meeting,
          ),
          DSCalendarEvent(
            id: 'event-2',
            title: 'Project Review',
            startTime: DateTime(2024, 1, 16, 14, 0),
            endTime: DateTime(2024, 1, 16, 15, 0),
            type: DSCalendarEventType.task,
            priority: DSCalendarEventPriority.high,
          ),
          DSCalendarEvent(
            id: 'event-3',
            title: 'Client Call',
            startTime: DateTime(2024, 1, 18, 11, 0),
            endTime: DateTime(2024, 1, 18, 12, 0),
            type: DSCalendarEventType.event,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSCalendar(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_month_basic.png'),
      );
    });

    testWidgets('week view calendar with events', (tester) async {
      final baseDate = DateTime(2024, 1, 15);
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.week,
        selectedDate: baseDate,
        events: [
          DSCalendarEvent(
            id: 'week-1',
            title: 'Morning Standup',
            startTime: baseDate.copyWith(hour: 9, minute: 0),
            endTime: baseDate.copyWith(hour: 9, minute: 30),
            type: DSCalendarEventType.meeting,
            isRecurring: true,
          ),
          DSCalendarEvent(
            id: 'week-2',
            title: 'Development Work',
            startTime: baseDate.copyWith(hour: 10, minute: 0),
            endTime: baseDate.copyWith(hour: 12, minute: 0),
            type: DSCalendarEventType.task,
            priority: DSCalendarEventPriority.high,
          ),
          DSCalendarEvent(
            id: 'week-3',
            title: 'Code Review',
            startTime: baseDate
                .add(const Duration(days: 1))
                .copyWith(hour: 15, minute: 0),
            endTime: baseDate
                .add(const Duration(days: 1))
                .copyWith(hour: 16, minute: 0),
            type: DSCalendarEventType.task,
          ),
          DSCalendarEvent(
            id: 'week-4',
            title: 'Important Reminder',
            startTime: baseDate
                .add(const Duration(days: 2))
                .copyWith(hour: 8, minute: 0),
            endTime: baseDate
                .add(const Duration(days: 2))
                .copyWith(hour: 8, minute: 15),
            type: DSCalendarEventType.reminder,
            priority: DSCalendarEventPriority.critical,
          ),
        ],
        showWorkingHours: true,
        startHour: 8,
        endHour: 18,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 600,
                child: DSCalendar(config: config),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_week_events.png'),
      );
    });

    testWidgets('day view calendar with detailed schedule', (tester) async {
      final today = DateTime(2024, 1, 15);
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.day,
        selectedDate: today,
        events: [
          DSCalendarEvent(
            id: 'day-1',
            title: 'Morning Coffee',
            startTime: today.copyWith(hour: 8, minute: 0),
            endTime: today.copyWith(hour: 8, minute: 30),
            type: DSCalendarEventType.event,
          ),
          DSCalendarEvent(
            id: 'day-2',
            title: 'Sprint Planning',
            startTime: today.copyWith(hour: 9, minute: 0),
            endTime: today.copyWith(hour: 10, minute: 30),
            type: DSCalendarEventType.meeting,
            priority: DSCalendarEventPriority.high,
          ),
          DSCalendarEvent(
            id: 'day-3',
            title: 'Focused Work Time',
            startTime: today.copyWith(hour: 11, minute: 0),
            endTime: today.copyWith(hour: 13, minute: 0),
            type: DSCalendarEventType.busy,
          ),
          DSCalendarEvent(
            id: 'day-4',
            title: 'Lunch Break',
            startTime: today.copyWith(hour: 13, minute: 0),
            endTime: today.copyWith(hour: 14, minute: 0),
            type: DSCalendarEventType.allDay,
            isAllDay: false,
          ),
          DSCalendarEvent(
            id: 'day-5',
            title: 'Code Review Session',
            startTime: today.copyWith(hour: 15, minute: 0),
            endTime: today.copyWith(hour: 16, minute: 0),
            type: DSCalendarEventType.task,
          ),
          DSCalendarEvent(
            id: 'day-6',
            title: 'Client Call',
            startTime: today.copyWith(hour: 17, minute: 0),
            endTime: today.copyWith(hour: 17, minute: 45),
            type: DSCalendarEventType.tentative,
          ),
        ],
        startHour: 7,
        endHour: 20,
        timeSlotHeight: 60.0,
        showCurrentTimeLine: true,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 600,
                child: DSCalendar(config: config),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_day_detailed.png'),
      );
    });

    testWidgets('calendar with custom styling', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        selectedDate: DateTime(2024, 1, 15),
        backgroundColor: Colors.grey.shade50,
        headerBackgroundColor: Colors.indigo.shade100,
        headerTextColor: Colors.indigo.shade800,
        cellBackgroundColor: Colors.white,
        cellBorderColor: Colors.grey.shade300,
        todayBackgroundColor: Colors.indigo.shade50,
        todayTextColor: Colors.indigo.shade700,
        selectedBackgroundColor: Colors.indigo.shade100,
        selectedTextColor: Colors.indigo.shade900,
        weekendBackgroundColor: Colors.amber.shade50,
        weekendTextColor: Colors.amber.shade800,
        headerHeight: 64.0,
        cellHeight: 50.0,
        eventBorderRadius: 8.0,
        events: [
          DSCalendarEvent(
            id: 'styled-1',
            title: 'Custom Event 1',
            startTime: DateTime(2024, 1, 15, 10, 0),
            endTime: DateTime(2024, 1, 15, 11, 0),
            backgroundColor: Colors.purple.shade100,
            textColor: Colors.purple.shade800,
            borderColor: Colors.purple.shade300,
          ),
          DSCalendarEvent(
            id: 'styled-2',
            title: 'Custom Event 2',
            startTime: DateTime(2024, 1, 17, 14, 0),
            endTime: DateTime(2024, 1, 17, 15, 0),
            backgroundColor: Colors.teal.shade100,
            textColor: Colors.teal.shade800,
            borderColor: Colors.teal.shade300,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSCalendar(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_custom_styled.png'),
      );
    });

    testWidgets('calendar with resources', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.week,
        selectedDate: DateTime(2024, 1, 15),
        resources: [
          DSCalendarResource(
            id: 'dev-1',
            name: 'María García',
            description: 'Senior Developer',
            email: 'maria.garcia@iautomat.com',
            color: Colors.blue.shade300,
            icon: Icons.person,
          ),
          DSCalendarResource(
            id: 'dev-2',
            name: 'Carlos López',
            description: 'Frontend Developer',
            email: 'carlos.lopez@iautomat.com',
            color: Colors.green.shade300,
            icon: Icons.person,
          ),
          DSCalendarResource(
            id: 'room-1',
            name: 'Meeting Room A',
            description: 'Capacity for 8 people, 4K TV',
            color: Colors.purple.shade300,
            icon: Icons.meeting_room,
          ),
        ],
        events: [
          DSCalendarEvent(
            id: 'resource-1',
            title: 'Team Standup',
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 9, 30),
            type: DSCalendarEventType.meeting,
          ),
          DSCalendarEvent(
            id: 'resource-2',
            title: 'Pair Programming Session',
            startTime: DateTime(2024, 1, 16, 14, 0),
            endTime: DateTime(2024, 1, 16, 17, 0),
            type: DSCalendarEventType.task,
          ),
          DSCalendarEvent(
            id: 'resource-3',
            title: 'Stakeholder Presentation',
            startTime: DateTime(2024, 1, 17, 16, 0),
            endTime: DateTime(2024, 1, 17, 17, 30),
            type: DSCalendarEventType.meeting,
            priority: DSCalendarEventPriority.high,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 600,
                child: DSCalendar(config: config),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_with_resources.png'),
      );
    });

    testWidgets('empty calendar state', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        selectedDate: DateTime(2024, 1, 15),
        events: [], // No events
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSCalendar(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_empty.png'),
      );
    });

    testWidgets('calendar with different event types and priorities',
        (tester) async {
      final baseDate = DateTime(2024, 1, 15);
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        selectedDate: baseDate,
        events: [
          DSCalendarEvent(
            id: 'meeting-high',
            title: 'High Priority Meeting',
            startTime: baseDate.add(const Duration(days: 1, hours: 9)),
            endTime: baseDate.add(const Duration(days: 1, hours: 10)),
            type: DSCalendarEventType.meeting,
            priority: DSCalendarEventPriority.high,
          ),
          DSCalendarEvent(
            id: 'task-normal',
            title: 'Regular Task',
            startTime: baseDate.add(const Duration(days: 2, hours: 10)),
            endTime: baseDate.add(const Duration(days: 2, hours: 12)),
            type: DSCalendarEventType.task,
            priority: DSCalendarEventPriority.normal,
          ),
          DSCalendarEvent(
            id: 'reminder-critical',
            title: 'Critical Reminder',
            startTime: baseDate.add(const Duration(days: 3, hours: 8)),
            endTime:
                baseDate.add(const Duration(days: 3, hours: 8, minutes: 15)),
            type: DSCalendarEventType.reminder,
            priority: DSCalendarEventPriority.critical,
          ),
          DSCalendarEvent(
            id: 'event-low',
            title: 'Low Priority Event',
            startTime: baseDate.add(const Duration(days: 4, hours: 15)),
            endTime: baseDate.add(const Duration(days: 4, hours: 16)),
            type: DSCalendarEventType.event,
            priority: DSCalendarEventPriority.low,
          ),
          DSCalendarEvent(
            id: 'busy-normal',
            title: 'Busy Time',
            startTime: baseDate.add(const Duration(days: 5, hours: 11)),
            endTime: baseDate.add(const Duration(days: 5, hours: 13)),
            type: DSCalendarEventType.busy,
            priority: DSCalendarEventPriority.normal,
          ),
          DSCalendarEvent(
            id: 'tentative-low',
            title: 'Tentative Meeting',
            startTime: baseDate.add(const Duration(days: 6, hours: 14)),
            endTime: baseDate.add(const Duration(days: 6, hours: 15)),
            type: DSCalendarEventType.tentative,
            priority: DSCalendarEventPriority.low,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.lightTheme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DSCalendar(config: config),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSCalendar),
        matchesGoldenFile('app_calendar_event_types_priorities.png'),
      );
    });

    group('Dark Theme', () {
      testWidgets('basic calendar in dark theme', (tester) async {
        final config = DSCalendarConfig(
          variant: DSCalendarVariant.month,
          selectedDate: DateTime(2024, 1, 15),
          events: [
            DSCalendarEvent(
              id: 'dark-1',
              title: 'Team Meeting',
              startTime: DateTime(2024, 1, 15, 9, 0),
              endTime: DateTime(2024, 1, 15, 10, 0),
              type: DSCalendarEventType.meeting,
            ),
            DSCalendarEvent(
              id: 'dark-2',
              title: 'Project Review',
              startTime: DateTime(2024, 1, 17, 14, 0),
              endTime: DateTime(2024, 1, 17, 15, 0),
              type: DSCalendarEventType.task,
              priority: DSCalendarEventPriority.high,
            ),
          ],
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: DSTheme.darkTheme,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: DSCalendar(config: config),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(DSCalendar),
          matchesGoldenFile('app_calendar_dark_theme.png'),
        );
      });
    });

    group('Responsive Layout', () {
      testWidgets('calendar on narrow screen', (tester) async {
        await tester.binding.setSurfaceSize(const Size(400, 600));

        final config = DSCalendarConfig(
          variant: DSCalendarVariant.month,
          selectedDate: DateTime(2024, 1, 15),
          events: [
            DSCalendarEvent(
              id: 'narrow-1',
              title: 'Meeting',
              startTime: DateTime(2024, 1, 15, 9, 0),
              endTime: DateTime(2024, 1, 15, 10, 0),
              type: DSCalendarEventType.meeting,
            ),
            DSCalendarEvent(
              id: 'narrow-2',
              title: 'Task',
              startTime: DateTime(2024, 1, 17, 14, 0),
              endTime: DateTime(2024, 1, 17, 15, 0),
              type: DSCalendarEventType.task,
            ),
          ],
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: DSTheme.lightTheme,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: DSCalendar(config: config),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(DSCalendar),
          matchesGoldenFile('app_calendar_narrow_screen.png'),
        );

        // Reset surface size
        await tester.binding.setSurfaceSize(null);
      });
    });
  });
}
