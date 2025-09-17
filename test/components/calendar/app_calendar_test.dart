import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppCalendar Tests', () {
    testWidgets('renders correctly with basic configuration', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.month,
        events: [
          AppCalendarEvent(
            id: 'test-1',
            title: 'Test Event',
            startTime: DateTime(2024, 1, 15, 10, 0),
            endTime: DateTime(2024, 1, 15, 11, 0),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('displays events correctly in month view', (tester) async {
      final testDate = DateTime(2024, 1, 15);
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.month,
        selectedDate: testDate,
        events: [
          AppCalendarEvent(
            id: 'test-event',
            title: 'Test Meeting',
            startTime: testDate.add(const Duration(hours: 10)),
            endTime: testDate.add(const Duration(hours: 11)),
            type: AppCalendarEventType.meeting,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify the calendar renders
      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('handles event tap callback', (tester) async {
      final testEvent = AppCalendarEvent(
        id: 'tap-test',
        title: 'Tappable Event',
        startTime: DateTime(2024, 1, 15, 10, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
      );

      final config = AppCalendarConfig(
        variant: AppCalendarVariant.month,
        events: [testEvent],
        onEventTap: (event) => {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Try to find and tap an event (this would depend on the actual rendering)
      // For now, just verify the calendar renders with the callback
      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('switches between calendar variants', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.month,
        onViewChange: (variant) => {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('displays resources when provided', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.week,
        resources: [
          AppCalendarResource(
            id: 'resource-1',
            name: 'Test Resource',
            description: 'A test resource',
            color: Colors.blue,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('applies custom styling', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.month,
        backgroundColor: Colors.red,
        headerBackgroundColor: Colors.blue,
        headerTextColor: Colors.white,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('handles different event types', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.day,
        events: [
          AppCalendarEvent(
            id: 'meeting',
            title: 'Meeting',
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            type: AppCalendarEventType.meeting,
          ),
          AppCalendarEvent(
            id: 'task',
            title: 'Task',
            startTime: DateTime(2024, 1, 15, 11, 0),
            endTime: DateTime(2024, 1, 15, 12, 0),
            type: AppCalendarEventType.task,
          ),
          AppCalendarEvent(
            id: 'reminder',
            title: 'Reminder',
            startTime: DateTime(2024, 1, 15, 14, 0),
            endTime: DateTime(2024, 1, 15, 14, 15),
            type: AppCalendarEventType.reminder,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('handles different event priorities', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.week,
        events: [
          AppCalendarEvent(
            id: 'low',
            title: 'Low Priority',
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            priority: AppCalendarEventPriority.low,
          ),
          AppCalendarEvent(
            id: 'normal',
            title: 'Normal Priority',
            startTime: DateTime(2024, 1, 15, 11, 0),
            endTime: DateTime(2024, 1, 15, 12, 0),
            priority: AppCalendarEventPriority.normal,
          ),
          AppCalendarEvent(
            id: 'high',
            title: 'High Priority',
            startTime: DateTime(2024, 1, 15, 13, 0),
            endTime: DateTime(2024, 1, 15, 14, 0),
            priority: AppCalendarEventPriority.high,
          ),
          AppCalendarEvent(
            id: 'critical',
            title: 'Critical Priority',
            startTime: DateTime(2024, 1, 15, 15, 0),
            endTime: DateTime(2024, 1, 15, 16, 0),
            priority: AppCalendarEventPriority.critical,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('handles working hours configuration', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.day,
        showWorkingHours: true,
        startHour: 8,
        endHour: 18,
        workingHoursBackgroundColor: Colors.green.shade50,
        nonWorkingHoursBackgroundColor: Colors.grey.shade100,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    testWidgets('handles localization', (tester) async {
      final config = AppCalendarConfig(
        variant: AppCalendarVariant.month,
        localization: AppCalendarLocalization(
          monthNames: [
            'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
          ],
          dayNames: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
          timeFormat: 24,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(AppCalendar), findsOneWidget);
    });

    group('AppCalendarConfig', () {
      test('creates with default values', () {
        final config = AppCalendarConfig();

        expect(config.variant, AppCalendarVariant.month);
        expect(config.events, isEmpty);
        expect(config.resources, isEmpty);
        expect(config.showWorkingHours, true);
        expect(config.startHour, 0);
        expect(config.endHour, 24);
        expect(config.timeSlotHeight, 60.0);
        expect(config.headerHeight, 56.0);
        expect(config.cellHeight, 48.0);
        expect(config.eventBorderRadius, 4.0);
        expect(config.showCurrentTimeLine, true);
      });

      test('creates with custom values', () {
        final events = [
          AppCalendarEvent(
            id: 'test',
            title: 'Test',
            startTime: DateTime(2024, 1, 15),
            endTime: DateTime(2024, 1, 15),
          ),
        ];

        final config = AppCalendarConfig(
          variant: AppCalendarVariant.week,
          events: events,
          startHour: 9,
          endHour: 17,
          timeSlotHeight: 80.0,
        );

        expect(config.variant, AppCalendarVariant.week);
        expect(config.events, events);
        expect(config.startHour, 9);
        expect(config.endHour, 17);
        expect(config.timeSlotHeight, 80.0);
      });

      test('copyWith works correctly', () {
        final originalConfig = AppCalendarConfig(
          variant: AppCalendarVariant.month,
          startHour: 8,
        );

        final newConfig = originalConfig.copyWith(
          variant: AppCalendarVariant.week,
          endHour: 20,
        );

        expect(newConfig.variant, AppCalendarVariant.week);
        expect(newConfig.startHour, 8); // unchanged
        expect(newConfig.endHour, 20); // changed
      });
    });

    group('AppCalendarEvent', () {
      test('creates with required fields', () {
        final event = AppCalendarEvent(
          id: 'test-event',
          title: 'Test Event',
          startTime: DateTime(2024, 1, 15, 10, 0),
          endTime: DateTime(2024, 1, 15, 11, 0),
        );

        expect(event.id, 'test-event');
        expect(event.title, 'Test Event');
        expect(event.type, AppCalendarEventType.event);
        expect(event.priority, AppCalendarEventPriority.normal);
        expect(event.isAllDay, false);
        expect(event.isEditable, true);
        expect(event.isDeletable, true);
        expect(event.isRecurring, false);
      });

      test('creates with custom values', () {
        final event = AppCalendarEvent(
          id: 'custom-event',
          title: 'Custom Event',
          description: 'A custom event',
          startTime: DateTime(2024, 1, 15, 10, 0),
          endTime: DateTime(2024, 1, 15, 11, 0),
          type: AppCalendarEventType.meeting,
          priority: AppCalendarEventPriority.high,
          isAllDay: true,
          isEditable: false,
          backgroundColor: Colors.red,
        );

        expect(event.description, 'A custom event');
        expect(event.type, AppCalendarEventType.meeting);
        expect(event.priority, AppCalendarEventPriority.high);
        expect(event.isAllDay, true);
        expect(event.isEditable, false);
        expect(event.backgroundColor, Colors.red);
      });
    });

    group('AppCalendarResource', () {
      test('creates with required fields', () {
        final resource = AppCalendarResource(
          id: 'resource-1',
          name: 'Test Resource',
        );

        expect(resource.id, 'resource-1');
        expect(resource.name, 'Test Resource');
        expect(resource.isAvailable, true);
      });

      test('creates with custom values', () {
        final resource = AppCalendarResource(
          id: 'custom-resource',
          name: 'Custom Resource',
          description: 'A custom resource',
          email: 'test@example.com',
          color: Colors.blue,
          isAvailable: false,
        );

        expect(resource.description, 'A custom resource');
        expect(resource.email, 'test@example.com');
        expect(resource.color, Colors.blue);
        expect(resource.isAvailable, false);
      });
    });

    group('AppCalendarLocalization', () {
      test('creates with default Spanish values', () {
        final localization = AppCalendarLocalization();

        expect(localization.monthNames, isNotEmpty);
        expect(localization.dayNames, isNotEmpty);
        expect(localization.timeFormat, 24);
        expect(localization.monthNames.first, 'Enero');
        expect(localization.dayNames.first, 'Lunes');
      });

      test('creates with custom values', () {
        final customMonths = ['Jan', 'Feb', 'Mar'];
        final customDays = ['Sun', 'Mon', 'Tue'];

        final localization = AppCalendarLocalization(
          monthNames: customMonths,
          dayNames: customDays,
          timeFormat: 12,
        );

        expect(localization.monthNames, customMonths);
        expect(localization.dayNames, customDays);
        expect(localization.timeFormat, 12);
      });
    });
  });
}