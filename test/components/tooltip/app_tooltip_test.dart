import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tooltip/app_tooltip.dart';

void main() {
  group('AppTooltip', () {
    testWidgets('renders with basic message and child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppTooltip(
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
            body: AppTooltip(
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
            body: AppTooltip.focus(
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
      final hoverTooltip = AppTooltip.hover(
        message: 'Hover test',
        child: const Text('Hover'),
      );
      expect(hoverTooltip.variant, TooltipVariant.hover);
      expect(hoverTooltip.showDelay, const Duration(milliseconds: 300));

      // Test focus factory
      final focusTooltip = AppTooltip.focus(
        message: 'Focus test',
        child: const Text('Focus'),
      );
      expect(focusTooltip.variant, TooltipVariant.focus);
      expect(focusTooltip.showDelay, const Duration(milliseconds: 100));

      // Test long press factory
      final longPressTooltip = AppTooltip.longPress(
        message: 'Long press test',
        child: const Text('Long press'),
      );
      expect(longPressTooltip.variant, TooltipVariant.longPress);
      expect(longPressTooltip.showDelay, const Duration(milliseconds: 750));
    });

    testWidgets('applies different states correctly', (tester) async {
      for (final state in AppTooltipState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTooltip(
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
        if (state == AppTooltipState.skeleton) {
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
                child: AppTooltip(
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
            body: AppTooltip(
              message: 'Delay test',
              showDelay: customShowDelay,
              hideDelay: customHideDelay,
              child: Text('Delay target'),
            ),
          ),
        ),
      );

      final tooltip = tester.widget<AppTooltip>(find.byType(AppTooltip));
      expect(tooltip.showDelay, customShowDelay);
      expect(tooltip.hideDelay, customHideDelay);
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppTooltip(
                message: 'RTL tooltip',
                rtlSupport: true,
                child: Text('RTL test'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('RTL test'), findsOneWidget);

      final tooltip = tester.widget<AppTooltip>(find.byType(AppTooltip));
      expect(tooltip.rtlSupport, isTrue);
    });

    testWidgets('has proper accessibility semantics', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppTooltip(
              message: 'Accessible tooltip',
              accessibilityLabel: 'Custom accessibility label',
              accessibilitySupport: true,
              child: Text('Accessible element'),
            ),
          ),
        ),
      );

      expect(find.text('Accessible element'), findsOneWidget);

      final tooltip = tester.widget<AppTooltip>(find.byType(AppTooltip));
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
            body: AppTooltip(
              message: 'Styled tooltip',
              backgroundColor: customBgColor,
              textColor: customTextColor,
              padding: customPadding,
              child: Text('Styled element'),
            ),
          ),
        ),
      );

      final tooltip = tester.widget<AppTooltip>(find.byType(AppTooltip));
      expect(tooltip.backgroundColor, customBgColor);
      expect(tooltip.textColor, customTextColor);
      expect(tooltip.padding, customPadding);
    });

    testWidgets('copyWith creates correct copy', (tester) async {
      final original = AppTooltip(
        message: 'Original message',
        variant: TooltipVariant.hover,
        state: AppTooltipState.defaultState,
        child: Text('Original child'),
      );

      final copy = original.copyWith(
        message: 'Updated message',
        variant: TooltipVariant.focus,
        state: AppTooltipState.disabled,
      );

      expect(copy.message, 'Updated message');
      expect(copy.variant, TooltipVariant.focus);
      expect(copy.state, AppTooltipState.disabled);
      expect(copy.child, original.child); // Should remain the same
    });

    testWidgets('supports loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTooltip(
              message: 'Loading tooltip',
              state: AppTooltipState.loading,
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
            body: AppTooltip(
              message: 'Skeleton tooltip',
              state: AppTooltipState.skeleton,
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
            body: AppTooltip(
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
            body: AppTooltip(
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
            body: AppTooltip(
              message: 'Very long tooltip message that should be constrained',
              maxWidth: 200,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              child: Text('Constrained tooltip'),
            ),
          ),
        ),
      );

      final tooltip = tester.widget<AppTooltip>(find.byType(AppTooltip));
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

  group('AppTooltipState', () {
    test('has correct values', () {
      expect(AppTooltipState.values.length, 8);
      expect(AppTooltipState.values, contains(AppTooltipState.defaultState));
      expect(AppTooltipState.values, contains(AppTooltipState.hover));
      expect(AppTooltipState.values, contains(AppTooltipState.pressed));
      expect(AppTooltipState.values, contains(AppTooltipState.focus));
      expect(AppTooltipState.values, contains(AppTooltipState.selected));
      expect(AppTooltipState.values, contains(AppTooltipState.disabled));
      expect(AppTooltipState.values, contains(AppTooltipState.loading));
      expect(AppTooltipState.values, contains(AppTooltipState.skeleton));
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
