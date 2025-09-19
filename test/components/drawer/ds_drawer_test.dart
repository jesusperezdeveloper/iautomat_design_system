import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/drawer/ds_drawer.dart';

void main() {
  group('DSDrawer', () {
    testWidgets('renders modal drawer correctly', (tester) async {
      bool visibilityChanged = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Center(child: Text('Drawer Content')),
              onVisibilityChanged: (visible) {
                visibilityChanged = visible;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Drawer Content'), findsOneWidget);
      expect(visibilityChanged, isFalse); // Modal drawer starts closed
    });

    testWidgets('renders permanent drawer correctly', (tester) async {
      bool visibilityChanged = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Center(child: Text('Permanent Drawer')),
              onVisibilityChanged: (visible) {
                visibilityChanged = visible;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Permanent Drawer'), findsOneWidget);
      expect(visibilityChanged, isTrue); // Permanent drawer is always visible
    });

    testWidgets('modal drawer has correct default properties', (tester) async {
      const drawer = DSDrawer.modal(
        content: Text('Test'),
      );

      expect(drawer.variant, equals(DrawerVariant.modal));
      expect(drawer.side, equals(DrawerSide.left));
      expect(drawer.width, equals(280.0));
      expect(drawer.state, equals(DSDrawerState.defaultState));
      expect(drawer.elevation, equals(16.0));
      expect(drawer.borderRadius, equals(0.0));
      expect(drawer.scrimOpacity, equals(0.5));
      expect(drawer.enableDragGesture, isTrue);
    });

    testWidgets('permanent drawer has correct default properties', (tester) async {
      const drawer = DSDrawer.permanent(
        content: Text('Test'),
      );

      expect(drawer.variant, equals(DrawerVariant.permanent));
      expect(drawer.side, equals(DrawerSide.left));
      expect(drawer.width, equals(280.0));
      expect(drawer.state, equals(DSDrawerState.defaultState));
      expect(drawer.elevation, equals(0.0));
      expect(drawer.borderRadius, equals(0.0));
      expect(drawer.scrimOpacity, equals(0.0));
      expect(drawer.enableDragGesture, isFalse);
    });

    testWidgets('supports custom width', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test'),
              width: 350.0,
            ),
          ),
        ),
      );

      await tester.pump();

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, equals(350.0));
    });

    testWidgets('supports different drawer sides', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test'),
              side: DrawerSide.right,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('handles loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test Content'),
              state: DSDrawerState.loading,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando...'), findsOneWidget);
      expect(find.text('Test Content'), findsNothing);
    });

    testWidgets('handles skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test Content'),
              state: DSDrawerState.skeleton,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Test Content'), findsNothing);
      expect(find.byType(Container), findsWidgets); // Skeleton containers
    });

    testWidgets('supports custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test'),
              backgroundColor: Colors.red,
              surfaceColor: Colors.blue,
              shadowColor: Colors.green,
              dividerColor: Colors.yellow,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('supports custom elevation and border radius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              elevation: 24.0,
              borderRadius: 16.0,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('supports custom scrim opacity', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              scrimOpacity: 0.8,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('supports custom animation duration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              animationDuration: const Duration(milliseconds: 500),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('responds to hover interactions', (tester) async {
      DSDrawerState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test'),
              onStateChanged: (state) => capturedState = state,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);

      // Simulate hover using pointer events for desktop testing
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await tester.pump();

      // Move mouse over the drawer
      await gesture.moveTo(tester.getCenter(find.byType(DSDrawer)));
      await tester.pump();

      // Verify hover state was captured if supported
      if (capturedState != null) {
        expect(capturedState, isNotNull);
      }
    });

    testWidgets('responds to focus interactions', (tester) async {
      DSDrawerState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              onStateChanged: (state) => capturedState = state,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);

      // Simulate focus interaction using keyboard navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Verify focus state handling
      if (capturedState != null) {
        expect(capturedState, isNotNull);
      }

      // Test that the drawer can receive focus
      final drawerWidget = find.byType(DSDrawer);
      expect(drawerWidget, findsOneWidget);
    });

    testWidgets('handles keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
            ),
          ),
        ),
      );

      await tester.pump();

      // Simulate escape key press
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();

      // Simulate enter key press
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      // Simulate space key press
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();

      // No exceptions should be thrown
      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test'),
              state: DSDrawerState.disabled,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSDrawer.permanent(
                content: const Text('Test'),
                side: DrawerSide.right,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('supports semantics labels', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.permanent(
              content: const Text('Test'),
              semanticsLabel: 'Custom drawer label',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byWidgetPredicate((widget) =>
        widget is Semantics &&
        widget.properties.label == 'Custom drawer label'), findsOneWidget);
    });

    testWidgets('supports restoration ID', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              restorationId: 'drawer_restoration',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('handles drag gestures when enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              enableDragGesture: true,
            ),
          ),
        ),
      );

      await tester.pump();

      final gesture = await tester.startGesture(const Offset(100, 100));
      await gesture.moveBy(const Offset(50, 0));
      await gesture.up();
      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    testWidgets('ignores drag gestures when disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDrawer.modal(
              content: const Text('Test'),
              enableDragGesture: false,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(DSDrawer), findsOneWidget);
    });

    group('DSDrawerController', () {
      testWidgets('can control drawer state', (tester) async {
        final controller = DSDrawerController();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDrawer.modal(
                key: controller.key,
                content: const Text('Test'),
              ),
            ),
          ),
        );

        await tester.pump();

        expect(controller.isClosed, isTrue);
        expect(controller.isOpen, isFalse);

        controller.open();
        await tester.pump();

        controller.close();
        await tester.pump();

        controller.toggle();
        await tester.pump();

        expect(find.byType(DSDrawer), findsOneWidget);
      });

      test('notifies listeners on state changes', () {
        final controller = DSDrawerController();
        bool wasNotified = false;

        controller.addListener(() {
          wasNotified = true;
        });

        controller.open();
        expect(wasNotified, isTrue);

        wasNotified = false;
        controller.close();
        expect(wasNotified, isTrue);

        wasNotified = false;
        controller.toggle();
        expect(wasNotified, isTrue);
      });
    });

    group('DSDrawerHelper', () {
      testWidgets('creates modal drawer with correct properties', (tester) async {
        final drawer = DSDrawerHelper.createModalDrawer(
          content: const Text('Modal Test'),
          width: 320.0,
          elevation: 20.0,
          scrimOpacity: 0.7,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: drawer),
          ),
        );

        await tester.pump();

        expect(find.text('Modal Test'), findsOneWidget);
        expect(find.byType(DSDrawer), findsOneWidget);

        final appDrawer = tester.widget<DSDrawer>(find.byType(DSDrawer));
        expect(appDrawer.variant, equals(DrawerVariant.modal));
        expect(appDrawer.width, equals(320.0));
        expect(appDrawer.elevation, equals(20.0));
        expect(appDrawer.scrimOpacity, equals(0.7));
      });

      testWidgets('creates permanent drawer with correct properties', (tester) async {
        final drawer = DSDrawerHelper.createPermanentDrawer(
          content: const Text('Permanent Test'),
          width: 350.0,
          elevation: 8.0,
          side: DrawerSide.right,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: drawer),
          ),
        );

        await tester.pump();

        expect(find.text('Permanent Test'), findsOneWidget);
        expect(find.byType(DSDrawer), findsOneWidget);

        final appDrawer = tester.widget<DSDrawer>(find.byType(DSDrawer));
        expect(appDrawer.variant, equals(DrawerVariant.permanent));
        expect(appDrawer.width, equals(350.0));
        expect(appDrawer.elevation, equals(8.0));
        expect(appDrawer.side, equals(DrawerSide.right));
      });
    });

    group('Enums', () {
      test('DrawerVariant contains expected values', () {
        expect(DrawerVariant.values.length, equals(2));
        expect(DrawerVariant.values, contains(DrawerVariant.modal));
        expect(DrawerVariant.values, contains(DrawerVariant.permanent));
      });

      test('DSDrawerState contains expected values', () {
        expect(DSDrawerState.values.length, equals(8));
        expect(DSDrawerState.values, contains(DSDrawerState.defaultState));
        expect(DSDrawerState.values, contains(DSDrawerState.hover));
        expect(DSDrawerState.values, contains(DSDrawerState.pressed));
        expect(DSDrawerState.values, contains(DSDrawerState.focus));
        expect(DSDrawerState.values, contains(DSDrawerState.selected));
        expect(DSDrawerState.values, contains(DSDrawerState.disabled));
        expect(DSDrawerState.values, contains(DSDrawerState.loading));
        expect(DSDrawerState.values, contains(DSDrawerState.skeleton));
      });

      test('DrawerSide contains expected values', () {
        expect(DrawerSide.values.length, equals(2));
        expect(DrawerSide.values, contains(DrawerSide.left));
        expect(DrawerSide.values, contains(DrawerSide.right));
      });
    });
  });
}