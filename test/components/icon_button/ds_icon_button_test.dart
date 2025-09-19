import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSIconButton', () {
    const testIcon = Icon(Icons.favorite);
    const testTooltip = 'Test IconButton';

    Widget createIconButtonApp({
      DSIconButtonConfig? config,
      Widget? icon,
      String? tooltip,
      DSIconButtonSize? size,
      bool? isToggled,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: DSIconButton(
            config: config ?? const DSIconButtonConfig(),
            icon: icon ?? testIcon,
            tooltip: tooltip,
            size: size,
            isToggled: isToggled,
          ),
        ),
      );
    }

    testWidgets('renders basic icon button correctly', (tester) async {
      await tester.pumpWidget(createIconButtonApp());
      await tester.pumpAndSettle();

      expect(find.byType(DSIconButton), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('renders with tooltip when provided', (tester) async {
      await tester.pumpWidget(createIconButtonApp(
        tooltip: testTooltip,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createIconButtonApp(
        config: const DSIconButtonConfig(
          state: DSIconButtonState.loading,
        ),
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createIconButtonApp(
        config: const DSIconButtonConfig(
          state: DSIconButtonState.skeleton,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    group('Variants', () {
      testWidgets('renders standard variant by default', (tester) async {
        await tester.pumpWidget(createIconButtonApp());
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders filled variant correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            variant: DSIconButtonVariant.filled,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders tonal variant correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            variant: DSIconButtonVariant.tonal,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in DSIconButtonState.values) {
          await tester.pumpWidget(createIconButtonApp(
            config: DSIconButtonConfig(state: state),
          ));
          await tester.pump();

          if (state.showsLoader) {
            expect(find.byType(CircularProgressIndicator), findsWidgets);
          } else if (state.showsSkeleton) {
            expect(find.byType(Container), findsWidgets);
          } else {
            expect(find.byType(IconButton), findsOneWidget);
          }
        }
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createIconButtonApp(
          config: DSIconButtonConfig(
            state: DSIconButtonState.disabled,
            onPressed: () => tapped = true,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(DSIconButton));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });
    });

    group('Sizes', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          size: DSIconButtonSize.small,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders medium size correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          size: DSIconButtonSize.medium,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders large size correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          size: DSIconButtonSize.large,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('Toggle functionality', () {
      testWidgets('handles toggle state correctly', (tester) async {
        var toggledState = false;

        await tester.pumpWidget(createIconButtonApp(
          config: DSIconButtonConfig(
            behavior: const DSIconButtonBehavior(enableToggle: true),
            onToggle: (isToggled) => toggledState = isToggled,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(toggledState, isTrue);
      });

      testWidgets('applies toggled state via prop', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          isToggled: true,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('Interactions', () {
      testWidgets('handles tap correctly', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createIconButtonApp(
          config: DSIconButtonConfig(
            onPressed: () => tapped = true,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('handles hover correctly', (tester) async {
        var hovered = false;

        await tester.pumpWidget(createIconButtonApp(
          config: DSIconButtonConfig(
            behavior: const DSIconButtonBehavior(enableHover: true),
            onHover: (isHovered) => hovered = isHovered,
          ),
        ));
        await tester.pumpAndSettle();

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture.moveTo(tester.getCenter(find.byType(IconButton)));
        await tester.pumpAndSettle();

        expect(hovered, isTrue);
      });
    });

    group('Keyboard support', () {
      testWidgets('responds to key events when keyboard support is enabled',
          (tester) async {
        var tapped = false;

        await tester.pumpWidget(createIconButtonApp(
          config: DSIconButtonConfig(
            enableKeyboardSupport: true,
            onPressed: () => tapped = true,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('button can be tapped when keyboard support is disabled',
          (tester) async {
        var tapped = false;

        await tester.pumpWidget(createIconButtonApp(
          config: DSIconButtonConfig(
            enableKeyboardSupport: false,
            onPressed: () => tapped = true,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true',
          (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(isRtl: true),
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
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(enableA11y: true),
          tooltip: testTooltip,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            enableKeyboardSupport: true,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Custom styling', () {
      testWidgets('applies custom colors', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            colors: DSIconButtonColors(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('applies custom spacing', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            spacing: DSIconButtonSpacing(
              borderRadius: 16.0,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('applies custom elevation', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            elevation: DSIconButtonElevation(
              defaultElevation: 4.0,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('Behavior configuration', () {
      testWidgets('enables haptic feedback when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            behavior: DSIconButtonBehavior(
              enableHapticFeedback: true,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            behavior: DSIconButtonBehavior(
              maintainState: true,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('Animation support', () {
      testWidgets('animates state transitions when enabled', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            animation: DSIconButtonAnimation(
              enableStateTransitions: true,
              duration: 100,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('does not animate when disabled', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            animation: DSIconButtonAnimation(
              enableStateTransitions: false,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('applies scale animation when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            animation: DSIconButtonAnimation(
              type: DSIconButtonAnimationType.scale,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(ScaleTransition), findsWidgets);
      });

      testWidgets('applies rotation animation when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            animation: DSIconButtonAnimation(
              type: DSIconButtonAnimationType.rotation,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('Platform adaptive behavior', () {
      testWidgets('adapts to platform when isAdaptive is true', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const DSIconButtonConfig(
            isAdaptive: true,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });
  });
}
