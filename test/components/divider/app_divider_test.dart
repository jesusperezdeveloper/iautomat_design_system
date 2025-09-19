import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSDivider', () {
    testWidgets('renders with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(),
          ),
        ),
      );

      expect(find.byType(DSDivider), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('renders horizontal divider by default', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(VerticalDivider), findsNothing);
    });

    testWidgets('renders vertical divider when configured', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              config: DSDividerConfig(
                orientation: DSDividerOrientation.vertical,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(VerticalDivider), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('respects thickness configuration', (tester) async {
      const thickness = 3.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              config: DSDividerConfig(
                thickness: thickness,
              ),
            ),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, equals(thickness));
    });

    testWidgets('respects color configuration', (tester) async {
      const color = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              config: DSDividerConfig(
                color: color,
              ),
            ),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, equals(color));
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              config: DSDividerConfig(
                state: DSDividerState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              config: DSDividerConfig(
                state: DSDividerState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSDivider), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('handles disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              enabled: false,
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('handles interactive divider tap', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDivider(
              interactive: true,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSDivider));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      DSDividerState? changedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDivider(
              onStateChanged: (state) {
                changedState = state;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(changedState, isNotNull);
      expect(changedState, equals(DSDividerState.defaultState));
    });

    testWidgets('supports inset variant with indents', (tester) async {
      const indent = 16.0;
      const endIndent = 24.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              config: DSDividerConfig(
                variant: DSDividerVariant.inset,
                indent: indent,
                endIndent: endIndent,
              ),
            ),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.indent, equals(indent));
      expect(divider.endIndent, equals(endIndent));
    });

    testWidgets('renders with custom semantics', (tester) async {
      const semanticLabel = 'Custom divider';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsOneWidget);
    });

    testWidgets('excludes semantics when configured', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDivider(
              excludeSemantics: true,
            ),
          ),
        ),
      );

      // Verifica que el widget se renderiza sin errores
      expect(find.byType(DSDivider), findsOneWidget);
    });

    testWidgets('renders with different configurations', (tester) async {
      final configs = [
        const DSDividerConfig(),
        const DSDividerConfig(variant: DSDividerVariant.inset),
        const DSDividerConfig(orientation: DSDividerOrientation.vertical),
        const DSDividerConfig(state: DSDividerState.loading),
        const DSDividerConfig(state: DSDividerState.skeleton),
        const DSDividerConfig(thickness: 2.0),
        const DSDividerConfig(color: Colors.blue),
      ];

      for (final config in configs) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDivider(config: config),
            ),
          ),
        );

        expect(find.byType(DSDivider), findsOneWidget);

        // Limpia el widget tree entre pruebas
        await tester.pumpWidget(Container());
      }
    });
  });

  group('DSDividerConfig', () {
    test('creates with default values', () {
      const config = DSDividerConfig();

      expect(config.variant, equals(DSDividerVariant.full));
      expect(config.state, equals(DSDividerState.defaultState));
      expect(config.orientation, equals(DSDividerOrientation.horizontal));
      expect(config.interactive, isFalse);
      expect(config.thickness, isNull);
      expect(config.color, isNull);
    });

    test('creates with custom values', () {
      const config = DSDividerConfig(
        variant: DSDividerVariant.inset,
        state: DSDividerState.loading,
        orientation: DSDividerOrientation.vertical,
        interactive: true,
        thickness: 2.0,
        color: Colors.red,
      );

      expect(config.variant, equals(DSDividerVariant.inset));
      expect(config.state, equals(DSDividerState.loading));
      expect(config.orientation, equals(DSDividerOrientation.vertical));
      expect(config.interactive, isTrue);
      expect(config.thickness, equals(2.0));
      expect(config.color, equals(Colors.red));
    });

    test('supports copyWith', () {
      const originalConfig = DSDividerConfig();
      final newConfig = originalConfig.copyWith(
        variant: DSDividerVariant.inset,
        thickness: 3.0,
      );

      expect(newConfig.variant, equals(DSDividerVariant.inset));
      expect(newConfig.thickness, equals(3.0));
      expect(newConfig.state, equals(originalConfig.state));
      expect(newConfig.orientation, equals(originalConfig.orientation));
    });
  });

  group('DSDividerValidators', () {
    test('validates thickness correctly', () {
      expect(DSDividerValidators.isValidThickness(null), isTrue);
      expect(DSDividerValidators.isValidThickness(1.0), isTrue);
      expect(DSDividerValidators.isValidThickness(5.0), isTrue);
      expect(DSDividerValidators.isValidThickness(0.0), isTrue);
      expect(DSDividerValidators.isValidThickness(-1.0), isFalse);
      expect(DSDividerValidators.isValidThickness(11.0), isFalse);
    });

    test('validates indent correctly', () {
      expect(DSDividerValidators.isValidIndent(null), isTrue);
      expect(DSDividerValidators.isValidIndent(0.0), isTrue);
      expect(DSDividerValidators.isValidIndent(16.0), isTrue);
      expect(DSDividerValidators.isValidIndent(-1.0), isFalse);
    });

    test('validates dimensions correctly', () {
      expect(DSDividerValidators.isValidDimensions(), isTrue);
      expect(
        DSDividerValidators.isValidDimensions(
          height: 1.0,
          orientation: DSDividerOrientation.horizontal,
        ),
        isTrue,
      );
      expect(
        DSDividerValidators.isValidDimensions(
          width: 1.0,
          orientation: DSDividerOrientation.vertical,
        ),
        isTrue,
      );
      expect(
        DSDividerValidators.isValidDimensions(
          height: 0.0,
          orientation: DSDividerOrientation.horizontal,
        ),
        isFalse,
      );
      expect(
        DSDividerValidators.isValidDimensions(
          width: 0.0,
          orientation: DSDividerOrientation.vertical,
        ),
        isFalse,
      );
    });

    test('validates complete config correctly', () {
      expect(
        DSDividerValidators.isValidConfig(const DSDividerConfig()),
        isTrue,
      );
      expect(
        DSDividerValidators.isValidConfig(
          const DSDividerConfig(
            thickness: 2.0,
            indent: 16.0,
            endIndent: 16.0,
            height: 1.0,
          ),
        ),
        isTrue,
      );
      expect(
        DSDividerValidators.isValidConfig(
          const DSDividerConfig(
            thickness: -1.0,
          ),
        ),
        isFalse,
      );
    });
  });

  group('Extensions', () {
    test('DSDividerStateExtension works correctly', () {
      expect(DSDividerState.defaultState.displayName, equals('Default'));
      expect(DSDividerState.loading.displayName, equals('Loading'));
      expect(DSDividerState.disabled.displayName, equals('Disabled'));

      expect(DSDividerState.defaultState.isInteractive, isTrue);
      expect(DSDividerState.disabled.isInteractive, isFalse);
      expect(DSDividerState.loading.isInteractive, isFalse);

      expect(DSDividerState.loading.isLoading, isTrue);
      expect(DSDividerState.skeleton.isLoading, isTrue);
      expect(DSDividerState.defaultState.isLoading, isFalse);
    });

    test('DSDividerVariantExtensions works correctly', () {
      expect(DSDividerVariant.inset.isInset, isTrue);
      expect(DSDividerVariant.full.isInset, isFalse);
      expect(DSDividerVariant.full.isFull, isTrue);
      expect(DSDividerVariant.inset.isFull, isFalse);
    });

    test('DSDividerOrientationExtensions works correctly', () {
      expect(DSDividerOrientation.horizontal.isHorizontal, isTrue);
      expect(DSDividerOrientation.vertical.isHorizontal, isFalse);
      expect(DSDividerOrientation.vertical.isVertical, isTrue);
      expect(DSDividerOrientation.horizontal.isVertical, isFalse);
      expect(DSDividerOrientation.horizontal.axis, equals(Axis.horizontal));
      expect(DSDividerOrientation.vertical.axis, equals(Axis.vertical));
    });
  });

  group('Configuration Defaults', () {
    test('standard config has correct defaults', () {
      const config = DSDividerConfigDefaults.standard;

      expect(config.variant, equals(DSDividerVariant.full));
      expect(config.state, equals(DSDividerState.defaultState));
      expect(config.orientation, equals(DSDividerOrientation.horizontal));
    });

    test('inset config sets inset variant', () {
      const config = DSDividerConfigDefaults.inset;

      expect(config.variant, equals(DSDividerVariant.inset));
    });

    test('vertical config sets vertical orientation', () {
      const config = DSDividerConfigDefaults.vertical;

      expect(config.orientation, equals(DSDividerOrientation.vertical));
    });

    test('interactive config enables interaction', () {
      const config = DSDividerConfigDefaults.interactive;

      expect(config.interactive, isTrue);
    });
  });
}