import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppTimeline', () {
    group('Constructor', () {
      test('should create AppTimeline with activity constructor', () {
        final events = [
          AppTimelineEvent(
            id: '1',
            title: 'Test Event',
            timestamp: DateTime.now(),
          ),
        ];

        final timeline = AppTimeline.activity(events: events);

        expect(timeline.config.variant, equals(AppTimelineVariant.activity));
        expect(timeline.config.events, equals(events));
        expect(timeline.config.orientation, equals(AppTimelineOrientation.vertical));
        expect(timeline.config.spacing, equals(AppTimelineSpacing.medium));
      });

      test('should create AppTimeline with custom orientation', () {
        final timeline = AppTimeline.activity(
          events: [],
          orientation: AppTimelineOrientation.horizontal,
        );

        expect(timeline.config.orientation, equals(AppTimelineOrientation.horizontal));
      });

      test('should create AppTimeline with custom connector style', () {
        final timeline = AppTimeline.activity(
          events: [],
          connectorStyle: AppTimelineConnectorStyle.dashed,
        );

        expect(timeline.config.connectorStyle, equals(AppTimelineConnectorStyle.dashed));
      });

      test('should create AppTimeline with custom indicator style', () {
        final timeline = AppTimeline.activity(
          events: [],
          indicatorStyle: AppTimelineIndicatorStyle.icon,
        );

        expect(timeline.config.indicatorStyle, equals(AppTimelineIndicatorStyle.icon));
      });
    });

    group('Configuration Properties', () {
      test('should be interactive when onEventTap is provided', () {
        final timeline = AppTimeline.activity(
          events: [],
          onEventTap: (index) {},
        );

        expect(timeline.config.isInteractive, isTrue);
      });

      test('should be hoverable when onEventHover is provided', () {
        final timeline = AppTimeline.activity(
          events: [],
          onEventHover: (index) {},
        );

        expect(timeline.config.isHoverable, isTrue);
      });

      test('should be disabled when enabled is false', () {
        final timeline = AppTimeline.activity(
          events: [],
          enabled: false,
        );

        expect(timeline.config.isDisabled, isTrue);
        expect(timeline.config.canInteract, isFalse);
      });

      test('should be loading when loading is true', () {
        final timeline = AppTimeline.activity(
          events: [],
          loading: true,
        );

        expect(timeline.config.isLoading, isTrue);
        expect(timeline.config.shouldShowSkeleton, isTrue);
      });

      test('should be skeleton when skeleton is true', () {
        final timeline = AppTimeline.activity(
          events: [],
          skeleton: true,
        );

        expect(timeline.config.isSkeleton, isTrue);
        expect(timeline.config.shouldShowSkeleton, isTrue);
      });

      test('should have events when events list is not empty', () {
        final events = [
          AppTimelineEvent(id: '1', title: 'Test'),
        ];

        final timeline = AppTimeline.activity(events: events);

        expect(timeline.config.hasEvents, isTrue);
      });

      test('should be horizontal when orientation is horizontal', () {
        final timeline = AppTimeline.activity(
          events: [],
          orientation: AppTimelineOrientation.horizontal,
        );

        expect(timeline.config.isHorizontal, isTrue);
        expect(timeline.config.isVertical, isFalse);
      });

      test('should be vertical when orientation is vertical', () {
        final timeline = AppTimeline.activity(
          events: [],
          orientation: AppTimelineOrientation.vertical,
        );

        expect(timeline.config.isVertical, isTrue);
        expect(timeline.config.isHorizontal, isFalse);
      });

      test('should have selection when selectedIndex is provided', () {
        final timeline = AppTimeline.activity(
          events: [],
          selectedIndex: 0,
        );

        expect(timeline.config.hasSelection, isTrue);
      });

      test('should be reversed when reversed is true', () {
        final timeline = AppTimeline.activity(
          events: [],
          reversed: true,
        );

        expect(timeline.config.isReversed, isTrue);
      });
    });

    group('Effective Values', () {
      test('should return effective connector width', () {
        final timeline1 = AppTimeline.activity(events: []);
        final timeline2 = AppTimeline.activity(
          events: [],
          connectorWidth: 4.0,
        );

        expect(timeline1.config.getEffectiveConnectorWidth(),
               equals(AppTimelineConstants.defaultConnectorWidth));
        expect(timeline2.config.getEffectiveConnectorWidth(), equals(4.0));
      });

      test('should return effective indicator size', () {
        final timeline1 = AppTimeline.activity(events: []);
        final timeline2 = AppTimeline.activity(
          events: [],
          indicatorSize: 20.0,
        );

        expect(timeline1.config.getEffectiveIndicatorSize(),
               equals(AppTimelineSpacing.medium.indicatorSize));
        expect(timeline2.config.getEffectiveIndicatorSize(), equals(20.0));
      });

      test('should return effective item spacing', () {
        final timeline1 = AppTimeline.activity(events: []);
        final timeline2 = AppTimeline.activity(
          events: [],
          itemSpacing: 24.0,
        );

        expect(timeline1.config.getEffectiveItemSpacing(),
               equals(AppTimelineSpacing.medium.itemSpacing));
        expect(timeline2.config.getEffectiveItemSpacing(), equals(24.0));
      });

      test('should calculate effective colors', () {
        const colorScheme = ColorScheme.light();
        const customColor = Colors.purple;

        final timeline1 = AppTimeline.activity(events: []);
        final timeline2 = AppTimeline.activity(
          events: [],
          connectorColor: customColor,
          indicatorColor: customColor,
        );

        expect(
          timeline1.config.getEffectiveConnectorColor(colorScheme),
          equals(colorScheme.outline.withValues(alpha: 0.5)),
        );

        expect(
          timeline1.config.getEffectiveIndicatorColor(colorScheme),
          equals(colorScheme.primary),
        );

        expect(
          timeline2.config.getEffectiveConnectorColor(colorScheme),
          equals(customColor),
        );

        expect(
          timeline2.config.getEffectiveIndicatorColor(colorScheme),
          equals(customColor),
        );
      });
    });

    group('Widget Rendering', () {
      testWidgets('should render empty timeline', (tester) async {
        final timeline = AppTimeline.activity(events: []);

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(AppTimeline), findsOneWidget);
      });

      testWidgets('should render timeline with events', (tester) async {
        final events = [
          AppTimelineEvent(
            id: '1',
            title: 'Event 1',
            subtitle: 'Subtitle 1',
          ),
          AppTimelineEvent(
            id: '2',
            title: 'Event 2',
            subtitle: 'Subtitle 2',
          ),
        ];

        final timeline = AppTimeline.activity(events: events);

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.text('Event 1'), findsOneWidget);
        expect(find.text('Event 2'), findsOneWidget);
        expect(find.text('Subtitle 1'), findsOneWidget);
        expect(find.text('Subtitle 2'), findsOneWidget);
      });

      testWidgets('should not render when not visible', (tester) async {
        final timeline = AppTimeline.activity(
          events: [],
          visible: false,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(AppTimeline), findsOneWidget);
        expect(find.byType(SizedBox), findsOneWidget);
      });

      testWidgets('should render skeleton when loading', (tester) async {
        final timeline = AppTimeline.activity(
          events: [],
          loading: true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('should render skeleton when skeleton is true', (tester) async {
        final timeline = AppTimeline.activity(
          events: [],
          skeleton: true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(Container), findsWidgets);
      });
    });

    group('Interactions', () {
      testWidgets('should call onEventTap when event is tapped', (tester) async {
        int? tappedIndex;

        final events = [
          AppTimelineEvent(id: '1', title: 'Event 1'),
        ];

        final timeline = AppTimeline.activity(
          events: events,
          onEventTap: (index) => tappedIndex = index,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        // Find any tappable element within the timeline
        final cards = find.byType(Card);
        if (cards.evaluate().isNotEmpty) {
          await tester.tap(cards.first);
          expect(tappedIndex, equals(0));
        }
      });

      testWidgets('should call onTap when timeline is tapped', (tester) async {
        bool tapped = false;

        final timeline = AppTimeline.activity(
          events: [],
          onTap: () => tapped = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        await tester.tap(find.byType(AppTimeline));
        expect(tapped, isTrue);
      });

      testWidgets('should not respond to interactions when disabled', (tester) async {
        bool tapped = false;

        final timeline = AppTimeline.activity(
          events: [],
          enabled: false,
          onTap: () => tapped = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        await tester.tap(find.byType(AppTimeline));
        expect(tapped, isFalse);
      });
    });

    group('Orientations', () {
      testWidgets('should render vertical timeline correctly', (tester) async {
        final events = [
          AppTimelineEvent(id: '1', title: 'Event 1'),
          AppTimelineEvent(id: '2', title: 'Event 2'),
        ];

        final timeline = AppTimeline.activity(
          events: events,
          orientation: AppTimelineOrientation.vertical,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(Column), findsWidgets);
        expect(find.text('Event 1'), findsOneWidget);
        expect(find.text('Event 2'), findsOneWidget);
      });

      testWidgets('should render horizontal timeline correctly', (tester) async {
        final events = [
          AppTimelineEvent(id: '1', title: 'Event 1'),
          AppTimelineEvent(id: '2', title: 'Event 2'),
        ];

        final timeline = AppTimeline.activity(
          events: events,
          orientation: AppTimelineOrientation.horizontal,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(Row), findsWidgets);
        expect(find.text('Event 1'), findsOneWidget);
        expect(find.text('Event 2'), findsOneWidget);
      });
    });

    group('Event Types and Status', () {
      testWidgets('should render events with different types', (tester) async {
        final events = [
          AppTimelineEvent(
            id: '1',
            title: 'Milestone',
            type: AppTimelineEventType.milestone,
          ),
          AppTimelineEvent(
            id: '2',
            title: 'Task',
            type: AppTimelineEventType.task,
          ),
          AppTimelineEvent(
            id: '3',
            title: 'Meeting',
            type: AppTimelineEventType.meeting,
          ),
        ];

        final timeline = AppTimeline.activity(
          events: events,
          indicatorStyle: AppTimelineIndicatorStyle.icon,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.text('Milestone'), findsOneWidget);
        expect(find.text('Task'), findsOneWidget);
        expect(find.text('Meeting'), findsOneWidget);
        expect(find.byIcon(Icons.flag), findsOneWidget);
        expect(find.byIcon(Icons.task_alt), findsOneWidget);
        expect(find.byIcon(Icons.meeting_room), findsOneWidget);
      });

      testWidgets('should render events with different statuses', (tester) async {
        final events = [
          AppTimelineEvent(
            id: '1',
            title: 'Completed',
            status: AppTimelineEventStatus.completed,
          ),
          AppTimelineEvent(
            id: '2',
            title: 'In Progress',
            status: AppTimelineEventStatus.inProgress,
          ),
          AppTimelineEvent(
            id: '3',
            title: 'Pending',
            status: AppTimelineEventStatus.pending,
          ),
        ];

        final timeline = AppTimeline.activity(events: events);

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.text('Completed'), findsOneWidget);
        expect(find.text('In Progress'), findsOneWidget);
        expect(find.text('Pending'), findsOneWidget);
      });
    });

    group('Accessibility', () {
      testWidgets('should have semantic label', (tester) async {
        final timeline = AppTimeline.activity(
          events: [],
          semanticLabel: 'Custom timeline label',
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(
          tester.getSemantics(find.byType(AppTimeline)),
          matchesSemantics(label: 'Custom timeline label'),
        );
      });

      testWidgets('should be focusable when interactive', (tester) async {
        final timeline = AppTimeline.activity(
          events: [],
          onTap: () {},
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: timeline)));

        expect(find.byType(AppTimeline), findsOneWidget);
      });
    });
  });

  group('AppTimelineEvent', () {
    group('Properties', () {
      test('should have correct properties', () {
        final event = AppTimelineEvent(
          id: '1',
          title: 'Test Event',
          subtitle: 'Test Subtitle',
          description: 'Test Description',
          timestamp: DateTime.now(),
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.completed,
          enabled: true,
          visible: true,
          selected: false,
        );

        expect(event.hasTitle, isTrue);
        expect(event.hasSubtitle, isTrue);
        expect(event.hasDescription, isTrue);
        expect(event.hasTimestamp, isTrue);
        expect(event.enabled, isTrue);
        expect(event.isVisible, isTrue);
        expect(event.isSelected, isFalse);
        expect(event.displayTitle, equals('Test Event'));
        expect(event.displaySubtitle, equals('Test Subtitle'));
        expect(event.displayDescription, equals('Test Description'));
      });

      test('should handle empty properties correctly', () {
        final event = AppTimelineEvent(id: '1');

        expect(event.hasTitle, isFalse);
        expect(event.hasSubtitle, isFalse);
        expect(event.hasDescription, isFalse);
        expect(event.hasTimestamp, isFalse);
        expect(event.hasContent, isFalse);
        expect(event.hasLeading, isFalse);
        expect(event.hasTrailing, isFalse);
        expect(event.hasIcon, isFalse);
        expect(event.displayTitle, equals(''));
        expect(event.displaySubtitle, equals(''));
        expect(event.displayDescription, equals(''));
      });

      test('should be interactive when callbacks are provided', () {
        final event1 = AppTimelineEvent(id: '1');
        final event2 = AppTimelineEvent(
          id: '2',
          onTap: () {},
        );

        expect(event1.isInteractive, isFalse);
        expect(event2.isInteractive, isTrue);
      });

      test('should calculate effective colors correctly', () {
        const colorScheme = ColorScheme.light();
        const customColor = Colors.purple;

        final event1 = AppTimelineEvent(id: '1');
        final event2 = AppTimelineEvent(
          id: '2',
          iconColor: customColor,
          status: AppTimelineEventStatus.completed,
        );
        final event3 = AppTimelineEvent(
          id: '3',
          backgroundColor: customColor,
          selected: true,
        );

        expect(
          event1.getEffectiveIconColor(colorScheme),
          equals(colorScheme.primary),
        );

        expect(
          event2.getEffectiveIconColor(colorScheme),
          equals(customColor),
        );

        expect(
          event3.getEffectiveBackgroundColor(colorScheme),
          equals(customColor),
        );
      });
    });
  });

  group('AppTimelineSpacing Extensions', () {
    test('should return correct spacing values', () {
      expect(AppTimelineSpacing.compact.itemSpacing, equals(12.0));
      expect(AppTimelineSpacing.medium.itemSpacing, equals(16.0));
      expect(AppTimelineSpacing.comfortable.itemSpacing, equals(24.0));

      expect(AppTimelineSpacing.compact.indicatorSize, equals(12.0));
      expect(AppTimelineSpacing.medium.indicatorSize, equals(16.0));
      expect(AppTimelineSpacing.comfortable.indicatorSize, equals(20.0));

      expect(AppTimelineSpacing.compact.connectorIndent, equals(24.0));
      expect(AppTimelineSpacing.medium.connectorIndent, equals(32.0));
      expect(AppTimelineSpacing.comfortable.connectorIndent, equals(40.0));
    });
  });

  group('AppTimelineEventType Extensions', () {
    test('should return correct icons and colors', () {
      const colorScheme = ColorScheme.light();

      expect(
        AppTimelineEventType.milestone.defaultIcon,
        equals(Icons.flag),
      );

      expect(
        AppTimelineEventType.task.defaultIcon,
        equals(Icons.task_alt),
      );

      expect(
        AppTimelineEventType.meeting.defaultIcon,
        equals(Icons.meeting_room),
      );

      expect(
        AppTimelineEventType.milestone.getColor(colorScheme),
        equals(colorScheme.primary),
      );

      expect(
        AppTimelineEventType.success.getColor(colorScheme),
        equals(Colors.green),
      );

      expect(
        AppTimelineEventType.error.getColor(colorScheme),
        equals(colorScheme.error),
      );
    });

    test('should return correct labels', () {
      expect(AppTimelineEventType.milestone.label, equals('Hito'));
      expect(AppTimelineEventType.task.label, equals('Tarea'));
      expect(AppTimelineEventType.meeting.label, equals('Reunión'));
      expect(AppTimelineEventType.success.label, equals('Éxito'));
      expect(AppTimelineEventType.warning.label, equals('Advertencia'));
      expect(AppTimelineEventType.error.label, equals('Error'));
      expect(AppTimelineEventType.info.label, equals('Información'));
    });
  });

  group('AppTimelineEventStatus Extensions', () {
    test('should return correct colors and icons', () {
      const colorScheme = ColorScheme.light();

      expect(
        AppTimelineEventStatus.pending.getColor(colorScheme),
        equals(colorScheme.outline),
      );

      expect(
        AppTimelineEventStatus.inProgress.getColor(colorScheme),
        equals(Colors.blue),
      );

      expect(
        AppTimelineEventStatus.completed.getColor(colorScheme),
        equals(Colors.green),
      );

      expect(
        AppTimelineEventStatus.pending.icon,
        equals(Icons.pending),
      );

      expect(
        AppTimelineEventStatus.completed.icon,
        equals(Icons.check_circle),
      );

      expect(
        AppTimelineEventStatus.cancelled.icon,
        equals(Icons.cancel),
      );
    });

    test('should return correct labels', () {
      expect(AppTimelineEventStatus.pending.label, equals('Pendiente'));
      expect(AppTimelineEventStatus.inProgress.label, equals('En progreso'));
      expect(AppTimelineEventStatus.completed.label, equals('Completado'));
      expect(AppTimelineEventStatus.cancelled.label, equals('Cancelado'));
      expect(AppTimelineEventStatus.overdue.label, equals('Vencido'));
    });
  });

  group('AppTimelineState Extensions', () {
    test('should identify interactive states correctly', () {
      expect(AppTimelineState.hover.isInteractiveState, isTrue);
      expect(AppTimelineState.pressed.isInteractiveState, isTrue);
      expect(AppTimelineState.focus.isInteractiveState, isTrue);
      expect(AppTimelineState.defaultState.isInteractiveState, isFalse);
      expect(AppTimelineState.disabled.isInteractiveState, isFalse);
    });

    test('should identify state types correctly', () {
      expect(AppTimelineState.disabled.isDisabledState, isTrue);
      expect(AppTimelineState.loading.isLoadingState, isTrue);
      expect(AppTimelineState.skeleton.isSkeletonState, isTrue);
      expect(AppTimelineState.selected.isSelectedState, isTrue);
    });
  });

  group('AppTimelineVariant Extensions', () {
    test('should identify activity variant correctly', () {
      expect(AppTimelineVariant.activity.isActivity, isTrue);
    });
  });
}