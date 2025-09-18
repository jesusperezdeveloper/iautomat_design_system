import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppSkeleton', () {
    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeleton(),
          ),
        ),
      );

      expect(find.byType(AppSkeleton), findsOneWidget);
    });

    testWidgets('displays correct shape based on configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              shape: AppSkeletonShape.circle,
              width: 50,
              height: 50,
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeleton), findsOneWidget);
    });

    testWidgets('responds to tap when interactive', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              interactive: true,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppSkeleton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not respond to tap when not interactive', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              interactive: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppSkeleton));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('displays loading state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              config: AppSkeletonConfig(
                state: AppSkeletonState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeleton), findsOneWidget);
    });

    testWidgets('displays skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              config: AppSkeletonConfig(
                state: AppSkeletonState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeleton), findsOneWidget);
    });

    testWidgets('handles long press for interactive skeleton', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              interactive: true,
              onLongPress: () {
                longPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(AppSkeleton));
      await tester.pump();

      expect(longPressed, isTrue);
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      AppSkeletonState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              interactive: true,
              onStateChanged: (state) => capturedState = state,
            ),
          ),
        ),
      );

      // Simulate hover to trigger state change
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(find.byType(AppSkeleton)));
      await tester.pump();

      expect(capturedState, equals(AppSkeletonState.hover));
    });

    testWidgets('shows different shapes correctly', (tester) async {
      for (final shape in AppSkeletonShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppSkeleton(
                shape: shape,
              ),
            ),
          ),
        );

        expect(find.byType(AppSkeleton), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('applies custom dimensions correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              width: 200,
              height: 100,
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeleton), findsOneWidget);
    });

    testWidgets('supports semantic labels correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeleton(
              config: AppSkeletonConfig(
                accessibility: AppSkeletonAccessibility(
                  enabled: true,
                  customLabel: 'Cargando contenido personalizado',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeleton), findsOneWidget);
    });

    group('AppSkeletonConfig', () {
      test('has correct default values', () {
        const config = AppSkeletonConfig();

        expect(config.variant, equals(AppSkeletonVariant.universal));
        expect(config.state, equals(AppSkeletonState.skeleton));
      });

      test('copyWith works correctly', () {
        const original = AppSkeletonConfig(
          variant: AppSkeletonVariant.universal,
          state: AppSkeletonState.skeleton,
        );

        final updated = original.copyWith(
          state: AppSkeletonState.loading,
        );

        expect(updated.state, equals(AppSkeletonState.loading));
        expect(updated.variant, equals(original.variant));
      });

      test('validation works correctly', () {
        const validConfig = AppSkeletonConfig(
          spacing: AppSkeletonSpacing(
            width: 100,
            height: 50,
            borderRadius: 8,
          ),
          animations: AppSkeletonAnimations(
            duration: Duration(milliseconds: 1000),
            shimmerSpeed: 1.5,
          ),
        );

        const invalidConfig1 = AppSkeletonConfig(
          spacing: AppSkeletonSpacing(
            width: -10, // Invalid
            height: 50,
          ),
        );

        const invalidConfig2 = AppSkeletonConfig(
          animations: AppSkeletonAnimations(
            duration: Duration(milliseconds: -100), // Invalid
          ),
        );

        expect(validConfig.isValid, isTrue);
        expect(invalidConfig1.isValid, isFalse);
        expect(invalidConfig2.isValid, isFalse);
      });
    });

    group('AppSkeletonColors', () {
      test('has correct default values', () {
        const colors = AppSkeletonColors();

        expect(colors.opacity, equals(0.8));
        expect(colors.shimmerOpacity, equals(0.3));
      });

      test('validation works correctly', () {
        const validColors = AppSkeletonColors(
          opacity: 0.5,
          shimmerOpacity: 0.4,
        );

        const invalidColors1 = AppSkeletonColors(
          opacity: 1.5, // Invalid
        );

        const invalidColors2 = AppSkeletonColors(
          shimmerOpacity: -0.1, // Invalid
        );

        expect(validColors.isValid, isTrue);
        expect(invalidColors1.isValid, isFalse);
        expect(invalidColors2.isValid, isFalse);
      });
    });

    group('AppSkeletonSpacing', () {
      test('has correct default values', () {
        const spacing = AppSkeletonSpacing();

        expect(spacing.borderRadius, equals(8.0));
        expect(spacing.padding, equals(EdgeInsets.zero));
        expect(spacing.margin, equals(EdgeInsets.zero));
        expect(spacing.elevation, equals(0.0));
      });

      test('validation works correctly', () {
        const validSpacing = AppSkeletonSpacing(
          width: 100,
          height: 50,
          borderRadius: 8,
          elevation: 2,
        );

        const invalidSpacing1 = AppSkeletonSpacing(
          borderRadius: -5, // Invalid
        );

        const invalidSpacing2 = AppSkeletonSpacing(
          elevation: -1, // Invalid
        );

        expect(validSpacing.isValid, isTrue);
        expect(invalidSpacing1.isValid, isFalse);
        expect(invalidSpacing2.isValid, isFalse);
      });
    });

    group('AppSkeletonAnimations', () {
      test('has correct default values', () {
        const animations = AppSkeletonAnimations();

        expect(animations.duration, equals(const Duration(milliseconds: 1200)));
        expect(animations.fadeInDuration, equals(const Duration(milliseconds: 300)));
        expect(animations.curve, equals(Curves.easeInOut));
        expect(animations.shimmerSpeed, equals(1.5));
        expect(animations.enabled, isTrue);
        expect(animations.shimmerEnabled, isTrue);
        expect(animations.pulseEnabled, isFalse);
      });

      test('validation works correctly', () {
        const validAnimations = AppSkeletonAnimations(
          duration: Duration(milliseconds: 1000),
          shimmerSpeed: 1.2,
        );

        const invalidAnimations1 = AppSkeletonAnimations(
          duration: Duration(milliseconds: -100), // Invalid
        );

        const invalidAnimations2 = AppSkeletonAnimations(
          shimmerSpeed: -0.5, // Invalid
        );

        expect(validAnimations.isValid, isTrue);
        expect(invalidAnimations1.isValid, isFalse);
        expect(invalidAnimations2.isValid, isFalse);
      });
    });

    group('AppSkeletonBehavior', () {
      test('has correct default values', () {
        const behavior = AppSkeletonBehavior();

        expect(behavior.animateOnLoad, isTrue);
        expect(behavior.hideOnContent, isFalse);
        expect(behavior.maintainSize, isTrue);
        expect(behavior.showBorder, isFalse);
        expect(behavior.showShadow, isFalse);
        expect(behavior.maxDuration, equals(const Duration(seconds: 10)));
      });

      test('validation works correctly', () {
        const validBehavior = AppSkeletonBehavior(
          maxDuration: Duration(seconds: 5),
        );

        const invalidBehavior = AppSkeletonBehavior(
          maxDuration: Duration(milliseconds: -100), // Invalid
        );

        expect(validBehavior.isValid, isTrue);
        expect(invalidBehavior.isValid, isFalse);
      });
    });

    group('AppSkeletonDefaults', () {
      test('provides correct shape-specific configs', () {
        final circleConfig = AppSkeletonDefaults.configForShape(AppSkeletonShape.circle);
        expect(circleConfig.spacing?.width, equals(40));
        expect(circleConfig.spacing?.height, equals(40));
        expect(circleConfig.spacing?.borderRadius, equals(20));

        final buttonConfig = AppSkeletonDefaults.configForShape(AppSkeletonShape.button);
        expect(buttonConfig.spacing?.width, equals(120));
        expect(buttonConfig.spacing?.height, equals(36));
        expect(buttonConfig.spacing?.borderRadius, equals(8));

        final textConfig = AppSkeletonDefaults.configForShape(AppSkeletonShape.text);
        expect(textConfig.spacing?.width, equals(double.infinity));
        expect(textConfig.spacing?.height, equals(16));
        expect(textConfig.spacing?.borderRadius, equals(4));
      });

      test('generates text lines correctly', () {
        final textLines = AppSkeletonDefaults.textLines(count: 3, lastLineWidthFactor: 0.7);
        expect(textLines.length, equals(3));

        final lastLine = textLines.last;
        expect(lastLine.spacing?.margin.right, greaterThan(0));
      });
    });
  });

  group('AppSkeletonGroup', () {
    testWidgets('renders children correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeletonGroup(
              children: [
                AppSkeleton(width: 50, height: 50),
                AppSkeleton(width: 100, height: 20),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeletonGroup), findsOneWidget);
      expect(find.byType(AppSkeleton), findsNWidgets(2));
    });

    testWidgets('arranges children horizontally when specified', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeletonGroup(
              direction: Axis.horizontal,
              children: [
                AppSkeleton(width: 50, height: 50),
                AppSkeleton(width: 100, height: 20),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(AppSkeleton), findsNWidgets(2));
    });
  });

  group('AppSkeletonText', () {
    testWidgets('renders multiple text lines correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeletonText(
              lines: 4,
              lastLineWidthFactor: 0.6,
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeletonText), findsOneWidget);
      expect(find.byType(AppSkeleton), findsNWidgets(4));
    });
  });

  group('AppSkeletonList', () {
    testWidgets('renders list items correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppSkeletonList(
              itemCount: 3,
              itemHeight: 60,
            ),
          ),
        ),
      );

      expect(find.byType(AppSkeletonList), findsOneWidget);
      expect(find.byType(AppSkeleton), findsNWidgets(3));
    });
  });
}