import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/status_dot/app_status_dot.dart';

void main() {
  group('AppStatusDot', () {
    testWidgets('renders success variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.success(
              label: 'Success status',
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.text('Success status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppStatusDot),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.green));
    });

    testWidgets('renders info variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.info(
              label: 'Info status',
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.text('Info status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppStatusDot),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      final theme = Theme.of(tester.element(find.byType(AppStatusDot)));
      expect(decoration.color, equals(theme.colorScheme.primary));
    });

    testWidgets('renders warn variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.warn(
              label: 'Warning status',
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.text('Warning status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppStatusDot),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.orange));
    });

    testWidgets('renders error variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.error(
              label: 'Error status',
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.text('Error status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppStatusDot),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      final theme = Theme.of(tester.element(find.byType(AppStatusDot)));
      expect(decoration.color, equals(theme.colorScheme.error));
    });

    testWidgets('renders without label when label is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.success(),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.success(
              label: 'Disabled status',
              state: AppStatusDotState.disabled,
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);

      final opacity = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(AppStatusDot),
          matching: find.byType(Opacity),
        ),
      );

      expect(opacity.opacity, equals(0.5));
    });

    testWidgets('handles loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.info(
              label: 'Loading status',
              state: AppStatusDotState.loading,
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('handles skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.warn(
              label: 'Skeleton status',
              state: AppStatusDotState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);

      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(AppStatusDot),
          matching: find.byType(Container),
        ),
      );

      expect(containers.length, greaterThanOrEqualTo(2));

      // Verify there's a skeleton wrapper container
      bool foundSkeletonContainer = false;
      for (final container in containers) {
        if (container.decoration is BoxDecoration) {
          final decoration = container.decoration as BoxDecoration;
          final theme = Theme.of(tester.element(find.byType(AppStatusDot)));
          if (decoration.color == theme.colorScheme.surface.withValues(alpha: 0.3)) {
            foundSkeletonContainer = true;
            break;
          }
        }
      }
      expect(foundSkeletonContainer, isTrue);
    });

    testWidgets('responds to tap gestures when not disabled', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.success(
              label: 'Tappable status',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppStatusDot));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not respond to tap when disabled', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.success(
              label: 'Disabled status',
              state: AppStatusDotState.disabled,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppStatusDot));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('handles hover state on desktop platforms', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.info(
              label: 'Hoverable status',
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.byType(AppStatusDot)));
      await tester.pump();

      expect(find.byType(AppStatusDot), findsOneWidget);
    });

    testWidgets('handles focus state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.error(
              label: 'Focusable status',
            ),
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      expect(find.byType(AppStatusDot), findsOneWidget);
    });

    testWidgets('displays correct semantics for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppStatusDot.success(
              label: 'Accessible status',
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(AppStatusDot));
      expect(semantics.label, contains('Success'));
      expect(semantics.label, contains('Accessible status'));
    });

    testWidgets('handles RTL layout correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppStatusDot.info(
                label: 'RTL status',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppStatusDot), findsOneWidget);
      expect(find.text('RTL status'), findsOneWidget);
    });

    testWidgets('supports all state variants', (tester) async {
      for (final state in AppStatusDotState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStatusDot.success(
                label: 'Test status',
                state: state,
              ),
            ),
          ),
        );

        expect(find.byType(AppStatusDot), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('supports all status variants', (tester) async {
      for (final variant in StatusDotVariant.values) {
        Widget widget;
        switch (variant) {
          case StatusDotVariant.success:
            widget = AppStatusDot.success(label: 'Test');
            break;
          case StatusDotVariant.info:
            widget = AppStatusDot.info(label: 'Test');
            break;
          case StatusDotVariant.warn:
            widget = AppStatusDot.warn(label: 'Test');
            break;
          case StatusDotVariant.error:
            widget = AppStatusDot.error(label: 'Test');
            break;
        }

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: widget),
          ),
        );

        expect(find.byType(AppStatusDot), findsOneWidget);
        await tester.pump();
      }
    });
  });
}