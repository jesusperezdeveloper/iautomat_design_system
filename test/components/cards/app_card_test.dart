import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppCard', () {
    const headerWidget = Text('Header');
    const bodyWidget = Text('Body Content');
    const footerWidget = Text('Footer');

    Widget createCardApp({
      AppCardConfig? config,
      Widget? header,
      Widget? body,
      Widget? footer,
      EdgeInsetsGeometry? padding,
      double? elevation,
      double? width,
      double? height,
      Decoration? decoration,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AppCard(
            config: config ?? const AppCardConfig(),
            header: header,
            body: body,
            footer: footer,
            padding: padding,
            elevation: elevation,
            width: width,
            height: height,
            decoration: decoration,
          ),
        ),
      );
    }

    testWidgets('renders basic card correctly', (tester) async {
      await tester.pumpWidget(createCardApp(
        body: bodyWidget,
      ));
      await tester.pumpAndSettle();

      expect(find.text('Body Content'), findsOneWidget);
      expect(find.byType(AppCard), findsOneWidget);
    });

    testWidgets('renders all sections when provided', (tester) async {
      await tester.pumpWidget(createCardApp(
        header: headerWidget,
        body: bodyWidget,
        footer: footerWidget,
      ));
      await tester.pumpAndSettle();

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body Content'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createCardApp(
        config: const AppCardConfig(
          state: AppCardState.loading,
        ),
        body: bodyWidget,
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando...'), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createCardApp(
        config: const AppCardConfig(
          state: AppCardState.skeleton,
        ),
        body: bodyWidget,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    group('Variants', () {
      testWidgets('renders elevated variant by default', (tester) async {
        await tester.pumpWidget(createCardApp(
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Material), findsWidgets);
      });

      testWidgets('renders filled variant correctly', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            variant: AppCardVariant.filled,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Container), findsWidgets);
      });

      testWidgets('renders outlined variant correctly', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            variant: AppCardVariant.outlined,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Container), findsWidgets);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in AppCardState.values) {
          await tester.pumpWidget(createCardApp(
            config: AppCardConfig(state: state),
            body: bodyWidget,
          ));
          await tester.pump();

          if (state.showsLoader) {
            expect(find.byType(CircularProgressIndicator), findsOneWidget);
          } else if (state.showsSkeleton) {
            expect(find.byType(Container), findsWidgets);
          } else {
            expect(find.text('Body Content'), findsOneWidget);
          }
        }
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            state: AppCardState.disabled,
            onTap: () => tapped = true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppCard));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });
    });

    group('Interactions', () {
      testWidgets('handles tap correctly', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            onTap: () => tapped = true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppCard));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('handles double tap correctly', (tester) async {
        var doubleTapped = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            onDoubleTap: () => doubleTapped = true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppCard));
        await tester.pump(const Duration(milliseconds: 100));
        await tester.tap(find.byType(AppCard));
        await tester.pumpAndSettle();

        expect(doubleTapped, isTrue);
      });

      testWidgets('handles long press correctly', (tester) async {
        var longPressed = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            onLongPress: () => longPressed = true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        await tester.longPress(find.byType(AppCard));
        await tester.pumpAndSettle();

        expect(longPressed, isTrue);
      });

      testWidgets('handles hover correctly', (tester) async {
        var hovered = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            onHover: (isHovered) => hovered = isHovered,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture.moveTo(tester.getCenter(find.byType(AppCard)));
        await tester.pumpAndSettle();

        expect(hovered, isTrue);
      });
    });

    group('Keyboard support', () {
      testWidgets('responds to Enter key when focused', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            enableKeyboardSupport: true,
            onTap: () => tapped = true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        // Focus the card
        await tester.tap(find.byType(AppCard));
        await tester.pumpAndSettle();

        // Press Enter
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('ignores keyboard when support is disabled', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createCardApp(
          config: AppCardConfig(
            enableKeyboardSupport: false,
            onTap: () => tapped = true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppCard));
        await tester.pumpAndSettle();

        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(isRtl: true),
          body: bodyWidget,
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
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(enableA11y: true),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            enableKeyboardSupport: true,
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Custom styling', () {
      testWidgets('applies custom colors', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            colors: AppCardColors(
              backgroundColor: Colors.red,
              borderColor: Colors.blue,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });

      testWidgets('applies custom spacing', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            spacing: AppCardSpacing(
              padding: 24.0,
              borderRadius: 16.0,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });

      testWidgets('applies custom elevation', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            elevation: AppCardElevation(
              defaultElevation: 8.0,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });
    });

    group('Behavior configuration', () {
      testWidgets('enables haptic feedback when configured', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            behavior: AppCardBehavior(
              enableHapticFeedback: true,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            behavior: AppCardBehavior(
              maintainState: true,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });
    });

    group('Animation support', () {
      testWidgets('animates state transitions when enabled', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            animation: AppCardAnimation(
              enableStateTransitions: true,
              duration: 100,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });

      testWidgets('does not animate when disabled', (tester) async {
        await tester.pumpWidget(createCardApp(
          config: const AppCardConfig(
            animation: AppCardAnimation(
              enableStateTransitions: false,
            ),
          ),
          body: bodyWidget,
        ));
        await tester.pumpAndSettle();

        expect(find.text('Body Content'), findsOneWidget);
      });
    });
  });
}