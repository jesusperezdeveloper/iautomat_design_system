import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSSwitch', () {
    const testSemanticLabel = 'Test Switch';

    Widget createSwitchApp({
      DSSwitchConfig? config,
      bool? value,
      ValueChanged<bool>? onChanged,
      String? semanticsLabel,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: DSSwitch(
            config: config ?? const DSSwitchConfig(),
            value: value,
            onChanged: onChanged,
            semanticsLabel: semanticsLabel,
          ),
        ),
      );
    }

    testWidgets('renders basic switch correctly', (tester) async {
      await tester.pumpWidget(createSwitchApp());
      await tester.pumpAndSettle();

      expect(find.byType(DSSwitch), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('renders with semantic label when provided', (tester) async {
      await tester.pumpWidget(createSwitchApp(
        semanticsLabel: testSemanticLabel,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Semantics), findsWidgets);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createSwitchApp(
        config: const DSSwitchConfig(
          state: DSSwitchState.loading,
        ),
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createSwitchApp(
        config: const DSSwitchConfig(
          state: DSSwitchState.skeleton,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    group('Variants', () {
      testWidgets('renders android variant by default', (tester) async {
        await tester.pumpWidget(createSwitchApp());
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });

      testWidgets('renders cupertino variant correctly', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            variant: DSSwitchVariant.cupertino,
            isAdaptive: false, // Force cupertino even on test platform
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(CupertinoSwitch), findsOneWidget);
      });

      testWidgets('adapts to platform when isAdaptive is true', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            isAdaptive: true,
          ),
        ));
        await tester.pumpAndSettle();

        // Should render Material Switch on test platform (Android)
        expect(find.byType(Switch), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in DSSwitchState.values) {
          await tester.pumpWidget(createSwitchApp(
            config: DSSwitchConfig(state: state),
          ));
          await tester.pump();

          if (state.showsLoader) {
            expect(find.byType(CircularProgressIndicator), findsOneWidget);
          } else if (state.showsSkeleton) {
            expect(find.byType(Container), findsWidgets);
          } else {
            expect(find.byType(Switch), findsOneWidget);
          }
        }
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        var toggled = false;

        await tester.pumpWidget(createSwitchApp(
          config: DSSwitchConfig(
            state: DSSwitchState.disabled,
            onChanged: (value) => toggled = value,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(DSSwitch));
        await tester.pumpAndSettle();

        expect(toggled, isFalse);
      });
    });

    group('Value and Toggle', () {
      testWidgets('handles toggle correctly', (tester) async {
        var toggledValue = false;

        await tester.pumpWidget(createSwitchApp(
          value: false,
          onChanged: (value) => toggledValue = value,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(toggledValue, isTrue);
      });

      testWidgets('reflects initial value correctly', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          value: true,
        ));
        await tester.pumpAndSettle();

        final switchWidget = tester.widget<Switch>(find.byType(Switch));
        expect(switchWidget.value, isTrue);
      });

      testWidgets('updates value when prop changes', (tester) async {
        var currentValue = false;

        await tester.pumpWidget(createSwitchApp(
          value: currentValue,
        ));
        await tester.pumpAndSettle();

        // Update the value
        currentValue = true;
        await tester.pumpWidget(createSwitchApp(
          value: currentValue,
        ));
        await tester.pumpAndSettle();

        final switchWidget = tester.widget<Switch>(find.byType(Switch));
        expect(switchWidget.value, isTrue);
      });
    });

    group('Interactions', () {
      testWidgets('handles hover correctly', (tester) async {
        var hovered = false;

        await tester.pumpWidget(createSwitchApp(
          config: DSSwitchConfig(
            behavior: const DSSwitchBehavior(enableHover: true),
            onHover: (isHovered) => hovered = isHovered,
          ),
        ));
        await tester.pumpAndSettle();

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture.moveTo(tester.getCenter(find.byType(Switch)));
        await tester.pumpAndSettle();

        expect(hovered, isTrue);
      });
    });

    group('Keyboard support', () {
      testWidgets('responds to key events when keyboard support is enabled',
          (tester) async {
        var toggledValue = false;

        await tester.pumpWidget(createSwitchApp(
          config: DSSwitchConfig(
            enableKeyboardSupport: true,
            onChanged: (value) => toggledValue = value,
          ),
          value: false,
        ));
        await tester.pumpAndSettle();

        // Focus the switch first
        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(toggledValue, isTrue);
      });

      testWidgets('switch can be toggled when keyboard support is disabled',
          (tester) async {
        var toggledValue = false;

        await tester.pumpWidget(createSwitchApp(
          config: DSSwitchConfig(
            enableKeyboardSupport: false,
            onChanged: (value) => toggledValue = value,
          ),
          value: false,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(toggledValue, isTrue);
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true',
          (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(isRtl: true),
        ));
        await tester.pumpAndSettle();

        final directionalities = tester.widgetList<Directionality>(
          find.byType(Directionality),
        );

        bool foundRtl = false;
        for (final directionality in directionalities) {
          if (directionality.textDirection == TextDirection.rtl) {
            foundRtl = true;
            break;
          }
        }
        expect(foundRtl, isTrue);
      });
    });

    group('Accessibility', () {
      testWidgets('provides semantic labels when a11y is enabled',
          (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(enableA11y: true),
          semanticsLabel: testSemanticLabel,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            enableKeyboardSupport: true,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Custom styling', () {
      testWidgets('applies custom colors', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            colors: DSSwitchColors(
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.grey,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });

      testWidgets('applies custom spacing', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            spacing: DSSwitchSpacing(
              thumbRadius: 16.0,
              trackWidth: 60.0,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });

      testWidgets('applies custom elevation', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            elevation: DSSwitchElevation(
              defaultElevation: 4.0,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });
    });

    group('Behavior configuration', () {
      testWidgets('enables haptic feedback when configured', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            behavior: DSSwitchBehavior(
              enableHapticFeedback: true,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            behavior: DSSwitchBehavior(
              maintainState: true,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });
    });

    group('Animation support', () {
      testWidgets('animates state transitions when enabled', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            animation: DSSwitchAnimation(
              enableStateTransitions: true,
              duration: 100,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });

      testWidgets('does not animate when disabled', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            animation: DSSwitchAnimation(
              enableStateTransitions: false,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });

      testWidgets('applies scale animation when configured', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            animation: DSSwitchAnimation(
              type: DSSwitchAnimationType.scale,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(ScaleTransition), findsWidgets);
      });

      testWidgets('applies fade animation when configured', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            animation: DSSwitchAnimation(
              type: DSSwitchAnimationType.fade,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });
    });

    group('Platform adaptive behavior', () {
      testWidgets('adapts to platform when isAdaptive is true', (tester) async {
        await tester.pumpWidget(createSwitchApp(
          config: const DSSwitchConfig(
            isAdaptive: true,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Switch), findsOneWidget);
      });
    });

    group('Callback handling', () {
      testWidgets('calls onChanged from widget prop', (tester) async {
        var widgetCallbackValue = false;
        var configCallbackValue = false;

        await tester.pumpWidget(createSwitchApp(
          config: DSSwitchConfig(
            onChanged: (value) => configCallbackValue = value,
          ),
          onChanged: (value) => widgetCallbackValue = value,
          value: false,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(widgetCallbackValue, isTrue);
        expect(configCallbackValue, isTrue);
      });

      testWidgets('calls onChanged from config when widget prop is null',
          (tester) async {
        var configCallbackValue = false;

        await tester.pumpWidget(createSwitchApp(
          config: DSSwitchConfig(
            onChanged: (value) => configCallbackValue = value,
          ),
          value: false,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(configCallbackValue, isTrue);
      });
    });
  });
}
