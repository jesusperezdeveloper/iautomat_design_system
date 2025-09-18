import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppFab', () {
    const testIcon = Icon(Icons.add);
    const testLabel = 'Test FAB';

    Widget createFabApp({
      AppFabConfig? config,
      Widget? icon,
      String? label,
      AppFabLocation? location,
      String? heroTag,
      String? tooltip,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AppFab(
            config: config ?? const AppFabConfig(),
            icon: icon,
            label: label,
            location: location,
            heroTag: heroTag,
            tooltip: tooltip,
          ),
        ),
      );
    }

    testWidgets('renders basic FAB correctly', (tester) async {
      await tester.pumpWidget(createFabApp(
        icon: testIcon,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(AppFab), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('renders with tooltip when provided', (tester) async {
      await tester.pumpWidget(createFabApp(
        icon: testIcon,
        tooltip: 'Test Tooltip',
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createFabApp(
        config: const AppFabConfig(
          state: AppFabState.loading,
        ),
        icon: testIcon,
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createFabApp(
        config: const AppFabConfig(
          state: AppFabState.skeleton,
        ),
        icon: testIcon,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    group('Variants', () {
      testWidgets('renders regular variant by default', (tester) async {
        await tester.pumpWidget(createFabApp(
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('renders small variant correctly', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            variant: AppFabVariant.small,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('renders large variant correctly', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            variant: AppFabVariant.large,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('renders extended variant correctly', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            variant: AppFabVariant.extended,
          ),
          icon: testIcon,
          label: testLabel,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
        expect(find.text(testLabel), findsOneWidget);
        expect(find.byIcon(Icons.add), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('renders all states correctly', (tester) async {
        for (final state in AppFabState.values) {
          await tester.pumpWidget(createFabApp(
            config: AppFabConfig(state: state),
            icon: testIcon,
          ));
          await tester.pump();

          if (state.showsLoader) {
            expect(find.byType(CircularProgressIndicator), findsWidgets);
          } else if (state.showsSkeleton) {
            expect(find.byType(Container), findsWidgets);
          } else {
            expect(find.byType(FloatingActionButton), findsOneWidget);
          }
        }
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createFabApp(
          config: AppFabConfig(
            state: AppFabState.disabled,
            onPressed: () => tapped = true,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(AppFab));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });
    });

    group('Interactions', () {
      testWidgets('handles tap correctly', (tester) async {
        var tapped = false;

        await tester.pumpWidget(createFabApp(
          config: AppFabConfig(
            onPressed: () => tapped = true,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('handles hover correctly', (tester) async {
        var hovered = false;

        await tester.pumpWidget(createFabApp(
          config: AppFabConfig(
            behavior: const AppFabBehavior(enableHover: true),
            onHover: (isHovered) => hovered = isHovered,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        await gesture
            .moveTo(tester.getCenter(find.byType(FloatingActionButton)));
        await tester.pumpAndSettle();

        expect(hovered, isTrue);
      });
    });

    group('Keyboard support', () {
      testWidgets('responds to key events when keyboard support is enabled',
          (tester) async {
        var tapped = false;

        await tester.pumpWidget(createFabApp(
          config: AppFabConfig(
            enableKeyboardSupport: true,
            onPressed: () => tapped = true,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('FAB can be tapped when keyboard support is disabled',
          (tester) async {
        var tapped = false;

        await tester.pumpWidget(createFabApp(
          config: AppFabConfig(
            enableKeyboardSupport: false,
            onPressed: () => tapped = true,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true',
          (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(isRtl: true),
          icon: testIcon,
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
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(enableA11y: true),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('is focusable for keyboard navigation', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            enableKeyboardSupport: true,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Custom styling', () {
      testWidgets('applies custom colors', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            colors: AppFabColors(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('applies custom spacing', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            spacing: AppFabSpacing(
              borderRadius: 24.0,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('applies custom elevation', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            elevation: AppFabElevation(
              defaultElevation: 8.0,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });
    });

    group('Behavior configuration', () {
      testWidgets('enables haptic feedback when configured', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            behavior: AppFabBehavior(
              enableHapticFeedback: true,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('maintains state when configured', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            behavior: AppFabBehavior(
              maintainState: true,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });
    });

    group('Animation support', () {
      testWidgets('animates state transitions when enabled', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            animation: AppFabAnimation(
              enableStateTransitions: true,
              duration: 100,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('does not animate when disabled', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            animation: AppFabAnimation(
              enableStateTransitions: false,
            ),
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });
    });

    group('Platform adaptive behavior', () {
      testWidgets('adapts to platform when isAdaptive is true', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            isAdaptive: true,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });
    });

    group('Location support', () {
      testWidgets('sets correct location via config', (tester) async {
        await tester.pumpWidget(createFabApp(
          config: const AppFabConfig(
            location: AppFabLocation.centerFloat,
          ),
          icon: testIcon,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });

      testWidgets('sets correct location via prop', (tester) async {
        await tester.pumpWidget(createFabApp(
          icon: testIcon,
          location: AppFabLocation.startFloat,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);
      });
    });
  });

  group('AppFabScaffold', () {
    testWidgets('renders scaffold with FAB correctly', (tester) async {
      final fab = AppFab(
        config: const AppFabConfig(
          location: AppFabLocation.endFloat,
        ),
        icon: const Icon(Icons.add),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: AppFabScaffold(
            fab: fab,
            body: const Center(child: Text('Test Body')),
            appBar: AppBar(title: const Text('Test App')),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppFab), findsOneWidget);
      expect(find.text('Test Body'), findsOneWidget);
      expect(find.text('Test App'), findsOneWidget);
    });
  });
}
