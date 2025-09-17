import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppTimeline Golden Tests', () {
    testWidgets('should render basic vertical timeline correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Evento 1',
          subtitle: 'Primer evento del timeline',
          timestamp: DateTime(2024, 1, 1, 10, 0),
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.completed,
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Evento 2',
          subtitle: 'Segundo evento del timeline',
          timestamp: DateTime(2024, 1, 2, 14, 30),
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.inProgress,
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Evento 3',
          subtitle: 'Tercer evento del timeline',
          timestamp: DateTime(2024, 1, 3, 9, 15),
          type: AppTimelineEventType.meeting,
          status: AppTimelineEventStatus.pending,
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              orientation: AppTimelineOrientation.vertical,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_vertical_basic.png'),
      );
    });

    testWidgets('should render horizontal timeline correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Inicio',
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.completed,
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Desarrollo',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.inProgress,
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Testing',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.pending,
        ),
        AppTimelineEvent(
          id: '4',
          title: 'Lanzamiento',
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.pending,
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              orientation: AppTimelineOrientation.horizontal,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_horizontal.png'),
      );
    });

    testWidgets('should render different indicator styles correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Dot Style',
          type: AppTimelineEventType.task,
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Circle Style',
          type: AppTimelineEventType.task,
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Square Style',
          type: AppTimelineEventType.task,
        ),
        AppTimelineEvent(
          id: '4',
          title: 'Icon Style',
          type: AppTimelineEventType.milestone,
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppTimeline.activity(
                    events: [events[0]],
                    indicatorStyle: AppTimelineIndicatorStyle.dot,
                  ),
                ),
                Expanded(
                  child: AppTimeline.activity(
                    events: [events[1]],
                    indicatorStyle: AppTimelineIndicatorStyle.circle,
                  ),
                ),
                Expanded(
                  child: AppTimeline.activity(
                    events: [events[2]],
                    indicatorStyle: AppTimelineIndicatorStyle.square,
                  ),
                ),
                Expanded(
                  child: AppTimeline.activity(
                    events: [events[3]],
                    indicatorStyle: AppTimelineIndicatorStyle.icon,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_indicator_styles.png'),
      );
    });

    testWidgets('should render different connector styles correctly', (tester) async {
      final events = [
        AppTimelineEvent(id: '1', title: 'Evento 1'),
        AppTimelineEvent(id: '2', title: 'Evento 2'),
        AppTimelineEvent(id: '3', title: 'Evento 3'),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('Solid'),
                      Expanded(
                        child: AppTimeline.activity(
                          events: events,
                          connectorStyle: AppTimelineConnectorStyle.solid,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Dashed'),
                      Expanded(
                        child: AppTimeline.activity(
                          events: events,
                          connectorStyle: AppTimelineConnectorStyle.dashed,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Dotted'),
                      Expanded(
                        child: AppTimeline.activity(
                          events: events,
                          connectorStyle: AppTimelineConnectorStyle.dotted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_connector_styles.png'),
      );
    });

    testWidgets('should render different spacing correctly', (tester) async {
      final events = [
        AppTimelineEvent(id: '1', title: 'Evento 1'),
        AppTimelineEvent(id: '2', title: 'Evento 2'),
        AppTimelineEvent(id: '3', title: 'Evento 3'),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('Compact'),
                      Expanded(
                        child: AppTimeline.activity(
                          events: events,
                          spacing: AppTimelineSpacing.compact,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Medium'),
                      Expanded(
                        child: AppTimeline.activity(
                          events: events,
                          spacing: AppTimelineSpacing.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Comfortable'),
                      Expanded(
                        child: AppTimeline.activity(
                          events: events,
                          spacing: AppTimelineSpacing.comfortable,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_spacing.png'),
      );
    });

    testWidgets('should render event types correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Milestone',
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.completed,
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Task',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.inProgress,
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Meeting',
          type: AppTimelineEventType.meeting,
          status: AppTimelineEventStatus.pending,
        ),
        AppTimelineEvent(
          id: '4',
          title: 'Deadline',
          type: AppTimelineEventType.deadline,
          status: AppTimelineEventStatus.pending,
        ),
        AppTimelineEvent(
          id: '5',
          title: 'Success',
          type: AppTimelineEventType.success,
          status: AppTimelineEventStatus.completed,
        ),
        AppTimelineEvent(
          id: '6',
          title: 'Warning',
          type: AppTimelineEventType.warning,
          status: AppTimelineEventStatus.pending,
        ),
        AppTimelineEvent(
          id: '7',
          title: 'Error',
          type: AppTimelineEventType.error,
          status: AppTimelineEventStatus.cancelled,
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              indicatorStyle: AppTimelineIndicatorStyle.icon,
              spacing: AppTimelineSpacing.comfortable,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_event_types.png'),
      );
    });

    testWidgets('should render event statuses correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Pending Task',
          subtitle: 'This task is pending',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.pending,
        ),
        AppTimelineEvent(
          id: '2',
          title: 'In Progress Task',
          subtitle: 'This task is in progress',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.inProgress,
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Completed Task',
          subtitle: 'This task is completed',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.completed,
        ),
        AppTimelineEvent(
          id: '4',
          title: 'Cancelled Task',
          subtitle: 'This task was cancelled',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.cancelled,
        ),
        AppTimelineEvent(
          id: '5',
          title: 'Overdue Task',
          subtitle: 'This task is overdue',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.overdue,
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              indicatorStyle: AppTimelineIndicatorStyle.icon,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_event_statuses.png'),
      );
    });

    testWidgets('should render selected state correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Normal Event',
          subtitle: 'This is a normal event',
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Selected Event',
          subtitle: 'This event is selected',
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Another Normal Event',
          subtitle: 'This is another normal event',
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              selectedIndex: 1, // Select the second event
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_selected.png'),
      );
    });

    testWidgets('should render skeleton state correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: [], // Empty events to show skeleton
              skeleton: true,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_skeleton.png'),
      );
    });

    testWidgets('should render with custom content correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Code Review',
          subtitle: 'Pull request #123',
          description: 'Added new authentication feature',
          timestamp: DateTime(2024, 1, 1, 10, 0),
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.completed,
          content: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.code, size: 16),
                SizedBox(width: 8),
                Text('auth_service.dart'),
              ],
            ),
          ),
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Deployment',
          subtitle: 'Version 2.1.0',
          description: 'Successfully deployed to production',
          timestamp: DateTime(2024, 1, 2, 14, 30),
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.completed,
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Production',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              spacing: AppTimelineSpacing.comfortable,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_custom_content.png'),
      );
    });

    testWidgets('should render dark theme correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Dark Theme Event',
          subtitle: 'Event in dark theme',
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.completed,
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Another Dark Event',
          subtitle: 'Another event in dark theme',
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.inProgress,
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Third Dark Event',
          subtitle: 'Third event in dark theme',
          type: AppTimelineEventType.meeting,
          status: AppTimelineEventStatus.pending,
        ),
      ];

      final widget = MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              indicatorStyle: AppTimelineIndicatorStyle.icon,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_dark_theme.png'),
      );
    });

    testWidgets('should render reversed timeline correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'First Event',
          subtitle: 'This should appear last when reversed',
          timestamp: DateTime(2024, 1, 1),
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Second Event',
          subtitle: 'This should appear in the middle',
          timestamp: DateTime(2024, 1, 2),
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Third Event',
          subtitle: 'This should appear first when reversed',
          timestamp: DateTime(2024, 1, 3),
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              reversed: true,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_reversed.png'),
      );
    });

    testWidgets('should render complex timeline correctly', (tester) async {
      final events = [
        AppTimelineEvent(
          id: '1',
          title: 'Project Kickoff',
          subtitle: 'Initial planning meeting',
          description: 'Team gathered to discuss project requirements and timeline',
          timestamp: DateTime(2024, 1, 1, 9, 0),
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.completed,
          trailing: Chip(
            label: const Text('High Priority'),
            backgroundColor: Colors.red.withValues(alpha: 0.1),
          ),
        ),
        AppTimelineEvent(
          id: '2',
          title: 'Design Phase',
          subtitle: 'UI/UX Design',
          description: 'Creating wireframes and mockups for the application',
          timestamp: DateTime(2024, 1, 5, 14, 0),
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.completed,
          content: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.design_services, size: 16),
                SizedBox(width: 8),
                Text('figma_designs.fig'),
              ],
            ),
          ),
        ),
        AppTimelineEvent(
          id: '3',
          title: 'Development Sprint 1',
          subtitle: 'Core functionality',
          description: 'Implementing authentication and basic user management',
          timestamp: DateTime(2024, 1, 12, 10, 0),
          type: AppTimelineEventType.task,
          status: AppTimelineEventStatus.inProgress,
        ),
        AppTimelineEvent(
          id: '4',
          title: 'Code Review',
          subtitle: 'PR #145 - Authentication',
          description: 'Reviewing authentication implementation',
          timestamp: DateTime(2024, 1, 15, 16, 30),
          type: AppTimelineEventType.meeting,
          status: AppTimelineEventStatus.pending,
        ),
        AppTimelineEvent(
          id: '5',
          title: 'Production Deploy',
          subtitle: 'Version 1.0.0',
          description: 'First production release',
          timestamp: DateTime(2024, 1, 20, 18, 0),
          type: AppTimelineEventType.milestone,
          status: AppTimelineEventStatus.pending,
        ),
      ];

      final widget = MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTimeline.activity(
              events: events,
              indicatorStyle: AppTimelineIndicatorStyle.icon,
              spacing: AppTimelineSpacing.comfortable,
              selectedIndex: 2, // Select the third event
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_timeline_complex.png'),
      );
    });
  });
}