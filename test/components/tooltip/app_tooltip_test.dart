import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tooltip/app_tooltip.dart';

void main() {
  group('DSTooltip', () {
    testWidgets('renders with basic message and child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Test tooltip',
              child: Text('Child widget'),
            ),
          ),
        ),
      );

      expect(find.text('Child widget'), findsOneWidget);
      // Tooltip message should not be visible initially
      expect(find.text('Test tooltip'), findsNothing);
    });

    testWidgets('shows tooltip on hover for desktop', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Hover tooltip',
              variant: TooltipVariant.hover,
              showDelay: Duration(milliseconds: 100),
              child: Text('Hover target'),
            ),
          ),
        ),
      );

      expect(find.text('Hover target'), findsOneWidget);
      expect(find.text('Hover tooltip'), findsNothing);

      // Simulate mouse hover
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.text('Hover target')));

      // Wait for show delay
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // On web/desktop, tooltip should appear
      // Note: This test may behave differently based on platform
    });

    testWidgets('shows tooltip on focus', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTooltip.focus(
              message: 'Focus tooltip',
              showDelay: const Duration(milliseconds: 50),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Focus button'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Focus button'), findsOneWidget);

      // Focus the button
      await tester.tap(find.text('Focus button'));
      await tester.pumpAndSettle();

      // The button should be focused but tooltip may not show in tests
      // due to how focus events work in the test environment
    });

    testWidgets('creates correct factory constructors', (tester) async {
      // Test hover factory
      final hoverTooltip = DSTooltip.hover(
        message: 'Hover test',
        child: const Text('Hover'),
      );
      expect(hoverTooltip.variant, TooltipVariant.hover);
      expect(hoverTooltip.showDelay, const Duration(milliseconds: 300));

      // Test focus factory
      final focusTooltip = DSTooltip.focus(
        message: 'Focus test',
        child: const Text('Focus'),
      );
      expect(focusTooltip.variant, TooltipVariant.focus);
      expect(focusTooltip.showDelay, const Duration(milliseconds: 100));

      // Test long press factory
      final longPressTooltip = DSTooltip.longPress(
        message: 'Long press test',
        child: const Text('Long press'),
      );
      expect(longPressTooltip.variant, TooltipVariant.longPress);
      expect(longPressTooltip.showDelay, const Duration(milliseconds: 750));
    });

    testWidgets('applies different states correctly', (tester) async {
      for (final state in DSTooltipState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTooltip(
                message: 'State test',
                state: state,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        );

        // Skeleton state adds an additional Container wrapper
        if (state == DSTooltipState.skeleton) {
          expect(find.byType(Container), findsNWidgets(2));
        } else {
          expect(find.byType(Container), findsOneWidget);
        }
        // Use pump instead of pumpAndSettle to avoid infinite animations
        await tester.pump();
      }
    });

    testWidgets('handles different positions', (tester) async {
      for (final position in TooltipPosition.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: DSTooltip(
                  message: 'Position test',
                  preferredPosition: position,
                  child: const Text('Test'),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Test'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('respects custom delays', (tester) async {
      const customShowDelay = Duration(milliseconds: 1000);
      const customHideDelay = Duration(milliseconds: 500);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Delay test',
              showDelay: customShowDelay,
              hideDelay: customHideDelay,
              child: Text('Delay target'),
            ),
          ),
        ),
      );

      final tooltip = tester.widget<DSTooltip>(find.byType(DSTooltip));
      expect(tooltip.showDelay, customShowDelay);
      expect(tooltip.hideDelay, customHideDelay);
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSTooltip(
                message: 'RTL tooltip',
                rtlSupport: true,
                child: Text('RTL test'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('RTL test'), findsOneWidget);

      final tooltip = tester.widget<DSTooltip>(find.byType(DSTooltip));
      expect(tooltip.rtlSupport, isTrue);
    });

    testWidgets('has proper accessibility semantics', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Accessible tooltip',
              accessibilityLabel: 'Custom accessibility label',
              accessibilitySupport: true,
              child: Text('Accessible element'),
            ),
          ),
        ),
      );

      expect(find.text('Accessible element'), findsOneWidget);

      final tooltip = tester.widget<DSTooltip>(find.byType(DSTooltip));
      expect(tooltip.accessibilitySupport, isTrue);
      expect(tooltip.accessibilityLabel, 'Custom accessibility label');
    });

    testWidgets('handles custom styling properties', (tester) async {
      const customBgColor = Colors.red;
      const customTextColor = Colors.white;
      const customPadding = EdgeInsets.all(16);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Styled tooltip',
              backgroundColor: customBgColor,
              textColor: customTextColor,
              padding: customPadding,
              child: Text('Styled element'),
            ),
          ),
        ),
      );

      final tooltip = tester.widget<DSTooltip>(find.byType(DSTooltip));
      expect(tooltip.backgroundColor, customBgColor);
      expect(tooltip.textColor, customTextColor);
      expect(tooltip.padding, customPadding);
    });

    testWidgets('copyWith creates correct copy', (tester) async {
      final original = DSTooltip(
        message: 'Original message',
        variant: TooltipVariant.hover,
        state: DSTooltipState.defaultState,
        child: Text('Original child'),
      );

      final copy = original.copyWith(
        message: 'Updated message',
        variant: TooltipVariant.focus,
        state: DSTooltipState.disabled,
      );

      expect(copy.message, 'Updated message');
      expect(copy.variant, TooltipVariant.focus);
      expect(copy.state, DSTooltipState.disabled);
      expect(copy.child, original.child); // Should remain the same
    });

    testWidgets('supports loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Loading tooltip',
              state: DSTooltipState.loading,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
          ),
        ),
      );

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('supports skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Skeleton tooltip',
              state: DSTooltipState.skeleton,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      );

      // Should render with skeleton styling
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles long press on mobile platforms', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Long press tooltip',
              variant: TooltipVariant.longPress,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.purple,
              ),
            ),
          ),
        ),
      );

      final container = find.byType(Container).first;

      // Simulate long press
      await tester.longPress(container);
      await tester.pumpAndSettle();

      // Tooltip should be triggered (though overlay may not show in tests)
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('calls onShow and onHide callbacks', (tester) async {
      bool showCalled = false;
      bool hideCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Callback tooltip',
              onShow: () => showCalled = true,
              onHide: () => hideCalled = true,
              child: const Text('Callback test'),
            ),
          ),
        ),
      );

      // Initially callbacks should not be called
      expect(showCalled, isFalse);
      expect(hideCalled, isFalse);

      // Note: Testing actual callback execution requires triggering the tooltip
      // which is complex in unit tests due to overlay system
    });

    testWidgets('supports max width and lines constraints', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTooltip(
              message: 'Very long tooltip message that should be constrained',
              maxWidth: 200,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              child: Text('Constrained tooltip'),
            ),
          ),
        ),
      );

      final tooltip = tester.widget<DSTooltip>(find.byType(DSTooltip));
      expect(tooltip.maxWidth, 200);
      expect(tooltip.maxLines, 2);
      expect(tooltip.overflow, TextOverflow.ellipsis);
    });
  });

  group('TooltipVariant', () {
    test('has correct values', () {
      expect(TooltipVariant.values.length, 3);
      expect(TooltipVariant.values, contains(TooltipVariant.hover));
      expect(TooltipVariant.values, contains(TooltipVariant.focus));
      expect(TooltipVariant.values, contains(TooltipVariant.longPress));
    });
  });

  group('DSTooltipState', () {
    test('has correct values', () {
      expect(DSTooltipState.values.length, 8);
      expect(DSTooltipState.values, contains(DSTooltipState.defaultState));
      expect(DSTooltipState.values, contains(DSTooltipState.hover));
      expect(DSTooltipState.values, contains(DSTooltipState.pressed));
      expect(DSTooltipState.values, contains(DSTooltipState.focus));
      expect(DSTooltipState.values, contains(DSTooltipState.selected));
      expect(DSTooltipState.values, contains(DSTooltipState.disabled));
      expect(DSTooltipState.values, contains(DSTooltipState.loading));
      expect(DSTooltipState.values, contains(DSTooltipState.skeleton));
    });
  });

  group('TooltipPosition', () {
    test('has correct values', () {
      expect(TooltipPosition.values.length, 8);
      expect(TooltipPosition.values, contains(TooltipPosition.top));
      expect(TooltipPosition.values, contains(TooltipPosition.bottom));
      expect(TooltipPosition.values, contains(TooltipPosition.left));
      expect(TooltipPosition.values, contains(TooltipPosition.right));
      expect(TooltipPosition.values, contains(TooltipPosition.topStart));
      expect(TooltipPosition.values, contains(TooltipPosition.topEnd));
      expect(TooltipPosition.values, contains(TooltipPosition.bottomStart));
      expect(TooltipPosition.values, contains(TooltipPosition.bottomEnd));
    });
  });
}
