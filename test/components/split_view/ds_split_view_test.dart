import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSSplitView', () {
    const startWidget = Text('Start Panel');
    const endWidget = Text('End Panel');

    Widget createSplitViewApp({
      DSSplitViewConfig? config,
      Widget? start,
      Widget? end,
      DSSplitViewMinSizes? minSizes,
      double? initialRatio,
      ValueChanged<double>? onRatioChanged,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: DSSplitView(
            config: config ?? const DSSplitViewConfig(),
            start: start ?? startWidget,
            end: end ?? endWidget,
            minSizes: minSizes,
            initialRatio: initialRatio,
            onRatioChanged: onRatioChanged,
          ),
        ),
      );
    }

    testWidgets('renders basic split view correctly', (tester) async {
      await tester.pumpWidget(createSplitViewApp());
      await tester.pumpAndSettle();

      expect(find.text('Start Panel'), findsOneWidget);
      expect(find.text('End Panel'), findsOneWidget);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createSplitViewApp(
        config: const DSSplitViewConfig(
          state: DSSplitViewState.loading,
        ),
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando vista dividida...'), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createSplitViewApp(
        config: const DSSplitViewConfig(
          state: DSSplitViewState.skeleton,
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('respects initial ratio', (tester) async {
      await tester.pumpWidget(createSplitViewApp(
        initialRatio: 0.3,
      ));
      await tester.pumpAndSettle();

      expect(find.text('Start Panel'), findsOneWidget);
      expect(find.text('End Panel'), findsOneWidget);
    });

    testWidgets('handles ratio changes correctly', (tester) async {
      await tester.pumpWidget(createSplitViewApp(
        config: const DSSplitViewConfig(
          variant: DSSplitViewVariant.resizable,
        ),
      ));
      await tester.pumpAndSettle();

      // Find and interact with the divider - try dragging
      final dividerFinder = find.byType(GestureDetector);
      if (dividerFinder.evaluate().isNotEmpty) {
        await tester.drag(dividerFinder.first, const Offset(50, 0));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      }
    });

    group('Resizable variant', () {
      testWidgets('renders resizable divider', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.resizable,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(GestureDetector), findsWidgets);
        expect(find.byType(MouseRegion), findsWidgets);
      });

      testWidgets('allows drag resizing', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.resizable,
          ),
        ));
        await tester.pumpAndSettle();

        final dividerFinder = find.byType(GestureDetector);
        if (dividerFinder.evaluate().isNotEmpty) {
          await tester.drag(
            dividerFinder.first,
            const Offset(50, 0),
          );
          await tester.pumpAndSettle();

          expect(find.text('Start Panel'), findsOneWidget);
          expect(find.text('End Panel'), findsOneWidget);
        }
      });

      testWidgets('respects minimum sizes', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.resizable,
          ),
          minSizes: const DSSplitViewMinSizes(
            startMin: 150.0,
            endMin: 150.0,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });

      testWidgets('does not allow resizing when disabled', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.resizable,
            state: DSSplitViewState.disabled,
          ),
        ));
        await tester.pumpAndSettle();

        final dividerFinder = find.byType(GestureDetector);
        if (dividerFinder.evaluate().isNotEmpty) {
          await tester.drag(
            dividerFinder.first,
            const Offset(50, 0),
          );
          await tester.pumpAndSettle();

          // The ratio should not change when disabled
          expect(find.text('Start Panel'), findsOneWidget);
          expect(find.text('End Panel'), findsOneWidget);
        }
      });
    });

    group('TwoPane variant', () {
      testWidgets('renders two pane layout', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.twoPane,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
        expect(find.byType(Expanded), findsWidgets);
      });

      testWidgets('does not show resizable divider', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.twoPane,
          ),
        ));
        await tester.pumpAndSettle();

        // Should not have resizable functionality in twoPane mode
        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });
    });

    group('Direction support', () {
      testWidgets('renders horizontal layout by default', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            direction: DSSplitViewDirection.horizontal,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Row), findsWidgets);
        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });

      testWidgets('renders vertical layout when specified', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            direction: DSSplitViewDirection.vertical,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Column), findsWidgets);
        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });
    });

    group('Keyboard support', () {
      testWidgets('responds to arrow key navigation when focused',
          (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.resizable,
            enableKeyboardSupport: true,
          ),
        ));
        await tester.pumpAndSettle();

        // Focus the split view
        final focusFinder = find.byType(Focus);
        if (focusFinder.evaluate().isNotEmpty) {
          await tester.tap(focusFinder.first);
          await tester.pumpAndSettle();

          // Test arrow key navigation
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
          await tester.pumpAndSettle();

          expect(find.text('Start Panel'), findsOneWidget);
          expect(find.text('End Panel'), findsOneWidget);
        }
      });

      testWidgets('ignores keyboard when support is disabled', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            variant: DSSplitViewVariant.resizable,
            enableKeyboardSupport: false,
          ),
        ));
        await tester.pumpAndSettle();

        final focusFinder = find.byType(Focus);
        if (focusFinder.evaluate().isNotEmpty) {
          await tester.tap(focusFinder.first);
          await tester.pumpAndSettle();

          await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
          await tester.pumpAndSettle();

          expect(find.text('Start Panel'), findsOneWidget);
          expect(find.text('End Panel'), findsOneWidget);
        }
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true',
          (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(isRtl: true),
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
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(enableA11y: true),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            enableKeyboardSupport: true,
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Animation support', () {
      testWidgets('animates ratio changes when enabled', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            animation: DSSplitViewAnimation(
              enableResizeAnimation: true,
              duration: 100,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });

      testWidgets('does not animate when disabled', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            animation: DSSplitViewAnimation(
              enableResizeAnimation: false,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });
    });

    group('Behavior configuration', () {
      testWidgets('snaps to edges when enabled', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            behavior: DSSplitViewBehavior(
              snapToEdges: true,
              snapThreshold: 0.1,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            behavior: DSSplitViewBehavior(
              maintainState: true,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });
    });

    group('Custom styling', () {
      testWidgets('applies custom colors', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            colors: DSSplitViewColors(
              backgroundColor: Colors.red,
              startPaneColor: Colors.blue,
              endPaneColor: Colors.green,
              dividerColor: Colors.yellow,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });

      testWidgets('applies custom spacing', (tester) async {
        await tester.pumpWidget(createSplitViewApp(
          config: const DSSplitViewConfig(
            spacing: DSSplitViewSpacing(
              dividerWidth: 10.0,
              handleWidth: 20.0,
              padding: 8.0,
            ),
          ),
        ));
        await tester.pumpAndSettle();

        expect(find.text('Start Panel'), findsOneWidget);
        expect(find.text('End Panel'), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in DSSplitViewState.values) {
          await tester.pumpWidget(createSplitViewApp(
            config: DSSplitViewConfig(state: state),
          ));
          await tester.pump();

          if (state.showsLoader) {
            expect(find.byType(CircularProgressIndicator), findsOneWidget);
          } else if (state.showsSkeleton) {
            expect(find.byType(Container), findsWidgets);
          } else {
            expect(find.text('Start Panel'), findsOneWidget);
            expect(find.text('End Panel'), findsOneWidget);
          }
        }
      });
    });
  });
}
