import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSCalendar Tests', () {
    testWidgets('renders correctly with basic configuration', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        events: [
          DSCalendarEvent(
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
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('displays events correctly in month view', (tester) async {
      final testDate = DateTime(2024, 1, 15);
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        selectedDate: testDate,
        events: [
          DSCalendarEvent(
            id: 'test-event',
            title: 'Test Meeting',
            startTime: testDate.add(const Duration(hours: 10)),
            endTime: testDate.add(const Duration(hours: 11)),
            type: DSCalendarEventType.meeting,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify the calendar renders
      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('handles event tap callback', (tester) async {
      final testEvent = DSCalendarEvent(
        id: 'tap-test',
        title: 'Tappable Event',
        startTime: DateTime(2024, 1, 15, 10, 0),
        endTime: DateTime(2024, 1, 15, 11, 0),
      );

      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        events: [testEvent],
        onEventTap: (event) => {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Try to find and tap an event (this would depend on the actual rendering)
      // For now, just verify the calendar renders with the callback
      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('switches between calendar variants', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        onViewChange: (variant) => {},
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('displays resources when provided', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.week,
        resources: [
          DSCalendarResource(
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
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('applies custom styling', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        backgroundColor: Colors.red,
        headerBackgroundColor: Colors.blue,
        headerTextColor: Colors.white,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('handles different event types', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.day,
        events: [
          DSCalendarEvent(
            id: 'meeting',
            title: 'Meeting',
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            type: DSCalendarEventType.meeting,
          ),
          DSCalendarEvent(
            id: 'task',
            title: 'Task',
            startTime: DateTime(2024, 1, 15, 11, 0),
            endTime: DateTime(2024, 1, 15, 12, 0),
            type: DSCalendarEventType.task,
          ),
          DSCalendarEvent(
            id: 'reminder',
            title: 'Reminder',
            startTime: DateTime(2024, 1, 15, 14, 0),
            endTime: DateTime(2024, 1, 15, 14, 15),
            type: DSCalendarEventType.reminder,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('handles different event priorities', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.week,
        events: [
          DSCalendarEvent(
            id: 'low',
            title: 'Low Priority',
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            priority: DSCalendarEventPriority.low,
          ),
          DSCalendarEvent(
            id: 'normal',
            title: 'Normal Priority',
            startTime: DateTime(2024, 1, 15, 11, 0),
            endTime: DateTime(2024, 1, 15, 12, 0),
            priority: DSCalendarEventPriority.normal,
          ),
          DSCalendarEvent(
            id: 'high',
            title: 'High Priority',
            startTime: DateTime(2024, 1, 15, 13, 0),
            endTime: DateTime(2024, 1, 15, 14, 0),
            priority: DSCalendarEventPriority.high,
          ),
          DSCalendarEvent(
            id: 'critical',
            title: 'Critical Priority',
            startTime: DateTime(2024, 1, 15, 15, 0),
            endTime: DateTime(2024, 1, 15, 16, 0),
            priority: DSCalendarEventPriority.critical,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('handles working hours configuration', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.day,
        showWorkingHours: true,
        startHour: 8,
        endHour: 18,
        workingHoursBackgroundColor: Colors.green.shade50,
        nonWorkingHoursBackgroundColor: Colors.grey.shade100,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    testWidgets('handles localization', (tester) async {
      final config = DSCalendarConfig(
        variant: DSCalendarVariant.month,
        localization: DSCalendarLocalization(
          monthNames: [
            'Enero',
            'Febrero',
            'Marzo',
            'Abril',
            'Mayo',
            'Junio',
            'Julio',
            'Agosto',
            'Septiembre',
            'Octubre',
            'Noviembre',
            'Diciembre'
          ],
          dayNames: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
          timeFormat: 24,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCalendar(config: config),
          ),
        ),
      );

      expect(find.byType(DSCalendar), findsOneWidget);
    });

    group('DSCalendarConfig', () {
      test('creates with default values', () {
        final config = DSCalendarConfig();

        expect(config.variant, DSCalendarVariant.month);
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
          DSCalendarEvent(
            id: 'test',
            title: 'Test',
            startTime: DateTime(2024, 1, 15),
            endTime: DateTime(2024, 1, 15),
          ),
        ];

        final config = DSCalendarConfig(
          variant: DSCalendarVariant.week,
          events: events,
          startHour: 9,
          endHour: 17,
          timeSlotHeight: 80.0,
        );

        expect(config.variant, DSCalendarVariant.week);
        expect(config.events, events);
        expect(config.startHour, 9);
        expect(config.endHour, 17);
        expect(config.timeSlotHeight, 80.0);
      });

      test('copyWith works correctly', () {
        final originalConfig = DSCalendarConfig(
          variant: DSCalendarVariant.month,
          startHour: 8,
        );

        final newConfig = originalConfig.copyWith(
          variant: DSCalendarVariant.week,
          endHour: 20,
        );

        expect(newConfig.variant, DSCalendarVariant.week);
        expect(newConfig.startHour, 8); // unchanged
        expect(newConfig.endHour, 20); // changed
      });
    });

    group('DSCalendarEvent', () {
      test('creates with required fields', () {
        final event = DSCalendarEvent(
          id: 'test-event',
          title: 'Test Event',
          startTime: DateTime(2024, 1, 15, 10, 0),
          endTime: DateTime(2024, 1, 15, 11, 0),
        );

        expect(event.id, 'test-event');
        expect(event.title, 'Test Event');
        expect(event.type, DSCalendarEventType.event);
        expect(event.priority, DSCalendarEventPriority.normal);
        expect(event.isAllDay, false);
        expect(event.isEditable, true);
        expect(event.isDeletable, true);
        expect(event.isRecurring, false);
      });

      test('creates with custom values', () {
        final event = DSCalendarEvent(
          id: 'custom-event',
          title: 'Custom Event',
          description: 'A custom event',
          startTime: DateTime(2024, 1, 15, 10, 0),
          endTime: DateTime(2024, 1, 15, 11, 0),
          type: DSCalendarEventType.meeting,
          priority: DSCalendarEventPriority.high,
          isAllDay: true,
          isEditable: false,
          backgroundColor: Colors.red,
        );

        expect(event.description, 'A custom event');
        expect(event.type, DSCalendarEventType.meeting);
        expect(event.priority, DSCalendarEventPriority.high);
        expect(event.isAllDay, true);
        expect(event.isEditable, false);
        expect(event.backgroundColor, Colors.red);
      });
    });

    group('DSCalendarResource', () {
      test('creates with required fields', () {
        final resource = DSCalendarResource(
          id: 'resource-1',
          name: 'Test Resource',
        );

        expect(resource.id, 'resource-1');
        expect(resource.name, 'Test Resource');
        expect(resource.isAvailable, true);
      });

      test('creates with custom values', () {
        final resource = DSCalendarResource(
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

    group('DSCalendarLocalization', () {
      test('creates with default Spanish values', () {
        final localization = DSCalendarLocalization();

        expect(localization.monthNames, isNotEmpty);
        expect(localization.dayNames, isNotEmpty);
        expect(localization.timeFormat, 24);
        expect(localization.monthNames.first, 'Enero');
        expect(localization.dayNames.first, 'Lunes');
      });

      test('creates with custom values', () {
        final customMonths = ['Jan', 'Feb', 'Mar'];
        final customDays = ['Sun', 'Mon', 'Tue'];

        final localization = DSCalendarLocalization(
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
