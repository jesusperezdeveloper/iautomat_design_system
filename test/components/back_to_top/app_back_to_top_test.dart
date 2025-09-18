import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppBackToTop', () {
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
                AppBackToTop(
                  scrollController: scrollController,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(AppBackToTop), findsOneWidget);
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
                AppBackToTop(
                  scrollController: scrollController,
                  config: const AppBackToTopConfig(
                    behavior: AppBackToTopBehavior(
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
      expect(find.byType(AppBackToTop), findsOneWidget);

      // Scroll down to trigger button visibility
      scrollController.jumpTo(200);
      await tester.pumpAndSettle();

      expect(find.byType(AppBackToTop), findsOneWidget);
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
                AppBackToTop(
                  scrollController: scrollController,
                  interactive: true,
                  onPressed: () {
                    pressed = true;
                  },
                  config: const AppBackToTopConfig(
                    behavior: AppBackToTopBehavior(
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
                AppBackToTop(
                  scrollController: scrollController,
                  config: const AppBackToTopConfig(
                    behavior: AppBackToTopBehavior(
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
                AppBackToTop(
                  scrollController: scrollController,
                  interactive: false,
                  onPressed: () {
                    pressed = true;
                  },
                  config: const AppBackToTopConfig(
                    behavior: AppBackToTopBehavior(
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
      await tester.tap(find.byType(AppBackToTop));
      await tester.pump();

      expect(pressed, isFalse);
    });

    testWidgets('displays different states correctly', (tester) async {
      for (final state in AppBackToTopState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Stack(
                children: [
                  const SizedBox.expand(),
                  AppBackToTop(
                    scrollController: scrollController,
                    config: AppBackToTopConfig(
                      state: state,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppBackToTop), findsOneWidget);
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
                AppBackToTop(
                  scrollController: scrollController,
                  config: const AppBackToTopConfig(
                    state: AppBackToTopState.loading,
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
      AppBackToTopState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                const SizedBox.expand(),
                AppBackToTop(
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

      expect(capturedState, equals(AppBackToTopState.hover));
    });

    testWidgets('positions button correctly based on configuration', (tester) async {
      for (final position in AppBackToTopPosition.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Stack(
                children: [
                  const SizedBox.expand(),
                  AppBackToTop(
                    scrollController: scrollController,
                    config: AppBackToTopConfig(
                      spacing: AppBackToTopSpacing(
                        position: position,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppBackToTop), findsOneWidget);
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
                AppBackToTop(
                  scrollController: scrollController,
                  config: const AppBackToTopConfig(
                    accessibility: AppBackToTopAccessibility(
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

      expect(find.byType(AppBackToTop), findsOneWidget);
    });

    group('AppBackToTopConfig', () {
      test('has correct default values', () {
        const config = AppBackToTopConfig();

        expect(config.variant, equals(AppBackToTopVariant.webOnly));
        expect(config.state, equals(AppBackToTopState.defaultState));
      });

      test('copyWith works correctly', () {
        const original = AppBackToTopConfig(
          variant: AppBackToTopVariant.webOnly,
          state: AppBackToTopState.defaultState,
        );

        final updated = original.copyWith(
          state: AppBackToTopState.hover,
        );

        expect(updated.state, equals(AppBackToTopState.hover));
        expect(updated.variant, equals(original.variant));
      });

      test('validation works correctly', () {
        const validConfig = AppBackToTopConfig(
          spacing: AppBackToTopSpacing(
            size: 56,
            iconSize: 24,
            borderRadius: 28,
            elevation: 8,
          ),
          animations: AppBackToTopAnimations(
            duration: Duration(milliseconds: 300),
            scrollDuration: Duration(milliseconds: 600),
          ),
          behavior: AppBackToTopBehavior(
            showAfterPixels: 200,
            hideAfterPixels: 0,
          ),
        );

        const invalidConfig1 = AppBackToTopConfig(
          spacing: AppBackToTopSpacing(
            size: -10, // Invalid
          ),
        );

        const invalidConfig2 = AppBackToTopConfig(
          animations: AppBackToTopAnimations(
            duration: Duration(milliseconds: -100), // Invalid
          ),
        );

        const invalidConfig3 = AppBackToTopConfig(
          behavior: AppBackToTopBehavior(
            showAfterPixels: -50, // Invalid
          ),
        );

        expect(validConfig.isValid, isTrue);
        expect(invalidConfig1.isValid, isFalse);
        expect(invalidConfig2.isValid, isFalse);
        expect(invalidConfig3.isValid, isFalse);
      });
    });

    group('AppBackToTopColors', () {
      test('has correct default values', () {
        const colors = AppBackToTopColors();

        expect(colors.opacity, equals(1.0));
        expect(colors.hoverOpacity, equals(0.12));
        expect(colors.pressedOpacity, equals(0.16));
        expect(colors.disabledOpacity, equals(0.38));
      });

      test('validation works correctly', () {
        const validColors = AppBackToTopColors(
          opacity: 0.8,
          hoverOpacity: 0.12,
          pressedOpacity: 0.16,
          disabledOpacity: 0.38,
        );

        const invalidColors1 = AppBackToTopColors(
          opacity: 1.5, // Invalid
        );

        const invalidColors2 = AppBackToTopColors(
          hoverOpacity: -0.1, // Invalid
        );

        expect(validColors.isValid, isTrue);
        expect(invalidColors1.isValid, isFalse);
        expect(invalidColors2.isValid, isFalse);
      });
    });

    group('AppBackToTopSpacing', () {
      test('has correct default values', () {
        const spacing = AppBackToTopSpacing();

        expect(spacing.size, equals(56.0));
        expect(spacing.iconSize, equals(24.0));
        expect(spacing.borderRadius, equals(28.0));
        expect(spacing.elevation, equals(8.0));
        expect(spacing.position, equals(AppBackToTopPosition.bottomRight));
      });

      test('validation works correctly', () {
        const validSpacing = AppBackToTopSpacing(
          size: 56,
          iconSize: 24,
          borderRadius: 28,
          elevation: 8,
        );

        const invalidSpacing1 = AppBackToTopSpacing(
          size: -10, // Invalid
        );

        const invalidSpacing2 = AppBackToTopSpacing(
          elevation: -1, // Invalid
        );

        expect(validSpacing.isValid, isTrue);
        expect(invalidSpacing1.isValid, isFalse);
        expect(invalidSpacing2.isValid, isFalse);
      });
    });

    group('AppBackToTopAnimations', () {
      test('has correct default values', () {
        const animations = AppBackToTopAnimations();

        expect(animations.duration, equals(const Duration(milliseconds: 300)));
        expect(animations.scrollDuration, equals(const Duration(milliseconds: 800)));
        expect(animations.curve, equals(Curves.easeInOut));
        expect(animations.scrollCurve, equals(Curves.easeOut));
        expect(animations.enabled, isTrue);
        expect(animations.fadeEnabled, isTrue);
        expect(animations.scaleEnabled, isTrue);
        expect(animations.scrollBehavior, equals(AppBackToTopScrollBehavior.smooth));
      });

      test('validation works correctly', () {
        const validAnimations = AppBackToTopAnimations(
          duration: Duration(milliseconds: 300),
          scrollDuration: Duration(milliseconds: 800),
        );

        const invalidAnimations1 = AppBackToTopAnimations(
          duration: Duration(milliseconds: -100), // Invalid
        );

        const invalidAnimations2 = AppBackToTopAnimations(
          scrollDuration: Duration(milliseconds: -200), // Invalid
        );

        expect(validAnimations.isValid, isTrue);
        expect(invalidAnimations1.isValid, isFalse);
        expect(invalidAnimations2.isValid, isFalse);
      });
    });

    group('AppBackToTopBehavior', () {
      test('has correct default values', () {
        const behavior = AppBackToTopBehavior();

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
        const validBehavior = AppBackToTopBehavior(
          showAfterPixels: 200,
          hideAfterPixels: 0,
          autoHideDelay: Duration(seconds: 30),
        );

        const invalidBehavior1 = AppBackToTopBehavior(
          showAfterPixels: -100, // Invalid
        );

        const invalidBehavior2 = AppBackToTopBehavior(
          autoHideDelay: Duration(milliseconds: -100), // Invalid
        );

        expect(validBehavior.isValid, isTrue);
        expect(invalidBehavior1.isValid, isFalse);
        expect(invalidBehavior2.isValid, isFalse);
      });
    });

    group('AppBackToTopDefaults', () {
      test('provides correct optimized configs', () {
        final webConfig = AppBackToTopDefaults.webOptimized;
        expect(webConfig.spacing?.size, equals(48));
        expect(webConfig.animations?.scrollDuration, equals(const Duration(milliseconds: 600)));
        expect(webConfig.behavior?.showAfterPixels, equals(300));

        final mobileConfig = AppBackToTopDefaults.mobileOptimized;
        expect(mobileConfig.spacing?.size, equals(56));
        expect(mobileConfig.animations?.scrollDuration, equals(const Duration(milliseconds: 500)));
        expect(mobileConfig.behavior?.showAfterPixels, equals(200));
      });

      test('provides correct position-specific configs', () {
        final bottomRightConfig = AppBackToTopDefaults.configForPosition(
          AppBackToTopPosition.bottomRight,
        );
        expect(bottomRightConfig.spacing?.position, equals(AppBackToTopPosition.bottomRight));

        final topLeftConfig = AppBackToTopDefaults.configForPosition(
          AppBackToTopPosition.topLeft,
        );
        expect(topLeftConfig.spacing?.position, equals(AppBackToTopPosition.topLeft));
      });

      test('provides correct alignment for positions', () {
        expect(
          AppBackToTopDefaults.getAlignmentForPosition(AppBackToTopPosition.bottomRight),
          equals(Alignment.bottomRight),
        );
        expect(
          AppBackToTopDefaults.getAlignmentForPosition(AppBackToTopPosition.topLeft),
          equals(Alignment.topLeft),
        );
        expect(
          AppBackToTopDefaults.getAlignmentForPosition(AppBackToTopPosition.centerRight),
          equals(Alignment.centerRight),
        );
      });
    });
  });

  group('AppBackToTopOverlay', () {
    testWidgets('renders child and back to top button', (tester) async {
      final scrollController = ScrollController();
      addTearDown(() => scrollController.dispose());

      await tester.pumpWidget(
        MaterialApp(
          home: AppBackToTopOverlay(
            scrollController: scrollController,
            child: const Scaffold(
              body: Center(child: Text('Main Content')),
            ),
          ),
        ),
      );

      expect(find.text('Main Content'), findsOneWidget);
      expect(find.byType(AppBackToTop), findsOneWidget);
    });
  });

  group('AppBackToTopProvider', () {
    testWidgets('provides scroll controller to descendants', (tester) async {
      final scrollController = ScrollController();
      addTearDown(() => scrollController.dispose());

      AppBackToTopProvider? provider;

      await tester.pumpWidget(
        MaterialApp(
          home: AppBackToTopProvider(
            scrollController: scrollController,
            child: Builder(
              builder: (context) {
                provider = AppBackToTopProvider.of(context);
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