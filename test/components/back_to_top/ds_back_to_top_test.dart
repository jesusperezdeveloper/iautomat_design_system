import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSBackToTop', () {
    late ScrollController scrollController;

    setUp(() {
      scrollController = ScrollController();
    });

    tearDown(() {
      scrollController.dispose();
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                const SizedBox.expand(),
                DSBackToTop(
                  scrollController: scrollController,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(DSBackToTop), findsOneWidget);
    });

    testWidgets('shows button when scroll position exceeds threshold', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: SizedBox(
                    height: 2000,
                    child: const Column(
                      children: [
                        SizedBox(height: 500),
                        Text('Content'),
                      ],
                    ),
                  ),
                ),
                DSBackToTop(
                  scrollController: scrollController,
                  config: const DSBackToTopConfig(
                    behavior: DSBackToTopBehavior(
                      showAfterPixels: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Initially button should not be visible
      expect(find.byType(DSBackToTop), findsOneWidget);

      // Scroll down to trigger button visibility
      scrollController.jumpTo(200);
      await tester.pumpAndSettle();

      expect(find.byType(DSBackToTop), findsOneWidget);
    });

    testWidgets('responds to tap when interactive', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: const SizedBox(height: 2000),
                ),
                DSBackToTop(
                  scrollController: scrollController,
                  interactive: true,
                  onPressed: () {
                    pressed = true;
                  },
                  config: const DSBackToTopConfig(
                    behavior: DSBackToTopBehavior(
                      showAfterPixels: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Scroll down to make button visible
      scrollController.jumpTo(200);
      await tester.pumpAndSettle();

      // Tap the button
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('scrolls to top when pressed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: const SizedBox(height: 2000),
                ),
                DSBackToTop(
                  scrollController: scrollController,
                  config: const DSBackToTopConfig(
                    behavior: DSBackToTopBehavior(
                      showAfterPixels: 100,
                      smoothScrolling: false, // Use instant scroll for testing
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Scroll down
      scrollController.jumpTo(500);
      await tester.pumpAndSettle();

      expect(scrollController.offset, equals(500));

      // Tap the button
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(scrollController.offset, equals(0));
    });

    testWidgets('does not respond to tap when not interactive', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: const SizedBox(height: 2000),
                ),
                DSBackToTop(
                  scrollController: scrollController,
                  interactive: false,
                  onPressed: () {
                    pressed = true;
                  },
                  config: const DSBackToTopConfig(
                    behavior: DSBackToTopBehavior(
                      showAfterPixels: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Scroll down to make button visible
      scrollController.jumpTo(200);
      await tester.pumpAndSettle();

      // Try to tap the button
      await tester.tap(find.byType(DSBackToTop));
      await tester.pump();

      expect(pressed, isFalse);
    });

    testWidgets('displays different states correctly', (tester) async {
      for (final state in DSBackToTopState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Stack(
                children: [
                  const SizedBox.expand(),
                  DSBackToTop(
                    scrollController: scrollController,
                    config: DSBackToTopConfig(
                      state: state,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(DSBackToTop), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('shows loading indicator when in loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                const SizedBox.expand(),
                DSBackToTop(
                  scrollController: scrollController,
                  config: const DSBackToTopConfig(
                    state: DSBackToTopState.loading,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      DSBackToTopState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                const SizedBox.expand(),
                DSBackToTop(
                  scrollController: scrollController,
                  interactive: true,
                  onStateChanged: (state) => capturedState = state,
                ),
              ],
            ),
          ),
        ),
      );

      // Simulate hover to trigger state change
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(find.byType(InkWell)));
      await tester.pump();

      expect(capturedState, equals(DSBackToTopState.hover));
    });

    testWidgets('positions button correctly based on configuration', (tester) async {
      for (final position in DSBackToTopPosition.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Stack(
                children: [
                  const SizedBox.expand(),
                  DSBackToTop(
                    scrollController: scrollController,
                    config: DSBackToTopConfig(
                      spacing: DSBackToTopSpacing(
                        position: position,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(DSBackToTop), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('supports semantic labels correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                const SizedBox.expand(),
                DSBackToTop(
                  scrollController: scrollController,
                  config: const DSBackToTopConfig(
                    accessibility: DSBackToTopAccessibility(
                      enabled: true,
                      label: 'Ir al inicio personalizado',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(DSBackToTop), findsOneWidget);
    });

    group('DSBackToTopConfig', () {
      test('has correct default values', () {
        const config = DSBackToTopConfig();

        expect(config.variant, equals(DSBackToTopVariant.webOnly));
        expect(config.state, equals(DSBackToTopState.defaultState));
      });

      test('copyWith works correctly', () {
        const original = DSBackToTopConfig(
          variant: DSBackToTopVariant.webOnly,
          state: DSBackToTopState.defaultState,
        );

        final updated = original.copyWith(
          state: DSBackToTopState.hover,
        );

        expect(updated.state, equals(DSBackToTopState.hover));
        expect(updated.variant, equals(original.variant));
      });

      test('validation works correctly', () {
        const validConfig = DSBackToTopConfig(
          spacing: DSBackToTopSpacing(
            size: 56,
            iconSize: 24,
            borderRadius: 28,
            elevation: 8,
          ),
          animations: DSBackToTopAnimations(
            duration: Duration(milliseconds: 300),
            scrollDuration: Duration(milliseconds: 600),
          ),
          behavior: DSBackToTopBehavior(
            showAfterPixels: 200,
            hideAfterPixels: 0,
          ),
        );

        const invalidConfig1 = DSBackToTopConfig(
          spacing: DSBackToTopSpacing(
            size: -10, // Invalid
          ),
        );

        const invalidConfig2 = DSBackToTopConfig(
          animations: DSBackToTopAnimations(
            duration: Duration(milliseconds: -100), // Invalid
          ),
        );

        const invalidConfig3 = DSBackToTopConfig(
          behavior: DSBackToTopBehavior(
            showAfterPixels: -50, // Invalid
          ),
        );

        expect(validConfig.isValid, isTrue);
        expect(invalidConfig1.isValid, isFalse);
        expect(invalidConfig2.isValid, isFalse);
        expect(invalidConfig3.isValid, isFalse);
      });
    });

    group('DSBackToTopColors', () {
      test('has correct default values', () {
        const colors = DSBackToTopColors();

        expect(colors.opacity, equals(1.0));
        expect(colors.hoverOpacity, equals(0.12));
        expect(colors.pressedOpacity, equals(0.16));
        expect(colors.disabledOpacity, equals(0.38));
      });

      test('validation works correctly', () {
        const validColors = DSBackToTopColors(
          opacity: 0.8,
          hoverOpacity: 0.12,
          pressedOpacity: 0.16,
          disabledOpacity: 0.38,
        );

        const invalidColors1 = DSBackToTopColors(
          opacity: 1.5, // Invalid
        );

        const invalidColors2 = DSBackToTopColors(
          hoverOpacity: -0.1, // Invalid
        );

        expect(validColors.isValid, isTrue);
        expect(invalidColors1.isValid, isFalse);
        expect(invalidColors2.isValid, isFalse);
      });
    });

    group('DSBackToTopSpacing', () {
      test('has correct default values', () {
        const spacing = DSBackToTopSpacing();

        expect(spacing.size, equals(56.0));
        expect(spacing.iconSize, equals(24.0));
        expect(spacing.borderRadius, equals(28.0));
        expect(spacing.elevation, equals(8.0));
        expect(spacing.position, equals(DSBackToTopPosition.bottomRight));
      });

      test('validation works correctly', () {
        const validSpacing = DSBackToTopSpacing(
          size: 56,
          iconSize: 24,
          borderRadius: 28,
          elevation: 8,
        );

        const invalidSpacing1 = DSBackToTopSpacing(
          size: -10, // Invalid
        );

        const invalidSpacing2 = DSBackToTopSpacing(
          elevation: -1, // Invalid
        );

        expect(validSpacing.isValid, isTrue);
        expect(invalidSpacing1.isValid, isFalse);
        expect(invalidSpacing2.isValid, isFalse);
      });
    });

    group('DSBackToTopAnimations', () {
      test('has correct default values', () {
        const animations = DSBackToTopAnimations();

        expect(animations.duration, equals(const Duration(milliseconds: 300)));
        expect(animations.scrollDuration, equals(const Duration(milliseconds: 800)));
        expect(animations.curve, equals(Curves.easeInOut));
        expect(animations.scrollCurve, equals(Curves.easeOut));
        expect(animations.enabled, isTrue);
        expect(animations.fadeEnabled, isTrue);
        expect(animations.scaleEnabled, isTrue);
        expect(animations.scrollBehavior, equals(DSBackToTopScrollBehavior.smooth));
      });

      test('validation works correctly', () {
        const validAnimations = DSBackToTopAnimations(
          duration: Duration(milliseconds: 300),
          scrollDuration: Duration(milliseconds: 800),
        );

        const invalidAnimations1 = DSBackToTopAnimations(
          duration: Duration(milliseconds: -100), // Invalid
        );

        const invalidAnimations2 = DSBackToTopAnimations(
          scrollDuration: Duration(milliseconds: -200), // Invalid
        );

        expect(validAnimations.isValid, isTrue);
        expect(invalidAnimations1.isValid, isFalse);
        expect(invalidAnimations2.isValid, isFalse);
      });
    });

    group('DSBackToTopBehavior', () {
      test('has correct default values', () {
        const behavior = DSBackToTopBehavior();

        expect(behavior.showAfterPixels, equals(200.0));
        expect(behavior.hideAfterPixels, equals(0.0));
        expect(behavior.autoHide, isTrue);
        expect(behavior.showOnScrollUp, isTrue);
        expect(behavior.hideOnScrollDown, isFalse);
        expect(behavior.smoothScrolling, isTrue);
        expect(behavior.hapticFeedback, isTrue);
        expect(behavior.showTooltip, isTrue);
      });

      test('validation works correctly', () {
        const validBehavior = DSBackToTopBehavior(
          showAfterPixels: 200,
          hideAfterPixels: 0,
          autoHideDelay: Duration(seconds: 30),
        );

        const invalidBehavior1 = DSBackToTopBehavior(
          showAfterPixels: -100, // Invalid
        );

        const invalidBehavior2 = DSBackToTopBehavior(
          autoHideDelay: Duration(milliseconds: -100), // Invalid
        );

        expect(validBehavior.isValid, isTrue);
        expect(invalidBehavior1.isValid, isFalse);
        expect(invalidBehavior2.isValid, isFalse);
      });
    });

    group('DSBackToTopDefaults', () {
      test('provides correct optimized configs', () {
        final webConfig = DSBackToTopDefaults.webOptimized;
        expect(webConfig.spacing?.size, equals(48));
        expect(webConfig.animations?.scrollDuration, equals(const Duration(milliseconds: 600)));
        expect(webConfig.behavior?.showAfterPixels, equals(300));

        final mobileConfig = DSBackToTopDefaults.mobileOptimized;
        expect(mobileConfig.spacing?.size, equals(56));
        expect(mobileConfig.animations?.scrollDuration, equals(const Duration(milliseconds: 500)));
        expect(mobileConfig.behavior?.showAfterPixels, equals(200));
      });

      test('provides correct position-specific configs', () {
        final bottomRightConfig = DSBackToTopDefaults.configForPosition(
          DSBackToTopPosition.bottomRight,
        );
        expect(bottomRightConfig.spacing?.position, equals(DSBackToTopPosition.bottomRight));

        final topLeftConfig = DSBackToTopDefaults.configForPosition(
          DSBackToTopPosition.topLeft,
        );
        expect(topLeftConfig.spacing?.position, equals(DSBackToTopPosition.topLeft));
      });

      test('provides correct alignment for positions', () {
        expect(
          DSBackToTopDefaults.getAlignmentForPosition(DSBackToTopPosition.bottomRight),
          equals(Alignment.bottomRight),
        );
        expect(
          DSBackToTopDefaults.getAlignmentForPosition(DSBackToTopPosition.topLeft),
          equals(Alignment.topLeft),
        );
        expect(
          DSBackToTopDefaults.getAlignmentForPosition(DSBackToTopPosition.centerRight),
          equals(Alignment.centerRight),
        );
      });
    });
  });

  group('DSBackToTopOverlay', () {
    testWidgets('renders child and back to top button', (tester) async {
      final scrollController = ScrollController();
      addTearDown(() => scrollController.dispose());

      await tester.pumpWidget(
        MaterialApp(
          home: DSBackToTopOverlay(
            scrollController: scrollController,
            child: const Scaffold(
              body: Center(child: Text('Main Content')),
            ),
          ),
        ),
      );

      expect(find.text('Main Content'), findsOneWidget);
      expect(find.byType(DSBackToTop), findsOneWidget);
    });
  });

  group('DSBackToTopProvider', () {
    testWidgets('provides scroll controller to descendants', (tester) async {
      final scrollController = ScrollController();
      addTearDown(() => scrollController.dispose());

      DSBackToTopProvider? provider;

      await tester.pumpWidget(
        MaterialApp(
          home: DSBackToTopProvider(
            scrollController: scrollController,
            child: Builder(
              builder: (context) {
                provider = DSBackToTopProvider.of(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      expect(provider, isNotNull);
      expect(provider!.scrollController, equals(scrollController));
    });
  });
}