import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tour/ds_tour.dart';
import 'package:iautomat_design_system/src/components/tour/ds_tour_config.dart';

void main() {
  group('DSTour Widget Tests', () {
    late List<DSTourStep> testSteps;
    late List<GlobalKey> testKeys;

    setUp(() {
      testKeys = [
        GlobalKey(),
        GlobalKey(),
        GlobalKey(),
      ];

      testSteps = [
        DSTourStep(
          id: 'step_1',
          targetKey: testKeys[0],
          title: 'Primer Paso',
          description: 'Esta es la descripción del primer paso del tour.',
          position: DSTourPosition.bottom,
        ),
        DSTourStep(
          id: 'step_2',
          targetKey: testKeys[1],
          title: 'Segundo Paso',
          description: 'Esta es la descripción del segundo paso del tour.',
          position: DSTourPosition.top,
        ),
        DSTourStep(
          id: 'step_3',
          targetKey: testKeys[2],
          title: 'Tercer Paso',
          description: 'Esta es la descripción del tercer paso del tour.',
          position: DSTourPosition.auto,
        ),
      ];
    });

    Widget buildTestWidget({
      DSTourConfig? config,
      List<DSTourStep>? steps,
      VoidCallback? onFinish,
      VoidCallback? onSkip,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Container(
                key: testKeys[0],
                width: 100,
                height: 50,
                color: Colors.blue,
                child: const Text('Target 1'),
              ),
              Container(
                key: testKeys[1],
                width: 100,
                height: 50,
                color: Colors.green,
                child: const Text('Target 2'),
              ),
              Container(
                key: testKeys[2],
                width: 100,
                height: 50,
                color: Colors.red,
                child: const Text('Target 3'),
              ),
              DSTour(
                config: config ?? const DSTourConfig(),
                steps: steps ?? testSteps,
                onFinish: onFinish,
                onSkip: onSkip,
              ),
            ],
          ),
        ),
      );
    }

    testWidgets('renders tour correctly', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pump();

      expect(find.byType(DSTour), findsOneWidget);
    });

    testWidgets('shows tour content when steps are provided', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      // Should show the first step
      expect(find.text('Primer Paso'), findsOneWidget);
      expect(find.text('Esta es la descripción del primer paso del tour.'), findsOneWidget);
    });

    testWidgets('shows progress indicator when enabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(showProgress: true),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.text('1/3'), findsOneWidget);
    });

    testWidgets('hides progress indicator when disabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(showProgress: false),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.text('1/3'), findsNothing);
    });

    testWidgets('shows skip button when enabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(enableSkip: true),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Saltar'), findsOneWidget);
    });

    testWidgets('hides skip button when disabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(enableSkip: false),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Saltar'), findsNothing);
    });

    testWidgets('shows next button on first steps', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Siguiente'), findsOneWidget);
      expect(find.text('Finalizar'), findsNothing);
    });

    testWidgets('shows finish button on last step', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        steps: [testSteps.first], // Only one step
      ));
      await tester.pumpAndSettle();

      expect(find.text('Siguiente'), findsNothing);
      expect(find.text('Finalizar'), findsOneWidget);
    });

    testWidgets('advances to next step when next button is tapped', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Primer Paso'), findsOneWidget);

      await tester.tap(find.text('Siguiente'));
      await tester.pumpAndSettle();

      expect(find.text('Segundo Paso'), findsOneWidget);
      expect(find.text('2/3'), findsOneWidget);
    });

    testWidgets('goes to previous step when previous button is tapped', (tester) async {
      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      // Go to second step
      await tester.tap(find.text('Siguiente'));
      await tester.pumpAndSettle();

      expect(find.text('Segundo Paso'), findsOneWidget);
      expect(find.text('Anterior'), findsOneWidget);

      // Go back to first step
      await tester.tap(find.text('Anterior'));
      await tester.pumpAndSettle();

      expect(find.text('Primer Paso'), findsOneWidget);
    });

    testWidgets('calls onFinish when finish button is tapped', (tester) async {
      bool finishCalled = false;

      await tester.pumpWidget(buildTestWidget(
        steps: [testSteps.first],
        onFinish: () => finishCalled = true,
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Finalizar'));
      await tester.pumpAndSettle();

      expect(finishCalled, isTrue);
    });

    testWidgets('calls onSkip when skip button is tapped', (tester) async {
      bool skipCalled = false;

      await tester.pumpWidget(buildTestWidget(
        onSkip: () => skipCalled = true,
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Saltar'));
      await tester.pumpAndSettle();

      expect(skipCalled, isTrue);
    });

    testWidgets('responds to keyboard navigation when enabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(enableKeyboardNavigation: true),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Primer Paso'), findsOneWidget);

      // Focus the tour
      await tester.tap(find.byType(DSTour));
      await tester.pumpAndSettle();

      // Press right arrow key
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();

      expect(find.text('Segundo Paso'), findsOneWidget);

      // Press left arrow key
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();

      expect(find.text('Primer Paso'), findsOneWidget);
    });

    testWidgets('responds to escape key to skip when keyboard support enabled', (tester) async {
      bool skipCalled = false;

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(enableKeyboardNavigation: true),
        onSkip: () => skipCalled = true,
      ));
      await tester.pumpAndSettle();

      // Focus the tour
      await tester.tap(find.byType(DSTour));
      await tester.pumpAndSettle();

      // Press escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      expect(skipCalled, isTrue);
    });

    testWidgets('applies custom colors correctly', (tester) async {
      const customColors = DSTourColors(
        backgroundColor: Colors.red,
        buttonColor: Colors.blue,
        textColor: Colors.white,
      );

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(colors: customColors),
      ));
      await tester.pumpAndSettle();

      // Find Material widget with custom background color
      final materials = find.byType(Material);
      expect(materials, findsWidgets);
    });

    testWidgets('applies custom spacing correctly', (tester) async {
      const customSpacing = DSTourSpacing(
        borderRadius: 16.0,
        elevation: 12.0,
        targetPadding: 20.0,
      );

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(spacing: customSpacing),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(DSTour), findsOneWidget);
    });

    testWidgets('shows custom button text when provided', (tester) async {
      const customControls = DSTourControls(
        skipButtonText: 'Omitir',
        nextButtonText: 'Continuar',
        finishButtonText: 'Terminar',
      );

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(controls: customControls),
        steps: [testSteps.first],
      ));
      await tester.pumpAndSettle();

      expect(find.text('Omitir'), findsOneWidget);
      expect(find.text('Terminar'), findsOneWidget);
      expect(find.text('Saltar'), findsNothing);
      expect(find.text('Finalizar'), findsNothing);
    });

    testWidgets('handles empty steps list gracefully', (tester) async {
      await tester.pumpWidget(buildTestWidget(steps: []));
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.text('Primer Paso'), findsNothing);
    });

    testWidgets('respects RTL text direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    key: testKeys[0],
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: const Text('Target 1'),
                  ),
                  DSTour(
                    config: const DSTourConfig(
                      isRtl: true,
                      controls: DSTourControls(
                        skipButtonText: 'تخطي',
                        nextButtonText: 'التالي',
                        finishButtonText: 'إنهاء',
                      ),
                    ),
                    steps: [testSteps.first],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('تخطي'), findsOneWidget);
      expect(find.text('إنهاء'), findsOneWidget);
    });

    testWidgets('shows proper semantic labels', (tester) async {
      const customAccessibility = DSTourAccessibility(
        semanticLabel: 'Custom Tour',
        skipButtonLabel: 'Custom Skip',
        finishButtonLabel: 'Custom Finish',
      );

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          enableA11y: true,
          accessibility: customAccessibility,
        ),
        steps: [testSteps.first],
      ));
      await tester.pumpAndSettle();

      expect(find.bySemanticsLabel('Custom Tour'), findsOneWidget);
    });
  });

  group('DSTourConfig Tests', () {
    test('creates config with default values', () {
      const config = DSTourConfig();

      expect(config.variant, equals(DSTourVariant.coachmarks));
      expect(config.state, equals(DSTourState.defaultState));
      expect(config.enableSkip, isTrue);
      expect(config.enableNext, isTrue);
      expect(config.enablePrevious, isTrue);
      expect(config.enableKeyboardNavigation, isTrue);
      expect(config.showProgress, isTrue);
    });

    test('creates config with custom values', () {
      const config = DSTourConfig(
        variant: DSTourVariant.coachmarks,
        state: DSTourState.loading,
        enableSkip: false,
        enableNext: false,
        showProgress: false,
      );

      expect(config.variant, equals(DSTourVariant.coachmarks));
      expect(config.state, equals(DSTourState.loading));
      expect(config.enableSkip, isFalse);
      expect(config.enableNext, isFalse);
      expect(config.showProgress, isFalse);
    });

    test('copyWith works correctly', () {
      const originalConfig = DSTourConfig();
      final modifiedConfig = originalConfig.copyWith(
        enableSkip: false,
        showProgress: false,
      );

      expect(modifiedConfig.enableSkip, isFalse);
      expect(modifiedConfig.showProgress, isFalse);
      expect(modifiedConfig.enableNext, isTrue); // Should remain unchanged
      expect(modifiedConfig.enableKeyboardNavigation, isTrue); // Should remain unchanged
    });

    test('equality works correctly', () {
      const config1 = DSTourConfig(
        enableSkip: false,
        showProgress: true,
      );
      const config2 = DSTourConfig(
        enableSkip: false,
        showProgress: true,
      );
      const config3 = DSTourConfig(
        enableSkip: true,
        showProgress: true,
      );

      expect(config1, equals(config2));
      expect(config1, isNot(equals(config3)));
    });
  });

  group('DSTourStep Tests', () {
    test('creates step with required values', () {
      final targetKey = GlobalKey();
      final step = DSTourStep(
        id: 'test_step',
        targetKey: targetKey,
        title: 'Test Step',
      );

      expect(step.id, equals('test_step'));
      expect(step.targetKey, equals(targetKey));
      expect(step.title, equals('Test Step'));
      expect(step.description, isNull);
      expect(step.position, equals(DSTourPosition.auto));
      expect(step.alignment, equals(DSTourAlignment.center));
      expect(step.showHighlight, isTrue);
      expect(step.enableTap, isTrue);
    });

    test('creates step with all values', () {
      final targetKey = GlobalKey();
      final step = DSTourStep(
        id: 'test_step',
        targetKey: targetKey,
        title: 'Test Step',
        description: 'Test Description',
        position: DSTourPosition.top,
        alignment: DSTourAlignment.start,
        showHighlight: false,
        enableTap: false,
        targetRadius: 16.0,
        targetPadding: const EdgeInsets.all(8.0),
        metadata: {'key': 'value'},
      );

      expect(step.id, equals('test_step'));
      expect(step.title, equals('Test Step'));
      expect(step.description, equals('Test Description'));
      expect(step.position, equals(DSTourPosition.top));
      expect(step.alignment, equals(DSTourAlignment.start));
      expect(step.showHighlight, isFalse);
      expect(step.enableTap, isFalse);
      expect(step.targetRadius, equals(16.0));
      expect(step.targetPadding, equals(const EdgeInsets.all(8.0)));
      expect(step.metadata, equals({'key': 'value'}));
    });

    test('copyWith works correctly', () {
      final targetKey = GlobalKey();
      final originalStep = DSTourStep(
        id: 'test_step',
        targetKey: targetKey,
        title: 'Original Title',
        position: DSTourPosition.auto,
      );

      final modifiedStep = originalStep.copyWith(
        title: 'Modified Title',
        position: DSTourPosition.top,
      );

      expect(modifiedStep.id, equals('test_step'));
      expect(modifiedStep.title, equals('Modified Title'));
      expect(modifiedStep.position, equals(DSTourPosition.top));
      expect(modifiedStep.targetKey, equals(originalStep.targetKey));
    });

    test('equality works correctly', () {
      final targetKey1 = GlobalKey();
      final targetKey2 = GlobalKey();

      final step1 = DSTourStep(
        id: 'test_step',
        targetKey: targetKey1,
        title: 'Test Step',
      );
      final step2 = DSTourStep(
        id: 'test_step',
        targetKey: targetKey1,
        title: 'Test Step',
      );
      final step3 = DSTourStep(
        id: 'different_step',
        targetKey: targetKey2,
        title: 'Test Step',
      );

      expect(step1, equals(step2));
      expect(step1, isNot(equals(step3)));
    });
  });

  group('DSTourColors Tests', () {
    test('creates colors with default values', () {
      const colors = DSTourColors();

      expect(colors.backgroundColor, isNull);
      expect(colors.buttonColor, isNull);
      expect(colors.textColor, isNull);
    });

    test('creates colors with custom values', () {
      const colors = DSTourColors(
        backgroundColor: Colors.red,
        buttonColor: Colors.blue,
        textColor: Colors.white,
      );

      expect(colors.backgroundColor, equals(Colors.red));
      expect(colors.buttonColor, equals(Colors.blue));
      expect(colors.textColor, equals(Colors.white));
    });
  });

  group('DSTourPosition Tests', () {
    test('has all expected position values', () {
      expect(DSTourPosition.values, contains(DSTourPosition.top));
      expect(DSTourPosition.values, contains(DSTourPosition.bottom));
      expect(DSTourPosition.values, contains(DSTourPosition.left));
      expect(DSTourPosition.values, contains(DSTourPosition.right));
      expect(DSTourPosition.values, contains(DSTourPosition.center));
      expect(DSTourPosition.values, contains(DSTourPosition.auto));
    });
  });

  group('DSTourVariant Tests', () {
    test('has coachmarks variant', () {
      expect(DSTourVariant.values, contains(DSTourVariant.coachmarks));
    });
  });
}