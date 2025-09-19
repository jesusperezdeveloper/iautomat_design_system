import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/progress/ds_progress.dart';

void main() {
  group('DSProgress', () {
    testWidgets('renders linear progress with basic configuration',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              label: 'Test progress',
            ),
          ),
        ),
      );

      expect(find.text('Test progress'), findsOneWidget);
      expect(find.text('50%'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('renders circular progress with basic configuration',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.7,
              label: 'Circular test',
            ),
          ),
        ),
      );

      expect(find.text('Circular test'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders indeterminate progress when value is null',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              label: 'Loading...',
            ),
          ),
        ),
      );

      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progressIndicator.value, isNull);
    });

    testWidgets('creates correct factory constructors', (tester) async {
      // Test linear factory
      final linearProgress = DSProgress.linear(
        value: 0.3,
        label: 'Linear test',
      );
      expect(linearProgress.variant, ProgressVariant.linear);
      expect(linearProgress.value, 0.3);
      expect(linearProgress.label, 'Linear test');

      // Test circular factory
      final circularProgress = DSProgress.circular(
        value: 0.8,
        label: 'Circular test',
        radius: 25.0,
      );
      expect(circularProgress.variant, ProgressVariant.circular);
      expect(circularProgress.value, 0.8);
      expect(circularProgress.radius, 25.0);
    });

    testWidgets('applies different states correctly', (tester) async {
      for (final state in DSProgressState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProgress(
                variant: ProgressVariant.circular,
                value: 0.5,
                state: state,
              ),
            ),
          ),
        );

        // Verificar que el widget se renderiza sin errores
        expect(find.byType(DSProgress), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('handles custom styling properties', (tester) async {
      const customBgColor = Colors.red;
      const customValueColor = Colors.green;
      const customLabelColor = Colors.blue;
      const customStrokeWidth = 8.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.6,
              label: 'Custom styled',
              backgroundColor: customBgColor,
              valueColor: customValueColor,
              labelColor: customLabelColor,
              strokeWidth: customStrokeWidth,
            ),
          ),
        ),
      );

      final progress = tester.widget<DSProgress>(find.byType(DSProgress));
      expect(progress.backgroundColor, customBgColor);
      expect(progress.valueColor, customValueColor);
      expect(progress.labelColor, customLabelColor);
      expect(progress.strokeWidth, customStrokeWidth);
    });

    testWidgets('copyWith creates correct copy', (tester) async {
      final original = DSProgress(
        variant: ProgressVariant.linear,
        value: 0.5,
        label: 'Original',
        state: DSProgressState.defaultState,
      );

      final copy = original.copyWith(
        value: 0.8,
        label: 'Updated',
        state: DSProgressState.disabled,
      );

      expect(copy.value, 0.8);
      expect(copy.label, 'Updated');
      expect(copy.state, DSProgressState.disabled);
      expect(copy.variant, original.variant); // Should remain the same
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSProgress(
                variant: ProgressVariant.linear,
                value: 0.4,
                label: 'RTL progress',
                rtlSupport: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('RTL progress'), findsOneWidget);
      expect(find.text('40%'), findsOneWidget);

      final progress = tester.widget<DSProgress>(find.byType(DSProgress));
      expect(progress.rtlSupport, isTrue);
    });

    testWidgets('has proper accessibility semantics', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.6,
              label: 'Accessible progress',
              accessibilityLabel: 'Custom accessibility label',
              accessibilityHint: 'Custom hint',
              accessibilitySupport: true,
            ),
          ),
        ),
      );

      expect(find.text('Accessible progress'), findsOneWidget);

      final progress = tester.widget<DSProgress>(find.byType(DSProgress));
      expect(progress.accessibilitySupport, isTrue);
      expect(progress.accessibilityLabel, 'Custom accessibility label');
      expect(progress.accessibilityHint, 'Custom hint');
    });

    testWidgets('handles tap interaction', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.7,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSProgress));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('handles hover interaction on desktop', (tester) async {
      bool hovered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              onHover: () => hovered = true,
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.byType(DSProgress)));
      await tester.pump();

      expect(hovered, isTrue);
    });

    testWidgets('respects custom dimensions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.5,
              radius: 30.0,
              strokeWidth: 6.0,
            ),
          ),
        ),
      );

      final progress = tester.widget<DSProgress>(find.byType(DSProgress));
      expect(progress.radius, 30.0);
      expect(progress.strokeWidth, 6.0);
    });

    testWidgets('handles loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              state: DSProgressState.loading,
            ),
          ),
        ),
      );

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('handles skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.5,
              state: DSProgressState.skeleton,
            ),
          ),
        ),
      );

      // Should render with skeleton styling
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              state: DSProgressState.disabled,
            ),
          ),
        ),
      );

      // Progress should be rendered but disabled
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('handles focus state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.5,
              state: DSProgressState.focus,
              onTap: () {},
            ),
          ),
        ),
      );

      // Should render focus border
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles pressed state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              state: DSProgressState.pressed,
            ),
          ),
        ),
      );

      // Should apply pressed transform
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('handles hover state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.5,
              state: DSProgressState.hover,
            ),
          ),
        ),
      );

      // Should apply hover transform
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('handles selected state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              state: DSProgressState.selected,
            ),
          ),
        ),
      );

      // Should render selection background
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('calls onHover and onTap callbacks', (tester) async {
      bool hoverCalled = false;
      bool tapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.5,
              onHover: () => hoverCalled = true,
              onTap: () => tapCalled = true,
            ),
          ),
        ),
      );

      // Initially callbacks should not be called
      expect(hoverCalled, isFalse);
      expect(tapCalled, isFalse);

      // Test tap
      await tester.tap(find.byType(DSProgress));
      await tester.pumpAndSettle();
      expect(tapCalled, isTrue);
    });

    testWidgets('supports custom animation duration', (tester) async {
      const customDuration = Duration(milliseconds: 500);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.linear,
              value: 0.5,
              animationDuration: customDuration,
            ),
          ),
        ),
      );

      final progress = tester.widget<DSProgress>(find.byType(DSProgress));
      expect(progress.animationDuration, customDuration);
    });

    testWidgets('supports padding', (tester) async {
      const customPadding = EdgeInsets.all(24.0);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSProgress(
              variant: ProgressVariant.circular,
              value: 0.5,
              padding: customPadding,
            ),
          ),
        ),
      );

      final progress = tester.widget<DSProgress>(find.byType(DSProgress));
      expect(progress.padding, customPadding);
      expect(find.byType(Padding), findsOneWidget);
    });
  });

  group('ProgressVariant', () {
    test('has correct values', () {
      expect(ProgressVariant.values.length, 2);
      expect(ProgressVariant.values, contains(ProgressVariant.linear));
      expect(ProgressVariant.values, contains(ProgressVariant.circular));
    });
  });

  group('DSProgressState', () {
    test('has correct values', () {
      expect(DSProgressState.values.length, 8);
      expect(DSProgressState.values, contains(DSProgressState.defaultState));
      expect(DSProgressState.values, contains(DSProgressState.hover));
      expect(DSProgressState.values, contains(DSProgressState.pressed));
      expect(DSProgressState.values, contains(DSProgressState.focus));
      expect(DSProgressState.values, contains(DSProgressState.selected));
      expect(DSProgressState.values, contains(DSProgressState.disabled));
      expect(DSProgressState.values, contains(DSProgressState.loading));
      expect(DSProgressState.values, contains(DSProgressState.skeleton));
    });

    test('canInteract extension works correctly', () {
      expect(DSProgressState.defaultState.canInteract, isTrue);
      expect(DSProgressState.hover.canInteract, isTrue);
      expect(DSProgressState.pressed.canInteract, isTrue);
      expect(DSProgressState.focus.canInteract, isTrue);
      expect(DSProgressState.selected.canInteract, isTrue);
      expect(DSProgressState.disabled.canInteract, isFalse);
      expect(DSProgressState.loading.canInteract, isFalse);
      expect(DSProgressState.skeleton.canInteract, isTrue);
    });
  });
}
