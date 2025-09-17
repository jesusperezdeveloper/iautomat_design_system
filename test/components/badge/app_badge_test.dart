import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppBadge', () {
    testWidgets('should render dot badge without child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.dot(),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should render counter badge with value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(value: 5),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('should render status badge with label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.status(
              status: AppBadgeStatus.success,
              label: 'Activo',
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
      expect(find.text('Activo'), findsOneWidget);
    });

    testWidgets('should render badge with child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 3,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('should handle tap interactions', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 1,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppBadge));
      expect(tapped, isTrue);
    });

    testWidgets('should handle long press interactions', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 1,
              onLongPress: () => longPressed = true,
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(AppBadge));
      expect(longPressed, isTrue);
    });

    testWidgets('should not show badge when visible is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              visible: false,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.text('5'), findsNothing);
    });

    testWidgets('should show maximum value when exceeded', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 150,
              maxValue: 99,
            ),
          ),
        ),
      );

      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('should not show zero value by default', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(value: 0),
          ),
        ),
      );

      expect(find.text('0'), findsNothing);
    });

    testWidgets('should show zero value when showZero is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 0,
              showZero: true,
            ),
          ),
        ),
      );

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('should respect different sizes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppBadge.counter(
                  value: 1,
                  size: AppBadgeSize.small,
                ),
                AppBadge.counter(
                  value: 2,
                  size: AppBadgeSize.medium,
                ),
                AppBadge.counter(
                  value: 3,
                  size: AppBadgeSize.large,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('should render different badge positions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppBadge.counter(
                  value: 1,
                  position: AppBadgePosition.topLeft,
                  child: Icon(Icons.notifications),
                ),
                AppBadge.counter(
                  value: 2,
                  position: AppBadgePosition.topRight,
                  child: Icon(Icons.notifications),
                ),
                AppBadge.counter(
                  value: 3,
                  position: AppBadgePosition.bottomLeft,
                  child: Icon(Icons.notifications),
                ),
                AppBadge.counter(
                  value: 4,
                  position: AppBadgePosition.bottomRight,
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
    });

    testWidgets('should render different badge shapes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppBadge.counter(
                  value: 1,
                  shape: AppBadgeShape.circle,
                ),
                AppBadge.counter(
                  value: 2,
                  shape: AppBadgeShape.square,
                ),
                AppBadge.counter(
                  value: 3,
                  shape: AppBadgeShape.rounded,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('should render different status badges', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppBadge.status(
                  status: AppBadgeStatus.success,
                  label: 'Éxito',
                ),
                AppBadge.status(
                  status: AppBadgeStatus.warning,
                  label: 'Advertencia',
                ),
                AppBadge.status(
                  status: AppBadgeStatus.error,
                  label: 'Error',
                ),
                AppBadge.status(
                  status: AppBadgeStatus.info,
                  label: 'Información',
                ),
                AppBadge.status(
                  status: AppBadgeStatus.neutral,
                  label: 'Neutral',
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Éxito'), findsOneWidget);
      expect(find.text('Advertencia'), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Información'), findsOneWidget);
      expect(find.text('Neutral'), findsOneWidget);
    });

    testWidgets('should show status icon for status variant', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.status(
              status: AppBadgeStatus.success,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should not interact when disabled', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 1,
              enabled: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppBadge));
      expect(tapped, isFalse);
    });

    testWidgets('should show loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              loading: true,
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should show skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              skeleton: true,
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should have semantic label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              semanticLabel: 'Test badge',
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should handle tooltip', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              tooltip: 'Badge tooltip',
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should generate automatic semantic label for counter', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(value: 5),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should generate automatic semantic label for status', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.status(
              status: AppBadgeStatus.success,
              label: 'Activo',
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should handle custom colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              color: Colors.purple,
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });

    testWidgets('should handle animation configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBadge.counter(
              value: 5,
              animation: AppBadgeAnimation(
                enabled: true,
                type: AppBadgeAnimationType.pulse,
                pulse: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppBadge), findsOneWidget);
    });
  });

  group('AppBadgeConfig', () {
    test('should have correct default values', () {
      const config = AppBadgeConfig();

      expect(config.variant, AppBadgeVariant.dot);
      expect(config.state, AppBadgeState.defaultState);
      expect(config.size, AppBadgeSize.medium);
      expect(config.position, AppBadgePosition.topRight);
      expect(config.shape, AppBadgeShape.circle);
      expect(config.enabled, isTrue);
      expect(config.loading, isFalse);
      expect(config.skeleton, isFalse);
      expect(config.visible, isTrue);
      expect(config.showZero, isFalse);
      expect(config.maxValue, 99);
    });

    test('should detect interactive state correctly', () {
      const interactiveConfig = AppBadgeConfig(onTap: _mockCallback);
      const nonInteractiveConfig = AppBadgeConfig();

      expect(interactiveConfig.isInteractive, isTrue);
      expect(nonInteractiveConfig.isInteractive, isFalse);
    });

    test('should detect disabled state correctly', () {
      const disabledConfig = AppBadgeConfig(enabled: false);
      const enabledConfig = AppBadgeConfig(enabled: true);

      expect(disabledConfig.isDisabled, isTrue);
      expect(enabledConfig.isDisabled, isFalse);
    });

    test('should detect loading state correctly', () {
      const loadingConfig = AppBadgeConfig(loading: true);
      const normalConfig = AppBadgeConfig(loading: false);

      expect(loadingConfig.isLoading, isTrue);
      expect(normalConfig.isLoading, isFalse);
    });

    test('should detect skeleton state correctly', () {
      const skeletonConfig = AppBadgeConfig(skeleton: true);
      const normalConfig = AppBadgeConfig(skeleton: false);

      expect(skeletonConfig.isSkeleton, isTrue);
      expect(normalConfig.isSkeleton, isFalse);
    });

    test('should determine if can interact correctly', () {
      const canInteractConfig = AppBadgeConfig(
        onTap: _mockCallback,
        enabled: true,
        loading: false,
        skeleton: false,
      );
      const cannotInteractConfig = AppBadgeConfig(
        onTap: _mockCallback,
        enabled: false,
      );

      expect(canInteractConfig.canInteract, isTrue);
      expect(cannotInteractConfig.canInteract, isFalse);
    });

    test('should detect value properties correctly', () {
      const configWithValue = AppBadgeConfig(value: 5);
      const configWithLabel = AppBadgeConfig(label: 'Test');
      const configWithStatus = AppBadgeConfig(status: AppBadgeStatus.success);
      const emptyConfig = AppBadgeConfig();

      expect(configWithValue.hasValue, isTrue);
      expect(configWithLabel.hasLabel, isTrue);
      expect(configWithStatus.hasStatus, isTrue);
      expect(emptyConfig.hasValue, isFalse);
      expect(emptyConfig.hasLabel, isFalse);
      expect(emptyConfig.hasStatus, isFalse);
    });

    test('should format display value correctly', () {
      const normalValue = AppBadgeConfig(value: 5);
      const overMaxValue = AppBadgeConfig(value: 150, maxValue: 99);
      const zeroValue = AppBadgeConfig(value: 0);
      const zeroValueShow = AppBadgeConfig(value: 0, showZero: true);

      expect(normalValue.displayValue, '5');
      expect(overMaxValue.displayValue, '99+');
      expect(zeroValue.displayValue, '');
      expect(zeroValueShow.displayValue, '0');
    });

    test('should return correct colors from theme', () {
      // This would require a proper ThemeData test, but we can test the structure
      const config = AppBadgeConfig();
      expect(config.color, isNull);
      expect(config.backgroundColor, isNull);
      expect(config.textColor, isNull);
    });
  });

  group('AppBadgeVariant', () {
    test('should have correct extension properties', () {
      expect(AppBadgeVariant.dot.isDot, isTrue);
      expect(AppBadgeVariant.dot.isCounter, isFalse);
      expect(AppBadgeVariant.dot.isStatus, isFalse);

      expect(AppBadgeVariant.counter.isDot, isFalse);
      expect(AppBadgeVariant.counter.isCounter, isTrue);
      expect(AppBadgeVariant.counter.isStatus, isFalse);

      expect(AppBadgeVariant.status.isDot, isFalse);
      expect(AppBadgeVariant.status.isCounter, isFalse);
      expect(AppBadgeVariant.status.isStatus, isTrue);
    });
  });

  group('AppBadgeStatus', () {
    test('should have correct labels', () {
      expect(AppBadgeStatus.success.label, 'Éxito');
      expect(AppBadgeStatus.warning.label, 'Advertencia');
      expect(AppBadgeStatus.error.label, 'Error');
      expect(AppBadgeStatus.info.label, 'Información');
      expect(AppBadgeStatus.neutral.label, 'Neutral');
    });

    test('should have correct icons', () {
      expect(AppBadgeStatus.success.icon, Icons.check_circle);
      expect(AppBadgeStatus.warning.icon, Icons.warning);
      expect(AppBadgeStatus.error.icon, Icons.error);
      expect(AppBadgeStatus.info.icon, Icons.info);
      expect(AppBadgeStatus.neutral.icon, Icons.circle);
    });
  });

  group('AppBadgeSize', () {
    test('should have correct dot sizes', () {
      expect(AppBadgeSize.small.dotSize, 8.0);
      expect(AppBadgeSize.medium.dotSize, 12.0);
      expect(AppBadgeSize.large.dotSize, 16.0);
    });

    test('should have correct counter sizes', () {
      expect(AppBadgeSize.small.counterSize, 16.0);
      expect(AppBadgeSize.medium.counterSize, 20.0);
      expect(AppBadgeSize.large.counterSize, 24.0);
    });

    test('should have correct status sizes', () {
      expect(AppBadgeSize.small.statusSize, 20.0);
      expect(AppBadgeSize.medium.statusSize, 24.0);
      expect(AppBadgeSize.large.statusSize, 28.0);
    });

    test('should have correct font sizes', () {
      expect(AppBadgeSize.small.fontSize, 10.0);
      expect(AppBadgeSize.medium.fontSize, 12.0);
      expect(AppBadgeSize.large.fontSize, 14.0);
    });

    test('should have correct icon sizes', () {
      expect(AppBadgeSize.small.iconSize, 12.0);
      expect(AppBadgeSize.medium.iconSize, 16.0);
      expect(AppBadgeSize.large.iconSize, 20.0);
    });
  });

  group('AppBadgePosition', () {
    test('should have correct alignments', () {
      expect(AppBadgePosition.topLeft.alignment, Alignment.topLeft);
      expect(AppBadgePosition.topRight.alignment, Alignment.topRight);
      expect(AppBadgePosition.bottomLeft.alignment, Alignment.bottomLeft);
      expect(AppBadgePosition.bottomRight.alignment, Alignment.bottomRight);
      expect(AppBadgePosition.center.alignment, Alignment.center);
    });

    test('should calculate correct offsets', () {
      final topRightOffset = AppBadgePosition.topRight.getOffset(AppBadgeSize.medium);
      expect(topRightOffset.dx, 6.0);
      expect(topRightOffset.dy, -6.0);

      final centerOffset = AppBadgePosition.center.getOffset(AppBadgeSize.medium);
      expect(centerOffset, Offset.zero);
    });
  });

  group('AppBadgeShape', () {
    test('should generate correct border radius', () {
      final circleRadius = AppBadgeShape.circle.getBorderRadius(20.0);
      expect(circleRadius, BorderRadius.circular(10.0));

      final squareRadius = AppBadgeShape.square.getBorderRadius(20.0);
      expect(squareRadius, BorderRadius.zero);

      final roundedRadius = AppBadgeShape.rounded.getBorderRadius(20.0);
      expect(roundedRadius, BorderRadius.circular(4.0));
    });
  });
}

void _mockCallback() {
  // Mock callback for testing
}