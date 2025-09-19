import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSSkeleton', () {
    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeleton(),
          ),
        ),
      );

      expect(find.byType(DSSkeleton), findsOneWidget);
    });

    testWidgets('displays correct shape based on configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              shape: DSSkeletonShape.circle,
              width: 50,
              height: 50,
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeleton), findsOneWidget);
    });

    testWidgets('responds to tap when interactive', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              interactive: true,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSSkeleton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not respond to tap when not interactive', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              interactive: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSSkeleton));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('displays loading state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              config: DSSkeletonConfig(
                state: DSSkeletonState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeleton), findsOneWidget);
    });

    testWidgets('displays skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              config: DSSkeletonConfig(
                state: DSSkeletonState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeleton), findsOneWidget);
    });

    testWidgets('handles long press for interactive skeleton', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              interactive: true,
              onLongPress: () {
                longPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(DSSkeleton));
      await tester.pump();

      expect(longPressed, isTrue);
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      DSSkeletonState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
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
      await gesture.moveTo(tester.getCenter(find.byType(DSSkeleton)));
      await tester.pump();

      expect(capturedState, equals(DSSkeletonState.hover));
    });

    testWidgets('shows different shapes correctly', (tester) async {
      for (final shape in DSSkeletonShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSSkeleton(
                shape: shape,
              ),
            ),
          ),
        );

        expect(find.byType(DSSkeleton), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('applies custom dimensions correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              width: 200,
              height: 100,
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeleton), findsOneWidget);
    });

    testWidgets('supports semantic labels correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeleton(
              config: DSSkeletonConfig(
                accessibility: DSSkeletonAccessibility(
                  enabled: true,
                  customLabel: 'Cargando contenido personalizado',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeleton), findsOneWidget);
    });

    group('DSSkeletonConfig', () {
      test('has correct default values', () {
        const config = DSSkeletonConfig();

        expect(config.variant, equals(DSSkeletonVariant.universal));
        expect(config.state, equals(DSSkeletonState.skeleton));
      });

      test('copyWith works correctly', () {
        const original = DSSkeletonConfig(
          variant: DSSkeletonVariant.universal,
          state: DSSkeletonState.skeleton,
        );

        final updated = original.copyWith(
          state: DSSkeletonState.loading,
        );

        expect(updated.state, equals(DSSkeletonState.loading));
        expect(updated.variant, equals(original.variant));
      });

      test('validation works correctly', () {
        const validConfig = DSSkeletonConfig(
          spacing: DSSkeletonSpacing(
            width: 100,
            height: 50,
            borderRadius: 8,
          ),
          animations: DSSkeletonAnimations(
            duration: Duration(milliseconds: 1000),
            shimmerSpeed: 1.5,
          ),
        );

        const invalidConfig1 = DSSkeletonConfig(
          spacing: DSSkeletonSpacing(
            width: -10, // Invalid
            height: 50,
          ),
        );

        const invalidConfig2 = DSSkeletonConfig(
          animations: DSSkeletonAnimations(
            duration: Duration(milliseconds: -100), // Invalid
          ),
        );

        expect(validConfig.isValid, isTrue);
        expect(invalidConfig1.isValid, isFalse);
        expect(invalidConfig2.isValid, isFalse);
      });
    });

    group('DSSkeletonColors', () {
      test('has correct default values', () {
        const colors = DSSkeletonColors();

        expect(colors.opacity, equals(0.8));
        expect(colors.shimmerOpacity, equals(0.3));
      });

      test('validation works correctly', () {
        const validColors = DSSkeletonColors(
          opacity: 0.5,
          shimmerOpacity: 0.4,
        );

        const invalidColors1 = DSSkeletonColors(
          opacity: 1.5, // Invalid
        );

        const invalidColors2 = DSSkeletonColors(
          shimmerOpacity: -0.1, // Invalid
        );

        expect(validColors.isValid, isTrue);
        expect(invalidColors1.isValid, isFalse);
        expect(invalidColors2.isValid, isFalse);
      });
    });

    group('DSSkeletonSpacing', () {
      test('has correct default values', () {
        const spacing = DSSkeletonSpacing();

        expect(spacing.borderRadius, equals(8.0));
        expect(spacing.padding, equals(EdgeInsets.zero));
        expect(spacing.margin, equals(EdgeInsets.zero));
        expect(spacing.elevation, equals(0.0));
      });

      test('validation works correctly', () {
        const validSpacing = DSSkeletonSpacing(
          width: 100,
          height: 50,
          borderRadius: 8,
          elevation: 2,
        );

        const invalidSpacing1 = DSSkeletonSpacing(
          borderRadius: -5, // Invalid
        );

        const invalidSpacing2 = DSSkeletonSpacing(
          elevation: -1, // Invalid
        );

        expect(validSpacing.isValid, isTrue);
        expect(invalidSpacing1.isValid, isFalse);
        expect(invalidSpacing2.isValid, isFalse);
      });
    });

    group('DSSkeletonAnimations', () {
      test('has correct default values', () {
        const animations = DSSkeletonAnimations();

        expect(animations.duration, equals(const Duration(milliseconds: 1200)));
        expect(animations.fadeInDuration, equals(const Duration(milliseconds: 300)));
        expect(animations.curve, equals(Curves.easeInOut));
        expect(animations.shimmerSpeed, equals(1.5));
        expect(animations.enabled, isTrue);
        expect(animations.shimmerEnabled, isTrue);
        expect(animations.pulseEnabled, isFalse);
      });

      test('validation works correctly', () {
        const validAnimations = DSSkeletonAnimations(
          duration: Duration(milliseconds: 1000),
          shimmerSpeed: 1.2,
        );

        const invalidAnimations1 = DSSkeletonAnimations(
          duration: Duration(milliseconds: -100), // Invalid
        );

        const invalidAnimations2 = DSSkeletonAnimations(
          shimmerSpeed: -0.5, // Invalid
        );

        expect(validAnimations.isValid, isTrue);
        expect(invalidAnimations1.isValid, isFalse);
        expect(invalidAnimations2.isValid, isFalse);
      });
    });

    group('DSSkeletonBehavior', () {
      test('has correct default values', () {
        const behavior = DSSkeletonBehavior();

        expect(behavior.animateOnLoad, isTrue);
        expect(behavior.hideOnContent, isFalse);
        expect(behavior.maintainSize, isTrue);
        expect(behavior.showBorder, isFalse);
        expect(behavior.showShadow, isFalse);
        expect(behavior.maxDuration, equals(const Duration(seconds: 10)));
      });

      test('validation works correctly', () {
        const validBehavior = DSSkeletonBehavior(
          maxDuration: Duration(seconds: 5),
        );

        const invalidBehavior = DSSkeletonBehavior(
          maxDuration: Duration(milliseconds: -100), // Invalid
        );

        expect(validBehavior.isValid, isTrue);
        expect(invalidBehavior.isValid, isFalse);
      });
    });

    group('DSSkeletonDefaults', () {
      test('provides correct shape-specific configs', () {
        final circleConfig = DSSkeletonDefaults.configForShape(DSSkeletonShape.circle);
        expect(circleConfig.spacing?.width, equals(40));
        expect(circleConfig.spacing?.height, equals(40));
        expect(circleConfig.spacing?.borderRadius, equals(20));

        final buttonConfig = DSSkeletonDefaults.configForShape(DSSkeletonShape.button);
        expect(buttonConfig.spacing?.width, equals(120));
        expect(buttonConfig.spacing?.height, equals(36));
        expect(buttonConfig.spacing?.borderRadius, equals(8));

        final textConfig = DSSkeletonDefaults.configForShape(DSSkeletonShape.text);
        expect(textConfig.spacing?.width, equals(double.infinity));
        expect(textConfig.spacing?.height, equals(16));
        expect(textConfig.spacing?.borderRadius, equals(4));
      });

      test('generates text lines correctly', () {
        final textLines = DSSkeletonDefaults.textLines(count: 3, lastLineWidthFactor: 0.7);
        expect(textLines.length, equals(3));

        final lastLine = textLines.last;
        expect(lastLine.spacing?.margin.right, greaterThan(0));
      });
    });
  });

  group('DSSkeletonGroup', () {
    testWidgets('renders children correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeletonGroup(
              children: [
                DSSkeleton(width: 50, height: 50),
                DSSkeleton(width: 100, height: 20),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeletonGroup), findsOneWidget);
      expect(find.byType(DSSkeleton), findsNWidgets(2));
    });

    testWidgets('arranges children horizontally when specified', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeletonGroup(
              direction: Axis.horizontal,
              children: [
                DSSkeleton(width: 50, height: 50),
                DSSkeleton(width: 100, height: 20),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(DSSkeleton), findsNWidgets(2));
    });
  });

  group('DSSkeletonText', () {
    testWidgets('renders multiple text lines correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeletonText(
              lines: 4,
              lastLineWidthFactor: 0.6,
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeletonText), findsOneWidget);
      expect(find.byType(DSSkeleton), findsNWidgets(4));
    });
  });

  group('DSSkeletonList', () {
    testWidgets('renders list items correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSSkeletonList(
              itemCount: 3,
              itemHeight: 60,
            ),
          ),
        ),
      );

      expect(find.byType(DSSkeletonList), findsOneWidget);
      expect(find.byType(DSSkeleton), findsNWidgets(3));
    });
  });
}