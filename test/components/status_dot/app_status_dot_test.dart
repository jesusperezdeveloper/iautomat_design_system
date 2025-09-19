import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/status_dot/app_status_dot.dart';

void main() {
  group('DSStatusDot', () {
    testWidgets('renders success variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.success(
              label: 'Success status',
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.text('Success status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSStatusDot),
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
            body: DSStatusDot.info(
              label: 'Info status',
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.text('Info status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSStatusDot),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      final theme = Theme.of(tester.element(find.byType(DSStatusDot)));
      expect(decoration.color, equals(theme.colorScheme.primary));
    });

    testWidgets('renders warn variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.warn(
              label: 'Warning status',
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.text('Warning status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSStatusDot),
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
            body: DSStatusDot.error(
              label: 'Error status',
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.text('Error status'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSStatusDot),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      final theme = Theme.of(tester.element(find.byType(DSStatusDot)));
      expect(decoration.color, equals(theme.colorScheme.error));
    });

    testWidgets('renders without label when label is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.success(),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.success(
              label: 'Disabled status',
              state: DSStatusDotState.disabled,
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);

      final opacity = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(DSStatusDot),
          matching: find.byType(Opacity),
        ),
      );

      expect(opacity.opacity, equals(0.5));
    });

    testWidgets('handles loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.info(
              label: 'Loading status',
              state: DSStatusDotState.loading,
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('handles skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.warn(
              label: 'Skeleton status',
              state: DSStatusDotState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);

      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(DSStatusDot),
          matching: find.byType(Container),
        ),
      );

      expect(containers.length, greaterThanOrEqualTo(2));

      // Verify there's a skeleton wrapper container
      bool foundSkeletonContainer = false;
      for (final container in containers) {
        if (container.decoration is BoxDecoration) {
          final decoration = container.decoration as BoxDecoration;
          final theme = Theme.of(tester.element(find.byType(DSStatusDot)));
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
            body: DSStatusDot.success(
              label: 'Tappable status',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSStatusDot));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not respond to tap when disabled', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.success(
              label: 'Disabled status',
              state: DSStatusDotState.disabled,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSStatusDot));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('handles hover state on desktop platforms', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.info(
              label: 'Hoverable status',
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.byType(DSStatusDot)));
      await tester.pump();

      expect(find.byType(DSStatusDot), findsOneWidget);
    });

    testWidgets('handles focus state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.error(
              label: 'Focusable status',
            ),
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      expect(find.byType(DSStatusDot), findsOneWidget);
    });

    testWidgets('displays correct semantics for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSStatusDot.success(
              label: 'Accessible status',
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(DSStatusDot));
      expect(semantics.label, contains('Success'));
      expect(semantics.label, contains('Accessible status'));
    });

    testWidgets('handles RTL layout correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSStatusDot.info(
                label: 'RTL status',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSStatusDot), findsOneWidget);
      expect(find.text('RTL status'), findsOneWidget);
    });

    testWidgets('supports all state variants', (tester) async {
      for (final state in DSStatusDotState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStatusDot.success(
                label: 'Test status',
                state: state,
              ),
            ),
          ),
        );

        expect(find.byType(DSStatusDot), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('supports all status variants', (tester) async {
      for (final variant in StatusDotVariant.values) {
        Widget widget;
        switch (variant) {
          case StatusDotVariant.success:
            widget = DSStatusDot.success(label: 'Test');
            break;
          case StatusDotVariant.info:
            widget = DSStatusDot.info(label: 'Test');
            break;
          case StatusDotVariant.warn:
            widget = DSStatusDot.warn(label: 'Test');
            break;
          case StatusDotVariant.error:
            widget = DSStatusDot.error(label: 'Test');
            break;
        }

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: widget),
          ),
        );

        expect(find.byType(DSStatusDot), findsOneWidget);
        await tester.pump();
      }
    });
  });
}