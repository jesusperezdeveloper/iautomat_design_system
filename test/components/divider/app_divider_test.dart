import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppDivider', () {
    testWidgets('renders with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDivider(),
          ),
        ),
      );

      expect(find.byType(AppDivider), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('renders horizontal divider by default', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDivider(),
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
            body: AppDivider(
              config: AppDividerConfig(
                orientation: AppDividerOrientation.vertical,
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
            body: AppDivider(
              config: AppDividerConfig(
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
            body: AppDivider(
              config: AppDividerConfig(
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
            body: AppDivider(
              config: AppDividerConfig(
                state: AppDividerState.loading,
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
            body: AppDivider(
              config: AppDividerConfig(
                state: AppDividerState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppDivider), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('handles disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDivider(
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
            body: AppDivider(
              interactive: true,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppDivider));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      AppDividerState? changedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              onStateChanged: (state) {
                changedState = state;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      expect(changedState, isNotNull);
      expect(changedState, equals(AppDividerState.defaultState));
    });

    testWidgets('supports inset variant with indents', (tester) async {
      const indent = 16.0;
      const endIndent = 24.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDivider(
              config: AppDividerConfig(
                variant: AppDividerVariant.inset,
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
            body: AppDivider(
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
            body: AppDivider(
              excludeSemantics: true,
            ),
          ),
        ),
      );

      // Verifica que el widget se renderiza sin errores
      expect(find.byType(AppDivider), findsOneWidget);
    });

    testWidgets('renders with different configurations', (tester) async {
      final configs = [
        const AppDividerConfig(),
        const AppDividerConfig(variant: AppDividerVariant.inset),
        const AppDividerConfig(orientation: AppDividerOrientation.vertical),
        const AppDividerConfig(state: AppDividerState.loading),
        const AppDividerConfig(state: AppDividerState.skeleton),
        const AppDividerConfig(thickness: 2.0),
        const AppDividerConfig(color: Colors.blue),
      ];

      for (final config in configs) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDivider(config: config),
            ),
          ),
        );

        expect(find.byType(AppDivider), findsOneWidget);

        // Limpia el widget tree entre pruebas
        await tester.pumpWidget(Container());
      }
    });
  });

  group('AppDividerConfig', () {
    test('creates with default values', () {
      const config = AppDividerConfig();

      expect(config.variant, equals(AppDividerVariant.full));
      expect(config.state, equals(AppDividerState.defaultState));
      expect(config.orientation, equals(AppDividerOrientation.horizontal));
      expect(config.interactive, isFalse);
      expect(config.thickness, isNull);
      expect(config.color, isNull);
    });

    test('creates with custom values', () {
      const config = AppDividerConfig(
        variant: AppDividerVariant.inset,
        state: AppDividerState.loading,
        orientation: AppDividerOrientation.vertical,
        interactive: true,
        thickness: 2.0,
        color: Colors.red,
      );

      expect(config.variant, equals(AppDividerVariant.inset));
      expect(config.state, equals(AppDividerState.loading));
      expect(config.orientation, equals(AppDividerOrientation.vertical));
      expect(config.interactive, isTrue);
      expect(config.thickness, equals(2.0));
      expect(config.color, equals(Colors.red));
    });

    test('supports copyWith', () {
      const originalConfig = AppDividerConfig();
      final newConfig = originalConfig.copyWith(
        variant: AppDividerVariant.inset,
        thickness: 3.0,
      );

      expect(newConfig.variant, equals(AppDividerVariant.inset));
      expect(newConfig.thickness, equals(3.0));
      expect(newConfig.state, equals(originalConfig.state));
      expect(newConfig.orientation, equals(originalConfig.orientation));
    });
  });

  group('AppDividerValidators', () {
    test('validates thickness correctly', () {
      expect(AppDividerValidators.isValidThickness(null), isTrue);
      expect(AppDividerValidators.isValidThickness(1.0), isTrue);
      expect(AppDividerValidators.isValidThickness(5.0), isTrue);
      expect(AppDividerValidators.isValidThickness(0.0), isTrue);
      expect(AppDividerValidators.isValidThickness(-1.0), isFalse);
      expect(AppDividerValidators.isValidThickness(11.0), isFalse);
    });

    test('validates indent correctly', () {
      expect(AppDividerValidators.isValidIndent(null), isTrue);
      expect(AppDividerValidators.isValidIndent(0.0), isTrue);
      expect(AppDividerValidators.isValidIndent(16.0), isTrue);
      expect(AppDividerValidators.isValidIndent(-1.0), isFalse);
    });

    test('validates dimensions correctly', () {
      expect(AppDividerValidators.isValidDimensions(), isTrue);
      expect(
        AppDividerValidators.isValidDimensions(
          height: 1.0,
          orientation: AppDividerOrientation.horizontal,
        ),
        isTrue,
      );
      expect(
        AppDividerValidators.isValidDimensions(
          width: 1.0,
          orientation: AppDividerOrientation.vertical,
        ),
        isTrue,
      );
      expect(
        AppDividerValidators.isValidDimensions(
          height: 0.0,
          orientation: AppDividerOrientation.horizontal,
        ),
        isFalse,
      );
      expect(
        AppDividerValidators.isValidDimensions(
          width: 0.0,
          orientation: AppDividerOrientation.vertical,
        ),
        isFalse,
      );
    });

    test('validates complete config correctly', () {
      expect(
        AppDividerValidators.isValidConfig(const AppDividerConfig()),
        isTrue,
      );
      expect(
        AppDividerValidators.isValidConfig(
          const AppDividerConfig(
            thickness: 2.0,
            indent: 16.0,
            endIndent: 16.0,
            height: 1.0,
          ),
        ),
        isTrue,
      );
      expect(
        AppDividerValidators.isValidConfig(
          const AppDividerConfig(
            thickness: -1.0,
          ),
        ),
        isFalse,
      );
    });
  });

  group('Extensions', () {
    test('AppDividerStateExtension works correctly', () {
      expect(AppDividerState.defaultState.displayName, equals('Default'));
      expect(AppDividerState.loading.displayName, equals('Loading'));
      expect(AppDividerState.disabled.displayName, equals('Disabled'));

      expect(AppDividerState.defaultState.isInteractive, isTrue);
      expect(AppDividerState.disabled.isInteractive, isFalse);
      expect(AppDividerState.loading.isInteractive, isFalse);

      expect(AppDividerState.loading.isLoading, isTrue);
      expect(AppDividerState.skeleton.isLoading, isTrue);
      expect(AppDividerState.defaultState.isLoading, isFalse);
    });

    test('AppDividerVariantExtensions works correctly', () {
      expect(AppDividerVariant.inset.isInset, isTrue);
      expect(AppDividerVariant.full.isInset, isFalse);
      expect(AppDividerVariant.full.isFull, isTrue);
      expect(AppDividerVariant.inset.isFull, isFalse);
    });

    test('AppDividerOrientationExtensions works correctly', () {
      expect(AppDividerOrientation.horizontal.isHorizontal, isTrue);
      expect(AppDividerOrientation.vertical.isHorizontal, isFalse);
      expect(AppDividerOrientation.vertical.isVertical, isTrue);
      expect(AppDividerOrientation.horizontal.isVertical, isFalse);
      expect(AppDividerOrientation.horizontal.axis, equals(Axis.horizontal));
      expect(AppDividerOrientation.vertical.axis, equals(Axis.vertical));
    });
  });

  group('Configuration Defaults', () {
    test('standard config has correct defaults', () {
      const config = AppDividerConfigDefaults.standard;

      expect(config.variant, equals(AppDividerVariant.full));
      expect(config.state, equals(AppDividerState.defaultState));
      expect(config.orientation, equals(AppDividerOrientation.horizontal));
    });

    test('inset config sets inset variant', () {
      const config = AppDividerConfigDefaults.inset;

      expect(config.variant, equals(AppDividerVariant.inset));
    });

    test('vertical config sets vertical orientation', () {
      const config = AppDividerConfigDefaults.vertical;

      expect(config.orientation, equals(AppDividerOrientation.vertical));
    });

    test('interactive config enables interaction', () {
      const config = AppDividerConfigDefaults.interactive;

      expect(config.interactive, isTrue);
    });
  });
}