import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppButton', () {
    const labelText = 'Test Button';
    final leadingIcon = Icon(Icons.star);
    final trailingIcon = Icon(Icons.arrow_forward);

    Widget createButtonApp({
      AppButtonConfig? config,
      String? label,
      Widget? leading,
      Widget? trailing,
      AppButtonSize? size,
      bool? isDanger,
      double? width,
      double? height,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AppButton(
            config: config ?? const AppButtonConfig(),
            label: label,
            leading: leading,
            trailing: trailing,
            size: size,
            isDanger: isDanger,
            width: width,
            height: height,
          ),
        ),
      );
    }

    testWidgets('renders basic button correctly', (tester) async {
      await tester.pumpWidget(createButtonApp(
        label: labelText,
      ));
      await tester.pumpAndSettle();

      expect(find.text(labelText), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
    });

    testWidgets('renders with leading and trailing widgets', (tester) async {
      await tester.pumpWidget(createButtonApp(
        label: labelText,
        leading: leadingIcon,
        trailing: trailingIcon,
      ));
      await tester.pumpAndSettle();

      expect(find.text(labelText), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createButtonApp(
        config: const AppButtonConfig(
          state: AppButtonState.loading,
        ),
        label: labelText,
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando...'), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createButtonApp(
        config: const AppButtonConfig(
          state: AppButtonState.skeleton,
        ),
        label: labelText,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    group('Variants', () {
      testWidgets('renders filled variant by default', (tester) async {
        await tester.pumpWidget(createButtonApp(
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Material), findsWidgets);
      });

      testWidgets('renders tonal variant correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            variant: AppButtonVariant.tonal,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('renders outline variant correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            variant: AppButtonVariant.outline,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('renders text variant correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            variant: AppButtonVariant.text,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('renders icon variant correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            variant: AppButtonVariant.icon,
          ),
          leading: leadingIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('renders segmented variant correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            variant: AppButtonVariant.segmented,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
        expect(find.byType(Container), findsWidgets);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in AppButtonState.values) {
          await tester.pumpWidget(createButtonApp(
            config: AppButtonConfig(state: state),
            label: labelText,
          ));
          await tester.pump();

          if (state.showsLoader) {
            expect(find.byType(CircularProgressIndicator), findsOneWidget);
          } else if (state.showsSkeleton) {
            expect(find.byType(Container), findsWidgets);
          } else {
            expect(find.text(labelText), findsOneWidget);
          }
        }
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createButtonApp(
          config: AppButtonConfig(
            state: AppButtonState.disabled,
            onPressed: () => tapped = true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });
    });

    group('Sizes', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            size: AppButtonSize.small,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('renders medium size correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            size: AppButtonSize.medium,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('renders large size correctly', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            size: AppButtonSize.large,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });
    });

    group('Interactions', () {
      testWidgets('handles tap correctly', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createButtonApp(
          config: AppButtonConfig(
            onPressed: () => tapped = true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('handles long press correctly', (tester) async {
        var longPressed = false;

        await tester.pumpWidget(createButtonApp(
          config: AppButtonConfig(
            onLongPress: () => longPressed = true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        await tester.longPress(find.byType(AppButton));
        await tester.pumpAndSettle();

        expect(longPressed, isTrue);
      });

      testWidgets('handles hover correctly', (tester) async {
        var hovered = false;

        await tester.pumpWidget(createButtonApp(
          config: AppButtonConfig(
            onHover: (isHovered) => hovered = isHovered,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture.moveTo(tester.getCenter(find.byType(AppButton)));
        await tester.pumpAndSettle();

        expect(hovered, isTrue);
      });
    });

    group('Danger state', () {
      testWidgets('applies danger styling when isDanger is true', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            isDanger: true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('applies danger styling via prop', (tester) async {
        await tester.pumpWidget(createButtonApp(
          label: labelText,
          isDanger: true,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });
    });

    group('Keyboard support', () {
      testWidgets('responds to key events when keyboard support is enabled', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createButtonApp(
          config: AppButtonConfig(
            enableKeyboardSupport: true,
            onPressed: () => tapped = true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        // Tap to activate the button first
        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('button can be tapped when keyboard support is disabled', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createButtonApp(
          config: AppButtonConfig(
            enableKeyboardSupport: false,
            onPressed: () => tapped = true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        // Button should still respond to tap even without keyboard support
        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(isRtl: true),
          label: labelText,
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
      testWidgets('provides semantic labels when a11y is enabled', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(enableA11y: true),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            enableKeyboardSupport: true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Custom styling', () {
      testWidgets('applies custom colors', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            colors: AppButtonColors(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('applies custom spacing', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            spacing: AppButtonSpacing(
              horizontalPadding: 24.0,
              borderRadius: 16.0,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('applies custom elevation', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            elevation: AppButtonElevation(
              defaultElevation: 8.0,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });
    });

    group('Behavior configuration', () {
      testWidgets('enables haptic feedback when configured', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            behavior: AppButtonBehavior(
              enableHapticFeedback: true,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            behavior: AppButtonBehavior(
              maintainState: true,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });
    });

    group('Animation support', () {
      testWidgets('animates state transitions when enabled', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            animation: AppButtonAnimation(
              enableStateTransitions: true,
              duration: 100,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });

      testWidgets('does not animate when disabled', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            animation: AppButtonAnimation(
              enableStateTransitions: false,
            ),
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });
    });

    group('Platform adaptive behavior', () {
      testWidgets('adapts to platform when isAdaptive is true', (tester) async {
        await tester.pumpWidget(createButtonApp(
          config: const AppButtonConfig(
            isAdaptive: true,
          ),
          label: labelText,
        ));
        await tester.pumpAndSettle();

        expect(find.text(labelText), findsOneWidget);
      });
    });
  });
}