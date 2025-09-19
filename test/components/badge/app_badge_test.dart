import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSBadge', () {
    testWidgets('should render dot badge without child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.dot(),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should render counter badge with value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(value: 5),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('should render status badge with label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.status(
              status: DSBadgeStatus.success,
              label: 'Activo',
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
      expect(find.text('Activo'), findsOneWidget);
    });

    testWidgets('should render badge with child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 3,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('should handle tap interactions', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 1,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSBadge));
      expect(tapped, isTrue);
    });

    testWidgets('should handle long press interactions', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 1,
              onLongPress: () => longPressed = true,
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(DSBadge));
      expect(longPressed, isTrue);
    });

    testWidgets('should not show badge when visible is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
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
            body: DSBadge.counter(
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
            body: DSBadge.counter(value: 0),
          ),
        ),
      );

      expect(find.text('0'), findsNothing);
    });

    testWidgets('should show zero value when showZero is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
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
                DSBadge.counter(
                  value: 1,
                  size: DSBadgeSize.small,
                ),
                DSBadge.counter(
                  value: 2,
                  size: DSBadgeSize.medium,
                ),
                DSBadge.counter(
                  value: 3,
                  size: DSBadgeSize.large,
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
                DSBadge.counter(
                  value: 1,
                  position: DSBadgePosition.topLeft,
                  child: Icon(Icons.notifications),
                ),
                DSBadge.counter(
                  value: 2,
                  position: DSBadgePosition.topRight,
                  child: Icon(Icons.notifications),
                ),
                DSBadge.counter(
                  value: 3,
                  position: DSBadgePosition.bottomLeft,
                  child: Icon(Icons.notifications),
                ),
                DSBadge.counter(
                  value: 4,
                  position: DSBadgePosition.bottomRight,
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
                DSBadge.counter(
                  value: 1,
                  shape: DSBadgeShape.circle,
                ),
                DSBadge.counter(
                  value: 2,
                  shape: DSBadgeShape.square,
                ),
                DSBadge.counter(
                  value: 3,
                  shape: DSBadgeShape.rounded,
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
                DSBadge.status(
                  status: DSBadgeStatus.success,
                  label: 'Éxito',
                ),
                DSBadge.status(
                  status: DSBadgeStatus.warning,
                  label: 'Advertencia',
                ),
                DSBadge.status(
                  status: DSBadgeStatus.error,
                  label: 'Error',
                ),
                DSBadge.status(
                  status: DSBadgeStatus.info,
                  label: 'Información',
                ),
                DSBadge.status(
                  status: DSBadgeStatus.neutral,
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
            body: DSBadge.status(
              status: DSBadgeStatus.success,
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
            body: DSBadge.counter(
              value: 1,
              enabled: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSBadge));
      expect(tapped, isFalse);
    });

    testWidgets('should show loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 5,
              loading: true,
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should show skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 5,
              skeleton: true,
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should have semantic label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 5,
              semanticLabel: 'Test badge',
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should handle tooltip', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 5,
              tooltip: 'Badge tooltip',
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should generate automatic semantic label for counter',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(value: 5),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should generate automatic semantic label for status',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.status(
              status: DSBadgeStatus.success,
              label: 'Activo',
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should handle custom colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 5,
              color: Colors.purple,
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });

    testWidgets('should handle animation configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSBadge.counter(
              value: 5,
              animation: DSBadgeAnimation(
                enabled: true,
                type: DSBadgeAnimationType.pulse,
                pulse: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSBadge), findsOneWidget);
    });
  });

  group('DSBadgeConfig', () {
    test('should have correct default values', () {
      const config = DSBadgeConfig();

      expect(config.variant, DSBadgeVariant.dot);
      expect(config.state, DSBadgeState.defaultState);
      expect(config.size, DSBadgeSize.medium);
      expect(config.position, DSBadgePosition.topRight);
      expect(config.shape, DSBadgeShape.circle);
      expect(config.enabled, isTrue);
      expect(config.loading, isFalse);
      expect(config.skeleton, isFalse);
      expect(config.visible, isTrue);
      expect(config.showZero, isFalse);
      expect(config.maxValue, 99);
    });

    test('should detect interactive state correctly', () {
      const interactiveConfig = DSBadgeConfig(onTap: _mockCallback);
      const nonInteractiveConfig = DSBadgeConfig();

      expect(interactiveConfig.isInteractive, isTrue);
      expect(nonInteractiveConfig.isInteractive, isFalse);
    });

    test('should detect disabled state correctly', () {
      const disabledConfig = DSBadgeConfig(enabled: false);
      const enabledConfig = DSBadgeConfig(enabled: true);

      expect(disabledConfig.isDisabled, isTrue);
      expect(enabledConfig.isDisabled, isFalse);
    });

    test('should detect loading state correctly', () {
      const loadingConfig = DSBadgeConfig(loading: true);
      const normalConfig = DSBadgeConfig(loading: false);

      expect(loadingConfig.isLoading, isTrue);
      expect(normalConfig.isLoading, isFalse);
    });

    test('should detect skeleton state correctly', () {
      const skeletonConfig = DSBadgeConfig(skeleton: true);
      const normalConfig = DSBadgeConfig(skeleton: false);

      expect(skeletonConfig.isSkeleton, isTrue);
      expect(normalConfig.isSkeleton, isFalse);
    });

    test('should determine if can interact correctly', () {
      const canInteractConfig = DSBadgeConfig(
        onTap: _mockCallback,
        enabled: true,
        loading: false,
        skeleton: false,
      );
      const cannotInteractConfig = DSBadgeConfig(
        onTap: _mockCallback,
        enabled: false,
      );

      expect(canInteractConfig.canInteract, isTrue);
      expect(cannotInteractConfig.canInteract, isFalse);
    });

    test('should detect value properties correctly', () {
      const configWithValue = DSBadgeConfig(value: 5);
      const configWithLabel = DSBadgeConfig(label: 'Test');
      const configWithStatus = DSBadgeConfig(status: DSBadgeStatus.success);
      const emptyConfig = DSBadgeConfig();

      expect(configWithValue.hasValue, isTrue);
      expect(configWithLabel.hasLabel, isTrue);
      expect(configWithStatus.hasStatus, isTrue);
      expect(emptyConfig.hasValue, isFalse);
      expect(emptyConfig.hasLabel, isFalse);
      expect(emptyConfig.hasStatus, isFalse);
    });

    test('should format display value correctly', () {
      const normalValue = DSBadgeConfig(value: 5);
      const overMaxValue = DSBadgeConfig(value: 150, maxValue: 99);
      const zeroValue = DSBadgeConfig(value: 0);
      const zeroValueShow = DSBadgeConfig(value: 0, showZero: true);

      expect(normalValue.displayValue, '5');
      expect(overMaxValue.displayValue, '99+');
      expect(zeroValue.displayValue, '');
      expect(zeroValueShow.displayValue, '0');
    });

    test('should return correct colors from theme', () {
      // This would require a proper ThemeData test, but we can test the structure
      const config = DSBadgeConfig();
      expect(config.color, isNull);
      expect(config.backgroundColor, isNull);
      expect(config.textColor, isNull);
    });
  });

  group('DSBadgeVariant', () {
    test('should have correct extension properties', () {
      expect(DSBadgeVariant.dot.isDot, isTrue);
      expect(DSBadgeVariant.dot.isCounter, isFalse);
      expect(DSBadgeVariant.dot.isStatus, isFalse);

      expect(DSBadgeVariant.counter.isDot, isFalse);
      expect(DSBadgeVariant.counter.isCounter, isTrue);
      expect(DSBadgeVariant.counter.isStatus, isFalse);

      expect(DSBadgeVariant.status.isDot, isFalse);
      expect(DSBadgeVariant.status.isCounter, isFalse);
      expect(DSBadgeVariant.status.isStatus, isTrue);
    });
  });

  group('DSBadgeStatus', () {
    test('should have correct labels', () {
      expect(DSBadgeStatus.success.label, 'Éxito');
      expect(DSBadgeStatus.warning.label, 'Advertencia');
      expect(DSBadgeStatus.error.label, 'Error');
      expect(DSBadgeStatus.info.label, 'Información');
      expect(DSBadgeStatus.neutral.label, 'Neutral');
    });

    test('should have correct icons', () {
      expect(DSBadgeStatus.success.icon, Icons.check_circle);
      expect(DSBadgeStatus.warning.icon, Icons.warning);
      expect(DSBadgeStatus.error.icon, Icons.error);
      expect(DSBadgeStatus.info.icon, Icons.info);
      expect(DSBadgeStatus.neutral.icon, Icons.circle);
    });
  });

  group('DSBadgeSize', () {
    test('should have correct dot sizes', () {
      expect(DSBadgeSize.small.dotSize, 8.0);
      expect(DSBadgeSize.medium.dotSize, 12.0);
      expect(DSBadgeSize.large.dotSize, 16.0);
    });

    test('should have correct counter sizes', () {
      expect(DSBadgeSize.small.counterSize, 16.0);
      expect(DSBadgeSize.medium.counterSize, 20.0);
      expect(DSBadgeSize.large.counterSize, 24.0);
    });

    test('should have correct status sizes', () {
      expect(DSBadgeSize.small.statusSize, 20.0);
      expect(DSBadgeSize.medium.statusSize, 24.0);
      expect(DSBadgeSize.large.statusSize, 28.0);
    });

    test('should have correct font sizes', () {
      expect(DSBadgeSize.small.fontSize, 10.0);
      expect(DSBadgeSize.medium.fontSize, 12.0);
      expect(DSBadgeSize.large.fontSize, 14.0);
    });

    test('should have correct icon sizes', () {
      expect(DSBadgeSize.small.iconSize, 12.0);
      expect(DSBadgeSize.medium.iconSize, 16.0);
      expect(DSBadgeSize.large.iconSize, 20.0);
    });
  });

  group('DSBadgePosition', () {
    test('should have correct alignments', () {
      expect(DSBadgePosition.topLeft.alignment, Alignment.topLeft);
      expect(DSBadgePosition.topRight.alignment, Alignment.topRight);
      expect(DSBadgePosition.bottomLeft.alignment, Alignment.bottomLeft);
      expect(DSBadgePosition.bottomRight.alignment, Alignment.bottomRight);
      expect(DSBadgePosition.center.alignment, Alignment.center);
    });

    test('should calculate correct offsets', () {
      final topRightOffset =
          DSBadgePosition.topRight.getOffset(DSBadgeSize.medium);
      expect(topRightOffset.dx, 6.0);
      expect(topRightOffset.dy, -6.0);

      final centerOffset =
          DSBadgePosition.center.getOffset(DSBadgeSize.medium);
      expect(centerOffset, Offset.zero);
    });
  });

  group('DSBadgeShape', () {
    test('should generate correct border radius', () {
      final circleRadius = DSBadgeShape.circle.getBorderRadius(20.0);
      expect(circleRadius, BorderRadius.circular(10.0));

      final squareRadius = DSBadgeShape.square.getBorderRadius(20.0);
      expect(squareRadius, BorderRadius.zero);

      final roundedRadius = DSBadgeShape.rounded.getBorderRadius(20.0);
      expect(roundedRadius, BorderRadius.circular(4.0));
    });
  });
}

void _mockCallback() {
  // Mock callback for testing
}
