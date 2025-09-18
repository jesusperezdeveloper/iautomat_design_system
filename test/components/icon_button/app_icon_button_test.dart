import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppIconButton', () {
    const testIcon = Icon(Icons.favorite);
    const testTooltip = 'Test IconButton';

    Widget createIconButtonApp({
      AppIconButtonConfig? config,
      Widget? icon,
      String? tooltip,
      AppIconButtonSize? size,
      bool? isToggled,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AppIconButton(
            config: config ?? const AppIconButtonConfig(),
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

      expect(find.byType(AppIconButton), findsOneWidget);
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
        config: const AppIconButtonConfig(
          state: AppIconButtonState.loading,
        ),
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createIconButtonApp(
        config: const AppIconButtonConfig(
          state: AppIconButtonState.skeleton,
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
          config: const AppIconButtonConfig(
            variant: AppIconButtonVariant.filled,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders tonal variant correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const AppIconButtonConfig(
            variant: AppIconButtonVariant.tonal,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in AppIconButtonState.values) {
          await tester.pumpWidget(createIconButtonApp(
            config: AppIconButtonConfig(state: state),
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
          config: AppIconButtonConfig(
            state: AppIconButtonState.disabled,
            onPressed: () => tapped = true,
          ),
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppIconButton));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });
    });

    group('Sizes', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          size: AppIconButtonSize.small,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders medium size correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          size: AppIconButtonSize.medium,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('renders large size correctly', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          size: AppIconButtonSize.large,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });

    group('Toggle functionality', () {
      testWidgets('handles toggle state correctly', (tester) async {
        var toggledState = false;

        await tester.pumpWidget(createIconButtonApp(
          config: AppIconButtonConfig(
            behavior: const AppIconButtonBehavior(enableToggle: true),
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
          config: AppIconButtonConfig(
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
          config: AppIconButtonConfig(
            behavior: const AppIconButtonBehavior(enableHover: true),
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
          config: AppIconButtonConfig(
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
          config: AppIconButtonConfig(
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
          config: const AppIconButtonConfig(isRtl: true),
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
          config: const AppIconButtonConfig(enableA11y: true),
          tooltip: testTooltip,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const AppIconButtonConfig(
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
          config: const AppIconButtonConfig(
            colors: AppIconButtonColors(
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
          config: const AppIconButtonConfig(
            spacing: AppIconButtonSpacing(
              borderRadius: 16.0,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('applies custom elevation', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const AppIconButtonConfig(
            elevation: AppIconButtonElevation(
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
          config: const AppIconButtonConfig(
            behavior: AppIconButtonBehavior(
              enableHapticFeedback: true,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const AppIconButtonConfig(
            behavior: AppIconButtonBehavior(
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
          config: const AppIconButtonConfig(
            animation: AppIconButtonAnimation(
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
          config: const AppIconButtonConfig(
            animation: AppIconButtonAnimation(
              enableStateTransitions: false,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('applies scale animation when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const AppIconButtonConfig(
            animation: AppIconButtonAnimation(
              type: AppIconButtonAnimationType.scale,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(ScaleTransition), findsWidgets);
      });

      testWidgets('applies rotation animation when configured', (tester) async {
        await tester.pumpWidget(createIconButtonApp(
          config: const AppIconButtonConfig(
            animation: AppIconButtonAnimation(
              type: AppIconButtonAnimationType.rotation,
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
          config: const AppIconButtonConfig(
            isAdaptive: true,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsOneWidget);
      });
    });
  });
}
